@implementation IOKRegistryEntry

- (id)childIteratorInPlane:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  IOKIterator *v12;
  IOKIterator *v13;
  io_object_t object;

  object = 0;
  v6 = a3;
  v7 = -[IOKObject object](self, "object");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "UTF8String");

  v10 = MEMORY[0x2199DC830](v7, v9, &object);
  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v12 = 0;
  }
  else
  {
    v13 = [IOKIterator alloc];
    v12 = -[IOKIterator initWithIterator:](v13, "initWithIterator:", object);
  }
LABEL_8:
  if (object)
    IOObjectRelease(object);
  return v12;
}

- (IOKRegistryEntry)initWithRegistryEntry:(unsigned int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOKRegistryEntry;
  return -[IOKObject initWithIOObject:](&v4, sel_initWithIOObject_, *(_QWORD *)&a3);
}

- (id)propertyForKey:(id)a3
{
  __CFString *v4;
  io_registry_entry_t v5;
  void *CFProperty;

  v4 = (__CFString *)a3;
  v5 = -[IOKObject object](self, "object");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, v4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);

  return CFProperty;
}

- (id)childIteratorInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry childIteratorInPlane:error:](self, "childIteratorInPlane:error:", CFSTR("IOService"), a3);
}

+ (id)rootEntry
{
  uint64_t RootEntry;
  io_object_t v4;
  void *v5;

  RootEntry = IORegistryGetRootEntry(*MEMORY[0x24BDD8B20]);
  if ((_DWORD)RootEntry)
  {
    v4 = RootEntry;
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForRegistryEntry:", RootEntry)), "initWithRegistryEntry:", RootEntry);
    IOObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)entryFromPath:(id)a3
{
  uint64_t v4;
  io_object_t v5;
  void *v6;

  v4 = IORegistryEntryCopyFromPath(*MEMORY[0x24BDD8B20], (CFStringRef)a3);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "classForRegistryEntry:", v4)), "initWithRegistryEntry:", v4);
    IOObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5
{
  kern_return_t v6;
  kern_return_t v7;
  IORegistryIterator *v8;
  IORegistryIterator *v9;
  io_iterator_t iterator;

  iterator = 0;
  v6 = IORegistryCreateIterator(*MEMORY[0x24BDD8B20], (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a4, &iterator);
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a5)
        goto LABEL_4;
    }
    else if (a5)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v7, 0);
      v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v8 = 0;
  }
  else
  {
    v9 = [IORegistryIterator alloc];
    v8 = -[IOKIterator initWithIterator:](v9, "initWithIterator:", iterator);
  }
LABEL_8:
  if (iterator)
    IOObjectRelease(iterator);
  return v8;
}

- (id)registryIteratorForPlane:(id)a3 withOptions:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  IORegistryIterator *v14;
  IORegistryIterator *v15;
  io_object_t object;

  v6 = *(_QWORD *)&a4;
  object = 0;
  v8 = a3;
  v9 = -[IOKObject object](self, "object");
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "UTF8String");

  v12 = MEMORY[0x2199DC818](v9, v11, v6, &object);
  if (v12)
  {
    v13 = v12;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a5)
        goto LABEL_4;
    }
    else if (a5)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v13, 0);
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v14 = 0;
  }
  else
  {
    v15 = [IORegistryIterator alloc];
    v14 = -[IOKIterator initWithIOObject:](v15, "initWithIOObject:", object);
  }
LABEL_8:
  if (object)
    IOObjectRelease(object);
  return v14;
}

- (id)registryIteratorForServicePlaneWithOptions:(unsigned int)a3 error:(id *)a4
{
  return -[IOKRegistryEntry registryIteratorForPlane:withOptions:error:](self, "registryIteratorForPlane:withOptions:error:", CFSTR("IOService"), *(_QWORD *)&a3, a4);
}

- (NSString)name
{
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x2199DC848](-[IOKObject object](self, "object", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                       &v3))
    return (NSString *)0;
  else
    return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v3);
}

- (id)nameInPlane:(id)a3 error:(id *)a4
{
  id v6;
  io_registry_entry_t v7;
  id v8;
  const char *v9;
  kern_return_t NameInPlane;
  kern_return_t v11;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[IOKObject object](self, "object", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  NameInPlane = IORegistryEntryGetNameInPlane(v7, v9, (char *)&v13);
  if (!NameInPlane)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v13);
  v11 = NameInPlane;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  return 0;
}

- (id)nameInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry nameInPlane:error:](self, "nameInPlane:error:", CFSTR("IOService"), a3);
}

- (id)locationInPlane:(id)a3 error:(id *)a4
{
  id v6;
  io_registry_entry_t v7;
  id v8;
  const char *v9;
  kern_return_t LocationInPlane;
  kern_return_t v11;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[IOKObject object](self, "object", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  LocationInPlane = IORegistryEntryGetLocationInPlane(v7, v9, (char *)&v13);
  if (!LocationInPlane)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v13);
  v11 = LocationInPlane;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  return 0;
}

- (id)locationInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry locationInPlane:error:](self, "locationInPlane:error:", CFSTR("IOService"), a3);
}

- (id)pathInPlane:(id)a3
{
  id v4;
  id v5;
  const char *v6;

  v4 = a3;
  LODWORD(self) = -[IOKObject object](self, "object");
  v5 = objc_retainAutorelease(v4);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  return (id)(id)IORegistryEntryCopyPath((io_registry_entry_t)self, v6);
}

- (id)pathInServicePlane
{
  return -[IOKRegistryEntry pathInPlane:](self, "pathInPlane:", CFSTR("IOService"));
}

- (unint64_t)entryID
{
  uint64_t entryID;

  entryID = 0;
  IORegistryEntryGetRegistryEntryID(-[IOKObject object](self, "object"), &entryID);
  return entryID;
}

- (NSDictionary)properties
{
  io_registry_entry_t v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v2 = -[IOKObject object](self, "object");
  if (!IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))
    return (NSDictionary *)properties;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
  return (NSDictionary *)0;
}

- (void)setProperties:(id)a3
{
  id properties;

  properties = a3;
  IORegistryEntrySetCFProperties(-[IOKObject object](self, "object"), properties);

}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id property;

  v6 = (__CFString *)a4;
  property = a3;
  IORegistryEntrySetCFProperty(-[IOKObject object](self, "object"), v6, property);

}

- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4
{
  id v6;
  __CFString *v7;
  id v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = (__CFString *)a3;
  LODWORD(self) = -[IOKObject object](self, "object");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = (void *)IORegistryEntrySearchCFProperty((io_registry_entry_t)self, v9, v7, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  return v10;
}

- (id)searchForPropertyWithKey:(id)a3 inPlane:(id)a4 withOptions:(int)a5
{
  id v8;
  __CFString *v9;
  id v10;
  const char *v11;
  void *v12;

  v8 = a4;
  v9 = (__CFString *)a3;
  LODWORD(self) = -[IOKObject object](self, "object");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  v12 = (void *)IORegistryEntrySearchCFProperty((io_registry_entry_t)self, v11, v9, (CFAllocatorRef)*MEMORY[0x24BDBD240], a5);
  return v12;
}

- (id)childIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  IOKIterator *v15;
  IOKIterator *v16;
  io_object_t object;

  v8 = a5;
  object = 0;
  v9 = a3;
  v10 = -[IOKObject object](self, "object");
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "UTF8String");

  v13 = MEMORY[0x2199DC830](v10, v12, &object);
  if (v13)
  {
    v14 = v13;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v14, 0);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v15 = 0;
  }
  else
  {
    v16 = [IOKIterator alloc];
    v15 = -[IOKIterator initWithIterator:enumerationBlock:](v16, "initWithIterator:enumerationBlock:", object, v8);
  }
LABEL_8:
  if (object)
    IOObjectRelease(object);

  return v15;
}

- (id)childIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4
{
  return -[IOKRegistryEntry childIteratorInPlane:error:withEnumerationBlock:](self, "childIteratorInPlane:error:withEnumerationBlock:", CFSTR("IOService"), a3, a4);
}

- (id)childInPlane:(id)a3 error:(id *)a4
{
  id v6;
  io_registry_entry_t v7;
  id v8;
  const char *v9;
  kern_return_t ChildEntry;
  kern_return_t v11;
  id v13;
  io_registry_entry_t child;

  child = 0;
  v6 = a3;
  v7 = -[IOKObject object](self, "object");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  ChildEntry = IORegistryEntryGetChildEntry(v7, v9, &child);
  if (ChildEntry)
  {
    v11 = ChildEntry;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  else
  {
    v13 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForRegistryEntry:", child));
    return (id)objc_msgSend(v13, "initWithRegistryEntry:", child);
  }
}

- (id)childInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry childInPlane:error:](self, "childInPlane:error:", CFSTR("IOService"), a3);
}

- (id)parentIteratorInPlane:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  IOKIterator *v12;
  IOKIterator *v13;
  io_object_t object;

  object = 0;
  v6 = a3;
  v7 = -[IOKObject object](self, "object");
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "UTF8String");

  v10 = MEMORY[0x2199DC86C](v7, v9, &object);
  if (v10)
  {
    v11 = v10;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v12 = 0;
  }
  else
  {
    v13 = [IOKIterator alloc];
    v12 = -[IOKIterator initWithIterator:](v13, "initWithIterator:", object);
  }
LABEL_8:
  if (object)
    IOObjectRelease(object);
  return v12;
}

- (id)parentIteratorInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry parentIteratorInPlane:error:](self, "parentIteratorInPlane:error:", CFSTR("IOService"), a3);
}

- (id)parentIteratorInPlane:(id)a3 error:(id *)a4 withEnumerationBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  IOKIterator *v15;
  IOKIterator *v16;
  io_object_t object;

  v8 = a5;
  object = 0;
  v9 = a3;
  v10 = -[IOKObject object](self, "object");
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "UTF8String");

  v13 = MEMORY[0x2199DC86C](v10, v12, &object);
  if (v13)
  {
    v14 = v13;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v14, 0);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v15 = 0;
  }
  else
  {
    v16 = [IOKIterator alloc];
    v15 = -[IOKIterator initWithIterator:enumerationBlock:](v16, "initWithIterator:enumerationBlock:", object, v8);
  }
LABEL_8:
  if (object)
    IOObjectRelease(object);

  return v15;
}

- (id)parentIteratorInServicePlaneWithError:(id *)a3 enumerationBlock:(id)a4
{
  return -[IOKRegistryEntry parentIteratorInPlane:error:withEnumerationBlock:](self, "parentIteratorInPlane:error:withEnumerationBlock:", CFSTR("IOService"), a3, a4);
}

- (id)parentEntryInPlane:(id)a3 error:(id *)a4
{
  id v6;
  io_registry_entry_t v7;
  id v8;
  const char *v9;
  kern_return_t ParentEntry;
  kern_return_t v11;
  void *v12;
  id v13;
  io_registry_entry_t parent;

  parent = 0;
  v6 = a3;
  v7 = -[IOKObject object](self, "object");
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  ParentEntry = IORegistryEntryGetParentEntry(v7, v9, &parent);
  if (ParentEntry)
  {
    v11 = ParentEntry;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v11, 0);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "classForRegistryEntry:", parent));
    v12 = (void *)objc_msgSend(v13, "initWithRegistryEntry:", parent);
  }
LABEL_8:
  if (parent)
    IOObjectRelease(parent);
  return v12;
}

- (id)parentEntryInServicePlaneWithError:(id *)a3
{
  return -[IOKRegistryEntry parentEntryInPlane:error:](self, "parentEntryInPlane:error:", CFSTR("IOService"), a3);
}

- (BOOL)isAttachedToPlane:(id)a3
{
  id v4;
  id v5;
  const char *v6;

  v4 = a3;
  LODWORD(self) = -[IOKObject object](self, "object");
  v5 = objc_retainAutorelease(v4);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  return IORegistryEntryInPlane((io_registry_entry_t)self, v6) != 0;
}

@end
