@implementation BCCloudKitSecureConfiguration

+ (id)configuration
{
  BCCloudKitSecureConfiguration *v2;
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
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(BCCloudKitSecureConfiguration);
  objc_msgSend_setQueueIdentifier_(v2, v3, (uint64_t)CFSTR("com.apple.iBooks.SecureCloudKitController"), v4, v5);
  objc_msgSend_setContainerIdentifier_(v2, v6, (uint64_t)CFSTR("com.apple.iBooks.secureData"), v7, v8);
  v41[0] = CFSTR("SecureUserDataZone");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v9, (uint64_t)v41, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAppZones_(v2, v12, (uint64_t)v11, v13, v14);

  v40 = CFSTR("SecureUserDataZone");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v15, (uint64_t)&v40, 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceZones_(v2, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_setDbArchiveFolderName_(v2, v21, (uint64_t)CFSTR("BCCloudKit-iBooksSecure"), v22, v23);
  objc_msgSend_setDbArchiveExtension_(v2, v24, (uint64_t)CFSTR("bcck"), v25, v26);
  objc_msgSend_setDbArchiveFilename_(v2, v27, (uint64_t)CFSTR("BCPrivateDatabaseSecure"), v28, v29);
  objc_msgSend_setDbSubscriptionID_(v2, v30, (uint64_t)CFSTR("com.apple.iBooks.BCCloudKitSecure"), v31, v32);
  objc_msgSend_setAppBundleIdentifier_(v2, v33, (uint64_t)CFSTR("com.apple.iBooks"), v34, v35);
  objc_msgSend_setRequiresDeviceToDeviceEncryption_(v2, v36, 1, v37, v38);
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

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueIdentifier, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (NSArray)appZones
{
  return self->_appZones;
}

- (void)setAppZones:(id)a3
{
  objc_storeStrong((id *)&self->_appZones, a3);
}

- (NSArray)serviceZones
{
  return self->_serviceZones;
}

- (void)setServiceZones:(id)a3
{
  objc_storeStrong((id *)&self->_serviceZones, a3);
}

- (NSString)dbArchiveFolderName
{
  return self->_dbArchiveFolderName;
}

- (void)setDbArchiveFolderName:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveFolderName, a3);
}

- (NSString)dbArchiveExtension
{
  return self->_dbArchiveExtension;
}

- (void)setDbArchiveExtension:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveExtension, a3);
}

- (NSString)dbArchiveFilename
{
  return self->_dbArchiveFilename;
}

- (void)setDbArchiveFilename:(id)a3
{
  objc_storeStrong((id *)&self->_dbArchiveFilename, a3);
}

- (NSString)dbSubscriptionID
{
  return self->_dbSubscriptionID;
}

- (void)setDbSubscriptionID:(id)a3
{
  objc_storeStrong((id *)&self->_dbSubscriptionID, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (BOOL)requiresDeviceToDeviceEncryption
{
  return self->_requiresDeviceToDeviceEncryption;
}

- (void)setRequiresDeviceToDeviceEncryption:(BOOL)a3
{
  self->_requiresDeviceToDeviceEncryption = a3;
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
