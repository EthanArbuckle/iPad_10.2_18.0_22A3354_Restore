@implementation HFTemperatureUnitControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 displayResults:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HFTemperatureUnitControlItem *v14;
  uint64_t v15;
  NSString *temperatureUnitCharacteristicType;
  objc_super v18;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "setWithObject:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFControlItemCharacteristicOptions optionsWithReadWriteCharacteristicTypes:](HFControlItemCharacteristicOptions, "optionsWithReadWriteCharacteristicTypes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)HFTemperatureUnitControlItem;
  v14 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v18, sel_initWithValueSource_characteristicOptions_displayResults_, v11, v13, v10);

  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    temperatureUnitCharacteristicType = v14->_temperatureUnitCharacteristicType;
    v14->_temperatureUnitCharacteristicType = (NSString *)v15;

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureUnitCharacteristicType, 0);
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFTemperatureUnitControlItem temperatureUnitCharacteristicType](self, "temperatureUnitCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)temperatureUnitCharacteristicType
{
  return self->_temperatureUnitCharacteristicType;
}

- (HFTemperatureUnitControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristicType_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTemperatureUnitControlItem.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTemperatureUnitControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (-[HFControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[HFTemperatureUnitControlItem temperatureUnitCharacteristicType](self, "temperatureUnitCharacteristicType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem displayResults](self, "displayResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithValueSource:characteristicType:displayResults:", v6, v8, v9);

    objc_msgSend(v10, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFTemperatureUnitControlItem temperatureUnitCharacteristicType](self, "temperatureUnitCharacteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
