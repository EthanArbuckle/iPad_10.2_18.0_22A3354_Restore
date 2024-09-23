@implementation HMDDefaultResidentDeviceManagerLegacyDataSource

- (HMDDefaultResidentDeviceManagerLegacyDataSource)init
{
  HMDDefaultResidentDeviceManagerLegacyDataSource *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDDefaultResidentDeviceManagerLegacyDataSource;
  v2 = -[HMDDefaultResidentDeviceManagerLegacyDataSource init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("HMDResidentDeviceManagerLegacy", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

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
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (HMDAppleAccountManager)appleAccountManager
{
  return +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
}

- (id)createElectionAddOnWithContext:(id)a3
{
  id v3;
  HMDPrimaryElectionCoordinationAddOn *v4;

  v3 = a3;
  v4 = -[HMDPrimaryElectionCoordinationAddOn initWithContext:]([HMDPrimaryElectionCoordinationAddOn alloc], "initWithContext:", v3);

  return v4;
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

- (id)createResidentDeviceWithModel:(id)a3
{
  id v3;
  HMDResidentDevice *v4;

  v3 = a3;
  v4 = -[HMDResidentDevice initWithModel:]([HMDResidentDevice alloc], "initWithModel:", v3);

  return v4;
}

- (id)createInitialReachabilityManagerWithUUID:(id)a3
{
  id v4;
  HMDHomePrimaryResidentInitialReachabilityManager *v5;
  void *v6;
  HMDHomePrimaryResidentInitialReachabilityManager *v7;

  v4 = a3;
  v5 = [HMDHomePrimaryResidentInitialReachabilityManager alloc];
  -[HMDDefaultResidentDeviceManagerLegacyDataSource queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomePrimaryResidentInitialReachabilityManager initWithUUID:workQueue:](v5, "initWithUUID:workQueue:", v4, v6);

  return v7;
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
