@implementation CKDPCSIdentityManager

- (CKDPCSIdentityManager)initWithAccount:(id)a3 deviceContext:(id)a4 serviceName:(id)a5 forceEnableReadOnlyManatee:(BOOL)a6 clientSDKVersion:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  CKDPCSIdentityManager *v16;
  CKDPCSIdentityManager *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *cachedAccountDSID;
  uint64_t v22;
  NSMutableDictionary *PCSIdentityWrappersByServiceName;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CKDPCSIdentityManager;
  v16 = -[CKDPCSIdentityManager init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a3);
    objc_storeStrong((id *)&v17->_deviceContext, a4);
    objc_storeStrong((id *)&v17->_serviceName, a5);
    v17->_forceEnableReadOnlyManatee = a6;
    objc_msgSend_dsid(v13, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    cachedAccountDSID = v17->_cachedAccountDSID;
    v17->_cachedAccountDSID = (NSString *)v20;

    v17->_clientSDKVersion = a7;
    v22 = objc_opt_new();
    PCSIdentityWrappersByServiceName = v17->_PCSIdentityWrappersByServiceName;
    v17->_PCSIdentityWrappersByServiceName = (NSMutableDictionary *)v22;

  }
  return v17;
}

- (void)setPCSServiceNameOverwrite:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (void)dealloc
{
  _PCSIdentityData *debugIdentity;
  objc_super v4;

  debugIdentity = self->_debugIdentity;
  if (debugIdentity)
  {
    CFRelease(debugIdentity);
    self->_debugIdentity = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSIdentityManager;
  -[CKDPCSIdentityManager dealloc](&v4, sel_dealloc);
}

- (void)updateAccount:(id)a3
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
  char isEqualToString;
  CKDPCSIdentityManager *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  objc_msgSend_accountID(v23, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v13, (uint64_t)v12);

  v15 = self;
  objc_sync_enter(v15);
  objc_msgSend_setAccount_(v15, v16, (uint64_t)v23);
  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_identitiesChanged(v15, v17, v18);
    objc_msgSend_dsid(v23, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCachedAccountDSID_(v15, v22, (uint64_t)v21);

  }
  objc_sync_exit(v15);

}

- (void)identitiesChanged
{
  const char *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend_setPCSIdentityWrappersByServiceName_(self, v3, (uint64_t)v4);

}

- (id)_cacheIdentitySet:(_PCSIdentitySetData *)a3 forService:(id)a4
{
  id v6;
  CKDPCSIdentityWrapper *v7;
  const char *v8;
  CKDPCSIdentityManager *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;

  v6 = a4;
  if (a3)
  {
    v7 = [CKDPCSIdentityWrapper alloc];
    a3 = (_PCSIdentitySetData *)objc_msgSend_initWithIdentitySet_withPrimaryServiceName_(v7, v8, (uint64_t)a3, v6);
    v9 = self;
    objc_sync_enter(v9);
    objc_msgSend_PCSIdentityWrappersByServiceName(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)a3, v6);

    objc_sync_exit(v9);
  }

  return a3;
}

- (_PCSIdentitySetData)_copyIdentityForService:(id)a3 useCache:(BOOL)a4 validateCurrentKey:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const char *v9;
  uint64_t v10;
  __CFString *v11;
  CKDPCSIdentityManager *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  char v25;
  NSObject *v26;
  const char *v27;
  id v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  int v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  char v56;
  char isManateeAvailableWithError;
  __CFString *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  _BOOL4 v66;
  const char *v67;
  _BYTE *v68;
  char v69;
  void *v70;
  const char *v71;
  void *v72;
  char v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t IdentitySetForService_dsid_error;
  int v80;
  void *v81;
  const char *v82;
  const char *v83;
  const void *v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  char isEqualToString;
  const char *v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  void *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  __CFString *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  __CFString *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  _PCSIdentitySetData *v147;
  NSObject *v148;
  _PCSIdentitySetData *v149;
  _PCSIdentitySetData *result;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  __CFString *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  __CFString *v158;
  const char *v159;
  uint64_t v160;
  __CFString *v161;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  void *v168;
  id v169;
  uint8_t buf[4];
  __CFString *v171;
  __int16 v172;
  const __CFString *v173;
  __int16 v174;
  void *v175;
  uint64_t v176;

  v6 = a5;
  v7 = a4;
  v176 = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v162, v163, (uint64_t)a2, self, CFSTR("CKDPCSIdentityManager.m"), 155, CFSTR("No serviceName provided to _copyIdentityForService"));

  }
  v12 = self;
  objc_sync_enter(v12);
  objc_msgSend_account(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_length(v18, v19, v20);

  if (v21)
  {
    if (objc_msgSend_serviceIsManatee_(v12, v22, (uint64_t)v11))
      v25 = objc_msgSend_forceEnableReadOnlyManatee(v12, v23, v24) ^ 1;
    else
      v25 = 0;
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v23, v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_fakeManateeOverride(v29, v30, v31))
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend_fakeWalrusOverride(v34, v35, v36);

    }
    else
    {
      v37 = 0;
    }

    if ((v25 & 1) != 0)
    {
      v40 = 5006;
    }
    else
    {
      objc_msgSend_deviceContext(v12, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountDataSecurityObserver(v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(v12, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v44, v48, (uint64_t)v47, 1);

      if (!v49)
      {
        v58 = 0;
        goto LABEL_41;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v52 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v171 = v11;
        v172 = 2112;
        v173 = CFSTR("YES");
        _os_log_debug_impl(&dword_1BE990000, v52, OS_LOG_TYPE_DEBUG, "Walrus enabled for service %{public}@: %@", buf, 0x16u);
      }
      objc_msgSend_clientSDKVersion(v12, v53, v54);
      if (CKLinkCheck32f5805a68adfc1b65f94a0de69aa32177c7cd24())
        v40 = 5014;
      else
        v40 = 2012;
    }
    if (objc_msgSend_accountType(v15, v38, v39) != 2
      || (*MEMORY[0x1E0C95280] ? (v56 = 1) : (v56 = v37), (v56 & 1) != 0))
    {
      v169 = 0;
      isManateeAvailableWithError = objc_msgSend_isManateeAvailableWithError_(v12, v55, (uint64_t)&v169);
      v58 = (__CFString *)v169;
      if ((isManateeAvailableWithError & 1) == 0)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v59 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543618;
          v171 = v11;
          v172 = 2112;
          v173 = v58;
          _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Can't copy identity set for service %{public}@. Manatee not available for current account due to %@.", buf, 0x16u);
        }
        objc_msgSend_domain(v58, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToString_(v62, v63, *MEMORY[0x1E0D15750]))
        {
          v66 = objc_msgSend_code(v58, v64, v65) == -5311;

          if (v66)
          {
            if (a6)
            {
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v67, *MEMORY[0x1E0C94B20], 1013, v58, CFSTR("CoreCDP failed to check manatee availability"));
              v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:
              v80 = 0;
              v81 = 0;
              goto LABEL_60;
            }
LABEL_75:
            v80 = 0;
LABEL_90:
            v81 = 0;
            goto LABEL_91;
          }
        }
        else
        {

        }
        if (a6)
        {
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v67, *MEMORY[0x1E0C94B20], v40, v58, CFSTR("Manatee is not available for the current account"));
          v28 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        }
        goto LABEL_75;
      }
LABEL_41:
      v68 = (_BYTE *)MEMORY[0x1E0C95280];
      if (*MEMORY[0x1E0C95280])
      {
        v69 = objc_msgSend_refetchPCSIdentitySet(v12, v50, v51);
        if (!v7)
          goto LABEL_49;
      }
      else
      {
        v69 = 0;
        if (!v7)
          goto LABEL_49;
      }
      objc_msgSend_PCSIdentityWrappersByServiceName(v12, v50, v51);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v70, v71, (uint64_t)v11);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
        v73 = v69;
      else
        v73 = 1;

      if ((v73 & 1) == 0)
      {
        objc_msgSend_cachedAccountDSID(v12, v50, v51);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dsid(v15, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v91, v95, (uint64_t)v94);

        if ((isEqualToString & 1) != 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v99 = (id)*MEMORY[0x1E0C952D8];
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            v153 = objc_msgSend_accountType(v15, v100, v101);
            CKStringForAccountType(v153);
            v154 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_dsid(v15, v155, v156);
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v171 = v11;
            v172 = 2112;
            v173 = v154;
            v174 = 2112;
            v175 = v157;
            _os_log_debug_impl(&dword_1BE990000, v99, OS_LOG_TYPE_DEBUG, "Returning cached identity for service %{public}@ and %@ account %@", buf, 0x20u);

          }
          objc_msgSend_PCSIdentityWrappersByServiceName(v12, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v104, v105, (uint64_t)v11);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (*v68)
          {
            objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v97, v98);
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v165, (uint64_t)a2, v12, CFSTR("CKDPCSIdentityManager.m"), 223, CFSTR("Identity cache missed an invalidation, dsid of backing account has changed"));

            __break(1u);
            return result;
          }
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v106 = (id)*MEMORY[0x1E0C952D8];
          if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_dsid(v15, v107, v108);
            v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_cachedAccountDSID(v12, v159, v160);
            v161 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v171 = v158;
            v172 = 2112;
            v173 = v161;
            _os_log_fault_impl(&dword_1BE990000, v106, OS_LOG_TYPE_FAULT, "Current dsid: %@. Cached identities dsid: %@. The dsid has changed underneath us and we didn't clear our identity cache. Clearing cache and failing identity request", buf, 0x16u);

          }
          objc_msgSend_identitiesChanged(v12, v109, v110);
          v81 = 0;
        }
        goto LABEL_82;
      }
LABEL_49:
      v74 = objc_msgSend_accountType(v15, v50, v51);
      if (v74 == 2)
      {
        objc_msgSend_backingAccount(v15, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        IdentitySetForService_dsid_error = objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(v12, v82, (uint64_t)v11, v77, a6);
      }
      else if (v74 == 3)
      {
        objc_msgSend_backingAccount(v15, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        IdentitySetForService_dsid_error = objc_msgSend_copyTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, v78, (uint64_t)v11, v77, a6);
      }
      else
      {
        objc_msgSend_dsid(v15, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        IdentitySetForService_dsid_error = objc_msgSend__createIdentitySetForService_dsid_error_(CKDPCSIdentityManager, v83, (uint64_t)v11, v77, a6);
      }
      v84 = (const void *)IdentitySetForService_dsid_error;

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v85 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        v151 = objc_msgSend_accountType(v15, v86, v87);
        *(_DWORD *)buf = 134218242;
        v171 = (__CFString *)v151;
        v172 = 2114;
        v173 = v11;
        _os_log_debug_impl(&dword_1BE990000, v85, OS_LOG_TYPE_DEBUG, "Caching a fresh %lld-type identity set for service %{public}@.", buf, 0x16u);
      }

      objc_msgSend__cacheIdentitySet_forService_(v12, v88, (uint64_t)v84, v11);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v84)
        CFRelease(v84);
LABEL_82:
      v80 = 1;
      if ((objc_msgSend_forceEnableReadOnlyManatee(v12, v89, v90) & 1) != 0)
        goto LABEL_91;
      if (!v6)
        goto LABEL_91;
      v113 = objc_msgSend_identitySet(v81, v111, v112);
      if ((objc_msgSend__hasCurrentKeyForService_inIdentitySet_withError_(v12, v114, (uint64_t)v11, v113, a6) & 1) != 0)
        goto LABEL_91;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v115 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v152 = objc_msgSend_identitySet(v81, v116, v117);
        *(_DWORD *)buf = 138412290;
        v171 = (__CFString *)v152;
        _os_log_error_impl(&dword_1BE990000, v115, OS_LOG_TYPE_ERROR, "Identity set %@ does not have a current key set. Not using it and removing it from cache.", buf, 0xCu);
      }

      objc_msgSend_PCSIdentityWrappersByServiceName(v12, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v120, v121, 0, v11);

      goto LABEL_90;
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v55, *MEMORY[0x1E0C94B20], v40, CFSTR("Manatee is not available for explicit-credential accounts"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_54;
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "We don't have a DSID so we can't copy our current PCS identity", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 1002, CFSTR("Can't fetch identity, no account dsid available"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:
      v80 = 0;
      v81 = 0;
      v58 = 0;
LABEL_60:
      *a6 = v28;
      goto LABEL_91;
    }
  }
  v80 = 0;
  v81 = 0;
  v58 = 0;
LABEL_91:

  objc_sync_exit(v12);
  if (v80)
  {
    v122 = (void *)*MEMORY[0x1E0C952F8];
    if (v81)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v122);
      v123 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v126 = v123;
        objc_msgSend_account(v12, v127, v128);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_accountID(v168, v129, v130);
        v131 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceContext(v12, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_testDeviceReference(v134, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serverReferenceProtocol(v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dataDirectory(v140, v141, v142);
        v143 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identityString(v81, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v171 = v131;
        v172 = 2112;
        v173 = v143;
        v174 = 2112;
        v175 = v146;
        _os_log_debug_impl(&dword_1BE990000, v126, OS_LOG_TYPE_DEBUG, "Using service identity for account %@ %@:\n%@", buf, 0x20u);

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v122);
      v148 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE990000, v148, OS_LOG_TYPE_ERROR, "Couldn't get a service identity set from the PCS framework", buf, 2u);
      }
    }
    v149 = (_PCSIdentitySetData *)objc_msgSend_identitySet(v81, v124, v125);
    v147 = v149;
    if (v149)
      CFRetain(v149);
  }
  else
  {
    v147 = 0;
  }

  return v147;
}

+ (_PCSIdentitySetData)_createIdentitySetForService:(id)a3 dsid:(id)a4 error:(id *)a5
{
  _PCSIdentitySetData *v7;
  id v8;
  const char *v9;
  void *v10;
  _PCSIdentitySetData *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t buf[4];
  _PCSIdentitySetData *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = (_PCSIdentitySetData *)a3;
  v8 = a4;
  v22 = *MEMORY[0x1E0D82B18];
  v23[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_PCSIdentitySetData *)PCSIdentitySetCreate();
  v12 = (void *)*MEMORY[0x1E0C952F8];
  v13 = *MEMORY[0x1E0C95300];
  if (!v11)
  {
    if (v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v12);
    v15 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      v20 = 2112;
      v21 = 0;
      _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Couldn't get an identity set for service %{public}@ from the PCS framework: %@", buf, 0x16u);
      if (!a5)
        goto LABEL_11;
    }
    else if (!a5)
    {
      goto LABEL_11;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("Couldn't create a PCS identity"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v13 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v12);
  v14 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_debug_impl(&dword_1BE990000, v14, OS_LOG_TYPE_DEBUG, "Got identity set from the PCS framework %@", buf, 0xCu);
  }
LABEL_11:

  return v11;
}

- (_PCSIdentitySetData)copyIdentitySetWithType:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  void *v8;
  const char *v9;
  _PCSIdentitySetData *v10;

  v6 = a4;
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (_PCSIdentitySetData *)objc_msgSend__copyIdentityForService_useCache_validateCurrentKey_error_(self, v9, (uint64_t)v8, (v6 & 1) == 0, (v6 & 2) == 0, a5);

  return v10;
}

+ (_PCSIdentitySetData)createFullKeychainIdentitySetForAccount:(id)a3 serviceName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  _PCSIdentitySetData *v25;
  BOOL v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  BOOL v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_dsid(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_length(v11, v12, v13);

  if (v14)
  {
    v17 = objc_msgSend_accountType(v7, v15, v16);
    if (v17 == 2)
    {
      v27 = *MEMORY[0x1E0D82AC0];
      objc_msgSend_backingAccount(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v21 = (id *)&v34;
      v23 = objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v28, v27, v20, &v34);
    }
    else if (v17 == 3)
    {
      objc_msgSend_backingAccount(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v21 = (id *)&v35;
      v23 = objc_msgSend_copyTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, v22, (uint64_t)v8, v20, &v35);
    }
    else
    {
      objc_msgSend_dsid(v7, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v21 = (id *)&v33;
      v23 = objc_msgSend__createIdentitySetForService_dsid_error_(CKDPCSIdentityManager, v29, 0, v20, &v33);
    }
    v25 = (_PCSIdentitySetData *)v23;
    v24 = *v21;

    v26 = v25 == 0;
    if (v25)
      v30 = v24 == 0;
    else
      v30 = 0;
    if (v30)
    {
      v24 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 1002, CFSTR("Can't fetch identity set, no account dsid available"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 1;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v31 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v24;
    _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Failed to get full identity set: %@.", buf, 0xCu);
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (a5)
LABEL_16:
    *a5 = objc_retainAutorelease(v24);
LABEL_17:
  if (!v26)
    CFRelease(v25);
  v25 = 0;
LABEL_21:

  return v25;
}

- (_PCSIdentitySetData)createFullKeychainIdentitySetWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _PCSIdentitySetData *FullKeychainIdentitySetForAccount_serviceName_error;

  objc_msgSend_account(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_accountType(v5, v6, v7) == 2)
    objc_msgSend_PCSServiceStringFromCKServiceType_(self, v8, 3);
  else
    objc_msgSend_serviceName(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FullKeychainIdentitySetForAccount_serviceName_error = (_PCSIdentitySetData *)objc_msgSend_createFullKeychainIdentitySetForAccount_serviceName_error_(CKDPCSIdentityManager, v11, (uint64_t)v5, v10, a3);

  return FullKeychainIdentitySetForAccount_serviceName_error;
}

- (BOOL)liverpoolServiceOwnsPublicID:(id)a3
{
  id v4;
  const char *v5;
  const void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  const char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = 0;
  v6 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, v5, 3, 0, &v27);
  v7 = v27;
  v8 = v7;
  v9 = 0;
  LOBYTE(v10) = 0;
  if (v6 && !v7)
  {
    v11 = (void *)PCSIdentitySetCopyIdentities();
    v14 = v11;
    if (v11)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend_allValues(v11, v12, v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, v28, 16);
      if (v10)
      {
        v18 = 0;
        v19 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v15);
            if (*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i))
            {
              PCSIdentityGetPublicKey();
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend_isEqualToString_(v4, v21, (uint64_t)v9) & 1) != 0)
              {
                LOBYTE(v10) = 1;
                goto LABEL_18;
              }
              v18 = v9;
            }
          }
          v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v23, v28, 16);
          if (v10)
            continue;
          break;
        }
        v9 = v18;
      }
      else
      {
        v9 = 0;
      }
LABEL_18:

    }
    else
    {
      LOBYTE(v10) = 0;
      v9 = 0;
    }

  }
  if (v6)
    CFRelease(v6);

  return v10;
}

- (_PCSPublicIdentityData)copyDiversifiedIdentityForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  _PCSPublicIdentityData *v14;
  id v15;
  const char *v16;
  void *v17;
  const void *v18;
  uint64_t DiversifiedIdentityOptions;
  void *v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  CFTypeRef v36;
  void *v37;
  const char *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  CFTypeRef v44;
  void *v45;
  const char *v46;
  void *v48;
  id v49;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  CFTypeRef v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  cf = 0;
  v55 = *MEMORY[0x1E0D82A18];
  v56[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v56, &v55, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v8, v11, v12))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Can't create a diversified identity with no server entropy", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("Can't create a diversified identity with no server entropy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v49 = 0;
  v14 = (_PCSPublicIdentityData *)objc_msgSend_copyIdentitySetWithType_options_error_(self, v13, a3, 0, &v49);
  v15 = v49;
  v17 = v15;
  if (!v14 || v15)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      sub_1BEA5D408(a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v25;
      v53 = 2112;
      v54 = v17;
      _os_log_impl(&dword_1BE990000, v24, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);

    }
    v26 = (void *)MEMORY[0x1E0C94FF8];
    v27 = *MEMORY[0x1E0C94B20];
    sub_1BEA5D408(a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_error_format_(v26, v29, v27, 5000, v17, CFSTR("Couldn't get a %@ identity set"), v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_38;
    CFRelease(v14);
LABEL_20:
    v14 = 0;
    goto LABEL_38;
  }
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, v16, a3);
  v18 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (v18 && !cf)
  {
    DiversifiedIdentityOptions = PCSIdentityCreateDiversifiedIdentityOptions();
    if (!DiversifiedIdentityOptions || cf)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v48 = v10;
      v39 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v40 = v39;
        sub_1BEA5D408(a3);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v41;
        v53 = 2112;
        v54 = cf;
        _os_log_impl(&dword_1BE990000, v40, OS_LOG_TYPE_INFO, "Warn: Couldn't create a diversified %{public}@ identity: %@", buf, 0x16u);

      }
      v42 = (void *)MEMORY[0x1E0C94FF8];
      v43 = *MEMORY[0x1E0C94B20];
      v44 = cf;
      sub_1BEA5D408(a3);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_error_format_(v42, v46, v43, 5000, v44, CFSTR("Couldn't create a diversified %@ identity"), v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v10 = v48;
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v14);
LABEL_37:
    CFRelease(v18);
    v14 = (_PCSPublicIdentityData *)DiversifiedIdentityOptions;
    goto LABEL_38;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v30 = v10;
  v31 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v32 = v31;
    sub_1BEA5D408(a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v33;
    v53 = 2112;
    v54 = cf;
    _os_log_impl(&dword_1BE990000, v32, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity: %@", buf, 0x16u);

  }
  v34 = (void *)MEMORY[0x1E0C94FF8];
  v35 = *MEMORY[0x1E0C94B20];
  v36 = cf;
  sub_1BEA5D408(a3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_error_format_(v34, v38, v35, 5000, v36, CFSTR("Couldn't get a %@ identity"), v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  CFRelease(v14);
  DiversifiedIdentityOptions = 0;
  v14 = 0;
  v10 = v30;
  if (v18)
    goto LABEL_37;
LABEL_38:
  if (a5)
    *a5 = objc_retainAutorelease(v20);

  return v14;
}

- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 userIDEntropy:(id)a4 withError:(id *)a5
{
  const void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  id v17;

  v17 = 0;
  v7 = (const void *)objc_msgSend_copyDiversifiedIdentityForService_userIDEntropy_withError_(self, a2, a3, a4, &v17);
  v8 = v17;
  v9 = v8;
  if (v7 && !v8)
  {
    v10 = PCSPublicIdentityCopyPublicKey();
LABEL_7:
    CFRelease(v7);
    v15 = (void *)v10;
    goto LABEL_8;
  }
  if (!v8)
  {
    v11 = (void *)MEMORY[0x1E0C94FF8];
    v12 = *MEMORY[0x1E0C94B20];
    sub_1BEA5D408(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v11, v14, v12, 5000, CFSTR("Couldn't get a diversified identity for service %@"), v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = 0;
  v15 = 0;
  if (v7)
    goto LABEL_7;
LABEL_8:
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return v15;
}

+ (BOOL)credentialsAreValidForAccount:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (id)*MEMORY[0x1E0D82AC0];
  v10 = 0;
  TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v5, (uint64_t)v4, v3, &v10);
  v7 = v10;
  if (!TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v12 = v4;
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_1BE990000, v8, OS_LOG_TYPE_ERROR, "Couldn't get a %{public}@ identity for %@: %@", buf, 0x20u);
    }
  }

  return TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError != 0;
}

- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  const void *v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v7 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, a2, a3, 0, &v23);
  v8 = v23;
  v10 = v8;
  if (!v7 || (v11 = 0, v8))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      sub_1BEA5D408(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x1E0C94FF8];
    v16 = *MEMORY[0x1E0C94B20];
    sub_1BEA5D408(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v15, v18, v16, 5000, CFSTR("Couldn't get a %@ identity set to add to the share PCS"), v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v7 || v11)
  {
    v19 = 0;
    v20 = 0;
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    v22 = 0;
    v19 = objc_msgSend__copyPublicKeyDataForIdentitySet_withService_withError_(self, v9, (uint64_t)v7, a3, &v22);
    v11 = v22;
  }
  CFRelease(v7);
  v20 = (void *)v19;
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v20;
}

- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4
{
  const void *v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v7 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(self, a2, a3, 0, &v22);
  v8 = v22;
  v10 = v8;
  if (!v7 || (v11 = 0, v8))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      sub_1BEA5D408(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v14;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %{public}@ identity set: %@", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x1E0C94FF8];
    v16 = *MEMORY[0x1E0C94B20];
    sub_1BEA5D408(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v15, v18, v16, 5000, CFSTR("Couldn't get a %@ identity set to add to the share PCS"), v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v7 || v11)
  {
    v19 = 0;
    v20 = 0;
    if (!v7)
      goto LABEL_13;
  }
  else
  {
    v19 = objc_msgSend__copyPublicKeyDataForAllIdentitiesInSet_withService_(self, v9, (uint64_t)v7, a3);
  }
  CFRelease(v7);
  v20 = (void *)v19;
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v20;
}

- (id)_copyPublicKeyDataForAllIdentitiesInSet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4
{
  void *v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v14 = v9;
  PCSIdentitySetEnumeratePublicKeys();
  if (!objc_msgSend_count(v9, v10, v11))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Warn: Did not get any public keys for service %{public}@.", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)_copyPublicKeyDataForIdentitySet:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 withError:(id *)a5
{
  const char *v6;
  const void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend_PCSServiceStringFromCKServiceType_(self, a2, a4);
  v7 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();
  if (v7)
  {
    v8 = (void *)PCSPublicIdentityCopyPublicKey();
    v9 = 0;
    CFRelease(v7);
    if (v8)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v10 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl(&dword_1BE990000, v10, OS_LOG_TYPE_INFO, "Current identity public key data is %{public}@", buf, 0xCu);
      }
      return v8;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't copy a public identity for our current user"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Warn: Error generating fingerprint for current self identity: %@", buf, 0xCu);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v9);

  return 0;
}

+ (_PCSIdentitySetData)_copyStingrayIdentitiesForOptions:(id)a3 withError:(id *)a4
{
  _PCSIdentitySetData *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (_PCSIdentitySetData *)PCSIdentityRecoverFDE();
  v6 = (void *)*MEMORY[0x1E0C952F8];
  v7 = *MEMORY[0x1E0C95300];
  if (!v5)
  {
    if (v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v6);
    v10 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = 0;
      _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "Error fetching PCS identity set: %@", buf, 0xCu);
      if (!a4)
        return v5;
    }
    else if (!a4)
    {
      return v5;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5001, 0, CFSTR("Couldn't fetch PCS identities from stingray"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (v7 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v6);
  v8 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "PCS identity set fetched:", buf, 2u);
  }
  v13 = (void *)PCSIdentitySetCopyService();
  v9 = v13;
  PCSIdentitySetEnumeratePublicKeys();

  return v5;
}

+ (_PCSIdentitySetData)_copyStingrayIdentitiesForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  _PCSIdentitySetData *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  _BOOL4 v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  __int128 v42;
  dispatch_semaphore_t v43;
  uint64_t v44;
  _QWORD v47[4];
  id v48;
  id v49;
  NSObject *v50;
  uint64_t *v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 1;
  v44 = *MEMORY[0x1E0CB3388];
  v9 = 3;
  *(_QWORD *)&v10 = 138543618;
  v42 = v10;
  while (1)
  {

    objc_msgSend__generatePCSIdentityOptionsForService_forBackingExplicitCredentialsAccount_withError_(a1, v11, (uint64_t)v6, v7, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend_mutableCopy(v12, v13, v14);

    if (!v15)
      break;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_username(v7, v17, v18);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = v42;
      v58 = v6;
      v59 = 2112;
      v60 = v40;
      _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Fetching PCS identity set %{public}@ for account %@", buf, 0x16u);

    }
    v52 = 0;
    v20 = (_PCSIdentitySetData *)objc_msgSend__copyStingrayIdentitiesForOptions_withError_(a1, v19, (uint64_t)v15, &v52);
    v21 = v52;
    v8 = v21;
    *((_BYTE *)v54 + 24) = 0;
    if (v20 && !v21)
      goto LABEL_16;
    objc_msgSend_userInfo(v21, v22, v23, v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v25, v44);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_domain(v26, v27, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v29, v30, (uint64_t)CFSTR("CloudServicesErrorDomain")))
      goto LABEL_12;
    v33 = objc_msgSend_code(v26, v31, v32) == 305;

    if (v33)
    {
      objc_msgSend_password(v7, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = dispatch_semaphore_create(0);
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = sub_1BEC33B14;
      v47[3] = &unk_1E78381B0;
      v37 = v7;
      v48 = v37;
      v29 = v36;
      v49 = v29;
      v51 = &v53;
      v38 = v43;
      v50 = v38;
      objc_msgSend_renewAuthTokenWithOptions_completionHandler_(v37, v39, MEMORY[0x1E0C9AA70], v47);
      dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);

LABEL_12:
    }

    if (*((_BYTE *)v54 + 24) && v20)
    {
      CFRelease(v20);
      v20 = 0;
    }
LABEL_16:

    if (!--v9 || !*((_BYTE *)v54 + 24))
    {

      goto LABEL_20;
    }
  }
  v20 = 0;
LABEL_20:
  _Block_object_dispose(&v53, 8);

  return v20;
}

+ (id)sharedFakeIdentitySetsByServiceByUsername
{
  if (qword_1ED702C58 != -1)
    dispatch_once(&qword_1ED702C58, &unk_1E78381D0);
  return (id)qword_1ED702C50;
}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  _PCSIdentitySetData *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  const char *v36;

  v8 = a3;
  v9 = a4;
  objc_msgSend_sharedFakeIdentitySetsByServiceByUsername(a1, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend_username(v9, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (_PCSIdentitySetData *)objc_msgSend_length(v15, v16, v17);

  if (v18)
  {
    objc_msgSend_username(v9, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v22, (uint64_t)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend_username(v9, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v12, v30, (uint64_t)v26, v29);

    }
    objc_msgSend_username(v9, v24, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v12, v32, (uint64_t)v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v8);
    v18 = (_PCSIdentitySetData *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v18 = (_PCSIdentitySetData *)objc_msgSend__copyStingrayIdentitiesForService_forBackingExplicitCredentialsAccount_withError_(a1, v35, (uint64_t)v8, v9, a5);
      if (v18)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v33, v36, (uint64_t)v18, v8);
        CFRelease(v18);
      }
    }

  }
  objc_sync_exit(v12);

  return v18;
}

- (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  _PCSIdentitySetData *v27;

  v8 = a3;
  v11 = a4;
  if (*MEMORY[0x1E0C95280] && objc_msgSend_refetchPCSIdentitySet(self, v9, v10))
  {
    v12 = (void *)objc_opt_class();
    objc_msgSend_sharedFakeIdentitySetsByServiceByUsername(v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v15);
    objc_msgSend_username(v11, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_length(v18, v19, v20);

    if (v21)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend_username(v11, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v15, v26, (uint64_t)v22, v25);

    }
    objc_sync_exit(v15);

  }
  v27 = (_PCSIdentitySetData *)objc_msgSend_copyTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v9, (uint64_t)v8, v11, a5);

  return v27;
}

+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError;
  id v10;
  const char *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const void *v18;
  CFTypeRef v19;
  BOOL v20;
  id v21;
  _PCSIdentitySetData *Mutable;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  const char *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  CFTypeRef cf;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = 0;
  cf = 0;
  TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError_(CKDPCSIdentityManager, v8, (uint64_t)v7, a4, &v38);
  v10 = v38;
  if (TestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_withError)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = v10;
    if (v10)
    {
      if (!a5)
      {
LABEL_36:
        v18 = 0;
        v16 = 0;
LABEL_37:
        Mutable = 0;
        goto LABEL_38;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("Couldn't fetch identity set for service %@ to add to a new identity set."), v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
        goto LABEL_36;
    }
    v21 = objc_retainAutorelease(v13);
    v13 = v21;
LABEL_19:
    v18 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v14 = PCSIdentitySetCopyIdentities();
  if (!v14)
  {
    if (!a5)
    {
      v13 = 0;
      goto LABEL_36;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 5000, CFSTR("Empty dictionary returned while copying identities. Can't add identities for %@ to mutable identity set."), v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_19;
  }
  v16 = (void *)v14;
  v18 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  v19 = cf;
  if (v18)
    v20 = cf == 0;
  else
    v20 = 0;
  if (v20)
  {
    Mutable = (_PCSIdentitySetData *)PCSIdentitySetCreateMutable();
    v19 = cf;
    if (Mutable && !cf)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend_allValues(v16, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v34, v40, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v35 != v29)
              objc_enumerationMutation(v25);
            v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            if ((PCSIdentitySetAddIdentity() & 1) == 0)
            {
              if (a5)
              {
                objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v32, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't add app-specific service identity (%@) to new identity set: %@"), v31, Mutable);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
              }
              CFRelease(Mutable);

              v13 = 0;
              goto LABEL_37;
            }
          }
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v32, (uint64_t)&v34, v40, 16);
          if (v28)
            continue;
          break;
        }
      }

      PCSIdentitySetSetCurrentIdentity();
      v13 = 0;
      goto LABEL_38;
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create a mutable identity set for service: %@"), v7);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      goto LABEL_21;
    }
    v13 = 0;
  }
  else
  {
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5000, v7);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 0;
LABEL_20:
      Mutable = 0;
LABEL_21:
      *a5 = v21;
LABEL_38:
      v19 = cf;
      goto LABEL_39;
    }
    v13 = 0;
    Mutable = 0;
  }
LABEL_39:
  if (v19)
  {
    CFRelease(v19);
    cf = 0;
  }
  if (v18)
    CFRelease(v18);

  return Mutable;
}

+ (id)_generatePCSIdentityOptionsForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = 0;
    objc_msgSend_iCloudAuthTokenWithError_(v8, v9, (uint64_t)&v50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v50;
    v12 = v11;
    if (v10 && !v11)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend_username(v8, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v17, (uint64_t)v16, *MEMORY[0x1E0D82B58]);

      objc_msgSend_password(v8, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v21, (uint64_t)v20, *MEMORY[0x1E0D82B38]);

      objc_msgSend_dsid(v8, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, *MEMORY[0x1E0D82B18]);

      objc_msgSend_setObject_forKeyedSubscript_(v13, v26, (uint64_t)v7, *MEMORY[0x1E0D82B48]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v27, MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D82B28]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v28, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D82B50]);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v29, (uint64_t)v10, *MEMORY[0x1E0D82B10]);
      objc_msgSend_accountPropertiesForDataclass_(v8, v30, (uint64_t)CFSTR("com.apple.Dataclass.KeychainSync"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("escrowProxyUrl"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v34, (uint64_t)v33, *MEMORY[0x1E0D82B20]);

      objc_msgSend_accountPropertiesForDataclass_(v8, v35, (uint64_t)CFSTR("com.apple.Dataclass.Ubiquity"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)CFSTR("apsEnv"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v13, v39, (uint64_t)v38, *MEMORY[0x1E0D82B60]);

      v42 = (void *)objc_msgSend_copy(v13, v40, v41);
LABEL_15:

      goto LABEL_16;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v43 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v45 = v43;
      objc_msgSend_username(v8, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v48;
      v53 = 2112;
      v54 = v12;
      _os_log_error_impl(&dword_1BE990000, v45, OS_LOG_TYPE_ERROR, "Error fetching iCloud auth token for account %@: %@", buf, 0x16u);

      if (a5)
        goto LABEL_11;
    }
    else if (a5)
    {
LABEL_11:
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v44, *MEMORY[0x1E0C94B20], 2011, v12, CFSTR("Error fetching iCloud auth token"));
      v42 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v42 = 0;
    goto LABEL_15;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1017, CFSTR("Account %@ is not a CKDBackingExplicitCredentialsAccount"), v8);
    v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
LABEL_16:

  return v42;
}

+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 withError:(id *)a5
{
  return MEMORY[0x1E0DE7D20](CKDPCSIdentityManager, sel__rollTestAccountIdentitySetForService_forBackingExplicitCredentialsAccount_oldIdentityID_newIdentityID_withError_, a3);
}

+ (BOOL)_rollTestAccountIdentitySetForService:(id)a3 forBackingExplicitCredentialsAccount:(id)a4 oldIdentityID:(id *)a5 newIdentityID:(id *)a6 withError:(id *)a7
{
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  os_log_t *v20;
  void *v21;
  const char *v22;
  const void *v23;
  const char *v24;
  const void *v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  int isEqualToString;
  const char *v32;
  char v33;
  void *v34;
  void *v35;
  NSObject *v37;
  const char *v38;
  const void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  char v44;
  uint64_t v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend__generatePCSIdentityOptionsForService_forBackingExplicitCredentialsAccount_withError_(a1, v14, (uint64_t)v12, v13, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_mutableCopy(v15, v16, v17);

  if (v18)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D82B40]);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = (os_log_t *)MEMORY[0x1E0C952D8];
    v21 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v40 = v21;
      objc_msgSend_username(v13, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v43;
      _os_log_debug_impl(&dword_1BE990000, v40, OS_LOG_TYPE_DEBUG, "Fetching PCS identity set for account %@", buf, 0xCu);

    }
    v23 = (const void *)PCSIdentitySetup();
    if (!v23)
    {
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5001, 0, CFSTR("Couldn't setup PCS identities from stingray"));
        v27 = 0;
        v29 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
        v29 = 0;
      }
      v33 = 1;
LABEL_22:
      v35 = v27;
      v34 = v29;
      if (!v23)
        goto LABEL_28;
      goto LABEL_27;
    }
    v25 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();
    if (v25)
    {
      PCSPublicIdentityGetPublicID();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (a5)
        *a5 = objc_retainAutorelease(v26);
      if (PCSIdentityRollIdentity())
      {
        v45 = PCSIdentitySetCopyCurrentPublicIdentityWithError();
        PCSPublicIdentityGetPublicID();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v27, v30, (uint64_t)v29);
        if (isEqualToString)
        {
          if (!a7)
          {
            v39 = (const void *)v45;
            goto LABEL_43;
          }
          v44 = isEqualToString;
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v32, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("Rolling PCS identities for service %@ was unsuccessful"), v12);
          goto LABEL_38;
        }
        v44 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v29);
        CFRelease(v23);
        v23 = (const void *)PCSIdentitySetup();
        if (!v23)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v37 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = 0;
            _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Error setting up PCS identity set: %@", buf, 0xCu);
            if (a7)
              goto LABEL_37;
          }
          else if (a7)
          {
LABEL_37:
            objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v38, *MEMORY[0x1E0C94B20], 5001, 0, CFSTR("Couldn't setup PCS identities from stingray"));
LABEL_38:
            v39 = (const void *)v45;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
            LOBYTE(isEqualToString) = v44;
LABEL_43:
            v33 = isEqualToString ^ 1;
            CFRelease(v25);
            if (v39)
              CFRelease(v39);
            goto LABEL_22;
          }
        }
        v39 = (const void *)v45;
        goto LABEL_42;
      }
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 5001, 0, CFSTR("Couldn't roll PCS identities for service %@"), v12);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = v27;
      CFRelease(v25);
      v34 = 0;
      v33 = 0;
    }
    else
    {
      if (a7)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v24, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("Couldn't get a public identity"));
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = 0;
      v33 = 0;
      v35 = 0;
    }
LABEL_27:
    CFRelease(v23);
    v29 = v34;
LABEL_28:

    goto LABEL_29;
  }
  v33 = 0;
LABEL_29:

  return v33;
}

+ (id)_copyPCSIdentitiesForBackingMockAccount:(id)a3 withError:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  const char *v34;
  id v35;
  NSObject *v36;
  const char *v37;
  id *v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  _QWORD v50[5];

  v50[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = a4;
    v41 = v5;
    objc_msgSend_testAccount(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsIdentitiesData(v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3710];
    v13 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    v50[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v50, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v13, v16, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v11;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v12, v18, (uint64_t)v17, v11, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = v19;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v43, v49, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v44;
LABEL_4:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v21);
        v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v27);
        objc_msgSend_objectForKeyedSubscript_(v21, v24, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (const void *)PCSIdentitySetCreateFromExternalForm();
        v31 = *MEMORY[0x1E0C95300];
        if (!v30)
          break;
        if (v31 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v32 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "PCS identity set fetched:", buf, 2u);
        }
        v42 = (void *)PCSIdentitySetCopyService();
        v33 = v42;
        PCSIdentitySetEnumeratePublicKeys();

        objc_msgSend_setObject_forKeyedSubscript_(v20, v34, (uint64_t)v30, v28);
        CFRelease(v30);

        if (v25 == ++v27)
        {
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v43, v49, 16);
          if (v25)
            goto LABEL_4;
          goto LABEL_14;
        }
      }
      if (v31 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v5 = v41;
      v36 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = 0;
        _os_log_error_impl(&dword_1BE990000, v36, OS_LOG_TYPE_ERROR, "Error unarchiving a mock PCS service identity: %@", buf, 0xCu);
        if (!v39)
          goto LABEL_22;
      }
      else if (!v39)
      {
LABEL_22:

        v35 = 0;
        goto LABEL_23;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Error unarchiving a mock PCS service identity"));
      *v39 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_14:

    v35 = v20;
    v5 = v41;
LABEL_23:

  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 1017, CFSTR("Account %@ is not a CKDBackingMockAccount"), v5);
    v35 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (BOOL)_setIdentitySet:(_PCSIdentitySetData *)a3 forServiceName:(id)a4 backingMockAccount:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a4;
  v10 = a5;
  v12 = (void *)objc_msgSend__copyPCSIdentitiesForBackingMockAccount_withError_(CKDPCSIdentityManager, v11, (uint64_t)v10, a6);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)a3, v9);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1BE9BB1E0;
  v28 = sub_1BE9BAE98;
  v29 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BEC35164;
  v23[3] = &unk_1E78381F8;
  v23[4] = &v24;
  objc_msgSend_CKMapValues_(v12, v14, (uint64_t)v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = objc_retainAutorelease((id)v25[5]);
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v15, (uint64_t)v16, 1, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_testAccount(v10, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_daemonSetPCSIdentitiesData_(v20, v21, (uint64_t)v17);

  _Block_object_dispose(&v24, 8);
  return v17 != 0;
}

+ (id)sharedMockIdentitySetsByServiceByIdentifier
{
  if (qword_1ED702C68 != -1)
    dispatch_once(&qword_1ED702C68, &unk_1E7838218);
  return (id)qword_1ED702C60;
}

+ (void)clearSharedMockIdentitySetsCache
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  id v12;

  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, a1, CFSTR("CKDPCSIdentityManager.m"), 888, CFSTR("Only for testing"));

  }
  v4 = (void *)objc_opt_class();
  objc_msgSend_sharedMockIdentitySetsByServiceByIdentifier(v4, v5, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v12, v7, v8);

}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5
{
  return (_PCSIdentitySetData *)MEMORY[0x1E0DE7D20](CKDPCSIdentityManager, sel__getTestAccountIdentitySetForService_forBackingMockAccount_shouldFaultInIdentities_withError_, a3);
}

+ (_PCSIdentitySetData)_getTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 shouldFaultInIdentities:(BOOL)a5 withError:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const void *Mutable;
  NSObject *v40;
  const void *Master;
  const void *Service;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  _PCSIdentitySetData *v49;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v7 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend_sharedMockIdentitySetsByServiceByIdentifier(CKDPCSIdentityManager, v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v13);
  objc_msgSend_identifier(v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_length(v16, v17, v18);

  if (v19)
  {
    objc_msgSend_identifier(v10, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v23, (uint64_t)v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v29 = (void *)objc_msgSend__copyPCSIdentitiesForBackingMockAccount_withError_(CKDPCSIdentityManager, v25, (uint64_t)v10, a6);
      if (v29)
      {
        objc_msgSend_identifier(v10, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v31, (uint64_t)v29, v30);

      }
    }
    objc_msgSend_identifier(v10, v25, v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v33, (uint64_t)v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      Mutable = 0;
      if (v7)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v40 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v57 = v9;
          v58 = 2112;
          v59 = v10;
          _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "No pre-existing identity for service %@ on account %@. That's unexpected. Filling one out", buf, 0x16u);
        }
        Mutable = (const void *)PCSIdentitySetCreateMutable();
        Master = (const void *)PCSIdentityCreateMaster();
        PCSIdentitySetAddIdentityWithError();
        Service = (const void *)PCSIdentityCreateService();
        PCSIdentitySetAddIdentityWithError();
        if (Service)
          CFRelease(Service);
        if (Master)
          CFRelease(Master);
        objc_msgSend_identifier(v10, v43, v44);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v52, (uint64_t)v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v53, v54, (uint64_t)Mutable, v9);

        objc_msgSend__setIdentitySet_forServiceName_backingMockAccount_withError_(CKDPCSIdentityManager, v55, (uint64_t)Mutable, v9, v10, a6);
      }
      else if (a6)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v37, *MEMORY[0x1E0C94B20], 5000, 0, CFSTR("No pre-existing identity for service %@ on account %@"), v9, v10);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (Mutable)
        CFRelease(Mutable);
    }
    objc_msgSend_identifier(v10, v37, v38);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v46, (uint64_t)v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v47, v48, (uint64_t)v9);
    v49 = (_PCSIdentitySetData *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v49 = 0;
  }
  objc_sync_exit(v13);

  return v49;
}

+ (_PCSIdentitySetData)copyTestAccountIdentitySetForService:(id)a3 forBackingMockAccount:(id)a4 withError:(id *)a5
{
  uint64_t TestAccountIdentitySetForService_forBackingMockAccount_withError;
  id v7;
  BOOL v8;
  id v9;
  _PCSIdentitySetData *v10;
  BOOL v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  TestAccountIdentitySetForService_forBackingMockAccount_withError = objc_msgSend__getTestAccountIdentitySetForService_forBackingMockAccount_withError_(CKDPCSIdentityManager, a2, (uint64_t)a3, a4, &v15);
  v7 = v15;
  if (TestAccountIdentitySetForService_forBackingMockAccount_withError)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    buf[0] = 0;
    v10 = (_PCSIdentitySetData *)PCSIdentitySetCopySet();
    v11 = v10 == 0;
    if (v10)
      v12 = buf[0] == 0;
    else
      v12 = 0;
    if (v12)
    {
      v9 = 0;
      goto LABEL_21;
    }
    v9 = (id)buf[0];
  }
  else
  {
    v9 = v7;
    v10 = 0;
    v11 = 1;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v13 = *MEMORY[0x1E0C952D8];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    if (v11)
      goto LABEL_15;
LABEL_19:
    CFRelease(v10);
    if (a5)
      goto LABEL_16;
LABEL_20:
    v10 = 0;
    goto LABEL_21;
  }
  LODWORD(buf[0]) = 138412290;
  *(_QWORD *)((char *)buf + 4) = v9;
  _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "Error copying per-silo identity set: %@", (uint8_t *)buf, 0xCu);
  if (!v11)
    goto LABEL_19;
LABEL_15:
  if (!a5)
    goto LABEL_20;
LABEL_16:
  v9 = objc_retainAutorelease(v9);
  v10 = 0;
  *a5 = v9;
LABEL_21:

  return v10;
}

- (BOOL)isManateeAvailableWithError:(id *)a3
{
  id *v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v3 = a3;
  objc_msgSend_deviceContext(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v8, v12, (uint64_t)v11, 0, v3);

  return (char)v3;
}

- (BOOL)currentServiceIsManatee
{
  uint64_t v2;
  CKDPCSIdentityManager *v3;
  void *v4;
  const char *v5;

  v3 = self;
  objc_msgSend_serviceName(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_serviceIsManatee_(v3, v5, (uint64_t)v4);

  return (char)v3;
}

- (BOOL)serviceIsManatee:(id)a3
{
  id v4;
  char IsManatee;

  v4 = a3;
  if (*MEMORY[0x1E0C95280] && self->_serviceIsManateeForUnitTests)
    IsManatee = 1;
  else
    IsManatee = PCSServiceItemTypeIsManatee();

  return IsManatee;
}

- (_PCSIdentityData)debugSharingIdentity
{
  CKDPCSIdentityManager *v2;
  const void *Named;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_debugIdentity)
  {
    Named = (const void *)PCSIdentitySetCreateNamed();
    v2->_debugIdentity = (_PCSIdentityData *)PCSIdentitySetCopyCurrentIdentityWithError();
    CFRelease(Named);
  }
  objc_sync_exit(v2);

  return v2->_debugIdentity;
}

- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4
{
  _PCSPublicIdentityData *v5;
  _PCSPublicIdentityData *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  _PCSPublicIdentityData *v15;
  __int16 v16;
  _PCSPublicIdentityData *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (_PCSPublicIdentityData *)a3;
  if (v5)
  {
    v6 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateFromKeyData();
    v7 = (void *)*MEMORY[0x1E0C952F8];
    v8 = *MEMORY[0x1E0C95300];
    if (v6)
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v12 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2114;
        v17 = v5;
        _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Created sharing identity %@ from public key %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v9 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v5;
        v16 = 2112;
        v17 = 0;
        _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Couldn't create a sharing identity from public key %{public}@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't create a sharing identity from public key %@"), v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create a sharing identity from a nil public key", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3
{
  _PCSIdentityData *RandomCompactRaw;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint8_t buf[4];
  _PCSIdentityData *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  RandomCompactRaw = (_PCSIdentityData *)PCSIdentityCreateRandomCompactRaw();
  v5 = (void *)*MEMORY[0x1E0C952F8];
  v6 = *MEMORY[0x1E0C95300];
  if (RandomCompactRaw)
  {
    if (v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v9 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = RandomCompactRaw;
      _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Created sharing identity %@", buf, 0xCu);
    }
  }
  else
  {
    if (v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v5);
    v7 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = 0;
      _os_log_error_impl(&dword_1BE990000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a new sharing identity: %@", buf, 0xCu);
      if (!a3)
        return RandomCompactRaw;
      goto LABEL_6;
    }
    if (a3)
    {
LABEL_6:
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't create a sharing identity"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return RandomCompactRaw;
}

- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  void *ExportedRawCompact;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v13;
  uint8_t buf[4];
  _PCSIdentityData *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    ExportedRawCompact = (void *)PCSIdentityCreateExportedRawCompact();
    v7 = (void *)*MEMORY[0x1E0C952F8];
    v8 = *MEMORY[0x1E0C95300];
    if (ExportedRawCompact)
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v13 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v15 = a3;
        v16 = 2112;
        v17 = ExportedRawCompact;
        _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Created data from sharing identity %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v9 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = a3;
        v16 = 2112;
        v17 = 0;
        _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Couldn't create data from sharing identity %@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't create data from web sharing identity %@"), a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    return ExportedRawCompact;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create data from a NULL sharing identity", buf, 2u);
    }
    return 0;
  }
}

- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4
{
  _PCSIdentityData *v5;
  _PCSIdentityData *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  _PCSIdentityData *v15;
  __int16 v16;
  _PCSIdentityData *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (_PCSIdentityData *)a3;
  if (v5)
  {
    v6 = (_PCSIdentityData *)PCSIdentityCreateFromRaw();
    v7 = (void *)*MEMORY[0x1E0C952F8];
    v8 = *MEMORY[0x1E0C95300];
    if (v6)
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v12 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v5;
        _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Created sharing identity %@ from data %@", buf, 0x16u);
      }
    }
    else
    {
      if (v8 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v7);
      v9 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = 0;
        _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Couldn't create a sharing identity from data %@: %@", buf, 0x16u);
      }
      if (a4)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't create a sharing identity from data %@"), v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Refusing to try to create a sharing identity from nil data", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4
{
  return (_PCSIdentityData *)PCSDeriveIdentity();
}

- (_PCSIdentitySetData)createTemporaryCloudKitFeaturesSigningIdentitySetForServiceName:(id)a3 withError:(id *)a4
{
  id v5;
  const char *v6;
  _PCSIdentitySetData *Mutable;
  const void *Master;
  const void *Service;
  void *v11;

  v5 = a3;
  Mutable = (_PCSIdentitySetData *)PCSIdentitySetCreateMutable();
  if (Mutable)
  {
    Master = (const void *)PCSIdentityCreateMaster();
    PCSIdentitySetAddIdentityWithError();
    Service = (const void *)PCSIdentityCreateService();
    PCSIdentitySetAddIdentityWithError();
    v11 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 5000, v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Master = 0;
    Service = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (Service)
    CFRelease(Service);
  if (Master)
    CFRelease(Master);

  return Mutable;
}

- (BOOL)identitySet:(_PCSIdentitySetData *)a3 containsPublicKey:(id)a4 error:(id *)a5
{
  BOOL result;
  const void *v6;
  const void *PublicID;
  const void *v8;
  BOOL v9;

  result = 0;
  if (a3 && a4)
  {
    v6 = (const void *)PCSPublicIdentityCreateFromKeyData();
    if (!v6)
      return 0;
    PublicID = (const void *)PCSPublicIdentityGetPublicID();
    if (PublicID)
    {
      v8 = PublicID;
      CFRetain(PublicID);
      CFRelease(v6);
      v6 = (const void *)PCSIdentitySetCopyIdentity();
      CFRelease(v8);
      if (!v6)
        return 0;
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    CFRelease(v6);
    return v9;
  }
  return result;
}

- (BOOL)_hasCurrentKeyForService:(id)a3 inIdentitySet:(_PCSIdentitySetData *)a4 withError:(id *)a5
{
  id v8;
  BOOL v9;
  const char *v10;
  const void *v11;
  NSObject *v12;
  const char *v13;
  const __CFDictionary *v14;
  char v15;
  NSObject *v16;
  const char *v17;
  CFErrorRef cf;
  uint8_t buf[4];
  _PCSIdentitySetData *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  CFErrorRef v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = 0;
  if (!v8 || !a4)
    goto LABEL_22;
  cf = 0;
  v11 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (*MEMORY[0x1E0C95280]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v10, (uint64_t)CFSTR("ForceSecurityErrorOnIdentityValidation")))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Forcing error from security when validating the identity", buf, 2u);
    }
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("The connection to service named com.apple.securityd.general was invalidated.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v27, &v26, 1);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    cf = CFErrorCreate(0, CFSTR("NSCocoaErrorDomain"), 4099, v14);

    v15 = 0;
    if (!v11)
    {
LABEL_13:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v16 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v21 = a4;
        v22 = 2114;
        v23 = v8;
        v24 = 2112;
        v25 = cf;
        _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Identity set %@ was expected to have a current key set %{public}@. %@", buf, 0x20u);
        if (!a5)
        {
LABEL_18:
          v15 = 0;
          v9 = 0;
          if (!v11)
            goto LABEL_20;
          goto LABEL_19;
        }
      }
      else if (!a5)
      {
        goto LABEL_18;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5000, cf, CFSTR("Couldn't create a PCS identity"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else
  {
    v15 = 1;
    if (!v11)
      goto LABEL_13;
  }
  if (cf)
    goto LABEL_13;
LABEL_19:
  CFRelease(v11);
  v9 = v15;
LABEL_20:
  if (cf)
    CFRelease(cf);
LABEL_22:

  return v9;
}

- (id)PCSServiceStringFromCKServiceType:(unint64_t)a3
{
  __CFString *v4;
  id *v5;

  v4 = CFSTR("com.apple.reminders");
  switch(a3)
  {
    case 0uLL:
      objc_msgSend_serviceName(self, a2, a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    case 1uLL:
      v5 = (id *)MEMORY[0x1E0D82A78];
      return *v5;
    case 2uLL:
      v5 = (id *)MEMORY[0x1E0D82AF0];
      return *v5;
    case 3uLL:
      v5 = (id *)MEMORY[0x1E0D82AC0];
      return *v5;
    case 5uLL:
      return CFSTR("com.apple.CloudKitFeatures");
    case 6uLL:
      v4 = CFSTR("com.apple.CloudKitFeaturesStingray");
      return v4;
    default:
      return v4;
  }
}

+ (id)overrideKeys
{
  uint64_t v2;
  void *v6;
  const char *v7;

  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, a1, CFSTR("CKDPCSIdentityManager.m"), 1185, CFSTR("Only suitable for testing"));

  }
  if (qword_1ED702C78 != -1)
    dispatch_once(&qword_1ED702C78, &unk_1E7838238);
  return (id)qword_1ED702C70;
}

- (void)clearOverrides
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  const char *v6;
  void *v8;
  const char *v9;
  CKDPCSIdentityManager *obj;

  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKDPCSIdentityManager.m"), 1199, CFSTR("Only suitable for testing"));

  }
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_setForceSecurityErrorOnIdentityValidation_(obj, v4, 0);
  objc_msgSend_setServiceIsManateeForUnitTests_(obj, v5, 0);
  objc_msgSend_setRefetchPCSIdentitySet_(obj, v6, 0);
  objc_sync_exit(obj);

}

- (void)setOverride:(id)a3 value:(id)a4
{
  const char *v7;
  uint64_t v8;
  id v9;
  CKDPCSIdentityManager *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  v9 = a4;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDPCSIdentityManager.m"), 1208, CFSTR("Only suitable for testing"));

  }
  v10 = self;
  objc_sync_enter(v10);
  if (objc_msgSend_isEqualToString_(v23, v11, (uint64_t)CFSTR("ForceSecurityErrorOnIdentityValidation")))
  {
    objc_msgSend_setForceSecurityErrorOnIdentityValidation_(v10, v12, 1);
  }
  else if (objc_msgSend_isEqualToString_(v23, v12, (uint64_t)CFSTR("MasqueradeAsManateeIdentity")))
  {
    v15 = objc_msgSend_BOOLValue(v9, v13, v14);
    objc_msgSend_setServiceIsManateeForUnitTests_(v10, v16, v15);
  }
  else if (objc_msgSend_isEqualToString_(v23, v13, (uint64_t)CFSTR("RefetchPCSIdentitySet")))
  {
    v19 = objc_msgSend_BOOLValue(v9, v17, v18);
    objc_msgSend_setRefetchPCSIdentitySet_(v10, v20, v19);
  }
  objc_sync_exit(v10);

}

- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  CKDPCSIdentityManager *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  char v12;
  const char *v13;
  void *v15;
  const char *v16;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, CFSTR("CKDPCSIdentityManager.m"), 1223, CFSTR("Only suitable for testing"));

  }
  v8 = self;
  objc_sync_enter(v8);
  if (objc_msgSend_isEqualToString_(v7, v9, (uint64_t)CFSTR("ForceSecurityErrorOnIdentityValidation")))
  {
    v12 = objc_msgSend_forceSecurityErrorOnIdentityValidation(v8, v10, v11);
    objc_msgSend_setForceSecurityErrorOnIdentityValidation_(v8, v13, 0);
  }
  else
  {
    v12 = 0;
  }
  objc_sync_exit(v8);

  return v12;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (CKDAccount)account
{
  return (CKDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (NSString)cachedAccountDSID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedAccountDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)PCSIdentityWrappersByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPCSIdentityWrappersByServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (_PCSIdentityData)debugIdentity
{
  return self->_debugIdentity;
}

- (void)setDebugIdentity:(_PCSIdentityData *)a3
{
  self->_debugIdentity = a3;
}

- (BOOL)forceSecurityErrorOnIdentityValidation
{
  return self->_forceSecurityErrorOnIdentityValidation;
}

- (void)setForceSecurityErrorOnIdentityValidation:(BOOL)a3
{
  self->_forceSecurityErrorOnIdentityValidation = a3;
}

- (BOOL)serviceIsManateeForUnitTests
{
  return self->_serviceIsManateeForUnitTests;
}

- (void)setServiceIsManateeForUnitTests:(BOOL)a3
{
  self->_serviceIsManateeForUnitTests = a3;
}

- (BOOL)refetchPCSIdentitySet
{
  return self->_refetchPCSIdentitySet;
}

- (void)setRefetchPCSIdentitySet:(BOOL)a3
{
  self->_refetchPCSIdentitySet = a3;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PCSIdentityWrappersByServiceName, 0);
  objc_storeStrong((id *)&self->_cachedAccountDSID, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
