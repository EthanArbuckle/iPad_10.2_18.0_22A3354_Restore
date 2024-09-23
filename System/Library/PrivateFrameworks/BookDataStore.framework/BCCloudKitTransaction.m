@implementation BCCloudKitTransaction

- (BCCloudKitTransaction)initWithEntityName:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BCCloudKitTransaction *v12;
  uint64_t v13;
  NSString *entityName;
  BDSOSTransaction *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BDSOSTransaction *osTransaction;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  NSObject *v44;
  dispatch_queue_t v45;
  OS_dispatch_queue *lifecycleAccessQueue;
  id v47;
  void *v48;
  objc_class *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  BUCoalescingCallBlock *coalescedNotification;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v67[4];
  id v68;
  id location;
  objc_super v70;

  v6 = a3;
  v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)BCCloudKitTransaction;
  v12 = -[BCCloudKitTransaction init](&v70, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v6, v8, v9, v10, v11);
    entityName = v12->_entityName;
    v12->_entityName = (NSString *)v13;

    objc_storeWeak((id *)&v12->_delegate, v7);
    v15 = [BDSOSTransaction alloc];
    objc_msgSend_transactionName(v12, v16, v17, v18, v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend_cStringUsingEncoding_(v20, v21, 4, v22, v23);
    v28 = objc_msgSend_initWithTransactionName_(v15, v25, v24, v26, v27);
    osTransaction = v12->_osTransaction;
    v12->_osTransaction = (BDSOSTransaction *)v28;

    objc_msgSend_transactionName(v12, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingString_(CFSTR("com.apple.iBooks.CloudKitTransaction."), v35, (uint64_t)v34, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_retainAutorelease(v38);
    v43 = (const char *)objc_msgSend_cStringUsingEncoding_(v39, v40, 4, v41, v42);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = dispatch_queue_create(v43, v44);
    lifecycleAccessQueue = v12->_lifecycleAccessQueue;
    v12->_lifecycleAccessQueue = (OS_dispatch_queue *)v45;

    objc_initWeak(&location, v12);
    v47 = objc_alloc(MEMORY[0x24BE0FC00]);
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = sub_227D9C35C;
    v67[3] = &unk_24F08A6A0;
    objc_copyWeak(&v68, &location);
    v48 = (void *)MEMORY[0x24BDD17C8];
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v48, v51, (uint64_t)CFSTR("_coalescedNotification in %@"), v52, v53, v50);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v47, v55, (uint64_t)v67, 10, (uint64_t)v54, &unk_24F08A6E0);
    coalescedNotification = v12->_coalescedNotification;
    v12->_coalescedNotification = (BUCoalescingCallBlock *)v56;

    objc_msgSend_coalescingDelay(v12, v58, v59, v60, v61);
    objc_msgSend_setCoalescingDelay_(v12->_coalescedNotification, v62, v63, v64, v65);
    objc_destroyWeak(&v68);
    objc_destroyWeak(&location);

  }
  return v12;
}

+ (id)transactionNameForEntityName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringByAppendingString_(CFSTR("BCCloudKitTransaction-"), a2, (uint64_t)a3, v3, v4);
}

- (id)transactionName
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_class();
  objc_msgSend_entityName(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transactionNameForEntityName_(v3, v9, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)performWorkWithCompletion:(id)a3
{
  void (**v3)(void);
  void (**v4)(void);

  v3 = (void (**)(void))_Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (double)coalescingDelay
{
  return 1.0;
}

- (double)transactionLifetimeTimout
{
  return 5.0;
}

- (void)clientConnected
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_lifecycleAccessQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D9C584;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)signal
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_shared(MEMORY[0x24BE0FC08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_verboseLoggingEnabled(v6, v7, v8, v9, v10);

  if (v11)
  {
    BDSCloudKitDevelopmentLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_transactionName(self, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v17;
      _os_log_impl(&dword_227D4F000, v12, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction signaling for %@\\\"\", buf, 0xCu);

    }
  }
  objc_initWeak((id *)buf, self);
  objc_msgSend_coalescedNotification(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_227D9C78C;
  v26[3] = &unk_24F08A708;
  v26[4] = self;
  objc_copyWeak(&v27, (id *)buf);
  objc_msgSend_signalWithCompletion_(v22, v23, (uint64_t)v26, v24, v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)laq_scheduleTransactionLifetime
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  dispatch_time_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  _QWORD v39[5];
  _QWORD handler[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_transactionLifetime(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_verboseLoggingEnabled(v11, v12, v13, v14, v15);

    if (v16)
    {
      BDSCloudKitDevelopmentLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_transactionName(self, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v26;
        _os_log_impl(&dword_227D4F000, v21, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction scheduletransactionLifetime for %@\\\"\", buf, 0xCu);

      }
    }
    objc_msgSend_lifecycleAccessQueue(self, v17, v18, v19, v20);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v27);

    v29 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v28, v29, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    v30 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_227D9CBB0;
    handler[3] = &unk_24F08A3E0;
    handler[4] = self;
    dispatch_source_set_event_handler(v28, handler);
    v39[0] = v30;
    v39[1] = 3221225472;
    v39[2] = sub_227D9CCC4;
    v39[3] = &unk_24F08A3E0;
    v39[4] = self;
    dispatch_source_set_cancel_handler(v28, v39);
    objc_msgSend_setTransactionLifetime_(self, v31, (uint64_t)v28, v32, v33);
    objc_msgSend_transactionLifetime(self, v34, v35, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v38);

  }
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BUCoalescingCallBlock)coalescedNotification
{
  return self->_coalescedNotification;
}

- (void)setCoalescedNotification:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedNotification, a3);
}

- (BDSOSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_osTransaction, a3);
}

- (OS_dispatch_queue)lifecycleAccessQueue
{
  return self->_lifecycleAccessQueue;
}

- (void)setLifecycleAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleAccessQueue, a3);
}

- (OS_dispatch_source)transactionLifetime
{
  return self->_transactionLifetime;
}

- (void)setTransactionLifetime:(id)a3
{
  objc_storeStrong((id *)&self->_transactionLifetime, a3);
}

- (BCCloudKitTransactionDelegate)delegate
{
  return (BCCloudKitTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionLifetime, 0);
  objc_storeStrong((id *)&self->_lifecycleAccessQueue, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_coalescedNotification, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

@end
