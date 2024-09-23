@implementation UARPAccessoryID

- (BOOL)analyticsIsEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[UARPAccessoryID modelNumber](self, "modelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[UARPAccessoryID serialNumber](self, "serialNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAccessoryID)initWithoutUUID
{
  UARPAccessoryID *v2;
  NSUUID *v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UARPAccessoryID;
  v2 = -[UARPAccessoryID init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    v2->_uarpVersion = 0;
    -[UARPAccessoryID initCountryCode](v2, "initCountryCode");
  }
  return v2;
}

- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UARPAccessoryID *v14;
  uint64_t v15;
  NSString *manufacturer;
  uint64_t v17;
  NSString *modelName;
  uint64_t v19;
  NSString *serialNumber;
  uint64_t v21;
  NSString *firmwareVersion;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[UARPAccessoryID initWithoutUUID](self, "initWithoutUUID");
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    manufacturer = v14->_manufacturer;
    v14->_manufacturer = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    modelName = v14->_modelName;
    v14->_modelName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    serialNumber = v14->_serialNumber;
    v14->_serialNumber = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    firmwareVersion = v14->_firmwareVersion;
    v14->_firmwareVersion = (NSString *)v21;

  }
  return v14;
}

- (UARPAccessoryID)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8
{
  id v14;
  id v15;
  UARPAccessoryID *v16;
  uint64_t v17;
  NSString *productGroup;
  uint64_t v19;
  NSString *productNumber;

  v14 = a7;
  v15 = a8;
  v16 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:](self, "initWithManufacturer:modelName:serialNumber:firmwareVersion:", a3, a4, a5, a6);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    productGroup = v16->_productGroup;
    v16->_productGroup = (NSString *)v17;

    v19 = objc_msgSend(v15, "copy");
    productNumber = v16->_productNumber;
    v16->_productNumber = (NSString *)v19;

  }
  return v16;
}

- (void)initCountryCode
{
  void *v3;
  NSString *v4;
  NSString *countryCode;
  id v6;

  objc_msgSend(MEMORY[0x24BE3CBC0], "sharedConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v3, "copy");
  countryCode = self->_countryCode;
  self->_countryCode = v4;

}

- (UARPAccessoryID)initWithModelNumber:(id)a3
{
  id v4;
  UARPAccessoryID *v5;
  uint64_t v6;
  NSString *modelNumber;

  v4 = a3;
  v5 = -[UARPAccessoryID initWithoutUUID](self, "initWithoutUUID");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

  }
  return v5;
}

- (UARPAccessoryID)initWithProductGroup:(id)a3 productNumber:(id)a4
{
  id v6;
  id v7;
  UARPAccessoryID *v8;
  uint64_t v9;
  NSString *productGroup;
  uint64_t v11;
  NSString *productNumber;

  v6 = a3;
  v7 = a4;
  v8 = -[UARPAccessoryID initWithoutUUID](self, "initWithoutUUID");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    productGroup = v8->_productGroup;
    v8->_productGroup = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    productNumber = v8->_productNumber;
    v8->_productNumber = (NSString *)v11;

  }
  return v8;
}

- (UARPAccessoryID)initWithCoder:(id)a3
{
  id v4;
  UARPAccessoryID *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSString *productGroup;
  uint64_t v10;
  NSString *productNumber;
  uint64_t v12;
  NSDate *lastAddedDate;
  uint64_t v14;
  NSString *countryCode;
  uint64_t v16;
  NSString *stagedFirmwareVersion;
  uint64_t v18;
  NSString *manufacturer;
  uint64_t v20;
  NSString *modelName;
  uint64_t v22;
  NSString *modelNumber;
  uint64_t v24;
  NSString *serialNumber;
  uint64_t v26;
  NSString *firmwareVersion;
  void *v28;
  uint64_t v29;
  NSString *hwFusingType;
  uint64_t v31;
  NSString *hwRevision;
  uint64_t v33;
  NSString *friendlyName;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *partnerSerialNumbers;
  objc_super v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)UARPAccessoryID;
  v5 = -[UARPAccessoryID init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    productGroup = v5->_productGroup;
    v5->_productGroup = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productNumber"));
    v10 = objc_claimAutoreleasedReturnValue();
    productNumber = v5->_productNumber;
    v5->_productNumber = (NSString *)v10;

    v5->_autoDownloadAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoDownloadAllowed"));
    v5->_downloadOnCellularAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadOnCellularAllowed"));
    v5->_transport = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transport"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastAddedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastAddedDate = v5->_lastAddedDate;
    v5->_lastAddedDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stagedFirmwareVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    stagedFirmwareVersion = v5->_stagedFirmwareVersion;
    v5->_stagedFirmwareVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturer"));
    v18 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelName"));
    v20 = objc_claimAutoreleasedReturnValue();
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v24 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firmwareVersion"));
    v26 = objc_claimAutoreleasedReturnValue();
    firmwareVersion = v5->_firmwareVersion;
    v5->_firmwareVersion = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capability"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_capability = objc_msgSend(v28, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hwFusingType"));
    v29 = objc_claimAutoreleasedReturnValue();
    hwFusingType = v5->_hwFusingType;
    v5->_hwFusingType = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hwRevision"));
    v31 = objc_claimAutoreleasedReturnValue();
    hwRevision = v5->_hwRevision;
    v5->_hwRevision = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendlyName"));
    v33 = objc_claimAutoreleasedReturnValue();
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uarpVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uarpVersion = objc_msgSend(v35, "unsignedLongLongValue");

    v36 = (void *)MEMORY[0x24BDBCF20];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("partnerSerialNumbers"));
    v39 = objc_claimAutoreleasedReturnValue();
    partnerSerialNumbers = v5->_partnerSerialNumbers;
    v5->_partnerSerialNumbers = (NSArray *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UARPAccessoryID *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "encodeObject:forKey:", v4->_manufacturer, CFSTR("manufacturer"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_modelName, CFSTR("modelName"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_modelNumber, CFSTR("modelNumber"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_firmwareVersion, CFSTR("firmwareVersion"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_productGroup, CFSTR("productGroup"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_productNumber, CFSTR("productNumber"));
  objc_msgSend(v7, "encodeBool:forKey:", v4->_autoDownloadAllowed, CFSTR("autoDownloadAllowed"));
  objc_msgSend(v7, "encodeBool:forKey:", v4->_downloadOnCellularAllowed, CFSTR("downloadOnCellularAllowed"));
  objc_msgSend(v7, "encodeInteger:forKey:", v4->_transport, CFSTR("transport"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_lastAddedDate, CFSTR("lastAddedDate"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_stagedFirmwareVersion, CFSTR("stagedFirmwareVersion"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_uuid, CFSTR("uuid"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4->_capability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("capability"));

  objc_msgSend(v7, "encodeObject:forKey:", v4->_hwFusingType, CFSTR("hwFusingType"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_hwRevision, CFSTR("hwRevision"));
  objc_msgSend(v7, "encodeObject:forKey:", v4->_friendlyName, CFSTR("friendlyName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4->_uarpVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("uarpVersion"));

  objc_msgSend(v7, "encodeObject:forKey:", v4->_partnerSerialNumbers, CFSTR("partnerSerialNumbers"));
  objc_sync_exit(v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPAccessoryID *v4;
  UARPAccessoryID *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSString *manufacturer;
  uint64_t v10;
  NSString *modelName;
  uint64_t v12;
  NSString *modelNumber;
  uint64_t v14;
  NSString *serialNumber;
  uint64_t v16;
  NSString *firmwareVersion;
  uint64_t v18;
  NSString *productGroup;
  uint64_t v20;
  NSString *productNumber;
  uint64_t v22;
  NSString *countryCode;
  uint64_t v24;
  NSString *stagedFirmwareVersion;
  uint64_t v26;
  NSString *friendlyName;
  uint64_t v28;
  NSArray *partnerSerialNumbers;

  v4 = objc_alloc_init(UARPAccessoryID);
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSUUID copy](v5->_uuid, "copy");
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v6;

  v8 = -[NSString copy](v5->_manufacturer, "copy");
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v8;

  v10 = -[NSString copy](v5->_modelName, "copy");
  modelName = v4->_modelName;
  v4->_modelName = (NSString *)v10;

  v12 = -[NSString copy](v5->_modelNumber, "copy");
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v12;

  v14 = -[NSString copy](v5->_serialNumber, "copy");
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v14;

  v16 = -[NSString copy](v5->_firmwareVersion, "copy");
  firmwareVersion = v4->_firmwareVersion;
  v4->_firmwareVersion = (NSString *)v16;

  v18 = -[NSString copy](v5->_productGroup, "copy");
  productGroup = v4->_productGroup;
  v4->_productGroup = (NSString *)v18;

  v20 = -[NSString copy](v5->_productNumber, "copy");
  productNumber = v4->_productNumber;
  v4->_productNumber = (NSString *)v20;

  v4->_autoDownloadAllowed = v5->_autoDownloadAllowed;
  v4->_downloadOnCellularAllowed = v5->_downloadOnCellularAllowed;
  v4->_transport = v5->_transport;
  objc_storeStrong((id *)&v4->_lastAddedDate, v5->_lastAddedDate);
  v22 = -[NSString copy](v5->_countryCode, "copy");
  countryCode = v4->_countryCode;
  v4->_countryCode = (NSString *)v22;

  v24 = -[NSString copy](v5->_stagedFirmwareVersion, "copy");
  stagedFirmwareVersion = v4->_stagedFirmwareVersion;
  v4->_stagedFirmwareVersion = (NSString *)v24;

  v4->_capability = v5->_capability;
  objc_storeStrong((id *)&v4->_hwFusingType, v5->_hwFusingType);
  objc_storeStrong((id *)&v4->_hwRevision, v5->_hwRevision);
  v26 = -[NSString copy](v5->_friendlyName, "copy");
  friendlyName = v4->_friendlyName;
  v4->_friendlyName = (NSString *)v26;

  v4->_uarpVersion = v5->_uarpVersion;
  v28 = -[NSArray copy](v5->_partnerSerialNumbers, "copy");
  partnerSerialNumbers = v4->_partnerSerialNumbers;
  v4->_partnerSerialNumbers = (NSArray *)v28;

  objc_sync_exit(v5);
  return v4;
}

- (id)uuid
{
  UARPAccessoryID *v2;
  NSUUID *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_uuid;
  objc_sync_exit(v2);

  return v3;
}

- (void)setUuid:(id)a3
{
  NSUUID *v4;
  NSUUID *uuid;
  UARPAccessoryID *obj;

  v4 = (NSUUID *)a3;
  obj = self;
  objc_sync_enter(obj);
  uuid = obj->_uuid;
  obj->_uuid = v4;

  objc_sync_exit(obj);
}

- (void)setCountryCode:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *countryCode;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  countryCode = v4->_countryCode;
  v4->_countryCode = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setManufacturer:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *manufacturer;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  manufacturer = v4->_manufacturer;
  v4->_manufacturer = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setModelName:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *modelName;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  modelName = v4->_modelName;
  v4->_modelName = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setModelNumber:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *modelNumber;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setSerialNumber:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *serialNumber;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setProductGroup:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *productGroup;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  productGroup = v4->_productGroup;
  v4->_productGroup = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setProductNumber:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *productNumber;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  productNumber = v4->_productNumber;
  v4->_productNumber = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setFirmwareVersion:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *firmwareVersion;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  firmwareVersion = v4->_firmwareVersion;
  v4->_firmwareVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setStagedFirmwareVersion:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *stagedFirmwareVersion;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  stagedFirmwareVersion = v4->_stagedFirmwareVersion;
  v4->_stagedFirmwareVersion = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setHwFusingType:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *hwFusingType;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  hwFusingType = v4->_hwFusingType;
  v4->_hwFusingType = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setHwRevision:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *hwRevision;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  hwRevision = v4->_hwRevision;
  v4->_hwRevision = (NSString *)v5;

  objc_sync_exit(v4);
}

- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3
{
  UARPAccessoryID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_suppressAutomaticDynamicAssets = a3;
  objc_sync_exit(obj);

}

- (void)setSuppressInfoQueries:(BOOL)a3
{
  UARPAccessoryID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_suppressInfoQueries = a3;
  objc_sync_exit(obj);

}

- (void)setFriendlyName:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSString *friendlyName;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  friendlyName = v4->_friendlyName;
  v4->_friendlyName = (NSString *)v5;

  objc_sync_exit(v4);
}

- (unint64_t)uarpVersion
{
  UARPAccessoryID *v2;
  unint64_t uarpVersion;

  v2 = self;
  objc_sync_enter(v2);
  uarpVersion = v2->_uarpVersion;
  objc_sync_exit(v2);

  return uarpVersion;
}

- (void)setUarpVersion:(unint64_t)a3
{
  UARPAccessoryID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_uarpVersion = a3;
  objc_sync_exit(obj);

}

- (id)countryCode
{
  UARPAccessoryID *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_countryCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapability:(unint64_t)a3
{
  UARPAccessoryID *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_capability = a3;
  objc_sync_exit(obj);

}

- (unint64_t)capability
{
  UARPAccessoryID *v2;
  unint64_t capability;

  v2 = self;
  objc_sync_enter(v2);
  capability = v2->_capability;
  objc_sync_exit(v2);

  return capability;
}

- (id)computeModelIdentifier
{
  UARPAccessoryID *v2;
  NSString *v3;
  NSString *modelNumber;
  NSString *v5;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_productGroup && v2->_productNumber)
  {
    v3 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-%@"), v2->_productGroup, v2->_productNumber);
  }
  else
  {
    modelNumber = v2->_modelNumber;
    if (!modelNumber)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v3 = modelNumber;
  }
  v5 = v3;
LABEL_8:
  objc_sync_exit(v2);

  return v5;
}

- (NSString)modelIdentifier
{
  UARPAccessoryID *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[UARPAccessoryID computeModelIdentifier](v2, "computeModelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)modelAnalytics
{
  UARPAccessoryID *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[UARPAccessoryID computeModelIdentifier](v2, "computeModelIdentifier");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = v2->_modelName;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)shareAnalyticsEventsWithThirdParty
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UARPAccessoryID productGroup](self, "productGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UARPAccessoryID productNumber](self, "productNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (const)assetAvailabilityUpdateNotification
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[UARPAccessoryID uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.uarp.aau.%@"), v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return v5;
}

- (const)supplementalAssetAvailabilityUpdateNotification
{
  void *v2;
  void *v3;
  id v4;
  const char *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[UARPAccessoryID uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.uarp.saau.%@"), v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  return v5;
}

- (void)setPartnerSerialNumbers:(id)a3
{
  UARPAccessoryID *v4;
  uint64_t v5;
  NSArray *partnerSerialNumbers;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  partnerSerialNumbers = v4->_partnerSerialNumbers;
  v4->_partnerSerialNumbers = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)partnerSerialNumbers
{
  UARPAccessoryID *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[NSArray containsObject:](v2->_partnerSerialNumbers, "containsObject:", v2->_serialNumber))
    v3 = 0;
  else
    v3 = v2->_partnerSerialNumbers;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessoryID *v4;
  UARPAccessoryID *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UARPAccessoryID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v8 = 1;
    }
    else
    {
      v5 = v4;
      -[UARPAccessoryID uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPAccessoryID uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UARPAccessoryID uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: uuid=%@ "), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UARPAccessoryID manufacturer](self, "manufacturer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UARPAccessoryID manufacturer](self, "manufacturer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("manufacturer=%@ "), v9);

  }
  -[UARPAccessoryID modelName](self, "modelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UARPAccessoryID modelName](self, "modelName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("model=%@ "), v11);

  }
  -[UARPAccessoryID modelNumber](self, "modelNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UARPAccessoryID modelNumber](self, "modelNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("modelNumber=%@ "), v13);

  }
  -[UARPAccessoryID friendlyName](self, "friendlyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UARPAccessoryID friendlyName](self, "friendlyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("friendlyName=%@ "), v15);

  }
  -[UARPAccessoryID hwFusingType](self, "hwFusingType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[UARPAccessoryID hwFusingType](self, "hwFusingType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("hwFusing=%@ "), v17);

  }
  -[UARPAccessoryID hwRevision](self, "hwRevision");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UARPAccessoryID hwRevision](self, "hwRevision");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("hwRevision=%@ "), v19);

  }
  -[UARPAccessoryID serialNumber](self, "serialNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID firmwareVersion](self, "firmwareVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("sn=%@ fw=%@ "), v20, v21);

  -[UARPAccessoryID stagedFirmwareVersion](self, "stagedFirmwareVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UARPAccessoryID stagedFirmwareVersion](self, "stagedFirmwareVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("stagedFW=%@ "), v23);

  }
  -[UARPAccessoryID productGroup](self, "productGroup");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[UARPAccessoryID productGroup](self, "productGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("pg=%@ "), v25);

  }
  -[UARPAccessoryID productNumber](self, "productNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[UARPAccessoryID productNumber](self, "productNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("pn=%@ "), v27);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)stagedFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)hwFusingType
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)hwRevision
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (BOOL)downloadOnCellularAllowed
{
  return self->_downloadOnCellularAllowed;
}

- (void)setDownloadOnCellularAllowed:(BOOL)a3
{
  self->_downloadOnCellularAllowed = a3;
}

- (BOOL)autoDownloadAllowed
{
  return self->_autoDownloadAllowed;
}

- (void)setAutoDownloadAllowed:(BOOL)a3
{
  self->_autoDownloadAllowed = a3;
}

- (BOOL)suppressAutomaticDynamicAssets
{
  return self->_suppressAutomaticDynamicAssets;
}

- (BOOL)suppressInfoQueries
{
  return self->_suppressInfoQueries;
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_hwRevision, 0);
  objc_storeStrong((id *)&self->_hwFusingType, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_partnerSerialNumbers, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_lastAddedDate, 0);
}

@end
