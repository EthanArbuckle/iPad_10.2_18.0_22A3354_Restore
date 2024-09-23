@implementation CMContinuityCaptureUserOnboarding

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)_userOnboarding;
}

void __51__CMContinuityCaptureUserOnboarding_sharedInstance__block_invoke()
{
  CMContinuityCaptureUserOnboarding *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [CMContinuityCaptureUserOnboarding alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.continuitycapture.useronboarding", v4);
  v2 = -[CMContinuityCaptureUserOnboarding initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)_userOnboarding;
  _userOnboarding = v2;

}

- (CMContinuityCaptureUserOnboarding)initWithQueue:(id)a3
{
  CMContinuityCaptureUserOnboarding *v3;
  CMContinuityCaptureUserOnboarding *v4;
  CMContinuityCaptureUserOnboarding *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureUserOnboarding;
  v3 = -[CMContinuityCaptureUserOnboarding init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    -[CMContinuityCaptureUserOnboarding willChangeValueForKey:](v3, "willChangeValueForKey:", CFSTR("state"));
    v4->_state = 3;
    -[CMContinuityCaptureUserOnboarding didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("state"));
    v5 = v4;
  }

  return v4;
}

- (BOOL)logTryItNowAnalytics
{
  CMContinuityCaptureUserOnboarding *v2;
  BOOL logTryItNowAnalytics;

  v2 = self;
  objc_sync_enter(v2);
  logTryItNowAnalytics = v2->_logTryItNowAnalytics;
  objc_sync_exit(v2);

  return logTryItNowAnalytics;
}

- (void)setLogTryItNowAnalytics:(BOOL)a3
{
  CMContinuityCaptureUserOnboarding *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_logTryItNowAnalytics = a3;
  objc_sync_exit(obj);

}

+ (void)invalidate
{
  id obj;

  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_userOnboarding && (objc_msgSend((id)_userOnboarding, "invalidated") & 1) == 0)
    objc_msgSend((id)_userOnboarding, "_invalidate");
  objc_sync_exit(obj);

}

+ (id)stateToString:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
    return off_24F06B280[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected onboarding state %d"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)invalidated
{
  return self->_invalidated;
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

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessPIDByBundleIDWithStreamIntent, 0);
  objc_storeStrong((id *)&self->_pairedActiveProcessPIDsByBundleID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
