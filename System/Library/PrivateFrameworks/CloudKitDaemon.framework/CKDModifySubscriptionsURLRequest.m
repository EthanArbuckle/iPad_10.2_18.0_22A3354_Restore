@implementation CKDModifySubscriptionsURLRequest

- (CKDModifySubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToDelete:(id)a5
{
  id v9;
  id v10;
  CKDModifySubscriptionsURLRequest *v11;
  CKDModifySubscriptionsURLRequest *v12;
  uint64_t v13;
  NSMutableDictionary *subscriptionIDByRequestID;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKDModifySubscriptionsURLRequest;
  v11 = -[CKDURLRequest initWithOperation:](&v16, sel_initWithOperation_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subscriptionsToSave, a4);
    objc_storeStrong((id *)&v12->_subscriptionIDsToDelete, a5);
    v13 = objc_opt_new();
    subscriptionIDByRequestID = v12->_subscriptionIDByRequestID;
    v12->_subscriptionIDByRequestID = (NSMutableDictionary *)v13;

  }
  return v12;
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
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CKDModifySubscriptionsURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v21, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_subscriptionsToSave(self, v6, v7, v21.receiver, v21.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1E78334C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, CFSTR("modifyIDs"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_subscriptionIDsToDelete(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v14, v18, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v4, v20, (uint64_t)v19, CFSTR("deleteIDs"));
}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_subscriptionsToSave(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_zoneID(v14, v15, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_12;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend_zoneID(v14, v19, v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_addObject_(v5, v17, (uint64_t)v18);
LABEL_12:

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend_setModifySubscriptionRecordZoneIDs_(v4, v21, (uint64_t)v5);
  v22.receiver = self;
  v22.super_class = (Class)CKDModifySubscriptionsURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v22, sel_fillOutRequestProperties_, v4);

}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
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

- (id)requestOperationClasses
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
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  v3 = (void *)objc_opt_new();
  objc_msgSend_subscriptionsToSave(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  objc_msgSend_subscriptionIDsToDelete(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    v18 = objc_opt_class();
    objc_msgSend_addObject_(v3, v19, v18);
  }
  return v3;
}

- (id)generateRequestOperations
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  id obj;
  id v113;
  id v114;
  id v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t v125[128];
  uint8_t buf[4];
  id v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v115 = (id)objc_opt_new();
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend_subscriptionsToSave(self, v3, v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v121, v128, 16);
  if (v6)
  {
    v8 = v6;
    v113 = *(id *)v122;
    do
    {
      v9 = 0;
      do
      {
        if (*(id *)v122 != v113)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v9);
        objc_msgSend_operationRequestWithType_(self, v7, 300);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_new();
        objc_msgSend_setSubscriptionCreateRequest_(v11, v13, (uint64_t)v12);

        objc_msgSend_translator(self, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = 0;
        objc_msgSend_pSubscriptionFromSubscription_error_(v16, v17, (uint64_t)v10, &v120);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v120;
        objc_msgSend_subscriptionCreateRequest(v11, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSubscription_(v22, v23, (uint64_t)v18);

        objc_msgSend_subscriptionCreateRequest(v11, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_subscription(v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend_addObject_(v115, v30, (uint64_t)v11);
          objc_msgSend_subscriptionID(v10, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptionIDByRequestID(self, v34, v35);
          v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_request(v11, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_operationUUID(v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v36, v43, (uint64_t)v33, v42);

LABEL_14:
          goto LABEL_15;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v44 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v127 = v19;
          _os_log_error_impl(&dword_1BE990000, v44, OS_LOG_TYPE_ERROR, "Failed to convert subscription: %@", buf, 0xCu);
        }
        objc_msgSend_subscriptionModifiedBlock(self, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v33 = (void *)objc_opt_new();
          objc_msgSend_setCode_(v33, v48, 3);
          v49 = (void *)objc_opt_new();
          objc_msgSend_setError_(v33, v50, (uint64_t)v49);

          v51 = (void *)objc_opt_new();
          objc_msgSend_error(v33, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setClientError_(v54, v55, (uint64_t)v51);

          objc_msgSend_error(v33, v56, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clientError(v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setType_(v61, v62, 7);

          objc_msgSend_error(v33, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setErrorKey_(v65, v66, (uint64_t)CFSTR("Invalid subscription"));

          v67 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_localizedDescription(v19, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v67, v71, (uint64_t)CFSTR("The subscription could not be converted because it is invalid: %@"), v70);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_error(v33, v73, v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setErrorDescription_(v75, v76, (uint64_t)v72);

          objc_msgSend_subscriptionModifiedBlock(self, v77, v78);
          v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptionID(v10, v79, v80);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v36)[2](v36, v39, v33);
          goto LABEL_14;
        }
LABEL_15:

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v121, v128, 16);
    }
    while (v8);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend_subscriptionIDsToDelete(self, v81, v82);
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v83, (uint64_t)&v116, v125, 16);
  if (v84)
  {
    v86 = v84;
    v87 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v117 != v87)
          objc_enumerationMutation(v114);
        v89 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
        objc_msgSend_operationRequestWithType_(self, v85, 302);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = (void *)objc_opt_new();
        objc_msgSend_setSubscriptionDeleteRequest_(v90, v92, (uint64_t)v91);

        objc_msgSend_CKDPIdentifier_Subscription(v89, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_subscriptionDeleteRequest(v90, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setIdentifier_(v98, v99, (uint64_t)v95);

        objc_msgSend_addObject_(v115, v100, (uint64_t)v90);
        objc_msgSend_subscriptionIDByRequestID(self, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_request(v90, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_operationUUID(v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v103, v110, (uint64_t)v89, v109);

      }
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v85, (uint64_t)&v116, v125, 16);
    }
    while (v86);
  }

  return v115;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  const char *v22;
  uint64_t v23;
  void *v24;

  v4 = a3;
  objc_msgSend_subscriptionIDByRequestID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_subscriptionModifiedBlock(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_subscriptionModifiedBlock(self, v19, v20);
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v21)[2](v21, v15, v24);

  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend_subscriptionIDByRequestID(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_response(v24, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_subscriptionModifiedBlock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_subscriptionModifiedBlock(self, v18, v19);
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v24, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v20)[2](v20, v14, v23);

  }
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)subscriptionModifiedBlock
{
  return self->_subscriptionModifiedBlock;
}

- (void)setSubscriptionModifiedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsToSave, a3);
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, a3);
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
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_subscriptionModifiedBlock, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end
