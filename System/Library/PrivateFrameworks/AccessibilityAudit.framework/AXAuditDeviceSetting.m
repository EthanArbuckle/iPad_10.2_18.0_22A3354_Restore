@implementation AXAuditDeviceSetting

+ (id)allKnownIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("INVERT_COLORS"), CFSTR("INCREASE_CONTRAST"), CFSTR("REDUCE_MOTION"), CFSTR("KEYBOARD_ACCESS"), CFSTR("REDUCE_TRANSPARENCY"), CFSTR("ENABLE_CAPTIONS"), CFSTR("DYNAMIC_TYPE"), CFSTR("BOLD_FONTS"), CFSTR("ON_OFF_LABELS"), CFSTR("BUTTON_SHAPES"), CFSTR("GRAYSCALE"), CFSTR("DIFFERENTIATE_WITHOUT_COLOR"), 0);
}

+ (id)createWithIdentifier:(id)a3 currentValue:(id)a4 settingType:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setIdentifier:", v9);

  objc_msgSend(v10, "setSettingType:", a5);
  objc_msgSend(v10, "setCurrentValueNumber:", v8);

  objc_msgSend(v10, "setEnabled:", 1);
  return v10;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportPropertyEntry *v7;
  AXAuditObjectTransportPropertyEntry *v8;
  AXAuditObjectTransportInfoPropertyBased *v9;

  v3 = a3;
  v9 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditDeviceSetting_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("IdentiifierValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_32);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("CurrentValueNumber_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_37);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_39);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("SettingTypeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_43);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_44);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("EnabledValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_47);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_48);
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v8);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v8, "setTransportKey:", CFSTR("SliderTickMarksValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v8, "setLocalValueToTransportValue:", &__block_literal_global_53);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v8, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_54);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v9);

}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIdentifier:", v4);

}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentValueNumber");
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setCurrentValueNumber:", v4);

}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(a2, "settingType"));
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSettingType:", objc_msgSend(v4, "integerValue"));

}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "enabled"));
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "sliderTickMarks"));
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSliderTickMarks:", objc_msgSend(v4, "integerValue"));

}

- (AXAuditDeviceSetting)init
{
  AXAuditDeviceSetting *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXAuditDeviceSetting;
  result = -[AXAuditDeviceSetting init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXAuditDeviceSetting identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  objc_msgSend(v4, "setSettingType:", -[AXAuditDeviceSetting settingType](self, "settingType"));
  objc_msgSend(v4, "setEnabled:", -[AXAuditDeviceSetting enabled](self, "enabled"));
  objc_msgSend(v4, "setSliderTickMarks:", -[AXAuditDeviceSetting sliderTickMarks](self, "sliderTickMarks"));
  -[AXAuditDeviceSetting currentValueNumber](self, "currentValueNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentValueNumber:", v6);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditDeviceSetting;
  -[AXAuditDeviceSetting description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditDeviceSetting identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditDeviceSetting currentValueNumber](self, "currentValueNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("identifier:%@ value:%@ type:%i"), v4, v5, -[AXAuditDeviceSetting settingType](self, "settingType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[AXAuditDeviceSetting settingType](self, "settingType");
  -[AXAuditDeviceSetting identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[AXAuditDeviceSetting currentValueNumber](self, "currentValueNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v7 + -[AXAuditDeviceSetting enabled](self, "enabled");
  v9 = v5 ^ (v8 + -[AXAuditDeviceSetting sliderTickMarks](self, "sliderTickMarks"));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditDeviceSetting *v4;
  AXAuditDeviceSetting *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  BOOL v12;
  int64_t v13;

  v4 = (AXAuditDeviceSetting *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[AXAuditDeviceSetting settingType](self, "settingType");
      if (v6 == -[AXAuditDeviceSetting settingType](v5, "settingType"))
      {
        -[AXAuditDeviceSetting identifier](self, "identifier");
        v7 = objc_claimAutoreleasedReturnValue();
        -[AXAuditDeviceSetting identifier](v5, "identifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 | v8 && !objc_msgSend((id)v7, "isEqual:", v8))
        {
          v12 = 0;
        }
        else
        {
          -[AXAuditDeviceSetting currentValueNumber](self, "currentValueNumber");
          v9 = objc_claimAutoreleasedReturnValue();
          -[AXAuditDeviceSetting currentValueNumber](v5, "currentValueNumber");
          v10 = objc_claimAutoreleasedReturnValue();
          if ((!(v9 | v10) || objc_msgSend((id)v9, "isEqual:", v10))
            && (v11 = -[AXAuditDeviceSetting enabled](self, "enabled"),
                v11 == -[AXAuditDeviceSetting enabled](v5, "enabled")))
          {
            v13 = -[AXAuditDeviceSetting sliderTickMarks](self, "sliderTickMarks");
            v12 = v13 == -[AXAuditDeviceSetting sliderTickMarks](v5, "sliderTickMarks");
          }
          else
          {
            v12 = 0;
          }

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)currentValueNumber
{
  return self->_currentValueNumber;
}

- (void)setCurrentValueNumber:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueNumber, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)settingType
{
  return self->_settingType;
}

- (void)setSettingType:(unint64_t)a3
{
  self->_settingType = a3;
}

- (int64_t)sliderTickMarks
{
  return self->_sliderTickMarks;
}

- (void)setSliderTickMarks:(int64_t)a3
{
  self->_sliderTickMarks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueNumber, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
