@implementation CAFDisplayedSpeed

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDisplayedSpeed;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256828C08))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFDisplayedSpeed;
  -[CAFSpeedDisplay registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256828C08))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFDisplayedSpeed;
  -[CAFSpeedDisplay unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFMeasurementCharacteristic)speedMaxKMHCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000048"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000048"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedMaxKMH
{
  void *v2;
  void *v3;

  -[CAFDisplayedSpeed speedMaxKMHCharacteristic](self, "speedMaxKMHCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMaxKMHRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFDisplayedSpeed speedMaxKMHCharacteristic](self, "speedMaxKMHCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt32Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v4;
}

- (CAFMeasurementCharacteristic)speedMaxMPHCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000049"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000049"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)speedMaxMPH
{
  void *v2;
  void *v3;

  -[CAFDisplayedSpeed speedMaxMPHCharacteristic](self, "speedMaxMPHCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt32Range)speedMaxMPHRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFDisplayedSpeed speedMaxMPHCharacteristic](self, "speedMaxMPHCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt32Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v4;
}

- (CAFBoolCharacteristic)showSecondarySpeedCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000046000002"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000046000002"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)showSecondarySpeed
{
  void *v2;
  char v3;

  -[CAFDisplayedSpeed showSecondarySpeedCharacteristic](self, "showSecondarySpeedCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasShowSecondarySpeed
{
  void *v2;
  BOOL v3;

  -[CAFDisplayedSpeed showSecondarySpeedCharacteristic](self, "showSecondarySpeedCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x000000001A000009");
}

+ (id)observerProtocol
{
  return &unk_256830848;
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
  int v22;
  objc_super v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000030000048")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDisplayedSpeed speedMaxKMHCharacteristic](self, "speedMaxKMHCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFDisplayedSpeed speedMaxKMH](self, "speedMaxKMH");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayedSpeedService:didUpdateSpeedMaxKMH:", self, v13);
LABEL_8:

LABEL_13:
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", CFSTR("0x0000000030000049")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDisplayedSpeed speedMaxMPHCharacteristic](self, "speedMaxMPHCharacteristic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqual:", v17);

    if (v18)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFDisplayedSpeed speedMaxMPH](self, "speedMaxMPH");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayedSpeedService:didUpdateSpeedMaxMPH:", self, v13);
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x0000000046000002")))
    goto LABEL_13;
  objc_msgSend(v6, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFDisplayedSpeed showSecondarySpeedCharacteristic](self, "showSecondarySpeedCharacteristic");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "isEqual:", v21);

  if (v22)
  {
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayedSpeedService:didUpdateShowSecondarySpeed:", self, -[CAFDisplayedSpeed showSecondarySpeed](self, "showSecondarySpeed"));
    goto LABEL_13;
  }
LABEL_14:
  v23.receiver = self;
  v23.super_class = (Class)CAFDisplayedSpeed;
  -[CAFSpeedDisplay _characteristicDidUpdate:fromGroupUpdate:](&v23, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForSpeedMaxKMH
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000048"));

  return v10;
}

- (BOOL)registeredForSpeedMaxMPH
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000049"));

  return v10;
}

- (BOOL)registeredForShowSecondarySpeed
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000046000002"));

  return v10;
}

@end
