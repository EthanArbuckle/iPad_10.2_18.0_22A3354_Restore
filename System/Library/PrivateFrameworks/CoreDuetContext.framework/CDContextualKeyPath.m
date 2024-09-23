@implementation CDContextualKeyPath

void __44___CDContextualKeyPath_isMultiDeviceKeyPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];
  _QWORD v29[11];

  v29[9] = *MEMORY[0x1E0C80C00];
  +[_CDUserContextQueries keyPathForUserIsLeavingHomeStatus](_CDUserContextQueries, "keyPathForUserIsLeavingHomeStatus");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  +[_CDUserContextQueries keyPathForUserIsArrivingAtHomeStatus](_CDUserContextQueries, "keyPathForUserIsArrivingAtHomeStatus");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v0;
  +[_CDContextQueries keyPathForAppUsageDataDictionaries](_CDContextQueries, "keyPathForAppUsageDataDictionaries");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v1;
  +[_CDContextQueries keyPathForAppWebUsageDataDictionaries](_CDContextQueries, "keyPathForAppWebUsageDataDictionaries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v2;
  +[_CDContextQueries keyPathForBacklightOnStatus](_CDContextQueries, "keyPathForBacklightOnStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v3;
  +[_CDContextQueries keyPathForWiredConnectionQuality](_CDContextQueries, "keyPathForWiredConnectionQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v4;
  +[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v5;
  +[_CDContextQueries keyPathForCellConnectionQuality](_CDContextQueries, "keyPathForCellConnectionQuality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v6;
  +[_CDContextQueries keyPathForNextAlarm](_CDContextQueries, "keyPathForNextAlarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_variant_has_internal_content())
  {
    +[_CDContextQueries keyPathForAppWebUsageDataDictionaries](_CDContextQueries, "keyPathForAppWebUsageDataDictionaries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    +[_CDContextQueries keyPathForForegroundApp](_CDContextQueries, "keyPathForForegroundApp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v8;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v12);
  +[_CDMDCSContextualPredicate predicates](_CDMDCSContextualPredicate, "predicates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "keyPaths");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }
  v20 = objc_msgSend(v13, "copy");
  v21 = (void *)isMultiDeviceKeyPath_whitelist;
  isMultiDeviceKeyPath_whitelist = v20;

}

@end
