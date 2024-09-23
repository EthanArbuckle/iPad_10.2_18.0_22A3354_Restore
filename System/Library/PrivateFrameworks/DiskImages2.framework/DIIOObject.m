@implementation DIIOObject

- (DIIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  DIIOObject *v6;
  DIIOObject *v7;
  DIIOObject *v8;
  objc_super v10;

  if (a3)
  {
    if (a4)
      IOObjectRetain(a3);
    v10.receiver = self;
    v10.super_class = (Class)DIIOObject;
    v6 = -[DIIOObject init](&v10, sel_init);
    v7 = v6;
    if (v6)
      v6->_ioObj = a3;
    else
      IOObjectRelease(a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (DIIOObject)initWithIOObject:(unsigned int)a3
{
  return -[DIIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", *(_QWORD *)&a3, 0);
}

- (DIIOObject)initWithDIIOObject:(id)a3
{
  return -[DIIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", objc_msgSend(a3, "ioObj"), 1);
}

- (DIIOObject)initWithRegistryEntryID:(unint64_t)a3 error:(id *)a4
{
  mach_port_t v7;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  DIIOObject *v10;
  void *v11;

  v7 = *MEMORY[0x24BDD8B18];
  v8 = IORegistryEntryIDMatching(a3);
  MatchingService = IOServiceGetMatchingService(v7, v8);
  if ((_DWORD)MatchingService)
  {
    self = -[DIIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find registry entry ID 0x%llx"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v11, a4);
    v10 = (DIIOObject *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (DIIOObject)initWithClassName:(id)a3 error:(id *)a4
{
  id v6;
  mach_port_t v7;
  id v8;
  const __CFDictionary *v9;
  uint64_t MatchingService;
  DIIOObject *v11;
  void *v12;

  v6 = a3;
  v7 = *MEMORY[0x24BDD8B18];
  v8 = objc_retainAutorelease(v6);
  v9 = IOServiceMatching((const char *)objc_msgSend(v8, "UTF8String"));
  MatchingService = IOServiceGetMatchingService(v7, v9);
  if ((_DWORD)MatchingService)
  {
    self = -[DIIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find IO object of class %@"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v12, a4);
    v11 = (DIIOObject *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (DIIOObject)initWithIteratorNext:(id)a3
{
  return -[DIIOObject initWithIOObject:](self, "initWithIOObject:", objc_msgSend(a3, "copyNextObject"));
}

- (id)newIteratorWithOptions:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  DIIOIterator *v8;
  unsigned int v10;

  v10 = 0;
  v5 = MEMORY[0x2199A8568](-[DIIOObject ioObj](self, "ioObj"), "IOService", *(_QWORD *)&a3, &v10);
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed creating IO iterator, err code %d"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = [DIIOIterator alloc];
    return -[DIIOIterator initWithIOIterator:retain:](v8, "initWithIOIterator:retain:", v10, 0);
  }
  return v7;
}

- (unint64_t)registryEntryIDWithError:(id *)a3
{
  uint64_t RegistryEntryID;
  void *v5;
  uint64_t entryID;

  entryID = 0;
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(-[DIIOObject ioObj](self, "ioObj"), &entryID);
  if (!(_DWORD)RegistryEntryID)
    return entryID;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get registry entry ID, ret %d"), RegistryEntryID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, v5, a3);

  return 0;
}

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[DIIOObject ioObj](self, "ioObj"));
}

- (void)dealloc
{
  io_object_t ioObj;
  objc_super v4;

  ioObj = self->_ioObj;
  if (ioObj)
  {
    IOObjectRelease(ioObj);
    self->_ioObj = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DIIOObject;
  -[DIIOObject dealloc](&v4, sel_dealloc);
}

- (DIIOObject)ioObjectWithClassName:(id)a3 iterateParent:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  DIIOObject *v12;
  DIIOObject *v13;
  void *v14;

  v6 = a4;
  v8 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (v6)
    v10 = 3;
  else
    v10 = 1;
  v11 = -[DIIOObject newIteratorWithOptions:error:](self, "newIteratorWithOptions:error:", v10, a5);
  if (v11)
  {
    v12 = 0;
    while (1)
    {
      v13 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v11);

      if (!v13)
        break;
      v12 = v13;
      if (IOObjectConformsTo(-[DIIOObject ioObj](v13, "ioObj"), v9))
        goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find %@ entry"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v14, a5);
    v13 = (DIIOObject *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
LABEL_11:

  return v13;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  __CFString *v5;
  io_registry_entry_t v6;
  void *CFProperty;
  id v8;

  v5 = (__CFString *)a4;
  v6 = -[DIIOObject ioObj](self, "ioObj");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v5, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = CFProperty;
  else
    v8 = 0;

  return v8;
}

- (id)copyParentWithError:(id *)a3
{
  uint64_t ParentEntry;
  void *v5;
  void *v6;
  DIIOObject *v7;
  io_registry_entry_t parent;

  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(-[DIIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if ((_DWORD)ParentEntry)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get parent registry entry, err code %d"), ParentEntry);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = [DIIOObject alloc];
    return -[DIIOObject initWithIOObject:](v7, "initWithIOObject:", parent);
  }
  return v6;
}

+ (id)copyDiskImagesControllerWithError:(id *)a3
{
  DIIOObject *v4;
  DIIOObject *v5;
  DIIOObject *v6;
  DIIOObject *v7;

  v4 = -[DIIOObject initWithClassName:error:]([DIIOObject alloc], "initWithClassName:error:", CFSTR("AppleDiskImagesController"), 0);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed to find DiskImages2 controller, driver might not be installed"), a3);
    v6 = (DIIOObject *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end
