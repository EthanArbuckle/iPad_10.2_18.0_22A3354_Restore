@implementation AHTDevice

+ (id)allDevices
{
  void *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  io_iterator_t existing;

  existing = 0;
  v2 = (void *)objc_opt_new();
  v3 = IOServiceMatching("AppleHIDTransportDevice");
  if (v3 && !IOServiceGetMatchingServices(0, v3, &existing))
  {
    v4 = IOIteratorNext(existing);
    if ((_DWORD)v4)
    {
      v5 = v4;
      do
      {
        +[AHTDevice withService:](AHTDevice, "withService:", v5);
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
  +[AHTDevice allDevices](AHTDevice, "allDevices");
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
  return -[AHTDevice initWithService:]([AHTDevice alloc], "initWithService:", *(_QWORD *)&a3);
}

- (AHTDevice)initWithService:(unsigned int)a3
{
  uint64_t v4;
  AHTDevice *v5;
  void *v7;
  void *v8;
  io_registry_entry_t parent;
  objc_super v10;
  _OWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3
    && (v4 = *(_QWORD *)&a3, IOObjectConformsTo(a3, "AppleHIDTransportDevice"))
    && (v10.receiver = self,
        v10.super_class = (Class)AHTDevice,
        (self = -[AHTCommon initWithService:](&v10, sel_initWithService_, v4)) != 0))
  {
    parent = 0;
    memset(v11, 0, sizeof(v11));
    if (IORegistryEntryGetParentEntry(v4, "IOService", &parent)
      || MEMORY[0x219A04FA8](parent, v11)
      || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[AHTCommon setName:](self, "setName:", v7),
          v7,
          -[AHTCommon name](self, "name"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {

      self = 0;
    }
    if (parent)
      IOObjectRelease(parent);
    self = self;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (AHTDevice)deviceWithParentRegistryId:(unint64_t)a3
{
  void *v4;
  CFMutableDictionaryRef v5;
  uint64_t MatchingService;
  uint64_t v7;
  void *v8;

  IOServiceMatching("AppleHIDTransportDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IORegistryEntryIDMatching(a3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("IOParentMatch"));

  MatchingService = IOServiceGetMatchingService(0, (CFDictionaryRef)v4);
  if ((_DWORD)MatchingService)
  {
    v7 = MatchingService;
    if (IOObjectConformsTo(MatchingService, "AppleHIDTransportDevice"))
    {
      +[AHTDevice withService:](AHTDevice, "withService:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    IOObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return (AHTDevice *)v8;
}

- (id)getInterfaces
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  io_iterator_t iterator;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  iterator = 0;
  if (!MEMORY[0x219A04F9C](-[AHTCommon service](self, "service"), "IOService", 1, &iterator))
  {
    v4 = IOIteratorNext(iterator);
    if ((_DWORD)v4)
    {
      v5 = v4;
      do
      {
        if (IOObjectConformsTo(v5, "AppleHIDTransportInterface"))
        {
          +[AHTInterface withService:](AHTInterface, "withService:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v6);

        }
        IOObjectRelease(v5);
        v5 = IOIteratorNext(iterator);
      }
      while ((_DWORD)v5);
    }
    IOObjectRelease(iterator);
  }
  return v3;
}

- (id)getInterface:(unsigned __int8)a3
{
  int v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[AHTDevice getInterfaces](self, "getInterfaces");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "interfaceID", (_QWORD)v12) == v3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)getInterfaceWithName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AHTDevice getInterfaces](self, "getInterfaces");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)getBootLoader
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  io_iterator_t iterator;

  iterator = 0;
  if (MEMORY[0x219A04F9C](-[AHTCommon service](self, "service"), "IOService", 1, &iterator))
    return 0;
  while (1)
  {
    v4 = IOIteratorNext(iterator);
    if (!(_DWORD)v4)
      break;
    v5 = v4;
    if (IOObjectConformsTo(v4, "AppleHIDTransportBootloader"))
    {
      +[AHTBootLoader withParent:service:](AHTBootLoader, "withParent:service:", self, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:
  IOObjectRelease(iterator);
  return v6;
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
      v6 = IOConnectCallScalarMethod(-[AHTCommon connect](self, "connect"), 2u, 0, 0, &output, &outputCnt);
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

- (id)reporterResults
{
  const void *v3;
  const void *Subscription;
  const void *Samples;
  id v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  CFTypeRef v19;

  v18[3] = 0;
  v19 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = (id)objc_opt_new();
  if (-[AHTCommon service](self, "service"))
  {
    -[AHTCommon service](self, "service");
    v3 = (const void *)IOReportCopyChannelsForDriver();
    if (v3)
    {
      if ((int)IOReportGetChannelCount() < 1)
      {
        Samples = 0;
        Subscription = 0;
      }
      else
      {
        Subscription = (const void *)IOReportCreateSubscription();
        Samples = 0;
        if (Subscription)
        {
          if (v19)
          {
            Samples = (const void *)IOReportCreateSamples();
            if (Samples)
              IOReportIterate();
          }
        }
      }
      CFRelease(v3);
      if (Samples)
        CFRelease(Samples);
      if (Subscription)
        CFRelease(Subscription);
    }
  }
  if (v19)
    CFRelease(v19);
  v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  return v6;
}

uint64_t __28__AHTDevice_reporterResults__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  IOReportChannelGetGroup();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[4] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "isEqualToString:", CFSTR("AppleHIDTransport")))return 16;
  if (IOReportChannelGetFormat() != 1)
    return 16;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = IOReportSimpleGetIntegerValue();
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == 0x8000000000000000)
    return 16;
  IOReportChannelGetChannelName();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  return 0;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[AHTDevice getBootLoader](self, "getBootLoader");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[AHTCommon name](self, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("no bootloader");
  if (v3)
    v7 = v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
