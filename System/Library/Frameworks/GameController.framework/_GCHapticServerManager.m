@implementation _GCHapticServerManager

+ (id)sharedInstance
{
  if (+[_GCHapticServerManager sharedInstance]::onceToken != -1)
    dispatch_once(&+[_GCHapticServerManager sharedInstance]::onceToken, &__block_literal_global_16);
  return (id)+[_GCHapticServerManager sharedInstance]::hapticServerManager;
}

- (void)dealloc
{
  objc_super v3;

  -[BKSApplicationStateMonitor invalidate](self->_appMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_GCHapticServerManager;
  -[_GCHapticServerManager dealloc](&v3, sel_dealloc);
}

- (_GCHapticServerManager)init
{
  _GCHapticServerManager *v2;
  uint64_t v3;
  NSMutableDictionary *clients;
  uint64_t v5;
  NSMutableDictionary *logicalHapticDevices;
  uint64_t v7;
  NSMutableDictionary *clientInvalidationHandlers;
  uint64_t v9;
  NSMutableDictionary *hapticPlayers;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *runloopQueue;
  void *v14;
  BKSApplicationStateMonitor *v15;
  BKSApplicationStateMonitor *appMonitor;
  BKSApplicationStateMonitor *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_GCHapticServerManager;
  v2 = -[_GCHapticServerManager init](&v22, sel_init);
  if (v2)
  {
    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    logicalHapticDevices = v2->_logicalHapticDevices;
    v2->_logicalHapticDevices = (NSMutableDictionary *)v5;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    clientInvalidationHandlers = v2->_clientInvalidationHandlers;
    v2->_clientInvalidationHandlers = (NSMutableDictionary *)v7;

    +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    hapticPlayers = v2->_hapticPlayers;
    v2->_hapticPlayers = (NSMutableDictionary *)v9;

    v2->_nextClientID = 1;
    v2->_tickLengthSeconds = 0.06;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.gamecontrollerd.haptics.runloop", v11);
    runloopQueue = v2->_runloopQueue;
    v2->_runloopQueue = (OS_dispatch_queue *)v12;

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel_logicalDeviceWasUnregistered_, CFSTR("GCLogicalDeviceWasUnregisteredNotification"), 0);

    objc_initWeak(&location, v2);
    v15 = (BKSApplicationStateMonitor *)objc_alloc_init((Class)&off_254DFBD70);
    appMonitor = v2->_appMonitor;
    v2->_appMonitor = v15;

    -[BKSApplicationStateMonitor updateInterestedStates:](v2->_appMonitor, "updateInterestedStates:", 14);
    v17 = v2->_appMonitor;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __30___GCHapticServerManager_init__block_invoke;
    v19[3] = &unk_24D2B4698;
    objc_copyWeak(&v20, &location);
    -[BKSApplicationStateMonitor setHandler:](v17, "setHandler:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (BOOL)acceptNewConnection:(id)a3 fromHapticsEnabledApp:(id)a4
{
  id v6;
  _GCHapticClientConnection *v7;
  void *nextClientID;
  void *v9;
  uint64_t v10;
  void *v11;
  BKSApplicationStateMonitor *appMonitor;
  uint64_t v13;
  NSObject *runloopQueue;
  id v15;
  NSObject *v17;
  void *v18;
  id val;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24[2];
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id from;
  id location[4];

  location[2] = *(id *)MEMORY[0x24BDAC8D0];
  v20 = a3;
  v6 = a4;
  v18 = v6;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v20;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "Accepting haptics-enabled app connection %@", (uint8_t *)location, 0xCu);
    }

    v6 = v18;
  }
  v7 = -[_GCHapticClientConnection initWithConnection:fromProcess:]([_GCHapticClientConnection alloc], "initWithConnection:fromProcess:", v20, v6);
  objc_msgSend(v6, "addConnection:", v7);
  nextClientID = (void *)self->_nextClientID;
  self->_nextClientID = (unint64_t)nextClientID + 1;
  +[_GCControllerManager sharedInstance](_GCControllerManagerServer, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GCHapticClientProxy clientProxyWithConnection:server:clientID:](_GCHapticClientProxy, "clientProxyWithConnection:server:clientID:", v7, v9, nextClientID);
  val = (id)objc_claimAutoreleasedReturnValue();

  -[_GCHapticClientConnection setServer:](v7, "setServer:", val);
  -[GCIPCRemoteConnection resume](v7, "resume");
  objc_initWeak(location, self);
  objc_initWeak(&from, val);
  v10 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke;
  v28[3] = &unk_24D2B46C0;
  objc_copyWeak(&v29, location);
  objc_copyWeak(&v30, &from);
  v11 = (void *)MEMORY[0x2199DEBB0](v28);
  appMonitor = self->_appMonitor;
  v13 = objc_msgSend(v20, "processIdentifier");
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_13;
  v25[3] = &unk_24D2B46E8;
  objc_copyWeak(&v26, location);
  objc_copyWeak(&v27, &from);
  -[BKSApplicationStateMonitor applicationInfoForPID:completion:](appMonitor, "applicationInfoForPID:completion:", v13, v25);
  runloopQueue = self->_runloopQueue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __68___GCHapticServerManager_acceptNewConnection_fromHapticsEnabledApp___block_invoke_15;
  block[3] = &unk_24D2B4710;
  objc_copyWeak(&v23, location);
  objc_copyWeak(v24, &from);
  v24[1] = nextClientID;
  block[4] = self;
  v22 = v11;
  v15 = v11;
  dispatch_async(runloopQueue, block);

  objc_destroyWeak(v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return 1;
}

- (void)removeHapticClient:(id)a3
{
  id v4;
  NSObject *runloopQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  runloopQueue = self->_runloopQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45___GCHapticServerManager_removeHapticClient___block_invoke;
  v7[3] = &unk_24D2B4670;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(runloopQueue, v7);

}

- (void)hapticClientProxyInitialized:(id)a3
{
  id v4;
  NSMutableDictionary *logicalHapticDevices;
  void *v6;
  _GCHapticLogicalDevice *v7;
  _GCHapticLogicalDevice *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v4 = a3;
  logicalHapticDevices = self->_logicalHapticDevices;
  v12 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](logicalHapticDevices, "objectForKey:", v6);
  v7 = (_GCHapticLogicalDevice *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [_GCHapticLogicalDevice alloc];
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_GCHapticLogicalDevice initWithIdentifier:clientConnection:](v8, "initWithIdentifier:clientConnection:", v9, v12);

    v10 = self->_logicalHapticDevices;
    objc_msgSend(v12, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7, v11);

  }
  -[_GCHapticLogicalDevice registerHapticClient:](v7, "registerHapticClient:", v12);
  -[_GCHapticServerManager spawnInputThread](self, "spawnInputThread");

}

- (void)spawnInputThread
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_running)
  {
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_DEFAULT, "First client connected, spawning input thread...", v4, 2u);
      }

    }
    +[NSThread detachNewThreadSelector:toTarget:withObject:](&off_254DF2490, "detachNewThreadSelector:toTarget:withObject:", sel_enterRunloop, self, 0);
  }
}

- (void)logicalDeviceWasUnregistered:(id)a3
{
  id v4;
  NSObject *runloopQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[4];
  id v11;
  _GCHapticServerManager *v12;
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
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  runloopQueue = self->_runloopQueue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke;
  block[3] = &unk_24D2B4760;
  v7 = v4;
  v11 = v7;
  v12 = self;
  v13 = &v14;
  dispatch_sync(runloopQueue, block);
  if (v15[5])
  {
    v8 = self->_runloopQueue;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __55___GCHapticServerManager_logicalDeviceWasUnregistered___block_invoke_23;
    v9[3] = &unk_24D2B4788;
    v9[4] = self;
    v9[5] = &v14;
    dispatch_sync(v8, v9);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)scheduleCommand:(const void *)a3
{
  NSMutableDictionary *hapticPlayers;
  void *v5;
  id v6;

  hapticPlayers = self->_hapticPlayers;
  +[NSNumber numberWithUnsignedLong:](&off_254DED908, "numberWithUnsignedLong:", *((_QWORD *)a3 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hapticPlayers, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scheduleCommand:", a3);
}

- (BOOL)readClientDataForStartTime:(double)a3 endTime:(double)a4
{
  NSMutableDictionary *v6;
  char v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *logicalHapticDevices;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  HapticCommand v26;
  uint8_t buf[4];
  double var2;
  __int16 v29;
  int var1;
  __int16 v31;
  int var3;
  _BYTE v33[128];
  HapticCommand v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v34.var0 = (MessageHeader)168;
  v34.var2 = 0.0;
  v34.var3 = -1;
  v34.var4 = -1;
  memset(&v34.var5, 0, 76);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_clients;
  v7 = 0;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 134218496;
    v21 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11), v21, (_QWORD)v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        logicalHapticDevices = self->_logicalHapticDevices;
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](logicalHapticDevices, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(logicalHapticDevices) = v15 == 0;

        if ((logicalHapticDevices & 1) == 0
          && objc_msgSend(v12, "running")
          && (objc_msgSend(v12, "stopping") & 1) == 0)
        {
          while (HapticSharedMemory::readCommand((HapticSharedMemory *)objc_msgSend(v12, "sharedMemory"), &v34))
          {
            if (v34.var0.var1 == 6)
            {
              if (gc_isInternalBuild())
              {
                getGCHapticsLogger();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "", buf, 2u);
                }

              }
              if (gc_isInternalBuild())
              {
                getGCHapticsLogger();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v21;
                  var2 = v34.var2;
                  v29 = 1024;
                  var1 = v34.var0.var1;
                  v31 = 1024;
                  var3 = v34.var3;
                  _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_INFO, "StartEventList from client: time: %.3f type: %u chanID: %d", buf, 0x18u);
                }

              }
              v26 = v34;
              v7 = 1;
              -[_GCHapticServerManager readListCommand:client:renderTime:](self, "readListCommand:client:renderTime:", &v26, v12, a3);
            }
            else if (v34.var0.var1 == 9)
            {
              v7 = 1;
              if (gc_isInternalBuild())
              {
                getGCHapticsLogger();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_INFO, "Found StartParamCurveList outside of event list!", buf, 2u);
                }

              }
            }
            else
            {
              v7 = 1;
              -[_GCHapticServerManager scheduleCommand:](self, "scheduleCommand:", &v34);
            }
          }
        }

        ++v11;
      }
      while (v11 != v8);
      v19 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      v8 = v19;
    }
    while (v19);
  }

  return v7 & 1;
}

- (void)processScheduledCommandsForStartTime:(double)a3 endTime:(double)a4
{
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  id v11;
  int v12;
  unint64_t j;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_hapticPlayers;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_hapticPlayers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v10 = (id *)objc_claimAutoreleasedReturnValue();
        v11 = v10[1];
        v12 = objc_msgSend(v11, "count");
        if (v12 >= 1)
        {
          for (j = v12 + 1; j > 1; --j)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", (j - 2));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "type") == 30)
            {
              objc_msgSend(v11, "removeLastObject");
            }
            else
            {
              objc_msgSend(v14, "time");
              if (v15 >= a4)
              {

                break;
              }
              objc_msgSend(v11, "removeLastObject");
              objc_msgSend(v10, "handleCommand:", v14);
            }

          }
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (BOOL)playersHaveImpendingCommandsForStartTime:(double)a3 endTime:(double)a4
{
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_hapticPlayers;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_hapticPlayers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = (id *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10[1], "count"))
        {
          v11 = objc_msgSend(v10, "hasScheduledEventsByTime:", a4 + 1.0);

          goto LABEL_11;
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)processActiveEventsForStartTime:(double)a3 endTime:(double)a4
{
  __int128 v7;
  int *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  float v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  float v21;
  float v22;
  uint64_t v23;
  float v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  float v39;
  float v40;
  id *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSMutableDictionary *hapticPlayers;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  __int128 v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSMutableDictionary *obj;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  id *v80;
  _GCHapticServerManager *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  double v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  __int16 v116;
  double v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  -[_GCHapticServerManager setActiveEvents:](self, "setActiveEvents:", 0);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v81 = self;
  obj = self->_logicalHapticDevices;
  v71 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v128, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v99;
    v8 = &OBJC_IVAR____GCHapticLogicalDevice__hapticPlayers;
    *(_QWORD *)&v7 = 138414338;
    v69 = v7;
    do
    {
      v74 = 0;
      do
      {
        if (*(_QWORD *)v99 != v72)
          objc_enumerationMutation(obj);
        v70 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v74);
        -[NSMutableDictionary objectForKeyedSubscript:](v81->_logicalHapticDevices, "objectForKeyedSubscript:", v69);
        v80 = (id *)objc_claimAutoreleasedReturnValue();
        v127 = 0;
        v126 = 0;
        v125 = 0;
        v124 = 0;
        +[NSMutableArray array](&off_254DEBB20, "array");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v76 = *(id *)((char *)v80 + *v8);
        v9 = 0;
        v10 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v123, 16);
        if (v10)
        {
          v77 = *(_QWORD *)v95;
          do
          {
            v11 = 0;
            v78 = v10;
            do
            {
              if (*(_QWORD *)v95 != v77)
                objc_enumerationMutation(v76);
              v12 = *(_QWORD **)(*((_QWORD *)&v94 + 1) + 8 * v11);
              objc_msgSend(v12, "processSliceForLogicalDevice:startTime:endTime:", v80, a3, a4);
              objc_msgSend(v12, "continuousIntensity");
              if (v13 > 0.0)
              {
                v14 = v12[6];
                if (v14)
                  *(_BYTE *)(v14 + 8) = 1;
              }
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              objc_msgSend(v12, "actuators");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v122, 16);
              v79 = v9;
              v17 = v8;
              if (v16)
              {
                v18 = *(_QWORD *)v91;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v91 != v18)
                      objc_enumerationMutation(v15);
                    v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                    objc_msgSend(v12, "continuousIntensity");
                    v22 = v21;
                    v23 = objc_msgSend(v20, "index");
                    *((float *)&v126 + v23) = v22 + *((float *)&v126 + v23);
                    objc_msgSend(v12, "continuousSharpness");
                    v25 = v24;
                    v26 = objc_msgSend(v20, "index");
                    *((float *)&v124 + v26) = v25 + *((float *)&v124 + v26);
                  }
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v90, v122, 16);
                }
                while (v16);
              }

              v8 = v17;
              v9 = v79;
              if (!-[_GCHapticServerManager activeEvents](v81, "activeEvents"))
                -[_GCHapticServerManager setActiveEvents:](v81, "setActiveEvents:", objc_msgSend(v12, "hasProcessedActiveEventsAfterTime:", a4 + -1.0) | -[_GCHapticServerManager activeEvents](v81, "activeEvents"));
              if (objc_msgSend(v12, "transientsEnqueuedSinceLastQuery"))
              {
                v27 = v12[6];
                v9 = 1;
                if (v27)
                  *(_BYTE *)(v27 + 8) = 1;
              }
              if ((objc_msgSend(v12, "isActiveAtTime:", a3) & 1) == 0)
                objc_msgSend(v75, "addObject:", v12);
              ++v11;
            }
            while (v11 != v78);
            v10 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v94, v123, 16);
          }
          while (v10);
        }

        v28 = 0;
        v29 = 0;
        do
        {
          while (1)
          {
            v30 = fmin(fmax(*((float *)&v124 + v28), 0.0), 1.0);
            *((float *)&v124 + v28) = v30;
            v31 = fmin(fmax(*((float *)&v126 + v28), 0.0), 1.0);
            *((float *)&v126 + v28) = v31;
            if (*((float *)v80 + v28 + 10) != v30)
            {
              *((float *)v80 + v28 + 10) = v30;
              v29 = 1;
            }
            if (*((float *)v80 + v28 + 14) == v31)
              break;
            *((float *)v80 + v28++ + 14) = v31;
            v29 = 1;
            if (v28 == 4)
              goto LABEL_38;
          }
          ++v28;
        }
        while (v28 != 4);
        if ((v29 & 1) != 0)
        {
LABEL_38:
          if (gc_isInternalBuild())
          {
            getGCHapticsLogger();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v69;
              v105 = v70;
              v106 = 2048;
              v107 = *(float *)&v126;
              v108 = 2048;
              v109 = *((float *)&v126 + 1);
              v110 = 2048;
              v111 = *(float *)&v127;
              v112 = 2048;
              v113 = *((float *)&v127 + 1);
              v114 = 2048;
              v115 = *(float *)&v124;
              v116 = 2048;
              v117 = *((float *)&v124 + 1);
              v118 = 2048;
              v119 = *(float *)&v125;
              v120 = 2048;
              v121 = *((float *)&v125 + 1);
              _os_log_debug_impl(&dword_215181000, v67, OS_LOG_TYPE_DEBUG, "%@ I=(%.3f %.3f %.3f %.3f) S=(%.3f %.3f %.3f %.3f)", buf, 0x5Cu);
            }

          }
          objc_msgSend(v80[10], "actuators");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "type") == 1;

          if (v34)
          {
            v38 = v124;
            LODWORD(v37) = HIDWORD(v126);
            v39 = *(float *)&v126;
            if (*(float *)&v124 >= 0.5)
              *(float *)&v36 = 0.0;
            else
              *(float *)&v36 = *(float *)&v126;
            if (*((float *)&v124 + 1) >= 0.5)
              v40 = 0.0;
            else
              v40 = *((float *)&v126 + 1);
            v41 = v80;
            LODWORD(v35) = 1047233823;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 0, v35, v36, v37);
            if (*(float *)&v38 >= 0.5)
              *(float *)&v43 = v39;
            else
              *(float *)&v43 = 0.0;
            LODWORD(v42) = 1035489772;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 1, v42, v43);
            LODWORD(v44) = 1047233823;
            *(float *)&v45 = v40;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 2, v44, v45);
            LODWORD(v46) = 1035489772;
            LODWORD(v47) = HIDWORD(v38);
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 3, v46, v47);
          }
          else
          {
            v41 = v80;
            LODWORD(v35) = v126;
            LODWORD(v36) = 0;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 0, v35, v36);
            LODWORD(v48) = HIDWORD(v126);
            LODWORD(v49) = 0;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 1, v48, v49);
            LODWORD(v50) = v127;
            LODWORD(v51) = 0;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 2, v50, v51);
            LODWORD(v52) = HIDWORD(v127);
            LODWORD(v53) = 0;
            objc_msgSend(v80[9], "setHapticMotor:frequency:amplitude:", 3, v52, v53);
          }
LABEL_51:
          objc_msgSend(v41[9], "enableHaptics");
          goto LABEL_52;
        }
        v41 = v80;
        if ((v9 & 1) != 0)
          goto LABEL_51;
LABEL_52:
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v54 = v75;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
        if (v55)
        {
          v56 = *(_QWORD *)v87;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v87 != v56)
                objc_enumerationMutation(v54);
              objc_msgSend(*(id *)((char *)v80 + *v8), "removeObject:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
            }
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
          }
          while (v55);
        }

        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v58 = v54;
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
        if (v59)
        {
          v60 = *(_QWORD *)v83;
          do
          {
            v61 = 0;
            do
            {
              if (*(_QWORD *)v83 != v60)
                objc_enumerationMutation(v58);
              v62 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v61);
              if (gc_isInternalBuild())
              {
                getGCHapticsLogger();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v105 = v62;
                  _os_log_debug_impl(&dword_215181000, v65, OS_LOG_TYPE_DEBUG, "Player %@ is no longer needed, deallocating...", buf, 0xCu);
                }

              }
              hapticPlayers = v81->_hapticPlayers;
              objc_msgSend(v62, "identifier");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](hapticPlayers, "removeObjectForKey:", v64);

              ++v61;
            }
            while (v59 != v61);
            v66 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v82, v102, 16);
            v59 = v66;
          }
          while (v66);
        }

        ++v74;
      }
      while (v74 != v71);
      v68 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v128, 16);
      v71 = v68;
    }
    while (v68);
  }

}

- (void)notifyPlayerNoLongerRetained:(id)a3
{
  id v4;
  NSObject *runloopQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  _GCHapticServerManager *v9;

  v4 = a3;
  runloopQueue = self->_runloopQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55___GCHapticServerManager_notifyPlayerNoLongerRetained___block_invoke;
  v7[3] = &unk_24D2B4670;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(runloopQueue, v7);

}

- (void)identifyCompletedClients
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = self->_clients;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v38;
    v6 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v4);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = self->_hapticPlayers;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary objectForKey:](self->_hapticPlayers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v12 = (id *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12[6], "complete") & 1) == 0)
        {
          +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", objc_msgSend(v12[6], "clientID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "hasScheduledCommands") & 1) != 0)
            v14 = 0;
          else
            v14 = objc_msgSend(v12, "hasProcessedActiveEventsThisSlice") ^ 1;
          objc_msgSend(v28, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (v16)
          {
            +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v17, v13);
          }
          else
          {
            objc_msgSend(v28, "objectForKeyedSubscript:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", objc_msgSend(v17, "BOOLValue") & v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v18, v13);

          }
        }

      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v19 = v28;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v19);
        v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k);
        objc_msgSend(v19, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "BOOLValue");

        -[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v25)
          objc_msgSend(v26, "setComplete:", 1);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v20);
  }

}

- (void)enterRunloop
{
  double v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  NSObject *runloopQueue;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *log;
  _QWORD v14[5];
  _QWORD v15[7];
  _QWORD v16[7];
  uint8_t buf[16];
  _QWORD block[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  timespec v23;
  timespec __rqtp;

  if (self->_running)
    return;
  self->_running = 1;
  v23 = (timespec)xmmword_21526CEC0;
  __rqtp = (timespec)xmmword_21526CEB0;
  v3 = (double)mach_absolute_time();
  v4 = MEMORY[0x24BDAC760];
  v5 = v3 * 0.0000000416666667;
  while (1)
  {
    v6 = (void *)MEMORY[0x2199DE97C]();
    ++self->_tickCount;
    v7 = (double)mach_absolute_time() * 0.0000000416666667;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    runloopQueue = self->_runloopQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __38___GCHapticServerManager_enterRunloop__block_invoke;
    block[3] = &unk_24D2B47B0;
    *(double *)&block[6] = v5;
    *(double *)&block[7] = v7;
    block[4] = self;
    block[5] = &v19;
    dispatch_sync(runloopQueue, block);
    if (!*((_BYTE *)v20 + 24))
    {
      if (self->_idle)
      {
        if (gc_isInternalBuild())
        {
          getGCHapticsLogger();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215181000, log, OS_LOG_TYPE_DEFAULT, "Entering active state...", buf, 2u);
          }

        }
        self->_idle = 0;
      }
      v9 = self->_runloopQueue;
      v16[0] = v4;
      v16[1] = 3221225472;
      v16[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_24;
      v16[3] = &unk_24D2B47D8;
      v16[4] = self;
      *(double *)&v16[5] = v5;
      *(double *)&v16[6] = v7;
      dispatch_sync(v9, v16);
      v10 = self->_runloopQueue;
      v15[0] = v4;
      v15[1] = 3221225472;
      v15[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_2;
      v15[3] = &unk_24D2B47D8;
      v15[4] = self;
      *(double *)&v15[5] = v5;
      *(double *)&v15[6] = v7;
      dispatch_sync(v10, v15);
      v11 = self->_runloopQueue;
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __38___GCHapticServerManager_enterRunloop__block_invoke_3;
      v14[3] = &unk_24D2B4800;
      v14[4] = self;
      dispatch_sync(v11, v14);
      nanosleep(&v23, 0);
      goto LABEL_13;
    }
    if (!self->_running)
      break;
    if (!self->_idle)
    {
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215181000, log, OS_LOG_TYPE_DEFAULT, "Entering idle state...", buf, 2u);
        }

      }
      self->_idle = 1;
    }
    nanosleep(&__rqtp, 0);
LABEL_13:
    _Block_object_dispose(&v19, 8);
    objc_autoreleasePoolPop(v6);
    v5 = v7;
    if (!self->_running)
      goto LABEL_23;
  }
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, "Destroying input thread...", buf, 2u);
    }

  }
  _Block_object_dispose(&v19, 8);
  objc_autoreleasePoolPop(v6);
LABEL_23:
  +[NSThread exit](&off_254DF2490, "exit", log);
}

- (void)readParamCurveListCommand:(HapticCommand *)a3 client:(id)a4
{
  id v6;
  double var2;
  __int128 v8;
  int var1;
  NSObject *v10;
  double v11;
  int v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  int v18;
  __int128 v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  var2 = a3->var2;
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = *(double *)&v6;
      v22 = 2048;
      v23 = var2;
      _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_INFO, "Start of param curve command list for client %@, curve list time %f", buf, 0x16u);
    }

  }
  *(_QWORD *)&v8 = 134218240;
  v19 = v8;
  while (HapticSharedMemory::readCommand((HapticSharedMemory *)objc_msgSend(v6, "sharedMemory", v19), a3))
  {
    var1 = a3->var0.var1;
    if (var1 != 10)
    {
      if (var1 == 9)
      {
        if (!gc_isInternalBuild())
          break;
        getGCHapticsLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v14 = "Illegal StartParamCurveList within list!";
LABEL_18:
        v15 = v13;
        v16 = 2;
      }
      else
      {
        if (var1 == 11)
        {
          if (!gc_isInternalBuild())
            break;
          getGCHapticsLogger();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v14 = "EndParamCurveList - breaking out";
            goto LABEL_18;
          }
LABEL_27:

          break;
        }
        if (!gc_isInternalBuild())
          break;
        getGCHapticsLogger();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          goto LABEL_27;
        v18 = a3->var0.var1;
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v18;
        v14 = "Illegal HapticCommandType: %u";
        v15 = v13;
        v16 = 8;
      }
      _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
      goto LABEL_27;
    }
    a3->var2 = var2 + a3->var2;
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = a3->var2;
        v12 = a3->var0.var1;
        *(_DWORD *)buf = v19;
        v21 = v11;
        v22 = 1024;
        LODWORD(v23) = v12;
        _os_log_impl(&dword_215181000, v10, OS_LOG_TYPE_INFO, "AddParamCurve - adjusted time: %.3f, type: %u", buf, 0x12u);
      }

    }
    -[_GCHapticServerManager scheduleCommand:](self, "scheduleCommand:", a3);
  }

}

- (void)readListCommand:(HapticCommand *)a3 client:(id)a4 renderTime:(double)var2
{
  id v8;
  __int128 v9;
  int var1;
  NSObject *v11;
  int v12;
  unint64_t var4;
  unint64_t var0;
  double v15;
  unint64_t var3;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  __int128 v27;
  uint8_t buf[4];
  _BYTE v29[14];
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  __int16 v34;
  unint64_t v35;
  _OWORD v36[10];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a3->var2 > var2)
    var2 = a3->var2;
  *(_QWORD *)&v9 = 67110144;
  v27 = v9;
  while (1)
  {
    while (1)
    {
      if (!HapticSharedMemory::readCommand((HapticSharedMemory *)objc_msgSend(v8, "sharedMemory", v27), a3))
      {
        if (!gc_isInternalBuild())
          goto LABEL_25;
        getGCHapticsLogger();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          goto LABEL_32;
        *(_WORD *)buf = 0;
        v25 = "Reached end of queued commands";
        goto LABEL_31;
      }
      var1 = a3->var0.var1;
      if (var1 != 9)
        break;
      a3->var2 = var2 + a3->var2;
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = a3->var2;
          *(_DWORD *)buf = 134217984;
          *(double *)v29 = v23;
          _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_INFO, "StartParamCurveList - adjusted time: %.3f - descending into curve", buf, 0xCu);
        }

      }
      v17 = *(_OWORD *)&a3->var5.var5.var1[13].var1;
      v36[8] = *(_OWORD *)&a3->var5.var5.var1[11].var1;
      v36[9] = v17;
      v37 = *(_QWORD *)&a3->var5.var5.var1[15].var1;
      v18 = *(_OWORD *)&a3->var5.var5.var1[5].var1;
      v36[4] = *(_OWORD *)&a3->var5.var5.var1[3].var1;
      v36[5] = v18;
      v19 = *(_OWORD *)&a3->var5.var5.var1[9].var1;
      v36[6] = *(_OWORD *)&a3->var5.var5.var1[7].var1;
      v36[7] = v19;
      v20 = *(_OWORD *)&a3->var3;
      v36[0] = *(_OWORD *)&a3->var0.var0;
      v36[1] = v20;
      v21 = *(_OWORD *)&a3->var5.var5.var1[1].var1;
      v36[2] = *(_OWORD *)&a3->var5.var0.var0;
      v36[3] = v21;
      -[_GCHapticServerManager readParamCurveListCommand:client:](self, "readParamCurveListCommand:client:", v36, v8);
    }
    if (var1 == 6)
    {
      if (!gc_isInternalBuild())
        goto LABEL_25;
      getGCHapticsLogger();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_32;
      *(_WORD *)buf = 0;
      v25 = "Illegal StartEventList within list!";
      goto LABEL_31;
    }
    if (var1 == 7)
      break;
    a3->var2 = var2 + a3->var2;
    -[_GCHapticServerManager scheduleCommand:](self, "scheduleCommand:", a3);
    if (gc_isInternalBuild())
    {
      getGCHapticsLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = a3->var0.var1;
        var4 = a3->var4;
        var0 = a3->var5.var0.var0;
        v15 = a3->var2;
        var3 = a3->var3;
        *(_DWORD *)buf = v27;
        *(_DWORD *)v29 = v12;
        *(_WORD *)&v29[4] = 2048;
        *(_QWORD *)&v29[6] = var4;
        v30 = 2048;
        v31 = v15;
        v32 = 1024;
        v33 = var0;
        v34 = 2048;
        v35 = var3;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "Start event type %u, event id %lu, time %.3f, token %u, channel %lu", buf, 0x2Cu);
      }

    }
  }
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "EndEventList - breaking out", buf, 2u);
    }

  }
  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
LABEL_32:

      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v25 = "";
LABEL_31:
    _os_log_impl(&dword_215181000, v24, OS_LOG_TYPE_INFO, v25, buf, 2u);
    goto LABEL_32;
  }
LABEL_25:

}

- (id)__onqueue_reserveChannels:(unint64_t)a3 forClient:(id)a4
{
  id v6;
  void *v7;
  _GCHapticServerManager *v8;
  unint64_t channelID;
  unint64_t v10;
  uint64_t v11;
  _GCHapticPlayer *v12;
  void *v13;
  _GCHapticPlayer *v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  NSMutableDictionary *hapticPlayers;
  void *v19;
  NSMutableDictionary *logicalHapticDevices;
  void *v21;
  id *v22;
  NSObject *v23;
  NSObject *v25;
  __int128 v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[NSMutableArray array](&off_254DEBB20, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self;
  objc_sync_enter(v8);
  channelID = v8->_channelID;
  v10 = channelID + a3;
  v8->_channelID = channelID + a3;
  objc_sync_exit(v8);

  if (gc_isInternalBuild())
  {
    getGCHapticsLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v28 = a3;
      v29 = 2048;
      v30 = channelID;
      v31 = 2048;
      v32 = channelID + a3;
      _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "reserving %lu channels, from [%lu - %lu)", buf, 0x20u);
    }

  }
  if (channelID < v10)
  {
    v11 = 0;
    do
    {
      v12 = [_GCHapticPlayer alloc];
      objc_msgSend(v6, "actuators");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_GCHapticPlayer initWithIdentifier:actuators:client:](v12, "initWithIdentifier:actuators:client:", channelID + v11, v13, v6);

      objc_msgSend(v7, "addObject:", v14);
      ++v11;
    }
    while (a3 != v11);
    if (channelID < v10)
    {
      v16 = 0;
      *(_QWORD *)&v15 = 134218242;
      v26 = v15;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v16, v26);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        hapticPlayers = v8->_hapticPlayers;
        +[NSNumber numberWithUnsignedInteger:](&off_254DED908, "numberWithUnsignedInteger:", channelID + v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](hapticPlayers, "setObject:forKey:", v17, v19);

        if (gc_isInternalBuild())
        {
          getGCHapticsLogger();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            v28 = channelID + v16;
            v29 = 2112;
            v30 = (unint64_t)v17;
            _os_log_impl(&dword_215181000, v23, OS_LOG_TYPE_INFO, "_hapticPlayers[%lu] = %@", buf, 0x16u);
          }

        }
        logicalHapticDevices = v8->_logicalHapticDevices;
        objc_msgSend(v6, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](logicalHapticDevices, "objectForKey:", v21);
        v22 = (id *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setHapticLogicalDevice:", v22);
        objc_msgSend(v22[4], "addObject:", v17);

        ++v16;
      }
      while (a3 != v16);
    }
  }

  return v7;
}

- (BOOL)activeEvents
{
  return self->_activeEvents;
}

- (void)setActiveEvents:(BOOL)a3
{
  self->_activeEvents = a3;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (OS_dispatch_queue)runloopQueue
{
  return self->_runloopQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloopQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_hapticPlayers, 0);
  objc_storeStrong((id *)&self->_clientInvalidationHandlers, 0);
  objc_storeStrong((id *)&self->_logicalHapticDevices, 0);
  objc_storeStrong((id *)&self->queue, 0);
}

@end
