@implementation FCTagSettings

- (id)webAccessOptedInTagIDs
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FCTagSettings_webAccessOptedInTagIDs__block_invoke;
  v6[3] = &unk_1E4644658;
  v4 = v3;
  v7 = v4;
  -[FCTagSettings enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  FCKeyValueStore *localStore;
  FCKeyValueStore *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  FCKeyValueStore *v25;
  FCTagSettings *v26;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    objc_storeStrong((id *)&self->_tagSettingsEntriesByTagID, v3);

    localStore = self->_localStore;
  }
  else
  {

    localStore = 0;
  }
  v6 = localStore;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[FCKeyValueStore allKeys](v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v11 = CFSTR("tagID");
    do
    {
      v12 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12);
        if ((objc_msgSend((id)objc_opt_class(), "isLocalStoreKeyInternal:", v13) & 1) == 0)
        {
          objc_opt_class();
          -[FCKeyValueStore objectForKey:](v6, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
          }
          else
          {
            v15 = 0;
          }
          v16 = v15;

          if (!v16)
            goto LABEL_27;
          objc_msgSend(v16, "objectForKey:", v11);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_27;
          v18 = (void *)v17;
          objc_msgSend(v16, "objectForKey:", CFSTR("fontMultiplier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19
            || (objc_msgSend(v16, "objectForKey:", CFSTR("fontMultiplierMacOS")),
                (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v16, "objectForKey:", CFSTR("contentScale")),
                (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
LABEL_21:

          }
          else
          {
            objc_msgSend(v16, "objectForKey:", CFSTR("contentScaleMacOS"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {

              v19 = 0;
              goto LABEL_21;
            }
            objc_msgSend(v16, "objectForKey:", CFSTR("accessToken"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
LABEL_27:

              goto LABEL_28;
            }
          }
          v21 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v16);
          if (v21)
          {
            v22 = v10;
            v23 = v11;
            v24 = v7;
            v25 = v6;
            if (self)
            {
              v26 = self;
              tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
            }
            else
            {
              v26 = 0;
              tagSettingsEntriesByTagID = 0;
            }
            v28 = tagSettingsEntriesByTagID;
            objc_msgSend(v21, "tagID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v21, v29);

            self = v26;
            v6 = v25;
            v7 = v24;
            v11 = v23;
            v10 = v22;
            v9 = v32;
          }

          goto LABEL_27;
        }
LABEL_28:
        ++v12;
      }
      while (v9 != v12);
      v31 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v9 = v31;
    }
    while (v31);
  }

}

- (FCTagSettings)initWithStore:(id)a3 tagSettingsDelegate:(id)a4
{
  id v7;
  id v8;
  FCTagSettings *v9;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCTagSettings;
  v9 = -[FCTagSettings init](&v12, sel_init);
  if (v9)
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "store");
      *(_DWORD *)buf = 136315906;
      v14 = "-[FCTagSettings initWithStore:tagSettingsDelegate:]";
      v15 = 2080;
      v16 = "FCTagSettings.m";
      v17 = 1024;
      v18 = 43;
      v19 = 2114;
      v20 = v11;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_storeStrong((id *)&v9->_localStore, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
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
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  FCModifyTagSettingsCommand *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8);
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

          if (!v12)
            goto LABEL_23;
          objc_msgSend(v12, "objectForKey:", CFSTR("tagID"));
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
            goto LABEL_23;
          v14 = (void *)v13;
          objc_msgSend(v12, "objectForKey:", CFSTR("fontMultiplier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (objc_msgSend(v12, "objectForKey:", CFSTR("fontMultiplierMacOS")),
                (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (objc_msgSend(v12, "objectForKey:", CFSTR("contentScale")),
                (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
LABEL_19:

          }
          else
          {
            objc_msgSend(v12, "objectForKey:", CFSTR("contentScaleMacOS"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {

              v15 = 0;
              goto LABEL_19;
            }
            objc_msgSend(v12, "objectForKey:", CFSTR("accessToken"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
LABEL_23:

              goto LABEL_24;
            }
          }
          v17 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v12);
          if (v17)
            objc_msgSend(v23, "addObject:", v17);

          goto LABEL_23;
        }
LABEL_24:
        ++v8;
      }
      while (v6 != v8);
      v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v6 = v19;
    }
    while (v19);
  }

  v20 = -[FCModifyTagSettingsCommand initWithTagSettingsEntries:merge:]([FCModifyTagSettingsCommand alloc], "initWithTagSettingsEntries:merge:", v23, 1);
  objc_msgSend(v22, "addObject:", v20);

  return v22;
}

- (void)syncForTagID:(id)a3
{
  id *p_isa;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  NSMutableDictionary *v6;
  void *v7;
  FCModifyTagSettingsCommand *v8;
  void *v9;
  FCModifyTagSettingsCommand *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_isa = (id *)&self->super.isa;
    if (self)
      tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
    else
      tagSettingsEntriesByTagID = 0;
    v6 = tagSettingsEntriesByTagID;
    -[NSMutableDictionary objectForKey:](v6, "objectForKey:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [FCModifyTagSettingsCommand alloc];
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[FCModifyTagSettingsCommand initWithTagSettingsEntries:merge:](v8, "initWithTagSettingsEntries:merge:", v9, 1);

      if (p_isa)
        p_isa = (id *)objc_loadWeakRetained(p_isa + 3);
      objc_msgSend(p_isa, "addModifyTagSettingsCommandToCommandQueue:", v10);

    }
  }
}

- (void)setFontSizeForTagID:(id)a3 fontSize:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FCKeyValueStore *localStore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCTagSettingsEntry *v14;
  FCTagSettingsEntry *v15;
  FCTagSettingsEntry *v16;
  void *v17;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      v13 = v12;
      if (v7)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("fontMultiplier"));
      else
        objc_msgSend(v12, "removeObjectForKey:", CFSTR("fontMultiplier"));
      v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v13);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      v15 = -[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:](v14, "initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:", v13, v6, v7, 0, 0, 0, 0, v20);
    }
    v16 = v15;

    if (v16)
    {
      -[FCTagSettingsEntry dictionaryRepresentation](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v17, v8);
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        objc_msgSend(0, "setObject:forKey:", v17, v8);
        tagSettingsEntriesByTagID = 0;
      }
      -[NSMutableDictionary setObject:forKey:](tagSettingsEntriesByTagID, "setObject:forKey:", v16, v6);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCTagSettings setFontSizeForTagID:fontSize:]";
      v23 = 2080;
      v24 = "FCTagSettings.m";
      v25 = 1024;
      v26 = 188;
      v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCTagSettings setFontSizeForTagID:fontSize:]";
    v23 = 2080;
    v24 = "FCTagSettings.m";
    v25 = 1024;
    v26 = 135;
    v27 = 2114;
    v28 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:

  }
}

- (id)fontSizeForTagID:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  -[FCTagSettings objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontMultiplier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setContentScaleForTagID:(id)a3 contentScale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FCKeyValueStore *localStore;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCTagSettingsEntry *v14;
  FCTagSettingsEntry *v15;
  FCTagSettingsEntry *v16;
  void *v17;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      v13 = v12;
      if (v7)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("contentScale"));
      else
        objc_msgSend(v12, "removeObjectForKey:", CFSTR("contentScale"));
      v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v13);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = 0;
      v15 = -[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:](v14, "initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:", v13, v6, 0, 0, v7, 0, 0, v20);
    }
    v16 = v15;

    if (v16)
    {
      -[FCTagSettingsEntry dictionaryRepresentation](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v17, v8);
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        objc_msgSend(0, "setObject:forKey:", v17, v8);
        tagSettingsEntriesByTagID = 0;
      }
      -[NSMutableDictionary setObject:forKey:](tagSettingsEntriesByTagID, "setObject:forKey:", v16, v6);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCTagSettings setContentScaleForTagID:contentScale:]";
      v23 = 2080;
      v24 = "FCTagSettings.m";
      v25 = 1024;
      v26 = 266;
      v27 = 2114;
      v28 = v19;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCTagSettings setContentScaleForTagID:contentScale:]";
    v23 = 2080;
    v24 = "FCTagSettings.m";
    v25 = 1024;
    v26 = 213;
    v27 = 2114;
    v28 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:

  }
}

- (id)contentScaleForTagID:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  -[FCTagSettings objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentScale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAccessTokenForTagID:(id)a3 accessToken:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  FCKeyValueStore *localStore;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FCTagSettingsEntry *v17;
  FCTagSettingsEntry *v18;
  FCTagSettingsEntry *v19;
  void *v20;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  FCModifyTagSettingsCommand *v22;
  void *v23;
  FCModifyTagSettingsCommand *v24;
  id WeakRetained;
  uint64_t v26;
  FCTagSettingsEntry *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      v15 = v14;
      if (v9)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("accessToken"));
      else
        objc_msgSend(v14, "removeObjectForKey:", CFSTR("accessToken"));
      v18 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v15);
    }
    else
    {
      v17 = [FCTagSettingsEntry alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v26) = 0;
      v18 = -[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:](v17, "initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:", v15, v8, 0, 0, 0, 0, v9, v26);
    }
    v19 = v18;

    if (v19)
    {
      -[FCTagSettingsEntry dictionaryRepresentation](v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v20, v10);
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        objc_msgSend(0, "setObject:forKey:", v20, v10);
        tagSettingsEntriesByTagID = 0;
      }
      -[NSMutableDictionary setObject:forKey:](tagSettingsEntriesByTagID, "setObject:forKey:", v19, v8);
      v22 = [FCModifyTagSettingsCommand alloc];
      v27 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[FCModifyTagSettingsCommand initWithTagSettingsEntries:merge:](v22, "initWithTagSettingsEntries:merge:", v23, 1);

      if (self)
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      else
        WeakRetained = 0;
      objc_msgSend(WeakRetained, "addModifyTagSettingsCommandToCommandQueue:", v24);

    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      v29 = "-[FCTagSettings setAccessTokenForTagID:accessToken:userInitiated:]";
      v30 = 2080;
      v31 = "FCTagSettings.m";
      v32 = 1024;
      v33 = 326;
      v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }

LABEL_20:
    if (!v9)
    {
      if (self)
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      -[FCTagSettings accessTokenRemovedForTagID:userInitiated:](self, "accessTokenRemovedForTagID:userInitiated:", v8, v5);

    }
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v29 = "-[FCTagSettings setAccessTokenForTagID:accessToken:userInitiated:]";
    v30 = 2080;
    v31 = "FCTagSettings.m";
    v32 = 1024;
    v33 = 291;
    v34 = 2114;
    v35 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_25:

}

- (id)accessTokenForTagID:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  -[FCTagSettings objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)authenticatedAccessTokensByTagID
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FCTagSettings_authenticatedAccessTokensByTagID__block_invoke;
  v7[3] = &unk_1E4644658;
  v8 = v3;
  v4 = v3;
  -[FCTagSettings enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __49__FCTagSettings_authenticatedAccessTokensByTagID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "accessToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "accessToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
}

- (void)setWebAccessOptInForTagID:(id)a3 webAccessOptIn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  FCKeyValueStore *localStore;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCTagSettingsEntry *v14;
  FCTagSettingsEntry *v15;
  FCTagSettingsEntry *v16;
  void *v17;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  FCModifyTagSettingsCommand *v19;
  void *v20;
  FCModifyTagSettingsCommand *v21;
  void *v22;
  uint64_t v23;
  FCTagSettingsEntry *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      v12 = v11;
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("webAccessOptIn"));

      }
      else
      {
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("webAccessOptIn"));
      }
      v15 = (FCTagSettingsEntry *)-[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v12);
    }
    else
    {
      v14 = [FCTagSettingsEntry alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ts-%@"), v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = v4;
      v15 = -[FCTagSettingsEntry initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:](v14, "initWithEntryID:tagID:fontMultiplier:fontMultiplierMacOS:contentScale:contentScaleMacOS:accessToken:webAccessOptIn:", v12, v6, 0, 0, 0, 0, 0, v23);
    }
    v16 = v15;

    if (v16)
    {
      -[FCTagSettingsEntry dictionaryRepresentation](v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
      {
        -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v17, v7);
        tagSettingsEntriesByTagID = self->_tagSettingsEntriesByTagID;
      }
      else
      {
        objc_msgSend(0, "setObject:forKey:", v17, v7);
        tagSettingsEntriesByTagID = 0;
      }
      -[NSMutableDictionary setObject:forKey:](tagSettingsEntriesByTagID, "setObject:forKey:", v16, v6);
      v19 = [FCModifyTagSettingsCommand alloc];
      v24 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[FCModifyTagSettingsCommand initWithTagSettingsEntries:merge:](v19, "initWithTagSettingsEntries:merge:", v20, 1);

      if (self)
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      -[FCTagSettings addModifyTagSettingsCommandToCommandQueue:](self, "addModifyTagSettingsCommandToCommandQueue:", v21);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "entry");
      *(_DWORD *)buf = 136315906;
      v26 = "-[FCTagSettings setWebAccessOptInForTagID:webAccessOptIn:]";
      v27 = 2080;
      v28 = "FCTagSettings.m";
      v29 = 1024;
      v30 = 404;
      v31 = 2114;
      v32 = v22;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "tagID != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTagSettings setWebAccessOptInForTagID:webAccessOptIn:]";
    v27 = 2080;
    v28 = "FCTagSettings.m";
    v29 = 1024;
    v30 = 369;
    v31 = 2114;
    v32 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_21:

  }
}

void __39__FCTagSettings_webAccessOptedInTagIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "webAccessOptIn"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "tagID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)handleSyncWithTagSettingsRecord:(id)a3
{
  id v4;
  void *v5;
  FCKeyValueStore *localStore;
  FCKeyValueStore *v7;
  uint64_t v8;
  void *v9;
  FCKeyValueStore *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCKeyValueStore *v18;
  void *v19;
  void *v20;
  FCTagSettingsEntry *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSMutableDictionary *tagSettingsEntriesByTagID;
  id WeakRetained;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  FCTagSettings *v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = self;
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  v7 = localStore;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tagID"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fontMultiplier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fontMultiplierMacOS"));
  v34 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentScale"));
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentScaleMacOS"));
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v35 = objc_claimAutoreleasedReturnValue();

  v10 = v7;
  -[FCKeyValueStore objectForKey:](v7, "objectForKey:", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v31 = v11;
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    v14 = v13;
    if (v9)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("fontMultiplier"));
    else
      objc_msgSend(v13, "removeObjectForKey:", CFSTR("fontMultiplier"));
    v18 = v7;
    v15 = (void *)v8;
    v17 = (void *)v34;
    v25 = (void *)v35;
    v26 = (void *)v36;
    if (v34)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("fontMultiplierMacOS"));
    else
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("fontMultiplierMacOS"));
    v19 = (void *)v33;
    if (v33)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("contentScale"));
    else
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("contentScale"));
    v20 = (void *)v32;
    if (v32)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, CFSTR("contentScaleMacOS"));
    else
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("contentScaleMacOS"));
    if (v35)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v35, CFSTR("accessToken"));
    else
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("accessToken"));
    if (v36)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v36, CFSTR("webAccessOptIn"));
    else
      objc_msgSend(v14, "removeObjectForKey:", CFSTR("webAccessOptIn"));
    -[FCKeyValueStore setObject:forKey:](v18, "setObject:forKey:", v14, v38);
    if (v15)
    {
      v27 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:]([FCTagSettingsEntry alloc], v14);
      if (v37)
        tagSettingsEntriesByTagID = v37->_tagSettingsEntriesByTagID;
      else
        tagSettingsEntriesByTagID = 0;
      -[NSMutableDictionary setObject:forKey:](tagSettingsEntriesByTagID, "setObject:forKey:", v27, v15);

    }
    if (v37)
      WeakRetained = objc_loadWeakRetained((id *)&v37->_delegate);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "accessTokenDidChangeForTagID:", v15);

LABEL_45:
    v12 = v31;
    goto LABEL_46;
  }
  v15 = (void *)v8;
  if (v8)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v8, CFSTR("tagID"));
    if (v9)
      objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("fontMultiplier"));
    v17 = (void *)v34;
    if (v34)
      objc_msgSend(v16, "setObject:forKey:", v34, CFSTR("fontMultiplierMacOS"));
    v18 = v10;
    v19 = (void *)v33;
    if (v33)
      objc_msgSend(v16, "setObject:forKey:", v33, CFSTR("contentScale"));
    v20 = (void *)v32;
    if (v32)
      objc_msgSend(v16, "setObject:forKey:", v32, CFSTR("contentScaleMacOS"));
    if (v35)
      objc_msgSend(v16, "setObject:forKey:", v35, CFSTR("accessToken"));
    if (v36)
      objc_msgSend(v16, "setObject:forKey:", v36, CFSTR("webAccessOptIn"));
    v21 = [FCTagSettingsEntry alloc];
    v22 = (void *)objc_msgSend(v16, "copy");
    v23 = -[FCTagSettingsEntry initWithEntryID:dictionaryRepresentation:](v21, v22);

    if (v37)
    {
      -[NSMutableDictionary setObject:forKey:](v37->_tagSettingsEntriesByTagID, "setObject:forKey:", v23, v8);
      v24 = objc_loadWeakRetained((id *)&v37->_delegate);
    }
    else
    {
      objc_msgSend(0, "setObject:forKey:", v23, v8);
      v24 = 0;
    }
    v25 = (void *)v35;
    objc_msgSend(v24, "accessTokenDidChangeForTagID:", v15);

    -[FCKeyValueStore setObject:forKey:](v18, "setObject:forKey:", v16, v38);
    v26 = (void *)v36;
    goto LABEL_45;
  }
  v18 = v10;
  v19 = (void *)v33;
  v17 = (void *)v34;
  v20 = (void *)v32;
  v25 = (void *)v35;
  v26 = (void *)v36;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("should never have a tag settings entry without a tag ID"));
    *(_DWORD *)buf = 136315906;
    v40 = "-[FCTagSettings handleSyncWithTagSettingsRecord:]";
    v41 = 2080;
    v42 = "FCTagSettings.m";
    v43 = 1024;
    v44 = 448;
    v45 = 2114;
    v46 = v30;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v12 = 0;
  }
LABEL_46:

}

- (void)handleSyncWithDeletedTagSettingsRecordName:(id)a3
{
  id v4;
  FCKeyValueStore *localStore;
  void *v6;
  FCKeyValueStore *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  v9 = v4;
  -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (self)
      v7 = self->_localStore;
    else
      v7 = 0;
    -[FCKeyValueStore removeObjectForKey:](v7, "removeObjectForKey:", v9);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (self)
      {
        -[NSMutableDictionary fc_safelySetObject:forKey:](self->_tagSettingsEntriesByTagID, "fc_safelySetObject:forKey:", 0, v8);
        self = (FCTagSettings *)objc_loadWeakRetained((id *)&self->_delegate);
      }
      else
      {
        objc_msgSend(0, "fc_safelySetObject:forKey:", 0, v8);
      }
      -[FCTagSettings accessTokenDidChangeForTagID:](self, "accessTokenDidChangeForTagID:", v8);

    }
  }

}

- (id)allTagSettingsRecordNames
{
  void *v2;
  void *v3;

  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  -[FCTagSettings allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_78);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__FCTagSettings_allTagSettingsRecordNames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)allTagSettingsRecords
{
  void *v2;
  void *v3;

  if (self)
    self = (FCTagSettings *)self->_tagSettingsEntriesByTagID;
  -[FCTagSettings allValues](self, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_22_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __38__FCTagSettings_allTagSettingsRecords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_tagSettingsEntriesByTagID, 0);
}

@end
