@implementation GCIORegistryEntry

- (GCIORegistryEntry)initWithPort:(unsigned int)a3 error:(id *)a4
{
  GCIORegistryEntry *v5;
  io_registry_entry_t v6;
  kern_return_t RegistryEntryID;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)GCIORegistryEntry;
  v5 = -[GCIOObject initWithPort:error:](&v12, sel_initWithPort_error_, *(_QWORD *)&a3);
  v6 = -[GCIOObject port]((uint64_t)v5);
  RegistryEntryID = IORegistryEntryGetRegistryEntryID(v6, &v5->_registryEntryID);
  if (RegistryEntryID || !v5->_registryEntryID)
  {
    if (a4)
    {
      v9 = *MEMORY[0x1E0CB2D98];
      v10 = RegistryEntryID;
      v13 = *MEMORY[0x1E0CB2D60];
      v14[0] = CFSTR("Did not return a valid registry entry ID.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v9, v10, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = v5;
  }

  return (GCIORegistryEntry *)a4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  -[GCIOObject className](self, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<Kernel/%@ registryEntryID='%#010llx'>"), v3, -[GCIORegistryEntry registryEntryID](self, "registryEntryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;

  -[GCIOObject className](self, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<Kernel/%@ registryEntryID='%#010llx'>"), v3, -[GCIORegistryEntry registryEntryID](self, "registryEntryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCIOObject className](self, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p Kernel/%@ registryEntryID='%#010llx'>"), v4, self, v5, -[GCIORegistryEntry registryEntryID](self, "registryEntryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)name
{
  uint64_t v2;
  _OWORD v4[8];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  v2 = -[GCIOObject port]((uint64_t)self);
  if (MEMORY[0x1DF0CDC70](v2, v4))
    return (NSString *)0;
  +[NSString stringWithCString:encoding:](NSString_0, "stringWithCString:encoding:", v4, 4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyForKey:(id)a3 inPlane:(const char *)a4 options:(unsigned int)a5
{
  __CFString *v8;
  io_registry_entry_t v9;
  void *v10;

  v8 = (__CFString *)a3;
  v9 = -[GCIOObject port]((uint64_t)self);
  v10 = (void *)IORegistryEntrySearchCFProperty(v9, a4, v8, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], a5);

  return v10;
}

- (id)propertyForKey:(id)a3
{
  __CFString *v4;
  io_registry_entry_t v5;
  void *CFProperty;

  v4 = (__CFString *)a3;
  v5 = -[GCIOObject port]((uint64_t)self);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, v4, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);

  return CFProperty;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id v7;
  io_registry_entry_t v8;
  kern_return_t v9;
  NSObject *v11;
  int v12;
  GCIORegistryEntry *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  kern_return_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = a3;
  v8 = -[GCIOObject port]((uint64_t)self);
  v9 = IORegistryEntrySetCFProperty(v8, v6, v7);

  if (v9)
  {
    _gc_log_iokit();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2114;
      v15 = v6;
      v16 = 1024;
      v17 = v9;
      _os_log_error_impl(&dword_1DC79E000, v11, OS_LOG_TYPE_ERROR, "%@ Error setting property '%{public}@': %{mach.errno}d", (uint8_t *)&v12, 0x1Cu);
    }

  }
  return v9 == 0;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

@end
