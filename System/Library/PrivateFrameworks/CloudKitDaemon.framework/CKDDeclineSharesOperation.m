@implementation CKDDeclineSharesOperation

- (CKDDeclineSharesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  CKDDeclineSharesOperation *v7;
  uint64_t v8;
  NSMutableDictionary *clientProvidedMetadatasByURL;
  uint64_t v10;
  NSMutableArray *shareURLsToDecline;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSMutableArray *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CKDDeclineSharesOperation;
  v7 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v43, sel_initWithOperationInfo_container_, v6, a4);
  if (v7)
  {
    v8 = objc_opt_new();
    clientProvidedMetadatasByURL = v7->_clientProvidedMetadatasByURL;
    v7->_clientProvidedMetadatasByURL = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    shareURLsToDecline = v7->_shareURLsToDecline;
    v7->_shareURLsToDecline = (NSMutableArray *)v10;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = v6;
    objc_msgSend_shareMetadatasToDecline(v6, v12, v13);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v39, v44, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v22 = v7->_clientProvidedMetadatasByURL;
          objc_msgSend_share(v21, v16, v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_URL(v23, v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v21, v26);

          v28 = v7->_shareURLsToDecline;
          objc_msgSend_share(v21, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_URL(v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v28, v35, (uint64_t)v34);

        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v39, v44, 16);
      }
      while (v18);
    }

    v6 = v37;
  }

  return v7;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/decline-shares", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  BOOL v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_shareURLsToDecline(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_count(v7, v8, v9);

    if (v10)
    {
      v12 = 1;
      objc_msgSend_setState_(self, v11, 1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (v4 == 1)
    {
      objc_msgSend_setState_(self, v5, 2);
      return MEMORY[0x1E0DE7D20](self, sel__declineShares, v13);
    }
    return 1;
  }
  return v12;
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
  {
    v5 = CFSTR("Declining Shares");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDDeclineSharesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend_shareURLsToDecline(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v6);

  objc_msgSend_clientProvidedMetadatasByURL(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v14, v15, (uint64_t)v6);

  objc_msgSend_callbackQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB45B80;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v22 = v6;
  v23 = v7;
  v19 = v7;
  v20 = v6;
  dispatch_async(v18, block);

}

- (void)_handleShareURLDeclined:(id)a3 responseCode:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v6;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Share with URL %@ was successfully declined", buf, 0xCu);
    }
    objc_msgSend__performCallbackForURL_error_(self, v13, (uint64_t)v6, 0);
  }
  else
  {
    objc_msgSend_error(v7, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clientError(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_type(v17, v18, v19);

    v21 = (void *)*MEMORY[0x1E0C952F8];
    v22 = *MEMORY[0x1E0C95300];
    if (v20 == 7)
    {
      if (v22 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v21);
      v23 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v6;
        _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Zone busy failure for share with url %@.", buf, 0xCu);
      }
    }
    else
    {
      if (v22 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v21);
      v24 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        objc_msgSend_error(v7, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDescription(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v6;
        v50 = 2114;
        v51 = v31;
        _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "Error declining share with URL %@: %{public}@", buf, 0x16u);

      }
      v32 = (void *)MEMORY[0x1E0C94FF8];
      v33 = *MEMORY[0x1E0C94B20];
      v34 = sub_1BEB10D5C(v7);
      objc_msgSend_request(self, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v37, v7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v7, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v45, v33, v34, v38, CFSTR("Error declining share %@: %@"), v6, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__performCallbackForURL_error_(self, v47, (uint64_t)v6, v46);
    }
  }

}

- (int)operationType
{
  return 221;
}

- (BOOL)_declineShares
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  CKDDeclineSharesURLRequest *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  NSObject *v65;
  NSObject *v66;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id from;
  id location[2];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToDecline(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_container(self, v8, v9);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend_clientProvidedMetadatasByURL(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v77, v81, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v78 != v18)
            objc_enumerationMutation(v13);
          v20 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend_clientProvidedMetadatasByURL(self, v15, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v22, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_participantRole(v23, v24, v25) != 4)
          {
            v26 = (void *)objc_opt_new();
            objc_msgSend_setShareURL_(v26, v27, v20);
            objc_msgSend_share(v23, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_recordID(v30, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setShareRecordID_(v26, v34, (uint64_t)v33);

            objc_msgSend_options(v69, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v33) = objc_msgSend_useAnonymousToServerShareParticipants(v37, v38, v39);

            if ((_DWORD)v33)
            {
              objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v40, v41);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, self, CFSTR("CKDDeclineSharesOperation.m"), 139, CFSTR("Anonymous to Apple shares not supported by decline"));

            }
            objc_msgSend_callingParticipant(v23, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_participantID(v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setParticipantID_(v26, v46, (uint64_t)v45);

            objc_msgSend_addObject_(v10, v47, (uint64_t)v26);
          }

        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v77, v81, 16);
      }
      while (v17);
    }

    v52 = objc_msgSend_count(v10, v50, v51);
    v53 = v52 != 0;
    if (v52)
    {
      v54 = [CKDDeclineSharesURLRequest alloc];
      v56 = (void *)objc_msgSend_initWithOperation_shareMetadatasToDecline_(v54, v55, (uint64_t)self, v10);
      objc_initWeak(location, self);
      objc_initWeak(&from, v56);
      objc_msgSend_stateTransitionGroup(self, v57, v58);
      v59 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v59);

      v60 = MEMORY[0x1E0C809B0];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = sub_1BEB46420;
      v73[3] = &unk_1E782E440;
      objc_copyWeak(&v74, location);
      objc_msgSend_setShareDeclinedBlock_(v56, v61, (uint64_t)v73);
      v70[0] = v60;
      v70[1] = 3221225472;
      v70[2] = sub_1BEB46484;
      v70[3] = &unk_1E782E468;
      objc_copyWeak(&v71, location);
      objc_copyWeak(&v72, &from);
      objc_msgSend_setCompletionBlock_(v56, v62, (uint64_t)v70);
      objc_msgSend_setRequest_(self, v63, (uint64_t)v56);
      objc_msgSend_performRequest_(v69, v64, (uint64_t)v56);
      objc_destroyWeak(&v72);
      objc_destroyWeak(&v71);
      objc_destroyWeak(&v74);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v66 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1BE990000, v66, OS_LOG_TYPE_INFO, "No shares to decline", (uint8_t *)location, 2u);
      }
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v65 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BE990000, v65, OS_LOG_TYPE_INFO, "No shares to decline", (uint8_t *)location, 2u);
    }
    return 0;
  }
  return v53;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;

  objc_msgSend_shareURLsToDecline(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setDeclineCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDDeclineSharesOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)declineCompletionBlock
{
  return self->_declineCompletionBlock;
}

- (void)setDeclineCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSMutableDictionary)clientProvidedMetadatasByURL
{
  return self->_clientProvidedMetadatasByURL;
}

- (void)setClientProvidedMetadatasByURL:(id)a3
{
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, a3);
}

- (NSMutableArray)shareURLsToDecline
{
  return self->_shareURLsToDecline;
}

- (void)setShareURLsToDecline:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToDecline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLsToDecline, 0);
  objc_storeStrong((id *)&self->_clientProvidedMetadatasByURL, 0);
  objc_storeStrong(&self->_declineCompletionBlock, 0);
}

@end
