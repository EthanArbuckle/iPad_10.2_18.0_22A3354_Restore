@implementation CAFTypeTest

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTypeTest;
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
  v6.super_class = (Class)CAFTypeTest;
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
  v6.super_class = (Class)CAFTypeTest;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

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

  -[CAFTypeTest testBoolCharacteristic](self, "testBoolCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setTestBool:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testBoolCharacteristic](self, "testBoolCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:", v3);

}

- (BOOL)hasTestBool
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testBoolCharacteristic](self, "testBoolCharacteristic");
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

  -[CAFTypeTest testUInt8Characteristic](self, "testUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint8Value");

  return v3;
}

- (void)setTestUInt8:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testUInt8Characteristic](self, "testUInt8Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint8Value:", v3);

}

- (CAFUInt8Range)testUInt8Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testUInt8Characteristic](self, "testUInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt8Range *)v3;
}

- (BOOL)hasTestUInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testUInt8Characteristic](self, "testUInt8Characteristic");
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

  -[CAFTypeTest testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint16Value");

  return v3;
}

- (void)setTestUInt16:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testUInt16Characteristic](self, "testUInt16Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint16Value:", v3);

}

- (CAFUInt16Range)testUInt16Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt16Range *)v3;
}

- (BOOL)hasTestUInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testUInt16Characteristic](self, "testUInt16Characteristic");
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

  -[CAFTypeTest testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint32Value");

  return v3;
}

- (void)setTestUInt32:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CAFTypeTest testUInt32Characteristic](self, "testUInt32Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint32Value:", v3);

}

- (CAFUInt32Range)testUInt32Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v3;
}

- (BOOL)hasTestUInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testUInt32Characteristic](self, "testUInt32Characteristic");
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

  -[CAFTypeTest testUInt64Characteristic](self, "testUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint64Value");

  return v3;
}

- (void)setTestUInt64:(unint64_t)a3
{
  id v4;

  -[CAFTypeTest testUInt64Characteristic](self, "testUInt64Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUint64Value:", a3);

}

- (CAFUInt64Range)testUInt64Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testUInt64Characteristic](self, "testUInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt64Range *)v3;
}

- (BOOL)hasTestUInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testUInt64Characteristic](self, "testUInt64Characteristic");
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

  -[CAFTypeTest testInt8Characteristic](self, "testInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int8Value");

  return v3;
}

- (void)setTestInt8:(char)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testInt8Characteristic](self, "testInt8Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt8Value:", v3);

}

- (CAFInt8Range)testInt8Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testInt8Characteristic](self, "testInt8Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt8Range *)v3;
}

- (BOOL)hasTestInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testInt8Characteristic](self, "testInt8Characteristic");
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

  -[CAFTypeTest testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int16Value");

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testInt16Characteristic](self, "testInt16Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt16Value:", v3);

}

- (CAFInt16Range)testInt16Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt16Range *)v3;
}

- (BOOL)hasTestInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testInt16Characteristic](self, "testInt16Characteristic");
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

  -[CAFTypeTest testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int32Value");

  return v3;
}

- (void)setTestInt32:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CAFTypeTest testInt32Characteristic](self, "testInt32Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt32Value:", v3);

}

- (CAFInt32Range)testInt32Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt32Range *)v3;
}

- (BOOL)hasTestInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testInt32Characteristic](self, "testInt32Characteristic");
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

  -[CAFTypeTest testInt64Characteristic](self, "testInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int64Value");

  return v3;
}

- (void)setTestInt64:(int64_t)a3
{
  id v4;

  -[CAFTypeTest testInt64Characteristic](self, "testInt64Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt64Value:", a3);

}

- (CAFInt64Range)testInt64Range
{
  void *v2;
  void *v3;

  -[CAFTypeTest testInt64Characteristic](self, "testInt64Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt64Range *)v3;
}

- (BOOL)hasTestInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testInt64Characteristic](self, "testInt64Characteristic");
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

  -[CAFTypeTest testFloatCharacteristic](self, "testFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setTestFloat:(float)a3
{
  double v4;
  id v5;

  -[CAFTypeTest testFloatCharacteristic](self, "testFloatCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloatValue:", v4);

}

- (CAFFloatRange)testFloatRange
{
  void *v2;
  void *v3;

  -[CAFTypeTest testFloatCharacteristic](self, "testFloatCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFFloatRange *)v3;
}

- (BOOL)hasTestFloat
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testFloatCharacteristic](self, "testFloatCharacteristic");
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

  -[CAFTypeTest testStringCharacteristic](self, "testStringCharacteristic");
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
  -[CAFTypeTest testStringCharacteristic](self, "testStringCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

- (BOOL)hasTestString
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testStringCharacteristic](self, "testStringCharacteristic");
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

  -[CAFTypeTest testDataCharacteristic](self, "testDataCharacteristic");
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
  -[CAFTypeTest testDataCharacteristic](self, "testDataCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataValue:", v4);

}

- (BOOL)hasTestData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testDataCharacteristic](self, "testDataCharacteristic");
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

  -[CAFTypeTest testRawDataCharacteristic](self, "testRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)hasTestRawData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testRawDataCharacteristic](self, "testRawDataCharacteristic");
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

  -[CAFTypeTest testEnumCharacteristic](self, "testEnumCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "buttonActionValue");

  return v3;
}

- (void)setTestEnum:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testEnumCharacteristic](self, "testEnumCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonActionValue:", v3);

}

- (BOOL)hasTestEnum
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testEnumCharacteristic](self, "testEnumCharacteristic");
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

  -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unitTypeValue");

  return v3;
}

- (void)setTestDimensionUnitRawValue:(unsigned __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnitTypeValue:", v3);

}

- (NSUnitSpeed)testDimensionUnit
{
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
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
  -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnitValue:", v4);

}

- (BOOL)hasTestDimensionUnitRawValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
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

  -[CAFTypeTest testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
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
  -[CAFTypeTest testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemValue:", v4);

}

- (BOOL)hasTestComplexItem
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
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

  -[CAFTypeTest testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
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
  -[CAFTypeTest testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayBool
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
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

  -[CAFTypeTest testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
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
  -[CAFTypeTest testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
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

  -[CAFTypeTest testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
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
  -[CAFTypeTest testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
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

  -[CAFTypeTest testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
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
  -[CAFTypeTest testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
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

  -[CAFTypeTest testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
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
  -[CAFTypeTest testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayUInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
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

  -[CAFTypeTest testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
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
  -[CAFTypeTest testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt8
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
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

  -[CAFTypeTest testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
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
  -[CAFTypeTest testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt16
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
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

  -[CAFTypeTest testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
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
  -[CAFTypeTest testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt32
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
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

  -[CAFTypeTest testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
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
  -[CAFTypeTest testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayInt64
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
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

  -[CAFTypeTest testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
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
  -[CAFTypeTest testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayFloat
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
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

  -[CAFTypeTest testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
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
  -[CAFTypeTest testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayString
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
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

  -[CAFTypeTest testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
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
  -[CAFTypeTest testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrayValue:", v4);

}

- (BOOL)hasTestArrayData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
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

  -[CAFTypeTest testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)hasTestArrayRawData
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
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

  -[CAFTypeTest testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
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
  -[CAFTypeTest testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemsValue:", v4);

}

- (BOOL)hasTestComplexItems
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
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

  -[CAFTypeTest testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
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
  -[CAFTypeTest testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemValue:", v4);

}

- (BOOL)hasTestComplexItemValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
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

  -[CAFTypeTest testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
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
  -[CAFTypeTest testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexItemsValue:", v4);

}

- (BOOL)hasTestComplexItemList
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexArrayItemCharacteristic)testComplexArrayItemValueCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000024"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000024"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexArrayItemCharacteristic *)v11;
}

- (CAFTestComplexArrayItem)testComplexArrayItemValue
{
  void *v2;
  void *v3;

  -[CAFTypeTest testComplexArrayItemValueCharacteristic](self, "testComplexArrayItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexArrayItemValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexArrayItem *)v3;
}

- (void)setTestComplexArrayItemValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTest testComplexArrayItemValueCharacteristic](self, "testComplexArrayItemValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexArrayItemValue:", v4);

}

- (BOOL)hasTestComplexArrayItemValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexArrayItemValueCharacteristic](self, "testComplexArrayItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexNestedItemCharacteristic)testComplexNestedItemValueCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000025"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000025"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexNestedItemCharacteristic *)v11;
}

- (CAFTestComplexNestedItem)testComplexNestedItemValue
{
  void *v2;
  void *v3;

  -[CAFTypeTest testComplexNestedItemValueCharacteristic](self, "testComplexNestedItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexNestedItemValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexNestedItem *)v3;
}

- (void)setTestComplexNestedItemValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTest testComplexNestedItemValueCharacteristic](self, "testComplexNestedItemValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexNestedItemValue:", v4);

}

- (BOOL)hasTestComplexNestedItemValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexNestedItemValueCharacteristic](self, "testComplexNestedItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexNestedItemsCharacteristic)testComplexNestedItemListCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000026"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000026"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexNestedItemsCharacteristic *)v11;
}

- (CAFTestComplexNestedItems)testComplexNestedItemList
{
  void *v2;
  void *v3;

  -[CAFTypeTest testComplexNestedItemListCharacteristic](self, "testComplexNestedItemListCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexNestedItemsValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexNestedItems *)v3;
}

- (void)setTestComplexNestedItemList:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTest testComplexNestedItemListCharacteristic](self, "testComplexNestedItemListCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexNestedItemsValue:", v4);

}

- (BOOL)hasTestComplexNestedItemList
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexNestedItemListCharacteristic](self, "testComplexNestedItemListCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFTestComplexNestedListItemCharacteristic)testComplexNestedListItemValueCharacteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000027"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000027"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFTestComplexNestedListItemCharacteristic *)v11;
}

- (CAFTestComplexNestedListItem)testComplexNestedListItemValue
{
  void *v2;
  void *v3;

  -[CAFTypeTest testComplexNestedListItemValueCharacteristic](self, "testComplexNestedListItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testComplexNestedListItemValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexNestedListItem *)v3;
}

- (void)setTestComplexNestedListItemValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFTypeTest testComplexNestedListItemValueCharacteristic](self, "testComplexNestedListItemValueCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTestComplexNestedListItemValue:", v4);

}

- (BOOL)hasTestComplexNestedListItemValue
{
  void *v2;
  BOOL v3;

  -[CAFTypeTest testComplexNestedListItemValueCharacteristic](self, "testComplexNestedListItemValueCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x00000000FE000001");
}

+ (id)observerProtocol
{
  return &unk_25682E6E0;
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
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  int v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  int v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  void *v184;
  void *v185;
  void *v186;
  int v187;
  objc_super v188;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x00000000FF000001")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testBoolCharacteristic](self, "testBoolCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestBool:", self, -[CAFTypeTest testBool](self, "testBool"));
LABEL_145:

      goto LABEL_146;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", CFSTR("0x00000000FF000002")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testUInt8Characteristic](self, "testUInt8Characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16);

    if (v17)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestUInt8:", self, -[CAFTypeTest testUInt8](self, "testUInt8"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqual:", CFSTR("0x00000000FF000003")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testUInt16Characteristic](self, "testUInt16Characteristic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if (v22)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestUInt16:", self, -[CAFTypeTest testUInt16](self, "testUInt16"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqual:", CFSTR("0x00000000FF000004")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testUInt32Characteristic](self, "testUInt32Characteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "isEqual:", v26);

    if (v27)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestUInt32:", self, -[CAFTypeTest testUInt32](self, "testUInt32"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isEqual:", CFSTR("0x00000000FF000005")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testUInt64Characteristic](self, "testUInt64Characteristic");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "isEqual:", v31);

    if (v32)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestUInt64:", self, -[CAFTypeTest testUInt64](self, "testUInt64"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v33, "isEqual:", CFSTR("0x00000000FF000006")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testInt8Characteristic](self, "testInt8Characteristic");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "uniqueIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "isEqual:", v36);

    if (v37)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestInt8:", self, -[CAFTypeTest testInt8](self, "testInt8"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "isEqual:", CFSTR("0x00000000FF000007")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testInt16Characteristic](self, "testInt16Characteristic");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "uniqueIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v39, "isEqual:", v41);

    if (v42)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestInt16:", self, -[CAFTypeTest testInt16](self, "testInt16"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v43, "isEqual:", CFSTR("0x00000000FF000008")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testInt32Characteristic](self, "testInt32Characteristic");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "uniqueIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v44, "isEqual:", v46);

    if (v47)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestInt32:", self, -[CAFTypeTest testInt32](self, "testInt32"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v48, "isEqual:", CFSTR("0x00000000FF000009")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testInt64Characteristic](self, "testInt64Characteristic");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "uniqueIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v49, "isEqual:", v51);

    if (v52)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestInt64:", self, -[CAFTypeTest testInt64](self, "testInt64"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v53, "isEqual:", CFSTR("0x00000000FF00000A")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testFloatCharacteristic](self, "testFloatCharacteristic");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "uniqueIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v54, "isEqual:", v56);

    if (v57)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testFloat](self, "testFloat");
      objc_msgSend(v12, "typeTestService:didUpdateTestFloat:", self);
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v58, "isEqual:", CFSTR("0x00000000FF00000B")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testStringCharacteristic](self, "testStringCharacteristic");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "uniqueIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v59, "isEqual:", v61);

    if (v62)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testString](self, "testString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestString:", self, v63);
LABEL_144:

      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v64, "isEqual:", CFSTR("0x00000000FF00000C")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testDataCharacteristic](self, "testDataCharacteristic");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "uniqueIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v65, "isEqual:", v67);

    if (v68)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testData](self, "testData");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestData:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v69, "isEqual:", CFSTR("0x00000000FF00000D")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testRawDataCharacteristic](self, "testRawDataCharacteristic");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "uniqueIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v70, "isEqual:", v72);

    if (v73)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testRawData](self, "testRawData");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestRawData:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v74, "isEqual:", CFSTR("0x00000000FF00000E")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testEnumCharacteristic](self, "testEnumCharacteristic");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "uniqueIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v75, "isEqual:", v77);

    if (v78)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestEnum:", self, -[CAFTypeTest testEnum](self, "testEnum"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v79, "isEqual:", CFSTR("0x00000000FF00000F")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testDimensionUnitRawValueCharacteristic](self, "testDimensionUnitRawValueCharacteristic");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "uniqueIdentifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v80, "isEqual:", v82);

    if (v83)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestDimensionUnitRawValue:", self, -[CAFTypeTest testDimensionUnitRawValue](self, "testDimensionUnitRawValue"));
      goto LABEL_145;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v84, "isEqual:", CFSTR("0x00000000FF000010")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexItemCharacteristic](self, "testComplexItemCharacteristic");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "uniqueIdentifier");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v85, "isEqual:", v87);

    if (v88)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexItem](self, "testComplexItem");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexItem:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v89, "isEqual:", CFSTR("0x00000000FF000011")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayBoolCharacteristic](self, "testArrayBoolCharacteristic");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "uniqueIdentifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v90, "isEqual:", v92);

    if (v93)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayBool](self, "testArrayBool");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayBool:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v94, "isEqual:", CFSTR("0x00000000FF000012")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayUInt8Characteristic](self, "testArrayUInt8Characteristic");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "uniqueIdentifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v95, "isEqual:", v97);

    if (v98)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayUInt8](self, "testArrayUInt8");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayUInt8:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v99, "isEqual:", CFSTR("0x00000000FF000013")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayUInt16Characteristic](self, "testArrayUInt16Characteristic");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "uniqueIdentifier");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v100, "isEqual:", v102);

    if (v103)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayUInt16](self, "testArrayUInt16");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayUInt16:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v104, "isEqual:", CFSTR("0x00000000FF000014")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayUInt32Characteristic](self, "testArrayUInt32Characteristic");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "uniqueIdentifier");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v105, "isEqual:", v107);

    if (v108)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayUInt32](self, "testArrayUInt32");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayUInt32:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v109, "isEqual:", CFSTR("0x00000000FF000015")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayUInt64Characteristic](self, "testArrayUInt64Characteristic");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "uniqueIdentifier");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v110, "isEqual:", v112);

    if (v113)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayUInt64](self, "testArrayUInt64");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayUInt64:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v114, "isEqual:", CFSTR("0x00000000FF000016")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayInt8Characteristic](self, "testArrayInt8Characteristic");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "uniqueIdentifier");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v115, "isEqual:", v117);

    if (v118)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayInt8](self, "testArrayInt8");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayInt8:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v119, "isEqual:", CFSTR("0x00000000FF000017")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayInt16Characteristic](self, "testArrayInt16Characteristic");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "uniqueIdentifier");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v120, "isEqual:", v122);

    if (v123)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayInt16](self, "testArrayInt16");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayInt16:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v124, "isEqual:", CFSTR("0x00000000FF000018")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayInt32Characteristic](self, "testArrayInt32Characteristic");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "uniqueIdentifier");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v125, "isEqual:", v127);

    if (v128)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayInt32](self, "testArrayInt32");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayInt32:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v129, "isEqual:", CFSTR("0x00000000FF000019")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayInt64Characteristic](self, "testArrayInt64Characteristic");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "uniqueIdentifier");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v130, "isEqual:", v132);

    if (v133)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayInt64](self, "testArrayInt64");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayInt64:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v134, "isEqual:", CFSTR("0x00000000FF00001A")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayFloatCharacteristic](self, "testArrayFloatCharacteristic");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "uniqueIdentifier");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v135, "isEqual:", v137);

    if (v138)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayFloat](self, "testArrayFloat");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayFloat:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v139, "isEqual:", CFSTR("0x00000000FF00001B")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayStringCharacteristic](self, "testArrayStringCharacteristic");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "uniqueIdentifier");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v140, "isEqual:", v142);

    if (v143)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayString](self, "testArrayString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayString:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v144, "isEqual:", CFSTR("0x00000000FF00001C")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayDataCharacteristic](self, "testArrayDataCharacteristic");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "uniqueIdentifier");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = objc_msgSend(v145, "isEqual:", v147);

    if (v148)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayData](self, "testArrayData");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayData:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v149, "isEqual:", CFSTR("0x00000000FF00001D")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testArrayRawDataCharacteristic](self, "testArrayRawDataCharacteristic");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "uniqueIdentifier");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v150, "isEqual:", v152);

    if (v153)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testArrayRawData](self, "testArrayRawData");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestArrayRawData:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v154, "isEqual:", CFSTR("0x00000000FF000020")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexItemsCharacteristic](self, "testComplexItemsCharacteristic");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "uniqueIdentifier");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = objc_msgSend(v155, "isEqual:", v157);

    if (v158)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexItems](self, "testComplexItems");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexItems:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v159, "isEqual:", CFSTR("0x00000000FF000021")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexItemValueCharacteristic](self, "testComplexItemValueCharacteristic");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "uniqueIdentifier");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = objc_msgSend(v160, "isEqual:", v162);

    if (v163)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexItemValue](self, "testComplexItemValue");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexItemValue:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v164, "isEqual:", CFSTR("0x00000000FF000022")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexItemListCharacteristic](self, "testComplexItemListCharacteristic");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "uniqueIdentifier");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend(v165, "isEqual:", v167);

    if (v168)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexItemList](self, "testComplexItemList");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexItemList:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v169, "isEqual:", CFSTR("0x00000000FF000024")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexArrayItemValueCharacteristic](self, "testComplexArrayItemValueCharacteristic");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "uniqueIdentifier");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = objc_msgSend(v170, "isEqual:", v172);

    if (v173)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexArrayItemValue](self, "testComplexArrayItemValue");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexArrayItemValue:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v174, "isEqual:", CFSTR("0x00000000FF000025")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexNestedItemValueCharacteristic](self, "testComplexNestedItemValueCharacteristic");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "uniqueIdentifier");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(v175, "isEqual:", v177);

    if (v178)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexNestedItemValue](self, "testComplexNestedItemValue");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexNestedItemValue:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v179, "isEqual:", CFSTR("0x00000000FF000026")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexNestedItemListCharacteristic](self, "testComplexNestedItemListCharacteristic");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "uniqueIdentifier");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = objc_msgSend(v180, "isEqual:", v182);

    if (v183)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFTypeTest testComplexNestedItemList](self, "testComplexNestedItemList");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "typeTestService:didUpdateTestComplexNestedItemList:", self, v63);
      goto LABEL_144;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x00000000FF000027")))
    goto LABEL_145;
  objc_msgSend(v6, "uniqueIdentifier");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFTypeTest testComplexNestedListItemValueCharacteristic](self, "testComplexNestedListItemValueCharacteristic");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "uniqueIdentifier");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v184, "isEqual:", v186);

  if (v187)
  {
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFTypeTest testComplexNestedListItemValue](self, "testComplexNestedListItemValue");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typeTestService:didUpdateTestComplexNestedListItemValue:", self, v63);
    goto LABEL_144;
  }
LABEL_146:
  v188.receiver = self;
  v188.super_class = (Class)CAFTypeTest;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v188, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

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

- (BOOL)registeredForTestComplexArrayItemValue
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000024"));

  return v10;
}

- (BOOL)registeredForTestComplexNestedItemValue
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000025"));

  return v10;
}

- (BOOL)registeredForTestComplexNestedItemList
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000026"));

  return v10;
}

- (BOOL)registeredForTestComplexNestedListItemValue
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000027"));

  return v10;
}

@end
