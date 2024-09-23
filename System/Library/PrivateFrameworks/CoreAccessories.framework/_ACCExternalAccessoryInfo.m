@implementation _ACCExternalAccessoryInfo

- (_ACCExternalAccessoryInfo)initWithAccessoryInfoDictionary:(id)a3
{
  id v5;
  _ACCExternalAccessoryInfo *v6;
  _ACCExternalAccessoryInfo *v7;
  uint64_t v8;
  NSString *primaryUUID;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *manufacturer;
  uint64_t v14;
  NSString *model;
  uint64_t v16;
  NSString *serial;
  uint64_t v18;
  NSString *firmwareRevisionActive;
  uint64_t v20;
  NSString *firmwareRevisionPending;
  uint64_t v22;
  NSString *hardwareRevision;
  uint64_t v24;
  NSString *ppid;
  uint64_t v26;
  NSNumber *vendorID;
  uint64_t v28;
  NSNumber *productID;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_ACCExternalAccessoryInfo;
  v6 = -[_ACCExternalAccessoryInfo init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fullAccessoryInfo, a3);
    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("ACCExternalAccessoryPrimaryUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    primaryUUID = v7->_primaryUUID;
    v7->_primaryUUID = (NSString *)v8;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v10;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryManufacturerKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    manufacturer = v7->_manufacturer;
    v7->_manufacturer = (NSString *)v12;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryModelNumberKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    model = v7->_model;
    v7->_model = (NSString *)v14;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessorySerialNumberKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    serial = v7->_serial;
    v7->_serial = (NSString *)v16;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryFirmwareRevisionKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    firmwareRevisionActive = v7->_firmwareRevisionActive;
    v7->_firmwareRevisionActive = (NSString *)v18;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryFirmwareRevisionPendingKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    firmwareRevisionPending = v7->_firmwareRevisionPending;
    v7->_firmwareRevisionPending = (NSString *)v20;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("IAPAppAccessoryHardwareRevisionKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    hardwareRevision = v7->_hardwareRevision;
    v7->_hardwareRevision = (NSString *)v22;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("ACCExternalAccessoryPPIDKey"));
    v24 = objc_claimAutoreleasedReturnValue();
    ppid = v7->_ppid;
    v7->_ppid = (NSString *)v24;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("ACCExternalAccessoryPPIDKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v26;

    -[NSDictionary objectForKey:](v7->_fullAccessoryInfo, "objectForKey:", CFSTR("ACCExternalAccessoryPPIDKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    productID = v7->_productID;
    v7->_productID = (NSNumber *)v28;

    v7->_destinationSharingOptions = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_ACCExternalAccessoryInfo>[%@ name='%@' manu='%@' model='%@' serial='%@' fw(active)='%@', fw(pending)='%@', hw='%@' ppid='%@']"), self->_primaryUUID, self->_name, self->_manufacturer, self->_model, self->_serial, self->_firmwareRevisionActive, self->_firmwareRevisionPending, self->_hardwareRevision, self->_ppid);
}

- (id)copyAccessoryInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_fullAccessoryInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("IAPAppAccessoryCertDataKey"));
  objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey"));
  if (self->_destinationSharingOptions)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, kACCDestinationSharingOptionsKey);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *primaryUUID;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    primaryUUID = self->_primaryUUID;
    objc_msgSend(v4, "primaryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](primaryUUID, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_primaryUUID, "hash");
}

- (NSDictionary)fullAccessoryInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFullAccessoryInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)primaryUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)serial
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSerial:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)firmwareRevisionActive
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFirmwareRevisionActive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)firmwareRevisionPending
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFirmwareRevisionPending:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)hardwareRevision
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHardwareRevision:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)ppid
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPpid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVendorID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProductID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)destinationSharingOptions
{
  return self->_destinationSharingOptions;
}

- (void)setDestinationSharingOptions:(unint64_t)a3
{
  self->_destinationSharingOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_hardwareRevision, 0);
  objc_storeStrong((id *)&self->_firmwareRevisionPending, 0);
  objc_storeStrong((id *)&self->_firmwareRevisionActive, 0);
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_primaryUUID, 0);
  objc_storeStrong((id *)&self->_fullAccessoryInfo, 0);
}

@end
