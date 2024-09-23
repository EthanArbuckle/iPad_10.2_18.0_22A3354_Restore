@implementation IMDCKSyncState

- (NSDictionary)syncStatistics
{
  return self->_syncStatistics;
}

- (void)setSyncingPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37BA8]);

}

- (void)setSyncingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37BC8]);

}

- (void)setRemovedFromBackup:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37A80]);

}

- (void)setEligibleForTruthZone:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37A70]);

}

- (void)setAccountStatus:(int64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D378D8]);

}

- (id)serializedRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  IMCloudKitGetSyncStateDictionary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncStatistics](self, "syncStatistics");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[IMDCKSyncState syncStatistics](self, "syncStatistics"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        v7))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v13 = *MEMORY[0x1E0D37B60];
    -[IMDCKSyncState syncStatistics](self, "syncStatistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithDictionary:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "addEntriesFromDictionary:", v3);

  return v11;
}

- (id)logHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "logHandle");
}

- (IMKeyValueCollection)keyValueCollection
{
  return self->_storage;
}

- (BOOL)isSyncingEnabled
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37BC8], 0);

  return v3;
}

- (BOOL)isFeatureEnabled
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D379F8], 0);

  return v3;
}

- (void)broadcastSyncState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D1417418;
  block[3] = &unk_1E92287A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_startBatchChange
{
  id v2;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_startBatchWrite");

}

- (void)_finishBatchChange
{
  id v2;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_commitBatchWrite");

}

+ (id)logHandle
{
  if (qword_1ED935EA8 != -1)
    dispatch_once(&qword_1ED935EA8, &unk_1E922AA18);
  return (id)qword_1ED935E98;
}

- (void)setSyncPhaseType:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_updateSyncType_);
}

- (void)setSyncJobStateWithState:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_updateSyncJobState_);
}

- (void)setSyncStarted
{
  MEMORY[0x1E0DE7D20](self, sel_updateSyncStatus_);
}

- (void)setSyncStopped
{
  MEMORY[0x1E0DE7D20](self, sel_updateSyncStatus_);
}

- (void)setCloudKitSyncStatistics:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setSyncStatistics_);
}

- (void)setLastSyncDownloadProgress:(double)a3
{
  MEMORY[0x1E0DE7D20](self, sel_updateLastDownloadProgress_);
}

- (void)deleteAllCloudKitData
{
  void *v3;

  -[IMDCKSyncState setDeletedZones:](self, "setDeletedZones:", 1);
  +[IMDRecordZoneManager sharedInstance](IMDRecordZoneManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllZones");

  MEMORY[0x1E0DE7D20](self, sel_clearSyncStateForAllRecordTypes);
}

- (void)clearSyncStateForAllRecordTypes
{
  id v2;

  +[IMDCKSyncController sharedInstance](IMDCKSyncController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLocalCloudKitSyncState");

}

- (IMDCKSyncState)initWithKeyValueCollection:(id)a3
{
  id v5;
  IMDCKSyncState *v6;
  IMDCKSyncState *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMDCKSyncState;
  v6 = -[IMDCKSyncState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    -[IMDCKSyncState keyValueCollection](v7, "keyValueCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v7);

  }
  return v7;
}

- (IMDCKSyncState)init
{
  -[IMDCKSyncState doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0);

  return 0;
}

- (BOOL)createdChatZone
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37938], 0);

  return v3;
}

- (void)setCreatedChatZone:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37938]);

}

- (BOOL)deletedZones
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37938], 0);

  return v3;
}

- (void)setDeletedZones:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37938]);

}

- (void)setFeatureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D379F8]);

}

- (BOOL)isSyncing
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37A88], 0);

  return v3;
}

- (void)setSyncing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37A88]);

}

- (BOOL)isEligibleForTruthZone
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37A70], 0);

  return v3;
}

- (BOOL)isRemovedFromBackup
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37A80], 0);

  return v3;
}

- (BOOL)isInExitState
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37A78], 0);

  return v3;
}

- (void)setInExitState:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37A78]);

}

- (BOOL)isSyncingPaused
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37BA8], 0);

  return v3;
}

- (BOOL)syncCancelled
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37B68], 0);

  return v3;
}

- (void)setSyncCancelled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37B68]);

}

- (BOOL)isDisablingDevices
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37B40], 0);

  return v3;
}

- (void)setDisablingDevices:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37B40]);

}

- (BOOL)isStartingEnabledSettingChange
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37B48], 0);

  return v3;
}

- (void)setStartingEnabledSettingChange:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37B48]);

}

- (BOOL)isStartingPeriodicSyncSetByCloudKitHooks
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37B58], 0);

  return v3;
}

- (void)setStartingPeriodicSyncSetByCloudKitHooks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37B58]);

}

- (BOOL)isStartingInitialSyncSetByCloudKitHooks
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37B50], 0);

  return v3;
}

- (void)setStartingInitialSyncSetByCloudKitHooks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37B50]);

}

- (NSDate)exitDate
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D379F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setExitDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D379F0]);

}

- (NSDate)lastSyncDate
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37B88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setLastSyncDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D37B88]);

}

- (NSDictionary)analyticSyncDatesDictionary
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D378E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setAnalyticSyncDatesDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D378E0]);

}

- (NSString)syncSessionID
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37BB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSyncSessionID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D37BB0]);

}

- (NSString)micDeviceIdentifier
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D37AD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMiCDeviceIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0D37AD8]);

}

- (unint64_t)syncControllerSyncState
{
  void *v2;
  unint64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37B78], 0);

  return v3;
}

- (void)setSyncControllerSyncState:(unint64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37B78]);

}

- (unint64_t)syncType
{
  void *v2;
  unint64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37BC0], 0);

  return v3;
}

- (void)setSyncType:(unint64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37BC0]);

}

- (unint64_t)syncStatus
{
  void *v2;
  unint64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37BB8], 0);

  return v3;
}

- (void)setSyncStatus:(unint64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37BB8]);

}

- (unint64_t)syncJobState
{
  void *v2;
  unint64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37BA0], 0);

  return v3;
}

- (void)setSyncJobState:(unint64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37BA0]);

}

- (int64_t)syncControllerSyncType
{
  void *v2;
  int64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37B80], 0);

  return v3;
}

- (void)setSyncControllerSyncType:(int64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37B80]);

}

- (int64_t)syncControllerRecordType
{
  void *v2;
  int64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D37B70], 0);

  return v3;
}

- (void)setSyncControllerRecordType:(int64_t)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, *MEMORY[0x1E0D37B70]);

}

- (int64_t)accountStatus
{
  void *v2;
  int64_t v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:withDefault:", *MEMORY[0x1E0D378D8], 0);

  return v3;
}

- (BOOL)hasAvailableRecordsToDownload
{
  void *v2;
  char v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:withDefault:", *MEMORY[0x1E0D37A40], 0);

  return v3;
}

- (void)setHasAvailableRecordsToDownload:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, *MEMORY[0x1E0D37A40]);

}

- (double)lastDownloadProgress
{
  void *v2;
  double v3;
  double v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:withDefault:", *MEMORY[0x1E0D37AA8], 0.0);
  v4 = v3;

  return v4;
}

- (void)setLastDownloadProgress:(double)a3
{
  id v4;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", *MEMORY[0x1E0D37AA8], a3);

}

- (NSArray)syncErrors
{
  void *v2;
  void *v3;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorArrayForKey:", *MEMORY[0x1E0D37B98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)clearSyncErrors
{
  id v2;

  -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *MEMORY[0x1E0D37B98]);

}

- (void)addSyncError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findRootCauses:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x1E0D37B98];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[IMDCKSyncState keyValueCollection](self, "keyValueCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addErrorToArray:forKey:", v12, v10);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_setObject:(id)a3 forKey:(id)a4 forDictionary:(id)a5 shouldSetBuild:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a6;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, qword_1EFC60750);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "productBuildVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Setting object %@ for key %@ in analyticDict.", buf, 0x16u);
    }

  }
  v17 = objc_msgSend(v11, "setObject:forKey:", v9, v10);
  if (v6)
  {
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v14;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Setting ProductBuildVersion %@ for key %@ in analyticDict.", buf, 0x16u);
      }

    }
    objc_msgSend(v11, "setObject:forKey:", v14, v12);
  }

}

- (void)_removeObjectForKey:(id)a3 forDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, qword_1EFC60750);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Removing keys %@ %@ from analyticDict.", buf, 0x16u);
    }

  }
  objc_msgSend(v6, "removeObjectForKey:", v5);
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

+ (void)removeBuildObjectsFromDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (unint64_t)(objc_msgSend(v3, "count") + 1) >> 1);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSuffix:", qword_1EFC60750))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "removeObjectsForKeys:", v4);
}

- (void)removeObjectFromAnalyticSyncDatesDictionaryForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99E08]);
      -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

      -[IMDCKSyncState _removeObjectForKey:forDictionary:](self, "_removeObjectForKey:forDictionary:", v10, v8);
      v9 = (void *)objc_msgSend(v8, "copy");
      -[IMDCKSyncState setAnalyticSyncDatesDictionary:](self, "setAnalyticSyncDatesDictionary:", v9);

    }
  }

}

- (void)setAnalyticSyncDatesDictionaryObject:(id)a3 forKey:(id)a4 shouldOverrideIfExists:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v23[22];
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      *(_DWORD *)v23 = 138412802;
      *(_QWORD *)&v23[4] = v8;
      *(_WORD *)&v23[12] = 2112;
      if (v5)
        v11 = CFSTR("YES");
      *(_QWORD *)&v23[14] = v9;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Request to set analytic sync date for object %@ and key %@ shouldOverrideIfExists %@", v23, 0x20u);
    }

  }
  v12 = objc_msgSend(v9, "length", *(_OWORD *)v23);
  if (v8 && v12)
  {
    -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0C99E08]);
      -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v15, "initWithDictionary:", v16);

      if (!v5)
      {
        objc_msgSend(v17, "objectForKey:", v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (!v19)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v20, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        -[IMDCKSyncState _setObject:forKey:forDictionary:shouldSetBuild:](self, "_setObject:forKey:forDictionary:shouldSetBuild:", v21, v9, v17, 1);

    }
    else
    {
      -[IMDCKSyncState _setObject:forKey:forDictionary:shouldSetBuild:](self, "_setObject:forKey:forDictionary:shouldSetBuild:", v8, v9, v17, 0);
    }
    v22 = (void *)objc_msgSend(v17, "copy");
    -[IMDCKSyncState setAnalyticSyncDatesDictionary:](self, "setAnalyticSyncDatesDictionary:", v22);

    goto LABEL_20;
  }
LABEL_21:

}

- (id)getAnalyticSyncDatesObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)describeErrors
{
  void *v3;
  void *v4;

  -[IMDCKSyncState syncErrors](self, "syncErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState _describeErrors:](self, "_describeErrors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_describeErrors:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(v4, "appendFormat:", CFSTR("Errors(%lu total)"), objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "logString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("|%@"), v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldReportNewUserIfCreatedChatZones:(BOOL)a3 deletedZones:(BOOL)a4
{
  return a3 & ~a4;
}

- (id)syncUserType
{
  if (-[IMDCKSyncState _shouldReportNewUserIfCreatedChatZones:deletedZones:](self, "_shouldReportNewUserIfCreatedChatZones:deletedZones:", -[IMDCKSyncState createdChatZone](self, "createdChatZone"), -[IMDCKSyncState deletedZones](self, "deletedZones")))
  {
    return CFSTR("NewUser");
  }
  else
  {
    return CFSTR("RestoringUser");
  }
}

- (id)syncReportDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  -[IMDCKSyncState analyticSyncDatesDictionary](self, "analyticSyncDatesDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDCKSyncState removeBuildObjectsFromDict:](IMDCKSyncState, "removeBuildObjectsFromDict:", v5);
  -[IMDCKSyncState syncUserType](self, "syncUserType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x1E0D37C00]);

  -[IMDCKSyncState syncSessionID](self, "syncSessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMDCKSyncState syncSessionID](self, "syncSessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("syncSessionID"));

  }
  -[IMDCKSyncState micDeviceIdentifier](self, "micDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[IMDCKSyncState micDeviceIdentifier](self, "micDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, *MEMORY[0x1E0D37AD8]);

  }
  -[IMDCKSyncState describeErrors](self, "describeErrors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("syncErrors"));

  return v5;
}

- (id)describeRecordCounts
{
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
  id v13;
  id v14;
  void *v15;
  void *v16;

  v13 = (id)MEMORY[0x1E0CB3940];
  +[IMDCKChatSyncController sharedInstance](IMDCKChatSyncController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "describeRecordCounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKMessageSyncController sharedInstance](IMDCKInitialMessageSyncController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "describeRecordCounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKInitialAttachmentSyncController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "describeRecordCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKMessageSyncController sharedInstance](IMDCKMessageSyncController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "describeRecordCounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "describeRecordCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDCKRecoverableMessageSyncController sharedInstance](IMDCKRecoverableMessageSyncController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "describeRecordCounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("chat %@ init %@ %@ full %@ %@ %@"), v2, v3, v5, v7, v9, v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  -[IMDCKSyncState syncReportDictionary](self, "syncReportDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("syncAttempts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("syncSuccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("syncDuration"));

  -[IMDCKSyncState describeRecordCounts](self, "describeRecordCounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("syncCounts"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "PCSReportManateeStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("pcsStatus"));

  return v9;
}

- (void)syncReportDictionaryForAttempt:(unint64_t)a3 withSuccess:(BOOL)a4 duration:(double)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v7 = a4;
  v10 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1D149EF14;
  v28 = sub_1D149EF24;
  v29 = 0;
  -[IMDCKSyncState syncReportDictionary](self, "syncReportDictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v25[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("syncAttempts"));

  v13 = (void *)v25[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("syncSuccess"));

  v15 = (void *)v25[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("syncDuration"));

  v17 = (void *)v25[5];
  -[IMDCKSyncState describeRecordCounts](self, "describeRecordCounts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("syncCounts"));

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1D149EF2C;
  v21[3] = &unk_1E922AA40;
  v23 = &v24;
  v20 = v10;
  v22 = v20;
  objc_msgSend(v19, "PCSReportManateeStatusAsync:timeout:", v21, 10.0);

  _Block_object_dispose(&v24, 8);
}

- (NSString)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v35 = (void *)MEMORY[0x1E0CB3940];
  v36.receiver = self;
  v36.super_class = (Class)IMDCKSyncState;
  -[IMDCKSyncState description](&v36, sel_description);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDCKSyncState isFeatureEnabled](self, "isFeatureEnabled"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v33 = v3;
  if (-[IMDCKSyncState isSyncing](self, "isSyncing"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v32 = v4;
  if (-[IMDCKSyncState isEligibleForTruthZone](self, "isEligibleForTruthZone"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v31 = v5;
  if (-[IMDCKSyncState isSyncingEnabled](self, "isSyncingEnabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v30 = v6;
  if (-[IMDCKSyncState isRemovedFromBackup](self, "isRemovedFromBackup"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v29 = v7;
  if (-[IMDCKSyncState isInExitState](self, "isInExitState"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v28 = v8;
  -[IMDCKSyncState exitDate](self, "exitDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDCKSyncState isDisablingDevices](self, "isDisablingDevices"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v26 = v9;
  -[IMDCKSyncState lastSyncDate](self, "lastSyncDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDCKSyncState isSyncingPaused](self, "isSyncingPaused"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v25 = v11;
  if (-[IMDCKSyncState isStartingEnabledSettingChange](self, "isStartingEnabledSettingChange"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v24 = v12;
  if (-[IMDCKSyncState isSyncingPaused](self, "isSyncingPaused"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  -[IMDCKSyncState syncControllerSyncState](self, "syncControllerSyncState");
  IMStringFromIMCloudKitSyncControllerSyncState();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncType](self, "syncType");
  IMStringFromIMCloudKitSyncType();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncStatus](self, "syncStatus");
  IMStringFromIMCloudKitSyncStatus();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncJobState](self, "syncJobState");
  IMStringFromIMCloudKitSyncJobState();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncControllerRecordType](self, "syncControllerRecordType");
  IMStringFromIMCloudKitSyncControllerSyncRecordType();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncControllerSyncType](self, "syncControllerSyncType");
  IMStringFromIMCloudKitSyncControllerSyncType();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState accountStatus](self, "accountStatus");
  IMStringFromIMCloudKitAccountStatus();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState syncErrors](self, "syncErrors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("%@, isFeatureEnabled: %@, isSyncing: %@, isEligibleForTruthzone %@, isSyncingEnabled: %@, isRemovedFromBackup: %@, isInExitState: %@, exitDate: %@, isStartingDisabledDisableDevice: %@, lastSyncDate: %@, isSyncingPaused: %@, startingChangingEnabledSetting: %@, isPaused: %@, syncControllerSyncState: %@, syncType: %@, syncStatus: %@, syncJobState: %@, syncControllerRecordType: %@, syncType: %@, accountStatus: %@, syncErrors: %@"), v34, v33, v32, v31, v30, v29, v28, v27, v26, v10, v25, v24, v13, v23, v14, v15,
    v16,
    v17,
    v18,
    v19,
    v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (void)setSyncingFinished
{
  NSObject *v3;
  uint8_t v4[16];

  -[IMDCKSyncState logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "syncing finished", v4, 2u);
  }

  -[IMDCKSyncState _startBatchChange](self, "_startBatchChange");
  -[IMDCKSyncState setStartingPeriodicSyncSetByCloudKitHooks:](self, "setStartingPeriodicSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setStartingInitialSyncSetByCloudKitHooks:](self, "setStartingInitialSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setSyncControllerSyncState:](self, "setSyncControllerSyncState:", 0);
  -[IMDCKSyncState setSyncControllerRecordType:](self, "setSyncControllerRecordType:", 0);
  -[IMDCKSyncState setSyncControllerSyncType:](self, "setSyncControllerSyncType:", 0);
  -[IMDCKSyncState setSyncStatus:](self, "setSyncStatus:", 0);
  -[IMDCKSyncState setSyncJobState:](self, "setSyncJobState:", 0);
  -[IMDCKSyncState _finishBatchChange](self, "_finishBatchChange");
}

- (void)clearLocalCloudKitSyncState
{
  NSObject *v3;
  uint8_t v4[16];

  -[IMDCKSyncState logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "clearing all sync states", v4, 2u);
  }

  -[IMDCKSyncState _startBatchChange](self, "_startBatchChange");
  -[IMDCKSyncState setSyncControllerSyncState:](self, "setSyncControllerSyncState:", 0);
  -[IMDCKSyncState setSyncControllerRecordType:](self, "setSyncControllerRecordType:", 0);
  -[IMDCKSyncState setSyncStatus:](self, "setSyncStatus:", 0);
  -[IMDCKSyncState setSyncJobState:](self, "setSyncJobState:", 0);
  -[IMDCKSyncState setSyncingPaused:](self, "setSyncingPaused:", 0);
  -[IMDCKSyncState setSyncCancelled:](self, "setSyncCancelled:", 0);
  -[IMDCKSyncState setStartingEnabledSettingChange:](self, "setStartingEnabledSettingChange:", 0);
  -[IMDCKSyncState setDisablingDevices:](self, "setDisablingDevices:", 0);
  -[IMDCKSyncState clearSyncErrors](self, "clearSyncErrors");
  -[IMDCKSyncState setStartingPeriodicSyncSetByCloudKitHooks:](self, "setStartingPeriodicSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setStartingInitialSyncSetByCloudKitHooks:](self, "setStartingInitialSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setSyncControllerSyncType:](self, "setSyncControllerSyncType:", 0);
  -[IMDCKSyncState setHasAvailableRecordsToDownload:](self, "setHasAvailableRecordsToDownload:", 0);
  -[IMDCKSyncState setLastDownloadProgress:](self, "setLastDownloadProgress:", 0.0);
  -[IMDCKSyncState _finishBatchChange](self, "_finishBatchChange");
}

- (void)_setStartingSync
{
  -[IMDCKSyncState setStartingPeriodicSyncSetByCloudKitHooks:](self, "setStartingPeriodicSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setStartingInitialSyncSetByCloudKitHooks:](self, "setStartingInitialSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState clearSyncErrors](self, "clearSyncErrors");
}

- (void)updateSyncType:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setSyncType_);
}

- (void)setStartingPeriodicSyncWithRecordType:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  -[IMDCKSyncState logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Set starting periodic sync", v6, 2u);
  }

  -[IMDCKSyncState _startBatchChange](self, "_startBatchChange");
  -[IMDCKSyncState _setStartingSync](self, "_setStartingSync");
  -[IMDCKSyncState setSyncControllerSyncType:](self, "setSyncControllerSyncType:", 2);
  -[IMDCKSyncState setSyncControllerSyncState:withRecordType:](self, "setSyncControllerSyncState:withRecordType:", 1, a3);
  -[IMDCKSyncState _finishBatchChange](self, "_finishBatchChange");
}

- (void)setStartingInitialSyncWithRecordType:(int64_t)a3
{
  NSObject *v5;
  uint8_t v6[16];

  -[IMDCKSyncState logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Set starting initial sync", v6, 2u);
  }

  -[IMDCKSyncState _startBatchChange](self, "_startBatchChange");
  -[IMDCKSyncState _setStartingSync](self, "_setStartingSync");
  -[IMDCKSyncState setSyncControllerSyncType:](self, "setSyncControllerSyncType:", 1);
  -[IMDCKSyncState setSyncControllerSyncState:withRecordType:](self, "setSyncControllerSyncState:withRecordType:", 1, a3);
  -[IMDCKSyncState _finishBatchChange](self, "_finishBatchChange");
}

- (void)setSyncControllerSyncState:(unint64_t)a3 withRecordType:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMDCKSyncState logHandle](self, "logHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    IMStringFromIMCloudKitSyncControllerSyncState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMStringFromIMCloudKitSyncControllerSyncRecordType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Setting controller sync type to %@ for record type: %@", (uint8_t *)&v10, 0x16u);

  }
  -[IMDCKSyncState _startBatchChange](self, "_startBatchChange");
  -[IMDCKSyncState setStartingPeriodicSyncSetByCloudKitHooks:](self, "setStartingPeriodicSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setStartingInitialSyncSetByCloudKitHooks:](self, "setStartingInitialSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setSyncControllerRecordType:](self, "setSyncControllerRecordType:", a4);
  -[IMDCKSyncState setSyncControllerSyncState:](self, "setSyncControllerSyncState:", a3);
  -[IMDCKSyncState _finishBatchChange](self, "_finishBatchChange");
}

- (void)keyValueCollection:(id)a3 willUpdateValues:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;
  _BOOL8 v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[IMDCKSyncState logHandle](self, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1D1667BF8((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = -[IMDCKSyncState isSyncing](self, "isSyncing");
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D37BC8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    LODWORD(v15) = -[IMDCKSyncState isSyncingEnabled](self, "isSyncingEnabled");
  }
  else
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "cloudKitSyncingEnabled");

    -[IMDCKSyncState setSyncingEnabled:](self, "setSyncingEnabled:", v15);
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isMessagesIniCloudVersion2");

  if (v18)
  {
    if ((_DWORD)v15)
    {
      v19 = -[IMDCKSyncState syncStatus](self, "syncStatus");
      goto LABEL_11;
    }
  }
  else if ((_DWORD)v15)
  {
    v19 = -[IMDCKSyncState syncControllerSyncState](self, "syncControllerSyncState");
LABEL_11:
    v20 = v19 != 0;
    if (v13 == v20)
      goto LABEL_20;
    goto LABEL_15;
  }
  if (!v13)
    goto LABEL_20;
  v20 = 0;
LABEL_15:
  -[IMDCKSyncState setSyncing:](self, "setSyncing:", v20);
  -[IMDCKSyncState setStartingPeriodicSyncSetByCloudKitHooks:](self, "setStartingPeriodicSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState setStartingInitialSyncSetByCloudKitHooks:](self, "setStartingInitialSyncSetByCloudKitHooks:", 0);
  -[IMDCKSyncState logHandle](self, "logHandle");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = CFSTR("NO");
    if (v20)
      v22 = CFSTR("YES");
    v26 = 138412290;
    v27 = v22;
    _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Updating syncing to: %@", (uint8_t *)&v26, 0xCu);
  }

LABEL_20:
  -[IMDCKSyncState delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[IMDCKSyncState delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syncStateWillUpdate:", self);

  }
  -[IMDCKSyncState setStartingEnabledSettingChange:](self, "setStartingEnabledSettingChange:", 0);

}

- (void)keyValueCollection:(id)a3 didUpdateValues:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;

  v5 = a4;
  -[IMDCKSyncState logHandle](self, "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1D1667C60((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  -[IMDCKSyncState delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[IMDCKSyncState delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncStateDidUpdate:", self);

  }
  -[IMDCKSyncState broadcastSyncState](self, "broadcastSyncState");

}

- (void)setErrorToAccountNeedsRepair
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[IMDCKSyncState logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Account in need of repair detected, setting sync error", v8, 2u);
  }

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D37B90];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("Account needs repair");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState addSyncError:](self, "addSyncError:", v7);

}

- (void)setErrorToKeyRollingError
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[IMDCKSyncState logHandle](self, "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Account in need of repair detected, setting sync error", v8, 2u);
  }

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0D37B90];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("Account needs repair");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDCKSyncState addSyncError:](self, "addSyncError:", v7);

}

- (IMDCKSyncStateDelegate)delegate
{
  return (IMDCKSyncStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSyncStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStatistics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
