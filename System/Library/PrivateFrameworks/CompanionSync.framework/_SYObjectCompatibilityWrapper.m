@implementation _SYObjectCompatibilityWrapper

- (_SYObjectCompatibilityWrapper)initWithSYObject:(id)a3 changeType:(int64_t)a4
{
  id v7;
  _SYObjectCompatibilityWrapper *v8;

  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_syObject, a3);
    self->_type = a4;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)objectIdentifier
{
  return (NSString *)-[SYObject syncId](self->_syObject, "syncId");
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return self->_type;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_class *v4;
  objc_method *InstanceMethod;
  objc_class *v6;

  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, a3);
  if (InstanceMethod
    || (v6 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v6, a3)) != 0))
  {
    objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", method_getTypeEncoding(InstanceMethod));
    InstanceMethod = (objc_method *)objc_claimAutoreleasedReturnValue();
  }
  return InstanceMethod;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->_syObject);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syObject, 0);
}

@end
