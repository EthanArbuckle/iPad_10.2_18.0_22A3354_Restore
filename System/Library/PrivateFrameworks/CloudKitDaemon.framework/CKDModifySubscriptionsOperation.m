@implementation CKDModifySubscriptionsOperation

- (CKDModifySubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDModifySubscriptionsOperation *v9;
  uint64_t v10;
  NSArray *subscriptionsToSave;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *subscriptionIDsToDelete;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableDictionary *subscriptionsByServerID;
  NSArray *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  const char *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDModifySubscriptionsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v39, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_subscriptionsToSave(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    subscriptionsToSave = v9->_subscriptionsToSave;
    v9->_subscriptionsToSave = (NSArray *)v10;

    v9->_hasSubscriptionsToSave = objc_msgSend_count(v9->_subscriptionsToSave, v12, v13) != 0;
    objc_msgSend_subscriptionIDsToDelete(v6, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    subscriptionIDsToDelete = v9->_subscriptionIDsToDelete;
    v9->_subscriptionIDsToDelete = (NSArray *)v16;

    v9->_hasSubscriptionsToDelete = objc_msgSend_count(v9->_subscriptionIDsToDelete, v18, v19) != 0;
    v20 = objc_opt_new();
    subscriptionsByServerID = v9->_subscriptionsByServerID;
    v9->_subscriptionsByServerID = (NSMutableDictionary *)v20;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v9->_subscriptionsToSave;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v35, v40, 16);
    if (v24)
    {
      v27 = v24;
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v22);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v31 = v9->_subscriptionsByServerID;
          objc_msgSend_subscriptionID(v30, v25, v26, (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v31, v33, (uint64_t)v30, v32);

        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v35, v40, 16);
      }
      while (v27);
    }

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/modify-subscriptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleSubscriptionSaved:(id)a3 responseCode:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (objc_msgSend_code(v6, v7, v8) == 1)
  {
    v10 = 0;
    objc_msgSend__handleSubscriptionSaved_error_(self, v9, (uint64_t)v26, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C94FF8];
    v12 = *MEMORY[0x1E0C94B20];
    v13 = sub_1BEB10D5C(v6);
    objc_msgSend_request(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v16, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v11, v24, v12, v13, v17, CFSTR("Error saving record subscription with id %@ to server: %@"), v26, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend__handleSubscriptionSaved_error_(self, v25, (uint64_t)v26, v10);
  }

}

- (void)_handleSubscriptionSaved:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_subscriptionsByServerID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_callbackQueue(self, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEAE6B7C;
    block[3] = &unk_1E782E418;
    block[4] = self;
    v18 = v6;
    v19 = v7;
    dispatch_async(v15, block);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Got a response for subscription with ID %@, but we didn't try to put that subscription.", buf, 0xCu);
    }
  }

}

- (void)_handleSubscriptionDeleted:(id)a3 responseCode:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10 = objc_msgSend_code(v7, v8, v9);
  v11 = (void *)*MEMORY[0x1E0C952F8];
  v12 = *MEMORY[0x1E0C95300];
  if (v10 == 1)
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v6;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Subscription %@ was successfully deleted from the server", buf, 0xCu);
    }
    v16 = 0;
  }
  else
  {
    if (v12 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v11);
    v17 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v7;
      v40 = 2112;
      v41 = v6;
      _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "Error %@ when deleting subscription %@ from the server", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x1E0C94FF8];
    v19 = *MEMORY[0x1E0C94B20];
    v20 = sub_1BEB10D5C(v7);
    objc_msgSend_request(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BEB10290(v23, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v7, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorDescription(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_format_(v18, v31, v19, v20, v24, CFSTR("Error deleting subscription %@: %@"), v6, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_callbackQueue(self, v14, v15);
  v32 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEAE6E88;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v36 = v6;
  v37 = v16;
  v33 = v16;
  v34 = v6;
  dispatch_async(v32, block);

}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  void *v3;
  CKDProtocolTranslator *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  _BOOL4 v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  _BOOL4 v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  CKDModifySubscriptionsURLRequest *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  CKDModifySubscriptionsOperation *val;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  id location;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint8_t buf[4];
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = [CKDProtocolTranslator alloc];
  val = self;
  objc_msgSend_container(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_databaseScope(self, v8, v9);
  v12 = (void *)objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v4, v11, (uint64_t)v7, v10, 0);

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  objc_msgSend_subscriptionsToSave(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v131, v140, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v132;
    v20 = *MEMORY[0x1E0C94B20];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v132 != v19)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        v130 = 0;
        objc_msgSend_pSubscriptionFromSubscription_error_(v12, v17, (uint64_t)v22, &v130);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v130;

        if (v23)
        {
          objc_msgSend_addObject_(v3, v25, (uint64_t)v22);
        }
        else
        {
          if (!v24)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v25, v20, 1017, CFSTR("Subscription fails conversion: %@"), v22);
            v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_subscriptionID(v22, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__handleSubscriptionSaved_error_(val, v28, (uint64_t)v27, v24);

        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v131, v140, 16);
    }
    while (v18);
  }

  objc_msgSend_setSubscriptionsToSave_(val, v29, (uint64_t)v3);
  objc_msgSend_container(val, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_adopterProcessType(v32, v33, v34) == 2)
  {

  }
  else
  {
    objc_msgSend_container(val, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_adopterProcessType(v37, v38, v39) == 3;

    if (!v40)
    {
      v43 = v3;
      goto LABEL_28;
    }
  }
  v43 = (void *)objc_opt_new();

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend_subscriptionsToSave(val, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v126, v139, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v127;
    v52 = *MEMORY[0x1E0C94B20];
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v127 != v51)
          objc_enumerationMutation(v46);
        v54 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
        objc_msgSend_notificationInfo(v54, v48, v49);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55 == 0;

        if (v56)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v57, v52, 1017, CFSTR("Subscription with a nil notificationInfo: %@"), v54);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptionID(v54, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__handleSubscriptionSaved_error_(val, v62, (uint64_t)v61, v58);

        }
        else
        {
          objc_msgSend_addObject_(v43, v57, (uint64_t)v54);
        }
      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v126, v139, 16);
    }
    while (v50);
  }

  objc_msgSend_setSubscriptionsToSave_(val, v63, (uint64_t)v43);
LABEL_28:
  if (!objc_msgSend_count(v43, v41, v42)
    && (objc_msgSend_subscriptionIDsToDelete(val, v64, v65),
        v66 = (void *)objc_claimAutoreleasedReturnValue(),
        v69 = objc_msgSend_count(v66, v67, v68) == 0,
        v66,
        v69))
  {
    objc_msgSend_finishWithError_(val, v70, 0);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v71 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v74 = v71;
      objc_msgSend_subscriptionsToSave(val, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_count(v77, v78, v79);
      objc_msgSend_subscriptionIDsToDelete(val, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend_count(v83, v84, v85);
      *(_DWORD *)buf = 134218240;
      v136 = v80;
      v137 = 2048;
      v138 = v86;
      _os_log_impl(&dword_1BE990000, v74, OS_LOG_TYPE_INFO, "Saving %ld, deleting %ld subscriptions on the server.", buf, 0x16u);

    }
    if (objc_msgSend_count(v43, v72, v73))
    {
      objc_msgSend_subscriptionsToSave(val, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_subscriptionType(v92, v93, v94) == 2 || objc_msgSend_subscriptionType(v92, v95, v96) == 1)
      {
        objc_msgSend_subscriptionsToSave(val, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v100, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v103 = 0;
      }

    }
    else
    {
      v103 = 0;
    }
    v104 = [CKDModifySubscriptionsURLRequest alloc];
    objc_msgSend_subscriptionIDsToDelete(val, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend_initWithOperation_subscriptionsToSave_subscriptionIDsToDelete_(v104, v108, (uint64_t)val, v43, v107);

    objc_msgSend_setZoneID_(v109, v110, (uint64_t)v103);
    objc_initWeak((id *)buf, val);
    objc_initWeak(&location, v109);
    v111 = MEMORY[0x1E0C809B0];
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = sub_1BEAE75D8;
    v123[3] = &unk_1E7832FB0;
    objc_copyWeak(&v124, (id *)buf);
    objc_msgSend_setSubscriptionModifiedBlock_(v109, v112, (uint64_t)v123);
    v120[0] = v111;
    v120[1] = 3221225472;
    v120[2] = sub_1BEAE767C;
    v120[3] = &unk_1E782E468;
    objc_copyWeak(&v121, (id *)buf);
    objc_copyWeak(&v122, &location);
    objc_msgSend_setCompletionBlock_(v109, v113, (uint64_t)v120);
    objc_msgSend_setRequest_(val, v114, (uint64_t)v109);
    objc_msgSend_container(val, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v117, v118, (uint64_t)v109);

    objc_destroyWeak(&v122);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&v124);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  const char *v23;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend_subscriptionsToSave(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, v31, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend_subscriptionType(v16, v11, v12) != 2
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (objc_msgSend_subscriptionType(v16, v11, v12) != 1)
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        objc_msgSend_zoneID(v16, v11, v12);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend_addObject_(v5, v11, v17);

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, v31, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v19, v20))
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1BEAE7900;
    v25[3] = &unk_1E78305B0;
    v26 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)v25);

  }
  objc_msgSend_setSaveCompletionBlock_(self, v21, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v23, 0);
  v24.receiver = self;
  v24.super_class = (Class)CKDModifySubscriptionsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v24, sel__finishOnCallbackQueueWithError_, v4);

}

- (int)operationType
{
  if (self->_hasSubscriptionsToSave && !self->_hasSubscriptionsToDelete)
    return 300;
  else
    return 302;
}

- (BOOL)isOperationType:(int)a3
{
  int *v3;

  if (a3 == 300)
  {
    v3 = &OBJC_IVAR___CKDModifySubscriptionsOperation__hasSubscriptionsToSave;
    return *((_BYTE *)&self->super.super.super.super.isa + *v3) != 0;
  }
  if (a3 == 302)
  {
    v3 = &OBJC_IVAR___CKDModifySubscriptionsOperation__hasSubscriptionsToDelete;
    return *((_BYTE *)&self->super.super.super.super.isa + *v3) != 0;
  }
  return 0;
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
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

- (NSMutableDictionary)subscriptionsByServerID
{
  return self->_subscriptionsByServerID;
}

- (void)setSubscriptionsByServerID:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionsByServerID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsByServerID, 0);
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end
