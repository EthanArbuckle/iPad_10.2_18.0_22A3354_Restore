@implementation HMDDefaultResidentDeviceManagerRoarDataSource

- (HMDDefaultResidentDeviceManagerRoarDataSource)init
{
  HMDDefaultResidentDeviceManagerRoarDataSource *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDDefaultResidentDeviceManagerRoarDataSource;
  v2 = -[HMDDefaultResidentDeviceManagerRoarDataSource init](&v9, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (BOOL)isResidentCapable
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentCapable");

  return v3;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (HMDAppleAccountManager)appleAccountManager
{
  return +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
}

- (id)firstCloudKitImportFuture
{
  void *v2;
  void *v3;

  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstCloudKitImportFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)+[HMDFeaturesDataSource defaultDataSource](HMDFeaturesDataSource, "defaultDataSource");
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v4;
  HMDPrimaryElectionCoordinationAddOn *v5;

  v4 = a3;
  if (-[HMDDefaultResidentDeviceManagerRoarDataSource isResidentCapable](self, "isResidentCapable"))
    v5 = -[HMDPrimaryElectionCoordinationAddOn initWithContext:]([HMDPrimaryElectionCoordinationAddOn alloc], "initWithContext:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)createPrimaryResidentDiscoveryManagerWithQueue:(id)a3
{
  id v3;
  HMDPrimaryResidentDiscoveryManager *v4;

  v3 = a3;
  v4 = -[HMDPrimaryResidentDiscoveryManager initWithQueue:]([HMDPrimaryResidentDiscoveryManager alloc], "initWithQueue:", v3);

  return v4;
}

- (id)createBackingStoreForHome:(id)a3
{
  id v4;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v5;
  void *v6;
  HMDDefaultResidentDeviceManagerRoarBackingStore *v7;

  v4 = a3;
  v5 = [HMDDefaultResidentDeviceManagerRoarBackingStore alloc];
  -[HMDDefaultResidentDeviceManagerRoarDataSource appleAccountManager](self, "appleAccountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDDefaultResidentDeviceManagerRoarBackingStore initWithHome:appleAccountManager:](v5, "initWithHome:appleAccountManager:", v4, v6);

  return v7;
}

- (id)logIdentifierForHome:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
