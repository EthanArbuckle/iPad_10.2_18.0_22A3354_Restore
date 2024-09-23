@implementation AXDispatchTimer

- (void)_afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  NSObject *v17;
  id v18;
  _QWORD handler[5];
  id v20;

  v8 = a4;
  v9 = a5;
  if (!-[AXDispatchTimer isCancelled](self, "isCancelled"))
  {
    -[AXDispatchTimer dispatchTimer](self, "dispatchTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!-[AXDispatchTimer automaticallyCancelPendingBlockUponSchedulingNewBlock](self, "automaticallyCancelPendingBlockUponSchedulingNewBlock"))goto LABEL_11;
      -[AXDispatchTimer _reallyCancel](self, "_reallyCancel");
    }
    -[AXDispatchTimer dispatchQueue](self, "dispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);

    if (-[AXDispatchTimer useWallTime](self, "useWallTime"))
      v13 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
    else
      v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke;
      handler[3] = &unk_1E28C2CD0;
      handler[4] = self;
      v20 = v9;
      dispatch_source_set_cancel_handler(v12, handler);

    }
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke_2;
    v16[3] = &unk_1E28C2D18;
    v16[4] = self;
    v17 = v12;
    v18 = v8;
    v15 = v12;
    dispatch_source_set_event_handler(v15, v16);
    dispatch_resume(v15);
    -[AXDispatchTimer setDispatchTimer:](self, "setDispatchTimer:", v15);

  }
LABEL_11:

}

- (void)cancel
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  _QWORD block[5];

  -[AXDispatchTimer setCancelled:](self, "setCancelled:", 1);
  -[AXDispatchTimer setPending:](self, "setPending:", 0);
  v3 = objc_msgSend(dispatch_get_specific(&DispatchQueueIDKey), "unsignedLongLongValue");
  -[AXDispatchTimer dispatchQueue](self, "dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((void *)v3 == v4)
  {
    v6 = -[AXDispatchTimer isActive](self, "isActive");

    if (!v6)
    {
      -[AXDispatchTimer _reallyCancel](self, "_reallyCancel");
      return;
    }
  }
  else
  {

  }
  -[AXDispatchTimer dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__AXDispatchTimer_cancel__block_invoke;
  block[3] = &unk_1E28C1C88;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)_reallyCancel
{
  NSObject *v3;
  void *v4;
  void (**v5)(void);
  NSObject *v6;

  -[AXDispatchTimer dispatchTimer](self, "dispatchTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    dispatch_source_cancel(v3);
    -[AXDispatchTimer setDispatchTimer:](self, "setDispatchTimer:", 0);
  }
  else
  {
    -[AXDispatchTimer cancelBlock](self, "cancelBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AXDispatchTimer cancelBlock](self, "cancelBlock");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

    }
  }
  -[AXDispatchTimer setCancelBlock:](self, "setCancelBlock:", 0);
  -[AXDispatchTimer setProcessBlock:](self, "setProcessBlock:", 0);

}

- (OS_dispatch_source)dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)afterDelay:(double)a3 processBlock:(id)a4 cancelBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  double v18;

  v8 = a4;
  v9 = a5;
  -[AXDispatchTimer setCancelled:](self, "setCancelled:", 0);
  -[AXDispatchTimer setPending:](self, "setPending:", 1);
  -[AXDispatchTimer setCancelBlock:](self, "setCancelBlock:", v9);
  -[AXDispatchTimer setProcessBlock:](self, "setProcessBlock:", v8);
  v10 = objc_msgSend(dispatch_get_specific(&DispatchQueueIDKey), "unsignedLongLongValue");
  -[AXDispatchTimer dispatchQueue](self, "dispatchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((void *)v10 != v11)
  {

    goto LABEL_5;
  }
  v13 = -[AXDispatchTimer isActive](self, "isActive");

  if (v13)
  {
LABEL_5:
    -[AXDispatchTimer dispatchQueue](self, "dispatchQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__AXDispatchTimer_afterDelay_processBlock_cancelBlock___block_invoke;
    v15[3] = &unk_1E28C2D40;
    v15[4] = self;
    v18 = a3;
    v16 = v8;
    v17 = v9;
    dispatch_async(v14, v15);

    goto LABEL_6;
  }
  -[AXDispatchTimer _afterDelay:processBlock:cancelBlock:](self, "_afterDelay:processBlock:cancelBlock:", v8, v9, a3);
LABEL_6:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setProcessBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (AXDispatchTimer)initWithTargetSerialQueue:(id)a3
{
  id v4;
  AXDispatchTimer *v5;
  AXDispatchTimer *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_queue_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AXDispatchTimer;
  v5 = -[AXDispatchTimer init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[AXDispatchTimer setDispatchQueue:](v5, "setDispatchQueue:", v4);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@.%@.TimerQueue"), v9, v11);

      v13 = objc_retainAutorelease(v12);
      v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
      -[AXDispatchTimer setDispatchQueue:](v6, "setDispatchQueue:", v14);

    }
    -[AXDispatchTimer dispatchQueue](v6, "dispatchQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[AXDispatchTimer dispatchQueue](v6, "dispatchQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithUnsignedLongLong:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    dispatch_queue_set_specific(v15, &DispatchQueueIDKey, v18, (dispatch_function_t)destructor);

  }
  return v6;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

uint64_t __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPending:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 40), &__block_literal_global_3);
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

uint64_t __55__AXDispatchTimer_afterDelay_processBlock_cancelBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_afterDelay:processBlock:cancelBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __25__AXDispatchTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyCancel");
}

- (BOOL)useWallTime
{
  return self->_useWallTime;
}

- (void)setDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTimer, a3);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (id)cancelBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  -[AXDispatchTimer afterDelay:processBlock:cancelBlock:](self, "afterDelay:processBlock:cancelBlock:", a4, 0, a3);
}

- (AXDispatchTimer)init
{
  return -[AXDispatchTimer initWithTargetSerialQueue:](self, "initWithTargetSerialQueue:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[AXDispatchTimer _reallyCancel](self, "_reallyCancel");
  v3.receiver = self;
  v3.super_class = (Class)AXDispatchTimer;
  -[AXDispatchTimer dealloc](&v3, sel_dealloc);
}

uint64_t __56__AXDispatchTimer__afterDelay_processBlock_cancelBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPending:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXDispatchTimer;
  -[AXDispatchTimer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDispatchTimer label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isPending
{
  return self->_pending;
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setUseWallTime:(BOOL)a3
{
  self->_useWallTime = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (id)processBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong(&self->_processBlock, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
