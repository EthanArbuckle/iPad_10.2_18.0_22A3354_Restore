@implementation ATXNowPlayingDataProvider

- (ATXNowPlayingDataProvider)init
{
  ATXNowPlayingDataProvider *v2;
  uint64_t v3;
  ATXCoreDuetContextHelper *coreDuetContextHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXNowPlayingDataProvider;
  v2 = -[ATXNowPlayingDataProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    coreDuetContextHelper = v2->_coreDuetContextHelper;
    v2->_coreDuetContextHelper = (ATXCoreDuetContextHelper *)v3;

  }
  return v2;
}

- (id)currentNowPlayingEvent
{
  ATXCoreDuetContextHelper *coreDuetContextHelper;
  void *v3;
  void *v4;
  ATXNowPlayingEvent *v5;

  coreDuetContextHelper = self->_coreDuetContextHelper;
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForNowPlayingDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCoreDuetContextHelper fetchDataDictionaryForKeyPath:](coreDuetContextHelper, "fetchDataDictionaryForKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ATXNowPlayingEvent initWithContextInfo:]([ATXNowPlayingEvent alloc], "initWithContextInfo:", v4);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNowPlayingEvent, 0);
  objc_storeStrong((id *)&self->_coreDuetContextHelper, 0);
}

- (BOOL)isTVExperienceAppNowPlaying
{
  ATXNowPlayingEvent *lastNowPlayingEvent;
  ATXNowPlayingEvent *v4;
  ATXNowPlayingEvent *v5;

  lastNowPlayingEvent = self->_lastNowPlayingEvent;
  if (!lastNowPlayingEvent)
  {
    -[ATXNowPlayingDataProvider currentNowPlayingEvent](self, "currentNowPlayingEvent");
    v4 = (ATXNowPlayingEvent *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lastNowPlayingEvent;
    self->_lastNowPlayingEvent = v4;

    lastNowPlayingEvent = self->_lastNowPlayingEvent;
  }
  return -[ATXNowPlayingEvent isTVExperienceAppNowPlaying](lastNowPlayingEvent, "isTVExperienceAppNowPlaying");
}

@end
