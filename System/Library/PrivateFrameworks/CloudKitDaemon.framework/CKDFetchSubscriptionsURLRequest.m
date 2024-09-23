@implementation CKDFetchSubscriptionsURLRequest

- (CKDFetchSubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionIDs:(id)a4
{
  id v7;
  CKDFetchSubscriptionsURLRequest *v8;
  CKDFetchSubscriptionsURLRequest *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *subscriptions;
  uint64_t v14;
  NSMutableDictionary *subscriptionIDByRequestID;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchSubscriptionsURLRequest;
  v8 = -[CKDURLRequest initWithOperation:](&v17, sel_initWithOperation_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_subscriptionIDs, a4);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v12;

    v14 = objc_opt_new();
    subscriptionIDByRequestID = v9->_subscriptionIDByRequestID;
    v9->_subscriptionIDByRequestID = (NSMutableDictionary *)v14;

  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDFetchSubscriptionsURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v12, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_subscriptionIDs(self, v6, v7, v12.receiver, v12.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, (uint64_t)v10, CFSTR("ids"));
}

- (id)zoneIDsToLock
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultRecordZone(MEMORY[0x1E0C95088], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  const char *v48;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_subscriptionIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend_subscriptionIDs(self, v10, v11);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v51, v55, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v52;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v18);
          v20 = objc_msgSend_operationType(self, v14, v15);
          objc_msgSend_operationRequestWithType_(self, v21, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_opt_new();
          objc_msgSend_setSubscriptionRetrieveRequest_(v22, v24, (uint64_t)v23);

          objc_msgSend_CKDPIdentifier_Subscription(v19, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptionRetrieveRequest(v22, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setIdentifier_(v30, v31, (uint64_t)v27);

          objc_msgSend_addObject_(v3, v32, (uint64_t)v22);
          objc_msgSend_subscriptionIDByRequestID(self, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v22, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationUUID(v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v35, v42, (uint64_t)v19, v41);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v51, v55, 16);
      }
      while (v16);
    }

  }
  else
  {
    v43 = objc_msgSend_operationType(self, v10, v11);
    objc_msgSend_operationRequestWithType_(self, v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_opt_new();
    objc_msgSend_setSubscriptionRetrieveRequest_(v45, v47, (uint64_t)v46);

    objc_msgSend_addObject_(v3, v48, (uint64_t)v45);
  }
  return v3;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void (**v33)(id, void *, void *, void *);
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  int hasError;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void (**v70)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void (**v77)(_QWORD, _QWORD);
  const char *v78;
  uint64_t v79;
  void *v80;
  __int128 v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_hasSubscriptionRetrieveResponse(v4, v5, v6))
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v83 = v4;
    objc_msgSend_subscriptionRetrieveResponse(v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subscriptions(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v85, v93, 16);
    if (!v14)
    {
      v19 = 0;
      goto LABEL_25;
    }
    v18 = v14;
    v19 = 0;
    v20 = *(_QWORD *)v86;
    *(_QWORD *)&v17 = 138543618;
    v82 = v17;
    while (1)
    {
      v21 = 0;
      do
      {
        v22 = v19;
        if (*(_QWORD *)v86 != v20)
          objc_enumerationMutation(v12);
        v23 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v21);
        objc_msgSend_translator(self, v15, v16, v82);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v19;
        objc_msgSend_subscriptionFromPSubscription_error_(v24, v25, v23, &v84);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v84;

        if (v26)
        {
          objc_msgSend_addObject_(self->_subscriptions, v27, (uint64_t)v26);
          objc_msgSend_subscriptionFetchedBlock(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            goto LABEL_14;
          objc_msgSend_subscriptionFetchedBlock(self, v31, v32);
          v33 = (void (**)(id, void *, void *, void *))objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptionID(v26, v34, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_result(v83, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v33[2](v33, v26, v36, v39);

          goto LABEL_10;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v40 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v33 = v40;
          objc_msgSend_localizedDescription(v19, v41, v42);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v82;
          v90 = v36;
          v91 = 2112;
          v92 = v23;
          _os_log_error_impl(&dword_1BE990000, (os_log_t)v33, OS_LOG_TYPE_ERROR, "Unable to read subscription object, discarding: %{public}@: %@", buf, 0x16u);
LABEL_10:

        }
LABEL_14:

        ++v21;
      }
      while (v18 != v21);
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v85, v93, 16);
      v18 = v43;
      if (!v43)
      {
LABEL_25:

        v4 = v83;
        goto LABEL_29;
      }
    }
  }
  objc_msgSend_result(v4, v7, v8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  hasError = objc_msgSend_hasError(v44, v45, v46);

  if (hasError)
  {
    objc_msgSend_subscriptionIDs(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_count(v50, v51, v52);

    if (v53)
    {
      objc_msgSend_subscriptionIDByRequestID(self, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_response(v4, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationUUID(v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v56, v63, (uint64_t)v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_subscriptionFetchedBlock(self, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67)
      {
        objc_msgSend_subscriptionFetchedBlock(self, v68, v69);
        v70 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *, void *))v70)[2](v70, 0, v64, v73);

      }
    }
    else
    {
      objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v54, v55);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (v74)
      {
        objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v75, v76);
        v77 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v77)[2](v77, v80);

      }
    }
  }
  v19 = 0;
LABEL_29:

  return v19;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void (**v20)(_QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;

  v35 = a3;
  objc_msgSend_subscriptionIDs(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    objc_msgSend_subscriptionIDByRequestID(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_response(v35, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationUUID(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v19, (uint64_t)v18);
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend_subscriptionFetchedBlock(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend_subscriptionFetchedBlock(self, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v35, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void (**)(_QWORD, _QWORD), void *))v26)[2](v26, 0, v20, v29);

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v10, v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v31, v32);
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v35, v33, v34);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v20[2](v20, v26);
    goto LABEL_6;
  }
LABEL_8:

}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (id)subscriptionFetchedBlock
{
  return self->_subscriptionFetchedBlock;
}

- (void)setSubscriptionFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)errorFetchingAllSubscriptionsBlock
{
  return self->_errorFetchingAllSubscriptionsBlock;
}

- (void)setErrorFetchingAllSubscriptionsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDs, a3);
}

- (NSMutableDictionary)subscriptionIDByRequestID
{
  return self->_subscriptionIDByRequestID;
}

- (void)setSubscriptionIDByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDByRequestID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDByRequestID, 0);
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_errorFetchingAllSubscriptionsBlock, 0);
  objc_storeStrong(&self->_subscriptionFetchedBlock, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
