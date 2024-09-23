@implementation HDRestorableAlarm

- (HDRestorableAlarm)initWithProfile:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HDRestorableAlarm *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "alarmScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDRestorableAlarm initWithScheduler:clientIdentifier:eventHandlerQueue:](self, "initWithScheduler:clientIdentifier:eventHandlerQueue:", v10, v9, v8);

  return v11;
}

- (HDRestorableAlarm)initWithScheduler:(id)a3 clientIdentifier:(id)a4 eventHandlerQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDRestorableAlarm *v12;
  HDRestorableAlarm *v13;
  uint64_t v14;
  NSString *clientIdentifier;
  NSMutableSet *v16;
  NSMutableSet *outstandingEventIdentifiers;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDRestorableAlarm;
  v12 = -[HDRestorableAlarm init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scheduler, a3);
    v14 = objc_msgSend(v10, "copy");
    clientIdentifier = v13->_clientIdentifier;
    v13->_clientIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_eventHandlerQueue, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    outstandingEventIdentifiers = v13->_outstandingEventIdentifiers;
    v13->_outstandingEventIdentifiers = v16;

  }
  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p clientIdentifier:%@>"), objc_opt_class(), self, self->_clientIdentifier);
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  void *v5;
  id eventsHandler;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eventsHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRestorableAlarm.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_eventsHandler == nil"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  eventsHandler = self->_eventsHandler;
  self->_eventsHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  -[HDRestorableAlarmSchedulerProtocol addAlarm:](self->_scheduler, "addAlarm:", self);

}

- (void)invalidate
{
  id eventsHandler;

  -[HDRestorableAlarmSchedulerProtocol removeAlarm:](self->_scheduler, "removeAlarm:", self);
  os_unfair_lock_lock(&self->_lock);
  eventsHandler = self->_eventsHandler;
  self->_eventsHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5
{
  id v8;
  id v9;
  HDAlarmEvent *v10;
  void *v11;
  HDAlarmEvent *v12;

  v8 = a4;
  v9 = a3;
  v10 = [HDAlarmEvent alloc];
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDAlarmEvent initWithClientIdentifier:eventIdentifier:dueDate:eventOptions:](v10, "initWithClientIdentifier:eventIdentifier:dueDate:eventOptions:", v11, v9, v8, a5);

  return v12;
}

- (id)eventWithIdentifier:(id)a3 dueDate:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6
{
  id v10;
  id v11;
  HDAlarmEvent *v12;
  void *v13;
  HDAlarmEvent *v14;

  v10 = a4;
  v11 = a3;
  v12 = [HDAlarmEvent alloc];
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDAlarmEvent initWithClientIdentifier:eventIdentifier:dueDate:eventOptions:clientOptions:](v12, "initWithClientIdentifier:eventIdentifier:dueDate:eventOptions:clientOptions:", v13, v11, v10, a5, a6);

  return v14;
}

- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5
{
  id v8;
  id v9;
  HDAlarmEvent *v10;
  void *v11;
  HDAlarmEvent *v12;

  v8 = a4;
  v9 = a3;
  v10 = [HDAlarmEvent alloc];
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDAlarmEvent initWithClientIdentifier:eventIdentifier:dueDateComponents:eventOptions:](v10, "initWithClientIdentifier:eventIdentifier:dueDateComponents:eventOptions:", v11, v9, v8, a5);

  return v12;
}

- (id)eventWithIdentifier:(id)a3 dueDateComponents:(id)a4 eventOptions:(unint64_t)a5 clientOptions:(unint64_t)a6
{
  id v10;
  id v11;
  HDAlarmEvent *v12;
  void *v13;
  HDAlarmEvent *v14;

  v10 = a4;
  v11 = a3;
  v12 = [HDAlarmEvent alloc];
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDAlarmEvent initWithClientIdentifier:eventIdentifier:dueDateComponents:eventOptions:clientOptions:](v12, "initWithClientIdentifier:eventIdentifier:dueDateComponents:eventOptions:clientOptions:", v13, v11, v10, a5, a6);

  return v14;
}

- (id)allScheduledEventsWithError:(id *)a3
{
  HDRestorableAlarmSchedulerProtocol *scheduler;
  void *v5;
  void *v6;

  scheduler = self->_scheduler;
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRestorableAlarmSchedulerProtocol scheduledEventsForClientIdentifier:error:](scheduler, "scheduledEventsForClientIdentifier:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)scheduleEvents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *outstandingEventIdentifiers;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  HDRestorableAlarm *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2048;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduled %lu new events", buf, 0x16u);
  }

  v8 = -[HDRestorableAlarmSchedulerProtocol scheduleEvents:error:](self->_scheduler, "scheduleEvents:error:", v6, a4);
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "eventIdentifier", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](outstandingEventIdentifiers, "removeObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (BOOL)removeEvents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableSet *outstandingEventIdentifiers;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  HDRestorableAlarm *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2048;
    v25 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing %lu events", buf, 0x16u);
  }

  v8 = -[HDRestorableAlarmSchedulerProtocol removeEvents:error:](self->_scheduler, "removeEvents:error:", v6, a4);
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "eventIdentifier", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](outstandingEventIdentifiers, "removeObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (id)replaceAllScheduledEventsWithEvents:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  HDRestorableAlarmSchedulerProtocol *scheduler;
  void *v9;
  void *v10;
  int v12;
  HDRestorableAlarm *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = self;
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Replacing all scheduled events with %lu new events", (uint8_t *)&v12, 0x16u);
  }

  scheduler = self->_scheduler;
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRestorableAlarmSchedulerProtocol replaceAllScheduledEventsWithClientIdentifier:newEvents:error:](scheduler, "replaceAllScheduledEventsWithClientIdentifier:newEvents:error:", v9, v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_outstandingEventIdentifiers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (BOOL)removeAllEventsWithError:(id *)a3
{
  NSObject *v5;
  HDRestorableAlarmSchedulerProtocol *scheduler;
  void *v7;
  char v8;
  int v10;
  HDRestorableAlarm *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing all scheduled events", (uint8_t *)&v10, 0xCu);
  }

  scheduler = self->_scheduler;
  -[HDRestorableAlarm clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDRestorableAlarmSchedulerProtocol removeAllEventsWithClientIdentifier:error:](scheduler, "removeAllEventsWithClientIdentifier:error:", v7, a3);

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_outstandingEventIdentifiers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (void)checkForDueEventsWithCompletion:(id)a3
{
  id v4;
  HDRestorableAlarmSchedulerProtocol *scheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke;
  v7[3] = &unk_1E6D03DE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HDRestorableAlarmSchedulerProtocol checkForDueEventsImmediatelyWithCompletion:](scheduler, "checkForDueEventsImmediatelyWithCompletion:", v7);

}

void __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v6 = a4;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E6D003A8;
  v12 = v6;
  v13 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v14 = a3;
  v11[4] = v9;
  v10 = v6;
  dispatch_async(v8, v11);

}

uint64_t __53__HDRestorableAlarm_checkForDueEventsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)eventsDidFire:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableSet *outstandingEventIdentifiers;
  void *v13;
  NSObject *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  NSObject *eventHandlerQueue;
  void *v19;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  HDRestorableAlarm *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v21 = _Block_copy(self->_eventsHandler);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        outstandingEventIdentifiers = self->_outstandingEventIdentifiers;
        objc_msgSend(v11, "eventIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(outstandingEventIdentifiers) = -[NSMutableSet containsObject:](outstandingEventIdentifiers, "containsObject:", v13);

        if ((_DWORD)outstandingEventIdentifiers)
        {
          _HKInitializeLogging();
          HKLogInfrastructure();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "eventIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = self;
            v31 = 2114;
            v32 = v15;
            _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping notification for in-flight event %{public}@", buf, 0x16u);

          }
        }
        else
        {
          v16 = self->_outstandingEventIdentifiers;
          objc_msgSend(v11, "eventIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v16, "addObject:", v17);

          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v5, "count"))
  {
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRestorableAlarm.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventsHandler != nil"));

    }
    eventHandlerQueue = self->_eventHandlerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__HDRestorableAlarm_eventsDidFire___block_invoke;
    block[3] = &unk_1E6CEBCA0;
    v24 = v21;
    block[4] = self;
    v23 = v5;
    dispatch_async(eventHandlerQueue, block);

  }
}

uint64_t __35__HDRestorableAlarm_eventsDidFire___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDRestorableAlarm description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  os_unfair_lock_lock(p_lock);
  objc_msgSend(v4, "addObject:", CFSTR("\tOutstanding event identifiers:"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_outstandingEventIdentifiers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HDXPCAlarm)systemScheduler
{
  return (HDXPCAlarm *)-[HDRestorableAlarmSchedulerProtocol systemScheduler](self->_scheduler, "systemScheduler");
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (OS_dispatch_queue)eventHandlerQueue
{
  return self->_eventHandlerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingEventIdentifiers, 0);
  objc_storeStrong(&self->_eventsHandler, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
}

@end
