@implementation _SYMessageTimerTable

- (_SYMessageTimerTable)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Do not call -[%@ %@]"), v7, v8);

  return 0;
}

- (_SYMessageTimerTable)initWithQueue:(id)a3 timerCallback:(id)a4
{
  id v7;
  id v8;
  _SYMessageTimerTable *v9;
  _SYMessageTimerTable *v10;
  uint64_t v11;
  id callback;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *rwlock;
  uint64_t v16;
  NSMutableDictionary *bySeqno;
  uint64_t v18;
  NSMutableDictionary *byIdent;
  _SYMessageTimerTable *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_SYMessageTimerTable;
  v9 = -[_SYMessageTimerTable init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    callback = v10->_callback;
    v10->_callback = (id)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("_SYTimerMessageTable", v13);
    rwlock = v10->_rwlock;
    v10->_rwlock = (OS_dispatch_queue *)v14;

    v16 = objc_opt_new();
    bySeqno = v10->_bySeqno;
    v10->_bySeqno = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    byIdent = v10->_byIdent;
    v10->_byIdent = (NSMutableDictionary *)v18;

    v20 = v10;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *rwlock;
  objc_super v4;
  _QWORD block[5];

  rwlock = self->_rwlock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31___SYMessageTimerTable_dealloc__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_barrier_sync(rwlock, block);
  v4.receiver = self;
  v4.super_class = (Class)_SYMessageTimerTable;
  -[_SYMessageTimerTable dealloc](&v4, sel_dealloc);
}

- (void)addTimerWithFireDate:(id)a3 forSequenceNumber:(unint64_t)a4
{
  double v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *rwlock;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16[2];
  _QWORD handler[4];
  id v18[2];
  id location;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v7 = dispatch_walltime(0, (uint64_t)(v6 * 1000000000.0));
  v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke;
  handler[3] = &unk_24CC67010;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a4;
  dispatch_source_set_event_handler(v8, handler);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_2;
  v15[3] = &unk_24CC67010;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  dispatch_source_set_cancel_handler(v8, v15);
  dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  rwlock = self->_rwlock;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_3;
  v12[3] = &unk_24CC67038;
  v13 = v8;
  v14 = a4;
  v12[4] = self;
  v11 = v8;
  dispatch_barrier_sync(rwlock, v12);
  dispatch_resume(v11);

  objc_destroyWeak(v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

- (void)_fireCallbackForSeqno:(unint64_t)a3
{
  NSObject *rwlock;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**callback)(id, unint64_t, void *);
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  v21 = __Block_byref_object_dispose__14;
  v22 = 0;
  rwlock = self->_rwlock;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke;
  block[3] = &unk_24CC67060;
  block[4] = self;
  block[5] = &v17;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  v7 = (void *)v18[5];
  if (v7 && !dispatch_source_testcancel((dispatch_source_t)v18[5]))
  {
    objc_getAssociatedObject(v7, (const void *)kTimerContextKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    callback = (void (**)(id, unint64_t, void *))self->_callback;
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    callback[2](callback, a3, v10);

    v11 = self->_rwlock;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke_2;
    v13[3] = &unk_24CC67038;
    v14 = v8;
    v15 = a3;
    v13[4] = self;
    v12 = v8;
    dispatch_barrier_sync(v11, v13);

  }
  _Block_object_dispose(&v17, 8);

}

- (void)_cleanupTimerForSeqno:(unint64_t)a3
{
  NSObject *rwlock;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[7];
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  rwlock = self->_rwlock;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke;
  block[3] = &unk_24CC67060;
  block[4] = self;
  block[5] = &v11;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  v7 = v12[5];
  if (v7)
  {
    dispatch_source_cancel(v7);
    v8 = self->_rwlock;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke_2;
    v9[3] = &unk_24CC67088;
    v9[5] = &v11;
    v9[6] = a3;
    v9[4] = self;
    dispatch_barrier_sync(v8, v9);
  }
  _Block_object_dispose(&v11, 8);

}

- (void)setIdentifier:(id)a3 forSequenceNumber:(unint64_t)a4
{
  id v6;
  NSObject *rwlock;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD *);
  void *v16;
  _SYMessageTimerTable *v17;
  id v18;
  uint64_t *v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__14;
  v25 = __Block_byref_object_dispose__14;
  v26 = 0;
  rwlock = self->_rwlock;
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke;
  block[3] = &unk_24CC67060;
  block[4] = self;
  block[5] = &v21;
  block[6] = a4;
  dispatch_sync(rwlock, block);
  if (v22[5])
  {
    v9 = self->_rwlock;
    v13 = v8;
    v14 = 3221225472;
    v15 = __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke_2;
    v16 = &unk_24CC66728;
    v17 = self;
    v10 = v6;
    v18 = v10;
    v19 = &v21;
    dispatch_barrier_sync(v9, &v13);
    objc_getAssociatedObject((id)v22[5], (const void *)kTimerContextKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setIdentifier:", v10, v13, v14, v15, v16, v17);
    }
    else
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setSeqno:", a4, v13, v14, v15, v16, v17);
      objc_msgSend(v12, "setIdentifier:", v10);
      objc_setAssociatedObject((id)v22[5], (const void *)kTimerContextKey, v12, (void *)1);
    }

  }
  _Block_object_dispose(&v21, 8);

}

- (void)cancelTimerForSequenceNumber:(unint64_t)a3
{
  NSObject *rwlock;
  NSObject *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___SYMessageTimerTable_cancelTimerForSequenceNumber___block_invoke;
  block[3] = &unk_24CC67060;
  block[4] = self;
  block[5] = &v6;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  v4 = v7[5];
  if (v4)
    dispatch_source_cancel(v4);
  _Block_object_dispose(&v6, 8);

}

- (void)cancelTimerForIdentifier:(id)a3
{
  id v4;
  NSObject *rwlock;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  v16 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___SYMessageTimerTable_cancelTimerForIdentifier___block_invoke;
  block[3] = &unk_24CC670B0;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  v9 = v6;
  dispatch_sync(rwlock, block);
  v7 = v12[5];
  if (v7)
    dispatch_source_cancel(v7);

  _Block_object_dispose(&v11, 8);
}

- (void)cancelAllTimers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_bySeqno, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (unint64_t)timerCount
{
  NSObject *rwlock;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rwlock = self->_rwlock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34___SYMessageTimerTable_timerCount__block_invoke;
  v5[3] = &unk_24CC65440;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rwlock, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byIdent, 0);
  objc_storeStrong((id *)&self->_bySeqno, 0);
  objc_storeStrong((id *)&self->_rwlock, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
