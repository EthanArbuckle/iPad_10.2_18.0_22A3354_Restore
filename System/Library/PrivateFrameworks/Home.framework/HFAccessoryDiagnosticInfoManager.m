@implementation HFAccessoryDiagnosticInfoManager

- (HFAccessoryDiagnosticInfoManager)initWithDispatcher:(id)a3
{
  id v4;
  HFAccessoryDiagnosticInfoManager *v5;
  uint64_t v6;
  NSMapTable *accessoryUniqueIDToDiagnosticInfoMapTable;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryDiagnosticInfoManager;
  v5 = -[HFAccessoryDiagnosticInfoManager init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    accessoryUniqueIDToDiagnosticInfoMapTable = v5->_accessoryUniqueIDToDiagnosticInfoMapTable;
    v5->_accessoryUniqueIDToDiagnosticInfoMapTable = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    objc_storeWeak((id *)&v5->_dispatcher, v4);
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessoryDiagnosticInfoManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (HFAccessoryDiagnosticInfoManager)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDispatcher_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryDiagnosticInfoManager.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryDiagnosticInfoManager init]",
    v5);

  return 0;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessoryDiagnosticInfoManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)fetchDiagnosticInfoForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HFAccessoryDiagnosticInfoManager *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HFAccessoryDiagnosticInfoManager dispatcher](self, "dispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HFAccessoryDiagnosticInfoManager_fetchDiagnosticInfoForAccessory___block_invoke;
  v13[3] = &unk_1EA72E128;
  v14 = v4;
  v15 = self;
  v8 = v5;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v7, "fetchAppleMediaAccesoryDiagnosticInfo:options:completion:", v9, 3, v13);

  v10 = v16;
  v11 = v8;

  return v11;
}

void __68__HFAccessoryDiagnosticInfoManager_fetchDiagnosticInfoForAccessory___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1[4], "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "There was an error fetching diagnostic info for accessory: %@, with error: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  if (v5)
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Fetched diagnostic info: %@ for accessory: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(a1[5], "accessoryUniqueIDToDiagnosticInfoMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v5, v12);

    objc_msgSend(a1[5], "_notifyObserversOfReceivedDiagnosticInfo:forAccessory:", v5, a1[4]);
  }
  objc_msgSend(a1[6], "finishWithResult:error:", v5, v6);

}

- (BOOL)hasDiagnosticInfoForAccessory:(id)a3
{
  void *v3;
  BOOL v4;

  -[HFAccessoryDiagnosticInfoManager _diagnosticInfoForAccessory:](self, "_diagnosticInfoForAccessory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isCDPStatusGoodForAccessory:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[HFAccessoryDiagnosticInfoManager hasDiagnosticInfoForAccessory:](self, "hasDiagnosticInfoForAccessory:", v4))
  {
    -[HFAccessoryDiagnosticInfoManager _diagnosticInfoForAccessory:](self, "_diagnosticInfoForAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "cdpStatusGood");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)wifiNetworkInfoForAccessory:(id)a3
{
  void *v3;
  void *v4;

  -[HFAccessoryDiagnosticInfoManager _diagnosticInfoForAccessory:](self, "_diagnosticInfoForAccessory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wifiInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)softwareVersionForAccessory:(id)a3
{
  void *v3;
  void *v4;

  -[HFAccessoryDiagnosticInfoManager _diagnosticInfoForAccessory:](self, "_diagnosticInfoForAccessory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_notifyObserversOfReceivedDiagnosticInfo:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HFAccessoryDiagnosticInfoManager observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "didUpdateDiagnosticInfo:forAccessory:", v6, v7, (_QWORD)v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (id)_diagnosticInfoForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFAccessoryDiagnosticInfoManager accessoryUniqueIDToDiagnosticInfoMapTable](self, "accessoryUniqueIDToDiagnosticInfoMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFHomeKitDispatcher)dispatcher
{
  return (HFHomeKitDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (void)setDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_dispatcher, a3);
}

- (NSMapTable)accessoryUniqueIDToDiagnosticInfoMapTable
{
  return self->_accessoryUniqueIDToDiagnosticInfoMapTable;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessoryUniqueIDToDiagnosticInfoMapTable, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
}

@end
