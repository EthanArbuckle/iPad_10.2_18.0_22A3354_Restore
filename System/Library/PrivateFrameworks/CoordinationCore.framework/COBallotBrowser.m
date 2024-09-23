@implementation COBallotBrowser

- (COBallotBrowser)initWithDiscoveryDelay:(double)a3
{
  COBallotBrowser *v4;
  COBallotBrowser *v5;
  dispatch_source_t v6;
  OS_dispatch_source *timer;
  COBrowserObserverSet *v8;
  COBrowserObserverSet *observerSet;
  uint64_t v10;
  NSDictionary *envelopes;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)COBallotBrowser;
  v4 = -[COBallotBrowser init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_discoveryDelay = fabs(a3);
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, 0);
    timer = v5->_timer;
    v5->_timer = (OS_dispatch_source *)v6;

    v8 = objc_alloc_init(COBrowserObserverSet);
    observerSet = v5->_observerSet;
    v5->_observerSet = v8;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    envelopes = v5->_envelopes;
    v5->_envelopes = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.coordination.ballotbrowser.%p"), v5);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v15;

    -[COBallotBrowser _configureTimer](v5, "_configureTimer");
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[COBallotBrowser timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  -[COBallotBrowser setTimerEnabled:](self, "setTimerEnabled:", 0);
  v4.receiver = self;
  v4.super_class = (Class)COBallotBrowser;
  -[COBallotBrowser dealloc](&v4, sel_dealloc);
}

- (void)clearRecords
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __31__COBallotBrowser_clearRecords__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COBallotBrowser _withLock:](self, "_withLock:", v2);
}

uint64_t __31__COBallotBrowser_clearRecords__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(14);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v3;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p clearing discovery records", (uint8_t *)&v7, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(v4, "setEnvelopes:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_disableTimer_unsafe");
}

- (id)addObserverUsingBlock:(id)a3
{
  id v4;
  COBrowserObserver *v5;
  void *v6;

  v4 = a3;
  v5 = -[COBrowserObserver initWithBlock:]([COBrowserObserver alloc], "initWithBlock:", v4);

  -[COBallotBrowser observerSet](self, "observerSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", v5);

  return v5;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COBallotBrowser observerSet](self, "observerSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (id)registeredObservers
{
  void *v2;
  void *v3;

  -[COBallotBrowser observerSet](self, "observerSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CORapportTransport)sourceTransport
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__COBallotBrowser_sourceTransport__block_invoke;
  v4[3] = &unk_24D4B0B18;
  v4[4] = self;
  v4[5] = &v5;
  -[COBallotBrowser _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CORapportTransport *)v2;
}

void __34__COBallotBrowser_sourceTransport__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));

  if (!WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "sourceTransport");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), v5);

    }
  }
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)startWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  COBallotBrowser *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = self;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Ballot browser started", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)stop
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __23__COBallotBrowser_stop__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COBallotBrowser _withLock:](self, "_withLock:", v2);
}

uint64_t __23__COBallotBrowser_stop__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  objc_msgSend(v2, "setEnvelopes:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_disableTimer_unsafe");
}

- (void)discoveryUsingBallot:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  COBallotBrowser *v16;

  objc_msgSend(a3, "discovery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COBallotBrowser sourceTransport](self, "sourceTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __40__COBallotBrowser_discoveryUsingBallot___block_invoke;
    v13[3] = &unk_24D4B08D0;
    v14 = v4;
    v15 = v5;
    v16 = self;
    -[COBallotBrowser _withLock:](self, "_withLock:", v13);

  }
  else
  {
    COCoreLogForCategory(14);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[COBallotBrowser discoveryUsingBallot:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

  }
}

void __40__COBallotBrowser_discoveryUsingBallot___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSourceTransport:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 48), "_addToQueuedRecords:", v7);
        objc_msgSend(*(id *)(a1 + 48), "_enableTimer_unsafe");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)discoveryUsingOnDemandNodeCreationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *log;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  COBallotBrowser *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COBallotBrowser sourceTransport](self, "sourceTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "request");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject conformsToProtocol:](v6, "conformsToProtocol:", &unk_254E1B9B0))
      v7 = -[NSObject listeningPort](v6, "listeningPort");
    else
      v7 = 0;
    -[NSObject _sendingConstituent](v6, "_sendingConstituent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject rapportOptions](v6, "rapportOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE7CCF8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE7CD00]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE7CCC8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && objc_msgSend(v16, "length") && objc_msgSend(v17, "length") && objc_msgSend(v18, "length"))
    {
      +[CODiscoveryRecord discoveryRecordWithConstituent:rapportIdentifier:IDSIdentifier:peerAddress:port:](CODiscoveryRecord, "discoveryRecordWithConstituent:rapportIdentifier:IDSIdentifier:peerAddress:port:", v14, v16, v17, v18, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSourceTransport:", v5);
      objc_msgSend(v19, "setUnhandledRequest:", v4);
      COCoreLogForCategory(14);
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = self;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_215E92000, log, OS_LOG_TYPE_DEFAULT, "%p created discovery record %@ using election request", buf, 0x16u);
      }

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __61__COBallotBrowser_discoveryUsingOnDemandNodeCreationRequest___block_invoke;
      v22[3] = &unk_24D4B0858;
      v22[4] = self;
      v23 = v19;
      v20 = v19;
      -[COBallotBrowser _withLock:](self, "_withLock:", v22);

    }
  }
  else
  {
    COCoreLogForCategory(14);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[COBallotBrowser discoveryUsingOnDemandNodeCreationRequest:].cold.1((uint64_t)self, v6, v8, v9, v10, v11, v12, v13);
  }

}

uint64_t __61__COBallotBrowser_discoveryUsingOnDemandNodeCreationRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_informObserversOfDiscoveredRecord:", *(_QWORD *)(a1 + 40));
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

  -[COBallotBrowser timer](self, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  -[COBallotBrowser setTimerEnabled:](self, "setTimerEnabled:", 0);
  objc_initWeak(&location, self);
  -[COBallotBrowser timer](self, "timer");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __34__COBallotBrowser__configureTimer__block_invoke;
  v9 = &unk_24D4B0CD8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[COBallotBrowser timer](self, "timer", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__COBallotBrowser__configureTimer__block_invoke(uint64_t a1)
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
  NSObject *v3;
  double discoveryDelay;
  double v5;
  int64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  int v9;
  COBallotBrowser *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!-[COBallotBrowser isTimerEnabled](self, "isTimerEnabled"))
  {
    -[COBallotBrowser setTimerEnabled:](self, "setTimerEnabled:", 1);
    COCoreLogForCategory(14);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      discoveryDelay = self->_discoveryDelay;
      v9 = 134218240;
      v10 = self;
      v11 = 2048;
      v12 = discoveryDelay;
      _os_log_impl(&dword_215E92000, v3, OS_LOG_TYPE_DEFAULT, "%p enabling timer with discovery delay %f", (uint8_t *)&v9, 0x16u);
    }

    -[COBallotBrowser discoveryDelay](self, "discoveryDelay");
    v6 = (uint64_t)(v5 * 1000000000.0);
    -[COBallotBrowser timer](self, "timer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, v6);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (void)_disableTimer_unsafe
{
  NSObject *v3;

  os_unfair_lock_assert_owner(&self->_lock);
  if (-[COBallotBrowser isTimerEnabled](self, "isTimerEnabled"))
  {
    -[COBallotBrowser setTimerEnabled:](self, "setTimerEnabled:", 0);
    -[COBallotBrowser timer](self, "timer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  }
}

- (void)_timerFired
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__COBallotBrowser__timerFired__block_invoke;
  v2[3] = &unk_24D4B0C80;
  v2[4] = self;
  -[COBallotBrowser _withLock:](self, "_withLock:", v2);
}

void __30__COBallotBrowser__timerFired__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isTimerEnabled"))
  {
    objc_msgSend(*v1, "setTimerEnabled:", 0);
    COCoreLogForCategory(14);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __30__COBallotBrowser__timerFired__block_invoke_cold_1(v1, v2);

    objc_msgSend(*v1, "discoveryDelay");
    v4 = v3;
    v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*v1, "envelopes", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = v5 - (unint64_t)(v4 * 1000000000.0);
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          objc_msgSend(*v1, "envelopes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "received") <= v10)
          {
            v16 = *v1;
            objc_msgSend(v15, "record");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_informObserversOfDiscoveredRecord:", v17);

          }
          else
          {
            objc_msgSend(v6, "setObject:forKey:", v15, v13);
          }

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "setEnvelopes:", v18);
    objc_msgSend(*v1, "envelopes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
      objc_msgSend(*v1, "_enableTimer_unsafe");

  }
}

- (void)_addToQueuedRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  +[CODiscoveryEnvelope envelopeWithRecord:](CODiscoveryEnvelope, "envelopeWithRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COBallotBrowser envelopes](self, "envelopes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[COBallotBrowser envelopes](self, "envelopes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v8)
  {
LABEL_7:
    objc_msgSend(v10, "setObject:forKey:", v5, v6);
    -[COBallotBrowser setEnvelopes:](self, "setEnvelopes:", v10);
    goto LABEL_8;
  }
  objc_msgSend(v8, "record");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constituent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "constituent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
  {
    COCoreLogForCategory(14);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[COBallotBrowser _addToQueuedRecords:].cold.1((uint64_t)self, (uint64_t)v4, v14);

    objc_msgSend(v10, "removeObjectForKey:", v6);
    goto LABEL_7;
  }

LABEL_8:
}

- (void)_informObserversOfDiscoveredRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  COBallotBrowser *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  COCoreLogForCategory(14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v28 = self;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_215E92000, v5, OS_LOG_TYPE_DEFAULT, "%p Ballot Browser informing observers about record %@", buf, 0x16u);
  }

  -[COBallotBrowser rapportBrowser](self, "rapportBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "companionLinkClientFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[COBallotBrowser rapportBrowser](self, "rapportBrowser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceTransport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "companionLinkDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IDSIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke;
  v22[3] = &unk_24D4B14D0;
  v23 = v7;
  v24 = v10;
  v25 = v11;
  v26 = v9;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  v16 = v7;
  objc_msgSend(v4, "setCompanionLinkProvider:", v22);
  -[COBallotBrowser observerSet](self, "observerSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "observers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke_2;
  v20[3] = &unk_24D4B14F8;
  v21 = v4;
  v19 = v4;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v20);

}

id __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "companionLinkClientForDevice:withIDSIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dispatchQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDispatchQueue:", v4);

  return v2;
}

void __54__COBallotBrowser__informObserversOfDiscoveredRecord___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);

  objc_msgSend(a2, "block");
  v3 = (void (**)(id, uint64_t, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, 1, *(_QWORD *)(a1 + 32));

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

- (COBrowserObserverSet)observerSet
{
  return self->_observerSet;
}

- (double)discoveryDelay
{
  return self->_discoveryDelay;
}

- (unint64_t)count
{
  return self->_count;
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

- (NSDictionary)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
  objc_storeStrong((id *)&self->_envelopes, a3);
}

- (void)setSourceTransport:(id)a3
{
  objc_storeWeak((id *)&self->_sourceTransport, a3);
}

- (CORapportBrowser)rapportBrowser
{
  return (CORapportBrowser *)objc_loadWeakRetained((id *)&self->_rapportBrowser);
}

- (void)setRapportBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_rapportBrowser, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_rapportBrowser);
  objc_destroyWeak((id *)&self->_sourceTransport);
  objc_storeStrong((id *)&self->_envelopes, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_observerSet, 0);
}

- (void)discoveryUsingBallot:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a2, a3, "%p no source transport. Ignoring discovery using ballot", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)discoveryUsingOnDemandNodeCreationRequest:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215E92000, a2, a3, "%p no source transport. Ignoring discovery using election request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __30__COBallotBrowser__timerFired__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  objc_msgSend(*a1, "envelopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218240;
  v7 = v3;
  v8 = 2048;
  v9 = objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_9(&dword_215E92000, a2, v5, "%p timer fired. Envelope count = %lu", (uint8_t *)&v6);

}

- (void)_addToQueuedRecords:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_9(&dword_215E92000, a3, (uint64_t)a3, "%p updating discovery record to queue %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

@end
