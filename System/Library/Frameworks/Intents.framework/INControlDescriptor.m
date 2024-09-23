@implementation INControlDescriptor

- (INControlDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 actionIntentType:(id)a6
{
  id v10;
  INControlDescriptor *v11;
  uint64_t v12;
  NSString *actionIntentType;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)INControlDescriptor;
  v11 = -[INConfigurableDescriptor initWithExtensionBundleIdentifier:kind:intentClassName:](&v15, sel_initWithExtensionBundleIdentifier_kind_intentClassName_, a3, a4, a5);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    actionIntentType = v11->_actionIntentType;
    v11->_actionIntentType = (NSString *)v12;

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[INConfigurableDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConfigurableDescriptor kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConfigurableDescriptor intentClassName](self, "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("extensionBundleIdentifier: %@, kind: %@, intentClassName: %@, actionIntentType: %@"), v4, v5, v6, self->_actionIntentType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)actionIntentType
{
  return self->_actionIntentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIntentType, 0);
}

@end
