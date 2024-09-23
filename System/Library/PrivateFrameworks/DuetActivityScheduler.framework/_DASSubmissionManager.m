@implementation _DASSubmissionManager

- (_DASSubmissionManager)init
{
  _DASSubmissionManager *v2;
  uint64_t v3;
  _DASSubmissionRateLimiter *rateLimiter;
  uint64_t v5;
  NSMutableDictionary *submittedActivities;
  uint64_t v7;
  NSMutableDictionary *activityGroupQueue;
  uint64_t v9;
  NSMutableDictionary *activityGroups;
  os_log_t v11;
  OS_os_log *log;
  NSObject *v13;
  _QWORD handler[4];
  _DASSubmissionManager *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_DASSubmissionManager;
  v2 = -[_DASSubmissionManager init](&v17, sel_init);
  if (v2)
  {
    +[_DASSubmissionRateLimiter sharedLimiter](_DASSubmissionRateLimiter, "sharedLimiter");
    v3 = objc_claimAutoreleasedReturnValue();
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = (_DASSubmissionRateLimiter *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    submittedActivities = v2->_submittedActivities;
    v2->_submittedActivities = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    activityGroupQueue = v2->_activityGroupQueue;
    v2->_activityGroupQueue = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    activityGroups = v2->_activityGroups;
    v2->_activityGroups = (NSMutableDictionary *)v9;

    v11 = os_log_create("com.apple.duetactivityscheduler", "submissionManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v11;

    dispatch_get_global_queue(-32768, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29___DASSubmissionManager_init__block_invoke;
    handler[3] = &unk_1E624B5C0;
    v16 = v2;
    notify_register_dispatch("com.apple.dasd.dastool.list", &v2->_dastoolToken, v13, handler);

  }
  return v2;
}

- (void)dealloc
{
  int dastoolToken;
  objc_super v4;

  dastoolToken = self->_dastoolToken;
  if (dastoolToken)
    notify_cancel(dastoolToken);
  v4.receiver = self;
  v4.super_class = (Class)_DASSubmissionManager;
  -[_DASSubmissionManager dealloc](&v4, sel_dealloc);
}

- (void)removeAllObjects
{
  NSMutableDictionary *obj;

  -[_DASSubmissionRateLimiter removeAll](self->_rateLimiter, "removeAll");
  obj = self->_activityGroupQueue;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_submittedActivities, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_activityGroupQueue, "removeAllObjects");
  objc_sync_exit(obj);

}

+ (id)pluginGroupNameForGroupName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR("-plugin"));
}

+ (id)groupNameForActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v3, "requiresPlugin"))
    {
      objc_msgSend((id)objc_opt_class(), "pluginGroupNameForGroupName:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateCapacity:(unint64_t)a3 forGroupName:(id)a4
{
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *activityGroups;
  void *v10;
  id v11;

  v11 = a4;
  if (v11)
  {
    v6 = self->_activityGroups;
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityGroups, "setObject:forKeyedSubscript:", v7, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    activityGroups = self->_activityGroups;
    objc_msgSend((id)objc_opt_class(), "pluginGroupNameForGroupName:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](activityGroups, "setObject:forKeyedSubscript:", v8, v10);

    objc_sync_exit(v6);
  }

}

- (unint64_t)capacityForGroupName:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *log;

  v4 = a3;
  v5 = self->_activityGroups;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityGroups, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[_DASSubmissionManager capacityForGroupName:].cold.1((uint64_t)v4, log);
    v8 = 15;
  }

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)shouldQueueActivity:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "schedulingPriority");
  return v3 < _DASSchedulingPriorityUserInitiated;
}

- (BOOL)shouldDelayGroupSubmissionOfActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  char v13;
  unint64_t v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  OS_os_log *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "rateLimitConfigurationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || (objc_msgSend(v7, "isEqualToString:", _DASDefaultGroupName) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", _DASDefaultNetworkGroupName) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", _DASDefaultRemoteGroupName) & 1) != 0)
    {
      goto LABEL_11;
    }
    objc_msgSend((id)objc_opt_class(), "pluginGroupNameForGroupName:", _DASDefaultGroupName);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToString:", v9))
    {
      objc_msgSend((id)objc_opt_class(), "pluginGroupNameForGroupName:", _DASDefaultNetworkGroupName);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v10))
      {
        objc_msgSend((id)objc_opt_class(), "pluginGroupNameForGroupName:", _DASDefaultRemoteGroupName);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
        {
          v14 = -[_DASSubmissionManager capacityForGroupName:](self, "capacityForGroupName:", v8);
          v15 = self->_activityGroupQueue;
          objc_sync_enter(v15);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_submittedActivities, "objectForKeyedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = objc_msgSend(v16, "count");
            if (-[_DASSubmissionManager shouldQueueActivity:](self, "shouldQueueActivity:", v4)
              && v18 >= v14
              && v18 >= 0xF)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_activityGroupQueue, "objectForKeyedSubscript:", v8);
              v19 = objc_claimAutoreleasedReturnValue();
              if (!v19)
              {
                +[_DASPriorityQueue priorityQueue](_DASPriorityQueue, "priorityQueue");
                v19 = objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityGroupQueue, "setObject:forKeyedSubscript:", v19, v8);
              }
              -[NSObject addObject:withPriority:](v19, "addObject:withPriority:", v4, objc_msgSend(v4, "schedulingPriority"));
              v20 = self->_log;
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v19, "count"));
                v25 = 138412546;
                v26 = v8;
                v27 = 2112;
                v28 = objc_claimAutoreleasedReturnValue();
                v21 = (void *)v28;
                _os_log_impl(&dword_1B0DF4000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Group %@ has %@ activities queued in framework", (uint8_t *)&v25, 0x16u);

              }
              v22 = 1;
            }
            else
            {
              objc_msgSend(v17, "addObject:", v4);
              v19 = self->_log;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = 138412546;
                v26 = v23;
                v27 = 2112;
                v28 = (uint64_t)v8;
                _os_log_impl(&dword_1B0DF4000, v19, OS_LOG_TYPE_DEFAULT, "Have submitted to daemon %@ activities in group %@", (uint8_t *)&v25, 0x16u);

              }
              v22 = 0;
            }

            v24 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_submittedActivities, "setObject:forKeyedSubscript:", v24, v8);
            v22 = 0;
          }

          objc_sync_exit(v15);
          v6 = (v17 != 0) & v22;
          goto LABEL_12;
        }
LABEL_11:
        v6 = 0;
LABEL_12:

        goto LABEL_13;
      }

    }
    goto LABEL_11;
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (void)handleCanceledActivity:(id)a3 withGroupName:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_activityGroupQueue;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activityGroupQueue, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:atPriority:", v9, objc_msgSend(v9, "schedulingPriority"));

  objc_sync_exit(v7);
}

- (void)admitNextActivityAfterCompletionOf:(id)a3 withScheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *log;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self->_activityGroupQueue;
    objc_sync_enter(v9);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_submittedActivities, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v6);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_activityGroupQueue, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "popFirst");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_submittedActivities, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);

      objc_sync_exit(v9);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_INFO, "ADMITTING delayed activity %@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v7, "submitActivity:inGroupWithName:", v12, v8);
    }
    else
    {

      objc_sync_exit(v9);
    }

  }
}

- (void)createActivityGroup:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "maxConcurrent");
  objc_msgSend(v4, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_DASSubmissionManager updateCapacity:forGroupName:](self, "updateCapacity:forGroupName:", v5, v6);
}

- (void)submitActivity:(id)a3 withScheduler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_DASSubmissionRateLimiter trackActivity:](self->_rateLimiter, "trackActivity:", v6)
    || !-[_DASSubmissionManager shouldDelayGroupSubmissionOfActivity:](self, "shouldDelayGroupSubmissionOfActivity:", v6))
  {
    objc_msgSend(v7, "submitActivity:", v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = log;
      objc_msgSend(v6, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2112;
      v15 = v11;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1B0DF4000, v10, OS_LOG_TYPE_DEFAULT, "Delaying submission of %{public}@ %@, group %{public}@ full", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)submitActivities:(id)a3 withScheduler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *log;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a4;
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[_DASSubmissionManager shouldDelayGroupSubmissionOfActivity:](self, "shouldDelayGroupSubmissionOfActivity:", v14))
        {
          objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v14;
            v25 = 2114;
            v26 = v15;
            _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_INFO, "Delaying submission of %{public}@, group %{public}@ full", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }

  objc_msgSend(v17, "submitActivities:", v8);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *log;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "maxConcurrent");
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DASSubmissionManager updateCapacity:forGroupName:](self, "updateCapacity:forGroupName:", v11, v12);

  if (-[_DASSubmissionManager shouldDelayGroupSubmissionOfActivity:](self, "shouldDelayGroupSubmissionOfActivity:", v8))
  {
    objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "Delaying submission of %{public}@, group %{public}@ full", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v10, "submitActivity:inGroup:", v8, v9);
  }

}

- (void)activityCanceled:(id)a3 withScheduler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "groupNameForActivity:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASSubmissionManager handleCanceledActivity:withGroupName:](self, "handleCanceledActivity:withGroupName:", v9, v8);

    -[_DASSubmissionManager admitNextActivityAfterCompletionOf:withScheduler:](self, "admitNextActivityAfterCompletionOf:withScheduler:", v9, v6);
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)activityGroupQueue
{
  return self->_activityGroupQueue;
}

- (void)setActivityGroupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityGroupQueue, a3);
}

- (NSMutableDictionary)submittedActivities
{
  return self->_submittedActivities;
}

- (void)setSubmittedActivities:(id)a3
{
  objc_storeStrong((id *)&self->_submittedActivities, a3);
}

- (NSMutableDictionary)activityGroups
{
  return self->_activityGroups;
}

- (void)setActivityGroups:(id)a3
{
  objc_storeStrong((id *)&self->_activityGroups, a3);
}

- (int)dastoolToken
{
  return self->_dastoolToken;
}

- (void)setDastoolToken:(int)a3
{
  self->_dastoolToken = a3;
}

- (_DASSubmissionRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_activityGroups, 0);
  objc_storeStrong((id *)&self->_submittedActivities, 0);
  objc_storeStrong((id *)&self->_activityGroupQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)capacityForGroupName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = &unk_1E6259718;
  _os_log_debug_impl(&dword_1B0DF4000, a2, OS_LOG_TYPE_DEBUG, "Could not find group with name %@, using capacity %@", (uint8_t *)&v2, 0x16u);
}

@end
