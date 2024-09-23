@implementation BBServer

void __38__BBServer_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArray:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
    v8 = 134217984;
    v9 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld section infos", (uint8_t *)&v8, 0xCu);

  }
}

- (id)_sectionInfoArray:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (id)-[BBSectionInfoStoreInterface allSortedSectionInfo:](self->_sectionInfoStore, "allSortedSectionInfo:", v3);
}

- (void)_updateBulletinsInFeed:(unint64_t)a3 ifSectionIsEnabled:(id)a4
{
  id v6;

  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer _updateBulletinsInFeed:forDataProviderIfSectionIsEnabled:](self, "_updateBulletinsInFeed:forDataProviderIfSectionIsEnabled:", a3, v6);

}

- (id)dataProviderForSectionID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBDataProviderManager dataProviderForSectionID:](self->_dataProviderManager, "dataProviderForSectionID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __49__BBServer__reloadReloadSectionInfoForSectionID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_sectionInfoForSectionID:effective:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "rebuildSectionInfo:forSectionID:", v8, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setSectionInfo:forSectionID:", v7, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSectionParametersForDataProvider:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v5);

}

- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProviderIfSectionIsEnabled:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[BBServer _enabledSectionIDsForDataProvider:](self, "_enabledSectionIDsForDataProvider:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:](self, "_updateBulletinsInFeed:forDataProvider:enabledSectionIDs:", a3, v7, v6);

}

- (void)_updateAllBulletinsForDataProviderIfSectionIsEnabled:(id)a3
{
  -[BBServer _updateBulletinsInFeed:forDataProviderIfSectionIsEnabled:](self, "_updateBulletinsInFeed:forDataProviderIfSectionIsEnabled:", 1, a3);
}

- (void)_setPrimitiveSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BBSectionInfoStoreInterface *sectionInfoStore;
  NSObject *v10;
  BBPersistentStoreInterface *persistentStore;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BBSectionInfoStoreInterface sectionInfoForSectionID:effective:](self->_sectionInfoStore, "sectionInfoForSectionID:effective:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sectionInfoStore = self->_sectionInfoStore;
  if (v6)
  {
    -[BBSectionInfoStoreInterface setSectionInfo:forSectionID:](sectionInfoStore, "setSectionInfo:forSectionID:", v6, v7);
    if (!v8)
      goto LABEL_6;
LABEL_5:
    if ((objc_msgSend(v6, "isEqual:", v8) & 1) != 0)
      goto LABEL_9;
    goto LABEL_6;
  }
  -[BBSectionInfoStoreInterface removeSectionWithID:](sectionInfoStore, "removeSectionWithID:", v7);
  if (v8)
    goto LABEL_5;
LABEL_6:
  v10 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "Persisting changes for %@", (uint8_t *)&v13, 0xCu);
  }
  persistentStore = self->_persistentStore;
  -[BBSectionInfoStoreInterface sectionInfoByID](self->_sectionInfoStore, "sectionInfoByID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBPersistentStoreInterface writeSectionInfo:](persistentStore, "writeSectionInfo:", v12);

LABEL_9:
}

- (void)_setSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v6, "queryAndUseManagedSettings");
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) != 0)
  {
    v10 = v6;
  }
  else
  {
    -[BBSectionAuthorizationManager handleChangeForSectionInfo:replacingSectionInfo:](self->_sectionAuthorizationManager, "handleChangeForSectionInfo:replacingSectionInfo:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[BBMuteExpirationManager cleanAndWatchExpirationsForSectionInfo:](self->_muteManager, "cleanAndWatchExpirationsForSectionInfo:", v10);
    -[BBSectionInfoStoreInterface effectiveSectionInfoForSectionInfo:](self->_sectionInfoStore, "effectiveSectionInfoForSectionInfo:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoStoreInterface effectiveSectionInfoForSectionInfo:](self->_sectionInfoStore, "effectiveSectionInfoForSectionInfo:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[BBServer _didNotificationCenterSettingsChangeWithSectionInfo:replacingSectionInfo:](self, "_didNotificationCenterSettingsChangeWithSectionInfo:replacingSectionInfo:", v11, v12);
    objc_msgSend(v10, "subsectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v9, "_replaceSubsection:", v10);
      v15 = v9;

      v10 = v15;
    }
    v16 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Saving updated section info for: %{public}@\n\tOld = %{public}@\n\tNew = %{public}@", (uint8_t *)&v17, 0x20u);
    }
    -[BBServer _setPrimitiveSectionInfo:forSectionID:](self, "_setPrimitiveSectionInfo:forSectionID:", v10, v7);
    -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v10);
    if (v13)
      -[BBServer _updateDataProviderForSectionInfo:sectionID:](self, "_updateDataProviderForSectionInfo:sectionID:", v10, v7);

  }
}

- (id)_sectionInfoForSectionID:(id)a3
{
  return -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", a3, 0);
}

- (BOOL)_didNotificationCenterSettingsChangeWithSectionInfo:(id)a3 replacingSectionInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "subsectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "subsectionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_subsectionForID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v5, "notificationCenterSetting");
    if (v10 == objc_msgSend(v9, "notificationCenterSetting"))
    {
      v11 = objc_msgSend(v5, "contentPreviewSetting");
      if (v11 == objc_msgSend(v9, "contentPreviewSetting"))
      {
        LOBYTE(v12) = 0;
        goto LABEL_17;
      }
    }
LABEL_16:
    LOBYTE(v12) = 1;
    goto LABEL_17;
  }
  v13 = objc_msgSend(v5, "notificationCenterSetting");
  if (v13 != objc_msgSend(v6, "notificationCenterSetting")
    || (v14 = objc_msgSend(v5, "contentPreviewSetting"), v14 != objc_msgSend(v6, "contentPreviewSetting")))
  {
    LOBYTE(v12) = 1;
    goto LABEL_19;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "subsections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v15 = *(_QWORD *)v24;
LABEL_9:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
      objc_msgSend(v17, "subsectionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_subsectionForID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v17, "notificationCenterSetting");
      v21 = objc_msgSend(v19, "notificationCenterSetting");

      if (v20 != v21)
        goto LABEL_16;
      if (v12 == ++v16)
      {
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          goto LABEL_9;
        break;
      }
    }
  }
LABEL_17:

LABEL_19:
  return v12;
}

- (void)_updateDataProviderForSectionInfo:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[BBServer _updateAllBulletinsForDataProviderIfSectionIsEnabled:](self, "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v8);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "dataProviderIDs", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v9 = 0;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        v15 = v9;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v16 = (void *)MEMORY[0x212B94804]();
            -[BBServer _updateAllBulletinsForDataProviderIfSectionIsEnabled:](self, "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v9);
            objc_autoreleasePoolPop(v16);
          }
          ++v14;
          v15 = v9;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    else
    {
      v9 = 0;
    }

  }
}

void __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int8x16_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  int8x16_t v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "count");
    v9 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v32 = v7;
    v33 = 2048;
    v34 = v8;
    v35 = 2048;
    v36 = v9;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "BBServer: Section %{public}@ responded with %ld bulletin requests to feed %ld", buf, 0x20u);

  }
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke_234;
  v28[3] = &unk_24C5638C8;
  v22 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v22.i64[0];
  v29 = vextq_s8(v22, v22, 8uLL);
  objc_msgSend(v3, "objectsPassingTest:", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v25;
    *(_QWORD *)&v16 = 138412546;
    v23 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v20, "publisherMatchID", v23, (_QWORD)v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", v21))
          BBIsInternalDevice();
        objc_msgSend(v12, "addObject:", v20);
        objc_msgSend(v13, "addObject:", v21);

      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(*(id *)(a1 + 40), "updateSection:inFeed:withBulletinRequests:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v12);
  objc_msgSend(*(id *)(a1 + 40), "_sendBulletinsLoadedForSectionID:", *(_QWORD *)(a1 + 48));

}

- (void)updateSection:(id)a3 inFeed:(unint64_t)a4 withBulletinRequests:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  id obj;
  id v46;
  uint64_t v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v48 = a5;
  v7 = (void *)BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543618;
    v66 = (uint64_t)v6;
    v67 = 2048;
    v68 = objc_msgSend(v48, "count");
    _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Updating section %{public}@ with %ld new bulletins", buf, 0x16u);

  }
  v46 = v6;
  -[BBServer bulletinIDsForSectionID:inFeed:](self, "bulletinIDsForSectionID:inFeed:", v6, a4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v66 = v12;
    _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "Current bulletins in this section: %ld", buf, 0xCu);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v13)
  {
    v14 = v13;
    v47 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v59 != v47)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v16, "publisherMatchID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v18 = v48;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v55;
          while (2)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v55 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "publisherMatchID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v17, "isEqualToString:", v23);

              if ((v24 & 1) != 0)
              {

                goto LABEL_22;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
            if (v20)
              continue;
            break;
          }
        }

        v25 = (void *)MEMORY[0x212B94804]();
        v26 = (void *)BBLogSectionUpdates;
        if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          -[BBServer bulletinIDsForSectionID:inFeed:](self, "bulletinIDsForSectionID:inFeed:", v46, a4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");
          *(_DWORD *)buf = 138412546;
          v66 = (uint64_t)v16;
          v67 = 2048;
          v68 = v29;
          _os_log_impl(&dword_20CCB9000, v27, OS_LOG_TYPE_DEFAULT, "Removing old bulletin: %@\n%ld bulletins remain", buf, 0x16u);

        }
        objc_msgSend(v16, "bulletinID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBServer removeBulletinID:fromSection:inFeed:](self, "removeBulletinID:fromSection:inFeed:", v30, v46, (8 * (a4 & 1)) | a4);

        objc_autoreleasePoolPop(v25);
LABEL_22:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v14);
  }

  v31 = v46;
  -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", v46);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    objc_msgSend(v48, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_10);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v51 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
          v42 = (void *)MEMORY[0x212B94804]();
          -[BBServer _assignIDToBulletinRequest:checkAgainstBulletins:](self, "_assignIDToBulletinRequest:checkAgainstBulletins:", v41, v33);
          -[BBServer publishBulletinRequest:destinations:](self, "publishBulletinRequest:destinations:", v41, 2);
          objc_autoreleasePoolPop(v42);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v38);
    }

    v31 = v46;
  }

}

- (id)_bulletinRequestsForIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)bulletinIDsForSectionID:(id)a3 inFeed:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[BBServer _mapForFeed:](self, "_mapForFeed:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (v9 = (void *)MEMORY[0x24BDBCF20],
        objc_msgSend(v7, "objectForKey:", v6),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "setWithSet:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)allBulletinIDsForSectionID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_mapForFeed:(unint64_t)a3
{
  char v3;
  NSMutableDictionary *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((v3 & 1) != 0)
    v5 = self->_noticeBulletinIDsBySectionID;
  else
    v5 = 0;
  return v5;
}

- (id)_enabledSectionIDsForDataProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x212B94804]();
    objc_msgSend(v4, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "notificationCenterSetting") == 2)
      objc_msgSend(v5, "addObject:", v7);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v8, "subsections", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "notificationCenterSetting") == 2)
          {
            objc_msgSend(v14, "subsectionID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

void __51__BBServer_getSectionInfoForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:effective:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__BBServer_getEffectiveSectionInfoForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:effective:", *(_QWORD *)(a1 + 40), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *queue;
  id v7;
  void *v8;

  v4 = a4;
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBSectionInfoStoreInterface sectionInfoForSectionID:effective:](self->_sectionInfoStore, "sectionInfoForSectionID:effective:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateBulletinsInFeed:(unint64_t)a3 forDataProvider:(id)a4 enabledSectionIDs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  BBServer *v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v26 = 0;
  if (!BBPublisherDestinationForObserverFeed(a3, &v26))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BBServer.m"), 3724, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("foundValidDestination"));

  }
  objc_msgSend(v9, "sectionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)BBLogGeneral;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v9, "sectionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 2048;
      v30 = a3;
      _os_log_impl(&dword_20CCB9000, v13, OS_LOG_TYPE_DEFAULT, "BBServer: Update bulletins in section %{public}@ for feed %ld", buf, 0x16u);

    }
    v15 = v26;
    -[BBServer _sinceDate](self, "_sinceDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[BBBulletinRequestParameters requestParametersForDestination:withSinceDate:maximumCount:enabledSectionIDs:](BBBulletinRequestParameters, "requestParametersForDestination:withSinceDate:maximumCount:enabledSectionIDs:", v15, v16, 500, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
    {
      v18 = (void *)BBLogGeneral;
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
        -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:].cold.2(v18, self, (uint64_t)v11);
    }
    -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke;
    v21[3] = &unk_24C5638F0;
    v25 = a3;
    v22 = v9;
    v23 = self;
    v24 = v11;
    objc_msgSend(v22, "bulletinsWithRequestParameters:lastCleared:completion:", v17, v19, v21);

  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:].cold.1();
  }

}

- (id)_sinceDate
{
  void *v3;
  NSDateComponents *expirationReferenceComponents;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expirationReferenceComponents)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    expirationReferenceComponents = self->_expirationReferenceComponents;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingComponents:toDate:options:", expirationReferenceComponents, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_clearedInfoForSectionID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBSectionInfoStoreInterface clearedInfoForSectionID:](self->_sectionInfoStore, "clearedInfoForSectionID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_effectiveGlobalAnnounceSetting
{
  int64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalAnnounceSetting](self->_persistentStore, "effectiveGlobalAnnounceSetting");
  if (!-[BBServer _isAnnounceSupportedForHeadphones](self, "_isAnnounceSupportedForHeadphones")
    && (!-[BBServer _isAnnounceSupportedForCarPlay](self, "_isAnnounceSupportedForCarPlay")
     || !-[BBServer _hasPairedVehiclesForCarPlay](self, "_hasPairedVehiclesForCarPlay"))
    && !self->_announceOnHearingAidsSupported
    && !self->_announceOnBuiltInSpeakerEnabled)
  {
    return -1;
  }
  if (!self->_siriEnabled || !self->_siriAllowedWhenLocked)
    return 1;
  result = -[BBServer _globalAnnounceSetting](self, "_globalAnnounceSetting");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (BOOL)_hasPairedVehiclesForCarPlay
{
  void *v2;
  char v3;

  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPairedVehiclesForCarPlay");

  return v3;
}

- (int64_t)_defaultGlobalContentPreviewSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBBiometricResource hasPearlCapability](self->_biometricResource, "hasPearlCapability")
    && -[BBBiometricResource isPearlEnabledAndEnrolled](self->_biometricResource, "isPearlEnabledAndEnrolled"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)_isAnnounceSupportedForHeadphones
{
  void *v2;
  char v3;

  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnnounceSupportedForHeadphones");

  return v3;
}

- (BOOL)_isAnnounceSupportedForCarPlay
{
  void *v2;
  char v3;

  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnnounceSupportedForCarPlay");

  return v3;
}

- (int64_t)_effectiveGlobalScheduledDeliverySetting
{
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalScheduledDeliverySetting](self->_persistentStore, "effectiveGlobalScheduledDeliverySetting");
  if (-[BBServer _globalScheduledDeliverySetting](self, "_globalScheduledDeliverySetting"))
    return -[BBServer _globalScheduledDeliverySetting](self, "_globalScheduledDeliverySetting");
  return -1;
}

- (int64_t)_globalScheduledDeliverySetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalScheduledDeliverySetting");

  return v3;
}

- (int64_t)_effectiveGlobalContentPreviewsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalContentPreviewsSetting](self->_persistentStore, "effectiveGlobalContentPreviewsSetting");
  if (-[BBServer _globalContentPreviewsSetting](self, "_globalContentPreviewsSetting"))
    return -[BBServer _globalContentPreviewsSetting](self, "_globalContentPreviewsSetting");
  return -[BBServer _defaultGlobalContentPreviewSetting](self, "_defaultGlobalContentPreviewSetting");
}

- (BOOL)_shouldUseUNSSettings
{
  return _os_feature_enabled_impl();
}

- (int64_t)_globalContentPreviewsSetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalContentPreviewSetting");

  return v3;
}

- (void)getEffectiveSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BBServer_getEffectiveSectionInfoForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C5631B8;
  v12 = &v13;
  block[4] = self;
  v9 = v6;
  v11 = v9;
  dispatch_sync(queue, block);
  if (v7)
    v7[2](v7, v14[5]);

  _Block_object_dispose(&v13, 8);
}

- (void)_reloadReloadSectionInfoForSectionID:(id)a3
{
  id v4;
  BBDataProviderManager *dataProviderManager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataProviderManager = self->_dataProviderManager;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BBServer__reloadReloadSectionInfoForSectionID___block_invoke;
  v7[3] = &unk_24C563720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BBDataProviderManager reloadIdentityForSectionID:withCompletion:](dataProviderManager, "reloadIdentityForSectionID:withCompletion:", v6, v7);

}

- (void)getSectionInfoForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BBServer_getSectionInfoForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C5631B8;
  v12 = &v13;
  block[4] = self;
  v9 = v6;
  v11 = v9;
  dispatch_sync(queue, block);
  if (v7)
    v7[2](v7, v14[5]);

  _Block_object_dispose(&v13, 8);
}

- (void)_updateSectionParametersForDataProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_observers;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "updateSectionParameters:forSectionID:", v6, v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)_sendUpdateSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBMaskedSet objectAtIndex:](self->_observerFeedSet, "objectAtIndex:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSectionInfoStoreInterface effectiveSectionInfoForSectionInfo:](self->_sectionInfoStore, "effectiveSectionInfoForSectionInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v11++), "updateSectionInfo:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }
  v22 = v7;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v4;
  objc_msgSend(v4, "dataProviderIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v15), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[BBMaskedSet objectAtIndex:](self->_observerFeedSet, "objectAtIndex:", 9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v26;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v26 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21++), "updateSectionInfo:", v16);
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            }
            while (v19);
          }

        }
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v13);
  }

}

- (void)_sendBulletinsLoadedForSectionID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "noteBulletinsLoadedForSectionID:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

uint64_t __52__BBServer_setSectionInfo_forSectionID_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "sectionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v4)
    {
      v5 = BBLogSettings;
      if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v12 = 138543362;
        v13 = v6;
        _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "SettingsGateway changed section settings: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      v7 = *(void **)(a1 + 48);
      objc_msgSend(v7, "_sectionInfoForSectionID:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "effectivePushSettingsForSectionInfo:", v8);

      v10 = objc_msgSend(*(id *)(a1 + 48), "effectivePushSettingsForSectionInfo:", *(_QWORD *)(a1 + 32)) & 0x38;
      if ((v9 & 0x38) == 0 && v10 || (v9 & 0x38) != 0 && !v10)
        ADClientAddValueForScalarKey();
      objc_msgSend(*(id *)(a1 + 48), "_setSectionInfoNoteSettingsChanged:forSectionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)effectivePushSettingsForSectionInfo:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "alertType") != 0;
  v5 = objc_msgSend(v3, "pushSettings");

  return v5 & 0xFFFFFFFFFFFFFFDFLL | (32 * v4);
}

- (void)getSectionInfoWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Get all section infos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__BBServer_getSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_24C563748;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4)
    v4[2](v4, v10[5], 0);
  _Block_object_dispose(&v9, 8);

}

uint64_t __42__BBServer__addSettingsGatewayConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BBServer *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__BBServer_setSectionInfo_forSectionID_withHandler___block_invoke;
  v15[3] = &unk_24C563230;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  BBServer *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  BBObserverClientProxy *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id from;
  id location;
  uint8_t buf[4];
  BBServer *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_observerListener == v6)
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.bulletinboard.observer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      +[BBObserverServerProxy xpcInterface](BBObserverServerProxy, "xpcInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExportedInterface:", v17);

      +[BBObserverClientProxy xpcInterface](BBObserverClientProxy, "xpcInterface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v18);

      v19 = -[BBObserverClientProxy initWithServer:connection:calloutQueue:]([BBObserverClientProxy alloc], "initWithServer:connection:calloutQueue:", self, v8, self->_queue);
      objc_msgSend(v8, "setExportedObject:", v19);
      v20 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v60 = self;
        _os_log_impl(&dword_20CCB9000, v20, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBObserver client established", buf, 0xCu);
      }
      -[BBServer _addObserver:](self, "_addObserver:", v19);
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      objc_initWeak(&from, v19);
      v21 = MEMORY[0x24BDAC760];
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke;
      v53[3] = &unk_24C5634F0;
      objc_copyWeak(&v54, &location);
      objc_copyWeak(&v55, (id *)buf);
      objc_copyWeak(&v56, &from);
      objc_msgSend(v8, "setInterruptionHandler:", v53);
      v49[0] = v21;
      v49[1] = 3221225472;
      v49[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_2;
      v49[3] = &unk_24C5634F0;
      objc_copyWeak(&v50, &location);
      objc_copyWeak(&v51, (id *)buf);
      objc_copyWeak(&v52, &from);
      objc_msgSend(v8, "setInvalidationHandler:", v49);
      if (-[BBServer isRunning](self, "isRunning"))
        objc_msgSend(v8, "resume");
      else
        -[BBServer _addSuspendedConnection:](self, "_addSuspendedConnection:", v8);
      objc_destroyWeak(&v52);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v56);
      objc_destroyWeak(&v55);
      objc_destroyWeak(&v54);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBServer listener:shouldAcceptNewConnection:].cold.1();
  }
  else if (self->_conduitListener == v6)
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.bulletinboard.serverconduit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v23)
    {
      +[BBServerConduit serverInterface](BBServerConduit, "serverInterface");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExportedInterface:", v24);

      objc_msgSend(v8, "setExportedObject:", self);
      +[BBServerConduit clientInterface](BBServerConduit, "clientInterface");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v25);

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      v26 = MEMORY[0x24BDAC760];
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_54;
      v46[3] = &unk_24C5634C8;
      objc_copyWeak(&v47, &location);
      objc_copyWeak(&v48, (id *)buf);
      objc_msgSend(v8, "setInterruptionHandler:", v46);
      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_55;
      v43[3] = &unk_24C5634C8;
      objc_copyWeak(&v44, &location);
      objc_copyWeak(&v45, (id *)buf);
      objc_msgSend(v8, "setInvalidationHandler:", v43);
      if (-[BBServer isRunning](self, "isRunning"))
        objc_msgSend(v8, "resume");
      else
        -[BBServer _addSuspendedConnection:](self, "_addSuspendedConnection:", v8);
      objc_destroyWeak(&v45);
      objc_destroyWeak(&v44);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
LABEL_33:
      v27 = 1;
      goto LABEL_34;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBServer listener:shouldAcceptNewConnection:].cold.2();
  }
  else if (self->_settingsListener == v6)
  {
    objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.bulletinboard.settings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE0BDB8], "tokenFromNSXPCConnection:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "pid"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringValue");
        v14 = (BBServer *)objc_claimAutoreleasedReturnValue();

      }
      v29 = BBLogConnection;
      if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v14;
        _os_log_impl(&dword_20CCB9000, v29, OS_LOG_TYPE_DEFAULT, "BBServer: Incoming connection for settingsListener from %@", buf, 0xCu);
      }
      +[BBSettingsGateway serverInterface](BBSettingsGateway, "serverInterface");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setExportedInterface:", v30);

      objc_msgSend(v8, "setExportedObject:", self);
      +[BBSettingsGateway clientInterface](BBSettingsGateway, "clientInterface");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRemoteObjectInterface:", v31);

      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v8);
      v32 = MEMORY[0x24BDAC760];
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_59;
      v40[3] = &unk_24C5634C8;
      objc_copyWeak(&v41, &location);
      objc_copyWeak(&v42, (id *)buf);
      objc_msgSend(v8, "setInterruptionHandler:", v40);
      v34 = v32;
      v35 = 3221225472;
      v36 = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_60;
      v37 = &unk_24C5634C8;
      objc_copyWeak(&v38, &location);
      objc_copyWeak(&v39, (id *)buf);
      objc_msgSend(v8, "setInvalidationHandler:", &v34);
      -[BBServer _addSettingsGatewayConnection:](self, "_addSettingsGatewayConnection:", v8, v34, v35, v36, v37);
      if (-[BBServer isRunning](self, "isRunning"))
        objc_msgSend(v8, "resume");
      else
        -[BBServer _addSuspendedConnection:](self, "_addSuspendedConnection:", v8);
      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_ERROR))
      -[BBServer listener:shouldAcceptNewConnection:].cold.3();
  }
  v27 = 0;
LABEL_34:

  return v27;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)_setSectionInfoNoteSettingsChanged:(id)a3 forSectionID:(id)a4
{
  NSObject *queue;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBServer _setSectionInfo:forSectionID:](self, "_setSectionInfo:forSectionID:", v7, v11);
  v8 = objc_msgSend(v7, "sectionType");

  if (v8 != 1)
  {
    -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    -[BBDataProviderManager noteSettingsChanged:forSectionID:](self->_dataProviderManager, "noteSettingsChanged:forSectionID:", v10, v11);
  }

}

- (void)_addSettingsGatewayConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__BBServer__addSettingsGatewayConnection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BBServer)initWithQueue:(id)a3
{
  id v4;
  BBDataProviderManager *v5;
  int v6;
  __objc2_class **v7;
  void *v8;
  BBDismissalSyncCache *v9;
  void *v10;
  void *v11;
  void *v12;
  BBServer *v13;

  v4 = a3;
  v5 = -[BBDataProviderManager initWithDelegate:queue:]([BBDataProviderManager alloc], "initWithDelegate:queue:", self, v4);
  v6 = _os_feature_enabled_impl();
  v7 = &off_24C561CB0;
  if (!v6)
    v7 = off_24C561C80;
  v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithDelegate:queue:", self, v4);
  v9 = objc_alloc_init(BBDismissalSyncCache);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletinboard.observerconnection"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletinboard.serverconduitconnection"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletinboard.settingsconnection"));
  v13 = -[BBServer initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:](self, "initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:", v4, v5, v8, v9, v10, v11, v12);

  return v13;
}

- (BBServer)initWithQueue:(id)a3 dataProviderManager:(id)a4 syncService:(id)a5 dismissalSyncCache:(id)a6 observerListener:(id)a7 conduitListener:(id)a8 settingsListener:(id)a9
{
  id v16;
  id v17;
  BBServer *v18;
  BBServer *v19;
  BBAppProtectionMonitor *v20;
  BBAppProtectionMonitor *appProtectionMonitor;
  NSMutableSet *v22;
  NSMutableSet *observers;
  BBMaskedSet *v24;
  BBMaskedSet *observerFeedSet;
  NSMutableArray *v26;
  NSMutableArray *observerGateways;
  NSMutableDictionary *v28;
  NSMutableDictionary *observerGatewaysByName;
  NSMutableDictionary *v30;
  NSMutableDictionary *observerGatewayEnumerators;
  NSMutableDictionary *v32;
  NSMutableDictionary *pendingUpdatesByBulletinID;
  NSMutableSet *v34;
  NSMutableSet *settingsGatewayConnections;
  uint64_t v36;
  BBPersistentStoreInterface *persistentStore;
  uint64_t v38;
  BBSectionInfoStoreInterface *sectionInfoStore;
  uint64_t v40;
  NSMutableSet *activeSectionIDs;
  NSMutableArray *v42;
  NSMutableArray *expiringBulletinIDs;
  NSMutableArray *v44;
  NSMutableArray *eventBasedExpiringBulletinIDs;
  NSMutableDictionary *v46;
  NSMutableDictionary *bulletinsByID;
  NSMutableDictionary *v48;
  NSMutableDictionary *bulletinIDsBySectionID;
  NSMutableDictionary *v50;
  NSMutableDictionary *noticeBulletinIDsBySectionID;
  NSMutableDictionary *v52;
  NSMutableDictionary *bulletinRequestsByID;
  NSMutableSet *v54;
  NSMutableSet *suspendedConnections;
  BBDismissalSyncCache *v56;
  BBDismissalSyncCache *dismissalSyncCache;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v59;
  __CFRunLoop *Main;
  __CFNotificationCenter *DarwinNotifyCenter;
  BBSectionAuthorizationManager *v62;
  BBSectionAuthorizationManager *sectionAuthorizationManager;
  BBMuteExpirationManager *v64;
  BBMuteExpirationManager *muteManager;
  BBBiometricResource *v66;
  BBBiometricResource *biometricResource;
  void *v68;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  objc_super v75;
  IONotificationPortRef thePortRef;
  io_object_t notifier;

  v16 = a3;
  v74 = a4;
  v73 = a5;
  v72 = a6;
  v71 = a7;
  v70 = a8;
  v17 = a9;
  v75.receiver = self;
  v75.super_class = (Class)BBServer;
  v18 = -[BBServer init](&v75, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_dataProviderManager, a4);
    objc_storeStrong((id *)&v19->_syncService, a5);
    -[BBSyncServiceInterface setDelegate:](v19->_syncService, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_dismissalSyncCache, a6);
    objc_storeStrong((id *)&v19->_observerListener, a7);
    -[NSXPCListener setDelegate:](v19->_observerListener, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_conduitListener, a8);
    -[NSXPCListener setDelegate:](v19->_conduitListener, "setDelegate:", v19);
    objc_storeStrong((id *)&v19->_settingsListener, a9);
    -[NSXPCListener setDelegate:](v19->_settingsListener, "setDelegate:", v19);
    v20 = -[BBAppProtectionMonitor initWithDelegate:]([BBAppProtectionMonitor alloc], "initWithDelegate:", v19);
    appProtectionMonitor = v19->_appProtectionMonitor;
    v19->_appProtectionMonitor = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    observers = v19->_observers;
    v19->_observers = v22;

    v24 = -[BBMaskedSet initWithMaskBits:]([BBMaskedSet alloc], "initWithMaskBits:", 16);
    observerFeedSet = v19->_observerFeedSet;
    v19->_observerFeedSet = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observerGateways = v19->_observerGateways;
    v19->_observerGateways = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    observerGatewaysByName = v19->_observerGatewaysByName;
    v19->_observerGatewaysByName = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    observerGatewayEnumerators = v19->_observerGatewayEnumerators;
    v19->_observerGatewayEnumerators = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingUpdatesByBulletinID = v19->_pendingUpdatesByBulletinID;
    v19->_pendingUpdatesByBulletinID = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    settingsGatewayConnections = v19->_settingsGatewayConnections;
    v19->_settingsGatewayConnections = v34;

    objc_msgSend((id)objc_opt_class(), "_persistentSettingsStore");
    v36 = objc_claimAutoreleasedReturnValue();
    persistentStore = v19->_persistentStore;
    v19->_persistentStore = (BBPersistentStoreInterface *)v36;

    -[BBServer _sectionInfoStore](v19, "_sectionInfoStore");
    v38 = objc_claimAutoreleasedReturnValue();
    sectionInfoStore = v19->_sectionInfoStore;
    v19->_sectionInfoStore = (BBSectionInfoStoreInterface *)v38;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v40 = objc_claimAutoreleasedReturnValue();
    activeSectionIDs = v19->_activeSectionIDs;
    v19->_activeSectionIDs = (NSMutableSet *)v40;

    v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    expiringBulletinIDs = v19->_expiringBulletinIDs;
    v19->_expiringBulletinIDs = v42;

    v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventBasedExpiringBulletinIDs = v19->_eventBasedExpiringBulletinIDs;
    v19->_eventBasedExpiringBulletinIDs = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bulletinsByID = v19->_bulletinsByID;
    v19->_bulletinsByID = v46;

    v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bulletinIDsBySectionID = v19->_bulletinIDsBySectionID;
    v19->_bulletinIDsBySectionID = v48;

    v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    noticeBulletinIDsBySectionID = v19->_noticeBulletinIDsBySectionID;
    v19->_noticeBulletinIDsBySectionID = v50;

    v52 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    bulletinRequestsByID = v19->_bulletinRequestsByID;
    v19->_bulletinRequestsByID = v52;

    v19->_globalCounter = 0;
    v54 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    suspendedConnections = v19->_suspendedConnections;
    v19->_suspendedConnections = v54;

    v56 = objc_alloc_init(BBDismissalSyncCache);
    dismissalSyncCache = v19->_dismissalSyncCache;
    v19->_dismissalSyncCache = v56;

    notifier = 0;
    thePortRef = 0;
    __BBRootDomainConnect = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)_BBPowerChanged, &notifier);
    RunLoopSource = IONotificationPortGetRunLoopSource(thePortRef);
    if (RunLoopSource)
    {
      v59 = RunLoopSource;
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, v59, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
    else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[BBServer initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:].cold.1();
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)__server, (CFNotificationCallback)_BBHandleSignificantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[NSXPCListener resume](v19->_observerListener, "resume");
    -[NSXPCListener resume](v19->_conduitListener, "resume");
    -[NSXPCListener resume](v19->_settingsListener, "resume");
    v62 = -[BBSectionAuthorizationManager initWithQueue:]([BBSectionAuthorizationManager alloc], "initWithQueue:", v16);
    sectionAuthorizationManager = v19->_sectionAuthorizationManager;
    v19->_sectionAuthorizationManager = v62;

    -[BBSectionAuthorizationManager setDelegate:](v19->_sectionAuthorizationManager, "setDelegate:", v19);
    v64 = -[BBMuteExpirationManager initWithQueue:]([BBMuteExpirationManager alloc], "initWithQueue:", v16);
    muteManager = v19->_muteManager;
    v19->_muteManager = v64;

    -[BBMuteExpirationManager setDelegate:](v19->_muteManager, "setDelegate:", v19);
    v66 = -[BBBiometricResource initWithQueue:]([BBBiometricResource alloc], "initWithQueue:", v16);
    biometricResource = v19->_biometricResource;
    v19->_biometricResource = v66;

    if (-[BBBiometricResource hasPearlCapability](v19->_biometricResource, "hasPearlCapability"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObserver:selector:name:object:", v19, sel__biometricResourceStateChanged, CFSTR("BBBiometricResourceStateChanged"), v19->_biometricResource);

    }
    -[BBServer _addStateCaptureHandlers](v19, "_addStateCaptureHandlers");
  }

  return v19;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[BBServer _clearExpirationTimer](self, "_clearExpirationTimer");
  -[NSXPCListener invalidate](self->_observerListener, "invalidate");
  -[NSXPCListener invalidate](self->_conduitListener, "invalidate");
  -[NSXPCListener invalidate](self->_settingsListener, "invalidate");
  notify_cancel(self->_serverIsRunningToken);
  -[BBServer _unobserveManagedProfileChanges](self, "_unobserveManagedProfileChanges");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)__server, CFSTR("SignificantTimeChangeNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)BBServer;
  -[BBServer dealloc](&v4, sel_dealloc);
}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  NSObject **v5;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained(a1 + 4);
    *(_DWORD *)buf = 138412290;
    v12 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%@) to BBObserver client interrupted", buf, 0xCu);

  }
  v5 = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v6 = v5;
  if (v5)
  {
    v7 = v5[5];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_50;
    v8[3] = &unk_24C5634C8;
    objc_copyWeak(&v9, a1 + 5);
    objc_copyWeak(&v10, a1 + 6);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
  }

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_50(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeObserver:", v2);

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  NSObject **v5;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained(a1 + 4);
    *(_DWORD *)buf = 138412290;
    v12 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%@) to BBObserver client invalidated", buf, 0xCu);

  }
  v5 = (NSObject **)objc_loadWeakRetained(a1 + 5);
  v6 = v5;
  if (v5)
  {
    v7 = v5[5];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_52;
    v8[3] = &unk_24C5634C8;
    objc_copyWeak(&v9, a1 + 5);
    objc_copyWeak(&v10, a1 + 6);
    dispatch_async(v7, v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
  }

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_52(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeObserver:", v2);

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_54(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBServerConduit client interrupted", (uint8_t *)&v5, 0xCu);
  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "_removeSuspendedConnection:", WeakRetained);

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_55(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBServerConduit client invalidated", (uint8_t *)&v5, 0xCu);
  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "_removeSuspendedConnection:", WeakRetained);

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_59(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id *v4;
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBSettingsGateway client interrupted", (uint8_t *)&v7, 0xCu);
  }
  v4 = (id *)(a1 + 40);
  v5 = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "_removeSettingsGatewayConnection:", WeakRetained);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_removeSuspendedConnection:", WeakRetained);

}

void __47__BBServer_listener_shouldAcceptNewConnection___block_invoke_60(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id *v4;
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = WeakRetained;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "BBServer: Connection (%{public}@) to BBSettingsGateway client invalidated", (uint8_t *)&v7, 0xCu);
  }
  v4 = (id *)(a1 + 40);
  v5 = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "_removeSettingsGatewayConnection:", WeakRetained);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_removeSuspendedConnection:", WeakRetained);

}

- (void)_removeSettingsGatewayConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BBServer *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__BBServer__removeSettingsGatewayConnection___block_invoke;
  v7[3] = &unk_24C562E50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __45__BBServer__removeSettingsGatewayConnection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "removeObject:", *(_QWORD *)(a1 + 32));
}

+ (id)_persistentSettingsStore
{
  if (_persistentSettingsStore_onceToken != -1)
    dispatch_once(&_persistentSettingsStore_onceToken, &__block_literal_global_3);
  return (id)_persistentSettingsStore___persistentSettingsStore;
}

void __36__BBServer__persistentSettingsStore__block_invoke()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  __objc2_class **v3;
  id v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v0 = _os_feature_enabled_impl();
  v1 = BBLogPersistence;
  v2 = os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CCB9000, v1, OS_LOG_TYPE_DEFAULT, "Using BBXPCPersistentStore", buf, 2u);
    }
    v3 = off_24C561CA0;
  }
  else
  {
    if (v2)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20CCB9000, v1, OS_LOG_TYPE_DEFAULT, "Using BBPersistentStore", v6, 2u);
    }
    v3 = off_24C561BE8;
  }
  v4 = objc_alloc_init(*v3);
  v5 = (void *)_persistentSettingsStore___persistentSettingsStore;
  _persistentSettingsStore___persistentSettingsStore = (uint64_t)v4;

}

- (id)_sectionInfoStore
{
  BBSectionInfoStoreInterface *sectionInfoStore;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  BBXPCSectionInfoStore *v7;
  BBSectionInfoStoreInterface *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  sectionInfoStore = self->_sectionInfoStore;
  if (!sectionInfoStore)
  {
    v4 = _os_feature_enabled_impl();
    v5 = BBLogPersistence;
    v6 = os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Using BBXPCSectionInfoStore", buf, 2u);
      }
      v7 = objc_alloc_init(BBXPCSectionInfoStore);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Using BBSectionInfoStore", v10, 2u);
      }
      v7 = -[BBSectionInfoStore initWithEffectiveSettingsProvider:persistence:]([BBSectionInfoStore alloc], "initWithEffectiveSettingsProvider:persistence:", self, self->_persistentStore);
    }
    v8 = self->_sectionInfoStore;
    self->_sectionInfoStore = (BBSectionInfoStoreInterface *)v7;

    sectionInfoStore = self->_sectionInfoStore;
  }
  return sectionInfoStore;
}

- (void)publishBulletin:(id)a3 destinations:(unint64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *noticeBulletinIDsBySectionID;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "sectionID");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bulletinID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BBServer _feedsForBulletin:destinations:](self, "_feedsForBulletin:destinations:", v6, a4);
  BBPowerLogBulletinBoardPublishEvent(v7, v9);
  v10 = (void *)BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v6, "bulletinID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BBObserverFeedStrings(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v12;
    v24 = 2048;
    v25 = v9;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "BBServer: Publish bulletin %{public}@ to feeds %ld: %{public}@", (uint8_t *)&v22, 0x20u);

  }
  -[BBDismissalSyncCache findBulletinMatch:](self->_dismissalSyncCache, "findBulletinMatch:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v9 &= ~objc_msgSend(v14, "feeds");
    -[BBDismissalSyncCache removeBulletinMatch:](self->_dismissalSyncCache, "removeBulletinMatch:", v15);
    ADClientAddValueForScalarKey();
  }
  -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[BBServer _modifyBulletin:](self, "_modifyBulletin:", v6);
    -[BBServer _sendAddBulletin:toFeeds:](self, "_sendAddBulletin:toFeeds:", v6, v9);
    -[BBServer _sendModifyBulletin:toFeeds:](self, "_sendModifyBulletin:toFeeds:", v6, ~v9);
    if ((v9 & 1) == 0)
      goto LABEL_14;
LABEL_10:
    -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      noticeBulletinIDsBySectionID = self->_noticeBulletinIDsBySectionID;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](noticeBulletinIDsBySectionID, "setObject:forKey:", v19, v7);

    }
    -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v8);

    v21 = BBLogSectionUpdates;
    if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v8;
      _os_log_impl(&dword_20CCB9000, v21, OS_LOG_TYPE_DEFAULT, "Sent bulletin to 'notices' feed: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_14;
  }
  if (!v9)
  {
    -[BBServer noteFinishedWithBulletinID:](self, "noteFinishedWithBulletinID:", v8);
    goto LABEL_15;
  }
  -[BBServer _addBulletin:](self, "_addBulletin:", v6);
  -[BBServer _sendAddBulletin:toFeeds:](self, "_sendAddBulletin:toFeeds:", v6, v9);
  if ((v9 & 1) != 0)
    goto LABEL_10;
LABEL_14:
  -[BBServer _scheduleExpirationForBulletin:](self, "_scheduleExpirationForBulletin:", v6);
LABEL_15:

}

- (void)withdrawBulletinID:(id)a3 shouldSync:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *queue;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v8, "bulletinID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "BBServer: Withdraw bulletin: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    if (v4)
      v12 = objc_msgSend(v8, "usesExternalSync") ^ 1;
    else
      v12 = 0;
    -[BBServer _removeBulletin:shouldSync:](self, "_removeBulletin:shouldSync:", v8, v12);
  }

}

- (void)removeBulletinID:(id)a3 fromSection:(id)a4 inFeed:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _mapForFeed:](self, "_mapForFeed:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v13);

  }
  -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _sendRemoveBulletin:toFeeds:shouldSync:](self, "_sendRemoveBulletin:toFeeds:shouldSync:", v12, a5, 0);

}

- (void)removeBulletinID:(id)a3 fromNoticesSection:(id)a4
{
  -[BBServer removeBulletinID:fromSection:inFeed:](self, "removeBulletinID:fromSection:inFeed:", a3, a4, 1);
}

- (id)noticesBulletinIDsForSectionID:(id)a3
{
  return -[BBServer bulletinIDsForSectionID:inFeed:](self, "bulletinIDsForSectionID:inFeed:", a3, 1);
}

- (id)carBulletinIDsForSectionID:(id)a3
{
  return -[BBServer bulletinIDsForSectionID:inFeed:](self, "bulletinIDsForSectionID:inFeed:", a3, 128);
}

- (void)_addSuspendedConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer__addSuspendedConnection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __36__BBServer__addSuspendedConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeSuspendedConnection:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BBServer__removeSuspendedConnection___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __39__BBServer__removeSuspendedConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_resumeAllSuspendedConnectionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer__resumeAllSuspendedConnectionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C563518;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __64__BBServer__resumeAllSuspendedConnectionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 256);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "resume", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "removeAllObjects");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__BBServer__addObserver___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __25__BBServer__addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__BBServer__removeObserver___block_invoke;
    v7[3] = &unk_24C562E50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __28__BBServer__removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "observerFeedSet", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count") - 1;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectAtIndex:", v10, (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gateway");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);

      if (v12 == v13)
      {
        v14 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectForKey:", v15);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObjectAtIndex:", v10);
      }

      --v10;
    }
    while (v10 != -1);
  }
}

- (id)_observersForNoticesFeed
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[BBMaskedSet objectAtIndex:](self->_observerFeedSet, "objectAtIndex:", 0);
}

- (void)_sendRemoveSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BBMaskedSet objectAtIndex:](self->_observerFeedSet, "objectAtIndex:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeSection:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_observerGatewaysForFeeds:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_observerGateways;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v11, "feed", (_QWORD)v13) & a3) != 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_sendAddBulletin:(id)a3 toFeeds:(unint64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSMutableDictionary *observerGatewaysByName;
  NSObject *v10;
  void *v11;
  BBObserverGatewayEnumerator *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  id v25;
  BBObserverGatewayEnumerator *v26;
  os_log_t *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *observerGatewayEnumerators;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (os_log_t *)&BBLogGateway;
  v8 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    observerGatewaysByName = self->_observerGatewaysByName;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v44 = -[NSMutableDictionary count](observerGatewaysByName, "count");
    _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "%lu gateways found.", buf, 0xCu);

  }
  -[BBServer _observerGatewaysForFeeds:](self, "_observerGatewaysForFeeds:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") > 1)
  {
    if (a4 == 1)
    {
      v17 = BBLogGateway;
      if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Sending to all gateways without delay", buf, 2u);
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v12 = v11;
      v18 = -[BBObserverGatewayEnumerator countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v18)
      {
        v19 = v18;
        v35 = v11;
        v20 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v39 != v20)
              objc_enumerationMutation(v12);
            v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v23 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              objc_msgSend(v22, "name");
              v25 = v6;
              v26 = v12;
              v27 = v7;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v44 = (uint64_t)v28;
              _os_log_impl(&dword_20CCB9000, v24, OS_LOG_TYPE_DEFAULT, "Sending to observers of gateway: %@", buf, 0xCu);

              v7 = v27;
              v12 = v26;
              v6 = v25;

            }
            objc_msgSend(v22, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", v6, 1, 1);
          }
          v19 = -[BBObserverGatewayEnumerator countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v19);
        v11 = v35;
      }
    }
    else
    {
      v12 = objc_alloc_init(BBObserverGatewayEnumerator);
      -[BBObserverGatewayEnumerator setBulletin:](v12, "setBulletin:", v6);
      -[BBObserverGatewayEnumerator setFeeds:](v12, "setFeeds:", a4);
      -[BBObserverGatewayEnumerator setGateways:](v12, "setGateways:", self->_observerGateways);
      -[BBObserverGatewayEnumerator setGatewayTimeout:](v12, "setGatewayTimeout:", (double)BBGetObserverGatewayTimeout());
      objc_msgSend(v6, "bulletinID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_observerGatewayEnumerators, "setObject:forKey:", v12, v29);
      v30 = (void *)BBLogGateway;
      if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
      {
        observerGatewayEnumerators = self->_observerGatewayEnumerators;
        v32 = v30;
        v33 = -[NSMutableDictionary count](observerGatewayEnumerators, "count");
        *(_DWORD *)buf = 134217984;
        v44 = v33;
        _os_log_impl(&dword_20CCB9000, v32, OS_LOG_TYPE_DEFAULT, "Gateway enumerator added. %ld enumerators in flight", buf, 0xCu);

      }
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __37__BBServer__sendAddBulletin_toFeeds___block_invoke;
      v36[3] = &unk_24C562E50;
      v36[4] = self;
      v37 = v29;
      v34 = v29;
      -[BBObserverGatewayEnumerator enumerateWithCompletion:](v12, "enumerateWithCompletion:", v36);

    }
  }
  else
  {
    objc_msgSend(v11, "anyObject");
    v12 = (BBObserverGatewayEnumerator *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_observerGatewaysByName, "objectForKeyedSubscript:", CFSTR("BBObserverGatewayLocalName"));
      v12 = (BBObserverGatewayEnumerator *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v13 = BBLogGateway;
        if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20CCB9000, v13, OS_LOG_TYPE_DEFAULT, "No BulletinBoard gateways configured.", buf, 2u);
        }
        v12 = 0;
      }
    }
    v14 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[BBObserverGatewayEnumerator name](v12, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v16;
      _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "Sending to observers of gateway: %@", buf, 0xCu);

    }
    -[BBObserverGatewayEnumerator sendObserversAddBulletin:playLightsAndSirens:forFeeds:](v12, "sendObserversAddBulletin:playLightsAndSirens:forFeeds:", v6, 1, a4);
  }

}

void __37__BBServer__sendAddBulletin_toFeeds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_performPendingBulletinUpdatesForBulletinID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v4 = v2;
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Gateway enumerator completed. %lu gateway enumerators still in flight", (uint8_t *)&v5, 0xCu);

  }
}

- (void)_enqueueBulletinUpdate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v7, "bulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_pendingUpdatesByBulletinID, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[NSMutableDictionary setObject:forKey:](self->_pendingUpdatesByBulletinID, "setObject:forKey:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

- (void)_performPendingBulletinUpdatesForBulletinID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_pendingUpdatesByBulletinID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[BBServer _sendBulletinUpdate:](self, "_sendBulletinUpdate:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingUpdatesByBulletinID, "removeObjectForKey:", v4);

}

- (void)_sendBulletinUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  NSObject *v16;
  uint64_t v17;
  os_log_t *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  os_log_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BBServer *v32;
  uint64_t v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v4, "feeds");
  v32 = self;
  -[BBMaskedSet objectsForMask:](self->_observerFeedSet, "objectsForMask:");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v8 = *(_QWORD *)v37;
  v9 = (os_log_t *)&BBLogBulletinLife;
  v34 = v5;
  do
  {
    v10 = 0;
    v33 = v7;
    do
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
      objc_msgSend(v5, "bulletinID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentTransactionForBulletinID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_msgSend(v13, "incrementTransactionID");
        v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(v4, "typeDescription");
          v17 = v8;
          v18 = v9;
          v19 = v4;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bulletinID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v41 = v20;
          v42 = 2048;
          v43 = v14;
          v44 = 2114;
          v45 = v21;
          _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Sending %{public}@ bulletin with transactionID %ld, bulletin %{public}@", buf, 0x20u);

          v5 = v34;
          v4 = v19;
          v9 = v18;
          v8 = v17;
          v7 = v33;

        }
        +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:transactionID:](BBBulletinUpdateTransaction, "transactionWithBulletinUpdate:transactionID:", v4, v14);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateBulletin:withHandler:", v22, 0);
      }
      else
      {
        v23 = *v9;
        if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        v22 = v23;
        objc_msgSend(v4, "typeDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bulletinID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        v42 = 2114;
        v43 = (uint64_t)v25;
        _os_log_impl(&dword_20CCB9000, v22, OS_LOG_TYPE_DEFAULT, "Can't send %{public}@ bulletin. No transactionID for bulletin %{public}@", buf, 0x16u);

        v5 = v34;
      }

LABEL_13:
      ++v10;
    }
    while (v7 != v10);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  }
  while (v7);
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v4;
  else
    v26 = 0;
  if (objc_msgSend(v26, "shouldSync"))
  {
    objc_msgSend(v5, "sectionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBDismissalSyncCache findBulletinMatch:](v32->_dismissalSyncCache, "findBulletinMatch:", v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28 || objc_msgSend(v28, "feeds") && objc_msgSend(v29, "feeds") != 65023)
    {
      -[BBDataProviderManager dataProviderForSectionID:](v32->_dataProviderManager, "dataProviderForSectionID:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "syncsBulletinDismissal"))
        -[BBSyncServiceInterface enqueueSyncedRemovalForBulletin:feeds:](v32->_syncService, "enqueueSyncedRemovalForBulletin:feeds:", v5, v31);

    }
  }

}

- (void)_sendModifyBulletin:(id)a3 toFeeds:(unint64_t)a4
{
  NSObject *queue;
  id v7;
  NSMutableDictionary *observerGatewayEnumerators;
  void *v9;
  void *v10;
  id v11;

  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  +[BBBulletinModifyUpdate updateWithBulletin:feeds:](BBBulletinModifyUpdate, "updateWithBulletin:feeds:", v7, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  observerGatewayEnumerators = self->_observerGatewayEnumerators;
  objc_msgSend(v7, "bulletinID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](observerGatewayEnumerators, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[BBServer _enqueueBulletinUpdate:](self, "_enqueueBulletinUpdate:", v11);
  else
    -[BBServer _sendBulletinUpdate:](self, "_sendBulletinUpdate:", v11);

}

- (void)_sendRemoveBulletins:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableDictionary *observerGatewayEnumerators;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        +[BBBulletinRemoveUpdate updateWithBulletin:feeds:shouldSync:](BBBulletinRemoveUpdate, "updateWithBulletin:feeds:shouldSync:", v13, a4, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        observerGatewayEnumerators = self->_observerGatewayEnumerators;
        objc_msgSend(v13, "bulletinID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](observerGatewayEnumerators, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          -[BBServer _enqueueBulletinUpdate:](self, "_enqueueBulletinUpdate:", v14);
        else
          -[BBServer _sendBulletinUpdate:](self, "_sendBulletinUpdate:", v14);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

- (void)_sendRemoveBulletin:(id)a3 toFeeds:(unint64_t)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer _sendRemoveBulletins:toFeeds:shouldSync:](self, "_sendRemoveBulletins:toFeeds:shouldSync:", v8, a4, v5);

}

- (void)_addBulletin:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *bulletinIDsBySectionID;
  void *v9;
  void *v10;
  id v11;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "bulletinID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_bulletinsByID, "setObject:forKey:", v5);
  objc_msgSend(v5, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    bulletinIDsBySectionID = self->_bulletinIDsBySectionID;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](bulletinIDsBySectionID, "setObject:forKey:", v9, v6);

  }
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)_modifyBulletin:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *bulletinsByID;
  id v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  bulletinsByID = self->_bulletinsByID;
  objc_msgSend(v5, "bulletinID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](bulletinsByID, "setObject:forKey:", v5, v7);

}

- (void)_removeBulletin:(id)a3 rescheduleTimerIfAffected:(BOOL)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v8, "bulletinID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v11;
    _os_log_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_DEFAULT, "Server has been asked to remove bulletin: %{public}@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v8, "bulletinID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v12);

  -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v12);

  -[NSMutableDictionary objectForKey:](self->_observerGatewayEnumerators, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Cancel gateway enumerator because server removed bulletin: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    objc_msgSend(v16, "cancel");
  }
  -[BBServer _sendRemoveBulletin:toFeeds:shouldSync:](self, "_sendRemoveBulletin:toFeeds:shouldSync:", v8, 65023, v5);
  -[BBServer _clearBulletinIDIfPossible:rescheduleExpirationTimer:](self, "_clearBulletinIDIfPossible:rescheduleExpirationTimer:", v12, v6);

}

- (void)_removeBulletin:(id)a3 shouldSync:(BOOL)a4
{
  -[BBServer _removeBulletin:rescheduleTimerIfAffected:shouldSync:](self, "_removeBulletin:rescheduleTimerIfAffected:shouldSync:", a3, 1, a4);
}

- (void)_removeBulletins:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "bulletinID", (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v13);
    }

    v17 = (void *)BBLogBulletinLife;
    if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      NSStringFromBOOL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v27 = v9;
      v28 = 2114;
      v29 = v19;
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_20CCB9000, v18, OS_LOG_TYPE_DEFAULT, "Clearing section: %{public}@ syncing: %{public}@ \nwith bulletin IDs: %{public}@\nExisting notice bulletin IDs %{public}@", buf, 0x2Au);

    }
    -[BBServer _sendRemoveBulletins:toFeeds:shouldSync:](self, "_sendRemoveBulletins:toFeeds:shouldSync:", v11, 65023, v5, (_QWORD)v22);
    -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minusSet:", v10);

  }
}

- (void)_dataProviderDidClearInfo:(id)a3 forSection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer _setClearedInfo:forSectionID:](self, "_setClearedInfo:forSectionID:", v7, v6);

  -[BBServer _updateAllBulletinsForDataProvider:](self, "_updateAllBulletinsForDataProvider:", v8);
}

- (void)clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__BBServer_clearBulletinIDIfPossible_rescheduleExpirationTimer___block_invoke;
  block[3] = &unk_24C5632F8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __64__BBServer_clearBulletinIDIfPossible_rescheduleExpirationTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearBulletinIDIfPossible:rescheduleExpirationTimer:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_clearBulletinIDs:(id)a3 forSectionID:(id)a4 shouldSync:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "count"))
  {
    -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer _removeBulletins:forSectionID:shouldSync:](self, "_removeBulletins:forSectionID:shouldSync:", v10, v9, v5);
    -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __54__BBServer__clearBulletinIDs_forSectionID_shouldSync___block_invoke;
    v13[3] = &unk_24C563540;
    v13[4] = self;
    v14 = v9;
    objc_msgSend(v11, "clearedInfoForBulletins:lastClearedInfo:completion:", v10, v12, v13);

  }
}

uint64_t __54__BBServer__clearBulletinIDs_forSectionID_shouldSync___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidClearInfo:forSection:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_clearBulletinsFromDate:(id)a3 toDate:(id)a4 forSection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  id v26;
  id v27;
  BBServer *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  void *v32;
  _QWORD v33[5];
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v29 = v10;
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v10);
  v28 = self;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "recencyDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = v19;
        }
        else
        {
          objc_msgSend(v18, "date");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v22 = v21;

        if (objc_msgSend(v22, "compare:", v8) != -1 && objc_msgSend(v22, "compare:", v9) == -1)
          objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }

  -[BBServer _removeBulletins:forSectionID:shouldSync:](v28, "_removeBulletins:forSectionID:shouldSync:", v12, v29, 1);
  -[BBServer dataProviderForSectionID:](v28, "dataProviderForSectionID:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _clearedInfoForSectionID:](v28, "_clearedInfoForSectionID:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "canClearBulletinsByDate"))
  {
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke;
    v33[3] = &unk_24C563540;
    v25 = &v34;
    v33[4] = v28;
    v34 = v29;
    v26 = v29;
    objc_msgSend(v23, "clearedInfoForClearingBulletinsFromDate:toDate:lastClearedInfo:completion:", v8, v9, v24, v33);
  }
  else
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke_2;
    v31[3] = &unk_24C563540;
    v25 = &v32;
    v31[4] = v28;
    v32 = v29;
    v27 = v29;
    objc_msgSend(v23, "clearedInfoForBulletins:lastClearedInfo:completion:", v12, v24, v31);
  }

}

uint64_t __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidClearInfo:forSection:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __54__BBServer__clearBulletinsFromDate_toDate_forSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidClearInfo:forSection:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_clearSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _removeBulletins:forSectionID:shouldSync:](self, "_removeBulletins:forSectionID:shouldSync:", v6, v4, 1);
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canClearAllBulletins"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __26__BBServer__clearSection___block_invoke;
    v14[3] = &unk_24C563540;
    v9 = &v15;
    v14[4] = self;
    v15 = v4;
    v10 = v4;
    objc_msgSend(v7, "clearedInfoForClearingAllBulletinsWithLastClearedInfo:completion:", v8, v14);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __26__BBServer__clearSection___block_invoke_2;
    v12[3] = &unk_24C563540;
    v9 = &v13;
    v12[4] = self;
    v13 = v4;
    v11 = v4;
    objc_msgSend(v7, "clearedInfoForBulletins:lastClearedInfo:completion:", v6, v8, v12);
  }

}

uint64_t __26__BBServer__clearSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidClearInfo:forSection:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __26__BBServer__clearSection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dataProviderDidClearInfo:forSection:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_removeSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BBServer _allBulletinsForSectionID:](self, "_allBulletinsForSectionID:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[BBServer _removeBulletin:shouldSync:](self, "_removeBulletin:shouldSync:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[BBSectionInfoStoreInterface removeSectionWithID:](self->_sectionInfoStore, "removeSectionWithID:", v4);
  -[NSMutableSet removeObject:](self->_activeSectionIDs, "removeObject:", v4);
  -[BBMuteExpirationManager stopWatchingExpirationsForSectionID:](self->_muteManager, "stopWatchingExpirationsForSectionID:", v4);
  -[BBServer _sendRemoveSection:](self, "_sendRemoveSection:", v4);

}

- (id)_applicableSectionInfosForBulletin:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  objc_msgSend(v5, "subsectionIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "subsections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "subsectionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "containsObject:", v15);

        if (v16)
          objc_msgSend(v7, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend(v7, "count");
  if (v6 && !v17)
    objc_msgSend(v7, "addObject:", v6);

  return v7;
}

- (unint64_t)_feedsForBulletin:(id)a3 destinations:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BBServer *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  _BOOL4 v40;
  _BOOL4 v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  int v62;
  void *v63;
  char v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t m;
  _BOOL4 v74;
  void *v75;
  void *v76;
  int v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t mm;
  int v83;
  char v86;
  int v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t n;
  int v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t ii;
  id v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint64_t jj;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  unsigned __int8 v119;
  uint64_t v120;
  uint64_t kk;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  BOOL v127;
  uint64_t v128;
  BOOL v130;
  int v132;
  BBServer *v133;
  unint64_t v134;
  unint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  uint64_t v199;

  v199 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[BBServer _applicableSectionInfosForBulletin:inSection:](self, "_applicableSectionInfosForBulletin:inSection:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subsectionIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") && objc_msgSend(v8, "count") == 1)
    {
      v10 = objc_msgSend(v8, "containsObject:", v7);

      if (v10)
      {
        if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
          -[BBServer _feedsForBulletin:destinations:].cold.2();
        v11 = 0;
        goto LABEL_272;
      }
    }
    else
    {

    }
    v12 = objc_msgSend(v5, "interruptionLevel");
    v13 = v12;
    v11 = (a4 >> 1) & 1;
    v139 = v7;
    if ((a4 & 2) != 0 && v12 != 3)
    {
      v186 = 0u;
      v187 = 0u;
      v184 = 0u;
      v185 = 0u;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v184, v198, 16);
      if (v15)
      {
        v16 = v15;
        v17 = self;
        v18 = *(_QWORD *)v185;
        v11 = 1;
LABEL_13:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v185 != v18)
            objc_enumerationMutation(v14);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * v19), "notificationCenterSetting") == 2)
            break;
          if (v16 == ++v19)
          {
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v184, v198, 16);
            if (v16)
              goto LABEL_13;
            v11 = 0;
            break;
          }
        }
        self = v17;
        v7 = v139;
      }
      else
      {
        v11 = 0;
      }

    }
    v133 = self;
    v142 = v13;
    v137 = v8;
    v138 = v6;
    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v21 = v8;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v180, v197, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v181;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v181 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
          if (v24)
          {
            v28 = objc_msgSend(v24, "subsectionPriority");
            if (v28 >= objc_msgSend(v27, "subsectionPriority"))
              continue;
          }
          v29 = v27;

          v24 = v29;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v180, v197, 16);
      }
      while (v23);
    }
    else
    {
      v24 = 0;
    }

    if ((unint64_t)objc_msgSend(v5, "interruptionLevel") <= 1)
    {
      objc_msgSend(v5, "threadID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v24, "isBulletinMutedForThreadIdentifier:", v30);

      if ((v31 & 1) != 0)
      {
LABEL_271:

        v8 = v137;
        v6 = v138;
LABEL_272:

        v20 = v11;
        goto LABEL_273;
      }
    }
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v32 = v21;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v176, v196, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v177;
      v36 = v11;
LABEL_42:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v177 != v35)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v37);
        if (objc_msgSend(v38, "scheduledDeliverySetting") == 2)
          break;
        if (v34 == ++v37)
        {
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v176, v196, 16);
          if (v34)
            goto LABEL_42;
          v39 = 0;
          goto LABEL_67;
        }
      }
      v40 = objc_msgSend(v38, "criticalAlertSetting") == 2 && objc_msgSend(v5, "interruptionLevel") == 3;
      v41 = objc_msgSend(v38, "timeSensitiveSetting") == 2 && objc_msgSend(v5, "interruptionLevel") == 2;
      if (objc_msgSend(v38, "directMessagesSetting") == 2)
      {
        objc_msgSend(v5, "contentType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v42, "isEqualToString:", CFSTR("BBBulletinContentTypeMessagingDirect")) & 1) != 0)
        {
          v43 = 1;
        }
        else
        {
          objc_msgSend(v5, "contentType");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v44, "isEqualToString:", CFSTR("BBBulletinContentTypeMessagingGroup"));

        }
      }
      else
      {
        v43 = 0;
      }
      v39 = 0;
      if (v40 || v41)
        goto LABEL_52;
      v36 = v11;
      if ((v43 & 1) == 0 && v142 != 3)
      {
        v36 = v11 & 0xFFFFFFFFFFFFDFFFLL | (((a4 >> 2) & 1) << 13);
        v39 = 1;
      }
    }
    else
    {
      v39 = 0;
LABEL_52:
      v36 = v11;
    }
LABEL_67:

    v141 = objc_msgSend(v5, "interruptionLevel");
    v140 = v39;
    if ((v39 & 1) == 0 && (a4 & 8) != 0 && v141)
    {
      v174 = 0u;
      v175 = 0u;
      v172 = 0u;
      v173 = 0u;
      v45 = v32;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v172, v195, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v173;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v173 != v48)
              objc_enumerationMutation(v45);
            v50 = objc_msgSend(*(id *)(*((_QWORD *)&v172 + 1) + 8 * j), "alertType");
            if (v50 == 1)
            {
              v36 |= 2uLL;
            }
            else if (v50 == 2)
            {
              v36 |= 4uLL;
              goto LABEL_81;
            }
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v172, v195, 16);
        }
        while (v47);
      }
LABEL_81:

      v51 = v36 | 4;
      if (v142 != 3)
        v51 = v36;
      if ((v51 & 4) != 0)
        v36 = v51 & 0xFFFFFFFFFFFFFFFDLL;
      else
        v36 = v51;
    }
    v52 = v36;
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v53 = v32;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v168, v194, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v169;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v169 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * k);
          if (v24)
          {
            v59 = objc_msgSend(v24, "subsectionPriority");
            if (v59 >= objc_msgSend(v58, "subsectionPriority"))
              continue;
          }
          v60 = v58;

          v24 = v60;
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v168, v194, 16);
      }
      while (v55);
    }

    if (objc_msgSend(v24, "lockScreenSetting") == 2)
    {
      v61 = v52;
      v62 = v140;
      if (!v140 || v142 == 3)
        goto LABEL_101;
    }
    else
    {
      v61 = v52;
      v62 = v140;
      if (v142 == 3)
LABEL_101:
        v61 |= ((_DWORD)a4 << 6) & 0x8000 | (8 * ((a4 >> 2) & 1)) & 0xFFFFFFFFFFFFFF9FLL | (32 * ((v61 >> 1) & 3));
    }
    if ((v61 & 0x806E) != 0 && objc_msgSend(v5, "turnsOnDisplay") && v141 && !v62)
      v61 |= 0x800uLL;
    objc_msgSend(v5, "sound");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x4D) == 0 || v63 == 0 || v141 == 0)
      v66 = 1;
    else
      v66 = v62;
    v136 = v63;
    if ((v66 & 1) != 0)
      goto LABEL_156;
    objc_msgSend(v63, "alertConfiguration");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (!BBToneLibraryHasSettingsForAlertType(objc_msgSend(v67, "type"))
      || (objc_msgSend(v7, "usesManagedSettings") & 1) != 0)
    {
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v68 = v53;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
      if (v69)
      {
        v70 = v69;
        v71 = v61;
        v72 = *(_QWORD *)v161;
        while (2)
        {
          for (m = 0; m != v70; ++m)
          {
            if (*(_QWORD *)v161 != v72)
              objc_enumerationMutation(v68);
            if ((~objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * m), "pushSettings") & 0x12) == 0)
            {
              v74 = 1;
              goto LABEL_129;
            }
          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
          if (v70)
            continue;
          break;
        }
        v74 = 0;
LABEL_129:
        v61 = v71;
        LOBYTE(v62) = v140;
      }
      else
      {
        v74 = 0;
      }

      v7 = v139;
      goto LABEL_150;
    }
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "bb_isToneEnabledForAlertConfiguration:", v67))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "bb_isVibrationEnabledForAlertConfiguration:", v67);

      if (!v77)
      {
        v83 = 0;
LABEL_149:
        v74 = v83 != 0;
LABEL_150:
        if (v142 == 3 || v74)
          v61 |= 0x10uLL;

LABEL_156:
        if ((a4 & 0x40) == 0 || v141 == 0)
          v86 = 1;
        else
          v86 = v62;
        if ((v86 & 1) != 0)
        {
          v87 = 0;
        }
        else
        {
          v158 = 0u;
          v159 = 0u;
          v156 = 0u;
          v157 = 0u;
          v88 = v53;
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v156, v191, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v157;
            while (2)
            {
              for (n = 0; n != v90; ++n)
              {
                if (*(_QWORD *)v157 != v91)
                  objc_enumerationMutation(v88);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * n), "carPlaySetting") == 2)
                {
                  v87 = 1;
                  goto LABEL_174;
                }
              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v156, v191, 16);
              if (v90)
                continue;
              break;
            }
            v87 = 0;
LABEL_174:
            LOBYTE(v62) = v140;
          }
          else
          {
            v87 = 0;
          }

        }
        if (v142 == 3)
          v93 = 1;
        else
          v93 = v87;
        if (v93)
          v61 |= 0x80uLL;
        if ((v62 & 1) == 0)
        {
          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v94 = v53;
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v152, v190, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v153;
            while (2)
            {
              for (ii = 0; ii != v96; ++ii)
              {
                if (*(_QWORD *)v153 != v97)
                  objc_enumerationMutation(v94);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * ii), "remoteNotificationsSetting") == 2)
                {
                  v61 |= 0x4000uLL;
                  goto LABEL_193;
                }
              }
              v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v152, v190, 16);
              if (v96)
                continue;
              break;
            }
          }
LABEL_193:

        }
        if ((a4 & 0x80) != 0)
        {
          v134 = v61;
          v150 = 0u;
          v151 = 0u;
          v148 = 0u;
          v149 = 0u;
          v99 = v53;
          v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v148, v189, 16);
          v132 = v87;
          if (v100)
          {
            v101 = v100;
            LOBYTE(v102) = 0;
            v103 = *(_QWORD *)v149;
            do
            {
              for (jj = 0; jj != v101; ++jj)
              {
                if (*(_QWORD *)v149 != v103)
                  objc_enumerationMutation(v99);
                v105 = objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * jj), "announceSetting");
                if ((v102 & 1) != 0)
                {
                  v102 = 1;
                }
                else if (v105 == 2)
                {
                  objc_msgSend(v5, "contentType");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v5, "isMessagingNotification") & 1) != 0
                    || (objc_msgSend(v5, "isCallNotification") & 1) != 0)
                  {
                    v102 = 1;
                  }
                  else
                  {
                    v102 = objc_msgSend(v106, "isEqualToString:", CFSTR("BBBulletinContentTypeIntercom"));
                  }
                  if ((unint64_t)objc_msgSend(v5, "interruptionLevel") > 1)
                    v102 = 1;

                }
                else
                {
                  v102 = v105 == 3 && objc_msgSend(v5, "interruptionLevel") != 0;
                }
              }
              v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v148, v189, 16);
            }
            while (v101);
          }
          else
          {
            v102 = 0;
          }

          v107 = -[BBServer _effectiveGlobalAnnounceHeadphonesSetting](v133, "_effectiveGlobalAnnounceHeadphonesSetting");
          v108 = v102 ^ 1;
          if (v107 != 2)
            v108 = 1;
          if (!v141)
            v108 = 1;
          v61 = v134;
          v109 = v140 | v108;
          if (v141)
            v110 = v132 & v102 ^ 1;
          else
            v110 = 1;
          if (!v109)
            v61 = v134 | 0x100;
          v111 = -[BBServer _effectiveGlobalAnnounceCarPlaySetting](v133, "_effectiveGlobalAnnounceCarPlaySetting");
          if (((v140 | v110) & 1) == 0
            && (objc_msgSend(v5, "isMessagingNotification") & ((v111 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0)
          {
            v61 |= 0x1000uLL;
          }
          v112 = -[BBServer _effectiveGlobalAnnounceHearingAidsSetting](v133, "_effectiveGlobalAnnounceHearingAidsSetting");
          v113 = -[BBServer _effectiveGlobalAnnounceBuiltInSpeakerSetting](v133, "_effectiveGlobalAnnounceBuiltInSpeakerSetting");
          v7 = v139;
          if (v102)
          {
            v114 = v113 == 2 || v112 == 2;
            if (v114 && v141 && !v140)
              v61 |= 0x100uLL;
          }
        }
        if ((v61 & 8) != 0 && BBShouldAlwaysSpeakLockScreenNotifications())
          v61 |= 0x100uLL;
        v115 = v136;
        if ((a4 & 0x100) != 0)
        {
          v135 = v61;
          v146 = 0u;
          v147 = 0u;
          v144 = 0u;
          v145 = 0u;
          v116 = v53;
          v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v144, v188, 16);
          if (v117)
          {
            v118 = v117;
            v119 = 0;
            v120 = *(_QWORD *)v145;
            do
            {
              for (kk = 0; kk != v118; ++kk)
              {
                if (*(_QWORD *)v145 != v120)
                  objc_enumerationMutation(v116);
                v122 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * kk);
                v123 = objc_msgSend(v122, "alertType");
                v124 = objc_msgSend(v122, "carPlaySetting");
                v127 = (objc_msgSend(v122, "announceSetting") & 0xFFFFFFFFFFFFFFFELL) == 2 || v124 == 2 || v123 != 0;
                v119 |= v127;
              }
              v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v144, v188, 16);
            }
            while (v118);
          }
          else
          {
            v119 = 0;
          }

          v128 = objc_msgSend(v24, "lockScreenSetting");
          v130 = v142 == 3 || v128 == 2;
          v11 = v135;
          if (((v130 | v119) & 1) != 0)
            v11 = v135 | 0x400;
          v7 = v139;
          v115 = v136;
        }
        else
        {
          v11 = v61;
        }

        goto LABEL_271;
      }
    }
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v78 = v53;
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v164, v193, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v165;
      while (2)
      {
        for (mm = 0; mm != v80; ++mm)
        {
          if (*(_QWORD *)v165 != v81)
            objc_enumerationMutation(v78);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v164 + 1) + 8 * mm), "authorizationStatus") == 2)
          {
            v83 = 1;
            goto LABEL_145;
          }
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v164, v193, 16);
        if (v80)
          continue;
        break;
      }
      v83 = 0;
LABEL_145:
      LOBYTE(v62) = v140;
    }
    else
    {
      v83 = 0;
    }

    v7 = v139;
    goto LABEL_149;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    -[BBServer _feedsForBulletin:destinations:].cold.1();
  v20 = 0;
LABEL_273:

  return v20;
}

- (id)_bulletinsForIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_allBulletinsForSectionID:(id)a3
{
  void *v4;
  void *v5;

  -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sectionInfoArrayForSectionIDs:(id)a3 effective:(BOOL)a4
{
  return (id)-[BBSectionInfoStoreInterface sortedSectionInfoForSectionIDs:effective:](self->_sectionInfoStore, "sortedSectionInfoForSectionIDs:effective:", a3, a4);
}

- (id)_sectionInfoArrayForActiveSections:(BOOL)a3
{
  return (id)-[BBSectionInfoStoreInterface allSortedActiveSections:](self->_sectionInfoStore, "allSortedActiveSections:", a3);
}

- (id)_allSectionInfoIDs
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return (id)-[BBSectionInfoStoreInterface allUnsortedSectionInfoIDs](self->_sectionInfoStore, "allUnsortedSectionInfoIDs");
}

- (void)_clearBulletinIDIfPossible:(id)a3 rescheduleExpirationTimer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  NSMutableDictionary *observerGatewayEnumerators;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  const __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = self->_observers;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v11), "currentTransactionForBulletinID:", v6, (_QWORD)v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  -[NSMutableDictionary objectForKey:](self->_observerGatewayEnumerators, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      observerGatewayEnumerators = self->_observerGatewayEnumerators;
      v17 = v15;
      v18 = -[NSMutableDictionary count](observerGatewayEnumerators, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v18;
      _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Bulletin still in use by one of %d gateway enumerators", buf, 8u);

    }
  }
  -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v6, (_QWORD)v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer noticesBulletinIDsForSectionID:](self, "noticesBulletinIDsForSectionID:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v6);

  if (v14)
    v23 = 1;
  else
    v23 = v13;
  v24 = BBLogBulletinLife;
  v25 = os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT);
  if ((v23 & 1) != 0 || (v22 & 1) != 0)
  {
    if (v25)
    {
      v28 = CFSTR("recent interruptions array");
      if (v14)
        v28 = CFSTR("a gateway enumerator");
      if (v22)
        v28 = CFSTR("list");
      if (v13)
        v28 = CFSTR("an observer");
      *(_DWORD *)buf = 138412546;
      v34 = v6;
      v35 = 2114;
      v36 = v28;
      _os_log_impl(&dword_20CCB9000, v24, OS_LOG_TYPE_DEFAULT, "BBServer not purging bulletin %@ because still in use by %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_impl(&dword_20CCB9000, v24, OS_LOG_TYPE_DEFAULT, "BBServer purging bulletin: %{public}@", buf, 0xCu);
    }
    -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeObject:", v6);

    -[NSMutableDictionary objectForKey:](self->_noticeBulletinIDsBySectionID, "objectForKey:", v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObject:", v6);

    if (-[NSMutableArray containsObject:](self->_expiringBulletinIDs, "containsObject:", v6))
    {
      -[NSMutableArray removeObject:](self->_expiringBulletinIDs, "removeObject:", v6);
      if (v4)
        -[BBServer _expireBulletinsAndRescheduleTimerIfNecessary](self, "_expireBulletinsAndRescheduleTimerIfNecessary");
    }
    if (-[NSMutableArray containsObject:](self->_eventBasedExpiringBulletinIDs, "containsObject:", v6))
      -[NSMutableArray removeObject:](self->_eventBasedExpiringBulletinIDs, "removeObject:", v6);
    -[BBServer noteFinishedWithBulletinID:](self, "noteFinishedWithBulletinID:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_bulletinsByID, "removeObjectForKey:", v6);
  }

}

- (void)_addStateCaptureHandlers
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6[5];
  id v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDAC760];
  v7[1] = (id)MEMORY[0x24BDAC760];
  v7[2] = (id)3221225472;
  v7[3] = __36__BBServer__addStateCaptureHandlers__block_invoke;
  v7[4] = &unk_24C563568;
  objc_copyWeak(&v8, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();
  v6[1] = v2;
  v6[2] = (id)3221225472;
  v6[3] = __36__BBServer__addStateCaptureHandlers__block_invoke_2;
  v6[4] = &unk_24C563568;
  objc_copyWeak(v7, &location);
  v4 = (id)BSLogAddStateCaptureBlockWithTitle();
  objc_copyWeak(v6, &location);
  v5 = (id)BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __36__BBServer__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sectionInfoArray:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v8, "stateCapture");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "sectionID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setValue:forKey:", v9, v10);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  return v2;
}

id __36__BBServer__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  const __CFString *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[11];
  _QWORD v43[11];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BBStringFromBBContentPreviewSetting(objc_msgSend(WeakRetained, "_effectiveGlobalContentPreviewsSetting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBContentPreviewSetting(objc_msgSend(v2, "_globalContentPreviewsSetting"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBContentPreviewSetting(objc_msgSend(v2, "_defaultGlobalContentPreviewSetting"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceSetting(objc_msgSend(v2, "_effectiveGlobalAnnounceSetting"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceSetting(objc_msgSend(v2, "_globalAnnounceSetting"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceSetting(objc_msgSend(v2, "_effectiveGlobalAnnounceHeadphonesSetting"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceSetting(objc_msgSend(v2, "_globalAnnounceHeadphonesSetting"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceCarPlaySetting(objc_msgSend(v2, "_effectiveGlobalAnnounceCarPlaySetting"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBAnnounceCarPlaySetting(objc_msgSend(v2, "_globalAnnounceCarPlaySetting"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBScheduledDeliverySetting(objc_msgSend(v2, "_effectiveGlobalScheduledDeliverySetting"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    BBStringFromBBSystemSetting(objc_msgSend(v2, "_effectiveGlobalScheduledDeliveryShowNextSummarySetting"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_effectiveGlobalScheduledDeliveryTimes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
      v8 = CFSTR("[ ");
      do
      {
        v9 = 0;
        v10 = v8;
        do
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(v4);
          -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR(" %li:%li, "), objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "hour"), objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "minute"));
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v8;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v6);
    }
    else
    {
      v8 = CFSTR("[ ");
    }
    -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR(" ]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    BBStringFromBBNotificationListDisplayStyleSetting(objc_msgSend(v2, "_effectiveGlobalNotificationListDisplayStyleSetting"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = CFSTR("EffectiveContentPreviewSetting");
    v44[1] = CFSTR("ContentPreviewSetting");
    v45[0] = v3;
    v45[1] = v33;
    v44[2] = CFSTR("DefaultContentPreviewSettingForDevice");
    v45[2] = v32;
    v46[0] = CFSTR("ContentPreviews");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v23;
    v46[1] = CFSTR("AnnounceNotifications");
    v42[0] = CFSTR("EffectiveAnnounceSetting");
    v42[1] = CFSTR("AnnounceSetting");
    v43[0] = v31;
    v43[1] = v30;
    v42[2] = CFSTR("AnnounceSupportedHeadphones");
    BBStringFromBool(objc_msgSend(v2, "_isAnnounceSupportedForHeadphones"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v22;
    v42[3] = CFSTR("AnnounceSupportedCarPlay");
    BBStringFromBool(objc_msgSend(v2, "_isAnnounceSupportedForCarPlay"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v21;
    v43[4] = v29;
    v42[4] = CFSTR("EffectiveAnnounceHeadphonesSetting");
    v42[5] = CFSTR("EffectiveAnnounceCarPlaySetting");
    v43[5] = v27;
    v43[6] = v28;
    v42[6] = CFSTR("AnnounceHeadphonesSetting");
    v42[7] = CFSTR("AnnounceCarPlaySetting");
    v43[7] = v26;
    v42[8] = CFSTR("PairedVehiclesForCarPlay");
    BBStringFromBool(objc_msgSend(v2, "_hasPairedVehiclesForCarPlay"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[8] = v20;
    v42[9] = CFSTR("SiriEnabled");
    BBStringFromBool(v2[305]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[9] = v12;
    v42[10] = CFSTR("SiriAllowedWhenLocked");
    BBStringFromBool(v2[304]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43[10] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v14;
    v46[2] = CFSTR("ScheduledDelivery");
    v40[0] = CFSTR("EffectiveScheduledDeliverySetting");
    v40[1] = CFSTR("EffectiveScheduledDeliveryShowNextSummarySetting");
    v41[0] = v25;
    v41[1] = v24;
    v40[2] = CFSTR("ScheduledDeliveryTimes");
    v41[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v15;
    v46[3] = CFSTR("NotificationList");
    v38 = CFSTR("EffectiveNotificationListDisplayStyleSetting");
    v39 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v11;
}

id __36__BBServer__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(WeakRetained, "_allSectionInfoIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v2, "allBulletinIDsForSectionID:", v13, (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            v10 += objc_msgSend(v14, "count");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setValue:forKey:", v15, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v23[0] = CFSTR("BulletinCountBySection");
    v23[1] = CFSTR("TotalBulletinCount");
    v24[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v16;
}

- (void)_handleSignificantTimeChange
{
  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  -[BBServer _expireBulletinsAndRescheduleTimerIfNecessary](self, "_expireBulletinsAndRescheduleTimerIfNecessary");
}

- (void)_clearExpirationTimer
{
  NSObject *expirationTimer;
  OS_dispatch_source *v4;
  NSDate *nextScheduledExpirationTimerFireDate;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    v4 = self->_expirationTimer;
    self->_expirationTimer = 0;

  }
  nextScheduledExpirationTimerFireDate = self->_nextScheduledExpirationTimerFireDate;
  self->_nextScheduledExpirationTimerFireDate = 0;

}

- (void)_scheduleTimerForDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  NSDate **p_nextScheduledExpirationTimerFireDate;
  OS_dispatch_source *v10;
  OS_dispatch_source *expirationTimer;
  NSObject *v12;
  NSObject *v13;
  NSDate *v14;
  _QWORD handler[5];
  uint8_t buf[4];
  NSDate *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _clearExpirationTimer](self, "_clearExpirationTimer");
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  if (v5 < 20.0)
  {
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_ERROR))
      -[BBServer _scheduleTimerForDate:].cold.1();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 60.0;
    objc_msgSend(v7, "dateByAddingTimeInterval:", 60.0);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v8;
  }
  p_nextScheduledExpirationTimerFireDate = &self->_nextScheduledExpirationTimerFireDate;
  objc_storeStrong((id *)&self->_nextScheduledExpirationTimerFireDate, v4);
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  expirationTimer = self->_expirationTimer;
  self->_expirationTimer = v10;

  v12 = self->_expirationTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __34__BBServer__scheduleTimerForDate___block_invoke;
  handler[3] = &unk_24C562E28;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_source_set_timer((dispatch_source_t)self->_expirationTimer, 0, (unint64_t)(v6 * 1000000000.0), 0x4A817C800uLL);
  dispatch_resume((dispatch_object_t)self->_expirationTimer);
  v13 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *p_nextScheduledExpirationTimerFireDate;
    *(_DWORD *)buf = 138543362;
    v17 = v14;
    _os_log_impl(&dword_20CCB9000, v13, OS_LOG_TYPE_DEFAULT, "Expiration timer now set for %{public}@", buf, 0xCu);
  }

}

uint64_t __34__BBServer__scheduleTimerForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireBulletinsAndRescheduleTimerIfNecessary");
}

- (id)_nextExpireBulletinsDate
{
  NSMutableDictionary *bulletinsByID;
  void *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_expiringBulletinIDs, "count"))
  {
    bulletinsByID = self->_bulletinsByID;
    -[NSMutableArray objectAtIndex:](self->_expiringBulletinIDs, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](bulletinsByID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_expireBulletinsAndRescheduleTimerIfNecessary
{
  NSDate *v3;
  NSObject *v4;
  NSDate *nextScheduledExpirationTimerFireDate;
  uint64_t v6;
  NSDate *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  NSDate *v13;
  __int16 v14;
  NSDate *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _expireBulletins](self, "_expireBulletins");
  -[BBServer _nextExpireBulletinsDate](self, "_nextExpireBulletinsDate");
  v3 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  v4 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    nextScheduledExpirationTimerFireDate = self->_nextScheduledExpirationTimerFireDate;
    v12 = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = nextScheduledExpirationTimerFireDate;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Next expire bulletins date = %{public}@; current fire date = %{public}@",
      (uint8_t *)&v12,
      0x16u);
  }
  if (v3)
  {
    if (!-[NSDate isEqualToDate:](v3, "isEqualToDate:", self->_nextScheduledExpirationTimerFireDate))
    {
      -[BBServer _clearExpirationTimer](self, "_clearExpirationTimer");
      -[BBServer _scheduleTimerForDate:](self, "_scheduleTimerForDate:", v3);
      goto LABEL_11;
    }
    v6 = BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_nextScheduledExpirationTimerFireDate;
      v12 = 138543362;
      v13 = v7;
      v8 = "Not adjusting expiration timer. Next fire date = %{public}@";
      v9 = v6;
      v10 = 12;
LABEL_9:
      _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    -[BBServer _clearExpirationTimer](self, "_clearExpirationTimer");
    v11 = BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "Expiration timer is not set.";
      v9 = v11;
      v10 = 2;
      goto LABEL_9;
    }
  }
LABEL_11:

}

- (id)_bulletinIDsInSortedArray:(id)a3 withDateForKey:(id)a4 beforeCutoff:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v21 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "valueForKey:", v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "laterDate:", v9);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (v18 != v9)
        {

          goto LABEL_11;
        }
        objc_msgSend(v10, "addObject:", v15);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (unint64_t)_indexForNewDate:(id)a3 inBulletinIDArray:(id)a4 sortedAscendingByDateForKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  NSMutableDictionary *bulletinsByID;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = objc_msgSend(v9, "count");
  v12 = 0;
  if (v11)
  {
    while (1)
    {
      bulletinsByID = self->_bulletinsByID;
      objc_msgSend(v9, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](bulletinsByID, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "valueForKey:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "earlierDate:", v8);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17 == v8)
        break;
      if (v11 == ++v12)
      {
        v12 = v11;
        break;
      }
    }
  }
  if (v12 >= v11)
    v18 = v11;
  else
    v18 = v12;

  return v18;
}

- (void)_expireBulletinsDueToSystemEvent:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *eventBasedExpiringBulletinIDs;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = BBLogExpiration;
  if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = a3;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Received system event %ld; checking for expiration",
      buf,
      0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_eventBasedExpiringBulletinIDs);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v24;
    *(_QWORD *)&v10 = 138543874;
    v22 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v14, "expirationEvents", v22, (_QWORD)v23) & a3) != 0)
        {
          v15 = (void *)BBLogExpiration;
          if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            objc_msgSend(v14, "sectionID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "bulletinID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v28 = (unint64_t)v17;
            v29 = 2114;
            v30 = v18;
            v31 = 2048;
            v32 = a3;
            _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "Expiring bulletin in section <%{public}@>: bulletinID = <%{public}@>, event %ld", buf, 0x20u);

          }
          objc_msgSend(v14, "responseForExpireAction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBServer deliverResponse:withCompletion:](self, "deliverResponse:withCompletion:", v19, 0);
          eventBasedExpiringBulletinIDs = self->_eventBasedExpiringBulletinIDs;
          objc_msgSend(v14, "bulletinID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObject:](eventBasedExpiringBulletinIDs, "removeObject:", v21);

          -[BBServer _removeBulletin:rescheduleTimerIfAffected:shouldSync:](self, "_removeBulletin:rescheduleTimerIfAffected:shouldSync:", v14, 0, 0);
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v11);
  }

}

- (void)_expireBulletins
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *expiringBulletinIDs;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_expiringBulletinIDs, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingTimeInterval:", 20.0);
    v4 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v4;
    -[BBServer _bulletinIDsInSortedArray:withDateForKey:beforeCutoff:](self, "_bulletinIDsInSortedArray:withDateForKey:beforeCutoff:", self->_expiringBulletinIDs, CFSTR("expirationDate"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v10 = (void *)BBLogExpiration;
          if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v10;
            objc_msgSend(v9, "sectionID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "bulletinID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "expirationDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v26 = v12;
            v27 = 2114;
            v28 = v13;
            v29 = 2114;
            v30 = v14;
            _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "Expiring bulletin in section <%{public}@>: bulletinID = <%{public}@>, expiration date = <%{public}@>", buf, 0x20u);

          }
          objc_msgSend(v9, "responseForExpireAction");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBServer deliverResponse:withCompletion:](self, "deliverResponse:withCompletion:", v15, 0);
          expiringBulletinIDs = self->_expiringBulletinIDs;
          objc_msgSend(v9, "bulletinID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObject:](expiringBulletinIDs, "removeObject:", v17);

          -[BBServer _removeBulletin:rescheduleTimerIfAffected:shouldSync:](self, "_removeBulletin:rescheduleTimerIfAffected:shouldSync:", v9, 0, 0);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v6);
    }

  }
}

- (id)_newValidatedDefaultExpirationComponentsFromComponents:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    if (objc_msgSend(v3, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = objc_msgSend(v3, "hour");
      if (v5 >= 0)
        v6 = v5;
      else
        v6 = -v5;
      objc_msgSend(v4, "setHour:", v6);
    }
    if (objc_msgSend(v3, "day") != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = objc_msgSend(v3, "day");
      if (v7 >= 0)
        v8 = v7;
      else
        v8 = -v7;
      objc_msgSend(v4, "setDay:", v8);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_newDateCompontentsByInvertingInterestingPartsOfComponents:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    if (objc_msgSend(v3, "hour") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));
    if (objc_msgSend(v3, "day") != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "setDay:", -objc_msgSend(v3, "day"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setDefaultExpirationComponents:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *v5;
  NSDateComponents *defaultExpirationComponents;
  NSDateComponents *v7;
  NSDateComponents *v8;
  NSDateComponents *expirationReferenceComponents;
  NSDateComponents *v10;

  v10 = (NSDateComponents *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = v10;
  if (self->_defaultExpirationComponents != v10)
  {
    v5 = -[BBServer _newValidatedDefaultExpirationComponentsFromComponents:](self, "_newValidatedDefaultExpirationComponentsFromComponents:", v10);
    defaultExpirationComponents = self->_defaultExpirationComponents;
    self->_defaultExpirationComponents = v5;
    v7 = v5;

    v8 = -[BBServer _newDateCompontentsByInvertingInterestingPartsOfComponents:](self, "_newDateCompontentsByInvertingInterestingPartsOfComponents:", self->_defaultExpirationComponents);
    expirationReferenceComponents = self->_expirationReferenceComponents;
    self->_expirationReferenceComponents = v8;

    v4 = v10;
  }

}

- (id)_bulletinDefaultExpirationDateFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_defaultExpirationComponents)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", self->_defaultExpirationComponents, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_validateExpirationDateForBulletinRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_defaultExpirationComponents)
  {
    objc_msgSend(v8, "recencyDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || (objc_msgSend(v8, "date"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v8, "expirationDate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[BBServer _bulletinDefaultExpirationDateFromDate:](self, "_bulletinDefaultExpirationDateFromDate:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v5)
        v5 = v6;
      objc_msgSend(v8, "setExpirationDate:", v5);

    }
  }

}

- (void)_scheduleExpirationForBulletin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *expiringBulletinIDs;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "expirationEvents");
  expiringBulletinIDs = self->_expiringBulletinIDs;
  if (v5)
  {
    -[NSMutableArray removeObject:](expiringBulletinIDs, "removeObject:", v6);
    v9 = -[BBServer _indexForNewDate:inBulletinIDArray:sortedAscendingByDateForKey:](self, "_indexForNewDate:inBulletinIDArray:sortedAscendingByDateForKey:", v5, self->_expiringBulletinIDs, CFSTR("expirationDate"));
    -[NSMutableArray insertObject:atIndex:](self->_expiringBulletinIDs, "insertObject:atIndex:", v6, v9);
    v10 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v4, "bulletinID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = (uint64_t)v5;
      v20 = 2048;
      v21 = v9;
      _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "Bulletin with bulletinID <%{public}@>, expiration date <%{public}@> inserted in expiring bulletins array at index %ld", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    if (!-[NSMutableArray containsObject:](expiringBulletinIDs, "containsObject:", v6))
      goto LABEL_7;
    -[NSMutableArray removeObject:](self->_expiringBulletinIDs, "removeObject:", v6);
  }
  -[BBServer _expireBulletinsAndRescheduleTimerIfNecessary](self, "_expireBulletinsAndRescheduleTimerIfNecessary");
LABEL_7:
  if (v7)
  {
    v13 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v4, "bulletinID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2048;
      v19 = v7;
      _os_log_impl(&dword_20CCB9000, v14, OS_LOG_TYPE_DEFAULT, "Bulletin with bulletinID <%{public}@>, expiration event <%ld> inserted in event-based expiring bulletins array", (uint8_t *)&v16, 0x16u);

    }
    -[NSMutableArray addObject:](self->_eventBasedExpiringBulletinIDs, "addObject:", v6);
  }

}

- (void)ping:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__BBServer_ping___block_invoke;
  block[3] = &unk_24C5632A8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

uint64_t __17__BBServer_ping___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getSectionParametersForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BBServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BBServer_getSectionParametersForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563590;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __57__BBServer_getSectionParametersForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "dataProviderForSectionID:");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sectionParameters");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
  }
}

- (void)_storeObserver:(id)a3 forFeed:(unint64_t)a4
{
  NSObject *queue;
  id v7;

  queue = self->_queue;
  v7 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBMaskedSet removeObject:](self->_observerFeedSet, "removeObject:", v7);
  -[BBMaskedSet addObject:withMask:](self->_observerFeedSet, "addObject:withMask:", v7, a4);

}

- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 attachToLightsAndSirensGateway:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BBServer *v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke;
  v13[3] = &unk_24C5635B8;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __68__BBServer_observer_setObserverFeed_attachToLightsAndSirensGateway___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BBObserverGatewayHolder *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_storeObserver:forFeed:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v5 = -[BBObserverGatewayHolder initWithQueue:name:]([BBObserverGatewayHolder alloc], "initWithQueue:name:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));
      v2 = v5;
    }
    v6 = v2;
    objc_msgSend(v2, "observerFeedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v6, "observerFeedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:withMask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
}

- (void)observer:(id)a3 setObserverFeed:(unint64_t)a4 asLightsAndSirensGateway:(id)a5 priority:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  BBServer *v18;
  unint64_t v19;
  unint64_t v20;

  v10 = a3;
  v11 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke;
  block[3] = &unk_24C5635E0;
  v16 = v10;
  v17 = v11;
  v18 = self;
  v19 = a4;
  v20 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

void __71__BBServer_observer_setObserverFeed_asLightsAndSirensGateway_priority___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  BBObserverGatewayHolder *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_storeObserver:forFeed:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v6 = -[BBObserverGatewayHolder initWithQueue:name:]([BBObserverGatewayHolder alloc], "initWithQueue:name:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
      v2 = v6;
    }
    v7 = v2;
    objc_msgSend(v2, "gateway");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(v7, "setGateway:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v7, "setGatewayPriority:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v7, "setFeed:", *(_QWORD *)(a1 + 56));
      v4 = 0;
      switch(*(_QWORD *)(a1 + 64))
      {
        case 0:
        case 3:
          goto LABEL_12;
        case 1:
          v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "count") != 0;
          goto LABEL_12;
        case 2:
          v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "count");
          if (v5 >= 2)
            v4 = 2;
          else
            v4 = v5;
LABEL_12:
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "insertObject:atIndex:", v7, v4);
          break;
        default:
          break;
      }
    }

  }
}

- (id)_openApplicationOptionsForResponse:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = *MEMORY[0x24BE38310];
  v5 = *MEMORY[0x24BE38320];
  v6 = a3;
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, MEMORY[0x24BDBD1C8], v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BE382E0]);

  return v7;
}

- (void)_didReceiveResponseForBulletin:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BBServer *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__BBServer__didReceiveResponseForBulletin___block_invoke;
  v7[3] = &unk_24C562E50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __43__BBServer__didReceiveResponseForBulletin___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bulletinID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_clearBulletinIDIfPossible:rescheduleExpirationTimer:", v2, 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "currentTransactionForBulletinID:", v2, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v8, "noteServerReceivedResponseForBulletin:", *(_QWORD *)(a1 + 32));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)observer:(id)a3 handleResponse:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  BBServer *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke;
  block[3] = &unk_24C563280;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int8x16_t v22;
  int8x16_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  int8x16_t v29;
  id v30;
  id v31;
  _QWORD v32[4];
  int8x16_t v33;
  id v34;
  id v35;

  v2 = a1[4];
  if (v2)
  {
    objc_msgSend(v2, "bulletinID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
        __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_2();
      goto LABEL_13;
    }
    objc_msgSend(*((id *)a1[5] + 15), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionForResponse:", a1[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDC15A0]);
      objc_msgSend(a1[5], "_openApplicationOptionsForResponse:", a1[4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrontBoardOptions:", v8);

      objc_msgSend(a1[4], "endpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTargetConnectionEndpoint:", v9);

      objc_msgSend(v7, "setSensitive:", 1);
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_154;
      v32[3] = &unk_24C563630;
      v22 = *((int8x16_t *)a1 + 2);
      v12 = (id)v22.i64[0];
      v33 = vextq_s8(v22, v22, 8uLL);
      v34 = v4;
      v35 = a1[6];
      objc_msgSend(v10, "openURL:configuration:completionHandler:", v11, v7, v32);

      v13 = (void *)v33.i64[1];
    }
    else
    {
      objc_msgSend(v5, "launchBundleID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v20 = a1[4];
        v21 = a1[5];
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_159;
        v24[3] = &unk_24C5636D0;
        v24[4] = v21;
        v25 = v20;
        v26 = v4;
        v27 = a1[6];
        objc_msgSend(v21, "deliverResponse:withCompletion:", v25, v24);

        goto LABEL_12;
      }
      v7 = objc_alloc_init(MEMORY[0x24BDC15A0]);
      objc_msgSend(a1[5], "_openApplicationOptionsForResponse:", a1[4]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrontBoardOptions:", v15);

      objc_msgSend(a1[4], "endpoint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTargetConnectionEndpoint:", v16);

      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchBundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_156;
      v28[3] = &unk_24C563680;
      v23 = *((int8x16_t *)a1 + 2);
      v19 = (id)v23.i64[0];
      v29 = vextq_s8(v23, v23, 8uLL);
      v30 = v4;
      v31 = a1[6];
      objc_msgSend(v17, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v18, v7, v28);

      v13 = (void *)v29.i64[1];
    }

LABEL_12:
LABEL_13:

    return;
  }
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
    __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_1();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2;
  block[3] = &unk_24C563608;
  v11 = v4;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v8;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v9 = v4;
  dispatch_async(v6, block);

}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setDidOpenApplication:", 1);
    objc_msgSend(*(id *)(a1 + 48), "deliverResponse:withCompletion:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 48), "_didReceiveResponseForBulletin:", *(_QWORD *)(a1 + 56));
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, v2 == 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_156(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_157;
  v11[3] = &unk_24C563658;
  v17 = a2;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = *(id *)(a1 + 56);
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_157(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDidOpenApplication:", 1);
    objc_msgSend(*(id *)(a1 + 40), "deliverResponse:withCompletion:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(*(id *)(a1 + 40), "_didReceiveResponseForBulletin:", *(_QWORD *)(a1 + 48));
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_157_cold_1();
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 32));
  return result;
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_159(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  char v12;

  block[0] = MEMORY[0x24BDAC760];
  block[2] = __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_160;
  block[3] = &unk_24C5636A8;
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  block[1] = 3221225472;
  v12 = a2;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

}

uint64_t __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_160(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 64)
    || (objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1),
        objc_msgSend(*(id *)(a1 + 40), "_didReceiveResponseForBulletin:", *(_QWORD *)(a1 + 48)),
        !*(_BYTE *)(a1 + 64)))
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_160_cold_1();
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)observer:(id)a3 finishedWithBulletinID:(id)a4 transactionID:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BBServer *v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__BBServer_observer_finishedWithBulletinID_transactionID___block_invoke;
  v13[3] = &unk_24C5635B8;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __58__BBServer_observer_finishedWithBulletinID_transactionID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "currentTransactionForBulletinID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "transactionID") == *(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "removeTransaction:", v3);
      v4 = BBLogBulletinLife;
      if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v15 = 138543362;
        v16 = v5;
        _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Observer is finished with bulletin %{public}@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 72), "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

      if (v7)
      {
        v8 = BBLogSectionUpdates;
        if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v15 = 138543362;
          v16 = v9;
          _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "List observer is finished with bulletin %{public}@", (uint8_t *)&v15, 0xCu);
        }
      }
      objc_msgSend(*(id *)(a1 + 48), "_clearBulletinIDIfPossible:rescheduleExpirationTimer:", *(_QWORD *)(a1 + 40), 1);
    }
    else
    {
      v10 = (void *)BBLogBulletinLife;
      if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 56);
        v12 = v10;
        v13 = objc_msgSend(v3, "transactionID");
        v14 = *(_QWORD *)(a1 + 40);
        v15 = 134218498;
        v16 = v11;
        v17 = 2048;
        v18 = v13;
        v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring observer 'finishedWithBulletinID' for outdated transactionID %ld. Current ID: %ld, bulletin: %{public}@", (uint8_t *)&v15, 0x20u);

      }
    }

  }
}

- (void)observer:(id)a3 clearSection:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  BBServer *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__BBServer_observer_clearSection___block_invoke;
  v8[3] = &unk_24C562E50;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __34__BBServer_observer_clearSection___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = BBLogSectionUpdates;
    if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Handling clear section %{public}@", (uint8_t *)&v4, 0xCu);
    }
    return objc_msgSend(*(id *)(v1 + 40), "_clearSection:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (void)observer:(id)a3 clearBulletinsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BBServer *v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__BBServer_observer_clearBulletinsFromDate_toDate_inSections___block_invoke;
  v16[3] = &unk_24C5636F8;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v20 = self;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, v16);

}

void __62__BBServer_observer_clearBulletinsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(a1 + 48);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v14;
      *(_QWORD *)&v4 = 138543874;
      v12 = v4;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
          v9 = BBLogSectionUpdates;
          if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v11 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v12;
            v18 = v8;
            v19 = 2114;
            v20 = v10;
            v21 = 2114;
            v22 = v11;
            _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "Handling clear bulletins for section %{public}@: %{public}@ to %{public}@", buf, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 56), "_clearBulletinsFromDate:toDate:forSection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8, v12, (_QWORD)v13);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      }
      while (v5);
    }

  }
}

- (void)observer:(id)a3 clearBulletinIDs:(id)a4 inSection:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  BBServer *v15;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BBServer_observer_clearBulletinIDs_inSection___block_invoke;
  block[3] = &unk_24C563438;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

}

uint64_t __48__BBServer_observer_clearBulletinIDs_inSection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogSectionUpdates;
  if (os_log_type_enabled((os_log_t)BBLogSectionUpdates, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Handling clear bulletins for section %@: %@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_clearBulletinIDs:forSectionID:shouldSync:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

- (void)observer:(id)a3 removeBulletins:(id)a4 inSection:(id)a5 fromFeeds:(unint64_t)a6
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BBServer_observer_removeBulletins_inSection_fromFeeds___block_invoke;
  block[3] = &unk_24C5632D0;
  block[4] = self;
  v12 = v8;
  v13 = a6;
  v10 = v8;
  dispatch_async(queue, block);

}

uint64_t __57__BBServer_observer_removeBulletins_inSection_fromFeeds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRemoveBulletins:toFeeds:shouldSync:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

- (void)observer:(id)a3 getSectionInfoWithHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__BBServer_observer_getSectionInfoWithHandler___block_invoke;
  v8[3] = &unk_24C5631E0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __47__BBServer_observer_getSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArray:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

- (void)observer:(id)a3 getSectionInfoForActiveSectionsWithHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__BBServer_observer_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v8[3] = &unk_24C5631E0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __64__BBServer_observer_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArrayForActiveSections:", 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

- (void)observer:(id)a3 getSectionInfoForSectionIDs:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__BBServer_observer_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_24C563590;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

}

void __61__BBServer_observer_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArrayForSectionIDs:effective:", *(_QWORD *)(a1 + 40), 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

- (void)observer:(id)a3 requestNoticesBulletinsForSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BBServer_observer_requestNoticesBulletinsForSectionID___block_invoke;
  block[3] = &unk_24C563438;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __57__BBServer_observer_requestNoticesBulletinsForSectionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendObserver:noticesBulletinsForSectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)requestNoticesBulletinsForAllSections:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke_2;
  v4[3] = &unk_24C563720;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "performBlockOnDataProviders:", v4);

}

void __50__BBServer_requestNoticesBulletinsForAllSections___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "sectionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendObserver:noticesBulletinsForSectionID:", v3, v4);

}

- (void)_sendObserver:(id)a3 noticesBulletinsForSectionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    -[BBServer noticesBulletinIDsForSectionID:](self, "noticesBulletinIDsForSectionID:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[BBBulletinAddUpdate updateWithBulletin:feeds:shouldPlayLightsAndSirens:](BBBulletinAddUpdate, "updateWithBulletin:feeds:shouldPlayLightsAndSirens:", v14, 1, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[BBBulletinUpdateTransaction transactionWithBulletinUpdate:transactionID:](BBBulletinUpdateTransaction, "transactionWithBulletinUpdate:transactionID:", v15, objc_msgSend(v6, "incrementedTransactionIDForBulletinID:", v13));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v6, "updateBulletin:withHandler:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), 0);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }

  }
}

- (void)getEffectiveSectionInfoWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Get all effective section infos", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__BBServer_getEffectiveSectionInfoWithHandler___block_invoke;
  v7[3] = &unk_24C563748;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4)
    v4[2](v4, v10[5], 0);
  _Block_object_dispose(&v9, 8);

}

void __47__BBServer_getEffectiveSectionInfoWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArray:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
    v8 = 134217984;
    v9 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld effective section infos", (uint8_t *)&v8, 0xCu);

  }
}

- (void)getSectionInfoForActiveSectionsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *queue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__BBServer_getSectionInfoForActiveSectionsWithHandler___block_invoke;
  v6[3] = &unk_24C563748;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  if (v4)
    v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);

}

void __55__BBServer_getSectionInfoForActiveSectionsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArrayForActiveSections:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getActiveSectionIDsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint8_t v16[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "BBServer: Servicing XPC request for activeSectionIDs", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v11 = buf;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__BBServer_getActiveSectionIDsWithHandler___block_invoke;
  v9[3] = &unk_24C563748;
  v9[4] = self;
  v9[5] = buf;
  dispatch_sync(queue, v9);
  if (v4)
  {
    v7 = (id)BBLogGeneral;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*((id *)v11 + 5), "count");
      *(_DWORD *)v16 = 134217984;
      v17 = v8;
      _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "BBServer: XPC request handler for activeSectionIDs count: %lu", v16, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *((_QWORD *)v11 + 5), 0);
  }
  _Block_object_dispose(buf, 8);

}

void __43__BBServer_getActiveSectionIDsWithHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 224));
}

- (void)getSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBServer_getSectionInfoForSectionIDs_withHandler___block_invoke;
  block[3] = &unk_24C5631B8;
  v12 = &v13;
  block[4] = self;
  v9 = v6;
  v11 = v9;
  dispatch_sync(queue, block);
  if (v7)
    v7[2](v7, v14[5]);

  _Block_object_dispose(&v13, 8);
}

void __52__BBServer_getSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArrayForSectionIDs:effective:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getEffectiveSectionInfoForSectionIDs:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__BBServer_getEffectiveSectionInfoForSectionIDs_withHandler___block_invoke;
  v11[3] = &unk_24C563770;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  dispatch_sync(queue, v11);
  if (v9)
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v16[5]);

  _Block_object_dispose(&v15, 8);
}

void __61__BBServer_getEffectiveSectionInfoForSectionIDs_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionInfoArrayForSectionIDs:effective:", *(_QWORD *)(a1 + 40), 1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (void)getSectionIDsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[16];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v5 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Get all section IDs", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__BBServer_getSectionIDsWithHandler___block_invoke;
  v7[3] = &unk_24C563748;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(queue, v7);
  if (v4)
    v4[2](v4, v10[5], 0);
  _Block_object_dispose(&v9, 8);

}

void __37__BBServer_getSectionIDsWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_allSectionInfoIDs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (void *)BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
    v8 = 134217984;
    v9 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "Got %ld section IDs", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_updateAllSectionInfos
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[BBSectionInfoStoreInterface allSortedSectionInfo:](self->_sectionInfoStore, "allSortedSectionInfo:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x212B94804]();
        -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v8);
        objc_msgSend(v8, "sectionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBServer _updateAllBulletinsForDataProviderIfSectionIsEnabled:](self, "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v11);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_updateGlobalSettings
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  BBGlobalSettings *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BBGlobalSettings *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = [BBGlobalSettings alloc];
  v3 = -[BBServer _effectiveGlobalContentPreviewsSetting](self, "_effectiveGlobalContentPreviewsSetting");
  v4 = -[BBServer _effectiveGlobalAnnounceSetting](self, "_effectiveGlobalAnnounceSetting");
  v5 = -[BBServer _effectiveGlobalAnnounceHeadphonesSetting](self, "_effectiveGlobalAnnounceHeadphonesSetting");
  v6 = -[BBServer _effectiveGlobalAnnounceCarPlaySetting](self, "_effectiveGlobalAnnounceCarPlaySetting");
  v7 = -[BBServer _effectiveGlobalScheduledDeliverySetting](self, "_effectiveGlobalScheduledDeliverySetting");
  -[BBServer _effectiveGlobalScheduledDeliveryTimes](self, "_effectiveGlobalScheduledDeliveryTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BBGlobalSettings initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:](v15, "initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:", v3, v4, v5, v6, v7, v8, -[BBServer _effectiveGlobalScheduledDeliveryShowNextSummarySetting](self, "_effectiveGlobalScheduledDeliveryShowNextSummarySetting"), -[BBServer _effectiveGlobalNotificationListDisplayStyleSetting](self, "_effectiveGlobalNotificationListDisplayStyleSetting"), -[BBServer _effectiveGlobalSummarizationSetting](self, "_effectiveGlobalSummarizationSetting"), -[BBServer _effectiveGlobalHighlightsSetting](self, "_effectiveGlobalHighlightsSetting"));

  -[BBMaskedSet objectAtIndex:](self->_observerFeedSet, "objectAtIndex:", 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "updateGlobalSettings:", v9);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)_biometricResourceStateChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[BBServer _globalContentPreviewsSetting](self, "_globalContentPreviewsSetting"))
  {
    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
    -[BBServer _updateAllSectionInfos](self, "_updateAllSectionInfos");
  }
}

- (void)_setGlobalSummarizationSetting:(int64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalSummarizationSetting:", a3);

    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
  }
}

- (int64_t)_globalSummarizationSetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalSummarizationSetting");

  return v3;
}

- (int64_t)_effectiveGlobalSummarizationSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -1;
  if (-[BBServer _globalSummarizationSetting](self, "_globalSummarizationSetting"))
    return -[BBServer _globalSummarizationSetting](self, "_globalSummarizationSetting");
  return -[BBServer _defaultGlobalSummarizationSetting](self, "_defaultGlobalSummarizationSetting");
}

- (int64_t)_defaultGlobalSummarizationSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer isGreyMatterEligble](self, "isGreyMatterEligble"))
    return 2;
  else
    return -1;
}

- (void)_setGlobalHighlightsSetting:(int64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalHighlightsSetting:", a3);

    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
  }
}

- (int64_t)_globalHighlightsSetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalHighlightsSetting");

  return v3;
}

- (int64_t)_effectiveGlobalHighlightsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -1;
  if (-[BBServer _globalHighlightsSetting](self, "_globalHighlightsSetting"))
    return -[BBServer _globalHighlightsSetting](self, "_globalHighlightsSetting");
  return -[BBServer _defaultGlobalHighlightsSetting](self, "_defaultGlobalHighlightsSetting");
}

- (int64_t)_defaultGlobalHighlightsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer isGreyMatterEligble](self, "isGreyMatterEligble"))
    return 2;
  else
    return -1;
}

- (BOOL)isGreyMatterEligble
{
  int domain_answer;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v3 = domain_answer;
    v4 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR))
      -[BBServer isGreyMatterEligble].cold.1(v3, v4);
  }
  else
  {
    v5 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v8 = 0;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "[BBServer: greyMatterEligible=%{BOOL}d", buf, 8u);
    }
  }
  return 0;
}

- (void)_setGlobalContentPreviewsSetting:(int64_t)a3
{
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalContentPreviewsSetting:](self->_persistentStore, "setGlobalContentPreviewsSetting:", a3);
  }
  else
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalContentPreviewSetting:", a3);

  }
}

- (void)getEffectiveGlobalContentPreviewsSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalContentPreviewsSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __64__BBServer_getEffectiveGlobalContentPreviewsSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "_effectiveGlobalContentPreviewsSetting"), 0);
  return result;
}

- (void)setEffectiveGlobalContentPreviewsSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalContentPreviewsSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __65__BBServer_setEffectiveGlobalContentPreviewsSetting_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t result;
  uint8_t v8[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_globalContentPreviewsSetting");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2 != v3)
  {
    v4 = *(void **)(a1 + 32);
    if (v3 == objc_msgSend(v4, "_defaultGlobalContentPreviewSetting"))
      v5 = 0;
    else
      v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "_setGlobalContentPreviewsSetting:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_updateGlobalSettings");
    objc_msgSend(*(id *)(a1 + 32), "_updateAllSectionInfos");
  }
  v6 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalContentPreviewsSetting", v8, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)eligibleAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[6];
  char v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBServer_eligibleAnnouncementRequestTypesChanged_onPlatform___block_invoke;
  block[3] = &unk_24C5637C0;
  v6 = a3 & 1;
  block[4] = self;
  block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __63__BBServer_eligibleAnnouncementRequestTypesChanged_onPlatform___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v1 = result;
  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(result + 40);
  if (v2 == 2)
  {
    v5 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(v1 + 48);
      v7 = 67109120;
      v8 = v6;
      _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Changed value of eligible setup for announce for CarPlay: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(v1 + 48));
  }
  else if (v2 == 1)
  {
    v3 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(v1 + 48);
      v7 = 67109120;
      v8 = v4;
      _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Changed value of eligible setup for announce for headphones: %{BOOL}d", (uint8_t *)&v7, 8u);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(v1 + 48));
  }
  return result;
}

- (void)_siriPreferencesDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__BBServer__siriPreferencesDidChange___block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__BBServer__siriPreferencesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSiriPreferences");
}

- (void)_updateSiriPreferences
{
  void *v3;
  int v4;
  int siriEnabled;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 siriAllowedWhenLocked;
  _BOOL4 announceOnHearingAidsEnabled;
  _BOOL4 announceOnHearingAidsSupported;
  _BOOL4 announceOnBuiltInSpeakerEnabled;
  _DWORD v21[2];
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assistantIsEnabled");

  siriEnabled = self->_siriEnabled;
  v6 = siriEnabled != v4;
  if (siriEnabled != v4)
    self->_siriEnabled = v4;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "disableAssistantWhilePasscodeLocked") ^ 1;

  if (self->_siriAllowedWhenLocked != v8)
  {
    self->_siriAllowedWhenLocked = v8;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "announceNotificationsOnHearingAidsEnabled");

  if (self->_announceOnHearingAidsEnabled != v10)
  {
    self->_announceOnHearingAidsEnabled = v10;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "announceNotificationsOnHearingAidsSupported");

  if (self->_announceOnHearingAidsSupported != v12)
  {
    self->_announceOnHearingAidsSupported = v12;
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "announceNotificationsOnBuiltInSpeakerEnabled");

  if (self->_announceOnBuiltInSpeakerEnabled == v14)
  {
    if (!v6)
      return;
  }
  else
  {
    self->_announceOnBuiltInSpeakerEnabled = v14;
  }
  v15 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_siriEnabled;
    siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    v21[0] = 67110144;
    v21[1] = v16;
    v22 = 1024;
    v23 = siriAllowedWhenLocked;
    v24 = 1024;
    v25 = announceOnHearingAidsEnabled;
    v26 = 1024;
    v27 = announceOnHearingAidsSupported;
    v28 = 1024;
    v29 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "Siri preferences did change [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d, Announce on hearing aids enabled: %{BOOL}d, Announce on hearing aids supported: %{BOOL}d, Announce on built in speaker enabled: %{BOOL}d]", (uint8_t *)v21, 0x20u);
  }
  -[BBServer _updateAnnounceSettings](self, "_updateAnnounceSettings");
}

- (void)_pairedVehiclesForCarPlayDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__BBServer__pairedVehiclesForCarPlayDidChange___block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __47__BBServer__pairedVehiclesForCarPlayDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllVehiclesForCarPlay");
}

- (void)_fetchAllVehiclesForCarPlay
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getCRPairedVehicleManagerClass_softClass;
  v12 = getCRPairedVehicleManagerClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getCRPairedVehicleManagerClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getCRPairedVehicleManagerClass_block_invoke;
    v8[3] = &unk_24C563A00;
    v8[4] = &v9;
    __getCRPairedVehicleManagerClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v6 = objc_alloc_init(v5);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke;
  v7[3] = &unk_24C5637E8;
  v7[4] = self;
  objc_msgSend(v6, "fetchAllVehiclesWithCompletion:", v7);

}

void __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a2, "count");
  v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3 != 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Changed value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke_167;
  v7[3] = &unk_24C563320;
  v7[4] = v5;
  v8 = v3 != 0;
  dispatch_async(v6, v7);
}

uint64_t __39__BBServer__fetchAllVehiclesForCarPlay__block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPairedVehiclesForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_updateAnnounceControlCenterModuleAvailability
{
  int64_t v2;
  CFPropertyListRef *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = -[BBServer _effectiveGlobalAnnounceSetting](self, "_effectiveGlobalAnnounceSetting");
  if ((v2 == 2) == (CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.siri.SpokenNotificationsModule"), 0) == 0))
  {
    v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
    if (v2 != 2)
      v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
    CFPreferencesSetAppValue(CFSTR("SBIconVisibility"), *v3, CFSTR("com.apple.siri.SpokenNotificationsModule"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
  }
}

- (void)_saveGlobalAnnounceSettingEnabledEvent
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  Class (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v2 = (void *)get_DKEventStreamClass_softClass;
  v27 = get_DKEventStreamClass_softClass;
  if (!get_DKEventStreamClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __get_DKEventStreamClass_block_invoke;
    v22 = &unk_24C563A00;
    v23 = &v24;
    __get_DKEventStreamClass_block_invoke((uint64_t)&v19);
    v2 = (void *)v25[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v3, "eventStreamWithName:", CFSTR("/discoverability/signals"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v5 = (void *)get_DKAnyStringIdentifierClass_softClass;
  v27 = get_DKAnyStringIdentifierClass_softClass;
  if (!get_DKAnyStringIdentifierClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __get_DKAnyStringIdentifierClass_block_invoke;
    v22 = &unk_24C563A00;
    v23 = &v24;
    __get_DKAnyStringIdentifierClass_block_invoke((uint64_t)&v19);
    v5 = (void *)v25[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)get_DKIdentifierClass_softClass;
  v27 = get_DKIdentifierClass_softClass;
  if (!get_DKIdentifierClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __get_DKIdentifierClass_block_invoke;
    v22 = &unk_24C563A00;
    v23 = &v24;
    __get_DKIdentifierClass_block_invoke((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v9, "identifierWithString:type:", CFSTR("com.apple.siri.spoken-notifications.enabled"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v12 = (void *)get_DKEventClass_softClass;
  v27 = get_DKEventClass_softClass;
  if (!get_DKEventClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __get_DKEventClass_block_invoke;
    v22 = &unk_24C563A00;
    v23 = &v24;
    __get_DKEventClass_block_invoke((uint64_t)&v19);
    v12 = (void *)v25[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v13, "eventWithStream:startDate:endDate:value:confidence:metadata:", v4, v11, v11, v10, 0, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v15 = (void *)get_DKKnowledgeStoreClass_softClass;
    v27 = get_DKKnowledgeStoreClass_softClass;
    if (!get_DKKnowledgeStoreClass_softClass)
    {
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __get_DKKnowledgeStoreClass_block_invoke;
      v22 = &unk_24C563A00;
      v23 = &v24;
      __get_DKKnowledgeStoreClass_block_invoke((uint64_t)&v19);
      v15 = (void *)v25[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(v16, "knowledgeStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveObjects:responseQueue:withCompletion:", v18, 0, &__block_literal_global_180);

  }
}

void __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1();
  }
  else if (a2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.siri.spoken-notifications.enabled"), CFSTR("signalIdentifier"));
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v6 = (void *)get_CDContextualKeyPathClass_softClass;
    v20 = get_CDContextualKeyPathClass_softClass;
    if (!get_CDContextualKeyPathClass_softClass)
    {
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __get_CDContextualKeyPathClass_block_invoke;
      v15 = &unk_24C563A00;
      v16 = &v17;
      __get_CDContextualKeyPathClass_block_invoke((uint64_t)&v12);
      v6 = (void *)v18[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v7, "keyPathWithKey:", CFSTR("/discoverability/signals/dataDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v9 = (void *)get_CDClientContextClass_softClass;
    v20 = get_CDClientContextClass_softClass;
    if (!get_CDClientContextClass_softClass)
    {
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __get_CDClientContextClass_block_invoke;
      v15 = &unk_24C563A00;
      v16 = &v17;
      __get_CDClientContextClass_block_invoke((uint64_t)&v12);
      v9 = (void *)v18[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v17, 8);
    objc_msgSend(v10, "userContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, v8);

  }
}

- (void)_updateAnnounceSettings
{
  -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
  -[BBServer _updateAllSectionInfos](self, "_updateAllSectionInfos");
  -[BBServer _updateAnnounceControlCenterModuleAvailability](self, "_updateAnnounceControlCenterModuleAvailability");
}

- (int64_t)_globalAnnounceSetting
{
  void *v3;
  int64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalAnnounceSetting");

  if (v4 == -1)
  {
    -[BBServer _setGlobalAnnounceSetting:](self, "_setGlobalAnnounceSetting:", 0);
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceSetting:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalAnnounceSetting:](self->_persistentStore, "setGlobalAnnounceSetting:", a3);
  }
  else
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "globalAnnounceSetting");

    if (a3 != -1 && v6 != a3)
    {
      +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGlobalAnnounceSetting:", a3);

      -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
      -[BBServer _updateAllSectionInfos](self, "_updateAllSectionInfos");
      -[BBServer _updateAnnounceControlCenterModuleAvailability](self, "_updateAnnounceControlCenterModuleAvailability");
      if (a3 == 2)
        -[BBServer _saveGlobalAnnounceSettingEnabledEvent](self, "_saveGlobalAnnounceSettingEnabledEvent");
    }
  }
}

- (void)getEffectiveGlobalAnnounceSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BBServer_getEffectiveGlobalAnnounceSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __57__BBServer_getEffectiveGlobalAnnounceSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalAnnounceSetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBAnnounceSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BBServer_setEffectiveGlobalAnnounceSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __58__BBServer_setEffectiveGlobalAnnounceSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBAnnounceSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalAnnounceSetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalAnnounceSetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setAnnounceSupportedForHeadphones:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _isAnnounceSupportedForHeadphones](self, "_isAnnounceSupportedForHeadphones") != v3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnounceSupportedForHeadphones:", v3);

    -[BBServer _updateAnnounceSettings](self, "_updateAnnounceSettings");
  }
}

- (int64_t)_globalAnnounceHeadphonesSetting
{
  void *v3;
  int64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalAnnounceHeadphonesSetting");

  if (v4 == -1)
  {
    -[BBServer _setGlobalAnnounceHeadphonesSetting:](self, "_setGlobalAnnounceHeadphonesSetting:", 0);
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalAnnounceHeadphonesSetting:](self->_persistentStore, "setGlobalAnnounceHeadphonesSetting:", a3);
  }
  else
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "globalAnnounceHeadphonesSetting");

    if (a3 != -1 && v6 != a3)
    {
      +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGlobalAnnounceHeadphonesSetting:", a3);

      -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
    }
  }
}

- (int64_t)_effectiveGlobalAnnounceHeadphonesSetting
{
  int64_t result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalAnnounceHeadphonesSetting](self->_persistentStore, "effectiveGlobalAnnounceHeadphonesSetting");
  if (!-[BBServer _isAnnounceSupportedForHeadphones](self, "_isAnnounceSupportedForHeadphones"))
    return -1;
  if (!self->_siriEnabled
    || !self->_siriAllowedWhenLocked
    || -[BBServer _effectiveGlobalAnnounceSetting](self, "_effectiveGlobalAnnounceSetting") != 2)
  {
    return 1;
  }
  result = -[BBServer _globalAnnounceHeadphonesSetting](self, "_globalAnnounceHeadphonesSetting");
  if (!result)
    return 2;
  return result;
}

- (int64_t)_effectiveGlobalAnnounceHearingAidsSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_siriEnabled || !self->_siriAllowedWhenLocked || !self->_announceOnHearingAidsSupported)
    return -1;
  if (self->_announceOnHearingAidsEnabled)
    return 2;
  return 1;
}

- (int64_t)_effectiveGlobalAnnounceBuiltInSpeakerSetting
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_siriEnabled || !self->_siriAllowedWhenLocked)
    return -1;
  if (self->_announceOnBuiltInSpeakerEnabled)
    return 2;
  return 1;
}

- (void)getEffectiveGlobalAnnounceHeadphonesSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__BBServer_getEffectiveGlobalAnnounceHeadphonesSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __67__BBServer_getEffectiveGlobalAnnounceHeadphonesSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalAnnounceHeadphonesSetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBAnnounceSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceHeadphonesSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__BBServer_setEffectiveGlobalAnnounceHeadphonesSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __68__BBServer_setEffectiveGlobalAnnounceHeadphonesSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBAnnounceSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalAnnounceHeadphonesSetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalAnnounceHeadphonesSetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setAnnounceSupportedForCarPlay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _isAnnounceSupportedForCarPlay](self, "_isAnnounceSupportedForCarPlay") != v3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnounceSupportedForCarPlay:", v3);

    -[BBServer _updateAnnounceSettings](self, "_updateAnnounceSettings");
  }
}

- (void)_setPairedVehiclesForCarPlay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _hasPairedVehiclesForCarPlay](self, "_hasPairedVehiclesForCarPlay") != v3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPairedVehiclesForCarPlay:", v3);

    -[BBServer _updateAnnounceSettings](self, "_updateAnnounceSettings");
  }
}

- (int64_t)_globalAnnounceCarPlaySetting
{
  void *v3;
  int64_t v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalAnnounceCarPlaySetting");

  if (v4 == -1)
  {
    -[BBServer _setGlobalAnnounceCarPlaySetting:](self, "_setGlobalAnnounceCarPlaySetting:", 0);
    return 0;
  }
  return v4;
}

- (void)_setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalAnnounceCarPlaySetting:](self->_persistentStore, "setGlobalAnnounceCarPlaySetting:", a3);
  }
  else
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "globalAnnounceCarPlaySetting");

    if (a3 != -1 && v6 != a3)
    {
      +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGlobalAnnounceCarPlaySetting:", a3);

      -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
    }
  }
}

- (int64_t)_effectiveGlobalAnnounceCarPlaySetting
{
  int64_t result;

  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalAnnounceCarPlaySetting](self->_persistentStore, "effectiveGlobalAnnounceCarPlaySetting");
  if (!-[BBServer _isAnnounceSupportedForCarPlay](self, "_isAnnounceSupportedForCarPlay")
    || !-[BBServer _hasPairedVehiclesForCarPlay](self, "_hasPairedVehiclesForCarPlay"))
  {
    return -1;
  }
  if (!self->_siriEnabled
    || !self->_siriAllowedWhenLocked
    || -[BBServer _effectiveGlobalAnnounceSetting](self, "_effectiveGlobalAnnounceSetting") != 2)
  {
    return 1;
  }
  result = -[BBServer _globalAnnounceCarPlaySetting](self, "_globalAnnounceCarPlaySetting");
  if (!result)
    return 3;
  return result;
}

- (void)getEffectiveGlobalAnnounceCarPlaySettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalAnnounceCarPlaySettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __64__BBServer_getEffectiveGlobalAnnounceCarPlaySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalAnnounceCarPlaySetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBAnnounceCarPlaySetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalAnnounceCarPlaySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalAnnounceCarPlaySetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __65__BBServer_setEffectiveGlobalAnnounceCarPlaySetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBAnnounceCarPlaySetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalAnnounceCarPlaySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalAnnounceCarPlaySetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setGlobalScheduledDeliverySetting:(int64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalScheduledDeliverySetting:](self->_persistentStore, "setGlobalScheduledDeliverySetting:", a3);
  }
  else if (-[BBServer _globalScheduledDeliverySetting](self, "_globalScheduledDeliverySetting") != a3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalScheduledDeliverySetting:", a3);

    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
  }
}

- (void)getEffectiveGlobalScheduledDeliverySettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__BBServer_getEffectiveGlobalScheduledDeliverySettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __66__BBServer_getEffectiveGlobalScheduledDeliverySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalScheduledDeliverySetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBScheduledDeliverySetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalScheduledDeliverySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__BBServer_setEffectiveGlobalScheduledDeliverySetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __67__BBServer_setEffectiveGlobalScheduledDeliverySetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBScheduledDeliverySetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliverySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalScheduledDeliverySetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_scheduledDeliveryTimesForEncodedDeliveryTimes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  id v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i < v6; i += 2)
    {
      if (v6 <= i + 1)
        break;
      v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v3, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHour:", objc_msgSend(v9, "integerValue"));

      objc_msgSend(v3, "objectAtIndex:", i + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMinute:", objc_msgSend(v10, "integerValue"));

      objc_msgSend(v4, "addObject:", v8);
    }
  }

  return v4;
}

- (id)_encodedScheduledDeliveryTimesForDeliveryTimes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "hour", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "minute"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_globalScheduledDeliveryTimes
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalScheduledDeliveryTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _scheduledDeliveryTimesForEncodedDeliveryTimes:](self, "_scheduledDeliveryTimesForEncodedDeliveryTimes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setGlobalScheduledDeliveryTimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalScheduledDeliveryTimes:](self->_persistentStore, "setGlobalScheduledDeliveryTimes:", v7);
  }
  else
  {
    -[BBServer _globalScheduledDeliveryTimes](self, "_globalScheduledDeliveryTimes");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 != v7)
    {
      -[BBServer _encodedScheduledDeliveryTimesForDeliveryTimes:](self, "_encodedScheduledDeliveryTimesForDeliveryTimes:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGlobalScheduledDeliveryTimes:", v5);

      -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
    }
  }

}

- (id)_effectiveGlobalScheduledDeliveryTimes
{
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    -[BBPersistentStoreInterface effectiveGlobalScheduledDeliveryTimes](self->_persistentStore, "effectiveGlobalScheduledDeliveryTimes");
  else
    -[BBServer _globalScheduledDeliveryTimes](self, "_globalScheduledDeliveryTimes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getEffectiveGlobalScheduledDeliveryTimesWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__BBServer_getEffectiveGlobalScheduledDeliveryTimesWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__BBServer_getEffectiveGlobalScheduledDeliveryTimesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_effectiveGlobalScheduledDeliveryTimes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)setEffectiveGlobalScheduledDeliveryTimes:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BBServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BBServer_setEffectiveGlobalScheduledDeliveryTimes_withHandler___block_invoke;
  block[3] = &unk_24C563280;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __65__BBServer_setEffectiveGlobalScheduledDeliveryTimes_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20CCB9000, v2, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliveryTimes: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "_setGlobalScheduledDeliveryTimes:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)_globalScheduledDeliveryShowNextSummarySetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalScheduledDeliveryShowNextSummarySetting");

  return v3;
}

- (void)_setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalScheduledDeliveryShowNextSummarySetting:](self->_persistentStore, "setGlobalScheduledDeliveryShowNextSummarySetting:", a3);
  }
  else if (-[BBServer _globalScheduledDeliveryShowNextSummarySetting](self, "_globalScheduledDeliveryShowNextSummarySetting") != a3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalScheduledDeliveryShowNextSummarySetting:", a3);

    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
  }
}

- (int64_t)_effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalScheduledDeliveryShowNextSummarySetting](self->_persistentStore, "effectiveGlobalScheduledDeliveryShowNextSummarySetting");
  if (-[BBServer _globalScheduledDeliveryShowNextSummarySetting](self, "_globalScheduledDeliveryShowNextSummarySetting"))
  {
    return -[BBServer _globalScheduledDeliveryShowNextSummarySetting](self, "_globalScheduledDeliveryShowNextSummarySetting");
  }
  return 1;
}

- (void)getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__BBServer_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __81__BBServer_getEffectiveGlobalScheduledDeliveryShowNextSummarySettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalScheduledDeliveryShowNextSummarySetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBSystemSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__BBServer_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __82__BBServer_setEffectiveGlobalScheduledDeliveryShowNextSummarySetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBSystemSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set setEffectiveGlobalScheduledDeliveryShowNextSummarySetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalScheduledDeliveryShowNextSummarySetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)_globalNotificationListDisplayStyleSetting
{
  void *v2;
  int64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalNotificationListDisplayStyleSetting");

  return v3;
}

- (void)_setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
  {
    -[BBPersistentStoreInterface setGlobalNotificationListDisplayStyleSetting:](self->_persistentStore, "setGlobalNotificationListDisplayStyleSetting:", a3);
  }
  else if (-[BBServer _globalNotificationListDisplayStyleSetting](self, "_globalNotificationListDisplayStyleSetting") != a3)
  {
    +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGlobalNotificationListDisplayStyleSetting:", a3);

    -[BBServer _updateGlobalSettings](self, "_updateGlobalSettings");
    -[BBServer _publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:](self, "_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:", a3);
  }
}

- (int64_t)_effectiveGlobalNotificationListDisplayStyleSetting
{
  if (-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    return -[BBPersistentStoreInterface effectiveGlobalNotificationListDisplayStyleSetting](self->_persistentStore, "effectiveGlobalNotificationListDisplayStyleSetting");
  if (-[BBServer _globalNotificationListDisplayStyleSetting](self, "_globalNotificationListDisplayStyleSetting"))
    return -[BBServer _globalNotificationListDisplayStyleSetting](self, "_globalNotificationListDisplayStyleSetting");
  return 2;
}

- (void)getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__BBServer_getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __77__BBServer_getEffectiveGlobalNotificationListDisplayStyleSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalNotificationListDisplayStyleSetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBNotificationListDisplayStyleSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got effectiveGlobalNotificationListDisplayStyleSetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalNotificationListDisplayStyleSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__BBServer_setEffectiveGlobalNotificationListDisplayStyleSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __78__BBServer_setEffectiveGlobalNotificationListDisplayStyleSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBNotificationListDisplayStyleSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalNotificationListDisplayStyleSetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalNotificationListDisplayStyleSetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getEffectiveGlobalSummarizationSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__BBServer_getEffectiveGlobalSummarizationSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __62__BBServer_getEffectiveGlobalSummarizationSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalSummarizationSetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBSystemSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got getEffectiveGlobalSummarizationSetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalSummarizationSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBServer_setEffectiveGlobalSummarizationSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __63__BBServer_setEffectiveGlobalSummarizationSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBSystemSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalSummarizationSetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalSummarizationSetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)getEffectiveGlobalHighlightsSettingWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__BBServer_getEffectiveGlobalHighlightsSettingWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __59__BBServer_getEffectiveGlobalHighlightsSettingWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "_effectiveGlobalHighlightsSetting");
    v3 = (void *)BBLogConnection;
    if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      BBStringFromBBSystemSetting(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Got getEffectiveGlobalHighlightsSetting: %{public}@", (uint8_t *)&v6, 0xCu);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (void)setEffectiveGlobalHighlightsSetting:(int64_t)a3 withHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BBServer_setEffectiveGlobalHighlightsSetting_withHandler___block_invoke;
  block[3] = &unk_24C563798;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __60__BBServer_setEffectiveGlobalHighlightsSetting_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BBLogConnection;
  if (os_log_type_enabled((os_log_t)BBLogConnection, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = v2;
    BBStringFromBBSystemSetting(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Set effectiveGlobalHighlightsSetting: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setGlobalHighlightsSetting:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_publishBiomeSignalEventForGlobalNotificationListDisplayStyleSettingChangeToSetting:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0CDB0], "discoverabilitySignal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE0CB70]);
  v10 = CFSTR("notificationListDisplayStyleSetting");
  BBStringFromBBNotificationListDisplayStyleSetting(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithIdentifier:bundleID:context:userInfo:", CFSTR("com.apple.SpringBoard.notificationListDisplayStyleSetting.changed"), CFSTR("com.apple.SpringBoard"), CFSTR("NotificationListDisplayStyleSetting"), v8);

  objc_msgSend(v5, "sendEvent:", v9);
}

- (id)universalSectionIDForSectionID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBDataProviderManager universalSectionIDForSectionID:](self->_dataProviderManager, "universalSectionIDForSectionID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectionIDsForUniversalSectionID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBDataProviderManager localSectionIdentifiersFromDismissalSectionIdentifer:](self->_dataProviderManager, "localSectionIdentifiersFromDismissalSectionIdentifer:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getUniversalSectionIDForSectionID:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BBServer *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__BBServer_getUniversalSectionIDForSectionID_withHandler___block_invoke;
  block[3] = &unk_24C563590;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __58__BBServer_getUniversalSectionIDForSectionID_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "universalSectionIDForSectionID:");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48), 0);
    }
  }
}

- (id)bulletinsRequestsForBulletinIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)bulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  id v21;
  id v22;
  id obj;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer bulletinsRequestsForBulletinIDs:](self, "bulletinsRequestsForBulletinIDs:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v6;
    obj = v6;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v11 = v25;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v28 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                objc_msgSend(v16, "publisherMatchID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v10, "isEqualToString:", v17);

                if (v18)
                  objc_msgSend(v8, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v13);
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }

    v7 = v21;
    v6 = v22;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)getBulletinsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer_getBulletinsWithHandler___block_invoke;
  v7[3] = &unk_24C5631E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __36__BBServer_getBulletinsWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)getPublisherMatchIDsOfBulletinsPublishedAfterDate:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__BBServer_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke;
  block[3] = &unk_24C563590;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __74__BBServer_getPublisherMatchIDsOfBulletinsPublishedAfterDate_withHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 120), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v8, "publicationDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "earlierDate:", a1[5]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)a1[5];

          if (v10 == v11)
          {
            objc_msgSend(v8, "sectionID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "sectionID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v14);

            }
            objc_msgSend(v8, "publisherMatchID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v15);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (void)getBulletinsForPublisherMatchIDs:(id)a3 sectionID:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__BBServer_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke;
  v15[3] = &unk_24C563850;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __67__BBServer_getBulletinsForPublisherMatchIDs_sectionID_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "bulletinsForPublisherMatchIDs:sectionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  -[BBServer setSectionInfo:forSectionID:withHandler:](self, "setSectionInfo:forSectionID:withHandler:", a3, a4, 0);
}

- (void)refreshAnnounceSettings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__BBServer_refreshAnnounceSettings__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__BBServer_refreshAnnounceSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAnnounceSettings");
}

- (void)refreshGlobalSettings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BBServer_refreshGlobalSettings__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __33__BBServer_refreshGlobalSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateGlobalSettings");
}

- (void)refreshSectionInfo
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__BBServer_refreshSectionInfo__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__BBServer_refreshSectionInfo__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllSectionInfos");
}

- (void)refreshSectionInfoForID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__BBServer_refreshSectionInfoForID___block_invoke;
  v7[3] = &unk_24C562E50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __36__BBServer_refreshSectionInfoForID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndex:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "sectionInfoForSectionID:effective:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v8++), "updateSectionInfo:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }
  v19 = v4;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "dataProviderIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:effective:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12), 1, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndex:", 9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v22;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v22 != v17)
                  objc_enumerationMutation(v14);
                objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "updateSectionInfo:", v13);
              }
              while (v16 != v18);
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
            }
            while (v16);
          }

        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v10);
  }

}

- (void)sendMessageToDataProviderSectionID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke;
  v15[3] = &unk_24C5636F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "dataProviderForSectionID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "deliverMessageWithName:userInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke_cold_1();
  }

}

- (void)weeAppWithBundleID:(id)a3 setHiddenFromUser:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke;
  block[3] = &unk_24C5632F8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathToWeeAppPluginBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(v2, "hideWeeApp"))
    {
      v4 = BBLogSettings;
      if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = CFSTR("HIDDEN");
        if (!*(_BYTE *)(a1 + 48))
          v6 = CFSTR("NOT HIDDEN");
        v7 = 138543618;
        v8 = v5;
        v9 = 2112;
        v10 = v6;
        _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Changing hidden state for wee app <%{public}@> to: %@", (uint8_t *)&v7, 0x16u);
      }
      objc_msgSend(v2, "setHideWeeApp:", *(unsigned __int8 *)(a1 + 48));
      objc_msgSend(v2, "setSuppressFromSettings:", *(unsigned __int8 *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_setSectionInfo:forSectionID:", v2, *(_QWORD *)(a1 + 40));
    }
  }
  else if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR))
  {
    __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1();
  }

}

- (void)weeAppWithBundleID:(id)a3 getHiddenFromUser:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__BBServer_weeAppWithBundleID_getHiddenFromUser___block_invoke;
  block[3] = &unk_24C563280;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __49__BBServer_weeAppWithBundleID_getHiddenFromUser___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_sectionInfoForSectionID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathToWeeAppPluginBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v2, "hideWeeApp");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_ERROR))
      __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1();
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

}

- (id)_sectionIDsToMigrate
{
  return &unk_24C583560;
}

- (void)_migrateLoadedData
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _sectionIDsToMigrate](self, "_sectionIDsToMigrate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138543362;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = BBLogMigration;
          if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v22 = v9;
            v23 = 2114;
            v24 = v10;
            _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Migrating saved cleared info for \"%{public}@\" to \"%{public}@\", buf, 0x16u);
          }
          -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v22 = v10;
              _os_log_impl(&dword_20CCB9000, v14, OS_LOG_TYPE_DEFAULT, "\t*** Not migrating because cleared info for \"%{public}@\" already exists!", buf, 0xCu);
            }
          }
          else
          {
            -[BBSectionInfoStoreInterface setClearedInfo:forSectionID:](self->_sectionInfoStore, "setClearedInfo:forSectionID:", v11, v10);
          }
          -[BBSectionInfoStoreInterface setClearedInfo:forSectionID:](self->_sectionInfoStore, "setClearedInfo:forSectionID:", 0, v9);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v6);
  }

}

- (void)loadDataProvidersAndSettings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__BBServer_loadDataProvidersAndSettings__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__BBServer_loadDataProvidersAndSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadDataProvidersAndSettings");
}

- (void)_migrateGlobalAnnounceSettingIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "globalAnnounceSetting");

  +[BBBulletinBoardDefaults standardDefaults](BBBulletinBoardDefaults, "standardDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "globalSpokenNotificationSetting_deprecated");

  if (v4)
    v7 = 0;
  else
    v7 = v6 + 1 >= 2;
  if (v7)
  {
    v8 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Migrating announce setting to previously persisted setting with value = %ld", (uint8_t *)&v9, 0xCu);
    }
    -[BBServer _setGlobalAnnounceSetting:](self, "_setGlobalAnnounceSetting:", BBAnnounceSettingForSpokenNotificationSetting(v6));
  }
}

- (void)_loadSystemCapabilities
{
  AFSiriAnnouncementRequestCapabilityManager *v3;
  AFSiriAnnouncementRequestCapabilityManager *announcementCapabilityManagerForHeadphones;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  AFSiriAnnouncementRequestCapabilityManager *v8;
  AFSiriAnnouncementRequestCapabilityManager *v9;
  AFSiriAnnouncementRequestCapabilityManager *announcementCapabilityManagerForCarPlay;
  _BOOL4 v11;
  NSObject *v12;
  AFSiriAnnouncementRequestCapabilityManager *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 siriEnabled;
  _BOOL4 siriAllowedWhenLocked;
  _BOOL4 announceOnHearingAidsEnabled;
  _BOOL4 announceOnHearingAidsSupported;
  _BOOL4 announceOnBuiltInSpeakerEnabled;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = (AFSiriAnnouncementRequestCapabilityManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE092D0]), "initWithPlatform:", 1);
  announcementCapabilityManagerForHeadphones = self->_announcementCapabilityManagerForHeadphones;
  self->_announcementCapabilityManagerForHeadphones = v3;

  v5 = -[BBServer _isAnnounceSupportedForHeadphones](self, "_isAnnounceSupportedForHeadphones");
  v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v5;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Cached value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  v7 = MEMORY[0x24BDAC760];
  v8 = self->_announcementCapabilityManagerForHeadphones;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __35__BBServer__loadSystemCapabilities__block_invoke;
  v30[3] = &unk_24C563878;
  v30[4] = self;
  -[AFSiriAnnouncementRequestCapabilityManager fetchEligibleAnnouncementRequestTypesWithCompletion:](v8, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v30);
  v9 = (AFSiriAnnouncementRequestCapabilityManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE092D0]), "initWithPlatform:", 2);
  announcementCapabilityManagerForCarPlay = self->_announcementCapabilityManagerForCarPlay;
  self->_announcementCapabilityManagerForCarPlay = v9;

  v11 = -[BBServer _isAnnounceSupportedForCarPlay](self, "_isAnnounceSupportedForCarPlay");
  v12 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v11;
    _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Cached value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  v13 = self->_announcementCapabilityManagerForCarPlay;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __35__BBServer__loadSystemCapabilities__block_invoke_215;
  v29[3] = &unk_24C563878;
  v29[4] = self;
  -[AFSiriAnnouncementRequestCapabilityManager fetchEligibleAnnouncementRequestTypesWithCompletion:](v13, "fetchEligibleAnnouncementRequestTypesWithCompletion:", v29);
  v14 = -[BBServer _hasPairedVehiclesForCarPlay](self, "_hasPairedVehiclesForCarPlay");
  v15 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v32 = v14;
    _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "Cached value of vehicles for CarPlay: %{BOOL}d", buf, 8u);
  }
  -[BBServer _fetchAllVehiclesForCarPlay](self, "_fetchAllVehiclesForCarPlay");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__pairedVehiclesForCarPlayDidChange_, CFSTR("CRPairedVehiclesDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_siriEnabled = objc_msgSend(v17, "assistantIsEnabled");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_siriAllowedWhenLocked = objc_msgSend(v18, "disableAssistantWhilePasscodeLocked") ^ 1;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnHearingAidsEnabled = objc_msgSend(v19, "announceNotificationsOnHearingAidsEnabled");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnHearingAidsSupported = objc_msgSend(v20, "announceNotificationsOnHearingAidsSupported");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_announceOnBuiltInSpeakerEnabled = objc_msgSend(v21, "announceNotificationsOnBuiltInSpeakerEnabled");

  v22 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    siriEnabled = self->_siriEnabled;
    siriAllowedWhenLocked = self->_siriAllowedWhenLocked;
    announceOnHearingAidsEnabled = self->_announceOnHearingAidsEnabled;
    announceOnHearingAidsSupported = self->_announceOnHearingAidsSupported;
    announceOnBuiltInSpeakerEnabled = self->_announceOnBuiltInSpeakerEnabled;
    *(_DWORD *)buf = 67110144;
    v32 = siriEnabled;
    v33 = 1024;
    v34 = siriAllowedWhenLocked;
    v35 = 1024;
    v36 = announceOnHearingAidsEnabled;
    v37 = 1024;
    v38 = announceOnHearingAidsSupported;
    v39 = 1024;
    v40 = announceOnBuiltInSpeakerEnabled;
    _os_log_impl(&dword_20CCB9000, v22, OS_LOG_TYPE_DEFAULT, "Siri preferences did load [ Siri enabled: %{BOOL}d, Siri allowed when locked: %{BOOL}d Announce On Hearing Aids Enabled: %{BOOL}d, Announce on Hearing Aids Supported: %{BOOL}d, Announce on Built-In Speaker: %{BOOL}d]", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__siriPreferencesDidChange_, *MEMORY[0x24BE08EB8], 0);

  -[AFSiriAnnouncementRequestCapabilityManager addObserver:](self->_announcementCapabilityManagerForHeadphones, "addObserver:", self);
  -[AFSiriAnnouncementRequestCapabilityManager addObserver:](self->_announcementCapabilityManagerForCarPlay, "addObserver:", self);
}

void __35__BBServer__loadSystemCapabilities__block_invoke(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2 & 1;
  v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Fetched value of eligible setup for announce for headphones: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__BBServer__loadSystemCapabilities__block_invoke_213;
  v7[3] = &unk_24C563320;
  v7[4] = v5;
  v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __35__BBServer__loadSystemCapabilities__block_invoke_213(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnnounceSupportedForHeadphones:", *(unsigned __int8 *)(a1 + 40));
}

void __35__BBServer__loadSystemCapabilities__block_invoke_215(uint64_t a1, char a2)
{
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  char v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2 & 1;
  v4 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = v3;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Fetched value of eligible setup for announce for CarPlay: %{BOOL}d", buf, 8u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__BBServer__loadSystemCapabilities__block_invoke_216;
  v7[3] = &unk_24C563320;
  v7[4] = v5;
  v8 = v3;
  dispatch_async(v6, v7);
}

uint64_t __35__BBServer__loadSystemCapabilities__block_invoke_216(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnnounceSupportedForCarPlay:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_loadDataProvidersAndSettings
{
  int v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer _loadSystemCapabilities](self, "_loadSystemCapabilities");
  -[BBServer _ensureDataDirectoryExists](self, "_ensureDataDirectoryExists");
  +[BBPersistentStoreMigrator migrateSectionInfoForStore:](BBPersistentStoreMigrator, "migrateSectionInfoForStore:", self->_persistentStore);
  -[BBServer _migrateGlobalAnnounceSettingIfNeeded](self, "_migrateGlobalAnnounceSettingIfNeeded");
  v3 = BBShouldPerformMigration();
  -[BBServer _loadSavedSectionInfo](self, "_loadSavedSectionInfo");
  -[BBServer _loadClearedSections](self, "_loadClearedSections");
  if (v3)
  {
    -[BBServer _migrateLoadedData](self, "_migrateLoadedData");
    -[BBDataProviderManager loadAllDataProvidersAndPerformMigration:](self->_dataProviderManager, "loadAllDataProvidersAndPerformMigration:", 1);
    -[BBServer _writeClearedSections](self, "_writeClearedSections");
    BBNoteMigrationComplete();
  }
  else
  {
    -[BBDataProviderManager loadAllDataProvidersAndPerformMigration:](self->_dataProviderManager, "loadAllDataProvidersAndPerformMigration:", 0);
  }
  self->_isRunning = 1;
  v4 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Up and running!", buf, 2u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__BBServer__loadDataProvidersAndSettings__block_invoke;
  v5[3] = &unk_24C562E28;
  v5[4] = self;
  -[BBServer _resumeAllSuspendedConnectionsWithCompletionHandler:](self, "_resumeAllSuspendedConnectionsWithCompletionHandler:", v5);
  -[BBServer _observeManagedProfileChanges](self, "_observeManagedProfileChanges");
  -[BBServer _updateAnnounceControlCenterModuleAvailability](self, "_updateAnnounceControlCenterModuleAvailability");
}

uint64_t __41__BBServer__loadDataProvidersAndSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishBulletinsForAllDataProviders");
}

- (void)_publishBulletinsForAllDataProviders
{
  BBDataProviderManager *dataProviderManager;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dataProviderManager = self->_dataProviderManager;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__BBServer__publishBulletinsForAllDataProviders__block_invoke;
  v4[3] = &unk_24C5638A0;
  v4[4] = self;
  -[BBDataProviderManager performBlockOnDataProviders:](dataProviderManager, "performBlockOnDataProviders:", v4);
}

void __48__BBServer__publishBulletinsForAllDataProviders__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_updateSectionParametersForDataProvider:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v4);

}

- (BOOL)_verifyBulletinRequest:(id)a3 forDataProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  objc_msgSend(v6, "sectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionID:", v7);

  objc_msgSend(v6, "sectionBundlePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionBundlePath:", v8);

  objc_msgSend(v6, "universalSectionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUniversalSectionID:", v9);

  objc_msgSend(v6, "parentSectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentSectionID:", v10);

  objc_msgSend(v5, "setBulletinID:", 0);
  objc_msgSend(v5, "sectionID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_11;
  v12 = (void *)v11;
  objc_msgSend(v5, "publisherMatchID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = 1;
  }
  else
  {
LABEL_11:
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[BBServer _verifyBulletinRequest:forDataProvider:].cold.1();
    v14 = 0;
  }

  return v14;
}

uint64_t __69__BBServer__updateBulletinsInFeed_forDataProvider_enabledSectionIDs___block_invoke_234(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_verifyBulletinRequest:forDataProvider:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_updateAllBulletinsForDataProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBServer _enabledSectionIDsForDataProvider:](self, "_enabledSectionIDsForDataProvider:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer _updateBulletinsInFeed:forDataProvider:enabledSectionIDs:](self, "_updateBulletinsInFeed:forDataProvider:enabledSectionIDs:", 1, v4, v5);

}

- (void)_reloadSectionParametersForSectionID:(id)a3
{
  NSObject *queue;
  id v5;
  BBDataProviderManager *dataProviderManager;
  _QWORD v7[5];

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  dataProviderManager = self->_dataProviderManager;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BBServer__reloadSectionParametersForSectionID___block_invoke;
  v7[3] = &unk_24C5638A0;
  v7[4] = self;
  -[BBDataProviderManager reloadIdentityForSectionID:withCompletion:](dataProviderManager, "reloadIdentityForSectionID:withCompletion:", v5, v7);

}

uint64_t __49__BBServer__reloadSectionParametersForSectionID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSectionParametersForDataProvider:", a2);
}

- (void)_publishBulletinRequest:(id)a3 forSectionID:(id)a4 forDestinations:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (-[BBServer _verifyBulletinRequest:forDataProvider:](self, "_verifyBulletinRequest:forDataProvider:", v8, v10))
      -[BBServer publishBulletinRequest:destinations:](self, "publishBulletinRequest:destinations:", v8, a5);
  }
  else if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[BBServer _publishBulletinRequest:forSectionID:forDestinations:].cold.1();
  }

}

- (unint64_t)_filtersForSectionID:(id)a3
{
  return 0;
}

- (void)_setClearedInfo:(id)a3 forSectionID:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[BBSectionInfoStoreInterface setClearedInfo:forSectionID:](self->_sectionInfoStore, "setClearedInfo:forSectionID:", v8, v7);

  if (!-[BBServer _shouldUseUNSSettings](self, "_shouldUseUNSSettings"))
    -[BBServer _writeClearedSections](self, "_writeClearedSections");
}

- (void)_updateClearedInfoForSectionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[BBServer _clearedInfoForSectionID:](self, "_clearedInfoForSectionID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__BBServer__updateClearedInfoForSectionID_handler___block_invoke;
  v11[3] = &unk_24C563540;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "updateClearedInfoWithClearedInfo:handler:completion:", v8, v7, v11);

}

uint64_t __51__BBServer__updateClearedInfoForSectionID_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveUpdatedClearedInfo:forSectionID:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_saveUpdatedSectionInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[BBServer _setSectionInfo:forSectionID:](self, "_setSectionInfo:forSectionID:", v6, v7);
  }
  else
  {
    v8 = BBLogSettings;
    if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_20CCB9000, v8, OS_LOG_TYPE_DEFAULT, "Not updating section info for <%{public}@>", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_updateSectionInfoForSectionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__BBServer__updateSectionInfoForSectionID_handler___block_invoke;
  v12[3] = &unk_24C563918;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "updateSectionInfoWithSectionInfo:handler:completion:", v9, v7, v12);

}

uint64_t __51__BBServer__updateSectionInfoForSectionID_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveUpdatedSectionInfo:forSectionID:", a2, *(_QWORD *)(a1 + 40));
}

- (id)dpManager:(id)a3 sectionInfoForSectionID:(id)a4
{
  NSObject *queue;
  id v6;
  void *v7;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dpManager:(id)a3 addDataProvider:(id)a4 withSectionInfo:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v11, "parentSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_associateDataProviderSectionInfo:", v7);

  }
  objc_msgSend(v11, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "suppressFromSettings") & 1) == 0)
    objc_msgSend(v7, "queryAndUseManagedSettingsForSectionID:", v10);
  if (-[BBMuteExpirationManager cleanAndWatchExpirationsForSectionInfo:](self->_muteManager, "cleanAndWatchExpirationsForSectionInfo:", v7))
  {
    -[BBServer _writeSectionInfo](self, "_writeSectionInfo");
  }
  -[BBServer _setPrimitiveSectionInfo:forSectionID:](self, "_setPrimitiveSectionInfo:forSectionID:", v7, v10);
  -[BBServer _addActiveSectionID:](self, "_addActiveSectionID:", v10);
  if (-[BBServer isRunning](self, "isRunning"))
  {
    -[BBServer _updateSectionParametersForDataProvider:](self, "_updateSectionParametersForDataProvider:", v11);
    -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v7);
    -[BBServer _updateAllBulletinsForDataProviderIfSectionIsEnabled:](self, "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v11);
  }

}

- (void)dpManager:(id)a3 addParentSectionFactory:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v7, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v7, "sectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryAndUseManagedSettingsForSectionID:", v5);
    if (-[BBMuteExpirationManager cleanAndWatchExpirationsForSectionInfo:](self->_muteManager, "cleanAndWatchExpirationsForSectionInfo:", v6))
    {
      -[BBServer _writeSectionInfo](self, "_writeSectionInfo");
    }
    -[BBServer _setPrimitiveSectionInfo:forSectionID:](self, "_setPrimitiveSectionInfo:forSectionID:", v6, v5);
    -[BBServer _addActiveSectionID:](self, "_addActiveSectionID:", v5);
    if (-[BBServer isRunning](self, "isRunning"))
      -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v6);

  }
}

- (void)dpManager:(id)a3 removeDataProviderSectionID:(id)a4
{
  NSObject *queue;
  id v6;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[BBServer _removeSection:](self, "_removeSection:", v6);

}

- (void)_addActiveSectionID:(id)a3
{
  BBSectionInfoStoreInterface *sectionInfoStore;
  id v5;

  if (a3)
  {
    sectionInfoStore = self->_sectionInfoStore;
    v5 = a3;
    -[BBSectionInfoStoreInterface addActiveSectionID:](sectionInfoStore, "addActiveSectionID:", v5);
    -[NSMutableSet addObject:](self->_activeSectionIDs, "addObject:", v5);

  }
}

- (id)_bulletinsForSectionID:(id)a3 inFeeds:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCEF0];
  v6 = a3;
  objc_msgSend(v5, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer bulletinIDsForSectionID:inFeed:](self, "bulletinIDsForSectionID:inFeed:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v9);

  return v7;
}

+ (id)_dataDirectoryPath
{
  return (id)objc_msgSend(CFSTR("~/Library/BulletinBoard/"), "stringByExpandingTildeInPath");
}

- (void)_ensureDataDirectoryExists
{
  void *v2;
  id v3;

  objc_msgSend((id)objc_opt_class(), "_dataDirectoryPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", v3) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

}

- (id)savedClearedSections
{
  return (id)-[BBPersistentStoreInterface readClearedSections](self->_persistentStore, "readClearedSections");
}

- (void)writeClearedSections:(id)a3
{
  -[BBPersistentStoreInterface writeClearedSections:](self->_persistentStore, "writeClearedSections:", a3);
}

- (void)_loadClearedSections
{
  void *v3;
  id v4;
  id v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer savedClearedSections](self, "savedClearedSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = v5;
  if (!v5)
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = v4;
  -[BBSectionInfoStoreInterface setClearedSectionsByID:](self->_sectionInfoStore, "setClearedSectionsByID:", v4);

}

- (void)_writeClearedSections
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBSectionInfoStoreInterface clearedSectionsByID](self->_sectionInfoStore, "clearedSectionsByID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer writeClearedSections:](self, "writeClearedSections:", v3);

}

- (id)savedOrderDictionary
{
  return (id)-[BBPersistentStoreInterface readSectionOrder](self->_persistentStore, "readSectionOrder");
}

- (void)writeOrderDictionary:(id)a3
{
  -[BBPersistentStoreInterface writeSectionOrder:](self->_persistentStore, "writeSectionOrder:", a3);
}

- (id)savedSectionInfo
{
  void *v2;
  void *v3;

  -[BBPersistentStoreInterface readSectionInfo](self->_persistentStore, "readSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)writeSectionInfo:(id)a3 withVersionNumber:(unint64_t)a4
{
  -[BBPersistentStoreInterface writeSectionInfo:](self->_persistentStore, "writeSectionInfo:", a3, a4);
}

- (void)writeSectionInfo:(id)a3
{
  -[BBPersistentStoreInterface writeSectionInfo:](self->_persistentStore, "writeSectionInfo:", a3);
}

- (void)_loadSavedSectionInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer savedSectionInfo](self, "savedSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSectionInfoStoreInterface setSectionInfoByID:](self->_sectionInfoStore, "setSectionInfoByID:", v3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BBServer _allSectionInfoIDs](self, "_allSectionInfoIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "queryAndUseManagedSettings");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_writeSectionInfo
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBSectionInfoStoreInterface sectionInfoByID](self->_sectionInfoStore, "sectionInfoByID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer writeSectionInfo:](self, "writeSectionInfo:", v3);

}

- (BOOL)_deviceSupportsFavorites
{
  return MGGetBoolAnswer();
}

- (void)_observeManagedProfileChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BBManagedUserNotificationsSetttingsDidChangeHandler, (CFStringRef)*MEMORY[0x24BE63BC0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unobserveManagedProfileChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE63BC0], 0);
}

- (void)_queue_managedUserNotificationsSetttingsDidChange
{
  BBServer *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BBServer *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = BBLogGeneral;
  if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Managed profile was changed", buf, 2u);
  }
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[BBSectionInfoStoreInterface allSortedSectionInfo:](v2->_sectionInfoStore, "allSortedSectionInfo:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v10, "usesManagedSettings"))
        {
          objc_msgSend(v10, "sectionID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v7);
  }

  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "restrictionEnforcedNotificationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    v18 = *MEMORY[0x24BE63E50];
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "objectForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v12, "addObject:", v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v16);
  }

  v21 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v34 = v4;
  objc_msgSend(v21, "unionSet:", v4);
  objc_msgSend(v21, "unionSet:", v12);
  v33 = v21;
  -[BBSectionInfoStoreInterface sectionInfosByIDForSectionIDs:effective:](v2->_sectionInfoStore, "sectionInfosByIDForSectionIDs:effective:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v22, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v26);
        objc_msgSend(v22, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          if ((objc_msgSend(v12, "containsObject:", v27) & 1) != 0
            || (objc_msgSend(v28, "sectionInfoSettings"),
                v29 = v2,
                v30 = (void *)objc_claimAutoreleasedReturnValue(),
                v31 = objc_msgSend(v30, "authorizationStatus"),
                v30,
                v2 = v29,
                v31))
          {
            -[BBServer _setSectionInfoNoteSettingsChanged:forSectionID:](v2, "_setSectionInfoNoteSettingsChanged:forSectionID:", v28, v27);
          }
          else
          {
            -[BBServer _removeSection:](v29, "_removeSection:", v27);
          }
        }

        ++v26;
      }
      while (v24 != v26);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      v24 = v32;
    }
    while (v32);
  }

  -[BBServer _writeSectionInfo](v2, "_writeSectionInfo");
}

- (void)noteChangeOfState:(unint64_t)a3 newValue:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v6;

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__BBServer_noteChangeOfState_newValue___block_invoke;
  block[3] = &unk_24C5637C0;
  v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

uint64_t __39__BBServer_noteChangeOfState_newValue___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(result + 48))
    v3 = *(_QWORD *)(v2 + 24) | v1;
  else
    v3 = *(_QWORD *)(v2 + 24) & ~v1;
  *(_QWORD *)(v2 + 24) = v3;
  return result;
}

- (void)noteOccurrenceOfEvent:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__BBServer_noteOccurrenceOfEvent___block_invoke;
  v4[3] = &unk_24C5630A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __34__BBServer_noteOccurrenceOfEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expireBulletinsDueToSystemEvent:", *(_QWORD *)(a1 + 40));
}

- (void)syncService:(id)a3 receivedDismissalDictionaries:(id)a4 dismissalIDs:(id)a5 inSection:(id)a6 universalSectionID:(id)a7 forFeeds:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bs_safeAddObject:", v15);
  if (v16)
  {
    -[BBServer sectionIDsForUniversalSectionID:](self, "sectionIDsForUniversalSectionID:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v19);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[BBServer handleDismissalDictionaries:dismissalIDs:inSection:forFeeds:](self, "handleDismissalDictionaries:dismissalIDs:inSection:forFeeds:", v13, v14, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), a8, (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

}

- (void)handleDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  id obj;
  BBServer *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v43 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[NSMutableDictionary objectForKey:](self->_bulletinIDsBySectionID, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v35 = v11;
      v36 = a6;
      v37 = v10;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v43);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v41);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v34 = v12;
      obj = v12;
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v44)
      {
        v42 = *(_QWORD *)v57;
        v39 = self;
        v40 = v13;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v57 != v42)
              objc_enumerationMutation(obj);
            v47 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_bulletinsByID, "objectForKey:", v34);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v17 = v43;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            if (!v18)
            {

LABEL_20:
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              v27 = v41;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v49;
                do
                {
                  for (j = 0; j != v29; ++j)
                  {
                    if (*(_QWORD *)v49 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                    if (BBDismissalSyncDictionaryMatchesBulletin(v32, v16))
                    {
                      objc_msgSend(v13, "removeObject:", v32);
                      objc_msgSend(v14, "addObject:", v47);
                    }
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                }
                while (v29);
              }

              goto LABEL_30;
            }
            v19 = v18;
            v45 = i;
            v20 = v14;
            v21 = 0;
            v22 = *(_QWORD *)v53;
            do
            {
              for (k = 0; k != v19; ++k)
              {
                if (*(_QWORD *)v53 != v22)
                  objc_enumerationMutation(v17);
                v24 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
                objc_msgSend(v16, "dismissalID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqualToString:", v24);

                if (v26)
                {
                  objc_msgSend(v20, "addObject:", v47);
                  objc_msgSend(v46, "removeObject:", v24);
                  v21 = 1;
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
            }
            while (v19);

            self = v39;
            v13 = v40;
            v14 = v20;
            i = v45;
            if ((v21 & 1) == 0)
              goto LABEL_20;
LABEL_30:

          }
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v44);
      }

      v10 = v37;
      -[BBDismissalSyncCache cacheDismissalDictionaries:dismissalIDs:inSection:forFeeds:](self->_dismissalSyncCache, "cacheDismissalDictionaries:dismissalIDs:inSection:forFeeds:", v41, v43, v37, v36);
      if (v36 != 65023 && v36)
      {
        -[BBServer _bulletinsForIDs:](self, "_bulletinsForIDs:", v14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBServer _sendRemoveBulletins:toFeeds:shouldSync:](self, "_sendRemoveBulletins:toFeeds:shouldSync:", v33, v36, 0);

      }
      else
      {
        -[BBServer _clearBulletinIDs:forSectionID:shouldSync:](self, "_clearBulletinIDs:forSectionID:shouldSync:", v14, v37, 0, v34);
      }
      v12 = v34;
      v11 = v35;
      objc_msgSend(v14, "count", v34);
      ADClientAddValueForScalarKey();
      if (objc_msgSend(v13, "count") || objc_msgSend(v46, "count"))
        ADClientAddValueForScalarKey();

    }
    else
    {
      -[BBDismissalSyncCache cacheDismissalDictionaries:dismissalIDs:inSection:forFeeds:](self->_dismissalSyncCache, "cacheDismissalDictionaries:dismissalIDs:inSection:forFeeds:", v41, v43, v10, a6);
      ADClientAddValueForScalarKey();
      ADClientAddValueForScalarKey();
    }

  }
  else
  {
    ADClientAddValueForScalarKey();
    ADClientAddValueForScalarKey();
  }

}

- (id)syncService:(id)a3 universalSectionIdentifierForSectionIdentifier:(id)a4
{
  return -[BBServer universalSectionIDForSectionID:](self, "universalSectionIDForSectionID:", a4);
}

- (void)didChangeEffectiveAuthorizationStatusForSectionID:(id)a3
{
  id v4;

  -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v4);

}

- (void)didChangeMuteAssertionForSectionID:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;

  -[BBServer _sectionInfoForSectionID:](self, "_sectionInfoForSectionID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = -[BBMuteExpirationManager cleanAndWatchExpirationsForSectionInfo:](self->_muteManager, "cleanAndWatchExpirationsForSectionInfo:", v4);
    v4 = v6;
    if (v5)
    {
      -[BBServer _writeSectionInfo](self, "_writeSectionInfo");
      -[BBServer _sendUpdateSectionInfo:](self, "_sendUpdateSectionInfo:", v6);
      v4 = v6;
    }
  }

}

+ (unint64_t)pairedDeviceCount
{
  return objc_msgSend((id)__server, "_pairedDeviceCount");
}

- (unint64_t)_pairedDeviceCount
{
  return -[BBSyncServiceInterface pairedDeviceCount](self->_syncService, "pairedDeviceCount");
}

+ (id)savedChronologicalSectionOrder
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_persistentSettingsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readSectionOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("BBSectionOrderChronologicalIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)savedSectionInfo
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_persistentSettingsStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

+ (void)removeSavedChronologicalSectionInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "mutableCopy");
  if (+[BBPersistentStoreMigrator removeSavedChronologicalSectionInfos:](BBPersistentStoreMigrator, "removeSavedChronologicalSectionInfos:"))
  {
    objc_msgSend(a1, "_persistentSettingsStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeSectionInfo:", v5);

  }
}

- (BOOL)hasDestinationForRemoteNotifications
{
  return 1;
}

- (void)protectionStateChangedForBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  BBServer *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__BBServer_protectionStateChangedForBundleIdentifiers___block_invoke;
  v7[3] = &unk_24C562E50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__BBServer_protectionStateChangedForBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "sectionInfoForSectionID:effective:", v7, 1, (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 296), "isApplicationLocked:", v7))
        {
          v9 = v8;
          v10 = 3;
LABEL_10:
          objc_msgSend(v9, "setContentPreviewSetting:", v10);
          objc_msgSend(*(id *)(a1 + 40), "_setSectionInfo:forSectionID:", v8, v7);
          goto LABEL_12;
        }
        if (objc_msgSend(v8, "contentPreviewSetting") == 3)
        {
          v9 = v8;
          v10 = 0;
          goto LABEL_10;
        }
        objc_msgSend(*(id *)(a1 + 40), "_sendUpdateSectionInfo:", v8);
LABEL_12:
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 296), "isApplicationHidden:", v7);
        v12 = *(void **)(a1 + 40);
        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 40), "_clearSection:", v7);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "dataProviderForSectionID:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_updateAllBulletinsForDataProviderIfSectionIsEnabled:", v13);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (id)_appProtectionMonitor
{
  return self->_appProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForCarPlay, 0);
  objc_storeStrong((id *)&self->_announcementCapabilityManagerForHeadphones, 0);
  objc_storeStrong((id *)&self->_appProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_muteManager, 0);
  objc_storeStrong((id *)&self->_sectionAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_dismissalSyncCache, 0);
  objc_storeStrong((id *)&self->_suspendedConnections, 0);
  objc_storeStrong((id *)&self->_settingsListener, 0);
  objc_storeStrong((id *)&self->_conduitListener, 0);
  objc_storeStrong((id *)&self->_observerListener, 0);
  objc_storeStrong((id *)&self->_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoStore, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_expirationReferenceComponents, 0);
  objc_storeStrong((id *)&self->_defaultExpirationComponents, 0);
  objc_storeStrong((id *)&self->_nextScheduledExpirationTimerFireDate, 0);
  objc_storeStrong((id *)&self->_eventBasedExpiringBulletinIDs, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_expiringBulletinIDs, 0);
  objc_storeStrong((id *)&self->_noticeBulletinIDsBySectionID, 0);
  objc_storeStrong((id *)&self->_bulletinIDsBySectionID, 0);
  objc_storeStrong((id *)&self->_bulletinsByID, 0);
  objc_storeStrong((id *)&self->_settingsGatewayConnections, 0);
  objc_storeStrong((id *)&self->_pendingUpdatesByBulletinID, 0);
  objc_storeStrong((id *)&self->_observerGatewayEnumerators, 0);
  objc_storeStrong((id *)&self->_observerGatewaysByName, 0);
  objc_storeStrong((id *)&self->_observerGateways, 0);
  objc_storeStrong((id *)&self->_observerFeedSet, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dataProviderManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sectionInfoByID, 0);
  objc_storeStrong((id *)&self->_bulletinRequestsByID, 0);
}

- (void)noteFinishedWithBulletinID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_bulletinRequestsByID, "removeObjectForKey:", a3);
}

- (void)deliverResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "bulletinID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sectionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer dataProviderForSectionID:](self, "dataProviderForSectionID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "deliverResponse:forBulletinRequest:withCompletion:", v13, v9, v6);
    }
    else
    {
      objc_msgSend(v9, "sectionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("BBServer-deliverResponse: Error: no data provider found for <%@>"), v12);

    }
  }
  else
  {
    NSLog(CFSTR("BBServer-deliverResponse: Error: no bulletin request found for ID <%@>"), v7);
  }

}

- (void)_updateShowsMessagePreviewForBulletin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "sectionID", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _applicableSectionInfosForBulletin:inSection:](self, "_applicableSectionInfosForBulletin:inSection:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v10)
        {
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "subsectionPriority");
          if (v14 <= objc_msgSend(v10, "subsectionPriority"))
            continue;
        }
        v15 = v13;

        v10 = v15;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "contentPreviewSetting"))
    v16 = objc_msgSend(v10, "contentPreviewSetting");
  else
    v16 = -[BBServer _effectiveGlobalContentPreviewsSetting](self, "_effectiveGlobalContentPreviewsSetting");
  objc_msgSend(v4, "setContentPreviewSetting:", v16);

}

- (void)_updateInterruptionLevelForBulletin:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _sectionInfoForSectionID:effective:](self, "_sectionInfoForSectionID:effective:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v8, "interruptionLevel");
  if (v6 != 2)
  {
    v7 = v6;
    if (v6 != 3)
      goto LABEL_8;
    if (objc_msgSend(v5, "criticalAlertSetting") == 2)
    {
      v7 = 3;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v5, "timeSensitiveSetting") == 2)
    v7 = 2;
  else
    v7 = 1;
LABEL_8:
  objc_msgSend(v8, "setInterruptionLevel:", v7);

}

- (void)publishBulletinRequest:(id)a3 destinations:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "bulletinID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[BBServer _assignIDToBulletinRequest:](self, "_assignIDToBulletinRequest:", v6);
  objc_msgSend(v6, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bulletinID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _updateShowsMessagePreviewForBulletin:](self, "_updateShowsMessagePreviewForBulletin:", v6);
  -[BBServer _updateInterruptionLevelForBulletin:](self, "_updateInterruptionLevelForBulletin:", v6);
  -[NSMutableDictionary objectForKey:](self->_bulletinRequestsByID, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _appProtectionMonitor](self, "_appProtectionMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isApplicationHidden:", v8);

  if ((v12 & 1) == 0)
  {
    if (!v10)
    {
      v13 = a4 != 0;
      if ((a4 & 0x4C) == 0)
        goto LABEL_22;
      goto LABEL_19;
    }
    v30 = objc_msgSend(v6, "hasContentModificationsRelativeTo:", v10);
    if ((a4 & 2) != 0)
    {
      -[BBServer noticesBulletinIDsForSectionID:](self, "noticesBulletinIDsForSectionID:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v16, "containsObject:", v9) ^ 1;

      if ((a4 & 0x40) != 0)
        goto LABEL_9;
    }
    else
    {
      v29 = 0;
      if ((a4 & 0x40) != 0)
      {
LABEL_9:
        -[BBServer carBulletinIDsForSectionID:](self, "carBulletinIDsForSectionID:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v9) ^ 1;

        goto LABEL_14;
      }
    }
    v15 = 0;
LABEL_14:
    v17 = v30;
    if ((a4 & 0x4C) != 0)
      v17 = 1;
    v18 = v17 | v29;
    if (a4 == 1)
      v18 = 1;
    v13 = v18 | v15;
    if ((a4 & 0x4C) == 0)
      goto LABEL_20;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastInterruptDate:", v19);

LABEL_23:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPublicationDate:", v21);

    goto LABEL_24;
  }
  v13 = 0;
  if ((a4 & 0x4C) != 0)
    goto LABEL_19;
LABEL_20:
  if (v10)
  {
    objc_msgSend(v10, "lastInterruptDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastInterruptDate:", v20);

  }
LABEL_22:
  if (a4)
    goto LABEL_23;
LABEL_24:
  if ((v13 & 1) != 0 || v10)
  {
    v22 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_bulletinRequestsByID, "setObject:forKey:", v22, v9);

  }
  if (v13)
  {
    -[BBServer _validateExpirationDateForBulletinRequest:](self, "_validateExpirationDateForBulletinRequest:", v6);
    v23 = (void *)BBLogExpiration;
    if (os_log_type_enabled((os_log_t)BBLogExpiration, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v6, "subsectionIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bulletinID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expirationDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v32 = v8;
      v33 = 2112;
      v34 = v25;
      v35 = 2114;
      v36 = v26;
      v37 = 2114;
      v38 = v27;
      v39 = 2048;
      v40 = objc_msgSend(v6, "expirationEvents");
      _os_log_impl(&dword_20CCB9000, v24, OS_LOG_TYPE_DEFAULT, "Publishing bulletin for section <%{public}@>: subsectionIDs: %{%@}@, bulletinID = <%{public}@>, expiration date = <%{public}@>, expiration events <%ld>", buf, 0x34u);

    }
    +[BBBulletin bulletinWithBulletin:](BBBulletin, "bulletinWithBulletin:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBServer publishBulletin:destinations:](self, "publishBulletin:destinations:", v28, a4);

  }
}

uint64_t __67__BBServer_Publication__updateSection_inFeed_withBulletinRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)withdrawBulletinRequestsWithRecordID:(id)a3 forSectionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "recordID", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "isEqualToString:", v15);

        if (v16)
        {
          objc_msgSend(v14, "bulletinID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBServer withdrawBulletinID:shouldSync:](self, "withdrawBulletinID:shouldSync:", v17, 1);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)withdrawBulletinRequestsWithPublisherBulletinID:(id)a3 shouldSync:(BOOL)a4 forSectionID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "publisherBulletinID", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v8, "isEqualToString:", v17);

        if (v18)
        {
          objc_msgSend(v16, "bulletinID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[BBServer withdrawBulletinID:shouldSync:](self, "withdrawBulletinID:shouldSync:", v19, v6);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

}

- (void)_assignIDToBulletinRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "sectionID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BBServer allBulletinIDsForSectionID:](self, "allBulletinIDsForSectionID:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBServer _bulletinRequestsForIDs:](self, "_bulletinRequestsForIDs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBServer _assignIDToBulletinRequest:checkAgainstBulletins:](self, "_assignIDToBulletinRequest:checkAgainstBulletins:", v4, v6);
}

- (void)_assignIDToBulletinRequest:(id)a3 checkAgainstBulletins:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  BBServer *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "publisherMatchID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v18 = self;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "publisherMatchID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "isEqualToString:", v15);

          if (v16)
          {
            objc_msgSend(v14, "bulletinID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setBulletinID:", v17);

            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }

    self = v18;
  }
  objc_msgSend(v6, "generateNewBulletinID");
  ++self->_globalCounter;
  objc_msgSend(v6, "setCounter:");
LABEL_13:

}

- (void)initWithQueue:dataProviderManager:syncService:dismissalSyncCache:observerListener:conduitListener:settingsListener:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BulletinBoard: IONotificationPortGetRunLoopSource returned a NULL run loop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer: Canceling incoming observer connection because it lacks observer entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer: Canceling incoming conduit connection because it lacks conduit entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer: Canceling incoming settings connection because it lacks settings entitlement.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_feedsForBulletin:destinations:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_20CCB9000, v0, v1, "BBServer: Could not find section info for <%@>. Ignoring bulletin: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_feedsForBulletin:destinations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBServer: Ignoring bulletin published with subsections that do not exist: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleTimerForDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Request to schedule BBServer timer for unexpectedly early date <%@>. This is evidence of a logic error - please file a SpringBoard bug.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer-handleResponse: Error: empty response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer-handleResponse: Error: response lacks bulletinID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer-handleResponse: Error: openURL: failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_157_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBServer-handleResponse: failed: openApplicationWithBundleIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51__BBServer_observer_handleResponse_withCompletion___block_invoke_2_160_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20CCB9000, v0, v1, "BBServer-handleResponse: failed: deliverResponse:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isGreyMatterEligble
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20CCB9000, a2, OS_LOG_TYPE_ERROR, "Failed to determine availability with status code: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

void __50__BBServer__saveGlobalAnnounceSettingEnabledEvent__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Error saving spoken notification setting chagne to Duet: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__BBServer_sendMessageToDataProviderSectionID_name_userInfo___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20CCB9000, v0, v1, "BBServer: unable to deliver message \"%@\" because no data provider exists for section \"%@\");
  OUTLINED_FUNCTION_2();
}

void __49__BBServer_weeAppWithBundleID_setHiddenFromUser___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBServer: no wee app found for <%{public}@>", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyBulletinRequest:forDataProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "Bulletin request failed verification. Possible problems: request is not kind of class BBBulletinRequest, data provider returns nil for -sectionIdentifier, or publisherBulletinID and recordID are both nil.\n Failed bulletin: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateBulletinsInFeed:forDataProvider:enabledSectionIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_20CCB9000, v0, v1, "BBServer: sectionID for dataProvider (%@) is nil, so we cannot update bulletins", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateBulletinsInFeed:(void *)a1 forDataProvider:(void *)a2 enabledSectionIDs:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "_sectionInfoForSectionID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_ERROR, "BBServer: enabledSectionIDs is empty: %{public}@", v7, 0xCu);

}

- (void)_publishBulletinRequest:forSectionID:forDestinations:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_20CCB9000, v0, v1, "BBServer: No data provider found for section <%@>. Ignoring bulletin: %@");
  OUTLINED_FUNCTION_2();
}

@end
