@implementation CNCoalescingTimer

- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNCoalescingTimer *v14;
  _QWORD v16[4];
  CNCoalescingTimer *v17;
  id v18;
  id location;

  v8 = a5;
  objc_initWeak(&location, v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__CNCoalescingTimer_initWithDelay_options_delegate___block_invoke;
  v16[3] = &unk_1E29B9758;
  objc_copyWeak(&v18, &location);
  v17 = self;
  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "schedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "schedulerProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNCoalescingTimer initWithDelay:options:block:schedulerProvider:downstreamScheduler:](v17, "initWithDelay:options:block:schedulerProvider:downstreamScheduler:", a4, v16, v10, v13, a3);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

- (CNCoalescingTimer)initWithDelay:(double)a3 options:(unint64_t)a4 block:(id)a5 schedulerProvider:(id)a6 downstreamScheduler:(id)a7
{
  id v12;
  id v13;
  id v14;
  CNCoalescingTimer *v15;
  CNCoalescingTimer *v16;
  uint64_t v17;
  id block;
  CNUnfairLock *v19;
  CNUnfairLock *resourceLock;
  uint64_t v21;
  CNScheduler *delayScheduler;
  CNCoalescingTimer *v23;
  objc_super v25;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CNCoalescingTimer;
  v15 = -[CNCoalescingTimer init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_delay = a3;
    v17 = objc_msgSend(v12, "copy");
    block = v16->_block;
    v16->_block = (id)v17;

    v16->_options = a4;
    objc_storeStrong((id *)&v16->_downstreamScheduler, a7);
    v19 = objc_alloc_init(CNUnfairLock);
    resourceLock = v16->_resourceLock;
    v16->_resourceLock = v19;

    objc_msgSend(v13, "backgroundScheduler");
    v21 = objc_claimAutoreleasedReturnValue();
    delayScheduler = v16->_delayScheduler;
    v16->_delayScheduler = (CNScheduler *)v21;

    *(_WORD *)&v16->_open = 1;
    v23 = v16;
  }

  return v16;
}

uint64_t __32__CNCoalescingTimer_handleEvent__block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "nts_isDoorOpened"))
  {
    return objc_msgSend(*(id *)(a1 + 32), "nts_letSomeoneIn");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "nts_isDoorOpened"))
    objc_msgSend(*(id *)(a1 + 32), "nts_closeDoor");
  return objc_msgSend(*(id *)(a1 + 32), "nts_makeSomeoneWait");
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)open
{
  return self->_open;
}

- (void)nts_closeDoor
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CNCoalescingTimer setOpen:](self, "setOpen:", 0);
  -[CNCoalescingTimer delayScheduler](self, "delayScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCoalescingTimer delay](self, "delay");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CNCoalescingTimer_nts_closeDoor__block_invoke;
  v5[3] = &unk_1E29B9358;
  v5[4] = self;
  objc_msgSend(v3, "afterDelay:performBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCoalescingTimer setScheduledToken:](self, "setScheduledToken:", v4);

}

- (void)setScheduledToken:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledToken, a3);
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (double)delay
{
  return self->_delay;
}

- (CNScheduler)delayScheduler
{
  return self->_delayScheduler;
}

- (void)nts_makeSomeoneWait
{
  OUTLINED_FUNCTION_0_2(&dword_18F80C000, a1, a3, "Coalescing event", a5, a6, a7, a8, 0);
}

- (void)setSomeoneWaiting:(BOOL)a3
{
  self->_someoneWaiting = a3;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_0 != -1)
    dispatch_once(&os_log_cn_once_token_1_0, &__block_literal_global_15);
  return (OS_os_log *)(id)os_log_cn_once_object_1_0;
}

void __27__CNCoalescingTimer_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.foundation", "coalescing-timer");
  v1 = (void *)os_log_cn_once_object_1_0;
  os_log_cn_once_object_1_0 = (uint64_t)v0;

}

- (void)handleEvent
{
  void *v3;
  _QWORD v4[5];

  -[CNCoalescingTimer resourceLock](self, "resourceLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__CNCoalescingTimer_handleEvent__block_invoke;
  v4[3] = &unk_1E29B9358;
  v4[4] = self;
  CNRunWithLock(v3, v4);

}

- (CNUnfairLock)resourceLock
{
  return self->_resourceLock;
}

void __52__CNCoalescingTimer_initWithDelay_options_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "timerDidEmitEvent:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[CNCancelable cancel](self->_scheduledToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNCoalescingTimer;
  -[CNCoalescingTimer dealloc](&v3, sel_dealloc);
}

- (void)nts_letSomeoneIn
{
  void *v3;
  id v4;

  -[CNCoalescingTimer setSomeoneWaiting:](self, "setSomeoneWaiting:", 0);
  -[CNCoalescingTimer nts_closeDoor](self, "nts_closeDoor");
  -[CNCoalescingTimer downstreamScheduler](self, "downstreamScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNCoalescingTimer block](self, "block");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performBlock:", v3);

}

- (void)nts_openDoor
{
  OUTLINED_FUNCTION_0_2(&dword_18F80C000, a1, a3, "Emitting coalesced event", a5, a6, a7, a8, 0);
}

void __34__CNCoalescingTimer_nts_closeDoor__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "resourceLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__CNCoalescingTimer_nts_closeDoor__block_invoke_2;
  v3[3] = &unk_1E29B9358;
  v3[4] = *(_QWORD *)(a1 + 32);
  CNRunWithLock(v2, v3);

}

uint64_t __34__CNCoalescingTimer_nts_closeDoor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_openDoor");
}

- (CNCancelable)scheduledToken
{
  return self->_scheduledToken;
}

- (CNScheduler)downstreamScheduler
{
  return self->_downstreamScheduler;
}

- (id)block
{
  return self->_block;
}

- (BOOL)isSomeoneWaiting
{
  return self->_someoneWaiting;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_downstreamScheduler, 0);
  objc_storeStrong((id *)&self->_delayScheduler, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_scheduledToken, 0);
}

@end
