@implementation NMSyncDefaults

+ (id)sharedDefaults
{
  if (sharedDefaults___onceToken != -1)
    dispatch_once(&sharedDefaults___onceToken, &__block_literal_global_6);
  return (id)sharedDefaults___sharedDefaults;
}

void __32__NMSyncDefaults_sharedDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedDefaults___sharedDefaults;
  sharedDefaults___sharedDefaults = v0;

}

- (NMSyncDefaults)init
{
  NMSyncDefaults *v2;
  void *v3;
  NMSyncDefaults *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSyncDefaults;
  v2 = -[NMSyncDefaults init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__perDeviceSettingsDidResetNotification_, CFSTR("_NMPerDeviceSettingsDidResetNotification"), 0);

    -[NMSyncDefaults _setupNotifiers](v2, "_setupNotifiers");
    -[NMSyncDefaults _reloadPropertiesFromDefaultsOnMainThread](v2, "_reloadPropertiesFromDefaultsOnMainThread");
    v4 = v2;
  }

  return v2;
}

- (void)_reloadPropertiesFromDefaults
{
  void *v3;
  id v4;
  NSNumber *v5;
  NSNumber *assetSyncPlaylistPersistentID;
  NSNumber *v7;
  NSNumber *assetSyncLimit;
  NSNumber *v9;
  NSNumber *lastFullySentAssetSyncPlaylistPersistentID;
  NSNumber *v11;
  NSNumber *lastFullySentAssetSyncPlaylistVersion;
  NSString *v13;
  NSString *pairingID;
  id *p_pairingID;
  void *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *modificationDate;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[NMSyncDefaults _migrateDataIfNecessary](self, "_migrateDataIfNecessary");
  -[NMSyncDefaults _companionSidePerDeviceDefaults](self, "_companionSidePerDeviceDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "synchronize");
  objc_msgSend(v3, "objectForKey:", CFSTR("SyncPlaylistID"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  assetSyncPlaylistPersistentID = self->_assetSyncPlaylistPersistentID;
  self->_assetSyncPlaylistPersistentID = v5;

  self->_assetSyncLimitType = objc_msgSend(v3, "integerForKey:", CFSTR("SyncAmountType"));
  objc_msgSend(v3, "objectForKey:", CFSTR("SyncAmount"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  assetSyncLimit = self->_assetSyncLimit;
  self->_assetSyncLimit = v7;

  self->_assetSyncType = objc_msgSend(v3, "integerForKey:", CFSTR("SyncType"));
  objc_msgSend(v3, "objectForKey:", CFSTR("LastFullSyncPlaylistID"));
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastFullySentAssetSyncPlaylistPersistentID = self->_lastFullySentAssetSyncPlaylistPersistentID;
  self->_lastFullySentAssetSyncPlaylistPersistentID = v9;

  objc_msgSend(v3, "objectForKey:", CFSTR("SyncPlaylistVers"));
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastFullySentAssetSyncPlaylistVersion = self->_lastFullySentAssetSyncPlaylistVersion;
  self->_lastFullySentAssetSyncPlaylistVersion = v11;

  objc_msgSend(v3, "objectForKey:", CFSTR("PairingID"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  p_pairingID = (id *)&self->_pairingID;
  pairingID = self->_pairingID;
  self->_pairingID = v13;

  objc_msgSend(v3, "objectForKey:", CFSTR("ModDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
    v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    modificationDate = self->_modificationDate;
    self->_modificationDate = v19;
  }
  else
  {
    modificationDate = self->_modificationDate;
    self->_modificationDate = 0;
  }

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "getActivePairedDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (*p_pairingID != v24 && (objc_msgSend(*p_pairingID, "isEqual:", v24) & 1) == 0)
  {
    NMLogForCategory(5);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *p_pairingID;
      v27 = 138412546;
      v28 = v26;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_216E27000, v25, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The pairing ID changed from %@ to %@; clearing pairing-specific defaults!",
        (uint8_t *)&v27,
        0x16u);
    }

    objc_storeStrong((id *)&self->_pairingID, v24);
    -[NMSyncDefaults _clearAssetSyncPlaylistDependentDefaults](self, "_clearAssetSyncPlaylistDependentDefaults");
    -[NMSyncDefaults _writePropertiesToDefaults](self, "_writePropertiesToDefaults");
  }

}

- (void)_migrateDataIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD block[5];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  id v115;
  id v116;
  char v117;
  uint8_t buf[16];
  _BYTE v119[128];
  const __CFString *v120;
  _QWORD v121[3];

  v121[1] = *MEMORY[0x24BDAC8D0];
  -[NMSyncDefaults beginBatchUpdates](self, "beginBatchUpdates");
  -[NMSyncDefaults _companionSidePerDeviceDefaults](self, "_companionSidePerDeviceDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SyncDataMigrationRevision"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ModDate"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = v5 == 0;
  else
    v7 = 0;
  v8 = v7;
  v9 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v108 = (void *)v5;
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] [Migration] New install. No migration needed.", buf, 2u);
    }

    v4 = &unk_24D6559E0;
    objc_msgSend(v3, "setObject:forKey:", &unk_24D6559E0, CFSTR("SyncDataMigrationRevision"));
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ModDate"));

    v14 = (id)objc_msgSend(v3, "synchronize");
  }
  else
  {
    if (!v3)
    {
      -[NMSyncDefaults _removeOldMusicRecommendationsInfoIfPossible](self, "_removeOldMusicRecommendationsInfoIfPossible");
      v8 = 0;
      goto LABEL_80;
    }
    v108 = (void *)v5;
  }
  if (!objc_msgSend(v4, "unsignedIntegerValue"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("SyncAssetsEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v3, "integerForKey:", CFSTR("SyncType"));
    if (v15 && (objc_msgSend(v15, "BOOLValue") & 1) != 0 || v16 == 1)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("SyncPlaylistID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    else
    {
      -[NMSyncDefaults _defaultPlaylistPersistentID](self, "_defaultPlaylistPersistentID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "longLongValue") != 0;
    }
    objc_msgSend(v3, "setObject:forKey:", &unk_24D6559F8, CFSTR("SyncDataMigrationRevision"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("SyncType"));

    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("SyncPlaylistID"));
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("ModDate"));

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("SyncAssetsEnabled"));
    v23 = (id)objc_msgSend(v3, "synchronize");

    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 1)
  {
    if (!objc_msgSend(v3, "integerForKey:", CFSTR("SyncType")))
    {
      -[NMSyncDefaults _defaultPlaylistPersistentID](self, "_defaultPlaylistPersistentID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "longLongValue") != 0;
      objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("SyncPlaylistID"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("SyncType"));

    }
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A10, CFSTR("SyncDataMigrationRevision"));
    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    objc_msgSend(v27, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("ModDate"));

    v30 = (id)objc_msgSend(v3, "synchronize");
    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 2)
  {
    v31 = objc_msgSend(v3, "integerForKey:", CFSTR("SyncType"));
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A28, CFSTR("SyncDataMigrationRevision"));
    v32 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceReferenceDate");
    objc_msgSend(v32, "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("ModDate"));

    if (v31 == 1)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("SyncPlaylistID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35
        && (v36 = v35,
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v35, "longLongValue")),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            v36,
            v37))
      {
        v121[0] = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v38, CFSTR("PinnedPlaylists"));

    }
    buf[0] = 0;
    v39 = objc_msgSend(v3, "integerForKey:keyExistsAndHasValidFormat:", CFSTR("SyncAmountType"), buf);
    if (!buf[0])
      v39 = -[NMSyncDefaults assetSyncLimitType](self, "assetSyncLimitType");
    if (v39 == 1)
    {
      v117 = 0;
      v40 = objc_msgSend(v3, "integerForKey:keyExistsAndHasValidFormat:", CFSTR("SyncAmount"), &v117);
      if (v117)
      {
        v41 = v40;
      }
      else
      {
        -[NMSyncDefaults assetSyncLimit](self, "assetSyncLimit");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v42, "unsignedIntegerValue");

      }
      v43 = -[NMSyncDefaults _spaceQuotaForNumberOfSongs:](self, "_spaceQuotaForNumberOfSongs:", v41);
      if (v43 != v41)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("SyncAmount"));

      }
    }
    if (buf[0])
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("SyncAmountType"));
    v45 = (id)objc_msgSend(v3, "synchronize");
    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 3)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A40, CFSTR("SyncDataMigrationRevision"));
    v46 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSinceReferenceDate");
    objc_msgSend(v46, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("ModDate"));

    objc_msgSend(v3, "objectForKey:", CFSTR("MusicRecommendations"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v49, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v50, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = MEMORY[0x24BDAC760];
      v114[1] = 3221225472;
      v114[2] = __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke;
      v114[3] = &unk_24D647B98;
      v115 = v51;
      v116 = v52;
      v53 = v52;
      v54 = v51;
      objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v114);
      objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("StoreMusicRecommendations"));
      objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("StoreMusicRecommendationsToExclude"));

    }
    objc_msgSend(v3, "objectForKey:", CFSTR("PhoneDefaultsCapabilities"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v55, "containsObject:", CFSTR("UsesSplitMusicRecommendations")) & 1) == 0)
    {
      if (v55)
      {
        objc_msgSend(v55, "arrayByAddingObject:", CFSTR("UsesSplitMusicRecommendations"));
      }
      else
      {
        v120 = CFSTR("UsesSplitMusicRecommendations");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("PhoneDefaultsCapabilities"));

    }
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastRecommendationUpdateDate"));
    v57 = (id)objc_msgSend(v3, "synchronize");
    v58 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend(v3, "domain");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("PhoneDefaultsCapabilities"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "synchronizeNanoDomain:keys:", v59, v60);

    v8 = 1;
  }
  -[NMSyncDefaults _removeOldMusicRecommendationsInfoIfPossible](self, "_removeOldMusicRecommendationsInfoIfPossible");
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 5)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A58, CFSTR("SyncDataMigrationRevision"));
    v61 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "timeIntervalSinceReferenceDate");
    objc_msgSend(v61, "numberWithDouble:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("ModDate"));

    objc_msgSend(v3, "objectForKey:", CFSTR("StoreMusicRecommendations"));
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v111;
      while (2)
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v111 != v67)
            objc_enumerationMutation(v64);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "isEqualToString:", CFSTR("HeavyRotation")) & 1) != 0)
          {
            v69 = v64;
            goto LABEL_66;
          }
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
        if (v66)
          continue;
        break;
      }
    }

    v69 = (void *)objc_msgSend(v64, "mutableCopy");
    if (!v69)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v69, "addObject:", NMSRecommendationRecentMusicIdentifier);
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("StoreMusicRecommendations"));
LABEL_66:

    v70 = (id)objc_msgSend(v3, "synchronize");
    v71 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend(v3, "domain");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("StoreMusicRecommendations"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "synchronizeNanoDomain:keys:", v72, v73);

    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 6)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A70, CFSTR("SyncDataMigrationRevision"));
    v74 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "timeIntervalSinceReferenceDate");
    objc_msgSend(v74, "numberWithDouble:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("ModDate"));

    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.Music"));
    v78 = v77;
    if (v77)
    {
      objc_msgSend(v77, "removeObjectForKey:", CFSTR("AllowsCellularDataDownloads"));
      v79 = (id)objc_msgSend(v78, "synchronize");
    }
    v80 = (id)objc_msgSend(v3, "synchronize");

    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 7)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655A88, CFSTR("SyncDataMigrationRevision"));
    v81 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "timeIntervalSinceReferenceDate");
    objc_msgSend(v81, "numberWithDouble:");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("ModDate"));

    v84 = (id)objc_msgSend(v3, "synchronize");
    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 8)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655AA0, CFSTR("SyncDataMigrationRevision"));
    v85 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "timeIntervalSinceReferenceDate");
    objc_msgSend(v85, "numberWithDouble:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("ModDate"));

    -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("WorkoutPlaylist"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedPlaylists"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedAlbums"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("LibraryRecommendationPlaylists"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("LibraryRecommendationAlbums"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B170], "midDataFromPlaylistPID:", v106);
    v107 = v4;
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromPlaylistPIDs:", v105);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromAlbumPIDs:", v88);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromPlaylistPIDs:", v89);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromAlbumPIDs:", v90);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v91, CFSTR("WorkoutPlaylistMID"));
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v92, CFSTR("PinnedPlaylistMIDs"));
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v93, CFSTR("PinnedAlbumMIDs"));
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v94, CFSTR("LibraryRecommendationPlaylistMIDs"));
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v95, CFSTR("LibraryRecommendationAlbumMIDs"));
    -[NMSyncDefaults _addPhoneCapability:](self, "_addPhoneCapability:", CFSTR("UsesMultiverseIdentifiers"));

    v4 = v107;
    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 9)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655AB8, CFSTR("SyncDataMigrationRevision"));
    v96 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "timeIntervalSinceReferenceDate");
    objc_msgSend(v96, "numberWithDouble:");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("ModDate"));

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("AvailableMediaStorageOnWatch"));
    v99 = (id)objc_msgSend(v3, "synchronize");
    v8 = 1;
  }
  if ((unint64_t)objc_msgSend(v4, "unsignedIntegerValue") <= 0xA)
  {
    objc_msgSend(v3, "setObject:forKey:", &unk_24D655AD0, CFSTR("SyncDataMigrationRevision"));
    v100 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "timeIntervalSinceReferenceDate");
    objc_msgSend(v100, "numberWithDouble:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("ModDate"));

    objc_msgSend(v3, "objectForKey:", CFSTR("RecommendationExpirationDate"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("LibraryRecommendationExpirationDate"));

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("RecommendationExpirationDate"));
    v104 = (id)objc_msgSend(v3, "synchronize");
    v8 = 1;
  }
  v6 = v108;
  v9 = MEMORY[0x24BDAC760];
LABEL_80:
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke_231;
  block[3] = &unk_24D646F30;
  block[4] = self;
  if (_migrateDataIfNecessary_onceToken != -1)
  {
    dispatch_once(&_migrateDataIfNecessary_onceToken, block);
    if (!v8)
      goto LABEL_83;
    goto LABEL_82;
  }
  if (v8)
LABEL_82:
    -[NMSNotificationDispatcher scheduleLocalDarwinNotification](self->_settingsNotifier, "scheduleLocalDarwinNotification");
LABEL_83:
  -[NMSyncDefaults endBatchUpdates](self, "endBatchUpdates");

}

void __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("selected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v7, "BOOLValue") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
  else
  {
    v8 = objc_msgSend(v6, "BOOLValue");

    if ((v8 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

- (NSDictionary)musicRecommendationDict
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("StoreMusicRecommendations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("StoreMusicRecommendationsToExclude"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v10 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v8);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v25;
    *(_QWORD *)&v14 = 138412290;
    v23 = v14;
    v17 = MEMORY[0x24BDBD1C0];
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v19, v23, (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          NMLogForCategory(5);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v33 = v19;
            _os_log_impl(&dword_216E27000, v21, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] StoreMusicRecommendations does NOT contain excluded recommendation: %@!", buf, 0xCu);
          }

        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v19);
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v15);
  }

  return (NSDictionary *)v5;
}

- (NSArray)pinnedPlaylists
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedPlaylistMIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B170], "pidsFromMIDDataArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSArray *)v6;
}

- (NSArray)pinnedAlbums
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedAlbumMIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B170], "pidsFromMIDDataArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSArray *)v6;
}

- (NSData)cachedRecommendationsData
{
  return (NSData *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("CachedRecommendationsData"));
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NMSPodcastsDownloadSettings *v12;
  void *v13;
  uint64_t v14;
  NMSPodcastsDownloadSettings *v15;
  void *v16;
  NMSPodcastsDownloadSettings *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD16A8];
  -[NMSyncDefaults musicRecommendationDict](self, "musicRecommendationDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults workoutPlaylistID](self, "workoutPlaylistID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Music Recommendations: %@, Workout Playlist ID: %@"), v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v10;
  objc_msgSend(v6, "appendFormat:", CFSTR(" - Music <%@>"), v10);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [NMSPodcastsDownloadSettings alloc];
  -[NMSyncDefaults objectForKey:](self, "objectForKey:", CFSTR("PodcastsUpNextDownloadSettings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](v12, "initWithCollectionType:dictionary:", 0, v13);

  v31 = (void *)v14;
  objc_msgSend(v11, "appendFormat:", CFSTR("Up Next: %@"), v14);
  v15 = [NMSPodcastsDownloadSettings alloc];
  -[NMSyncDefaults objectForKey:](self, "objectForKey:", CFSTR("PodcastsSavedEpisodesDownloadSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](v15, "initWithCollectionType:dictionary:", 1, v16);

  objc_msgSend(v11, "appendFormat:", CFSTR(", Saved: %@"), v17);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults objectForKey:](self, "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __29__NMSyncDefaults_description__block_invoke;
  v35[3] = &unk_24D6478B0;
  v21 = v18;
  v36 = v21;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v35);

  objc_msgSend(v11, "appendFormat:", CFSTR(", Stations: %@"), v21);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults objectForKey:](self, "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v20;
  v33[1] = 3221225472;
  v33[2] = __29__NMSyncDefaults_description__block_invoke_2;
  v33[3] = &unk_24D6478B0;
  v24 = v22;
  v34 = v24;
  objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v33);

  objc_msgSend(v11, "appendFormat:", CFSTR(", Shows: %@"), v24);
  objc_msgSend(v6, "appendFormat:", CFSTR(" - Podcasts <%@>"), v11);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("Want to Read Enabled: %x"), -[NMSyncDefaults wantToReadEnabled](self, "wantToReadEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSyncDefaults wantToReadEnabled](self, "wantToReadEnabled"))
  {
    -[NMSyncDefaults wantToReadAudiobooks](self, "wantToReadAudiobooks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", CFSTR(", Want to Read Books:%@"), v26);

  }
  objc_msgSend(v25, "appendFormat:", CFSTR(", Reading Now Enabled: %x"), -[NMSyncDefaults readingNowEnabled](self, "readingNowEnabled"));
  if (-[NMSyncDefaults readingNowEnabled](self, "readingNowEnabled"))
  {
    -[NMSyncDefaults readingNowAudiobooks](self, "readingNowAudiobooks");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendFormat:", CFSTR(", Reading Now Books: %@"), v27);

  }
  -[NMSyncDefaults pinnedAudiobooks](self, "pinnedAudiobooks");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendFormat:", CFSTR(", Pinned Books: %@"), v28);

  objc_msgSend(v6, "appendFormat:", CFSTR(" - Books <%@>"), v25);
  v29 = (void *)objc_msgSend(v6, "copy");

  return (NSString *)v29;
}

void __29__NMSyncDefaults_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NMSPodcastsDownloadSettings *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 2, v5);

  if (-[NMSPodcastsDownloadSettings isEnabled](v6, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

}

void __29__NMSyncDefaults_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NMSPodcastsDownloadSettings *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 3, v5);

  if (-[NMSPodcastsDownloadSettings isEnabled](v6, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);

}

- (void)removeObjectforKey:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", 0, a3);
}

- (void)beginBatchUpdates
{
  NSObject *v3;
  uint8_t v4[16];

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Begin batch updates.", v4, 2u);
  }

  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_settingsNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_musicPinningSelectionsNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_recoSelectionsNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_libraryRecoNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_storeRecoNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_podcastsPinningSelectionsNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_audiobooksPinningSelectionsNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_syncStateNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_syncInfoNotifier, "beginWaitingForUpdates");
  -[NMSNotificationDispatcher beginWaitingForUpdates](self->_syncInfoRequestDateNotifier, "beginWaitingForUpdates");
}

- (void)endBatchUpdates
{
  NSObject *v3;
  uint8_t v4[16];

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] End batch updates.", v4, 2u);
  }

  -[NMSNotificationDispatcher endWaitingForUpdates](self->_settingsNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_musicPinningSelectionsNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_recoSelectionsNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_libraryRecoNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_storeRecoNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_podcastsPinningSelectionsNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_audiobooksPinningSelectionsNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_syncStateNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_syncInfoNotifier, "endWaitingForUpdates");
  -[NMSNotificationDispatcher endWaitingForUpdates](self->_syncInfoRequestDateNotifier, "endWaitingForUpdates");
}

- (void)dispatcherDidReceiveNotificationFromRemoteDevice:(id)a3
{
  if (self->_settingsNotifier == a3)
  {
    -[NMSyncDefaults _reloadPropertiesFromDefaultsOnMainThread](self, "_reloadPropertiesFromDefaultsOnMainThread");
    -[NMSyncDefaults _removeOldMusicRecommendationsInfoIfPossible](self, "_removeOldMusicRecommendationsInfoIfPossible");
  }
}

- (void)dispatcherDidReceiveNotificationFromOtherProcess:(id)a3
{
  if (self->_settingsNotifier == a3)
    -[NMSyncDefaults _reloadPropertiesFromDefaultsOnMainThread](self, "_reloadPropertiesFromDefaultsOnMainThread");
}

- (void)_setupNotifiers
{
  NMSNotificationDispatcher *v3;
  NMSNotificationDispatcher *settingsNotifier;
  NMSNotificationDispatcher *v5;
  NMSNotificationDispatcher *musicPinningSelectionsNotifier;
  NMSNotificationDispatcher *v7;
  NMSNotificationDispatcher *recoSelectionsNotifier;
  NMSNotificationDispatcher *v9;
  NMSNotificationDispatcher *libraryRecoNotifier;
  NMSNotificationDispatcher *v11;
  NMSNotificationDispatcher *storeRecoNotifier;
  NMSNotificationDispatcher *v13;
  NMSNotificationDispatcher *podcastsPinningSelectionsNotifier;
  NMSNotificationDispatcher *v15;
  NMSNotificationDispatcher *audiobooksPinningSelectionsNotifier;
  NMSNotificationDispatcher *v17;
  NMSNotificationDispatcher *audiobooksRecommendationsNotifier;
  NMSNotificationDispatcher *v19;
  NMSNotificationDispatcher *syncStateNotifier;
  NMSNotificationDispatcher *v21;
  NMSNotificationDispatcher *syncInfoNotifier;
  NMSNotificationDispatcher *v23;
  NMSNotificationDispatcher *syncInfoRequestDateNotifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSDictionary *v34;
  NSDictionary *notifiersDict;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NMSNotificationDispatcher *v66;
  NMSNotificationDispatcher *v67;
  NMSNotificationDispatcher *v68;
  NMSNotificationDispatcher *v69;
  NMSNotificationDispatcher *v70;
  NMSNotificationDispatcher *v71;
  NMSNotificationDispatcher *v72;
  NMSNotificationDispatcher *v73;
  NMSNotificationDispatcher *v74;
  NMSNotificationDispatcher *v75;
  NMSNotificationDispatcher *v76;
  NMSNotificationDispatcher *v77;
  NMSNotificationDispatcher *v78;
  NMSNotificationDispatcher *v79;
  NMSNotificationDispatcher *v80;
  NMSNotificationDispatcher *v81;
  NMSNotificationDispatcher *v82;
  NMSNotificationDispatcher *v83;
  NMSNotificationDispatcher *v84;
  NMSNotificationDispatcher *v85;
  NMSNotificationDispatcher *v86;
  NMSNotificationDispatcher *v87;
  NMSNotificationDispatcher *v88;
  NMSNotificationDispatcher *v89;
  NMSNotificationDispatcher *v90;
  NMSNotificationDispatcher *v91;
  NMSNotificationDispatcher *v92;
  NMSNotificationDispatcher *v93;
  NMSNotificationDispatcher *v94;
  NMSNotificationDispatcher *v95;
  NMSNotificationDispatcher *v96;
  NMSNotificationDispatcher *v97;
  NMSNotificationDispatcher *v98;
  _QWORD v99[33];
  _QWORD v100[35];

  v100[33] = *MEMORY[0x24BDAC8D0];
  v3 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.settings"));
  settingsNotifier = self->_settingsNotifier;
  self->_settingsNotifier = v3;

  -[NMSNotificationDispatcher setDelegate:](self->_settingsNotifier, "setDelegate:", self);
  v5 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.music-pinning-selections"));
  musicPinningSelectionsNotifier = self->_musicPinningSelectionsNotifier;
  self->_musicPinningSelectionsNotifier = v5;

  v7 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.reco-selections"));
  recoSelectionsNotifier = self->_recoSelectionsNotifier;
  self->_recoSelectionsNotifier = v7;

  v9 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.reco-library"));
  libraryRecoNotifier = self->_libraryRecoNotifier;
  self->_libraryRecoNotifier = v9;

  v11 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.reco-store"));
  storeRecoNotifier = self->_storeRecoNotifier;
  self->_storeRecoNotifier = v11;

  v13 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.podcasts-pinning-selections"));
  podcastsPinningSelectionsNotifier = self->_podcastsPinningSelectionsNotifier;
  self->_podcastsPinningSelectionsNotifier = v13;

  v15 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.audiobooks-pinning-selections"));
  audiobooksPinningSelectionsNotifier = self->_audiobooksPinningSelectionsNotifier;
  self->_audiobooksPinningSelectionsNotifier = v15;

  v17 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.audiobooks-recommendations"));
  audiobooksRecommendationsNotifier = self->_audiobooksRecommendationsNotifier;
  self->_audiobooksRecommendationsNotifier = v17;

  v19 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.sync-state"));
  syncStateNotifier = self->_syncStateNotifier;
  self->_syncStateNotifier = v19;

  v21 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.sync-info"));
  syncInfoNotifier = self->_syncInfoNotifier;
  self->_syncInfoNotifier = v21;

  v23 = -[NMSNotificationDispatcher initWithNotificationName:]([NMSNotificationDispatcher alloc], "initWithNotificationName:", CFSTR("com.apple.nanomusicsync.sync-info-request-date"));
  syncInfoRequestDateNotifier = self->_syncInfoRequestDateNotifier;
  self->_syncInfoRequestDateNotifier = v23;

  -[NMSNotificationDispatcher setDelegate:](self->_syncInfoRequestDateNotifier, "setDelegate:", self);
  v98 = self->_musicPinningSelectionsNotifier;
  v99[0] = CFSTR("PinnedPlaylistMIDs");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v98, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v65;
  v99[1] = CFSTR("WorkoutPlaylistMID");
  v97 = self->_musicPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v64;
  v99[2] = CFSTR("PinnedAlbumMIDs");
  v96 = self->_musicPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v100[2] = v63;
  v99[3] = CFSTR("LibraryRecommendationPlaylistMIDs");
  v95 = self->_libraryRecoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v100[3] = v62;
  v99[4] = CFSTR("LibraryRecommendationAlbumMIDs");
  v94 = self->_libraryRecoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v94, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v100[4] = v61;
  v99[5] = CFSTR("StoreMusicRecommendations");
  v93 = self->_recoSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v93, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v100[5] = v60;
  v99[6] = CFSTR("StoreMusicRecommendationsToExclude");
  v92 = self->_recoSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v100[6] = v59;
  v99[7] = CFSTR("CachedRecommendationsData");
  v91 = self->_storeRecoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v100[7] = v58;
  v99[8] = CFSTR("PodcastsUpNextDownloadSettings");
  v90 = self->_podcastsPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v100[8] = v57;
  v99[9] = CFSTR("PodcastsSavedEpisodesDownloadSettings");
  v89 = self->_podcastsPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v100[9] = v56;
  v99[10] = CFSTR("PodcastsStationDownloadSettings");
  v88 = self->_podcastsPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v100[10] = v55;
  v99[11] = CFSTR("PodcastsShowDownloadSettings");
  v87 = self->_podcastsPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v100[11] = v54;
  v99[12] = CFSTR("PinnedAudiobooks");
  v86 = self->_audiobooksPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v100[12] = v53;
  v99[13] = CFSTR("WantToReadEnabled");
  v85 = self->_audiobooksPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v100[13] = v52;
  v99[14] = CFSTR("WantToReadAudiobooks");
  v84 = self->_audiobooksRecommendationsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v84, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v100[14] = v51;
  v99[15] = CFSTR("ReadingNowEnabled");
  v83 = self->_audiobooksPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100[15] = v50;
  v99[16] = CFSTR("ReadingNowAudiobooks");
  v82 = self->_audiobooksRecommendationsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v82, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v100[16] = v49;
  v99[17] = CFSTR("AudiobookDownloadLimit");
  v81 = self->_audiobooksPinningSelectionsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v81, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v100[17] = v48;
  v99[18] = CFSTR("ClientPinningSettingsToken");
  v80 = self->_syncStateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v100[18] = v47;
  v99[19] = CFSTR("SyncStateDict");
  v79 = self->_syncStateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v100[19] = v46;
  v99[20] = CFSTR("MusicSyncInfo");
  v78 = self->_syncInfoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v100[20] = v45;
  v99[21] = CFSTR("PodcastsSyncInfo");
  v77 = self->_syncInfoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v100[21] = v44;
  v99[22] = CFSTR("AudiobooksSyncInfo");
  v76 = self->_syncInfoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v100[22] = v43;
  v99[23] = CFSTR("DebugSyncInfoEnabled");
  v75 = self->_syncInfoNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v100[23] = v42;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastSyncInfoRequestDate"), CFSTR("com.apple.NanoMusic"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v99[24] = v41;
  v74 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v74, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v100[24] = v40;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastSyncInfoRequestDate"), CFSTR("com.apple.podcasts"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v99[25] = v39;
  v73 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v100[25] = v38;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastSyncInfoRequestDate"), CFSTR("com.apple.NanoBooks"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v99[26] = v37;
  v72 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v100[26] = v36;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastLocalSyncInfoRequestDate"), CFSTR("com.apple.NanoMusic"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v99[27] = v25;
  v71 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v100[27] = v26;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastLocalSyncInfoRequestDate"), CFSTR("com.apple.podcasts"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v99[28] = v27;
  v70 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v100[28] = v28;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", CFSTR("LastLocalSyncInfoRequestDate"), CFSTR("com.apple.NanoBooks"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v99[29] = v29;
  v69 = self->_syncInfoRequestDateNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v100[29] = v30;
  v99[30] = CFSTR("WatchDefaultsCapabilities");
  v68 = self->_settingsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v100[30] = v31;
  v99[31] = CFSTR("PhoneDefaultsCapabilities");
  v67 = self->_settingsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v100[31] = v32;
  v99[32] = CFSTR("UsesSplitMusicRecommendations");
  v66 = self->_settingsNotifier;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v100[32] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 33);
  v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  notifiersDict = self->_notifiersDict;
  self->_notifiersDict = v34;

}

- (BOOL)_phoneHasCapability:(id)a3
{
  return -[NMSyncDefaults _deviceHasCapability:forCapabilitiesKey:](self, "_deviceHasCapability:forCapabilitiesKey:", a3, CFSTR("PhoneDefaultsCapabilities"));
}

- (BOOL)_watchHasCapability:(id)a3
{
  return -[NMSyncDefaults _deviceHasCapability:forCapabilitiesKey:](self, "_deviceHasCapability:forCapabilitiesKey:", a3, CFSTR("WatchDefaultsCapabilities"));
}

- (BOOL)_deviceHasCapability:(id)a3 forCapabilitiesKey:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return (char)self;
}

- (void)_addPhoneCapability:(id)a3
{
  -[NMSyncDefaults _addCapability:forCapabilitiesKey:](self, "_addCapability:forCapabilitiesKey:", a3, CFSTR("PhoneDefaultsCapabilities"));
}

- (void)_addWatchCapability:(id)a3
{
  -[NMSyncDefaults _addCapability:forCapabilitiesKey:](self, "_addCapability:forCapabilitiesKey:", a3, CFSTR("WatchDefaultsCapabilities"));
}

- (void)_addCapability:(id)a3 forCapabilitiesKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "arrayByAddingObject:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v9, v7);

  }
}

- (void)_reloadPropertiesFromDefaultsOnMainThread
{
  void (**v2)(_QWORD);
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__NMSyncDefaults__reloadPropertiesFromDefaultsOnMainThread__block_invoke;
  v3[3] = &unk_24D646F30;
  v3[4] = self;
  v2 = (void (**)(_QWORD))MEMORY[0x219A03B50](v3, a2);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v2[2](v2);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __59__NMSyncDefaults__reloadPropertiesFromDefaultsOnMainThread__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPropertiesFromDefaults");
}

- (void)_perDeviceSettingsDidResetNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The active device changed; reloading Music sync defaults.",
      v5,
      2u);
  }

  -[NMSyncDefaults _reloadPropertiesFromDefaultsOnMainThread](self, "_reloadPropertiesFromDefaultsOnMainThread");
}

- (void)_resetDomainAccessor
{
  NSObject *domainAccessorQueue;
  _QWORD block[5];

  domainAccessorQueue = self->_domainAccessorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__NMSyncDefaults__resetDomainAccessor__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_sync(domainAccessorQueue, block);
}

void __38__NMSyncDefaults__resetDomainAccessor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_159);
}

void __38__NMSyncDefaults__resetDomainAccessor__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_NMPerDeviceSettingsDidResetNotification"), 0);

}

- (id)_companionSidePerDeviceDefaults
{
  uint64_t v3;
  NSObject *domainAccessorQueue;
  id v5;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];

  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke;
  v14[3] = &unk_24D646F30;
  v14[4] = self;
  if (_companionSidePerDeviceDefaults___onceToken != -1)
    dispatch_once(&_companionSidePerDeviceDefaults___onceToken, v14);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  domainAccessorQueue = self->_domainAccessorQueue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_165;
  block[3] = &unk_24D6476D8;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(domainAccessorQueue, block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v2 = dispatch_queue_create("com.apple.NanoMusicSync.domainAccessorQueue", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_2;
  v10[3] = &unk_24D647B70;
  v10[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x219A03B50](v10);
  v6 = (const char *)objc_msgSend((id)*MEMORY[0x24BE6B448], "UTF8String");
  v7 = MEMORY[0x24BDAC9B8];
  notify_register_dispatch(v6, &_NMPerDeviceSettingsDidResetNotification_block_invoke___unpairNotifyToken, MEMORY[0x24BDAC9B8], v5);
  notify_register_dispatch((const char *)objc_msgSend((id)*MEMORY[0x24BE6B438], "UTF8String"), &_NMPerDeviceSettingsDidResetNotification_block_invoke___pairNotifyToken, v7, v5);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__resetDomainAccessor, *MEMORY[0x24BE6B420], 0);

  v9 = (id)objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
}

uint64_t __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetDomainAccessor");
}

void __49__NMSyncDefaults__companionSidePerDeviceDefaults__block_invoke_165(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)_writePropertiesToDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  NMSyncDefaults *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[NMSyncDefaults _companionSidePerDeviceDefaults](self, "_companionSidePerDeviceDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKey:", self->_assetSyncPlaylistPersistentID, CFSTR("SyncPlaylistID"));
    objc_msgSend(v4, "setObject:forKey:", self->_lastFullySentAssetSyncPlaylistPersistentID, CFSTR("LastFullSyncPlaylistID"));
    objc_msgSend(v4, "setObject:forKey:", self->_lastFullySentAssetSyncPlaylistVersion, CFSTR("SyncPlaylistVers"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_assetSyncLimitType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("SyncAmountType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_assetSyncType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("SyncType"));

    objc_msgSend(v4, "setObject:forKey:", self->_assetSyncLimit, CFSTR("SyncAmount"));
    objc_msgSend(v4, "setObject:forKey:", self->_pairingID, CFSTR("PairingID"));
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("ModDate"));

    v10 = (id)objc_msgSend(v4, "synchronize");
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = self;
      _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Non-NPS managed properties were updated: %@", (uint8_t *)&v12, 0xCu);
    }

    -[NMSNotificationDispatcher scheduleLocalDarwinNotification](self->_settingsNotifier, "scheduleLocalDarwinNotification");
  }

}

void __41__NMSyncDefaults__migrateDataIfNecessary__block_invoke_231(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_objectForKey:", CFSTR("CachedRecommendationsResponse"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", CFSTR("CachedRecommendationsResponse"));
    objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", CFSTR("LastRecommendationUpdateDate"));
  }
  objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", CFSTR("SelectedStoreLibraryRecommendationAlbums"));
  objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", CFSTR("SelectedStoreLibraryRecommendationPlaylists"));

}

- (void)_removeOldMusicRecommendationsInfoIfPossible
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  -[NMSyncDefaults beginBatchUpdates](self, "beginBatchUpdates");
  -[NMSyncDefaults _companionSidePerDeviceDefaults](self, "_companionSidePerDeviceDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "synchronize");
  objc_msgSend(v3, "objectForKey:", CFSTR("SyncDataMigrationRevision"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = &unk_24D655AE8;
  }
  if ((unint64_t)objc_msgSend(v5, "unsignedIntegerValue") <= 4)
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] The old musicRecommendations information has not been removed yet.", buf, 2u);
    }

    objc_msgSend(v3, "objectForKey:", CFSTR("PhoneDefaultsCapabilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v7 = 0;
    }
    objc_msgSend(v3, "objectForKey:", CFSTR("WatchDefaultsCapabilities"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v8 = 0;
    }
    if (objc_msgSend(v7, "containsObject:", CFSTR("UsesSplitMusicRecommendations"))
      && objc_msgSend(v8, "containsObject:", CFSTR("UsesSplitMusicRecommendations")))
    {
      objc_msgSend(v3, "setObject:forKey:", &unk_24D655B00, CFSTR("SyncDataMigrationRevision"));
      v9 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceReferenceDate");
      objc_msgSend(v9, "numberWithDouble:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ModDate"));

      objc_msgSend(v3, "removeObjectForKey:", CFSTR("MusicRecommendations"));
      v12 = (id)objc_msgSend(v3, "synchronize");
      NMLogForCategory(5);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Neither watch nor phone require the old musicRecommendations information anymore. Deleting it.", v17, 2u);
      }

    }
    v14 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend(v3, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("PhoneDefaultsCapabilities"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "synchronizeNanoDomain:keys:", v15, v16);

  }
  -[NMSyncDefaults endBatchUpdates](self, "endBatchUpdates");

}

- (unint64_t)_spaceQuotaForNumberOfSongs:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2000;
  if (a3 < 0xC9)
    v3 = 1000;
  if (a3 >= 0x65)
    return v3;
  else
    return 500;
}

- (id)_defaultPlaylistPersistentID
{
  void *v3;

  -[NMSyncDefaults _playlistPersistentIDForPlaylistName:](self, "_playlistPersistentIDForPlaylistName:", CFSTR("Recently Added"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NMSyncDefaults _playlistPersistentIDForPlaylistName:](self, "_playlistPersistentIDForPlaylistName:", CFSTR("Recently Played"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      v3 = &unk_24D655AE8;
  }
  return v3;
}

- (id)_playlistPersistentIDForPlaylistName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  MLFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24D648498, CFSTR("MLLocalizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:comparisonType:", v5, *MEMORY[0x24BDDBD40], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC818], "playlistsQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addFilterPredicate:", v6);
  objc_msgSend(v7, "collectionPersistentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setNeedsSynchronize
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_needsSync)
  {
    v2 = MEMORY[0x24BDAC760];
    self->_needsSync = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __38__NMSyncDefaults__setNeedsSynchronize__block_invoke;
    block[3] = &unk_24D646F30;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __38__NMSyncDefaults__setNeedsSynchronize__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_writePropertiesToDefaults");
}

- (void)_clearAssetSyncPlaylistDependentDefaults
{
  NSNumber *lastFullySentAssetSyncPlaylistPersistentID;
  NSNumber *lastFullySentAssetSyncPlaylistVersion;

  lastFullySentAssetSyncPlaylistPersistentID = self->_lastFullySentAssetSyncPlaylistPersistentID;
  self->_lastFullySentAssetSyncPlaylistPersistentID = 0;

  lastFullySentAssetSyncPlaylistVersion = self->_lastFullySentAssetSyncPlaylistVersion;
  self->_lastFullySentAssetSyncPlaylistVersion = 0;

  -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
}

- (NSNumber)assetSyncLimit
{
  NSNumber *assetSyncLimit;

  assetSyncLimit = self->_assetSyncLimit;
  if (assetSyncLimit)
    return assetSyncLimit;
  if (self->_assetSyncLimitType)
    return (NSNumber *)&unk_24D655B30;
  return (NSNumber *)&unk_24D655B18;
}

- (void)setAssetSyncLimit:(id)a3
{
  NSNumber *v4;
  NSNumber *assetSyncLimit;
  char v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;

  v4 = (NSNumber *)a3;
  assetSyncLimit = self->_assetSyncLimit;
  if (assetSyncLimit != v4)
  {
    v9 = v4;
    v6 = -[NSNumber isEqual:](assetSyncLimit, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
      v8 = self->_assetSyncLimit;
      self->_assetSyncLimit = v7;

      -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
      v4 = v9;
    }
  }

}

- (void)setAssetSyncLimitType:(unint64_t)a3
{
  if (self->_assetSyncLimitType != a3)
  {
    self->_assetSyncLimitType = a3;
    -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
  }
}

- (void)setAssetSyncType:(unint64_t)a3
{
  if (self->_assetSyncType != a3)
  {
    self->_assetSyncType = a3;
    -[NMSyncDefaults _clearAssetSyncPlaylistDependentDefaults](self, "_clearAssetSyncPlaylistDependentDefaults");
    -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
  }
}

- (void)setAssetSyncPlaylistPersistentID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSNumber *v8;
  NSNumber *assetSyncPlaylistPersistentID;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_assetSyncPlaylistPersistentID, "isEqualToNumber:", v4))
  {
    if (v4)
      v5 = v4;
    else
      v5 = &unk_24D655AE8;
    v6 = v5;
    if ((objc_msgSend(v6, "isEqualToNumber:", &unk_24D655AE8) & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      v10[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = (NSNumber *)objc_msgSend(v6, "copy");
    assetSyncPlaylistPersistentID = self->_assetSyncPlaylistPersistentID;
    self->_assetSyncPlaylistPersistentID = v8;

    -[NMSyncDefaults setPinnedPlaylists:](self, "setPinnedPlaylists:", v7);
    -[NMSyncDefaults _clearAssetSyncPlaylistDependentDefaults](self, "_clearAssetSyncPlaylistDependentDefaults");
    -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");

  }
}

- (void)setLastFullySentAssetSyncPlaylistPersistentID:(id)a3
{
  NSNumber *v4;
  NSNumber *lastFullySentAssetSyncPlaylistPersistentID;
  char v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;

  v4 = (NSNumber *)a3;
  lastFullySentAssetSyncPlaylistPersistentID = self->_lastFullySentAssetSyncPlaylistPersistentID;
  if (lastFullySentAssetSyncPlaylistPersistentID != v4)
  {
    v9 = v4;
    v6 = -[NSNumber isEqual:](lastFullySentAssetSyncPlaylistPersistentID, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSNumber *)-[NSNumber copy](v9, "copy");
      v8 = self->_lastFullySentAssetSyncPlaylistPersistentID;
      self->_lastFullySentAssetSyncPlaylistPersistentID = v7;

      -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
      v4 = v9;
    }
  }

}

- (void)setLastFullySentAssetSyncPlaylistVersion:(id)a3
{
  NSNumber *v5;
  NSNumber *lastFullySentAssetSyncPlaylistVersion;
  char v7;
  NSNumber *v8;

  v5 = (NSNumber *)a3;
  lastFullySentAssetSyncPlaylistVersion = self->_lastFullySentAssetSyncPlaylistVersion;
  if (lastFullySentAssetSyncPlaylistVersion != v5)
  {
    v8 = v5;
    v7 = -[NSNumber isEqual:](lastFullySentAssetSyncPlaylistVersion, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistVersion, a3);
      -[NMSyncDefaults _setNeedsSynchronize](self, "_setNeedsSynchronize");
      v5 = v8;
    }
  }

}

- (void)setPinnedPlaylists:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromPlaylistPIDs:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v4, CFSTR("PinnedPlaylistMIDs"));
  -[NMSyncDefaults _setLegacyObject:forKey:ifRemoteDeviceMissingCapability:](self, "_setLegacyObject:forKey:ifRemoteDeviceMissingCapability:", v5, CFSTR("PinnedPlaylists"), CFSTR("UsesMultiverseIdentifiers"));

}

- (NSNumber)workoutPlaylistID
{
  void *v2;
  void *v3;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("WorkoutPlaylistMID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B170], "pidFromMIDData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setWorkoutPlaylistID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE6B170], "midDataFromPlaylistPID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v5, CFSTR("WorkoutPlaylistMID"));
  -[NMSyncDefaults _setLegacyObject:forKey:ifRemoteDeviceMissingCapability:](self, "_setLegacyObject:forKey:ifRemoteDeviceMissingCapability:", v6, CFSTR("WorkoutPlaylist"), CFSTR("UsesMultiverseIdentifiers"));

}

- (void)setPinnedAlbums:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromAlbumPIDs:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v4, CFSTR("PinnedAlbumMIDs"));
  -[NMSyncDefaults _setLegacyObject:forKey:ifRemoteDeviceMissingCapability:](self, "_setLegacyObject:forKey:ifRemoteDeviceMissingCapability:", v5, CFSTR("PinnedAlbums"), CFSTR("UsesMultiverseIdentifiers"));

}

- (BOOL)pinnedPodcastsAreUserSet
{
  return -[NMSyncDefaults _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("PinnedPodcastsAreUserSet"), 0);
}

- (void)setPinnedPodcastsAreUserSet:(BOOL)a3
{
  -[NMSyncDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("PinnedPodcastsAreUserSet"));
}

- (BOOL)savedEpisodesEnabled
{
  return -[NMSyncDefaults _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("SavedEpisodesEnabled"), 0);
}

- (void)setSavedEpisodesEnabled:(BOOL)a3
{
  -[NMSyncDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("SavedEpisodesEnabled"));
}

- (NSArray)pinnedPodcastFeedURLs
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedPodcastFeedURLs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setPinnedPodcastFeedURLs:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("PinnedPodcastFeedURLs"));
}

- (NSArray)pinnedPodcastStationUUIDs
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedPodcastStationUUIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setPinnedPodcastStationUUIDs:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("PinnedPodcastStationUUIDs"));
}

- (void)clearPodcastsDefaults
{
  NSObject *v3;
  uint8_t v4[16];

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Clearing Podcasts defaults", v4, 2u);
  }

  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PodcastDownloadOrders"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PodcastEpisodeLimits"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PinnedPodcastsAreUserSet"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("ListenNowPodcastFeedURLs"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("SavedEpisodesEnabled"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PinnedPodcastFeedURLs"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PinnedPodcastStationUUIDs"));
  -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("PodcastSizeEstimationData"));
}

- (id)podcastSizeEstimationData
{
  return -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PodcastSizeEstimationData"));
}

- (void)setPodcastSizeEstimationData:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("PodcastSizeEstimationData"));
}

- (BOOL)wantToReadEnabled
{
  return -[NMSyncDefaults _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("WantToReadEnabled"), 1);
}

- (void)setWantToReadEnabled:(BOOL)a3
{
  -[NMSyncDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("WantToReadEnabled"));
}

- (NSArray)wantToReadAudiobooks
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("WantToReadAudiobooks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setWantToReadAudiobooks:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("WantToReadAudiobooks"));
}

- (BOOL)readingNowEnabled
{
  return -[NMSyncDefaults _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("ReadingNowEnabled"), 1);
}

- (void)setReadingNowEnabled:(BOOL)a3
{
  -[NMSyncDefaults _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("ReadingNowEnabled"));
}

- (NSArray)readingNowAudiobooks
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("ReadingNowAudiobooks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setReadingNowAudiobooks:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("ReadingNowAudiobooks"));
}

- (NSArray)pinnedAudiobooks
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PinnedAudiobooks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (void)setPinnedAudiobooks:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("PinnedAudiobooks"));
}

- (NSNumber)audiobookDownloadLimit
{
  return (NSNumber *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AudiobookDownloadLimit"));
}

- (void)setAudiobookDownloadLimit:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("AudiobookDownloadLimit"));
}

- (NSArray)libraryRecommendationAlbums
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("LibraryRecommendationAlbumMIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B170], "pidsFromMIDDataArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSArray *)v6;
}

- (void)setLibraryRecommendationAlbums:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromAlbumPIDs:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v4, CFSTR("LibraryRecommendationAlbumMIDs"));
  -[NMSyncDefaults _setLegacyObject:forKey:ifRemoteDeviceMissingCapability:](self, "_setLegacyObject:forKey:ifRemoteDeviceMissingCapability:", v5, CFSTR("LibraryRecommendationAlbums"), CFSTR("UsesMultiverseIdentifiers"));

}

- (NSArray)libraryRecommendationPlaylists
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("LibraryRecommendationPlaylistMIDs"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B170], "pidsFromMIDDataArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSArray *)v6;
}

- (void)setLibraryRecommendationPlaylists:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE6B170], "midDataArrayFromPlaylistPIDs:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v4, CFSTR("LibraryRecommendationPlaylistMIDs"));
  -[NMSyncDefaults _setLegacyObject:forKey:ifRemoteDeviceMissingCapability:](self, "_setLegacyObject:forKey:ifRemoteDeviceMissingCapability:", v5, CFSTR("LibraryRecommendationPlaylists"), CFSTR("UsesMultiverseIdentifiers"));

}

- (void)setMusicRecommendationDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__NMSyncDefaults_setMusicRecommendationDict___block_invoke;
    v10[3] = &unk_24D647B98;
    v11 = v5;
    v12 = v6;
    v7 = v6;
    v8 = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v7, CFSTR("StoreMusicRecommendationsToExclude"));

  }
  else
  {
    -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", CFSTR("StoreMusicRecommendationsToExclude"));
  }
  if (-[NMSyncDefaults _continueUsingMusicRecommendationKey](self, "_continueUsingMusicRecommendationKey"))
    -[NMSyncDefaults _preSeed2_setMusicRecommendationDict:](self, "_preSeed2_setMusicRecommendationDict:", v9);

}

void __45__NMSyncDefaults_setMusicRecommendationDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", v7);
  LOBYTE(v5) = objc_msgSend(v6, "BOOLValue");

  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (BOOL)_continueUsingMusicRecommendationKey
{
  void *v2;
  void *v3;
  BOOL v4;

  -[NMSyncDefaults _companionSidePerDeviceDefaults](self, "_companionSidePerDeviceDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SyncDataMigrationRevision"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") < 5;

  return v4;
}

- (void)_preSeed2_setMusicRecommendationDict:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("MusicRecommendations"));
}

- (NSDate)libraryRecommendationExpirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("LibraryRecommendationExpirationDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setLibraryRecommendationExpirationDate:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v5, CFSTR("LibraryRecommendationExpirationDate"));

}

- (NSDate)catalogRecommendationsLastUpdateDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("CatalogRecommendationsLastUpdateDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setCatalogRecommendationsLastUpdateDate:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v5, CFSTR("CatalogRecommendationsLastUpdateDate"));

}

- (void)setCachedRecommendationsData:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("CachedRecommendationsData"));
}

- (NSNumber)minimumNumberOfRecentMusicModelObjects
{
  void *v2;
  void *v3;
  NSNumber *v4;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("MinimumNumberOfRecentMusicModelObjects"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &unk_24D655B48;
  v4 = v2;

  return v4;
}

- (void)setMinimumNumberOfRecentMusicModelObjects:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("MinimumNumberOfRecentMusicModelObjects"));
}

- (NSDictionary)clientPinningSettingsToken
{
  return (NSDictionary *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("ClientPinningSettingsToken"));
}

- (NSDictionary)syncStateDict
{
  return (NSDictionary *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("SyncStateDict"));
}

- (void)setClientPinningSettingsToken:(id)a3
{
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", a3, CFSTR("ClientPinningSettingsToken"));
}

- (NSDictionary)musicSyncInfo
{
  return (NSDictionary *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("MusicSyncInfo"));
}

- (NSDictionary)podcastsSyncInfo
{
  return (NSDictionary *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("PodcastsSyncInfo"));
}

- (NSDictionary)audiobooksSyncInfo
{
  return (NSDictionary *)-[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AudiobooksSyncInfo"));
}

- (id)_lastSyncInfoRequestDateWithPrefix:(id)a3 forBundleIdentifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBCE60];
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setLastSyncInfoRequestDate:(id)a3 prefix:(id)a4 forBundleIdentifier:(id)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v8 = a3;
  -[NMSyncDefaults _defaultWithPrefix:forBundleIdentifier:](self, "_defaultWithPrefix:forBundleIdentifier:", a4, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v11 = v10;

  objc_msgSend(v9, "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v12, v13);

}

- (id)lastSyncInfoRequestDateForBundleIdentifier:(id)a3
{
  return -[NMSyncDefaults _lastSyncInfoRequestDateWithPrefix:forBundleIdentifier:](self, "_lastSyncInfoRequestDateWithPrefix:forBundleIdentifier:", CFSTR("LastSyncInfoRequestDate"), a3);
}

- (void)setLastSyncInfoRequestDate:(id)a3 forBundleIdentifier:(id)a4
{
  -[NMSyncDefaults _setLastSyncInfoRequestDate:prefix:forBundleIdentifier:](self, "_setLastSyncInfoRequestDate:prefix:forBundleIdentifier:", a3, CFSTR("LastSyncInfoRequestDate"), a4);
}

- (BOOL)debugSyncInfoEnabled
{
  void *v2;
  BOOL v3;

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("DebugSyncInfoEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_dateValueForKey:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AppActivityStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_writeDate:(id)a3 forKey:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AppActivityStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v8);
    objc_msgSend(v11, "setObject:forKey:", v13, v9);

    v9 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v14, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v12, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v11, CFSTR("AppActivityStatus"));
}

- (void)clearAppActivityStatusDefaultsForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Clearing app activity status defaults for %@", (uint8_t *)&v8, 0xCu);
  }

  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AppActivityStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v4);
  -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v7, CFSTR("AppActivityStatus"));

}

- (void)setLastUserLaunchDateForBundleID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _writeDate:forKey:bundleID:](self, "_writeDate:forKey:bundleID:", v6, CFSTR("LastUserLaunchDate"), v5);

}

- (void)setLastUserPinningChangeDateForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _writeDate:forKey:bundleID:](self, "_writeDate:forKey:bundleID:", v5, CFSTR("LastUserPinningChangeDate"), v4);

  NMLogForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Set last user pinning change date for bundle %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setLastLocalPlaybackDateForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _writeDate:forKey:bundleID:](self, "_writeDate:forKey:bundleID:", v5, CFSTR("LastLocalPlaybackDate"), v4);

  NMLogForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Set last local playback date for bundle %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setInstallDateForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _writeDate:forKey:bundleID:](self, "_writeDate:forKey:bundleID:", v5, CFSTR("InstallDate"), v4);

  NMLogForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Set install date for bundle %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setLastContentUsedDateForBundleID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults _writeDate:forKey:bundleID:](self, "_writeDate:forKey:bundleID:", v5, CFSTR("LastContentUsedDate"), v4);

  NMLogForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Set last content used date for bundle %@", (uint8_t *)&v7, 0xCu);
  }

}

- (id)lastUserLaunchDateForBundleID:(id)a3
{
  return -[NMSyncDefaults _dateValueForKey:bundleID:](self, "_dateValueForKey:bundleID:", CFSTR("LastUserLaunchDate"), a3);
}

- (id)lastUserPinningChangeDateForBundleID:(id)a3
{
  return -[NMSyncDefaults _dateValueForKey:bundleID:](self, "_dateValueForKey:bundleID:", CFSTR("LastUserPinningChangeDate"), a3);
}

- (id)lastLocalPlaybackDateForBundleID:(id)a3
{
  return -[NMSyncDefaults _dateValueForKey:bundleID:](self, "_dateValueForKey:bundleID:", CFSTR("LastLocalPlaybackDate"), a3);
}

- (id)installDateForBundleID:(id)a3
{
  return -[NMSyncDefaults _dateValueForKey:bundleID:](self, "_dateValueForKey:bundleID:", CFSTR("InstallDate"), a3);
}

- (id)lastContentUsedDateForBundleID:(id)a3
{
  return -[NMSyncDefaults _dateValueForKey:bundleID:](self, "_dateValueForKey:bundleID:", CFSTR("LastContentUsedDate"), a3);
}

- (int64_t)dormancyIntervalInHoursForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[NMSyncDefaults _objectForKey:](self, "_objectForKey:", CFSTR("AppActivityStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("HoursUntilDormant"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "integerValue");
  else
    v9 = 504;

  return v9;
}

- (id)_defaultWithPrefix:(id)a3 forBundleIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("-%@"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_objectForKey:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE6B2C0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
  v6 = (id)objc_msgSend(v5, "synchronize");
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setLegacyObject:(id)a3 forKey:(id)a4 ifRemoteDeviceMissingCapability:(id)a5
{
  id v8;
  BOOL v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = -[NMSyncDefaults _watchHasCapability:](self, "_watchHasCapability:", a5);
  if (!v10 || v9)
    -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", v8);
  else
    -[NMSyncDefaults _setObject:forKey:](self, "_setObject:forKey:", v10, v8);

}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  -[NMSyncDefaults _setObject:forKey:shouldSynchronizeToPairedDevice:](self, "_setObject:forKey:shouldSynchronizeToPairedDevice:", a3, a4, 1);
}

- (void)_setObject:(id)a3 forKey:(id)a4 shouldSynchronizeToPairedDevice:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
    v11 = v10;
    if (v10)
    {
      v12 = (id)objc_msgSend(v10, "synchronize");
      objc_msgSend(v11, "objectForKey:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v13) & 1) == 0)
      {
        objc_msgSend(v11, "setObject:forKey:", v8, v9);
        v14 = (id)objc_msgSend(v11, "synchronize");
        if (v5)
        {
          v15 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoMusicSync"), v16);

        }
        NMLogForCategory(5);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412802;
          v19 = v9;
          v20 = 2112;
          v21 = v13;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] updated value for key: %@ from old value: %@ to new value: %@", (uint8_t *)&v18, 0x20u);
        }

        -[NMSyncDefaults _notifyChangesForKey:](self, "_notifyChangesForKey:", v9);
      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    -[NMSyncDefaults _removeObjectForKey:](self, "_removeObjectForKey:", v9);
  }

}

- (void)_removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
  v6 = (id)objc_msgSend(v5, "synchronize");
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "removeObjectForKey:", v4);
      v8 = (id)objc_msgSend(v5, "synchronize");
      v9 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoMusicSync"), v10);

      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Removing value for key: %@", (uint8_t *)&v12, 0xCu);
      }

      -[NMSyncDefaults _notifyChangesForKey:](self, "_notifyChangesForKey:", v4);
    }
  }

}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  char v11;

  v5 = (objc_class *)MEMORY[0x24BE6B2C0];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
  v8 = (id)objc_msgSend(v7, "synchronize");
  v11 = 0;
  v9 = objc_msgSend(v7, "BOOLForKey:keyExistsAndHasValidFormat:", v6, &v11);

  if (v11)
    a4 = v9;

  return a4;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.NanoMusicSync"));
  v8 = v7;
  if (v7)
  {
    v9 = (id)objc_msgSend(v7, "synchronize");
    LOBYTE(v17) = 0;
    v10 = objc_msgSend(v8, "BOOLForKey:keyExistsAndHasValidFormat:", v6, &v17);
    v11 = v10;
    if (!(_BYTE)v17 || v10 != v4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v12, v6);

      v13 = (id)objc_msgSend(v8, "synchronize");
      v14 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "synchronizeNanoDomain:keys:", CFSTR("com.apple.NanoMusicSync"), v15);

      NMLogForCategory(5);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412802;
        v18 = v6;
        v19 = 1024;
        v20 = v11;
        v21 = 1024;
        v22 = v4;
        _os_log_impl(&dword_216E27000, v16, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Updated value for key: %@ from old value: %d to new value: %d", (uint8_t *)&v17, 0x18u);
      }

      -[NMSyncDefaults _notifyChangesForKey:](self, "_notifyChangesForKey:", v6);
    }
  }

}

- (void)_notifyChangesForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NSDictionary objectForKeyedSubscript:](self->_notifiersDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "scheduleLocalDarwinNotification");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSNumber)lastFullySentAssetSyncPlaylistPersistentID
{
  return self->_lastFullySentAssetSyncPlaylistPersistentID;
}

- (NSNumber)lastFullySentAssetSyncPlaylistVersion
{
  return self->_lastFullySentAssetSyncPlaylistVersion;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setMusicSyncInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setPodcastsSyncInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setAudiobooksSyncInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)assetSyncLimitType
{
  return self->_assetSyncLimitType;
}

- (unint64_t)assetSyncType
{
  return self->_assetSyncType;
}

- (NSNumber)assetSyncPlaylistPersistentID
{
  return self->_assetSyncPlaylistPersistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSyncPlaylistPersistentID, 0);
  objc_storeStrong((id *)&self->_audiobooksSyncInfo, 0);
  objc_storeStrong((id *)&self->_podcastsSyncInfo, 0);
  objc_storeStrong((id *)&self->_musicSyncInfo, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistVersion, 0);
  objc_storeStrong((id *)&self->_lastFullySentAssetSyncPlaylistPersistentID, 0);
  objc_storeStrong((id *)&self->_assetSyncLimit, 0);
  objc_storeStrong((id *)&self->_syncInfoRequestDateNotifier, 0);
  objc_storeStrong((id *)&self->_syncInfoNotifier, 0);
  objc_storeStrong((id *)&self->_syncStateNotifier, 0);
  objc_storeStrong((id *)&self->_audiobooksRecommendationsNotifier, 0);
  objc_storeStrong((id *)&self->_audiobooksPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_podcastsPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_storeRecoNotifier, 0);
  objc_storeStrong((id *)&self->_libraryRecoNotifier, 0);
  objc_storeStrong((id *)&self->_recoSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_musicPinningSelectionsNotifier, 0);
  objc_storeStrong((id *)&self->_settingsNotifier, 0);
  objc_storeStrong((id *)&self->_notifiersDict, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessorQueue, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

- (MPMediaPlaylist)assetSyncPlaylist
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_assetSyncType == 1)
  {
    -[NMSyncDefaults assetSyncPlaylistPersistentID](self, "assetSyncPlaylistPersistentID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NMSyncDefaults _associatedObject](self, "_associatedObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetSyncPlaylist");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && (v6 = objc_msgSend(v3, "unsignedLongLongValue"), v6 == objc_msgSend(v5, "persistentID")))
      {
        v7 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", v3, *MEMORY[0x24BDDBD50]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDDC818], "playlistsQuery");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFilterPredicate:", v8);
        objc_msgSend(v9, "collections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[NMSyncDefaults _associatedObject](self, "_associatedObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAssetSyncPlaylist:", v11);

        v7 = v11;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return (MPMediaPlaylist *)v7;
}

- (void)setAssetSyncPlaylist:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NMSyncDefaults _associatedObject](self, "_associatedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetSyncPlaylist:", v6);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "persistentID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[NMSyncDefaults setAssetSyncPlaylistPersistentID:](self, "setAssetSyncPlaylistPersistentID:", v5);

}

- (id)_associatedObject
{
  void *v3;

  objc_getAssociatedObject(self, sel__associatedObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_setAssociatedObject(self, sel__associatedObject, v3, (void *)1);
  }
  return v3;
}

@end
