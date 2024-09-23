@implementation HMDataSetting

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMDataSetting;
  return -[HMDataSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (_QWORD)a3;
}

- (id)internalValue
{
  HMSettingValue *v3;
  void *v4;
  id v5;

  v3 = [HMSettingValue alloc];
  -[HMSetting value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMSettingValue initDataSettingWithValue:](v3, "initDataSettingWithValue:", v4);

  return v5;
}

- (id)valueForUpdate:(id)a3
{
  id v3;
  id v4;
  id v6;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Value is not of type NSData"), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
  }
  v4 = -[HMSettingValue initDataSettingWithValue:]([HMSettingValue alloc], "initDataSettingWithValue:", v3);

  return v4;
}

@end
