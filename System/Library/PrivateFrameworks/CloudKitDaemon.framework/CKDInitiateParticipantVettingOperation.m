@implementation CKDInitiateParticipantVettingOperation

- (CKDInitiateParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDInitiateParticipantVettingOperation *v9;
  uint64_t v10;
  CKShareMetadata *shareMetadata;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *participantID;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *address;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDInitiateParticipantVettingOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v21, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_shareMetadata(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    shareMetadata = v9->_shareMetadata;
    v9->_shareMetadata = (CKShareMetadata *)v10;

    objc_msgSend_participantID(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    participantID = v9->_participantID;
    v9->_participantID = (NSString *)v14;

    objc_msgSend_address(v6, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    address = v9->_address;
    v9->_address = (NSString *)v18;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/vetting-initiate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_handleVettingInitiationProgress:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, const char *, uint64_t);
  void *v13;
  CKDInitiateParticipantVettingOperation *v14;
  id v15;

  v4 = a3;
  objc_msgSend_callbackQueue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = sub_1BEAF8808;
  v13 = &unk_1E782EE20;
  v14 = self;
  v15 = v4;
  v8 = v4;
  dispatch_async(v7, &v10);

  objc_msgSend_setError_(self, v9, (uint64_t)v8, v10, v11, v12, v13, v14);
}

- (id)_encryptedKeyDataWithShareMetadata:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  os_log_t *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v30;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (os_log_t *)MEMORY[0x1E0C952B0];
  v9 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v12 = v9;
    objc_msgSend_share(v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v18;
    _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Preparing encrypted key for vetting: adding ourselves to the public PCS for share %@", (uint8_t *)&v31, 0xCu);

  }
  objc_msgSend_share(v6, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addSelfIdentityToShareMetadataPublicPCS_forShareWithURL_error_(self, v23, (uint64_t)v6, v22, a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v30 = *a4;
      v31 = 138412290;
      v32 = v30;
      _os_log_error_impl(&dword_1BE990000, v27, OS_LOG_TYPE_ERROR, "Unable to generate encrypted key to initiate share vetting: %@", (uint8_t *)&v31, 0xCu);
    }
    v28 = 0;
  }
  else
  {
    objc_msgSend_publicPCSData(v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (id)_addSelfIdentityToShareMetadataPublicPCS:(id)a3 forShareWithURL:(id)a4 error:(id *)a5
{
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  _QWORD *v21;
  os_log_t *v22;
  void *v23;
  void *v24;
  os_log_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  _QWORD *v56;
  os_log_t *v57;
  NSObject *v58;
  NSObject *v59;
  const char *v60;
  os_log_t v61;
  const void *v62;
  NSObject **v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  const char *v69;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  NSObject **v77;
  NSObject *v78;
  BOOL v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  uint8_t buf[4];
  id v105;
  __int16 v106;
  id v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_container(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicProtectionData(v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v21 = (_QWORD *)MEMORY[0x1E0C95300];
  v22 = (os_log_t *)MEMORY[0x1E0C952B0];
  if (!v18)
  {

    goto LABEL_17;
  }
  v23 = (void *)v18;
  objc_msgSend_privateToken(v8, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
LABEL_17:
    if (*v21 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v59 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v9;
      _os_log_impl(&dword_1BE990000, v59, OS_LOG_TYPE_INFO, "Share metadata for the share at URL %@ doesn't have protection data on it, skipping", buf, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v60, *MEMORY[0x1E0C94B20], 5001, CFSTR("Share metadata for the share at URL %@ doesn't have protection data on it"), v9);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (*v21 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v25 = *v22;
  if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
  {
    v28 = v25;
    objc_msgSend_privateToken(v8, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v105 = v9;
    v106 = 2112;
    v107 = v31;
    _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, "Preparing public PCS metadata for share at URL %@ using public sharing token %@", buf, 0x16u);

  }
  objc_msgSend_pcsManager(v12, v26, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(v8, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v37 = (const void *)objc_msgSend_createSharingIdentityFromData_error_(v32, v36, (uint64_t)v35, &v103);
  v38 = v103;

  if (!v37 || v38)
  {
    if (*v21 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v61 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      v82 = v61;
      objc_msgSend_privateToken(v8, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v105 = v85;
      v106 = 2112;
      v107 = v38;
      _os_log_error_impl(&dword_1BE990000, v82, OS_LOG_TYPE_ERROR, "Couldn't create a sharing public identity from %@: %@", buf, 0x16u);

      if (!v37)
        goto LABEL_34;
    }
    else if (!v37)
    {
LABEL_34:
      v65 = 0;
      v66 = 0;
      goto LABEL_35;
    }
    v62 = v37;
LABEL_33:
    CFRelease(v62);
    goto LABEL_34;
  }
  objc_msgSend_pcsManager(v12, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v8, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicProtectionData(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0;
  v49 = (const void *)objc_msgSend_createSharePCSFromData_sharingIdentity_error_(v41, v48, (uint64_t)v47, v37, &v102);
  v38 = v102;

  if (!v49 || v38)
  {
    v63 = (NSObject **)MEMORY[0x1E0C952B0];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v64 = *v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      v86 = v64;
      objc_msgSend_share(v8, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicProtectionData(v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v105 = v92;
      v106 = 2112;
      v107 = (id)v37;
      _os_log_error_impl(&dword_1BE990000, v86, OS_LOG_TYPE_ERROR, "Couldn't create a public PCS from the PCS data %{public}@ for identity %@", buf, 0x16u);

    }
    CFRelease(v37);
    if (!v49)
      goto LABEL_34;
    v62 = v49;
    goto LABEL_33;
  }
  objc_msgSend_pcsManager(v12, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addIdentityForService_toPCS_(v52, v53, 2, v49);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v56 = (_QWORD *)MEMORY[0x1E0C95300];
  if (v38)
  {
    v57 = (os_log_t *)MEMORY[0x1E0C952B0];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v58 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v105 = v9;
      v106 = 2112;
      v107 = v38;
      _os_log_error_impl(&dword_1BE990000, v58, OS_LOG_TYPE_ERROR, "Couldn't add our self identity to the public PCS for share at URL %@: %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend_pcsManager(v12, v54, v55);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = 0;
    objc_msgSend_dataFromSharePCS_pcsBlobType_error_(v71, v72, (uint64_t)v49, 0, &v101);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v101;

    if (v66 && !v38)
    {
      objc_msgSend_pcsManager(v12, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0;
      objc_msgSend_etagFromSharePCS_error_(v75, v76, (uint64_t)v49, &v100);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v100;

      if (!v65 || v38)
      {
        v77 = (NSObject **)MEMORY[0x1E0C952B0];
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v78 = *v77;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v93 = v78;
          objc_msgSend_share(v8, v94, v95);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(v99, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v105 = v98;
          _os_log_error_impl(&dword_1BE990000, v93, OS_LOG_TYPE_ERROR, "Couldn't get an etag for public PCS data on share %@", buf, 0xCu);

        }
        v65 = 0;
        v66 = 0;
      }
      v57 = (os_log_t *)MEMORY[0x1E0C952B0];
      goto LABEL_57;
    }
    v79 = *v56 == -1;
    v57 = (os_log_t *)MEMORY[0x1E0C952B0];
    if (!v79)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v80 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v105 = v9;
      v106 = 2112;
      v107 = v38;
      _os_log_error_impl(&dword_1BE990000, v80, OS_LOG_TYPE_ERROR, "Couldn't serialize share public PCS for share at URL %@: %@", buf, 0x16u);
    }

  }
  v65 = 0;
  v66 = 0;
LABEL_57:
  CFRelease(v37);
  CFRelease(v49);
  if (v66)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v81 = *v57;
    if (os_log_type_enabled(*v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v105 = v9;
      _os_log_impl(&dword_1BE990000, v81, OS_LOG_TYPE_INFO, "Successfully added our public identity to the share's public PCS at %@", buf, 0xCu);
    }
  }
LABEL_35:
  if (a5)
    *a5 = objc_retainAutorelease(v38);
  if (v66)
  {
    v67 = (void *)objc_opt_new();
    objc_msgSend_setPublicPCSData_(v67, v68, (uint64_t)v66);
    objc_msgSend_setPublicPCSEtag_(v67, v69, (uint64_t)v65);
  }
  else
  {
    v67 = 0;
  }

  return v67;
}

- (void)main
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
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
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareMetadata(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v7 = (void *)v4,
        objc_msgSend_participantID(self, v5, v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend_length(v8, v9, v10),
        v8,
        v7,
        !v11))
  {
    objc_msgSend_finishWithError_(self, v5, 0);
    return;
  }
  objc_msgSend_encryptedKey(self, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_shareMetadata(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend__encryptedKeyDataWithShareMetadata_error_(self, v17, (uint64_t)v16, &v49);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v49;
    objc_msgSend_setEncryptedKey_(self, v20, (uint64_t)v18);

    objc_msgSend_encryptedKey(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v48 = (void *)MEMORY[0x1E0C94FF8];
      v25 = *MEMORY[0x1E0C94B20];
      v50 = *MEMORY[0x1E0CB3388];
      v51[0] = v19;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v51, &v50, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareMetadata(self, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareMetadata(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateToken(v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_shareMetadata(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicProtectionData(v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v48, v45, v25, 5005, v26, CFSTR("Unable to create public PCS blob using metadata %@ (private token was: %@, share's public PCS blob was %@)"), v29, v35, v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v47, (uint64_t)v46);

      return;
    }

  }
  objc_msgSend__sendRequest_(self, v14, 0);
}

- (int)operationType
{
  return 513;
}

- (void)_sendRequest:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CKDInitiateParticipantVettingURLRequest *v6;
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
  void *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const __CFString *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[6];
  id v43;
  BOOL v44;
  id from;
  id location;
  __int128 buf;
  uint64_t v48;
  char v49;
  uint64_t v50;

  v3 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v5 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v38 = CFSTR("first");
    if (v3)
      v38 = CFSTR("second");
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v38;
    _os_log_debug_impl(&dword_1BE990000, v5, OS_LOG_TYPE_DEBUG, "Sending initiate vetting request, this is a %{public}@ attempt", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v49 = 1;
  v6 = [CKDInitiateParticipantVettingURLRequest alloc];
  objc_msgSend_shareMetadata(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedKey(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_participantID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareMetadata(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_baseToken(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend_initWithOperation_shareRecordID_encryptedKey_participantID_baseToken_(v6, v28, (uint64_t)self, v15, v18, v21, v27);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v29);
  v30 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BEAF985C;
  v42[3] = &unk_1E7833448;
  objc_copyWeak(&v43, &location);
  v44 = v3;
  v42[4] = self;
  v42[5] = &buf;
  objc_msgSend_setVettingInitiationRequestCompletionBlock_(v29, v31, (uint64_t)v42);
  v39[0] = v30;
  v39[1] = 3221225472;
  v39[2] = sub_1BEAF9D90;
  v39[3] = &unk_1E7833470;
  v39[4] = &buf;
  objc_copyWeak(&v40, &location);
  objc_copyWeak(&v41, &from);
  objc_msgSend_setCompletionBlock_(v29, v32, (uint64_t)v39);
  objc_msgSend_setRequest_(self, v33, (uint64_t)v29);
  objc_msgSend_container(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v36, v37, (uint64_t)v29);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setParticipantVettingProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDInitiateParticipantVettingOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)participantVettingProgressBlock
{
  return self->_participantVettingProgressBlock;
}

- (void)setParticipantVettingProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadata, a3);
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedKey, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong(&self->_participantVettingProgressBlock, 0);
}

@end
