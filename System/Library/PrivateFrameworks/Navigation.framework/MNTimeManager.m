@implementation MNTimeManager

+ (id)sharedManager
{
  if (qword_1ED0C4110 != -1)
    dispatch_once(&qword_1ED0C4110, &__block_literal_global_47);
  return (id)_MergedGlobals_47;
}

void __30__MNTimeManager_sharedManager__block_invoke()
{
  MNTimeManager *v0;
  void *v1;

  v0 = objc_alloc_init(MNTimeManager);
  v1 = (void *)_MergedGlobals_47;
  _MergedGlobals_47 = (uint64_t)v0;

}

+ (double)currentTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTime");
  v5 = v4;

  return v5;
}

+ (NSDate)currentDate
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "currentTime");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (MNTimeManager)init
{
  MNTimeManager *v2;
  MNDeviceTimeProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNTimeManager;
  v2 = -[MNTimeManager init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MNDeviceTimeProvider);
    -[MNTimeManager setProvider:](v2, "setProvider:", v3);

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  MNObserverHashTable *timeManagerObservers;
  MNObserverHashTable *v6;
  MNObserverHashTable *v7;
  id v8;

  v4 = a3;
  timeManagerObservers = self->_timeManagerObservers;
  v8 = v4;
  if (!timeManagerObservers)
  {
    v6 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEEDBD18);
    v7 = self->_timeManagerObservers;
    self->_timeManagerObservers = v6;

    v4 = v8;
    timeManagerObservers = self->_timeManagerObservers;
  }
  -[MNObserverHashTable registerObserver:](timeManagerObservers, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  -[MNObserverHashTable unregisterObserver:](self->_timeManagerObservers, "unregisterObserver:", a3);
}

- (void)setProvider:(id)a3
{
  id v5;

  v5 = a3;
  if (v5)
    objc_storeStrong((id *)&self->_provider, a3);
  else
    -[MNTimeManager _resetToDefaultProvider](self, "_resetToDefaultProvider");
  -[MNObserverHashTable timeManagerDidChangeProvider:](self->_timeManagerObservers, "timeManagerDidChangeProvider:", self);

}

- (void)_resetToDefaultProvider
{
  MNDeviceTimeProvider *v3;
  MNTimeProvider *provider;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_alloc_init(MNDeviceTimeProvider);
    provider = self->_provider;
    self->_provider = (MNTimeProvider *)v3;

  }
}

- (MNTimeProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_timeManagerObservers, 0);
}

@end
