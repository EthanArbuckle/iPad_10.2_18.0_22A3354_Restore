@implementation CKDShareAccessRequestOperation

- (CKDShareAccessRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  CKDShareAccessRequestOperation *v7;
  uint64_t v8;
  NSMutableArray *shareURLsToRequestAccessFor;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDShareAccessRequestOperation;
  v7 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v24, sel_initWithOperationInfo_container_, v6, a4);
  if (v7)
  {
    v8 = objc_opt_new();
    shareURLsToRequestAccessFor = v7->_shareURLsToRequestAccessFor;
    v7->_shareURLsToRequestAccessFor = (NSMutableArray *)v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend_shareURLsToRequestAccessFor(v6, v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, v25, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v12);
          objc_msgSend_addObject_(v7->_shareURLsToRequestAccessFor, v15, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v20, v25, 16);
      }
      while (v16);
    }

  }
  return v7;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/share-access-request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend_shareURLsToRequestAccessFor(self, v5, v6);
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
      return MEMORY[0x1E0DE7D20](self, sel__shareAccessRequest, v13);
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
    v5 = CFSTR("Requesting Access to Shares");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDShareAccessRequestOperation;
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
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend_shareURLsToRequestAccessFor(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v6);

  objc_msgSend_callbackQueue(self, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA06984;
  block[3] = &unk_1E782E418;
  block[4] = self;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_async(v14, block);

}

- (void)_handleShareAccessRequestedForURL:(id)a3 responseCode:(id)a4
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
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Sucessfully requested access for share with URL %@", buf, 0xCu);
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
        _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "Error requesting access for share with URL %@: %{public}@", buf, 0x16u);

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
      objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v45, v33, v34, v38, CFSTR("Error requesting access to share %@: %@"), v6, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__performCallbackForURL_error_(self, v47, (uint64_t)v6, v46);
    }
  }

}

- (int)operationType
{
  return 219;
}

- (BOOL)isEmail:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  char v8;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend_predicateWithFormat_(v3, v5, (uint64_t)CFSTR("SELF MATCHES %@"), CFSTR("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_evaluateWithObject_(v6, v7, (uint64_t)v4);

  return v8;
}

- (BOOL)isPhoneNumber:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  char v8;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend_predicateWithFormat_(v3, v5, (uint64_t)CFSTR("SELF MATCHES %@"), CFSTR("^\\+?[0-9]{6,15}$"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_evaluateWithObject_(v6, v7, (uint64_t)v4);

  return v8;
}

- (BOOL)_shareAccessRequest
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const void *v34;
  const char *v35;
  CC_LONG v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  CKDPUserInformationRequestAccess *v49;
  CKDPContactInformation *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  int isPhoneNumber;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  CKDShareAccessRequestURLRequest *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  NSObject *v113;
  NSObject *v114;
  void *v116;
  BOOL v117;
  void *v118;
  void *v119;
  NSObject *log;
  void *v121;
  void *v122;
  id obj;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  _QWORD v128[4];
  id v129;
  id v130;
  _QWORD v131[4];
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  _OWORD md[2];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToRequestAccessFor(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_count(v3, v4, v5);

  if (v6)
  {
    objc_msgSend_container(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = v12 != 0;
    if (v12)
    {
      objc_msgSend_container(self, v13, v14);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)objc_opt_new();
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      objc_msgSend_shareURLsToRequestAccessFor(self, v15, v16);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v133, v146, 16);
      if (v126)
      {
        v124 = *(_QWORD *)v134;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v134 != v124)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * v18);
            v20 = (void *)objc_opt_new();
            v21 = objc_alloc(MEMORY[0x1E0CB3998]);
            v23 = (void *)objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v21, v22, v19, 0);
            objc_msgSend_path(v23, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastPathComponent(v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringFromIndex_(v29, v30, 3);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            memset(md, 0, sizeof(md));
            v34 = (const void *)objc_msgSend_UTF8String(v31, v32, v33);
            v36 = objc_msgSend_lengthOfBytesUsingEncoding_(v31, v35, 4);
            CC_SHA256(v34, v36, (unsigned __int8 *)md);
            objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v37, (uint64_t)md, 32);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setShortTokenHash_(v20, v39, (uint64_t)v38);

            objc_msgSend_path(v23, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastPathComponent(v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_substringToIndex_(v45, v46, 3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setRoutingKey_(v20, v48, (uint64_t)v47);

            v49 = objc_alloc_init(CKDPUserInformationRequestAccess);
            v50 = objc_alloc_init(CKDPContactInformation);
            objc_msgSend_fullName(v12, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_givenName(v53, v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setFirstName_(v50, v57, (uint64_t)v56);

            objc_msgSend_fullName(v12, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_familyName(v60, v61, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setLastName_(v50, v64, (uint64_t)v63);

            objc_msgSend_username(v12, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v63) = objc_msgSend_isEmail_(self, v68, (uint64_t)v67);

            if ((_DWORD)v63)
            {
              objc_msgSend_username(v12, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setEmailAddress_(v50, v72, (uint64_t)v71);

            }
            objc_msgSend_username(v12, v69, v70, v116);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            isPhoneNumber = objc_msgSend_isPhoneNumber_(self, v74, (uint64_t)v73);

            if (isPhoneNumber)
            {
              objc_msgSend_username(v12, v76, v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setPhoneNumber_(v50, v79, (uint64_t)v78);

            }
            objc_msgSend_accountID(v12, v76, v77);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setContainerScopedUserId_(v50, v81, (uint64_t)v80);

            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v82 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              log = v82;
              objc_msgSend_fullName(v12, v88, v89);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_givenName(v122, v90, v91);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_fullName(v12, v92, v93);
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_familyName(v121, v94, v95);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_username(v12, v96, v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_accountID(v12, v99, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v138 = v119;
              v139 = 2112;
              v140 = v118;
              v141 = 2112;
              v142 = v98;
              v143 = 2112;
              v144 = v101;
              _os_log_debug_impl(&dword_1BE990000, log, OS_LOG_TYPE_DEBUG, "Account info for requester. First Name: %@ Family Name: %@ Username: %@ AccountID %@", buf, 0x2Au);

            }
            objc_msgSend_setContactInformation_(v49, v83, (uint64_t)v50);
            objc_msgSend_setUserInformationRequestAccess_(v20, v84, (uint64_t)v49);
            objc_msgSend_setShareURL_(v20, v85, v19);
            objc_msgSend_addObject_(v125, v86, (uint64_t)v20);

            ++v18;
          }
          while (v126 != v18);
          v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v87, (uint64_t)&v133, v146, 16);
        }
        while (v126);
      }

      v102 = [CKDShareAccessRequestURLRequest alloc];
      v104 = (void *)objc_msgSend_initWithOperation_shareMetadatasToRequestAccess_(v102, v103, (uint64_t)self, v125);
      objc_initWeak((id *)buf, self);
      objc_initWeak((id *)md, v104);
      objc_msgSend_stateTransitionGroup(self, v105, v106);
      v107 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v107);

      v108 = MEMORY[0x1E0C809B0];
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 3221225472;
      v131[2] = sub_1BEA075F0;
      v131[3] = &unk_1E782E440;
      objc_copyWeak(&v132, (id *)buf);
      objc_msgSend_setShareAccessRequestedBlock_(v104, v109, (uint64_t)v131);
      v128[0] = v108;
      v128[1] = 3221225472;
      v128[2] = sub_1BEA07654;
      v128[3] = &unk_1E782E468;
      objc_copyWeak(&v129, (id *)buf);
      objc_copyWeak(&v130, (id *)md);
      objc_msgSend_setCompletionBlock_(v104, v110, (uint64_t)v128);
      objc_msgSend_setRequest_(self, v111, (uint64_t)v104);
      objc_msgSend_performRequest_(v116, v112, (uint64_t)v104);
      objc_destroyWeak(&v130);
      objc_destroyWeak(&v129);
      objc_destroyWeak(&v132);
      objc_destroyWeak((id *)md);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v114 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE990000, v114, OS_LOG_TYPE_INFO, "User does not have a valid account to request access for", buf, 2u);
      }
    }

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v113 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v113, OS_LOG_TYPE_INFO, "No share URLs to request access for", buf, 2u);
    }
    return 0;
  }
  return v117;
}

- (void)main
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  _BOOL8 v7;
  const char *v8;

  objc_msgSend_shareURLsToRequestAccessFor(self, a2, v2);
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
  objc_msgSend_setShareAccessRequestCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDShareAccessRequestOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)shareAccessRequestCompletionBlock
{
  return self->_shareAccessRequestCompletionBlock;
}

- (void)setShareAccessRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSMutableArray)shareURLsToRequestAccessFor
{
  return self->_shareURLsToRequestAccessFor;
}

- (void)setShareURLsToRequestAccessFor:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToRequestAccessFor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLsToRequestAccessFor, 0);
  objc_storeStrong(&self->_shareAccessRequestCompletionBlock, 0);
}

@end
