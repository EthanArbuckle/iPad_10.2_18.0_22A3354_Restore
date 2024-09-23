@implementation HDXPCAlarm

- (HDXPCAlarm)initWithScheduler:(id)a3 eventName:(id)a4 eventHandlerQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDXPCAlarm *v12;
  HDXPCAlarm *v13;
  uint64_t v14;
  NSString *eventName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDXPCAlarm;
  v12 = -[HDXPCAlarm init](&v17, sel_init);
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

- (HDXPCAlarm)initWithProfileIdentifier:(id)a3 scheduler:(id)a4 eventName:(id)a5 eventHandlerQueue:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  HDXPCAlarm *v17;

  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = a5;
  objc_msgSend(a3, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ for HDProfile:%@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "length") >= 0x81)
  {
    objc_msgSend(v15, "substringWithRange:", 0, 128);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = -[HDXPCAlarm initWithScheduler:eventName:eventHandlerQueue:](self, "initWithScheduler:eventName:eventHandlerQueue:", v10, v15, v11);

  return v17;
}

- (void)beginReceivingEventsWithHandler:(id)a3
{
  void *v5;
  id eventHandler;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eventHandler)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCAlarm.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_eventHandler == nil"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  eventHandler = self->_eventHandler;
  self->_eventHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
  -[HDXPCAlarmScheduler addAlarm:](self->_scheduler, "addAlarm:", self);

}

- (void)invalidate
{
  id eventHandler;

  -[HDXPCAlarmScheduler removeAlarm:](self->_scheduler, "removeAlarm:", self);
  os_unfair_lock_lock(&self->_lock);
  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNextFireDate:(id)a3 isUserVisible:(BOOL)a4
{
  _BOOL8 v4;
  HDXPCAlarmEvent *v6;
  void *v7;
  HDXPCAlarmEvent *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = [HDXPCAlarmEvent alloc];
  -[HDXPCAlarm eventName](self, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDXPCAlarmEvent initWithName:fireDate:isUserVisible:](v6, "initWithName:fireDate:isUserVisible:", v7, v12, v4);

  -[HDXPCAlarm scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheduleEvent:", v8);

  -[HDXPCAlarm unitTest_schedulerObserver](self, "unitTest_schedulerObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HDXPCAlarm unitTest_schedulerObserver](self, "unitTest_schedulerObserver");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8))v11)[2](v11, v12, v4);

  }
}

- (void)unschedule
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HDXPCAlarm scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDXPCAlarm eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unscheduleEventWithName:", v4);

  -[HDXPCAlarm unitTest_schedulerObserver](self, "unitTest_schedulerObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDXPCAlarm unitTest_schedulerObserver](self, "unitTest_schedulerObserver");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p eventName:%@>"), objc_opt_class(), self, self->_eventName);
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
  -[HDXPCAlarm eventHandler](self, "eventHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDXPCAlarm.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

  }
  -[HDXPCAlarm eventHandlerQueue](self, "eventHandlerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__HDXPCAlarm_eventDidFire___block_invoke;
  block[3] = &unk_24CB18480;
  v12 = v5;
  v13 = v6;
  block[4] = self;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __27__HDXPCAlarm_eventDidFire___block_invoke(uint64_t a1)
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

- (void)unitTest_fireEventImmediatelyWithDate:(id)a3 isUserVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HDXPCAlarmEvent *v7;
  void *v8;
  void *v9;
  HDXPCAlarmEvent *v10;

  v4 = a4;
  v6 = a3;
  v7 = [HDXPCAlarmEvent alloc];
  -[HDXPCAlarm eventName](self, "eventName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDXPCAlarmEvent initWithName:fireDate:isUserVisible:](v7, "initWithName:fireDate:isUserVisible:", v8, v6, v4);

  -[HDXPCAlarm scheduler](self, "scheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unittest_fireEvent:", v10);

}

- (NSString)eventName
{
  return self->_eventName;
}

- (HDXPCAlarmScheduler)scheduler
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

- (id)unitTest_schedulerObserver
{
  return self->_unitTest_schedulerObserver;
}

- (void)setUnitTest_schedulerObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_schedulerObserver, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventHandlerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
