@implementation MPCPlaybackPerformanceController

- (id)trialExperimentWithNamespaceName:(id)a3
{
  return 0;
}

+ (MPCPlaybackPerformanceController)sharedController
{
  if (sharedController_onceToken[0] != -1)
    dispatch_once(sharedController_onceToken, &__block_literal_global_11320);
  return (MPCPlaybackPerformanceController *)(id)sharedController___sharedController;
}

void __52__MPCPlaybackPerformanceController_sharedController__block_invoke()
{
  MPCPlaybackPerformanceController *v0;
  void *v1;

  v0 = objc_alloc_init(MPCPlaybackPerformanceController);
  v1 = (void *)sharedController___sharedController;
  sharedController___sharedController = (uint64_t)v0;

}

- (MPCPlaybackPerformanceController)init
{
  MPCPlaybackPerformanceController *v2;
  MPCPlaybackPerformanceController *v3;
  uint64_t v4;
  NSMutableDictionary *trialExperiments;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackPerformanceController;
  v2 = -[MPCPlaybackPerformanceController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    trialExperiments = v3->_trialExperiments;
    v3->_trialExperiments = (NSMutableDictionary *)v4;

    if ((_os_feature_enabled_impl() & 1) != 0
      || _os_feature_enabled_impl()
      && (MSVDeviceIsAudioAccessory() & 1) == 0
      && ICCurrentApplicationIsSystemApp())
    {
      objc_msgSend(MEMORY[0x24BDB2678], "defaultController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "permitReclamationWhileSuspended");

    }
  }
  return v3;
}

- (id)sortedExperiments
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_trialExperiments, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSString)experimentID
{
  void *v2;
  void *v3;
  void *v4;

  -[MPCPlaybackPerformanceController sortedExperiments](self, "sortedExperiments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)treatmentID
{
  void *v2;
  void *v3;
  void *v4;

  -[MPCPlaybackPerformanceController sortedExperiments](self, "sortedExperiments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)deploymentID
{
  void *v2;
  void *v3;
  void *v4;

  -[MPCPlaybackPerformanceController sortedExperiments](self, "sortedExperiments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_compactMap:", &__block_literal_global_12_11305);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)warmCDNConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  -[MPCPlaybackPerformanceController trialExperimentWithNamespaceName:](self, "trialExperimentWithNamespaceName:", CFSTR("MUSIC_PLAYBACK_PERFORMANCE_WARMING_CDN"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    v18 = v3;
    objc_msgSend(v3, "stringForFactor:", CFSTR("assetURL1"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v18, "stringForFactor:", CFSTR("assetURL2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v6 | v9)
    {
      objc_msgSend(v18, "doubleForFactor:", CFSTR("warmingInterval"));
      v11 = v10;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(&self->_lock);
      -[MPCPlaybackPerformanceController lastCDNWarming](self, "lastCDNWarming");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13
        && (v14 = (void *)v13,
            -[MPCPlaybackPerformanceController lastCDNWarming](self, "lastCDNWarming"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "timeIntervalSinceDate:", v15),
            v17 = v16,
            v15,
            v14,
            v17 <= v11))
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        -[MPCPlaybackPerformanceController setLastCDNWarming:](self, "setLastCDNWarming:", v12);
        os_unfair_lock_unlock(&self->_lock);
        if (v6)
          -[MPCPlaybackPerformanceController loadAVAssetWithURL:](self, "loadAVAssetWithURL:", v6);
        if (v9)
          -[MPCPlaybackPerformanceController loadAVAssetWithURL:](self, "loadAVAssetWithURL:", v9);
      }

    }
    v3 = v18;
  }

}

- (void)markCDNConnectionWarmed
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackPerformanceController setLastCDNWarming:](self, "setLastCDNWarming:", v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)loadAVAssetWithURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "Warming asset CDN connection with URL: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDB26C8], "assetWithURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__MPCPlaybackPerformanceController_loadAVAssetWithURL___block_invoke;
  v7[3] = &unk_24CABA2D0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_24CB173E0, v7);

}

- (NSDate)lastCDNWarming
{
  return self->_lastCDNWarming;
}

- (void)setLastCDNWarming:(id)a3
{
  objc_storeStrong((id *)&self->_lastCDNWarming, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCDNWarming, 0);
  objc_storeStrong((id *)&self->_trialExperiments, 0);
}

void __55__MPCPlaybackPerformanceController_loadAVAssetWithURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "Completed warming asset CDN connection with asset: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

uint64_t __48__MPCPlaybackPerformanceController_deploymentID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deploymentID");
}

uint64_t __47__MPCPlaybackPerformanceController_treatmentID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "treatmentID");
}

uint64_t __48__MPCPlaybackPerformanceController_experimentID__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "experimentID");
}

uint64_t __53__MPCPlaybackPerformanceController_sortedExperiments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "experimentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
