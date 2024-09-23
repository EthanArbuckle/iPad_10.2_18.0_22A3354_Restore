@implementation FCPuzzleTypeSettings

void __48__FCPuzzleTypeSettings_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_storeStrong((id *)(v3 + 16), v2);

  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[3];
  v5 = v4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v11) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v5, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v13 = v12;
            else
              v13 = 0;
          }
          else
          {
            v13 = 0;
          }
          v14 = v13;

          if (v14)
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("puzzleTypeID"));
            v15 = objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)v15;
              objc_msgSend(v14, "objectForKey:", CFSTR("settingsData"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {

                goto LABEL_21;
              }
              objc_msgSend(v14, "objectForKey:", CFSTR("lastSeenPuzzleIDs"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
LABEL_21:
                v19 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v11, v14);
                if (v19)
                {
                  v20 = *(_QWORD **)(v23 + 32);
                  if (v20)
                    v20 = (_QWORD *)v20[2];
                  v21 = v20;
                  objc_msgSend(v19, "puzzleTypeID");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setObject:forKey:", v19, v22);

                }
              }
            }
          }

          continue;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *entriesLock;
  _QWORD v3[5];

  if (self)
    entriesLock = self->_entriesLock;
  else
    entriesLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__FCPuzzleTypeSettings_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](entriesLock, "performWriteSync:", v3);
}

- (FCPuzzleTypeSettings)initWithStore:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  FCPuzzleTypeSettings *v9;
  FCMTWriterLock *v10;
  FCMTWriterLock *entriesLock;
  uint64_t v12;
  NSMutableDictionary *entriesByPuzzleTypeID;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCPuzzleTypeSettings;
  v9 = -[FCPuzzleTypeSettings init](&v16, sel_init);
  if (v9)
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "store");
      *(_DWORD *)buf = 136315906;
      v18 = "-[FCPuzzleTypeSettings initWithStore:delegate:]";
      v19 = 2080;
      v20 = "FCPuzzleTypeSettings.m";
      v21 = 1024;
      v22 = 46;
      v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_storeStrong((id *)&v9->_localStore, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10 = objc_alloc_init(FCMTWriterLock);
    entriesLock = v9->_entriesLock;
    v9->_entriesLock = v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    entriesByPuzzleTypeID = v9->_entriesByPuzzleTypeID;
    v9->_entriesByPuzzleTypeID = (NSMutableDictionary *)v12;

  }
  return v9;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  FCModifyPuzzleTypeSettingsCommand *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  FCModifyPuzzleTypeSettingsCommand *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v9) & 1) == 0)
        {
          objc_opt_class();
          objc_msgSend(v3, "objectForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v11 = v10;
            else
              v11 = 0;
          }
          else
          {
            v11 = 0;
          }
          v12 = v11;

          if (v12)
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("puzzleTypeID"));
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;
              objc_msgSend(v12, "objectForKey:", CFSTR("settingsData"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {

                goto LABEL_17;
              }
              objc_msgSend(v12, "objectForKey:", CFSTR("lastSeenPuzzleIDs"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
LABEL_17:
                v17 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v9, v12);
                objc_msgSend(v21, "addObject:", v17);

              }
            }
          }

          continue;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v18 = -[FCModifyPuzzleTypeSettingsCommand initWithPuzzleTypeSettingsEntries:merge:]([FCModifyPuzzleTypeSettingsCommand alloc], "initWithPuzzleTypeSettingsEntries:merge:", v21, 1);
  v26 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)syncForPuzzleTypeID:(id)a3
{
  id *p_isa;
  void *v4;
  FCModifyPuzzleTypeSettingsCommand *v5;
  void *v6;
  FCModifyPuzzleTypeSettingsCommand *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_isa = (id *)&self->super.isa;
    -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [FCModifyPuzzleTypeSettingsCommand alloc];
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[FCModifyPuzzleTypeSettingsCommand initWithPuzzleTypeSettingsEntries:merge:](v5, "initWithPuzzleTypeSettingsEntries:merge:", v6, 1);

      if (p_isa)
        p_isa = (id *)objc_loadWeakRetained(p_isa + 4);
      objc_msgSend(p_isa, "addModifyPuzzleTypeSettingsCommandToCommandQueue:", v7);

    }
  }
}

- (id)_puzzleTypeSettingsEntryForPuzzleTypeID:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__71;
    v15 = __Block_byref_object_dispose__71;
    v16 = 0;
    if (v3)
    {
      v5 = a1[1];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64__FCPuzzleTypeSettings__puzzleTypeSettingsEntryForPuzzleTypeID___block_invoke;
      v8[3] = &unk_1E463AD58;
      v10 = &v11;
      v8[4] = a1;
      v9 = v4;
      objc_msgSend(v5, "performReadSync:", v8);

      v6 = (void *)v12[5];
    }
    else
    {
      v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);

  }
  return a1;
}

- (void)setSettingsData:(id)a3 puzzleTypeID:(id)a4
{
  -[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]((uint64_t)self, a3, 0, a4);
}

- (void)setSettingsData:(void *)a3 lastSeenPuzzleIDs:(void *)a4 puzzleTypeID:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  FCPuzzleTypeSettingsEntry *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  FCPuzzleTypeSettingsEntry *v25;
  FCModifyPuzzleTypeSettingsCommand *v26;
  void *v27;
  FCModifyPuzzleTypeSettingsCommand *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  _QWORD v32[5];
  FCPuzzleTypeSettingsEntry *v33;
  id v34;
  FCPuzzleTypeSettingsEntry *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ps-%@"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = (void *)objc_msgSend(v11, "mutableCopy");
        v14 = v13;
        if (v7)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("settingsData"));
        if (v8)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, CFSTR("lastSeenPuzzleIDs"));
        v15 = (FCPuzzleTypeSettingsEntry *)-[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v10, v14);

        if (v15)
          goto LABEL_9;
      }
      else
      {
        v15 = -[FCPuzzleTypeSettingsEntry initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:]([FCPuzzleTypeSettingsEntry alloc], "initWithEntryID:puzzleTypeID:settingsData:lastSeenPuzzleIDs:", v10, v9, v7, v8);
        if (v15)
        {
LABEL_9:
          -[FCPuzzleTypeSettingsEntry puzzleTypeID](v15, "puzzleTypeID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("puzzleTypeSettingsEntry must have a puzzleTypeID"));
            *(_DWORD *)buf = 136315906;
            v37 = "-[FCPuzzleTypeSettingsEntry(FCPuzzleTypeSettings) dictionaryRepresentation]";
            v38 = 2080;
            v39 = "FCPuzzleTypeSettings.m";
            v40 = 1024;
            v41 = 341;
            v42 = 2114;
            v43 = v31;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCPuzzleTypeSettingsEntry puzzleTypeID](v15, "puzzleTypeID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[FCPuzzleTypeSettingsEntry puzzleTypeID](v15, "puzzleTypeID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("puzzleTypeID"));

          }
          -[FCPuzzleTypeSettingsEntry settingsData](v15, "settingsData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            -[FCPuzzleTypeSettingsEntry settingsData](v15, "settingsData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("settingsData"));

          }
          -[FCPuzzleTypeSettingsEntry lastSeenPuzzleIDs](v15, "lastSeenPuzzleIDs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[FCPuzzleTypeSettingsEntry lastSeenPuzzleIDs](v15, "lastSeenPuzzleIDs");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("lastSeenPuzzleIDs"));

          }
          objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v17, v10);
          v24 = *(void **)(a1 + 8);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __71__FCPuzzleTypeSettings_setSettingsData_lastSeenPuzzleIDs_puzzleTypeID___block_invoke;
          v32[3] = &unk_1E463B228;
          v32[4] = a1;
          v25 = v15;
          v33 = v25;
          v34 = v9;
          objc_msgSend(v24, "performWriteSync:", v32);
          v26 = [FCModifyPuzzleTypeSettingsCommand alloc];
          v35 = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[FCModifyPuzzleTypeSettingsCommand initWithPuzzleTypeSettingsEntries:merge:](v26, "initWithPuzzleTypeSettingsEntries:merge:", v27, 1);

          WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          objc_msgSend(WeakRetained, "addModifyPuzzleTypeSettingsCommandToCommandQueue:", v28);

LABEL_24:
          goto LABEL_25;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
        *(_DWORD *)buf = 136315906;
        v37 = "-[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]";
        v38 = 2080;
        v39 = "FCPuzzleTypeSettings.m";
        v40 = 1024;
        v41 = 171;
        v42 = 2114;
        v43 = v30;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeID != nil");
      *(_DWORD *)buf = 136315906;
      v37 = "-[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]";
      v38 = 2080;
      v39 = "FCPuzzleTypeSettings.m";
      v40 = 1024;
      v41 = 138;
      v42 = 2114;
      v43 = v10;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_25:

    }
  }

}

- (void)setLastSeenPuzzleIDs:(id)a3 puzzleTypeID:(id)a4
{
  -[FCPuzzleTypeSettings setSettingsData:lastSeenPuzzleIDs:puzzleTypeID:]((uint64_t)self, 0, a3, a4);
}

uint64_t __71__FCPuzzleTypeSettings_setSettingsData_lastSeenPuzzleIDs_puzzleTypeID___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (id)settingsDataForPuzzleTypeID:(id)a3
{
  void *v3;
  void *v4;

  -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastSeenPuzzleIDsForPuzzleTypeID:(id)a3
{
  void *v3;
  void *v4;

  -[FCPuzzleTypeSettings _puzzleTypeSettingsEntryForPuzzleTypeID:]((id *)&self->super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSeenPuzzleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleSyncWithPuzzleTypeSettingsRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCKeyValueStore *localStore;
  FCKeyValueStore *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  FCMTWriterLock *entriesLock;
  id v18;
  id WeakRetained;
  FCPuzzleTypeSettingsEntry *v20;
  void *v21;
  id v22;
  FCMTWriterLock *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settingsData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastSeenPuzzleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  v8 = localStore;
  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCKeyValueStore objectForKey:](v8, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    v14 = v13;
    if (v26)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("settingsData"));
    if (v6)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, CFSTR("lastSeenPuzzleIDs"));
    -[FCKeyValueStore setObject:forKey:](v8, "setObject:forKey:", v14, v10);
    if (v5)
    {
      v15 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCPuzzleTypeSettingsEntry alloc], v10, v14);
      v16 = v15;
      if (self)
        entriesLock = self->_entriesLock;
      else
        entriesLock = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke_2;
      v27[3] = &unk_1E463B228;
      v27[4] = self;
      v28 = v15;
      v29 = v5;
      v18 = v16;
      -[FCMTWriterLock performWriteSync:](entriesLock, "performWriteSync:", v27);

    }
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "settingsDataDidChangeForPuzzleTypeID:", v5);
LABEL_25:

    goto LABEL_26;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v5, CFSTR("puzzleTypeID"));
    if (v26)
      objc_msgSend(v14, "setObject:forKey:", v26, CFSTR("settingsData"));
    if (v6)
      objc_msgSend(v14, "setObject:forKey:", v6, CFSTR("lastSeenPuzzleIDs"));
    v20 = [FCPuzzleTypeSettingsEntry alloc];
    v21 = (void *)objc_msgSend(v14, "copy");
    v22 = -[FCPuzzleTypeSettingsEntry initWithEntryID:dictionaryRepresentation:](v20, v10, v21);

    if (self)
      v23 = self->_entriesLock;
    else
      v23 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke;
    v30[3] = &unk_1E463B228;
    v30[4] = self;
    WeakRetained = v22;
    v31 = WeakRetained;
    v24 = v5;
    v32 = v24;
    -[FCMTWriterLock performWriteSync:](v23, "performWriteSync:", v30);
    if (self)
      self = (FCPuzzleTypeSettings *)objc_loadWeakRetained((id *)&self->_delegate);
    -[FCPuzzleTypeSettings settingsDataDidChangeForPuzzleTypeID:](self, "settingsDataDidChangeForPuzzleTypeID:", v24);

    -[FCKeyValueStore setObject:forKey:](v8, "setObject:forKey:", v14, v10);
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a puzzleTypeSettings entry without a puzzleTypeID"));
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCPuzzleTypeSettings handleSyncWithPuzzleTypeSettingsRecord:]";
    v35 = 2080;
    v36 = "FCPuzzleTypeSettings.m";
    v37 = 1024;
    v38 = 211;
    v39 = 2114;
    v40 = v25;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_26:

}

uint64_t __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

uint64_t __63__FCPuzzleTypeSettings_handleSyncWithPuzzleTypeSettingsRecord___block_invoke_2(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "setObject:forKey:", a1[5], a1[6]);
}

- (void)handleSyncWithDeletedPuzzleTypeSettingsRecordName:(id)a3
{
  id v4;
  FCKeyValueStore *localStore;
  void *v6;
  FCKeyValueStore *v7;
  void *v8;
  void *v9;
  FCMTWriterLock *entriesLock;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  FCPuzzleTypeSettings *v16;
  id v17;

  v4 = a3;
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (self)
      v7 = self->_localStore;
    else
      v7 = 0;
    -[FCKeyValueStore removeObjectForKey:](v7, "removeObjectForKey:", v4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("puzzleTypeID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (self)
        entriesLock = self->_entriesLock;
      else
        entriesLock = 0;
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __74__FCPuzzleTypeSettings_handleSyncWithDeletedPuzzleTypeSettingsRecordName___block_invoke;
      v15 = &unk_1E463AD10;
      v16 = self;
      v11 = v8;
      v17 = v11;
      -[FCMTWriterLock performWriteSync:](entriesLock, "performWriteSync:", &v12);
      if (self)
        self = (FCPuzzleTypeSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      -[FCPuzzleTypeSettings settingsDataDidChangeForPuzzleTypeID:](self, "settingsDataDidChangeForPuzzleTypeID:", v11, v12, v13, v14, v15, v16);

    }
  }

}

uint64_t __74__FCPuzzleTypeSettings_handleSyncWithDeletedPuzzleTypeSettingsRecordName___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[2];
  return objc_msgSend(v1, "fc_safelySetObject:forKey:", 0, *(_QWORD *)(a1 + 40));
}

- (id)allPuzzleTypeSettingsRecordNames
{
  void *v2;
  void *v3;

  -[FCPuzzleTypeSettings _allEntriesInPuzzleTypeSettings]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_165);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allEntriesInPuzzleTypeSettings
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__71;
    v9 = __Block_byref_object_dispose__71;
    v10 = 0;
    v2 = a1[1];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__FCPuzzleTypeSettings__allEntriesInPuzzleTypeSettings__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

uint64_t __56__FCPuzzleTypeSettings_allPuzzleTypeSettingsRecordNames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)allPuzzleTypeSettingsRecords
{
  void *v2;
  void *v3;

  -[FCPuzzleTypeSettings _allEntriesInPuzzleTypeSettings]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_21_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__FCPuzzleTypeSettings_allPuzzleTypeSettingsRecords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

void __64__FCPuzzleTypeSettings__puzzleTypeSettingsEntryForPuzzleTypeID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __55__FCPuzzleTypeSettings__allEntriesInPuzzleTypeSettings__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[2];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_entriesByPuzzleTypeID, 0);
  objc_storeStrong((id *)&self->_entriesLock, 0);
}

@end
