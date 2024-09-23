@implementation HMDHomePrimaryResidentMessagingHandlerDefaultDataSource

- (HMDHomePrimaryResidentMessagingHandlerDefaultDataSource)init
{
  HMDHomePrimaryResidentMessagingHandlerDefaultDataSource *v2;
  uint64_t v3;
  NSNotificationCenter *notificationCenter;
  uint64_t v5;
  HMFTimerManager *timerManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDHomePrimaryResidentMessagingHandlerDefaultDataSource;
  v2 = -[HMDHomePrimaryResidentMessagingHandlerDefaultDataSource init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A0]), "initWithOptions:", 0);
    timerManager = v2->_timerManager;
    v2->_timerManager = (HMFTimerManager *)v5;

  }
  return v2;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMFTimerManager)timerManager
{
  return self->_timerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
