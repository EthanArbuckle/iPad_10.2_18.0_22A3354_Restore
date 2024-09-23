@implementation AHTBootLoader

- (AHTBootLoader)initWithParent:(id)a3 service:(unsigned int)a4
{
  id v7;
  AHTBootLoader *v8;
  uint64_t v9;
  const __CFAllocator *v10;
  NSString *CFProperty;
  NSString *personality;
  const __CFNumber *v13;
  const __CFNumber *v14;
  CFTypeRef v15;
  CFTypeRef *v16;
  CFTypeRef v17;
  const __CFString *v18;
  CFRange v19;
  CFStringRef v20;
  NSString *type;
  AHTBootLoader *v22;
  objc_super v24;
  CFRange v25;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AHTBootLoader;
  v8 = -[AHTBootLoader init](&v24, sel_init);
  if (!v8)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 48;
      goto LABEL_6;
    }
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v9 = 40;
LABEL_6:
  objc_storeStrong((id *)((char *)&v8->super.isa + v9), a3);
  v8->_service = a4;
  v8->_machPort = 0;
  IOObjectRetain(a4);
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (NSString *)IORegistryEntryCreateCFProperty(a4, CFSTR("hid-merge-personality"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  personality = v8->_personality;
  v8->_personality = CFProperty;

  v13 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a4, CFSTR("image-tag"), v10, 0);
  if (v13)
  {
    v14 = v13;
    CFNumberGetValue(v13, kCFNumberSInt32Type, &v8->_imageTag);
    CFRelease(v14);
  }
  v15 = IORegistryEntryCreateCFProperty(a4, CFSTR("Needs Restore Update"), v10, 0);
  v16 = (CFTypeRef *)MEMORY[0x24BDBD270];
  if (v15)
  {
    v8->_needsRestoreUpdate = v15 == (CFTypeRef)*MEMORY[0x24BDBD270];
    CFRelease(v15);
  }
  v17 = IORegistryEntryCreateCFProperty(a4, CFSTR("Supports Memory Dump"), v10, 0);
  if (v17)
  {
    v8->_supportsMemoryDump = v17 == *v16;
    CFRelease(v17);
  }
  v18 = IOObjectCopyClass(a4);
  v19 = CFStringFind(v18, CFSTR("AppleHIDTransportBootloader"), 0);
  v25.length = CFStringGetLength(v18) - (v19.location + v19.length);
  v25.location = v19.location + v19.length;
  v20 = CFStringCreateWithSubstring(v10, v18, v25);
  type = v8->_type;
  v8->_type = &v20->isa;

  CFRelease(v18);
  v22 = v8;
LABEL_14:

  return v22;
}

- (AHTBootLoader)initWithService:(unsigned int)a3
{
  uint64_t v4;
  AHTBootLoader *v5;
  uint64_t v7;
  void *v8;
  io_registry_entry_t parent;

  if (!a3)
    goto LABEL_4;
  v4 = *(_QWORD *)&a3;
  if (!IOObjectConformsTo(a3, "AppleHIDTransportBootloader"))
    goto LABEL_4;
  parent = 0;
  if (IORegistryEntryGetParentEntry(v4, "IOService", &parent))
    goto LABEL_4;
  +[AHTDevice withService:](AHTDevice, "withService:", parent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    IOObjectRelease(parent);
LABEL_9:
    self = -[AHTBootLoader initWithParent:service:](self, "initWithParent:service:", v8, v4);

    v5 = self;
    goto LABEL_5;
  }
  +[AHTInterface withService:](AHTInterface, "withService:", parent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IOObjectRelease(parent);
  if (v8)
    goto LABEL_9;
LABEL_4:
  v5 = 0;
LABEL_5:

  return v5;
}

+ (id)withDevice:(id)a3 service:(unsigned int)a4
{
  return +[AHTBootLoader withParent:service:](AHTBootLoader, "withParent:service:", a3, *(_QWORD *)&a4);
}

+ (id)withParent:(id)a3 service:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  AHTBootLoader *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[AHTBootLoader initWithParent:service:]([AHTBootLoader alloc], "initWithParent:service:", v5, v4);

  return v6;
}

+ (id)withService:(unsigned int)a3
{
  return -[AHTBootLoader initWithService:]([AHTBootLoader alloc], "initWithService:", *(_QWORD *)&a3);
}

- (void)dealloc
{
  objc_super v3;

  -[AHTBootLoader close](self, "close");
  IOObjectRelease(self->_service);
  v3.receiver = self;
  v3.super_class = (Class)AHTBootLoader;
  -[AHTBootLoader dealloc](&v3, sel_dealloc);
}

- (BOOL)open:(id *)a3
{
  return -[AHTBootLoader isOpen](self, "isOpen")
      || +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOServiceOpen(self->_service, *MEMORY[0x24BDAEC58], 0, &self->_connect), a3);
}

- (BOOL)isOpen
{
  return self->_connect != 0;
}

- (BOOL)createMachPort:(id *)a3
{
  uint64_t v5;

  v5 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &self->_machPort);
  if (!(_DWORD)v5)
  {
    v5 = MEMORY[0x219A04F3C](self->_connect, 48, self->_machPort, 0);
    if (!(_DWORD)v5)
      return 1;
  }
  +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", v5, a3);
  return 0;
}

- (void)destroyMachPort
{
  mach_port_name_t machPort;
  ipc_space_t *v4;

  machPort = self->_machPort;
  if (machPort)
  {
    v4 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], machPort, 1u, -1);
    mach_port_deallocate(*v4, self->_machPort);
    self->_machPort = 0;
  }
}

- (id)dispatchSourceForNotification:(id)a3 action:(id)a4 error:(id *)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  id *v17;

  v8 = a3;
  v9 = a4;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__AHTBootLoader_dispatchSourceForNotification_action_error___block_invoke;
  v15[3] = &unk_24D6602F8;
  v15[4] = self;
  v17 = a5;
  v10 = v9;
  v16 = v10;
  v11 = (void *)MEMORY[0x219A05224](v15);
  if (!-[AHTBootLoader open:](self, "open:", a5) || !-[AHTBootLoader createMachPort:](self, "createMachPort:", a5))
    goto LABEL_7;
  v12 = dispatch_source_create(MEMORY[0x24BDAC9E0], self->_machPort, 0, v8);
  if (!v12)
  {
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097085, a5);
LABEL_7:
    -[AHTBootLoader destroyMachPort](self, "destroyMachPort");
    -[AHTBootLoader close](self, "close");
    v13 = 0;
    goto LABEL_5;
  }
  v13 = v12;
  dispatch_source_set_event_handler(v12, v11);
LABEL_5:

  return v13;
}

void __60__AHTBootLoader_dispatchSourceForNotification_action_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  mach_msg_header_t msg[2];
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  memset(msg, 0, sizeof(msg));
  v2 = mach_msg(msg, 2, 0, 0x30u, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);
  if ((_DWORD)v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Fail to read mach message (err=0x%X)"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FC8];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), v3, v6);
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)close
{
  io_connect_t connect;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_connect = 0;
  }
}

+ (unint64_t)frameworkToDriverOptions:(unint64_t)a3
{
  return a3 & 0xB9;
}

- (BOOL)updateProperty:(id)a3 property:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  mach_port_t connect;
  id v15;
  BOOL v16;
  uint64_t input;

  v10 = a3;
  v11 = a4;
  if (-[AHTBootLoader open:](self, "open:", a6))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v10, "length") + objc_msgSend(v11, "length") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_retainAutorelease(v10);
    objc_msgSend(v12, "appendBytes:length:", objc_msgSend(v13, "UTF8String"), objc_msgSend(v13, "length") + 1);
    objc_msgSend(v12, "appendData:", v11);
    input = +[AHTBootLoader frameworkToDriverOptions:](AHTBootLoader, "frameworkToDriverOptions:", a5);
    connect = self->_connect;
    v15 = objc_retainAutorelease(v12);
    v16 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOConnectCallMethod(connect, 6u, &input, 1u, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, 0, 0, 0), a6);
    -[AHTBootLoader close](self, "close");

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)getProperty:(id)a3 property:(id *)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9;
  uint64_t v10;
  id v11;
  mach_port_t connect;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (v9 && a4)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0x10000);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (id)v10;
      if (-[AHTBootLoader open:](self, "open:", a6))
      {
        v11 = objc_retainAutorelease(v11);
        input[0] = objc_msgSend(v11, "mutableBytes");
        input[1] = 0x10000;
        output = 0;
        outputCnt = 1;
        connect = self->_connect;
        v13 = objc_retainAutorelease(v9);
        v14 = IOConnectCallMethod(connect, 0x11u, input, 2u, (const void *)objc_msgSend(v13, "UTF8String"), objc_msgSend(v13, "length") + 1, &output, &outputCnt, 0, 0);
        -[AHTBootLoader close](self, "close");
        if ((_DWORD)v14 == -536870206)
        {

          v11 = 0;
          v14 = 0;
        }
        if (+[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", v14, a6))
        {
          if (outputCnt && output <= 0x10000)
          {
            if (v11)
            {
              v15 = (void *)MEMORY[0x24BDBCE50];
              v16 = objc_msgSend(objc_retainAutorelease(v11), "mutableBytes");
              objc_msgSend(v15, "dataWithBytes:length:", v16, output);
              v17 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v17 = 0;
            }
            *a4 = v17;
            v18 = 1;
          }
          else
          {
            v18 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097097, a6);
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to allocate NSData for the property"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (a6)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0FC8];
        v28[0] = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), -536870211, v22);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }
    v18 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), -536870206, 0);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_20:

  return v18;
}

- (BOOL)reloadProperties:(unint64_t)a3 error:(id *)a4
{
  BOOL v7;
  uint64_t input;

  if (!-[AHTBootLoader open:](self, "open:", a4))
    return 0;
  input = +[AHTBootLoader frameworkToDriverOptions:](AHTBootLoader, "frameworkToDriverOptions:", a3);
  v7 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOConnectCallMethod(self->_connect, 6u, &input, 1u, 0, 0, 0, 0, 0, 0), a4);
  -[AHTBootLoader close](self, "close");
  return v7;
}

- (BOOL)overridePersonality:(id)a3 error:(id *)a4
{
  uint64_t v6;
  NSString *CFProperty;
  NSString *personality;

  v6 = IORegistryEntrySetCFProperty(self->_service, CFSTR("hid-merge-personality"), a3);
  if ((_DWORD)v6)
  {
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", v6, a4);
  }
  else
  {
    CFProperty = (NSString *)IORegistryEntryCreateCFProperty(self->_service, CFSTR("hid-merge-personality"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    personality = self->_personality;
    self->_personality = CFProperty;

  }
  return (_DWORD)v6 == 0;
}

- (BOOL)setMemoryDumpLevel:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  _BOOL4 v7;

  v5 = *(_QWORD *)&a3;
  v7 = -[AHTBootLoader open:](self, "open:", a4);
  if (v7)
    LOBYTE(v7) = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IORegistryEntrySetCFProperty(self->_service, CFSTR("Memory Dumps Level"), (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5)), a4);
  return v7;
}

- (BOOL)getMemoryDumpLevel:(unsigned int *)a3 error:(id *)a4
{
  _BOOL4 v7;
  void *CFProperty;

  if (a3)
  {
    v7 = -[AHTBootLoader open:](self, "open:", a4);
    if (!v7)
      return v7;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, CFSTR("Memory Dumps Level"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *a3 = objc_msgSend(CFProperty, "unsignedIntValue");

      LOBYTE(v7) = 1;
      return v7;
    }
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097085, a4);

  }
  else
  {
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097090, a4);
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)clearMemoryDumps:(id *)a3
{
  _BOOL4 v5;

  v5 = -[AHTBootLoader open:](self, "open:");
  if (v5)
    LOBYTE(v5) = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", IOConnectCallMethod(self->_connect, 8u, 0, 0, 0, 0, 0, 0, 0, 0), a3);
  return v5;
}

- (BOOL)getMemoryDumps:(id *)a3 error:(id *)a4
{
  id *v5;
  void *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  CFStringRef errorString;
  uint64_t v15;
  const __CFString *v16;
  uint64_t input[3];

  v5 = a3;
  input[2] = *MEMORY[0x24BDAC8D0];
  errorString = 0;
  if (!a3)
  {
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097090, a4);
    v8 = 0;
    goto LABEL_11;
  }
  if (!-[AHTBootLoader open:](self, "open:", a4))
    goto LABEL_14;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 0x200000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", 3758097085, a4);
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = objc_retainAutorelease(v7);
  input[0] = objc_msgSend(v8, "mutableBytes");
  input[1] = 0x200000;
  v9 = IOConnectCallMethod(self->_connect, 7u, input, 2u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v9 == -536870210)
  {
    *v5 = 0;
LABEL_10:
    LOBYTE(v5) = 1;
    goto LABEL_11;
  }
  if (!+[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", v9, a4))
  {
LABEL_15:
    LOBYTE(v5) = 0;
    goto LABEL_11;
  }
  v8 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v8, "mutableBytes");
  *v5 = (id)(id)IOCFUnserialize(v10, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &errorString);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  *v5 = 0;
  if (!a4)
    goto LABEL_10;
  v11 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  v16 = CFSTR("Memory dump is not an array");
  LOBYTE(v5) = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("AppleHIDTransportSupport"), 0, v12);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return (char)v5;
}

- (BOOL)overrideProperties:(id)a3 error:(id *)a4
{
  CFDataRef v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v6 = IOCFSerialize(a3, 0);
  v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4));
  input[0] = objc_msgSend(v7, "cStringUsingEncoding:", 4);
  input[1] = objc_msgSend(v7, "length") + 1;
  if (-[AHTBootLoader open:](self, "open:", a4))
  {
    v8 = IOConnectCallMethod(self->_connect, 0x12u, input, 2u, 0, 0, 0, 0, 0, 0);
    -[AHTBootLoader close](self, "close");
    v9 = +[AHTLoader errorFromKernel:error:](AHTLoader, "errorFromKernel:error:", v8, a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)getRegistryProperties
{
  io_registry_entry_t v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = -[AHTBootLoader service](self, "service");
  if (IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
    return 0;
  else
    return properties;
}

- (id)description
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t entryID;
  _BYTE v10[5];
  _BYTE v11[256];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[AHTBootLoader imageTag](self, "imageTag");
  v10[0] = HIBYTE(v3);
  v10[1] = BYTE2(v3);
  v10[2] = BYTE1(v3);
  v10[3] = v3;
  v10[4] = 0;
  entryID = 0;
  MEMORY[0x219A04FA8](-[AHTBootLoader service](self, "service"), v11);
  IORegistryEntryGetRegistryEntryID(-[AHTBootLoader service](self, "service"), &entryID);
  v11[255] = 0;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = entryID;
  -[AHTBootLoader personality](self, "personality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("registryEntryID: '0x%016llx', bootloader: '%s', imageTag: '%s', personality: '%@'"), v5, v11, v10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)personality
{
  return self->_personality;
}

- (AHTDevice)device
{
  return self->_device;
}

- (AHTInterface)interface
{
  return self->_interface;
}

- (NSString)type
{
  return self->_type;
}

- (unsigned)imageTag
{
  return self->_imageTag;
}

- (BOOL)needsRestoreUpdate
{
  return self->_needsRestoreUpdate;
}

- (BOOL)supportsMemoryDump
{
  return self->_supportsMemoryDump;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (void)setMachPort:(unsigned int)a3
{
  self->_machPort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_personality, 0);
}

@end
