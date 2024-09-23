@implementation ACNotificationRebroadcaster

void __50__ACNotificationRebroadcaster_sharedRebroadcaster__block_invoke()
{
  ACNotificationRebroadcaster *v0;
  void *v1;

  v0 = objc_alloc_init(ACNotificationRebroadcaster);
  v1 = (void *)sharedRebroadcaster_sharedRebroadcaster;
  sharedRebroadcaster_sharedRebroadcaster = (uint64_t)v0;

}

- (ACNotificationRebroadcaster)init
{
  ACNotificationRebroadcaster *v2;
  ACNotificationRebroadcaster *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACNotificationRebroadcaster;
  v2 = -[ACNotificationRebroadcaster init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ACNotificationRebroadcaster _beginObservingAccountStoreDidChangeNotifications](v2, "_beginObservingAccountStoreDidChangeNotifications");
  return v3;
}

- (void)_beginObservingAccountStoreDidChangeNotifications
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1A8589E88](self, a2);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel__accountStoreDidChange_, CFSTR("ACDAccountStoreDidChangeNotification"), 0, 4);

  objc_autoreleasePoolPop(v3);
}

+ (ACNotificationRebroadcaster)sharedRebroadcaster
{
  if (sharedRebroadcaster_onceToken != -1)
    dispatch_once(&sharedRebroadcaster_onceToken, &__block_literal_global_11);
  return (ACNotificationRebroadcaster *)(id)sharedRebroadcaster_sharedRebroadcaster;
}

- (void)dealloc
{
  objc_super v3;

  -[ACNotificationRebroadcaster _endObservingAccountStoreDidChangeNotifications](self, "_endObservingAccountStoreDidChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ACNotificationRebroadcaster;
  -[ACNotificationRebroadcaster dealloc](&v3, sel_dealloc);
}

- (void)_accountStoreDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x1A8589E88]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("ACDAccountStoreDidChangeNotification"), self, v6);

  objc_autoreleasePoolPop(v4);
}

- (void)_endObservingAccountStoreDidChangeNotifications
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1A8589E88](self, a2);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ACDAccountStoreDidChangeNotification"), 0);

  objc_autoreleasePoolPop(v3);
}

@end
