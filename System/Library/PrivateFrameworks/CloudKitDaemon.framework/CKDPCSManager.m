@implementation CKDPCSManager

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

+ (id)_legacyServiceNameForContainerID:(id)a3
{
  uint64_t v3;
  __CFString *v4;
  id *v5;

  v3 = objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) - 1;
  v4 = CFSTR("com.apple.SafariShared.CloudTabs");
  switch(v3)
  {
    case 0:
      v5 = (id *)MEMORY[0x1E0D82A58];
      goto LABEL_18;
    case 1:
      v5 = (id *)MEMORY[0x1E0D82A70];
      goto LABEL_18;
    case 2:
      v5 = (id *)MEMORY[0x1E0D82A68];
      goto LABEL_18;
    case 3:
      v5 = (id *)MEMORY[0x1E0D82A78];
      goto LABEL_18;
    case 4:
      v5 = (id *)MEMORY[0x1E0D82AB0];
      goto LABEL_18;
    case 5:
      return CFSTR("com.apple.icloud.events");
    case 8:
      v5 = (id *)MEMORY[0x1E0D82B00];
      goto LABEL_18;
    case 12:
      v5 = (id *)MEMORY[0x1E0D82AB8];
      goto LABEL_18;
    case 15:
      v5 = (id *)MEMORY[0x1E0D82AE0];
      goto LABEL_18;
    case 19:
      v5 = (id *)MEMORY[0x1E0D82AD0];
      goto LABEL_18;
    case 20:
      v5 = (id *)MEMORY[0x1E0D82AD8];
      goto LABEL_18;
    case 25:
      v5 = (id *)MEMORY[0x1E0D82AE8];
      goto LABEL_18;
    case 27:
      return v4;
    case 29:
      v5 = (id *)MEMORY[0x1E0D82A60];
      goto LABEL_18;
    case 31:
      v5 = (id *)MEMORY[0x1E0D82AA8];
      goto LABEL_18;
    case 32:
      v5 = (id *)MEMORY[0x1E0D82AF8];
      goto LABEL_18;
    default:
      v5 = (id *)MEMORY[0x1E0D82AC0];
LABEL_18:
      v4 = (__CFString *)*v5;
      return v4;
  }
}

- (unint64_t)serviceTypeForSharing
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_containerID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (v7 == 4)
    return 1;
  if (objc_msgSend_currentServiceIsManatee(self, v8, v9))
    return 0;
  return 2;
}

- (void)updateAccount:(id)a3 clearPCSCacheHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend_synchronizeQueue(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA5DC90;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (CKDPCSManager)initWithContainer:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void **v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  int v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  CKDPCSIdentityManager *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t OnlyManatee;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t OnlyManatee_clientSDKVersion;
  void *v102;
  uint64_t v103;
  void *v104;
  CKDPCSManagerMissingIdentitiesContext *v105;
  const char *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const __CFString *v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  objc_super v124;
  uint8_t buf[4];
  const __CFString *v126;
  __int16 v127;
  id v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v124.receiver = self;
  v124.super_class = (Class)CKDPCSManager;
  v10 = -[CKDPCSManager init](&v124, sel_init);
  if (v10)
  {
    objc_msgSend_containerID(v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("%s.%@.%p"), "com.apple.cloudkit.pcsmanager.queue", v14, v6);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (const char *)objc_msgSend_UTF8String(v122, v16, v17);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    v21 = (void *)*((_QWORD *)v10 + 13);
    *((_QWORD *)v10 + 13) = v20;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v10 + 13), "com.apple.cloudkit.pcsmanager.queue", (void *)1, 0);
    v123 = (void *)v14;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("%@.%@"), CFSTR("com.apple.CloudKit.CKDPCSManager.callbackQueue"), v14);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend_UTF8String(v23, v24, v25);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v26, v27);
    v29 = (void *)*((_QWORD *)v10 + 14);
    *((_QWORD *)v10 + 14) = v28;

    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v10 + 7);
    *((_QWORD *)v10 + 7) = v32;

    v34 = (void **)(v10 + 32);
    objc_storeStrong((id *)v10 + 4, a4);
    objc_storeWeak((id *)v10 + 9, v6);
    objc_msgSend_containerID(v6, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)*((_QWORD *)v10 + 10);
    *((_QWORD *)v10 + 10) = v37;

    objc_msgSend_deviceContext(v6, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v10 + 2, v41);
    objc_msgSend_applicationID(v6, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifier(v44, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)*((_QWORD *)v10 + 11);
    *((_QWORD *)v10 + 11) = v47;

    objc_msgSend_options(v6, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v10[8] = objc_msgSend_forceEnableReadOnlyManatee(v51, v52, v53);

    objc_msgSend_options(v6, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v10 + 12) = objc_msgSend_mmcsEncryptionSupport(v56, v57, v58);

    objc_msgSend_options(v6, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v10[9] = objc_msgSend_useZoneWidePCS(v61, v62, v63);

    objc_msgSend_encryptionServiceName(v6, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (v66)
    {
      v68 = v66;
    }
    else
    {
      v69 = (void *)objc_opt_class();
      objc_msgSend_containerID(v6, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__legacyServiceNameForContainerID_(v69, v73, (uint64_t)v72);
      v68 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v74 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      if (v67)
        v116 = CFSTR("client specified");
      else
        v116 = CFSTR("containerIdentifier default");
      v121 = (void *)*((_QWORD *)v10 + 10);
      v117 = v74;
      objc_msgSend_ckShortDescription(v121, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v126 = v116;
      v127 = 2114;
      v128 = v68;
      v129 = 2114;
      v130 = v120;
      _os_log_debug_impl(&dword_1BE990000, v117, OS_LOG_TYPE_DEBUG, "Using %{public}@ PCS Service Name %{public}@ with containerID %{public}@", buf, 0x20u);

    }
    objc_msgSend_accountID(*v34, v75, v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    if (v79)
    {
      objc_msgSend_accountID(*v34, v77, v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend_isEqualToString_(v80, v81, *MEMORY[0x1E0C95320]) ^ 1;

    }
    else
    {
      v82 = 0;
    }

    if (PCSServiceItemTypeIsManatee() && v82)
    {
      objc_msgSend_accountDataSecurityObserver(v41, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_manateeStatusForAccount_isSecondaryAccount_completionHandler_(v85, v86, (uint64_t)v7, 0, 0);

    }
    if (v82)
    {
      objc_msgSend_accountDataSecurityObserver(v41, v83, v84);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_walrusStatusForAccount_isSecondaryAccount_checkCache_allowFetch_completionHandler_(v87, v88, (uint64_t)v7, 0, 1, 1, 0);

    }
    v89 = [CKDPCSIdentityManager alloc];
    v90 = *((_QWORD *)v10 + 2);
    objc_msgSend_options(v6, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v93, v94, v95);
    v99 = objc_msgSend_clientSDKVersion(v6, v97, v98);
    OnlyManatee_clientSDKVersion = objc_msgSend_initWithAccount_deviceContext_serviceName_forceEnableReadOnlyManatee_clientSDKVersion_(v89, v100, (uint64_t)v7, v90, v68, OnlyManatee, v99);
    v102 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = OnlyManatee_clientSDKVersion;

    v103 = objc_opt_new();
    v104 = (void *)*((_QWORD *)v10 + 5);
    *((_QWORD *)v10 + 5) = v103;

    v105 = [CKDPCSManagerMissingIdentitiesContext alloc];
    v107 = (void *)objc_msgSend_initWithContainer_(v105, v106, (uint64_t)v6);
    objc_msgSend_sharedNotifier(CKDPCSNotifier, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(v10, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addContext_forManagerUUID_(v110, v114, (uint64_t)v107, v113);

  }
  return (CKDPCSManager *)v10;
}

- (BOOL)_isAllowlistedKeyRollingContainerID:(id)a3
{
  return objc_msgSend_specialContainerType(a3, a2, (uint64_t)a3) == 18;
}

- (id)_pcsObjectKindForCKDPCSBlobType:(unint64_t)a3
{
  id *v3;

  if (a3 - 1 > 4)
    v3 = (id *)MEMORY[0x1E0D829D8];
  else
    v3 = (id *)qword_1E7831BF0[a3 - 1];
  return *v3;
}

- (_PCSIdentityData)debugSharingIdentity
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  _PCSIdentityData *v6;

  objc_msgSend_identityManager(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_PCSIdentityData *)objc_msgSend_debugSharingIdentity(v3, v4, v5);

  return v6;
}

- (NSDate)lastMissingManateeIdentityErrorDateForCurrentService
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1BE9BAFA8;
  v9 = sub_1BE9BAD88;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1BEA5E4C8;
  v4[3] = &unk_1E78303D8;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

- (unint64_t)publicKeyVersionForServiceType:(unint64_t)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *NumberByName;
  const char *v8;
  uint64_t v9;
  unint64_t v10;

  if (a3 != 2 && a3 != 1)
  {
    if (!a3)
    {
      objc_msgSend_identityManager(self, a2, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceName(v3, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NumberByName = (void *)PCSServiceItemGetNumberByName();
      v10 = objc_msgSend_unsignedIntegerValue(NumberByName, v8, v9);

      return v10;
    }
    return 0;
  }
  return a3;
}

- (NSString)pcsServiceName
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_identityManager(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)currentServiceIsManatee
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char IsManatee;

  objc_msgSend_identityManager(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsManatee = objc_msgSend_currentServiceIsManatee(v3, v4, v5);

  return IsManatee;
}

- (void)setPCSServiceNameOverwrite:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_identityManager(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSServiceNameOverwrite_(v8, v7, (uint64_t)v4);

}

+ (id)noMatchingIdentityErrorForPCSError:(__CFError *)a3 withErrorCode:(int64_t)a4 description:(id)a5
{
  id v7;
  CFDictionaryRef v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v31;

  v7 = a5;
  if (a3)
  {
    if (CFErrorGetCode(a3) == 73)
    {
      v8 = CFErrorCopyUserInfo(a3);
      objc_msgSend_objectForKeyedSubscript_(v8, v9, *MEMORY[0x1E0D829B0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v8, v11, *MEMORY[0x1E0D829A8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v10, v13, (uint64_t)CFSTR(", "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v12, v15, (uint64_t)CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v21 = v17;
      if ((unint64_t)objc_msgSend_count(v10, v18, v19) >= 0xB)
      {
        objc_msgSend_subarrayWithRange_(v10, v20, 0, 10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v22, v23, (uint64_t)CFSTR(", "));
        v31 = v12;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB3940];
        v28 = objc_msgSend_count(v10, v26, v27);
        objc_msgSend_stringWithFormat_(v25, v29, (uint64_t)CFSTR("%@ ... (and %lu more)"), v24, v28 - 10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v31;
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], a4, a3, CFSTR("%@. Public keys on object: %@. Attempted public keys: %@"), v7, v16, v21);
      a3 = (__CFError *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a3 = 0;
    }
  }

  return a3;
}

- (id)copyPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_identityManager(self, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copyPublicKeyForService_withError_(v6, v7, a3, a4);

  return v8;
}

- (id)copyAllPublicKeysForService:(unint64_t)a3 withError:(id *)a4
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_identityManager(self, a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copyAllPublicKeysForService_withError_(v6, v7, a3, a4);

  return v8;
}

- (_PCSPublicIdentityData)copyDiversifiedPublicIdentityForService:(unint64_t)a3 withError:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  _PCSPublicIdentityData *v17;

  objc_msgSend_containerScopedUserIDProvider(self, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerScopedUserID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v10, v11, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identityManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (_PCSPublicIdentityData *)objc_msgSend_copyDiversifiedIdentityForService_userIDEntropy_withError_(v15, v16, a3, v12, a4);

  return v17;
}

- (id)copyDiversifiedPublicKeyForService:(unint64_t)a3 withError:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  objc_msgSend_containerScopedUserIDProvider(self, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerScopedUserID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v10, v11, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identityManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copyDiversifiedPublicKeyForService_userIDEntropy_withError_(v15, v16, a3, v12, a4);

  return v17;
}

- (id)participantPublicKeyForServiceType:(unint64_t)a3 error:(id *)a4
{
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v16 = 0;
    v6 = (id *)&v16;
    v7 = objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, a2, 2, &v16);
  }
  else
  {
    v15 = 0;
    v6 = (id *)&v15;
    v7 = objc_msgSend_copyPublicKeyForService_withError_(self, a2, a3, &v15);
  }
  v8 = (void *)v7;
  v9 = *v6;
  v11 = v9;
  if (!v8 || v9)
  {
    if (!v9)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a public key for our participant"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v14 = &stru_1E7838F48;
      if (a3 == 2)
        v14 = CFSTR("diversified ");
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Couldn't get a %{public}@key for service: %@", buf, 0x16u);
    }
    v8 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v8;
}

- (BOOL)addRandomShareeToPCS:(_OpaquePCSShareProtection *)a3
{
  const void *RandomSharingIdentityWithError;
  id v6;
  const char *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v15;
  const char *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 434, CFSTR("For testing purposes only"));

  }
  v17 = 0;
  RandomSharingIdentityWithError = (const void *)objc_msgSend_createRandomSharingIdentityWithError_(self, a2, (uint64_t)&v17);
  v6 = v17;
  v8 = v6;
  if (RandomSharingIdentityWithError)
    v9 = v6 == 0;
  else
    v9 = 0;
  v10 = v9;
  if (v9)
  {
    v11 = (id)objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v7, (uint64_t)RandomSharingIdentityWithError, a3, 0);
    goto LABEL_16;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v12 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Failed to create random sharing identity: %@", buf, 0xCu);
    if (!RandomSharingIdentityWithError)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (RandomSharingIdentityWithError)
LABEL_16:
    CFRelease(RandomSharingIdentityWithError);
LABEL_17:

  return v10;
}

- (_PCSIdentityData)createRandomSharingIdentityWithError:(id *)a3
{
  void *v4;
  const char *v5;
  _PCSIdentityData *RandomSharingIdentityWithError;

  objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  RandomSharingIdentityWithError = (_PCSIdentityData *)objc_msgSend_createRandomSharingIdentityWithError_(v4, v5, (uint64_t)a3);

  return RandomSharingIdentityWithError;
}

- (_PCSIdentityData)createCombinedIdentityWithOutOfNetworkPrivateKey:(id)a3 publicSharingIdentity:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _PCSIdentityData *CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;

  v6 = a4;
  v7 = a3;
  objc_msgSend_identityManager(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (_PCSIdentityData *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v10, v11, (uint64_t)v7, v6);

  return CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;
}

- (id)createProtectionInfoFromOONPrivateKey:(id)a3 privateToken:(id)a4 OONProtectionInfo:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const void *CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;
  const char *v18;
  const void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  dispatch_block_t *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v59;
  const char *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend_identityManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = (const void *)objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v15, v16, (uint64_t)v12, v11);

  v65 = 0;
  v19 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v18, (uint64_t)v10, CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v65);

  v20 = v65;
  v23 = v20;
  if (!v19)
  {
    objc_msgSend_identityManager(self, v21, v22);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend_dataFromSharingIdentity_error_(v42, v43, (uint64_t)CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v64);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v64;

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v67 = v23;
      v68 = 2112;
      v69 = v44;
      v70 = 2112;
      v71 = v45;
      _os_log_error_impl(&dword_1BE990000, v46, OS_LOG_TYPE_ERROR, "OON keyswap: Failed decrypting calling participant protectionInfo: %@. CombinedOONIdentity: %@ (%@)", buf, 0x20u);
    }

    v30 = 0;
    v24 = 0;
LABEL_43:
    v49 = 0;
    if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
      goto LABEL_45;
    goto LABEL_44;
  }
  v63 = v20;
  v24 = (void *)objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v21, 2, &v63);
  v25 = v63;

  if (v25 || !v24)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v47 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v25;
      _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Couldn't create a diversified public key for the owner participant: %@", buf, 0xCu);
      if (v25)
      {
LABEL_25:
        v30 = 0;
        v49 = 0;
        v23 = v25;
        if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
          goto LABEL_45;
        goto LABEL_44;
      }
    }
    else if (v25)
    {
      goto LABEL_25;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v48, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create a diversified public key for the owner participant"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    goto LABEL_43;
  }
  objc_msgSend_identityManager(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v30 = (void *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v28, v29, (uint64_t)v24, &v62);
  v23 = v62;

  v31 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v32 = (void *)*MEMORY[0x1E0C952F8];
  v33 = (_QWORD *)MEMORY[0x1E0C95300];
  v34 = *MEMORY[0x1E0C95300];
  if (v23 || !v30)
  {
    if (v34 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v32);
    v50 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v23;
      v68 = 2114;
      v69 = v24;
      _os_log_error_impl(&dword_1BE990000, v50, OS_LOG_TYPE_ERROR, "Couldn't create an identity from the public sharing key for participant: %@ (key was %{public}@)", buf, 0x16u);
      if (v23)
        goto LABEL_43;
    }
    else if (v23)
    {
      goto LABEL_43;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v51, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create an identity from the public sharing key: %@ (key was %@)"), 0, v24);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  if (v34 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v32);
  v35 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v30;
    _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Created public identity for participant: %@", buf, 0xCu);
  }
  objc_msgSend_addPublicIdentity_toSharePCS_permission_(self, v36, (uint64_t)v30, v19, 1);
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v39 = (void *)v37;
    if (*v33 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v31);
    v40 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v39;
      _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "Couldn't add public identity to per-participant PCS: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v41, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't add public identity to per-participant PCS: %@"), v39);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }
  objc_msgSend_removeSharingIdentity_fromSharePCS_(self, v38, (uint64_t)CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, v19);
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v23 = (id)v52;
    if (*v33 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v31);
    v54 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v23;
      _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "OON keyswap: Failed to remove combined identity: %@", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v61 = 0;
  objc_msgSend_dataFromSharePCS_pcsBlobType_error_(self, v53, (uint64_t)v19, 4, &v61);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v61;
  v56 = v55;
  if (v49 && !v55)
  {
    v23 = 0;
    if (!CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
      goto LABEL_45;
LABEL_44:
    CFRelease(CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity);
    goto LABEL_45;
  }
  if (*v33 != -1)
    dispatch_once(MEMORY[0x1E0C95300], *v31);
  v59 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v56;
    _os_log_error_impl(&dword_1BE990000, v59, OS_LOG_TYPE_ERROR, "OON keyswap: failed to convert PCS blob to data: %@", buf, 0xCu);
  }
  objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v60, *MEMORY[0x1E0C94B20], 5005, v56, CFSTR("Couldn't serialize PCS data after key swap on OON PCS blob"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity)
    goto LABEL_44;
LABEL_45:
  if (v30)
    CFRelease(v30);
  if (v19)
    CFRelease(v19);
  if (v23)
  {
    v57 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v23);
  }
  else
  {
    v57 = v49;
  }

  return v57;
}

- (void)canDecryptInvitedProtectionData:(id)a3 participantProtectionInfo:(id)a4 serviceType:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v10 = a3;
  v11 = a6;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEA5F540;
  v15[3] = &unk_1E7831298;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(self, v14, (uint64_t)a4, 4, a5, v15);

}

- (id)dataFromSharingIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataFromSharingIdentity_error_(v6, v7, (uint64_t)a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_PCSIdentityData)createSharingIdentityFromData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _PCSIdentityData *SharingIdentityFromData_error;

  v6 = a3;
  objc_msgSend_identityManager(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SharingIdentityFromData_error = (_PCSIdentityData *)objc_msgSend_createSharingIdentityFromData_error_(v9, v10, (uint64_t)v6, a4);

  return SharingIdentityFromData_error;
}

- (_PCSPublicIdentityData)createPublicSharingIdentityFromPublicKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  _PCSPublicIdentityData *PublicSharingIdentityFromPublicKey_error;

  v6 = a3;
  objc_msgSend_identityManager(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PublicSharingIdentityFromPublicKey_error = (_PCSPublicIdentityData *)objc_msgSend_createPublicSharingIdentityFromPublicKey_error_(v9, v10, (uint64_t)v6, a4);

  return PublicSharingIdentityFromPublicKey_error;
}

- (id)_addIdentity:(_PCSIdentitySetData *)a3 withService:(unint64_t)a4 toPCS:(_OpaquePCSShareProtection *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const void *v13;
  const char *v14;
  void *v15;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  CFTypeRef cf;
  uint8_t buf[4];
  const void *v28;
  __int16 v29;
  _OpaquePCSShareProtection *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1017, CFSTR("Can't add an identity to a nil pcs"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  cf = 0;
  objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v9, v10, a4);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (a3)
  {
    v11 = PCSIdentitySetCopyCurrentPublicIdentityWithError();
    v13 = (const void *)v11;
    if (!v11 || cf)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 5000, a5, cf);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1BEA5FC74;
      v21[3] = &unk_1E78312C0;
      v21[4] = &v22;
      v21[5] = a5;
      v21[6] = v11;
      objc_msgSend__onSynchronizeQueue_(self, v12, (uint64_t)v21);
      if (*((_BYTE *)v23 + 24))
      {
LABEL_20:
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v20 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v13;
          v29 = 2112;
          v30 = a5;
          _os_log_debug_impl(&dword_1BE990000, v20, OS_LOG_TYPE_DEBUG, "Added identity %@ to PCS %@", buf, 0x16u);
        }
        v15 = 0;
        goto LABEL_25;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add our public identity to the PCS object"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = 0;
      _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "Warn: Couldn't get a self identity: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v18, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a self identity to add to the share PCS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  if (!v15)
    goto LABEL_20;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v13;
    v29 = 2112;
    v30 = a5;
    v31 = 2112;
    v32 = v15;
    _os_log_error_impl(&dword_1BE990000, v19, OS_LOG_TYPE_ERROR, "Error adding identity %@ to PCS %@: %@", buf, 0x20u);
  }
LABEL_25:
  if (v13)
    CFRelease(v13);
  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)addIdentityForService:(unint64_t)a3 toPCS:(_OpaquePCSShareProtection *)a4
{
  void *v7;
  const char *v8;
  const void *v9;
  id v10;
  const char *v11;
  BOOL v12;
  void *v13;
  const char *v14;
  const __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 1017, CFSTR("Asked to add an identity to an null PCS in addIdentityForService:toPCS:"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_identityManager(self, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v9 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v7, v8, a3, 1, &v19);
  v10 = v19;

  if (v10)
    v12 = 1;
  else
    v12 = v9 == 0;
  if (v12)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      if (a3 - 1 > 5)
        v16 = CFSTR("Current Service");
      else
        v16 = off_1E7831C48[a3 - 1];
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v10;
      v17 = v13;
      _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "Warn: Couldn't get a %@ identity set: %@", buf, 0x16u);

      if (v10)
      {
LABEL_11:
        if (!v9)
          return v10;
        goto LABEL_14;
      }
    }
    else if (v10)
    {
      goto LABEL_11;
    }
    v18 = *MEMORY[0x1E0C94B20];
    if (a3 - 1 > 5)
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, v18, 5000, CFSTR("Couldn't get a %@ identity set to add to PCS"), CFSTR("Current Service"));
    else
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, v18, 5000, CFSTR("Couldn't get a %@ identity set to add to PCS"), off_1E7831C48[a3 - 1]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
      return v10;
    goto LABEL_14;
  }
  objc_msgSend__addIdentity_withService_toPCS_(self, v11, (uint64_t)v9, a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  CFRelease(v9);
  return v10;
}

- (BOOL)sharingFingerprintsContainPublicKeyWithData:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  char isEqualToData;
  const char *v12;
  char v13;
  void *v14;
  id v15;
  const char *v16;
  char v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  char v28;
  const char *v29;
  uint64_t v30;
  id v31;
  void *v32;
  const char *v33;
  const void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v7 = a3;
  if (v7)
  {
    v46 = 0;
    v8 = (void *)objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v6, 2, &v46);
    v9 = v46;
    isEqualToData = objc_msgSend_isEqualToData_(v8, v10, (uint64_t)v7);
    if (a4 && v9)
      *a4 = objc_retainAutorelease(v9);

    if ((isEqualToData & 1) != 0)
      goto LABEL_6;
    v45 = v9;
    v14 = (void *)objc_msgSend_copyDiversifiedPublicKeyForService_withError_(self, v12, 1, &v45);
    v15 = v45;

    v17 = objc_msgSend_isEqualToData_(v14, v16, (uint64_t)v7);
    if (a4 && v15)
      *a4 = objc_retainAutorelease(v15);

    if ((v17 & 1) != 0)
    {
      v13 = 1;
      v9 = v15;
      goto LABEL_25;
    }
    objc_msgSend_identityManager(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v15;
    v22 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v20, v21, 2, 0, &v44);
    v23 = v44;

    objc_msgSend_identityManager(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v23;
    v28 = objc_msgSend_identitySet_containsPublicKey_error_(v26, v27, (uint64_t)v22, v7, &v43);
    v9 = v43;

    if (v22)
      CFRelease(v22);
    if (a4 && v9)
    {
      v31 = objc_retainAutorelease(v9);
      *a4 = v31;
      if ((v28 & 1) != 0)
      {
        v13 = 1;
        v9 = v31;
        goto LABEL_25;
      }
    }
    else if ((v28 & 1) != 0)
    {
LABEL_6:
      v13 = 1;
LABEL_25:

      goto LABEL_26;
    }
    objc_msgSend_identityManager(self, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v9;
    v34 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v32, v33, 1, 0, &v42);
    v35 = v42;

    objc_msgSend_identityManager(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v35;
    v13 = objc_msgSend_identitySet_containsPublicKey_error_(v38, v39, (uint64_t)v34, v7, &v41);
    v9 = v41;

    if (v34)
      CFRelease(v34);
    if (a4 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
    }
    goto LABEL_25;
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (id)generateOONPrivateKeyWithError:(id *)a3
{
  const void *RandomCompactRaw;
  dispatch_block_t *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  os_log_t *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint8_t buf[4];
  const void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  RandomCompactRaw = (const void *)PCSIdentityCreateRandomCompactRaw();
  v5 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v6 = (void *)*MEMORY[0x1E0C952F8];
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  v8 = *MEMORY[0x1E0C95300];
  if (RandomCompactRaw)
  {
    if (v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v6);
    v14 = (os_log_t *)MEMORY[0x1E0C952B0];
    v15 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = RandomCompactRaw;
      _os_log_debug_impl(&dword_1BE990000, v15, OS_LOG_TYPE_DEBUG, "Created OON PCS identity %@", buf, 0xCu);
    }
    v13 = (void *)PCSIdentityCopyExportedPrivateKey();
    if (v13)
    {
      v12 = 0;
    }
    else
    {
      if (*v7 != -1)
        dispatch_once(MEMORY[0x1E0C95300], *v5);
      v16 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = 0;
        _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Error extracting private key from OON identity: %@", buf, 0xCu);
      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't export OON private key"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (a3)
      {
        v12 = objc_retainAutorelease(v18);
        *a3 = v12;
      }
    }
    CFRelease(RandomCompactRaw);
  }
  else
  {
    if (v8 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v6);
    v9 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = 0;
      _os_log_error_impl(&dword_1BE990000, v9, OS_LOG_TYPE_ERROR, "Error creating OON identity: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, 0, CFSTR("Couldn't generate OON identity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    v13 = 0;
  }

  return v13;
}

+ (id)publicKeyIDFromIdentity:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  _OpaquePCSShareProtection *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)PCSFPCopyKeyIDs();
    if (objc_msgSend_count(v4, v5, v6))
    {
      objc_msgSend_lastObject(v4, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = PCSFPCopyPrivateKey();
      if (v10)
      {
        v11 = (const void *)v10;
        v12 = PCSIdentityCopyPublicIdentity();
        if (v12)
        {
          v13 = (const void *)v12;
          v14 = (void *)PCSPublicIdentityCopyCurrentKeyFingerprint();
          CFRelease(v13);
        }
        else
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v17 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          {
            v19 = 138412290;
            v20 = v3;
            _os_log_error_impl(&dword_1BE990000, v17, OS_LOG_TYPE_ERROR, "Couldn't get a public identity from PCS %@", (uint8_t *)&v19, 0xCu);
          }
          v14 = 0;
        }
        CFRelease(v11);
        goto LABEL_22;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v16 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Couldn't get private key from pcs %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v15 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Couldn't get keyIDs from pcs %@", (uint8_t *)&v19, 0xCu);
      }
      v9 = 0;
    }
    v14 = 0;
LABEL_22:
    v3 = v14;

  }
  return v3;
}

- (void)_locked_markMissingIdentitiesFromFailedDecryptError:(__CFError *)a3 serviceName:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const void *v46;
  uint64_t v47;
  const void *v48;
  uint64_t PublicKey;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
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
  uint64_t v67;
  id v68;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_synchronizeQueue(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!a3)
  {
    if (!v6)
      goto LABEL_16;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v70 = v6;
      _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, "We are missing identities for service %{public}@. Will notify clients if any keys arrive.", buf, 0xCu);
    }
    objc_msgSend_sharedNotifier(CKDPCSNotifier, v29, v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v6;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v31, (uint64_t)&v68, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(self, v32, v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v34, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addServicesWithMissingIdentities_forManagerUUID_withAccount_(v12, v36, (uint64_t)v14, v20, v23);
    goto LABEL_14;
  }
  objc_msgSend_userInfo(a3, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, *MEMORY[0x1E0D829A8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v14, v15, v16))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v70 = v6;
      v71 = 2114;
      v72 = v14;
      _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "A PCS blob could not be decrypted for service %{public}@. %{public}@ are keys that can decrypt the zone. Will notify clients if any of these keys arrive.", buf, 0x16u);
    }
    objc_msgSend_sharedNotifier(CKDPCSNotifier, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uuid(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addMissingIdentityPublicKeys_forManagerUUID_withAccount_(v20, v27, (uint64_t)v14, v23, v26);

LABEL_14:
  }

LABEL_16:
  if (*MEMORY[0x1E0C95280])
  {
    if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v10, (uint64_t)CFSTR("FakeOutCurrentIdentityIsMissing")))
    {
      objc_msgSend_identityManager(self, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_PCSServiceStringFromCKServiceType_(v39, v40, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_identityManager(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v44, v45, 0, 1, 0);

      if (v46)
      {
        v47 = PCSIdentitySetCopyCurrentIdentityWithError();
        if (v47)
        {
          v48 = (const void *)v47;
          PublicKey = PCSIdentityGetPublicKey();
          if (PublicKey)
          {
            v52 = PublicKey;
            objc_msgSend_sharedNotifier(CKDPCSNotifier, v50, v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v52;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v54, (uint64_t)&v67, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_uuid(self, v56, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_account(self, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addMissingIdentityPublicKeys_forManagerUUID_withAccount_(v53, v62, (uint64_t)v55, v58, v61);

          }
          CFRelease(v48);
        }
        CFRelease(v46);
      }

    }
    if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v37, (uint64_t)CFSTR("ClearContainersOnPCSNotifier")))
    {
      objc_msgSend_sharedNotifier(CKDPCSNotifier, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addTestOverrides_(v65, v66, (uint64_t)&unk_1E78AF668);

    }
  }

}

- (void)_locked_createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 keySyncAnalytics:(id)a5 completionHandler:(id)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  int v65;
  void *v66;
  NSObject *v67;
  CKDZonePCSData *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  void *v82;
  NSObject *v83;
  id v84;
  const char *v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  int IsManatee;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  BOOL v101;
  __CFString **v102;
  const char *v103;
  const char *v104;
  NSObject *v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  CFTypeRef cf;
  CFTypeRef v114;
  _BOOL4 v115;
  void *v116;
  id v117;
  id v118;
  _QWORD block[4];
  CKDZonePCSData *v120;
  id v121;
  id v122;
  _QWORD v123[5];
  id v124;
  id v125;
  id v126;
  id v127;
  _QWORD v128[7];
  id v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  char v133;
  CFTypeRef v134;
  uint8_t buf[4];
  id v136;
  __int16 v137;
  id v138;
  _QWORD v139[3];
  _QWORD v140[6];

  v115 = a3;
  v140[3] = *MEMORY[0x1E0C80C00];
  v117 = a4;
  v9 = a5;
  v118 = a6;
  objc_msgSend_synchronizeQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v134 = 0;
  objc_msgSend_identityManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v15, v16, 0);

  v130 = 0;
  v131 = &v130;
  v132 = 0x2020000000;
  v133 = 0;
  objc_msgSend_identityManager(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0;
  v21 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v19, v20, 0, 1, &v129);
  v22 = v129;

  if (v22 || !v21)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v52 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v136 = v22;
      _os_log_impl(&dword_1BE990000, v52, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createZonePCSWithError: %@", buf, 0xCu);
    }
    if (!v22)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v53, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a PCS identity set"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_domain(v22, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v55, v56, *MEMORY[0x1E0C94B20]))
      v44 = objc_msgSend_code(v22, v57, v58) == 5000;
    else
      v44 = 0;

    v116 = 0;
    v35 = 0;
    v51 = 0;
  }
  else
  {
    v25 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
    if (v25 && !v134)
    {
      v139[0] = *MEMORY[0x1E0D829E8];
      objc_msgSend_identityManager(self, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceName(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = *MEMORY[0x1E0D829C0];
      v140[0] = v29;
      v140[1] = v25;
      v31 = *MEMORY[0x1E0D829C8];
      v139[1] = v30;
      v139[2] = v31;
      v140[2] = *MEMORY[0x1E0D829E0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v140, v139, 3);
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = PCSFPCreate();
      v35 = (void *)v33;
      if (v134 || !v33)
      {
        objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't create a new PCSShareProtectionRef"));
        v59 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = PCSFPCreatePrivateKey();
        if (v37)
        {
          v114 = (CFTypeRef)PCSIdentityCopyPublicIdentity();
          v128[0] = MEMORY[0x1E0C809B0];
          v128[1] = 3221225472;
          v128[2] = sub_1BEA616F8;
          v128[3] = &unk_1E78312C0;
          v128[4] = &v130;
          v128[5] = v35;
          v128[6] = v114;
          objc_msgSend__onSynchronizeQueue_(self, v38, (uint64_t)v128);
          cf = (CFTypeRef)v37;
          if (*((_BYTE *)v131 + 24))
          {
            objc_msgSend_containerID(self, v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend_specialContainerType(v41, v42, v43) == 25;

            if (!v44)
            {
              v51 = 0;
              goto LABEL_30;
            }
            if (*MEMORY[0x1E0C95280])
            {
              objc_msgSend__pcsTestOverrideForKey_(self, v45, (uint64_t)CFSTR("ForceSingleIdentityForRemindersZone"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend_BOOLValue(v47, v48, v49);

              if ((v50 & 1) != 0)
              {
                v51 = 0;
                v44 = 0;
LABEL_30:
                v22 = 0;
                goto LABEL_39;
              }
            }
            objc_msgSend_identityManager(self, v45, v46);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v127 = 0;
            v63 = objc_msgSend_copyIdentitySetWithType_options_error_(v61, v62, 4, 1, &v127);
            v22 = v127;

            if (*MEMORY[0x1E0C95280])
              v65 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v64, (uint64_t)CFSTR("ForceKeyRegistrySyncOnRemindersZoneCreation"));
            else
              v65 = 0;
            if (v22 || !v63 || v65)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v106 = *MEMORY[0x1E0C952D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v136 = v22;
                _os_log_impl(&dword_1BE990000, v106, OS_LOG_TYPE_INFO, "Warn: Couldn't get a Reminders identity set: %@", buf, 0xCu);
              }
              if (!v22)
              {
                objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v107, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a Reminders identity set to add to PCS"));
                v22 = (id)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend_domain(v22, v107, v108);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_isEqualToString_(v109, v110, *MEMORY[0x1E0C94B20]))
                v44 = objc_msgSend_code(v22, v111, v112) == 5000;
              else
                v44 = 0;

              v51 = 4;
              goto LABEL_39;
            }
            objc_msgSend__addIdentity_withService_toPCS_(self, v64, v63, 4, v35);
            v60 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v39, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add our public identity to the PCS object"));
            v60 = objc_claimAutoreleasedReturnValue();
          }
          v22 = (id)v60;
          v51 = 0;
          v44 = 0;
LABEL_39:
          CFRelease(cf);
          if (v114)
            CFRelease(v114);
          goto LABEL_41;
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v36, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to add a protection key to the zone"));
        v59 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (id)v59;
      v44 = 0;
      v51 = 0;
LABEL_41:
      CFRelease(v25);
      goto LABEL_42;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5000, 0, v134);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v116 = 0;
    v35 = 0;
    v51 = 0;
    v44 = 1;
    if (v25)
      goto LABEL_41;
  }
LABEL_42:
  if (v134)
  {
    CFRelease(v134);
    v134 = 0;
  }
  v66 = (void *)*MEMORY[0x1E0C952F8];
  if (v35)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v66);
    v67 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v136 = v35;
      _os_log_debug_impl(&dword_1BE990000, v67, OS_LOG_TYPE_DEBUG, "Created new zone PCS: %@", buf, 0xCu);
    }
    v68 = objc_alloc_init(CKDZonePCSData);
    objc_msgSend_setPcs_(v68, v69, (uint64_t)v35);
    CFRelease(v35);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v66);
    v72 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v136 = v22;
      _os_log_error_impl(&dword_1BE990000, v72, OS_LOG_TYPE_ERROR, "Error creating new zone PCS: %@", buf, 0xCu);
    }
    v68 = 0;
  }
  if (!*MEMORY[0x1E0C95280])
  {
LABEL_68:
    if (v44 && v115)
    {
      objc_msgSend_identityManager(self, v70, v71);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_PCSServiceStringFromCKServiceType_(v80, v81, v51);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v83 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        v136 = v82;
        v137 = 2114;
        v138 = v117;
        _os_log_debug_impl(&dword_1BE990000, v83, OS_LOG_TYPE_DEBUG, "Attempting user key sync before retrying zone PCS creation for service %{public}@ and operation %{public}@.", buf, 0x16u);
      }
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = sub_1BEA6172C;
      v123[3] = &unk_1E7831310;
      v123[4] = self;
      v84 = v82;
      v124 = v84;
      v125 = v117;
      v126 = v118;
      objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(self, v85, v51, 0, 0x1E784B7C8, v125, v123);

      goto LABEL_90;
    }
    goto LABEL_76;
  }
  if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v70, (uint64_t)CFSTR("ForceUserKeyRegistrySyncRetryOnZonePCSCreation")))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v74 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v74, OS_LOG_TYPE_DEBUG, "Forcing user key sync retry for unit tests", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v75, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create a PCS identity for unit tests"));
    v76 = objc_claimAutoreleasedReturnValue();

    v44 = 1;
    v22 = (id)v76;
    goto LABEL_68;
  }
  if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v73, (uint64_t)CFSTR("ForceImmediateUserKeyRegistrySyncFailure")))goto LABEL_68;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v77 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1BE990000, v77, OS_LOG_TYPE_DEBUG, "Forcing user key sync failure for unit tests", buf, 2u);
    if (!v22)
      goto LABEL_67;
LABEL_76:
    objc_msgSend_domain(v22, v70, v71);
    goto LABEL_77;
  }
  if (v22)
    goto LABEL_76;
LABEL_67:
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v70, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to preflight PCS identities because of unit tests"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_domain(v22, v78, v79);
LABEL_77:
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = *MEMORY[0x1E0C94B20];
  if (!objc_msgSend_isEqualToString_(v86, v88, *MEMORY[0x1E0C94B20])
    || objc_msgSend_code(v22, v89, v90) != 5000)
  {
    goto LABEL_81;
  }
  IsManatee = objc_msgSend_currentServiceIsManatee(self, v91, v92);

  if (IsManatee)
  {
    v96 = (void *)MEMORY[0x1E0C94FF8];
    objc_msgSend_userInfo(v22, v94, v95);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v86, v97, *MEMORY[0x1E0CB3388]);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_error_format_(v96, v99, v87, 5008, v98, CFSTR("Failed to decrypt. Keys unavailable even after synchronization"));
    v100 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v100;
LABEL_81:

  }
  if (v9)
  {
    if (v22)
      v101 = 1;
    else
      v101 = v68 == 0;
    v102 = off_1E7834D20;
    if (v101)
      v102 = off_1E7834D28;
    objc_msgSend_setOverallResult_(v9, v94, (uint64_t)*v102);
    objc_msgSend_setError_(v9, v103, (uint64_t)v22);
    objc_msgSend_sendCoreAnalyticsEventForKeySync_(self, v104, (uint64_t)v9);
  }
  objc_msgSend_callbackQueue(self, v94, v95);
  v105 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA61A90;
  block[3] = &unk_1E782EBF0;
  v122 = v118;
  v120 = v68;
  v22 = v22;
  v121 = v22;
  dispatch_async(v105, block);

  v84 = v122;
LABEL_90:

  if (v21)
    CFRelease(v21);
  _Block_object_dispose(&v130, 8);

}

- (void)createZonePCSWithSyncKeyRegistryRetry:(BOOL)a3 requestorOperationID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend_synchronizeQueue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1BEA61B78;
  v15[3] = &unk_1E7831AE8;
  v18 = a3;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)createZonePCSWithRequestorOperationID:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_createZonePCSWithSyncKeyRegistryRetry_requestorOperationID_completionHandler_, 1);
}

- (_OpaquePCSShareProtection)createZonePCSWithError:(id *)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const void *v11;
  _OpaquePCSShareProtection *v12;
  _QWORD *v13;
  os_log_t *v14;
  const char *v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  _OpaquePCSShareProtection *v28;
  const char *v29;
  const void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  _OpaquePCSShareProtection *v45;
  _OpaquePCSShareProtection *v46;
  _OpaquePCSShareProtection *v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v54;
  CFTypeRef cf;
  id v56;
  _QWORD v57[7];
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  CFTypeRef v63;
  _QWORD v64[3];
  _QWORD v65[3];
  uint8_t buf[4];
  _OpaquePCSShareProtection *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  objc_msgSend_identityManager(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v5, v6, 0);

  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  objc_msgSend_identityManager(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v11 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v9, v10, 0, 1, &v58);
  v12 = (_OpaquePCSShareProtection *)v58;

  v13 = (_QWORD *)MEMORY[0x1E0C95300];
  v14 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!v12 && v11)
  {
    v17 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
    if (!v17 || v63)
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 5000, 0, v63);
      v45 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      v12 = v45;
      if (a3)
        *a3 = objc_retainAutorelease(v45);
      v28 = 0;
      v25 = 0;
      v30 = 0;
      if (!v17)
        goto LABEL_44;
      goto LABEL_43;
    }
    v64[0] = *MEMORY[0x1E0D829E8];
    objc_msgSend_identityManager(self, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceName(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D829C0];
    v65[0] = v21;
    v65[1] = v17;
    v23 = *MEMORY[0x1E0D829C8];
    v64[1] = v22;
    v64[2] = v23;
    v65[2] = *MEMORY[0x1E0D829E0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v65, v64, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = PCSFPCreate();
    v28 = (_OpaquePCSShareProtection *)v26;
    if (v63 || !v26)
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v27, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't create a new PCSShareProtectionRef"));
      v46 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      v12 = v46;
      if (a3)
        *a3 = objc_retainAutorelease(v46);
      if (!v28)
        goto LABEL_32;
    }
    else
    {
      v30 = (const void *)PCSFPCreatePrivateKey();
      if (v30)
      {
        cf = (CFTypeRef)PCSIdentityCopyPublicIdentity();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = sub_1BEA62220;
        v57[3] = &unk_1E78312C0;
        v57[4] = &v59;
        v57[5] = v28;
        v57[6] = cf;
        objc_msgSend__onSynchronizeQueue_(self, v31, (uint64_t)v57);
        if (*((_BYTE *)v60 + 24))
        {
          objc_msgSend_containerID(self, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend_specialContainerType(v34, v35, v36) == 25;

          if (!v37)
          {
            v12 = 0;
LABEL_41:
            if (cf)
              CFRelease(cf);
            goto LABEL_43;
          }
          objc_msgSend_identityManager(self, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          v54 = objc_msgSend_copyIdentitySetWithType_options_error_(v40, v41, 4, 1, &v56);
          v12 = (_OpaquePCSShareProtection *)v56;

          if (v12 || !v54)
          {
            if (*v13 != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v48 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v12;
              _os_log_impl(&dword_1BE990000, v48, OS_LOG_TYPE_INFO, "Warn: Couldn't get a Reminders identity set: %@", buf, 0xCu);
            }
            if (v12)
              goto LABEL_41;
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a Reminders identity set to add to PCS"));
            v43 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend__addIdentity_withService_toPCS_(self, v42, v54, 4, v28);
            v43 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v32, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add our public identity to the PCS object"));
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (_OpaquePCSShareProtection *)v43;
        goto LABEL_41;
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v29, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to add a protection key to the zone"));
      v47 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      v12 = v47;
      if (a3)
        *a3 = objc_retainAutorelease(v47);
    }
    CFRelease(v28);
    v28 = 0;
LABEL_32:
    v30 = 0;
LABEL_43:
    CFRelease(v17);
LABEL_44:
    CFRelease(v11);
    if (v30)
      CFRelease(v30);
    goto LABEL_46;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v44 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v12;
    _os_log_impl(&dword_1BE990000, v44, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createZonePCSWithError: %@", buf, 0xCu);
  }
  if (a3)
    *a3 = objc_retainAutorelease(v12);
  v30 = 0;
  v25 = 0;
  v28 = 0;
  if (v11)
    goto LABEL_44;
LABEL_46:
  if (v63)
  {
    CFRelease(v63);
    v63 = 0;
  }
  v50 = (void *)*MEMORY[0x1E0C952F8];
  if (v28)
  {
    if (*v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v50);
    v51 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v28;
      _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Created new zone PCS: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v50);
    v52 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v12;
      _os_log_error_impl(&dword_1BE990000, v52, OS_LOG_TYPE_ERROR, "Error creating new zone PCS: %@", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v59, 8);

  return v28;
}

- (id)dataFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  _OpaquePCSShareProtection *v4;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BAFA8;
  v21 = sub_1BE9BAD88;
  v22 = 0;
  if (a3)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEA62548;
    v16[3] = &unk_1E7831338;
    v16[5] = &v23;
    v16[6] = a3;
    v16[4] = &v17;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v16);
    if (v24[3] || !v18[5])
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't encode zone PCS data"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (a4)
        *a4 = objc_retainAutorelease(v7);
      v9 = (void *)v18[5];
      v18[5] = 0;

      v10 = (const void *)v24[3];
      if (v10)
      {
        CFRelease(v10);
        v24[3] = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v11 = (void *)*MEMORY[0x1E0C952F8];
    if (v18[5])
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v11);
      v12 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v13 = (void *)v18[5];
        *(_DWORD *)buf = 138412546;
        v28 = v4;
        v29 = 2112;
        v30 = v13;
        _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Created zone PCS data from zone PCS %@: %@.", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v11);
      v14 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v4;
        v29 = 2112;
        v30 = v8;
        _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Error creating zone PCS data from zone PCS %@: %@", buf, 0x16u);
      }
    }
    v4 = (_OpaquePCSShareProtection *)(id)v18[5];

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v4;
}

- (id)getAllPublicKeysForExportedData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  const void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  const void *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0;
  v9 = (const void *)objc_msgSend_createSharePCSFromEncryptedData_error_(self, v8, (uint64_t)v6, &v18);
  v10 = v18;
  v11 = v10;
  if (v9 && !v10)
  {
    v12 = PCSShareProtectionCopyPublicKeys();
    if (v12)
    {
      v13 = (const void *)v12;
      v17 = v7;
      CKCFArrayForEach();

      CFRelease(v9);
      v14 = v13;
    }
    else
    {
      v14 = v9;
    }
    CFRelease(v14);
    goto LABEL_15;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Error creating PCS from encrypted data %@: %@", buf, 0x16u);
    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v9)
LABEL_9:
    CFRelease(v9);
LABEL_10:
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
LABEL_15:

  return v7;
}

- (void)findSelfParticipantOnShareMetadata:(id)a3 invitationToken:(id)a4 completionHandler:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CKPCSManateeShareInvitation *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  dispatch_once_t *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  _BOOL4 v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  NSObject *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  const char *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  NSObject *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  id obj;
  void *v121;
  void *v122;
  id v123;
  void (**v124)(id, uint64_t);
  id v125;
  id v126;
  void *v127;
  void *v128;
  _QWORD block[4];
  void (**v131)(id, uint64_t);
  _BYTE *v132;
  _QWORD v133[5];
  id v134;
  id v135;
  NSObject *v136;
  _BYTE *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint8_t v150[128];
  _BYTE buf[24];
  char v152;
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v123 = a4;
  v124 = (void (**)(id, uint64_t))a5;
  v128 = v7;
  objc_msgSend_share(v7, v8, v9);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_currentServiceIsManatee(self, v10, v11))
  {
    v12 = [CKPCSManateeShareInvitation alloc];
    objc_msgSend_sharingInvitationData(v123, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_initWithData_(v12, v16, (uint64_t)v15);
    objc_msgSend_exportedPCSData(v17, v18, v19);
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_getAllPublicKeysForExportedData_error_(self, v20, (uint64_t)v121, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v99 = v22;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend_count(v122, v100, v101);
      _os_log_debug_impl(&dword_1BE990000, v99, OS_LOG_TYPE_DEBUG, "Got %lu pcs key(s) to match from dugong invitation", buf, 0xCu);

    }
    if (objc_msgSend_count(v122, v23, v24))
    {
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      obj = v122;
      v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v146, v154, 16);
      if (!v119)
        goto LABEL_39;
      v27 = *(_QWORD *)v147;
      *(_QWORD *)&v26 = 138412290;
      v117 = v26;
      v118 = *(_QWORD *)v147;
      while (1)
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v147 != v27)
          {
            v29 = v28;
            objc_enumerationMutation(obj);
            v28 = v29;
          }
          v30 = v28;
          v31 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * v28);
          if (*v21 != -1)
            dispatch_once(v21, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v32 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v117;
            *(_QWORD *)&buf[4] = v31;
            _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Matching participants with invitation public key: %@", buf, 0xCu);
          }
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          objc_msgSend_participants(v127, v33, v34, v117);
          v125 = (id)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v35, (uint64_t)&v142, v153, 16);
          if (!v38)
            goto LABEL_37;
          v39 = *(_QWORD *)v143;
          while (2)
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v143 != v39)
                objc_enumerationMutation(v125);
              v41 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v40);
              objc_msgSend_protectionInfoPublicKey(v41, v36, v37);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v44)
                goto LABEL_67;
              objc_msgSend_protectionInfo(v41, v42, v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v44)
                goto LABEL_35;
              v48 = objc_msgSend_acceptanceStatus(v41, v46, v47) == 2;

              if (!v48)
                goto LABEL_34;
              if (*v21 != -1)
                dispatch_once(v21, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v49 = (void *)*MEMORY[0x1E0C952D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
              {
                v59 = v49;
                objc_msgSend_participantID(v41, v60, v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v117;
                *(_QWORD *)&buf[4] = v62;
                _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "PPPCS public key is not present for participant %@, checking PPPCS blob", buf, 0xCu);

              }
              objc_msgSend_protectionInfo(v41, v50, v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_getAllPublicKeysForExportedData_error_(self, v53, (uint64_t)v52, 0);
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend_count(v54, v55, v56) != 1)
              {

LABEL_34:
                v44 = 0;
                goto LABEL_35;
              }
              objc_msgSend_firstObject(v54, v57, v58);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
LABEL_67:
                if (objc_msgSend_isEqualToData_(v44, v42, v31))
                {
                  objc_msgSend_setIsCurrentUser_(v41, v45, 1);
                  objc_msgSend_setCallingParticipant_(v128, v82, (uint64_t)v41);
                  v85 = objc_msgSend_acceptanceStatus(v41, v83, v84);
                  if (v85 == 2)
                  {
                    objc_msgSend_userIdentity(v41, v86, v87);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_userRecordID(v88, v89, v90);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recordName(v91, v92, v93);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();

                    if (*v21 != -1)
                      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                    v95 = (void *)*MEMORY[0x1E0C952D8];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
                    {
                      v113 = v95;
                      objc_msgSend_participantID(v41, v114, v115);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v116;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v94;
                      _os_log_debug_impl(&dword_1BE990000, v113, OS_LOG_TYPE_DEBUG, "Manatee share is already accepted by participant %@, filling anonymousID %@ for share metadata.", buf, 0x16u);

                    }
                    objc_msgSend_fillAnonymousCKUserID_(v128, v96, (uint64_t)v94);

                  }
                  if (*v21 != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v97 = (void *)*MEMORY[0x1E0C952D8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
                  {
                    v102 = v97;
                    objc_msgSend_callingParticipant(v128, v103, v104);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_recordID(v127, v106, v107);
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v105;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v108;
                    _os_log_debug_impl(&dword_1BE990000, v102, OS_LOG_TYPE_DEBUG, "Found current participant %@ on anonymous to server share %@", buf, 0x16u);

                  }
                  v124[2](v124, 1);

                  goto LABEL_64;
                }
              }
LABEL_35:

              ++v40;
            }
            while (v38 != v40);
            v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v36, (uint64_t)&v142, v153, 16);
            if (v38)
              continue;
            break;
          }
LABEL_37:

          v28 = v30 + 1;
          v27 = v118;
        }
        while (v30 + 1 != v119);
        v119 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v146, v154, 16);
        v27 = v118;
        if (!v119)
        {
LABEL_39:

          goto LABEL_63;
        }
      }
    }
    if (*v21 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v98 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v109 = v98;
      objc_msgSend_recordID(v127, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v112;
      _os_log_error_impl(&dword_1BE990000, v109, OS_LOG_TYPE_ERROR, "Could not get public key data from invitation token for share %@. This won't go well.", buf, 0xCu);

    }
LABEL_63:
    v124[2](v124, 0);

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v152 = 0;
    v64 = dispatch_group_create();
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    objc_msgSend_share(v7, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participants(v67, v68, v69);
    v126 = (id)objc_claimAutoreleasedReturnValue();

    v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v70, (uint64_t)&v138, v150, 16);
    v72 = MEMORY[0x1E0C809B0];
    if (v71)
    {
      v73 = *(_QWORD *)v139;
      do
      {
        for (i = 0; i != v71; ++i)
        {
          if (*(_QWORD *)v139 != v73)
            objc_enumerationMutation(v126);
          v75 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
          dispatch_group_enter(v64);
          objc_msgSend_protectionInfo(v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v133[0] = v72;
          v133[1] = 3221225472;
          v133[2] = sub_1BEA63194;
          v133[3] = &unk_1E7831388;
          v137 = buf;
          v133[4] = v75;
          v134 = v7;
          v135 = v127;
          v136 = v64;
          objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(self, v79, (uint64_t)v78, 4, 2, v133);

        }
        v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v80, (uint64_t)&v138, v150, 16);
      }
      while (v71);
    }

    dispatch_get_global_queue(0, 0);
    v81 = objc_claimAutoreleasedReturnValue();
    block[0] = v72;
    block[1] = 3221225472;
    block[2] = sub_1BEA633E0;
    block[3] = &unk_1E782ECB8;
    v131 = v124;
    v132 = buf;
    dispatch_group_notify(v64, v81, block);

    _Block_object_dispose(buf, 8);
  }
LABEL_64:

}

- (id)getCurrentIdentityExportedPrivateKey
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const void *v10;
  id v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  id v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  objc_msgSend_identityManager(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v4, v5, 0);

  objc_msgSend_identityManager(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v10 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v8, v9, 0, 1, &v21);
  v11 = v21;

  if (v11 || !v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v17 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "Failed to get current identity set trying to create anonymous userID %@", buf, 0xCu);
    }
    v15 = 0;
    v18 = 0;
    if (v10)
      goto LABEL_17;
  }
  else
  {
    v12 = PCSIdentitySetCopyCurrentIdentityWithError();
    v13 = (const void *)v12;
    if (!v22 && v12)
    {
      v14 = PCSIdentityCopyExportedPrivateKey();
      v15 = (void *)v14;
      if (v22 || !v14)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v16 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v22;
          _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Failed to get exported private key data trying to create anonymous userID: %@", buf, 0xCu);
        }
      }
      CFRelease(v10);
      v10 = v13;
LABEL_17:
      CFRelease(v10);
      v18 = v15;
      goto LABEL_18;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v22;
      _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Failed to get current identity trying to create anonymous userID: %@", buf, 0xCu);
    }
    CFRelease(v10);
    v15 = 0;
    v18 = 0;
    v10 = v13;
    if (v13)
      goto LABEL_17;
  }
LABEL_18:

  return v18;
}

- (id)generateOctopusAnonymousUserID
{
  const void *Named;
  const void *v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const void *v11;
  const char *v12;
  CC_LONG v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  uint8_t buf[4];
  void *v22;
  unsigned __int8 md[16];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  Named = (const void *)PCSIdentitySetCreateNamed();
  v3 = (const void *)PCSIdentitySetCopyCurrentIdentityWithError();
  v5 = (void *)PCSIdentityCopyExportedPrivateKey();
  if (Named)
    CFRelease(Named);
  if (v3)
    CFRelease(v3);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("%@-%@-%@-%@-%@-%@"), CFSTR("123456789"), CFSTR("com.apple.fake.container"), CFSTR("cloudkit.zoneshare"), CFSTR("TestZone"), CFSTR("🐥"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)md = 0u;
  v24 = 0u;
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v7, (uint64_t)md, 32, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (const void *)objc_msgSend_UTF8String(v6, v9, v10);
  v13 = objc_msgSend_lengthOfBytesUsingEncoding_(v6, v12, 4);
  CC_SHA256(v11, v13, md);
  objc_msgSend_CKLowercaseHexStringWithoutSpaces(v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(CFSTR("+"), v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Generated fake anonymous user ID %@", buf, 0xCu);
  }

  return v18;
}

- (id)generateAnonymousCKUserIDForCurrentUserInShare:(id)a3 containerID:(id)a4 acceptA2AShareUsingVersionOneAnonymousIdentifier:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  const void *v41;
  const char *v42;
  CC_LONG v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  const char *v54;
  void *v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  unsigned __int8 md[16];
  __int128 v63;
  uint64_t v64;

  v5 = a5;
  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_account(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_containerIdentifier(v9, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recordName(v8, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v8, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zoneID(v8, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  CKRandomDataWithLength();
  v34 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v34;
  if (v15 && v18 && v21 && v27 && v33 && v34)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v35, (uint64_t)CFSTR("%@-%@-%@-%@-%@-%@"), v15, v18, v21, v27, v33, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)md = 0u;
    v63 = 0u;
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v38, (uint64_t)md, 32, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (const void *)objc_msgSend_UTF8String(v37, v39, v40);
    v56 = v37;
    v43 = objc_msgSend_lengthOfBytesUsingEncoding_(v37, v42, 4);
    CC_SHA256(v41, v43, md);
    if (*MEMORY[0x1E0C95280] && v5)
    {
      objc_msgSend_CKLowercaseHexStringWithoutSpaces(v57, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(CFSTR("+"), v47, (uint64_t)v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v49 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 138412546;
      v59 = v48;
      v60 = 2112;
      v61 = v8;
      v50 = "CKBehaviorOptions override - Generated anonymous user ID %@ for share %@";
    }
    else
    {
      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_CKLowercaseHexStringWithoutSpaces(v57, v44, v45);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v52, v54, (uint64_t)CFSTR("%@%@%@"), CFSTR("+"), CFSTR("01"), v53);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v37 = v56;
      v49 = *MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)buf = 138412546;
      v59 = v48;
      v60 = 2112;
      v61 = v8;
      v50 = "Generated versioned anonymous user ID %@ for share %@";
    }
    _os_log_debug_impl(&dword_1BE990000, v49, OS_LOG_TYPE_DEBUG, v50, buf, 0x16u);
LABEL_21:

    goto LABEL_22;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v51 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)md = 0;
    _os_log_error_impl(&dword_1BE990000, v51, OS_LOG_TYPE_ERROR, "Failed to assemble required components to generate an anonymous userID. Not returning one.", md, 2u);
  }
  v48 = 0;
LABEL_22:

  return v48;
}

- (id)createSignatureWithIdentity:(_PCSIdentityData *)a3 dataToBeSigned:(id)a4 useWholePublicKeyAsSigner:(BOOL)a5 error:(id *)a6
{
  const char *v9;
  id v10;
  const char *v11;
  void *Signature;
  _BYTE *v13;
  const char *v14;
  const char *v15;
  id v16;
  const char *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  int v21;
  CFAllocatorRef v22;
  CFAllocatorRef v23;
  CFAllocatorRef allocator;
  __int128 v26;
  _BYTE v27[23];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (!a3)
  {
    if (!a6)
    {
      Signature = 0;
      goto LABEL_20;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 5005, CFSTR("Missing the required PCSIdentity to generate a signature"));
    v23 = (CFAllocatorRef)(id)objc_claimAutoreleasedReturnValue();
    Signature = 0;
LABEL_17:
    *a6 = v23;
    goto LABEL_20;
  }
  allocator = 0;
  Signature = (void *)PCSIdentityCreateSignature();
  v13 = (_BYTE *)MEMORY[0x1E0C95280];
  if (*MEMORY[0x1E0C95280])
  {
    if ((objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v11, (uint64_t)CFSTR("GenerateOneInvalidSignature")) & 1) != 0
      || objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v14, (uint64_t)CFSTR("FakeInvalidSignature")))
    {
      v26 = xmmword_1BECBB571;
      *(_OWORD *)v27 = unk_1BECBB581;
      *(_QWORD *)&v27[15] = 0xDD6BD7280FB6607ALL;
      v16 = objc_alloc(MEMORY[0x1E0C99D50]);
      v18 = (void *)objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&v26, 39);
      v19 = (const void *)PCSIdentityCreateFromRaw();
      v20 = PCSIdentityCreateSignature();

      if (v19)
        CFRelease(v19);

      Signature = (void *)v20;
    }
    if (*v13)
    {
      v21 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v15, (uint64_t)CFSTR("FakeSignatureGenerationError"));
      v22 = 0;
      if (!v21)
        goto LABEL_12;
      allocator = CFErrorCreate(0, CFSTR("com.apple.protectedcloudstorage"), 16, (CFDictionaryRef)&unk_1E78AF690);

      Signature = 0;
    }
  }
  v22 = allocator;
LABEL_12:
  if (v22)
  {
    if (!a6)
    {
      CFRelease(v22);
      goto LABEL_20;
    }
    v23 = v22;
    goto LABEL_17;
  }
LABEL_20:

  return Signature;
}

- (id)createSignatureWithServiceType:(unint64_t)a3 dataToBeSigned:(id)a4 useWholePublicKeyAsSigner:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const void *v20;
  id v21;
  const char *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  NSObject *v28;
  NSObject *v30;
  id v31;
  id v32;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v7 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  cf = 0;
  objc_msgSend_identityManager(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v13, v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identityManager(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v20 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v18, v19, a3, 0, &v32);
  v21 = v32;

  if (!v20 || v21)
  {
    if (!v21)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to create cryptographic signature: No service identity."));
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_error_impl(&dword_1BE990000, v28, OS_LOG_TYPE_ERROR, "Failed to create signature. No identity set for service %{public}@.", buf, 0xCu);
    }
    v27 = 0;
    v24 = 0;
    if (a6)
      goto LABEL_18;
  }
  else
  {
    v24 = (void *)PCSIdentitySetCopyCurrentIdentityWithError();
    if (v24 && !cf)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v25 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v24;
        _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "Creating signature with PCS identity: %@", buf, 0xCu);
      }
      v31 = 0;
      objc_msgSend_createSignatureWithIdentity_dataToBeSigned_useWholePublicKeyAsSigner_error_(self, v26, (uint64_t)v24, v10, v7, &v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v31;
      if (!a6)
        goto LABEL_19;
LABEL_18:
      *a6 = objc_retainAutorelease(v21);
      goto LABEL_19;
    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5000, cf);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "Failed to create signature. No current identity for service %{public}@", buf, 0xCu);
    }
    v27 = 0;
    if (a6)
      goto LABEL_18;
  }
LABEL_19:
  if (v20)
    CFRelease(v20);
  if (v24)
    CFRelease(v24);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }

  return v27;
}

- (id)createCloudKitFeaturesSignatureForData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  char isSecondaryAccount_error;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const void *v29;
  id v30;
  const char *v31;
  _BYTE *v32;
  int v33;
  const char *v34;
  void *v35;
  _QWORD *v36;
  os_log_t *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  id v41;
  NSObject *v42;
  BOOL v43;
  char v44;
  NSObject *v45;
  NSObject *v46;
  _QWORD *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  id v55;
  CFTypeRef cf;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_deviceContext(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v12, v16, (uint64_t)v15, 0, 0);

  if ((isSecondaryAccount_error & 1) != 0)
  {
    v20 = 5;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v21, OS_LOG_TYPE_DEBUG, "Manatee unavailable, using CloudKitFeaturesStingray identity for signing.", buf, 2u);
    }
    v20 = 6;
  }
  objc_msgSend_identityManager(self, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v22, v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identityManager(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v29 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v27, v28, v20, 0, &v58);
  v30 = v58;

  v32 = (_BYTE *)MEMORY[0x1E0C95280];
  if (!*MEMORY[0x1E0C95280])
  {
    v33 = 0;
    if (!v29)
      goto LABEL_30;
LABEL_12:
    if (!v30 && !v33)
      goto LABEL_14;
    goto LABEL_30;
  }
  v33 = objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v31, (uint64_t)CFSTR("SimulateMissingSigningIdentity"));
  if (v29)
    goto LABEL_12;
LABEL_30:
  if (v29)
    v43 = 1;
  else
    v43 = *v32 == 0;
  if (v43)
    v44 = 1;
  else
    v44 = v33;
  if ((v44 & 1) != 0)
  {
    if (!v30)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to create signature. No identity set for service %@."), v24);
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v45 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v24;
      _os_log_error_impl(&dword_1BE990000, v45, OS_LOG_TYPE_ERROR, "Failed to create CloudKitFeatures signature. No identity set for service %{public}@.", buf, 0xCu);
    }
    goto LABEL_47;
  }
  v47 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v48 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v60 = v24;
    _os_log_impl(&dword_1BE990000, v48, OS_LOG_TYPE_INFO, "Warn: The test account has no identity set for service %{public}@. Creating a temporary one, which will not be known to the server.", buf, 0xCu);
  }

  objc_msgSend_identityManager(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v29 = (const void *)objc_msgSend_createTemporaryCloudKitFeaturesSigningIdentitySetForServiceName_withError_(v51, v52, (uint64_t)v24, &v57);
  v30 = v57;

  if (v30)
  {
    if (*v47 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v53 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v24;
      _os_log_error_impl(&dword_1BE990000, v53, OS_LOG_TYPE_ERROR, "Failed to create temporary identity set for service %{public}@.", buf, 0xCu);
      if (!v29)
      {
LABEL_61:
        if (a4)
        {
LABEL_50:
          v30 = objc_retainAutorelease(v30);
          v40 = 0;
          *a4 = v30;
          goto LABEL_63;
        }
LABEL_62:
        v40 = 0;
        goto LABEL_63;
      }
    }
    else if (!v29)
    {
      goto LABEL_61;
    }
    CFRelease(v29);
    goto LABEL_61;
  }
LABEL_14:
  cf = 0;
  v35 = (void *)PCSIdentitySetCopyCurrentIdentityWithError();
  if (!v35)
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C94B20], 5000, cf);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v46 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v60 = v24;
      _os_log_error_impl(&dword_1BE990000, v46, OS_LOG_TYPE_ERROR, "Failed to create CloudKitFeatures signature. No current identity for service %{public}@", buf, 0xCu);
    }
LABEL_47:
    if (v29)
      CFRelease(v29);
    if (a4)
      goto LABEL_50;
    goto LABEL_62;
  }
  v36 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v37 = (os_log_t *)MEMORY[0x1E0C952D8];
  v38 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v60 = v35;
    _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Creating CloudKitFeatures signature with PCS identity: %@", buf, 0xCu);
  }
  v55 = 0;
  objc_msgSend_createSignatureWithIdentity_dataToBeSigned_useWholePublicKeyAsSigner_error_(self, v39, (uint64_t)v35, v6, 1, &v55);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v55;
  v30 = v41;
  if (!v40 || v41)
  {
    if (*v36 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v42 = *v37;
    if (os_log_type_enabled(*v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v35;
      v61 = 2114;
      v62 = v30;
      _os_log_debug_impl(&dword_1BE990000, v42, OS_LOG_TYPE_DEBUG, "Failed to create CloudKitFeatures signature with PCS identity %@. Error: %{public}@", buf, 0x16u);
      if (!a4)
        goto LABEL_26;
      goto LABEL_25;
    }
    if (a4)
LABEL_25:
      *a4 = objc_retainAutorelease(v30);
  }
LABEL_26:
  CFRelease(v35);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v29)
    CFRelease(v29);
LABEL_63:

  return v40;
}

- (BOOL)validateFullPublicKeySignature:(id)a3 forSignedData:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  char v9;
  char v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  CFErrorRef cf;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  cf = 0;
  v9 = PCSValidateSignature();
  if (*MEMORY[0x1E0C95280]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v8, (uint64_t)CFSTR("FakeSignatureValidationError")))
  {
    cf = CFErrorCreate(0, CFSTR("com.apple.protectedcloudstorage"), 16, (CFDictionaryRef)&unk_1E78AF6B8);
  }
  if (cf)
    v10 = 0;
  else
    v10 = v9;
  if ((v10 & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 5004, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v7;
      v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "Failed to validate signature %@ using the embedded public key. Error:%{public}@", buf, 0x16u);
      if (!a5)
        goto LABEL_19;
    }
    else if (!a5)
    {
      goto LABEL_19;
    }
LABEL_18:
    *a5 = objc_retainAutorelease(v12);
    goto LABEL_19;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v11 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Successfully validated signature %@ using the embedded public key.", buf, 0xCu);
  }
  v12 = 0;
  if (a5)
    goto LABEL_18;
LABEL_19:
  if (cf)
    CFRelease(cf);

  return v9;
}

- (BOOL)validateSignature:(id)a3 forSignedData:(id)a4 usingIdentityType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const void *v21;
  id v22;
  const char *v23;
  const char *v24;
  const void *v25;
  BOOL v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v32;
  id v33;
  CFTypeRef cf;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  cf = 0;
  objc_msgSend_identityManager(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v14, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identityManager(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v21 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v19, v20, a5, 0, &v33);
  v22 = v33;

  if (!v21 || v22)
  {
    if (!v22)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to validate signature %@. No identity set for service %@."), v10, v16);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v10;
      v37 = 2114;
      v38 = v16;
      _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "Failed to validate signature %@. No identity set for service %{public}@.", buf, 0x16u);
      if (!v21)
      {
LABEL_26:
        v27 = 0;
        v30 = 0;
        if (!a6)
          goto LABEL_28;
LABEL_27:
        v22 = objc_retainAutorelease(v22);
        *a6 = v22;
        v30 = v27;
        goto LABEL_28;
      }
    }
    else if (!v21)
    {
      goto LABEL_26;
    }
    CFRelease(v21);
    goto LABEL_26;
  }
  v25 = (const void *)PCSValidateSignatureWithSet();
  if (*MEMORY[0x1E0C95280]
    && objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v24, (uint64_t)CFSTR("FakeSignatureValidationError")))
  {
    cf = CFErrorCreate(0, CFSTR("com.apple.protectedcloudstorage"), 16, (CFDictionaryRef)&unk_1E78AF6E0);
  }
  if (v25)
    v26 = cf == 0;
  else
    v26 = 0;
  v27 = v26;
  if (v26)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v28 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v10;
      v37 = 2114;
      v38 = v16;
      _os_log_debug_impl(&dword_1BE990000, v28, OS_LOG_TYPE_DEBUG, "Successfully validated signature %@ with service %{public}@", buf, 0x16u);
    }
    v22 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v24, *MEMORY[0x1E0C94B20], 5004, v10, v16);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v10;
      v37 = 2114;
      v38 = v16;
      _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Failed to validate signature %@ with service %{public}@.", buf, 0x16u);
    }
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v25)
    CFRelease(v25);
  CFRelease(v21);
  v30 = v27;
  if (a6)
    goto LABEL_27;
LABEL_28:

  return v30;
}

- (void)_locked_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 keySyncAnalytics:(id)a9 requestorOperationID:(id)a10 completionHandler:(id)a11
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD *v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  int IsManatee;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  int isEqualToString;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  id *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  int isAppleInternalInstall;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  id *v96;
  const char *v97;
  const char *v98;
  void *v99;
  id *v100;
  NSObject *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  id v108;
  void *v109;
  const __CFString *v110;
  const __CFString *v111;
  void *v112;
  const char *v113;
  id v117;
  id v118;
  void *v119;
  __CFString *v120;
  void *v121;
  __CFString *v122;
  _QWORD v123[4];
  id v124;
  id v125;
  id v126;
  CKDPCSManager *v127;
  id v128;
  id v129;
  __CFString *v130;
  __CFString *v131;
  id v132;
  id v133;
  id v134;
  uint64_t *v135;
  _QWORD *v136;
  _QWORD *v137;
  uint64_t *v138;
  uint64_t *v139;
  SEL v140;
  unint64_t v141;
  unint64_t v142;
  BOOL v143;
  BOOL v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(uint64_t, uint64_t, __CFString *);
  void *v148;
  id v149;
  __CFString *v150;
  __CFString *v151;
  CKDPCSManager *v152;
  NSObject *v153;
  id v154;
  uint64_t *v155;
  _QWORD *v156;
  uint64_t *v157;
  BOOL v158;
  id v159;
  id v160;
  id obj;
  _QWORD v162[4];
  id v163;
  uint64_t *v164;
  _QWORD block[6];
  _QWORD v166[5];
  _QWORD v167[5];
  id v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t (*v172)(uint64_t, uint64_t);
  void (*v173)(uint64_t);
  id v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD v179[4];
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD v184[2];
  _QWORD v185[2];
  uint8_t buf[4];
  id v187;
  __int16 v188;
  const __CFString *v189;
  __int16 v190;
  const __CFString *v191;
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v117 = a8;
  v118 = a9;
  v120 = (__CFString *)a10;
  v16 = a11;
  objc_msgSend_synchronizeQueue(self, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v180 = 0;
  v181 = &v180;
  v182 = 0x2020000000;
  v183 = 0;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x2020000000;
  v179[3] = 0;
  v175 = 0;
  v176 = &v175;
  v177 = 0x2020000000;
  v178 = 0;
  v169 = 0;
  v170 = &v169;
  v171 = 0x3032000000;
  v172 = sub_1BE9BAFA8;
  v173 = sub_1BE9BAD88;
  v174 = 0;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x3032000000;
  v167[3] = sub_1BE9BAFA8;
  v167[4] = sub_1BE9BAD88;
  v168 = 0;
  v119 = (void *)PCSFPCreatePEMData();
  objc_msgSend_identityManager(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v22, v23, a5);
  v122 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v24, a4);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend_callbackQueue(self, v25, v26);
    v43 = objc_claimAutoreleasedReturnValue();
    v166[0] = MEMORY[0x1E0C809B0];
    v166[1] = 3221225472;
    v166[2] = sub_1BEA65BA0;
    v166[3] = &unk_1E782EFD8;
    v42 = v166;
    v166[4] = v16;
    dispatch_async(v43, v166);

LABEL_13:
    v44 = 0;
    v45 = v42[4];
    goto LABEL_48;
  }
  if (objc_msgSend_isPreviouslyUndecryptablePCS_(self, v25, (uint64_t)v15))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v29, OS_LOG_TYPE_ERROR, "A decrypt attempt on this exact PCS data has failed before and no useful identities have arrived since. Failing the decryption.", buf, 2u);
    }
    if (!*MEMORY[0x1E0C95280]
      || (objc_msgSend_deviceContext(self, v30, v31),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_testDeviceReference(v32, v33, v34),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = v35 == 0,
          v35,
          v32,
          v36))
    {
      if (a5 || (objc_msgSend_currentServiceIsManatee(self, v30, v31) & 1) == 0)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v30, v31);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v112, v113, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 1549, CFSTR("We failed a prior decryption of this PCS data a with manatee identity when current identity is non-manatee. Did our identity change?"));

      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v30, *MEMORY[0x1E0C94B20], 5011, CFSTR("PCS data wasn't decrypted because a prior attempt failed after key sync."));
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v170[5];
    v170[5] = v37;

    objc_msgSend_callbackQueue(self, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA65BBC;
    block[3] = &unk_1E782ECB8;
    v42 = block;
    block[4] = v16;
    block[5] = &v169;
    dispatch_async(v41, block);

    goto LABEL_13;
  }
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v27, v28);
  v45 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isAppleInternalInstall(v45, v46, v47))
  {
LABEL_25:

    goto LABEL_26;
  }
  IsManatee = objc_msgSend_currentServiceIsManatee(self, v48, v49);

  if (IsManatee)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifierToForceFatalManateeZoneDecryptionFailure(v53, v54, v55);
    v45 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v45, v56, v57))
    {
      objc_msgSend_containerID(self, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v45, v64, (uint64_t)v63))
      {

LABEL_20:
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v66, *MEMORY[0x1E0C94B20], 5011, CFSTR("Forcing a manatee decryption failure due to behavior option override"));
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = (void *)v170[5];
        v170[5] = v68;

        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v70 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE990000, v70, OS_LOG_TYPE_ERROR, "Forcing a manatee decryption failure due to behavior option override.", buf, 2u);
        }
        objc_msgSend__locked_markMissingIdentitiesFromFailedDecryptError_serviceName_(self, v71, v181[3], v122);
        objc_msgSend_date(MEMORY[0x1E0C99D68], v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setLastMissingManateeIdentityErrorDateForCurrentService_(self, v75, (uint64_t)v74);

        objc_msgSend_markUndecryptablePCS_(self, v76, (uint64_t)v15);
        objc_msgSend_callbackQueue(self, v77, v78);
        v79 = objc_claimAutoreleasedReturnValue();
        v162[0] = MEMORY[0x1E0C809B0];
        v162[1] = 3221225472;
        v162[2] = sub_1BEA65BE4;
        v162[3] = &unk_1E782ECB8;
        v163 = v16;
        v164 = &v169;
        dispatch_async(v79, v162);

        v44 = 0;
        goto LABEL_48;
      }
      isEqualToString = objc_msgSend_isEqualToString_(v45, v65, (uint64_t)CFSTR("*"));

      if (isEqualToString)
        goto LABEL_20;
    }
    goto LABEL_25;
  }
LABEL_26:
  objc_msgSend_identityManager(self, v51, v52);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (id *)(v170 + 5);
  obj = (id)v170[5];
  v83 = objc_msgSend_copyIdentitySetWithType_options_error_(v80, v82, a5, 2, &obj);
  objc_storeStrong(v81, obj);
  v176[3] = v83;

  v45 = dispatch_group_create();
  if (v170[5])
  {
    v86 = 0;
    v87 = 0;
  }
  else
  {
    if (v176[3])
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v84, v85);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v88, v89, v90);

      if (isAppleInternalInstall)
      {
        CKDescriptionForIdentitySet(v176[3]);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v86 = 0;
      }
      if (a4 == 6)
      {
        v94 = objc_alloc(MEMORY[0x1E0D82610]);
        v95 = v176[3];
        v96 = (id *)(v170 + 5);
        v160 = (id)v170[5];
        v93 = (void *)objc_msgSend_initWithSharingRequestData_identitySet_error_(v94, v97, (uint64_t)v15, v95, &v160);
        objc_storeStrong(v96, v160);
        v100 = (id *)(v170 + 5);
        v99 = (void *)v170[5];
        if (!v93 || v99)
        {
          v105 = v99;
          v87 = 0;
          v181[3] = (uint64_t)v105;
        }
        else
        {
          v159 = 0;
          objc_msgSend_exportAcceptedSharingRequestWithError_(v93, v98, (uint64_t)&v159);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v100, v159);
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v106 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          v109 = (void *)v176[3];
          v110 = (const __CFString *)v170[5];
          v111 = CFSTR(". Error: ");
          if (!v110)
          {
            v111 = &stru_1E7838F48;
            v110 = &stru_1E7838F48;
          }
          *(_DWORD *)buf = 138412802;
          v187 = v109;
          v188 = 2114;
          v189 = v111;
          v190 = 2112;
          v191 = v110;
          _os_log_debug_impl(&dword_1BE990000, v106, OS_LOG_TYPE_DEBUG, "Attempted to decrypt and export sharing invitation token with identity set %@%{public}@%@", buf, 0x20u);
        }
      }
      else
      {
        dispatch_group_enter(v45);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v101 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v187 = v15;
          v188 = 2114;
          v189 = v122;
          v190 = 2114;
          v191 = v120;
          _os_log_debug_impl(&dword_1BE990000, v101, OS_LOG_TYPE_DEBUG, "Starting to unwrap PCS data %{public}@ with identities for service %{public}@ operation %{public}@.", buf, 0x20u);
        }
        v103 = *MEMORY[0x1E0D829B8];
        v184[0] = *MEMORY[0x1E0D829C8];
        v184[1] = v103;
        v185[0] = v121;
        v185[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v102, (uint64_t)v185, v184, 2);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = MEMORY[0x1E0C809B0];
        v146 = 3221225472;
        v147 = sub_1BEA65C0C;
        v148 = &unk_1E7831400;
        v149 = v15;
        v155 = &v175;
        v150 = v122;
        v156 = v179;
        v157 = &v169;
        v151 = v120;
        v152 = self;
        v158 = a6;
        v153 = v45;
        v154 = v121;
        PCSObjectCreateFromExportedWithIdentitiesAndOptionsAsync();

        v87 = 0;
        v93 = v149;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v84, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a service identity set"));
      v92 = objc_claimAutoreleasedReturnValue();
      v86 = 0;
      v87 = 0;
      v93 = (void *)v170[5];
      v170[5] = v92;
    }

  }
  objc_msgSend_synchronizeQueue(self, v84, v85);
  v107 = objc_claimAutoreleasedReturnValue();
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = sub_1BEA66300;
  v123[3] = &unk_1E7831540;
  v135 = &v169;
  v136 = v179;
  v44 = v87;
  v124 = v44;
  v125 = v86;
  v126 = v15;
  v127 = self;
  v137 = v167;
  v138 = &v180;
  v128 = v119;
  v139 = &v175;
  v143 = a7;
  v129 = v121;
  v130 = v122;
  v131 = v120;
  v140 = a2;
  v141 = a5;
  v134 = v16;
  v142 = a4;
  v144 = a6;
  v132 = v117;
  v133 = v118;
  v108 = v86;
  dispatch_group_notify(v45, v107, v123);

LABEL_48:
  _Block_object_dispose(v167, 8);

  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v175, 8);
  _Block_object_dispose(v179, 8);
  _Block_object_dispose(&v180, 8);

}

- (BOOL)_checkUnitTestOverridesForDecryptionFailuresWithState:(BOOL)a3 error:(id *)a4
{
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint8_t *v12;
  void *v14;
  const char *v15;
  uint64_t v17;
  uint8_t buf[16];
  uint8_t v19[2];

  if (*MEMORY[0x1E0C95280])
  {
    if (a3)
      goto LABEL_3;
LABEL_17:
    if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, a2, (uint64_t)CFSTR("ForceUserKeyRegistrySyncRetryOnDecryption")))return 1;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v9 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      v11 = "Forcing user key sync retry for unit tests";
      v12 = v19;
LABEL_25:
      _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, v11, v12, 2u);
      if (!a4)
        return 1;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 1792, CFSTR("Only suitable for testing"));

  if (!a3)
    goto LABEL_17;
LABEL_3:
  if (objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, a2, (uint64_t)CFSTR("ForceMissingIdentitiesErrorOnDecryptionRetry")))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE990000, v8, OS_LOG_TYPE_DEBUG, "Forcing CKUnderlyingErrorPCSNoPublicIdentity after user key sync due to unit tests", buf, 2u);
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (a4)
    {
LABEL_8:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 5000, CFSTR("Failed to decrypt zone PCS because of unit tests"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_9:
  if (!objc_msgSend__checkAndClearPCSTestOverrideForKey_(self, v7, (uint64_t)CFSTR("ForceDecryptFailedErrorOnDecryptionRetry")))return 1;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v9 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    v11 = "Forcing CKUnderlyingErrorPCSDecryptFailed after user key sync due to unit tests";
    v12 = (uint8_t *)&v17;
    goto LABEL_25;
  }
LABEL_21:
  if (a4)
  {
LABEL_22:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5004, CFSTR("Failed to decrypt zone PCS because of unit tests"), v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (void)_createPCSFromData:(id)a3 ofType:(unint64_t)a4 usingPCSServiceType:(unint64_t)a5 tryDecryptingWithOtherServices:(BOOL)a6 withSyncKeyRegistryRetry:(BOOL)a7 lastModifiedDate:(id)a8 requestorOperationID:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  BOOL v35;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  objc_msgSend_synchronizeQueue(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1BEA67AF0;
  v27[3] = &unk_1E7831568;
  v27[4] = self;
  v28 = v16;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v35 = a7;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  dispatch_async(v22, v27);

}

- (void)createZonePCSFromData:(id)a3 usingServiceIdentityWithType:(unint64_t)a4 zonePCSModificationDate:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  _BOOL8 v21;
  id v22;
  const char *v23;
  _QWORD v24[4];
  id v25;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend_containerID(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_specialContainerType(v18, v19, v20) != 25;

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEA67C34;
  v24[3] = &unk_1E7831590;
  v25 = v12;
  v22 = v12;
  objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v23, (uint64_t)v15, 3, a4, v21, 1, v14, v13, v24);

}

- (void)createIngestedPPPCSDataFromInvitationData:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEA67D74;
  v13[3] = &unk_1E7831590;
  v14 = v10;
  v11 = v10;
  objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v12, (uint64_t)a3, 6, 0, 0, 1, a4, a5, v13);

}

- (BOOL)availableIdentityForService:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  BOOL v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE9BAFA8;
  v15 = sub_1BE9BAD88;
  v16 = 0;
  objc_msgSend_synchronizeQueue(self, a2, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA67EF8;
  block[3] = &unk_1E78315B8;
  block[5] = &v11;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v7, block);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  CKDPCSManager *v30;
  id v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  uint64_t *v33;
  uint64_t *v34;
  unint64_t v35;
  id obj;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v10 = a3;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = sub_1BE9BAFA8;
  v45 = sub_1BE9BAD88;
  v46 = 0;
  if (v10)
  {
    v13 = (void *)PCSFPCreatePEMData();
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    objc_msgSend_identityManager(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v42;
    obj = v42[5];
    v19 = objc_msgSend_copyIdentitySetWithType_options_error_(v16, v18, a5, 2, &obj);
    objc_storeStrong(v17 + 5, obj);

    v40 = v19;
    if (v38[3])
    {
      objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v20, a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = sub_1BEA68364;
      v27[3] = &unk_1E7831608;
      v33 = &v37;
      v22 = v21;
      v28 = v22;
      v34 = &v41;
      v35 = a4;
      v29 = v10;
      v30 = self;
      v31 = v13;
      v32 = v12;
      objc_msgSend__onSynchronizeQueue_(self, v23, (uint64_t)v27);

    }
    else
    {
      v24 = v42[5];
      if (!v24)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a service identity set"));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v42[5];
        v42[5] = (id)v25;

        v24 = v42[5];
      }
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v24);
    }
    _Block_object_dispose(&v37, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }
  _Block_object_dispose(&v41, 8);

}

- (BOOL)decryptSharedZonePCSData:(id)a3 withInvitedPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const void *v18;
  const char *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend_pcs(v8, v9, v10) && objc_msgSend_zoneishPCS(v8, v11, v12))
    goto LABEL_18;
  if (objc_msgSend_pcs(v8, v11, v12))
  {
    v15 = 0;
    goto LABEL_5;
  }
  objc_msgSend_pcsData(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (objc_msgSend_pcsData(v8, v13, v14),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v46 = 0,
        v15 = (void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v26, (uint64_t)v25, 3, a4, &v46), v20 = v46, v25, v18 = 0, v15)&& !v20)
  {
LABEL_5:
    if (objc_msgSend_zoneishPCS(v8, v13, v14)
      || (objc_msgSend_zoneishPCSData(v8, v16, v17),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v27,
          !v27))
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend_zoneishPCSData(v8, v16, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v18 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v30, (uint64_t)v29, 1, v15, &v45);
      v20 = v45;

      if (!v18 || v20)
        goto LABEL_8;
    }
    objc_msgSend_setPcs_(v8, v16, (uint64_t)v15);
    objc_msgSend_setZoneishPCS_(v8, v19, (uint64_t)v18);
    v20 = 0;
  }
LABEL_8:
  if (v15)
    CFRelease(v15);
  if (v18)
    CFRelease(v18);
  if (v20)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v41 = v21;
      objc_msgSend_zoneID(v8, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = (uint64_t)v44;
      v49 = 2112;
      v50 = (uint64_t)v20;
      _os_log_error_impl(&dword_1BE990000, v41, OS_LOG_TYPE_ERROR, "Error creating shared zone PCS using invited PCS for zone %@: %@", buf, 0x16u);

      if (a5)
        goto LABEL_17;
    }
    else if (a5)
    {
LABEL_17:
      v20 = objc_retainAutorelease(v20);
      v22 = 0;
      *a5 = v20;
      goto LABEL_23;
    }
    v22 = 0;
    goto LABEL_23;
  }
LABEL_18:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v23 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    v31 = v23;
    v34 = objc_msgSend_pcs(v8, v32, v33);
    v37 = objc_msgSend_zoneishPCS(v8, v35, v36);
    objc_msgSend_zoneID(v8, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v48 = v34;
    v49 = 2112;
    v50 = v37;
    v51 = 2112;
    v52 = v40;
    _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Created shared zone PCS: %@ and zoneish PCS: %@ for zone %@", buf, 0x20u);

  }
  v20 = 0;
  v22 = 1;
LABEL_23:

  return v22;
}

- (id)etagFromZonePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  void *v4;
  void *v6;
  const char *v7;
  id v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = 0;
    objc_msgSend_dataFromZonePCS_error_(self, a2, (uint64_t)a3, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (v6)
    {
      objc_msgSend_etagFromPCSData_(CKDPCSManager, v7, (uint64_t)v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_5:

        return v4;
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v10 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v8;
        _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "Couldn't create data from zone PCS %@: %@", buf, 0x16u);
      }
      v4 = 0;
      if (!a4)
        goto LABEL_5;
    }
    *a4 = objc_retainAutorelease(v8);
    goto LABEL_5;
  }
  return v4;
}

- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3
{
  return objc_msgSend_zonePCSNeedsKeyRolled_isZoneishZone_bypassAllowlistedContainers_(self, a2, (uint64_t)a3, 0, 0);
}

- (BOOL)zonePCSNeedsKeyRolled:(_OpaquePCSShareProtection *)a3 isZoneishZone:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5
{
  _BOOL4 v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  char v17;
  const char *v18;
  uint64_t v19;
  _QWORD *v20;
  os_log_t *v21;
  char IsManatee;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  int v30;
  char v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  char v35;
  NSObject *v36;
  char v37;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  const char *v46;
  unsigned __int8 isKeyRollingUnitTestContainerID;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  char isSecondaryAccount_error;
  __CFString *v58;
  NSObject *v59;
  const __CFString *v60;
  const __CFString *v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  os_log_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  const __CFString *v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  _OpaquePCSShareProtection *v83;
  void *v84;
  id v85;
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  const __CFString *v89;
  uint64_t v90;

  v6 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  objc_msgSend_deviceContext(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_forceEnableReadOnlyManatee(self, v10, v11) & 1) == 0)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_rollZonePCSIdentities(v14, v15, v16);

    v20 = (_QWORD *)MEMORY[0x1E0C95300];
    v21 = (os_log_t *)MEMORY[0x1E0C952D8];
    if ((v17 & 1) != 0)
    {
      v83 = a3;
      IsManatee = objc_msgSend_currentServiceIsManatee(self, v18, v19);
      v84 = v9;
      objc_msgSend_accountDataSecurityObserver(v9, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_account(self, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v25, v29, (uint64_t)v28, 1);

      if (*v20 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v31 = IsManatee | v30;
      v32 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEBUG))
      {
        v74 = CFSTR("is not");
        if (v30)
          v74 = CFSTR("is");
        *(_DWORD *)buf = 138412290;
        v87 = (uint64_t)v74;
        _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", buf, 0xCu);
        if ((v31 & 1) != 0)
          goto LABEL_7;
      }
      else if ((v31 & 1) != 0)
      {
LABEL_7:
        if (a5)
        {
          v35 = 1;
        }
        else
        {
          objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v33, v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v39;
          if (v6)
            v43 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v39, v40, v41);
          else
            v43 = objc_msgSend_allowZoneKeyRollingInPerRecordPCSZonesForAllContainers(v39, v40, v41);
          v44 = v43;

          if ((v44 & v30) == 1 && (objc_msgSend_currentServiceIsManatee(self, v33, v34) & 1) == 0)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v67 = *v21;
            v35 = 1;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
            {
              v68 = v67;
              objc_msgSend_containerID(self, v69, v70);
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = (void *)v71;
              v73 = CFSTR("NO");
              if (v6)
                v73 = CFSTR("YES");
              *(_DWORD *)buf = 138412546;
              v87 = v71;
              v88 = 2112;
              v89 = v73;
              _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Bypassing zone key rolling container allow-list restriction due to walrus enabled, non manatee, and behavior option for container %@, isZoneishZone:%@", buf, 0x16u);

            }
          }
          else
          {
            v35 = 0;
          }
        }
        if (*MEMORY[0x1E0C95280])
        {
          objc_msgSend_containerID(self, v33, v34);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v46, (uint64_t)v45);

        }
        else
        {
          isKeyRollingUnitTestContainerID = 0;
        }
        objc_msgSend_containerID(self, v33, v34);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v49, (uint64_t)v48) & 1) != 0)
        {

          goto LABEL_27;
        }

        if (((v35 | isKeyRollingUnitTestContainerID) & 1) != 0)
        {
LABEL_27:
          objc_msgSend_accountDataSecurityObserver(v84, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_account(self, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = 0;
          isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v52, v56, (uint64_t)v55, 0, &v85);
          v58 = (__CFString *)v85;

          if ((isSecondaryAccount_error & 1) != 0)
          {
            if (v83)
            {
              v37 = PCSFPShouldRoll();
LABEL_38:
              v9 = v84;

              goto LABEL_14;
            }
          }
          else
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v59 = *v21;
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = CFSTR("Last CoreCDP error was ");
              v61 = &stru_1E7838F48;
              if (v58)
                v61 = v58;
              else
                v60 = &stru_1E7838F48;
              *(_DWORD *)buf = 138543618;
              v87 = (uint64_t)v60;
              v88 = 2112;
              v89 = v61;
              _os_log_impl(&dword_1BE990000, v59, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because manatee isn't available. %{public}@%@", buf, 0x16u);
            }
          }
          v37 = 0;
          goto LABEL_38;
        }
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v62 = *v21;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v63 = v62;
          objc_msgSend_containerID(self, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = (uint64_t)v66;
          _os_log_impl(&dword_1BE990000, v63, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're not allowed to in container %@", buf, 0xCu);

        }
LABEL_56:
        v37 = 0;
        v9 = v84;
        goto LABEL_14;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v75 = *v21;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        v76 = v75;
        objc_msgSend_identityManager(self, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_serviceName(v79, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v87 = (uint64_t)v82;
        _os_log_impl(&dword_1BE990000, v76, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're using a non-manatee service identity: %{public}@", buf, 0xCu);

      }
      goto LABEL_56;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're asked not to!", buf, 2u);
    }
  }
  v37 = 0;
LABEL_14:

  return v37;
}

- (BOOL)zonePCSNeedsUpdate:(_OpaquePCSShareProtection *)a3
{
  if (!a3)
    return 0;
  if ((objc_msgSend_forceEnableReadOnlyManatee(self, a2, (uint64_t)a3) & 1) != 0)
    return 0;
  return PCSFPSupportFeature() ^ 1;
}

- (BOOL)isRemindersZoneThatNeedsUpdate:(_OpaquePCSShareProtection *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  const char *v17;
  char v18;

  if (!a3)
    return 0;
  objc_msgSend_containerID(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_specialContainerType(v4, v5, v6);

  if (v7 != 25)
    return 0;
  v8 = (void *)PCSFPCopyPublicIdentities();
  if (objc_msgSend_count(v8, v9, v10) == 1)
  {
    objc_msgSend_firstObject(v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)PCSPublicIdentityGetPublicID();

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend_identityManager(self, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_liverpoolServiceOwnsPublicID_(v16, v17, (uint64_t)v14);

  return v18;
}

- (id)updateServiceIdentityOnZonePCS:(_OpaquePCSShareProtection *)a3
{
  return (id)objc_msgSend_addIdentityForService_toPCS_(self, a2, 0, a3);
}

- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 forOperation:(id)a4
{
  return (id)objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (id)rollMasterKeyForRecordPCS:(_OpaquePCSShareProtection *)a3 isZoneishRecord:(BOOL)a4 bypassAllowlistedContainers:(BOOL)a5 forOperation:(id)a6
{
  _BOOL4 v7;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char v16;
  const char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  char IsManatee;
  void *v40;
  const char *v41;
  int isKeyRollingUnitTestContainerID;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  const void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const __CFString *v81;
  NSObject *v82;
  const char *v83;
  _QWORD v85[4];
  BOOL v86;
  _QWORD v87[7];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;
  uint8_t v92[4];
  _OpaquePCSShareProtection *v93;
  __int16 v94;
  uint64_t v95;
  _BYTE buf[24];
  uint64_t v97;
  uint64_t v98;

  v7 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_rollRecordPCSMasterKeys(v13, v14, v15);

  if ((v16 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Aborting master key roll because of behavior option override", buf, 2u);
    }
    goto LABEL_13;
  }
  v19 = 1;
  if (v7)
    v20 = 2;
  else
    v20 = 1;
  if (!a5)
  {
    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    if (v7)
    {
      v25 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v21, v22, v23);

      if (!v25)
        goto LABEL_19;
    }
    else
    {
      v28 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v21, v22, v23);

      if ((v28 & 1) == 0)
      {
LABEL_19:
        v19 = 0;
        goto LABEL_20;
      }
    }
    objc_msgSend_deviceContext(self, v17, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountDataSecurityObserver(v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v32, v36, (uint64_t)v35, 1) & 1) != 0)
    {
      IsManatee = objc_msgSend_currentServiceIsManatee(self, v37, v38);

      if ((IsManatee & 1) != 0)
      {
        v19 = 0;
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v75 = (void *)*MEMORY[0x1E0C952D8];
        v19 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v76 = v75;
          objc_msgSend_containerID(self, v77, v78);
          v79 = objc_claimAutoreleasedReturnValue();
          v80 = (void *)v79;
          v81 = CFSTR("NO");
          if (v7)
            v81 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v79;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v81;
          _os_log_impl(&dword_1BE990000, v76, OS_LOG_TYPE_INFO, "Bypassing record master key rolling container allow-list restriction due to walrus enabled, non manatee, and behavior option for container %@, isZoneishRecord:%@", buf, 0x16u);

          v19 = 1;
        }
      }
      goto LABEL_20;
    }

    goto LABEL_19;
  }
LABEL_20:
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_containerID(self, v17, v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v41, (uint64_t)v40);

  }
  else
  {
    isKeyRollingUnitTestContainerID = 0;
  }
  objc_msgSend_containerID(self, v17, v18);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v44, (uint64_t)v43) & 1) != 0)
  {

    goto LABEL_26;
  }

  if (((v19 | isKeyRollingUnitTestContainerID) & 1) != 0)
  {
LABEL_26:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v97 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    if (a3)
    {
      objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_maxRecordPCSMasterKeyRolls(v47, v48, v49);

      v51 = (void *)PCSFPCopyAvailableMasterKeyIDs();
      if (objc_msgSend_count(v51, v52, v53) > v50)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v55 = (id)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          v58 = objc_msgSend_count(v51, v56, v57);
          *(_DWORD *)v92 = 134218240;
          v93 = (_OpaquePCSShareProtection *)v50;
          v94 = 2048;
          v95 = v58;
          _os_log_impl(&dword_1BE990000, v55, OS_LOG_TYPE_INFO, "Aborting master key roll due to cap of %lu rolls. Current number of keys: %lu", v92, 0x16u);
        }

        objc_msgSend_updateCloudKitMetrics_(v10, v59, (uint64_t)&unk_1E7831628);
LABEL_60:
        v27 = 0;
LABEL_61:
        _Block_object_dispose(&v88, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_62;
      }
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = sub_1BEA69BD8;
      v87[3] = &unk_1E7831338;
      v87[4] = &v88;
      v87[5] = buf;
      v87[6] = a3;
      objc_msgSend__onSynchronizeQueue_(self, v54, (uint64_t)v87);
      if (*((_BYTE *)v89 + 24) && !*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
      {
        if (*MEMORY[0x1E0C95300] == -1)
        {
LABEL_57:
          v82 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v92 = 138412290;
            v93 = a3;
            _os_log_debug_impl(&dword_1BE990000, v82, OS_LOG_TYPE_DEBUG, "Rolled master key for record PCS %@", v92, 0xCu);
          }
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = sub_1BEA69C18;
          v85[3] = &unk_1E7831648;
          v86 = v7;
          objc_msgSend_updateCloudKitMetrics_(v10, v83, (uint64_t)v85);
          goto LABEL_60;
        }
        v73 = (void *)*MEMORY[0x1E0C952F8];
LABEL_64:
        dispatch_once(MEMORY[0x1E0C95300], v73);
        goto LABEL_57;
      }
      v69 = (void *)MEMORY[0x1E0C94FF8];
      v70 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v68, v20);
      objc_msgSend_errorWithDomain_code_error_format_(v69, v71, *MEMORY[0x1E0C94B20], v70, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), CFSTR("Couldn't roll master key for record PCS"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = (void *)MEMORY[0x1E0C94FF8];
      v61 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v45, v20);
      objc_msgSend_errorWithDomain_code_format_(v60, v62, *MEMORY[0x1E0C94B20], v61, CFSTR("Cannot roll master key for a nil record PCS"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
    }
    v72 = *(const void **)(*(_QWORD *)&buf[8] + 24);
    if (v72)
    {
      CFRelease(v72);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
    }
    v73 = (void *)*MEMORY[0x1E0C952F8];
    if (v27)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v73);
      v74 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v92 = 138412546;
        v93 = a3;
        v94 = 2112;
        v95 = (uint64_t)v27;
        _os_log_error_impl(&dword_1BE990000, v74, OS_LOG_TYPE_ERROR, "Couldn't roll master key for record PCS %@: %@", v92, 0x16u);
      }
      goto LABEL_61;
    }
    if (*MEMORY[0x1E0C95300] == -1)
      goto LABEL_57;
    goto LABEL_64;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v63 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v64 = v63;
    objc_msgSend_containerID(self, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v67;
    _os_log_impl(&dword_1BE990000, v64, OS_LOG_TYPE_INFO, "Aborting master key roll because container %@ is not on the allowlist", buf, 0xCu);

  }
LABEL_13:
  v27 = 0;
LABEL_62:

  return v27;
}

- (id)counterSignRecordPCS:(_OpaquePCSShareProtection *)a3 zonePCS:(_OpaquePCSShareProtection *)a4
{
  const char *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint8_t v25[8];
  _QWORD v26[7];
  _BYTE buf[24];
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_currentServiceIsManatee(self, a2, (uint64_t)a3) & 1) != 0)
  {
    if (a3 && a4)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v28 = 0;
      if (dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CKMarkForCounterSigning"))
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = sub_1BEA69FCC;
        v26[3] = &unk_1E78312C0;
        v26[4] = buf;
        v26[5] = a3;
        v26[6] = a4;
        objc_msgSend__onSynchronizeQueue_(self, v7, (uint64_t)v26);
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        {
          v9 = (void *)MEMORY[0x1E0C94FF8];
          v10 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v8, 1);
          objc_msgSend_errorWithDomain_code_error_format_(v9, v11, *MEMORY[0x1E0C94B20], v10, 0, CFSTR("Couldn't counter-sign record PCS"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          _Block_object_dispose(buf, 8);
          return v12;
        }
      }
      else
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v17 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "CKMarkForCounterSigning is not defined. Skipping counterSignRecordPCS", v25, 2u);
        }
      }
      v12 = 0;
      goto LABEL_22;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Didn't get decrypted record pcs and zone pcs. Record PCS: %@, Zone PCS: %@", buf, 0x16u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't counter-sign record PCS due to missing record or zone PCS"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v18 = v13;
      objc_msgSend_identityManager(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceName(v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Not counter-signing record PCS because current service %{public}@ is not manatee", buf, 0xCu);

    }
    return 0;
  }
}

- (id)updateZoneIdentityForRecordPCS:(_OpaquePCSShareProtection *)a3 usingZonePCS:(_OpaquePCSShareProtection *)a4 isZoneishRecord:(BOOL)a5 bypassAllowlistedContainers:(BOOL)a6
{
  _BOOL4 v7;
  void *v11;
  const char *v12;
  uint64_t v13;
  char v14;
  const char *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  char IsManatee;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const char *v44;
  int isKeyRollingUnitTestContainerID;
  void *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const void *v59;
  NSObject *v60;
  NSObject *v61;
  _QWORD v62[8];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t v67[4];
  _OpaquePCSShareProtection *v68;
  __int16 v69;
  _OpaquePCSShareProtection *v70;
  __int16 v71;
  void *v72;
  _BYTE buf[24];
  uint64_t v74;
  uint64_t v75;

  v7 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, (uint64_t)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_rollRecordPCSMasterKeys(v11, v12, v13);

  if ((v14 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Not updating zone PCS identity for record PCS because we're asked not to!", buf, 2u);
    }
    return 0;
  }
  if (a6)
    goto LABEL_3;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v20;
  if (v7)
  {
    v17 = objc_msgSend_allowZoneAndRecordKeyRollingInZoneishPCSZonesForAllContainers(v20, v21, v22);

    if (!v17)
      goto LABEL_23;
  }
  else
  {
    v24 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v20, v21, v22);

    if ((v24 & 1) == 0)
      goto LABEL_22;
  }
  objc_msgSend_deviceContext(self, v15, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v28, v32, (uint64_t)v31, 1) & 1) == 0)
  {

    goto LABEL_22;
  }
  IsManatee = objc_msgSend_currentServiceIsManatee(self, v33, v34);

  if ((IsManatee & 1) != 0)
  {
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v36 = (void *)*MEMORY[0x1E0C952D8];
  v17 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    v37 = v36;
    objc_msgSend_containerID(self, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = CFSTR("NO");
    if (v7)
      v42 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v42;
    _os_log_impl(&dword_1BE990000, v37, OS_LOG_TYPE_INFO, "Bypassing updating record sharee (zone key) container allow-list restriction due to walrus enabled, non-manatee and behavior option for container %@, isZoneishRecord: %@", buf, 0x16u);

LABEL_3:
    v17 = 1;
  }
LABEL_23:
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_containerID(self, v15, v16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v44, (uint64_t)v43);

  }
  else
  {
    isKeyRollingUnitTestContainerID = 0;
  }
  objc_msgSend_containerID(self, v15, v16);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__isAllowlistedKeyRollingContainerID_(self, v47, (uint64_t)v46) & 1) != 0)
  {

    goto LABEL_29;
  }

  if (((v17 | isKeyRollingUnitTestContainerID) & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v53 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v54 = v53;
      objc_msgSend_containerID(self, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v57;
      _os_log_impl(&dword_1BE990000, v54, OS_LOG_TYPE_INFO, "Not updating zone PCS identity because container %@ is not on the allowlist", buf, 0xCu);

    }
    return 0;
  }
LABEL_29:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v48, *MEMORY[0x1E0C94B20], 5005, CFSTR("Cannot roll key for a nil zone PCS"));
    v52 = objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = sub_1BEA6A718;
  v62[3] = &unk_1E7831670;
  v62[6] = a3;
  v62[7] = a4;
  v62[4] = &v63;
  v62[5] = buf;
  objc_msgSend__onSynchronizeQueue_(self, v48, (uint64_t)v62);
  v50 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  if (!*((_BYTE *)v64 + 24) || v50)
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 5005, v50, CFSTR("Couldn't update zone identity on PCS"));
    v52 = objc_claimAutoreleasedReturnValue();
LABEL_40:
    v58 = (void *)v52;
    v59 = *(const void **)(*(_QWORD *)&buf[8] + 24);
    if (v59)
    {
      CFRelease(v59);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
    }
    v51 = (void *)*MEMORY[0x1E0C952F8];
    if (v58)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v51);
      v60 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v67 = 138412802;
        v68 = a3;
        v69 = 2112;
        v70 = a4;
        v71 = 2112;
        v72 = v58;
        _os_log_error_impl(&dword_1BE990000, v60, OS_LOG_TYPE_ERROR, "Couldn't update zone identity on pcs %@ using zone PCS %@: %@", v67, 0x20u);
      }
      goto LABEL_51;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      goto LABEL_52;
    goto LABEL_48;
  }
  if (*MEMORY[0x1E0C95300] != -1)
  {
    v51 = (void *)*MEMORY[0x1E0C952F8];
LABEL_52:
    dispatch_once(MEMORY[0x1E0C95300], v51);
  }
LABEL_48:
  v61 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v67 = 138412546;
    v68 = a3;
    v69 = 2112;
    v70 = a4;
    _os_log_debug_impl(&dword_1BE990000, v61, OS_LOG_TYPE_DEBUG, "Updated zone identity on pcs %@ with zone PCS %@", v67, 0x16u);
  }
  v58 = 0;
LABEL_51:
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(buf, 8);
  return v58;
}

- (BOOL)isPreviouslyUndecryptablePCS:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  char v17;

  v4 = a3;
  objc_msgSend_synchronizeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_length(v4, v8, v9))
  {
    objc_msgSend_CKSHA256(v4, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend_undecryptablePCSDataHashes(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_containsObject_(v15, v16, (uint64_t)v14);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)markUndecryptablePCS:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_synchronizeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend_length(v4, v8, v9))
  {
    objc_msgSend_CKSHA256(v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "PCS data with hash %{public}@ is undecryptable. Recording this so we fail early on future attempts.", (uint8_t *)&v18, 0xCu);
    }
    if (v12)
    {
      objc_msgSend_undecryptablePCSDataHashes(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v16, v17, (uint64_t)v12);

    }
  }

}

- (id)removePrivateKeysForKeyIDs:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OpaquePCSShareProtection *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v31;
  __int16 v32;
  _OpaquePCSShareProtection *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = a3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    v11 = MEMORY[0x1E0C809B0];
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v6);
      v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = sub_1BEA6AC4C;
      v21[3] = &unk_1E7831698;
      v21[5] = &v26;
      v21[6] = a4;
      v21[4] = v13;
      objc_msgSend__onSynchronizeQueue_(self, v8, (uint64_t)v21);
      if (!*((_BYTE *)v27 + 24))
        break;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v22, v34, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to clean up the share PCS"));
    v14 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_15;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v15 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v31 = a4;
      v32 = 2112;
      v33 = v14;
      _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "Failed to clean up share pcs %@: %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend_count(v6, v17, v18);
      *(_DWORD *)buf = 134218242;
      v31 = (_OpaquePCSShareProtection *)v19;
      v32 = 2112;
      v33 = a4;
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Cleaned up %lu private keys from pcs %@", buf, 0x16u);
    }

    v14 = 0;
  }
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (int64_t)keyrollingErrorCodeForPCSOfType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 5020;
  else
    return qword_1BECBB598[a3 - 1];
}

- (id)rollIdentityForSharePCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4 removeAllExistingPrivateKeys:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  void *v11;
  const char *v12;
  const void *v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const void *v33;
  _QWORD v34[7];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v11 = (void *)PCSFPCopyKeyIDs();
  v13 = (const void *)PCSFPCreatePrivateKey();
  if (v13)
  {
    if (v7)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v11;
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v35, v47, 16);
      if (v17)
      {
        v33 = v13;
        v18 = *(_QWORD *)v36;
        v19 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v14);
            v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v34[0] = v19;
            v34[1] = 3221225472;
            v34[2] = sub_1BEA6B040;
            v34[3] = &unk_1E7831698;
            v34[5] = &v39;
            v34[6] = a3;
            v34[4] = v21;
            objc_msgSend__onSynchronizeQueue_(self, v16, (uint64_t)v34);
            if (!*((_BYTE *)v40 + 24))
            {
              v26 = (void *)MEMORY[0x1E0C94FF8];
              v27 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v16, a4);
              v13 = v33;
              objc_msgSend_errorWithDomain_code_format_(v26, v28, *MEMORY[0x1E0C94B20], v27, CFSTR("Failed to clean up the share PCS when creating a new private key"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
          }
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v35, v47, 16);
          if (v17)
            continue;
          break;
        }
        v22 = 0;
        v13 = v33;
      }
      else
      {
        v22 = 0;
      }
LABEL_16:

    }
    else
    {
      v22 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C94FF8];
    v24 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v12, a4);
    objc_msgSend_errorWithDomain_code_format_(v23, v25, *MEMORY[0x1E0C94B20], v24, CFSTR("Failed to create a new private key for share PCS"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)*MEMORY[0x1E0C952F8];
  if (v22)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v29);
    v30 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = a3;
      v45 = 2112;
      v46 = v22;
      _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "Failed to roll the identity for share pcs %@: %@", buf, 0x16u);
      if (!a6)
        goto LABEL_28;
      goto LABEL_23;
    }
    if (a6)
LABEL_23:
      *a6 = objc_retainAutorelease(v22);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v29);
    v31 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = a3;
      _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Rolled the identity for share pcs %@", buf, 0xCu);
    }
  }
LABEL_28:
  _Block_object_dispose(&v39, 8);

  return v11;
}

- (unint64_t)sizeOfPCS:(_OpaquePCSShareProtection *)a3
{
  unint64_t v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v3 = (unint64_t)a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)MEMORY[0x1C3B83E24](self, a2);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_1BE9BAFA8;
    v19 = sub_1BE9BAD88;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1BEA6B29C;
    v14[3] = &unk_1E7831338;
    v14[5] = &v21;
    v14[6] = v3;
    v14[4] = &v15;
    objc_msgSend__onSynchronizeQueue_(self, v6, (uint64_t)v14);
    if (v22[3] || (v11 = (void *)v16[5]) == 0)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v9 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v13 = v22[3];
        *(_DWORD *)buf = 138412546;
        v26 = v3;
        v27 = 2112;
        v28 = v13;
        _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Failed to serialize PCS %@: %@", buf, 0x16u);
      }
      v10 = (const void *)v22[3];
      if (v10)
      {
        CFRelease(v10);
        v3 = 0;
        v22[3] = 0;
      }
      else
      {
        v3 = 0;
      }
    }
    else
    {
      v3 = objc_msgSend_length(v11, v7, v8);
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    objc_autoreleasePoolPop(v5);
  }
  return v3;
}

- (unint64_t)maxPcsBytes
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_maxPCSSizeForKeyRolls(v3, v4, v5);

  return v6;
}

- (BOOL)isPCSSizeTooBigForKeyRoll:(unint64_t)a3
{
  unint64_t v4;
  BOOL v5;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_maxPcsBytes(self, a2, a3);
  if (v4)
    v5 = v4 >= a3;
  else
    v5 = 1;
  v6 = !v5;
  if (v6)
  {
    v7 = v4;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v8 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = a3;
      v12 = 2048;
      v13 = v7;
      _os_log_error_impl(&dword_1BE990000, v8, OS_LOG_TYPE_ERROR, "PCS is too big for key rolling: %lu bytes (cap: %lu bytes)", (uint8_t *)&v10, 0x16u);
    }
  }
  return v6;
}

- (BOOL)isPCSTooBigForKeyRoll:(_OpaquePCSShareProtection *)a3
{
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_sizeOfPCS_(self, a2, (uint64_t)a3);
  return objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v5, v4);
}

- (id)updateIdentityAndRollKeyForZonePCS:(_OpaquePCSShareProtection *)a3 usingServiceIdentityWithType:(unint64_t)a4 forOperation:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  char IsManatee;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  int v32;
  _QWORD *v33;
  void *v34;
  char v35;
  os_log_t *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  const void *v43;
  id v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  const char *v49;
  NSObject *v50;
  id v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  const void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  const __CFString *v61;
  NSObject *v62;
  _OpaquePCSShareProtection *v64;
  uint64_t v65;
  _QWORD v66[8];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint8_t v72[4];
  _OpaquePCSShareProtection *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int128 buf;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v64 = a3;
  v81 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_rollZonePCSIdentities(v10, v11, v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend_identityManager(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_PCSServiceStringFromCKServiceType_(v16, v17, a4);
    v18 = objc_claimAutoreleasedReturnValue();

    IsManatee = objc_msgSend_currentServiceIsManatee(self, v19, v20);
    objc_msgSend_deviceContext(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountDataSecurityObserver(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v27, v31, (uint64_t)v30, 1);

    v33 = (_QWORD *)MEMORY[0x1E0C95300];
    v34 = (void *)v18;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = IsManatee | v32;
    v36 = (os_log_t *)MEMORY[0x1E0C952D8];
    v37 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v61 = CFSTR("is not");
      if (v32)
        v61 = CFSTR("is");
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v61;
      _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&buf, 0xCu);
      if ((v35 & 1) != 0)
      {
LABEL_6:
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v79 = 0x2020000000;
        v80 = 0;
        v68 = 0;
        v69 = &v68;
        v70 = 0x2020000000;
        v71 = 0;
        if (v64)
        {
          objc_msgSend_identityManager(self, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v34;
          v67 = 0;
          v43 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v40, v42, a4, 1, &v67);
          v44 = v67;

          if (v43 && !v44)
          {
            if (objc_msgSend_isPCSTooBigForKeyRoll_(self, v45, (uint64_t)v64))
            {
              if (*v33 != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v47 = *v36;
              if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v72 = 0;
                _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Aborting zone identity key roll due to current zone PCS being too large.", v72, 2u);
              }
              objc_msgSend_updateCloudKitMetrics_(v7, v48, (uint64_t)&unk_1E78316B8, v64);
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 5018, 0, CFSTR("Cannot roll key for too large zone PCS"), v65);
            }
            else
            {
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = sub_1BEA6BB8C;
              v66[3] = &unk_1E7831670;
              v66[6] = v64;
              v66[7] = v43;
              v66[4] = &v68;
              v66[5] = &buf;
              objc_msgSend__onSynchronizeQueue_(self, v46, (uint64_t)v66);
              v54 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
              if (*((_BYTE *)v69 + 24) && !v54)
              {
                objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v53, (uint64_t)v64, 3, 0, CFSTR("Couldn't roll key for zone PCS"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (v52)
                {
                  if (*v33 != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  v55 = *v36;
                  if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v72 = 138412546;
                    v73 = v64;
                    v74 = 2112;
                    v75 = v52;
                    _os_log_error_impl(&dword_1BE990000, v55, OS_LOG_TYPE_ERROR, "Failed to roll primary key of the zone PCS %@: %@", v72, 0x16u);
                  }
                }
                goto LABEL_31;
              }
              objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v53, *MEMORY[0x1E0C94B20], 5018, v54, CFSTR("Couldn't roll key for zone PCS"), v64);
            }
            v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
            v44 = 0;
            goto LABEL_32;
          }
          objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v45, *MEMORY[0x1E0C94B20], 5000, v44, CFSTR("Couldn't get a service identity set"), v64);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v38, *MEMORY[0x1E0C94B20], 5018, CFSTR("Cannot roll key for a nil zone PCS"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v34;
          v44 = 0;
          v43 = 0;
        }
LABEL_32:
        v56 = *(const void **)(*((_QWORD *)&buf + 1) + 24);
        if (v56)
        {
          CFRelease(v56);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = 0;
        }
        if (v43)
          CFRelease(v43);
        v57 = (void *)*MEMORY[0x1E0C952F8];
        if (v52)
        {
          if (*v33 != -1)
            dispatch_once(MEMORY[0x1E0C95300], v57);
          v58 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v72 = 138412802;
            v73 = v64;
            v74 = 2114;
            v75 = v41;
            v76 = 2112;
            v77 = v52;
            _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Couldn't roll key for zone PCS %@ with current service %{public}@: %@", v72, 0x20u);
          }
        }
        else
        {
          if (*v33 != -1)
            dispatch_once(MEMORY[0x1E0C95300], v57);
          v59 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v72 = 138412546;
            v73 = v64;
            v74 = 2114;
            v75 = v41;
            _os_log_debug_impl(&dword_1BE990000, v59, OS_LOG_TYPE_DEBUG, "Rolled key for zone PCS %@ with current service: %{public}@", v72, 0x16u);
          }
          objc_msgSend_updateCloudKitMetrics_(v7, v60, (uint64_t)&unk_1E78316D8, v64);
        }
        v51 = v52;
        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&buf, 8);

LABEL_55:
        goto LABEL_56;
      }
    }
    else if ((v35 & 1) != 0)
    {
      goto LABEL_6;
    }
    if (*v33 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = v34;
    v62 = *v36;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v34;
      _os_log_impl(&dword_1BE990000, v62, OS_LOG_TYPE_INFO, "Not rolling zone PCS identities because we're using a non-manatee service identity: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v51 = 0;
    goto LABEL_55;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v50 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BE990000, v50, OS_LOG_TYPE_INFO, "Not rolling zone PCS identities because we're asked not to!", (uint8_t *)&buf, 2u);
  }
  v51 = 0;
LABEL_56:

  return v51;
}

- (BOOL)canRollShareKeys
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t v9;
  char IsManatee;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  int v21;
  _QWORD *v22;
  char v23;
  os_log_t *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  const __CFString *v28;
  os_log_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  __CFString *v36;
  int v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_rollZoneSharingKeys(v4, v5, v6);

  if ((v7 & 1) != 0)
  {
    IsManatee = objc_msgSend_currentServiceIsManatee(self, v8, v9);
    objc_msgSend_deviceContext(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountDataSecurityObserver(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v16, v20, (uint64_t)v19, 1);

    v22 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = IsManatee | v21;
    v24 = (os_log_t *)MEMORY[0x1E0C952D8];
    v25 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v28 = CFSTR("is not");
      if (v21)
        v28 = CFSTR("is");
      v38 = 138412290;
      v39 = v28;
      _os_log_debug_impl(&dword_1BE990000, v25, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&v38, 0xCu);
      if ((v23 & 1) != 0)
        goto LABEL_6;
    }
    else if ((v23 & 1) != 0)
    {
LABEL_6:
      LOBYTE(v26) = 1;
      return v26;
    }
    if (*v22 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = *v24;
    v26 = os_log_type_enabled(*v24, OS_LOG_TYPE_INFO);
    if (v26)
    {
      v30 = v29;
      objc_msgSend_identityManager(self, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceName(v33, v34, v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v38 = 138543362;
      v39 = v36;
      _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Not rolling zone sharing PCS identities because current service %{public}@ is not manatee", (uint8_t *)&v38, 0xCu);

      goto LABEL_18;
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *MEMORY[0x1E0C952D8];
    v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO);
    if (v26)
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1BE990000, v27, OS_LOG_TYPE_INFO, "Not rolling zone sharing PCS identities due to behavior option", (uint8_t *)&v38, 2u);
LABEL_18:
      LOBYTE(v26) = 0;
    }
  }
  return v26;
}

- (id)keyRollForZoneWideShareWithZonePCS:(id)a3 sharePCS:(id)a4 forOperation:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char canRollShareKeys;
  const char *v17;
  uint64_t v18;
  os_log_t *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  os_log_t v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  id v48;
  const char *v49;
  char v50;
  id v51;
  const char *v52;
  id v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  int v57;
  NSObject *v58;
  const void *v59;
  NSObject *v60;
  id v61;
  uint64_t v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  char v72;
  id v73;
  const char *v74;
  char v75;
  id v76;
  const char *v77;
  void *v78;
  const char *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  NSObject *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  NSObject *v98;
  const char *v99;
  const char *v100;
  NSObject *v101;
  const char *v102;
  NSObject *v103;
  uint32_t v104;
  NSObject *v105;
  NSObject *v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  const char *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  NSObject *v117;
  uint32_t v118;
  CFTypeRef v119;
  CFTypeRef v120;
  CFTypeRef cf;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  uint8_t buf[4];
  uint64_t v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  uint64_t v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_zoneID(v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  canRollShareKeys = objc_msgSend_canRollShareKeys(self, v14, v15);
  v19 = (os_log_t *)MEMORY[0x1E0C952D8];
  if ((canRollShareKeys & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
LABEL_67:
      v60 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v131 = (uint64_t)v13;
        _os_log_impl(&dword_1BE990000, v60, OS_LOG_TYPE_INFO, "Skipped key roll for zone-wide share in zone %@", buf, 0xCu);
      }
      goto LABEL_69;
    }
    *(_DWORD *)buf = 138412290;
    v131 = (uint64_t)v13;
    _os_log_error_impl(&dword_1BE990000, v26, OS_LOG_TYPE_ERROR, "Attempting to roll share keys for zone-wide share in zone %@ but this operation is not permitted", buf, 0xCu);
    v29 = 0;
    v28 = 0;
    v27 = 0;
    goto LABEL_65;
  }
  if (!objc_msgSend_pcs(v9, v17, v18) || !objc_msgSend_pcs(v8, v20, v21))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v30 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      v65 = v30;
      *(_DWORD *)buf = 138412802;
      v131 = objc_msgSend_pcs(v9, v66, v67);
      v132 = 2112;
      v133 = objc_msgSend_pcs(v8, v68, v69);
      v134 = 2112;
      v135 = objc_msgSend_zoneishPCS(v8, v70, v71);
      _os_log_error_impl(&dword_1BE990000, v65, OS_LOG_TYPE_ERROR, "Didn't get decrypted share, shared zone pcs to roll- aborting. Share PCS: %@, Zone PCS: %@, Zoneish PCS: %@", buf, 0x20u);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't roll zone wide share PCS due to missing share or zone PCS"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v27 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend_zoneishPCS(v8, v22, v23))
  {
    objc_msgSend_zoneishPCS(v8, v24, v25);
    v119 = (CFTypeRef)PCSFPCopyObject();
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
    {
      v119 = 0;
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v36, OS_LOG_TYPE_INFO, "Didn't get decrypted zoneish pcs to roll- solidering on. We're probably using per-record PCS.", buf, 2u);
    v119 = 0;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_31:
  v37 = *v19;
  if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v131 = (uint64_t)v13;
    _os_log_impl(&dword_1BE990000, v37, OS_LOG_TYPE_INFO, "Rolling identities for zone-wide share and zone pcs for zone %@", buf, 0xCu);
  }
  objc_msgSend_pcs(v8, v38, v39);
  v40 = PCSFPCopyObject();
  objc_msgSend_invitedPCS(v9, v41, v42);
  v43 = (const void *)PCSFPCopyObject();
  objc_msgSend_publicPCS(v9, v44, v45);
  v46 = PCSFPCopyObject();
  v129 = 0;
  cf = (CFTypeRef)v40;
  LOBYTE(v40) = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v47, (uint64_t)v43, v40, &v129);
  v48 = v129;
  v29 = v48;
  v120 = (CFTypeRef)v46;
  if ((v40 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v55 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 138412546;
    v131 = (uint64_t)v13;
    v132 = 2112;
    v133 = (uint64_t)v29;
    v56 = "Couldn't remove old invited PCS from zone PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  v128 = v48;
  v50 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v49, (uint64_t)v43, v46, &v128);
  v51 = v128;

  if ((v50 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v58 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v51;
      _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Couldn't remove old invited PCS from public PCS for zone-wide share in zone %@: %@", buf, 0x16u);
    }
    v57 = 0;
    v27 = 0;
    v28 = 0;
    v29 = v51;
    goto LABEL_51;
  }
  v127 = v51;
  v53 = (id)objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(self, v52, (uint64_t)v43, 5, 1, &v127);
  v29 = v127;

  if (v29)
  {
    v19 = (os_log_t *)MEMORY[0x1E0C952D8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 138412546;
    v131 = (uint64_t)v13;
    v132 = 2112;
    v133 = (uint64_t)v29;
    v56 = "Failed to roll identity for invited PCS for zone-wide share in zone %@: %@";
LABEL_84:
    _os_log_error_impl(&dword_1BE990000, v55, OS_LOG_TYPE_ERROR, v56, buf, 0x16u);
LABEL_43:
    v57 = 0;
LABEL_44:
    v27 = 0;
LABEL_45:
    v28 = 0;
    goto LABEL_52;
  }
  objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v54, (uint64_t)v43, 5);
  v63 = objc_claimAutoreleasedReturnValue();
  v19 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (v63)
  {
    v29 = (id)v63;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 138412546;
    v131 = (uint64_t)v13;
    v132 = 2112;
    v133 = (uint64_t)v29;
    v56 = "Failed to roll primary key of the invited PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  v126 = 0;
  v72 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v64, (uint64_t)v43, cf, &v126);
  v73 = v126;
  v29 = v73;
  if ((v72 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v55 = *v19;
    if (!os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 138412546;
    v131 = (uint64_t)v13;
    v132 = 2112;
    v133 = (uint64_t)v29;
    v56 = "Failed to add rolled invited PCS key to zone PCS for zone-wide share in zone %@: %@";
    goto LABEL_84;
  }
  v125 = v73;
  v75 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v74, (uint64_t)v43, v46, &v125);
  v76 = v125;

  if ((v75 & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v81 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v76;
      _os_log_error_impl(&dword_1BE990000, v81, OS_LOG_TYPE_ERROR, "Failed to add rolled invited PCS key to public PCS for zone-wide share in zone %@: %@", buf, 0x16u);
    }
    v57 = 0;
    v29 = v76;
    goto LABEL_44;
  }
  v124 = v76;
  objc_msgSend_rollIdentityForSharePCS_ofType_removeAllExistingPrivateKeys_error_(self, v77, (uint64_t)cf, 3, 0, &v124);
  v78 = v76;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v124;

  if (v29)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v80 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v29;
      _os_log_error_impl(&dword_1BE990000, v80, OS_LOG_TYPE_ERROR, "Failed to roll identity for zone PCS for zone %@: %@", buf, 0x16u);
    }
    v57 = 0;
    goto LABEL_45;
  }
  v82 = objc_msgSend_sizeOfPCS_(self, v79, (uint64_t)cf);
  v84 = objc_msgSend_sizeOfPCS_(self, v83, (uint64_t)v119) + v82;
  v86 = objc_msgSend_sizeOfPCS_(self, v85, (uint64_t)v43);
  v88 = objc_msgSend_sizeOfPCS_(self, v87, (uint64_t)v120);
  if (objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v89, v84 + v86 + v88))
  {
    v19 = (os_log_t *)MEMORY[0x1E0C952D8];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v91 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v131 = (uint64_t)v13;
      _os_log_error_impl(&dword_1BE990000, v91, OS_LOG_TYPE_ERROR, "Skipping zone key roll because combined PCS is too big in zone %@", buf, 0xCu);
    }
    objc_msgSend_updateCloudKitMetrics_(v10, v92, (uint64_t)&unk_1E78316F8);
    v28 = 0;
    v29 = 0;
    v57 = 1;
LABEL_52:
    v59 = cf;
    if (!cf)
      goto LABEL_54;
    goto LABEL_53;
  }
  if (v119)
  {
    v123 = 0;
    objc_msgSend_dataFromRecordPCS_error_(self, v90, (uint64_t)v119, &v123);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v123;
    if (v29 || !v28)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v19 = (os_log_t *)MEMORY[0x1E0C952D8];
      v105 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      *(_DWORD *)buf = 138412290;
      v131 = (uint64_t)v29;
      v102 = "Couldn't serialize zoneish PCS for share roll: %@";
      v103 = v105;
      v104 = 12;
      goto LABEL_138;
    }
    CFRelease(v119);
    v122 = 0;
    v94 = objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v93, (uint64_t)v28, 1, cf, &v122);
    v29 = v122;
    v119 = (CFTypeRef)v94;
    if (v29 || !v94)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v106 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_DWORD *)buf = 138412290;
      v131 = (uint64_t)v29;
      v99 = "Couldn't decode zoneishPCS data for share roll: %@";
      v117 = v106;
      v118 = 12;
      goto LABEL_140;
    }
    objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v95, v94, cf, 1, 1);
    v96 = objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      v29 = (id)v96;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v98 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v29;
      v99 = "Couldn't update identity on zoneish PCS for zone %@: %@";
      goto LABEL_136;
    }
    objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v97, v94, 1, 1, v10);
    v114 = objc_claimAutoreleasedReturnValue();
    if (v114)
    {
      v29 = (id)v114;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v98 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v29;
      v99 = "Failed to roll master key for zoneish PCS for zone %@: %@";
      goto LABEL_136;
    }
    objc_msgSend_removePrivateKeysForKeyIDs_fromPCS_(self, v115, (uint64_t)v27, cf);
    v116 = objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      v29 = (id)v116;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v98 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_123;
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v29;
      v99 = "Couldn't clean up old private keys from PCS for zone %@: %@";
LABEL_136:
      v117 = v98;
      v118 = 22;
LABEL_140:
      _os_log_error_impl(&dword_1BE990000, v117, OS_LOG_TYPE_ERROR, v99, buf, v118);
LABEL_123:
      v57 = 0;
LABEL_51:
      v19 = (os_log_t *)MEMORY[0x1E0C952D8];
      goto LABEL_52;
    }
  }
  else
  {
    v28 = 0;
    v119 = 0;
  }
  objc_msgSend_replacePrimaryKeyInPCS_ofType_(self, v90, (uint64_t)cf, 3);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = (os_log_t *)MEMORY[0x1E0C952D8];
    v101 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      goto LABEL_119;
    *(_DWORD *)buf = 138412546;
    v131 = (uint64_t)v13;
    v132 = 2112;
    v133 = (uint64_t)v29;
    v102 = "Failed to roll primary key of the PCS for zone %@: %@";
    v103 = v101;
    v104 = 22;
LABEL_138:
    _os_log_error_impl(&dword_1BE990000, v103, OS_LOG_TYPE_ERROR, v102, buf, v104);
LABEL_119:
    v57 = 0;
    goto LABEL_52;
  }
  objc_msgSend_setPcs_(v8, v100, (uint64_t)cf);
  objc_msgSend_setZoneishPCS_(v8, v107, (uint64_t)v119);
  v110 = objc_msgSend_invitedPCS(v9, v108, v109);
  objc_msgSend_setPreKeyRollInvitedPCS_(v9, v111, v110);
  objc_msgSend_setInvitedPCS_(v9, v112, (uint64_t)v43);
  objc_msgSend_setPublicPCS_(v9, v113, (uint64_t)v120);
  v59 = cf;
  v57 = 0;
  v19 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (cf)
LABEL_53:
    CFRelease(v59);
LABEL_54:
  if (v119)
    CFRelease(v119);
  if (v43)
    CFRelease(v43);
  if (!v120)
  {
    if (!v57)
      goto LABEL_15;
LABEL_65:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    goto LABEL_67;
  }
  CFRelease(v120);
  if ((v57 & 1) != 0)
    goto LABEL_65;
LABEL_15:
  v32 = (void *)*MEMORY[0x1E0C952F8];
  if (v29)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v32);
    v33 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v131 = (uint64_t)v13;
      v132 = 2112;
      v133 = (uint64_t)v29;
      _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Failed to roll keys for zone-wide share in zone %@: %@", buf, 0x16u);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v32);
    v34 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v131 = (uint64_t)v13;
      _os_log_impl(&dword_1BE990000, v34, OS_LOG_TYPE_INFO, "Successfully rolled keys for zone-wide share in zone %@", buf, 0xCu);
    }
    objc_msgSend_updateCloudKitMetrics_(v10, v35, (uint64_t)&unk_1E7831718);
    v29 = 0;
  }
LABEL_69:
  v61 = v29;

  return v61;
}

- (id)replacePrimaryKeyInPCS:(_OpaquePCSShareProtection *)a3 ofType:(unint64_t)a4
{
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const void *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEA6D084;
  v13[3] = &unk_1E7831338;
  v13[5] = &v18;
  v13[6] = a3;
  v13[4] = &v14;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v13);
  if (*((_BYTE *)v15 + 24) && !v19[3])
  {
    v10 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C94FF8];
    v8 = objc_msgSend_keyrollingErrorCodeForPCSOfType_(self, v6, a4);
    objc_msgSend_errorWithDomain_code_error_format_(v7, v9, *MEMORY[0x1E0C94B20], v8, v19[3], CFSTR("Couldn't replace primary key of PCS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const void *)v19[3];
    if (v11)
    {
      CFRelease(v11);
      v19[3] = 0;
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)keyRollIfNeededForPerRecordPCS:(id)a3 needsRollAndCounterSign:(BOOL)a4 forOperation:(id)a5 didRoll:(BOOL *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  char IsManatee;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  uint64_t *v26;
  char v27;
  os_log_t *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  char v38;
  os_log_t v39;
  void *v40;
  const char *v41;
  unsigned __int8 isKeyRollingUnitTestContainerID;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  os_log_t v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  os_log_t v71;
  const char *v72;
  os_log_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  os_log_t v79;
  const char *v80;
  uint64_t v81;
  const __CFString *v82;
  os_log_t v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  os_log_t v91;
  uint64_t v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  os_log_t v122;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  os_log_t v127;
  NSObject *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  int v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  uint64_t v137;

  v8 = a4;
  v137 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  IsManatee = objc_msgSend_currentServiceIsManatee(self, v12, v13);
  objc_msgSend_deviceContext(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_isWalrusEnabledForAccount_allowBlockingFetch_(v20, v24, (uint64_t)v23, 1);

  v26 = (uint64_t *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v27 = IsManatee | v25;
  v28 = (os_log_t *)MEMORY[0x1E0C952D8];
  v29 = *MEMORY[0x1E0C952D8];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    if ((v27 & 1) != 0)
      goto LABEL_5;
LABEL_47:
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v83 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      v84 = v83;
      objc_msgSend_identityManager(self, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_serviceName(v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138543362;
      v134 = (uint64_t)v90;
      _os_log_debug_impl(&dword_1BE990000, v84, OS_LOG_TYPE_DEBUG, "Not rolling record PCS keys because current service %{public}@ is not manatee", (uint8_t *)&v133, 0xCu);

    }
    goto LABEL_51;
  }
  v82 = CFSTR("is not");
  if (v25)
    v82 = CFSTR("is");
  v133 = 138412290;
  v134 = (uint64_t)v82;
  _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Walrus %@ enabled", (uint8_t *)&v133, 0xCu);
  if ((v27 & 1) == 0)
    goto LABEL_47;
LABEL_5:
  objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_allowRecordKeyRollingInPerRecordPCSZonesForAllContainers(v32, v33, v34);

  if ((v35 & v25) == 1 && (objc_msgSend_currentServiceIsManatee(self, v36, v37) & 1) == 0)
  {
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v39 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEBUG))
    {
      v118 = v39;
      objc_msgSend_containerID(self, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412290;
      v134 = (uint64_t)v121;
      _os_log_debug_impl(&dword_1BE990000, v118, OS_LOG_TYPE_DEBUG, "Allowing record PCS key rolling in container %@ due to walrus enabled, non manatee, and behavior option override", (uint8_t *)&v133, 0xCu);

    }
    v38 = 1;
  }
  else
  {
    v38 = 0;
  }
  if (*MEMORY[0x1E0C95280])
  {
    objc_msgSend_containerID(self, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isKeyRollingUnitTestContainerID = objc_msgSend__isKeyRollingUnitTestContainerID_(self, v41, (uint64_t)v40);

  }
  else
  {
    isKeyRollingUnitTestContainerID = 0;
  }
  objc_msgSend_containerID(self, v36, v37);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_specialContainerType(v43, v44, v45) != 34)
  {

    if (((v38 | isKeyRollingUnitTestContainerID) & 1) != 0)
      goto LABEL_19;
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v73 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
    {
      v74 = v73;
      objc_msgSend_containerID(self, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412290;
      v134 = (uint64_t)v77;
      _os_log_impl(&dword_1BE990000, v74, OS_LOG_TYPE_INFO, "Not checking PCS shouldRoll hint because we're not allowed to in container %@", (uint8_t *)&v133, 0xCu);

    }
LABEL_51:
    v64 = 0;
    goto LABEL_76;
  }

LABEL_19:
  if (!objc_msgSend_pcs(v10, v46, v47)
    || (objc_msgSend_zonePCSData(v10, v48, v49),
        v50 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = objc_msgSend_pcs(v50, v51, v52),
        v50,
        !v53))
  {
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v71 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
    {
      v108 = v71;
      v111 = objc_msgSend_pcs(v10, v109, v110);
      objc_msgSend_zonePCSData(v10, v112, v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend_pcs(v114, v115, v116);
      v133 = 138412546;
      v134 = v111;
      v135 = 2112;
      v136 = v117;
      _os_log_error_impl(&dword_1BE990000, v108, OS_LOG_TYPE_ERROR, "Didn't get decrypted record pcs and zone pcs to roll- aborting. Record PCS: %@, Zone PCS: %@", (uint8_t *)&v133, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v72, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't roll record PCS due to missing record or zone PCS"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_71;
  }
  objc_msgSend_pcs(v10, v54, v55);
  v56 = (const void *)PCSFPCopyObject();
  if (PCSFPShouldRoll())
  {
    objc_msgSend_zonePCSData(v10, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_pcs(v59, v60, v61);
    objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v63, (uint64_t)v56, v62, 0, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      if (*v26 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v65 = *v28;
      if (!os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      v66 = v65;
      objc_msgSend_recordID(v10, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412546;
      v134 = (uint64_t)v69;
      v135 = 2112;
      v136 = (uint64_t)v64;
      v70 = "Couldn't update identity on record PCS for record %@: %@";
      goto LABEL_42;
    }
  }
  else if (!v8)
  {
    goto LABEL_68;
  }
  objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v57, (uint64_t)v56, 0, 1, v11);
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v64 = (void *)v78;
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v79 = *v28;
    if (!os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    v66 = v79;
    objc_msgSend_recordID(v10, v80, v81);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 138412546;
    v134 = (uint64_t)v69;
    v135 = 2112;
    v136 = (uint64_t)v64;
    v70 = "Failed to roll master key for record PCS for record %@: %@";
LABEL_42:
    _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, v70, (uint8_t *)&v133, 0x16u);
LABEL_43:

    goto LABEL_69;
  }
  if (a6)
    *a6 = 1;
  if (*v26 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v91 = *v28;
  if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
  {
    v93 = v91;
    objc_msgSend_recordID(v10, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 138543362;
    v134 = (uint64_t)v96;
    _os_log_impl(&dword_1BE990000, v93, OS_LOG_TYPE_INFO, "Successfully rolled keys for record %{public}@", (uint8_t *)&v133, 0xCu);

  }
  if (v8)
  {
    objc_msgSend_zonePCSData(v10, v57, v92);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcs(v97, v98, v99);
    v100 = PCSFPCopyObject();

    objc_msgSend_counterSignRecordPCS_zonePCS_(self, v101, (uint64_t)v56, v100);
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)*MEMORY[0x1E0C952F8];
    v104 = *v26;
    if (v102)
    {
      v64 = (void *)v102;
      if (v104 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v103);
      v105 = (void *)*MEMORY[0x1E0C952B0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        goto LABEL_69;
      v66 = v105;
      objc_msgSend_recordID(v10, v106, v107);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412546;
      v134 = (uint64_t)v69;
      v135 = 2112;
      v136 = 0;
      _os_log_debug_impl(&dword_1BE990000, v66, OS_LOG_TYPE_DEBUG, "Error counter-signing record %@: %@", (uint8_t *)&v133, 0x16u);
      goto LABEL_43;
    }
    if (v104 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v103);
    v122 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
    {
      v123 = v122;
      objc_msgSend_recordID(v10, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412290;
      v134 = (uint64_t)v126;
      _os_log_impl(&dword_1BE990000, v123, OS_LOG_TYPE_INFO, "Successfully counter-signed record %@ if it was necessary", (uint8_t *)&v133, 0xCu);

    }
  }
LABEL_68:
  objc_msgSend_setPcs_(v10, v57, (uint64_t)v56);
  v64 = 0;
LABEL_69:
  if (v56)
    CFRelease(v56);
LABEL_71:
  if (v64)
  {
    if (*v26 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v127 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_ERROR))
    {
      v129 = v127;
      objc_msgSend_recordID(v10, v130, v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = 138412546;
      v134 = (uint64_t)v132;
      v135 = 2112;
      v136 = (uint64_t)v64;
      _os_log_error_impl(&dword_1BE990000, v129, OS_LOG_TYPE_ERROR, "Failed to roll keys for record PCS for record %@: %@", (uint8_t *)&v133, 0x16u);

    }
  }
LABEL_76:

  return v64;
}

- (id)keyRollForZoneWideShareRecordPCS:(id)a3 sharedZonePCS:(id)a4 sharePCS:(id)a5 forOperation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  int isPCSSizeTooBigForKeyRoll;
  const void *v57;
  NSObject *v58;
  const char *v59;
  NSObject *v60;
  id v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  const void *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  char v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  char v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  char v100;
  const char *v101;
  const char *v102;
  NSObject *v103;
  NSObject *v105;
  char v106;
  id v107;
  id v108;
  void *v109;
  CFTypeRef cf;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  uint8_t buf[4];
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_zoneID(v11, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_canRollShareKeys(self, v17, v18) & 1) != 0)
  {
    if (!objc_msgSend_pcs(v10, v19, v20) || !objc_msgSend_pcs(v11, v21, v22) || !objc_msgSend_pcs(v12, v23, v24))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v62 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        v68 = v62;
        *(_DWORD *)buf = 138412802;
        v118 = objc_msgSend_pcs(v12, v69, v70);
        v119 = 2112;
        v120 = objc_msgSend_pcs(v11, v71, v72);
        v121 = 2112;
        v122 = objc_msgSend_pcs(v10, v73, v74);
        _os_log_error_impl(&dword_1BE990000, v68, OS_LOG_TYPE_ERROR, "Didn't get decrypted share, shared zone and record pcs to roll- aborting. Share PCS: %@, Zone PCS: %@, record PCS: %@", buf, 0x20u);

      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v63, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't roll zone-wide share record PCS due to missing share or zone PCS"));
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      if (!v32)
        goto LABEL_76;
      goto LABEL_27;
    }
    objc_msgSend_pcs(v10, v25, v26);
    v27 = (const void *)PCSFPCopyObject();
    v116 = 0;
    objc_msgSend_dataFromRecordPCS_error_(self, v28, (uint64_t)v27, &v116);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v116;
    if (v32 || !v29)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v65 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buf = 138412290;
      v118 = (uint64_t)v32;
      v66 = "Couldn't serialize zone-wide share record PCS for share roll: %@";
    }
    else
    {
      if (v27)
        CFRelease(v27);
      v33 = objc_msgSend_pcs(v11, v30, v31);
      v115 = 0;
      v27 = (const void *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_error_(self, v34, (uint64_t)v29, 1, v33, &v115);
      v32 = v115;
      if (!v32 && v27)
      {
        v109 = v29;
        objc_msgSend_publicPCS(v12, v35, v36);
        v37 = (uint64_t)v27;
        v38 = PCSFPCopyObject();
        v40 = objc_msgSend_sizeOfPCS_(self, v39, v37);
        v43 = objc_msgSend_pcs(v11, v41, v42);
        v45 = objc_msgSend_sizeOfPCS_(self, v44, v43);
        v48 = objc_msgSend_pcs(v12, v46, v47);
        v50 = v45 + objc_msgSend_sizeOfPCS_(self, v49, v48);
        cf = (CFTypeRef)v38;
        v52 = objc_msgSend_sizeOfPCS_(self, v51, v38);
        isPCSSizeTooBigForKeyRoll = objc_msgSend_isPCSSizeTooBigForKeyRoll_(self, v53, v50 + v52 + v40);
        if (isPCSSizeTooBigForKeyRoll)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v57 = (const void *)v37;
          v58 = *MEMORY[0x1E0C952D8];
          v29 = v109;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v118 = (uint64_t)v16;
            _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Skipping zone-wide share record key roll because combined PCS is too big in zone %@", buf, 0xCu);
          }
          objc_msgSend_updateCloudKitMetrics_(v13, v59, (uint64_t)&unk_1E7831738);
          v32 = 0;
          goto LABEL_72;
        }
        v75 = objc_msgSend_pcs(v11, v54, v55);
        objc_msgSend_updateZoneIdentityForRecordPCS_usingZonePCS_isZoneishRecord_bypassAllowlistedContainers_(self, v76, v37, v75, 0, 1);
        v77 = objc_claimAutoreleasedReturnValue();
        v57 = (const void *)v37;
        if (v77)
        {
          v32 = (id)v77;
          v29 = v109;
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v79 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v118 = (uint64_t)v16;
            v119 = 2112;
            v120 = (uint64_t)v32;
            v80 = "Couldn't update identity on zone-wide share record PCS for zone %@: %@";
LABEL_71:
            _os_log_error_impl(&dword_1BE990000, v79, OS_LOG_TYPE_ERROR, v80, buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend_rollMasterKeyForRecordPCS_isZoneishRecord_bypassAllowlistedContainers_forOperation_(self, v78, v37, 0, 1, v13);
          v81 = objc_claimAutoreleasedReturnValue();
          v29 = v109;
          if (v81)
          {
            v32 = (id)v81;
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v79 = *MEMORY[0x1E0C952D8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v118 = (uint64_t)v16;
              v119 = 2112;
              v120 = (uint64_t)v32;
              v80 = "Failed to roll master key for zone-wide share record PCS for zone %@: %@";
              goto LABEL_71;
            }
          }
          else
          {
            v84 = objc_msgSend_preKeyRollInvitedPCS(v12, v82, v83);
            v114 = 0;
            v86 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v85, v84, v57, &v114);
            v32 = v114;
            if ((v86 & 1) != 0)
            {
              v89 = objc_msgSend_preKeyRollInvitedPCS(v12, v87, v88);
              v113 = v32;
              v91 = objc_msgSend_removeSharePCS_fromRecordPCS_error_(self, v90, v89, cf, &v113);
              v107 = v113;

              if ((v91 & 1) != 0)
              {
                v94 = objc_msgSend_pcs(v12, v92, v93);
                v112 = v107;
                v106 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v95, v94, v57, &v112);
                v32 = v112;

                if ((v106 & 1) != 0)
                {
                  v98 = objc_msgSend_pcs(v12, v96, v97);
                  v111 = v32;
                  v100 = objc_msgSend_addSharePCS_toRecordPCS_error_(self, v99, v98, cf, &v111);
                  v108 = v111;

                  if ((v100 & 1) != 0)
                  {
                    objc_msgSend_setPcs_(v10, v101, (uint64_t)v57);
                    objc_msgSend_setPublicPCS_(v12, v102, (uint64_t)cf);
                    v32 = v108;
                    LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                  }
                  else
                  {
                    if (*MEMORY[0x1E0C95300] != -1)
                      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                    v105 = *MEMORY[0x1E0C952D8];
                    LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v118 = (uint64_t)v16;
                      v119 = 2112;
                      v120 = (uint64_t)v108;
                      _os_log_error_impl(&dword_1BE990000, v105, OS_LOG_TYPE_ERROR, "Failed to add rolled invited PCS key to public PCS for zone-wide share record PCS for zone %@: %@", buf, 0x16u);
                    }
                    v32 = v108;
                  }
                }
                else
                {
                  if (*MEMORY[0x1E0C95300] != -1)
                    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                  LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                  v79 = *MEMORY[0x1E0C952D8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v118 = (uint64_t)v16;
                    v119 = 2112;
                    v120 = (uint64_t)v32;
                    v80 = "Failed to add rolled invited PCS key to zone-wide share record PCS for zone %@: %@";
                    goto LABEL_71;
                  }
                }
              }
              else
              {
                v32 = v107;
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
                v79 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v118 = (uint64_t)v16;
                  v119 = 2112;
                  v120 = (uint64_t)v107;
                  v80 = "Failed to remove the old invited PCS from public PCS for zone-wide share record PCS for zone %@: %@";
                  goto LABEL_71;
                }
              }
            }
            else
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
              v79 = *MEMORY[0x1E0C952D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v118 = (uint64_t)v16;
                v119 = 2112;
                v120 = (uint64_t)v32;
                v80 = "Failed to remove the old invited PCS key from zone-wide share record PCS for zone %@: %@";
                goto LABEL_71;
              }
            }
          }
        }
LABEL_72:
        CFRelease(v57);
        v67 = cf;
        if (!cf)
          goto LABEL_74;
        goto LABEL_73;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v65 = *MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
LABEL_38:
        if (v27)
        {
LABEL_39:
          LOBYTE(isPCSSizeTooBigForKeyRoll) = 0;
          v67 = v27;
LABEL_73:
          CFRelease(v67);
LABEL_74:
          if (!v32)
          {
            if ((isPCSSizeTooBigForKeyRoll & 1) != 0)
            {
LABEL_80:
              v32 = 0;
LABEL_81:
              v61 = v32;

              goto LABEL_82;
            }
LABEL_76:
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v103 = *MEMORY[0x1E0C952D8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v118 = (uint64_t)v16;
              _os_log_impl(&dword_1BE990000, v103, OS_LOG_TYPE_INFO, "Successfully rolled keys for zone-wide share record PCS in zone %@", buf, 0xCu);
            }
            goto LABEL_80;
          }
LABEL_27:
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v64 = *MEMORY[0x1E0C952D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v118 = (uint64_t)v16;
            v119 = 2112;
            v120 = (uint64_t)v32;
            _os_log_error_impl(&dword_1BE990000, v64, OS_LOG_TYPE_ERROR, "Failed to roll keys for zone-wide share record PCS in zone %@: %@", buf, 0x16u);
          }
          goto LABEL_81;
        }
LABEL_57:
        if (!v32)
          goto LABEL_76;
        goto LABEL_27;
      }
      *(_DWORD *)buf = 138412290;
      v118 = (uint64_t)v32;
      v66 = "Couldn't decode zone-wide share record PCS data for share roll: %@";
    }
    _os_log_error_impl(&dword_1BE990000, v65, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);
    if (v27)
      goto LABEL_39;
    goto LABEL_57;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v60 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v118 = (uint64_t)v16;
    _os_log_error_impl(&dword_1BE990000, v60, OS_LOG_TYPE_ERROR, "Attempting to roll record PCS keys for zone-wide share in zone %@ but this operation is not permitted", buf, 0xCu);
  }
  v61 = 0;
LABEL_82:

  return v61;
}

- (_OpaquePCSShareProtection)createRecordPCSWithZonePCS:(_OpaquePCSShareProtection *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  dispatch_block_t *v10;
  _QWORD *v11;
  os_log_t *v12;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  __CFString *v18;
  __CFString *v19;
  const void *v20;
  __CFString *v21;
  const char *v22;
  const char *v23;
  __CFString *v24;
  const void *v25;
  _OpaquePCSShareProtection *v26;
  __CFString *v27;
  const void *v28;
  const void *v29;
  dispatch_block_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  _OpaquePCSShareProtection *v40;
  __CFString *v42;
  const __CFString *v43;
  _QWORD v44[7];
  _QWORD v45[7];
  _QWORD v46[9];
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v63;
  __int16 v64;
  _OpaquePCSShareProtection *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v7 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1BE9BAFA8;
  v52[4] = sub_1BE9BAD88;
  v53 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v10 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v11 = (_QWORD *)MEMORY[0x1E0C95300];
  v12 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 5002, CFSTR("Can't create a record PCS with a nil zone PCS"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (a6)
    {
      v19 = objc_retainAutorelease(v21);
      *a6 = v19;
    }
    goto LABEL_27;
  }
  v14 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1BEA6EC6C;
  v46[3] = &unk_1E7831760;
  v47 = a5;
  v46[4] = &v54;
  v46[5] = &v58;
  v46[6] = v52;
  v46[7] = self;
  v46[8] = a3;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v46);
  if (v59[3] || !v55[3])
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v10);
    v16 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      v26 = (_OpaquePCSShareProtection *)v59[3];
      *(_DWORD *)buf = 138412290;
      v63 = v26;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Couldn't create a new PCSShareProtectionRef: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5002, 0, v59[3], 0, 0, CFSTR("Couldn't create a new record PCS"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    v20 = (const void *)v55[3];
    if (!v20)
      goto LABEL_27;
    CFRelease(v20);
LABEL_11:
    v55[3] = 0;
    goto LABEL_27;
  }
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = sub_1BEA6EDB4;
  v45[3] = &unk_1E7831338;
  v45[4] = &v48;
  v45[5] = &v54;
  v45[6] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v15, (uint64_t)v45);
  if (!*((_BYTE *)v49 + 24))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't add zone PCS to record PCS"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (a6)
      *a6 = objc_retainAutorelease(v24);
    v25 = (const void *)v55[3];
    if (!v25)
      goto LABEL_27;
    CFRelease(v25);
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_18;
  v44[0] = v14;
  v44[1] = 3221225472;
  v44[2] = sub_1BEA6EDEC;
  v44[3] = &unk_1E7831338;
  v44[4] = &v48;
  v44[5] = &v54;
  v44[6] = a4;
  objc_msgSend__onSynchronizeQueue_(self, v22, (uint64_t)v44);
  if (*((_BYTE *)v49 + 24))
  {
LABEL_18:
    v19 = 0;
    goto LABEL_27;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't add share PCS to record PCS"));
  v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v27;
  if (a6)
    *a6 = objc_retainAutorelease(v27);
  v28 = (const void *)v55[3];
  if (v28)
  {
    CFRelease(v28);
    goto LABEL_11;
  }
LABEL_27:
  v29 = (const void *)v59[3];
  if (v29)
  {
    CFRelease(v29);
    v59[3] = 0;
  }
  v30 = *v10;
  if (v55[3])
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v30);
    v31 = *v12;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v34 = &stru_1E7838F48;
      if (v7)
        v35 = CFSTR("lightweight ");
      else
        v35 = &stru_1E7838F48;
      if (a4)
        v36 = CFSTR(" and share PCS ");
      else
        v36 = &stru_1E7838F48;
      if (a4)
      {
        objc_msgSend_description(a4, v32, v33);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v37 = v55[3];
      *(_DWORD *)buf = 138413314;
      v63 = (_OpaquePCSShareProtection *)v35;
      v64 = 2114;
      v65 = a3;
      v66 = 2114;
      v67 = v36;
      v68 = 2112;
      v69 = v34;
      v70 = 2112;
      v71 = v37;
      _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Created %@record PCS from zone PCS %{public}@%{public}@%@: %@.", buf, 0x34u);
      if (a4)

    }
  }
  else
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v30);
    v31 = *v12;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v42 = &stru_1E7838F48;
      if (a4)
        v43 = CFSTR(" and share PCS ");
      else
        v43 = &stru_1E7838F48;
      if (a4)
      {
        objc_msgSend_description(a4, v38, v39);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138413058;
      v63 = a3;
      v64 = 2114;
      v65 = (_OpaquePCSShareProtection *)v43;
      v66 = 2112;
      v67 = v42;
      v68 = 2112;
      v69 = v19;
      _os_log_error_impl(&dword_1BE990000, v31, OS_LOG_TYPE_ERROR, "Error creating record PCS from zone PCS %@%{public}@%@: %@", buf, 0x2Au);
      if (a4)

    }
  }

  v40 = (_OpaquePCSShareProtection *)v55[3];
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  return v40;
}

- (_OpaquePCSShareProtection)createRecordPCSWithEncryptedZonePCS:(__CFData *)a3 sharePCS:(_OpaquePCSShareProtection *)a4 createLite:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  dispatch_block_t *v10;
  _QWORD *v11;
  os_log_t *v12;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  __CFString *v18;
  __CFString *v19;
  const void *v20;
  __CFString *v21;
  const char *v22;
  const char *v23;
  __CFString *v24;
  const void *v25;
  const void *v26;
  __CFData *v27;
  __CFString *v28;
  const void *v29;
  const void *v30;
  dispatch_block_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  _OpaquePCSShareProtection *v41;
  __CFString *v43;
  const __CFString *v44;
  _QWORD v45[7];
  _QWORD v46[8];
  _QWORD v47[6];
  BOOL v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  __CFData *v62;
  __int16 v63;
  __CFData *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  __CFString *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v7 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v10 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
  v11 = (_QWORD *)MEMORY[0x1E0C95300];
  v12 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 5002, CFSTR("Can't create a record PCS with nil zone PCS data"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (a6)
    {
      v19 = objc_retainAutorelease(v21);
      *a6 = v19;
    }
    goto LABEL_29;
  }
  v14 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = sub_1BEA6F410;
  v47[3] = &unk_1E7831788;
  v48 = a5;
  v47[4] = &v53;
  v47[5] = &v57;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v47);
  if (v58[3] || !v54[3])
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v10);
    v16 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      v27 = (__CFData *)v58[3];
      *(_DWORD *)buf = 138412290;
      v62 = v27;
      _os_log_error_impl(&dword_1BE990000, v16, OS_LOG_TYPE_ERROR, "Couldn't create a new PCSShareProtectionRef: %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5002, 0, v58[3], 0, 0, CFSTR("Couldn't create a new record PCS"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a6)
      *a6 = objc_retainAutorelease(v18);
    v20 = (const void *)v54[3];
    if (!v20)
      goto LABEL_29;
    CFRelease(v20);
LABEL_11:
    v54[3] = 0;
    goto LABEL_29;
  }
  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = sub_1BEA6F50C;
  v46[3] = &unk_1E78317B0;
  v46[4] = &v49;
  v46[5] = &v53;
  v46[6] = &v57;
  v46[7] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v15, (uint64_t)v46);
  if (!*((_BYTE *)v50 + 24))
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5002, v58[3], CFSTR("Couldn't add encrypted zone PCS to record PCS"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (a6)
      *a6 = objc_retainAutorelease(v24);
    v25 = (const void *)v58[3];
    if (v25)
    {
      CFRelease(v25);
      v58[3] = 0;
    }
    v26 = (const void *)v54[3];
    if (!v26)
      goto LABEL_29;
    CFRelease(v26);
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_18;
  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = sub_1BEA6F554;
  v45[3] = &unk_1E7831338;
  v45[4] = &v49;
  v45[5] = &v53;
  v45[6] = a4;
  objc_msgSend__onSynchronizeQueue_(self, v22, (uint64_t)v45);
  if (*((_BYTE *)v50 + 24))
  {
LABEL_18:
    v19 = 0;
    goto LABEL_29;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't add share PCS to record PCS"));
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v28;
  if (a6)
    *a6 = objc_retainAutorelease(v28);
  v29 = (const void *)v54[3];
  if (v29)
  {
    CFRelease(v29);
    goto LABEL_11;
  }
LABEL_29:
  v30 = (const void *)v58[3];
  if (v30)
  {
    CFRelease(v30);
    v58[3] = 0;
  }
  v31 = *v10;
  if (v54[3])
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v31);
    v32 = *v12;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v35 = &stru_1E7838F48;
      if (v7)
        v36 = CFSTR("lightweight ");
      else
        v36 = &stru_1E7838F48;
      if (a4)
        v37 = CFSTR(" and share PCS ");
      else
        v37 = &stru_1E7838F48;
      if (a4)
      {
        objc_msgSend_description(a4, v33, v34);
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v38 = v54[3];
      *(_DWORD *)buf = 138413314;
      v62 = (__CFData *)v36;
      v63 = 2114;
      v64 = a3;
      v65 = 2114;
      v66 = v37;
      v67 = 2112;
      v68 = v35;
      v69 = 2112;
      v70 = v38;
      _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Created %@record PCS from zone PCS data %{public}@%{public}@%@: %@.", buf, 0x34u);
      if (a4)

    }
  }
  else
  {
    if (*v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v31);
    v32 = *v12;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v43 = &stru_1E7838F48;
      if (a4)
        v44 = CFSTR(" and share PCS ");
      else
        v44 = &stru_1E7838F48;
      if (a4)
      {
        objc_msgSend_description(a4, v39, v40);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138413058;
      v62 = a3;
      v63 = 2114;
      v64 = (__CFData *)v44;
      v65 = 2112;
      v66 = v43;
      v67 = 2112;
      v68 = v19;
      _os_log_error_impl(&dword_1BE990000, v32, OS_LOG_TYPE_ERROR, "Error creating record PCS from zone PCS %@%{public}@%@: %@.", buf, 0x2Au);
      if (a4)

    }
  }

  v41 = (_OpaquePCSShareProtection *)v54[3];
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v41;
}

- (id)dataFromRecordPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  _OpaquePCSShareProtection *v4;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BAFA8;
  v21 = sub_1BE9BAD88;
  v22 = 0;
  if (a3)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEA6F880;
    v16[3] = &unk_1E7831338;
    v16[5] = &v23;
    v16[6] = a3;
    v16[4] = &v17;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v16);
    if (v24[3] || !v18[5])
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't encode record PCS data"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (a4)
        *a4 = objc_retainAutorelease(v7);
      v9 = (void *)v18[5];
      v18[5] = 0;

      v10 = (const void *)v24[3];
      if (v10)
      {
        CFRelease(v10);
        v24[3] = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v11 = (void *)*MEMORY[0x1E0C952F8];
    if (v18[5])
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v11);
      v12 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v13 = (void *)v18[5];
        *(_DWORD *)buf = 138412546;
        v28 = v4;
        v29 = 2112;
        v30 = v13;
        _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, "Created data from record PCS %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v11);
      v14 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v4;
        v29 = 2112;
        v30 = v8;
        _os_log_error_impl(&dword_1BE990000, v14, OS_LOG_TYPE_ERROR, "Error creating PCS data from record PCS %@: %@", buf, 0x16u);
      }
    }
    v4 = (_OpaquePCSShareProtection *)(id)v18[5];

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v4;
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 trusts:(id)a7 error:(id *)a8
{
  _BOOL4 v10;
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  _OpaquePCSShareProtection *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  _OpaquePCSShareProtection *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  const char *v40;
  void *v41;
  char *v42;
  const char *v43;
  void *v44;
  CFTypeRef cf;
  _BYTE buf[24];
  _OpaquePCSShareProtection *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v10 = a6;
  v55[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v16 = a7;
  cf = 0;
  if (v14)
  {
    objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v15, a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5002, CFSTR("Can't create a PCS object without a share PCS"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31;
      if (a8)
      {
        v30 = objc_retainAutorelease(v31);
        *a8 = v30;
      }
      goto LABEL_27;
    }
    if (v16 && objc_msgSend_count(v16, v17, v18))
    {
      v54 = *MEMORY[0x1E0D829C8];
      v55[0] = v44;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v55, &v54, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      v23 = v20;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v24 = off_1EF577A18;
      v47 = (_OpaquePCSShareProtection *)off_1EF577A18;
      if (!off_1EF577A18)
      {
        v25 = sub_1BEA7D6D8((uint64_t)v20, v21, v22);
        v24 = dlsym(v25, "PCSObjectCreateFromExportedWithKeyedPCSAndOptionsWithTrusts");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v24;
        off_1EF577A18 = v24;
      }
      _Block_object_dispose(buf, 8);
      if (!v24)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v26, v27);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v40, (uint64_t)"PCSShareProtectionRef CKPCSObjectCreateFromExportedWithKeyedPCSAndOptionsWithTrusts(PCSShareProtectionRef, NSDictionary<PCSFPOption,id> *__strong, CFDataRef, NSArray *__strong, CFErrorRef *)");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = dlerror();
        objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v39, v43, (uint64_t)v41, CFSTR("CKDPCSManager.m"), 66, CFSTR("%s"), v42);

        __break(1u);
      }
      v28 = (_OpaquePCSShareProtection *)((uint64_t (*)(_OpaquePCSShareProtection *, id, id, void *, CFTypeRef *))v24)(a5, v19, v14, v23, &cf);

    }
    else
    {
      v52 = *MEMORY[0x1E0D829C8];
      v53 = v44;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)&v53, &v52, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (_OpaquePCSShareProtection *)PCSObjectCreateFromExportedWithKeyedPCSAndOptions();
    }

    if (v28 && !cf)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v47 = a5;
        _os_log_debug_impl(&dword_1BE990000, v29, OS_LOG_TYPE_DEBUG, "Created PCS object from data (%{public}@): %@. Share PCS was %@", buf, 0x20u);
      }
      v30 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v32 = (void *)objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v32, v33, (uint64_t)cf, 5004, CFSTR("Failed to decrypt PCS data"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      if (!a8)
        goto LABEL_22;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C94B20], 5002, cf, CFSTR("Couldn't create PCS object from data"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
      if (!a8)
      {
LABEL_22:
        if (!v28)
          goto LABEL_27;
        goto LABEL_26;
      }
    }
    *a8 = objc_retainAutorelease(v30);
    if (!v28)
    {
LABEL_27:
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (v10)
      {
        v35 = (_OpaquePCSShareProtection *)PCSFPCreatePEMData();
        if (a5)
          v36 = (void *)PCSShareProtectionCopyPublicKeys();
        else
          v36 = 0;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v37 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = a5;
          *(_WORD *)&buf[22] = 2112;
          v47 = v35;
          v48 = 2112;
          v49 = v36;
          v50 = 2112;
          v51 = v14;
          _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Error creating PCS object: %@.\nShare PCS was %@.\nPEM data was %@.\nShare PCS public keys were %@\nExported PCS data was %@", buf, 0x34u);
        }

      }
      v28 = 0;
      goto LABEL_39;
    }
LABEL_26:
    CFRelease(v28);
    goto LABEL_27;
  }
  v28 = 0;
LABEL_40:

  return v28;
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 logFailure:(BOOL)a6 error:(id *)a7
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1E0DE7D20](self, sel_createPCSObjectFromData_ofType_sharedToPCS_logFailure_trusts_error_, a3);
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 error:(id *)a6
{
  return (_OpaquePCSShareProtection *)objc_msgSend_createPCSObjectFromData_ofType_sharedToPCS_logFailure_error_(self, a2, (uint64_t)a3, a4, a5, 0, a6);
}

- (_OpaquePCSShareProtection)createPCSObjectFromData:(id)a3 ofType:(unint64_t)a4 sharedToPCS:(_OpaquePCSShareProtection *)a5 trusts:(id)a6 error:(id *)a7
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1E0DE7D20](self, sel_createPCSObjectFromData_ofType_sharedToPCS_logFailure_trusts_error_, a3);
}

- (BOOL)recordProtectionDataNeedsCounterSign:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  BOOL result;
  void *v19;
  const char *v20;
  void *v21;
  char *v22;
  const char *v23;
  CFTypeRef cf;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;

  v5 = a3;
  v8 = v5;
  cf = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v9 = off_1EF577A20;
  v28 = off_1EF577A20;
  if (!off_1EF577A20)
  {
    v10 = sub_1BEA7D6D8((uint64_t)v5, v6, v7);
    v9 = dlsym(v10, "PCSNeedsRollAndCounterSign");
    v26[3] = (uint64_t)v9;
    off_1EF577A20 = v9;
  }
  _Block_object_dispose(&v25, 8);
  if (v9)
  {
    v13 = ((uint64_t (*)(void *, CFTypeRef *))v9)(v8, &cf);
    if (cf)
    {
      v14 = (void *)objc_opt_class();
      objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v14, v15, (uint64_t)cf, 5004, CFSTR("Failed to decrypt PCS data when checking if counter-signature is necessary"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 5002, cf, CFSTR("Couldn't create PCS object from data when checking if counter-signature is necessary"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);
      CFRelease(cf);

    }
    return v13;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v20, (uint64_t)"_Bool CKPCSNeedsRollAndCounterSign(CFDataRef, CFErrorRef *)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v19, v23, (uint64_t)v21, CFSTR("CKDPCSManager.m"), 67, CFSTR("%s"), v22);

    __break(1u);
  }
  return result;
}

- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5 error:(id *)a6
{
  void **v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  os_log_t *v12;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  const void *v20;
  const char *v21;
  const void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  _OpaquePCSShareProtection *v26;
  NSObject *v27;
  const char *v28;
  _OpaquePCSShareProtection *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  BOOL v34;
  NSObject *v35;
  _QWORD v37[8];
  _BYTE buf[24];
  _OpaquePCSShareProtection *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v27, OS_LOG_TYPE_INFO, "Refusing to add a nil share PCS to a record PCS", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 5005, CFSTR("You can't add a nil share PCS to a record PCS"));
      v29 = (_OpaquePCSShareProtection *)(id)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v23 = 0;
      v26 = 0;
LABEL_37:
      v34 = 0;
      *a6 = v29;
      goto LABEL_44;
    }
LABEL_24:
    v23 = 0;
    v26 = 0;
    goto LABEL_38;
  }
  v8 = (void **)MEMORY[0x1E0C952F8];
  v9 = (void *)*MEMORY[0x1E0C952F8];
  v10 = (_QWORD *)MEMORY[0x1E0C95300];
  v11 = *MEMORY[0x1E0C95300];
  v12 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!a4)
  {
    if (v11 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v9);
    v30 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v30, OS_LOG_TYPE_INFO, "Refusing to add a share PCS to a nil record PCS", buf, 2u);
    }
    if (a6)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 5005, CFSTR("You can't add a share PCS to a nil record PCS"));
      v29 = (_OpaquePCSShareProtection *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v11 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v9);
  v16 = *v12;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    CKStringFromSharePermission(a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2112;
    v39 = a4;
    _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "Adding %{public}@ share PCS\n%@\nTo PCS\n%@", buf, 0x20u);

  }
  v20 = (const void *)PCSFPCopyCurrentPrivateKey();
  if (v20)
  {
    v22 = (const void *)PCSIdentityCopyPublicIdentity();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v39) = 0;
    if (v22)
    {
      PCSPublicIdentityGetPublicID();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = sub_1BEA704A0;
      v37[3] = &unk_1E78317D8;
      v37[4] = buf;
      v37[5] = a4;
      v37[6] = v22;
      v37[7] = a5;
      objc_msgSend__onSynchronizeQueue_(self, v24, (uint64_t)v37);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        v26 = 0;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v25, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't add share PCS to record PCS"));
        v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      }
      CFRelease(v22);
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v21, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't get a public identity from the share PCS"));
      v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
    }
    CFRelease(v20);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 5002, CFSTR("Couldn't get a private identity from the share PCS"));
    v26 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
  }
  v32 = *v8;
  if (v26)
  {
    if (*v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v32);
    v33 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = a4;
      *(_WORD *)&buf[22] = 2112;
      v39 = v26;
      _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Warn: Unable to add share PCS (%@) to record PCS (%@): %@", buf, 0x20u);
    }
    if (a6)
    {
      v29 = objc_retainAutorelease(v26);
      v26 = v29;
      goto LABEL_37;
    }
LABEL_38:
    v34 = 0;
    goto LABEL_44;
  }
  if (*v10 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v32);
  v35 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v39 = a4;
    _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Added share PCS %@ (%@) to record PCS %@.", buf, 0x20u);
  }
  v26 = 0;
  v34 = 1;
LABEL_44:

  return v34;
}

- (BOOL)addSharePCS:(_OpaquePCSShareProtection *)a3 toRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  return objc_msgSend_addSharePCS_toRecordPCS_permission_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (BOOL)updateSigningIdentityOnPCS:(_OpaquePCSShareProtection *)a3 usingSignedPCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[6];

  v6 = PCSFPGetAuthorshipIdentity();
  v8 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1BEA70568;
    v10[3] = &unk_1E78317F8;
    v10[4] = a3;
    v10[5] = v6;
    objc_msgSend__onSynchronizeQueue_(self, v7, (uint64_t)v10);
  }
  return v8 != 0;
}

- (BOOL)removeSharePCS:(_OpaquePCSShareProtection *)a3 fromRecordPCS:(_OpaquePCSShareProtection *)a4 error:(id *)a5
{
  _QWORD *v6;
  void **v8;
  void *v9;
  uint64_t v10;
  os_log_t *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  BOOL v23;
  const void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v29[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t v34[4];
  _OpaquePCSShareProtection *v35;
  __int16 v36;
  _OpaquePCSShareProtection *v37;
  __int16 v38;
  void *v39;
  _BYTE buf[24];
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = (_QWORD *)MEMORY[0x1E0C95300];
  if (!a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Refusing to remove a nil share PCS from a record PCS", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, *MEMORY[0x1E0C94B20], 5005, CFSTR("You can't remove a nil share PCS from a record PCS"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
      v23 = 0;
      *a5 = v20;
      return v23;
    }
    return 0;
  }
  v8 = (void **)MEMORY[0x1E0C952F8];
  v9 = (void *)*MEMORY[0x1E0C952F8];
  v10 = *MEMORY[0x1E0C95300];
  if (!a4)
  {
    if (v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v9);
    v21 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Refusing to remove a share PCS from a nil record PCS", buf, 2u);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5005, CFSTR("You can't remove a share PCS from a nil record PCS"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    return 0;
  }
  if (v10 != -1)
    dispatch_once(MEMORY[0x1E0C95300], v9);
  v13 = (os_log_t *)MEMORY[0x1E0C952D8];
  v14 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = a4;
    _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Removing share PCS\n%@\nFrom PCS\n%@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v41 = 1;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BEA709E8;
  v29[3] = &unk_1E7831670;
  v29[6] = a4;
  v29[7] = a3;
  v29[4] = buf;
  v29[5] = &v30;
  objc_msgSend__onSynchronizeQueue_(self, v15, (uint64_t)v29);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 5002, v31[3], CFSTR("Couldn't remove share PCS from record PCS"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (const void *)v31[3];
  if (v24)
  {
    CFRelease(v24);
    v31[3] = 0;
  }
  v23 = v17 == 0;
  v25 = *v8;
  if (v17)
  {
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v25);
    v26 = *v13;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v34 = 138412802;
      v35 = a3;
      v36 = 2112;
      v37 = a4;
      v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Warn: Unable to remove share PCS (%@) from record PCS (%@): %@", v34, 0x20u);
    }
    if (a5)
      *a5 = objc_retainAutorelease(v17);
  }
  else
  {
    if (*v6 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v25);
    v27 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v34 = 138412546;
      v35 = a3;
      v36 = 2112;
      v37 = a4;
      _os_log_debug_impl(&dword_1BE990000, v27, OS_LOG_TYPE_DEBUG, "Removed share PCS %@ from record PCS %@.", v34, 0x16u);
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v23;
}

- (unint64_t)removePCSKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4 withProtectionEtag:(id)a5 forOperation:(id)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  void *v17;
  const char *v18;
  char isEqualToString;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  dispatch_once_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v78;
  _QWORD v79[5];
  _QWORD v80[11];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint8_t buf[4];
  _BYTE v116[18];
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v12 = a6;
  v78 = v9;
  if (v8 && (objc_msgSend_isEmpty(v8, v10, v11) & 1) == 0)
  {
    v75 = v12;
    if (v9
      && (objc_msgSend_etag(v8, v13, v14),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          isEqualToString = objc_msgSend_isEqualToString_(v9, v18, (uint64_t)v17),
          v17,
          (isEqualToString & 1) == 0))
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v68 = (void *)*MEMORY[0x1E0C952D8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        goto LABEL_3;
      v69 = v68;
      objc_msgSend_etag(v8, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v116 = v9;
      *(_WORD *)&v116[8] = 2112;
      *(_QWORD *)&v116[10] = v72;
      _os_log_impl(&dword_1BE990000, v69, OS_LOG_TYPE_INFO, "Skipping PCS key removal due to PCS etag mismatch. current: %@, expected: %@", buf, 0x16u);

      v15 = 0;
    }
    else
    {
      if (!a4)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v73 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Warn: Cannot remove keys from PCS, it has not yet been decrypted.", buf, 2u);
        }
        goto LABEL_3;
      }
      v20 = objc_msgSend_sizeOfPCS_(self, v13, (uint64_t)a4);
      v111 = 0;
      v112 = &v111;
      v113 = 0x2020000000;
      v114 = 0;
      v107 = 0;
      v108 = &v107;
      v109 = 0x2020000000;
      v110 = 0;
      v103 = 0;
      v104 = &v103;
      v105 = 0x2020000000;
      v106 = 0;
      v97 = 0;
      v98 = &v97;
      v99 = 0x3032000000;
      v100 = sub_1BE9BAFA8;
      v101 = sub_1BE9BAD88;
      v102 = (id)objc_opt_new();
      v91 = 0;
      v92 = &v91;
      v93 = 0x3032000000;
      v94 = sub_1BE9BAFA8;
      v95 = sub_1BE9BAD88;
      v74 = v20;
      v96 = (id)objc_opt_new();
      v85 = 0;
      v86 = &v85;
      v87 = 0x3032000000;
      v88 = sub_1BE9BAFA8;
      v89 = sub_1BE9BAD88;
      v90 = (id)objc_opt_new();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      objc_msgSend_keys(v8, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v81, v123, 16);
      if (v27)
      {
        v28 = (dispatch_once_t *)MEMORY[0x1E0C95300];
        v29 = *(_QWORD *)v82;
        v30 = (id *)MEMORY[0x1E0C952D8];
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v82 != v29)
              objc_enumerationMutation(v23);
            v32 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v31);
            v33 = objc_msgSend_keyType(v32, v25, v26, v74);
            switch(v33)
            {
              case 1:
                v41 = (void *)v98[5];
                objc_msgSend_pcsKeyID(v32, v34, v35);
                v37 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v41, v42, (uint64_t)v37);
                break;
              case 2:
                v39 = (void *)v92[5];
                objc_msgSend_pcsKeyID(v32, v34, v35);
                v37 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v39, v40, (uint64_t)v37);
                break;
              case 3:
                v36 = (void *)v86[5];
                objc_msgSend_pcsKeyID(v32, v34, v35);
                v37 = objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v36, v38, (uint64_t)v37);
                break;
              default:
                if (*v28 != -1)
                  dispatch_once(v28, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v37 = *v30;
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v45 = objc_msgSend_keyType(v32, v43, v44);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v116 = v45;
                  *(_WORD *)&v116[4] = 2112;
                  *(_QWORD *)&v116[6] = v32;
                  _os_log_debug_impl(&dword_1BE990000, v37, OS_LOG_TYPE_DEBUG, "Unrecognized key type (%d), ignoring %@", buf, 0x12u);
                }
                break;
            }

            ++v31;
          }
          while (v27 != v31);
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v81, v123, 16);
        }
        while (v27);
      }

      v46 = MEMORY[0x1E0C809B0];
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = sub_1BEA71234;
      v80[3] = &unk_1E7831848;
      v80[4] = &v97;
      v80[5] = &v107;
      v80[6] = &v91;
      v80[7] = &v111;
      v80[8] = &v85;
      v80[9] = &v103;
      v80[10] = a4;
      objc_msgSend__onSynchronizeQueue_(self, v47, (uint64_t)v80);
      v15 = v108[3] + v112[3] + v104[3];
      if (v15)
      {
        v50 = objc_msgSend_sizeOfPCS_(self, v48, (uint64_t)a4);
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v51 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          v52 = v104[3];
          v53 = v112[3];
          v54 = v108[3];
          *(_DWORD *)buf = 134219008;
          *(_QWORD *)v116 = v52;
          *(_WORD *)&v116[8] = 2048;
          *(_QWORD *)&v116[10] = v53;
          v117 = 2048;
          v118 = v54;
          v119 = 2048;
          v120 = v74;
          v121 = 2048;
          v122 = v50;
          _os_log_impl(&dword_1BE990000, v51, OS_LOG_TYPE_INFO, "Removed %zu sharee public identities, %zu unused key pairs and %zu unused primary keys from the PCS, reducing the size from %zu to %zu bytes.", buf, 0x34u);
        }
      }
      objc_msgSend_keys(v8, v48, v49, v74);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_count(v55, v56, v57);

      if (v58 != v15)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v59 = v58 - v15;
        v60 = (id)*MEMORY[0x1E0C952D8];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_keys(v8, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend_count(v63, v64, v65);
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v116 = v59;
          *(_WORD *)&v116[8] = 2048;
          *(_QWORD *)&v116[10] = v66;
          _os_log_impl(&dword_1BE990000, v60, OS_LOG_TYPE_INFO, "Warn: %zu of the %zu keys to remove were not removed from the PCS.", buf, 0x16u);

        }
        v79[0] = v46;
        v79[1] = 3221225472;
        v79[2] = sub_1BEA71E84;
        v79[3] = &unk_1E7831868;
        v79[4] = v59;
        objc_msgSend_updateCloudKitMetrics_(v75, v67, (uint64_t)v79);
      }
      _Block_object_dispose(&v85, 8);

      _Block_object_dispose(&v91, 8);
      _Block_object_dispose(&v97, 8);

      _Block_object_dispose(&v103, 8);
      _Block_object_dispose(&v107, 8);
      _Block_object_dispose(&v111, 8);
    }
    v12 = v75;
    goto LABEL_4;
  }
LABEL_3:
  v15 = 0;
LABEL_4:

  return v15;
}

- (_OpaquePCSShareProtection)createEmptySignedSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 withError:(id *)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const void *v18;
  id v19;
  _QWORD *v20;
  os_log_t *v21;
  uint64_t v22;
  const char *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _OpaquePCSShareProtection *v29;
  const void *v30;
  const char *v31;
  _QWORD *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  _OpaquePCSShareProtection *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v44;
  id v45;
  CFTypeRef cf;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  cf = 0;
  objc_msgSend_identityManager(self, a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_PCSServiceStringFromCKServiceType_(v9, v10, a4);

  objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v12, a3);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_identityManager(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v18 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v16, v17, a4, 1, &v45);
  v19 = v45;

  v20 = (_QWORD *)MEMORY[0x1E0C95300];
  v21 = (os_log_t *)MEMORY[0x1E0C952D8];
  v44 = (void *)v13;
  if (v19 || !v18)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v33 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v19;
      _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Failed to get signing identity set in createEmptySignedSharePCSForServiceType:withError: %@", buf, 0xCu);
    }
    v32 = v20;
    if (!v19)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v34, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't create a PCS identity"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = 0;
    v29 = 0;
    v35 = 0;
    v36 = 0;
    v24 = v18;
    if (v18)
      goto LABEL_27;
  }
  else
  {
    v22 = PCSIdentitySetCopyCurrentIdentityWithError();
    v24 = (const void *)v22;
    if (v22 && !cf)
    {
      v25 = *MEMORY[0x1E0D829C0];
      v47[0] = *MEMORY[0x1E0D829E8];
      v47[1] = v25;
      v48[0] = v11;
      v48[1] = v22;
      v47[2] = *MEMORY[0x1E0D829C8];
      v48[2] = v13;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v48, v47, 3);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = PCSFPCreate();
      v29 = (_OpaquePCSShareProtection *)v27;
      if (cf || !v27)
      {
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v28, *MEMORY[0x1E0C94B20], 5002);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v37;
        if (a5)
          *a5 = objc_retainAutorelease(v37);
        if (v29)
        {
          v32 = v20;
          CFRelease(v29);
          v29 = 0;
          goto LABEL_26;
        }
      }
      else
      {
        v30 = (const void *)PCSFPCreatePrivateKey();
        if (v30)
        {
          v32 = v20;
          CFRelease(v30);
          v19 = 0;
LABEL_26:
          CFRelease(v18);
          goto LABEL_27;
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v31, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add a protection key to the share"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v38;
        if (a5)
        {
          v32 = v20;
          v19 = objc_retainAutorelease(v38);
          *a5 = v19;
          goto LABEL_26;
        }
      }
      v32 = v20;
      goto LABEL_26;
    }
    v32 = v20;
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 5000, cf);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    CFRelease(v18);
    v26 = 0;
    v29 = 0;
    v35 = 0;
    v36 = 0;
    if (v24)
    {
LABEL_27:
      CFRelease(v24);
      v35 = (void *)v26;
      v36 = v29;
    }
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (!v36 || v19)
  {
    if (*v32 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v40 = v44;
    v42 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v19;
      _os_log_impl(&dword_1BE990000, v42, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
    if (a5)
      *a5 = objc_retainAutorelease(v19);
    if (v36)
    {
      CFRelease(v36);
      v36 = 0;
    }
  }
  else
  {
    v39 = (void *)PCSFPCopyDiagnostic();
    if (*v32 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v40 = v44;
    v41 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v39;
      _os_log_impl(&dword_1BE990000, v41, OS_LOG_TYPE_INFO, "Created a new signed share PCS: %@", buf, 0xCu);
    }

    v19 = 0;
  }

  return v36;
}

- (_OpaquePCSShareProtection)createEmptySharePCSOfType:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  void *v7;
  _OpaquePCSShareProtection *v8;
  const char *v9;
  const void *v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0D829C8];
  v23[0] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v23, &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_OpaquePCSShareProtection *)PCSFPCreate();

  if (v8)
  {
    v10 = (const void *)PCSFPCreatePrivateKey();
    if (v10)
    {
      CFRelease(v10);
      v12 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add a protection key to the share"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;
      if (a4)
      {
        v12 = objc_retainAutorelease(v14);
        *a4 = v12;
      }
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't create a new PCSShareProtectionRef"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }
  if (v8)
    v15 = v12 == 0;
  else
    v15 = 0;
  if (v15)
  {
    v17 = (void *)PCSFPCopyDiagnostic();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v18 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Created a new share PCS: %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    if (v8)
    {
      CFRelease(v8);
      v8 = 0;
    }
  }

  return v8;
}

- (void)setOwnerIdentity:(_PCSPublicIdentityData *)a3 onPCS:(_OpaquePCSShareProtection *)a4
{
  NSObject *v7;
  const char *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  _PCSPublicIdentityData *v11;
  __int16 v12;
  _OpaquePCSShareProtection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v11 = a3;
    v12 = 2112;
    v13 = a4;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "Setting owner public identity %@ on pcs %@", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA727A8;
  v9[3] = &unk_1E78317F8;
  v9[4] = a4;
  v9[5] = a3;
  objc_msgSend__onSynchronizeQueue_(self, v8, (uint64_t)v9);
}

- (BOOL)_addPublicIdentityForService:(unint64_t)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 withError:(id *)a5
{
  void *v9;
  const char *v10;
  const void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  NSObject *v24;
  _QWORD v26[7];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  CFTypeRef v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend_identityManager(self, a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v11 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v9, v10, a3, 1, &v27);
  v12 = v27;

  if (!v11 || v12)
  {
    if (!v11)
      goto LABEL_20;
    v17 = 0;
  }
  else
  {
    objc_msgSend_identityManager(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_PCSServiceStringFromCKServiceType_(v15, v16, a3);
    v17 = (const void *)PCSIdentitySetCopyCurrentPublicIdentityWithError();

    if (!v17 || v32)
    {
      v20 = *MEMORY[0x1E0C94B20];
      if (a3 - 1 > 5)
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v18, v20, 5002, v32, CFSTR("Couldn't get a public identity for our current user in order to add our public %@ identity to PCS %@"), CFSTR("Current Service"), a4);
      else
        objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v18, v20, 5002, v32, CFSTR("Couldn't get a public identity for our current user in order to add our public %@ identity to PCS %@"), off_1E7831C48[a3 - 1], a4);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        CFRelease(v32);
        v32 = 0;
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1BEA72AFC;
      v26[3] = &unk_1E78312C0;
      v26[4] = &v28;
      v26[5] = a4;
      v26[6] = v17;
      objc_msgSend__onSynchronizeQueue_(self, v18, (uint64_t)v26);
      if (*((_BYTE *)v29 + 24))
      {
        v12 = 0;
      }
      else
      {
        v21 = *MEMORY[0x1E0C94B20];
        if (a3 - 1 > 5)
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, v21, 5005, CFSTR("Failed to add our %@ identity to the share"), CFSTR("Current Service"));
        else
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v19, v21, 5005, CFSTR("Failed to add our %@ identity to the share"), off_1E7831C48[a3 - 1]);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  CFRelease(v11);
  if (v17)
    CFRelease(v17);
LABEL_20:
  if (v12)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      if (a3 - 1 > 5)
        v23 = CFSTR("Current Service");
      else
        v23 = off_1E7831C48[a3 - 1];
      *(_DWORD *)buf = 138543618;
      v34 = v23;
      v35 = 2112;
      v36 = v12;
      v24 = v22;
      _os_log_impl(&dword_1BE990000, v24, OS_LOG_TYPE_INFO, "Warn: Error adding public %{public}@ identity to share PCS: %@", buf, 0x16u);

    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v28, 8);

  return v12 == 0;
}

- (_OpaquePCSShareProtection)createSharePCSOfType:(unint64_t)a3 forPCSServiceType:(unint64_t)a4 error:(id *)a5
{
  _OpaquePCSShareProtection *v8;
  id v9;
  const char *v10;
  void *v11;
  _QWORD *v12;
  os_log_t *v13;
  int v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  char v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v8 = (_OpaquePCSShareProtection *)objc_msgSend_createEmptySharePCSOfType_error_(self, a2, a3, &v25);
  v9 = v25;
  v11 = v9;
  v12 = (_QWORD *)MEMORY[0x1E0C95300];
  v13 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!v8 || v9)
  {
    if (!v9)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create an empty share PCS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v8)
    {
      CFRelease(v8);
      v8 = 0;
    }
  }
  else
  {
    v24 = 0;
    v14 = objc_msgSend__addPublicIdentityForService_toSharePCS_withError_(self, v10, a4, v8, &v24);
    v15 = v24;
    v17 = (uint64_t)v15;
    if (!v14 || (v11 = 0, v15))
    {
      if (!v15)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v16, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't add public PCS identity to new share PCS"));
        v17 = objc_claimAutoreleasedReturnValue();
      }
      if (*v12 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v18 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Warn: Error adding public sharing identity to share PCS: %@", buf, 0xCu);
      }
      v11 = (void *)v17;
    }
    if (v11)
      v19 = 0;
    else
      v19 = v14;
    if ((v19 & 1) != 0)
    {
      v20 = (void *)PCSFPCopyDiagnostic();
      if (*v12 != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v21 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (uint64_t)v20;
        _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Created a new share PCS: %@", buf, 0xCu);
      }

      v11 = 0;
      goto LABEL_33;
    }
  }
  if (*v12 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v22 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = (uint64_t)v11;
    _os_log_impl(&dword_1BE990000, v22, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v11);
  if (v8)
  {
    CFRelease(v8);
    v8 = 0;
  }
LABEL_33:

  return v8;
}

- (_OpaquePCSShareProtection)createSharePublicPCSWithIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  void *v7;
  _OpaquePCSShareProtection *v8;
  const char *v9;
  const char *v10;
  const void *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const void *v20;
  NSObject *v21;
  _QWORD v23[7];
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v35 = *MEMORY[0x1E0D829C8];
  v36[0] = *MEMORY[0x1E0D829D8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v36, &v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_OpaquePCSShareProtection *)PCSFPCreate();

  if (v30[3] || !v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't create a new PCSShareProtectionRef"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    if (!v8)
      goto LABEL_14;
    goto LABEL_13;
  }
  v11 = (const void *)PCSIdentityCopyPublicIdentity();
  if (!v11)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5000, CFSTR("Couldn't get a public identity'"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);
LABEL_13:
    CFRelease(v8);
    v8 = 0;
LABEL_14:
    v11 = 0;
    goto LABEL_22;
  }
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_1BEA7320C;
  v24[3] = &unk_1E7831670;
  v24[6] = v8;
  v24[7] = a3;
  v24[4] = &v25;
  v24[5] = &v29;
  objc_msgSend__onSynchronizeQueue_(self, v10, (uint64_t)v24);
  if (*((_BYTE *)v26 + 24))
  {
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = sub_1BEA73248;
    v23[3] = &unk_1E78312C0;
    v23[4] = &v25;
    v23[5] = v8;
    v23[6] = v11;
    objc_msgSend__onSynchronizeQueue_(self, v13, (uint64_t)v23);
    if (*((_BYTE *)v26 + 24))
    {
      v15 = 0;
      goto LABEL_22;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add public identity to the share PCS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    CFRelease(v8);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 5005, CFSTR("Failed to add identity to the share PCS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
    CFRelease(v8);
  }
  v8 = 0;
LABEL_22:
  v20 = (const void *)v30[3];
  if (v20)
  {
    CFRelease(v20);
    v30[3] = 0;
  }
  if (v11)
    CFRelease(v11);
  if (!v8)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Warn: Error creating a share PCS: %@", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v8;
}

- (_OpaquePCSShareProtection)createChainPCSWithError:(id *)a3
{
  uint64_t RandomCompactRaw;
  const char *v5;
  const void *v6;
  uint64_t ServiceName;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  _OpaquePCSShareProtection *v12;
  _OpaquePCSShareProtection *v13;
  _OpaquePCSShareProtection *v14;
  _OpaquePCSShareProtection *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  RandomCompactRaw = PCSIdentityCreateRandomCompactRaw();
  if (RandomCompactRaw)
  {
    v6 = (const void *)RandomCompactRaw;
    ServiceName = PCSIdentityGetServiceName();
    v8 = *MEMORY[0x1E0D829C0];
    v22[0] = *MEMORY[0x1E0D829E8];
    v22[1] = v8;
    v23[0] = ServiceName;
    v23[1] = v6;
    v22[2] = *MEMORY[0x1E0D829C8];
    v23[2] = *MEMORY[0x1E0D829D8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v9, (uint64_t)v23, v22, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (_OpaquePCSShareProtection *)PCSFPCreate();
    if (v12)
    {
      PCSFPSetCurrentPrivateKey();
      v15 = 0;
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5002, 0, CFSTR("Couldn't create a new PCSShareProtectionRef"));
      v14 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      if (v12)
      {
        CFRelease(v12);
        v12 = 0;
      }
    }
    CFRelease(v6);
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v5, *MEMORY[0x1E0C94B20], 5000, 0, 0, 0, 0, CFSTR("Failed to add a protection key to the chain PCS"));
    v13 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    if (a3)
    {
      v15 = objc_retainAutorelease(v13);
      v12 = 0;
      v10 = 0;
      *a3 = v15;
    }
    else
    {
      v12 = 0;
      v10 = 0;
    }
  }
  v16 = (void *)*MEMORY[0x1E0C952F8];
  if (v12)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v16);
    v17 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_debug_impl(&dword_1BE990000, v17, OS_LOG_TYPE_DEBUG, "Created new chain PCS: %@", buf, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v16);
    v18 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Error creating new chain PCS: %@", buf, 0xCu);
    }
  }

  return v12;
}

- (id)dataFromSharePCS:(_OpaquePCSShareProtection *)a3 pcsBlobType:(unint64_t)a4 error:(id *)a5
{
  _OpaquePCSShareProtection *v5;
  const char *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v5 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1BE9BAFA8;
  v27 = sub_1BE9BAD88;
  v28 = 0;
  if (a3)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1BEA73918;
    v22[3] = &unk_1E7831338;
    v22[5] = &v29;
    v22[6] = a3;
    v22[4] = &v23;
    objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v22);
    v9 = v30[3];
    if (v9 || !v24[5])
    {
      if (a4 - 1 > 5)
        v10 = CFSTR("Unknown");
      else
        v10 = off_1E7831C18[a4 - 1];
      v11 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Couldn't encode share PCS data %@, PCS type %@, error: %@"), v5, v10, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(v11, v13, *MEMORY[0x1E0C94B20], 5002, 0, v9, 0, 0, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (a5)
        *a5 = objc_retainAutorelease(v14);
      v15 = (void *)v24[5];
      v24[5] = 0;

      v16 = (const void *)v30[3];
      if (v16)
      {
        CFRelease(v16);
        v30[3] = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    v17 = (void *)*MEMORY[0x1E0C952F8];
    if (v24[5])
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v17);
      v18 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        v19 = (void *)v24[5];
        *(_DWORD *)buf = 138412546;
        v34 = v5;
        v35 = 2112;
        v36 = v19;
        _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Created data from share PCS %@: %@", buf, 0x16u);
      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v17);
      v20 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v5;
        v35 = 2112;
        v36 = v14;
        _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "Error creating PCS data from share PCS %@: %@", buf, 0x16u);
      }
    }
    v5 = (_OpaquePCSShareProtection *)(id)v24[5];

  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v5;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 logFailure:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _PCSIdentityData *v10;
  const char *v11;
  _PCSIdentityData *v12;
  NSObject *v13;
  _PCSIdentityData *v14;
  void *v15;
  const char *v16;
  const char *v17;
  _PCSIdentityData *v18;
  _OpaquePCSShareProtection *v19;
  _PCSIdentityData *v20;
  const void *v21;
  id v22;
  const void *v23;
  NSObject *v24;
  _PCSIdentityData *v25;
  _PCSIdentityData *v26;
  NSObject *v27;
  _QWORD v29[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  _PCSIdentityData *v39;
  __int16 v40;
  _PCSIdentityData *v41;
  __int16 v42;
  _PCSIdentityData *v43;
  __int16 v44;
  _PCSIdentityData *v45;
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = (_PCSIdentityData *)a3;
  v12 = v10;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (!v10)
  {
    v19 = 0;
    goto LABEL_35;
  }
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5002, CFSTR("Can't create a share PCS without a sharing identity"));
    v20 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    if (a6)
    {
      v18 = objc_retainAutorelease(v20);
      *a6 = v18;
    }
    goto LABEL_21;
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BEA73DD8;
  v29[3] = &unk_1E7831890;
  v29[6] = v10;
  v29[7] = a4;
  v29[4] = &v30;
  v29[5] = &v34;
  objc_msgSend__onSynchronizeQueue_(self, v11, (uint64_t)v29);
  if (v35[3] || !v31[3])
  {
    if (v7)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v13 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v14 = (_PCSIdentityData *)v35[3];
        *(_DWORD *)buf = 138412546;
        v39 = a4;
        v40 = 2112;
        v41 = v14;
        _os_log_impl(&dword_1BE990000, v13, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data with share identity %@: %@", buf, 0x16u);
      }
    }
    v15 = (void *)objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v15, v16, v35[3], 5004, CFSTR("Failed to decrypt share PCS data"));
    v18 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!a6)
      {
LABEL_19:
        v21 = (const void *)v31[3];
        if (v21)
        {
          CFRelease(v21);
          v31[3] = 0;
        }
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5004, 0, v35[3], 0, 0, CFSTR("Couldn't create share PCS object from data"));
      v18 = (_PCSIdentityData *)objc_claimAutoreleasedReturnValue();
      if (!a6)
        goto LABEL_19;
    }
    *a6 = objc_retainAutorelease(v18);
    goto LABEL_19;
  }
  v18 = 0;
LABEL_21:
  v22 = (id)objc_opt_self();
  v23 = (const void *)v35[3];
  if (v23)
  {
    CFRelease(v23);
    v35[3] = 0;
  }
  if (v31[3])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      v25 = (_PCSIdentityData *)v31[3];
      *(_DWORD *)buf = 138412802;
      v39 = v12;
      v40 = 2112;
      v41 = v25;
      v42 = 2112;
      v43 = a4;
      _os_log_debug_impl(&dword_1BE990000, v24, OS_LOG_TYPE_DEBUG, "Created share PCS from data (%@): %@. Identity PCS was %@", buf, 0x20u);
    }
  }
  else if (v7)
  {
    v26 = (_PCSIdentityData *)PCSFPCreatePEMData();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v39 = v18;
      v40 = 2112;
      v41 = a4;
      v42 = 2112;
      v43 = v26;
      v44 = 2112;
      v45 = v12;
      _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "Error creating share PCS: %@.\nIdentity PCS was %@.\nPEM data was %@.\nRecord data was %@", buf, 0x2Au);
    }

  }
  v19 = (_OpaquePCSShareProtection *)v31[3];

LABEL_35:
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharingIdentity:(_PCSIdentityData *)a4 error:(id *)a5
{
  return (_OpaquePCSShareProtection *)MEMORY[0x1E0DE7D20](self, sel_createSharePCSFromData_sharingIdentity_logFailure_error_, a3);
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 logFailure:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  const void *v19;
  id v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  const void *v25;
  NSObject *v26;
  _OpaquePCSShareProtection *v27;
  NSObject *v28;
  const void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  const void *v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v8 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  objc_msgSend__pcsObjectKindForCKDPCSBlobType_(self, v13, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v20 = 0;
LABEL_18:
    v27 = 0;
    goto LABEL_31;
  }
  objc_msgSend_identityManager(self, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v19 = (const void *)objc_msgSend_copyIdentitySetWithType_options_error_(v17, v18, a5, 2, &v37);
  v20 = v37;

  if (!v19 || v20)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v20);
    if (v8)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v20;
        _os_log_impl(&dword_1BE990000, v26, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data due to identity set unavailable. Error: %@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1BEA74210;
  v31[3] = &unk_1E78318B8;
  v34 = &v38;
  v36 = v19;
  v32 = v16;
  v33 = v12;
  v35 = &v42;
  objc_msgSend__onSynchronizeQueue_(self, v21, (uint64_t)v31);
  if (v39[3] && !v43[3])
  {
    v20 = 0;
  }
  else
  {
    v22 = (void *)objc_opt_class();
    objc_msgSend_noMatchingIdentityErrorForPCSError_withErrorCode_description_(v22, v23, v43[3], 5004, CFSTR("Failed to decrypt share PCS object"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E0C94FF8], v24, *MEMORY[0x1E0C94B20], 5004, 0, v43[3], 0, 0, CFSTR("Couldn't create share PCS object from data"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = (const void *)v43[3];
    if (v25)
    {
      CFRelease(v25);
      v43[3] = 0;
    }
  }
  if (!v39[3])
  {
    if (a7)
      *a7 = objc_retainAutorelease(v20);
    if (v8)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v28 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v47 = (id)v19;
        v48 = 2112;
        v49 = v20;
        _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, "Couldn't decrypt share PCS data with share identities %@: %@", buf, 0x16u);
      }
    }
  }
  CFRelease(v19);
  v29 = (const void *)v43[3];
  if (v29)
  {
    CFRelease(v29);
    v43[3] = 0;
  }
  v27 = (_OpaquePCSShareProtection *)v39[3];

LABEL_31:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v27;
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 ofType:(unint64_t)a4 withService:(unint64_t)a5 error:(id *)a6
{
  return (_OpaquePCSShareProtection *)objc_msgSend_createSharePCSFromData_ofType_withService_logFailure_error_(self, a2, (uint64_t)a3, a4, a5, 1, a6);
}

- (_OpaquePCSShareProtection)createSharePCSFromData:(id)a3 sharePrivateKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _OpaquePCSShareProtection *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const void *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = 0;
  v10 = 0;
  if (!v8 || !a4)
    goto LABEL_21;
  v11 = a4;
  objc_msgSend_identityManager(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v16 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v14, v15, (uint64_t)v11, &v25);

  v9 = v25;
  if (!v16 || v9)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_error_impl(&dword_1BE990000, v21, OS_LOG_TYPE_ERROR, "Couldn't create an identity from private key data: %@", buf, 0xCu);
      if (v9)
      {
LABEL_17:
        v10 = 0;
        if (!v16)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    else if (v9)
    {
      goto LABEL_17;
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create an identity from private key data"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v24 = 0;
  v10 = (_OpaquePCSShareProtection *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v17, (uint64_t)v8, v16, &v24);
  v18 = v24;
  v9 = v18;
  if (v10 && !v18)
    goto LABEL_18;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v19 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v27 = v8;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v9;
    _os_log_error_impl(&dword_1BE990000, v19, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %@ for identity %@: %@", buf, 0x20u);
    if (v9)
      goto LABEL_18;
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create a public PCS from the PCS data %@ for identity %@"), v8, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  CFRelease(v16);
LABEL_19:
  if (a5)
  {
    v9 = objc_retainAutorelease(v9);
    *a5 = v9;
  }
LABEL_21:

  return v10;
}

- (_OpaquePCSShareProtection)createSharePCSFromEncryptedData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  _OpaquePCSShareProtection *v7;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = PCSFPCopyRecoverPCS();
    v7 = (_OpaquePCSShareProtection *)v6;
    if (a4 && !v6)
      *a4 = objc_retainAutorelease(0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)publicKeyDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  uint64_t v6;
  const char *v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  _OpaquePCSShareProtection *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = PCSFPCopyCurrentPrivateKey();
  if (v6)
  {
    v8 = (const void *)v6;
    v9 = PCSIdentityCopyPublicIdentity();
    if (v9)
    {
      v10 = (const void *)v9;
      v11 = (void *)PCSPublicIdentityCopyPublicKey();
      CFRelease(v10);
      CFRelease(v8);
      if (v11)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v12 = *MEMORY[0x1E0C952D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v16 = a3;
          v17 = 2114;
          v18 = v11;
          _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Public key data for current private key for share PCS %@ is %{public}@", buf, 0x16u);
        }
        v13 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      CFRelease(v8);
    }
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't create public key data from PCS  %@"), a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (a4 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    v11 = 0;
    *a4 = v13;
  }
LABEL_13:

  return v11;
}

- (void)decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend_synchronizeQueue(self, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA74950;
  block[3] = &unk_1E782F430;
  block[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(v16, block);

}

- (void)_locked_decryptCurrentPerParticipantPCSDataOnSharePCS:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 shareModificationDate:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  _QWORD *v36;
  os_log_t *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity;
  const char *v44;
  uint64_t v45;
  void *v46;
  id *v47;
  const char *v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  BOOL v53;
  const char *v54;
  uint64_t v55;
  _BOOL4 v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  int v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  uint64_t *v84;
  _QWORD v85[4];
  NSObject *v86;
  id v87;
  CKDPCSManager *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t *v93;
  id v94[3];
  BOOL v95;
  id location;
  _QWORD v97[4];
  NSObject *v98;
  id v99;
  id v100;
  id v101;
  uint64_t *v102;
  _QWORD block[4];
  id v104;
  id v105;
  uint64_t *v106;
  id v107;
  uint64_t v108;
  id *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v79 = a5;
  v77 = a6;
  v78 = a7;
  v80 = a8;
  objc_msgSend_synchronizeQueue(self, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  v108 = 0;
  v109 = (id *)&v108;
  v110 = 0x3032000000;
  v111 = sub_1BE9BAFA8;
  v112 = sub_1BE9BAD88;
  v113 = 0;
  objc_msgSend_shareID(v14, v19, v20);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_serviceType(v14, v21, v22);
  objc_msgSend_identityManager(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v26, v27, v23);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_callbackQueue(self, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_myParticipantPCSData(v14, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    if (v15 && v79)
    {
      v36 = (_QWORD *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v37 = (os_log_t *)MEMORY[0x1E0C952D8];
      v38 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v76;
        _os_log_debug_impl(&dword_1BE990000, v38, OS_LOG_TYPE_DEBUG, "Trying to unlock our per-participant PCS for share %@ using a combined OON key", buf, 0xCu);
      }
      objc_msgSend_identityManager(self, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity = objc_msgSend_createCombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity_(v41, v42, (uint64_t)v79, v15);

      objc_msgSend_myParticipantPCSData(v14, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v109;
      v107 = v109[5];
      v49 = (void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v48, (uint64_t)v46, CombinedIdentityWithOutOfNetworkPrivateKey_publicSharingIdentity, &v107);
      objc_storeStrong(v47 + 5, v107);

      if (v49)
      {
        objc_msgSend_setMyParticipantPCS_(v14, v50, (uint64_t)v49);
        if (*v36 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v51 = *v37;
        if (os_log_type_enabled(*v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v115 = v76;
          v116 = 2112;
          v117 = v49;
          _os_log_debug_impl(&dword_1BE990000, v51, OS_LOG_TYPE_DEBUG, "Successfully decrypted a per-participant PCS for share %@ using a combined OON key: %@", buf, 0x16u);
        }
        CFRelease(v49);
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEA75234;
      block[3] = &unk_1E78318E0;
      v105 = v80;
      v104 = v14;
      v106 = &v108;
      dispatch_async(v30, block);

    }
    else if (v23)
    {
      v53 = v23 == 1;
      if (v23 == 1)
      {
        v56 = objc_msgSend_publicPermission(v14, v34, v35) == 1 || objc_msgSend_publicPermission(v14, v54, v55) == 0;
        v62 = objc_msgSend_myParticipantRole(v14, v54, v55) == 1 || v56;
        if (v62)
          v63 = 2;
        else
          v63 = 1;
        v74 = v63;
        if (v62)
          v23 = 1;
        else
          v23 = 2;
      }
      else
      {
        v74 = 2;
      }
      objc_initWeak(&location, self);
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v64 = (id)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_identityManager(self, v65, v66);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_PCSServiceStringFromCKServiceType_(v71, v72, v74);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v115 = v76;
        v116 = 2114;
        v117 = v73;
        _os_log_debug_impl(&dword_1BE990000, v64, OS_LOG_TYPE_DEBUG, "Attempting decryption of per-participant PCS for share %@ using our %{public}@ identity", buf, 0x16u);

      }
      objc_msgSend_myParticipantPCSData(v14, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = sub_1BEA75440;
      v85[3] = &unk_1E7831958;
      objc_copyWeak(v94, &location);
      v86 = v30;
      v93 = &v108;
      v87 = v14;
      v88 = self;
      v94[1] = (id)v74;
      v95 = v53;
      v89 = v76;
      v94[2] = (id)v23;
      v90 = v77;
      v91 = v78;
      v92 = v80;
      objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v70, (uint64_t)v69, 4, v74, 0, 1, v90, v91, v85);

      objc_destroyWeak(v94);
      objc_destroyWeak(&location);
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v57 = *MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v115 = v76;
        v116 = 2114;
        v117 = v75;
        _os_log_debug_impl(&dword_1BE990000, v57, OS_LOG_TYPE_DEBUG, "Trying to unlock our per-participant PCS for share %@ using the %{public}@ service", buf, 0x16u);
      }
      objc_msgSend_myParticipantPCSData(v14, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = MEMORY[0x1E0C809B0];
      v97[1] = 3221225472;
      v97[2] = sub_1BEA7525C;
      v97[3] = &unk_1E7831908;
      v98 = v30;
      v102 = &v108;
      v99 = v14;
      v100 = v75;
      v101 = v80;
      objc_msgSend__createPCSFromData_ofType_usingPCSServiceType_tryDecryptingWithOtherServices_withSyncKeyRegistryRetry_lastModifiedDate_requestorOperationID_completionHandler_(self, v61, (uint64_t)v60, 4, 0, 0, 1, v77, v78, v97);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v52 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v115 = v76;
      _os_log_debug_impl(&dword_1BE990000, v52, OS_LOG_TYPE_DEBUG, "No current per-participant PCS data found for decryption on share %@", buf, 0xCu);
    }
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = sub_1BEA75A30;
    v81[3] = &unk_1E78318E0;
    v83 = v80;
    v82 = v14;
    v84 = &v108;
    dispatch_async(v30, v81);

  }
  _Block_object_dispose(&v108, 8);

}

- (void)_locked_decryptPCSDataOnSharePCS:(id)a3 shareModificationDate:(id)a4 withPublicSharingKey:(id)a5 oonPrivateKey:(id)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v14 = a5;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  objc_msgSend_synchronizeQueue(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  objc_msgSend_shareID(v19, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_serviceType(v19, v26, v27);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1BEA75BAC;
  v33[3] = &unk_1E7831980;
  v36 = v15;
  v37 = v28;
  v33[4] = self;
  v34 = v14;
  v35 = v25;
  v29 = v15;
  v30 = v25;
  v31 = v14;
  objc_msgSend__locked_decryptCurrentPerParticipantPCSDataOnSharePCS_withPublicSharingKey_oonPrivateKey_shareModificationDate_requestorOperationID_completionHandler_(self, v32, (uint64_t)v19, v31, v17, v18, v16, v33);

}

- (void)pcsDataFromFetchedShare:(id)a3 requestorOperationID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v14 = a3;
  v12 = objc_msgSend_serviceTypeForSharing(self, v10, v11);
  objc_msgSend_pcsDataFromFetchedShare_withServiceType_requestorOperationID_completionHandler_(self, v13, (uint64_t)v14, v12, v9, v8);

}

- (void)pcsDataFromFetchedShare:(id)a3 withServiceType:(unint64_t)a4 requestorOperationID:(id)a5 completionHandler:(id)a6
{
  objc_msgSend_pcsDataFromFetchedShare_withPublicSharingKey_oonPrivateKey_withServiceType_requestorOperationID_completionHandler_(self, a2, (uint64_t)a3, 0, 0, a4, a5, a6);
}

- (void)pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend_synchronizeQueue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEA769A8;
  block[3] = &unk_1E78319A8;
  block[4] = self;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v32 = v18;
  v33 = a6;
  v31 = v17;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  dispatch_async(v21, block);

}

- (void)_locked_pcsDataFromFetchedShare:(id)a3 withPublicSharingKey:(id)a4 oonPrivateKey:(id)a5 withServiceType:(unint64_t)a6 requestorOperationID:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  NSObject *v63;
  _QWORD v64[5];
  id v65;
  id v66;
  _QWORD block[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  uint8_t buf[4];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend_synchronizeQueue(self, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  if (v14)
  {
    objc_msgSend_dataWithShare_serviceType_(CKDSharePCSData, v22, (uint64_t)v14, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_privatePCS(v14, v24, v25) && objc_msgSend_publicPCS(v14, v26, v27))
    {
      v28 = objc_msgSend_privatePCS(v14, v26, v27);
      objc_msgSend_setPcs_(v23, v29, v28);
      v32 = objc_msgSend_publicPCS(v14, v30, v31);
      objc_msgSend_setPublicPCS_(v23, v33, v32);
      if (objc_msgSend_myParticipantPCS(v14, v34, v35))
      {
        v38 = objc_msgSend_myParticipantPCS(v14, v36, v37);
        objc_msgSend_setMyParticipantPCS_(v23, v39, v38);
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v40 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v43 = v40;
        objc_msgSend_recordID(v14, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v73 = v46;
        _os_log_impl(&dword_1BE990000, v43, OS_LOG_TYPE_INFO, "Using pre-decrypted share PCS for share %@", buf, 0xCu);

      }
      objc_msgSend_callbackQueue(self, v41, v42);
      v47 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1BEA76E0C;
      block[3] = &unk_1E782EC68;
      v69 = v18;
      v68 = v23;
      dispatch_async(v47, block);

      v48 = v69;
    }
    else
    {
      objc_msgSend_modificationDate(v14, v26, v27);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (*MEMORY[0x1E0C95280])
      {
        objc_msgSend_pcsTestOverrides(self, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)CFSTR("OverrideShareModificationDate"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          objc_msgSend_pcsTestOverrides(self, v54, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v56, v57, (uint64_t)CFSTR("OverrideShareModificationDate"));
          v58 = objc_claimAutoreleasedReturnValue();

          v48 = (void *)v58;
        }
      }
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = sub_1BEA76E2C;
      v64[3] = &unk_1E78319D0;
      v64[4] = self;
      v65 = v14;
      v66 = v18;
      objc_msgSend__locked_decryptPCSDataOnSharePCS_shareModificationDate_withPublicSharingKey_oonPrivateKey_requestorOperationID_completionHandler_(self, v59, (uint64_t)v23, v48, v15, v16, v17, v64);

    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v60 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v60, OS_LOG_TYPE_ERROR, "Share decryption called without a share", buf, 2u);
    }
    objc_msgSend_callbackQueue(self, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = sub_1BEA76DF0;
    v70[3] = &unk_1E782EFD8;
    v71 = v18;
    dispatch_async(v63, v70);

    v23 = v71;
  }

}

- (_PCSPublicIdentityData)copyPublicAuthorshipIdentityFromPCS:(_OpaquePCSShareProtection *)a3
{
  if (!a3)
    return 0;
  PCSFPGetAuthorshipIdentity();
  return (_PCSPublicIdentityData *)PCSIdentityCopyPublicIdentity();
}

- (id)createNewSharePCSDataForShareWithID:(id)a3 withPublicSharingKey:(id)a4 addDebugIdentity:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  const __CFString *v9;
  __CFString *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t *v14;
  void *v15;
  const char *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t *v28;
  os_log_t *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  id *v33;
  uint64_t v34;
  __CFString *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const void *SharePublicPCSWithIdentity_error;
  const void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  const void *v48;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_t v55;
  NSObject *v56;
  __CFString *PublicKey;
  os_log_t *v58;
  objc_class *v59;
  id v60;
  const char *v61;
  __CFString *v62;
  __CFString *v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  const char *v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  os_log_t v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  os_log_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t *v84;
  NSObject *v85;
  char v86;
  const char *v87;
  const char *v88;
  NSObject *v89;
  NSObject *v90;
  __CFString *v91;
  __CFString *v92;
  uint64_t v93;
  uint64_t v95;
  __CFString *v96;
  id v97;
  id v98;
  id v99[2];
  id v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint8_t buf[4];
  const __CFString *v105;
  __int16 v106;
  const __CFString *v107;
  __int16 v108;
  __CFString *v109;
  uint64_t v110;

  v6 = a5;
  v110 = *MEMORY[0x1E0C80C00];
  v9 = (const __CFString *)a3;
  v10 = (__CFString *)a4;
  v13 = objc_msgSend_serviceTypeForSharing(self, v11, v12);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (os_log_t *)MEMORY[0x1E0C952D8];
  v15 = (void *)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(v13 - 1) > 5)
      v17 = CFSTR("Current Service");
    else
      v17 = off_1E7831C48[v13 - 1];
    *(_DWORD *)buf = 138412546;
    v105 = v9;
    v106 = 2114;
    v107 = v17;
    v18 = v15;
    _os_log_impl(&dword_1BE990000, v18, OS_LOG_TYPE_INFO, "Creating new PCS data for share %@ with service type %{public}@", buf, 0x16u);

  }
  objc_msgSend_dataWithShareID_pcsData_(CKDSharePCSData, v16, (uint64_t)v9, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServiceType_(v19, v20, v13);
  v96 = (__CFString *)v9;
  if (v13 == 1)
  {
    v103 = 0;
    v23 = objc_msgSend_createSharePCSOfType_forPCSServiceType_error_(self, v21, 5, 1, &v103);
    v24 = (__CFString *)v103;
    if (v24)
    {
      v27 = v24;
      v28 = (uint64_t *)MEMORY[0x1E0C95300];
      v95 = v23;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = v14;
      v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      goto LABEL_13;
    }
  }
  else
  {
    if (objc_msgSend_currentServiceIsManatee(self, v21, v22))
    {
      v102 = 0;
      v33 = (id *)&v102;
      v34 = objc_msgSend_createEmptySignedSharePCSOfType_forPCSServiceType_withError_(self, v32, 5, v13, &v102);
    }
    else
    {
      v101 = 0;
      v33 = (id *)&v101;
      v34 = objc_msgSend_createEmptySharePCSOfType_error_(self, v32, 5, &v101);
    }
    v23 = v34;
    v35 = (__CFString *)*v33;
    if (v35)
    {
      v27 = v35;
      v28 = (uint64_t *)MEMORY[0x1E0C95300];
      v95 = v23;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = v14;
      v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
LABEL_13:
      *(_DWORD *)buf = 138412546;
      v105 = v9;
      v106 = 2112;
      v107 = v27;
      v31 = "Couldn't create a private PCS object for the share %@: %@";
LABEL_32:
      _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);
LABEL_33:
      SharePublicPCSWithIdentity_error = 0;
      v43 = 0;
LABEL_34:
      v44 = 0;
LABEL_35:
      v45 = 0;
LABEL_36:

      v46 = *v28;
      goto LABEL_37;
    }
  }
  v95 = v23;
  if (v6)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v36 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v9;
      _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Adding debug sharing identity to share %@", buf, 0xCu);
    }
    v39 = objc_msgSend_debugSharingIdentity(self, v37, v38);
    objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v40, v39, v23, 1);
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v27 = (__CFString *)v41;
      v28 = (uint64_t *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v29 = v14;
      v30 = *v14;
      if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      *(_DWORD *)buf = 138412546;
      v105 = v9;
      v106 = 2112;
      v107 = v27;
      v31 = "Couldn't add debug sharing identifier to share %@: %@";
      goto LABEL_32;
    }
  }
  objc_msgSend_identityManager(self, v25, v26);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  v43 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v50, v51, (uint64_t)v10, &v100);
  v27 = (__CFString *)v100;

  if (!v43 || v27)
  {
    v28 = (uint64_t *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v29 = v14;
    v54 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v105 = v10;
      v106 = 2112;
      v107 = v27;
      _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS sharing identity from data (%@): %@", buf, 0x16u);
    }
    SharePublicPCSWithIdentity_error = 0;
    goto LABEL_34;
  }
  v99[1] = 0;
  v53 = PCSIdentityCopyExternalForm();
  v93 = v53;
  if (v53)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v55 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      v56 = v55;
      PublicKey = (__CFString *)PCSIdentityGetPublicKey();
      v58 = v14;
      v59 = (objc_class *)MEMORY[0x1E0CB3940];
      v91 = PublicKey;
      v60 = [v59 alloc];
      v62 = (__CFString *)objc_msgSend_initWithData_encoding_(v60, v61, v93, 4);
      *(_DWORD *)buf = 138412802;
      v105 = v96;
      v106 = 2114;
      v107 = PublicKey;
      v108 = 2112;
      v109 = v62;
      _os_log_impl(&dword_1BE990000, v56, OS_LOG_TYPE_INFO, "Using identity for public PCS on share %@: %{public}@: %@", buf, 0x20u);

      v14 = v58;
    }
  }
  v29 = v14;
  v99[0] = 0;
  SharePublicPCSWithIdentity_error = (const void *)objc_msgSend_createSharePublicPCSWithIdentity_error_(self, v52, (uint64_t)v43, v99);
  v63 = (__CFString *)v99[0];
  if (v63)
  {
    v27 = v63;
    v28 = (uint64_t *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = (void *)v93;
    v66 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v105 = v96;
      v106 = 2112;
      v107 = v27;
      _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS object for the share %@: %@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  v92 = v10;
  objc_msgSend_identityManager(self, v64, v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  objc_msgSend_dataFromSharingIdentity_error_(v67, v68, (uint64_t)v43, &v98);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (__CFString *)v98;

  if (v27 || !v45)
  {
    v28 = (uint64_t *)MEMORY[0x1E0C95300];
    v10 = v92;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = (void *)v93;
    v80 = *v29;
    if (!os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
      goto LABEL_36;
    *(_DWORD *)buf = 138412290;
    v105 = v27;
    v77 = "Couldn't create data from our public sharing identity: %@";
    v78 = v80;
    v79 = 12;
LABEL_85:
    _os_log_error_impl(&dword_1BE990000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
    goto LABEL_36;
  }
  v10 = v92;
  if (v6)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v70 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v96;
      _os_log_debug_impl(&dword_1BE990000, v70, OS_LOG_TYPE_DEBUG, "Adding debug sharing identity to share %@", buf, 0xCu);
    }
    v73 = objc_msgSend_debugSharingIdentity(self, v71, v72);
    objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v74, v73, SharePublicPCSWithIdentity_error, 1);
    v75 = objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      v27 = (__CFString *)v75;
      v28 = (uint64_t *)MEMORY[0x1E0C95300];
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v44 = (void *)v93;
      v76 = *v29;
      if (!os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      *(_DWORD *)buf = 138412546;
      v105 = v96;
      v106 = 2112;
      v107 = v27;
      v77 = "Couldn't add debug sharing identifier to share %@: %@";
      v78 = v76;
      v79 = 22;
      goto LABEL_85;
    }
  }
  if (v13 != 1)
    goto LABEL_96;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v81 = *v29;
  if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v96;
    _os_log_debug_impl(&dword_1BE990000, v81, OS_LOG_TYPE_DEBUG, "Adding the owner to the self-added PCS blob for share %@", buf, 0xCu);
  }
  objc_msgSend_addIdentityForService_toPCS_(self, v82, 1, SharePublicPCSWithIdentity_error);
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v27 = (__CFString *)v83;
    v84 = (uint64_t *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v44 = (void *)v93;
    v85 = *MEMORY[0x1E0C952B0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v46 = -1;
      goto LABEL_99;
    }
    *(_DWORD *)buf = 138543874;
    v105 = CFSTR("Bladerunner");
    v106 = 2112;
    v107 = v96;
    v108 = 2112;
    v109 = v27;
    _os_log_error_impl(&dword_1BE990000, v85, OS_LOG_TYPE_ERROR, "Couldn't add our %{public}@ identity to the public PCS for share %@: %@", buf, 0x20u);
  }
  else
  {
LABEL_96:
    v97 = 0;
    v86 = objc_msgSend_addSharePCS_toRecordPCS_permission_error_(self, v69, v95, SharePublicPCSWithIdentity_error, 0, &v97);
    v27 = (__CFString *)v97;
    if ((v86 & 1) == 0)
    {
      v28 = (uint64_t *)MEMORY[0x1E0C95300];
      v44 = (void *)v93;
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v90 = *v29;
      if (os_log_type_enabled(*v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v105 = v96;
        v106 = 2112;
        v107 = v27;
        _os_log_impl(&dword_1BE990000, v90, OS_LOG_TYPE_INFO, "Error adding private sharing PCS to public sharing PCS for share %@: %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    objc_msgSend_setPcs_(v19, v87, v95);
    objc_msgSend_setPublicPCS_(v19, v88, (uint64_t)SharePublicPCSWithIdentity_error);
    v84 = (uint64_t *)MEMORY[0x1E0C95300];
    v44 = (void *)v93;
  }
  v46 = *v84;
LABEL_99:
  if (!v19)
  {
LABEL_37:
    if (v46 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v47 = *v29;
    if (os_log_type_enabled(*v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v105 = v96;
      v106 = 2112;
      v107 = v27;
      _os_log_error_impl(&dword_1BE990000, v47, OS_LOG_TYPE_ERROR, "Error creating PCS data for share %@: %@", buf, 0x16u);
    }
    v48 = (const void *)v95;
    if (a6)
    {
      v27 = objc_retainAutorelease(v27);
      v19 = 0;
      *a6 = v27;
      if (!v95)
        goto LABEL_46;
    }
    else
    {
      v19 = 0;
      if (!v95)
        goto LABEL_46;
    }
LABEL_45:
    CFRelease(v48);
    goto LABEL_46;
  }
  if (v46 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v89 = *v29;
  if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v105 = v96;
    _os_log_debug_impl(&dword_1BE990000, v89, OS_LOG_TYPE_DEBUG, "Successfully created PCS data for share %@", buf, 0xCu);
  }
  v48 = (const void *)v95;
  if (v95)
    goto LABEL_45;
LABEL_46:
  if (SharePublicPCSWithIdentity_error)
    CFRelease(SharePublicPCSWithIdentity_error);
  if (v43)
    CFRelease(v43);

  return v19;
}

- (id)etagFromSharePCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = 0;
    return v9;
  }
  v5 = (void *)PCSFPCreateUniqueID();
  v8 = v5;
  if (!v5)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = 0;
      v14 = 2112;
      v15 = 0;
      _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "Couldn't create data from share PCS %@: %@", (uint8_t *)&v12, 0x16u);
    }
    v9 = 0;
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend_CKUppercaseHexStringWithoutSpaces(v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_4:
    *a4 = 0;
LABEL_5:

  return v9;
}

- (id)addPublicIdentity:(_PCSPublicIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unsigned int)a5
{
  char v6;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v14;
  const char *v15;
  void *v16;
  _QWORD v17[7];
  unsigned int v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;
  uint8_t v23[4];
  _PCSPublicIdentityData *v24;
  __int16 v25;
  _OpaquePCSShareProtection *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v12 = "Refusing to add a nil public identity to a record PCS";
    goto LABEL_17;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v12 = "Refusing to add a sharing identity to a nil record PCS";
LABEL_17:
    _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
    return 0;
  }
  v6 = a5;
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1BEA7820C;
  v17[3] = &unk_1E78319F8;
  v17[4] = buf;
  v17[5] = a4;
  v17[6] = a3;
  v18 = a5;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v17);
  v8 = (void *)*MEMORY[0x1E0C952F8];
  if (v20[24])
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v8);
    v9 = (id)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      CKStringFromSharePermission(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412802;
      v24 = a3;
      v25 = 2112;
      v26 = a4;
      v27 = 2114;
      v28 = v16;
      _os_log_debug_impl(&dword_1BE990000, v9, OS_LOG_TYPE_DEBUG, "Successfully added public identity %@ to record PCS %@ with permission %{public}@", v23, 0x20u);

    }
    v10 = 0;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v8);
    v14 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v23 = 138412546;
      v24 = a3;
      v25 = 2112;
      v26 = a4;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Error adding public identity %@ to record PCS %@", v23, 0x16u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 5005, CFSTR("Error adding public identity %@ to record PCS %@"), a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(buf, 8);
  return v10;
}

- (id)addIdentityBackToPCS:(_OpaquePCSShareProtection *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const void *v13;
  void *v14;
  id v15;

  if (a3)
  {
    v5 = (void *)PCSFPCopyKeyIDs();
    if (objc_msgSend_count(v5, v6, v7))
    {
      objc_msgSend_lastObject(v5, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PCSFPCopyPrivateKey();
      if (v11)
      {
        v13 = (const void *)v11;
        objc_msgSend_addSharingIdentity_toSharePCS_permission_(self, v12, v11, a3, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v13);
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't get PCS identity with key ID %@"), v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't get key IDs from share PCS %@"), a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)addSharingIdentity:(_PCSIdentityData *)a3 toSharePCS:(_OpaquePCSShareProtection *)a4 permission:(unint64_t)a5
{
  uint64_t v9;
  const char *v10;
  const void *v11;
  void *v12;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint8_t buf[4];
  _PCSIdentityData *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v15 = "Refusing to add a nil sharing identity to a record PCS";
    goto LABEL_13;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v15 = "Refusing to add a sharing identity to a nil record PCS";
LABEL_13:
    _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
    return 0;
  }
  v9 = PCSIdentityCopyPublicIdentity();
  if (v9)
  {
    v11 = (const void *)v9;
    objc_msgSend_addPublicIdentity_toSharePCS_permission_(self, v10, v9, a4, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v11);
    return v12;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v16 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a3;
      _os_log_impl(&dword_1BE990000, v16, OS_LOG_TYPE_INFO, "Error getting a public identity from sharing identity %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v17, *MEMORY[0x1E0C94B20], 5000, CFSTR("Error getting a public identity from sharing identity %@"), a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)removePublicIdentity:(_PCSPublicIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  const char *v4;
  void *v5;
  id v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (!a3)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 5005, CFSTR("Can't remove a nil public identity"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], a2, *MEMORY[0x1E0C94B20], 5005, CFSTR("Can't remove a public identity from a nil share"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEA786E0;
  v8[3] = &unk_1E78312C0;
  v8[4] = &v9;
  v8[5] = a4;
  v8[6] = a3;
  objc_msgSend__onSynchronizeQueue_(self, a2, (uint64_t)v8);
  if (*((_BYTE *)v10 + 24))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v4, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't remove public identity from share PCS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (id)removeSharingIdentity:(_PCSIdentityData *)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  uint64_t v7;
  const char *v8;
  const void *v9;
  void *v10;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint8_t buf[4];
  _PCSIdentityData *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v13 = "Refusing to remove a nil sharing identity from a record PCS";
    goto LABEL_13;
  }
  if (!a4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952D8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      return 0;
    *(_WORD *)buf = 0;
    v13 = "Refusing to remove a sharing identity from a nil record PCS";
LABEL_13:
    _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
    return 0;
  }
  v7 = PCSIdentityCopyPublicIdentity();
  if (v7)
  {
    v9 = (const void *)v7;
    objc_msgSend_removePublicIdentity_fromSharePCS_(self, v8, v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
    return v10;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v14 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a3;
      _os_log_impl(&dword_1BE990000, v14, OS_LOG_TYPE_INFO, "Error getting a public identity from sharing identity %@", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 5005, CFSTR("Error getting a public identity from sharing identity %@"), a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)removeEncryptedPCS:(id)a3 fromSharePCS:(_OpaquePCSShareProtection *)a4
{
  const char *v6;
  id v7;
  void *v8;
  const void *v9;
  id v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 0;
  if (v7 && a4)
  {
    v15 = 0;
    v9 = (const void *)objc_msgSend_createSharePCSFromEncryptedData_error_(self, v6, (uint64_t)v7, &v15);
    v10 = v15;
    v8 = v10;
    if (v9 && !v10)
    {
      v11 = PCSShareProtectionCopyPublicKeys();
      if (v11)
      {
        v12 = (const void *)v11;
        CKCFArrayForEach();
        CFRelease(v9);
        v9 = v12;
      }
LABEL_12:
      CFRelease(v9);
      goto LABEL_13;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "Couldn't create a PCS from the encrypted blob %@", buf, 0xCu);
    }
    if (v9)
      goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (BOOL)removePublicKeys:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  _OpaquePCSShareProtection *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
  {
    v6 = (void *)PCSFPCopyPublicIdentities();
    if (v6)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 1;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      obj = v5;
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v20, v32, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v21;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v21 != v9)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
            v16 = 0;
            v17 = &v16;
            v18 = 0x2020000000;
            v19 = 0;
            CKCFArrayForEach();
            if (!*((_BYTE *)v17 + 24))
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v12 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v29 = v11;
                v30 = 2112;
                v31 = a4;
                _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Could not find matching public identity for key %{public}@ on record PCS %@", buf, 0x16u);
              }
            }
            _Block_object_dispose(&v16, 8);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v20, v32, 16);
        }
        while (v8);
      }

      LOBYTE(a4) = *((_BYTE *)v25 + 24) != 0;
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      LOBYTE(a4) = 0;
    }

  }
  return (char)a4;
}

- (id)removePublicKeyID:(id)a3 fromPCS:(_OpaquePCSShareProtection *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _OpaquePCSShareProtection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0;
  if (v5 && a4)
  {
    v7 = (void *)PCSFPCopyPublicIdentities();
    if (v7)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = sub_1BE9BAFA8;
      v20 = sub_1BE9BAD88;
      v21 = 0;
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v8 = v5;
      v11 = v8;
      CKCFArrayForEach();
      if (!*((_BYTE *)v13 + 24))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v9 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v23 = v8;
          v24 = 2112;
          v25 = a4;
          _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Could not find matching public identity for keyID %{public}@ on record PCS %@. Soldiering on.", buf, 0x16u);
        }
      }
      v6 = (id)v17[5];

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(&v16, 8);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)sharingIdentityDataFromPCS:(_OpaquePCSShareProtection *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  _OpaquePCSShareProtection *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v7 = (void *)PCSFPCopyKeyIDs();
  if (!objc_msgSend_count(v7, v8, v9))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v10, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't get key IDs from share PCS %@"), a3);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend_lastObject(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = PCSFPCopyPrivateKey();
  if (!v13)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 5005, CFSTR("Couldn't get PCS identity with key ID %@"), v12);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v16 = (const void *)v13;
  objc_msgSend_identityManager(self, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend_dataFromSharingIdentity_error_(v17, v18, (uint64_t)v16, &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v25;

  CFRelease(v16);
  if (!v19)
  {
LABEL_12:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1BE990000, v23, OS_LOG_TYPE_INFO, "Warn: Couldn't get sharing identity from PCS data: %@", buf, 0xCu);
    }
    if (a4)
    {
      v20 = objc_retainAutorelease(v20);
      v19 = 0;
      *a4 = v20;
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_19;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v21 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    v28 = 2112;
    v29 = a3;
    _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Got sharing identity %@ from PCS data %@", buf, 0x16u);
  }
LABEL_19:
  v24 = v19;

  return v24;
}

- (id)decryptChainPCSForRecordPCS:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
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
  uint64_t v33;
  void *v34;
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
  const void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  CKDWrappingContext *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  id v88;
  id v89;

  v4 = a3;
  objc_msgSend_chainPCSData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_pcs(v7, v8, v9);

  if (v10)
  {
    v13 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend_pcs(v4, v11, v12))
  {
    v61 = (void *)MEMORY[0x1E0C94FF8];
    v62 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v4, v14, v15);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v61, v64, v62, 5004, CFSTR("Can't decrypt chain PCS for record %@ because we don't have a decrypted record PCS"), v63);
LABEL_15:
    v13 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  objc_msgSend_chainPCSData(v4, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedChainPCSPrivateKey(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v65 = (void *)MEMORY[0x1E0C94FF8];
    v66 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v4, v20, v21);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v65, v67, v66, 5004, CFSTR("Can't decrypt chain PCS for record %@ because the record has no chain PCS private key"), v63);
    goto LABEL_15;
  }
  objc_msgSend_chainPCSData(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsData(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v68 = (void *)MEMORY[0x1E0C94FF8];
    v69 = *MEMORY[0x1E0C94B20];
    objc_msgSend_recordID(v4, v26, v27);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v68, v70, v69, 5004, CFSTR("Can't decrypt chain PCS for record %@ because the record has no chain PCS data"), v63);
    goto LABEL_15;
  }
  objc_msgSend_chainPCSData(v4, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedChainPCSPrivateKey(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    goto LABEL_7;
  v72 = [CKDWrappingContext alloc];
  objc_msgSend_recordID(v4, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(v72, v76, (uint64_t)v75, *MEMORY[0x1E0C95330], 0, 0, 0);

  objc_msgSend_chainPCSData(v4, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedChainPCSPrivateKey(v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend_pcs(v4, v84, v85);
  objc_msgSend_unwrapEncryptedData_withPCS_inContext_(self, v87, (uint64_t)v83, v86, v77);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_7:
    objc_msgSend_identityManager(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_chainPCSData(v4, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedChainPCSPrivateKey(v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v48 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v37, v47, (uint64_t)v46, &v89);
    v13 = v89;

    if (v48 && !v13)
    {
      objc_msgSend_chainPCSData(v4, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsData(v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = 0;
      v56 = objc_msgSend_createSharePCSFromData_sharingIdentity_error_(self, v55, (uint64_t)v54, v48, &v88);
      v13 = v88;

      if (!v56 || v13)
      {
        CFRelease(v48);
        v48 = (const void *)v56;
        if (!v56)
          goto LABEL_16;
      }
      else
      {
        objc_msgSend_chainPCSData(v4, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPcs_(v59, v60, v56);

        CFRelease(v48);
        v13 = 0;
        v48 = (const void *)v56;
      }
LABEL_24:
      CFRelease(v48);
      goto LABEL_16;
    }
    if (!v13)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v49, *MEMORY[0x1E0C94B20], 5004, CFSTR("Couldn't decrypt the private chain PCS identity"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v48)
      goto LABEL_24;
  }
LABEL_16:

  return v13;
}

- (BOOL)containerSupportsEnhancedContext
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  int IsManatee;
  void *v11;
  const char *v12;
  uint64_t v13;
  unint64_t v14;

  if ((objc_msgSend_useZoneWidePCS(self, a2, v2) & 1) == 0
    && (objc_msgSend_mmcsEncryptionSupport(self, v4, v5) & 2) == 0)
  {
    objc_msgSend_identityManager(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceName(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IsManatee = PCSServiceItemTypeIsManatee();

    if (!IsManatee)
      return 0;
  }
  objc_msgSend_containerID(self, v4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_specialContainerType(v11, v12, v13);

  if (v14 <= 5)
    return (0xBu >> v14) & 1;
  else
    return 1;
}

- (id)unwrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  const char *v36;
  void *v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  const char *v45;
  void *v46;
  NSObject *v47;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  _OpaquePCSShareProtection *v52;
  id *v53;
  void *v54;
  id v55;
  void *context;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE buf[12];
  __int16 v67;
  _OpaquePCSShareProtection *v68;
  __int16 v69;
  _OpaquePCSShareProtection *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x1C3B83E24]();
  v12 = (void *)v11;
  v13 = (_QWORD *)MEMORY[0x1E0C95300];
  if (!v9 || !a4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v21 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v21, OS_LOG_TYPE_INFO, "Couldn't unwrap asset key because we have no PCS object or wrapped asset key", buf, 2u);
    }
    v22 = 0;
LABEL_11:
    objc_autoreleasePoolPop(v12);
    if (*v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v23 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v49 = v23;
      objc_msgSend_assetContextString(v10, v50, v51);
      v52 = (_OpaquePCSShareProtection *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v9;
      v67 = 2112;
      v68 = v52;
      v69 = 2112;
      v70 = a4;
      v71 = 2112;
      v72 = v22;
      _os_log_error_impl(&dword_1BE990000, v49, OS_LOG_TYPE_ERROR, "Failed all decryption attempts for wrapped asset key %@ in context %@ using PCS %@: %@", buf, 0x2Au);

    }
    v26 = (void *)MEMORY[0x1E0C94FF8];
    v27 = *MEMORY[0x1E0C94B20];
    objc_msgSend_assetContextString(v10, v24, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_error_format_(v26, v29, v27, 5004, v22, CFSTR("Failed all decryption attempts for wrapped asset key %@ in context %@ using PCS %@"), v9, v28, a4);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v20 = objc_retainAutorelease(v20);
      v19 = 0;
      *a6 = v20;
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_50;
  }
  context = (void *)v11;
  v14 = (void *)PCSFPCopyAvailableMasterKeyIDs();
  *(_QWORD *)buf = 0;
  objc_msgSend_assetContextString(v10, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v17, v18, 4);

  v53 = a6;
  v57 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();
  if (v57)
  {
    v19 = (void *)PCSFPCopyDecryptedData();
    v20 = *(id *)buf;
    if (v19)
      goto LABEL_45;
  }
  else
  {
    v20 = 0;
  }
  v54 = v14;
  v55 = v10;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v30 = v14;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v62, v74, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v63 != v34)
          objc_enumerationMutation(v30);
        v19 = (void *)PCSFPCopyDecryptedData();
        v37 = *(void **)buf;
        if (*(_QWORD *)buf)
        {

          *(_QWORD *)buf = 0;
          v20 = v37;
        }
        if (v19)
        {

          v14 = v54;
          v10 = v55;
          v13 = (_QWORD *)MEMORY[0x1E0C95300];
          goto LABEL_45;
        }
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v36, (uint64_t)&v62, v74, 16);
      if (v33)
        continue;
      break;
    }
  }

  v13 = (_QWORD *)MEMORY[0x1E0C95300];
  if (!v57)
    goto LABEL_33;
  v19 = (void *)PCSFPCopyUnwrappedKey();
  v38 = *(void **)buf;
  v14 = v54;
  if (*(_QWORD *)buf)
  {

    *(_QWORD *)buf = 0;
    v20 = v38;
  }
  v10 = v55;
  if (!v19)
  {
LABEL_33:
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = v30;
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v58, v73, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v59;
      a6 = v53;
      while (2)
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v59 != v43)
            objc_enumerationMutation(v39);
          v19 = (void *)PCSFPCopyUnwrappedKey();
          v46 = *(void **)buf;
          if (*(_QWORD *)buf)
          {

            *(_QWORD *)buf = 0;
            v20 = v46;
          }
          if (v19)
          {

            v14 = v54;
            v10 = v55;
            v13 = (_QWORD *)MEMORY[0x1E0C95300];
            goto LABEL_46;
          }
        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v45, (uint64_t)&v58, v73, 16);
        if (v42)
          continue;
        break;
      }
    }
    else
    {
      a6 = v53;
    }

    v22 = v20;
    v10 = v55;
    v12 = context;
    v13 = (_QWORD *)MEMORY[0x1E0C95300];
    goto LABEL_11;
  }
LABEL_45:

LABEL_46:
  objc_autoreleasePoolPop(context);
  if (*v13 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v47 = *MEMORY[0x1E0C952D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    v67 = 2112;
    v68 = a4;
    _os_log_debug_impl(&dword_1BE990000, v47, OS_LOG_TYPE_DEBUG, "Unwrapped wrapped asset key %{public}@ with PCS %@", buf, 0x16u);
  }
LABEL_50:

  return v19;
}

- (id)wrapAssetKey:(id)a3 withRecordPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5 withError:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  os_log_t *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  os_log_t v29;
  os_log_t v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  NSObject *v41;
  const char *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  _OpaquePCSShareProtection *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v13 = a5;
  v14 = (os_log_t *)MEMORY[0x1E0C952D8];
  if (!v10 || !a4)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *v14;
    if (!os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v27 = 0;
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE990000, v26, OS_LOG_TYPE_ERROR, "Couldn't wrap asset key with no record PCS or asset key", buf, 2u);
LABEL_18:
    v27 = 0;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
LABEL_20:
    v30 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v37 = v30;
      objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v38, (uint64_t)v10);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v39;
      v46 = 2112;
      v47 = a4;
      _os_log_error_impl(&dword_1BE990000, v37, OS_LOG_TYPE_ERROR, "Couldn't wrap asset key with signature %@ with PCS %@", buf, 0x16u);

      if (a6)
        goto LABEL_22;
    }
    else if (a6)
    {
LABEL_22:
      v32 = (void *)MEMORY[0x1E0C94FF8];
      v33 = *MEMORY[0x1E0C94B20];
      objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v31, (uint64_t)v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_format_(v32, v35, v33, 5003, CFSTR("Couldn't wrap asset key with signature %@ with PCS %@"), v34, a4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_retainAutorelease(v36);
      v28 = 0;
      *a6 = v27;
      goto LABEL_25;
    }
    v28 = 0;
    goto LABEL_25;
  }
  if (objc_msgSend_containerSupportsEnhancedContext(self, v11, v12)
    && (objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v15, v16),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend_useEnhancedPCSEncryptionContext(v17, v18, v19),
        v17,
        v20))
  {
    objc_msgSend_assetContextString(v13, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataUsingEncoding_(v23, v24, 4);

    v25 = PCSFPCopyEncryptedData();
  }
  else
  {
    v25 = PCSFPCopyWrappedKey();
  }
  v28 = (void *)v25;
  if (!v25)
    goto LABEL_18;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v29 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEBUG))
  {
    v41 = v29;
    objc_msgSend_referenceIdentifierStringFromAssetKey_(self, v42, (uint64_t)v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v43;
    v46 = 2112;
    v47 = a4;
    _os_log_debug_impl(&dword_1BE990000, v41, OS_LOG_TYPE_DEBUG, "Wrapped asset key with signature %@ with PCS %@", buf, 0x16u);

  }
  v27 = 0;
LABEL_25:

  return v28;
}

- (id)newAssetKeyWithType:(unint64_t)a3 withError:(id *)a4
{
  void *v5;
  void *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 > 1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 4827, CFSTR("Unsupported CKDPCSAssetKeyType"));

    goto LABEL_5;
  }
  v5 = (void *)MMCSReferenceObjectCreateWithType();
  if (!v5)
  {
LABEL_5:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v10 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = 0;
      _os_log_error_impl(&dword_1BE990000, v10, OS_LOG_TYPE_ERROR, "MMCSReferenceObjectCreateWithType failed with error %@", buf, 0xCu);
      if (a4)
        goto LABEL_9;
    }
    else if (a4)
    {
LABEL_9:
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 5003, 0, CFSTR("MMCSReferenceObjectCreateWithType failed"));
      v5 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    return 0;
  }
  return v5;
}

- (id)referenceIdentifierStringFromAssetKey:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    objc_msgSend_referenceSignatureFromAssetKey_(self, a2, (uint64_t)a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    if (v3)
    {
      objc_msgSend_CKLowercaseHexStringWithoutSpaces(v3, v4, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v3;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)referenceSignatureFromAssetKey:(id)a3
{
  void *v3;

  if (!a3)
    return 0;
  v3 = (void *)MMCSReferenceSignatureCreateWithReferenceObject();
  if (!v3)
    v3 = 0;
  return v3;
}

- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  int v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  _OpaquePCSShareProtection *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend_data(v8, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v15 = (void *)v12;
    v16 = 0;
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend_containerSupportsEnhancedContext(self, v13, v14))
  {
    objc_msgSend_encryptedDataContextString(v9, v17, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v19, (uint64_t)v8, a4, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v16 = 0;
LABEL_6:
  objc_msgSend_data(v8, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend_fieldName(v9, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v24, (uint64_t)v8, a4, v23);
    v25 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v25;
  }
  objc_msgSend_data(v8, v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v27, (uint64_t)v8, a4, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v29;
  }
  objc_msgSend_data(v8, v27, v28);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v33 = (void *)v30;
  }
  else
  {
    if ((objc_msgSend_containerSupportsEnhancedContext(self, v31, v32) & 1) != 0)
      goto LABEL_15;
    objc_msgSend_encryptedDataContextString(v9, v34, v35);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unwrapEncryptedData_withPCS_withContextString_(self, v36, (uint64_t)v8, a4, v33);
    v37 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v37;
  }

LABEL_15:
  objc_msgSend_data(v8, v34, v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = 0;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v40 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v42 = v40;
      objc_msgSend_encryptedDataContextString(v9, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 138413058;
      v47 = v8;
      v48 = 2112;
      v49 = v45;
      v50 = 2112;
      v51 = a4;
      v52 = 2112;
      v53 = v16;
      _os_log_error_impl(&dword_1BE990000, v42, OS_LOG_TYPE_ERROR, "Failed all decryption attempts for encrypted data %@ in context %@ using PCS %@: %@", (uint8_t *)&v46, 0x2Au);

    }
    v39 = v16;
  }

  return v39;
}

- (id)_unwrapEncryptedData:(id)a3 usingKeyID:(id)a4 forPCS:(_OpaquePCSShareProtection *)a5 withContextString:(id)a6
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend_dataUsingEncoding_(v10, v11, 4);
  objc_msgSend_encryptedData(v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)PCSFPCopyDecryptedData();

  if (v15)
  {

    objc_msgSend_setData_(v8, v16, (uint64_t)v15);
  }

  return 0;
}

- (id)unwrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFTypeRef cf;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  CFTypeRef v50;
  __int16 v51;
  _OpaquePCSShareProtection *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11 = a5;
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't unwrap encrypted data in context %@ because %@."), v11, CFSTR("we don't have a record PCS"));
LABEL_7:
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  objc_msgSend_encryptedData(v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v13, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't unwrap encrypted data in context %@ because %@."), v11, CFSTR("there's nothing to decrypt"));
    goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1C3B83E24]();
  cf = 0;
  objc_msgSend_encryptedData(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();

  if (v18)
  {
    objc_msgSend__unwrapEncryptedData_usingKeyID_forPCS_withContextString_(self, v19, (uint64_t)v8, v18, a4, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v8;
      v49 = 2112;
      v50 = cf;
      _os_log_error_impl(&dword_1BE990000, v24, OS_LOG_TYPE_ERROR, "Failed to get keyID from encrypted data %@. Soldering on and trying all keyIDs. PCS error: %@", buf, 0x16u);
    }
    v22 = 0;
  }
  objc_msgSend_data(v8, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25 || v22)
  {

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v48 = v11;
      v49 = 2112;
      v50 = v18;
      v51 = 2112;
      v52 = a4;
      _os_log_debug_impl(&dword_1BE990000, v26, OS_LOG_TYPE_DEBUG, "Couldn't unwrap encrypted data in context %@ using keyID %@ with record PCS %@. Trying all keyIDs.", buf, 0x20u);
    }
    v39 = v18;
    v40 = v14;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v27 = (id)PCSFPCopyAvailableMasterKeyIDs();
    v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v41, v46, 16);
    if (v29)
    {
      v31 = v29;
      v23 = 0;
      v32 = *(_QWORD *)v42;
LABEL_22:
      v33 = 0;
      v34 = v23;
      while (1)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v27);
        objc_msgSend__unwrapEncryptedData_usingKeyID_forPCS_withContextString_(self, v30, (uint64_t)v8, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v33), a4, v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_data(v8, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          if (!v23)
            break;
        }
        ++v33;
        v34 = v23;
        if (v31 == v33)
        {
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v41, v46, 16);
          if (v31)
            goto LABEL_22;
          break;
        }
      }
    }
    else
    {
      v23 = 0;
    }

    v18 = v39;
    v14 = v40;
  }
  else
  {
    v23 = 0;
  }

  objc_autoreleasePoolPop(v14);
LABEL_33:

  return v23;
}

- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 inContext:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;

  v8 = a5;
  v9 = a3;
  if (objc_msgSend_containerSupportsEnhancedContext(self, v10, v11)
    && (objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend_useEnhancedPCSEncryptionContext(v14, v15, v16),
        v14,
        v17))
  {
    objc_msgSend_encryptedDataContextString(v8, v12, v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_fieldName(v8, v12, v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v18;
  objc_msgSend_wrapEncryptedData_withPCS_withContextString_(self, v19, (uint64_t)v9, a4, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)wrapEncryptedData:(id)a3 withPCS:(_OpaquePCSShareProtection *)a4 withContextString:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  _OpaquePCSShareProtection *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v10 = a5;
  if (!a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v8, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't wrap encrypted data in context %@ because %@."), v10, CFSTR("there's nothing to encrypt"));
LABEL_6:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend_data(v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v12, *MEMORY[0x1E0C94B20], 5003, CFSTR("Couldn't wrap encrypted data in context %@ because %@."), v10, CFSTR("we don't have a record PCS"));
    goto LABEL_6;
  }
  objc_msgSend_dataUsingEncoding_(v10, v12, 4);
  objc_msgSend_data(v7, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)PCSFPCopyEncryptedData();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v18 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = a4;
    v25 = 2112;
    v26 = v16;
    _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Wrapped encrypted data in context %@ with record PCS %@: %@", buf, 0x20u);
  }
  objc_msgSend_setEncryptedData_(v7, v19, (uint64_t)v16);
  v17 = 0;

LABEL_12:
  return v17;
}

- (void)_lockedGlobalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  id v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_synchronizeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    objc_msgSend_containerID(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_specialContainerType(v10, v11, v12);

    if (v13 <= 0x18 && ((1 << v13) & 0x1840004) != 0)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend_containerID(self, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_isTestContainer(v10, v23, v24) ^ 1;
    }
    if (v13 <= 0x18 && ((1 << v13) & 0x1840004) != 0)
    {
      if (v16)
      {
LABEL_8:
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 1017, CFSTR("Container not permitted to use global per-user boundary key for MMCSv2 uploads."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_callbackQueue(self, v18, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BEA7B604;
        block[3] = &unk_1E782EC68;
        v48 = v17;
        v49 = v4;
        v21 = v17;
        dispatch_async(v20, block);

        v22 = v49;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

      if (v16)
        goto LABEL_8;
    }
    objc_msgSend_boundaryKeyData(self, v14, v15);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v28 = (void *)v25;
      objc_msgSend_callbackQueue(self, v26, v27);
      v29 = objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = sub_1BEA7B618;
      v44[3] = &unk_1E782EC68;
      v46 = v4;
      v21 = v28;
      v45 = v21;
      dispatch_async(v29, v44);

      v22 = v46;
    }
    else
    {
      objc_msgSend_account(self, v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dsid(v30, v31, v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v50 = *MEMORY[0x1E0D82B18];
        v51[0] = v22;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)v51, &v50, 1);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v40 = v4;
        PCSGetBoundaryKey();
        v35 = v40;
      }
      else
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v33, *MEMORY[0x1E0C94B20], 5000, CFSTR("No account DSID, so we can't fetch a boundary key"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_callbackQueue(self, v37, v38);
        v39 = objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = sub_1BEA7B62C;
        v41[3] = &unk_1E782EC68;
        v42 = v36;
        v43 = v4;
        v34 = v36;
        dispatch_async(v39, v41);

        v35 = v43;
      }

      v21 = 0;
    }
    goto LABEL_17;
  }
LABEL_18:

}

- (void)globalPerUserBoundaryKeyDataWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_synchronizeQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1BEA7B8BC;
  v9[3] = &unk_1E782F4D0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (BOOL)serviceTypeIsManatee:(unint64_t)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char IsManatee;
  BOOL v11;

  objc_msgSend_identityManager(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_PCSServiceStringFromCKServiceType_(v5, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    IsManatee = PCSServiceItemTypeIsManatee();
  else
    IsManatee = objc_msgSend_currentServiceIsManatee(self, v8, v9);
  v11 = IsManatee;

  return v11;
}

- (void)synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char isSecondaryAccount_error;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSString *responsibleBundleID;
  const char *v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSString *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD v57[8];
  _QWORD v58[8];
  _QWORD v59[5];
  id v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[3];
  char v66;
  _QWORD block[4];
  id v68;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_forceEnableReadOnlyManatee(self, v8, v9))
  {
    objc_msgSend_callbackQueue(self, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA7BDAC;
    block[3] = &unk_1E782EFD8;
    v68 = v7;
    v13 = v7;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = dispatch_group_create();
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v66 = 1;
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = sub_1BE9BAFA8;
    v63[4] = sub_1BE9BAD88;
    v64 = 0;
    v61[0] = 0;
    v61[1] = v61;
    v61[2] = 0x2020000000;
    v62 = 1;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    v59[3] = sub_1BE9BAFA8;
    v59[4] = sub_1BE9BAD88;
    v60 = 0;
    objc_msgSend_deviceContext(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountDataSecurityObserver(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isSecondaryAccount_error = objc_msgSend_isManateeAvailableForAccount_isSecondaryAccount_error_(v19, v23, (uint64_t)v22, 0, 0);

    objc_msgSend_identityManager(self, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isSecondaryAccount_error & 1) != 0)
    {
      objc_msgSend_PCSServiceStringFromCKServiceType_(v28, v27, 5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v13);
      objc_msgSend_sharedManager(CKDPCSKeySyncManager, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      responsibleBundleID = self->_responsibleBundleID;
      objc_msgSend_account(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = sub_1BEA7BF08;
      v57[3] = &unk_1E7831A98;
      v57[6] = v61;
      v37 = v57;
      v38 = v29;
      v57[4] = v38;
      v57[7] = v59;
      v57[5] = v13;
      objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v32, v39, (uint64_t)v38, 0x1E784B808, responsibleBundleID, 1, v36, 1, self, v6, v57);
    }
    else
    {
      objc_msgSend_PCSServiceStringFromCKServiceType_(v28, v27, 6);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v13);
      objc_msgSend_sharedManager(CKDPCSKeySyncManager, v41, v42);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = self->_responsibleBundleID;
      objc_msgSend_account(self, v44, v45);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = sub_1BEA7BDC8;
      v58[3] = &unk_1E7831A98;
      v58[6] = v65;
      v37 = v58;
      v38 = v40;
      v58[4] = v38;
      v58[7] = v63;
      v58[5] = v13;
      objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v32, v46, (uint64_t)v38, 0x1E784B808, v43, 0, v36, 1, self, v6, v58);
    }

    objc_msgSend_callbackQueue(self, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = sub_1BEA7C048;
    v51[3] = &unk_1E7831AC0;
    v52 = v7;
    v53 = v65;
    v54 = v61;
    v55 = v59;
    v56 = v63;
    v50 = v7;
    dispatch_group_notify(v13, v49, v51);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(v61, 8);
    _Block_object_dispose(v63, 8);

    _Block_object_dispose(v65, 8);
  }

}

- (void)synchronizeUserKeyRegistryForServiceType:(unint64_t)a3 shouldThrottle:(BOOL)a4 context:(id)a5 requestorOperationID:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t IsManatee;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSString *responsibleBundleID;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  _QWORD v34[5];
  id v35;
  _QWORD block[4];
  id v37;

  v9 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend_forceEnableReadOnlyManatee(self, v15, v16))
  {
    objc_msgSend_callbackQueue(self, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA7C260;
    block[3] = &unk_1E782EFD8;
    v37 = v14;
    v20 = v14;
    dispatch_async(v19, block);

    v21 = v37;
  }
  else
  {
    objc_msgSend_identityManager(self, v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_PCSServiceStringFromCKServiceType_(v22, v23, a3);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    IsManatee = objc_msgSend_serviceTypeIsManatee_(self, v24, a3);
    objc_msgSend_sharedManager(CKDPCSKeySyncManager, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    responsibleBundleID = self->_responsibleBundleID;
    objc_msgSend_account(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1BEA7C280;
    v34[3] = &unk_1E7831B10;
    v34[4] = self;
    v35 = v14;
    v21 = v14;
    objc_msgSend_syncUserKeysForService_context_bundleID_serviceIsManatee_account_shouldThrottle_testOverrideProvider_requestorOperationID_completionHandler_(v28, v33, (uint64_t)v20, v12, responsibleBundleID, IsManatee, v32, v9, self, v13, v34);

  }
}

- (void)sendCoreAnalyticsEventForKeySync:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[9];
  _QWORD v95[11];

  v95[9] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_serviceName(v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_22;
  v9 = (void *)v6;
  objc_msgSend_shouldThrottle(v3, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_21:

    goto LABEL_22;
  }
  v13 = (void *)v10;
  objc_msgSend_isManatee(v3, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_20:

    goto LABEL_21;
  }
  v17 = (void *)v14;
  objc_msgSend_keySyncResult(v3, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_19:

    goto LABEL_20;
  }
  v21 = (void *)v18;
  objc_msgSend_overallResult(v3, v19, v20);
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
LABEL_18:

    goto LABEL_19;
  }
  v25 = (void *)v22;
  objc_msgSend_keySyncDurationSec(v3, v23, v24);
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
LABEL_17:

    goto LABEL_18;
  }
  v29 = (void *)v26;
  objc_msgSend_throttledDurationSec(v3, v27, v28);
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
LABEL_16:

    goto LABEL_17;
  }
  v33 = (void *)v30;
  objc_msgSend_context(v3, v31, v32);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

    goto LABEL_16;
  }
  v37 = (void *)v34;
  objc_msgSend_bundleID(v3, v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v94[0] = 0x1E7841628;
    objc_msgSend_serviceName(v3, v39, v40);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v93;
    v94[1] = 0x1E784B6E8;
    objc_msgSend_shouldThrottle(v3, v41, v42);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v92;
    v94[2] = 0x1E784B708;
    objc_msgSend_isManatee(v3, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v45;
    v94[3] = 0x1E784B728;
    objc_msgSend_keySyncResult(v3, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v48;
    v94[4] = 0x1E784B748;
    objc_msgSend_overallResult(v3, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v51;
    v94[5] = 0x1E784B768;
    objc_msgSend_keySyncDurationSec(v3, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v95[5] = v54;
    v94[6] = 0x1E784B788;
    objc_msgSend_throttledDurationSec(v3, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v95[6] = v57;
    v94[7] = 0x1E784B7A8;
    objc_msgSend_context(v3, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v95[7] = v60;
    v94[8] = 0x1E7845DA8;
    objc_msgSend_bundleID(v3, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v95[8] = v63;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v64, (uint64_t)v95, v94, 9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend_mutableCopy(v65, v66, v67);

    objc_msgSend_error(v3, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v73 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend_error(v3, v71, v72);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend_code(v74, v75, v76);
      objc_msgSend_numberWithInteger_(v73, v78, v77);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v80, (uint64_t)v79, 0x1E784B488);

      objc_msgSend_error(v3, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      CKErrorChainStringFromError();
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v85, (uint64_t)v84, 0x1E784B4A8);

    }
    objc_msgSend_KRSReturnedExistingIdentity(v3, v71, v72);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      objc_msgSend_KRSReturnedExistingIdentity(v3, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v9, v90, (uint64_t)v89, 0x1E784B828);

    }
    v91 = (void *)objc_msgSend_copy(v9, v87, v88);
    AnalyticsSendEvent();

    goto LABEL_21;
  }
LABEL_22:

}

- (void)_onSynchronizeQueue:(id)a3
{
  void (*v5)(void);
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;

  if (dispatch_get_specific("com.apple.cloudkit.pcsmanager.queue"))
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v9 = a3;
    v5();
  }
  else
  {
    v6 = a3;
    objc_msgSend_synchronizeQueue(self, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v9, v6);

  }
}

+ (id)etagFromPCSData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  uint64_t v8;
  CC_LONG v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  LODWORD(v17) = 0;
  v3 = a3;
  v6 = (const void *)objc_msgSend_bytes(v3, v4, v5, 0, 0, v17, v18);
  v9 = objc_msgSend_length(v3, v7, v8);

  CC_SHA1(v6, v9, (unsigned __int8 *)&v16);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)&v16, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKUppercaseHexStringWithoutSpaces(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)protectionIdentifierFromShareProtection:(_OpaquePCSShareProtection *)a3
{
  void *v3;
  const char *v4;

  if (!a3)
    return 0;
  v3 = (void *)PCSFPGetCurrentMasterKeyID();
  objc_msgSend_subdataWithRange_(v3, v4, 0, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allProtectionIdentifiersFromShareProtection:(_OpaquePCSShareProtection *)a3
{
  void *v3;
  const char *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)PCSFPCopyAvailableMasterKeyIDs();
    objc_msgSend_CKMap_(v3, v4, (uint64_t)&unk_1E7831B50);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isKeyRollingUnitTestContainerID:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 5235, CFSTR("Only suitable for testing"));

  }
  if (qword_1ED702798 != -1)
    dispatch_once(&qword_1ED702798, &unk_1E7831B70);
  objc_msgSend_containerIdentifier(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)qword_1ED702790;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        if ((objc_msgSend_hasPrefix_(v8, v11, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18) & 1) != 0)
        {
          LOBYTE(v12) = 1;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  return v12;
}

+ (id)pcsOverrideKeys
{
  uint64_t v2;
  void *v6;
  const char *v7;

  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, a1, CFSTR("CKDPCSManager.m"), 5258, CFSTR("Only suitable for testing"));

  }
  if (qword_1ED7027A8 != -1)
    dispatch_once(&qword_1ED7027A8, &unk_1E7831B90);
  return (id)qword_1ED7027A0;
}

- (void)addEntriesForUnitTestOverrides:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 5292, CFSTR("Only suitable for testing"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEA7CDDC;
  v12[3] = &unk_1E782EE20;
  v12[4] = self;
  v13 = v7;
  v8 = v7;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v12);

}

- (BOOL)_checkAndClearPCSTestOverrideForKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  char v10;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 5311, CFSTR("Only suitable for testing"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA7D124;
  v14[3] = &unk_1E7831BB8;
  v16 = &v17;
  v14[4] = self;
  v8 = v7;
  v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)_checkPCSTestOverrideForKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  char v10;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 5321, CFSTR("Only suitable for testing"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA7D2CC;
  v14[3] = &unk_1E7831BB8;
  v16 = &v17;
  v14[4] = self;
  v8 = v7;
  v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_pcsTestOverrideForKey:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  const char *v9;
  id v10;
  void *v12;
  const char *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  if (!*MEMORY[0x1E0C95280])
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, CFSTR("CKDPCSManager.m"), 5330, CFSTR("Only suitable for testing"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1BE9BAFA8;
  v21 = sub_1BE9BAD88;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1BEA7D470;
  v14[3] = &unk_1E7831BB8;
  v16 = &v17;
  v14[4] = self;
  v8 = v7;
  v15 = v8;
  objc_msgSend__onSynchronizeQueue_(self, v9, (uint64_t)v14);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  objc_msgSend_sharedNotifier(CKDPCSNotifier, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearContextIfUnnecessaryForManagerUUID_(v4, v8, (uint64_t)v7);

  v9.receiver = self;
  v9.super_class = (Class)CKDPCSManager;
  -[CKDPCSManager dealloc](&v9, sel_dealloc);
}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (CKDPCSIdentityManager)identityManager
{
  return self->_identityManager;
}

- (CKDAccount)account
{
  return (CKDAccount *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)undecryptablePCSDataHashes
{
  return self->_undecryptablePCSDataHashes;
}

- (void)setUndecryptablePCSDataHashes:(id)a3
{
  objc_storeStrong((id *)&self->_undecryptablePCSDataHashes, a3);
}

- (NSData)boundaryKeyData
{
  return self->_boundaryKeyData;
}

- (void)setBoundaryKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryKeyData, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setLastMissingManateeIdentityErrorDateForCurrentService:(id)a3
{
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDateForCurrentService, a3);
}

- (CKDContainerScopedUserIDProvider)containerScopedUserIDProvider
{
  return (CKDContainerScopedUserIDProvider *)objc_loadWeakRetained((id *)&self->_containerScopedUserIDProvider);
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSString)responsibleBundleID
{
  return self->_responsibleBundleID;
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (unint64_t)mmcsEncryptionSupport
{
  return self->_mmcsEncryptionSupport;
}

- (BOOL)useZoneWidePCS
{
  return self->_useZoneWidePCS;
}

- (void)setSynchronizeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizeQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (NSMutableDictionary)pcsTestOverrides
{
  return self->_pcsTestOverrides;
}

- (void)setPcsTestOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_pcsTestOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsTestOverrides, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_responsibleBundleID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_destroyWeak((id *)&self->_containerScopedUserIDProvider);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDateForCurrentService, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_boundaryKeyData, 0);
  objc_storeStrong((id *)&self->_undecryptablePCSDataHashes, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_identityManager, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end
