@implementation CONodeManager

- (CONodeManager)initWithExecutionContext:(id)a3
{
  id v4;
  CONodeManager *v5;
  uint64_t v6;
  COExecutionContext *executionContext;
  uint64_t v8;
  NSMutableDictionary *nodeControllers;
  COElectionInfo *v10;
  COElectionInfo *electionInfo;
  uint64_t v12;
  NSMutableDictionary *browsersObservers;
  uint64_t v14;
  NSSet *acceptableCommands;
  uint64_t v16;
  NSMutableDictionary *leaderCommands;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CONodeManager;
  v5 = -[CONodeManager init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    executionContext = v5->_executionContext;
    v5->_executionContext = (COExecutionContext *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    nodeControllers = v5->_nodeControllers;
    v5->_nodeControllers = (NSMutableDictionary *)v8;

    v10 = objc_alloc_init(COElectionInfo);
    electionInfo = v5->_electionInfo;
    v5->_electionInfo = v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    browsersObservers = v5->_browsersObservers;
    v5->_browsersObservers = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    acceptableCommands = v5->_acceptableCommands;
    v5->_acceptableCommands = (NSSet *)v14;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    leaderCommands = v5->_leaderCommands;
    v5->_leaderCommands = (NSMutableDictionary *)v16;

  }
  return v5;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meshControllerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[m:%@] <%@: %p>"), v5, v7, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeManager me](self, "me");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeManager browsersObservers](self, "browsersObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p,\n ME: %@, Browsers: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  if (!self->_started)
  {
    self->_started = 1;
    objc_initWeak(&location, self);
    -[CONodeManager browsersObservers](self, "browsersObservers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __22__CONodeManager_start__block_invoke;
    v5[3] = &unk_24D4B2700;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

    -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
    -[CONodeManager _resetBallot](self, "_resetBallot");
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __22__CONodeManager_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __22__CONodeManager_start__block_invoke_2;
  v15[3] = &unk_24D4B26B0;
  v8 = (id *)(a1 + 40);
  objc_copyWeak(&v16, (id *)(a1 + 40));
  objc_msgSend(v5, "addObserverUsingBlock:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "browsersObservers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v5);

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __22__CONodeManager_start__block_invoke_4;
  v12[3] = &unk_24D4B26D8;
  objc_copyWeak(&v14, v8);
  v11 = v5;
  v13 = v11;
  objc_msgSend(v11, "startWithCompletionHandler:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

}

void __22__CONodeManager_start__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  char v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "executionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __22__CONodeManager_start__block_invoke_3;
    v9[3] = &unk_24D4B1BC0;
    v11 = a2;
    v9[4] = v7;
    v10 = v5;
    objc_msgSend(v8, "dispatchAsync:", v9);

  }
}

uint64_t __22__CONodeManager_start__block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "_didDiscoverRecord:", v4);
  else
    return objc_msgSend(v3, "_didLoseRecord:", v4);
}

void __22__CONodeManager_start__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    COCoreLogForCategory(15);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a2)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __22__CONodeManager_start__block_invoke_4_cold_1();
      goto LABEL_9;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully started browser %@", (uint8_t *)&v10, 0x16u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = *(id *)(a1 + 32);
      v6 = WeakRetained[6];
      WeakRetained[6] = v9;
LABEL_9:

    }
  }

}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  self->_started = 0;
  objc_initWeak(&location, self);
  -[CONodeManager executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke;
  v8[3] = &unk_24D4B27B8;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "dispatchAsync:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 *p_buf;
  id v18[2];
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    COCoreLogForCategory(15);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "browsersObservers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v21 = 0;
    v7 = a1[4];
    objc_sync_enter(v7);
    objc_msgSend(WeakRetained, "nodeControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v9;

    objc_msgSend(WeakRetained, "nodeControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(WeakRetained, "activeNodesWithSelfNode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "count");

    objc_sync_exit(v7);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_2;
      v14[3] = &unk_24D4B2790;
      objc_copyWeak(v18, v2);
      p_buf = &buf;
      v15 = v11;
      v18[1] = v13;
      v16 = a1[5];
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v14);

      objc_destroyWeak(v18);
    }
    else
    {
      (*((void (**)(void))a1[5] + 2))();
    }

    _Block_object_dispose(&buf, 8);
  }

}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v7 = a2;
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v7, "removeObserver:", v4);
    objc_msgSend(v7, "stop");
  }

}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13[2];

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_24D4B2768;
  objc_copyWeak(v13, (id *)(a1 + 56));
  v12 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 64);
  v10 = v7;
  v13[1] = v8;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v6, "stopWithCompletionHandler:", v9);

  objc_destroyWeak(v13);
}

void __43__CONodeManager_stopWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void (*v19)(_QWORD *, __CFString *, _QWORD *);
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(_QWORD *)(v4 + 24) - 1;
    *(_QWORD *)(v4 + 24) = v5;
    if (!v5)
    {
      v6 = objc_msgSend(WeakRetained, "electionEnd");
      if (v6 > objc_msgSend(v3, "electionStart"))
      {
        objc_msgSend(v3, "executionContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "label");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "allValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v10 = 0;
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v31;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "node", v23);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "connectionType") == 2)
              {
                ++v10;
                if (objc_msgSend(v14, "discoveryType") == 2)
                  ++v9;
              }

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v11);
        }

        v15 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        objc_msgSend(v3, "executionContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "analyticsRecorder");
        v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __43__CONodeManager_stopWithCompletionHandler___block_invoke_4;
        v24[3] = &unk_24D4B1630;
        v18 = *(_QWORD *)(a1 + 64);
        v27 = v10;
        v28 = v9;
        v29 = (double)(v15 - v6) / 1000000000.0;
        v25 = v23;
        v26 = v18;
        v19 = (void (*)(_QWORD *, __CFString *, _QWORD *))v17[2];
        v20 = v23;
        v19(v17, CFSTR("com.apple.CoordinationCore.MeshElection"), v24);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v21 = v3;
      objc_sync_enter(v21);
      objc_msgSend(v21, "setElectionElapsedTimer:", 0);
      objc_msgSend(v21, "nodeControllers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeAllObjects");

      objc_sync_exit(v21);
    }
  }

}

id __43__CONodeManager_stopWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24D4CF3A8;
  v9[0] = 0x24D4B5458;
  v9[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  v9[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  v9[4] = 0x24D4B5438;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = 0x24D4B5418;
  v6 = *(_QWORD *)(a1 + 32);
  v10[4] = v5;
  v10[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addBrowser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDispatchQueue");

  if (!self->_started)
  {
    -[CONodeManager browsersObservers](self, "browsersObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
}

- (void)removeBrowser:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDispatchQueue");

  if (!self->_started)
  {
    -[CONodeManager browsersObservers](self, "browsersObservers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void)sendCommands:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[CONodeManager executionContext](self, "executionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertDispatchQueue");

    -[CONodeManager pingLeader](self, "pingLeader");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[CONodeManager sendCommand:](self, "sendCommand:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)sendCommand:(id)a3
{
  id v4;
  void *v5;
  COMeshNode *v6;
  void *v7;
  void *v8;
  void *v9;
  COMeshNode *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CONodeManager *v18;
  id v19;
  COMeshNode *v20;
  _QWORD v21[5];
  id v22;
  COMeshNode *v23;
  id v24[4];
  id location;

  v4 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  objc_msgSend(v4, "destination");
  v6 = (COMeshNode *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
    {
      -[CONodeManager electionInfo](self, "electionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CONodeManager leader](self, "leader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CONodeManager nodeControllerForConstituent:](self, "nodeControllerForConstituent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [COMeshNode alloc];
    objc_msgSend(v9, "node");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[COMeshNode initWithNode:](v10, "initWithNode:", v11);

    objc_msgSend(v4, "setDestination:", v6);
  }
  v12 = (void *)objc_opt_class();
  v13 = (void *)objc_opt_class();
  v14 = (void *)objc_opt_class();
  -[COMeshNode remote](v6, "remote");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeManager nodeControllerForConstituent:](self, "nodeControllerForConstituent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[COMeshNode IDSIdentifier](v6, "IDSIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager nodeControllerForIDS:](self, "nodeControllerForIDS:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = self;
  objc_initWeak(&location, v16);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __29__CONodeManager_sendCommand___block_invoke;
  v21[3] = &unk_24D4B27E0;
  v21[4] = v18;
  objc_copyWeak(v24, &location);
  v19 = v4;
  v22 = v19;
  v24[1] = v12;
  v24[2] = v13;
  v24[3] = v14;
  v20 = v6;
  v23 = v20;
  objc_msgSend(v16, "sendCommand:withCompletionHandler:", v19, v21);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

void __29__CONodeManager_sendCommand___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v11 = WeakRetained;
  if (v9)
    v12 = WeakRetained == 0;
  else
    v12 = 1;
  if (!v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_13:

          goto LABEL_14;
        }
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v17, "command");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "node:didReceiveResponse:toRequest:", v15, v7, v14);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v9, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_13;
        v16 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v17, "command");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "node:didSendCommand:", v16, v14);
        goto LABEL_12;
      }
    }
    objc_msgSend(v17, "command");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nodeController:didReceiveError:forCommand:", v11, v8, v14);
    goto LABEL_12;
  }
LABEL_14:

}

- (void)pingLeader
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
  {
    -[CONodeManager electionInfo](self, "electionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leader");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CONodeManager leader](self, "leader");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CONodeManager nodeControllerForConstituent:](self, "nodeControllerForConstituent:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendPing");

}

- (COConstituent)me
{
  void *v2;
  void *v3;

  -[CONodeManager executionContext](self, "executionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constituentForMe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (COConstituent *)v3;
}

- (COMeshNode)nodeForMe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  COMeshNode *v7;

  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constituentForMe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CONodeManager nodeControllerForConstituent:](self, "nodeControllerForConstituent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[COMeshNode initWithNode:]([COMeshNode alloc], "initWithNode:", v6);
  return v7;
}

- (COConstituent)leader
{
  CONodeManager *v2;
  COConstituent *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_leader;
  objc_sync_exit(v2);

  return v3;
}

- (id)nodeControllerForConstituent:(id)a3
{
  id v4;
  CONodeManager *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v5 = self;
  objc_sync_enter(v5);
  -[CONodeManager nodeControllers](v5, "nodeControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__CONodeManager_nodeControllerForConstituent___block_invoke;
  v11[3] = &unk_24D4B2808;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __46__CONodeManager_nodeControllerForConstituent___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)nodeControllerForIDS:(id)a3
{
  id v4;
  CONodeManager *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  v5 = self;
  objc_sync_enter(v5);
  -[CONodeManager nodeControllers](v5, "nodeControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__CONodeManager_nodeControllerForIDS___block_invoke;
  v11[3] = &unk_24D4B2808;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __38__CONodeManager_nodeControllerForIDS___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "IDSIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (NSArray)nodes
{
  return (NSArray *)-[CONodeManager activeNodesWithSelfNode:](self, "activeNodesWithSelfNode:", 0);
}

- (id)activeNodesWithSelfNode:(BOOL)a3
{
  CONodeManager *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  -[CONodeManager nodeControllers](v5, "nodeControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__CONodeManager_activeNodesWithSelfNode___block_invoke;
  v10[3] = &unk_24D4B2830;
  v11 = a3;
  v10[4] = &v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __41__CONodeManager_activeNodesWithSelfNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  COMeshNode *v5;
  void *v6;
  COMeshNode *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "nodeAfterReconciliation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isActive")
    && (*(_BYTE *)(a1 + 40) || (objc_msgSend(v8, "isLocalNodeController") & 1) == 0))
  {
    v5 = [COMeshNode alloc];
    objc_msgSend(v8, "node");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[COMeshNode initWithNode:](v5, "initWithNode:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
  }

}

- (void)_didDiscoverRecord:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDispatchQueue");

  if (self->_started)
    -[CONodeManager _handleDiscoveryRecord:](self, "_handleDiscoveryRecord:", v5);

}

- (void)_didLoseRecord:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  COCoreLogForCategory(15);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager shortDescription](self, "shortDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ lost a record %@", (uint8_t *)&v8, 0x16u);

  }
  if (self->_started)
    -[CONodeManager _handleLostRecord:](self, "_handleLostRecord:", v4);

}

- (void)nodeController:(id)a3 didUpdateState:(int64_t)a4 to:(int64_t)a5 reason:(int64_t)a6 withLastSentElectionInfo:(id)a7
{
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  -[CONodeManager executionContext](self, "executionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assertDispatchQueue");

  if (self->_started)
  {
    COCoreLogForCategory(15);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CONodeControllerStateDescription(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CONodeControllerStateDescription(a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544130;
      v20 = v16;
      v21 = 2048;
      v22 = v12;
      v23 = 2114;
      v24 = v17;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ updated %p state from %{public}@ to %{public}@", (uint8_t *)&v19, 0x2Au);

    }
    switch(a5)
    {
      case 1:
        if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
          goto LABEL_6;
        break;
      case 2:
LABEL_6:
        -[CONodeManager _nodeBecameInactive:withReason:](self, "_nodeBecameInactive:withReason:", v12, a6);
        goto LABEL_8;
      case 4:
        -[CONodeManager _nodeStopped:withReason:](self, "_nodeStopped:withReason:", v12, a6);
LABEL_8:
        -[CONodeManager _informDelegateAboutNodeRemoval:oldState:](self, "_informDelegateAboutNodeRemoval:oldState:", v12, a4);
        goto LABEL_11;
      case 5:
        -[CONodeManager _nodeStartedElection:withElectionInfo:](self, "_nodeStartedElection:withElectionInfo:", v12, v13);
        -[CONodeManager _informDelegateAboutNodeAddition:oldState:](self, "_informDelegateAboutNodeAddition:oldState:", v12, a4);
        break;
      case 6:
        -[CONodeManager _informDelegateAboutNodeAddition:oldState:](self, "_informDelegateAboutNodeAddition:oldState:", v12, a4);
LABEL_11:
        -[CONodeManager _checkForElectionCompletion:nodeController:](self, "_checkForElectionCompletion:nodeController:", v13, v12);
        break;
      default:
        break;
    }
  }

}

- (void)fast_fold_nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  COElectionInfo *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  CONodeManager *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  CONodeManager *v39;
  void *v40;
  void *v41;
  void *v42;
  CONodeManager *v43;
  void *v44;
  void *v45;
  CONodeManager *v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD v49[4];
  id v50;
  CONodeManager *v51;
  uint8_t buf[4];
  CONodeManager *v53;
  __int16 v54;
  unint64_t v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[CONodeManager executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  if (self->_started)
  {
    COCoreLogForCategory(15);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v46 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v46;
      v54 = 2112;
      v55 = (unint64_t)v9;
      v56 = 2048;
      v57 = (unint64_t)v8;
      _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ got a command %@ from node controller %p", buf, 0x20u);

    }
    -[CONodeManager ballotBrowser](self, "ballotBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ballot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "discoveryUsingBallot:", v14);

    v15 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v9);
    -[CONodeManager electionInfo](self, "electionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasSameGenerationAndLeader:", v15);

    if (v17)
    {
      -[CONodeManager electionInfo](self, "electionInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v18);
LABEL_27:

      goto LABEL_28;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v19, "generation");

    v48 = -[COElectionInfo generation](v15, "generation");
    if (v47 > v48)
    {
      COCoreLogForCategory(15);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeManager shortDescription](self, "shortDescription");
        v21 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
        -[CONodeManager electionInfo](self, "electionInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "generation");
        v24 = -[COElectionInfo generation](v15, "generation");
        *(_DWORD *)buf = 138543874;
        v53 = v21;
        v54 = 2048;
        v55 = v23;
        v56 = 2048;
        v57 = v24;
        _os_log_impl(&dword_215E92000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Our generation %llu is greater than the incoming generation %llu", buf, 0x20u);

      }
      -[CONodeManager electionInfo](self, "electionInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v18);
      goto LABEL_27;
    }
    objc_msgSend(v8, "node");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "remote");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CONodeManager electionInfo](self, "electionInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ballot");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "candidates");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "containsObject:", v18);

    if ((v29 & 1) != 0)
    {
      v30 = 0;
      goto LABEL_21;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "ballot");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v33, "addCandidate:", v18);
    objc_msgSend(v8, "ipDiscoveryRecord");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34 && objc_msgSend(v34, "shouldAdvertise"))
    {
      if (!objc_msgSend(v33, "addDiscoveryRecord:", v35))
      {
LABEL_20:
        v30 = -[CONodeManager _updateBallot:](self, "_updateBallot:", v33, v47);

LABEL_21:
        if (v48 <= v47)
        {
          -[CONodeManager electionInfo](self, "electionInfo");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v42);

          if (!v30)
            goto LABEL_27;
        }
        else
        {
          COCoreLogForCategory(15);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            -[CONodeManager shortDescription](self, "shortDescription");
            v39 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v53 = v39;
            v54 = 2048;
            v55 = v47;
            v56 = 2048;
            v57 = v48;
            _os_log_impl(&dword_215E92000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ bumping election generation from %llu to %llu", buf, 0x20u);

          }
          -[CONodeManager electionInfo](self, "electionInfo");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setGeneration:", v48);

          -[CONodeManager _resetBallot](self, "_resetBallot");
          -[CONodeManager electionInfo](self, "electionInfo");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, v41);

        }
        v43 = self;
        objc_sync_enter(v43);
        -[CONodeManager nodeControllers](v43, "nodeControllers");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "copy");

        objc_sync_exit(v43);
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __86__CONodeManager_fast_fold_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke;
        v49[3] = &unk_24D4B2858;
        v50 = v8;
        v51 = v43;
        objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v49);

        goto LABEL_27;
      }
      COCoreLogForCategory(11);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v33, "discovery");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v53 = self;
        v54 = 2112;
        v55 = (unint64_t)v37;
        v56 = 2048;
        v57 = (unint64_t)v33;
        _os_log_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);

      }
    }
    else
    {
      COCoreLogForCategory(11);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        v53 = self;
        v54 = 2112;
        v55 = (unint64_t)v35;
        v56 = 2112;
        v57 = (unint64_t)v8;
        v58 = 2048;
        v59 = v33;
        v60 = 2112;
        v61 = v9;
        _os_log_debug_impl(&dword_215E92000, v36, OS_LOG_TYPE_DEBUG, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
      }
    }

    goto LABEL_20;
  }
LABEL_28:

}

void __86__CONodeManager_fast_fold_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(a1 + 40);
    v4 = a3;
    objc_msgSend(v3, "electionInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateElectionInfo:", v5);

  }
}

- (void)nodeController:(id)a3 didReceiveElectionCmd:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  CONodeManager *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  CONodeManager *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  CONodeManager *v46;
  NSObject *v47;
  CONodeManager *v48;
  NSObject *v49;
  CONodeManager *v50;
  void *v51;
  void *v52;
  char isKindOfClass;
  NSObject *v54;
  CONodeManager *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  CONodeManager *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  COElectionInfo *v65;
  _QWORD v66[4];
  id v67;
  CONodeManager *v68;
  uint8_t buf[4];
  CONodeManager *v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
  {
    -[CONodeManager executionContext](self, "executionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertDispatchQueue");

    if (!self->_started)
      goto LABEL_45;
    COCoreLogForCategory(15);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v46 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v46;
      v71 = 2112;
      v72 = (unint64_t)v9;
      v73 = 2048;
      v74 = (unint64_t)v8;
      _os_log_debug_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ got a command %@ from node controller %p", buf, 0x20u);

    }
    -[CONodeManager ballotBrowser](self, "ballotBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ballot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "discoveryUsingBallot:", v14);

    v65 = -[COElectionInfo initWithCommand:]([COElectionInfo alloc], "initWithCommand:", v9);
    -[CONodeManager electionInfo](self, "electionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasGreaterGenerationThan:", v65);

    if (v16)
    {
      COCoreLogForCategory(15);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeManager shortDescription](self, "shortDescription");
        v18 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
        -[CONodeManager electionInfo](self, "electionInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "generation");
        v21 = -[COElectionInfo generation](v65, "generation");
        *(_DWORD *)buf = 138543874;
        v70 = v18;
        v71 = 2048;
        v72 = v20;
        v73 = 2048;
        v74 = v21;
        _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Our generation %llu is greater than the incoming generation %llu", buf, 0x20u);

      }
LABEL_9:

      -[CONodeManager electionInfo](self, "electionInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v22);
LABEL_44:

      goto LABEL_45;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqual:", v65);

    if (v24)
    {
      -[CONodeManager electionInfo](self, "electionInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v22);
      goto LABEL_44;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasSameGenerationAndLeader:", v65);

    if (v26)
    {
      COCoreLogForCategory(15);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeManager shortDescription](self, "shortDescription");
        v27 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
        -[CONodeManager electionInfo](self, "electionInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "leader");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CONodeManager electionInfo](self, "electionInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "generation");
        *(_DWORD *)buf = 138544130;
        v70 = v27;
        v71 = 2112;
        v72 = (unint64_t)v29;
        v73 = 2048;
        v74 = v31;
        v75 = 2112;
        v76 = v8;
        _os_log_impl(&dword_215E92000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ The leader %@ and generation %llu for command  %@ on node has not changed", buf, 0x2Au);

      }
      goto LABEL_9;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v32, "generation");

    v64 = -[COElectionInfo generation](v65, "generation");
    objc_msgSend(v8, "node");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "remote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CONodeManager electionInfo](self, "electionInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ballot");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "candidates");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "containsObject:", v22);

    if ((v37 & 1) != 0)
    {
      v38 = 0;
      goto LABEL_31;
    }
    -[CONodeManager electionInfo](self, "electionInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "ballot");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "mutableCopy");

    objc_msgSend(v41, "addCandidate:", v22);
    objc_msgSend(v8, "ipDiscoveryRecord");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42 && objc_msgSend(v42, "shouldAdvertise"))
    {
      if (!objc_msgSend(v41, "addDiscoveryRecord:", v43))
      {
LABEL_26:
        v38 = -[CONodeManager _updateBallot:](self, "_updateBallot:", v41);
        if ((objc_msgSend(MEMORY[0x24BE19E30], "isSlimBallotsEnabled") & 1) == 0)
        {
          COCoreLogForCategory(15);
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            -[CONodeManager shortDescription](self, "shortDescription");
            v48 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v70 = v48;
            v71 = 2114;
            v72 = (unint64_t)v22;
            _os_log_impl(&dword_215E92000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ adding candidate %{public}@ to our ballot", buf, 0x16u);

          }
          v38 = 1;
        }

LABEL_31:
        if (v64 > v63)
        {
          COCoreLogForCategory(15);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            -[CONodeManager shortDescription](self, "shortDescription");
            v50 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v70 = v50;
            v71 = 2048;
            v72 = v63;
            v73 = 2048;
            v74 = v64;
            _os_log_impl(&dword_215E92000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ upgrading election generation from %llu to %llu", buf, 0x20u);

          }
          -[CONodeManager electionInfo](self, "electionInfo");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setGeneration:", v64);

          -[CONodeManager _resetBallot](self, "_resetBallot");
          v38 = 1;
        }
        if (v64 == v63)
        {
          objc_msgSend(v8, "node");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v52, "isInElectionState") & 1) != 0)
          {

          }
          else
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
              -[CONodeManager _resetBallot](self, "_resetBallot");
              COCoreLogForCategory(15);
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                -[CONodeManager shortDescription](self, "shortDescription");
                v55 = (CONodeManager *)objc_claimAutoreleasedReturnValue();
                -[CONodeManager electionInfo](self, "electionInfo");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = objc_msgSend(v56, "generation");
                *(_DWORD *)buf = 138543618;
                v70 = v55;
                v71 = 2048;
                v72 = v57;
                _os_log_impl(&dword_215E92000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting ELECTION %llu", buf, 0x16u);

              }
              -[CONodeManager electionInfo](self, "electionInfo");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v10[2](v10, v58);

              goto LABEL_43;
            }
          }
        }
        -[CONodeManager electionInfo](self, "electionInfo");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v59);

        if (!v38)
          goto LABEL_44;
LABEL_43:
        v60 = self;
        objc_sync_enter(v60);
        -[CONodeManager nodeControllers](v60, "nodeControllers");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_msgSend(v61, "copy");

        objc_sync_exit(v60);
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = __76__CONodeManager_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke;
        v66[3] = &unk_24D4B2858;
        v67 = v8;
        v68 = v60;
        objc_msgSend(v62, "enumerateKeysAndObjectsUsingBlock:", v66);

        goto LABEL_44;
      }
      COCoreLogForCategory(11);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v41, "discovery");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v70 = self;
        v71 = 2112;
        v72 = (unint64_t)v45;
        v73 = 2048;
        v74 = (unint64_t)v41;
        _os_log_impl(&dword_215E92000, v44, OS_LOG_TYPE_DEFAULT, "%p updated Discovery %@ in ballot %p when handling response", buf, 0x20u);

      }
    }
    else
    {
      COCoreLogForCategory(11);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219010;
        v70 = self;
        v71 = 2112;
        v72 = (unint64_t)v43;
        v73 = 2112;
        v74 = (unint64_t)v8;
        v75 = 2048;
        v76 = v41;
        v77 = 2112;
        v78 = v9;
        _os_log_debug_impl(&dword_215E92000, v44, OS_LOG_TYPE_DEBUG, "%p cannot add Discovery %@ for %@ to ballot %p when handling response %@", buf, 0x34u);
      }
    }

    goto LABEL_26;
  }
  -[CONodeManager fast_fold_nodeController:didReceiveElectionCmd:withCompletionHandler:](self, "fast_fold_nodeController:didReceiveElectionCmd:withCompletionHandler:", v8, v9, v10);
LABEL_45:

}

void __76__CONodeManager_nodeController_didReceiveElectionCmd_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  if (*(void **)(a1 + 32) != a3)
  {
    v3 = *(void **)(a1 + 40);
    v4 = a3;
    objc_msgSend(v3, "electionInfo");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateElectionInfo:", v5);

  }
}

- (void)nodeController:(id)a3 didReceiveCommand:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  COMeshNode *v10;
  void *v11;
  COMeshNode *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  -[CONodeManager executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  -[CONodeManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [COMeshNode alloc];
    objc_msgSend(v6, "node");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[COMeshNode initWithNode:](v10, "initWithNode:", v11);

    objc_msgSend(v7, "_setSender:", v12);
    objc_msgSend(v9, "node:didReceiveCommand:", v12, v7);

  }
  else
  {
    COCoreLogForCategory(15);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CONodeManager nodeController:didReceiveCommand:].cold.1();

  }
}

- (void)nodeController:(id)a3 didReceiveRequest:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  COMeshNode *v13;
  void *v14;
  COMeshNode *v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[CONodeManager executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  -[CONodeManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = [COMeshNode alloc];
    objc_msgSend(v8, "node");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[COMeshNode initWithNode:](v13, "initWithNode:", v14);

    objc_msgSend(v9, "_setSender:", v15);
    objc_msgSend(v12, "node:didReceiveRequest:responseCallBack:", v15, v9, v10);
  }
  else
  {
    COCoreLogForCategory(15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CONodeManager nodeController:didReceiveRequest:callback:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4001, 0);
    v15 = (COMeshNode *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);
  }

}

- (void)nodeController:(id)a3 didReceiveError:(id)a4 forCommand:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  COMeshNode *v13;
  void *v14;
  COMeshNode *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CONodeManager executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  -[CONodeManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = [COMeshNode alloc];
    objc_msgSend(v8, "node");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[COMeshNode initWithNode:](v13, "initWithNode:", v14);

    objc_msgSend(v10, "_setSender:", v15);
    objc_msgSend(v12, "node:didReceiveError:forCommand:", v15, v9, v10);

  }
  else
  {
    COCoreLogForCategory(15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v9;
      _os_log_error_impl(&dword_215E92000, v16, OS_LOG_TYPE_ERROR, "%{public}@ failed to send a command %@ with error %@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (void)nodeController:(id)a3 didUpdateRemoteConstituent:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  COMutableBallot *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CONodeManager executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  if (self->_started)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("COMeshNodeErrorDomain"), -4000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager _handleEnqueuedCommandsForLostNode:error:](self, "_handleEnqueuedCommandsForLostNode:error:", v8, v12);
    if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
    {
      -[CONodeManager electionInfo](self, "electionInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CONodeManager leader](self, "leader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v9, "isEqual:", v14))
    {
      -[CONodeManager executionContext](self, "executionContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "analyticsRecorder");
      v16 = (COMutableBallot *)objc_claimAutoreleasedReturnValue();

      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __62__CONodeManager_nodeController_didUpdateRemoteConstituent_to___block_invoke;
      v29[3] = &unk_24D4B1978;
      v29[4] = self;
      ((void (*)(COMutableBallot *, const __CFString *, _QWORD *))v16->super._discovery)(v16, CFSTR("com.apple.CoordinationCore.MeshLostLeader"), v29);
      -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
      -[CONodeManager _resetBallot](self, "_resetBallot");
    }
    else
    {
      v17 = -[CONodeManager isInElection](self, "isInElection");
      if (!v14 || v17)
        goto LABEL_9;
      if (!objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
      {
        v16 = -[COBallot initWithCandidate:]([COMutableBallot alloc], "initWithCandidate:", v14);
        -[COMutableBallot addCandidate:](v16, "addCandidate:", v10);
        -[COBallot candidates](v16, "candidates");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v23, "isEqual:", v14) & 1) == 0)
        {
          COCoreLogForCategory(15);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            -[CONodeManager shortDescription](self, "shortDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v31 = v25;
            v32 = 2112;
            v33 = v8;
            v34 = 2112;
            v35 = v10;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_215E92000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ node controller changed %@ to a new constituent %@ that is better than our current leader %@", buf, 0x2Au);

          }
          -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
          -[CONodeManager _resetBallot](self, "_resetBallot");
          -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo");
        }

        goto LABEL_8;
      }
      -[CONodeManager electionInfo](self, "electionInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ballot");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[CONodeManager electionInfo](self, "electionInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ballot");
        v28 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (COMutableBallot *)objc_msgSend(v21, "mutableCopy");

        v18 = v28;
      }
      else
      {
        v16 = objc_alloc_init(COMutableBallot);
      }

      -[COMutableBallot addCandidate:](v16, "addCandidate:", v10);
      if (!-[CONodeManager _updateBallot:](self, "_updateBallot:", v16))
      {
LABEL_8:

LABEL_9:
        goto LABEL_10;
      }
      COCoreLogForCategory(15);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeManager shortDescription](self, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v27;
        v32 = 2112;
        v33 = v8;
        v34 = 2112;
        v35 = v10;
        v36 = 2112;
        v37 = v14;
        _os_log_impl(&dword_215E92000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ node controller changed %@ to a new constituent %@ that is better than our current leader %@", buf, 0x2Au);

      }
    }
    -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo");
    goto LABEL_8;
  }
LABEL_10:

}

id __62__CONodeManager_nodeController_didUpdateRemoteConstituent_to___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0x24D4B4878;
  v5[1] = 0x24D4B5418;
  v6[0] = 0x24D4B5538;
  objc_msgSend(*(id *)(a1 + 32), "executionContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)nodeController:(id)a3 didAddTransport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  _BYTE v24[22];
  __int16 v25;
  id v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CONodeManager executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  if (self->_started)
  {
    v9 = objc_msgSend(v7, "supportsLeaderElection");
    COCoreLogForCategory(15);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("does not support");
      *(_DWORD *)v24 = 138544130;
      *(_WORD *)&v24[12] = 2048;
      *(_QWORD *)&v24[4] = v11;
      if (v9)
        v12 = CFSTR("supports");
      *(_QWORD *)&v24[14] = v6;
      v25 = 2112;
      v26 = v7;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Node %p added a transport %@ that %@ election", v24, 0x2Au);

    }
    if (v9)
    {
      objc_msgSend(v6, "node");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "state");

      if (v14)
      {
        v15 = objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled");
        -[CONodeManager electionInfo](self, "electionInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {

          if (!v17)
            -[CONodeManager _resetBallot](self, "_resetBallot");
          -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo", *(_OWORD *)v24);
        }
        else
        {
          objc_msgSend(v16, "ballot");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "node");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "remote");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "candidates");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "containsObject:", v21);

          if ((v23 & 1) == 0)
          {
            -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
            -[CONodeManager _resetBallot](self, "_resetBallot");
            -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo");
          }

        }
      }
      else
      {
        -[CONodeManager electionInfo](self, "electionInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateElectionInfo:", v18);

      }
    }
    else
    {
      objc_msgSend(v6, "inquireForTransport:", v7);
    }
  }

}

- (void)nodeController:(id)a3 didRemoveTransport:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CONodeManager executionContext](self, "executionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertDispatchQueue");

  COCoreLogForCategory(15);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager shortDescription](self, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transports");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v55 = v13;
    v56 = 2048;
    v57 = v9;
    v58 = 2048;
    v59 = v8;
    v60 = 2114;
    v61 = v14;
    _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Lost transport %p for node %p. Remaining transports = %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v8, "transports");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v8, "transports");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v17);
          v20 |= objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "supportsLeaderElection");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v19);
    }
    else
    {
      LOBYTE(v20) = 0;
    }

    objc_msgSend(v8, "node");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "remote");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[CONodeManager electionInfo](self, "electionInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ballot");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "candidates");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "containsObject:", v33);

    if (v37 && (v20 & 1) == 0)
    {
      v48 = v10;
      if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
      {
        -[CONodeManager electionInfo](self, "electionInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "leader");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[CONodeManager leader](self, "leader");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "node");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "remote");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v47 = v9;
        v42 = objc_msgSend(v41, "isEqual:", v39);
        -[CONodeManager electionInfo](self, "electionInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "ballot");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v44, "mutableCopy");

        objc_msgSend(v45, "removeCandidate:", v41);
        -[CONodeManager _updateBallot:](self, "_updateBallot:", v45);
        if ((v42 & 1) != 0)
        {
          -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
          -[CONodeManager _resetBallot](self, "_resetBallot");
          -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo");
        }
        else
        {
          -[CONodeManager electionInfo](self, "electionInfo");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[CONodeManager _checkForElectionCompletion:nodeController:](self, "_checkForElectionCompletion:nodeController:", v46, v8);

        }
        v9 = v47;
      }

      v10 = v48;
    }

  }
  else
  {
    COCoreLogForCategory(15);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v24;
      v56 = 2048;
      v57 = v8;
      _os_log_impl(&dword_215E92000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping node %p since we don't have any more transports available", buf, 0x16u);

    }
    objc_msgSend(v10, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", 0x24D4B5978);

    if (v26)
    {
      if (objc_msgSend(v10, "code") == -5001)
        v27 = 18;
      else
        v27 = 20;
      if (objc_msgSend(v10, "code") == -5003)
      {
        objc_msgSend(v10, "underlyingErrors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "domain");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", 0x24D4B4C78))
        {
          v31 = objc_msgSend(v29, "code");

          if (v31 == -6001)
            v27 = 19;
        }
        else
        {

        }
      }
    }
    else
    {
      v27 = 20;
    }
    objc_msgSend(v8, "invalidateWithReason:", v27);
  }

}

- (void)nodeController:(id)a3 didReceiveOnDemandNodeCreationRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CONodeManager ballotBrowser](self, "ballotBrowser");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoveryUsingOnDemandNodeCreationRequest:", v5);

}

- (void)backedOffNodeMovedOutOfElection:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "totalBackedOffTime");
  v6 = -[CONodeManager longestBackOff](self, "longestBackOff");

  if (v5 > v6)
  {
    objc_msgSend(v10, "node");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager setLongestBackOff:](self, "setLongestBackOff:", objc_msgSend(v7, "totalBackedOffTime"));

    objc_msgSend(v10, "node");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remote");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager setLongestBackedOffConstituent:](self, "setLongestBackedOffConstituent:", v9);

  }
}

- (void)_bumpGeneration
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CONodeManager electionInfo](self, "electionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "generation") + 1;

  -[CONodeManager electionInfo](self, "electionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGeneration:", v5);

  COCoreLogForCategory(15);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager shortDescription](self, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager electionInfo](self, "electionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2048;
    v14 = v5;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_215E92000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ bumping generation to %llu. Current leader = %{public}@", (uint8_t *)&v11, 0x20u);

  }
}

- (void)_resetBallot
{
  void *v3;
  void *v4;
  void *v5;
  COBallot *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constituentForMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[COBallot initWithCandidate:]([COBallot alloc], "initWithCandidate:", v5);
  -[CONodeManager electionInfo](self, "electionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBallot:", v6);

  COCoreLogForCategory(15);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager shortDescription](self, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CONodeManager electionInfo](self, "electionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    v16 = 2048;
    v17 = objc_msgSend(v10, "generation");
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting ballot. Current leader = %{public}@. Current generation = %llu", (uint8_t *)&v12, 0x20u);

  }
  -[CONodeManager ballotBrowser](self, "ballotBrowser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearRecords");

}

- (BOOL)_updateBallot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE19E30], "isSlimBallotsEnabled"))
  {
    objc_msgSend(v4, "candidates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      -[CONodeManager nodeForMe](self, "nodeForMe");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "underlyingNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "meConstituent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addCandidate:", v9);

    }
  }
  -[CONodeManager electionInfo](self, "electionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CONodeManager electionInfo](self, "electionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBallot:", v4);

  -[CONodeManager electionInfo](self, "electionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v11, "isEqual:", v14);
  if ((v15 & 1) == 0)
  {
    COCoreLogForCategory(15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeManager electionInfo](self, "electionInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v17;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v14;
      v26 = 2048;
      v27 = objc_msgSend(v18, "generation");
      _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Changing leader from %{public}@ to %{public}@. Current generation = %llu", (uint8_t *)&v20, 0x2Au);

    }
  }

  return v15 ^ 1;
}

- (void)_handleEnqueuedCommandsForLostNode:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  v7 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
  {
    -[CONodeManager electionInfo](self, "electionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CONodeManager leader](self, "leader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "node");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  objc_msgSend(v7, "sentElements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v7, "sentElements");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "removeAllObjects");
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke_2;
    v21[3] = &unk_24D4B28A8;
    v22 = v6;
    v18 = v17;
    v23 = v18;
    v19 = v6;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v21);
    COCoreLogForCategory(15);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[CONodeManager _handleEnqueuedCommandsForLostNode:error:].cold.1();

    -[CONodeManager setLeaderCommands:](self, "setLeaderCommands:", v18);
  }
  else
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke;
    v24[3] = &unk_24D4B2880;
    v25 = v6;
    v18 = v6;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v24);

  }
}

uint64_t __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, a2, 0, *(_QWORD *)(a1 + 32));
}

void __58__CONodeManager__handleEnqueuedCommandsForLostNode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v8, 0, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = (void *)MEMORY[0x2199F3D40](v5);
    objc_msgSend(v6, "setObject:forKey:", v7, v8);

  }
}

- (void)_reportLostLeader:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void (*v15)(_QWORD *, __CFString *, _QWORD *);
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "leaderElectionConfigured");

  if (v8)
  {
    -[CONodeManager executionContext](self, "executionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = a4 - 6;
    if ((unint64_t)(a4 - 6) <= 0xE && ((0x7D67u >> v11) & 1) != 0)
      v12 = (id)*off_24D4B29B8[v11];
    else
      v12 = 0;
    -[CONodeManager executionContext](self, "executionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "analyticsRecorder");
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __46__CONodeManager__reportLostLeader_withReason___block_invoke;
    v18[3] = &unk_24D4B28D0;
    v19 = v12;
    v20 = v10;
    v21 = v6;
    v15 = (void (*)(_QWORD *, __CFString *, _QWORD *))v14[2];
    v16 = v10;
    v17 = v12;
    v15(v14, CFSTR("com.apple.CoordinationCore.MeshLostLeader"), v18);

  }
}

id __46__CONodeManager__reportLostLeader_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), 0x24D4B4878);
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), 0x24D4B5418);
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x24D4B54D8))
  {
    objc_msgSend(*(id *)(a1 + 48), "rapportTransport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "currentPingTimeout");
      objc_msgSend(v5, "numberWithDouble:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v6, 0x24D4B54D8);

    }
  }
  return v2;
}

- (void)setElectionPrevious:(unint64_t)a3
{
  if (self->_electionPrevious != a3)
  {
    if (!a3)
      self->_electionEnd = 0;
    self->_electionPrevious = a3;
  }
}

- (void)setElectionStart:(unint64_t)a3
{
  if (self->_electionStart != a3)
  {
    -[CONodeManager setElectionElapsedTimer:](self, "setElectionElapsedTimer:", 0);
    -[CONodeManager setElectionPrevious:](self, "setElectionPrevious:", self->_electionStart);
    self->_electionStart = a3;
  }
}

- (void)setElectionEnd:(unint64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  id v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  COConstituent *longestBackedOffConstituent;
  void *v26;
  void *v27;
  _BYTE *v28;
  _BYTE *v29;
  _QWORD handler[4];
  id v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33[6];
  id location;
  _QWORD v35[4];
  id v36;
  CONodeManager *v37;
  double v38;
  void *v39;
  char *v40;
  char *v41;
  double v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (self->_electionEnd != a3)
  {
    v28 = -[CONodeManager electionPrevious](self, "electionPrevious");
    if (v28)
    {
      v29 = -[CONodeManager electionStart](self, "electionStart");
      -[CONodeManager activeNodesWithSelfNode:](self, "activeNodesWithSelfNode:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_electionEnd)
        v6 = (double)(unint64_t)(v29 - v28) / 1000000000.0;
      else
        v6 = 0.0;
      -[CONodeManager executionContext](self, "executionContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "label");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)objc_msgSend(v5, "count");
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v8 = v5;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v45 != v13)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "underlyingNode");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "connectionType") == 2)
            {
              ++v11;
              if (objc_msgSend(v15, "discoveryType") == 2)
                ++v10;
            }
            if (objc_msgSend(v15, "totalBackedOffTime") > v9)
              v9 = objc_msgSend(v15, "totalBackedOffTime");

          }
          v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v12);
      }

      -[CONodeManager executionContext](self, "executionContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "analyticsRecorder");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __32__CONodeManager_setElectionEnd___block_invoke;
      v35[3] = &unk_24D4B28F8;
      v38 = (double)(a3 - (unint64_t)v29) / 1000000.0;
      v39 = v27;
      v40 = v11;
      v41 = v10;
      v42 = v6;
      v18 = v26;
      v43 = v9;
      v36 = v18;
      v37 = self;
      ((void (**)(_QWORD, const __CFString *, _QWORD *))v17)[2](v17, CFSTR("com.apple.CoordinationCore.MeshElection"), v35);
      self->_electionEnd = a3;
      -[CONodeManager electionElapsedTimer](self, "electionElapsedTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
        -[CONodeManager executionContext](self, "executionContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dispatchQueue");
        v22 = objc_claimAutoreleasedReturnValue();

        v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v22);
        if (v23)
        {
          v24 = dispatch_walltime(0, 86400000000000);
          dispatch_source_set_timer(v23, v24, 0x4E94914F0000uLL, 0);
          objc_initWeak(&location, self);
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = __32__CONodeManager_setElectionEnd___block_invoke_2;
          handler[3] = &unk_24D4B2920;
          objc_copyWeak(v33, &location);
          v33[1] = v28;
          v33[2] = v29;
          v32 = v17;
          v33[3] = v27;
          v33[4] = v11;
          v33[5] = v10;
          v31 = v18;
          dispatch_source_set_event_handler(v23, handler);
          -[CONodeManager setElectionElapsedTimer:](self, "setElectionElapsedTimer:", v23);

          objc_destroyWeak(v33);
          objc_destroyWeak(&location);
        }

      }
    }
  }
  longestBackedOffConstituent = self->_longestBackedOffConstituent;
  self->_longestBackOff = 0;
  self->_longestBackedOffConstituent = 0;

}

id __32__CONodeManager_setElectionEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x24BDAC8D0];
  v14[0] = 0x24D4B5458;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v3;
  v14[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v4;
  v14[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v14[4] = 0x24D4B5438;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v15[4] = v6;
  v15[5] = v7;
  v14[5] = 0x24D4B5418;
  v14[6] = 0x24D4B5698;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = *(_QWORD **)(a1 + 40);
  if (v11[12])
  {
    objc_msgSend(v11, "_constituentCharacteristics:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, 0x24D4B56B8);

  }
  return v10;
}

void __32__CONodeManager_setElectionEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 == objc_msgSend(WeakRetained, "electionPrevious"))
    {
      v5 = *(_QWORD *)(a1 + 64);
      if (v5 == objc_msgSend(v3, "electionStart"))
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __32__CONodeManager_setElectionEnd___block_invoke_3;
        v7[3] = &unk_24D4B1590;
        v10 = *(_OWORD *)(a1 + 72);
        v11 = *(_QWORD *)(a1 + 88);
        v6 = *(_QWORD *)(a1 + 40);
        v8 = *(id *)(a1 + 32);
        v9 = v3;
        (*(void (**)(uint64_t, const __CFString *, _QWORD *))(v6 + 16))(v6, CFSTR("com.apple.CoordinationCore.MeshElection"), v7);

      }
    }
  }

}

id __32__CONodeManager_setElectionEnd___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x24BDAC8D0];
  v13[0] = &unk_24D4CF3A8;
  v12[0] = 0x24D4B5458;
  v12[1] = 0x24D4B5478;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = 0x24D4B5498;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = 0x24D4B54B8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  v13[4] = &unk_24D4CF460;
  v12[4] = 0x24D4B5438;
  v12[5] = 0x24D4B5418;
  v5 = a1[5];
  v13[5] = a1[4];
  v12[6] = 0x24D4B5698;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(v5 + 88));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (_QWORD *)a1[5];
  if (v9[12])
  {
    objc_msgSend(v9, "_constituentCharacteristics:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, 0x24D4B56B8);

  }
  return v8;
}

- (void)setElectionElapsedTimer:(id)a3
{
  OS_dispatch_source *v5;
  NSObject *v6;
  OS_dispatch_source **p_electionElapsedTimer;
  OS_dispatch_source *electionElapsedTimer;
  OS_dispatch_source *v9;

  v5 = (OS_dispatch_source *)a3;
  electionElapsedTimer = self->_electionElapsedTimer;
  p_electionElapsedTimer = &self->_electionElapsedTimer;
  v6 = electionElapsedTimer;
  v9 = v5;
  if (electionElapsedTimer != v5)
  {
    if (v6)
      dispatch_source_cancel(v6);
    objc_storeStrong((id *)p_electionElapsedTimer, a3);
    if (*p_electionElapsedTimer)
      dispatch_resume((dispatch_object_t)*p_electionElapsedTimer);
  }

}

- (void)_informControllersAboutNewElectionInfo
{
  void *v3;
  CONodeManager *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[CONodeManager executionContext](self, "executionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertDispatchQueue");

  v4 = self;
  objc_sync_enter(v4);
  -[CONodeManager nodeControllers](v4, "nodeControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CONodeManager__informControllersAboutNewElectionInfo__block_invoke;
  v7[3] = &unk_24D4B2948;
  v7[4] = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__CONodeManager__informControllersAboutNewElectionInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "electionInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateElectionInfo:", v5);

}

- (void)_handleDiscoveryRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CONodeManager *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CONodeController *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  CONodeManager *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDispatchQueue");

  objc_msgSend(v4, "IDSIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__13;
  v31 = __Block_byref_object_dispose__13;
  v32 = 0;
  v7 = self;
  objc_sync_enter(v7);
  -[CONodeManager nodeControllers](v7, "nodeControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v28[5];
  v28[5] = v9;

  objc_sync_exit(v7);
  v11 = (void *)v28[5];
  if (v11)
  {
    objc_msgSend(v11, "addDiscoveryRecord:", v4);
  }
  else
  {
    v12 = [CONodeController alloc];
    -[CONodeManager executionContext](v7, "executionContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CONodeController initWithDiscoveryRecord:executionContext:](v12, "initWithDiscoveryRecord:executionContext:", v4, v13);
    v15 = (void *)v28[5];
    v28[5] = v14;

    COCoreLogForCategory(15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](v7, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v28[5];
      *(_DWORD *)buf = 138543874;
      v34 = v17;
      v35 = 2048;
      v36 = v18;
      v37 = 2114;
      v38 = v4;
      _os_log_impl(&dword_215E92000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ created NodeController %p with record %{public}@", buf, 0x20u);

    }
    objc_msgSend((id)v28[5], "setDelegate:", v7);
    objc_msgSend((id)v28[5], "setAcceptableCommands:", v7->_acceptableCommands);
    v19 = v7;
    objc_sync_enter(v19);
    -[CONodeManager nodeControllers](v19, "nodeControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v28[5], v6);

    objc_sync_exit(v19);
    objc_initWeak((id *)buf, v19);
    v21 = (void *)v28[5];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __40__CONodeManager__handleDiscoveryRecord___block_invoke;
    v22[3] = &unk_24D4B2970;
    objc_copyWeak(&v26, (id *)buf);
    v23 = v4;
    v24 = v6;
    v25 = &v27;
    objc_msgSend(v21, "activateWithCompletionHandler:", v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v27, 8);

}

void __40__CONodeManager__handleDiscoveryRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    COCoreLogForCategory(15);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __40__CONodeManager__handleDiscoveryRecord___block_invoke_cold_1(WeakRetained);

      v6 = WeakRetained;
      objc_sync_enter(v6);
      -[NSObject nodeControllers](v6, "nodeControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

      objc_sync_exit(v6);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully activated NodeController %p", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)_handleLostRecord:(id)a3
{
  void *v4;
  void *v5;
  CONodeManager *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertDispatchQueue");

  objc_msgSend(v9, "IDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[CONodeManager nodeControllers](v6, "nodeControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  if (v8)
    objc_msgSend(v8, "removeDiscoveryRecord:", v9);

}

- (void)_nodeStopped:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  CONodeManager *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "node");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "IDSIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(15);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager shortDescription](self, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2048;
    v16 = v6;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %p [IDS: %@] from our list", (uint8_t *)&v13, 0x20u);

  }
  v11 = self;
  objc_sync_enter(v11);
  -[CONodeManager nodeControllers](v11, "nodeControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v8);

  objc_sync_exit(v11);
  -[CONodeManager _nodeBecameInactive:withReason:](v11, "_nodeBecameInactive:withReason:", v6, a4);

}

- (void)_nodeBecameInactive:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CONodeManager executionContext](self, "executionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDispatchQueue");

  objc_msgSend(v6, "node");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remote");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CONodeManager executionContext](self, "executionContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "leaderElectionConfigured");

    if (v11)
    {
      if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
      {
        -[CONodeManager electionInfo](self, "electionInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "leader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[CONodeManager leader](self, "leader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", 0x24D4B5058, -4101, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeManager _handleEnqueuedCommandsForLostNode:error:](self, "_handleEnqueuedCommandsForLostNode:error:", v6, v14);

      if (objc_msgSend(v9, "isEqual:", v13))
      {
        COCoreLogForCategory(15);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          -[CONodeManager shortDescription](self, "shortDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v16;
          _os_log_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ leader lost", (uint8_t *)&v22, 0xCu);

        }
        -[CONodeManager _bumpGeneration](self, "_bumpGeneration");
        -[CONodeManager _resetBallot](self, "_resetBallot");
        -[CONodeManager _informControllersAboutNewElectionInfo](self, "_informControllersAboutNewElectionInfo");
        -[CONodeManager _reportLostLeader:withReason:](self, "_reportLostLeader:withReason:", v6, a4);
      }
      else
      {
        -[CONodeManager electionInfo](self, "electionInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ballot");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v6, "node");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "remote");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeCandidate:", v21);

        -[CONodeManager _updateBallot:](self, "_updateBallot:", v19);
      }

    }
    objc_msgSend(v6, "markInactive");
  }

}

- (void)_informDelegateAboutNodeAddition:(id)a3 oldState:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  COMeshNode *v10;
  void *v11;
  COMeshNode *v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if ((unint64_t)a4 <= 2)
  {
    v13 = v6;
    v8 = objc_msgSend(v6, "isLocalNodeController");
    v7 = v13;
    if ((v8 & 1) == 0)
    {
      -[CONodeManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = [COMeshNode alloc];
        objc_msgSend(v13, "node");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[COMeshNode initWithNode:](v10, "initWithNode:", v11);

        objc_msgSend(v9, "didAddNode:", v12);
      }

      v7 = v13;
    }
  }

}

- (void)_informDelegateAboutNodeRemoval:(id)a3 oldState:(int64_t)a4
{
  id v6;
  void *v7;
  COMeshNode *v8;
  void *v9;
  COMeshNode *v10;
  id v11;

  v6 = a3;
  if ((unint64_t)(a4 - 5) <= 1)
  {
    v11 = v6;
    -[CONodeManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = [COMeshNode alloc];
      objc_msgSend(v11, "node");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[COMeshNode initWithNode:](v8, "initWithNode:", v9);

      objc_msgSend(v7, "didRemoveNode:", v10);
    }

    v6 = v11;
  }

}

- (void)_nodeStartedElection:(id)a3 withElectionInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  CONodeManager *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CONodeManager executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  if (objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled"))
  {
    COCoreLogForCategory(15);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CONodeManager shortDescription](self, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_215E92000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ node started election %@", (uint8_t *)&v19, 0x16u);

    }
  }
  else if (objc_msgSend(MEMORY[0x24BE19E30], "isSlimBallotsEnabled"))
  {
    -[CONodeManager executionContext](self, "executionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constituentForMe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "node");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "meConstituent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v14) && objc_msgSend(v7, "generation") == 1)
    {

    }
    else
    {
      -[CONodeManager electionInfo](self, "electionInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "isEqual:", v15);

      if ((v16 & 1) != 0)
        goto LABEL_15;
    }
  }
  v17 = self;
  objc_sync_enter(v17);
  -[CONodeManager setLeader:](v17, "setLeader:", 0);
  objc_sync_exit(v17);

  if (!-[CONodeManager isInElection](v17, "isInElection"))
  {
    -[CONodeManager setElectionStart:](v17, "setElectionStart:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW));
    -[CONodeManager setIsInElection:](v17, "setIsInElection:", 1);
  }
  -[CONodeManager delegate](v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v18, "didStartElection");

LABEL_15:
}

- (void)_checkForElectionCompletion:(id)a3 nodeController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CONodeManager *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  CONodeManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CONodeManager executionContext](self, "executionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDispatchQueue");

  if (-[CONodeManager isInElection](self, "isInElection"))
  {
    v9 = self;
    objc_sync_enter(v9);
    -[CONodeManager nodeControllers](v9, "nodeControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_sync_exit(v9);
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v12 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke;
    v33[3] = &unk_24D4B2808;
    v34 = v6;
    v35 = &v36;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v33);
    if (*((_BYTE *)v37 + 24))
    {
      COCoreLogForCategory(15);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[CONodeManager shortDescription](v9, "shortDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v14;
        _os_log_impl(&dword_215E92000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ all nodes have finished election. Moving to state processing", buf, 0xCu);

      }
      -[CONodeManager _logElectionSummary](v9, "_logElectionSummary");
      -[CONodeManager setIsInElection:](v9, "setIsInElection:", 0);
      -[CONodeManager setElectionEnd:](v9, "setElectionEnd:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW));
      v15 = v9;
      objc_sync_enter(v15);
      -[CONodeManager electionInfo](v15, "electionInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ballot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "candidates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[CONodeManager setLeader:](v15, "setLeader:", v19);
      objc_sync_exit(v15);

      -[CONodeManager delegate](v15, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v20, "didCompleteElection");
      -[CONodeManager electionInfo](v15, "electionInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ballot");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "candidates");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[CONodeManager nodeControllerForConstituent:](v15, "nodeControllerForConstituent:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CONodeManager leaderCommands](v15, "leaderCommands");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      -[CONodeManager leaderCommands](v15, "leaderCommands");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeAllObjects");

      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke_60;
      v31[3] = &unk_24D4B2880;
      v29 = v25;
      v32 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v31);

    }
    _Block_object_dispose(&v36, 8);

  }
  else if (objc_msgSend(v7, "isLocalNodeController"))
  {
    -[CONodeManager delegate](self, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v30, "didCompleteElection");

  }
}

void __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "node");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isActive"))
  {
LABEL_7:

    v8 = v12;
    goto LABEL_10;
  }
  v7 = objc_msgSend(v12, "supportsLeaderElection");

  v8 = v12;
  if (v7)
  {
    objc_msgSend(v12, "node");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "state") != 14)
    {

      v8 = v12;
LABEL_9:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_10;
    }
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v12, "node");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastElectionInfoSent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasSameGenerationAndLeader:", *(_QWORD *)(a1 + 32));

      v8 = v12;
      if ((v11 & 1) != 0)
        goto LABEL_10;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_10:

}

uint64_t __60__CONodeManager__checkForElectionCompletion_nodeController___block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendCommand:withCompletionHandler:", a2, a3);
}

- (id)_constituentCharacteristics:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = objc_msgSend(v4, "device");
  v6 = objc_msgSend(v4, "flags");

  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d, %llu"), v5, v6);
}

- (void)_logElectionSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CONodeManager *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CONodeManager executionContext](self, "executionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "meshName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CONodeManager electionInfo](self, "electionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "generation");

  -[CONodeManager electionInfo](self, "electionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ballot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  objc_sync_enter(v13);
  -[CONodeManager nodeControllers](v13, "nodeControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_sync_exit(v13);
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __36__CONodeManager__logElectionSummary__block_invoke;
  v32[3] = &unk_24D4B2998;
  v16 = v5;
  v33 = v16;
  v17 = v4;
  v34 = v17;
  v18 = v3;
  v35 = v18;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v32);
  COCoreLogForCategory(8);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager executionContext](v13, "executionContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "meshControllerDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v21;
    v38 = 2114;
    v39 = v7;
    v40 = 2048;
    v41 = v9;
    v42 = 2114;
    v43 = v31;
    _os_log_impl(&dword_215E92000, v19, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Completed Election(%llu). Leader is %{public}@", buf, 0x2Au);

  }
  COCoreLogForCategory(8);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager executionContext](v13, "executionContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "meshControllerDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v24;
    v38 = 2114;
    v39 = v7;
    v40 = 2048;
    v41 = v9;
    v42 = 2114;
    v43 = v18;
    _os_log_impl(&dword_215E92000, v22, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Candidate summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
  COCoreLogForCategory(8);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager executionContext](v13, "executionContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "meshControllerDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v27;
    v38 = 2114;
    v39 = v7;
    v40 = 2048;
    v41 = v9;
    v42 = 2114;
    v43 = v16;
    _os_log_impl(&dword_215E92000, v25, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Dormant trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
  COCoreLogForCategory(8);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    -[CONodeManager executionContext](v13, "executionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "meshControllerDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v30;
    v38 = 2114;
    v39 = v7;
    v40 = 2048;
    v41 = v9;
    v42 = 2114;
    v43 = v17;
    _os_log_impl(&dword_215E92000, v28, OS_LOG_TYPE_DEFAULT, "[m:%@] %{public}@ : Discovered trackers summary for Election(%llu)\n%{public}@", buf, 0x2Au);

  }
}

void __36__CONodeManager__logElectionSummary__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "node");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5)
  {
    objc_msgSend(v12, "node");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

    if (v7 == 2)
    {
      v8 = (void *)a1[4];
    }
    else
    {
      objc_msgSend(v12, "node");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "state");

      if (v10 == 1)
        v8 = (void *)a1[5];
      else
        v8 = (void *)a1[6];
    }
    objc_msgSend(v12, "electionSummaryDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v11);

  }
}

- (CONodeManagerDelegate)delegate
{
  return (CONodeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (COExecutionContext)executionContext
{
  return self->_executionContext;
}

- (void)setExecutionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLeader:(id)a3
{
  objc_storeStrong((id *)&self->_leader, a3);
}

- (NSSet)acceptableCommands
{
  return self->_acceptableCommands;
}

- (void)setAcceptableCommands:(id)a3
{
  objc_storeStrong((id *)&self->_acceptableCommands, a3);
}

- (COBallotBrowser)ballotBrowser
{
  return self->_ballotBrowser;
}

- (void)setBallotBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_ballotBrowser, a3);
}

- (OS_dispatch_source)electionElapsedTimer
{
  return self->_electionElapsedTimer;
}

- (unint64_t)electionPrevious
{
  return self->_electionPrevious;
}

- (unint64_t)electionStart
{
  return self->_electionStart;
}

- (unint64_t)electionEnd
{
  return self->_electionEnd;
}

- (unint64_t)longestBackOff
{
  return self->_longestBackOff;
}

- (void)setLongestBackOff:(unint64_t)a3
{
  self->_longestBackOff = a3;
}

- (COConstituent)longestBackedOffConstituent
{
  return self->_longestBackedOffConstituent;
}

- (void)setLongestBackedOffConstituent:(id)a3
{
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, a3);
}

- (BOOL)isInElection
{
  return self->_isInElection;
}

- (void)setIsInElection:(BOOL)a3
{
  self->_isInElection = a3;
}

- (NSMutableDictionary)browsersObservers
{
  return self->_browsersObservers;
}

- (NSMutableDictionary)nodeControllers
{
  return self->_nodeControllers;
}

- (void)setNodeControllers:(id)a3
{
  objc_storeStrong((id *)&self->_nodeControllers, a3);
}

- (COElectionInfo)electionInfo
{
  return self->_electionInfo;
}

- (void)setElectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_electionInfo, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)pendingDiscoveryRecords
{
  return self->_pendingDiscoveryRecords;
}

- (void)setPendingDiscoveryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDiscoveryRecords, a3);
}

- (NSMutableDictionary)leaderCommands
{
  return self->_leaderCommands;
}

- (void)setLeaderCommands:(id)a3
{
  objc_storeStrong((id *)&self->_leaderCommands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderCommands, 0);
  objc_storeStrong((id *)&self->_pendingDiscoveryRecords, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_electionInfo, 0);
  objc_storeStrong((id *)&self->_nodeControllers, 0);
  objc_storeStrong((id *)&self->_browsersObservers, 0);
  objc_storeStrong((id *)&self->_longestBackedOffConstituent, 0);
  objc_storeStrong((id *)&self->_electionElapsedTimer, 0);
  objc_storeStrong((id *)&self->_ballotBrowser, 0);
  objc_storeStrong((id *)&self->_acceptableCommands, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __22__CONodeManager_start__block_invoke_4_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ failed to start browser %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

- (void)nodeController:didReceiveCommand:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ received a command %@ but has no delegate to deliver to", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)nodeController:didReceiveRequest:callback:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ received a request %@ but has no delegate to deliver to", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_handleEnqueuedCommandsForLostNode:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v1, "shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "count");
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v3, v4, "%{public}@ lost leader. Re-queuing %lu elements", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_11();
}

void __40__CONodeManager__handleDiscoveryRecord___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_215E92000, v2, v3, "%{public}@ failed to create a NodeController using Record %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_11();
}

@end
