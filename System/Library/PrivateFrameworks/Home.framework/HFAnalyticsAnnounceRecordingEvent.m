@implementation HFAnalyticsAnnounceRecordingEvent

- (HFAnalyticsAnnounceRecordingEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFAnalyticsAnnounceRecordingEvent *v7;
  HFAnalyticsAnnounceRecordingEvent *v8;
  uint64_t v9;
  NSNumber *announceRecordingIsForHome;
  uint64_t v11;
  NSString *announceRecordingIsForRoom;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSNumber *routeChangeInterruptionReason;
  uint64_t v19;
  NSString *recipientAnnouncementID;
  void *v21;
  uint64_t v22;
  NSString *processName;
  objc_super v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceRecordingDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("HFAnalyticsAnnounceRecordingDurationKey is nil"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordingFailed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("HFAnalyticsAnnounceRecordingFailedKey is nil"));
  v25.receiver = self;
  v25.super_class = (Class)HFAnalyticsAnnounceRecordingEvent;
  v7 = -[HFAnalyticsEvent initWithEventType:](&v25, sel_initWithEventType_, 18);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_recordingDuration, v5);
    objc_storeStrong((id *)&v8->_recordingFailed, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceRecordingIsForHome"));
    v9 = objc_claimAutoreleasedReturnValue();
    announceRecordingIsForHome = v8->_announceRecordingIsForHome;
    v8->_announceRecordingIsForHome = (NSNumber *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceRecordingIsForRoom"));
    v11 = objc_claimAutoreleasedReturnValue();
    announceRecordingIsForRoom = v8->_announceRecordingIsForRoom;
    v8->_announceRecordingIsForRoom = (NSString *)v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordingWasInterruptedByUser"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_recordingInterruptedByUser = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordingWasInterruptedBySystem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_recordingInterruptedBySystem = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recordingWasInterruptedByRouteChange"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_recordingInterruptedByRouteChange = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isAReply"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isAReply = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("routeChangeInterruptionReason"));
    v17 = objc_claimAutoreleasedReturnValue();
    routeChangeInterruptionReason = v8->_routeChangeInterruptionReason;
    v8->_routeChangeInterruptionReason = (NSNumber *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientAnnouncementID"));
    v19 = objc_claimAutoreleasedReturnValue();
    recipientAnnouncementID = v8->_recipientAnnouncementID;
    v8->_recipientAnnouncementID = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "processName");
    v22 = objc_claimAutoreleasedReturnValue();
    processName = v8->_processName;
    v8->_processName = (NSString *)v22;

  }
  return v8;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsAnnounceRecordingEvent;
  -[HFAnalyticsEvent payload](&v21, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsAnnounceRecordingEvent recordingDuration](self, "recordingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("recordingDuration"));

  -[HFAnalyticsAnnounceRecordingEvent recordingFailed](self, "recordingFailed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("recordingFailed"));

  -[HFAnalyticsAnnounceRecordingEvent announceRecordingIsForHome](self, "announceRecordingIsForHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFAnalyticsAnnounceRecordingEvent announceRecordingIsForHome](self, "announceRecordingIsForHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("announceRecordingIsForHome"));

  }
  -[HFAnalyticsAnnounceRecordingEvent announceRecordingIsForRoom](self, "announceRecordingIsForRoom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HFAnalyticsAnnounceRecordingEvent announceRecordingIsForRoom](self, "announceRecordingIsForRoom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("announceRecordingIsForRoom"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedByUser](self, "recordingInterruptedByUser"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("recordingWasInterruptedByUser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedBySystem](self, "recordingInterruptedBySystem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("recordingWasInterruptedBySystem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedByRouteChange](self, "recordingInterruptedByRouteChange"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("recordingWasInterruptedByRouteChange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent isAReply](self, "isAReply"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("recordingIsAReply"));

  -[HFAnalyticsAnnounceRecordingEvent routeChangeInterruptionReason](self, "routeChangeInterruptionReason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HFAnalyticsAnnounceRecordingEvent routeChangeInterruptionReason](self, "routeChangeInterruptionReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("routeChangeInterruptionReason"));

  }
  -[HFAnalyticsAnnounceRecordingEvent recipientAnnouncementID](self, "recipientAnnouncementID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HFAnalyticsAnnounceRecordingEvent recipientAnnouncementID](self, "recipientAnnouncementID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("recipientAnnouncementID"));

  }
  -[HFAnalyticsAnnounceRecordingEvent processName](self, "processName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("processName"));

  return v4;
}

- (NSNumber)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(id)a3
{
  objc_storeStrong((id *)&self->_recordingDuration, a3);
}

- (NSNumber)recordingFailed
{
  return self->_recordingFailed;
}

- (void)setRecordingFailed:(id)a3
{
  objc_storeStrong((id *)&self->_recordingFailed, a3);
}

- (NSNumber)announceRecordingIsForHome
{
  return self->_announceRecordingIsForHome;
}

- (void)setAnnounceRecordingIsForHome:(id)a3
{
  objc_storeStrong((id *)&self->_announceRecordingIsForHome, a3);
}

- (NSString)announceRecordingIsForRoom
{
  return self->_announceRecordingIsForRoom;
}

- (void)setAnnounceRecordingIsForRoom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)recordingInterruptedByUser
{
  return self->_recordingInterruptedByUser;
}

- (void)setRecordingInterruptedByUser:(BOOL)a3
{
  self->_recordingInterruptedByUser = a3;
}

- (BOOL)recordingInterruptedBySystem
{
  return self->_recordingInterruptedBySystem;
}

- (void)setRecordingInterruptedBySystem:(BOOL)a3
{
  self->_recordingInterruptedBySystem = a3;
}

- (BOOL)recordingInterruptedByRouteChange
{
  return self->_recordingInterruptedByRouteChange;
}

- (void)setRecordingInterruptedByRouteChange:(BOOL)a3
{
  self->_recordingInterruptedByRouteChange = a3;
}

- (BOOL)isAReply
{
  return self->_isAReply;
}

- (void)setIsAReply:(BOOL)a3
{
  self->_isAReply = a3;
}

- (NSNumber)routeChangeInterruptionReason
{
  return self->_routeChangeInterruptionReason;
}

- (void)setRouteChangeInterruptionReason:(id)a3
{
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, a3);
}

- (NSString)recipientAnnouncementID
{
  return self->_recipientAnnouncementID;
}

- (void)setRecipientAnnouncementID:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAnnouncementID, a3);
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
  objc_storeStrong((id *)&self->_recipientAnnouncementID, 0);
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, 0);
  objc_storeStrong((id *)&self->_announceRecordingIsForRoom, 0);
  objc_storeStrong((id *)&self->_announceRecordingIsForHome, 0);
  objc_storeStrong((id *)&self->_recordingFailed, 0);
  objc_storeStrong((id *)&self->_recordingDuration, 0);
}

@end
