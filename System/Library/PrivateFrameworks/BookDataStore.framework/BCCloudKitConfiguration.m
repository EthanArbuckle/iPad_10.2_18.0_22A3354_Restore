@implementation BCCloudKitConfiguration

- (void)setServiceZones:(id)a3
{
  objc_storeStrong((id *)&self->_serviceZones, a3);
}

- (void)setRequiresDeviceToDeviceEncryption:(BOOL)a3
{
  self->_requiresDeviceToDeviceEncryption = a3;
}

- (void)setQueueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifier, a3);
}

- (void)setDbSubscriptionID:(id)a3
{
  objc_storeStrong((id *)&self->_dbSubscriptionID, a3);
}

- (void)setDbArchiveFolderName:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveFolderName, a3);
}

- (void)setDbArchiveFilename:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveFilename, a3);
}

- (void)setDbArchiveExtension:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveExtension, a3);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (void)setAppZones:(id)a3
{
  objc_storeStrong((id *)&self->_appZones, a3);
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSString)dbArchiveFolderName
{
  return self->_dbArchiveFolderName;
}

- (NSString)dbArchiveFilename
{
  return self->_dbArchiveFilename;
}

- (NSString)dbArchiveExtension
{
  return self->_dbArchiveExtension;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

+ (id)configuration
{
  BCCloudKitConfiguration *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v45[2];
  _QWORD v46[4];

  v46[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(BCCloudKitConfiguration);
  objc_msgSend_setQueueIdentifier_(v2, v3, (uint64_t)CFSTR("com.apple.iBooks.CloudKitController"), v4, v5);
  objc_msgSend_setContainerIdentifier_(v2, v6, (uint64_t)CFSTR("com.apple.iBooks.cloudData"), v7, v8);
  v46[0] = CFSTR("AssetZone");
  v46[1] = CFSTR("ReadingStatistics");
  v46[2] = CFSTR("GlobalMetadata");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v46, 3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppZones_(v2, v12, (uint64_t)v11, v13, v14);

  v45[0] = CFSTR("AssetZone");
  v45[1] = CFSTR("ReadingHistoryModel");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v15, (uint64_t)v45, 2, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceZones_(v2, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_setDbArchiveFolderName_(v2, v21, (uint64_t)CFSTR("BCCloudKit-iBooks"), v22, v23);
  objc_msgSend_setDbArchiveExtension_(v2, v24, (uint64_t)CFSTR("bcck"), v25, v26);
  objc_msgSend_setDbArchiveFilename_(v2, v27, (uint64_t)CFSTR("BCPrivateDatabase"), v28, v29);
  objc_msgSend_setDbSubscriptionID_(v2, v30, (uint64_t)CFSTR("com.apple.iBooks.BCCloudKitPrivate"), v31, v32);
  objc_msgSend_bdsAppBundleIdentifier(BDSAppBundleIdentifier, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppBundleIdentifier_(v2, v38, (uint64_t)v37, v39, v40);

  objc_msgSend_setRequiresDeviceToDeviceEncryption_(v2, v41, 0, v42, v43);
  return v2;
}

- (BOOL)shouldArchiveData:(id)a3
{
  return 1;
}

- (BOOL)shouldPerformDatabaseSubscriptionForServiceMode:(BOOL)a3
{
  return !a3;
}

- (NSArray)appZones
{
  return self->_appZones;
}

- (NSArray)serviceZones
{
  return self->_serviceZones;
}

- (NSString)dbSubscriptionID
{
  return self->_dbSubscriptionID;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (BOOL)requiresDeviceToDeviceEncryption
{
  return self->_requiresDeviceToDeviceEncryption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dbSubscriptionID, 0);
  objc_storeStrong((id *)&self->_dbArchiveFilename, 0);
  objc_storeStrong((id *)&self->_dbArchiveExtension, 0);
  objc_storeStrong((id *)&self->_dbArchiveFolderName, 0);
  objc_storeStrong((id *)&self->_serviceZones, 0);
  objc_storeStrong((id *)&self->_appZones, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);
}

@end
