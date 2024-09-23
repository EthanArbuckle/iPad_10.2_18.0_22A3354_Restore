@implementation ASDTPListProperty

- (ASDTPListProperty)initWithConfig:(id)a3
{
  id v4;
  ASDTPListProperty *v5;
  ASDTPListProperty *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDTPListProperty;
  v5 = -[ASDTCustomProperty initWithConfig:propertyDataType:qualifierDataType:](&v9, sel_initWithConfig_propertyDataType_qualifierDataType_, v4, 1886155636, 0);
  v6 = v5;
  if (v5)
  {
    -[ASDTCustomProperty setCacheMode:](v5, "setCacheMode:", 2);
    -[ASDTCustomProperty setPlistDeepCopyOnSet:](v6, "setPlistDeepCopyOnSet:", 1);
    objc_msgSend(v4, "asdtPropertyValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTCustomProperty storePropertyValue:](v6, "storePropertyValue:", v7);

  }
  return v6;
}

@end
