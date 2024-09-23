@implementation IMBalloonPluginAttributionController

+ (id)sharedInstance
{
  if (qword_1ECF12588 != -1)
    dispatch_once(&qword_1ECF12588, &unk_1E471D4F8);
  return (id)qword_1ECF125E8;
}

- (IMBalloonPluginAttributionController)init
{
  IMBalloonPluginAttributionController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *expiredBundleIDToTimestampMap;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *bundleIDsDisplayingAttribution;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)IMBalloonPluginAttributionController;
  v2 = -[IMBalloonPluginAttributionController init](&v23, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E08];
    sub_1A2045564();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    expiredBundleIDToTimestampMap = v2->_expiredBundleIDToTimestampMap;
    v2->_expiredBundleIDToTimestampMap = (NSMutableDictionary *)v5;

    if (!v2->_expiredBundleIDToTimestampMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v8 = v2->_expiredBundleIDToTimestampMap;
      v2->_expiredBundleIDToTimestampMap = (NSMutableDictionary *)Mutable;

    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIDsDisplayingAttribution = v2->_bundleIDsDisplayingAttribution;
    v2->_bundleIDsDisplayingAttribution = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__handleInstalledPluginsChanged, CFSTR("__kIMBalloonPluginManagerInstalledAppsChangedNotification"), 0);

    -[IMBalloonPluginAttributionController setHasPerformedFirstAppExtensionLoad:](v2, "setHasPerformedFirstAppExtensionLoad:", 0);
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance", 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allPlugins");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[IMBalloonPluginAttributionController setHasPerformedFirstAppExtensionLoad:](v2, "setHasPerformedFirstAppExtensionLoad:", 1);
            goto LABEL_14;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v2;
}

- (void)startExpiryTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", &unk_1E471B8C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if ((v15 & 1) == 0)
        {
          -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v12);

          objc_msgSend(v3, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[IMBalloonPluginAttributionController _expiryTimeout](self, "_expiryTimeout");
    v17 = v3;
    im_dispatch_after();

  }
}

- (void)didShowAttributionForBundleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0D375D0];
    v9 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsString:", v8))
        {
          -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v9, v11);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (BOOL)shouldShowAttributionForBundleID:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D37600]) & 1) != 0
    || (objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375E8]) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375A8]) & 1) != 0
    || (objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D374D0]) & 1) != 0
    || (objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D37560]) & 1) != 0
    || (IMIsRunningInUnitTesting() & 1) == 0
    && !-[IMBalloonPluginAttributionController hasPerformedFirstAppExtensionLoad](self, "hasPerformedFirstAppExtensionLoad"))
  {
    v5 = 0;
    goto LABEL_14;
  }
  -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_3:
    v5 = 1;
  }
  else
  {
    +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonPluginForBundleID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v4);

    if ((v11 & 1) != 0 || !objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D375D0]))
    {
      v5 = 0;
    }
    else
    {
      -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13 == 0;

    }
  }
LABEL_14:

  return v5;
}

- (id)_currentTimestamp
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (double)_expiryTimeout
{
  return 30.0;
}

- (void)_saveToFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A2045564();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeToFile:atomically:", v3, 1);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CB2AD8];
  v9[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A2045564();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v5, v6, &v7);

}

- (void)_purgeLeastRecentlySeenAppBundleIDsIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") - 100;

  if (v4 >= 1)
  {
    -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A2045FA8;
    v12[3] = &unk_1E471EAE8;
    v12[4] = self;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectForKey:", v9);

      -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v9);

    }
  }
}

- (void)_handleInstalledPluginsChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_1E471DCF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IMBalloonPluginAttributionController hasPerformedFirstAppExtensionLoad](self, "hasPerformedFirstAppExtensionLoad");
  if (!v8)
  {
    if (!objc_msgSend(v7, "count"))
      goto LABEL_19;
    -[IMBalloonPluginAttributionController setHasPerformedFirstAppExtensionLoad:](self, "setHasPerformedFirstAppExtensionLoad:", 1);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v11)
  {

    if (v8)
      goto LABEL_19;
    goto LABEL_18;
  }
  v12 = v11;
  v22 = 0;
  v13 = !v8;
  v14 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
      if (objc_msgSend(v7, "containsObject:", v16))
      {
        -[IMBalloonPluginAttributionController expiredBundleIDToTimestampMap](self, "expiredBundleIDToTimestampMap");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v16);

        v22 = 1;
      }
      -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[IMBalloonPluginAttributionController bundleIDsDisplayingAttribution](self, "bundleIDsDisplayingAttribution");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v16);

        v13 = 1;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v12);

  if ((v22 & 1) != 0)
    -[IMBalloonPluginAttributionController _saveToFile](self, "_saveToFile");
  if ((v13 & 1) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "__mainThreadPostNotificationName:object:", CFSTR("__kIMBalloonPluginAttributionChangedNotification"), 0);

  }
LABEL_19:

}

- (NSMutableDictionary)expiredBundleIDToTimestampMap
{
  return self->_expiredBundleIDToTimestampMap;
}

- (void)setExpiredBundleIDToTimestampMap:(id)a3
{
  objc_storeStrong((id *)&self->_expiredBundleIDToTimestampMap, a3);
}

- (NSMutableDictionary)bundleIDsDisplayingAttribution
{
  return self->_bundleIDsDisplayingAttribution;
}

- (void)setBundleIDsDisplayingAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDsDisplayingAttribution, a3);
}

- (BOOL)hasPerformedFirstAppExtensionLoad
{
  return self->_hasPerformedFirstAppExtensionLoad;
}

- (void)setHasPerformedFirstAppExtensionLoad:(BOOL)a3
{
  self->_hasPerformedFirstAppExtensionLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDsDisplayingAttribution, 0);
  objc_storeStrong((id *)&self->_expiredBundleIDToTimestampMap, 0);
}

@end
