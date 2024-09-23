@implementation IMCloudKitMockSyncState

- (id)convertToDictionary
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
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[15];
  _QWORD v37[17];

  v37[15] = *MEMORY[0x1E0C80C00];
  v36[0] = *MEMORY[0x1E0D37BC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitSyncingEnabled](self, "IMCloudKitSyncingEnabled"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  v36[1] = *MEMORY[0x1E0D37A88];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitIsSyncing](self, "IMCloudKitIsSyncing"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v34;
  v36[2] = *MEMORY[0x1E0D37A70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitIsEligibleForTruthZone](self, "IMCloudKitIsEligibleForTruthZone"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v33;
  v36[3] = *MEMORY[0x1E0D37A78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitIsInExitState](self, "IMCloudKitIsInExitState"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v32;
  v36[4] = *MEMORY[0x1E0D37A80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitIsRemovedFromBackup](self, "IMCloudKitIsRemovedFromBackup"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v31;
  v36[5] = *MEMORY[0x1E0D37B58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitStartingPeriodicSync](self, "IMCloudKitStartingPeriodicSync"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v30;
  v36[6] = *MEMORY[0x1E0D37B50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitStartingInitialSync](self, "IMCloudKitStartingInitialSync"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v29;
  v36[7] = *MEMORY[0x1E0D37B48];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMCloudKitMockSyncState IMCloudKitStartingEnabledSettingChange](self, "IMCloudKitStartingEnabledSettingChange"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v28;
  v36[8] = *MEMORY[0x1E0D37B40];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitStartingDisableDevices](self, "IMCloudKitStartingDisableDevices"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v27;
  v36[9] = *MEMORY[0x1E0D37B78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMCloudKitMockSyncState IMCloudKitSyncControllerSyncState](self, "IMCloudKitSyncControllerSyncState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v3;
  v36[10] = *MEMORY[0x1E0D37B80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMCloudKitMockSyncState IMCloudKitSyncControllerSyncType](self, "IMCloudKitSyncControllerSyncType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37[10] = v4;
  v36[11] = *MEMORY[0x1E0D37B70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMCloudKitMockSyncState IMCloudKitSyncControllerSyncRecordType](self, "IMCloudKitSyncControllerSyncRecordType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[11] = v5;
  v36[12] = *MEMORY[0x1E0D37BA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMCloudKitMockSyncState IMCloudKitSyncPaused](self, "IMCloudKitSyncPaused"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[12] = v6;
  v36[13] = *MEMORY[0x1E0D37BB8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMCloudKitMockSyncState IMCloudKitSyncStatus](self, "IMCloudKitSyncStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[13] = v7;
  v36[14] = *MEMORY[0x1E0D37BA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IMCloudKitMockSyncState IMCloudKitSyncJobState](self, "IMCloudKitSyncJobState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[14] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  -[IMCloudKitMockSyncState IMCloudKitSyncDate](self, "IMCloudKitSyncDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IMCloudKitMockSyncState IMCloudKitSyncDate](self, "IMCloudKitSyncDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x1E0D37B88]);

  }
  -[IMCloudKitMockSyncState IMCloudKitFullSyncCompletedDate](self, "IMCloudKitFullSyncCompletedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else
  {
    -[IMCloudKitMockSyncState IMCloudKitFullPartialSyncCompletedDate](self, "IMCloudKitFullPartialSyncCompletedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_11;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMCloudKitMockSyncState IMCloudKitFullPartialSyncCompletedDate](self, "IMCloudKitFullPartialSyncCompletedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[IMCloudKitMockSyncState IMCloudKitFullPartialSyncCompletedDate](self, "IMCloudKitFullPartialSyncCompletedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v19, *MEMORY[0x1E0D37A10]);
  }
  -[IMCloudKitMockSyncState IMCloudKitFullSyncCompletedDate](self, "IMCloudKitFullSyncCompletedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[IMCloudKitMockSyncState IMCloudKitFullSyncCompletedDate](self, "IMCloudKitFullSyncCompletedDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setObject:forKey:", v23, *MEMORY[0x1E0D37A28]);
  }
  objc_msgSend(v10, "setObject:forKey:", v15, *MEMORY[0x1E0D378E0]);

LABEL_11:
  -[IMCloudKitMockSyncState IMCloudKitSyncErrors](self, "IMCloudKitSyncErrors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[IMCloudKitMockSyncState IMCloudKitSyncErrors](self, "IMCloudKitSyncErrors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v25, *MEMORY[0x1E0D37B98]);

  }
  return v10;
}

- (BOOL)IMCloudKitSyncingEnabled
{
  return self->_IMCloudKitSyncingEnabled;
}

- (void)setIMCloudKitSyncingEnabled:(BOOL)a3
{
  self->_IMCloudKitSyncingEnabled = a3;
}

- (BOOL)IMCloudKitIsSyncing
{
  return self->_IMCloudKitIsSyncing;
}

- (void)setIMCloudKitIsSyncing:(BOOL)a3
{
  self->_IMCloudKitIsSyncing = a3;
}

- (unint64_t)IMCloudKitSyncStatus
{
  return self->_IMCloudKitSyncStatus;
}

- (void)setIMCloudKitSyncStatus:(unint64_t)a3
{
  self->_IMCloudKitSyncStatus = a3;
}

- (unint64_t)IMCloudKitSyncJobState
{
  return self->_IMCloudKitSyncJobState;
}

- (void)setIMCloudKitSyncJobState:(unint64_t)a3
{
  self->_IMCloudKitSyncJobState = a3;
}

- (BOOL)IMCloudKitSyncPaused
{
  return self->_IMCloudKitSyncPaused;
}

- (void)setIMCloudKitSyncPaused:(BOOL)a3
{
  self->_IMCloudKitSyncPaused = a3;
}

- (BOOL)IMCloudKitIsEligibleForTruthZone
{
  return self->_IMCloudKitIsEligibleForTruthZone;
}

- (void)setIMCloudKitIsEligibleForTruthZone:(BOOL)a3
{
  self->_IMCloudKitIsEligibleForTruthZone = a3;
}

- (BOOL)IMCloudKitIsInExitState
{
  return self->_IMCloudKitIsInExitState;
}

- (void)setIMCloudKitIsInExitState:(BOOL)a3
{
  self->_IMCloudKitIsInExitState = a3;
}

- (BOOL)IMCloudKitIsRemovedFromBackup
{
  return self->_IMCloudKitIsRemovedFromBackup;
}

- (void)setIMCloudKitIsRemovedFromBackup:(BOOL)a3
{
  self->_IMCloudKitIsRemovedFromBackup = a3;
}

- (NSDate)IMCloudKitSyncDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIMCloudKitSyncDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)IMCloudKitFullSyncCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIMCloudKitFullSyncCompletedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)IMCloudKitFullPartialSyncCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIMCloudKitFullPartialSyncCompletedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)IMCloudKitStartingPeriodicSync
{
  return self->_IMCloudKitStartingPeriodicSync;
}

- (void)setIMCloudKitStartingPeriodicSync:(BOOL)a3
{
  self->_IMCloudKitStartingPeriodicSync = a3;
}

- (BOOL)IMCloudKitStartingInitialSync
{
  return self->_IMCloudKitStartingInitialSync;
}

- (void)setIMCloudKitStartingInitialSync:(BOOL)a3
{
  self->_IMCloudKitStartingInitialSync = a3;
}

- (int64_t)IMCloudKitStartingEnabledSettingChange
{
  return self->_IMCloudKitStartingEnabledSettingChange;
}

- (void)setIMCloudKitStartingEnabledSettingChange:(int64_t)a3
{
  self->_IMCloudKitStartingEnabledSettingChange = a3;
}

- (BOOL)IMCloudKitStartingDisableDevices
{
  return self->_IMCloudKitStartingDisableDevices;
}

- (void)setIMCloudKitStartingDisableDevices:(BOOL)a3
{
  self->_IMCloudKitStartingDisableDevices = a3;
}

- (unint64_t)IMCloudKitSyncControllerSyncState
{
  return self->_IMCloudKitSyncControllerSyncState;
}

- (void)setIMCloudKitSyncControllerSyncState:(unint64_t)a3
{
  self->_IMCloudKitSyncControllerSyncState = a3;
}

- (int64_t)IMCloudKitSyncControllerSyncType
{
  return self->_IMCloudKitSyncControllerSyncType;
}

- (void)setIMCloudKitSyncControllerSyncType:(int64_t)a3
{
  self->_IMCloudKitSyncControllerSyncType = a3;
}

- (int64_t)IMCloudKitSyncControllerSyncRecordType
{
  return self->_IMCloudKitSyncControllerSyncRecordType;
}

- (void)setIMCloudKitSyncControllerSyncRecordType:(int64_t)a3
{
  self->_IMCloudKitSyncControllerSyncRecordType = a3;
}

- (NSArray)IMCloudKitSyncErrors
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIMCloudKitSyncErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IMCloudKitSyncErrors, 0);
  objc_storeStrong((id *)&self->_IMCloudKitFullPartialSyncCompletedDate, 0);
  objc_storeStrong((id *)&self->_IMCloudKitFullSyncCompletedDate, 0);
  objc_storeStrong((id *)&self->_IMCloudKitSyncDate, 0);
}

@end
