@implementation CMContinuityCaptureUserNotificationCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_9);
  return (id)_notificationCenter;
}

void __59__CMContinuityCaptureUserNotificationCenter_sharedInstance__block_invoke()
{
  CMContinuityCaptureiOSNotificationCenter *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [CMContinuityCaptureiOSNotificationCenter alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.continuitycapture.usernotification", v4);
  v2 = -[CMContinuityCaptureiOSNotificationCenter initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)_notificationCenter;
  _notificationCenter = v2;

}

+ (void)invalidate
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_notificationCenter)
    objc_msgSend((id)_notificationCenter, "invalidate");
  objc_sync_exit(obj);

}

- (CMContinuityCaptureUserNotificationCenter)initWithQueue:(id)a3
{
  CMContinuityCaptureUserNotificationCenter *v3;
  CMContinuityCaptureUserNotificationCenter *v4;
  CMContinuityCaptureUserNotificationCenter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureUserNotificationCenter;
  v3 = -[CMContinuityCaptureUserNotificationCenter init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%p]"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
