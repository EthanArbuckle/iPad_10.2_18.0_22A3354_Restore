@implementation AHTInterface

+ (id)allInterfaces
{
  void *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  io_iterator_t existing;

  existing = 0;
  v2 = (void *)objc_opt_new();
  v3 = IOServiceMatching("AppleHIDTransportInterface");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    v4 = IOIteratorNext(existing);
    if ((_DWORD)v4)
    {
      v5 = v4;
      do
      {
        +[AHTInterface withService:](AHTInterface, "withService:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        IOObjectRelease(v5);
        if (v6)
          objc_msgSend(v2, "addObject:", v6);

        v5 = IOIteratorNext(existing);
      }
      while ((_DWORD)v5);
    }
    IOObjectRelease(existing);
  }
  return v2;
}

+ (id)withName:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[AHTInterface allInterfaces](AHTInterface, "allInterfaces");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "name", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)withService:(unsigned int)a3
{
  return -[AHTInterface initWithService:]([AHTInterface alloc], "initWithService:", *(_QWORD *)&a3);
}

- (AHTInterface)initWithService:(unsigned int)a3
{
  uint64_t v4;
  const __CFAllocator *v5;
  const __CFNumber *CFProperty;
  const __CFNumber *v7;
  int Value;
  CFTypeRef v9;
  void *v10;
  AHTInterface *v11;
  unsigned __int8 valuePtr;
  objc_super v14;

  if (!a3)
    goto LABEL_9;
  v4 = *(_QWORD *)&a3;
  if (!IOObjectConformsTo(a3, "AppleHIDTransportInterface"))
    goto LABEL_9;
  v14.receiver = self;
  v14.super_class = (Class)AHTInterface;
  self = -[AHTCommon initWithService:](&v14, sel_initWithService_, v4);
  if (!self)
    goto LABEL_9;
  valuePtr = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, CFSTR("bInterfaceNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty
    && (v7 = CFProperty, Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr), CFRelease(v7), Value))
  {
    self->_interfaceID = valuePtr;
    v9 = IORegistryEntryCreateCFProperty(v4, CFSTR("InterfaceName"), v5, 0);
    if (v9)
    {
      v10 = (void *)v9;
      -[AHTCommon setName:](self, "setName:", v9);

    }
    v11 = self;
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (BOOL)setEnable:(BOOL)a3
{
  _BOOL4 v3;
  io_registry_entry_t v4;
  CFTypeRef *v5;

  v3 = a3;
  v4 = -[AHTCommon service](self, "service");
  v5 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (!v3)
    v5 = (CFTypeRef *)MEMORY[0x24BDBD270];
  return IORegistryEntrySetCFProperty(v4, CFSTR("InterfaceDisabled"), *v5) == 0;
}

- (BOOL)setPower:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  uint64_t input;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = v3;
  v12 = v4;
  v13 = v5;
  switch(a3)
  {
    case 0:
      input = 0;
      goto LABEL_10;
    case 1:
      v8 = 1;
      goto LABEL_9;
    case 2:
      v8 = 2;
      goto LABEL_9;
    case 3:
      v8 = 3;
      goto LABEL_9;
    case 4:
      v8 = 4;
      goto LABEL_9;
    case 5:
      v8 = 5;
LABEL_9:
      input = v8;
LABEL_10:
      v7 = -[AHTCommon connect](self, "connect");
      if (v7)
        LOBYTE(v7) = IOConnectCallScalarMethod(-[AHTCommon connect](self, "connect"), 0, &input, 1u, 0, 0) == 0;
      break;
    default:
      LOBYTE(v7) = 0;
      break;
  }
  return v7;
}

- (BOOL)getPower:(int64_t *)a3
{
  unsigned int v5;
  kern_return_t v6;
  uint32_t outputCnt;
  uint64_t output;

  if (a3)
  {
    v5 = -[AHTCommon connect](self, "connect");
    if (v5)
    {
      output = 0;
      outputCnt = 1;
      v6 = IOConnectCallScalarMethod(-[AHTCommon connect](self, "connect"), 4u, 0, 0, &output, &outputCnt);
      LOBYTE(v5) = 0;
      if (!v6 && outputCnt == 1)
      {
        if (output > 5)
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          *a3 = output;
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)reset
{
  unsigned int v3;

  v3 = -[AHTCommon connect](self, "connect");
  if (v3)
    LOBYTE(v3) = IOConnectCallScalarMethod(-[AHTCommon connect](self, "connect"), 1u, 0, 0, 0, 0) == 0;
  return v3;
}

- (BOOL)captureMemoryDump
{
  const __CFNumber *CFProperty;
  io_registry_entry_t v4;
  const __CFNumber *v5;
  int Value;
  BOOL v7;
  char valuePtr;

  LODWORD(CFProperty) = -[AHTCommon connect](self, "connect");
  if ((_DWORD)CFProperty)
  {
    valuePtr = 0;
    v4 = -[AHTCommon service](self, "service");
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, CFSTR("PowerMethod"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
      CFRelease(v5);
      if (Value)
        v7 = valuePtr == 2;
      else
        v7 = 0;
      LOBYTE(CFProperty) = v7
                        && IOConnectCallScalarMethod(-[AHTCommon connect](self, "connect"), 5u, 0, 0, 0, 0) == 0;
    }
  }
  return (char)CFProperty;
}

- (BOOL)setReport:(unsigned __int8)a3 withData:(id)a4
{
  unsigned int v4;
  id v6;
  id v7;
  BOOL v8;
  uint64_t input;

  v4 = a3;
  v6 = a4;
  if (-[AHTCommon connect](self, "connect"))
  {
    v7 = objc_retainAutorelease(v6);
    input = v4;
    v8 = IOConnectCallMethod(-[AHTCommon connect](self, "connect"), 3u, &input, 1u, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0, 0, 0, 0) == 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)getReport:(unsigned __int8)a3 withData:(id)a4
{
  unsigned int v4;
  id v6;
  kern_return_t v7;
  BOOL v8;
  size_t v10;
  uint64_t input;
  _BYTE outputStruct[4096];
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (-[AHTCommon connect](self, "connect"))
  {
    v10 = 4096;
    input = v4;
    v7 = IOConnectCallMethod(-[AHTCommon connect](self, "connect"), 2u, &input, 1u, 0, 0, 0, 0, outputStruct, &v10);
    v8 = v7 == 0;
    if (!v7)
      objc_msgSend(v6, "appendBytes:length:", outputStruct, v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  -[AHTCommon getBootLoader](self, "getBootLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[AHTCommon name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AHTInterface interfaceID](self, "interfaceID");
  if (v3)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (ifaceId:%d) (%@)"), v5, v6, v3);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (ifaceId:%d) (no bootloader)"), v5, v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)interfaceID
{
  return self->_interfaceID;
}

@end
