@implementation CAFBatteryTemperature

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFBatteryTemperature;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFBatteryTemperature;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFBatteryTemperature;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFMeasurementCharacteristic)temperatureCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000001D"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000001D"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperature
{
  void *v2;
  void *v3;

  -[CAFBatteryTemperature temperatureCharacteristic](self, "temperatureCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFBatteryTemperature temperatureCharacteristic](self, "temperatureCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v4;
}

- (BOOL)temperatureInvalid
{
  void *v2;
  char v3;

  -[CAFBatteryTemperature temperatureCharacteristic](self, "temperatureCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

  return v3;
}

- (CAFTemperatureStateCharacteristic)temperatureStateCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000001E"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000001E"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTemperatureStateCharacteristic *)v11;
}

- (unsigned)temperatureState
{
  void *v2;
  unsigned __int8 v3;

  -[CAFBatteryTemperature temperatureStateCharacteristic](self, "temperatureStateCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "temperatureStateValue");

  return v3;
}

- (CAFMeasurementCharacteristic)temperatureMinCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000054"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000054"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMin
{
  void *v2;
  void *v3;

  -[CAFBatteryTemperature temperatureMinCharacteristic](self, "temperatureMinCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMinRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFBatteryTemperature temperatureMinCharacteristic](self, "temperatureMinCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v4;
}

- (CAFMeasurementCharacteristic)temperatureMaxCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000055"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000055"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMax
{
  void *v2;
  void *v3;

  -[CAFBatteryTemperature temperatureMaxCharacteristic](self, "temperatureMaxCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMaxRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFBatteryTemperature temperatureMaxCharacteristic](self, "temperatureMaxCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v4;
}

- (CAFMeasurementCharacteristic)temperatureMarkerColdCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000056"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000056"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMarkerCold
{
  void *v2;
  void *v3;

  -[CAFBatteryTemperature temperatureMarkerColdCharacteristic](self, "temperatureMarkerColdCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMarkerColdRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFBatteryTemperature temperatureMarkerColdCharacteristic](self, "temperatureMarkerColdCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v4;
}

- (BOOL)hasTemperatureMarkerCold
{
  void *v2;
  BOOL v3;

  -[CAFBatteryTemperature temperatureMarkerColdCharacteristic](self, "temperatureMarkerColdCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)temperatureMarkerHotCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000057"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000057"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)temperatureMarkerHot
{
  void *v2;
  void *v3;

  -[CAFBatteryTemperature temperatureMarkerHotCharacteristic](self, "temperatureMarkerHotCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFFloatRange)temperatureMarkerHotRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFBatteryTemperature temperatureMarkerHotCharacteristic](self, "temperatureMarkerHotCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v4;
}

- (BOOL)hasTemperatureMarkerHot
{
  void *v2;
  BOOL v3;

  -[CAFBatteryTemperature temperatureMarkerHotCharacteristic](self, "temperatureMarkerHotCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x000000001A000011");
}

+ (id)observerProtocol
{
  return &unk_25682FAA0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  objc_super v38;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x000000003000001D")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureCharacteristic](self, "temperatureCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFBatteryTemperature temperature](self, "temperature");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperature:", self, v13);
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", CFSTR("0x000000003000001E")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureStateCharacteristic](self, "temperatureStateCharacteristic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqual:", v17);

    if (v18)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureState:", self, -[CAFBatteryTemperature temperatureState](self, "temperatureState"));
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqual:", CFSTR("0x0000000030000054")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureMinCharacteristic](self, "temperatureMinCharacteristic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqual:", v22);

    if (v23)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFBatteryTemperature temperatureMin](self, "temperatureMin");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureMin:", self, v13);
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", CFSTR("0x0000000030000055")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureMaxCharacteristic](self, "temperatureMaxCharacteristic");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "isEqual:", v27);

    if (v28)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFBatteryTemperature temperatureMax](self, "temperatureMax");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureMax:", self, v13);
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqual:", CFSTR("0x0000000030000056")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureMarkerColdCharacteristic](self, "temperatureMarkerColdCharacteristic");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "isEqual:", v32);

    if (v33)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFBatteryTemperature temperatureMarkerCold](self, "temperatureMarkerCold");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureMarkerCold:", self, v13);
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x0000000030000057")))
  {
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v6, "uniqueIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFBatteryTemperature temperatureMarkerHotCharacteristic](self, "temperatureMarkerHotCharacteristic");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "uniqueIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v34, "isEqual:", v36);

  if (v37)
  {
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFBatteryTemperature temperatureMarkerHot](self, "temperatureMarkerHot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "batteryTemperatureService:didUpdateTemperatureMarkerHot:", self, v13);
    goto LABEL_24;
  }
LABEL_26:
  v38.receiver = self;
  v38.super_class = (Class)CAFBatteryTemperature;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v38, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForTemperature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000001D"));

  return v10;
}

- (BOOL)registeredForTemperatureState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000001E"));

  return v10;
}

- (BOOL)registeredForTemperatureMin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000054"));

  return v10;
}

- (BOOL)registeredForTemperatureMax
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000055"));

  return v10;
}

- (BOOL)registeredForTemperatureMarkerCold
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000056"));

  return v10;
}

- (BOOL)registeredForTemperatureMarkerHot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000057"));

  return v10;
}

@end
