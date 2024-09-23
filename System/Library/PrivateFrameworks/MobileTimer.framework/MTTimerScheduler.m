@implementation MTTimerScheduler

- (id)nextTimer
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  v16 = 0;
  v3 = dispatch_semaphore_create(0);
  -[MTTimerScheduler serializer](self, "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__MTTimerScheduler_nextTimer__block_invoke;
  v8[3] = &unk_1E39CB8A8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlock:", v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

intptr_t __29__MTTimerScheduler_nextTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_nextTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_queue_nextTimer
{
  void *v2;
  void *v3;

  -[MTTimerScheduler _queue_nextScheduledTimer](self, "_queue_nextScheduledTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_queue_nextScheduledTimer
{
  return -[MTScheduledList nextScheduledAlert](self->_scheduledTimers, "nextScheduledAlert");
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MTTimerScheduler *v10;

  v6 = a4;
  v7 = a3;
  +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", CFSTR("com.apple.MTTimerScheduler.access-queue"), +[MTScheduler defaultPriority](MTScheduler, "defaultPriority"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTTimerScheduler initWithStorage:notificationCenter:scheduler:defaults:](self, "initWithStorage:notificationCenter:scheduler:defaults:", v7, v6, v8, v9);

  return v10;
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MTTimerScheduler *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[MTXPCScheduler xpcSchedulerWithEvent:](MTXPCScheduler, "xpcSchedulerWithEvent:", CFSTR("com.apple.MTTimerScheduler.timer-event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  MTCurrentDateProvider();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MTTimerScheduler initWithStorage:notificationCenter:scheduler:defaults:schedulingDelegate:taskScheduler:currentDateProvider:](self, "initWithStorage:notificationCenter:scheduler:defaults:schedulingDelegate:taskScheduler:currentDateProvider:", v13, v12, v11, v10, v14, v15, v16);

  return v17;
}

- (MTTimerScheduler)initWithStorage:(id)a3 notificationCenter:(id)a4 scheduler:(id)a5 defaults:(id)a6 schedulingDelegate:(id)a7 taskScheduler:(id)a8 currentDateProvider:(id)a9
{
  id v16;
  id v17;
  MTTimerScheduler *v18;
  NSObject *v19;
  uint64_t v20;
  id currentDateProvider;
  MTScheduledList *v22;
  MTScheduledList *scheduledTimers;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  MTTimerScheduler *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v16 = a8;
  v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)MTTimerScheduler;
  v18 = -[MTTimerScheduler init](&v30, sel_init);
  if (v18)
  {
    MTLogForCategory(4);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v18;
      _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v20 = objc_msgSend(v17, "copy");
    currentDateProvider = v18->_currentDateProvider;
    v18->_currentDateProvider = (id)v20;

    objc_storeStrong((id *)&v18->_schedulingDelegate, a7);
    objc_storeStrong((id *)&v18->_taskScheduler, a8);
    objc_storeStrong((id *)&v18->_notificationCenter, a4);
    objc_storeStrong((id *)&v18->_defaults, a6);
    objc_storeStrong((id *)&v18->_storage, a3);
    -[MTTimerStorage registerObserver:](v18->_storage, "registerObserver:", v18);
    v22 = -[MTScheduledList initWithDelegate:]([MTScheduledList alloc], "initWithDelegate:", v18);
    scheduledTimers = v18->_scheduledTimers;
    v18->_scheduledTimers = v22;

    objc_storeStrong((id *)&v18->_serializer, a5);
  }

  return v18;
}

- (id)nextTriggerDate
{
  void *v2;
  void *v3;
  void *v4;

  -[MTTimerScheduler _queue_nextScheduledTimer](self, "_queue_nextScheduledTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)rescheduleTimers
{
  -[MTTimerScheduler rescheduleTimersWithCompletion:](self, "rescheduleTimersWithCompletion:", 0);
}

- (void)rescheduleTimersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTTimerScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTTimerScheduler_rescheduleTimersWithCompletion___block_invoke;
  v7[3] = &unk_1E39CB880;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __51__MTTimerScheduler_rescheduleTimersWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_rescheduleTimersWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_rescheduleTimersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  MTTimerScheduler *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  kdebug_trace();
  -[MTTimerScheduler storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2050;
    v14 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rescheduling %{public}ld timers", buf, 0x16u);
  }

  -[MTScheduledList reset](self->_scheduledTimers, "reset");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__MTTimerScheduler__queue_rescheduleTimersWithCompletion___block_invoke;
  v9[3] = &unk_1E39CC398;
  v10 = v4;
  v8 = v4;
  -[MTTimerScheduler _queue_scheduleTimers:withCompletion:](self, "_queue_scheduleTimers:withCompletion:", v6, v9);

}

uint64_t __58__MTTimerScheduler__queue_rescheduleTimersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)scheduleTimers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTTimerScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__MTTimerScheduler_scheduleTimers___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __35__MTTimerScheduler_scheduleTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleTimers:withCompletion:", *(_QWORD *)(a1 + 40), 0);
}

- (void)unscheduleTimers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTTimerScheduler serializer](self, "serializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MTTimerScheduler_unscheduleTimers___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __37__MTTimerScheduler_unscheduleTimers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleTimers:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_scheduleTimers:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  unint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  MTTimerScheduler *v46;
  _QWORD block[5];
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  MTTimerScheduler *v57;
  __int16 v58;
  _BYTE v59[14];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = a4;
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self;
  -[MTTimerScheduler _queue_lastTimerTriggerDate](self, "_queue_lastTimerTriggerDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -900.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v9;
  if (objc_msgSend(v8, "mtIsBeforeOrSameAsDate:", v9))
  {
    MTLogForCategory(4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v57 = self;
      v58 = 1024;
      *(_DWORD *)v59 = 15;
      *(_WORD *)&v59[4] = 2114;
      *(_QWORD *)&v59[6] = v9;
      _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last timer more than %d minutes ago.  Seeing if we have to fire any timers we missed since %{public}@", buf, 0x1Cu);
    }

    v11 = v9;
LABEL_12:
    v15 = v11;
    goto LABEL_13;
  }
  v12 = objc_msgSend(v8, "mtIsAfterDate:", v7);
  MTLogForCategory(4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138543874;
      v57 = v46;
      v58 = 1024;
      *(_DWORD *)v59 = 15;
      *(_WORD *)&v59[4] = 2114;
      *(_QWORD *)&v59[6] = v8;
      _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ fired last timer less than %d minutes ago.  Seeing if we have to fire any timers we missed since %{public}@", buf, 0x1Cu);
    }

    v11 = v8;
    goto LABEL_12;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138543362;
    v57 = v46;
    _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ the last timer fire date is ahead of the current date (probably because we went back in time).", buf, 0xCu);
  }

  v15 = v7;
  -[MTTimerScheduler _queue_setLastTimerTriggerDate:](v46, "_queue_setLastTimerTriggerDate:", v15);
LABEL_13:
  v43 = v8;
  v44 = v7;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v52;
    v20 = 0x1E39C9000uLL;
    do
    {
      v21 = 0;
      v45 = v18;
      do
      {
        if (*(_QWORD *)v52 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v21);
        if (objc_msgSend(v22, "state") == 3)
        {
          v23 = objc_opt_class();
          objc_msgSend(v22, "fireTime");
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
            v26 = v25;
            if (!v26)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v23, objc_opt_class());

            }
          }
          else
          {
            v26 = 0;
          }

          objc_msgSend(v26, "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v27, "mtIsBeforeDate:", v15) & 1) == 0)
          {

            goto LABEL_32;
          }
          v28 = (void *)objc_msgSend(v22, "mutableCopy");
          MTLogForCategory(4);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v28, "timerID");
            v30 = v19;
            v31 = v16;
            v32 = v15;
            v33 = v20;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v46;
            v58 = 2114;
            *(_QWORD *)v59 = v34;
            _os_log_impl(&dword_19AC4E000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting really old running timer %{public}@ to stopped", buf, 0x16u);

            v20 = v33;
            v15 = v32;
            v16 = v31;
            v19 = v30;
            v18 = v45;
          }

          objc_msgSend(v28, "setState:", 1);
          if (v28)
          {
            -[MTTimerStorage updateTimer:withCompletion:source:](v46->_storage, "updateTimer:withCompletion:source:", v28, 0);
            v26 = v28;
LABEL_32:

          }
        }
        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v18);
  }

  MTNewChildActivityForName(17);
  v35 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MTTimerScheduler__queue_scheduleTimers_withCompletion___block_invoke;
  block[3] = &unk_1E39CCB70;
  block[4] = v46;
  v48 = v16;
  v49 = v15;
  v50 = v41;
  v36 = v16;
  v37 = v15;
  v38 = v41;
  os_activity_apply(v35, block);

}

void __57__MTTimerScheduler__queue_scheduleTimers_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 138543618;
    v10 = v3;
    v11 = 2050;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling %{public}lu timers", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "scheduledTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedule:afterDate:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled timers: %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_queue_unscheduleTimers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(17);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MTTimerScheduler__queue_unscheduleTimers___block_invoke;
  block[3] = &unk_1E39CB7B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __44__MTTimerScheduler__queue_unscheduleTimers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 138543618;
    v10 = v3;
    v11 = 2050;
    v12 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ unscheduling %{public}lu timers", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "scheduledTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unschedule:", *(_QWORD *)(a1 + 40));

  MTLogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled timers: %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)scheduledListDidChange:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  MTTimerScheduler *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__MTTimerScheduler_scheduledListDidChange_withCompletion___block_invoke;
  v15[3] = &unk_1E39CC398;
  v16 = v5;
  v6 = v5;
  -[MTTimerScheduler _queue_updatePersistentTimerForNextTimerWithCompletion:](self, "_queue_updatePersistentTimerForNextTimerWithCompletion:", v15);
  -[MTTimerScheduler scheduledTimers](self, "scheduledTimers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextScheduledAlertOrNotification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "scheduleable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ next timer changed: %{public}@", buf, 0x16u);

  }
  MTLogForCategory(9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "MTTimerScheduler - Changing Next Timer", buf, 2u);
  }

  -[MTTimerScheduler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheduleable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheduler:didChangeNextTimer:", self, v14);

}

uint64_t __58__MTTimerScheduler_scheduledListDidChange_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_updatePersistentTimerForNextTimerWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  uint8_t buf[4];
  MTTimerScheduler *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerScheduler scheduledTimers](self, "scheduledTimers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2050;
    v22 = COERCE_DOUBLE(objc_msgSend(v6, "numberOfScheduledAlertsAndNotifications"));
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistent timer for %{public}ld scheduled timers", buf, 0x16u);

  }
  -[MTTimerScheduler nextTriggerDate](self, "nextTriggerDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -10.0);
  v8 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if (v8 == 0.0)
  {
    -[MTTimerScheduler _queue_unregisterTimer](self, "_queue_unregisterTimer");
    if (!v4)
      goto LABEL_20;
    goto LABEL_19;
  }
  MTLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling persistent timer for next timer at %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&v8, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 <= 0.0)
  {
    MTLogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer should have fired. Triggering it now", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__MTTimerScheduler__queue_updatePersistentTimerForNextTimerWithCompletion___block_invoke;
    v17[3] = &unk_1E39CC398;
    v18 = v4;
    -[MTTimerScheduler _queue_fireTriggeredTimersWithCompletionBlock:](self, "_queue_fireTriggeredTimersWithCompletionBlock:", v17);

    goto LABEL_20;
  }
  MTLogForCategory(4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 <= 60.0)
  {
    if (!v14)
      goto LABEL_18;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = v12;
    v15 = "%{public}@ Timer will fire %f seconds from now";
  }
  else
  {
    if (!v14)
      goto LABEL_18;
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = v12 / 60.0;
    v15 = "%{public}@ Timer will fire %f minutes from now";
  }
  _os_log_impl(&dword_19AC4E000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
LABEL_18:

  kdebug_trace();
  -[MTSchedulingDelegate scheduleTimerForSeconds:](self->_schedulingDelegate, "scheduleTimerForSeconds:", v12);
  kdebug_trace();
  if (v4)
LABEL_19:
    v4[2](v4);
LABEL_20:

}

uint64_t __75__MTTimerScheduler__queue_updatePersistentTimerForNextTimerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_unregisterTimer
{
  NSObject *v3;
  int v4;
  MTTimerScheduler *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unscheduling persistent timer.", (uint8_t *)&v4, 0xCu);
  }

  -[MTSchedulingDelegate unscheduleTimer](self->_schedulingDelegate, "unscheduleTimer");
}

+ (id)_intervalToCheckForTimersToFireBeforeDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "dateByAddingTimeInterval:", 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -900.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v4);
  return v6;
}

- (void)_queue_triggerDidFireForTimerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTTimerScheduler *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer timer fired", (uint8_t *)&v6, 0xCu);
  }

  -[MTTimerScheduler _queue_unregisterTimer](self, "_queue_unregisterTimer");
  -[MTTimerScheduler _queue_fireTriggeredTimersWithCompletionBlock:](self, "_queue_fireTriggeredTimersWithCompletionBlock:", v4);

}

- (void)_fireScheduledTimer:(id)a3 firedDate:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  MTScheduledList *scheduledTimers;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  MTTimerScheduler *v23;
  uint8_t buf[4];
  MTTimerScheduler *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  scheduledTimers = self->_scheduledTimers;
  v11 = (void (**)(_QWORD))a5;
  if (-[MTScheduledList isScheduled:](scheduledTimers, "isScheduled:", v8))
  {
    MTLogForCategory(9);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_INFO, "MTTimerScheduler - Firing Timer", buf, 2u);
    }

    -[MTScheduledList _unscheduleObject:](self->_scheduledTimers, "_unscheduleObject:", v8);
    -[MTNotificationCenter postNotificationForScheduledTimer:completionBlock:](self->_notificationCenter, "postNotificationForScheduledTimer:completionBlock:", v8, v11);

    -[MTTimerScheduler _queue_setLastTimerTriggerDate:](self, "_queue_setLastTimerTriggerDate:", v9);
    objc_msgSend(v8, "scheduleable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timerByUpdatingWithState:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setFiredDate:", v9);
    -[MTTimerScheduler storage](self, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke;
    v20[3] = &unk_1E39CCB98;
    v21 = v15;
    v22 = v8;
    v23 = self;
    v11 = v15;
    objc_msgSend(v16, "updateTimer:withCompletion:source:", v11, v20, self);

  }
  else
  {
    MTLogForCategory(4);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "scheduleable");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v19;
      _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer %{public}@ was supposed to fire but is no longer scheduled", buf, 0x16u);

    }
    v11[2](v11);
  }

}

void __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTScheduledObject scheduledObjectForScheduleable:trigger:](MTScheduledObject, "scheduledObjectForScheduleable:trigger:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduler:didFireTimer:", *(_QWORD *)(a1 + 48), v4);

  objc_msgSend(*(id *)(a1 + 48), "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke_2;
  v7[3] = &unk_1E39CB858;
  v7[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "performBlock:", v7);

}

void __66__MTTimerScheduler__fireScheduledTimer_firedDate_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scheduledTimers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextScheduledAlertOrNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MTLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no next timer", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduler:didChangeNextTimer:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)_queue_fireTriggeredTimersWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  MTNewChildActivityForName(18);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke;
  block[3] = &unk_1E39CB880;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  os_activity_apply(v5, block);

}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E39CB880;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performBlock:", v4);

}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  void *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[6];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  double v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 32);
    *(_DWORD *)buf = 138543618;
    v49 = v3;
    v50 = 2114;
    v51 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled timers: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_intervalToCheckForTimersToFireBeforeDate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  MTLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v49 = v8;
    v50 = 2114;
    v51 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Find notifications with current trigger date in range %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "scheduledObjectsToFireInInterval:", v6);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v45;
    v13 = 0x1E39C9000;
    v36 = a1;
    do
    {
      v14 = 0;
      v15 = v5;
      do
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        objc_msgSend(v16, "trigger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "triggerDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = 0.0;
        if (objc_msgSend(v5, "mtIsBeforeDate:", v18))
        {
          objc_msgSend(v18, "timeIntervalSinceDate:", v5);
          v19 = v20;
          MTLogForCategory(4);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v37 = v5;
            v22 = v11;
            v23 = v12;
            v24 = v10;
            v25 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v16, "scheduleable");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v25;
            v10 = v24;
            v12 = v23;
            v11 = v22;
            v5 = v37;
            v50 = 2114;
            v51 = (uint64_t)v27;
            v52 = 2048;
            v53 = v19;
            _os_log_impl(&dword_19AC4E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer %{public}@ should actually fire in %f seconds", buf, 0x20u);

            a1 = v36;
          }

          v13 = 0x1E39C9000uLL;
        }
        v28 = *(void **)(v13 + 3864);
        v42[0] = v10;
        v42[1] = 3221225472;
        v42[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_20;
        v42[3] = &unk_1E39CCBC0;
        v42[4] = *(_QWORD *)(a1 + 32);
        v42[5] = v16;
        v43 = v18;
        v29 = v18;
        objc_msgSend(v28, "taskWithIdentifier:delay:completableBlock:", CFSTR("com.apple.MTTimerTask.fire"), v42, v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v30);

        ++v14;
        v15 = v5;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v11);
  }
  kdebug_trace();
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(a1 + 40);
  v33 = *(void **)(v31 + 64);
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_3;
  v40[3] = &unk_1E39CB880;
  v40[4] = v31;
  v41 = v32;
  +[MTTaskGroup taskGroupWithTasks:completionBlock:](MTTaskGroup, "taskGroupWithTasks:completionBlock:", v39, v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "scheduleTaskGroup:", v34);

}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  __int128 v7;
  id v8;
  id v9;

  v3 = a2;
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "serializer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2_21;
  v6[3] = &unk_1E39CCB70;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_2_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireScheduledTimer:firedDate:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;

  v4 = MEMORY[0x1E0C809B0];
  v6 = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_4;
  v7 = &unk_1E39CCC10;
  v2 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v5 = 3221225472;
  v9 = v2;
  +[MTTask taskWithIdentifier:completableBlock:](MTTask, "taskWithIdentifier:completableBlock:", CFSTR("com.apple.MTTimerTask.reschedule"), &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "scheduleTask:", v3, v4, v5, v6, v7, v8);

}

void __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fired all timers.  Rescheduling.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_24;
  v8[3] = &unk_1E39CCBE8;
  v6 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "rescheduleTimersWithCompletion:", v8);

}

uint64_t __66__MTTimerScheduler__queue_fireTriggeredTimersWithCompletionBlock___block_invoke_24(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_queue_lastTimerTriggerDate
{
  MTPersistence *defaults;
  void *v3;
  void *v4;

  defaults = self->_defaults;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPersistence objectForKey:defaultValue:](defaults, "objectForKey:defaultValue:", CFSTR("MTTimerLastTriggerDate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_queue_setLastTimerTriggerDate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  MTTimerScheduler *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MTLogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting last timer trigger date to %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[MTPersistence setObject:forKey:](self->_defaults, "setObject:forKey:", v4, CFSTR("MTTimerLastTriggerDate"));
}

- (void)printDiagnostics
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "-----MTTimerScheduler-----", (uint8_t *)&v6, 2u);
  }

  MTLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTTimerScheduler scheduledTimers](self, "scheduledTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Scheduled Timers: %{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (id)gatherDiagnostics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("Scheduled timers");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[MTTimerScheduler scheduledTimers](self, "scheduledTimers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfScheduledAlerts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  if (a4 == 2)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MTTimerScheduler.timer-event"));
  else
    return 0;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  kdebug_trace();
  -[MTTimerScheduler serializer](self, "serializer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke;
  v9[3] = &unk_1E39CB880;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

void __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke_2;
  v2[3] = &unk_1E39CC398;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_queue_triggerDidFireForTimerWithCompletionBlock:", v2);

}

uint64_t __57__MTTimerScheduler_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  -[MTTimerScheduler scheduleTimers:](self, "scheduleTimers:", a4);
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  -[MTTimerScheduler scheduleTimers:](self, "scheduleTimers:", a4);
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  -[MTTimerScheduler unscheduleTimers:](self, "unscheduleTimers:", a4);
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MTTimerScheduler *v10;

  v5 = a4;
  -[MTTimerScheduler serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__MTTimerScheduler_source_didDismissTimer___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

uint64_t __43__MTTimerScheduler_source_didDismissTimer___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      MTLogForCategory(4);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(v1 + 32);
        v3 = *(_QWORD *)(v1 + 40);
        v5 = 138543618;
        v6 = v3;
        v7 = 2114;
        v8 = v4;
        _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Dismissing notifications for timer: %{public}@", (uint8_t *)&v5, 0x16u);
      }

      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 24), "dismissNotificationsForTimer:", *(_QWORD *)(v1 + 32));
    }
  }
  return result;
}

- (id)sourceIdentifier
{
  return CFSTR("MTTimerScheduler");
}

- (MTTimerSchedulerDelegate)delegate
{
  return (MTTimerSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (MTNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (MTScheduledList)scheduledTimers
{
  return self->_scheduledTimers;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (MTSchedulingDelegate)schedulingDelegate
{
  return self->_schedulingDelegate;
}

- (MTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (MTPersistence)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_schedulingDelegate, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_scheduledTimers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
