@implementation UARPAccessory

- (UARPAccessory)initWithID:(id)a3
{
  id v5;
  UARPAccessory *v6;
  UARPAccessory *v7;
  uint64_t v8;
  NSMutableArray *internalPendingAssets;
  uint64_t v10;
  NSMutableSet *pendingClientPropertyQueries;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UARPAccessory;
  v6 = -[UARPAccessory init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_id, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    internalPendingAssets = v7->_internalPendingAssets;
    v7->_internalPendingAssets = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingClientPropertyQueries = v7->_pendingClientPropertyQueries;
    v7->_pendingClientPropertyQueries = (NSMutableSet *)v10;

  }
  return v7;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UARPAccessoryID *v14;
  UARPAccessory *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:]([UARPAccessoryID alloc], "initWithManufacturer:modelName:serialNumber:firmwareVersion:", v13, v12, v11, v10);

  v15 = -[UARPAccessory initWithID:](self, "initWithID:", v14);
  return v15;
}

- (UARPAccessory)initWithManufacturer:(id)a3 modelName:(id)a4 serialNumber:(id)a5 firmwareVersion:(id)a6 productGroup:(id)a7 productNumber:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  UARPAccessoryID *v20;
  UARPAccessory *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]([UARPAccessoryID alloc], "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:", v19, v18, v17, v16, v15, v14);

  v21 = -[UARPAccessory initWithID:](self, "initWithID:", v20);
  return v21;
}

- (UARPAccessory)initWithModelNumber:(id)a3
{
  id v4;
  UARPAccessoryID *v5;
  UARPAccessory *v6;

  v4 = a3;
  v5 = -[UARPAccessoryID initWithModelNumber:]([UARPAccessoryID alloc], "initWithModelNumber:", v4);

  v6 = -[UARPAccessory initWithID:](self, "initWithID:", v5);
  return v6;
}

- (UARPAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  UARPAccessoryID *v11;
  UARPAccessory *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[UARPAccessoryID initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:]([UARPAccessoryID alloc], "initWithManufacturer:modelName:serialNumber:firmwareVersion:productGroup:productNumber:", 0, 0, 0, 0, v10, v9);

  -[UARPAccessoryID setUuid:](v11, "setUuid:", v8);
  v12 = -[UARPAccessory initWithID:](self, "initWithID:", v11);

  return v12;
}

- (UARPAccessory)initWithHardwareID:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  UARPAccessoryID *v14;
  void *v15;
  NSObject *v16;
  UARPAccessory *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  UARPAccessoryID *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[UARPAccessory logger](UARPAccessory, "logger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    +[UARPSupportedAccessory supportedAccessories](UARPSupportedAccessory, "supportedAccessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412290;
    v38 = v9;
    _os_log_impl(&dword_212D08000, v8, OS_LOG_TYPE_INFO, "Supported accessories %@", (uint8_t *)&v37, 0xCu);

  }
  +[UARPSupportedAccessory findByHardwareID:](UARPSupportedAccessory, "findByHardwareID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[UARPAccessory logger](UARPAccessory, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UARPAccessory initWithHardwareID:uuid:].cold.1((uint64_t)v6, v16, v18, v19, v20, v21, v22, v23);
    goto LABEL_18;
  }
  objc_msgSend(v10, "appleModelNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v11, "productGroup");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(v11, "productNumber");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        +[UARPAccessory logger](UARPAccessory, "logger");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v37 = 138412290;
          v38 = v11;
          _os_log_impl(&dword_212D08000, v27, OS_LOG_TYPE_INFO, "PG/PN based accessory %@", (uint8_t *)&v37, 0xCu);
        }

        v28 = [UARPAccessoryID alloc];
        objc_msgSend(v11, "productGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "productNumber");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[UARPAccessoryID initWithProductGroup:productNumber:](v28, "initWithProductGroup:productNumber:", v15, v29);

        goto LABEL_8;
      }
    }
    +[UARPAccessory logger](UARPAccessory, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UARPAccessory initWithHardwareID:uuid:].cold.2((uint64_t)v11, v16, v30, v31, v32, v33, v34, v35);
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  +[UARPAccessory logger](UARPAccessory, "logger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v37 = 138412290;
    v38 = v11;
    _os_log_impl(&dword_212D08000, v13, OS_LOG_TYPE_INFO, "Apple Model Number based accessory %@", (uint8_t *)&v37, 0xCu);
  }

  v14 = [UARPAccessoryID alloc];
  objc_msgSend(v11, "appleModelNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UARPAccessoryID initWithModelNumber:](v14, "initWithModelNumber:", v15);
LABEL_8:

  -[NSObject setUuid:](v16, "setUuid:", v7);
  -[NSObject setTransport:](v16, "setTransport:", objc_msgSend(v6, "transport"));
  self = -[UARPAccessory initWithID:](self, "initWithID:", v16);
  v17 = self;
LABEL_19:

  return v17;
}

- (NSString)serialNumber
{
  return -[UARPAccessoryID serialNumber](self->_id, "serialNumber");
}

- (NSString)modelName
{
  return -[UARPAccessoryID modelName](self->_id, "modelName");
}

- (NSString)modelNumber
{
  return -[UARPAccessoryID modelNumber](self->_id, "modelNumber");
}

- (NSString)manufacturer
{
  return -[UARPAccessoryID manufacturer](self->_id, "manufacturer");
}

- (id)getID
{
  return self->_id;
}

- (id)description
{
  return -[UARPAccessoryID description](self->_id, "description");
}

- (NSString)firmwareVersion
{
  return -[UARPAccessoryID firmwareVersion](self->_id, "firmwareVersion");
}

- (NSString)productNumber
{
  return -[UARPAccessoryID productNumber](self->_id, "productNumber");
}

- (NSString)productGroup
{
  return -[UARPAccessoryID productGroup](self->_id, "productGroup");
}

- (NSString)stagedFirmwareVersion
{
  return -[UARPAccessoryID stagedFirmwareVersion](self->_id, "stagedFirmwareVersion");
}

- (BOOL)downloadOnCellularAllowed
{
  return -[UARPAccessoryID downloadOnCellularAllowed](self->_id, "downloadOnCellularAllowed");
}

- (BOOL)autoDownloadAllowed
{
  return -[UARPAccessoryID autoDownloadAllowed](self->_id, "autoDownloadAllowed");
}

- (NSString)hwFusingType
{
  return -[UARPAccessoryID hwFusingType](self->_id, "hwFusingType");
}

- (NSString)hwRevision
{
  return -[UARPAccessoryID hwRevision](self->_id, "hwRevision");
}

- (BOOL)suppressAutomaticDynamicAssets
{
  return -[UARPAccessoryID suppressAutomaticDynamicAssets](self->_id, "suppressAutomaticDynamicAssets");
}

- (BOOL)suppressInfoQueries
{
  return -[UARPAccessoryID suppressInfoQueries](self->_id, "suppressInfoQueries");
}

- (NSString)friendlyName
{
  return -[UARPAccessoryID friendlyName](self->_id, "friendlyName");
}

- (unint64_t)uarpVersion
{
  return -[UARPAccessoryID uarpVersion](self->_id, "uarpVersion");
}

- (void)setDownloadOnCellularAllowed:(BOOL)a3
{
  -[UARPAccessoryID setDownloadOnCellularAllowed:](self->_id, "setDownloadOnCellularAllowed:", a3);
}

- (void)setAutoDownloadAllowed:(BOOL)a3
{
  -[UARPAccessoryID setAutoDownloadAllowed:](self->_id, "setAutoDownloadAllowed:", a3);
}

- (void)setSerialNumber:(id)a3
{
  -[UARPAccessoryID setSerialNumber:](self->_id, "setSerialNumber:", a3);
}

- (void)setModelName:(id)a3
{
  -[UARPAccessoryID setModelName:](self->_id, "setModelName:", a3);
}

- (void)setModelNumber:(id)a3
{
  -[UARPAccessoryID setModelNumber:](self->_id, "setModelNumber:", a3);
}

- (void)setManufacturer:(id)a3
{
  -[UARPAccessoryID setManufacturer:](self->_id, "setManufacturer:", a3);
}

- (void)setFirmwareVersion:(id)a3
{
  -[UARPAccessoryID setFirmwareVersion:](self->_id, "setFirmwareVersion:", a3);
}

- (void)setProductGroup:(id)a3
{
  -[UARPAccessoryID setProductGroup:](self->_id, "setProductGroup:", a3);
}

- (void)setProductNumber:(id)a3
{
  -[UARPAccessoryID setProductNumber:](self->_id, "setProductNumber:", a3);
}

- (void)setStagedFirmwareVersion:(id)a3
{
  -[UARPAccessoryID setStagedFirmwareVersion:](self->_id, "setStagedFirmwareVersion:", a3);
}

- (void)setHwFusingType:(id)a3
{
  -[UARPAccessoryID setHwFusingType:](self->_id, "setHwFusingType:", a3);
}

- (void)setHwRevision:(id)a3
{
  -[UARPAccessoryID setHwRevision:](self->_id, "setHwRevision:", a3);
}

- (void)setSuppressAutomaticDynamicAssets:(BOOL)a3
{
  -[UARPAccessoryID setSuppressAutomaticDynamicAssets:](self->_id, "setSuppressAutomaticDynamicAssets:", a3);
}

- (void)setSuppressInfoQueries:(BOOL)a3
{
  -[UARPAccessoryID setSuppressInfoQueries:](self->_id, "setSuppressInfoQueries:", a3);
}

- (void)setFriendlyName:(id)a3
{
  -[UARPAccessoryID setFriendlyName:](self->_id, "setFriendlyName:", a3);
}

- (void)setUarpVersion:(unint64_t)a3
{
  -[UARPAccessoryID setUarpVersion:](self->_id, "setUarpVersion:", a3);
}

- (BOOL)isEqual:(id)a3
{
  UARPAccessory *v4;
  BOOL v5;

  v4 = (UARPAccessory *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = self == v4 || -[UARPAccessoryID isEqual:](self->_id, "isEqual:", v4->_id);
  else
    v5 = 0;

  return v5;
}

- (void)addPendingAsset:(id)a3
{
  -[NSMutableArray addObject:](self->_internalPendingAssets, "addObject:", a3);
}

- (void)removePendingAsset:(id)a3
{
  -[NSMutableArray removeObject:](self->_internalPendingAssets, "removeObject:", a3);
}

- (id)pendingAssets
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_internalPendingAssets);
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setAssetTransfersPaused:(BOOL)a3
{
  self->_assetTransfersPaused = a3;
}

- (BOOL)assetTransfersPaused
{
  return self->_assetTransfersPaused;
}

- (void)setTransport:(int64_t)a3
{
  -[UARPAccessoryID setTransport:](self->_id, "setTransport:", a3);
}

- (int64_t)transport
{
  return -[UARPAccessoryID transport](self->_id, "transport");
}

- (NSUUID)uuid
{
  return (NSUUID *)-[UARPAccessoryID uuid](self->_id, "uuid");
}

- (void)setUuid:(id)a3
{
  -[UARPAccessoryID setUuid:](self->_id, "setUuid:", a3);
}

- (unint64_t)capability
{
  return -[UARPAccessoryID capability](self->_id, "capability");
}

- (void)setCapability:(unint64_t)a3
{
  -[UARPAccessoryID setCapability:](self->_id, "setCapability:", a3);
}

- (void)addPendingClientPropertyQuery:(unint64_t)a3
{
  NSMutableSet *pendingClientPropertyQueries;
  id v4;

  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](pendingClientPropertyQueries, "addObject:", v4);

}

- (void)removePendingClientPropertyQuery:(unint64_t)a3
{
  NSMutableSet *pendingClientPropertyQueries;
  id v4;

  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](pendingClientPropertyQueries, "removeObject:", v4);

}

- (BOOL)clientQueryPendingForProperty:(unint64_t)a3
{
  NSMutableSet *pendingClientPropertyQueries;
  void *v4;

  pendingClientPropertyQueries = self->_pendingClientPropertyQueries;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pendingClientPropertyQueries) = -[NSMutableSet containsObject:](pendingClientPropertyQueries, "containsObject:", v4);

  return (char)pendingClientPropertyQueries;
}

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global_2);
  return (id)logger_myLog;
}

void __23__UARPAccessory_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.accessoryupdater.uarp", "uarpAccessory");
  v1 = (void *)logger_myLog;
  logger_myLog = (uint64_t)v0;

}

- (id)bsdNotifications
{
  void *v2;
  void *v3;
  void *v4;

  -[UARPAccessoryID modelNumber](self->_id, "modelNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bsdNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)serviceBsdNotifications
{
  void *v2;
  void *v3;
  void *v4;

  -[UARPAccessoryID modelNumber](self->_id, "modelNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "serviceBsdNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPartnerSerialNumbers:(id)a3
{
  NSArray *v4;
  NSArray *partnerSerialNumbers;
  UARPAccessory *obj;

  v4 = (NSArray *)a3;
  obj = self;
  objc_sync_enter(obj);
  partnerSerialNumbers = obj->_partnerSerialNumbers;
  obj->_partnerSerialNumbers = v4;

  objc_sync_exit(obj);
}

- (id)partnerSerialNumbers
{
  UARPAccessory *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_partnerSerialNumbers;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)availableFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAvailableFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)userInitiatedFirmwareStaging
{
  return self->_userInitiatedFirmwareStaging;
}

- (void)setUserInitiatedFirmwareStaging:(BOOL)a3
{
  self->_userInitiatedFirmwareStaging = a3;
}

- (BOOL)userInitiatedFirmwareApply
{
  return self->_userInitiatedFirmwareApply;
}

- (void)setUserInitiatedFirmwareApply:(BOOL)a3
{
  self->_userInitiatedFirmwareApply = a3;
}

- (unsigned)firmwareUpdateBytesTransferred
{
  return self->_firmwareUpdateBytesTransferred;
}

- (void)setFirmwareUpdateBytesTransferred:(unsigned int)a3
{
  self->_firmwareUpdateBytesTransferred = a3;
}

- (unsigned)firmwareUpdateBytesTotal
{
  return self->_firmwareUpdateBytesTotal;
}

- (void)setFirmwareUpdateBytesTotal:(unsigned int)a3
{
  self->_firmwareUpdateBytesTotal = a3;
}

- (NSString)filepathCurrentAsset
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFilepathCurrentAsset:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)enableFirmwareDownloadOnDemand
{
  return self->_enableFirmwareDownloadOnDemand;
}

- (void)setEnableFirmwareDownloadOnDemand:(BOOL)a3
{
  self->_enableFirmwareDownloadOnDemand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filepathCurrentAsset, 0);
  objc_storeStrong((id *)&self->_availableFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_partnerSerialNumbers, 0);
  objc_storeStrong((id *)&self->_pendingClientPropertyQueries, 0);
  objc_storeStrong((id *)&self->_internalPendingAssets, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)initWithHardwareID:(uint64_t)a3 uuid:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unsupported hardwareID %@", a5, a6, a7, a8, 2u);
}

- (void)initWithHardwareID:(uint64_t)a3 uuid:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unsupported accessory %@", a5, a6, a7, a8, 2u);
}

@end
