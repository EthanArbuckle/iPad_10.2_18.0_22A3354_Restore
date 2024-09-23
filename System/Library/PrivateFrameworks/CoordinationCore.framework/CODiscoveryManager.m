@implementation CODiscoveryManager

- (id)_initWithDiscoveryDelay:(double)a3 delegate:(id)a4
{
  id v6;
  CODiscoveryManager *v7;
  CODiscoveryManager *v8;
  NSDictionary *v9;
  NSDictionary *envelopes;
  dispatch_source_t v11;
  OS_dispatch_source *timer;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CODiscoveryManager;
  v7 = -[CODiscoveryManager init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_discoveryDelay = fabs(a3);
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    envelopes = v8->_envelopes;
    v8->_envelopes = v9;

    v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
    timer = v8->_timer;
    v8->_timer = (OS_dispatch_source *)v11;

    -[CODiscoveryManager _configureTimer](v8, "_configureTimer");
  }

  return v8;
}

+ (id)managerWithDiscoveryDelay:(double)a3 delegate:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDiscoveryDelay:delegate:", v6, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[CODiscoveryManager timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  -[CODiscoveryManager setTimerEnabled:](self, "setTimerEnabled:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CODiscoveryManager;
  -[CODiscoveryManager dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__CODiscoveryManager_count__block_invoke;
  v4[3] = &unk_24D4B07E0;
  v4[4] = self;
  v4[5] = &v5;
  -[CODiscoveryManager _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __27__CODiscoveryManager_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "envelopes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (BOOL)addDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CODiscoveryManager *v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  objc_msgSend(v4, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CODiscoveryEnvelope envelopeWithRecord:](CODiscoveryEnvelope, "envelopeWithRecord:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__CODiscoveryManager_addDiscoveryRecord___block_invoke;
  v11[3] = &unk_24D4B0D80;
  v7 = v4;
  v12 = v7;
  v13 = self;
  v8 = v5;
  v14 = v8;
  v9 = v6;
  v15 = v9;
  v16 = &v17;
  -[CODiscoveryManager _withLock:](self, "_withLock:", v11);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __41__CODiscoveryManager_addDiscoveryRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "envelopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v5);

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "envelopes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v8, "setObject:forKey:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setEnvelopes:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_enableTimer_unsafe");

  }
}

- (void)clearRecords
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __34__CODiscoveryManager_clearRecords__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[CODiscoveryManager _withLock:](self, "_withLock:", v2);
}

uint64_t __34__CODiscoveryManager_clearRecords__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(v2, "setEnvelopes:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_disableTimer_unsafe");
}

- (void)_timerFired
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__CODiscoveryManager__timerFired__block_invoke;
  v3[3] = &unk_24D4B0B18;
  v3[4] = self;
  v3[5] = &v4;
  -[CODiscoveryManager _withLock:](self, "_withLock:", v3);
  if (objc_msgSend((id)v5[5], "count"))
    -[CODiscoveryManager _invokeDelegate:](self, "_invokeDelegate:", v5[5]);
  _Block_object_dispose(&v4, 8);

}

void __33__CODiscoveryManager__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isTimerEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTimerEnabled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_triggerDiscovery_unsafe");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 32), "envelopes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "_enableTimer_unsafe");
  }
}

- (id)_triggerDiscovery_unsafe
{
  double v3;
  double v4;
  __uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  -[CODiscoveryManager discoveryDelay](self, "discoveryDelay");
  v4 = v3;
  v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CODiscoveryManager envelopes](self, "envelopes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = v5 - (unint64_t)(v4 * 1000000000.0);
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[CODiscoveryManager envelopes](self, "envelopes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "received") <= v10)
        {
          objc_msgSend(v15, "record");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v16);

        }
        else
        {
          objc_msgSend(v6, "setObject:forKey:", v15, v13);
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CODiscoveryManager setEnvelopes:](self, "setEnvelopes:", v17);

  return v19;
}

- (void)_configureTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[CODiscoveryManager timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[CODiscoveryManager setTimerEnabled:](self, "setTimerEnabled:", 0);
  objc_initWeak(&location, self);
  -[CODiscoveryManager timer](self, "timer");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __37__CODiscoveryManager__configureTimer__block_invoke;
  v9 = &unk_24D4B0CD8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[CODiscoveryManager timer](self, "timer", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __37__CODiscoveryManager__configureTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_timerFired");
    WeakRetained = v2;
  }

}

- (void)_enableTimer_unsafe
{
  double v3;
  int64_t v4;
  dispatch_time_t v5;
  NSObject *source;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!-[CODiscoveryManager isTimerEnabled](self, "isTimerEnabled"))
  {
    -[CODiscoveryManager setTimerEnabled:](self, "setTimerEnabled:", 1);
    -[CODiscoveryManager discoveryDelay](self, "discoveryDelay");
    v4 = (uint64_t)(v3 * 1000000000.0);
    -[CODiscoveryManager timer](self, "timer");
    source = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_time(0, v4);
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (void)_disableTimer_unsafe
{
  NSObject *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CODiscoveryManager isTimerEnabled](self, "isTimerEnabled"))
  {
    -[CODiscoveryManager setTimerEnabled:](self, "setTimerEnabled:", 0);
    -[CODiscoveryManager timer](self, "timer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (void)_invokeDelegate:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "discoveryManager:didDiscoverRecords:", self, v5);

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

- (CODiscoveryManagerDelegate)delegate
{
  return (CODiscoveryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)discoveryDelay
{
  return self->_discoveryDelay;
}

- (NSDictionary)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
  objc_storeStrong((id *)&self->_envelopes, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (BOOL)isTimerEnabled
{
  return self->_timerEnabled;
}

- (void)setTimerEnabled:(BOOL)a3
{
  self->_timerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_envelopes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
