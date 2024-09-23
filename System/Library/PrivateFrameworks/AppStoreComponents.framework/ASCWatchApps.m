@implementation ASCWatchApps

+ (ASCWatchApps)sharedWatchApps
{
  if (sharedWatchApps_onceToken != -1)
    dispatch_once(&sharedWatchApps_onceToken, &__block_literal_global_30);
  return (ASCWatchApps *)(id)sharedWatchApps_sharedWatchApps;
}

void __31__ASCWatchApps_sharedWatchApps__block_invoke()
{
  ASCWatchApps *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ASCWatchApps alloc];
  +[ASCAppOfferStateCenter sharedCenter](ASCAppOfferStateCenter, "sharedCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ASCWatchApps initWithAppOfferStateCenter:](v0, "initWithAppOfferStateCenter:", v3);
  v2 = (void *)sharedWatchApps_sharedWatchApps;
  sharedWatchApps_sharedWatchApps = v1;

}

- (ASCWatchApps)initWithAppOfferStateCenter:(id)a3
{
  id v5;
  ASCWatchApps *v6;
  ASCWatchApps *v7;
  objc_super v9;

  v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v9.receiver = self;
  v9.super_class = (Class)ASCWatchApps;
  v6 = -[ASCWatchApps init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appOfferStateCenter, a3);

  return v7;
}

- (id)reinstallAppWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASCWatchApps appOfferStateCenter](self, "appOfferStateCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reinstallWatchAppWithID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reinstallSystemAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASCWatchApps appOfferStateCenter](self, "appOfferStateCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reinstallWatchSystemAppWithBundleID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ASCAppOfferStateCenter)appOfferStateCenter
{
  return self->_appOfferStateCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appOfferStateCenter, 0);
}

@end
