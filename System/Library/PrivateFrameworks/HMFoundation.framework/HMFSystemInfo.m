@implementation HMFSystemInfo

+ (id)systemInfo
{
  if (_MergedGlobals_65 != -1)
    dispatch_once(&_MergedGlobals_65, &__block_literal_global_32);
  return (id)qword_1ED0131A8;
}

- (int64_t)productVariant
{
  void *v2;
  int64_t v3;

  -[HMFSystemInfo productInfoDataSource](self, "productInfoDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productVariant");

  return v3;
}

- (HMFSystemInfoProductInfoDataSource)productInfoDataSource
{
  return self->_productInfoDataSource;
}

void __27__HMFSystemInfo_systemInfo__block_invoke()
{
  HMFSystemInfo *v0;
  void *v1;

  v0 = objc_alloc_init(HMFSystemInfo);
  v1 = (void *)qword_1ED0131A8;
  qword_1ED0131A8 = (uint64_t)v0;

}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[HMFSystemInfo allocWithZone:](__HMFEmbeddedSystemInfo, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMFSystemInfo;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (HMFSoftwareVersion)softwareVersion
{
  void *v2;
  void *v3;

  -[HMFSystemInfo softwareVersionDataSource](self, "softwareVersionDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFSoftwareVersion *)v3;
}

- (NSString)modelIdentifier
{
  void *v2;
  void *v3;

  -[HMFSystemInfo productInfoDataSource](self, "productInfoDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMFSystemInfoSoftwareVersionDataSource)softwareVersionDataSource
{
  return self->_softwareVersionDataSource;
}

- (int64_t)productPlatform
{
  void *v2;
  int64_t v3;

  -[HMFSystemInfo productInfoDataSource](self, "productInfoDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productPlatform");

  return v3;
}

- (int64_t)productColor
{
  void *v2;
  int64_t v3;

  -[HMFSystemInfo productColorDataSource](self, "productColorDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productColor");

  return v3;
}

- (HMFSystemInfoProductColorDataSource)productColorDataSource
{
  return self->_productColorDataSource;
}

- (int64_t)productClass
{
  void *v2;
  int64_t v3;

  -[HMFSystemInfo productInfoDataSource](self, "productInfoDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[HMFSystemInfo nameDataSource](self, "nameDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)dataSource:(id)a3 didUpdateName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMFSystemInfo *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC355C]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Updated system name to '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("HMFSystemInfoNameNotificationKey");
  v15 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("HMFSystemInfoNameUpdatedNotification"), v9, v13);

}

- (NSString)model
{
  void *v2;
  void *v3;

  -[HMFSystemInfo marketingDataSource](self, "marketingDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)regionInfo
{
  void *v2;
  void *v3;

  -[HMFSystemInfo marketingDataSource](self, "marketingDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  void *v2;
  void *v3;

  -[HMFSystemInfo serialNumberDataSource](self, "serialNumberDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isMigrating
{
  void *v2;
  char v3;

  -[HMFSystemInfo migrationDataSource](self, "migrationDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMigrating");

  return v3;
}

- (void)dataSource:(id)a3 didUpdateMigrating:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMFSystemInfo *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC355C]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_19B546000, v9, OS_LOG_TYPE_INFO, "%{public}@Updated migration status to '%@'", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  +[HMFNotificationCenter defaultCenter](HMFNotificationCenter, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("HMFSystemInfoMigratingUpdatedNotification"), v8, 0);

}

- (HMFMACAddress)WiFiInterfaceMACAddress
{
  void *v2;
  void *v3;

  -[HMFSystemInfo WiFiDataSource](self, "WiFiDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "WiFiInterfaceMACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMFMACAddress *)v3;
}

- (BOOL)supportsBLE
{
  void *v2;
  char v3;

  -[HMFSystemInfo bluetoothLEDataSource](self, "bluetoothLEDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsBLE");

  return v3;
}

- (HMFSystemInfoNameDataSource)nameDataSource
{
  return self->_nameDataSource;
}

- (HMFSystemInfoMarketingInformationDataSource)marketingDataSource
{
  return self->_marketingDataSource;
}

- (HMFSystemInfoSerialNumberDataSource)serialNumberDataSource
{
  return self->_serialNumberDataSource;
}

- (HMFSystemInfoMigrationDataSource)migrationDataSource
{
  return self->_migrationDataSource;
}

- (HMFSystemInfoWiFiDataSource)WiFiDataSource
{
  return self->_WiFiDataSource;
}

- (HMFSystemInfoBluetoothLEDataSource)bluetoothLEDataSource
{
  return self->_bluetoothLEDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productColorDataSource, 0);
  objc_storeStrong((id *)&self->_bluetoothLEDataSource, 0);
  objc_storeStrong((id *)&self->_WiFiDataSource, 0);
  objc_storeStrong((id *)&self->_migrationDataSource, 0);
  objc_storeStrong((id *)&self->_softwareVersionDataSource, 0);
  objc_storeStrong((id *)&self->_productInfoDataSource, 0);
  objc_storeStrong((id *)&self->_serialNumberDataSource, 0);
  objc_storeStrong((id *)&self->_marketingDataSource, 0);
  objc_storeStrong((id *)&self->_nameDataSource, 0);
}

@end
