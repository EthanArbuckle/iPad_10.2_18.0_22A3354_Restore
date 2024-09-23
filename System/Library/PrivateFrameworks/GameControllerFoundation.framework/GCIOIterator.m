@implementation GCIOIterator

- (GCIOIterator)initWithPort:(unsigned int)a3 objectClass:(Class)a4 error:(id *)a5
{
  GCIOIterator *v9;
  kern_return_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)GCIOIterator;
  v9 = -[GCIOIterator init](&v17, sel_init);
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("GCIOIterator.m"), 17, CFSTR("Assertion failed: [objectClass isSubclassOfClass:GCIOObject.class]"));

    goto LABEL_5;
  }
  v10 = IOObjectRetain(a3);
  if (!v10)
  {
    v9->_port = a3;
    objc_storeStrong((id *)&v9->_objectClass, a4);
    a5 = v9;
    goto LABEL_7;
  }
  if (a5)
  {
    v11 = *MEMORY[0x1E0CB2D98];
    v12 = v10;
    v13 = *MEMORY[0x1E0CB2D68];
    v18[0] = *MEMORY[0x1E0CB2D50];
    v18[1] = v13;
    v19[0] = CFSTR("Invalid port.");
    v19[1] = CFSTR("Error incrementing port retain count.");
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v11, v12, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
    a5 = 0;
  }
LABEL_7:

  return (GCIOIterator *)a5;
}

- (GCIOIterator)init
{
  -[GCIOIterator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  io_object_t port;
  objc_super v4;

  port = self->_port;
  if (port)
  {
    IOObjectRelease(port);
    self->_port = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GCIOIterator;
  -[GCIOIterator dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  return self->_port;
}

- (NSString)description
{
  CFStringRef v3;
  SEL v4;
  void *v5;
  uint64_t port;
  void *v7;

  if (self)
  {
    v3 = IOObjectCopyClass(self->_port);
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    port = self->_port;
  }
  else
  {
    v3 = IOObjectCopyClass(0);
    objc_msgSend(0, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    port = 0;
  }
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@<Kernel/%@> port='%#08x'>"), v3, v5, port);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (uint64_t)port
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (id)objectClass
{
  if (result)
    return objc_getProperty(result, a2, 16, 1);
  return result;
}

- (id)redactedDescription
{
  CFStringRef v3;
  SEL v4;
  void *v5;
  uint64_t port;
  void *v7;

  if (self)
  {
    v3 = IOObjectCopyClass(self->_port);
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    port = self->_port;
  }
  else
  {
    v3 = IOObjectCopyClass(0);
    objc_msgSend(0, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    port = 0;
  }
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@<Kernel/%@> port='%#08x'>"), v3, v5, port);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  CFStringRef v5;
  SEL v6;
  void *v7;
  uint64_t port;
  void *v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v5 = IOObjectCopyClass(self->_port);
    objc_msgSend(objc_getProperty(self, v6, 16, 1), "className");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    port = self->_port;
  }
  else
  {
    v5 = IOObjectCopyClass(0);
    objc_msgSend(0, "className");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    port = 0;
  }
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p %@<Kernel/%@> port='%#08x'>"), v4, self, v5, v7, port);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (NSString)className
{
  return (NSString *)CFSTR("OSIterator");
}

- (NSString)className
{
  return (NSString *)(id)IOObjectCopyClass(self->_port);
}

- (BOOL)conformsTo:(const char *)a3
{
  return IOObjectConformsTo(self->_port, a3) != 0;
}

- (BOOL)isEqualTo:(id)a3
{
  _DWORD *v4;
  io_object_t port;
  io_object_t v6;
  unsigned int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    port = self->_port;
    if (v4)
      v6 = v4[2];
    else
      v6 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v7 = self->_port;
    v6 = -[GCIOObject port]((uint64_t)v4);
    port = v7;
  }
  v8 = IOObjectIsEqualTo(port, v6) != 0;
LABEL_8:

  return v8;
}

- (id)nextObject
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  objc_class *Property;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t port;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  uint64_t v17;
  BOOLean_t IsValid;
  id v20;
  uint8_t buf[4];
  GCIOIterator *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    while (self)
    {
      v3 = IOIteratorNext(self->_port);
      if ((_DWORD)v3)
      {
        v5 = v3;
        Property = (objc_class *)objc_getProperty(self, v4, 16, 1);
        goto LABEL_5;
      }
      if (IOIteratorIsValid(self->_port))
        return 0;
      port = self->_port;
LABEL_11:
      MEMORY[0x1DF0CDBD4](port);
    }
    v17 = IOIteratorNext(0);
    if (!(_DWORD)v17)
    {
      IsValid = IOIteratorIsValid(0);
      port = 0;
      if (IsValid)
        return 0;
      goto LABEL_11;
    }
    v5 = v17;
    Property = 0;
LABEL_5:
    v7 = [Property alloc];
    v20 = 0;
    v8 = (void *)objc_msgSend(v7, "initWithPort:error:", v5, &v20);
    v9 = v20;
    v10 = v9;
    if (v8)
      break;
    _gc_log_iokit();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = (__CFString *)IOObjectCopyClass(v5);
      v14 = v13;
      v15 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "localizedFailureReason");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138413058;
      v22 = self;
      v23 = 2114;
      v24 = v13;
      v25 = 1024;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_error_impl(&dword_1DC79E000, v11, OS_LOG_TYPE_ERROR, "%@ Error instantiating wrapper for next object '%{public}@': %{mach.errno}d %{public}@", buf, 0x26u);

    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);
}

@end
