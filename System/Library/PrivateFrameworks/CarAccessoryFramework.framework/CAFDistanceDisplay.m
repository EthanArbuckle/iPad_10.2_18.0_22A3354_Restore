@implementation CAFDistanceDisplay

+ (void)load
{
  uint64_t v3;
  objc_super v4;

  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___CAFDistanceDisplay;
    objc_msgSendSuper2(&v4, sel_load);
  }
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
  v6.super_class = (Class)CAFDistanceDisplay;
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
  v6.super_class = (Class)CAFDistanceDisplay;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFMeasurementCharacteristic)distanceKMCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000004A"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000004A"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)distanceKM
{
  void *v2;
  void *v3;

  -[CAFDistanceDisplay distanceKMCharacteristic](self, "distanceKMCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)distanceKMRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFDistanceDisplay distanceKMCharacteristic](self, "distanceKMCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt64Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt64Range *)v4;
}

- (BOOL)distanceKMInvalid
{
  void *v2;
  char v3;

  -[CAFDistanceDisplay distanceKMCharacteristic](self, "distanceKMCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

  return v3;
}

- (CAFMeasurementCharacteristic)distanceMilesCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000004B"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000004B"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)distanceMiles
{
  void *v2;
  void *v3;

  -[CAFDistanceDisplay distanceMilesCharacteristic](self, "distanceMilesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt64Range)distanceMilesRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFDistanceDisplay distanceMilesCharacteristic](self, "distanceMilesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt64Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt64Range *)v4;
}

- (BOOL)distanceMilesInvalid
{
  void *v2;
  char v3;

  -[CAFDistanceDisplay distanceMilesCharacteristic](self, "distanceMilesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

  return v3;
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
  int v17;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x000000003000004A")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDistanceDisplay distanceKMCharacteristic](self, "distanceKMCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFDistanceDisplay distanceKM](self, "distanceKM");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "distanceDisplayService:didUpdateDistanceKM:", self, v13);
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x000000003000004B")))
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v6, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFDistanceDisplay distanceMilesCharacteristic](self, "distanceMilesCharacteristic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isEqual:", v16);

  if (v17)
  {
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDistanceDisplay distanceMiles](self, "distanceMiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "distanceDisplayService:didUpdateDistanceMiles:", self, v13);
    goto LABEL_8;
  }
LABEL_10:
  v18.receiver = self;
  v18.super_class = (Class)CAFDistanceDisplay;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v18, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForDistanceKM
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000004A"));

  return v10;
}

- (BOOL)registeredForDistanceMiles
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000004B"));

  return v10;
}

@end
