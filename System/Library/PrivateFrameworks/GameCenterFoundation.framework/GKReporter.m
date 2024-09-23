@implementation GKReporter

+ (id)reporter
{
  if (reporter_sDispatchOnceToken_0 != -1)
    dispatch_once(&reporter_sDispatchOnceToken_0, &__block_literal_global_52);
  return (id)reporter_sReporter_0;
}

void __22__GKReporter_reporter__block_invoke()
{
  GKReporter *v0;
  void *v1;

  v0 = objc_alloc_init(GKReporter);
  v1 = (void *)reporter_sReporter_0;
  reporter_sReporter_0 = (uint64_t)v0;

}

- (void)reportEvent:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "GKReporter: report domain: %@, payload: %@", (uint8_t *)&v9, 0x16u);
  }
  AnalyticsSendEvent();

}

- (void)reportEvent:(id)a3 type:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("eventType");
  v11[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v8, v9);
}

- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5
{
  -[GKReporter reportEvent:type:startTime:refApp:](self, "reportEvent:type:startTime:refApp:", a3, a4, a5, 0);
}

- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5 refApp:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a5;
  objc_msgSend(v12, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v13);
  v16 = v15;

  if (-[GKReporter isTimeSpanValid:maxDuration:](self, "isTimeSpanValid:maxDuration:", v16, 3600.0))
    -[GKReporter reportEvent:eventType:duration:refApp:](self, "reportEvent:eventType:duration:refApp:", v17, v10, v11, v16);

}

- (void)reportEvent:(id)a3 type:(id)a4 bundleID:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("eventType");
  v12[1] = CFSTR("bundleID");
  v13[0] = a4;
  v13[1] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

- (void)reportEvent:(id)a3 type:(id)a4 adamID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  const __CFString *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v16[0] = CFSTR("eventType");
    v16[1] = CFSTR("adamID");
    v17[0] = a4;
    v8 = a4;
    v9 = a3;
    objc_msgSend(a5, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v9, v11);
  }
  else
  {
    v14 = CFSTR("eventType");
    v15 = a4;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = a4;
    v11 = a3;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v11, v10);
  }

}

- (void)reportEvent:(id)a3 type:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4)
  {
    v15 = CFSTR("eventType");
    v16[0] = a4;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = a4;
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v14, "addEntriesFromDictionary:", v10);
  }
  else
  {
    v14 = v9;
  }
  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v8, v14);

}

- (void)reportEvent:(id)a3 type:(id)a4 friendsPlayedThisGame:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v13[1] = CFSTR("friendsPlayedThisGame");
  v14[0] = a4;
  v14[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v11, v12);
}

- (void)reportEvent:(id)a3 type:(id)a4 count:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v13[1] = CFSTR("count");
  v14[0] = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v10, v12);
}

- (void)reportEvent:(id)a3 type:(id)a4 inboxFriendRequestCount:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v13[1] = CFSTR("inboxFriendRequestCount");
  v14[0] = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v10, v12);
}

- (void)reportEvent:(id)a3 type:(id)a4 scoreRank:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("eventType");
  v13[1] = CFSTR("scoreRank");
  v14[0] = a4;
  v14[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v11, v12);
}

- (void)reportEvent:(id)a3 target:(id)a4 keyPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "valueForKeyPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v9, v12);
}

- (void)reportEvent:(id)a3 reportable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "reportableKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        +[GKReporter reporter](GKReporter, "reporter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reportEvent:target:keyPath:", v5, v6, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)isTimeSpanValid:(double)a3 maxDuration:(double)a4
{
  return a3 < a4 && a3 > 0.0;
}

- (void)recordAuthenticateResponseTimestamp
{
  -[GKReporter setAuthenticateResponseTimestamp:](self, "setAuthenticateResponseTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportAuthenticateResponseDuration
{
  double v3;

  -[GKReporter authenticateResponseTimestamp](self, "authenticateResponseTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter authenticateResponseTimestamp](self, "authenticateResponseTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKAuthenticateResponseTime"));
    -[GKReporter setAuthenticateResponseTimestamp:](self, "setAuthenticateResponseTimestamp:", -1.0);
  }
}

- (void)recordInviteeUILaunchTimestamp
{
  -[GKReporter setInviteeUILaunchTimestamp:](self, "setInviteeUILaunchTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportInviteeUILaunchDuration
{
  double v3;

  -[GKReporter inviteeUILaunchTimestamp](self, "inviteeUILaunchTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter inviteeUILaunchTimestamp](self, "inviteeUILaunchTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKInviteeUILaunchTime"));
    -[GKReporter setInviteeUILaunchTimestamp:](self, "setInviteeUILaunchTimestamp:", -1.0);
  }
}

- (void)recordMessageInviteProcessingTimestamp
{
  -[GKReporter setMessageInviteProcessingTimestamp:](self, "setMessageInviteProcessingTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportMessageInviteProcessingDuration
{
  double v3;

  -[GKReporter messageInviteProcessingTimestamp](self, "messageInviteProcessingTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter messageInviteProcessingTimestamp](self, "messageInviteProcessingTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKMessageInviteProcessingTime"));
    -[GKReporter setMessageInviteProcessingTimestamp:](self, "setMessageInviteProcessingTimestamp:", -1.0);
  }
}

- (void)recordConnectingDevicesTimestamp
{
  -[GKReporter setConnectingDevicesTimestamp:](self, "setConnectingDevicesTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportConnectingDevicesDuration
{
  double v3;

  -[GKReporter connectingDevicesTimestamp](self, "connectingDevicesTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter connectingDevicesTimestamp](self, "connectingDevicesTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKConnectingDevicesTime"));
    -[GKReporter setConnectingDevicesTimestamp:](self, "setConnectingDevicesTimestamp:", -1.0);
  }
}

- (void)recordProgramaticInviteTimestamp
{
  -[GKReporter setProgramaticInviteTimestamp:](self, "setProgramaticInviteTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportProgramaticInviteDuration
{
  double v3;

  -[GKReporter programaticInviteTimestamp](self, "programaticInviteTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter programaticInviteTimestamp](self, "programaticInviteTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKProgramaticInviteTime"));
    -[GKReporter setProgramaticInviteTimestamp:](self, "setProgramaticInviteTimestamp:", -1.0);
  }
}

- (void)recordAppLaunchAndTotalTimestamp
{
  -[GKReporter setAppLaunchTimestamp:](self, "setAppLaunchTimestamp:", CFAbsoluteTimeGetCurrent());
  -[GKReporter setTotalInviteReceivedTimestamp:](self, "setTotalInviteReceivedTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportAppLaunchDuration
{
  double v3;

  -[GKReporter appLaunchTimestamp](self, "appLaunchTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter appLaunchTimestamp](self, "appLaunchTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKAppLaunchTime"));
    -[GKReporter setAppLaunchTimestamp:](self, "setAppLaunchTimestamp:", -1.0);
  }
}

- (void)reportTotalInviteReceivedDuration
{
  double v3;

  -[GKReporter totalInviteReceivedTimestamp](self, "totalInviteReceivedTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter totalInviteReceivedTimestamp](self, "totalInviteReceivedTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.Invite.ReceivedTime"), CFSTR("GKTotalInviteReceivedTime"));
    -[GKReporter setTotalInviteReceivedTimestamp:](self, "setTotalInviteReceivedTimestamp:", -1.0);
  }
}

- (void)recordCurrentRealtimeMatchPersistenceTimestamp
{
  -[GKReporter setCurrentRealtimeMatchPersistenceTimestamp:](self, "setCurrentRealtimeMatchPersistenceTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)reportCurrentRealtimeMatchPersistenceDuration
{
  double v3;

  -[GKReporter currentRealtimeMatchPersistenceTimestamp](self, "currentRealtimeMatchPersistenceTimestamp");
  if (v3 > 0.0)
  {
    -[GKReporter currentRealtimeMatchPersistenceTimestamp](self, "currentRealtimeMatchPersistenceTimestamp");
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", CFSTR("com.apple.GameKit.multiplayer.realtime.connectionResult"), CFSTR("GKRealtimeMatchPersistenceTime"));
    -[GKReporter setCurrentRealtimeMatchPersistenceTimestamp:](self, "setCurrentRealtimeMatchPersistenceTimestamp:", -1.0);
  }
}

- (void)reportScreenTimeEventForType:(id)a3 withStartTimestamp:(double)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = CFAbsoluteTimeGetCurrent() - a4;
  if (-[GKReporter isTimeSpanValid:maxDuration:](self, "isTimeSpanValid:maxDuration:", v7, 600.0))
  {
    v10[0] = CFSTR("eventType");
    v10[1] = CFSTR("timeSpan");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", CFSTR("com.apple.GameKit.GameLayerDashboard"), v9);

  }
}

- (void)reportOnboardingEventForType:(id)a3 withStartTimestamp:(double)a4 refApp:(id)a5
{
  id v8;
  double v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = CFAbsoluteTimeGetCurrent() - a4;
  if (-[GKReporter isTimeSpanValid:maxDuration:](self, "isTimeSpanValid:maxDuration:", v9, 900.0))
    -[GKReporter reportEvent:eventType:duration:refApp:](self, "reportEvent:eventType:duration:refApp:", CFSTR("com.apple.GameKit.Onboarding"), v10, v8, v9);

}

- (void)reportEvent:(id)a3 eventType:(id)a4 duration:(double)a5 refApp:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v16 = objc_alloc_init(v10);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("eventType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("timeSpan"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("refApp"));
  v15 = (void *)objc_msgSend(v16, "copy");
  -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v13, v15);

}

- (void)reportDurationForEvent:(id)a3 eventType:(id)a4 withStartTimestamp:(double)a5
{
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = CFAbsoluteTimeGetCurrent() - a5;
  if (-[GKReporter isTimeSpanValid:maxDuration:](self, "isTimeSpanValid:maxDuration:", v10, 3600.0))
  {
    v13[0] = CFSTR("eventType");
    v13[1] = CFSTR("timeSpan");
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKReporter reportEvent:payload:](self, "reportEvent:payload:", v8, v12);

  }
}

- (void)reportPlayerAuthenticationFailure:(id)a3
{
  unint64_t v4;
  const __CFString *v5;

  v4 = objc_msgSend(a3, "code") - 5000;
  if (v4 > 0xAA)
    v5 = CFSTR("GKReporterPlayerAuthenticationFailureUnknownReason");
  else
    v5 = off_1E75B7448[v4];
  -[GKReporter reportEvent:type:](self, "reportEvent:type:", CFSTR("com.apple.GameKit.PlayerAuthentication"), v5);
}

- (double)authenticateResponseTimestamp
{
  return self->_authenticateResponseTimestamp;
}

- (void)setAuthenticateResponseTimestamp:(double)a3
{
  self->_authenticateResponseTimestamp = a3;
}

- (double)inviteeUILaunchTimestamp
{
  return self->_inviteeUILaunchTimestamp;
}

- (void)setInviteeUILaunchTimestamp:(double)a3
{
  self->_inviteeUILaunchTimestamp = a3;
}

- (double)connectingDevicesTimestamp
{
  return self->_connectingDevicesTimestamp;
}

- (void)setConnectingDevicesTimestamp:(double)a3
{
  self->_connectingDevicesTimestamp = a3;
}

- (double)programaticInviteTimestamp
{
  return self->_programaticInviteTimestamp;
}

- (void)setProgramaticInviteTimestamp:(double)a3
{
  self->_programaticInviteTimestamp = a3;
}

- (double)appLaunchTimestamp
{
  return self->_appLaunchTimestamp;
}

- (void)setAppLaunchTimestamp:(double)a3
{
  self->_appLaunchTimestamp = a3;
}

- (double)totalInviteReceivedTimestamp
{
  return self->_totalInviteReceivedTimestamp;
}

- (void)setTotalInviteReceivedTimestamp:(double)a3
{
  self->_totalInviteReceivedTimestamp = a3;
}

- (double)messageInviteProcessingTimestamp
{
  return self->_messageInviteProcessingTimestamp;
}

- (void)setMessageInviteProcessingTimestamp:(double)a3
{
  self->_messageInviteProcessingTimestamp = a3;
}

- (double)currentRealtimeMatchPersistenceTimestamp
{
  return self->_currentRealtimeMatchPersistenceTimestamp;
}

- (void)setCurrentRealtimeMatchPersistenceTimestamp:(double)a3
{
  self->_currentRealtimeMatchPersistenceTimestamp = a3;
}

@end
