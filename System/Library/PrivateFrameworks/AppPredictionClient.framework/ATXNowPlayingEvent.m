@implementation ATXNowPlayingEvent

- (ATXNowPlayingEvent)initWithContextInfo:(id)a3
{
  id v4;
  ATXNowPlayingEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXNowPlayingEvent;
  v5 = -[ATXNowPlayingEvent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingBundleIdKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = &stru_1E4D5DB30;
    objc_storeStrong((id *)&v5->_bundleId, v9);

    objc_msgSend(MEMORY[0x1E0D15C58], "nowPlayingStatusKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_nowPlayingState = objc_msgSend(v11, "integerValue");

  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int64_t)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (BOOL)isTVExperienceAppNowPlaying
{
  void *v3;
  BOOL v4;

  if (-[ATXNowPlayingEvent nowPlayingState](self, "nowPlayingState") != 1)
    return 0;
  -[ATXNowPlayingEvent bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXAVRoutingUtils isTVExperienceAppWithBundleId:](ATXAVRoutingUtils, "isTVExperienceAppWithBundleId:", v3);

  return v4;
}

@end
