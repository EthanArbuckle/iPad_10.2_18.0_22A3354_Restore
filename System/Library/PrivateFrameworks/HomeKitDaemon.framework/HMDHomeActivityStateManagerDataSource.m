@implementation HMDHomeActivityStateManagerDataSource

- (HMDHomeActivityStateManagerDataSource)initWithHome:(id)a3
{
  id v4;
  HMDHomeActivityStateManagerDataSource *v5;
  HMDHomeActivityStateManagerDataSource *v6;
  void *v7;
  uint64_t v8;
  NSString *logIdentifier;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  HMFMessageDispatcher *messageDispatcher;
  uint64_t v14;
  HMDHomeAdministratorHandler *administratorHandler;
  uint64_t v16;
  HMDBulletinBoard *bulletinBoard;
  uint64_t v18;
  HMMLogEventSubmitting *logEventSubmitter;
  HMDFeaturesDataSource *v20;
  HMDFeaturesDataSource *featuresDataSource;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDHomeActivityStateManagerDataSource;
  v5 = -[HMDHomeActivityStateManagerDataSource init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_home, v4);
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = (NSString *)v8;

    objc_msgSend(v4, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(v4, "msgDispatcher");
    v12 = objc_claimAutoreleasedReturnValue();
    messageDispatcher = v6->_messageDispatcher;
    v6->_messageDispatcher = (HMFMessageDispatcher *)v12;

    objc_msgSend(v4, "administratorHandler");
    v14 = objc_claimAutoreleasedReturnValue();
    administratorHandler = v6->_administratorHandler;
    v6->_administratorHandler = (HMDHomeAdministratorHandler *)v14;

    +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
    v16 = objc_claimAutoreleasedReturnValue();
    bulletinBoard = v6->_bulletinBoard;
    v6->_bulletinBoard = (HMDBulletinBoard *)v16;

    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v18 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v6->_logEventSubmitter;
    v6->_logEventSubmitter = (HMMLogEventSubmitting *)v18;

    v20 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v6->_featuresDataSource;
    v6->_featuresDataSource = v20;

  }
  return v6;
}

- (BOOL)isEligibleForFMFDesignation
{
  if (self)
    LOBYTE(self) = isiOSDevice() || isWatch();
  return (char)self;
}

- (BOOL)isResidentCapable
{
  if (self)
    LOBYTE(self) = isTVOSDevice();
  return (char)self;
}

- (BOOL)hasFinishedLoadingHomeData
{
  void *v2;
  void *v3;
  char v4;

  -[HMDHomeActivityStateManagerDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasLoadedData");

  return v4;
}

- (NSDate)currentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "now");
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  void *v2;
  char v3;

  -[HMDHomeActivityStateManagerDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident");

  return v3;
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (HMFPreferences)preferences
{
  return (HMFPreferences *)objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
}

- (HMCContext)workingStoreContext
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeActivityStateManagerDataSource home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMCContext *)v4;
}

- (HMDLocation)location
{
  return +[HMDLocation sharedManager](HMDLocation, "sharedManager");
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a4, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMDHomeAdministratorHandler)administratorHandler
{
  return self->_administratorHandler;
}

- (HMDBulletinBoard)bulletinBoard
{
  return self->_bulletinBoard;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return self->_featuresDataSource;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_administratorHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);
}

@end
