@implementation _MPCLeaseManager

- (void)engine:(id)a3 willChangeToItem:(id)a4 fromItem:(id)a5
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v7 = (void *)MEMORY[0x24BDD16D0];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDDB9F0];
  objc_msgSend(v11, "removeObserver:name:object:", self, *MEMORY[0x24BDDB9F0], v8);

  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__itemShouldPreventPlaybackDidChangeNotification_, v10, v9);
}

- (_MPCLeaseManager)initWithPlaybackEngine:(id)a3
{
  id v4;
  _MPCLeaseManager *v5;
  _MPCLeaseManager *v6;
  uint64_t v7;
  NSMutableDictionary *prepareCompletions;
  uint64_t v9;
  NSMutableSet *leaseEndIgnoreReasons;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MPCLeaseManager;
  v5 = -[_MPCLeaseManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    prepareCompletions = v6->_prepareCompletions;
    v6->_prepareCompletions = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    leaseEndIgnoreReasons = v6->_leaseEndIgnoreReasons;
    v6->_leaseEndIgnoreReasons = (NSMutableSet *)v9;

    objc_msgSend(v4, "addEngineObserver:", v6);
    +[MPCFairPlayPerformanceController sharedController](MPCFairPlayPerformanceController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerLeaseManager:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MPCFairPlayPerformanceController sharedController](MPCFairPlayPerformanceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterLeaseManager:", self);

  v4.receiver = self;
  v4.super_class = (Class)_MPCLeaseManager;
  -[_MPCLeaseManager dealloc](&v4, sel_dealloc);
}

- (void)getHasPreparedLeaseForAccount:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_createStoreRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61___MPCLeaseManager_getHasPreparedLeaseForAccount_completion___block_invoke;
  v12[3] = &unk_24CAB8BD8;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "getLeaseSessionWithRequestContext:completionHandler:", v9, v12);

}

- (void)prepareForPlaybackWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  NSMutableDictionary *prepareCompletions;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD aBlock[4];
  id v39;
  id v40;
  uint8_t buf[4];
  _MPCLeaseManager *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v8 = objc_msgSend(v6, "hasCatalogPlaybackCapability");
  v9 = objc_msgSend(v6, "usesLease");
  v10 = v9;
  if (v8 && (v9 & 1) != 0)
  {
    prepareCompletions = self->_prepareCompletions;
    objc_msgSend(v6, "hashedDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](prepareCompletions, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke;
      aBlock[3] = &unk_24CAB8C00;
      v39 = v13;
      v40 = v7;
      v14 = _Block_copy(aBlock);
      v15 = self->_prepareCompletions;
      objc_msgSend(v6, "hashedDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

      v17 = v39;
    }
    else
    {
      v19 = _Block_copy(v7);
      v20 = self->_prepareCompletions;
      objc_msgSend(v6, "hashedDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

      v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v42 = self;
        v43 = 2112;
        v44 = v6;
        _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: preparing lease account: %@", buf, 0x16u);
      }

      v23 = MEMORY[0x24BDAC760];
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_9;
      v36[3] = &unk_24CAB8C28;
      v36[4] = self;
      v24 = v6;
      v37 = v24;
      v25 = _Block_copy(v36);
      objc_msgSend(v24, "userIdentity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCPlaybackRequestEnvironment requestEnvironmentWithUserIdentity:](MPCPlaybackRequestEnvironment, "requestEnvironmentWithUserIdentity:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_createStoreRequestContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v23;
      v32[1] = 3221225472;
      v32[2] = __61___MPCLeaseManager_prepareForPlaybackWithAccount_completion___block_invoke_3;
      v32[3] = &unk_24CAB8CA8;
      v32[4] = self;
      v35 = v25;
      v33 = v24;
      v34 = v28;
      v30 = v28;
      v31 = v25;
      objc_msgSend(v29, "getLeaseSessionWithRequestContext:completionHandler:", v30, v32);

      v17 = v37;
    }

  }
  else
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v42 = self;
      v43 = 2112;
      v44 = v6;
      v45 = 1024;
      v46 = v8;
      v47 = 1024;
      v48 = v10;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - prepareForPlayback: Ignoring request to prepare lease for account: %@ hasCatalogPlayback=%{BOOL}u usesLease=%{BOOL}u", buf, 0x22u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)beginIgnoringLeaseEndEventsForReason:(id)a3
{
  -[NSMutableSet addObject:](self->_leaseEndIgnoreReasons, "addObject:", a3);
}

- (void)endIgnoringLeaseEndEventsForReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_leaseEndIgnoreReasons, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_leaseEndIgnoreReasons, "count"))
    -[_MPCLeaseManager _updateStateForPlaybackPrevention](self, "_updateStateForPlaybackPrevention");
}

- (void)setCanStealLeaseIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  _MPCLeaseManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Can steal lease if needed", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "receivedUserInteractionEvent");

}

- (void)_updateStateForPlaybackPrevention
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  NSObject *v12;
  _MPCLeaseManager *v13;
  id v14;
  uint8_t buf[4];
  _MPCLeaseManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[_MPCLeaseManager playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219010;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    v19 = 1024;
    v20 = objc_msgSend(v6, "shouldPreventPlayback");
    v21 = 2048;
    v22 = v5;
    v23 = 1024;
    v24 = v5 > 1;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - State for lease playback prevention [evaluation] - item:%{public}@ - shouldPreventPlayback:%{BOOL}u - playbackState:%ld - isPlaying:%{BOOL}u", buf, 0x2Cu);
  }

  if (v5 >= 2 && objc_msgSend(v6, "shouldPreventPlayback"))
  {
    if (-[NSMutableSet count](self->_leaseEndIgnoreReasons, "count"))
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[NSMutableSet allObjects](self->_leaseEndIgnoreReasons, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v16 = self;
        v17 = 2114;
        v18 = v10;
        _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[Lease] - MPCLeaseManager: %p - Ignoring lease playback prevention [pending reasons %{public}@]", buf, 0x16u);

      }
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53___MPCLeaseManager__updateStateForPlaybackPrevention__block_invoke;
      block[3] = &unk_24CABAA28;
      v12 = v6;
      v13 = self;
      v14 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      v8 = v12;
    }

  }
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (NSMutableSet)leaseEndIgnoreReasons
{
  return self->_leaseEndIgnoreReasons;
}

- (void)setLeaseEndIgnoreReasons:(id)a3
{
  objc_storeStrong((id *)&self->_leaseEndIgnoreReasons, a3);
}

- (NSMutableDictionary)prepareCompletions
{
  return self->_prepareCompletions;
}

- (void)setPrepareCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_prepareCompletions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareCompletions, 0);
  objc_storeStrong((id *)&self->_leaseEndIgnoreReasons, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

@end
