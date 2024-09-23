@implementation HMNumberSetting

- (HMNumberSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7 minimumValue:(id)a8 maximumValue:(id)a9 stepValue:(id)a10
{
  id v17;
  HMNumberSetting *v18;
  HMNumberSetting *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a8;
  v21 = a9;
  v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)HMNumberSetting;
  v18 = -[HMSetting initWithIdentifier:name:type:value:properties:](&v23, sel_initWithIdentifier_name_type_value_properties_, a3, a4, a5, a6, a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_minimumValue, a8);
    objc_storeStrong((id *)&v19->_maximumValue, a9);
    objc_storeStrong((id *)&v19->_stepValue, a10);
  }

  return v19;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMNumberSetting;
  return -[HMNumberSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (_QWORD)a3;
}

- (id)internalValue
{
  HMSettingValue *v3;
  void *v4;
  id v5;

  v3 = [HMSettingValue alloc];
  -[HMSetting value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMSettingValue initNumberSettingWithValue:](v3, "initNumberSettingWithValue:", v4);

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
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Value is not of type NSNumber"), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
  }
  v4 = -[HMSettingValue initNumberSettingWithValue:]([HMSettingValue alloc], "initNumberSettingWithValue:", v3);

  return v4;
}

- (NSNumber)minimumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)maximumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)stepValue
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
