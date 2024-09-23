@implementation CKDFetchRecordPCSDiagnosticsOperation

- (CKDFetchRecordPCSDiagnosticsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchRecordPCSDiagnosticsOperation *v9;
  uint64_t v10;
  NSArray *zoneIDs;
  uint64_t v12;
  NSMutableArray *fetchedZones;
  uint64_t v14;
  NSMutableArray *mutableCorruptRecords;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchRecordPCSDiagnosticsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v17, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_recordZoneIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    zoneIDs = v9->_zoneIDs;
    v9->_zoneIDs = (NSArray *)v10;

    v12 = objc_opt_new();
    fetchedZones = v9->_fetchedZones;
    v9->_fetchedZones = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    mutableCorruptRecords = v9->_mutableCorruptRecords;
    v9->_mutableCorruptRecords = (NSMutableArray *)v14;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-record-pcs-diagnostics", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__checkRecordPCSForAllZones(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__fetchZones(self, v6, v7);
      break;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 2)
    return CFSTR("Fetching Zones");
  if (a3 == 3)
  {
    v5 = CFSTR("Checking Record PCS");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchRecordPCSDiagnosticsOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_checkRecordPCSForAllZones
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  CKDFetchRecordPCSDiagnosticsOperation *v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    objc_msgSend_fetchedZones(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_count(v7, v8, v9);
    objc_msgSend_fetchedZones(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v47 = v10;
    v48 = 2112;
    v49 = v13;
    _os_log_impl(&dword_1BE990000, v4, OS_LOG_TYPE_INFO, "Checking Record PCS for %ld zones: %@", buf, 0x16u);

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend_setFetchAllChanges_(v14, v15, 1);
  v39 = self;
  objc_msgSend_fetchedZones(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKeyPath_(v18, v19, (uint64_t)CFSTR("zoneID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = v20;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v41, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v42;
    v27 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v22);
        v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        v30 = (void *)objc_opt_new();
        objc_msgSend_setDesiredKeys_(v30, v31, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v21, v32, (uint64_t)v30, v29);

      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v33, (uint64_t)&v41, v45, 16);
    }
    while (v25);
  }

  objc_msgSend_setRecordZoneIDs_(v14, v34, (uint64_t)v22);
  objc_msgSend_setConfigurationsByRecordZoneID_(v14, v35, (uint64_t)v21);
  objc_msgSend_setForcePCSDecryptionAttempt_(v14, v36, 1);
  v37 = objc_opt_class();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = sub_1BEA4905C;
  v40[3] = &unk_1E782E508;
  v40[4] = v39;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(v39, v38, v37, v14, v40);

}

- (void)_fetchZones
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[5];

  v3 = (void *)objc_opt_new();
  objc_msgSend_zoneIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8) == 0;
  objc_msgSend_setIsFetchAllRecordZonesOperation_(v3, v10, v9);

  objc_msgSend_zoneIDs(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZoneIDs_(v3, v14, (uint64_t)v13);

  objc_msgSend_setIgnorePCSFailures_(v3, v15, 1);
  v16 = objc_opt_class();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1BEA493C8;
  v18[3] = &unk_1E782E508;
  v18[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v17, v16, v3, v18);

}

- (NSArray)corruptRecords
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_mutableCorruptRecords(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_copy(v3, v4, v5);

  return (NSArray *)v6;
}

- (void)main
{
  void *v3;
  const char *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  CKDFetchRecordPCSDiagnosticsOperation *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v7;
    v20 = 2048;
    v21 = self;
    v22 = 2114;
    v23 = v12;
    v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Starting fetch record PCS diagnostics operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);

  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_zoneIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v10, v11, v12))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1BEA499A4;
    v15[3] = &unk_1E78305B0;
    v16 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v15);

  }
  v14.receiver = self;
  v14.super_class = (Class)CKDFetchRecordPCSDiagnosticsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v14, sel__finishOnCallbackQueueWithError_, v4);

}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDs, a3);
}

- (NSMutableArray)fetchedZones
{
  return self->_fetchedZones;
}

- (void)setFetchedZones:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedZones, a3);
}

- (NSMutableArray)mutableCorruptRecords
{
  return self->_mutableCorruptRecords;
}

- (void)setMutableCorruptRecords:(id)a3
{
  objc_storeStrong((id *)&self->_mutableCorruptRecords, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCorruptRecords, 0);
  objc_storeStrong((id *)&self->_fetchedZones, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

@end
