@implementation ACCCommunicationsFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCCommunicationsFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCCommunicationsFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  id v3;
  dispatch_queue_t v4;

  init_logging();
  -[ACCCommunicationsFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  -[ACCCommunicationsFeaturePlugin pluginName](self, "pluginName");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
  -[ACCCommunicationsFeaturePlugin setQueue:](self, "setQueue:", v4);

  -[ACCCommunicationsFeaturePlugin setCommCenter:](self, "setCommCenter:", 0);
  -[ACCCommunicationsFeaturePlugin setVmManager:](self, "setVmManager:", 0);
  -[ACCCommunicationsFeaturePlugin setRadiosPreferences:](self, "setRadiosPreferences:", 0);
  -[ACCCommunicationsFeaturePlugin setChManager:](self, "setChManager:", 0);
}

- (void)startPlugin
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218F27000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218F27000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Communications feature plugin...", v7, 2u);
  }

  -[ACCCommunicationsFeaturePlugin commCenter](self, "commCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCallStateDelegate:", 0);

  -[ACCCommunicationsFeaturePlugin setCommCenter:](self, "setCommCenter:", 0);
  -[ACCCommunicationsFeaturePlugin setVmManager:](self, "setVmManager:", 0);
  -[ACCCommunicationsFeaturePlugin setRadiosPreferences:](self, "setRadiosPreferences:", 0);
  -[ACCCommunicationsFeaturePlugin setChManager:](self, "setChManager:", 0);
  -[ACCCommunicationsFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
}

- (void)addNotificationObservers
{
  NSObject *v3;
  _QWORD block[5];

  -[ACCCommunicationsFeaturePlugin queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke;
  block[3] = &unk_24DA3BD88;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[16];

  executeOnMainThreadSync((uint64_t)&__block_literal_global_0);
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_INFO, "Adding notification observers...", v23, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_callStateDidChangeNotification_, *MEMORY[0x24BEB4AB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_callStateDidChangeNotification_, *MEMORY[0x24BEB4AD0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_callStateDidChangeNotification_, *MEMORY[0x24BEB4AA0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_callStateDidChangeNotification_, *MEMORY[0x24BEB4AC0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_callStateDidChangeNotification_, *MEMORY[0x24BEB4AC8], 0);

  CTTelephonyCenterSetDefaultDispatchQueue();
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  v10 = objc_alloc_init(MEMORY[0x24BE04788]);
  objc_msgSend(*(id *)(a1 + 32), "setRadiosPreferences:", v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "radiosPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v11);

  CTTelephonyCenterAddObserver();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_commStatusDidChangeNotification_, *MEMORY[0x24BEB4A90], 0);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 2);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_commStatusDidChangeNotification_, *MEMORY[0x24BE302C8], 0);

  executeOnMainThreadSync((uint64_t)&__block_literal_global_23);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_commStatusDidChangeNotification_, *MEMORY[0x24BEB4A58], 0);

  v18 = objc_alloc_init(MEMORY[0x24BEC0C10]);
  objc_msgSend(*(id *)(a1 + 32), "setVmManager:", v18);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_commStatusDidChangeNotification_, *MEMORY[0x24BEC0C40], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_commStatusDidChangeNotification_, *MEMORY[0x24BEB4AF8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_recentsListDidChangeNotification_, *MEMORY[0x24BE149D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_favoritesListDidChangeNotification_, *MEMORY[0x24BDBA448], 0);

}

id __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke_2()
{
  return (id)objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
}

id __58__ACCCommunicationsFeaturePlugin_addNotificationObservers__block_invoke_22()
{
  return (id)objc_msgSend(MEMORY[0x24BEB4920], "sharedAudioSystemController");
}

- (void)removeNotificationObservers
{
  NSObject *v3;
  _QWORD block[5];

  -[ACCCommunicationsFeaturePlugin queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke;
  block[3] = &unk_24DA3BD88;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_INFO, "Removing all notification observers...", v19, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4AB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4AD0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4AA0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4AC0], 0);

  CTTelephonyCenterSetDefaultDispatchQueue();
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  objc_msgSend(*(id *)(a1 + 32), "radiosPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setRadiosPreferences:", 0);
  CTTelephonyCenterRemoveObserver();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4A90], 0);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 2);

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE302C8], 0);

  executeOnMainThreadSync((uint64_t)&__block_literal_global_31);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4A58], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEC0C40], 0);

  objc_msgSend(*(id *)(a1 + 32), "setVmManager:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BEB4AF8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BE149D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDBA448], 0);

}

id __61__ACCCommunicationsFeaturePlugin_removeNotificationObservers__block_invoke_30()
{
  return (id)objc_msgSend(MEMORY[0x24BEB4920], "sharedAudioSystemController");
}

- (void)callStateDidChangeForCall:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_DEFAULT, "Sending call state update:\n%@", (uint8_t *)&v9, 0xCu);
  }

  -[ACCCommunicationsFeaturePlugin commCenter](self, "commCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callStateDidChange:", v4);

}

- (void)callStateDidChangeNotification:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  id v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  id v58;
  _QWORD block[5];
  id v60;
  uint8_t v61[128];
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v4;
    _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BEB4AB8];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB4AB8]);
  v11 = (_QWORD *)MEMORY[0x24BEB4AA0];
  if ((v10 & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEB4AD0]) & 1) != 0)
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(v4, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", *v11))
  {

    goto LABEL_15;
  }
  objc_msgSend(v4, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BEB4AC8]);

  if ((v38 & 1) == 0)
  {
    objc_msgSend(v4, "name");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEB4AC0]);

    if (!v40)
      goto LABEL_67;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    -[ACCCommunicationsFeaturePlugin currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    if (v41)
    {
      v42 = v41;
      v50 = v4;
      v43 = *(_QWORD *)v54;
      v44 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(v17);
          v46 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v46, "status") == 1)
          {
            _callStateDictionaryForCall(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCCommunicationsFeaturePlugin queue](self, "queue");
            v48 = objc_claimAutoreleasedReturnValue();
            v51[0] = v44;
            v51[1] = 3221225472;
            v51[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_3;
            v51[3] = &unk_24DA3BDD0;
            v51[4] = self;
            v52 = v47;
            v49 = v47;
            dispatch_async(v48, v51);

          }
        }
        v42 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      }
      while (v42);
      v4 = v50;
    }
    goto LABEL_66;
  }
LABEL_17:
  objc_msgSend(v4, "object");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
      goto LABEL_66;
    if (objc_msgSend(v16, "status") == 3
      || objc_msgSend(v17, "status") == 4
      || objc_msgSend(v17, "status") == 6
      || objc_msgSend(v17, "status") == 1 && (objc_msgSend(v17, "isScreening") & 1) != 0
      || objc_msgSend(v17, "status") == 1
      && (objc_msgSend(v17, "isScreening") & 1) == 0
      && objc_msgSend(v17, "wasScreened"))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v18 = MEMORY[0x24BDACB70];
        v19 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:].cold.5();

      objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("CallCountDidChangeNotification"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCCommunicationsFeaturePlugin commStatusDidChangeNotification:](self, "commStatusDidChangeNotification:", v20);

    }
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", v9))
    {

    }
    else
    {
      objc_msgSend(v4, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BEB4AD0]);

      if (!v23)
      {
LABEL_48:
        objc_msgSend(v4, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v27, "isEqualToString:", *v11)
          || objc_msgSend(v17, "status") == 1)
        {

          goto LABEL_52;
        }
        v28 = objc_msgSend(v17, "isScreening");

        if ((v28 & 1) != 0)
        {
LABEL_52:
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v29 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
            v29 = MEMORY[0x24BDACB70];
            v30 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:].cold.1(v4, v29);

          _callStateDictionaryForCall(v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (acc_userDefaults_copyIntegerForKey((uint64_t)CFSTR("LiveVoicemailFakeRinging"))
            && objc_msgSend(v17, "status") == 1
            && (objc_msgSend(v17, "isScreening") & 1) == 0
            && objc_msgSend(v17, "wasScreened"))
          {
            v32 = (void *)objc_msgSend(v31, "mutableCopy");
            objc_msgSend(v32, "setValue:forKey:", &unk_24DA3DE90, *MEMORY[0x24BE00A38]);
            -[ACCCommunicationsFeaturePlugin queue](self, "queue");
            v33 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke;
            block[3] = &unk_24DA3BDD0;
            block[4] = self;
            v60 = v32;
            v34 = v32;
            dispatch_async(v33, block);

          }
          -[ACCCommunicationsFeaturePlugin queue](self, "queue");
          v35 = objc_claimAutoreleasedReturnValue();
          v57[0] = MEMORY[0x24BDAC760];
          v57[1] = 3221225472;
          v57[2] = __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_2;
          v57[3] = &unk_24DA3BDD0;
          v57[4] = self;
          v58 = v31;
          v36 = v31;
          dispatch_async(v35, v57);

        }
LABEL_66:

        goto LABEL_67;
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[ACCCommunicationsFeaturePlugin callStateDidChangeNotification:].cold.3();

    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", *MEMORY[0x24BEB4AF8], 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACCCommunicationsFeaturePlugin commStatusDidChangeNotification:](self, "commStatusDidChangeNotification:", v26);

    goto LABEL_48;
  }
LABEL_67:

}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callStateDidChangeForCall:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callStateDidChangeForCall:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__ACCCommunicationsFeaturePlugin_callStateDidChangeNotification___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callStateDidChangeForCall:", *(_QWORD *)(a1 + 40));
}

- (void)commStatusDidChangeNotification:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ACCCommunicationsFeaturePlugin *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  -[ACCCommunicationsFeaturePlugin queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__ACCCommunicationsFeaturePlugin_commStatusDidChangeNotification___block_invoke;
  v10[3] = &unk_24DA3BDD0;
  v11 = v4;
  v12 = self;
  v9 = v4;
  dispatch_async(v8, v10);

}

void __66__ACCCommunicationsFeaturePlugin_commStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC2A98]);

  if (v4 && (objc_msgSend(*(id *)(a1 + 40), "isAirplaneModeEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDC2A90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _convertCTGradedSignalToCommSignal(v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v8, *MEMORY[0x24BE00AB0]);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDC2C40]);

  v11 = (_QWORD *)MEMORY[0x24BE00A48];
  if (v10 && (objc_msgSend(*(id *)(a1 + 40), "isAirplaneModeEnabled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDC2C38]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _convertCTRegStatusToCommRegStatus(v13);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v15, *MEMORY[0x24BE00AA8]);

    objc_msgSend(*(id *)(a1 + 40), "currentLocalizedCarrierName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v16, *v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("AirplaneModeDidChangeNotification"));

  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "radiosPreferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "airplaneMode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v21, *MEMORY[0x24BE00A40]);

    objc_msgSend(*(id *)(a1 + 40), "currentLocalizedCarrierName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v22, *v11);

    if (objc_msgSend(*(id *)(a1 + 40), "isAirplaneModeEnabled"))
    {
      objc_msgSend(v2, "setObject:forKey:", &unk_24DA3DEA8, *MEMORY[0x24BE00AB0]);
      objc_msgSend(v2, "setObject:forKey:", &unk_24DA3DEC0, *MEMORY[0x24BE00AA8]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "currentSignalStrength"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v23, *MEMORY[0x24BE00AB0]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "currentRegistrationStatus"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v24, *MEMORY[0x24BE00AA8]);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDC2C18]);

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentLocalizedCarrierName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v27, *v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BEB4A90]);

  if (v29)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BEB4930], "supportsTelephonyCalls"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v30, *MEMORY[0x24BE00AC0]);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE302C8]);

  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", *MEMORY[0x24BE302C0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", *MEMORY[0x24BE302D0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "integerValue");

    if (v38 == 2)
    {
      v39 = (_QWORD *)MEMORY[0x24BE00A68];
    }
    else
    {
      if (v38)
        goto LABEL_21;
      v39 = (_QWORD *)MEMORY[0x24BE00A70];
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v40, *v39);

  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "name");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BEB4A58]);

  if (v42)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "currentMuteStatus"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v43, *MEMORY[0x24BE00A98]);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("CallCountDidChangeNotification"));

  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentCallCount"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v46, *MEMORY[0x24BE00A58]);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x24BEC0C40]);

  if (v48)
  {
    v49 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "vmManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "numberWithUnsignedChar:", objc_msgSend(v50, "unreadCount"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v51, *MEMORY[0x24BE00AA0]);

  }
  objc_msgSend(*(id *)(a1 + 32), "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isEqualToString:", *MEMORY[0x24BEB4AF8]);

  if (v53)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isInitiateCallAllowed"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v54, *MEMORY[0x24BE00A88]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isEndAndAcceptAvailable"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v55, *MEMORY[0x24BE00A60]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isHoldAndAcceptAvailable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v56, *MEMORY[0x24BE00A78]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isSwapAvailable"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v57, *MEMORY[0x24BE00AB8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isMergeAvailable"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v58, *MEMORY[0x24BE00A90]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isHoldAvailable"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v59, *MEMORY[0x24BE00A80]);

  }
  if (objc_msgSend(v2, "count"))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v60 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v60 = MEMORY[0x24BDACB70];
      v61 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v64 = 138412290;
      v65 = v2;
      _os_log_impl(&dword_218F27000, v60, OS_LOG_TYPE_DEFAULT, "Sending communications update:\n%@", (uint8_t *)&v64, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "commCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v62, "commStatusDidChange:", v63);

  }
}

- (void)recentsListDidChangeNotification:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  -[ACCCommunicationsFeaturePlugin queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ACCCommunicationsFeaturePlugin_recentsListDidChangeNotification___block_invoke;
  block[3] = &unk_24DA3BD88;
  block[4] = self;
  dispatch_async(v8, block);

}

void __67__ACCCommunicationsFeaturePlugin_recentsListDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "commCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recentsListDidChange");

}

- (void)favoritesListDidChangeNotification:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_INFO, "Notification received:\n%@", buf, 0xCu);
  }

  -[ACCCommunicationsFeaturePlugin queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ACCCommunicationsFeaturePlugin_favoritesListDidChangeNotification___block_invoke;
  block[3] = &unk_24DA3BD88;
  block[4] = self;
  dispatch_async(v8, block);

}

void __69__ACCCommunicationsFeaturePlugin_favoritesListDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "commCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "favoritesListDidChange");

}

- (id)currentCallStates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACCCommunicationsFeaturePlugin currentAudioAndVideoCalls](self, "currentAudioAndVideoCalls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        _callStateDictionaryForCall(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (v3 && objc_msgSend(v3, "count"))
    v10 = (void *)objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return v10;
}

- (id)currentCommunicationsStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ACCCommunicationsFeaturePlugin currentSignalStrength](self, "currentSignalStrength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BE00AB0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[ACCCommunicationsFeaturePlugin currentRegistrationStatus](self, "currentRegistrationStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BE00AA8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isAirplaneModeEnabled](self, "isAirplaneModeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x24BE00A40]);

  -[ACCCommunicationsFeaturePlugin currentLocalizedCarrierName](self, "currentLocalizedCarrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x24BE00A48]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isCellularSupported](self, "isCellularSupported"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x24BE00A50]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isTelephonyEnabled](self, "isTelephonyEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, *MEMORY[0x24BE00AC0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isFaceTimeAudioEnabled](self, "isFaceTimeAudioEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x24BE00A68]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isFaceTimeVideoEnabled](self, "isFaceTimeVideoEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, *MEMORY[0x24BE00A70]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin currentMuteStatus](self, "currentMuteStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x24BE00A98]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)-[ACCCommunicationsFeaturePlugin currentCallCount](self, "currentCallCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, *MEMORY[0x24BE00A58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)-[ACCCommunicationsFeaturePlugin currentUnreadVoicemailCount](self, "currentUnreadVoicemailCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, *MEMORY[0x24BE00AA0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isInitiateCallAllowed](self, "isInitiateCallAllowed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, *MEMORY[0x24BE00A88]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isEndAndAcceptAvailable](self, "isEndAndAcceptAvailable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, *MEMORY[0x24BE00A60]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isHoldAndAcceptAvailable](self, "isHoldAndAcceptAvailable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, *MEMORY[0x24BE00A78]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isSwapAvailable](self, "isSwapAvailable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, *MEMORY[0x24BE00AB8]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isMergeAvailable](self, "isMergeAvailable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, *MEMORY[0x24BE00A90]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ACCCommunicationsFeaturePlugin isHoldAvailable](self, "isHoldAvailable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, *MEMORY[0x24BE00A80]);

  if (v3 && objc_msgSend(v3, "count"))
    v21 = (void *)objc_msgSend(v3, "copy");
  else
    v21 = 0;

  return v21;
}

- (void)airplaneModeChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218F27000, v0, v1, "Converting delegate callback to NSNotification...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (int)currentSignalStrength
{
  int v2;
  void *v3;

  if (-[ACCCommunicationsFeaturePlugin isAirplaneModeEnabled](self, "isAirplaneModeEnabled"))
    return 0;
  CTIndicatorsGetSignalStrength();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _convertCTGradedSignalToCommSignal(v3);

  return v2;
}

- (int)currentRegistrationStatus
{
  void *Status;

  if (-[ACCCommunicationsFeaturePlugin isAirplaneModeEnabled](self, "isAirplaneModeEnabled"))
    return 1;
  Status = (void *)CTRegistrationGetStatus();
  return _convertCTRegStatusToCommRegStatus(Status);
}

- (BOOL)isAirplaneModeEnabled
{
  void *v2;
  char v3;

  -[ACCCommunicationsFeaturePlugin radiosPreferences](self, "radiosPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (id)currentCarrierName
{
  return (id)CTRegistrationCopyOperatorName();
}

- (id)currentLocalizedCarrierName
{
  id v3;
  unsigned int v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const void *SIMStatus;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ACCCommunicationsFeaturePlugin currentCarrierName](self, "currentCarrierName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[ACCCommunicationsFeaturePlugin currentRegistrationStatus](self, "currentRegistrationStatus");
  v5 = -[ACCCommunicationsFeaturePlugin isAirplaneModeEnabled](self, "isAirplaneModeEnabled");
  if (v5)
  {
    acc_strings_bundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Airplane Mode");
LABEL_8:
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DA3CAB0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  SIMStatus = (const void *)CTSIMSupportGetSIMStatus();
  if (CFEqual(SIMStatus, (CFTypeRef)*MEMORY[0x24BDC2CD0]))
  {
    acc_strings_bundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("No SIM");
    goto LABEL_8;
  }
  if (v4 <= 6 && ((1 << v4) & 0x4A) != 0)
  {
    acc_strings_bundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("No Service");
    goto LABEL_8;
  }
  if ((v4 & 0xFFFFFFFD) == 0 || (v10 = v3, objc_msgSend(v3, "isEqualToString:", &stru_24DA3CAB0)))
  {
    acc_strings_bundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("Searching...");
    goto LABEL_8;
  }
LABEL_9:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = "NO";
    v15 = 138413058;
    v16 = v10;
    v17 = 2112;
    if (v5)
      v14 = "YES";
    v18 = v3;
    v19 = 1024;
    v20 = v4;
    v21 = 2080;
    v22 = v14;
    _os_log_debug_impl(&dword_218F27000, v11, OS_LOG_TYPE_DEBUG, "Generated localized carrier name: '%@' (origCarrierName: %@, registrationStatus: %{coreacc:ACCCommunications_CommunicationsUpdate_RegistrationStatus_t}d, airplaneMode: %s)", (uint8_t *)&v15, 0x26u);
  }

  return v10;
}

- (BOOL)isCellularSupported
{
  return MGGetBoolAnswer();
}

- (BOOL)isTelephonyEnabled
{
  return objc_msgSend(MEMORY[0x24BEB4930], "supportsTelephonyCalls");
}

- (BOOL)isFaceTimeAudioEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 2) == 1;

  return v3;
}

- (BOOL)isFaceTimeVideoEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE302F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.accessories.features.Communications"), 0) == 1;

  return v3;
}

- (BOOL)currentMuteStatus
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEB4920], "sharedAudioSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUplinkMuted");

  return v3;
}

- (id)currentAudioAndVideoCalls
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = (id)MEMORY[0x24BDBD1A8];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__ACCCommunicationsFeaturePlugin_currentAudioAndVideoCalls__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __59__ACCCommunicationsFeaturePlugin_currentAudioAndVideoCalls__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAudioAndVideoCalls");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)currentCallCount
{
  unint64_t v2;
  _QWORD v4[5];
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
  v4[2] = __50__ACCCommunicationsFeaturePlugin_currentCallCount__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__ACCCommunicationsFeaturePlugin_currentCallCount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "isScreening") & 1) == 0)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)currentUnreadVoicemailCount
{
  return 0;
}

- (BOOL)isInitiateCallAllowed
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__ACCCommunicationsFeaturePlugin_isInitiateCallAllowed__block_invoke;
  v4[3] = &unk_24DA3BE20;
  v4[4] = self;
  v4[5] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ACCCommunicationsFeaturePlugin_isInitiateCallAllowed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentCallCount");
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCallGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAddCallAllowed");

  if (!v2 || v7)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v5 >= 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioOrVideoCallWithStatus:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

LABEL_10:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioOrVideoCallWithStatus:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_10;
  }
LABEL_11:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = "NO";
    if (v7)
      v15 = "YES";
    else
      v15 = "NO";
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v14 = "YES";
    v16 = 134218498;
    v17 = v2;
    v18 = 2080;
    v19 = v15;
    v20 = 2080;
    v21 = v14;
    _os_log_debug_impl(&dword_218F27000, v12, OS_LOG_TYPE_DEBUG, "currentCallCount: %lu, addCallAllowed: %s, initiateCallAllowed: %s", (uint8_t *)&v16, 0x20u);
  }

}

- (BOOL)isEndAndAcceptAvailable
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (-[ACCCommunicationsFeaturePlugin currentCallCount](self, "currentCallCount") >= 2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __57__ACCCommunicationsFeaturePlugin_isEndAndAcceptAvailable__block_invoke;
    v4[3] = &unk_24DA3BDF8;
    v4[4] = &v5;
    executeOnMainThreadSync((uint64_t)v4);
  }
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ACCCommunicationsFeaturePlugin_isEndAndAcceptAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioOrVideoCallWithStatus:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (BOOL)isHoldAndAcceptAvailable
{
  BOOL v2;
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = -[ACCCommunicationsFeaturePlugin isEndAndAcceptAvailable](self, "isEndAndAcceptAvailable");
  *((_BYTE *)v7 + 24) = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__ACCCommunicationsFeaturePlugin_isHoldAndAcceptAvailable__block_invoke;
    v5[3] = &unk_24DA3BDF8;
    v5[4] = &v6;
    executeOnMainThreadSync((uint64_t)v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__ACCCommunicationsFeaturePlugin_isHoldAndAcceptAvailable__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isHoldAndAnswerAllowed");

}

- (BOOL)isSwapAvailable
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__ACCCommunicationsFeaturePlugin_isSwapAvailable__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__ACCCommunicationsFeaturePlugin_isSwapAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostAudioOrVideoCall");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "supportsHolding");

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentCallGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)objc_msgSend(v5, "count") > 1;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioOrVideoCallWithStatus:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

LABEL_8:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioOrVideoCallWithStatus:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
    }
  }
LABEL_9:

}

- (BOOL)isMergeAvailable
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__ACCCommunicationsFeaturePlugin_isMergeAvailable__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __50__ACCCommunicationsFeaturePlugin_isMergeAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostAudioOrVideoCall");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "supportsGrouping");

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentCallGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)objc_msgSend(v5, "count") > 1;

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "audioOrVideoCallWithStatus:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

LABEL_8:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "audioOrVideoCallWithStatus:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
    }
  }
LABEL_9:

}

- (BOOL)isHoldAvailable
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__ACCCommunicationsFeaturePlugin_isHoldAvailable__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__ACCCommunicationsFeaturePlugin_isHoldAvailable__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontmostAudioOrVideoCall");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v12;
  if (v12)
  {
    objc_msgSend(v12, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "supportsHolding");

    v3 = v12;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioOrVideoCallWithStatus:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) = 0;
      v5 = *(_QWORD *)(a1 + 32);
    }
    v3 = v12;
  }
  if (*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioOrVideoCallWithStatus:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      v3 = v12;
LABEL_11:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audioOrVideoCallWithStatus:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v12;
    if (v11)
      goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  const char *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const char *v30;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = -[ACCCommunicationsFeaturePlugin currentCallCount](self, "currentCallCount");
  if (-[ACCCommunicationsFeaturePlugin isInitiateCallAllowed](self, "isInitiateCallAllowed"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BEB4950]);
    switch(a4)
    {
      case 3:
        if (!v10)
        {
          v17 = objc_alloc(MEMORY[0x24BEB49D0]);
          -[NSObject faceTimeProvider](v11, "faceTimeProvider");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v17, "initWithProvider:", v18);

          -[NSObject setVideo:](v14, "setVideo:", 1);
          if (v9 && objc_msgSend(v9, "length"))
            -[NSObject setContactIdentifier:](v14, "setContactIdentifier:", v9);
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v16 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
            v16 = MEMORY[0x24BDACB70];
            v25 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_50;
          v31 = 138477827;
          v32 = v8;
          v22 = "Initiating FaceTime Video call to: %{private}@...";
          goto LABEL_49;
        }
        logObjectForModule();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:
          v24 = 0;
LABEL_51:

          goto LABEL_52;
        }
        LOWORD(v31) = 0;
        v30 = "Cannot add FaceTime Video call if there is already an active call - ignoring request";
        break;
      case 2:
        if (!v10)
        {
          v19 = objc_alloc(MEMORY[0x24BEB49D0]);
          -[NSObject faceTimeProvider](v11, "faceTimeProvider");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v19, "initWithProvider:", v20);

          -[NSObject setVideo:](v14, "setVideo:", 0);
          if (v9 && objc_msgSend(v9, "length"))
            -[NSObject setContactIdentifier:](v14, "setContactIdentifier:", v9);
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v16 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
            v16 = MEMORY[0x24BDACB70];
            v26 = MEMORY[0x24BDACB70];
          }
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            goto LABEL_50;
          v31 = 138477827;
          v32 = v8;
          v22 = "Initiating FaceTime Audio call to: %{private}@...";
          goto LABEL_49;
        }
        logObjectForModule();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_38;
        LOWORD(v31) = 0;
        v30 = "Cannot add FaceTime Audio call if there is already an active call - ignoring request";
        break;
      case 1:
        v12 = objc_alloc(MEMORY[0x24BEB49D0]);
        -[NSObject telephonyProvider](v11, "telephonyProvider");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithProvider:", v13);

        if (v9 && objc_msgSend(v9, "length"))
          -[NSObject setContactIdentifier:](v14, "setContactIdentifier:", v9);
        objc_msgSend(MEMORY[0x24BEB49E8], "handleWithDestinationID:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setHandle:](v14, "setHandle:", v15);

        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
          v16 = MEMORY[0x24BDACB70];
          v21 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        v31 = 138477827;
        v32 = v8;
        v22 = "Initiating telephony call to: %{private}@...";
LABEL_49:
        _os_log_impl(&dword_218F27000, v16, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v31, 0xCu);
LABEL_50:

        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject URL](v14, "URL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v27, "openURL:withOptions:", v28, 0);

        goto LABEL_51;
      default:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v14 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
          v14 = MEMORY[0x24BDACB70];
          v23 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin initiateCallToDestination:withService:addressBookID:].cold.1();
        goto LABEL_38;
    }
    _os_log_impl(&dword_218F27000, v14, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 2u);
    goto LABEL_38;
  }
  logObjectForModule();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_218F27000, v11, OS_LOG_TYPE_DEFAULT, "Cannot add call - ignoring request", (uint8_t *)&v31, 2u);
  }
  v24 = 0;
LABEL_52:

  return v24;
}

- (BOOL)initiateCallToVoicemail
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint8_t v14[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_218F27000, v5, OS_LOG_TYPE_DEFAULT, "Initiating call to voicemail...", v14, 2u);
  }

  if (!-[ACCCommunicationsFeaturePlugin isInitiateCallAllowed](self, "isInitiateCallAllowed"))
    return 0;
  v6 = objc_alloc_init(MEMORY[0x24BEB4950]);
  v7 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v6, "voicemailProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithProvider:", v8);

  objc_msgSend(v9, "setDialType:", 2);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "openURL:withOptions:", v11, 0);

  return v12;
}

- (BOOL)initiateRedial
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  const char *v29;
  NSObject *v30;
  _QWORD v31[2];
  uint8_t buf[8];
  void *v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218F27000, v5, OS_LOG_TYPE_DEFAULT, "Initiating redial...", buf, 2u);
  }

  -[ACCCommunicationsFeaturePlugin chManager](self, "chManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE14948], "predicateForCallsWithStatusOriginated:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v7;
  objc_msgSend(MEMORY[0x24BE14948], "predicateForCallsWithAnyMediaTypes:", &unk_24DA3DF40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  v9 = (void *)MEMORY[0x24BE14948];
  v10 = *MEMORY[0x24BE149C8];
  v31[0] = *MEMORY[0x24BE149D0];
  v31[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateForCallsWithAnyServiceProviders:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "callsWithPredicate:limit:offset:batchSize:", v14, 1, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "No recent calls - ignoring request!";
LABEL_28:
      _os_log_impl(&dword_218F27000, v17, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
LABEL_32:
    v27 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v15, "objectAtIndex:", 0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    logObjectForModule();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "Could not find last outgoing call - ignoring request!";
      goto LABEL_28;
    }
    goto LABEL_32;
  }
  v17 = v16;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ACCCommunicationsFeaturePlugin initiateRedial].cold.1((uint64_t)v17, v18, v20);

  -[NSObject remoteParticipantHandles](v17, "remoteParticipantHandles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22 != 1)
  {
    logObjectForModule();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218F27000, v30, OS_LOG_TYPE_DEFAULT, "Last outgoing call had more than one remote participant - ignoring request", buf, 2u);
    }

    goto LABEL_32;
  }
  v23 = objc_alloc_init(MEMORY[0x24BEB4950]);
  objc_msgSend(v23, "dialRequestForRecentCall:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "openURL:withOptions:", v26, 0);

LABEL_23:
  return v27;
}

- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  id v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  _BOOL4 v12;
  int v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  id v17;
  char v18;
  NSObject *v20;
  _QWORD v21[7];
  int v22;
  BOOL v23;
  uint8_t buf[16];
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v6 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v7 = -[ACCCommunicationsFeaturePlugin currentCallCount](self, "currentCallCount");
  v8 = -[ACCCommunicationsFeaturePlugin isEndAndAcceptAvailable](self, "isEndAndAcceptAvailable");
  v9 = -[ACCCommunicationsFeaturePlugin isHoldAndAcceptAvailable](self, "isHoldAndAcceptAvailable");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke;
  v25[3] = &unk_24DA3BE20;
  v11 = v6;
  v26 = v11;
  v27 = &v28;
  executeOnMainThreadSync((uint64_t)v25);
  if (v29[5])
  {
    v12 = v7 < 2;
    if (v7 >= 2)
      v13 = a3;
    else
      v13 = 0;
    if (v13)
      v12 = 1;
    v14 = v12 || v9;
    if (v12)
      v15 = v13;
    else
      v15 = 0;
    if (!v14)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218F27000, v16, OS_LOG_TYPE_INFO, "Cannot hold and accept - ending and accepting instead", buf, 2u);
      }

      v15 = 1;
    }
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57;
    v21[3] = &unk_24DA3BE48;
    v22 = v15;
    v21[4] = &v28;
    v21[5] = &v34;
    v21[6] = v7;
    v23 = v8;
    executeOnMainThreadSync((uint64_t)v21);
  }
  else
  {
    logObjectForModule();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218F27000, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find an incoming call - ignoring request", buf, 2u);
    }

  }
  v18 = *((_BYTE *)v35 + 24);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "callWithCallUUID:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      goto LABEL_22;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
  }
  else
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_218F27000, v6, OS_LOG_TYPE_INFO, "No call UUID specified - falling back to incoming call", v18, 2u);
    }
  }

LABEL_22:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incomingCall");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "incomingVideoCall");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
  }
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57(uint64_t a1)
{
  int v2;
  unint64_t v3;
  BOOL v4;
  id v5;
  unint64_t v6;
  BOOL v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint8_t v34[16];
  uint8_t v35[2];
  __int16 v36;
  uint8_t v37[16];
  uint8_t v38[16];
  uint8_t v39[16];
  uint8_t buf[16];

  v2 = *(_DWORD *)(a1 + 56);
  if (v2 != 1)
  {
    if (!v2)
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (v3 == 2)
      {
        if (gLogObjects)
          v4 = gNumLogObjects < 1;
        else
          v4 = 1;
        if (v4)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
          v17 = MEMORY[0x24BDACB70];
          v5 = MEMORY[0x24BDACB70];
        }
        else
        {
          v17 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218F27000, v17, OS_LOG_TYPE_DEFAULT, "Holding active and accepting incoming call...", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "holdActiveAndAnswerCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      }
      else if (v3 < 3)
      {
        if (v3 == 1
          && (objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v19, "audioOrVideoCallWithStatus:", 2),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v19,
              v20))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v21 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
            v21 = MEMORY[0x24BDACB70];
            v31 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_218F27000, v21, OS_LOG_TYPE_DEFAULT, "Unholding call...", v38, 2u);
          }

          objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "audioOrVideoCallWithStatus:", 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "unholdCall:", v33);

        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
            v23 = MEMORY[0x24BDACB70];
            v28 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v37 = 0;
            _os_log_impl(&dword_218F27000, v23, OS_LOG_TYPE_DEFAULT, "Accepting incoming call...", v37, 2u);
          }

          objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "answerCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        }
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v11 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
          v11 = MEMORY[0x24BDACB70];
          v27 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_218F27000, v11, OS_LOG_TYPE_DEFAULT, "Ending held, holding active, and answering incoming call...", v39, 2u);
        }

        objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "endHeldAndAnswerCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      }
      goto LABEL_91;
    }
    if (gLogObjects)
      v9 = gNumLogObjects < 1;
    else
      v9 = 1;
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    else
    {
      v12 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57_cold_1();
LABEL_36:

    return;
  }
  if (!*(_BYTE *)(a1 + 60))
  {
    if (gLogObjects)
      v13 = gNumLogObjects < 1;
    else
      v13 = 1;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v22 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    else
    {
      v22 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_218F27000, v22, OS_LOG_TYPE_DEFAULT, "Ending all calls and hoping we get called back (probably CDMA)...", v34, 2u);
    }

    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "disconnectAllCalls");
    goto LABEL_91;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 == 2)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v24 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_90;
    v36 = 0;
    v25 = "Ending active and accepting incoming call...";
    v26 = (uint8_t *)&v36;
    goto LABEL_89;
  }
  if (gLogObjects)
    v15 = gNumLogObjects <= 0;
  else
    v15 = 1;
  v16 = !v15;
  if (v6 < 3)
  {
    if (v16)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v30 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57_cold_10();
    goto LABEL_36;
  }
  if (v16)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v24 = MEMORY[0x24BDACB70];
    v29 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    v25 = "Leaving held, ending active, and answering incoming call...";
    v26 = v35;
LABEL_89:
    _os_log_impl(&dword_218F27000, v24, OS_LOG_TYPE_DEFAULT, v25, v26, 2u);
  }
LABEL_90:

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endActiveAndAnswerCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
LABEL_91:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  NSObject *v10;
  _QWORD v11[6];
  int v12;
  uint8_t buf[16];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke;
  v14[3] = &unk_24DA3BE20;
  v7 = v5;
  v15 = v7;
  v16 = &v17;
  executeOnMainThreadSync((uint64_t)v14);
  if (v18[5])
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_58;
    v11[3] = &unk_24DA3BE70;
    v12 = a3;
    v11[4] = &v17;
    v11[5] = &v23;
    executeOnMainThreadSync((uint64_t)v11);
  }
  else
  {
    logObjectForModule();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218F27000, v10, OS_LOG_TYPE_DEFAULT, "Couldn't find a call to end - ignoring request", buf, 2u);
    }

  }
  v8 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v8;
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callWithCallUUID:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (gLogObjects)
      v7 = gNumLogObjects <= 0;
    else
      v7 = 1;
    v8 = !v7;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      goto LABEL_34;
    }
    if (v8)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = *v2;
      v22 = 138412290;
      v23 = v17;
      v13 = "Couldn't find call with specified UUID: %@ - falling back to frontmost call";
      v14 = v9;
      v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      v13 = "No call UUID specified - falling back to frontmost call";
      v14 = v9;
      v15 = 2;
LABEL_33:
      _os_log_impl(&dword_218F27000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frontmostAudioOrVideoCall");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_58(uint64_t a1)
{
  BOOL v1;
  id v2;
  int v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (*(_DWORD *)(a1 + 48))
  {
    if (gLogObjects)
      v1 = gNumLogObjects < 1;
    else
      v1 = 1;
    if (v1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v2 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_58_cold_3();

  }
  else
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "status");
    if (gLogObjects)
      v5 = gNumLogObjects <= 0;
    else
      v5 = 1;
    v6 = !v5;
    if (v4 == 4)
    {
      if (v6)
      {
        v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v10 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218F27000, v7, OS_LOG_TYPE_DEFAULT, "Declining incoming call...", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "disconnectCall:withReason:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 2);
    }
    else
    {
      if (v6)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_218F27000, v9, OS_LOG_TYPE_DEFAULT, "Ending call and activating held (if any)...", v16, 2u);
      }

      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "disconnectCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "audioOrVideoCallWithStatus:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unholdCall:", v15);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)endAllCalls
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__ACCCommunicationsFeaturePlugin_endAllCalls__block_invoke;
  v4[3] = &unk_24DA3BDF8;
  v4[4] = &v5;
  executeOnMainThreadSync((uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__ACCCommunicationsFeaturePlugin_endAllCalls__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectAllCalls");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)swapCalls
{
  BOOL v2;
  id v3;
  NSObject *v4;
  char v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[ACCCommunicationsFeaturePlugin isSwapAvailable](self, "isSwapAvailable"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__ACCCommunicationsFeaturePlugin_swapCalls__block_invoke;
    v8[3] = &unk_24DA3BDF8;
    v8[4] = &v9;
    executeOnMainThreadSync((uint64_t)v8);
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 1;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_DEFAULT, "Swap calls isn't available - ignoring request", v7, 2u);
    }

  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __43__ACCCommunicationsFeaturePlugin_swapCalls__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_DEFAULT, "Swapping calls...", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swapCalls");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)mergeCalls
{
  BOOL v2;
  id v3;
  NSObject *v4;
  char v5;
  uint8_t v7[8];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[ACCCommunicationsFeaturePlugin isMergeAvailable](self, "isMergeAvailable"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__ACCCommunicationsFeaturePlugin_mergeCalls__block_invoke;
    v8[3] = &unk_24DA3BDF8;
    v8[4] = &v9;
    executeOnMainThreadSync((uint64_t)v8);
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 1;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_DEFAULT, "Merge calls isn't available - ignoring request", v7, 2u);
    }

  }
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __44__ACCCommunicationsFeaturePlugin_mergeCalls__block_invoke(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v4 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_218F27000, v4, OS_LOG_TYPE_DEFAULT, "Merging calls...", v10, 2u);
  }

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callWithStatus:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callWithStatus:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupCall:withOtherCall:", v6, v8);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  NSObject *v14;
  _QWORD v15[7];
  BOOL v16;
  uint8_t v17[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[4];
  id v22;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = "NO";
    if (v4)
      v10 = "YES";
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_218F27000, v9, OS_LOG_TYPE_INFO, "Setting hold status to %s...", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v11 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke;
  v21[3] = &unk_24DA3BE20;
  v12 = v6;
  v22 = v12;
  p_buf = &buf;
  executeOnMainThreadSync((uint64_t)v21);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    *(_QWORD *)v17 = 0;
    v18 = v17;
    v19 = 0x2020000000;
    v20 = -86;
    v20 = -[ACCCommunicationsFeaturePlugin isHoldAvailable](self, "isHoldAvailable");
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke_59;
    v15[3] = &unk_24DA3BE98;
    v15[5] = &buf;
    v15[6] = v17;
    v15[4] = self;
    v16 = v4;
    executeOnMainThreadSync((uint64_t)v15);
    _Block_object_dispose(v17, 8);
  }
  else
  {
    logObjectForModule();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_218F27000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't find an active call - ignoring request", v17, 2u);
    }

  }
  _Block_object_dispose(&buf, 8);

  return 0;
}

void __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callWithCallUUID:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (gLogObjects)
      v7 = gNumLogObjects <= 0;
    else
      v7 = 1;
    v8 = !v7;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      goto LABEL_34;
    }
    if (v8)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = *v2;
      v22 = 138412290;
      v23 = v17;
      v13 = "Could not find call with specified UUID: %@ - falling back to frontmost call";
      v14 = v9;
      v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      v13 = "No call UUID specified - falling back to frontmost call";
      v14 = v9;
      v15 = 2;
LABEL_33:
      _os_log_impl(&dword_218F27000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frontmostAudioOrVideoCall");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

void __67__ACCCommunicationsFeaturePlugin_updateHoldStatus_forCallWithUUID___block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id v4;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "status") != 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "isHoldAvailable") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "holdCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
LABEL_11:

      return;
    }
LABEL_10:
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unholdCall:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_10;
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v2 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v2 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218F27000, v2, OS_LOG_TYPE_DEFAULT, "Hold isn't available - ignoring message", buf, 2u);
  }

}

- (BOOL)updateMuteStatus:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  const char *v7;
  char v8;
  _QWORD v10[5];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v3)
      v7 = "YES";
    *(_DWORD *)buf = 136315138;
    v17 = v7;
    _os_log_impl(&dword_218F27000, v6, OS_LOG_TYPE_DEFAULT, "Setting mute status to %s...", buf, 0xCu);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__ACCCommunicationsFeaturePlugin_updateMuteStatus___block_invoke;
  v10[3] = &unk_24DA3BEC0;
  v11 = v3;
  v10[4] = &v12;
  executeOnMainThreadSync((uint64_t)v10);
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __51__ACCCommunicationsFeaturePlugin_updateMuteStatus___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEB4920], "sharedAudioSystemController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUplinkMuted:", *(unsigned __int8 *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  int v12;
  uint8_t buf[16];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a4;
  v6 = v5;
  if (a3 >= 0xC)
  {
    logObjectForModule();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin sendDTMF:forCallWithUUID:].cold.1(a3, v9);

  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v7 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke;
    v14[3] = &unk_24DA3BE20;
    v15 = v5;
    v16 = &v17;
    executeOnMainThreadSync((uint64_t)v14);
    if (v18[5])
    {
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke_60;
      v11[3] = &unk_24DA3BEE8;
      v11[4] = &v17;
      v12 = a3;
      executeOnMainThreadSync((uint64_t)v11);
    }
    else
    {
      logObjectForModule();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218F27000, v10, OS_LOG_TYPE_DEFAULT, "Couldn't find an active call - ignoring request", buf, 2u);
      }

    }
    _Block_object_dispose(&v17, 8);

  }
  return 0;
}

void __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  id v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callWithCallUUID:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (gLogObjects)
      v7 = gNumLogObjects <= 0;
    else
      v7 = 1;
    v8 = !v7;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      if (v8)
      {
        v9 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
        v9 = MEMORY[0x24BDACB70];
        v12 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2();
      goto LABEL_34;
    }
    if (v8)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v17 = *v2;
      v22 = 138412290;
      v23 = v17;
      v13 = "Could not find call with specified UUID: %@ - falling back to frontmost call";
      v14 = v9;
      v15 = 12;
      goto LABEL_33;
    }
  }
  else
  {
    if (gLogObjects)
      v10 = gNumLogObjects < 1;
    else
      v10 = 1;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      v13 = "No call UUID specified - falling back to frontmost call";
      v14 = v9;
      v15 = 2;
LABEL_33:
      _os_log_impl(&dword_218F27000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_34:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frontmostCall");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
}

void __59__ACCCommunicationsFeaturePlugin_sendDTMF_forCallWithUUID___block_invoke_60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "shouldPlayDTMFTone"))
  {
    v2 = *(int *)(a1 + 40);
    if (v2 > 0xB)
      v3 = 0;
    else
      v3 = byte_218F34B65[v2];
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "callUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109378;
      v11[1] = v3;
      v12 = 2112;
      v13 = v10;
      _os_log_impl(&dword_218F27000, v9, OS_LOG_TYPE_DEFAULT, "Playing DTMF Tone: 0x%02X, callUUID: %@", (uint8_t *)v11, 0x12u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "playDTMFToneForKey:", v3);
  }
  else
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 1;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_218F27000, v8, OS_LOG_TYPE_DEFAULT, "Playing DTMF tone isn't available - ignoring message", (uint8_t *)v11, 2u);
    }

  }
}

- (id)currentRecentsListWithCoalescing:(BOOL)a3 limit:(unint64_t)a4
{
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  unint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  int v34;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  uint64_t v55;
  int v56;
  int v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[9];
  _QWORD v84[9];
  uint8_t v85[128];
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  unint64_t v91;
  uint64_t v92;

  v5 = a3;
  v92 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = *MEMORY[0x24BE149C0];
    -[ACCCommunicationsFeaturePlugin chManager](self, "chManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCoalescingStrategy:", v7);

    -[ACCCommunicationsFeaturePlugin chManager](self, "chManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _recentCallsPredicate();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coalescedCallsWithPredicate:limit:offset:batchSize:", v10, a4, 0, 0);
  }
  else
  {
    -[ACCCommunicationsFeaturePlugin chManager](self, "chManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCoalescingStrategy:", 0);

    -[ACCCommunicationsFeaturePlugin chManager](self, "chManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _recentCallsPredicate();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callsWithPredicate:limit:offset:batchSize:", v10, a4, 0, 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v13 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCCommunicationsFeaturePlugin startPlugin].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = objc_msgSend(v12, "count");
    v16 = "NO";
    *(_DWORD *)buf = 134218498;
    v87 = v15;
    if (v5)
      v16 = "YES";
    v88 = 2080;
    v89 = v16;
    v90 = 2048;
    v91 = a4;
    _os_log_impl(&dword_218F27000, v13, OS_LOG_TYPE_INFO, "recentCalls.count: %lu (coalesce: %s, limit: %lu)", buf, 0x20u);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v12;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v74)
  {
    v72 = *(_QWORD *)v80;
    v71 = *MEMORY[0x24BE00B18];
    v70 = *MEMORY[0x24BE00AF8];
    v69 = *MEMORY[0x24BE00B08];
    v68 = *MEMORY[0x24BE00AF0];
    v67 = *MEMORY[0x24BE00B20];
    v66 = *MEMORY[0x24BE149A8];
    v65 = *MEMORY[0x24BE149B8];
    v64 = *MEMORY[0x24BE149B0];
    v57 = *MEMORY[0x24BE14998];
    v56 = *MEMORY[0x24BE149A0];
    v63 = *MEMORY[0x24BE00B28];
    v62 = *MEMORY[0x24BE14980];
    v17 = 0x24BDD1000uLL;
    v61 = *MEMORY[0x24BE00B30];
    HIDWORD(v55) = *MEMORY[0x24BE14970] | *MEMORY[0x24BE14958];
    LODWORD(v55) = *MEMORY[0x24BE14978] | *MEMORY[0x24BE14960];
    v60 = *MEMORY[0x24BE00B00];
    v59 = *MEMORY[0x24BE00B10];
    do
    {
      for (i = 0; i != v74; ++i)
      {
        if (*(_QWORD *)v80 != v72)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v83[0] = v71;
        objc_msgSend(v19, "callerId", v55);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (const __CFString *)v20;
        else
          v22 = &stru_24DA3CAB0;
        v84[0] = v22;
        v83[1] = v70;
        objc_msgSend(v19, "callerNameForDisplay");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        removeBidirectionalUnicodeCharacters(v23);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (const __CFString *)v24;
        else
          v26 = &stru_24DA3CAB0;
        v84[1] = v26;
        v83[2] = v69;
        objc_msgSend(v19, "callerIdSubStringForDisplay");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v27)
          v29 = (const __CFString *)v27;
        else
          v29 = &stru_24DA3CAB0;
        v84[2] = v29;
        v83[3] = v68;
        objc_msgSend(v19, "contactIdentifier");
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (const __CFString *)v30;
        else
          v32 = &stru_24DA3CAB0;
        v84[3] = v32;
        v83[4] = v67;
        v33 = *(void **)(v17 + 1760);
        v34 = objc_msgSend(v19, "callType");
        if ((v66 & v34) == 0 && (v65 & v34) == 0 && (v64 & v34) == 0)
        {
          if (v56 == v34)
            v38 = 3;
          else
            v38 = 0;
          if (v57 == v34)
            v37 = 2;
          else
            v37 = v38;
        }
        else
        {
          v37 = 1;
        }
        objc_msgSend(v33, "numberWithUnsignedInt:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v84[4] = v39;
        v83[5] = v63;
        v40 = *(void **)(v17 + 1760);
        v41 = objc_msgSend(v19, "callStatus");
        v77 = v23;
        v78 = v21;
        v75 = v28;
        v76 = v25;
        if ((v62 & v41) != 0)
        {
          v42 = 3;
        }
        else if ((HIDWORD(v55) & v41) != 0)
        {
          v42 = 1;
        }
        else
        {
          v42 = 2 * ((v55 & v41) != 0);
        }
        objc_msgSend(v40, "numberWithUnsignedInt:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v84[5] = v43;
        v83[6] = v61;
        v44 = *(void **)(v17 + 1760);
        objc_msgSend(v19, "date");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "timeIntervalSince1970");
        objc_msgSend(v44, "numberWithLongLong:", (uint64_t)v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v84[6] = v47;
        v83[7] = v60;
        v48 = *(void **)(v17 + 1760);
        objc_msgSend(v19, "duration");
        objc_msgSend(v48, "numberWithLong:", (uint64_t)v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v84[7] = v50;
        v83[8] = v59;
        v51 = v17;
        objc_msgSend(*(id *)(v17 + 1760), "numberWithChar:", (char)objc_msgSend(v19, "numberOfOccurrences"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v84[8] = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 9);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v51;
        objc_msgSend(v73, "addObject:", v53);

      }
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v74);
  }

  return v73;
}

- (id)currentFavoritesListWithLimit:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  char v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id obj;
  __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v76;
    v8 = *MEMORY[0x24BDBA210];
    v64 = *MEMORY[0x24BDBA248];
    v62 = *MEMORY[0x24BDBA200];
    v63 = *MEMORY[0x24BDBA208];
    v60 = *MEMORY[0x24BDBA348];
    v61 = *MEMORY[0x24BE00AE0];
    v55 = *MEMORY[0x24BDBA288];
    v59 = *MEMORY[0x24BE00AD0];
    v58 = *MEMORY[0x24BE00AD8];
    v57 = *MEMORY[0x24BE00AC8];
    v56 = *MEMORY[0x24BE00AE8];
    v65 = *MEMORY[0x24BDBA210];
    v66 = *(_QWORD *)v76;
    do
    {
      v9 = 0;
      v68 = v6;
      do
      {
        if (*(_QWORD *)v76 != v7)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * v9);
        objc_msgSend(v10, "actionType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v8);

        if (v12)
        {
          objc_msgSend(v10, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v63);

          if ((v14 & 1) != 0)
          {
            v15 = 1;
            goto LABEL_13;
          }
          v15 = 2;
        }
        else
        {
          objc_msgSend(v10, "actionType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v64);

          if (!v17)
            goto LABEL_34;
          v15 = 3;
        }
        objc_msgSend(v10, "bundleIdentifier", v55);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", v62);

        if (!v19)
          goto LABEL_34;
LABEL_13:

        v79[0] = v61;
        v20 = v10;
        objc_msgSend(v20, "contactProperty");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "key");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqual:", v60);

        objc_msgSend(v20, "contactProperty");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v23)
        {
          objc_msgSend(v24, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_20;
          objc_msgSend(v20, "contactProperty");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "value");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "stringValue");
          v30 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v24, "key");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqual:", v55);

          if (!v32)
            goto LABEL_20;
          objc_msgSend(v20, "contactProperty");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "value");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
LABEL_20:
            v36 = 0;
            goto LABEL_21;
          }
          objc_msgSend(v20, "contactProperty");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "value");
          v30 = objc_claimAutoreleasedReturnValue();
        }
        v36 = (const __CFString *)v30;

LABEL_21:
        v70 = (__CFString *)v36;

        if (v36)
          v37 = v36;
        else
          v37 = &stru_24DA3CAB0;
        v80[0] = v37;
        v79[1] = v59;
        objc_msgSend(v20, "name", v55);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        removeBidirectionalUnicodeCharacters(v74);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v38;
        if (v38)
          v40 = (const __CFString *)v38;
        else
          v40 = &stru_24DA3CAB0;
        v80[1] = v40;
        v79[2] = v58;
        v41 = (void *)MEMORY[0x24BDBAD38];
        objc_msgSend(v20, "contactProperty");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "label");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "contactProperty");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "key");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedDisplayStringForLabel:propertyName:", v71, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _overrideLabelForFaceTime(v43, v15);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v44;
        if (v44)
          v46 = (const __CFString *)v44;
        else
          v46 = &stru_24DA3CAB0;
        v80[2] = v46;
        v79[3] = v57;
        objc_msgSend(v20, "contactProperty");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "contact");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "identifier");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v15;
        v51 = (void *)v49;
        if (v49)
          v52 = (const __CFString *)v49;
        else
          v52 = &stru_24DA3CAB0;
        v80[3] = v52;
        v79[4] = v56;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v50);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v80[4] = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 5);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "addObject:", v10);
        v8 = v65;
        v7 = v66;
        v6 = v68;
LABEL_34:

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v6);
  }

  return v67;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCCommunicationsCenter)commCenter
{
  return self->_commCenter;
}

- (void)setCommCenter:(id)a3
{
  objc_storeStrong((id *)&self->_commCenter, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (VMVoicemailManager)vmManager
{
  return self->_vmManager;
}

- (void)setVmManager:(id)a3
{
  objc_storeStrong((id *)&self->_vmManager, a3);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)setRadiosPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPreferences, a3);
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
  objc_storeStrong((id *)&self->_chManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chManager, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_vmManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_commCenter, 0);
}

- (void)callStateDidChangeNotification:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_218F27000, a2, v4, "Calling callStateDidChange (from %@)...", (uint8_t *)&v5);

  OUTLINED_FUNCTION_9();
}

- (void)callStateDidChangeNotification:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218F27000, v0, v1, "Spoofing TUCallModelChangedNotification NSNotification...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)callStateDidChangeNotification:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_218F27000, v0, v1, "Creating CallCountDidChangeNotification NSNotification...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initiateCallToDestination:withService:addressBookID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218F27000, v0, v1, "Unknown call service - ignoring request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initiateRedial
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_218F27000, a2, a3, "lastOutgoingCall:\n%{private}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_218F27000, v0, v1, "Found call with UUID: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218F27000, v0, v1, "Unknown accept action - ignoring request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __64__ACCCommunicationsFeaturePlugin_acceptCallWithAction_callUUID___block_invoke_57_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218F27000, v0, v1, "Unknown accept call state - ignoring request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __61__ACCCommunicationsFeaturePlugin_endCallWithAction_callUUID___block_invoke_58_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218F27000, v0, v1, "Unknown end action - ignoring request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)sendDTMF:(int)a1 forCallWithUUID:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218F27000, a2, OS_LOG_TYPE_ERROR, "Invalid tone: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

@end
