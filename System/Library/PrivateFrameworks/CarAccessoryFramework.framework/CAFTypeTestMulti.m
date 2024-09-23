@implementation CAFTypeTestMulti

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTestMulti;
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
  v6.super_class = (Class)CAFTypeTestMulti;
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
  v6.super_class = (Class)CAFTypeTestMulti;
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
  -[CAFTypeTestMulti userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
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

- (CAFStringCharacteristic)userVisibleLabelCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000001"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000001"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleLabel
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFBoolCharacteristic)testBoolCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000001"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000001"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFBoolCharacteristic *)v11;
}

- (BOOL)testBool
{
  void *v2;
  char v3;

  -[CAFTypeTestMulti testBoolCharacteristic](self, "testBoolCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTestBool:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testBoolCharacteristic](self, "testBoolCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:", v3);

}

- (BOOL)hasTestBool
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testBoolCharacteristic](self, "testBoolCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFUInt8Characteristic)testUInt8Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000002"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000002"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt8Characteristic *)v11;
}

- (unsigned)testUInt8
{
  void *v2;
  unsigned __int8 v3;

  -[CAFTypeTestMulti testUInt8Characteristic](self, "testUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint8Value");

  return v3;
}

- (void)setTestUInt8:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testUInt8Characteristic](self, "testUInt8Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint8Value:", v3);

}

- (CAFUInt8Range)testUInt8Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testUInt8Characteristic](self, "testUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasTestUInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testUInt8Characteristic](self, "testUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFUInt16Characteristic)testUInt16Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000003"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000003"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt16Characteristic *)v11;
}

- (unsigned)testUInt16
{
  void *v2;
  unsigned __int16 v3;

  -[CAFTypeTestMulti testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint16Value");

  return v3;
}

- (void)setTestUInt16:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testUInt16Characteristic](self, "testUInt16Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint16Value:", v3);

}

- (CAFUInt16Range)testUInt16Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt16Range *)v3;
}

- (BOOL)hasTestUInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFUInt32Characteristic)testUInt32Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000004"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000004"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt32Characteristic *)v11;
}

- (unsigned)testUInt32
{
  void *v2;
  unsigned int v3;

  -[CAFTypeTestMulti testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint32Value");

  return v3;
}

- (void)setTestUInt32:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CAFTypeTestMulti testUInt32Characteristic](self, "testUInt32Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint32Value:", v3);

}

- (CAFUInt32Range)testUInt32Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v3;
}

- (BOOL)hasTestUInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFUInt64Characteristic)testUInt64Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000005"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000005"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUInt64Characteristic *)v11;
}

- (unint64_t)testUInt64
{
  void *v2;
  unint64_t v3;

  -[CAFTypeTestMulti testUInt64Characteristic](self, "testUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint64Value");

  return v3;
}

- (void)setTestUInt64:(unint64_t)a3
{
  id v4;

  -[CAFTypeTestMulti testUInt64Characteristic](self, "testUInt64Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint64Value:", a3);

}

- (CAFUInt64Range)testUInt64Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testUInt64Characteristic](self, "testUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt64Range *)v3;
}

- (BOOL)hasTestUInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testUInt64Characteristic](self, "testUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFInt8Characteristic)testInt8Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000006"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000006"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFInt8Characteristic *)v11;
}

- (char)testInt8
{
  void *v2;
  char v3;

  -[CAFTypeTestMulti testInt8Characteristic](self, "testInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int8Value");

  return v3;
}

- (void)setTestInt8:(char)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testInt8Characteristic](self, "testInt8Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt8Value:", v3);

}

- (CAFInt8Range)testInt8Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testInt8Characteristic](self, "testInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt8Range *)v3;
}

- (BOOL)hasTestInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testInt8Characteristic](self, "testInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFInt16Characteristic)testInt16Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000007"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000007"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFInt16Characteristic *)v11;
}

- (signed)testInt16
{
  void *v2;
  signed __int16 v3;

  -[CAFTypeTestMulti testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int16Value");

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testInt16Characteristic](self, "testInt16Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt16Value:", v3);

}

- (CAFInt16Range)testInt16Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt16Range *)v3;
}

- (BOOL)hasTestInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFInt32Characteristic)testInt32Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000008"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000008"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFInt32Characteristic *)v11;
}

- (int)testInt32
{
  void *v2;
  int v3;

  -[CAFTypeTestMulti testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int32Value");

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CAFTypeTestMulti testInt32Characteristic](self, "testInt32Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt32Value:", v3);

}

- (CAFInt32Range)testInt32Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFInt64Characteristic)testInt64Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000009"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000009"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFInt64Characteristic *)v11;
}

- (int64_t)testInt64
{
  void *v2;
  int64_t v3;

  -[CAFTypeTestMulti testInt64Characteristic](self, "testInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int64Value");

  return v3;
}

- (void)setTestInt64:(int64_t)a3
{
  id v4;

  -[CAFTypeTestMulti testInt64Characteristic](self, "testInt64Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt64Value:", a3);

}

- (CAFInt64Range)testInt64Range
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testInt64Characteristic](self, "testInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt64Range *)v3;
}

- (BOOL)hasTestInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testInt64Characteristic](self, "testInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFFloatCharacteristic)testFloatCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000A"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000A"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFFloatCharacteristic *)v11;
}

- (float)testFloat
{
  void *v2;
  float v3;
  float v4;

  -[CAFTypeTestMulti testFloatCharacteristic](self, "testFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setTestFloat:(float)a3
{
  double v4;
  id v5;

  -[CAFTypeTestMulti testFloatCharacteristic](self, "testFloatCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloatValue:", v4);

}

- (CAFFloatRange)testFloatRange
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testFloatCharacteristic](self, "testFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v3;
}

- (BOOL)hasTestFloat
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testFloatCharacteristic](self, "testFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFStringCharacteristic)testStringCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000B"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000B"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)testString
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testStringCharacteristic](self, "testStringCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTestString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testStringCharacteristic](self, "testStringCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

- (BOOL)hasTestString
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testStringCharacteristic](self, "testStringCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)testDataCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000C"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000C"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFDataCharacteristic *)v11;
}

- (NSData)testData
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testDataCharacteristic](self, "testDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setTestData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testDataCharacteristic](self, "testDataCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataValue:", v4);

}

- (BOOL)hasTestData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testDataCharacteristic](self, "testDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)testRawDataCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000D"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000D"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFDataCharacteristic *)v11;
}

- (NSData)testRawData
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testRawDataCharacteristic](self, "testRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)hasTestRawData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testRawDataCharacteristic](self, "testRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFButtonActionCharacteristic)testEnumCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000E"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000E"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFButtonActionCharacteristic *)v11;
}

- (unsigned)testEnum
{
  void *v2;
  unsigned __int8 v3;

  -[CAFTypeTestMulti testEnumCharacteristic](self, "testEnumCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "buttonActionValue");

  return v3;
}

- (void)setTestEnum:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testEnumCharacteristic](self, "testEnumCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonActionValue:", v3);

}

- (BOOL)hasTestEnum
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testEnumCharacteristic](self, "testEnumCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFUnitTypeCharacteristic)testDimensionUnitRawValueCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000F"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00000F"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFUnitTypeCharacteristic *)v11;
}

- (unsigned)testDimensionUnitRawValue
{
  void *v2;
  unsigned __int16 v3;

  -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unitTypeValue");

  return v3;
}

- (void)setTestDimensionUnitRawValue:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnitTypeValue:", v3);

}

- (NSUnitSpeed)testDimensionUnit
{
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSUnitSpeed *)v5;
}

- (void)setTestDimensionUnit:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnitValue:", v4);

}

- (BOOL)hasTestDimensionUnitRawValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000010"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000010"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexItemCharacteristic *)v11;
}

- (CAFTestComplexItem)testComplexItem
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexItemValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemValue:", v4);

}

- (BOOL)hasTestComplexItem
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayBoolCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000011"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000011"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayBool
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayBool:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayBool
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt8Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000012"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000012"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt8
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayUInt8:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt16Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000013"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000013"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt16
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayUInt16:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt32Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000014"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000014"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt32
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayUInt32:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayUInt64Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000015"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000015"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayUInt64
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayUInt64:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt8Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000016"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000016"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt8
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayInt8:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt16Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000017"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000017"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt16
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayInt16:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt32Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000018"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000018"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt32
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayInt32:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayInt64Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000019"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000019"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayInt64
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayInt64:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayFloatCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001A"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00001A"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayFloat
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayFloat:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayFloat
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayStringCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001B"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00001B"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayString
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayString
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayDataCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001C"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00001C"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayData
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTestArrayData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFArrayCharacteristic)testArrayRawDataCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001D"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF00001D"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFArrayCharacteristic *)v11;
}

- (NSArray)testArrayRawData
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasTestArrayRawData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemsCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000020"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000020"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexItemsCharacteristic *)v11;
}

- (CAFTestComplexItems)testComplexItems
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexItemsValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemsValue:", v4);

}

- (BOOL)hasTestComplexItems
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemCharacteristic)testComplexItemValueCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000021"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000021"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexItemCharacteristic *)v11;
}

- (CAFTestComplexItem)testComplexItemValue
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexItemValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexItem *)v3;
}

- (void)setTestComplexItemValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemValue:", v4);

}

- (BOOL)hasTestComplexItemValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexItemsCharacteristic)testComplexItemListCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000022"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000022"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexItemsCharacteristic *)v11;
}

- (CAFTestComplexItems)testComplexItemList
{
  void *v2;
  void *v3;

  -[CAFTypeTestMulti testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexItemsValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItemList:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTestMulti testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemsValue:", v4);

}

- (BOOL)hasTestComplexItemList
{
  void *v2;
  BOOL v3;

  -[CAFTypeTestMulti testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x00000000FE000003");
}

+ (id)observerProtocol
{
  return &unk_256831868;
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
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  int v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  int v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  int v170;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  objc_super v175;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000030000001")) & 1) == 0)
  {

LABEL_6:
    objc_msgSend(v6, "characteristicType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", CFSTR("0x00000000FF000001")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testBoolCharacteristic](self, "testBoolCharacteristic");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "isEqual:", v19);

      if (v20)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestBool:", self, -[CAFTypeTestMulti testBool](self, "testBool"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqual:", CFSTR("0x00000000FF000002")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testUInt8Characteristic](self, "testUInt8Characteristic");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "isEqual:", v24);

      if (v25)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt8:", self, -[CAFTypeTestMulti testUInt8](self, "testUInt8"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqual:", CFSTR("0x00000000FF000003")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testUInt16Characteristic](self, "testUInt16Characteristic");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v27, "isEqual:", v29);

      if (v30)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt16:", self, -[CAFTypeTestMulti testUInt16](self, "testUInt16"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "isEqual:", CFSTR("0x00000000FF000004")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testUInt32Characteristic](self, "testUInt32Characteristic");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "uniqueIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v32, "isEqual:", v34);

      if (v35)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt32:", self, -[CAFTypeTestMulti testUInt32](self, "testUInt32"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v36, "isEqual:", CFSTR("0x00000000FF000005")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testUInt64Characteristic](self, "testUInt64Characteristic");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "uniqueIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "isEqual:", v39);

      if (v40)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestUInt64:", self, -[CAFTypeTestMulti testUInt64](self, "testUInt64"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqual:", CFSTR("0x00000000FF000006")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testInt8Characteristic](self, "testInt8Characteristic");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "uniqueIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v42, "isEqual:", v44);

      if (v45)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt8:", self, -[CAFTypeTestMulti testInt8](self, "testInt8"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v46, "isEqual:", CFSTR("0x00000000FF000007")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testInt16Characteristic](self, "testInt16Characteristic");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "uniqueIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v47, "isEqual:", v49);

      if (v50)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt16:", self, -[CAFTypeTestMulti testInt16](self, "testInt16"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v51, "isEqual:", CFSTR("0x00000000FF000008")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testInt32Characteristic](self, "testInt32Characteristic");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "uniqueIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v52, "isEqual:", v54);

      if (v55)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt32:", self, -[CAFTypeTestMulti testInt32](self, "testInt32"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v56, "isEqual:", CFSTR("0x00000000FF000009")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testInt64Characteristic](self, "testInt64Characteristic");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "uniqueIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v57, "isEqual:", v59);

      if (v60)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestInt64:", self, -[CAFTypeTestMulti testInt64](self, "testInt64"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v61, "isEqual:", CFSTR("0x00000000FF00000A")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testFloatCharacteristic](self, "testFloatCharacteristic");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "uniqueIdentifier");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v62, "isEqual:", v64);

      if (v65)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testFloat](self, "testFloat");
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestFloat:", self);
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v66, "isEqual:", CFSTR("0x00000000FF00000B")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testStringCharacteristic](self, "testStringCharacteristic");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "uniqueIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v67, "isEqual:", v69);

      if (v70)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testString](self, "testString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestString:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v71, "isEqual:", CFSTR("0x00000000FF00000C")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testDataCharacteristic](self, "testDataCharacteristic");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "uniqueIdentifier");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v72, "isEqual:", v74);

      if (v75)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testData](self, "testData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestData:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v76, "isEqual:", CFSTR("0x00000000FF00000D")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testRawDataCharacteristic](self, "testRawDataCharacteristic");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "uniqueIdentifier");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v77, "isEqual:", v79);

      if (v80)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testRawData](self, "testRawData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestRawData:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v81, "isEqual:", CFSTR("0x00000000FF00000E")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testEnumCharacteristic](self, "testEnumCharacteristic");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "uniqueIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v82, "isEqual:", v84);

      if (v85)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestEnum:", self, -[CAFTypeTestMulti testEnum](self, "testEnum"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v86, "isEqual:", CFSTR("0x00000000FF00000F")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "uniqueIdentifier");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v87, "isEqual:", v89);

      if (v90)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestDimensionUnitRawValue:", self, -[CAFTypeTestMulti testDimensionUnitRawValue](self, "testDimensionUnitRawValue"));
        goto LABEL_65;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v91, "isEqual:", CFSTR("0x00000000FF000010")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "uniqueIdentifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v92, "isEqual:", v94);

      if (v95)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testComplexItem](self, "testComplexItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestComplexItem:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v96, "isEqual:", CFSTR("0x00000000FF000011")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "uniqueIdentifier");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v97, "isEqual:", v99);

      if (v100)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayBool](self, "testArrayBool");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayBool:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v101, "isEqual:", CFSTR("0x00000000FF000012")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "uniqueIdentifier");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v102, "isEqual:", v104);

      if (v105)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayUInt8](self, "testArrayUInt8");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayUInt8:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v106, "isEqual:", CFSTR("0x00000000FF000013")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "uniqueIdentifier");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v107, "isEqual:", v109);

      if (v110)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayUInt16](self, "testArrayUInt16");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayUInt16:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v111, "isEqual:", CFSTR("0x00000000FF000014")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "uniqueIdentifier");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v112, "isEqual:", v114);

      if (v115)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayUInt32](self, "testArrayUInt32");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayUInt32:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v116, "isEqual:", CFSTR("0x00000000FF000015")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "uniqueIdentifier");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend(v117, "isEqual:", v119);

      if (v120)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayUInt64](self, "testArrayUInt64");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayUInt64:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v121, "isEqual:", CFSTR("0x00000000FF000016")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "uniqueIdentifier");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v122, "isEqual:", v124);

      if (v125)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayInt8](self, "testArrayInt8");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayInt8:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v126, "isEqual:", CFSTR("0x00000000FF000017")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "uniqueIdentifier");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = objc_msgSend(v127, "isEqual:", v129);

      if (v130)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayInt16](self, "testArrayInt16");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayInt16:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v131, "isEqual:", CFSTR("0x00000000FF000018")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "uniqueIdentifier");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v132, "isEqual:", v134);

      if (v135)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayInt32](self, "testArrayInt32");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayInt32:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v136, "isEqual:", CFSTR("0x00000000FF000019")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "uniqueIdentifier");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v137, "isEqual:", v139);

      if (v140)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayInt64](self, "testArrayInt64");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayInt64:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v141, "isEqual:", CFSTR("0x00000000FF00001A")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "uniqueIdentifier");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v142, "isEqual:", v144);

      if (v145)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayFloat](self, "testArrayFloat");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayFloat:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v146, "isEqual:", CFSTR("0x00000000FF00001B")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "uniqueIdentifier");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = objc_msgSend(v147, "isEqual:", v149);

      if (v150)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayString](self, "testArrayString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayString:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v151, "isEqual:", CFSTR("0x00000000FF00001C")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "uniqueIdentifier");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = objc_msgSend(v152, "isEqual:", v154);

      if (v155)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayData](self, "testArrayData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayData:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v156, "isEqual:", CFSTR("0x00000000FF00001D")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "uniqueIdentifier");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = objc_msgSend(v157, "isEqual:", v159);

      if (v160)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testArrayRawData](self, "testArrayRawData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestArrayRawData:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v161, "isEqual:", CFSTR("0x00000000FF000020")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "uniqueIdentifier");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = objc_msgSend(v162, "isEqual:", v164);

      if (v165)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testComplexItems](self, "testComplexItems");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestComplexItems:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v166, "isEqual:", CFSTR("0x00000000FF000021")) & 1) != 0)
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTestMulti testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "uniqueIdentifier");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = objc_msgSend(v167, "isEqual:", v169);

      if (v170)
      {
        -[CAFService observers](self, "observers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFTypeTestMulti testComplexItemValue](self, "testComplexItemValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeTestMultiService:didUpdateTestComplexItemValue:", self, v15);
        goto LABEL_4;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "characteristicType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "isEqual:", CFSTR("0x00000000FF000022")))
      goto LABEL_65;
    objc_msgSend(v6, "uniqueIdentifier");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTestMulti testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "uniqueIdentifier");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = objc_msgSend(v171, "isEqual:", v173);

    if (!v174)
      goto LABEL_66;
    -[CAFService observers](self, "observers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTestMulti testComplexItemList](self, "testComplexItemList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeTestMultiService:didUpdateTestComplexItemList:", self, v15);
    goto LABEL_4;
  }
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTypeTestMulti userVisibleLabelCharacteristic](self, "userVisibleLabelCharacteristic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (!v11)
    goto LABEL_6;
  -[CAFService observers](self, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTypeTestMulti userVisibleLabel](self, "userVisibleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "typeTestMultiService:didUpdateUserVisibleLabel:", self, v13);

  -[CAFService observers](self, "observers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTypeTestMulti name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "typeTestMultiService:didUpdateName:", self, v15);
LABEL_4:

LABEL_65:
LABEL_66:
  v175.receiver = self;
  v175.super_class = (Class)CAFTypeTestMulti;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v175, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (BOOL)registeredForUserVisibleLabel
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000001"));

  return v10;
}

- (BOOL)registeredForTestBool
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000001"));

  return v10;
}

- (BOOL)registeredForTestUInt8
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000002"));

  return v10;
}

- (BOOL)registeredForTestUInt16
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000003"));

  return v10;
}

- (BOOL)registeredForTestUInt32
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000004"));

  return v10;
}

- (BOOL)registeredForTestUInt64
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000005"));

  return v10;
}

- (BOOL)registeredForTestInt8
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000006"));

  return v10;
}

- (BOOL)registeredForTestInt16
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000007"));

  return v10;
}

- (BOOL)registeredForTestInt32
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000008"));

  return v10;
}

- (BOOL)registeredForTestInt64
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000009"));

  return v10;
}

- (BOOL)registeredForTestFloat
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000A"));

  return v10;
}

- (BOOL)registeredForTestString
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000B"));

  return v10;
}

- (BOOL)registeredForTestData
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000C"));

  return v10;
}

- (BOOL)registeredForTestRawData
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000D"));

  return v10;
}

- (BOOL)registeredForTestEnum
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000E"));

  return v10;
}

- (BOOL)registeredForTestDimensionUnit
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00000F"));

  return v10;
}

- (BOOL)registeredForTestComplexItem
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000010"));

  return v10;
}

- (BOOL)registeredForTestArrayBool
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000011"));

  return v10;
}

- (BOOL)registeredForTestArrayUInt8
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000012"));

  return v10;
}

- (BOOL)registeredForTestArrayUInt16
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000013"));

  return v10;
}

- (BOOL)registeredForTestArrayUInt32
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000014"));

  return v10;
}

- (BOOL)registeredForTestArrayUInt64
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000015"));

  return v10;
}

- (BOOL)registeredForTestArrayInt8
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000016"));

  return v10;
}

- (BOOL)registeredForTestArrayInt16
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000017"));

  return v10;
}

- (BOOL)registeredForTestArrayInt32
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000018"));

  return v10;
}

- (BOOL)registeredForTestArrayInt64
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000019"));

  return v10;
}

- (BOOL)registeredForTestArrayFloat
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001A"));

  return v10;
}

- (BOOL)registeredForTestArrayString
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001B"));

  return v10;
}

- (BOOL)registeredForTestArrayData
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001C"));

  return v10;
}

- (BOOL)registeredForTestArrayRawData
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF00001D"));

  return v10;
}

- (BOOL)registeredForTestComplexItems
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000020"));

  return v10;
}

- (BOOL)registeredForTestComplexItemValue
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000021"));

  return v10;
}

- (BOOL)registeredForTestComplexItemList
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000022"));

  return v10;
}

@end
