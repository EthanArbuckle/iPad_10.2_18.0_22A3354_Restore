@implementation INWidgetDescriptor

- (INWidgetDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5 preferredSizeClass:(int64_t)a6
{
  INWidgetDescriptor *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INWidgetDescriptor;
  result = -[INConfigurableDescriptor initWithExtensionBundleIdentifier:kind:intentClassName:](&v8, sel_initWithExtensionBundleIdentifier_kind_intentClassName_, a3, a4, a5);
  if (result)
    result->_preferredSizeClass = a6;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[INConfigurableDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConfigurableDescriptor kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConfigurableDescriptor intentClassName](self, "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredSizeClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("extensionBundleIdentifier: %@, kind: %@, intentClassName: %@, preferredSizeClass: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

@end
