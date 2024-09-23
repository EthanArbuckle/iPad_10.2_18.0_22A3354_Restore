@implementation FigCaptureCMIOExtensionProperty

- (FigCaptureCMIOExtensionProperty)initWithName:(id)a3 defaultValue:(id)a4 readonly:(BOOL)a5
{
  id v8;
  id v9;
  FigCaptureCMIOExtensionProperty *v10;
  FigCaptureCMIOExtensionProperty *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FigCaptureCMIOExtensionProperty;
  v10 = -[FigCaptureCMIOExtensionProperty init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_propertyName, a3);
    objc_storeStrong(&v11->_propertyValue, a4);
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%p] name:%@ value:%@"), v5, self, self->_propertyName, self->_propertyValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updatePropertyValueWithoutKVONotification:(id)a3
{
  objc_storeStrong(&self->_propertyValue, a3);
}

- (NSString)propertyName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)propertyValue
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPropertyValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (NSString)propertyAliasName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropertyAliasName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAliasName, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong(&self->_propertyValue, 0);
}

@end
