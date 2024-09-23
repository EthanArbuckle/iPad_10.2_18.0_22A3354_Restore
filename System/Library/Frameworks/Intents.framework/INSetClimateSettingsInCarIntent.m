@implementation INSetClimateSettingsInCarIntent

- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone
{
  return -[INSetClimateSettingsInCarIntent initWithEnableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:carName:](self, "initWithEnableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:carName:", enableFan, enableAirConditioner, enableClimateControl, enableAutoMode, airCirculationMode, fanSpeedIndex, fanSpeedPercentage, relativeFanSpeedSetting, temperature, relativeTemperatureSetting, climateZone, 0);
}

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetClimateSettingsInCarIntent)initWithEnableFan:(NSNumber *)enableFan enableAirConditioner:(NSNumber *)enableAirConditioner enableClimateControl:(NSNumber *)enableClimateControl enableAutoMode:(NSNumber *)enableAutoMode airCirculationMode:(INCarAirCirculationMode)airCirculationMode fanSpeedIndex:(NSNumber *)fanSpeedIndex fanSpeedPercentage:(NSNumber *)fanSpeedPercentage relativeFanSpeedSetting:(INRelativeSetting)relativeFanSpeedSetting temperature:(NSMeasurement *)temperature relativeTemperatureSetting:(INRelativeSetting)relativeTemperatureSetting climateZone:(INCarSeat)climateZone carName:(INSpeakableString *)carName
{
  NSNumber *v19;
  NSNumber *v20;
  NSNumber *v21;
  NSNumber *v22;
  NSMeasurement *v23;
  INSpeakableString *v24;
  INSetClimateSettingsInCarIntent *v25;
  INSetClimateSettingsInCarIntent *v26;
  NSNumber *v29;
  NSNumber *v30;
  objc_super v31;

  v30 = enableFan;
  v29 = enableAirConditioner;
  v19 = enableClimateControl;
  v20 = enableAutoMode;
  v21 = fanSpeedIndex;
  v22 = fanSpeedPercentage;
  v23 = temperature;
  v24 = carName;
  v31.receiver = self;
  v31.super_class = (Class)INSetClimateSettingsInCarIntent;
  v25 = -[INIntent init](&v31, sel_init);
  v26 = v25;
  if (v25)
  {
    -[INSetClimateSettingsInCarIntent setEnableFan:](v25, "setEnableFan:", v30);
    -[INSetClimateSettingsInCarIntent setEnableAirConditioner:](v26, "setEnableAirConditioner:", v29);
    -[INSetClimateSettingsInCarIntent setEnableClimateControl:](v26, "setEnableClimateControl:", v19);
    -[INSetClimateSettingsInCarIntent setEnableAutoMode:](v26, "setEnableAutoMode:", v20);
    -[INSetClimateSettingsInCarIntent setAirCirculationMode:](v26, "setAirCirculationMode:", airCirculationMode);
    -[INSetClimateSettingsInCarIntent setFanSpeedIndex:](v26, "setFanSpeedIndex:", v21);
    -[INSetClimateSettingsInCarIntent setFanSpeedPercentage:](v26, "setFanSpeedPercentage:", v22);
    -[INSetClimateSettingsInCarIntent setRelativeFanSpeedSetting:](v26, "setRelativeFanSpeedSetting:", relativeFanSpeedSetting);
    -[INSetClimateSettingsInCarIntent setTemperature:](v26, "setTemperature:", v23);
    -[INSetClimateSettingsInCarIntent setRelativeTemperatureSetting:](v26, "setRelativeTemperatureSetting:", relativeTemperatureSetting);
    -[INSetClimateSettingsInCarIntent setClimateZone:](v26, "setClimateZone:", climateZone);
    -[INSetClimateSettingsInCarIntent setCarName:](v26, "setCarName:", v24);
  }

  return v26;
}

- (NSNumber)enableFan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableFan"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableFan"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableFan:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableFan:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableFan:", 0);

}

- (NSNumber)enableAirConditioner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableAirConditioner"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableAirConditioner"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableAirConditioner:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableAirConditioner:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableAirConditioner:", 0);

}

- (NSNumber)enableClimateControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableClimateControl"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableClimateControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableClimateControl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableClimateControl:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableClimateControl:", 0);

}

- (NSNumber)enableAutoMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasEnableAutoMode"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "enableAutoMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setEnableAutoMode:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setEnableAutoMode:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasEnableAutoMode:", 0);

}

- (INCarAirCirculationMode)airCirculationMode
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INCarAirCirculationMode v8;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAirCirculationMode");
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "airCirculationMode");
  v7 = 2 * (v6 == 2);
  if (v6 == 1)
    v7 = 1;
  if (v4)
    v8 = v7;
  else
    v8 = INCarAirCirculationModeUnknown;

  return v8;
}

- (void)setAirCirculationMode:(int64_t)a3
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 0x7FFFFFFF;
  if (a3 == 2)
    v4 = 2;
  else
    v4 = v3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v4 == 0x7FFFFFFF)
    objc_msgSend(v5, "setHasAirCirculationMode:", 0);
  else
    objc_msgSend(v5, "setAirCirculationMode:", v4);

}

- (NSNumber)fanSpeedIndex
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fanSpeedIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromInteger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setFanSpeedIndex:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToInteger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFanSpeedIndex:", v5);
}

- (NSNumber)fanSpeedPercentage
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fanSpeedPercentage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDouble(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setFanSpeedPercentage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDouble(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFanSpeedPercentage:", v5);
}

- (INRelativeSetting)relativeFanSpeedSetting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INRelativeSetting v7;
  INRelativeSetting v8;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRelativeFanSpeedSetting");
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relativeFanSpeedSetting") - 1;
  if (v6 <= 3)
    v7 = v6 + 1;
  else
    v7 = INRelativeSettingUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INRelativeSettingUnknown;

  return v8;
}

- (void)setRelativeFanSpeedSetting:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 3)
    objc_msgSend(v4, "setHasRelativeFanSpeedSetting:", 0);
  else
    objc_msgSend(v4, "setRelativeFanSpeedSetting:");

}

- (NSMeasurement)temperature
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temperature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTemperature(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v4;
}

- (void)setTemperature:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemperature(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemperature:", v5);
}

- (INRelativeSetting)relativeTemperatureSetting
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  INRelativeSetting v7;
  INRelativeSetting v8;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRelativeTemperatureSetting");
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relativeTemperatureSetting") - 1;
  if (v6 <= 3)
    v7 = v6 + 1;
  else
    v7 = INRelativeSettingUnknown;
  if (v4)
    v8 = v7;
  else
    v8 = INRelativeSettingUnknown;

  return v8;
}

- (void)setRelativeTemperatureSetting:(int64_t)a3
{
  unint64_t v3;
  void *v4;
  id v5;

  v3 = a3 - 1;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 > 3)
    objc_msgSend(v4, "setHasRelativeTemperatureSetting:", 0);
  else
    objc_msgSend(v4, "setRelativeTemperatureSetting:");

}

- (INCarSeat)climateZone
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  INCarSeat v7;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasClimateZone");
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "climateZone");
  if (v4 && (v6 - 1) <= 0x15)
    v7 = qword_18C311338[v6 - 1];
  else
    v7 = INCarSeatUnknown;

  return v7;
}

- (void)setClimateZone:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0xB)
    v3 = dword_18C311304[a3 - 1];
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)v3 == 0x7FFFFFFF)
    objc_msgSend(v4, "setHasClimateZone:", 0);
  else
    objc_msgSend(v4, "setClimateZone:", v3);

}

- (INSpeakableString)carName
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setCarName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCarName:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  INCarAirCirculationMode v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  INRelativeSetting v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  INRelativeSetting v22;
  __CFString *v23;
  __CFString *v24;
  INCarSeat v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[12];
  _QWORD v43[14];

  v43[12] = *MEMORY[0x1E0C80C00];
  v42[0] = CFSTR("enableFan");
  -[INSetClimateSettingsInCarIntent enableFan](self, "enableFan");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v3;
  v43[0] = v3;
  v42[1] = CFSTR("enableAirConditioner");
  -[INSetClimateSettingsInCarIntent enableAirConditioner](self, "enableAirConditioner");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v5;
  v43[1] = v5;
  v42[2] = CFSTR("enableClimateControl");
  -[INSetClimateSettingsInCarIntent enableClimateControl](self, "enableClimateControl");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v40 = v6;
  v34 = (void *)v7;
  v43[2] = v7;
  v42[3] = CFSTR("enableAutoMode");
  -[INSetClimateSettingsInCarIntent enableAutoMode](self, "enableAutoMode");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v9;
  v43[3] = v9;
  v42[4] = CFSTR("airCirculationMode");
  v11 = -[INSetClimateSettingsInCarIntent airCirculationMode](self, "airCirculationMode");
  v12 = CFSTR("unknown");
  if (v11 == INCarAirCirculationModeRecirculateAir)
    v12 = CFSTR("recirculateAir");
  if (v11 == INCarAirCirculationModeFreshAir)
    v12 = CFSTR("freshAir");
  v38 = v12;
  v43[4] = v38;
  v42[5] = CFSTR("fanSpeedIndex");
  -[INSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v39 = v8;
  v32 = (void *)v13;
  v43[5] = v13;
  v42[6] = CFSTR("fanSpeedPercentage");
  -[INSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v15;
  v43[6] = v15;
  v42[7] = CFSTR("relativeFanSpeedSetting");
  v17 = -[INSetClimateSettingsInCarIntent relativeFanSpeedSetting](self, "relativeFanSpeedSetting");
  v41 = v4;
  if ((unint64_t)(v17 - 1) > 3)
    v18 = CFSTR("unknown");
  else
    v18 = off_1E2291BA0[v17 - 1];
  v19 = v18;
  v43[7] = v19;
  v42[8] = CFSTR("temperature");
  -[INSetClimateSettingsInCarIntent temperature](self, "temperature");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[8] = v21;
  v42[9] = CFSTR("relativeTemperatureSetting");
  v22 = -[INSetClimateSettingsInCarIntent relativeTemperatureSetting](self, "relativeTemperatureSetting");
  if ((unint64_t)(v22 - 1) > 3)
    v23 = CFSTR("unknown");
  else
    v23 = off_1E2291BA0[v22 - 1];
  v24 = v23;
  v43[9] = v24;
  v42[10] = CFSTR("climateZone");
  v25 = -[INSetClimateSettingsInCarIntent climateZone](self, "climateZone");
  if ((unint64_t)(v25 - 1) > 0xB)
    v26 = CFSTR("unknown");
  else
    v26 = off_1E228B018[v25 - 1];
  v27 = v26;
  v43[10] = v27;
  v42[11] = CFSTR("carName");
  -[INSetClimateSettingsInCarIntent carName](self, "carName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[11] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 12);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28)

  if (!v20)
  if (!v16)

  if (!v14)
  if (!v10)

  if (!v39)
  if (!v40)

  if (!v41)
  return v37;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  -[INSetClimateSettingsInCarIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "fanSpeedIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedIntegerFromInteger(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFanSpeedIndex:", v10);

  objc_msgSend(v7, "fanSpeedPercentage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDoubleFromDouble(v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFanSpeedPercentage:", v12);

  objc_msgSend(v7, "temperature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedTemperatureFromTemperature(v13, a3, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTemperature:", v14);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("CarPlay");
}

- (id)verb
{
  return CFSTR("SetClimateSettingsInCar");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
