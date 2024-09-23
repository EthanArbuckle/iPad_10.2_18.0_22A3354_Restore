@implementation CMContinuityCaptureMagicStateMonitor

- (CMContinuityCaptureMagicStateMonitor)initWithDevice:(id)a3
{
  id v4;
  CMContinuityCaptureMagicStateMonitor *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableSet *v9;
  NSMutableSet *activeMagicStateAssertions;
  NSMutableSet *v11;
  NSMutableSet *activeNonMagicStateAssertions;
  CMContinuityCaptureMagicStateMonitor *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureMagicStateMonitor;
  v5 = -[CMContinuityCaptureMagicStateMonitor init](&v15, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.continuitycapture.magicstatemonitor", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_device, v4);
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeMagicStateAssertions = v5->_activeMagicStateAssertions;
    v5->_activeMagicStateAssertions = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeNonMagicStateAssertions = v5->_activeNonMagicStateAssertions;
    v5->_activeNonMagicStateAssertions = v11;

    v5->_skipNearByCheck = 0;
    v13 = v5;
  }

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)updateState
{
  id WeakRetained;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 skipNearByCheck;
  _BOOL4 magic;
  CMContinuityCaptureMagicStateMonitor *v11;
  int v12;
  CMContinuityCaptureMagicStateMonitor *v13;
  int v14;
  CMContinuityCaptureMagicStateMonitor *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  if (WeakRetained)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (objc_msgSend(WeakRetained, "usable")
      && ((objc_msgSend(WeakRetained, "nearby") & 1) != 0
       || self->_skipNearByCheck
       || objc_msgSend(WeakRetained, "wired")))
    {
      if ((objc_msgSend(WeakRetained, "wired") & 1) != 0)
        v4 = 1;
      else
        v4 = objc_msgSend(WeakRetained, "wifiP2pActive");
    }
    else
    {
      v4 = 0;
    }
    CMContinuityCaptureLog(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(WeakRetained, "usable");
      v7 = objc_msgSend(WeakRetained, "nearby");
      v8 = objc_msgSend(WeakRetained, "wired");
      skipNearByCheck = self->_skipNearByCheck;
      magic = self->_magic;
      v14 = 138544898;
      v15 = self;
      v16 = 1024;
      v17 = v4;
      v18 = 1024;
      v19 = v6;
      v20 = 1024;
      v21 = v7;
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = skipNearByCheck;
      v26 = 1024;
      v27 = magic;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ magic:%d (usable:%d nearby:%d wired:%d skipNearByCheck:%d) reported magic:%d", (uint8_t *)&v14, 0x30u);
    }

    if ((v4 & 1) != 0)
    {
      if (-[NSMutableSet count](self->_activeNonMagicStateAssertions, "count") || self->_magicTransitionCoolDownBlock)
        goto LABEL_20;
    }
    else if (-[NSMutableSet count](self->_activeMagicStateAssertions, "count")
           || self->_nonMagicTransitionCoolDownBlock)
    {
      goto LABEL_20;
    }
    v11 = self;
    objc_sync_enter(v11);
    v12 = v11->_magic;
    objc_sync_exit(v11);

    if (v12 != v4)
    {
      -[CMContinuityCaptureMagicStateMonitor willChangeValueForKey:](v11, "willChangeValueForKey:", CFSTR("magic"));
      v13 = v11;
      objc_sync_enter(v13);
      v11->_magic = v4;
      objc_sync_exit(v13);

      -[CMContinuityCaptureMagicStateMonitor didChangeValueForKey:](v13, "didChangeValueForKey:", CFSTR("magic"));
    }
  }
LABEL_20:

}

- (BOOL)magic
{
  CMContinuityCaptureMagicStateMonitor *v2;
  BOOL magic;

  v2 = self;
  objc_sync_enter(v2);
  magic = v2->_magic;
  objc_sync_exit(v2);

  return magic;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  _QWORD v13[4];
  id v14;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("wired")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("nearby")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("usable")))
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __87__CMContinuityCaptureMagicStateMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13[3] = &unk_24F06AE60;
    objc_copyWeak(&v14, &location);
    dispatch_async(queue, v13);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

void __87__CMContinuityCaptureMagicStateMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateState");
    WeakRetained = v2;
  }

}

+ (BOOL)shouldForceMagicForAssertionType:(int64_t)a3
{
  return a3 == 2;
}

+ (BOOL)shouldForceNonMagicForAssertionType:(int64_t)a3
{
  return a3 == 1;
}

- (void)holdMagicStateAssertion:(int64_t)a3
{
  NSObject *queue;
  _QWORD v6[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__CMContinuityCaptureMagicStateMonitor_holdMagicStateAssertion___block_invoke;
  v6[3] = &unk_24F06B7C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(queue, v6);
}

uint64_t __64__CMContinuityCaptureMagicStateMonitor_holdMagicStateAssertion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v3;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Hold magic assertion of type:%d", (uint8_t *)&v12, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v7)
  {
    dispatch_block_cancel(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  result = +[CMContinuityCaptureMagicStateMonitor shouldForceMagicForAssertionType:](CMContinuityCaptureMagicStateMonitor, "shouldForceMagicForAssertionType:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("magic"));
    v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    objc_sync_exit(v11);

    return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("magic"));
  }
  return result;
}

- (void)holdNonMagicStateAssertion:(int64_t)a3
{
  NSObject *queue;
  _QWORD v6[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CMContinuityCaptureMagicStateMonitor_holdNonMagicStateAssertion___block_invoke;
  v6[3] = &unk_24F06B7C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(queue, v6);
}

uint64_t __67__CMContinuityCaptureMagicStateMonitor_holdNonMagicStateAssertion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v3;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Hold non-magic assertion of type:%d", (uint8_t *)&v12, 0x12u);
  }

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v7)
  {
    dispatch_block_cancel(v7);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
  result = +[CMContinuityCaptureMagicStateMonitor shouldForceNonMagicForAssertionType:](CMContinuityCaptureMagicStateMonitor, "shouldForceNonMagicForAssertionType:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("magic"));
    v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_sync_exit(v11);

    return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("magic"));
  }
  return result;
}

- (void)releaseMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4
{
  NSObject *queue;
  _QWORD block[5];
  id v9[2];
  unsigned int v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke;
  block[3] = &unk_24F06B7E8;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  block[4] = self;
  v10 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_block_t v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[2];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      CMContinuityCaptureLog(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v19 = v8;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Release magic assertion of type:%d", buf, 0x12u);
      }

      v10 = (void *)*((_QWORD *)v4 + 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v11);

      if (!objc_msgSend(*((id *)v4 + 2), "count"))
      {
        v12 = (void *)*((_QWORD *)v4 + 5);
        if (v12)
          dispatch_block_cancel(v12);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_5;
        block[3] = &unk_24F06AE60;
        objc_copyWeak(&v17, v2);
        v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
        v14 = (void *)*((_QWORD *)v4 + 5);
        *((_QWORD *)v4 + 5) = v13;

        v15 = dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 56));
        dispatch_after(v15, *((dispatch_queue_t *)v4 + 6), *((dispatch_block_t *)v4 + 5));
        objc_destroyWeak(&v17);
      }
    }
  }

}

void __95__CMContinuityCaptureMagicStateMonitor_releaseMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_5(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "updateState");
    WeakRetained = v3;
  }

}

- (void)releaseNonMagicStateAssertion:(int64_t)a3 stateTransitionCoolDownTime:(unsigned int)a4
{
  NSObject *queue;
  _QWORD block[5];
  id v9[2];
  unsigned int v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke;
  block[3] = &unk_24F06B7E8;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  block[4] = self;
  v10 = a4;
  dispatch_async(queue, block);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_block_t v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      CMContinuityCaptureLog(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v19 = v8;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Release non-magic assertion of type:%d", buf, 0x12u);
      }

      v10 = (void *)*((_QWORD *)v4 + 3);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v11);

      if (!objc_msgSend(*((id *)v4 + 3), "count"))
      {
        v12 = (void *)*((_QWORD *)v4 + 4);
        if (v12)
          dispatch_block_cancel(v12);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_6;
        block[3] = &unk_24F06AE60;
        objc_copyWeak(&v17, v2);
        v13 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
        v14 = (void *)*((_QWORD *)v4 + 4);
        *((_QWORD *)v4 + 4) = v13;

        v15 = dispatch_time(0, 1000000000 * *(unsigned int *)(a1 + 56));
        dispatch_after(v15, *((dispatch_queue_t *)v4 + 6), *((dispatch_block_t *)v4 + 4));
        objc_destroyWeak(&v17);
      }
    }
  }

}

void __98__CMContinuityCaptureMagicStateMonitor_releaseNonMagicStateAssertion_stateTransitionCoolDownTime___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v3 = WeakRetained;

    objc_msgSend(v3, "updateState");
    WeakRetained = v3;
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, WeakRetained, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_nonMagicTransitionCoolDownBlock, 0);
  objc_storeStrong(&self->_magicTransitionCoolDownBlock, 0);
  objc_storeStrong((id *)&self->_activeNonMagicStateAssertions, 0);
  objc_storeStrong((id *)&self->_activeMagicStateAssertions, 0);
}

@end
