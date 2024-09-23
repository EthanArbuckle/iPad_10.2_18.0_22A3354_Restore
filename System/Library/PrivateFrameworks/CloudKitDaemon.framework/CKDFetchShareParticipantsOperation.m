@implementation CKDFetchShareParticipantsOperation

- (CKDFetchShareParticipantsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchShareParticipantsOperation *v9;
  uint64_t v10;
  NSArray *userIdentityLookupInfos;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDFetchShareParticipantsOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_userIdentityLookupInfos(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    userIdentityLookupInfos = v9->_userIdentityLookupInfos;
    v9->_userIdentityLookupInfos = (NSArray *)v10;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-share-participants", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleFetchedInfo:(id)a3 withIdentity:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  void *inited;
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
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t isEqualToString;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  NSObject *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v57 = v8;
    v58 = 2112;
    v59 = v9;
    v60 = 2112;
    v61 = v10;
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "For fetch info %@, found user identity %@, error %@", buf, 0x20u);
  }
  objc_msgSend_shareParticipantFetchedBlock(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (v9)
    {
      v17 = objc_alloc(MEMORY[0x1E0C95130]);
      inited = (void *)objc_msgSend_initInternalWithUserIdentity_(v17, v18, (uint64_t)v9);
      objc_msgSend_userRecordID(v9, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orgAdminUserID(v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v25, v32, (uint64_t)v31);
      objc_msgSend_setIsOrgAdminUser_(inited, v34, isEqualToString);

      objc_msgSend_userRecordID(v9, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_container(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerScopedUserID(v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend_isEqualToString_(v40, v47, (uint64_t)v46);
      objc_msgSend_setIsCurrentUser_(inited, v49, v48);

    }
    else
    {
      inited = 0;
    }
    objc_msgSend_callbackQueue(self, v15, v16);
    v50 = objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = sub_1BEB0B498;
    v52[3] = &unk_1E782F4A8;
    v52[4] = self;
    v53 = v8;
    v54 = inited;
    v55 = v10;
    v51 = inited;
    dispatch_async(v50, v52);

  }
}

- (int)operationType
{
  return 401;
}

- (void)_fetchIdentities
{
  uint64_t v2;
  int v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id *v13;
  NSObject *v14;
  CKDPublicIdentityLookupRequest *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_usesBackgroundSession(self, a2, v2);
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v4)
    objc_msgSend_backgroundPublicIdentityLookupService(v7, v8, v9);
  else
    objc_msgSend_foregroundPublicIdentityLookupService(v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = (id *)MEMORY[0x1E0C952B0];
  v14 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v11;
    _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Got lookup service for identity fetch operation: %@", buf, 0xCu);
  }
  v15 = [CKDPublicIdentityLookupRequest alloc];
  objc_msgSend_userIdentityLookupInfos(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend_initWithOperation_lookupInfos_(v15, v19, (uint64_t)self, v18);
  objc_msgSend_setPendingRequest_(self, v21, (uint64_t)v20);

  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = sub_1BEB0B820;
  v41[3] = &unk_1E7833838;
  objc_copyWeak(&v42, &location);
  objc_msgSend_pendingRequest(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPerLookupInfoProgressBlock_(v25, v26, (uint64_t)v41);

  v39[0] = v22;
  v39[1] = 3221225472;
  v39[2] = sub_1BEB0B898;
  v39[3] = &unk_1E78309E8;
  objc_copyWeak(&v40, &location);
  objc_msgSend_pendingRequest(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLookupCompletionBlock_(v29, v30, (uint64_t)v39);

  if (*v12 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v31 = *v13;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_pendingRequest(self, v32, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v38;
    _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Scheduling a request %@ to the lookup service", buf, 0xCu);

  }
  objc_msgSend_pendingRequest(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduleRequest_(v11, v37, (uint64_t)v36);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint8_t v12[16];

  objc_msgSend_userIdentityLookupInfos(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Performing identities lookup with the lookup service", v12, 2u);
    }
    objc_msgSend__fetchIdentities(self, v10, v11);
  }
  else
  {
    objc_msgSend_finishWithError_(self, v8, 0);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setShareParticipantFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)finishWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setPendingRequest_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareParticipantsOperation;
  -[CKDOperation finishWithError:](&v6, sel_finishWithError_, v4);

}

- (id)shareParticipantFetchedBlock
{
  return self->_shareParticipantFetchedBlock;
}

- (void)setShareParticipantFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (CKDPublicIdentityLookupRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequest, a3);
}

- (NSArray)userIdentityLookupInfos
{
  return self->_userIdentityLookupInfos;
}

- (void)setUserIdentityLookupInfos:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityLookupInfos, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong(&self->_shareParticipantFetchedBlock, 0);
}

@end
