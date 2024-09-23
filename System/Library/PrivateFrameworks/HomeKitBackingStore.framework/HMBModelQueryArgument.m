@implementation HMBModelQueryArgument

- (HMBModelQueryArgument)initWithPropertyName:(id)a3 defaultValue:(id)a4
{
  id v7;
  id v8;
  HMBModelQueryArgument *v9;
  HMBModelQueryArgument *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBModelQueryArgument;
  v9 = -[HMBModelQueryArgument init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyName, a3);
    objc_storeStrong((id *)&v10->_defaultValue, a4);
  }

  return v10;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (HMBQueryableModelFieldCoder)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

+ (id)argumentWithPropertyName:(id)a3
{
  id v3;
  HMBModelQueryArgument *v4;

  v3 = a3;
  v4 = -[HMBModelQueryArgument initWithPropertyName:defaultValue:]([HMBModelQueryArgument alloc], "initWithPropertyName:defaultValue:", v3, 0);

  return v4;
}

+ (id)argumentWithPropertyName:(id)a3 defaultValue:(id)a4
{
  id v5;
  id v6;
  HMBModelQueryArgument *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMBModelQueryArgument initWithPropertyName:defaultValue:]([HMBModelQueryArgument alloc], "initWithPropertyName:defaultValue:", v6, v5);

  return v7;
}

@end
