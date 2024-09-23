@implementation CAFSeatHeatingCooling

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatHeatingCooling;
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
  v6.super_class = (Class)CAFSeatHeatingCooling;
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
  v6.super_class = (Class)CAFSeatHeatingCooling;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[CAFService typeName](self, "typeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFSeatHeatingCooling vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("-%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }

  return v3;
}

- (CAFBoolCharacteristic)onCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000002"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000002"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)on
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:", v3);

}

- (BOOL)hasOn
{
  void *v2;
  BOOL v3;

  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)onDisabled
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (BOOL)onInvalid
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

  return v3;
}

- (BOOL)onRestricted
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  return v3;
}

- (CAFInt32Characteristic)heatingCoolingLevelCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000031000021"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000031000021"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFInt32Characteristic *)v11;
}

- (int)heatingCoolingLevel
{
  void *v2;
  int v3;

  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int32Value");

  return v3;
}

- (void)setHeatingCoolingLevel:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt32Value:", v3);

}

- (CAFInt32Range)heatingCoolingLevelRange
{
  void *v2;
  void *v3;

  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt32Range *)v3;
}

- (BOOL)heatingCoolingLevelDisabled
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (BOOL)heatingCoolingLevelInvalid
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

  return v3;
}

- (BOOL)heatingCoolingLevelRestricted
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRestricted");

  return v3;
}

- (CAFBoolCharacteristic)autoModeCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000005F"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x000000003000005F"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)autoMode
{
  void *v2;
  char v3;

  -[CAFSeatHeatingCooling autoModeCharacteristic](self, "autoModeCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)hasAutoMode
{
  void *v2;
  BOOL v3;

  -[CAFSeatHeatingCooling autoModeCharacteristic](self, "autoModeCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)vehicleLayoutKeyCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000065"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000036000065"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)vehicleLayoutKey
{
  void *v2;
  void *v3;

  -[CAFSeatHeatingCooling vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000022000001");
}

+ (id)observerProtocol
{
  return &unk_25682ECE0;
}

+ (id)indexBy
{
  return CFSTR("0x0000000036000065");
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000030000002")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFSeatHeatingCooling onCharacteristic](self, "onCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "heatingCoolingService:didUpdateOn:", self, -[CAFSeatHeatingCooling on](self, "on"));
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", CFSTR("0x0000000031000021")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFSeatHeatingCooling heatingCoolingLevelCharacteristic](self, "heatingCoolingLevelCharacteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16);

    if (v17)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "heatingCoolingService:didUpdateHeatingCoolingLevel:", self, -[CAFSeatHeatingCooling heatingCoolingLevel](self, "heatingCoolingLevel"));
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqual:", CFSTR("0x000000003000005F")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFSeatHeatingCooling autoModeCharacteristic](self, "autoModeCharacteristic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if (v22)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "heatingCoolingService:didUpdateAutoMode:", self, -[CAFSeatHeatingCooling autoMode](self, "autoMode"));
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x0000000036000065")))
    goto LABEL_16;
  objc_msgSend(v6, "uniqueIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFSeatHeatingCooling vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v23, "isEqual:", v25);

  if (v26)
  {
    -[CAFService observers](self, "observers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFSeatHeatingCooling vehicleLayoutKey](self, "vehicleLayoutKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heatingCoolingService:didUpdateVehicleLayoutKey:", self, v28);

    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFSeatHeatingCooling name](self, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heatingCoolingService:didUpdateName:", self, v29);

    goto LABEL_16;
  }
LABEL_17:
  v30.receiver = self;
  v30.super_class = (Class)CAFSeatHeatingCooling;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v30, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForOn
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000002"));

  return v10;
}

- (BOOL)registeredForHeatingCoolingLevel
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000031000021"));

  return v10;
}

- (BOOL)registeredForAutoMode
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x000000003000005F"));

  return v10;
}

- (BOOL)registeredForVehicleLayoutKey
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000036000065"));

  return v10;
}

@end
