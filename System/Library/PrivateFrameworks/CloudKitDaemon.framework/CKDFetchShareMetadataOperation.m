@implementation CKDFetchShareMetadataOperation

- (CKDFetchShareMetadataOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchShareMetadataOperation *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *shareURLsToFetch;
  uint64_t v15;
  NSMutableDictionary *shareTokenMetadatasToFetchByURL;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSSet *rootRecordDesiredKeysSet;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *shareInvitationTokensByShareURL;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDFetchShareMetadataOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v39, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_shareURLsToFetch(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_mutableCopy(v10, v11, v12);
    shareURLsToFetch = v9->_shareURLsToFetch;
    v9->_shareURLsToFetch = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    shareTokenMetadatasToFetchByURL = v9->_shareTokenMetadatasToFetchByURL;
    v9->_shareTokenMetadatasToFetchByURL = (NSMutableDictionary *)v15;

    objc_msgSend_rootRecordDesiredKeys(v6, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v22 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_rootRecordDesiredKeys(v6, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23);
      v25 = objc_claimAutoreleasedReturnValue();
      rootRecordDesiredKeysSet = v9->_rootRecordDesiredKeysSet;
      v9->_rootRecordDesiredKeysSet = (NSSet *)v25;

    }
    v9->_shouldFetchRootRecord = objc_msgSend_shouldFetchRootRecord(v6, v20, v21);
    v9->_overwriteContainerPCSServiceIfManatee = objc_msgSend_overwriteContainerPCSServiceIfManatee(v6, v27, v28);
    v9->_skipShareDecryption = objc_msgSend_skipShareDecryption(v6, v29, v30);
    objc_msgSend_shareInvitationTokensByShareURL(v6, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_copy(v33, v34, v35);
    shareInvitationTokensByShareURL = v9->_shareInvitationTokensByShareURL;
    v9->_shareInvitationTokensByShareURL = (NSDictionary *)v36;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-share-metadata", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int)operationType
{
  return 216;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v4 = objc_msgSend_state(self, a2, v2);
  switch(v4)
  {
    case 3:
      objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);

      break;
    case 2:
      objc_msgSend_setState_(self, v5, 3);
      objc_msgSend__fetchShortTokenMetadata(self, v12, v13);
      break;
    case 1:
      objc_msgSend_setState_(self, v5, 2);
      objc_msgSend__prepareShortTokens(self, v6, v7);
      break;
  }
  return 1;
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
    return CFSTR("Preparing Short Tokens");
  if (a3 == 3)
  {
    v5 = CFSTR("Retrieving Share Metadata");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchShareMetadataOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 withMetadata:(id)a4 error:(id)a5
{
  void *v5;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  int v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t hasProtectionDataEntitlement;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  char hasOutOfProcessUIEntitlement;
  uint64_t hasParticipantPIIEntitlement;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  _QWORD block[5];
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (!v9)
    goto LABEL_29;
  v14 = objc_msgSend_errorOnOON(self, v11, v12);
  if (!v13 && v14)
  {
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(v20, v21, v22) & 1) == 0
      && objc_msgSend_participantPermission(v10, v23, v24) == 1)
    {
      objc_msgSend_outOfNetworkMatches(v10, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v27, v28, v29))
      {
        objc_msgSend_share(v10, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_publicPermission(v32, v33, v34);

        if (v35 <= 1)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v15, *MEMORY[0x1E0C94B20], 8013, CFSTR("The user is not able to access this share"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v36 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v91;
            _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Third party process requested OON share metadata, returning error %@", buf, 0xCu);
          }
          v10 = 0;
          goto LABEL_17;
        }
        goto LABEL_16;
      }

    }
LABEL_16:
    v91 = 0;
    goto LABEL_17;
  }
  v91 = v13;
LABEL_17:
  objc_msgSend_container(self, v15, v16);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v40, v41, v42);
  objc_msgSend_share(v10, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSerializeProtectionData_(v46, v47, hasProtectionDataEntitlement);

  objc_msgSend_container(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v53, v54, v55);
  if ((hasOutOfProcessUIEntitlement & 1) != 0)
  {
    hasParticipantPIIEntitlement = 1;
  }
  else
  {
    objc_msgSend_container(self, v56, v57);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v46, v60, v61);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v5, v62, v63);
  }
  objc_msgSend_share(v10, v56, v57);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSerializePersonalInfo_(v64, v65, hasParticipantPIIEntitlement);

  if ((hasOutOfProcessUIEntitlement & 1) == 0)
  {

  }
  objc_msgSend_shareInvitationTokensByShareURL(self, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v68, v69, (uint64_t)v9);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v70 && !v91)
    objc_msgSend_setInvitationToken_(v10, v71, (uint64_t)v70);
  objc_msgSend_shareURLsToFetch(self, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v73);
  objc_msgSend_shareURLsToFetch(self, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v76, v77, (uint64_t)v9);

  objc_sync_exit(v73);
  objc_msgSend_shareTokenMetadatasToFetchByURL(self, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v80);
  objc_msgSend_shareTokenMetadatasToFetchByURL(self, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v83, v84, (uint64_t)v9);

  objc_sync_exit(v80);
  objc_msgSend_shareMetadataFetchedBlock(self, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    objc_msgSend_callbackQueue(self, v88, v89);
    v90 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEA7DED8;
    block[3] = &unk_1E782F4A8;
    block[4] = self;
    v93 = v9;
    v94 = v10;
    v95 = v91;
    dispatch_async(v90, block);

  }
  v13 = v91;
LABEL_29:

}

- (id)_decodeProtectedFullToken:(id)a3 tokenMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  dispatch_block_t *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  os_log_t *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  const char *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  id v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C95110];
  objc_msgSend_shortSharingTokenData(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decryptFullToken_shortSharingTokenData_(v7, v11, (uint64_t)v5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (uint64_t *)MEMORY[0x1E0C95300];
  if (v12)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = objc_msgSend_bytes(v12, v15, v16);
    v20 = objc_msgSend_length(v12, v18, v19);
    v22 = (void *)objc_msgSend_initWithBytes_length_encoding_(v14, v21, v17, v20, 4);
    v25 = objc_msgSend_length(v22, v23, v24);
    v26 = (dispatch_block_t *)MEMORY[0x1E0C952F8];
    v27 = (void *)*MEMORY[0x1E0C952F8];
    v28 = *v13;
    if (v25 <= 4)
    {
      if (v28 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v27);
      v29 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v77 = (uint64_t)v22;
        _os_log_impl(&dword_1BE990000, v29, OS_LOG_TYPE_INFO, "Warn: Invalid full token length: %@", buf, 0xCu);
      }
      v30 = 0;
      goto LABEL_35;
    }
    if (v28 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v27);
    v32 = (os_log_t *)MEMORY[0x1E0C952B0];
    v33 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v77 = (uint64_t)v22;
      _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "Got a full token of %@", buf, 0xCu);
    }
    v35 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_substringToIndex_(v22, v34, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDataFromBase64URLSafeString_(v35, v37, (uint64_t)v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v43 = *(unsigned __int8 *)objc_msgSend_bytes(v38, v39, v40);
      switch(v43)
      {
        case 32:
          objc_msgSend_substringFromIndex_(v22, v41, 4);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E0C99D50], v58, (uint64_t)v57);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_alloc(MEMORY[0x1E0C94C80]);
          v62 = (void *)objc_msgSend_initWithData_(v60, v61, (uint64_t)v59);
          objc_msgSend_sharingKeyBytes(v62, v63, v64);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          break;
        case 16:
          objc_msgSend_substringFromIndex_(v22, v41, 4);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E0C99D50], v65, (uint64_t)v57);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case 3:
          v44 = *(unsigned __int16 *)(objc_msgSend_bytes(v38, v41, v42) + 1);
          v45 = __rev16(v44);
          if (objc_msgSend_length(v22, v46, v47) <= (unint64_t)(v45 + 4))
          {
            if (*v13 != -1)
              dispatch_once(MEMORY[0x1E0C95300], *v26);
            v69 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              v70 = v69;
              v73 = objc_msgSend_length(v22, v71, v72);
              *(_DWORD *)buf = 134218496;
              v77 = v73;
              v78 = 1024;
              v79 = 3;
              v80 = 2048;
              v81 = v45;
              _os_log_impl(&dword_1BE990000, v70, OS_LOG_TYPE_INFO, "Warn: Invalid token header, fullTokenLength:%lu, schemeByte:0x%0x, locatorLength:%lu", buf, 0x1Cu);

            }
            v30 = 0;
            goto LABEL_34;
          }
          if (v44)
          {
            v49 = v45 + 4;
            objc_msgSend_substringWithRange_(v22, v48, 4, v45);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E0C99D50], v51, (uint64_t)v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_substringFromIndex_(v22, v53, v49);
          }
          else
          {
            v52 = 0;
            objc_msgSend_substringFromIndex_(v22, v48, v45 + 4);
          }
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E0C99D50], v75, (uint64_t)v74);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
          objc_msgSend_setPrivateTokenData_(v6, v55, (uint64_t)v56);
          objc_msgSend_setPublicTokenData_(v6, v66, (uint64_t)v52);
          v30 = v6;

LABEL_34:
LABEL_35:

          goto LABEL_36;
        default:
          if (*v13 != -1)
            dispatch_once(MEMORY[0x1E0C95300], *v26);
          v68 = *v32;
          if (os_log_type_enabled(*v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v77) = v43;
            _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Warn: Unknown scheme byte: 0x%0x", buf, 8u);
          }
          goto LABEL_28;
      }

      goto LABEL_32;
    }
    if (*v13 != -1)
      dispatch_once(MEMORY[0x1E0C95300], *v26);
    v54 = *v32;
    if (os_log_type_enabled(*v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v77 = (uint64_t)v22;
      _os_log_error_impl(&dword_1BE990000, v54, OS_LOG_TYPE_ERROR, "Couldn't decode full token header: %@", buf, 0xCu);
    }
LABEL_28:
    v56 = 0;
LABEL_32:
    v52 = 0;
    goto LABEL_33;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v31 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = (uint64_t)v5;
    _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't decrypt the protected full token: %@", buf, 0xCu);
  }
  v30 = 0;
LABEL_36:

  return v30;
}

- (void)_fetchShortTokenMetadata
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t RootRecord;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  CKDRecordResolveTokenURLRequest *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  const char *v70;
  id v71;
  const char *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  _QWORD v85[5];
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id from;
  id location;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  uint64_t v100;
  uint64_t v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v84 = (void *)objc_opt_new();
  objc_msgSend_shareTokenMetadatasToFetchByURL(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_copy(v5, v6, v7);

  if (objc_msgSend_count(v8, v9, v10))
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v83 = v8;
    objc_msgSend_allKeys(v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v95, v102, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v96 != v17)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v8, v15, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_new();
          objc_msgSend_routingKey(v20, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRoutingKey_(v21, v25, (uint64_t)v24);

          objc_msgSend_shortSharingTokenHashData(v20, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setShortSharingTokenHashData_(v21, v29, (uint64_t)v28);

          RootRecord = objc_msgSend_shouldFetchRootRecord(self, v30, v31);
          objc_msgSend_setShouldFetchRootRecord_(v21, v33, RootRecord);
          v36 = objc_msgSend_forceDSRefetch(v20, v34, v35);
          objc_msgSend_setForceDSRefetch_(v21, v37, v36);
          objc_msgSend_participantID(v20, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            objc_msgSend_participantID(v20, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setParticipantID_(v21, v44, (uint64_t)v43);

          }
          objc_msgSend_setObject_forKeyedSubscript_(v84, v41, v19, v21);

        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v95, v102, 16);
      }
      while (v16);
    }

    objc_msgSend_stateTransitionGroup(self, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v47);

    v48 = [CKDRecordResolveTokenURLRequest alloc];
    objc_msgSend_allKeys(v84, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend_initWithOperation_shortTokenLookupInfos_(v48, v52, (uint64_t)self, v51);

    v56 = objc_msgSend_shouldFetchRootRecord(self, v54, v55);
    objc_msgSend_setShouldFetchRootRecord_(v53, v57, v56);
    v58 = (void *)MEMORY[0x1E0C99E60];
    v101 = *MEMORY[0x1E0C94A00];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v59, (uint64_t)&v101, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v58, v61, (uint64_t)v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_shouldFetchRootRecord(self, v63, v64))
    {
      objc_msgSend_rootRecordDesiredKeysSet(self, v65, v66);
      v67 = objc_claimAutoreleasedReturnValue();

      v62 = (void *)v67;
    }
    objc_msgSend_setRootRecordDesiredKeySet_(v53, v65, (uint64_t)v62);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v53);
    v68 = MEMORY[0x1E0C809B0];
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = sub_1BEA7EAB4;
    v89[3] = &unk_1E7831C80;
    objc_copyWeak(&v92, &location);
    v90 = v84;
    v69 = v83;
    v91 = v69;
    objc_msgSend_setTokenResolveBlock_(v53, v70, (uint64_t)v89);
    v85[0] = v68;
    v85[1] = 3221225472;
    v85[2] = sub_1BEA7EB3C;
    v85[3] = &unk_1E7830CB0;
    objc_copyWeak(&v87, &location);
    objc_copyWeak(&v88, &from);
    v85[4] = self;
    v71 = v69;
    v86 = v71;
    objc_msgSend_setCompletionBlock_(v53, v72, (uint64_t)v85);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v73 = (id)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      v76 = objc_msgSend_count(v71, v74, v75);
      *(_DWORD *)buf = 134217984;
      v100 = v76;
      _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Fetching short share token metadata from the server for %ld URLs", buf, 0xCu);
    }

    objc_msgSend_setRequest_(self, v77, (uint64_t)v53);
    objc_msgSend_container(self, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v80, v81, (uint64_t)v53);

    objc_destroyWeak(&v88);
    objc_destroyWeak(&v87);

    objc_destroyWeak(&v92);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    v8 = v83;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v82 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v82, OS_LOG_TYPE_INFO, "We have no tokens to fetch short token metadata for. Giving up now", buf, 2u);
    }
  }

}

- (void)_handleTokenResolveWithLookupInfo:(id)a3 shareMetadata:(id)a4 responseCode:(id)a5 urlByShortTokenLookupInfos:(id)a6 tokensToFetchByURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  id v66;
  void (**v67)(_QWORD);
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  _BOOL4 v79;
  const char *v80;
  uint64_t v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  NSObject *v90;
  const char *v91;
  void *v92;
  const char *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  void (**v103)(_QWORD);
  id v104;
  _QWORD aBlock[4];
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint8_t buf[4];
  id v112;
  __int16 v113;
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v97 = v12;
  v98 = a7;
  v96 = v15;
  objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v13, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMutableURL_(v20, v21, (uint64_t)v17);

  objc_msgSend_host(v17, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(v13, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayedHostname_(v27, v28, (uint64_t)v24);

  objc_msgSend_objectForKeyedSubscript_(v98, v29, (uint64_t)v17);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    if (objc_msgSend_code(v14, v30, v31) == 1)
    {
      if (objc_msgSend_skipShareDecryption(self, v32, v33))
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v36 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v112 = v17;
          _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Skipping share decryption after getting share metadata for shareURL %@", buf, 0xCu);
        }
        objc_msgSend__performCallbackForURL_withMetadata_error_(self, v37, (uint64_t)v17, v13, 0);
        goto LABEL_31;
      }
      objc_msgSend_protectedFullToken(v13, v34, v35);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__decodeProtectedFullToken_tokenMetadata_(self, v59, (uint64_t)v58, v99);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend_shareInvitationTokensByShareURL(self, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)v17);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1BEA7F548;
        aBlock[3] = &unk_1E7831CD0;
        objc_copyWeak(&v110, (id *)buf);
        v66 = v13;
        v106 = v66;
        v107 = v99;
        v95 = v65;
        v108 = v95;
        v94 = v17;
        v109 = v94;
        v67 = (void (**)(_QWORD))_Block_copy(aBlock);
        objc_msgSend_container(self, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_options(v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_useAnonymousToServerShareParticipants(v73, v74, v75) & 1) != 0)
        {
          objc_msgSend_callingParticipant(v66, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = v78 == 0;

          if (v79)
          {
            objc_msgSend_stateTransitionGroup(self, v80, v81);
            v82 = objc_claimAutoreleasedReturnValue();
            dispatch_group_enter(v82);

            objc_msgSend_container(self, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pcsManager(v85, v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v100[0] = MEMORY[0x1E0C809B0];
            v100[1] = 3221225472;
            v100[2] = sub_1BEA7FC04;
            v100[3] = &unk_1E7831CF8;
            objc_copyWeak(&v104, (id *)buf);
            v101 = v94;
            v102 = v66;
            v103 = v67;
            objc_msgSend_findSelfParticipantOnShareMetadata_invitationToken_completionHandler_(v88, v89, (uint64_t)v102, v95, v100);

            objc_destroyWeak(&v104);
LABEL_30:

            objc_destroyWeak(&v110);
            objc_destroyWeak((id *)buf);

            goto LABEL_31;
          }
        }
        else
        {

        }
        v67[2](v67);
        goto LABEL_30;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v90 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE990000, v90, OS_LOG_TYPE_INFO, "Warn: Couldn't decode the protected full token", buf, 2u);
      }
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v91, *MEMORY[0x1E0C94B20], 5004, CFSTR("Couldn't decode the protected full token for %@"), v17);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__performCallbackForURL_withMetadata_error_(self, v93, (uint64_t)v17, 0, v92);

    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v42 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v112 = v14;
        v113 = 2112;
        v114 = v17;
        _os_log_debug_impl(&dword_1BE990000, v42, OS_LOG_TYPE_DEBUG, "Error %@ when fetching short token metadata for %@", buf, 0x16u);
      }
      v43 = (void *)MEMORY[0x1E0C94FF8];
      v44 = sub_1BEB10D5C(v14);
      objc_msgSend_request(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v47, v14);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v14, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v43, v55, *MEMORY[0x1E0C94B20], v44, v48, CFSTR("Error %@ when fetching short token metadata for %@: %@"), v14, v17, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__performCallbackForURL_withMetadata_error_(self, v57, (uint64_t)v17, 0, v56);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v112 = v17;
      v113 = 2112;
      v114 = v12;
      _os_log_impl(&dword_1BE990000, v38, OS_LOG_TYPE_INFO, "Warn: Couldn't get token metadata for URL %@ and token lookup info %@", buf, 0x16u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v39, *MEMORY[0x1E0C94B20], 1000, CFSTR("Internal error when fetching short token metadata for %@"), v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__performCallbackForURL_withMetadata_error_(self, v41, (uint64_t)v17, 0, v40);

  }
LABEL_31:

}

- (void)_continueSharePCSPrepForShareMetadata:(id)a3 shareURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
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
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id location;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_share(v6, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v14;
    v63 = 2112;
    v64 = v17;
    _os_log_impl(&dword_1BE990000, v8, OS_LOG_TYPE_INFO, "Attempting to prep PCS data for share %@ with container %@", buf, 0x16u);

  }
  objc_msgSend_stateTransitionGroup(self, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v20);

  v23 = objc_msgSend_participantRole(v6, v21, v22);
  v26 = 2;
  if (v23 != 1)
    v26 = 3;
  v52 = v26;
  objc_msgSend_share(v6, v24, v25);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(self, v27, v28);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(v6, v29, v30);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callingParticipant(v6, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outOfNetworkPrivateKey(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedZone(v6, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1BEA800B0;
  v56[3] = &unk_1E7831D20;
  objc_copyWeak(&v59, &location);
  v49 = v6;
  v57 = v49;
  v50 = v7;
  v58 = v50;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_publicSharingKey_oonPrivateKey_removeServerSpecifiedKeys_sharedRecordZone_requestorOperationID_completionHandler_(v55, v51, (uint64_t)v54, v52, v53, v39, 0, v42, v48, v56);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);

}

- (void)_prepPPPCSDataForDugongShareMetadata:(id)a3 withInvitationToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void (**v11)(id, _QWORD, void *);
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
  void *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  id v37;

  v37 = a3;
  v8 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (v8)
    goto LABEL_2;
  v30 = (void *)MEMORY[0x1E0C94FF8];
  v31 = *MEMORY[0x1E0C94B20];
  objc_msgSend_share(v37, v9, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(v30, v36, v31, 1017, CFSTR("No sharing invitation token provided for device-to-device encrypted share %@"), v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
LABEL_2:
    objc_msgSend_share(v37, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_share(v37, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modificationDate(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topmostParentOperation(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__ingestAndExportPPPCSFromShareInvitationToken_shareModificationDate_container_requestorOperationID_completionHandler_(v12, v28, (uint64_t)v8, v18, v21, v27, v11);

    v29 = 0;
  }
  else if (v11)
  {
    v11[2](v11, 0, v29);
  }

}

- (void)_continueHandlingFetchedShareMetadata:(id)a3 shareURL:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  id v33;
  id v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  int hasEncryptedData;
  int RootRecord;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  _QWORD block[5];
  id v78;
  id v79;
  _BYTE *v80;
  _QWORD v81[4];
  NSObject *v82;
  _BYTE *v83;
  id v84;
  uint8_t v85[4];
  id v86;
  _BYTE buf[24];
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v76 = a4;
  objc_msgSend_share(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_publicPCS(v9, v10, v11))
  {
    v14 = objc_msgSend_publicPCS(v9, v12, v13);
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__encryptDataWithPCSBlob_pcsManager_(v6, v21, v14, v20);

    objc_msgSend_container(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_publicPCS(v9, v28, v29);
    v84 = 0;
    objc_msgSend_sharingIdentityDataFromPCS_error_(v27, v31, v30, &v84);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v84;

    v34 = objc_alloc(MEMORY[0x1E0C94D18]);
    v36 = (void *)objc_msgSend_initWithData_(v34, v35, (uint64_t)v32);
    objc_msgSend_setMutableEncryptedPSK_(v9, v37, (uint64_t)v36);

    v38 = (void *)*MEMORY[0x1E0C952F8];
    if (v33)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v38);
      v39 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v40 = v39;
        objc_msgSend_recordID(v9, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_1BE990000, v40, OS_LOG_TYPE_INFO, "Warn: Couldn't get a public sharing identity for share %@: %@", buf, 0x16u);

      }
    }
    else
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], v38);
      v44 = (void *)*MEMORY[0x1E0C952D8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
      {
        v45 = v44;
        objc_msgSend_recordID(v9, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mutableEncryptedPSK(v9, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v54;
        _os_log_impl(&dword_1BE990000, v45, OS_LOG_TYPE_INFO, "Public sharing identity for share %@ is %@", buf, 0x16u);

      }
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v88 = sub_1BE9BAFB8;
  v89 = sub_1BE9BAD90;
  v90 = 0;
  v55 = dispatch_group_create();
  if ((objc_msgSend_containsAssetValues(v9, v56, v57) & 1) != 0)
    hasEncryptedData = 1;
  else
    hasEncryptedData = objc_msgSend_hasEncryptedData(v9, v58, v59);
  RootRecord = objc_msgSend_shouldFetchRootRecord(self, v58, v59);
  v64 = MEMORY[0x1E0C809B0];
  if (!RootRecord)
  {
    if (!hasEncryptedData)
      goto LABEL_28;
    goto LABEL_27;
  }
  objc_msgSend_rootRecord(v6, v62, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsAssetValues(v65, v66, v67) & 1) != 0)
  {
    v70 = 1;
    if (v65)
      goto LABEL_26;
  }
  else
  {
    v70 = objc_msgSend_hasEncryptedData(v65, v68, v69);
    if (v65)
      goto LABEL_26;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v71 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v85 = 138412290;
    v86 = v6;
    _os_log_error_impl(&dword_1BE990000, v71, OS_LOG_TYPE_ERROR, "No root record received when fetching share metadata %@", v85, 0xCu);
  }
LABEL_26:

  if (((hasEncryptedData | v70) & 1) != 0)
  {
LABEL_27:
    dispatch_group_enter(v55);
    v81[0] = v64;
    v81[1] = 3221225472;
    v81[2] = sub_1BEA80974;
    v81[3] = &unk_1E782EB60;
    v83 = buf;
    v82 = v55;
    objc_msgSend__decryptRootRecordsForShareURL_withMetadata_completionHandler_(self, v72, (uint64_t)v76, v6, v81);

  }
LABEL_28:
  objc_msgSend_callbackQueue(self, v62, v63);
  v73 = objc_claimAutoreleasedReturnValue();
  block[0] = v64;
  block[1] = 3221225472;
  block[2] = sub_1BEA809CC;
  block[3] = &unk_1E7830880;
  block[4] = self;
  v78 = v76;
  v79 = v6;
  v80 = buf;
  v74 = v6;
  v75 = v76;
  dispatch_group_notify(v55, v73, block);

  _Block_object_dispose(buf, 8);
}

- (void)_decryptRootRecordsForShareURL:(id)a3 withMetadata:(id)a4 completionHandler:(id)a5
{
  id v8;
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
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  CKDAppContainerTuple *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
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
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  const char *v100;
  id v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  CKDFetchShareMetadataOperation *val;
  void *v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  CKDFetchShareMetadataOperation *v119;
  id v120;
  id v121;
  id location;
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v8 = a4;
  v104 = a5;
  val = self;
  objc_msgSend_container(self, v9, v10);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedClientProxy(v113, v11, v12);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxy(v113, v13, v14);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)objc_opt_new();
  objc_msgSend_share(v8, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_share(v8, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v110, v21, (uint64_t)v20);

  }
  objc_msgSend_rootRecord(v8, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_rootRecord(v8, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v110, v26, (uint64_t)v25);

  }
  v27 = (void *)objc_opt_new();
  if (objc_msgSend_participantRole(v8, v28, v29) == 1)
    v31 = 2;
  else
    v31 = 3;
  v103 = v31;
  objc_msgSend_setDatabaseScope_(v27, v30, v31);
  objc_msgSend_setShouldFetchAssetContent_(v27, v32, 1);
  objc_msgSend_rootRecordDesiredKeysSet(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v27, v39, (uint64_t)v38);

  v40 = [CKDAppContainerTuple alloc];
  objc_msgSend_applicationID(v113, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v8, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personaID(v113, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v40, v50, (uint64_t)v43, v46, v49);

  objc_msgSend_entitlements(v113, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v113, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clientConnection(v111, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedContainers(v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v63, (uint64_t)v108, v111, v109, v53, v56, v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stateTransitionGroup(val, v65, v66);
  v67 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v67);

  objc_initWeak(&location, val);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v68 = (id)*MEMORY[0x1E0C952D8];
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_share(v8, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v124 = v74;
    v125 = 2112;
    v126 = v64;
    _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Attempting to prep PCS data for share %@ with container %@", buf, 0x16u);

  }
  objc_msgSend_share(v8, v75, v76);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_privateToken(v8, v77, v78);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_callingParticipant(v8, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outOfNetworkPrivateKey(v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedZone(v8, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topmostParentOperation(val, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationID(v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = sub_1BEA80F3C;
  v114[3] = &unk_1E7831DC0;
  objc_copyWeak(&v121, &location);
  v101 = v8;
  v115 = v101;
  v97 = v64;
  v116 = v97;
  v105 = v104;
  v120 = v105;
  v98 = v27;
  v117 = v98;
  v99 = v110;
  v118 = v99;
  v119 = val;
  objc_msgSend__prepPCSDataWithContainer_databaseScope_publicSharingKey_oonPrivateKey_removeServerSpecifiedKeys_sharedRecordZone_requestorOperationID_completionHandler_(v107, v100, (uint64_t)v97, v103, v106, v87, 0, v90, v96, v114);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&location);

}

- (BOOL)_currentUserIsOONForShareMetadata:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;

  v3 = a3;
  objc_msgSend_callingParticipant(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userIdentity(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasiCloudAccount(v9, v10, v11))
  {
    objc_msgSend_callingParticipant(v3, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userIdentity(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outOfNetworkPrivateKey(v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = 1;
    }
    else
    {
      objc_msgSend_share(v3, v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentUserParticipant(v24, v25, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend_outOfNetworkMatches(v3, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend_count(v30, v31, v32) != 0;

      }
    }

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (void)_prepareShortTokens
{
  uint64_t v2;
  CKDFetchShareMetadataOperation *v3;
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
  uint64_t v15;
  uint64_t v16;
  dispatch_once_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
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
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  const char *v36;
  dispatch_once_t *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  NSObject *v78;
  const char *v79;
  void *v80;
  const char *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  void *v88;
  CKDFetchShareMetadataOperation *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _BYTE v105[128];
  uint64_t v106;

  v3 = self;
  v106 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shareURLsToFetch(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    objc_msgSend_shareURLsToFetch(v3, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend_copy(v10, v11, v12);

    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v95, v105, 16);
    if (!v15)
      goto LABEL_48;
    v16 = v15;
    v17 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v92 = *(_QWORD *)v96;
    v91 = *MEMORY[0x1E0C94B20];
    v88 = v13;
    v89 = v3;
    while (1)
    {
      v18 = 0;
      v90 = v16;
      do
      {
        if (*(_QWORD *)v96 != v92)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v18);
        if (*v17 != -1)
          dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v20 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v19;
          _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Extracting short token from URL %@", buf, 0xCu);
        }
        v21 = objc_alloc(MEMORY[0x1E0CB3998]);
        v23 = (void *)objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v21, v22, v19, 0);
        objc_msgSend_path(v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastPathComponent(v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend_length(v29, v30, v31) > 3)
        {
          v37 = v17;
          objc_msgSend_substringWithRange_(v29, v32, 0, 3);
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_substringFromIndex_(v29, v39, 3);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_CKDataFromBase64URLSafeString_(MEMORY[0x1E0C99D50], v40, (uint64_t)v93);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (void *)v38;
          if (v41)
          {
            v44 = v41;
            if (objc_msgSend_length(v41, v42, v43) == 16)
            {
              v45 = (void *)objc_opt_new();
              objc_msgSend_setRoutingKey_(v45, v46, v38);
              objc_msgSend_setShortSharingTokenData_(v45, v47, (uint64_t)v44);
              v50 = objc_msgSend_forceDSRefetch(v3, v48, v49);
              objc_msgSend_setForceDSRefetch_(v45, v51, v50);
              objc_msgSend_shareInvitationTokensByShareURL(v3, v52, v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v54, v55, v19);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v56)
              {
                if (*v37 != -1)
                  dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v59 = (void *)*MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
                {
                  v60 = v59;
                  objc_msgSend_operationID(v3, v61, v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v100 = (uint64_t)v56;
                  v101 = 2114;
                  v102 = (uint64_t)v63;
                  _os_log_impl(&dword_1BE990000, v60, OS_LOG_TYPE_INFO, "Received invitation token %{public}@ for CKFetchShareMetadatOperation %{public}@", buf, 0x16u);

                }
              }
              objc_msgSend_participantID(v56, v57, v58);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend_length(v64, v65, v66);

              if (v67)
              {
                if (*v37 != -1)
                  dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v68 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v100 = (uint64_t)v56;
                  _os_log_impl(&dword_1BE990000, v68, OS_LOG_TYPE_INFO, "Found participantID on invitationToken %@", buf, 0xCu);
                }
                objc_msgSend_participantID(v56, v69, v70);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setParticipantID_(v45, v72, (uint64_t)v71);

              }
              if (*v37 != -1)
                dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v73 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v100 = (uint64_t)v93;
                v101 = 2114;
                v102 = (uint64_t)v94;
                v103 = 2112;
                v104 = v19;
                _os_log_impl(&dword_1BE990000, v73, OS_LOG_TYPE_INFO, "Extracted short token %@ and routing key %{public}@ from URL %@", buf, 0x20u);
              }
              objc_msgSend_shareTokenMetadatasToFetchByURL(v89, v74, v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v76, v77, (uint64_t)v45, v19);

              v3 = v89;
              v35 = 0;
              v13 = v88;
              v17 = v37;
              goto LABEL_45;
            }
            if (*v37 != -1)
              dispatch_once(v37, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v80 = (void *)*MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
            {
              v83 = v80;
              v86 = objc_msgSend_length(v44, v84, v85);
              *(_DWORD *)buf = 134218242;
              v100 = v86;
              v101 = 2112;
              v102 = v19;
              _os_log_debug_impl(&dword_1BE990000, v83, OS_LOG_TYPE_DEBUG, "Invalid shortSharingTokenData length(%lu) for the URL %@", buf, 0x16u);

            }
            v17 = v37;
          }
          else
          {
            if (*v17 != -1)
              dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v78 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v19;
              _os_log_impl(&dword_1BE990000, v78, OS_LOG_TYPE_INFO, "Warn: Couldn't decode the short sharing token for the URL %@", buf, 0xCu);
            }
          }
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v79, v91, 1017, CFSTR("Couldn't parse iCloud Share URL %@"), v19);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__performCallbackForURL_withMetadata_error_(v3, v81, v19, 0, v35);
LABEL_45:

          v16 = v90;
          goto LABEL_46;
        }
        if (*v17 != -1)
          dispatch_once(v17, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v33 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v19;
          _os_log_impl(&dword_1BE990000, v33, OS_LOG_TYPE_INFO, "Warn: Couldn't get a short token for the URL %@", buf, 0xCu);
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v34, v91, 1017, CFSTR("Couldn't parse iCloud Share URL %@"), v19);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__performCallbackForURL_withMetadata_error_(v3, v36, v19, 0, v35);
LABEL_46:

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v82, (uint64_t)&v95, v105, 16);
      if (!v16)
      {
LABEL_48:

        return;
      }
    }
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v87 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v87, OS_LOG_TYPE_INFO, "We have no share URLs to fetch. Giving up.", buf, 2u);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setShareMetadataFetchedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchShareMetadataOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _BOOL8 v9;
  const char *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  CKDFetchShareMetadataOperation *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v3;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v13;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v18;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Starting fetch share metadata operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v24,
      0x2Au);

  }
  objc_msgSend_shareURLsToFetch(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v6, v7, v8) == 0;

  objc_msgSend_makeStateTransition_(self, v10, v9);
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (BOOL)errorOnOON
{
  return self->_errorOnOON;
}

- (void)setErrorOnOON:(BOOL)a3
{
  self->_errorOnOON = a3;
}

- (id)shareMetadataFetchedBlock
{
  return self->_shareMetadataFetchedBlock;
}

- (void)setShareMetadataFetchedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSMutableArray)shareURLsToFetch
{
  return self->_shareURLsToFetch;
}

- (void)setShareURLsToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_shareURLsToFetch, a3);
}

- (NSMutableDictionary)shareTokenMetadatasToFetchByURL
{
  return self->_shareTokenMetadatasToFetchByURL;
}

- (void)setShareTokenMetadatasToFetchByURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareTokenMetadatasToFetchByURL, a3);
}

- (BOOL)shouldFetchRootRecord
{
  return self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  self->_shouldFetchRootRecord = a3;
}

- (NSSet)rootRecordDesiredKeysSet
{
  return self->_rootRecordDesiredKeysSet;
}

- (void)setRootRecordDesiredKeysSet:(id)a3
{
  objc_storeStrong((id *)&self->_rootRecordDesiredKeysSet, a3);
}

- (BOOL)clientWillDisplaySystemAcceptPrompt
{
  return self->_clientWillDisplaySystemAcceptPrompt;
}

- (void)setClientWillDisplaySystemAcceptPrompt:(BOOL)a3
{
  self->_clientWillDisplaySystemAcceptPrompt = a3;
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  return self->_shareInvitationTokensByShareURL;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, a3);
}

- (BOOL)overwriteContainerPCSServiceIfManatee
{
  return self->_overwriteContainerPCSServiceIfManatee;
}

- (void)setOverwriteContainerPCSServiceIfManatee:(BOOL)a3
{
  self->_overwriteContainerPCSServiceIfManatee = a3;
}

- (BOOL)skipShareDecryption
{
  return self->_skipShareDecryption;
}

- (void)setSkipShareDecryption:(BOOL)a3
{
  self->_skipShareDecryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeysSet, 0);
  objc_storeStrong((id *)&self->_shareTokenMetadatasToFetchByURL, 0);
  objc_storeStrong((id *)&self->_shareURLsToFetch, 0);
  objc_storeStrong(&self->_shareMetadataFetchedBlock, 0);
}

@end
