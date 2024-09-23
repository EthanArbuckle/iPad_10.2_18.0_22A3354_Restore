@implementation HDFHIRExtensionElementResult

- (HDFHIRExtensionElementResult)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDFHIRExtensionElementResult)initWithExtensionElement:(id)a3 keyPath:(id)a4 isModifierExtension:(BOOL)a5
{
  id v8;
  id v9;
  HDFHIRExtensionElementResult *v10;
  uint64_t v11;
  HDFHIRExtensionElement *extensionElement;
  uint64_t v13;
  NSString *keyPath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDFHIRExtensionElementResult;
  v10 = -[HDFHIRExtensionElementResult init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    extensionElement = v10->_extensionElement;
    v10->_extensionElement = (HDFHIRExtensionElement *)v11;

    v13 = objc_msgSend(v9, "copy");
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;

    v10->_isModifierExtension = a5;
  }

  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (HDFHIRExtensionElement)extensionElement
{
  return self->_extensionElement;
}

- (BOOL)isModifierExtension
{
  return self->_isModifierExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionElement, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
