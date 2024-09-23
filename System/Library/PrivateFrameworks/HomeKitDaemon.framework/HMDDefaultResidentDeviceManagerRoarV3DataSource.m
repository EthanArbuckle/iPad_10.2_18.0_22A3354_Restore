@implementation HMDDefaultResidentDeviceManagerRoarV3DataSource

- (HMDDefaultResidentDeviceManagerRoarV3DataSource)init
{
  HMDDefaultResidentDeviceManagerRoarV3DataSource *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDDefaultResidentDeviceManagerRoarV3DataSource;
  v2 = -[HMDDefaultResidentDeviceManagerRoarV3DataSource init](&v9, sel_init);
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

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v4;
  HMDPrimaryElectionCoordinationAddOn *v5;

  v4 = a3;
  if (-[HMDDefaultResidentDeviceManagerRoarV3DataSource isResidentCapable](self, "isResidentCapable"))
    v5 = -[HMDPrimaryElectionCoordinationAddOn initWithContext:]([HMDPrimaryElectionCoordinationAddOn alloc], "initWithContext:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)createResidentSelectionManagerWithContext:(id)a3
{
  id v3;
  HMDResidentSelectionManager *v4;

  v3 = a3;
  v4 = -[HMDResidentSelectionManager initWithContext:]([HMDResidentSelectionManager alloc], "initWithContext:", v3);

  return v4;
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
  -[HMDDefaultResidentDeviceManagerRoarV3DataSource appleAccountManager](self, "appleAccountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDDefaultResidentDeviceManagerRoarBackingStore initWithHome:appleAccountManager:](v5, "initWithHome:appleAccountManager:", v4, v6);

  return v7;
}

- (id)createResidentStatusChannelForHome:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  HMDResidentStatusChannel *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDResidentStatusChannel initWithHome:queue:]([HMDResidentStatusChannel alloc], "initWithHome:queue:", v6, v5);

  return v7;
}

- (id)createResidentLocationHandlerForHome:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDResidentLocationHandler *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDResidentLocationHandler initWithHome:queue:messageDispatcher:]([HMDResidentLocationHandler alloc], "initWithHome:queue:messageDispatcher:", v9, v8, v7);

  return v10;
}

- (id)idsServerBagForHome:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsServerBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timerProvider
{
  return (id)objc_opt_new();
}

- (NSNumber)primaryResidentPeriodicReassertDurationSeconds
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("homekit-presence-primary-reassert-duration-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSNumber)primaryResidentPeriodicReassertSlopDurationSeconds
{
  void *v2;
  void *v3;
  void *v4;
  NSNumber *v5;

  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("homekit-presence-primary-reassert-slop-duration-seconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
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
