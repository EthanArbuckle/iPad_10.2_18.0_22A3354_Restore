@implementation BBSectionInfoStore

- (id)sortedSectionInfoForSectionIDs:(id)a3 effective:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoStore _sortSectionIDs:usingGuideArray:](self, "_sortSectionIDs:usingGuideArray:", v10, self->_sortedSectionIDs);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[BBSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), v4, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v7, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v7;
}

- (id)allSortedSectionInfo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[BBSectionInfoStore allUnsortedSectionInfoIDs](self, "allUnsortedSectionInfoIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BBSectionInfoStore sortedSectionInfoForSectionIDs:effective:](self, "sortedSectionInfoForSectionIDs:effective:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allUnsortedSectionInfoIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_sectionInfoByID, "allKeys");
}

uint64_t __54__BBSectionInfoStore__sortSectionIDs_usingGuideArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", v5, (_QWORD)v15) & 1) != 0)
          {
            v7 = -1;
            goto LABEL_16;
          }
          if ((objc_msgSend(v13, "isEqual:", v6) & 1) != 0)
          {
            v7 = 1;
            goto LABEL_16;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_16:

  }
  return v7;
}

- (void)setSectionInfo:(id)a3 forSectionID:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_sectionInfoByID, "setObject:forKey:", a3, a4);
}

- (id)sectionInfoByID
{
  return self->_sectionInfoByID;
}

- (void)_sortSectionIDs:(id)a3 usingGuideArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id obj;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v5 != v6)
    {
      if (v7)
      {
        v32 = v6;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v5, "mutableCopy");
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v31 = v5;
        obj = v5;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v37)
        {
          v34 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v54 != v34)
                objc_enumerationMutation(obj);
              v42 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              -[BBSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "dataProviderIDs");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "count"))
              {
                v39 = v11;
                v40 = i;
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = 0u;
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v38 = v12;
                v14 = v12;
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v50;
                  do
                  {
                    for (j = 0; j != v16; ++j)
                    {
                      if (*(_QWORD *)v50 != v17)
                        objc_enumerationMutation(v14);
                      v19 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
                      if (objc_msgSend(v9, "containsObject:", v19))
                      {
                        if ((objc_msgSend(v8, "containsObject:", v19) & 1) == 0)
                          objc_msgSend(v13, "addObject:", v19);
                      }
                      else
                      {
                        v20 = BBLogGeneral;
                        if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          v59 = v19;
                          v60 = 2112;
                          v61 = v42;
                          _os_log_error_impl(&dword_20CCB9000, v20, OS_LOG_TYPE_ERROR, "BBServer: unknown subsection \"%@\" (of \"%@\") cannot be sorted.", buf, 0x16u);
                        }
                      }
                    }
                    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
                  }
                  while (v16);
                }

                if (objc_msgSend(v13, "count"))
                {
                  objc_msgSend(v36, "setObject:forKey:", v13, v42);
                  objc_msgSend(v41, "removeObjectsInArray:", v13);
                }

                v11 = v39;
                i = v40;
                v12 = v38;
              }

            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v37);
        }

        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __54__BBSectionInfoStore__sortSectionIDs_usingGuideArray___block_invoke;
        v47[3] = &unk_24C562C70;
        v48 = v32;
        objc_msgSend(v41, "sortUsingComparator:", v47);
        v21 = v36;
        if (objc_msgSend(v36, "count"))
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v36, "allKeys");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v44;
            do
            {
              for (k = 0; k != v24; ++k)
              {
                if (*(_QWORD *)v44 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
                objc_msgSend(v36, "objectForKey:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v41, "indexOfObject:", v27);
                if (v29 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v29 + 1, objc_msgSend(v28, "count"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "insertObjects:atIndexes:", v28, v30);

                }
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
            }
            while (v24);
          }

          v21 = v36;
        }
        objc_msgSend(obj, "removeAllObjects");
        objc_msgSend(obj, "addObjectsFromArray:", v41);

        v5 = v31;
        v6 = v32;
      }
    }
  }

}

- (id)clearedInfoForSectionID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_clearedSectionsByID, "objectForKey:", a3);
}

- (id)sectionInfoForSectionID:(id)a3 effective:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;

  v4 = a4;
  -[NSMutableDictionary objectForKey:](self->_sectionInfoByID, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[BBSectionInfoStore effectiveSectionInfoForSectionInfo:](self, "effectiveSectionInfoForSectionInfo:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)effectiveSectionInfoForSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "factorySectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    objc_msgSend(v5, "factorySectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionInfoStore sectionInfoForSectionID:effective:](self, "sectionInfoForSectionID:effective:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_msgSend(v5, "effectiveSectionInfoWithFactoryInfo:defaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", v8, -[BBEffectiveSettingsProvider effectiveGlobalContentPreviewSetting](self->_effectiveSettings, "effectiveGlobalContentPreviewSetting"), -[BBEffectiveSettingsProvider effectiveGlobalAnnounceSetting](self->_effectiveSettings, "effectiveGlobalAnnounceSetting"), -[BBEffectiveSettingsProvider effectiveGlobalScheduledDeliverySetting](self->_effectiveSettings, "effectiveGlobalScheduledDeliverySetting"), -[BBEffectiveSettingsProvider hasPairedVehiclesForCarPlay](self->_effectiveSettings, "hasPairedVehiclesForCarPlay"), -[BBEffectiveSettingsProvider hasDestinationForRemoteNotifications](self->_effectiveSettings, "hasDestinationForRemoteNotifications")),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
LABEL_5:
      objc_msgSend(v5, "effectiveSectionInfoWithDefaultContentPreviewSetting:globalAnnounceSetting:globalScheduledDeliverySetting:hasPairedVehiclesForCarPlay:hasDestinationForRemoteNotifications:", -[BBEffectiveSettingsProvider effectiveGlobalContentPreviewSetting](self->_effectiveSettings, "effectiveGlobalContentPreviewSetting"), -[BBEffectiveSettingsProvider effectiveGlobalAnnounceSetting](self->_effectiveSettings, "effectiveGlobalAnnounceSetting"), -[BBEffectiveSettingsProvider effectiveGlobalScheduledDeliverySetting](self->_effectiveSettings, "effectiveGlobalScheduledDeliverySetting"), -[BBEffectiveSettingsProvider hasPairedVehiclesForCarPlay](self->_effectiveSettings, "hasPairedVehiclesForCarPlay"), -[BBEffectiveSettingsProvider hasDestinationForRemoteNotifications](self->_effectiveSettings, "hasDestinationForRemoteNotifications"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BBSectionInfoStore)initWithEffectiveSettingsProvider:(id)a3 persistence:(id)a4
{
  id v7;
  id v8;
  BBSectionInfoStore *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *sectionInfoByID;
  NSMutableSet *v12;
  NSMutableSet *activeSectionIDs;
  NSMutableArray *v14;
  NSMutableArray *sortedSectionIDs;
  NSMutableDictionary *v16;
  NSMutableDictionary *clearedSectionsByID;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BBSectionInfoStore;
  v9 = -[BBSectionInfoStore init](&v19, sel_init);
  if (v9)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sectionInfoByID = v9->_sectionInfoByID;
    v9->_sectionInfoByID = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeSectionIDs = v9->_activeSectionIDs;
    v9->_activeSectionIDs = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sortedSectionIDs = v9->_sortedSectionIDs;
    v9->_sortedSectionIDs = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clearedSectionsByID = v9->_clearedSectionsByID;
    v9->_clearedSectionsByID = v16;

    objc_storeStrong((id *)&v9->_effectiveSettings, a3);
    objc_storeStrong((id *)&v9->_persistence, a4);
  }

  return v9;
}

- (void)removeSectionWithID:(id)a3
{
  NSMutableDictionary *sectionInfoByID;
  id v5;

  sectionInfoByID = self->_sectionInfoByID;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](sectionInfoByID, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_activeSectionIDs, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_sortedSectionIDs, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_clearedSectionsByID, "removeObjectForKey:", v5);

  -[BBPersistentStoreInterface writeSectionInfo:](self->_persistence, "writeSectionInfo:", self->_sectionInfoByID);
  -[BBPersistentStoreInterface writeClearedSections:](self->_persistence, "writeClearedSections:", self->_clearedSectionsByID);
}

- (void)setSectionInfoByID:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *sectionInfoByID;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  sectionInfoByID = self->_sectionInfoByID;
  self->_sectionInfoByID = v4;

}

- (void)addActiveSectionID:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet addObject:](self->_activeSectionIDs, "addObject:", v4);
  if ((-[NSMutableArray containsObject:](self->_sortedSectionIDs, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_sortedSectionIDs, "addObject:", v4);

}

- (id)activeSectionIDs
{
  return self->_activeSectionIDs;
}

- (id)sortedSectionIDs
{
  return self->_sortedSectionIDs;
}

- (id)allSortedActiveSections:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[BBSectionInfoStore activeSectionIDs](self, "activeSectionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSectionInfoStore sortedSectionInfoForSectionIDs:effective:](self, "sortedSectionInfoForSectionIDs:effective:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sectionInfosByIDForSectionIDs:(id)a3 effective:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[BBSectionInfoStore sortedSectionInfoForSectionIDs:effective:](self, "sortedSectionInfoForSectionIDs:effective:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "sectionID", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)setClearedInfo:(id)a3 forSectionID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v9),
        v7,
        (v8 & 1) == 0))
  {
    -[NSMutableDictionary setObject:forKey:](self->_clearedSectionsByID, "setObject:forKey:", v9, v6);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clearedSectionsByID, "removeObjectForKey:", v6);
  }

}

- (id)clearedSectionsByID
{
  return self->_clearedSectionsByID;
}

- (void)setClearedSectionsByID:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *clearedSectionsByID;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  clearedSectionsByID = self->_clearedSectionsByID;
  self->_clearedSectionsByID = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_clearedSectionsByID, 0);
  objc_storeStrong((id *)&self->_sortedSectionIDs, 0);
  objc_storeStrong((id *)&self->_activeSectionIDs, 0);
  objc_storeStrong((id *)&self->_sectionInfoByID, 0);
}

@end
