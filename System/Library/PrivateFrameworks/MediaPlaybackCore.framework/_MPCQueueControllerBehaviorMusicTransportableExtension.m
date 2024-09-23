@implementation _MPCQueueControllerBehaviorMusicTransportableExtension

- (id)allKnownSessionTypes
{
  return (id)-[NSArray msv_map:](self->_allKnownSessionInfos, "msv_map:", &__block_literal_global_939);
}

- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  char v8;

  -[NSDictionary objectForKeyedSubscript:](self->_sessionInfoMap, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "supported");
    if (a4 && (v7 & 1) == 0)
    {
      objc_msgSend(v6, "supportedReason");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v6, "supported");
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = CFSTR("unknown sessionType [Music]");
  }

  return v8;
}

- (id)infoForSessionType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_sessionInfoMap, "objectForKeyedSubscript:", a3);
}

- (_MPCQueueControllerBehaviorMusicTransportableExtension)initWithInvalidatable:(id)a3
{
  id v4;
  _MPCQueueControllerBehaviorMusicTransportableExtension *v5;
  _MPCQueueControllerBehaviorMusicTransportableExtension *v6;
  void *v7;
  NSArray *allKnownSessionInfos;
  NSDictionary *sessionInfoMap;
  void *v10;
  uint64_t v11;
  NSArray *accounts;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPCQueueControllerBehaviorMusicTransportableExtension;
  v5 = -[_MPCQueueControllerBehaviorMusicTransportableExtension init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sessionTypesInvalidatable, v4);
    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObserver:", v6);
    allKnownSessionInfos = v6->_allKnownSessionInfos;
    v6->_allKnownSessionInfos = (NSArray *)MEMORY[0x24BDBD1A8];

    sessionInfoMap = v6->_sessionInfoMap;
    v6->_sessionInfoMap = (NSDictionary *)MEMORY[0x24BDBD1B8];

    if (objc_msgSend(v7, "hasLoadedInitialAccounts"))
    {
      objc_msgSend(v7, "accounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      accounts = v6->_accounts;
      v6->_accounts = (NSArray *)v11;

      -[_MPCQueueControllerBehaviorMusicTransportableExtension _updateAllKnownSessionInfos](v6, "_updateAllKnownSessionInfos");
    }

  }
  return v6;
}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  NSArray *v5;
  NSArray *accounts;
  id WeakRetained;
  id v8;

  v8 = a4;
  if (!-[NSArray isEqualToArray:](self->_accounts, "isEqualToArray:"))
  {
    v5 = (NSArray *)objc_msgSend(v8, "copy");
    accounts = self->_accounts;
    self->_accounts = v5;

    -[_MPCQueueControllerBehaviorMusicTransportableExtension _updateAllKnownSessionInfos](self, "_updateAllKnownSessionInfos");
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionTypesInvalidatable);
    objc_msgSend(WeakRetained, "invalidateSessionTypesWithReason:", CFSTR("accounts changed"));

  }
}

- (void)_updateAllKnownSessionInfos
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
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
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *allKnownSessionInfos;
  uint64_t v41;
  NSDictionary *sessionInfoMap;
  _MPCQueueControllerBehaviorMusicTransportableExtension *v43;
  NSArray *obj;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v43 = self;
  obj = self->_accounts;
  v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v49)
  {
    v45 = *(_QWORD *)v52;
    v46 = 0;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v52 != v45)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v3);
        if (objc_msgSend(v4, "isActiveAccount"))
        {
          v5 = v4;

          v46 = v5;
        }
        v50 = v3;
        if (objc_msgSend(v4, "hasCatalogPlaybackCapability"))
        {
          v6 = objc_msgSend(v4, "hasCloudLibraryEnabled");
          if ((_DWORD)v6)
            v7 = 0;
          else
            v7 = CFSTR("library sync is OFF");
        }
        else
        {
          v6 = 0;
          v7 = CFSTR("non-subscriber");
        }
        objc_msgSend(v4, "shortHashedDSID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCSessionTypeIdentifierFromHashedDSID(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v4.5.opack"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v9, v4, v6, v7, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "addObject:", v10);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v10, v11);

        objc_msgSend(v4, "shortHashedDSID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCSessionTypeIdentifierFromHashedDSID(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v4.opack"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v13, v4, v6, v7, 0, CFSTR("cannot export old version"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "addObject:", v14);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v14, v15);

        objc_msgSend(v4, "shortHashedDSID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCSessionTypeIdentifierFromHashedDSID(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v3.opack"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v17, v4, v6, v7, 0, CFSTR("cannot export old version"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "addObject:", v18);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v18, v19);

        ++v3;
      }
      while (v49 != v50 + 1);
      v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v49);
  }
  else
  {
    v46 = 0;
  }

  objc_msgSend(v46, "storeFrontIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("-"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v24 = &stru_24CABB5D0;
  if (v22)
    v24 = (__CFString *)v22;
  v25 = v24;

  if ((MSVDeviceSupportsDelegatedIdentities() & 1) != 0)
  {
    v26 = 0;
    v27 = CFSTR("device supports delegation");
  }
  else if (v46)
  {
    if (-[__CFString length](v25, "length"))
    {
      v26 = objc_msgSend(v46, "hasCatalogPlaybackCapability");
      if ((_DWORD)v26)
        v27 = 0;
      else
        v27 = CFSTR("non-subscriber active account");
    }
    else
    {
      v28 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v46, "storeFrontIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("unknown storefront: %@"), v29);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
    v27 = CFSTR("no active account");
  }
  _MPCSessionTypeIdentifierForStorefront(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v4.5.opack"), v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v30, v46, v26, v27, 1, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "addObject:", v31);
  objc_msgSend(v31, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v31, v32);

  _MPCSessionTypeIdentifierForStorefront(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v4.opack"), v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v33, v46, v26, v27, 0, CFSTR("cannot export old version"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "addObject:", v34);
  objc_msgSend(v34, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v34, v35);

  _MPCSessionTypeIdentifierForStorefront(CFSTR("com.apple.MediaPlaybackCore.playbackSession-v3.opack"), v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MPCQCBMSessionTypeInfo infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:](_MPCQCBMSessionTypeInfo, "infoWithIdentifier:account:supported:supportedReason:exportable:exportableReason:", v36, v46, v26, v27, 0, CFSTR("cannot export old version"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "addObject:", v37);
  objc_msgSend(v37, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v37, v38);

  v39 = objc_msgSend(v48, "copy");
  allKnownSessionInfos = v43->_allKnownSessionInfos;
  v43->_allKnownSessionInfos = (NSArray *)v39;

  v41 = objc_msgSend(v47, "copy");
  sessionInfoMap = v43->_sessionInfoMap;
  v43->_sessionInfoMap = (NSDictionary *)v41;

}

- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable
{
  return (MPCQueueControllerSessionTypesInvalidatable *)objc_loadWeakRetained((id *)&self->_sessionTypesInvalidatable);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionTypesInvalidatable);
  objc_storeStrong((id *)&self->_sessionInfoMap, 0);
  objc_storeStrong((id *)&self->_allKnownSessionInfos, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end
