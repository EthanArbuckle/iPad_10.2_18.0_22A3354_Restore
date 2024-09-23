@implementation NSPersistentCloudKitContainerOptions

- (NSPersistentCloudKitContainerOptions)initWithContainerIdentifier:(NSString *)containerIdentifier
{
  NSPersistentCloudKitContainerOptions *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSPersistentCloudKitContainerOptions;
  v4 = -[NSPersistentCloudKitContainerOptions init](&v7, sel_init);
  if (v4)
  {
    v5 = -[NSString copy](containerIdentifier, "copy");
    v4->_useDeviceToDeviceEncryption = 0;
    v4->_containerIdentifier = (NSString *)v5;
    v4->_apsConnectionMachServiceName = 0;
    v4->_databaseScope = 2;
  }
  return v4;
}

- (NSPersistentCloudKitContainerOptions)initWithContainer:(id)a3
{
  NSPersistentCloudKitContainerOptions *v4;

  v4 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:](self, "initWithContainerIdentifier:", objc_msgSend(a3, "containerIdentifier"));
  if (v4)
    v4->_testContainerOverride = (CKContainer *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_apsConnectionMachServiceName = 0;
  self->_testContainerOverride = 0;

  self->_ckAssetThresholdBytes = 0;
  self->_containerOptions = 0;

  self->_operationMemoryThresholdBytes = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainerOptions;
  -[NSPersistentCloudKitContainerOptions dealloc](&v3, sel_dealloc);
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)useDeviceToDeviceEncryption
{
  return self->_useDeviceToDeviceEncryption;
}

- (void)setUseDeviceToDeviceEncryption:(BOOL)a3
{
  self->_useDeviceToDeviceEncryption = a3;
}

- (NSString)apsConnectionMachServiceName
{
  return self->_apsConnectionMachServiceName;
}

- (void)setApsConnectionMachServiceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (CKDatabaseScope)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(CKDatabaseScope)databaseScope
{
  self->_databaseScope = databaseScope;
}

- (NSCloudKitMirroringDelegateProgressProvider)progressProvider
{
  return (NSCloudKitMirroringDelegateProgressProvider *)objc_loadWeak((id *)&self->_progressProvider);
}

- (void)setProgressProvider:(id)a3
{
  objc_storeWeak((id *)&self->_progressProvider, a3);
}

- (CKContainer)testContainerOverride
{
  return self->_testContainerOverride;
}

- (void)setTestContainerOverride:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (void)setContainerOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSNumber)operationMemoryThresholdBytes
{
  return self->_operationMemoryThresholdBytes;
}

- (void)setOperationMemoryThresholdBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)automaticallyDownloadFileBackedFutures
{
  return self->_automaticallyDownloadFileBackedFutures;
}

- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3
{
  self->_automaticallyDownloadFileBackedFutures = a3;
}

- (NSNumber)ckAssetThresholdBytes
{
  return self->_ckAssetThresholdBytes;
}

- (void)setCkAssetThresholdBytes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressProvider);
}

@end
