@implementation COIDSServerBag

- (COIDSServerBag)init
{
  COIDSServerBag *v2;
  COIDSServerBag *v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  dispatch_source_t v8;
  OS_dispatch_source *refreshTimer;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)COIDSServerBag;
  v2 = -[COIDSServerBag init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_idsServerBag, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("COIDSServerBag", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v3->_dispatchQueue);
    refreshTimer = v3->_refreshTimer;
    v3->_refreshTimer = (OS_dispatch_source *)v8;

    v3->_currentTimerDelay = 30;
    if (IsAppleInternalBuild())
      v10 = CFSTR("-internal");
    else
      v10 = &stru_24D4B4AF8;
    v11 = v10;
    objc_storeStrong((id *)&v3->_keySuffix, v10);
    COCoreLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2048;
      v18 = 0x403E000000000000;
      _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "Initializing using key suffix %@ with initial timer interval of %fs", buf, 0x16u);
    }

  }
  return v3;
}

- (void)configure
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__COIDSServerBag_configure__block_invoke;
  block[3] = &unk_24D4B0C80;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__COIDSServerBag_configure__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_configureTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateCachedValuesWithServerValues");
}

- (void)_onqueue_updateCachedValuesWithServerValues
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  COIDSServerBag *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[COIDSServerBag dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[COIDSServerBag _onqueue_serverBagNumberValueForKey:](self, "_onqueue_serverBagNumberValueForKey:", CFSTR("co-fastFold-enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSServerBag isFastFoldEnabled](self, "isFastFoldEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    COCoreLogForCategory(21);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%p Updating fast fold enabled from %@ to %@", (uint8_t *)&v13, 0x20u);
    }

    -[COIDSServerBag setFastFoldEnabled:](self, "setFastFoldEnabled:", v4);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  -[COIDSServerBag _onqueue_serverBagNumberValueForKey:](self, "_onqueue_serverBagNumberValueForKey:", CFSTR("co-ipDiffing-enabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COIDSServerBag isIPDiffingEnabled](self, "isIPDiffingEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    COCoreLogForCategory(21);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = self;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p Updating ip diffing enabled from %@ to %@", (uint8_t *)&v13, 0x20u);
    }

    -[COIDSServerBag setIpDiffing:](self, "setIpDiffing:", v8);
  }
  else if (!v6)
  {
    goto LABEL_19;
  }
  COCoreLogForCategory(21);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = self;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p Notifying delegate of server bag update", (uint8_t *)&v13, 0xCu);
  }

  -[COIDSServerBag delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "idsServerBagDidUpdate:", self);

LABEL_19:
}

- (id)_onqueue_serverBagNumberValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[COIDSServerBag dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COIDSServerBag _onqueue_serverBagValueForKey:](self, "_onqueue_serverBagValueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)_onqueue_serverBagValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  COIDSServerBag *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COIDSServerBag dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COIDSServerBag keySuffix](self, "keySuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "length");

  if (v7)
  {
    -[COIDSServerBag keySuffix](self, "keySuffix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[COIDSServerBag idsServerBag](self, "idsServerBag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  COCoreLogForCategory(21);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218498;
    v14 = self;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p serverBagValueForKey %@ returned %@", (uint8_t *)&v13, 0x20u);
  }

  return v7;
}

- (void)_onqueue_configureTimer
{
  NSObject *v3;
  int64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  -[COIDSServerBag dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = 1000000000 * -[COIDSServerBag currentTimerDelay](self, "currentTimerDelay");
  -[COIDSServerBag refreshTimer](self, "refreshTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, v4);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  objc_initWeak(&location, self);
  -[COIDSServerBag refreshTimer](self, "refreshTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __41__COIDSServerBag__onqueue_configureTimer__block_invoke;
  v12 = &unk_24D4B0CD8;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v7, &v9);

  -[COIDSServerBag refreshTimer](self, "refreshTimer", v9, v10, v11, v12);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __41__COIDSServerBag__onqueue_configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onqueue_timerFired");
    WeakRetained = v2;
  }

}

- (void)_onqueue_timerFired
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  int v10;
  COIDSServerBag *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[COIDSServerBag dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  COCoreLogForCategory(21);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = self;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p Server bag refresh timer fired", (uint8_t *)&v10, 0xCu);
  }

  -[COIDSServerBag _onqueue_updateCachedValuesWithServerValues](self, "_onqueue_updateCachedValuesWithServerValues");
  v5 = -[COIDSServerBag currentTimerDelay](self, "currentTimerDelay");
  if (v5 >= 3600)
    v6 = 7200;
  else
    v6 = 2 * v5;
  -[COIDSServerBag setCurrentTimerDelay:](self, "setCurrentTimerDelay:", v6);
  v7 = 1000000000 * -[COIDSServerBag currentTimerDelay](self, "currentTimerDelay");
  -[COIDSServerBag refreshTimer](self, "refreshTimer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)setFastFoldEnabled:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__COIDSServerBag_setFastFoldEnabled___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COIDSServerBag _withLock:](self, "_withLock:", v6);

}

void __37__COIDSServerBag_setFastFoldEnabled___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setIpDiffing:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__COIDSServerBag_setIpDiffing___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[COIDSServerBag _withLock:](self, "_withLock:", v6);

}

void __31__COIDSServerBag_setIpDiffing___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (NSNumber)isFastFoldEnabled
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__COIDSServerBag_isFastFoldEnabled__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COIDSServerBag _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __35__COIDSServerBag_isFastFoldEnabled__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (NSNumber)isIPDiffingEnabled
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__COIDSServerBag_isIPDiffingEnabled__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[COIDSServerBag _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __36__COIDSServerBag_isIPDiffingEnabled__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)setIpDiffingEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_ipDiffingEnabled, a3);
}

- (COIDSServerBagDelegate)delegate
{
  return (COIDSServerBagDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IDSServerBag)idsServerBag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_source)refreshTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)currentTimerDelay
{
  return self->_currentTimerDelay;
}

- (void)setCurrentTimerDelay:(int64_t)a3
{
  self->_currentTimerDelay = a3;
}

- (NSString)keySuffix
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySuffix, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ipDiffingEnabled, 0);
  objc_storeStrong((id *)&self->_fastFoldEnabled, 0);
}

@end
