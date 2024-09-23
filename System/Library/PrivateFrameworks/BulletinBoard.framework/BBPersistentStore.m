@implementation BBPersistentStore

- (void)writeSectionInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BBPersistentStore *v28;
  id v29;
  void *v30;
  void *context;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v28 = self;
  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  context = (void *)MEMORY[0x212B94804]();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "suppressFromSettings") & 1) == 0)
        {
          v12 = (void *)MEMORY[0x212B94804]();
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v10);

          objc_autoreleasePoolPop(v12);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  objc_msgSend(v30, "setObject:forKey:", v4, CFSTR("sectionInfo"));
  v14 = (void *)BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v38 = v16;
    _os_log_impl(&dword_20CCB9000, v15, OS_LOG_TYPE_DEFAULT, "Writing section info to persistence. Count %lu", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v17, CFSTR("sectionInfoVersionNumber"));

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v30, 100, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_sectionInfoPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v18, "writeToFile:options:error:", v19, 268435457, &v32);
  v20 = v32;

  if (v20)
  {
    v21 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
      -[BBPersistentStore writeSectionInfo:].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_sectionInfoPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("VersionedSectionInfo.plist"));
}

- (BBPersistentStore)initWithDataDirectoryPath:(id)a3
{
  id v5;
  BBPersistentStore *v6;
  BBPersistentStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBPersistentStore;
  v6 = -[BBPersistentStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataDirectoryPath, a3);

  return v7;
}

- (BBPersistentStore)init
{
  void *v3;
  BBPersistentStore *v4;

  objc_msgSend(CFSTR("~/Library/BulletinBoard/"), "stringByExpandingTildeInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BBPersistentStore initWithDataDirectoryPath:](self, "initWithDataDirectoryPath:", v3);

  return v4;
}

- (id)readClearedSections
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Reading cleared sections from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[BBPersistentStore _clearedSectionsPath](self, "_clearedSectionsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readSectionInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v22;
  void *context;
  id v24;
  uint64_t v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Reading BBSectionInfo from persistence", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x212B94804]();
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[BBPersistentStore _sectionInfoPath](self, "_sectionInfoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("sectionInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v25 = *MEMORY[0x24BDD0E88];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x212B94804]();
        objc_msgSend(v7, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x24BDD1620]);
        v28 = 0;
        v16 = (void *)objc_msgSend(v15, "initForReadingFromData:error:", v14, &v28);
        v17 = v28;
        if (v17)
          goto LABEL_12;
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCMuteAssertion"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCSectionIcon"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCSectionIconVariant"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCSectionInfo"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCSectionInfoSettings"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCSectionMuteAssertion"));
        objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("UNCThreadsMuteAssertion"));
        v18 = objc_opt_class();
        v27 = 0;
        objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", v18, v25, &v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v27;
        if (v19)
          objc_msgSend(v24, "setObject:forKey:", v19, v12);

        if (v17)
        {
LABEL_12:
          v20 = BBLogPersistence;
          if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v34 = v12;
            v35 = 2114;
            v36 = v17;
            _os_log_error_impl(&dword_20CCB9000, v20, OS_LOG_TYPE_ERROR, "Decoding BBSectionInfo for sectionID %{public}@ failed: %{public}@", buf, 0x16u);
          }

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(context);
  return v24;
}

- (id)readSectionInfoLegacy
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Reading legacy SectionInfo from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[BBPersistentStore _sectionInfoLegacyPath](self, "_sectionInfoLegacyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)readSectionOrder
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v3 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Reading section order from persistence", v8, 2u);
  }
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[BBPersistentStore _sectionOrderPath](self, "_sectionOrderPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)writeClearedSections:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Writing cleared sections to persistence", v17, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBPersistentStore _clearedSectionsPath](self, "_clearedSectionsPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "writeToFile:options:error:", v7, 268435457, 0);

  if ((v8 & 1) == 0)
  {
    v9 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
      -[BBPersistentStore writeClearedSections:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)writeSectionOrder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v4 = a3;
  v5 = BBLogPersistence;
  if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Writing section order to persistence", v17, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBPersistentStore _sectionOrderPath](self, "_sectionOrderPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "writeToFile:options:error:", v7, 268435457, 0);

  if ((v8 & 1) == 0)
  {
    v9 = BBLogPersistence;
    if (os_log_type_enabled((os_log_t)BBLogPersistence, OS_LOG_TYPE_ERROR))
      -[BBPersistentStore writeSectionOrder:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (void)deleteSectionInfoFile
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "Deleting section info file due to downgrade failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)deleteSectionInfoLegacyFile
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "Deleting legacy section info file failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (BOOL)hasSectionInfoLegacyFile
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBPersistentStore _sectionInfoLegacyPath](self, "_sectionInfoLegacyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (id)_clearedSectionsPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("ClearedSections.plist"));
}

- (id)_sectionOrderPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("SectionOrder.plist"));
}

- (id)_sectionInfoLegacyPath
{
  return -[NSString stringByAppendingPathComponent:](self->_dataDirectoryPath, "stringByAppendingPathComponent:", CFSTR("SectionInfo.plist"));
}

- (id)readSectionInfoWithVersionNumberForMigration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[BBPersistentStore _sectionInfoPath](self, "_sectionInfoPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)effectiveGlobalAnnounceCarPlaySetting
{
  return 0;
}

- (int64_t)effectiveGlobalAnnounceHeadphonesSetting
{
  return 0;
}

- (int64_t)effectiveGlobalAnnounceSetting
{
  return 0;
}

- (int64_t)effectiveGlobalContentPreviewsSetting
{
  return 0;
}

- (int64_t)effectiveGlobalNotificationListDisplayStyleSetting
{
  return 0;
}

- (int64_t)effectiveGlobalScheduledDeliverySetting
{
  return 0;
}

- (int64_t)effectiveGlobalScheduledDeliveryShowNextSummarySetting
{
  return 0;
}

- (id)effectiveGlobalScheduledDeliveryTimes
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (NSString)dataDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDirectoryPath, 0);
}

- (void)writeClearedSections:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "Error writing cleared sections data.", a5, a6, a7, a8, 0);
}

- (void)writeSectionOrder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "Error writing section order data.", a5, a6, a7, a8, 0);
}

- (void)writeSectionInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "Error writing section info: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
