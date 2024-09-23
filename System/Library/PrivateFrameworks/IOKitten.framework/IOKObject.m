@implementation IOKObject

- (IOKObject)initWithIOObject:(unsigned int)a3
{
  IOKObject *v4;
  IOKObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOKObject;
  v4 = -[IOKObject init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_object = a3;
    IOObjectRetain(a3);
  }
  return v5;
}

+ (Class)classForRegistryEntry:(unsigned int)a3
{
  if (!IOObjectConformsTo(a3, "IOService"))
    IOObjectConformsTo(a3, "IORegistryEntry");
  return (Class)(id)objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  IOObjectRelease(self->_object);
  v3.receiver = self;
  v3.super_class = (Class)IOKObject;
  -[IOKObject dealloc](&v3, sel_dealloc);
}

- (unsigned)object
{
  return self->_object;
}

- (BOOL)conformsToIOClassName:(id)a3
{
  id v4;
  id v5;
  const char *v6;

  v4 = a3;
  LODWORD(self) = -[IOKObject object](self, "object");
  v5 = objc_retainAutorelease(v4);
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  return IOObjectConformsTo((io_object_t)self, v6) != 0;
}

+ (id)ioSuperClassNameForClassName:(id)a3
{
  return (id)(id)IOObjectCopySuperclassForClass((CFStringRef)a3);
}

+ (id)bundleIdentifierForClassName:(id)a3
{
  return (id)(id)IOObjectCopyBundleIdentifierForClass((CFStringRef)a3);
}

- (IOKObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[IOKObject init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[IOKObject object](self, "object"));
}

- (unint64_t)hash
{
  return -[IOKObject object](self, "object");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || -[IOKObject isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[IOKObject object](self, "object");
    v6 = v5 == objc_msgSend(v4, "object");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
