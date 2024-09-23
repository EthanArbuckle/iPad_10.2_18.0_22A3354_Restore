@implementation EFXPCAlarm

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p eventName:%@>"), objc_opt_class(), self, self->_eventName);
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  void *v5;
  void *v6;
  id eventHandler;
  void *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = v9;
  if (self->_eventHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFXPCAlarm.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_eventHandler == nil"));

    v5 = v9;
  }
  v6 = (void *)objc_msgSend(v5, "copy");
  eventHandler = self->_eventHandler;
  self->_eventHandler = v6;

  os_unfair_lock_unlock(&self->_lock);
  -[EFXPCAlarmScheduler addAlarm:](self->_scheduler, "addAlarm:", self);

}

- (NSString)eventName
{
  return self->_eventName;
}

- (EFXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  EFXPCAlarm *v12;
  EFXPCAlarm *v13;
  uint64_t v14;
  NSString *eventName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EFXPCAlarm;
  v12 = -[EFXPCAlarm init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scheduler, a3);
    v14 = objc_msgSend(v10, "copy");
    eventName = v13->_eventName;
    v13->_eventName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_eventHandlerQueue, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)invalidate
{
  id eventHandler;

  -[EFXPCAlarmScheduler removeAlarm:](self->_scheduler, "removeAlarm:", self);
  os_unfair_lock_lock(&self->_lock);
  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4
{
  _BOOL8 v4;
  EFXPCAlarmEvent *v6;
  void *v7;
  EFXPCAlarmEvent *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v4 = a4;
  v12 = a3;
  if (v12)
  {
    v6 = [EFXPCAlarmEvent alloc];
    -[EFXPCAlarm eventName](self, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EFXPCAlarmEvent initWithName:fireDate:isUserVisible:](v6, "initWithName:fireDate:isUserVisible:", v7, v12, v4);

    -[EFXPCAlarm scheduler](self, "scheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheduleEvent:", v8);

    -[EFXPCAlarm test_schedulerObserver](self, "test_schedulerObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[EFXPCAlarm test_schedulerObserver](self, "test_schedulerObserver");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _BOOL8))v11)[2](v11, v12, v4);

    }
  }
  else
  {
    -[EFXPCAlarm unschedule](self, "unschedule");
  }

}

- (void)unschedule
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[EFXPCAlarm scheduler](self, "scheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EFXPCAlarm eventName](self, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleEventWithName:", v3);

  -[EFXPCAlarm test_schedulerObserver](self, "test_schedulerObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EFXPCAlarm test_schedulerObserver](self, "test_schedulerObserver");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

  }
}

- (void)eventDidFire:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[EFXPCAlarm eventHandler](self, "eventHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFXPCAlarm.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

  }
  -[EFXPCAlarm eventHandlerQueue](self, "eventHandlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EFXPCAlarm_eventDidFire___block_invoke;
  block[3] = &unk_1E62A7938;
  v12 = v5;
  v13 = v6;
  block[4] = self;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __27__EFXPCAlarm_eventDidFire___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "fireDate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v3 + 16))(v3, v2, v4, objc_msgSend(*(id *)(a1 + 40), "isUserVisible"));

}

- (void)test_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4
{
  _BOOL8 v4;
  EFXPCAlarmEvent *v6;
  void *v7;
  EFXPCAlarmEvent *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = [EFXPCAlarmEvent alloc];
  -[EFXPCAlarm eventName](self, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EFXPCAlarmEvent initWithName:fireDate:isUserVisible:](v6, "initWithName:fireDate:isUserVisible:", v7, v10, v4);

  -[EFXPCAlarm scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "test_fireEvent:", v8);

}

- (EFXPCAlarmScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)eventHandlerQueue
{
  return self->_eventHandlerQueue;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)test_schedulerObserver
{
  return self->_test_schedulerObserver;
}

- (void)setTest_schedulerObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test_schedulerObserver, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
