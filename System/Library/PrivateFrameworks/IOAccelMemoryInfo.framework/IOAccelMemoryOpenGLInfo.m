@implementation IOAccelMemoryOpenGLInfo

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = -[IOAccelMemoryOpenGLInfo objectType](self, "objectType");
  if (v4 > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = *(&off_24CDC1778 + v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ Sharegroup %@ %@ %d"), pid2name(-[IOAccelMemoryOpenGLInfo pid](self, "pid")), -[IOAccelMemoryOpenGLInfo sharegroup](self, "sharegroup"), v5, -[IOAccelMemoryOpenGLInfo name](self, "name"));
  if (-[IOAccelMemoryOpenGLInfo debugLabel](self, "debugLabel")
    || -[IOAccelMemoryOpenGLInfo objectDescription](self, "objectDescription"))
  {
    objc_msgSend(v3, "appendString:", CFSTR(" ("));
    if (-[IOAccelMemoryOpenGLInfo debugLabel](self, "debugLabel"))
    {
      objc_msgSend(v3, "appendString:", -[IOAccelMemoryOpenGLInfo debugLabel](self, "debugLabel"));
      if (-[IOAccelMemoryOpenGLInfo objectDescription](self, "objectDescription"))
        objc_msgSend(v3, "appendString:", CFSTR(", "));
    }
    if (-[IOAccelMemoryOpenGLInfo objectDescription](self, "objectDescription"))
      objc_msgSend(v3, "appendString:", -[IOAccelMemoryOpenGLInfo objectDescription](self, "objectDescription"));
    objc_msgSend(v3, "appendString:", CFSTR(")"));
  }
  if (-[IOAccelMemoryOpenGLInfo blamedProcess](self, "blamedProcess"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", on behalf of %@"), pid2name(-[IOAccelMemoryOpenGLInfo blamedProcess](self, "blamedProcess")));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOAccelMemoryOpenGLInfo;
  -[IOAccelMemoryOpenGLInfo dealloc](&v3, sel_dealloc);
}

- (int)pid
{
  return self->pid;
}

- (void)setPid:(int)a3
{
  self->pid = a3;
}

- (NSString)sharegroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharegroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)objectType
{
  return self->objectType;
}

- (void)setObjectType:(unint64_t)a3
{
  self->objectType = a3;
}

- (int)name
{
  return self->name;
}

- (void)setName:(int)a3
{
  self->name = a3;
}

- (int)blamedProcess
{
  return self->blamedProcess;
}

- (void)setBlamedProcess:(int)a3
{
  self->blamedProcess = a3;
}

- (NSString)objectDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObjectDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)debugLabel
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebugLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
