@implementation IOAccelMemoryOpenCLInfo

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@, Context %@, %@ 0x%llx"), pid2name(-[IOAccelMemoryOpenCLInfo pid](self, "pid")), -[IOAccelMemoryOpenCLInfo cl_context](self, "cl_context"), -[IOAccelMemoryOpenCLInfo objectType](self, "objectType"), -[IOAccelMemoryOpenCLInfo cl_mem](self, "cl_mem"));
  if (-[IOAccelMemoryOpenCLInfo objectDescription](self, "objectDescription"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), -[IOAccelMemoryOpenCLInfo objectDescription](self, "objectDescription"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryOpenCLInfo;
  -[IOAccelMemoryOpenCLInfo dealloc](&v3, sel_dealloc);
}

- (int)pid
{
  return self->pid;
}

- (void)setPid:(int)a3
{
  self->pid = a3;
}

- (NSString)cl_context
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCl_context:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)cl_mem
{
  return self->cl_mem;
}

- (void)setCl_mem:(unint64_t)a3
{
  self->cl_mem = a3;
}

- (NSString)objectType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)objectDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObjectDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
