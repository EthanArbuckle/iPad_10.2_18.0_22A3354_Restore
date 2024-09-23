@implementation HMSelectionSetting

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMSelectionSetting;
  return -[HMSelectionSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (_QWORD)a3;
}

- (id)internalValue
{
  void *v2;
  HMSettingValue *v3;
  void *v4;
  void *v5;
  HMSettingValue *v6;

  -[HMSetting value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HMSettingValue alloc];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](v3, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 4, 0, 0, 0, v4, v5);

  return v6;
}

- (id)valueForUpdate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  HMSettingValue *v6;
  void *v7;
  void *v8;
  HMSettingValue *v9;
  id v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Value is not of type HMSelectionSettingItem"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = [HMSettingValue alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](v6, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", 4, 0, 0, 0, v7, v8);

  return v9;
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
