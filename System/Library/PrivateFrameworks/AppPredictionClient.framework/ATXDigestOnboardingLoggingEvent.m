@implementation ATXDigestOnboardingLoggingEvent

- (ATXDigestOnboardingLoggingEvent)initWithSessionUUID:(id)a3 entrySource:(int)a4 digestOnboardingOutcome:(int)a5 finalUIShown:(int)a6 didSelectShowMore:(BOOL)a7 timeTaken:(double)a8 deliveryTimes:(id)a9
{
  id v17;
  id v18;
  ATXDigestOnboardingLoggingEvent *v19;
  ATXDigestOnboardingLoggingEvent *v20;
  objc_super v22;

  v17 = a3;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ATXDigestOnboardingLoggingEvent;
  v19 = -[ATXDigestOnboardingLoggingEvent init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionUUID, a3);
    v20->_entrySource = a4;
    v20->_digestOnboardingOutcome = a5;
    v20->_finalUIShown = a6;
    v20->_didSelectShowMore = a7;
    v20->_timeTaken = a8;
    objc_storeStrong((id *)&v20->_deliveryTimes, a9);
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (ATXDigestOnboardingLoggingEvent)initWithProtoData:(id)a3
{
  id v4;
  ATXPBDigestOnboardingLoggingEvent *v5;
  ATXDigestOnboardingLoggingEvent *v6;

  v4 = a3;
  v5 = -[ATXPBDigestOnboardingLoggingEvent initWithData:]([ATXPBDigestOnboardingLoggingEvent alloc], "initWithData:", v4);

  v6 = -[ATXDigestOnboardingLoggingEvent initWithProto:](self, "initWithProto:", v5);
  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXDigestOnboardingLoggingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXDigestOnboardingLoggingEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ATXDigestOnboardingLoggingEvent *v21;
  NSObject *v22;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  NSObject *v29;
  ATXDigestOnboardingLoggingEvent *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = self;
      v31 = v4;
      v5 = v4;
      v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
      -[NSObject sessionUUID](v5, "sessionUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

      v27 = -[NSObject entrySource](v5, "entrySource");
      v26 = -[NSObject digestOnboardingOutcome](v5, "digestOnboardingOutcome");
      v25 = -[NSObject finalUIShown](v5, "finalUIShown");
      v24 = -[NSObject didSelectShowMore](v5, "didSelectShowMore");
      -[NSObject timeTaken](v5, "timeTaken");
      v9 = v8;
      v10 = (void *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v29 = v5;
      -[NSObject deliveryTimes](v5, "deliveryTimes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v17 = (void *)objc_opt_new();
            objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(":"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setHour:", objc_msgSend(v19, "integerValue"));

            objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setMinute:", objc_msgSend(v20, "integerValue"));

            objc_msgSend(v10, "addObject:", v17);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v13);
      }

      self = -[ATXDigestOnboardingLoggingEvent initWithSessionUUID:entrySource:digestOnboardingOutcome:finalUIShown:didSelectShowMore:timeTaken:deliveryTimes:](v30, "initWithSessionUUID:entrySource:digestOnboardingOutcome:finalUIShown:didSelectShowMore:timeTaken:deliveryTimes:", v28, v27, v26, v25, v24, v10, v9);
      v21 = self;
      v4 = v31;
      v22 = v29;
    }
    else
    {
      __atxlog_handle_notification_management();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v22);
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionUUID:", v4);

  objc_msgSend(v3, "setEntrySource:", self->_entrySource);
  objc_msgSend(v3, "setDigestOnboardingOutcome:", self->_digestOnboardingOutcome);
  objc_msgSend(v3, "setFinalUIShown:", self->_finalUIShown);
  objc_msgSend(v3, "setDidSelectShowMore:", self->_didSelectShowMore);
  v13 = v3;
  objc_msgSend(v3, "setTimeTaken:", self->_timeTaken);
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_deliveryTimes;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "hour"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "minute"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v13, "setDeliveryTimes:", v5);
  return v13;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (int)entrySource
{
  return self->_entrySource;
}

- (int)digestOnboardingOutcome
{
  return self->_digestOnboardingOutcome;
}

- (int)finalUIShown
{
  return self->_finalUIShown;
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (NSArray)deliveryTimes
{
  return self->_deliveryTimes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryTimes, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
