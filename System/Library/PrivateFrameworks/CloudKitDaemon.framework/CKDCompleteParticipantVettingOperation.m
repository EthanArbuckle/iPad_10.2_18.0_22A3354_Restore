@implementation CKDCompleteParticipantVettingOperation

- (CKDCompleteParticipantVettingOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDCompleteParticipantVettingOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *vettingToken;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *vettingEmail;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *vettingPhone;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *routingKey;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSData *encryptedKey;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *baseToken;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  NSString *displayedHostname;
  objc_super v58;

  v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)CKDCompleteParticipantVettingOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v58, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_vettingToken(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_copy(v10, v11, v12);
    vettingToken = v9->_vettingToken;
    v9->_vettingToken = (NSString *)v13;

    objc_msgSend_vettingEmail(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_copy(v17, v18, v19);
    vettingEmail = v9->_vettingEmail;
    v9->_vettingEmail = (NSString *)v20;

    objc_msgSend_vettingPhone(v6, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_copy(v24, v25, v26);
    vettingPhone = v9->_vettingPhone;
    v9->_vettingPhone = (NSString *)v27;

    objc_msgSend_routingKey(v6, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_copy(v31, v32, v33);
    routingKey = v9->_routingKey;
    v9->_routingKey = (NSString *)v34;

    objc_msgSend_encryptedKey(v6, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_copy(v38, v39, v40);
    encryptedKey = v9->_encryptedKey;
    v9->_encryptedKey = (NSData *)v41;

    objc_msgSend_baseToken(v6, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_copy(v45, v46, v47);
    baseToken = v9->_baseToken;
    v9->_baseToken = (NSString *)v48;

    objc_msgSend_displayedHostname(v6, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_copy(v52, v53, v54);
    displayedHostname = v9->_displayedHostname;
    v9->_displayedHostname = (NSString *)v55;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/verify-share-vetting", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__reconstructShortToken(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__performAuthKitVerification(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__forceFetchShareMetadata(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__reconstructShareURL(self, v11, v12);
      break;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__verifyOONParticipant(self, v13, v14);
      break;
    case 6:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v18, (uint64_t)v17);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  __CFString *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v4 = CFSTR("Vetting with AuthKit");
  switch(a3)
  {
    case 1uLL:
      objc_msgSendSuper2(&v8, sel_nameForState_, 1, v6.receiver, v6.super_class, v7.receiver, v7.super_class, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation);
      goto LABEL_10;
    case 2uLL:
      return CFSTR("Reconstructing short token");
    case 3uLL:
      return v4;
    case 4uLL:
      return CFSTR("Force fetching share metadata");
    case 5uLL:
      return CFSTR("Reconstructing share URL");
    case 6uLL:
      return CFSTR("Verifying OON key can be swapped");
    default:
      if (a3 == 0xFFFFFFFF)
        objc_msgSendSuper2(&v7, sel_nameForState_, 0xFFFFFFFFLL, v6.receiver, v6.super_class, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation, v8.receiver, v8.super_class);
      else
        objc_msgSendSuper2(&v6, sel_nameForState_, a3, a1, &OBJC_METACLASS___CKDCompleteParticipantVettingOperation, v7.receiver, v7.super_class, v8.receiver, v8.super_class);
LABEL_10:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
  }
}

- (id)shortSharingTokenFromFullToken:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  CC_LONG v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v6 = (const void *)objc_msgSend_UTF8String(v3, v4, v5, 0, 0, 0, 0);
  v8 = objc_msgSend_lengthOfBytesUsingEncoding_(v3, v7, 4);

  CC_SHA256(v6, v8, (unsigned __int8 *)&v15);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)&v15, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKBase64URLSafeString(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)shortSharingTokenFromData:(id)a3
{
  return (id)objc_msgSend_CKBase64URLSafeString(a3, a2, (uint64_t)a3);
}

- (void)_reconstructShortToken
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
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
  _QWORD v27[6];
  id v28;
  id location;
  _QWORD v30[5];
  id v31;

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_1BE9BAFC8;
  v30[4] = sub_1BE9BAD98;
  v31 = 0;
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_accountType(v7, v8, v9);

  if (v10 == 1)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v11, *MEMORY[0x1E0C94B20], 1002, CFSTR("This request requires an authenticated account"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v13, (uint64_t)v12);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend_stateTransitionGroup(self, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v16);

    objc_msgSend_container(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedKey(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1BEA91AA0;
    v27[3] = &unk_1E7832170;
    objc_copyWeak(&v28, &location);
    v27[4] = self;
    v27[5] = v30;
    objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v22, v26, (uint64_t)v25, 0, 2, v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(v30, 8);

}

- (void)_performAuthKitVerification
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  CKDCompleteParticipantVettingOperation *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
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
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  _QWORD v41[7];
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  CKDCompleteParticipantVettingOperation *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_msgSend_vettingToken(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_account(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_1BE990000, v5, OS_LOG_TYPE_INFO, "Performing vetting on token: %{public}@, for: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v43 = sub_1BE9BAFC8;
  v44 = sub_1BE9BAD98;
  v18 = self;
  v45 = v18;
  objc_msgSend_stateTransitionGroup(v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v21);

  objc_msgSend_container(v18, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_account(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vettingToken(v18, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vettingEmail(v18, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vettingPhone(v18, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v18, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = sub_1BEA920E8;
  v41[3] = &unk_1E7832198;
  v41[4] = v18;
  v41[5] = buf;
  v41[6] = a2;
  objc_msgSend_validateVettingToken_vettingEmail_vettingPhone_container_completionHandler_(v27, v40, (uint64_t)v30, v33, v36, v39, v41);

  _Block_object_dispose(buf, 8);
}

- (void)_forceFetchShareMetadata
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  _QWORD v23[5];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = *MEMORY[0x1E0C95370];
  objc_msgSend_routingKey(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortToken(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v13, (uint64_t)CFSTR("https://%@/share/%@%@"), v6, v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v4, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v16;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareURLsToFetch_(v3, v19, (uint64_t)v18);

  objc_msgSend_setShouldFetchRootRecord_(v3, v20, 0);
  v21 = objc_opt_class();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1BEA92490;
  v23[3] = &unk_1E782E508;
  v23[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v22, v21, v3, v23);

}

- (void)_reconstructShareURL
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;

  objc_msgSend_shareMetadata(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E0C94A80]);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_shareMetadata(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, *MEMORY[0x1E0C94A88]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C95048];
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_routingKey(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shortToken(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v24, v31, (uint64_t)CFSTR("%@%@"), v27, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayedHostname(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_shareURLWithShortToken_shareTitle_shareType_containerID_displayedHostname_(v23, v36, (uint64_t)v32, v42, v16, v22, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_verifyProgressURLReconstructedBlock(self, v38, v39);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v37);

}

- (void)_verifyOONParticipant
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
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
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
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
  void *v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  SEL v89;
  CKDCompleteParticipantVettingOperation *v90;
  id v91;
  void *v92;
  _QWORD v93[5];
  id v94;
  id v95;
  SEL v96;
  id v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareMetadata(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callingParticipant(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(v5, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  v14 = (void *)v11;
  objc_msgSend_callingParticipant(v5, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outOfNetworkPrivateKey(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v89 = a2;
    v92 = v8;
    objc_msgSend_container(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_callingParticipant(v5, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userIdentity(v30, v31, v32);
    v90 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outOfNetworkPrivateKey(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_privateToken(v5, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_callingParticipant(v5, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionInfo(v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0;
    objc_msgSend_createProtectionInfoFromOONPrivateKey_privateToken_OONProtectionInfo_error_(v27, v46, (uint64_t)v36, v39, v45, &v97);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v97;

    if (v47)
    {
      objc_msgSend_stateTransitionGroup(v90, v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v50);

      objc_msgSend_container(v90, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v5, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invitedProtectionData(v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = sub_1BEA92F54;
      v93[3] = &unk_1E7832210;
      v96 = v89;
      v93[4] = v90;
      v8 = v92;
      v94 = v92;
      v95 = v5;
      objc_msgSend_canDecryptInvitedProtectionData_participantProtectionInfo_serviceType_completionHandler_(v56, v63, (uint64_t)v62, v47, 2, v93);

      v64 = v91;
    }
    else
    {
      v64 = v91;
      v8 = v92;
      if (!v91)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v88, (uint64_t)v89, v90, CFSTR("CKDCompleteParticipantVettingOperation.m"), 290, CFSTR("OON key-swap failed, but without error"));

      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v73 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        v77 = v73;
        objc_msgSend_participantID(v92, v78, v79);
        v80 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_share(v5, v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v83, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v99 = v80;
        v100 = 2112;
        v101 = v86;
        v102 = 2112;
        v103 = v91;
        _os_log_error_impl(&dword_1BE990000, v77, OS_LOG_TYPE_ERROR, "Failed to create protection info in OON key-swap for participantID: %@, recordID: %@, error: %@", buf, 0x20u);

      }
      objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v74, *MEMORY[0x1E0C94B20], 8009, v91, CFSTR("Dryrun OON keyswap failed"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v90, v76, (uint64_t)v75);

    }
  }
  else
  {
LABEL_5:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v65 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v67 = v65;
      objc_msgSend_privateToken(v5, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = "outOfNetworkPrivateKey";
      if (!v70)
        v71 = "privateToken";
      *(_DWORD *)buf = 136315138;
      v99 = v71;
      _os_log_impl(&dword_1BE990000, v67, OS_LOG_TYPE_INFO, "OON keyswap: Not swapping OON keys as %s is missing", buf, 0xCu);

    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v66, *MEMORY[0x1E0C94B20], 8009, CFSTR("We don't have the necessary keys to perform an OON key swap"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v72, (uint64_t)v64);
  }

}

- (void)main
{
  uint64_t v2;
  void *v4;
  _BOOL8 v5;
  const char *v6;

  objc_msgSend_vettingToken(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  objc_msgSend_makeStateTransition_(self, v6, v5);
}

- (id)verifyProgressURLReconstructedBlock
{
  return self->_verifyProgressURLReconstructedBlock;
}

- (void)setVerifyProgressURLReconstructedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (id)verifyProgressShareMetadataFetchedBlock
{
  return self->_verifyProgressShareMetadataFetchedBlock;
}

- (void)setVerifyProgressShareMetadataFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (NSString)shortToken
{
  return self->_shortToken;
}

- (void)setShortToken:(id)a3
{
  objc_storeStrong((id *)&self->_shortToken, a3);
}

- (CKShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_shareMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shortToken, 0);
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);
  objc_storeStrong((id *)&self->_vettingToken, 0);
  objc_storeStrong(&self->_verifyProgressShareMetadataFetchedBlock, 0);
  objc_storeStrong(&self->_verifyProgressURLReconstructedBlock, 0);
}

@end
