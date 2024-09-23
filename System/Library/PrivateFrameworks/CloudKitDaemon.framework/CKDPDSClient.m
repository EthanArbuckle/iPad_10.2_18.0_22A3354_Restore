@implementation CKDPDSClient

- (NSMutableDictionary)registrationsByDSID
{
  return self->_registrationsByDSID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)inlock_registrationsForDSID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
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
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_queue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend_registrationsByDSID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_inlock_registrar(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userWithDSID_(MEMORY[0x1E0D65230], v16, (uint64_t)v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend_currentRegistrationsForUser_error_(v15, v18, (uint64_t)v17, &v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v33;

    v22 = (uint64_t)v19;
    if (!v19)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v23 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v20;
        _os_log_error_impl(&dword_1BE990000, v23, OS_LOG_TYPE_ERROR, "Error getting current registrations: %@", buf, 0xCu);
      }
      v22 = MEMORY[0x1E0C9AA60];
    }
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E20], v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_registrationsByDSID(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v24, v4);

  }
  objc_msgSend_registrationsByDSID(self, v13, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)ensureRegistrationForContainer:(id)a3 outError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
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
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  _QWORD block[5];
  id v39;
  id v40;
  __int128 *p_buf;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_account(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_accountType(v9, v10, v11);

  if (!v12)
  {
    objc_msgSend_account(v6, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountID(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_deviceContext(v6, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadataCache(v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cachedDSIDForAccountID_(v26, v27, (uint64_t)v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend__registrationForContainer_(self, v29, (uint64_t)v6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v43 = 0;
        v44 = &v43;
        v45 = 0x2020000000;
        v46 = 1;
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v48 = 0x3032000000;
        v49 = sub_1BE9BB1B0;
        v50 = sub_1BE9BAE80;
        v51 = 0;
        objc_msgSend_queue(self, v30, v31);
        v33 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1BE9C2DE8;
        block[3] = &unk_1E78378E8;
        block[4] = self;
        v39 = v28;
        v40 = v32;
        p_buf = &buf;
        v42 = &v43;
        dispatch_sync(v33, block);

        if (a4)
        {
          v34 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          if (v34)
            *a4 = objc_retainAutorelease(v34);
        }
        v16 = *((_BYTE *)v44 + 24) != 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v43, 8);
      }
      else if (a4)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v30, *MEMORY[0x1E0C94B20], 1017, CFSTR("Invalid container at PDS registration time"));
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

      goto LABEL_22;
    }
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v35 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_1BE990000, v35, OS_LOG_TYPE_ERROR, "Can't register a push token for an account id (%@) without a dsid", (uint8_t *)&buf, 0xCu);
      if (a4)
        goto LABEL_17;
    }
    else if (a4)
    {
LABEL_17:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v36, *MEMORY[0x1E0C94B20], 1017, CFSTR("No DSID at push registration time"));
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
    v16 = 0;
    goto LABEL_22;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BE990000, v15, OS_LOG_TYPE_INFO, "Not registering push via PDS, it requires a logged-in iCloud account, and this container is using a not-logged-in account", (uint8_t *)&buf, 2u);
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (id)_registrationForContainer:(id)a3
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
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_containerID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apsEnvironmentString(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierForPush(v4, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v10 && v13 && v7)
  {
    v15 = objc_alloc(MEMORY[0x1E0D65228]);
    objc_msgSend__pdsTopicFromBundleIdentifier_withContainerID_(self, v16, (uint64_t)v14, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__pdsQualifierFromContainerID_(self, v18, (uint64_t)v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend__pdsPushEnvironmentFromAPSEnvironmentString_(self, v20, (uint64_t)v10);
    v23 = (void *)objc_msgSend_initWithTopic_qualifier_pushEnvironment_(v15, v22, (uint64_t)v17, v19, v21);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v4;
      _os_log_error_impl(&dword_1BE990000, v24, OS_LOG_TYPE_ERROR, "Can't register an incomplete container %@, skipping", (uint8_t *)&v26, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)_pdsTopicFromBundleIdentifier:(id)a3 withContainerID:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend_specialContainerType(a4, v6, v7) == 4
    && (objc_msgSend_hasPrefix_(v5, v8, (uint64_t)CFSTR("clouddocs")) & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@%@.%@"), CFSTR("com.apple.icloud-container."), CFSTR("clouddocs"), v5);
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("%@%@"), CFSTR("com.apple.icloud-container."), v5);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_pdsQualifierFromContainerID:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend_environment(v3, v4, v5) == 2)
    v8 = CFSTR("_S");
  else
    v8 = CFSTR("_P");
  objc_msgSend_containerIdentifier(v3, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingString_(v9, v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (char)_pdsPushEnvironmentFromAPSEnvironmentString:(id)a3
{
  return objc_msgSend_compare_options_(a3, a2, *MEMORY[0x1E0CFE128], 1) == 0;
}

+ (id)sharedClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC06148;
  block[3] = &unk_1E7830348;
  block[4] = a1;
  if (qword_1ED702B90 != -1)
    dispatch_once(&qword_1ED702B90, block);
  return (id)qword_1ED702B88;
}

- (id)initInternal
{
  CKDPDSClient *v2;
  uint64_t v3;
  NSMutableDictionary *registrationsByDSID;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  _QWORD block[4];
  CKDPDSClient *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDPDSClient;
  v2 = -[CKDPDSClient init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    registrationsByDSID = v2->_registrationsByDSID;
    v2->_registrationsByDSID = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.cloudkit.pdsclient", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEC060DC;
    block[3] = &unk_1E782EA40;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

- (id)inlock_registrar
{
  uint64_t v2;
  NSObject *v4;
  PDSRegistrar *registrar;
  id v6;
  const char *v7;
  PDSRegistrar *v8;
  id v9;
  PDSRegistrar *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend_queue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  registrar = self->_registrar;
  if (!registrar)
  {
    v6 = objc_alloc(MEMORY[0x1E0D65220]);
    v13 = 0;
    v8 = (PDSRegistrar *)objc_msgSend_initWithClientID_error_(v6, v7, (uint64_t)CFSTR("com.apple.cloudkit.cloudd"), &v13);
    v9 = v13;
    v10 = self->_registrar;
    self->_registrar = v8;

    if (!self->_registrar)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v11 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v9;
        _os_log_error_impl(&dword_1BE990000, v11, OS_LOG_TYPE_ERROR, "Error creating PDSRegistrar: %@", buf, 0xCu);
      }
    }

    registrar = self->_registrar;
  }
  return registrar;
}

- (id)_registrationForAppContainerAccountTuple:(id)a3 pushBundleIdentifier:(id)a4 pdsPushEnvironment:(char)a5
{
  uint64_t v5;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_appContainerTuple(v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v9 && v15)
  {
    v17 = objc_alloc(MEMORY[0x1E0D65228]);
    objc_msgSend__pdsTopicFromBundleIdentifier_withContainerID_(self, v18, (uint64_t)v9, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__pdsQualifierFromContainerID_(self, v20, (uint64_t)v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend_initWithTopic_qualifier_pushEnvironment_(v17, v22, (uint64_t)v19, v21, v5);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v26 = 138412802;
      v27 = v8;
      v28 = 2114;
      v29 = v9;
      v30 = 2112;
      v31 = v16;
      _os_log_error_impl(&dword_1BE990000, v24, OS_LOG_TYPE_ERROR, "Can't register tuple %@ missing push bundle identifier %{public}@ and/or containerID %@", (uint8_t *)&v26, 0x20u);
    }
    v23 = 0;
  }

  return v23;
}

- (void)_expungeStaleDSIDs
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
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
  void *v30;
  const char *v31;
  char v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  char v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend_queue(self, a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE990000, v4, OS_LOG_TYPE_INFO, "Expunging stale users", buf, 2u);
  }
  objc_msgSend_inlock_registrar(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend_activeUsersWithError_(v7, v8, (uint64_t)&v51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v51;

  if (v9)
  {
    objc_msgSend_sharedAccountStore(CKDAccountStore, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountStore(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v16;
    objc_msgSend_aa_appleAccounts(v16, v17, v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKCompactMap_(v42, v19, (uint64_t)&unk_1E78378C0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = v9;
    v21 = v9;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v47, v56, 16);
    if (v23)
    {
      v26 = v23;
      v27 = *(_QWORD *)v48;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v48 != v27)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v28);
          if (objc_msgSend_userType(v29, v24, v25) == 1)
          {
            objc_msgSend_userID(v29, v24, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend_containsObject_(v20, v31, (uint64_t)v30);

            if ((v32 & 1) == 0)
            {
              if (*MEMORY[0x1E0C95300] != -1)
                dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
              v33 = *MEMORY[0x1E0C952B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v53 = v29;
                _os_log_error_impl(&dword_1BE990000, v33, OS_LOG_TYPE_ERROR, "Removing orphaned PDSUser for unknown user %@", buf, 0xCu);
              }
              objc_msgSend_inlock_registrar(self, v34, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v10;
              v38 = objc_msgSend_removeAllRegistrationsFromUser_error_(v36, v37, (uint64_t)v29, &v46);
              v39 = v46;

              if ((v38 & 1) == 0)
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v40 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v53 = v29;
                  v54 = 2112;
                  v55 = v39;
                  _os_log_error_impl(&dword_1BE990000, v40, OS_LOG_TYPE_ERROR, "Unable to remove all registrations for user %@: %@", buf, 0x16u);
                }
              }
              v10 = v39;
            }
          }
          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v47, v56, 16);
      }
      while (v26);
    }

    v9 = v44;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v41 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v10;
      _os_log_error_impl(&dword_1BE990000, v41, OS_LOG_TYPE_ERROR, "Unable to iterate active users: %@", buf, 0xCu);
    }
  }

}

- (BOOL)_unregisterRegistration:(id)a3 forDSID:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  _QWORD block[5];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1BE9BB1B0;
  v27 = sub_1BE9BAE80;
  v28 = 0;
  objc_msgSend_queue(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC06A48;
  block[3] = &unk_1E78378E8;
  block[4] = self;
  v13 = v9;
  v19 = v13;
  v14 = v8;
  v20 = v14;
  v21 = &v23;
  v22 = &v29;
  dispatch_sync(v12, block);

  if (a5)
  {
    v15 = (void *)v24[5];
    if (v15)
      *a5 = objc_retainAutorelease(v15);
  }
  v16 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (BOOL)unregisterTokenForContainer:(id)a3 outError:(id *)a4
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
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  char v24;
  NSObject *v25;
  const char *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_account(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceContext(v6, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedDSIDForAccountID_(v18, v19, (uint64_t)v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v25 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v28 = 138412290;
      v29 = v12;
      _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, "Can't unregister a push token for an account id (%@) without a dsid", (uint8_t *)&v28, 0xCu);
      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v26, *MEMORY[0x1E0C94B20], 1017, CFSTR("No DSID at push unregister time"));
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v24 = 0;
    goto LABEL_13;
  }
  objc_msgSend__registrationForContainer_(self, v21, (uint64_t)v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = objc_msgSend__unregisterRegistration_forDSID_outError_(self, v22, (uint64_t)v23, v20, a4);
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v22, *MEMORY[0x1E0C94B20], 1017, CFSTR("Invalid container at PDS unregistration time"));
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

LABEL_13:
  return v24;
}

- (BOOL)unregisterAllTokensForAccountID:(id)a3 outError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  _QWORD block[5];
  id v23;
  id v24;
  __int128 *p_buf;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_defaultContext(CKDLogicalDeviceContext, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_cachedDSIDForAccountID_(v12, v13, (uint64_t)v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x3032000000;
    v33 = sub_1BE9BB1B0;
    v34 = sub_1BE9BAE80;
    v35 = 0;
    objc_msgSend_queue(self, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEC07174;
    block[3] = &unk_1E78378E8;
    block[4] = self;
    v23 = v16;
    p_buf = &buf;
    v26 = &v27;
    v24 = v6;
    dispatch_sync(v17, block);

    if (a4)
    {
      v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v18)
        *a4 = objc_retainAutorelease(v18);
    }
    v19 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v20 = *MEMORY[0x1E0C952B0];
    v19 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Skipping token unregistration for account %@, which has no dsid", (uint8_t *)&buf, 0xCu);
    }
  }

  return v19;
}

- (void)unregisterAllTokens
{
  uint64_t v2;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend_queue(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEC073CC;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(v4, block);

}

- (PDSRegistrar)registrar
{
  return self->_registrar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registrationsByDSID, 0);
}

@end
