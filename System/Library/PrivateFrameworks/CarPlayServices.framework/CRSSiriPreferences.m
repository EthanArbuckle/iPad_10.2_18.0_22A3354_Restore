@implementation CRSSiriPreferences

- (CRSSiriPreferences)init
{
  CRSSiriPreferences *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  id v5;
  void *v6;
  uint64_t v7;
  CARObserverHashTable *observers;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRSSiriPreferences;
  v2 = -[CRSSiriPreferences init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CRSSiriPreferences", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc(MEMORY[0x24BE15228]);
    -[CRSSiriPreferences queue](v2, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithProtocol:callbackQueue:", &unk_254B4B9D0, v6);
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__siriPreferencesDidChange, *MEMORY[0x24BE08EB8], 0);

    -[CRSSiriPreferences _siriPreferencesDidChange](v2, "_siriPreferencesDidChange");
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSSiriPreferences observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSSiriPreferences observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (int64_t)carPlayAnnounceEnablementType
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CRSSiriPreferences_carPlayAnnounceEnablementType__block_invoke;
  v6[3] = &unk_24CD38820;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__CRSSiriPreferences_carPlayAnnounceEnablementType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedCarPlayAnnounceEnablementType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setCarPlayAnnounceEnablementType:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsInCarPlayType:", a3);

}

- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled
{
  CRSSiriPreferences *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__CRSSiriPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke;
  v5[3] = &unk_24CD38820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __71__CRSSiriPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedAnnounceNotificationsInCarPlayTemporarilyDisabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSendInCarPlayEnabled
{
  CRSSiriPreferences *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__CRSSiriPreferences_autoSendInCarPlayEnabled__block_invoke;
  v5[3] = &unk_24CD38820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __46__CRSSiriPreferences_autoSendInCarPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedAutoSendInCarPlayEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)autoSendInHeadphonesEnabled
{
  CRSSiriPreferences *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__CRSSiriPreferences_autoSendInHeadphonesEnabled__block_invoke;
  v5[3] = &unk_24CD38820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __49__CRSSiriPreferences_autoSendInHeadphonesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedAutoSendInHeadphonesEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)mainAutoSendEnabled
{
  CRSSiriPreferences *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__CRSSiriPreferences_mainAutoSendEnabled__block_invoke;
  v5[3] = &unk_24CD38820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__CRSSiriPreferences_mainAutoSendEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedMainAutoSendEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)showAppsBehindSiriInCarPlayEnabled
{
  CRSSiriPreferences *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CRSSiriPreferences queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__CRSSiriPreferences_showAppsBehindSiriInCarPlayEnabled__block_invoke;
  v5[3] = &unk_24CD38820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __56__CRSSiriPreferences_showAppsBehindSiriInCarPlayEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cachedShowAppsBehindSiriInCarPlayEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnnounceNotificationsInCarPlayTemporarilyDisabled:", v3);

}

- (void)clearAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  id v2;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearAnnounceNotificationsInCarPlayTemporarilyDisabled");

}

- (void)_siriPreferencesDidChange
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke;
  v19[3] = &unk_24CD38848;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v2, "getAnnounceNotificationsInCarPlayTypeWithCompletion:", v19);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_2;
  v17[3] = &unk_24CD38870;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:", v17);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_3;
  v15[3] = &unk_24CD38870;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v5, "getMessageWithoutConfirmationInCarPlayEnabledWithCompletion:", v15);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_4;
  v13[3] = &unk_24CD38870;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "getMessageWithoutConfirmationHeadphonesEnabledWithCompletion:", v13);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_5;
  v11[3] = &unk_24CD38870;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "getMessageWithoutConfirmationEnabledWithCompletion:", v11);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_6;
  v9[3] = &unk_24CD38870;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "getShowAppsBehindSiriInCarPlayEnabledWithCompletion:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCarPlayAnnounceEnablementType:", a2);

}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:", a2);

}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAutoSendInCarPlayEnabled:", a2);

}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAutoSendInHeadphonesEnabled:", a2);

}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMainAutoSendEnabled:", a2);

}

void __47__CRSSiriPreferences__siriPreferencesDidChange__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateShowAppsBehindSiriInCarPlayEnabled:", a2);

}

- (void)_updateAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__CRSSiriPreferences__updateAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke;
  v6[3] = &unk_24CD38898;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __79__CRSSiriPreferences__updateAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedAnnounceNotificationsInCarPlayTemporarilyDisabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferences:announceNotificationsInCarPlayTemporarilyDisabledChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_updateCarPlayAnnounceEnablementType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__CRSSiriPreferences__updateCarPlayAnnounceEnablementType___block_invoke;
  v6[3] = &unk_24CD388C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __59__CRSSiriPreferences__updateCarPlayAnnounceEnablementType___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "cachedCarPlayAnnounceEnablementType") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedCarPlayAnnounceEnablementType:");
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferences:carPlayAnnounceEnablementTypeChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_updateAutoSendInCarPlayEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CRSSiriPreferences__updateAutoSendInCarPlayEnabled___block_invoke;
  v6[3] = &unk_24CD38898;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __54__CRSSiriPreferences__updateAutoSendInCarPlayEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedAutoSendInCarPlayEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedAutoSendInCarPlayEnabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferences:autoSendInCarPlayEnabledChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_updateAutoSendInHeadphonesEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__CRSSiriPreferences__updateAutoSendInHeadphonesEnabled___block_invoke;
  v6[3] = &unk_24CD38898;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __57__CRSSiriPreferences__updateAutoSendInHeadphonesEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedAutoSendInHeadphonesEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedAutoSendInHeadphonesEnabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferences:autoSendInHeadphonesEnabledChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_updateMainAutoSendEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CRSSiriPreferences__updateMainAutoSendEnabled___block_invoke;
  v6[3] = &unk_24CD38898;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __49__CRSSiriPreferences__updateMainAutoSendEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedMainAutoSendEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedMainAutoSendEnabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferences:mainAutoSendEnabledChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_updateShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CRSSiriPreferences queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__CRSSiriPreferences__updateShowAppsBehindSiriInCarPlayEnabled___block_invoke;
  v6[3] = &unk_24CD38898;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __64__CRSSiriPreferences__updateShowAppsBehindSiriInCarPlayEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "cachedShowAppsBehindSiriInCarPlayEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedShowAppsBehindSiriInCarPlayEnabled:", v3 != 0);
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferences:showAppsBehindSiriInCarPlayEnabledChanged:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)setAutoSendInCarPlayEnabled:(BOOL)a3
{
  self->_autoSendInCarPlayEnabled = a3;
}

- (void)setAutoSendInHeadphonesEnabled:(BOOL)a3
{
  self->_autoSendInHeadphonesEnabled = a3;
}

- (void)setMainAutoSendEnabled:(BOOL)a3
{
  self->_mainAutoSendEnabled = a3;
}

- (void)setShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  self->_showAppsBehindSiriInCarPlayEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)cachedCarPlayAnnounceEnablementType
{
  return self->_cachedCarPlayAnnounceEnablementType;
}

- (void)setCachedCarPlayAnnounceEnablementType:(int64_t)a3
{
  self->_cachedCarPlayAnnounceEnablementType = a3;
}

- (BOOL)cachedAnnounceNotificationsInCarPlayTemporarilyDisabled
{
  return self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled;
}

- (void)setCachedAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  self->_cachedAnnounceNotificationsInCarPlayTemporarilyDisabled = a3;
}

- (BOOL)cachedAutoSendInCarPlayEnabled
{
  return self->_cachedAutoSendInCarPlayEnabled;
}

- (void)setCachedAutoSendInCarPlayEnabled:(BOOL)a3
{
  self->_cachedAutoSendInCarPlayEnabled = a3;
}

- (BOOL)cachedAutoSendInHeadphonesEnabled
{
  return self->_cachedAutoSendInHeadphonesEnabled;
}

- (void)setCachedAutoSendInHeadphonesEnabled:(BOOL)a3
{
  self->_cachedAutoSendInHeadphonesEnabled = a3;
}

- (BOOL)cachedMainAutoSendEnabled
{
  return self->_cachedMainAutoSendEnabled;
}

- (void)setCachedMainAutoSendEnabled:(BOOL)a3
{
  self->_cachedMainAutoSendEnabled = a3;
}

- (BOOL)cachedShowAppsBehindSiriInCarPlayEnabled
{
  return self->_cachedShowAppsBehindSiriInCarPlayEnabled;
}

- (void)setCachedShowAppsBehindSiriInCarPlayEnabled:(BOOL)a3
{
  self->_cachedShowAppsBehindSiriInCarPlayEnabled = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
