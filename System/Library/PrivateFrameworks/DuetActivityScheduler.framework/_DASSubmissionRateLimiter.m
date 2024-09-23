@implementation _DASSubmissionRateLimiter

- (_DASSubmissionRateLimiter)init
{
  _DASSubmissionRateLimiter *v2;
  _DASSubmissionRateLimiter *v3;
  uint64_t v4;
  NSCountedSet *submittedActivityTracker;
  uint64_t v6;
  NSCountedSet *penaltyTracker;
  NSMutableArray *minorPenaltyActivities;
  NSMutableArray *majorPenaltyActivities;
  os_log_t v10;
  OS_os_log *log;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSObject *v15;
  uint64_t v16;
  _DASSubmissionRateLimiter *v17;
  uint64_t state;
  NSObject *v19;
  _BOOL4 v20;
  _BOOL8 v21;
  NSObject *v22;
  dispatch_source_t v23;
  OS_dispatch_source *submissionTimer;
  NSObject *v25;
  NSObject *v26;
  dispatch_time_t v27;
  _QWORD v29[4];
  _DASSubmissionRateLimiter *v30;
  uint64_t state64;
  _QWORD handler[4];
  _DASSubmissionRateLimiter *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_DASSubmissionRateLimiter;
  v2 = -[_DASSubmissionRateLimiter init](&v34, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_limitationName, CFSTR("ActivityRate"));
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    submittedActivityTracker = v3->_submittedActivityTracker;
    v3->_submittedActivityTracker = (NSCountedSet *)v4;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    penaltyTracker = v3->_penaltyTracker;
    v3->_penaltyTracker = (NSCountedSet *)v6;

    v3->_minorPenaltyTimerCount = 0;
    v3->_majorPenaltyTimerCount = 0;
    minorPenaltyActivities = v3->_minorPenaltyActivities;
    v3->_minorPenaltyActivities = 0;

    majorPenaltyActivities = v3->_majorPenaltyActivities;
    v3->_majorPenaltyActivities = 0;

    v10 = os_log_create("com.apple.duetactivityscheduler", "activityRateLimiter");
    log = v3->_log;
    v3->_log = (OS_os_log *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.dasd.overrideQueue", v12);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v13;

    v3->_token = -1;
    v15 = v3->_queue;
    v16 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33___DASSubmissionRateLimiter_init__block_invoke;
    handler[3] = &unk_1E624B5C0;
    v17 = v3;
    v33 = v17;
    notify_register_dispatch("com.apple.dasd.overrideSubmissionLimits", &v3->_token, v15, handler);
    state64 = 0;
    state = notify_get_state(-[_DASSubmissionRateLimiter token](v17, "token"), &state64);
    -[_DASSubmissionRateLimiter log](v17, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)state)
    {
      if (v20)
        -[_DASSubmissionRateLimiter init].cold.2(state, v19);

      v21 = 0;
    }
    else
    {
      if (v20)
        -[_DASSubmissionRateLimiter init].cold.1(&state64, v19);

      v21 = state64 != 0;
    }
    -[_DASSubmissionRateLimiter setTesting:](v17, "setTesting:", v21);
    v17->_penaltyLock._os_unfair_lock_opaque = 0;
    dispatch_get_global_queue(-32768, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v22);
    submissionTimer = v17->_submissionTimer;
    v17->_submissionTimer = (OS_dispatch_source *)v23;

    v25 = v17->_submissionTimer;
    v29[0] = v16;
    v29[1] = 3221225472;
    v29[2] = __33___DASSubmissionRateLimiter_init__block_invoke_6;
    v29[3] = &unk_1E624B598;
    v30 = v17;
    dispatch_source_set_event_handler(v25, v29);
    v26 = v17->_submissionTimer;
    v27 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v26, v27, 0x1A3185C5000uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)v17->_submissionTimer);

  }
  return v3;
}

+ (id)sharedLimiter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___DASSubmissionRateLimiter_sharedLimiter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLimiter_onceToken != -1)
    dispatch_once(&sharedLimiter_onceToken, block);
  return (id)sharedLimiter_limitation;
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  char v24;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if (v4 > _DASSchedulingPriorityDefault)
    goto LABEL_16;
  objc_msgSend(v3, "groupName");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", _DASDefaultNetworkGroupName) & 1) != 0)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v3, "groupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", _DASDefaultGroupName))
    {

      goto LABEL_6;
    }
    objc_msgSend(v3, "groupName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", _DASDefaultRemoteGroupName);

    if ((v24 & 1) == 0)
      goto LABEL_16;
  }
LABEL_7:
  objc_msgSend(v3, "rateLimitConfigurationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("CloudKitConfiguration"));

  if ((v10 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v3, "rateLimitConfigurationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PECConfiguration"));

  if ((v12 & 1) != 0)
    goto LABEL_16;
  +[_DASPlistParser sharedInstance](_DASPlistParser, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsOverrideForActivity:withLimitation:", v3, CFSTR("ActivityRate"));

  if ((v14 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v3, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_17;
  objc_msgSend(v3, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("com.apple.das.overrideRateLimiting"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if ((v18 & 1) != 0
    || (objc_msgSend(v3, "userInfo"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("com.apple.das.overrideRateLimiting")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "BOOLValue"),
        v20,
        v19,
        (v21 & 1) != 0))
  {
LABEL_16:
    LOBYTE(v15) = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "requestsApplicationLaunch"))
  {
    objc_msgSend(v3, "launchReason");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.das.launchreason.push"));

    LOBYTE(v15) = v22 ^ 1;
  }
  else
  {
    LOBYTE(v15) = 1;
  }
LABEL_17:

  return (char)v15;
}

- (void)removeAll
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "Removing all from penalty trackers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)removeAllFromActivityTracker
{
  NSCountedSet *obj;

  obj = self->_submittedActivityTracker;
  objc_sync_enter(obj);
  -[NSCountedSet removeAllObjects](self->_submittedActivityTracker, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)timerHandler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "2 hour timer fired for submission penalty checks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)addToTracker:(id)a3
{
  NSCountedSet *v4;
  NSCountedSet *submittedActivityTracker;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:"))
  {
    v4 = self->_submittedActivityTracker;
    objc_sync_enter(v4);
    submittedActivityTracker = self->_submittedActivityTracker;
    objc_msgSend(v7, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](submittedActivityTracker, "addObject:", v6);

    objc_sync_exit(v4);
    -[_DASSubmissionRateLimiter addToPenaltyBox:](self, "addToPenaltyBox:", v7);
  }

}

- (void)addToPenaltyBox:(id)a3
{
  id v4;
  NSMutableArray *minorPenaltyActivities;
  void *v6;
  int v7;
  NSCountedSet *v8;
  NSCountedSet *penaltyTracker;
  void *v10;
  unint64_t v11;
  NSMutableArray *majorPenaltyActivities;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  OS_os_log *v18;
  void *v19;
  NSMutableArray *v20;
  char v21;
  NSMutableArray *v22;
  BOOL v23;
  void *v24;
  NSCountedSet *v25;
  NSCountedSet *submittedActivityTracker;
  void *v27;
  NSMutableArray *v28;
  NSMutableArray *v29;
  NSMutableArray *v30;
  void *v31;
  OS_os_log *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  NSObject *log;
  void *v44;
  NSObject *v45;
  void *v46;
  NSCountedSet *v47;
  void *v48;
  int v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4))
    goto LABEL_38;
  os_unfair_lock_lock(&self->_penaltyLock);
  minorPenaltyActivities = self->_minorPenaltyActivities;
  if (minorPenaltyActivities)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableArray containsObject:](minorPenaltyActivities, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(&self->_penaltyLock);
  v8 = self->_submittedActivityTracker;
  objc_sync_enter(v8);
  if (v7)
  {
    penaltyTracker = self->_penaltyTracker;
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSCountedSet countForObject:](penaltyTracker, "countForObject:", v10);

    if (v11 >= 0x13)
    {
      os_unfair_lock_lock(&self->_penaltyLock);
      majorPenaltyActivities = self->_majorPenaltyActivities;
      if (!majorPenaltyActivities)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v14 = self->_majorPenaltyActivities;
        self->_majorPenaltyActivities = v13;

        majorPenaltyActivities = self->_majorPenaltyActivities;
      }
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](majorPenaltyActivities, "addObject:", v15);

      v16 = self->_minorPenaltyActivities;
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](v16, "removeObject:", v17);

      os_unfair_lock_unlock(&self->_penaltyLock);
      v18 = self->_log;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138412290;
        v50 = v19;
        _os_log_impl(&dword_1B0DF4000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%@ added to major penalty", (uint8_t *)&v49, 0xCu);

      }
    }
  }
  objc_sync_exit(v8);

  os_unfair_lock_lock(&self->_penaltyLock);
  v20 = self->_minorPenaltyActivities;
  if (v20)
  {
    objc_msgSend(v4, "name");
    v8 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableArray containsObject:](v20, "containsObject:", v8) & 1) != 0)
    {
      v21 = 1;
LABEL_22:

      goto LABEL_23;
    }
    v22 = self->_majorPenaltyActivities;
    if (!v22)
    {
      v21 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v22 = self->_majorPenaltyActivities;
    if (!v22)
    {
      v21 = 0;
      goto LABEL_23;
    }
  }
  v23 = v20 == 0;
  objc_msgSend(v4, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NSMutableArray containsObject:](v22, "containsObject:", v24);

  if (!v23)
    goto LABEL_22;
LABEL_23:
  os_unfair_lock_unlock(&self->_penaltyLock);
  v25 = self->_submittedActivityTracker;
  objc_sync_enter(v25);
  if ((v21 & 1) == 0)
  {
    submittedActivityTracker = self->_submittedActivityTracker;
    objc_msgSend(v4, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(submittedActivityTracker) = -[NSCountedSet countForObject:](submittedActivityTracker, "countForObject:", v27) > 6;

    if ((_DWORD)submittedActivityTracker)
    {
      os_unfair_lock_lock(&self->_penaltyLock);
      v28 = self->_minorPenaltyActivities;
      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v30 = self->_minorPenaltyActivities;
        self->_minorPenaltyActivities = v29;

        v28 = self->_minorPenaltyActivities;
      }
      objc_msgSend(v4, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v28, "addObject:", v31);

      os_unfair_lock_unlock(&self->_penaltyLock);
      v32 = self->_log;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138412290;
        v50 = v33;
        _os_log_impl(&dword_1B0DF4000, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "%@ added to minor penalty", (uint8_t *)&v49, 0xCu);

      }
    }
  }
  objc_sync_exit(v25);

  -[_DASSubmissionRateLimiter shouldLimitActivityAtSubmission:](self, "shouldLimitActivityAtSubmission:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 2, v34))
  {
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "validityDuration");
    v37 = v36;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startAfter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39
      || (objc_msgSend(v39, "earlierDate:", v38),
          v41 = (void *)objc_claimAutoreleasedReturnValue(),
          v42 = v41 == v40,
          v41,
          v42))
    {
      objc_msgSend(v4, "setStartAfter:", v38);
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)MEMORY[0x1E0CB37E8];
      v45 = log;
      objc_msgSend(v44, "numberWithDouble:", v37 / 60.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 138412546;
      v50 = v4;
      v51 = 2112;
      v52 = v46;
      _os_log_impl(&dword_1B0DF4000, v45, OS_LOG_TYPE_DEFAULT, "%@ is rate limited by submission rate limiter by %@ min from now", (uint8_t *)&v49, 0x16u);

    }
    os_unfair_lock_lock(&self->_penaltyLock);
    v47 = self->_penaltyTracker;
    objc_msgSend(v4, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](v47, "addObject:", v48);

    os_unfair_lock_unlock(&self->_penaltyLock);
    -[_DASSubmissionRateLimiter limitedActivity:withLimitsResponses:](self, "limitedActivity:withLimitsResponses:", v4, v34);

  }
LABEL_38:

}

- (BOOL)trackActivity:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  v5 = -[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4);
  if (v5)
    -[_DASSubmissionRateLimiter addToTracker:](self, "addToTracker:", v4);

  return v5;
}

- (id)shouldLimitActivityAtSubmission:(id)a3
{
  id v4;
  NSMutableArray *minorPenaltyActivities;
  void *v6;
  int v7;
  NSMutableArray *majorPenaltyActivities;
  char v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  double v15;
  void *v16;
  void **v17;
  NSObject *log;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v4))
  {
    os_unfair_lock_lock(&self->_penaltyLock);
    minorPenaltyActivities = self->_minorPenaltyActivities;
    if (minorPenaltyActivities)
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSMutableArray containsObject:](minorPenaltyActivities, "containsObject:", v6);

      majorPenaltyActivities = self->_majorPenaltyActivities;
      if (v7)
      {
        if (!majorPenaltyActivities)
        {
          os_unfair_lock_unlock(&self->_penaltyLock);
          v14 = CFSTR("Submitted > 6x in 30 min");
          v15 = 1800.0;
LABEL_21:
          if (self->_testing)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v4;
              _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "Overriding submission rate limits for activity %@", buf, 0xCu);
            }
            +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", 0, CFSTR("ActivityRate"), 0, 0.0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v16;
            v17 = &v21;
          }
          else
          {
            +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", 2, CFSTR("ActivityRate"), v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v16;
            v17 = &v20;
          }
          goto LABEL_26;
        }
        v9 = 1;
        v10 = CFSTR("Submitted > 6x in 30 min");
        goto LABEL_9;
      }
      if (!majorPenaltyActivities)
      {
LABEL_18:
        os_unfair_lock_unlock(&self->_penaltyLock);
        goto LABEL_19;
      }
    }
    else
    {
      majorPenaltyActivities = self->_majorPenaltyActivities;
      if (!majorPenaltyActivities)
        goto LABEL_18;
    }
    v9 = 0;
    v10 = &stru_1E624C4F8;
LABEL_9:
    objc_msgSend(v4, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSMutableArray containsObject:](majorPenaltyActivities, "containsObject:", v12);

    os_unfair_lock_unlock(&self->_penaltyLock);
    if (v13)
      v14 = CFSTR("Submitted > 18x in 2 hrs");
    else
      v14 = v10;
    v15 = 1800.0;
    if (v13)
      v15 = 7200.0;
    if ((v13 & 1) != 0 || (v9 & 1) != 0)
      goto LABEL_21;
LABEL_19:
    +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:](_DASLimiterResponse, "limitResponseWithDecision:withLimiter:validityDuration:rationale:", 0, CFSTR("ActivityRate"), 0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    v17 = (void **)v24;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v11 = 0;
LABEL_27:

  return v11;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:", v6)
    && +[_DASLimiterResponse queryActivityDecision:fromResponses:](_DASLimiterResponse, "queryActivityDecision:fromResponses:", 2, v7))
  {
    +[_DASLimiterResponse updateActivity:withLimitResponse:](_DASLimiterResponse, "updateActivity:withLimitResponse:", v6, v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSCountedSet)submittedActivityTracker
{
  return self->_submittedActivityTracker;
}

- (void)setSubmittedActivityTracker:(id)a3
{
  objc_storeStrong((id *)&self->_submittedActivityTracker, a3);
}

- (NSCountedSet)penaltyTracker
{
  return self->_penaltyTracker;
}

- (void)setPenaltyTracker:(id)a3
{
  objc_storeStrong((id *)&self->_penaltyTracker, a3);
}

- (NSMutableArray)minorPenaltyActivities
{
  return self->_minorPenaltyActivities;
}

- (void)setMinorPenaltyActivities:(id)a3
{
  objc_storeStrong((id *)&self->_minorPenaltyActivities, a3);
}

- (NSMutableArray)majorPenaltyActivities
{
  return self->_majorPenaltyActivities;
}

- (void)setMajorPenaltyActivities:(id)a3
{
  objc_storeStrong((id *)&self->_majorPenaltyActivities, a3);
}

- (unint64_t)minorPenaltyTimerCount
{
  return self->_minorPenaltyTimerCount;
}

- (void)setMinorPenaltyTimerCount:(unint64_t)a3
{
  self->_minorPenaltyTimerCount = a3;
}

- (unint64_t)majorPenaltyTimerCount
{
  return self->_majorPenaltyTimerCount;
}

- (void)setMajorPenaltyTimerCount:(unint64_t)a3
{
  self->_majorPenaltyTimerCount = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
  objc_storeStrong((id *)&self->_limitationName, a3);
}

- (OS_dispatch_source)submissionTimer
{
  return self->_submissionTimer;
}

- (void)setSubmissionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_submissionTimer, a3);
}

- (os_unfair_lock_s)penaltyLock
{
  return self->_penaltyLock;
}

- (void)setPenaltyLock:(os_unfair_lock_s)a3
{
  self->_penaltyLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)testing
{
  return self->_testing;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_majorPenaltyActivities, 0);
  objc_storeStrong((id *)&self->_minorPenaltyActivities, 0);
  objc_storeStrong((id *)&self->_penaltyTracker, 0);
  objc_storeStrong((id *)&self->_submittedActivityTracker, 0);
}

- (void)init
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_1B0DF4000, a2, v4, "Initialized testing state to 0 because %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

@end
