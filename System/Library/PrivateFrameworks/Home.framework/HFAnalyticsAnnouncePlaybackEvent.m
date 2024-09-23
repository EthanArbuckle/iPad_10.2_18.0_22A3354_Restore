@implementation HFAnalyticsAnnouncePlaybackEvent

- (HFAnalyticsAnnouncePlaybackEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HFAnalyticsAnnouncePlaybackEvent *v8;
  HFAnalyticsAnnouncePlaybackEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *routeChangeInterruptionReason;
  uint64_t v15;
  NSString *playbackAnnouncementID;
  void *v17;
  uint64_t v18;
  NSString *processName;
  objc_super v21;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsAnnouncePlaybackDurationKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackFailed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsAnnouncePlaybackFailedKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTranscriptionsAreEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    NSLog(CFSTR("HFAnalyticsAudioTranscriptionsEnabledKey is nil"));
  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsAnnouncePlaybackEvent;
  v8 = -[HFAnalyticsEvent initWithEventType:](&v21, sel_initWithEventType_, 19);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_playbackDuration, v5);
    objc_storeStrong((id *)&v9->_playbackFailed, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackWasInterruptedByUser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_playbackInterruptedByUser = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordingWasInterruptedBySystem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_playbackInterruptedBySystem = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackWasInterruptedByRouteChange"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_playbackInterruptedByRouteChange = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routeChangeInterruptionReason"));
    v13 = objc_claimAutoreleasedReturnValue();
    routeChangeInterruptionReason = v9->_routeChangeInterruptionReason;
    v9->_routeChangeInterruptionReason = (NSNumber *)v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("playbackAnnouncementID"));
    v15 = objc_claimAutoreleasedReturnValue();
    playbackAnnouncementID = v9->_playbackAnnouncementID;
    v9->_playbackAnnouncementID = (NSString *)v15;

    objc_storeStrong((id *)&v9->_audioTranscriptionsAreEnabled, v7);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "processName");
    v18 = objc_claimAutoreleasedReturnValue();
    processName = v9->_processName;
    v9->_processName = (NSString *)v18;

  }
  return v9;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsAnnouncePlaybackEvent;
  -[HFAnalyticsEvent payload](&v17, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAnnouncePlaybackEvent playbackDuration](self, "playbackDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("playbackDuration"));

  -[HFAnalyticsAnnouncePlaybackEvent playbackFailed](self, "playbackFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("playbackFailed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedByUser](self, "playbackInterruptedByUser"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("playbackWasInterruptedByUser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedBySystem](self, "playbackInterruptedBySystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("playbackWasInterruptedBySystem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedByRouteChange](self, "playbackInterruptedByRouteChange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("playbackWasInterruptedByRouteChange"));

  -[HFAnalyticsAnnouncePlaybackEvent routeChangeInterruptionReason](self, "routeChangeInterruptionReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HFAnalyticsAnnouncePlaybackEvent routeChangeInterruptionReason](self, "routeChangeInterruptionReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("routeChangeInterruptionReason"));

  }
  -[HFAnalyticsAnnouncePlaybackEvent playbackAnnouncementID](self, "playbackAnnouncementID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HFAnalyticsAnnouncePlaybackEvent playbackAnnouncementID](self, "playbackAnnouncementID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("playbackAnnouncementID"));

  }
  -[HFAnalyticsAnnouncePlaybackEvent audioTranscriptionsAreEnabled](self, "audioTranscriptionsAreEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("audioTranscriptionsAreEnabled"));

  -[HFAnalyticsAnnouncePlaybackEvent processName](self, "processName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("processName"));

  return v4;
}

- (NSNumber)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDuration, a3);
}

- (NSNumber)playbackFailed
{
  return self->_playbackFailed;
}

- (void)setPlaybackFailed:(id)a3
{
  objc_storeStrong((id *)&self->_playbackFailed, a3);
}

- (BOOL)playbackInterruptedByUser
{
  return self->_playbackInterruptedByUser;
}

- (void)setPlaybackInterruptedByUser:(BOOL)a3
{
  self->_playbackInterruptedByUser = a3;
}

- (BOOL)playbackInterruptedBySystem
{
  return self->_playbackInterruptedBySystem;
}

- (void)setPlaybackInterruptedBySystem:(BOOL)a3
{
  self->_playbackInterruptedBySystem = a3;
}

- (BOOL)playbackInterruptedByRouteChange
{
  return self->_playbackInterruptedByRouteChange;
}

- (void)setPlaybackInterruptedByRouteChange:(BOOL)a3
{
  self->_playbackInterruptedByRouteChange = a3;
}

- (NSNumber)routeChangeInterruptionReason
{
  return self->_routeChangeInterruptionReason;
}

- (void)setRouteChangeInterruptionReason:(id)a3
{
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, a3);
}

- (NSString)playbackAnnouncementID
{
  return self->_playbackAnnouncementID;
}

- (void)setPlaybackAnnouncementID:(id)a3
{
  objc_storeStrong((id *)&self->_playbackAnnouncementID, a3);
}

- (NSNumber)audioTranscriptionsAreEnabled
{
  return self->_audioTranscriptionsAreEnabled;
}

- (void)setAudioTranscriptionsAreEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_audioTranscriptionsAreEnabled, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_audioTranscriptionsAreEnabled, 0);
  objc_storeStrong((id *)&self->_playbackAnnouncementID, 0);
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, 0);
  objc_storeStrong((id *)&self->_playbackFailed, 0);
  objc_storeStrong((id *)&self->_playbackDuration, 0);
}

@end
