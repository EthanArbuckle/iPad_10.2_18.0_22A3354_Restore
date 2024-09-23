@implementation ADBackgroundTaskRequest

- (ADBackgroundTaskRequest)initWithID:(id)a3
{
  id v5;
  ADBackgroundTaskRequest *v6;
  ADBackgroundTaskRequest *v7;
  OS_xpc_object *v8;
  OS_xpc_object *criteria;
  OS_xpc_object *activity;
  NSDate *startDate;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADBackgroundTaskRequest;
  v6 = -[ADBackgroundTaskRequest init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestIdentifier, a3);
    v8 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    criteria = v7->_criteria;
    v7->_criteria = v8;

    activity = v7->_activity;
    v7->_activity = 0;

    v7->_performDeferralCheck = 0;
    startDate = v7->_startDate;
    v7->_startDate = 0;

    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_string(v7->_criteria, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v7->_criteria, (const char *)*MEMORY[0x1E0C808D8], 0);
    xpc_dictionary_set_int64(v7->_criteria, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C8]);
    -[ADBackgroundTaskRequest setDelay:](v7, "setDelay:", 0);
    -[ADBackgroundTaskRequest setRequiresNetworkConnectivity:](v7, "setRequiresNetworkConnectivity:", 1);
  }

  return v7;
}

- (ADBackgroundTaskRequest)initWithCriteria:(id)a3 ID:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  ADBackgroundTaskRequest *v11;
  OS_xpc_object *v12;
  OS_xpc_object *criteria;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ADBackgroundTaskRequest;
  v11 = -[ADBackgroundTaskRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = (OS_xpc_object *)xpc_copy(v8);
    criteria = v11->_criteria;
    v11->_criteria = v12;

    objc_storeStrong((id *)&v11->_requestIdentifier, a4);
    objc_storeStrong((id *)&v11->_activity, a5);
    v11->_performDeferralCheck = 0;
  }

  return v11;
}

- (void)setAllowBattery:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80738], a3);
}

- (BOOL)allowBattery
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80738]);
}

- (void)setRequireSleep:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808D8], a3);
}

- (BOOL)requireSleep
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808D8]);
}

- (void)setIsRepeating:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80898], a3);
}

- (BOOL)isRepeating
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80898]);
}

- (void)setIsCPUIntensive:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80758], a3);
}

- (BOOL)isCPUIntensive
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C80758]);
}

- (void)setRequireBuddyComplete:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808A0], a3);
}

- (BOOL)requireBuddyComplete
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808A0]);
}

- (void)setRequireClassCData:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808B8], a3);
}

- (BOOL)requireClassCData
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808B8]);
}

- (void)setRequiresNetworkConnectivity:(BOOL)a3
{
  xpc_dictionary_set_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808D0], a3);
}

- (BOOL)requiresNetworkConnectivity
{
  return xpc_dictionary_get_BOOL(self->_criteria, (const char *)*MEMORY[0x1E0C808D0]);
}

- (void)setBackgroundTaskRetryCount:(int64_t)a3
{
  xpc_dictionary_set_int64(self->_criteria, (const char *)objc_msgSend(CFSTR("kBackgroundTaskProperty_RetryCount"), "cStringUsingEncoding:", 4), a3);
}

- (int64_t)backgroundTaskRetryCount
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)objc_msgSend(CFSTR("kBackgroundTaskProperty_RetryCount"), "cStringUsingEncoding:", 4));
}

- (void)setGracePeriod:(int64_t)a3
{
  xpc_dictionary_set_int64(self->_criteria, (const char *)*MEMORY[0x1E0C80790], a3);
}

- (int64_t)gracePeriod
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)*MEMORY[0x1E0C80790]);
}

- (NSString)priority
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(self->_criteria, (const char *)*MEMORY[0x1E0C80878]), 4);
}

- (void)setPriority:(id)a3
{
  xpc_dictionary_set_string(self->_criteria, (const char *)*MEMORY[0x1E0C80878], (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
}

- (void)setDelay:(int64_t)a3
{
  xpc_dictionary_set_int64(self->_criteria, (const char *)*MEMORY[0x1E0C80760], a3);
}

- (int64_t)delay
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)*MEMORY[0x1E0C80760]);
}

- (id)copyBackgroundTaskAgentCriteria
{
  return xpc_copy(self->_criteria);
}

- (BOOL)continueTask
{
  ADBackgroundTaskRequest *v2;
  _xpc_activity_s *activity;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity)
    v4 = xpc_activity_set_state(activity, 4);
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsContinuing
{
  ADBackgroundTaskRequest *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = xpc_activity_get_state(v2->_activity) == 4;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)finishTask
{
  OS_xpc_object *activity;

  activity = self->_activity;
  if (activity)
    LOBYTE(activity) = xpc_activity_set_state(activity, 5);
  return (char)activity;
}

- (BOOL)shouldDefer
{
  ADBackgroundTaskRequest *v2;
  _xpc_activity_s *activity;
  BOOL should_defer;

  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity)
    should_defer = xpc_activity_should_defer(activity);
  else
    should_defer = 0;
  objc_sync_exit(v2);

  return should_defer;
}

- (BOOL)deferTask
{
  ADBackgroundTaskRequest *v2;
  _xpc_activity_s *activity;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity)
    v4 = xpc_activity_set_state(activity, 3);
  else
    v4 = 0;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)taskIsDeferred
{
  ADBackgroundTaskRequest *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = xpc_activity_get_state(v2->_activity) == 3;
  objc_sync_exit(v2);

  return v3;
}

- (void)_backgroundDeferralCheck:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke;
  block[3] = &unk_1E82B2170;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);

}

void __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  +[ADServer workQueue](ADServer, "workQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke_2;
  v4[3] = &unk_1E82B2170;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addOperationWithBlock:", v4);

}

void __63__ADBackgroundTaskRequest__backgroundDeferralCheck_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8) && (objc_msgSend(*(id *)(a1 + 40), "isEqualToDate:", *(_QWORD *)(v2 + 40)) & 1) != 0)
  {
    objc_sync_exit(obj);

    v3 = objc_msgSend(*(id *)(a1 + 32), "shouldDefer");
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "endBackgroundDeferralCheck");
      objc_msgSend(*(id *)(a1 + 32), "deferTask");
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
    else
    {
      objc_msgSend(v4, "_backgroundDeferralCheck:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    objc_sync_exit(obj);

  }
}

- (void)startBackgroundDeferralCheckForTime:(id)a3 completionHandler:(id)a4
{
  NSDate *v6;
  ADBackgroundTaskRequest *v7;
  NSDate *startDate;
  NSDate *v9;
  id v10;

  v6 = (NSDate *)a3;
  v7 = self;
  v10 = a4;
  objc_sync_enter(v7);
  v7->_performDeferralCheck = 1;
  startDate = v7->_startDate;
  v7->_startDate = v6;
  v9 = v6;

  objc_sync_exit(v7);
  -[ADBackgroundTaskRequest _backgroundDeferralCheck:completion:](v7, "_backgroundDeferralCheck:completion:", v7->_startDate, v10);

}

- (BOOL)taskCanContinueForTime:(id)a3
{
  id v4;
  ADBackgroundTaskRequest *v5;
  BOOL v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (objc_msgSend(v4, "isEqualToDate:", v5->_startDate) & 1) != 0
    && -[ADBackgroundTaskRequest taskIsContinuing](v5, "taskIsContinuing");
  objc_sync_exit(v5);

  return v6;
}

- (void)endBackgroundDeferralCheck
{
  NSDate *startDate;
  ADBackgroundTaskRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_performDeferralCheck = 0;
  startDate = obj->_startDate;
  obj->_startDate = 0;

  objc_sync_exit(obj);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADBackgroundTaskRequest;
  -[ADBackgroundTaskRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1CAA46420](self->_criteria);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, id: %@, job: %s"), v3, self->_requestIdentifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  free(v4);
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ADBackgroundTaskRequest;
  -[ADBackgroundTaskRequest description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("RequestType"));
  objc_msgSend(v4, "setObject:forKey:", self->_requestIdentifier, CFSTR("id"));
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ADBackgroundTaskRequest gracePeriod](self, "gracePeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("GracePeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ADBackgroundTaskRequest backgroundTaskRetryCount](self, "backgroundTaskRetryCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("kBackgroundTaskProperty_RetryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ADBackgroundTaskRequest delay](self, "delay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v8, CFSTR("Delay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ADBackgroundTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("RequireNetworkConnectivity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ADBackgroundTaskRequest requireSleep](self, "requireSleep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("RequireScreenSleep"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ADBackgroundTaskRequest isRepeating](self, "isRepeating"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("Repeating"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ADBackgroundTaskRequest allowBattery](self, "allowBattery"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("AllowBattery"));

  -[ADBackgroundTaskRequest priority](self, "priority");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("Priority"));

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("job"));
  return v4;
}

- (void)setPropertyAsString:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(self->_criteria, v8, v10);
}

- (id)getPropertyAsString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(self->_criteria, (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4)), 4);
}

- (void)setPropertyAsInteger:(id)a3 value:(int64_t)a4
{
  xpc_dictionary_set_int64(self->_criteria, (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4), a4);
}

- (int64_t)getPropertyAsInteger:(id)a3
{
  return xpc_dictionary_get_int64(self->_criteria, (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
}

- (void)setPropertyAsDouble:(id)a3 value:(double)a4
{
  xpc_dictionary_set_double(self->_criteria, (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4), a4);
}

- (double)getPropertyAsDouble:(id)a3
{
  return xpc_dictionary_get_double(self->_criteria, (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4));
}

- (void)setPropertyAsDate:(id)a3 value:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  -[ADBackgroundTaskRequest setPropertyAsDouble:value:](self, "setPropertyAsDouble:value:", v6);

}

- (id)getPropertyAsDate:(id)a3
{
  -[ADBackgroundTaskRequest getPropertyAsDouble:](self, "getPropertyAsDouble:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (BOOL)performDeferralCheck
{
  return self->_performDeferralCheck;
}

- (void)setPerformDeferralCheck:(BOOL)a3
{
  self->_performDeferralCheck = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
