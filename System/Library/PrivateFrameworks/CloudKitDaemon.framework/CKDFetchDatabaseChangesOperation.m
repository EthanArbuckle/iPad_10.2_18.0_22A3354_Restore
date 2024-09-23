@implementation CKDFetchDatabaseChangesOperation

- (BOOL)shouldReturnServerChangeTokensToAdopter
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_useAnonymousToServerShareParticipants(v7, v8, v9))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend_databaseScope(self, v10, v11);

  if (v12 != 3)
  {
LABEL_8:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = (void *)*MEMORY[0x1E0C952B0];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO);
  if (v14)
  {
    v15 = v13;
    objc_msgSend_operationID(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Not returning metasync token in shared db to adopter using anonymous-to-server share participants for operation %@", (uint8_t *)&v20, 0xCu);

    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)setServerChangeTokenUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void)setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void)setRecordZoneWithIDChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setNumRequestsSent:(unint64_t)a3
{
  self->_numRequestsSent = a3;
}

- (id)serverChangeTokenUpdatedBlock
{
  return self->_serverChangeTokenUpdatedBlock;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (NSMutableArray)requestInfos
{
  return self->_requestInfos;
}

- (id)recordZoneWithIDWasPurgedBlock
{
  return self->_recordZoneWithIDWasPurgedBlock;
}

- (id)recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock
{
  return self->_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock;
}

- (id)recordZoneWithIDWasDeletedBlock
{
  return self->_recordZoneWithIDWasDeletedBlock;
}

- (id)recordZoneWithIDChangedBlock
{
  return self->_recordZoneWithIDChangedBlock;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (NSString)pipeliningDescription
{
  return (NSString *)CFSTR("fetchAllDatabaseChanges");
}

- (int)operationType
{
  return 203;
}

- (unint64_t)numRequestsSent
{
  return self->_numRequestsSent;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_msgSend_previousServerChangeToken(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendFetchDatabaseChangesRequestWithChangeToken_previousRequestSchedulerInfo_(self, v8, (uint64_t)v7, 0);

  objc_initWeak(&location, self);
  objc_msgSend_fetchZonesGroup(self, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualityOfService(self, v12, v13);
  CKGetGlobalQueue();
  v14 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BE9C4658;
  v15[3] = &unk_1E782EF38;
  objc_copyWeak(&v16, &location);
  dispatch_group_notify(v11, v14, v15);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (CKDFetchDatabaseChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDFetchDatabaseChangesOperation *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  CKServerChangeToken *previousServerChangeToken;
  const char *v28;
  uint64_t v29;
  dispatch_group_t v30;
  OS_dispatch_group *fetchZonesGroup;
  uint64_t v32;
  NSMutableArray *requestInfos;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CKDFetchDatabaseChangesOperation;
  v10 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v35, sel_initWithOperationInfo_container_, v6, v7);
  if (v10)
  {
    objc_msgSend_options(v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_useAnonymousToServerShareParticipants(v11, v12, v13))
    {
      v16 = objc_msgSend_databaseScope(v10, v14, v15);

      if (v16 == 3)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v19 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          v22 = v19;
          objc_msgSend_operationID(v10, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v25;
          _os_log_impl(&dword_1BE990000, v22, OS_LOG_TYPE_INFO, "Ignoring initial metasync token in shared db from adopter using anonymous-to-server share participants for operation %@", buf, 0xCu);

        }
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend_previousServerChangeToken(v6, v17, v18);
    v26 = objc_claimAutoreleasedReturnValue();
    previousServerChangeToken = v10->_previousServerChangeToken;
    v10->_previousServerChangeToken = (CKServerChangeToken *)v26;

LABEL_10:
    v10->_resultsLimit = objc_msgSend_resultsLimit(v6, v20, v21);
    v10->_fetchAllChanges = objc_msgSend_fetchAllChanges(v6, v28, v29);
    v10->_numRequestsSent = 0;
    v30 = dispatch_group_create();
    fetchZonesGroup = v10->_fetchZonesGroup;
    v10->_fetchZonesGroup = (OS_dispatch_group *)v30;

    v32 = objc_opt_new();
    requestInfos = v10->_requestInfos;
    v10->_requestInfos = (NSMutableArray *)v32;

  }
  return v10;
}

- (OS_dispatch_group)fetchZonesGroup
{
  return self->_fetchZonesGroup;
}

- (BOOL)fetchAllChanges
{
  return self->_fetchAllChanges;
}

- (id)analyticsPayload
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t AllChanges;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKDFetchDatabaseChangesOperation;
  -[CKDDatabaseOperation analyticsPayload](&v26, sel_analyticsPayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_previousServerChangeToken(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(v4, v8, v7 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, 0x1E784B688);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  AllChanges = objc_msgSend_fetchAllChanges(self, v12, v13);
  objc_msgSend_numberWithBool_(v11, v15, AllChanges);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, 0x1E784B5E8);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  v21 = objc_msgSend_resultsLimit(self, v19, v20);
  objc_msgSend_numberWithUnsignedInteger_(v18, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, 0x1E784B6A8);

  return v3;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-changed-record-zones", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_sendFetchDatabaseChangesRequestWithChangeToken:(id)a3 previousRequestSchedulerInfo:(id)a4
{
  id v6;
  NSObject *v7;
  CKDFetchDatabaseChangesURLRequest *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  CKDPipeliningInfo *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  char v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  id *v71;
  id *v72;
  void *v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  char v95;
  id from;
  id location;
  uint8_t buf[4];
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v73 = v6;
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v99 = v74;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "Fetching database changes from the server with change token %{public}@", buf, 0xCu);
  }
  v8 = [CKDFetchDatabaseChangesURLRequest alloc];
  v10 = (void *)objc_msgSend_initWithOperation_previousServerChangeTokenData_(v8, v9, (uint64_t)self, v74);
  v13 = objc_msgSend_resultsLimit(self, v11, v12);
  objc_msgSend_setResultsLimit_(v10, v14, v13);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v10);
  v15 = [CKDPipeliningInfo alloc];
  v17 = (void *)objc_msgSend_initWithRequest_operation_(v15, v16, (uint64_t)v10, self);
  objc_msgSend_requestInfos(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v20, v21, (uint64_t)v17);

  objc_initWeak(&from, v17);
  if (!objc_msgSend_fetchAllChanges(self, v22, v23)
    || (objc_msgSend_request(self, v24, v25),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = v26 == 0,
        v26,
        v27))
  {
    v28 = 0;
  }
  else
  {
    objc_msgSend_suspendCallbackQueue(v17, v24, v25);
    v28 = 1;
  }
  objc_msgSend_fetchZonesGroup(self, v24, v25);
  v29 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v29);

  objc_msgSend_perRequestGroup(v17, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v32);

  if (v73)
  {
    objc_msgSend_perRequestGroup(v73, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = (uint64_t)dispatch_group_create();
  }
  v36 = (void *)v35;
  v37 = MEMORY[0x1E0C809B0];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = sub_1BE9C5EF8;
  v90[3] = &unk_1E7830998;
  v71 = &v92;
  objc_copyWeak(&v92, (id *)buf);
  objc_copyWeak(&v93, &location);
  objc_copyWeak(&v94, &from);
  v38 = v36;
  v91 = v38;
  v95 = v28;
  objc_msgSend_setCompletionBlock_(v10, v39, (uint64_t)v90);
  objc_msgSend_recordZoneWithIDChangedBlock(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v87[0] = v37;
    v87[1] = 3221225472;
    v87[2] = sub_1BEBD9FA4;
    v87[3] = &unk_1E7836CE8;
    objc_copyWeak(&v88, (id *)buf);
    objc_copyWeak(&v89, &from);
    objc_msgSend_setZoneChangedBlock_(v10, v45, (uint64_t)v87, &v92);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&v88);
  }
  objc_msgSend_recordZoneWithIDWasDeletedBlock(self, v43, v44, v71);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v84[0] = v37;
    v84[1] = 3221225472;
    v84[2] = sub_1BEBDA188;
    v84[3] = &unk_1E7836CE8;
    objc_copyWeak(&v85, (id *)buf);
    objc_copyWeak(&v86, &from);
    objc_msgSend_setZoneDeletedBlock_(v10, v49, (uint64_t)v84);
    objc_destroyWeak(&v86);
    objc_destroyWeak(&v85);
  }
  objc_msgSend_recordZoneWithIDWasPurgedBlock(self, v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v81[0] = v37;
    v81[1] = 3221225472;
    v81[2] = sub_1BEBDA398;
    v81[3] = &unk_1E7836CE8;
    objc_copyWeak(&v82, (id *)buf);
    objc_copyWeak(&v83, &from);
    objc_msgSend_setZonePurgedBlock_(v10, v53, (uint64_t)v81);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&v82);
  }
  objc_msgSend_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock(self, v51, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    v78[0] = v37;
    v78[1] = 3221225472;
    v78[2] = sub_1BEBDA5A8;
    v78[3] = &unk_1E7836CE8;
    objc_copyWeak(&v79, (id *)buf);
    objc_copyWeak(&v80, &from);
    objc_msgSend_setZoneDeletedDueToEncryptedDataResetBlock_(v10, v57, (uint64_t)v78);
    objc_destroyWeak(&v80);
    objc_destroyWeak(&v79);
  }
  objc_msgSend_container(self, v55, v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_useAnonymousToServerShareParticipants(v61, v62, v63);

  if (v64)
  {
    v75[0] = v37;
    v75[1] = 3221225472;
    v75[2] = sub_1BEBDA7B8;
    v75[3] = &unk_1E7836D10;
    objc_copyWeak(&v76, (id *)buf);
    objc_copyWeak(&v77, &from);
    objc_msgSend_setAnonymousShareProcessingBlock_(v10, v66, (uint64_t)v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v76);
  }
  objc_msgSend_setRequest_(self, v65, (uint64_t)v10);
  objc_msgSend_container(self, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v69, v70, (uint64_t)v10);

  objc_destroyWeak(&v94);
  objc_destroyWeak(&v93);
  objc_destroyWeak(v72);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

- (void)_handleFetchDatabaseChangesRequestFinishedWithSchedulerInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;

  v4 = a3;
  objc_msgSend_request(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequest_(v4, v8, 0);
  objc_msgSend_serverChangeTokenData(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = objc_alloc(MEMORY[0x1E0C95100]);
    objc_msgSend_serverChangeTokenData(v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithData_(v14, v18, (uint64_t)v17);

  }
  v19 = objc_msgSend_status(v7, v12, v13);
  objc_msgSend_fetchZonesGroup(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v22);

  objc_msgSend_perRequestCallbackGroup(v4, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_perRequestCallbackQueue(v4, v26, v27);
  v28 = objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BE9C0960;
  v31[3] = &unk_1E7836470;
  v31[4] = self;
  v32 = v11;
  v33 = v4;
  v34 = v19;
  v29 = v4;
  v30 = v11;
  dispatch_group_notify(v25, v28, v31);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend_setRecordZoneWithIDChangedBlock_(self, v5, 0);
  objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(self, v6, 0);
  objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(self, v7, 0);
  objc_msgSend_setRecordZoneWithIDWasDeletedDueToEncryptedDataResetBlock_(self, v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)CKDFetchDatabaseChangesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v9, sel__finishOnCallbackQueueWithError_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfos, 0);
  objc_storeStrong((id *)&self->_fetchZonesGroup, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong(&self->_serverChangeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
}

- (void)_handleAnonymousZoneDataObjects:(id)a3 schedulerInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  id obj;
  _QWORD v34[4];
  id v35;
  CKDFetchDatabaseChangesOperation *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v30 = v8;
    LODWORD(location[0]) = 134217984;
    *(id *)((char *)location + 4) = (id)objc_msgSend_count(v6, v31, v32);
    _os_log_debug_impl(&dword_1BE990000, v30, OS_LOG_TYPE_DEBUG, "Handling encrypted anonymous share processing for: %lu number of anonymous zone data objects", (uint8_t *)location, 0xCu);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v39, v43, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend_fetchZonesGroup(self, v10, v11);
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v16);

        objc_msgSend_perRequestCallbackGroup(v7, v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v19);

        objc_initWeak(location, self);
        objc_msgSend_container(self, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anonymousSharingManager(v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encryptedTupleData(v15, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = sub_1BEBDAC40;
        v34[3] = &unk_1E7836D60;
        v35 = v7;
        v36 = self;
        objc_copyWeak(&v38, location);
        v37 = v15;
        objc_msgSend_decryptShareTuple_withCompletionBlock_(v25, v29, (uint64_t)v28, v34);

        objc_destroyWeak(&v38);
        objc_destroyWeak(location);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v39, v43, 16);
    }
    while (v12);
  }

}

- (void)setPreviousServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, a3);
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  self->_fetchAllChanges = a3;
}

- (void)setFetchZonesGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchZonesGroup, a3);
}

- (void)setRequestInfos:(id)a3
{
  objc_storeStrong((id *)&self->_requestInfos, a3);
}

@end
