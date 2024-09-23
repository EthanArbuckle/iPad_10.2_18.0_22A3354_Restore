@implementation INCWidgetOptions

- (INCWidgetOptions)initWithExtensionBundleIdentifier:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  INCWidgetOptions *v8;
  uint64_t v9;
  NSString *extensionBundleIdentifier;
  uint64_t v11;
  NSString *intentType;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCWidgetOptions;
  v8 = -[INCWidgetOptions init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensionBundleIdentifier = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    intentType = v8->_intentType;
    v8->_intentType = (NSString *)v11;

  }
  return v8;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
