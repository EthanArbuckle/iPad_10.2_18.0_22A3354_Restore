@implementation FATException

- (FATException)init
{
  objc_class *v3;
  void *v4;
  FATException *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FATException initWithName:reason:userInfo:](self, "initWithName:reason:userInfo:", v4, CFSTR("unknown"), 0);

  return v5;
}

- (void)read:(id)a3
{
  +[ENTProtocolUtil readFromProtocol:ontoObject:](ENTProtocolUtil, "readFromProtocol:ontoObject:", a3, self);
}

- (void)write:(id)a3
{
  +[ENTProtocolUtil writeObject:ontoProtocol:](ENTProtocolUtil, "writeObject:ontoProtocol:", self, a3);
}

+ (void)initialize
{
  _QWORD block[5];

  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__FATException_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1)
      dispatch_once(&initialize_onceToken, block);
  }
}

+ (id)structName
{
  FATInvalidAbstractInvocation(a2, (objc_class *)a1);
  return 0;
}

+ (id)structFields
{
  FATInvalidAbstractInvocation(a2, (objc_class *)a1);
  return 0;
}

void __26__FATException_initialize__block_invoke()
{
  objc_class *v0;
  Method *v1;
  unint64_t i;
  objc_class *v3;
  const char *Name;
  void (*Implementation)(void);
  const char *TypeEncoding;
  unsigned int outCount;

  outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyMethodList(v0, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v3 = (objc_class *)objc_opt_class();
      Name = method_getName(v1[i]);
      Implementation = method_getImplementation(v1[i]);
      TypeEncoding = method_getTypeEncoding(v1[i]);
      class_addMethod(v3, Name, Implementation, TypeEncoding);
    }
  }
  free(v1);
}

@end
