@implementation INCExtensionPlugInBundle

- (INCExtensionPlugInBundle)initWithPrincipalClass:(Class)a3 intentsSupported:(id)a4 intentsRestrictedWhileLocked:(id)a5
{
  id v8;
  id v9;
  INCExtensionPlugInBundle *v10;
  INCExtensionPlugInBundle *v11;
  uint64_t v12;
  NSSet *intentsSupported;
  uint64_t v14;
  NSSet *intentsRestrictedWhileLocked;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INCExtensionPlugInBundle;
  v10 = -[INCExtensionPlugInBundle init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_principalClass, a3);
    v12 = objc_msgSend(v8, "copy");
    intentsSupported = v11->_intentsSupported;
    v11->_intentsSupported = (NSSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    intentsRestrictedWhileLocked = v11->_intentsRestrictedWhileLocked;
    v11->_intentsRestrictedWhileLocked = (NSSet *)v14;

  }
  return v11;
}

- (Class)principalClass
{
  return self->_principalClass;
}

- (NSSet)intentsSupported
{
  return self->_intentsSupported;
}

- (NSSet)intentsRestrictedWhileLocked
{
  return self->_intentsRestrictedWhileLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentsRestrictedWhileLocked, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
  objc_storeStrong((id *)&self->_principalClass, 0);
}

@end
