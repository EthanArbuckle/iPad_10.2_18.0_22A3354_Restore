@implementation NTKSignificantTimeChangeLogger

+ (void)beginLogging
{
  id v2;

  v2 = (id)objc_msgSend(a1, "sharedInstance");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1)
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_124);
  return (id)sharedInstance___sharedInstance_5;
}

void __48__NTKSignificantTimeChangeLogger_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_5;
  sharedInstance___sharedInstance_5 = v0;

}

- (NTKSignificantTimeChangeLogger)init
{
  NTKSignificantTimeChangeLogger *v2;
  NTKSignificantTimeChangeLogger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKSignificantTimeChangeLogger;
  v2 = -[NTKSignificantTimeChangeLogger init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NTKSignificantTimeChangeLogger _startObserving](v2, "_startObserving");
  return v3;
}

- (void)_handleNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKSignificantTimeChangeLogger _logNotificationReceiptWithName:](self, "_logNotificationReceiptWithName:", v4);

}

- (void)_logNotificationReceiptWithName:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NTKSignificantTimeChangeLogger *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "SignificantTimeChangeLogger %p received notification: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_startObserving
{
  NSObject *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v7;
  NTKSignificantTimeChangeLogger *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(15, (uint64_t)"NTKLoggingDomainSignificantTimeChange");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "SignificantTimeChangeLogger %p began logging", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__handleNotification_, *MEMORY[0x1E0DC4838], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleNotification_, *MEMORY[0x1E0C99690], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleSignificantTimeChangeNotification, CFSTR("SignificantTimeChangeNotification"), 0, (CFNotificationSuspensionBehavior)0);
}

@end
