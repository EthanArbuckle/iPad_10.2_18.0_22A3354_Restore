@implementation ACCiAP2ShimAccessory

- (ACCiAP2ShimAccessory)initWithUID:(id)a3 keyTag:(id)a4 features:(unsigned int)a5
{
  id v9;
  id v10;
  ACCiAP2ShimAccessory *v11;
  int v12;
  NSString *name;
  NSString *model;
  NSString *manufacturer;
  NSString *serialNumber;
  NSString *firmwareVersion;
  NSString *hardwareVersion;
  id context;
  uint64_t v20;
  NSString *keyAccessoryUID;
  uint64_t v22;
  NSString *keyConnectionID;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ACCiAP2ShimAccessory;
  v11 = -[ACCiAP2ShimAccessory init](&v25, sel_init);
  if (v11)
  {
    if (_Generate32BitConnectionID_onceToken != -1)
      dispatch_once(&_Generate32BitConnectionID_onceToken, &__block_literal_global_2);
    if (((_Generate32BitConnectionID_connectionID + 1) & 0xFFFFFF) != 0)
      v12 = _Generate32BitConnectionID_connectionID + 1;
    else
      v12 = _Generate32BitConnectionID_connectionID + 2;
    _Generate32BitConnectionID_connectionID = v12 & 0xFFFFFF | 0x2000000;
    v11->_connectionID = _Generate32BitConnectionID_connectionID;
    objc_storeStrong((id *)&v11->_accessoryUID, a3);
    objc_storeStrong((id *)&v11->_keyTag, a4);
    name = v11->_name;
    v11->_name = (NSString *)CFSTR("TEST_NAME");

    model = v11->_model;
    v11->_model = (NSString *)CFSTR("TEST_MODEL");

    manufacturer = v11->_manufacturer;
    v11->_manufacturer = (NSString *)CFSTR("TEST_MANUFACTURER");

    serialNumber = v11->_serialNumber;
    v11->_serialNumber = (NSString *)CFSTR("TEST_SER_NUM");

    firmwareVersion = v11->_firmwareVersion;
    v11->_firmwareVersion = (NSString *)CFSTR("0.0.0");

    hardwareVersion = v11->_hardwareVersion;
    v11->_hardwareVersion = (NSString *)CFSTR("0.0.0");

    v11->_featureTypeMask = a5;
    v11->_dontPublish = 0;
    context = v11->_context;
    v11->_context = 0;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v11->_keyTag, v11->_accessoryUID);
    v20 = objc_claimAutoreleasedReturnValue();
    keyAccessoryUID = v11->_keyAccessoryUID;
    v11->_keyAccessoryUID = (NSString *)v20;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%u"), v11->_keyTag, v11->_connectionID);
    v22 = objc_claimAutoreleasedReturnValue();
    keyConnectionID = v11->_keyConnectionID;
    v11->_keyConnectionID = (NSString *)v22;

  }
  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCiAP2ShimAccessory>[_connectionID=%u _accessoryUID=%@ _keyTag=%@ _featureTypeMask=%xh _dontPublish=%d _name='%@']"), self->_connectionID, self->_accessoryUID, self->_keyTag, self->_featureTypeMask, self->_dontPublish, self->_name);
}

- (void)setConnectionID:(unsigned int)a3
{
  NSString *v4;
  NSString *keyConnectionID;

  self->_connectionID = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%lu"), self->_keyTag, *(_QWORD *)&a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyConnectionID = self->_keyConnectionID;
  self->_keyConnectionID = v4;

}

- (id)accessoryInfoDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_connectionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BE4F920]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BE4F908]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_manufacturer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x24BE4F8F8]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_model);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x24BE4F900]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_serialNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x24BE4F918]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_firmwareVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BE4F8E8]);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_hardwareVersion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x24BE4F8F0]);

  objc_msgSend(v3, "setObject:forKey:", self->_accessoryUID, CFSTR("IAPAppAccessoryUIDKey"));
  v11 = 0;
  v12 = 0;
  while (((self->_featureTypeMask >> v11) & 1) == 0)
  {
LABEL_11:
    if (++v11 == 25)
      goto LABEL_12;
  }
  switch(v11)
  {
    case 3:
LABEL_7:
      v12 = v12 | 2;
      goto LABEL_11;
    case 4:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("IAPAppBTPairingIsSupportedKey"));

      goto LABEL_11;
    case 5:
      v12 = v12 | 0x800;
      goto LABEL_11;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_11;
    case 12:
      v12 = v12 | 8;
      goto LABEL_11;
    default:
      switch(v11)
      {
        case 15:
          v12 = v12 | 0x2000;
          goto LABEL_11;
        case 21:
          goto LABEL_7;
        case 23:
          v12 = v12 | 0x80000;
          goto LABEL_11;
        case 24:
          v12 = v12 | 0x100000;
          break;
        default:
          goto LABEL_11;
      }
      break;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x24BE4F8D8]);

  return v3;
}

- (id)connectionIDObj
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_connectionID);
}

- (void)addFeature:(int)a3
{
  self->_featureTypeMask |= 1 << a3;
}

- (void)removeFeature:(int)a3
{
  self->_featureTypeMask &= ~(1 << a3);
}

- (NSString)keyTag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)keyAccessoryUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)keyConnectionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (unsigned)featureTypeMask
{
  return self->_featureTypeMask;
}

- (NSString)accessoryUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)context
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)dontPublish
{
  return self->_dontPublish;
}

- (void)setDontPublish:(BOOL)a3
{
  self->_dontPublish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_storeStrong((id *)&self->_keyConnectionID, 0);
  objc_storeStrong((id *)&self->_keyAccessoryUID, 0);
  objc_storeStrong((id *)&self->_keyTag, 0);
}

@end
