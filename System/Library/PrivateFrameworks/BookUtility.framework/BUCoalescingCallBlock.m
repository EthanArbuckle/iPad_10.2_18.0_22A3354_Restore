@implementation BUCoalescingCallBlock

- (void)signalWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend_sync(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E47210;
  block[3] = &unk_24CED9D20;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_sync(v7, block);

}

- (double)coalescingDelay
{
  return self->_coalescingDelay;
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (unint64_t)nextCoalescingTime
{
  return self->_nextCoalescingTime;
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (void)setNextCoalescingTime:(unint64_t)a3
{
  self->_nextCoalescingTime = a3;
}

- (unint64_t)nextMaxTime
{
  return self->_nextMaxTime;
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (void)setCoalescingDelay:(double)a3
{
  self->_coalescingDelay = a3;
}

- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 notifyTimeout:(unsigned __int16)a4 blockDescription:(id)a5 notifyTimeoutBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  BUCoalescingCallBlock *v15;
  uint64_t v16;
  id notifyBlock;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id notifyTimeoutBlock;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *notifyBlockDescription;
  dispatch_group_t v26;
  OS_dispatch_group *group;
  dispatch_queue_t v28;
  OS_dispatch_queue *sync;
  objc_super v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)BUCoalescingCallBlock;
  v15 = -[BUCoalescingCallBlock init](&v31, sel_init);
  if (v15)
  {
    v16 = objc_msgSend_copy(v10, v13, v14);
    notifyBlock = v15->_notifyBlock;
    v15->_notifyBlock = (id)v16;

    v20 = objc_msgSend_copy(v12, v18, v19);
    notifyTimeoutBlock = v15->_notifyTimeoutBlock;
    v15->_notifyTimeoutBlock = (id)v20;

    v15->_notifyTimeoutDurationSeconds = a4;
    v24 = objc_msgSend_copy(v11, v22, v23);
    notifyBlockDescription = v15->_notifyBlockDescription;
    v15->_notifyBlockDescription = (NSString *)v24;

    v26 = dispatch_group_create();
    group = v15->_group;
    v15->_group = (OS_dispatch_group *)v26;

    v28 = dispatch_queue_create("BUCoalescingCallBlock.sync", 0);
    sync = v15->_sync;
    v15->_sync = (OS_dispatch_queue *)v28;

    v15->_nextCoalescingTime = -1;
    v15->_nextMaxTime = -1;
  }

  return v15;
}

- (BUCoalescingCallBlock)initWithNotifyBlock:(id)a3 blockDescription:(id)a4
{
  return (BUCoalescingCallBlock *)MEMORY[0x24BEDD108](self, sel_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_, a3);
}

- (void)setMaximumDelay:(double)a3
{
  self->_maximumDelay = a3;
}

- (void)setNextMaxTime:(unint64_t)a3
{
  self->_nextMaxTime = a3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notifyBlockDescription(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR(" nb=\");
  else
    v11 = &stru_24CEDBD58;
  objc_msgSend_notifyBlockDescription(self, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_notifyBlockDescription(self, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("\");
  if (!v16)
    v17 = &stru_24CEDBD58;
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@: %p%@%@%@>"), v5, self, v11, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_invokeIfNotInProgress
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;

  if (objc_msgSend_isInvoking(self, a2, v2))
  {
    objc_msgSend_setNextMaxTime_(self, v4, -1);
    objc_msgSend_setNextCoalescingTime_(self, v6, -1);
  }
  else
  {
    objc_msgSend__invoke(self, v4, v5);
  }
}

- (void)_invoke
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  objc_msgSend_callbacks(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_copy(v4, v5, v6);

  objc_msgSend_setCallbacks_(self, v8, 0);
  objc_msgSend_setNextMaxTime_(self, v9, -1);
  objc_msgSend_setNextCoalescingTime_(self, v10, -1);
  objc_msgSend_setPending_(self, v11, 0);
  objc_msgSend_setInvoking_(self, v12, 1);
  objc_msgSend_group(self, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_sync(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_212E564C0;
  v20[3] = &unk_24CED9CD0;
  v20[4] = self;
  v21 = v7;
  v19 = v7;
  dispatch_group_notify(v15, v18, v20);

}

- (void)_maxTimeExpired:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_nextMaxTime(self, a2, a3) == a3)
    objc_msgSend__invokeIfNotInProgress(self, v4, v5);
}

- (void)_coalescingTimeExpired:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t CoalescingTime;
  const char *v9;
  uint64_t v10;
  dispatch_time_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[6];

  if (objc_msgSend_nextCoalescingTime(self, a2, a3) == a3)
  {
    objc_msgSend__invokeIfNotInProgress(self, v4, v5);
  }
  else if (objc_msgSend_nextCoalescingTime(self, v4, v5) != -1)
  {
    CoalescingTime = objc_msgSend_nextCoalescingTime(self, v6, v7);
    v11 = objc_msgSend_nextCoalescingTime(self, v9, v10);
    objc_msgSend_sync(self, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_212E56C80;
    v15[3] = &unk_24CED9CF8;
    v15[4] = self;
    v15[5] = CoalescingTime;
    dispatch_after(v11, v14, v15);

  }
}

- (void)signal
{
  objc_msgSend_signalWithCompletion_(self, a2, 0);
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void)setNotifyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)notifyTimeoutBlock
{
  return self->_notifyTimeoutBlock;
}

- (void)setNotifyTimeoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)notifyTimeoutDurationSeconds
{
  return self->_notifyTimeoutDurationSeconds;
}

- (void)setNotifyTimeoutDurationSeconds:(unsigned __int16)a3
{
  self->_notifyTimeoutDurationSeconds = a3;
}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)isInvoking
{
  return self->_invoking;
}

- (void)setInvoking:(BOOL)a3
{
  self->_invoking = a3;
}

- (NSString)notifyBlockDescription
{
  return self->_notifyBlockDescription;
}

- (void)setNotifyBlockDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_notifyBlockDescription, 0);
  objc_storeStrong(&self->_notifyTimeoutBlock, 0);
  objc_storeStrong(&self->_notifyBlock, 0);
}

@end
