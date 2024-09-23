@implementation CAFProtocolPerfTest

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFProtocolPerfTest;
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
  v6.super_class = (Class)CAFProtocolPerfTest;
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
  v6.super_class = (Class)CAFProtocolPerfTest;
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
  -[CAFProtocolPerfTest testStringCharacteristic](self, "testStringCharacteristic");
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

  -[CAFProtocolPerfTest testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int32Value");

  return v3;
}

- (CAFInt32Range)testInt32Range
{
  void *v2;
  void *v3;

  -[CAFProtocolPerfTest testInt32Characteristic](self, "testInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt32Range *)v3;
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

  -[CAFProtocolPerfTest testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "int16Value");

  return v3;
}

- (void)setTestInt16:(signed __int16)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CAFProtocolPerfTest testInt16Characteristic](self, "testInt16Characteristic");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInt16Value:", v3);

}

- (CAFInt16Range)testInt16Range
{
  void *v2;
  void *v3;

  -[CAFProtocolPerfTest testInt16Characteristic](self, "testInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFInt16Range *)v3;
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

  -[CAFProtocolPerfTest testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint32Value");

  return v3;
}

- (CAFUInt32Range)testUInt32Range
{
  void *v2;
  void *v3;

  -[CAFProtocolPerfTest testUInt32Characteristic](self, "testUInt32Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v3;
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

  -[CAFProtocolPerfTest testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "uint16Value");

  return v3;
}

- (CAFUInt16Range)testUInt16Range
{
  void *v2;
  void *v3;

  -[CAFProtocolPerfTest testUInt16Characteristic](self, "testUInt16Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt16Range *)v3;
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

  -[CAFProtocolPerfTest testStringCharacteristic](self, "testStringCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)testString2Characteristic
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
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000023"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x00000000FF000023"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)testString2
{
  void *v2;
  void *v3;

  -[CAFProtocolPerfTest testString2Characteristic](self, "testString2Characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTestString2:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFProtocolPerfTest testString2Characteristic](self, "testString2Characteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

+ (id)serviceIdentifier
{
  return CFSTR("0x00000000FE000006");
}

+ (id)observerProtocol
{
  return &unk_25682E010;
}

+ (id)indexBy
{
  return CFSTR("0x00000000FF00000B");
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
  void *v37;
  void *v38;
  int v39;
  objc_super v40;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x00000000FF000008")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testInt32Characteristic](self, "testInt32Characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestInt32:", self, -[CAFProtocolPerfTest testInt32](self, "testInt32"));
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", CFSTR("0x00000000FF000007")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testInt16Characteristic](self, "testInt16Characteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16);

    if (v17)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestInt16:", self, -[CAFProtocolPerfTest testInt16](self, "testInt16"));
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqual:", CFSTR("0x00000000FF000004")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testUInt32Characteristic](self, "testUInt32Characteristic");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:", v21);

    if (v22)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestUInt32:", self, -[CAFProtocolPerfTest testUInt32](self, "testUInt32"));
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "isEqual:", CFSTR("0x00000000FF000003")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testUInt16Characteristic](self, "testUInt16Characteristic");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "isEqual:", v26);

    if (v27)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolPerfTestService:didUpdateTestUInt16:", self, -[CAFProtocolPerfTest testUInt16](self, "testUInt16"));
      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "isEqual:", CFSTR("0x00000000FF00000B")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testStringCharacteristic](self, "testStringCharacteristic");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "isEqual:", v31);

    if (v32)
    {
      -[CAFService observers](self, "observers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFProtocolPerfTest testString](self, "testString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "protocolPerfTestService:didUpdateTestString:", self, v34);

      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFProtocolPerfTest name](self, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "protocolPerfTestService:didUpdateName:", self, v35);
LABEL_24:

      goto LABEL_25;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("0x00000000FF000023")))
    goto LABEL_25;
  objc_msgSend(v6, "uniqueIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFProtocolPerfTest testString2Characteristic](self, "testString2Characteristic");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "uniqueIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v36, "isEqual:", v38);

  if (v39)
  {
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFProtocolPerfTest testString2](self, "testString2");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocolPerfTestService:didUpdateTestString2:", self, v35);
    goto LABEL_24;
  }
LABEL_26:
  v40.receiver = self;
  v40.super_class = (Class)CAFProtocolPerfTest;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v40, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

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

- (BOOL)registeredForTestString2
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
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x00000000FF000023"));

  return v10;
}

@end
