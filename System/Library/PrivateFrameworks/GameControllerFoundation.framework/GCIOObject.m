@implementation GCIOObject

- (GCIOObject)initWithPort:(unsigned int)a3 error:(id *)a4
{
  GCIOObject *v6;
  kern_return_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)GCIOObject;
  v6 = -[GCIOObject init](&v12, sel_init);
  v7 = IOObjectRetain(a3);
  if (v7)
  {
    if (a4)
    {
      v9 = *MEMORY[0x1E0CB2D98];
      v10 = v7;
      v13 = *MEMORY[0x1E0CB2D60];
      v14[0] = CFSTR("Error incrementing port retain count.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v9, v10, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    v6->_port = a3;
    a4 = v6;
  }

  return (GCIOObject *)a4;
}

- (GCIOObject)init
{
  -[GCIOObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  v4.super_class = (Class)GCIOObject;
  -[GCIOObject dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  return self->_port;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  uint64_t port;
  void *v6;

  -[GCIOObject className](self, "className");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self)
    port = self->_port;
  else
    port = 0;
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<Kernel/%@ port='%#08x'>"), v3, port);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (uint64_t)port
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

- (id)redactedDescription
{
  uint64_t v3;
  void *v4;
  uint64_t port;
  void *v6;

  -[GCIOObject className](self, "className");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (self)
    port = self->_port;
  else
    port = 0;
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<Kernel/%@ port='%#08x'>"), v3, port);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)debugDescription
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t port;
  void *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCIOObject className](self, "className");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    port = self->_port;
  else
    port = 0;
  +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("<%@ %p Kernel/%@ port='%#08x'>"), v4, self, v5, port);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (NSString)className
{
  return (NSString *)CFSTR("OSObject");
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
  io_object_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4)
      v5 = v4[2];
    else
      v5 = 0;
    v6 = IOObjectIsEqualTo(self->_port, v5) != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
