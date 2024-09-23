@implementation MCMXPCMessageWithKeyBase

- (MCMXPCMessageWithKeyBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  id v8;
  MCMXPCMessageWithKeyBase *v9;
  MCMXPCMessageWithKeyBase *v10;
  uint64_t v11;
  NSString *key;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMXPCMessageWithKeyBase;
  v9 = -[MCMXPCMessageWithConcreteContainerBase initWithXPCObject:context:error:](&v14, sel_initWithXPCObject_context_error_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "Key");
    v11 = objc_claimAutoreleasedReturnValue();
    key = v10->_key;
    v10->_key = (NSString *)v11;

  }
  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
