@implementation CAFDefrost

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDefrost;
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
  v6.super_class = (Class)CAFDefrost;
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
  v6.super_class = (Class)CAFDefrost;
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
  -[CAFDefrost vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
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

- (CAFDefrostTypesCharacteristic)typesCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000031000014"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000031000014"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFDefrostTypesCharacteristic *)v11;
}

- (unint64_t)types
{
  void *v2;
  unint64_t v3;

  -[CAFDefrost typesCharacteristic](self, "typesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defrostTypesValue");

  return v3;
}

- (BOOL)hasBlownAir
{
  void *v2;
  char v3;

  -[CAFDefrost typesCharacteristic](self, "typesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBlownAir");

  return v3;
}

- (BOOL)hasFilament
{
  void *v2;
  char v3;

  -[CAFDefrost typesCharacteristic](self, "typesCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasFilament");

  return v3;
}

- (CAFUInt8Characteristic)levelCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000004"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000004"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)level
{
  void *v2;
  unsigned __int8 v3;

  -[CAFDefrost levelCharacteristic](self, "levelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint8Value");

  return v3;
}

- (void)setLevel:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFDefrost levelCharacteristic](self, "levelCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint8Value:", v3);

}

- (CAFUInt8Range)levelRange
{
  void *v2;
  void *v3;

  -[CAFDefrost levelCharacteristic](self, "levelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt8Range *)v3;
}

- (BOOL)levelInvalid
{
  void *v2;
  char v3;

  -[CAFDefrost levelCharacteristic](self, "levelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalid");

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

  -[CAFDefrost vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000011000005");
}

+ (id)observerProtocol
{
  return &unk_25682BB28;
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
  int v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000031000014")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDefrost typesCharacteristic](self, "typesCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defrostService:didUpdateTypes:", self, -[CAFDefrost types](self, "types"));
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", CFSTR("0x0000000030000004")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDefrost levelCharacteristic](self, "levelCharacteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16);

    if (v17)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defrostService:didUpdateLevel:", self, -[CAFDefrost level](self, "level"));
      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x0000000036000065")))
    goto LABEL_12;
  objc_msgSend(v6, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFDefrost vehicleLayoutKeyCharacteristic](self, "vehicleLayoutKeyCharacteristic");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "isEqual:", v20);

  if (v21)
  {
    -[CAFService observers](self, "observers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDefrost vehicleLayoutKey](self, "vehicleLayoutKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defrostService:didUpdateVehicleLayoutKey:", self, v23);

    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFDefrost name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defrostService:didUpdateName:", self, v24);

    goto LABEL_12;
  }
LABEL_13:
  v25.receiver = self;
  v25.super_class = (Class)CAFDefrost;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v25, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForDefrostTypes
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000031000014"));

  return v10;
}

- (BOOL)registeredForLevel
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000004"));

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
