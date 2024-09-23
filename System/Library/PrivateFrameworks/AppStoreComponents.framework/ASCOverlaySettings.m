@implementation ASCOverlaySettings

+ (ASCOverlaySettings)sharedSettings
{
  if (sharedSettings_onceToken != -1)
    dispatch_once(&sharedSettings_onceToken, &__block_literal_global_21);
  return (ASCOverlaySettings *)(id)sharedSettings_sharedSettings;
}

void __36__ASCOverlaySettings_sharedSettings__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ASCOverlaySettings _init]([ASCOverlaySettings alloc], "_init");
  v1 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v0;

}

- (id)_init
{
  objc_super v4;

  +[ASCEligibility assertCurrentProcessEligibility]();
  v4.receiver = self;
  v4.super_class = (Class)ASCOverlaySettings;
  return -[ASCOverlaySettings init](&v4, sel_init);
}

- (NSNumber)rateLimitRequestsPerSecond
{
  void *v2;
  void *v3;

  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlaysRateLimitRequestsPerSecond");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setRateLimitRequestsPerSecond:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlaysRateLimitRequestsPerSecond:", v3);

}

- (NSNumber)rateLimitTimeWindow
{
  void *v2;
  void *v3;

  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlaysRateLimitTimeWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setRateLimitTimeWindow:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlaysRateLimitTimeWindow:", v3);

}

- (NSNumber)overlaysLoadTimeout
{
  void *v2;
  void *v3;

  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlaysLoadTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setOverlaysLoadTimeout:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ASCDefaults daemonDefaults](ASCDefaults, "daemonDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlaysLoadTimeout:", v3);

}

@end
