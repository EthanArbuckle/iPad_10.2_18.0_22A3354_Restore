@implementation ATXWalletDataSourceSharedData

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken1 != -1)
    dispatch_once(&sharedInstance__pasOnceToken1, &__block_literal_global_1);
  return (id)sharedInstance__pasExprOnceResult;
}

void __47__ATXWalletDataSourceSharedData_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA46CBC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXWalletDataSourceSharedData)init
{
  ATXWalletDataSourceSharedData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXWalletDataSourceSharedData;
  v2 = -[ATXWalletDataSourceSharedData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passesDidChange, *MEMORY[0x1E0D6A780], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passesDidChange, *MEMORY[0x1E0D6A7A0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passesDidChange, *MEMORY[0x1E0D6A798], 0);

  }
  return v2;
}

- (void)_passesDidChange
{
  NSDate *lastWalletPassCheckDate;
  ATXWalletDataSourceSharedData *obj;

  obj = self;
  objc_sync_enter(obj);
  lastWalletPassCheckDate = obj->_lastWalletPassCheckDate;
  obj->_lastWalletPassCheckDate = 0;

  obj->_hasEmptyWalletPasses = 0;
  objc_sync_exit(obj);

}

- (BOOL)hasEmptyWalletPasses
{
  ATXWalletDataSourceSharedData *v2;
  double v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  v4 = 0;
  if (v2->_hasEmptyWalletPasses)
  {
    -[NSDate timeIntervalSinceNow](v2->_lastWalletPassCheckDate, "timeIntervalSinceNow");
    if (fabs(v3) < 7200.0)
      v4 = 1;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setHasEmptyWalletPasses:(BOOL)a3
{
  uint64_t v4;
  NSDate *lastWalletPassCheckDate;
  ATXWalletDataSourceSharedData *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_hasEmptyWalletPasses = a3;
  v4 = objc_opt_new();
  lastWalletPassCheckDate = obj->_lastWalletPassCheckDate;
  obj->_lastWalletPassCheckDate = (NSDate *)v4;

  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWalletPassCheckDate, 0);
}

@end
