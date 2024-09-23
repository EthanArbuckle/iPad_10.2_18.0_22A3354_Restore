@implementation BBPersistentStoreMigrator

+ (void)migrateSectionInfoForStore:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  int v45;
  void *v46;
  id v47;
  void *v48;
  id obj;
  id obja;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSectionInfoLegacyFile");
  if (v5)
  {
    v6 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "Migrating from old sectionInfo file to new versionedSectionInfo file.", buf, 2u);
    }
    objc_msgSend(v4, "readSectionInfoLegacy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "readSectionInfoWithVersionNumberForMigration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("sectionInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("sectionInfoVersionNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  objc_msgSend(a1, "_sectionIDsToMigrate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke;
  v60[3] = &unk_24C5646E8;
  v13 = v11;
  v61 = v13;
  v14 = objc_msgSend(v12, "bs_containsObjectPassingTest:", v60);

  if (v8 > 2)
  {
    v15 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "Due to a downgrade we are deleting the versioned section info file. Notification Settings will be corrupt.", buf, 2u);
    }
    objc_msgSend(v4, "deleteSectionInfoFile");
    BBIsInternalDevice();
  }
  if (v8 < 2)
    v16 = 1;
  else
    v16 = v14;
  if (v16 == 1)
  {
    v43 = v14;
    v44 = v8;
    v45 = v5;
    v47 = v13;
    v48 = v4;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v7, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x212B94804]();
          v23 = v7;
          objc_msgSend(v7, "objectForKey:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v24, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v51, "setObject:forKey:", v25, v21);
          }
          else
          {
            v26 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v63 = v21;
              _os_log_error_impl(&dword_20CCB9000, v26, OS_LOG_TYPE_ERROR, "Decoding BBSectionInfo for sectionID %{public}@ failed", buf, 0xCu);
            }
          }

          objc_autoreleasePoolPop(v22);
          ++v20;
          v7 = v23;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v18);
    }

    if (v43)
      objc_msgSend(a1, "_migrateSectionIDs:", v51);
    v13 = v47;
    v4 = v48;
    if (v44 != 1)
    {
      if (v44)
      {
LABEL_46:
        objc_msgSend(v4, "writeSectionInfo:", v51);
        goto LABEL_47;
      }
      objc_msgSend(a1, "_removeVestigialSections:", v51);
      objc_msgSend(a1, "_migrateContentPreviewSettings:", v51);
      if (v45)
        objc_msgSend(v48, "deleteSectionInfoLegacyFile");
    }
    v46 = v7;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v51, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v53;
      do
      {
        v31 = 0;
        obja = (id)v29;
        do
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v31);
          v33 = (void *)MEMORY[0x212B94804]();
          objc_msgSend(v51, "objectForKey:", v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "pushSettings");
          if (objc_msgSend(v34, "alertType"))
            v36 = (8 * (int)v35) & 0x20 | v35;
          else
            v36 = v35 & 0xFFFFFFFFFFFFFFDFLL;
          if (v36 != objc_msgSend(v34, "pushSettings"))
          {
            v37 = (void *)BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              v38 = v37;
              BBPushSettingsDescription(objc_msgSend(v34, "pushSettings"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              BBPushSettingsDescription(v36);
              v40 = v30;
              v41 = v27;
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v63 = v32;
              v64 = 2114;
              v65 = v39;
              v66 = 2114;
              v67 = v42;
              _os_log_impl(&dword_20CCB9000, v38, OS_LOG_TYPE_DEFAULT, "Migrating pushSettings of BBSectionInfo for sectionID: %{public}@ from %{public}@ to %{public}@", buf, 0x20u);

              v27 = v41;
              v30 = v40;
              v29 = (uint64_t)obja;

            }
            objc_msgSend(v34, "setPushSettings:", v36);
          }

          objc_autoreleasePoolPop(v33);
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      }
      while (v29);
    }

    v13 = v47;
    v4 = v48;
    v7 = v46;
    goto LABEL_46;
  }
LABEL_47:

}

BOOL __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __56__BBPersistentStoreMigrator_migrateSectionInfoForStore___block_invoke_16(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("tap-to-radar://new?ComponentID=500088&ComponentName=PEP%20BulletinBoard&ComponentVersion=1.0"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openURL:configuration:completionHandler:", v3, 0, 0);

  }
}

+ (void)_migrateSectionIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_sectionIDsToMigrate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    v26 = v6;
    v27 = v5;
    v25 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      v28 = v8;
      do
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(v5, "objectForKey:", v11, v25, v26, v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v30 = v11;
          v31 = v13;
          v14 = BBLogMigration;
          if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v42 = v30;
            v43 = 2114;
            v44 = v12;
            _os_log_impl(&dword_20CCB9000, v14, OS_LOG_TYPE_DEFAULT, "Migrating saved section info for \"%{public}@\" to \"%{public}@\", buf, 0x16u);
          }
          objc_msgSend(v4, "objectForKey:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = BBLogMigration;
            if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v42 = v12;
              _os_log_impl(&dword_20CCB9000, v16, OS_LOG_TYPE_DEFAULT, "\t*** Not migrating because section info for \"%{public}@\" already exists!", buf, 0xCu);
            }
          }
          else
          {
            v29 = v10;
            objc_msgSend(v31, "setSectionID:", v12);
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(v31, "dataProviderIDs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v33 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                  objc_msgSend(v4, "objectForKey:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    v24 = BBLogMigration;
                    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v42 = v22;
                      _os_log_impl(&dword_20CCB9000, v24, OS_LOG_TYPE_DEFAULT, "\tUpdated data provider \"%{public}@\", buf, 0xCu);
                    }
                    objc_msgSend(v23, "setFactorySectionID:", v12);
                  }

                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v19);
            }

            objc_msgSend(v4, "setObject:forKey:", v31, v12);
            v6 = v26;
            v5 = v27;
            v9 = v25;
            v8 = v28;
            v10 = v29;
          }
          objc_msgSend(v4, "removeObjectForKey:", v30);
          v13 = v31;
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v8);
  }

}

+ (id)_sectionIDsToMigrate
{
  return &unk_24C583588;
}

+ (BOOL)removeSavedChronologicalSectionInfos:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(a1, "_sectionIdentifiersForNonDefaultSectionCategoriesFromSectionInfos:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsForKeys:", v6);

  objc_msgSend(a1, "_sectionIdentifiersForWeeAppsFromSectionInfos:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsForKeys:", v7);

  v8 = objc_msgSend(v4, "count");
  return v8 != v5;
}

+ (id)_sectionIdentifiersForNonDefaultSectionCategoriesFromSectionInfos:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "sectionCategory"))
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_sectionIdentifiersForWeeAppsFromSectionInfos:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "sectionType") == 1)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)_migrateContentPreviewSettings:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138543874;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sectionInfoSettings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "contentPreviewSetting");

        if (v12 == 2)
          v13 = 3;
        else
          v13 = 2 * (v12 == 1);
        objc_msgSend(v10, "sectionInfoSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setContentPreviewSetting:", v13);

        objc_msgSend(v3, "setObject:forKey:", v10, v9);
        v15 = (void *)BBLogMigration;
        if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
        {
          v16 = CFSTR("<unknown>");
          if (v12 <= 2)
            v16 = off_24C564728[v12];
          v17 = v15;
          BBStringFromBBContentPreviewSetting(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v26 = v9;
          v27 = 2114;
          v28 = v16;
          v29 = 2114;
          v30 = v18;
          _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "Migrated content preview setting for sectionId %{public}@. Old: %{public}@ New: %{public}@", buf, 0x20u);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v6);
  }

}

@end
