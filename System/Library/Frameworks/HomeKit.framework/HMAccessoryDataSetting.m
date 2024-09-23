@implementation HMAccessoryDataSetting

- (HMAccessoryDataSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v8;
  id v9;
  _HMAccessorySetting *v10;
  HMAccessoryDataSetting *v11;

  v8 = a5;
  v9 = a3;
  v10 = -[_HMAccessorySetting initWithType:properties:name:constraints:]([_HMAccessorySetting alloc], "initWithType:properties:name:constraints:", 1, a4, v9, 0);

  -[_HMAccessorySetting setValue:](v10, "setValue:", v8);
  v11 = -[HMAccessorySetting initWithInternal:](self, "initWithInternal:", v10);

  return v11;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end
