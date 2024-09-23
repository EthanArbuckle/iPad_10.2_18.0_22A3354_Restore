@implementation BBObserverGatewayHolder

- (BBObserverGatewayHolder)initWithQueue:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  BBObserverGatewayHolder *v9;
  NSMutableArray *v10;
  NSMutableArray *timeouts;
  uint64_t v12;
  NSString *name;
  BBMaskedSet *v14;
  BBMaskedSet *observerFeedSet;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BBObserverGatewayHolder;
  v9 = -[BBObserverGatewayHolder init](&v17, sel_init);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    timeouts = v9->_timeouts;
    v9->_timeouts = v10;

    v12 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v12;

    objc_storeStrong((id *)&v9->_queue, a3);
    v14 = -[BBMaskedSet initWithMaskBits:]([BBMaskedSet alloc], "initWithMaskBits:", 16);
    observerFeedSet = v9->_observerFeedSet;
    v9->_observerFeedSet = v14;

  }
  return v9;
}

- (void)_startNextTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[BBObserverGatewayHolder _invalidateTimer](self, "_invalidateTimer");
  if (-[NSMutableArray count](self->_timeouts, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_timeouts, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[BBObserverGatewayHolder name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bulletinID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544130;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ start timer (%{public}@) for out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    objc_msgSend(v3, "timeout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBObserverGatewayHolder _startTimerWithFireDate:](self, "_startTimerWithFireDate:", v10);

  }
}

- (void)_startTimerWithFireDate:(id)a3
{
  objc_class *v4;
  id v5;
  PCPersistentTimer *v6;
  PCPersistentTimer *timeoutTimer;

  v4 = (objc_class *)MEMORY[0x24BE71A08];
  v5 = a3;
  v6 = (PCPersistentTimer *)objc_msgSend([v4 alloc], "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v5, CFSTR("com.apple.bulletinboard.identityqueue.gatewayholdertimeout"), self, sel__handleTimeout, 0);

  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v6;

  -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_timeoutTimer, "setMinimumEarlyFireProportion:", 1.0);
  -[PCPersistentTimer setUserVisible:](self->_timeoutTimer, "setUserVisible:", 1);
  -[PCPersistentTimer scheduleInQueue:](self->_timeoutTimer, "scheduleInQueue:", self->_queue);
}

- (void)_invalidateTimer
{
  PCPersistentTimer *timeoutTimer;

  -[PCPersistentTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

}

- (BOOL)_invalidateTimeout:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_timeouts, "indexOfObject:", v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[BBObserverGatewayHolder name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bulletinID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sectionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ invalidated timer (%{public}@) for out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v13, 0x2Au);

    }
    -[NSMutableArray removeObjectAtIndex:](self->_timeouts, "removeObjectAtIndex:", v5);
    if (!v5)
      -[BBObserverGatewayHolder _startNextTimer](self, "_startNextTimer");
  }

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_handleTimeout
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_timeouts, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_timeouts, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[BBObserverGatewayHolder name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bulletinID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ timed out for bulletin %{public}@ in section %{public}@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(v3, "timeoutHandler");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

    -[NSMutableArray removeObjectAtIndex:](self->_timeouts, "removeObjectAtIndex:", 0);
    -[BBObserverGatewayHolder _startNextTimer](self, "_startNextTimer");

  }
}

- (id)_addTimeout:(double)a3 forBulletinID:(id)a4 inSectionID:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BBObserverGatewayAddBulletinRequest *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x24BDBCE60];
  v13 = a6;
  objc_msgSend(v12, "dateWithTimeIntervalSinceNow:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[BBObserverGatewayHolder name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v17;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ add timer (%{public}@) for bulletin %{public}@ in section %{public}@", (uint8_t *)&v20, 0x2Au);

  }
  v18 = objc_alloc_init(BBObserverGatewayAddBulletinRequest);
  -[BBObserverGatewayAddBulletinRequest setTimeout:](v18, "setTimeout:", v14);
  -[BBObserverGatewayAddBulletinRequest setTimeoutHandler:](v18, "setTimeoutHandler:", v13);

  -[BBObserverGatewayAddBulletinRequest setBulletinID:](v18, "setBulletinID:", v10);
  -[BBObserverGatewayAddBulletinRequest setSectionID:](v18, "setSectionID:", v11);
  -[NSMutableArray addObject:](self->_timeouts, "addObject:", v18);
  if (-[NSMutableArray count](self->_timeouts, "count") == 1)
    -[BBObserverGatewayHolder _startNextTimer](self, "_startNextTimer");

  return v18;
}

- (void)sendAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5 withTimeout:(double)a6 handler:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _BYTE *v42;
  id v43[2];
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _BYTE *v48;
  id v49;
  id location;
  _BYTE buf[24];
  void *v52;
  __int16 v53;
  double v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v10 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  objc_msgSend(v12, "bulletinID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_feed & a5;
  v15 = (void *)BBLogGateway;
  v16 = os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v10)
    {
      if (v16)
      {
        v17 = v15;
        -[BBObserverGatewayHolder name](self, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = "WITH";
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v18;
        if (!v13)
          v19 = "WITHOUT";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2114;
        v52 = v34;
        v53 = 2048;
        v54 = a6;
        v55 = 2082;
        v56 = v19;
        _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ sending add bulletin lights and sirens YES for %{public}@ in section %{public}@ with timeout %f %{public}s handler", buf, 0x34u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v52) = 0;
      objc_initWeak(&location, self);
      v20 = MEMORY[0x24BDAC760];
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke;
      v44[3] = &unk_24C564C58;
      objc_copyWeak(&v49, &location);
      v21 = v35;
      v45 = v21;
      v22 = v34;
      v46 = v22;
      v48 = buf;
      v23 = v13;
      v47 = v23;
      -[BBObserverGatewayHolder _addTimeout:forBulletinID:inSectionID:handler:](self, "_addTimeout:forBulletinID:inSectionID:handler:", v21, v22, v44, a6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBObserverGatewayHolder gateway](self, "gateway");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke_40;
      v36[3] = &unk_24C564C80;
      objc_copyWeak(v43, &location);
      v37 = v21;
      v38 = v22;
      v42 = buf;
      v26 = v24;
      v39 = v26;
      v40 = v12;
      v43[1] = (id)a5;
      v41 = v23;
      -[BBObserverGatewayHolder sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:](self, "sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:", v25, v40, 1, a5, v36);

      objc_destroyWeak(v43);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
      goto LABEL_16;
    }
    if (v16)
    {
      v29 = v15;
      -[BBObserverGatewayHolder name](self, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bulletinID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2114;
      v52 = v32;
      _os_log_impl(&dword_20CCB9000, v29, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ sending add bulletin lights and sirens NO for %{public}@ in section %{public}@ with NO timeout and NO handler", buf, 0x20u);

    }
    -[BBObserverGatewayHolder gateway](self, "gateway");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBObserverGatewayHolder sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:](self, "sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:", v33, v12, 0, a5, 0);

    -[BBObserverGatewayHolder sendObserversAddBulletin:playLightsAndSirens:forFeeds:](self, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", v12, 0, a5);
    if (v13)
LABEL_15:
      (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  else
  {
    if (v16)
    {
      v27 = v15;
      -[BBObserverGatewayHolder name](self, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 2114;
      v52 = v34;
      v53 = 2048;
      v54 = *(double *)&a5;
      _os_log_impl(&dword_20CCB9000, v27, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ will not handle add bulletin %{public}@ in section %{public}@ for feed %lu. It's not in a relevant feed.", buf, 0x2Au);

    }
    if (v13)
      goto LABEL_15;
  }
LABEL_16:

}

void __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      objc_msgSend(WeakRetained, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ did NOT receive lights and sirens response for bulletin %{public}@ in section %{public}@", (uint8_t *)&v9, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, 0, 0);

}

void __92__BBObserverGatewayHolder_sendAddBulletin_playLightsAndSirens_forFeeds_withTimeout_handler___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[12];
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (!WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      goto LABEL_13;
    goto LABEL_11;
  }
  v7 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(WeakRetained, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = "DID NOT";
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v15 = 138544130;
    if ((_DWORD)a2)
      v11 = "DID";
    *(_QWORD *)&v15[4] = v9;
    v16 = 2082;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Gateway %{public}@ received %{public}s play lights and sirens for bulletin %{public}@ in section %{public}@", v15, 0x2Au);

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(WeakRetained, "_invalidateTimeout:", *(_QWORD *)(a1 + 48));
    if ((a2 & 1) != 0 || objc_msgSend(WeakRetained, "gatewayPriority") != 3)
      objc_msgSend(WeakRetained, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 88), *(_QWORD *)v15);
LABEL_11:
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
      (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
LABEL_13:

}

- (void)sendObserversAddBulletin:(id)a3 playLightsAndSirens:(BOOL)a4 forFeeds:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[BBMaskedSet objectsForMask:](self->_observerFeedSet, "objectsForMask:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[BBObserverGatewayHolder sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:](self, "sendObserver:addBulletin:playLightsAndSirens:forFeeds:withHandler:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), v8, v6, a5, 0);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)sendObserver:(id)a3 addBulletin:(id)a4 playLightsAndSirens:(BOOL)a5 forFeeds:(unint64_t)a6 withHandler:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v9 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  objc_msgSend(v12, "bulletinID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v11, "incrementedTransactionIDForBulletinID:", v14);

  v16 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v17 = "YES";
    else
      v17 = "NO";
    v18 = v16;
    objc_msgSend(v12, "bulletinID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136446722;
    v23 = v17;
    v24 = 2048;
    v25 = v15;
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_20CCB9000, v18, OS_LOG_TYPE_DEFAULT, "Sending add bulletin with lights and sirens %{public}s for transactionID %ld, bulletin %{public}@", (uint8_t *)&v22, 0x20u);

  }
  +[BBBulletinAddUpdate updateWithBulletin:feeds:shouldPlayLightsAndSirens:](BBBulletinAddUpdate, "updateWithBulletin:feeds:shouldPlayLightsAndSirens:", v12, a6, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:transactionID:](BBBulletinUpdateTransaction, "transactionWithBulletinUpdate:transactionID:", v20, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateBulletin:withHandler:", v21, v13);

}

- (void)dealloc
{
  objc_super v3;

  -[BBObserverGatewayHolder _invalidateTimer](self, "_invalidateTimer");
  v3.receiver = self;
  v3.super_class = (Class)BBObserverGatewayHolder;
  -[BBObserverGatewayHolder dealloc](&v3, sel_dealloc);
}

- (BBObserverClientProxy)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
  objc_storeStrong((id *)&self->_gateway, a3);
}

- (unint64_t)gatewayPriority
{
  return self->_gatewayPriority;
}

- (void)setGatewayPriority:(unint64_t)a3
{
  self->_gatewayPriority = a3;
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BBMaskedSet)observerFeedSet
{
  return self->_observerFeedSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerFeedSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
