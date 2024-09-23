@implementation BLTDebugObserverHolder

+ (void)startWithWKAppList:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__BLTDebugObserverHolder_startWithWKAppList___block_invoke;
  block[3] = &unk_24D7621F8;
  v8 = v4;
  v9 = a1;
  v5 = startWithWKAppList__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&startWithWKAppList__onceToken, block);

}

void __45__BLTDebugObserverHolder_startWithWKAppList___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (BLTIsDebugOrInternalBuild())
  {
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithWKAppList:", *(_QWORD *)(a1 + 32));
    v3 = (void *)startWithWKAppList____sharedInstance;
    startWithWKAppList____sharedInstance = v2;

  }
}

- (BLTDebugObserverHolder)init
{
  return -[BLTDebugObserverHolder initWithWKAppList:](self, "initWithWKAppList:", 0);
}

- (BLTDebugObserverHolder)initWithWKAppList:(id)a3
{
  id v4;
  BLTDebugObserverHolder *v5;
  BLTDebugObserverHolder *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BBObserver *observer;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLTDebugObserverHolder;
  v5 = -[BLTDebugObserverHolder init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_wkAppList, v4);
    BLTWorkQueue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BLTWorkQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLTBBObserver surrogateWithQueue:calloutQueue:](BLTBBObserver, "surrogateWithQueue:calloutQueue:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    observer = v6->_observer;
    v6->_observer = (BBObserver *)v9;

    -[BBObserver setDelegate:](v6->_observer, "setDelegate:", v6);
    -[BBObserver setObserverFeed:](v6->_observer, "setObserverFeed:", 32878);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BBObserver invalidate](self->_observer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BLTDebugObserverHolder;
  -[BLTDebugObserverHolder dealloc](&v3, sel_dealloc);
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  id WeakRetained;
  const char *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v8 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a7;
  blt_general_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "sectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "publisherMatchID");
    v24 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v15 = "YES";
    else
      v15 = "NO";
    +[BLTPairedSyncCoordinator syncState](BLTPairedSyncCoordinator, "syncState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isInitialSyncComplete"))
      v17 = "YES";
    else
      v17 = "NO";
    WeakRetained = objc_loadWeakRetained((id *)&self->_wkAppList);
    *(_DWORD *)buf = 138413570;
    if (objc_msgSend(WeakRetained, "isLoaded"))
      v19 = "YES";
    else
      v19 = "NO";
    v27 = v14;
    v28 = 2112;
    v29 = v25;
    v30 = 2048;
    v31 = a5;
    v32 = 2080;
    v33 = v15;
    v11 = v24;
    v34 = 2080;
    v35 = v17;
    v36 = 2080;
    v37 = v19;
    _os_log_impl(&dword_2173D9000, v13, OS_LOG_TYPE_INFO, "Bulletin in section %@ with matchID %@ sent to observers now on feed %lu with lightsandsirens: %s initSyncComplete: %s wkAppsLoaded: %s", buf, 0x3Eu);

  }
  v12[2](v12, 0);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 0x806E) != 0)
  {
    kdebug_trace();
    if (v8)
    {
      blt_general_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "publishDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v22);
        *(_DWORD *)buf = 134217984;
        v27 = v23;
        _os_log_impl(&dword_2173D9000, v21, OS_LOG_TYPE_INFO, "Bulletin raised after %f seconds from 'publish' date", buf, 0xCu);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wkAppList);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
