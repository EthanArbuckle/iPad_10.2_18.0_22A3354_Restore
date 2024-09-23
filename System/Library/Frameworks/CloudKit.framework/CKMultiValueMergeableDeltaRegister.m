@implementation CKMultiValueMergeableDeltaRegister

- (CKMultiValueMergeableDeltaRegister)initWithIdentifier:(id)a3 vector:(id)a4 contents:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CKMultiValueMergeableDeltaRegisterState *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  CKMultiValueMergeableDeltaRegister *v21;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [CKMultiValueMergeableDeltaRegisterState alloc];
  v17 = (void *)objc_msgSend_newSalt(CKMultiValueMergeableDeltaRegisterState, v14, v15, v16);
  v19 = (void *)objc_msgSend_initWithIdentifier_vector_salt_(v13, v18, (uint64_t)v12, (uint64_t)v11, v17);

  v21 = (CKMultiValueMergeableDeltaRegister *)objc_msgSend_initWithPersistedState_contents_error_(self, v20, (uint64_t)v19, (uint64_t)v10, a6);
  return v21;
}

- (CKMultiValueMergeableDeltaRegister)initWithPersistedState:(id)a3 contents:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CKMultiValueMergeableDeltaRegister *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CKMultiValueMergeableDeltaRegister *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSData *salt;
  CKMultiValueMergeableDeltaRegister *v31;
  objc_super v33;
  _QWORD v34[4];
  CKMultiValueMergeableDeltaRegister *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v8 = a3;
  v9 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_18A717098;
  v42 = sub_18A7170A8;
  v43 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_18A7170B0;
  v34[3] = &unk_1E1F62860;
  v36 = &v44;
  v10 = self;
  v35 = v10;
  v37 = &v38;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v34, v12);
  if (*((_BYTE *)v45 + 24))
  {
    objc_msgSend_identifier(v8, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vector(v8, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33.receiver = v10;
    v33.super_class = (Class)CKMultiValueMergeableDeltaRegister;
    v21 = -[CKMultiValueRegister initWithIdentifier:vector:contents:error:](&v33, sel_initWithIdentifier_vector_contents_error_, v16, v20, v9, a5);

    if (v21)
    {
      objc_msgSend_salt(v8, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_copy(v25, v26, v27, v28);
      salt = v21->_salt;
      v21->_salt = (NSData *)v29;

    }
    v10 = v21;
    v31 = v10;
  }
  else
  {
    v31 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v39[5]);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v31;
}

- (CKMultiValueMergeableDeltaRegisterState)persistedState
{
  CKMultiValueMergeableDeltaRegisterState *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v3 = [CKMultiValueMergeableDeltaRegisterState alloc];
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vector(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_salt(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithIdentifier_vector_salt_(v3, v16, (uint64_t)v7, (uint64_t)v11, v15);

  return (CKMultiValueMergeableDeltaRegisterState *)v17;
}

+ (id)installationIdentifierWithSalt:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  CC_LONG v62;
  const char *v63;
  void *v64;
  void *v66;
  const char *v67;
  SEL v68;
  uint64_t v69;
  id v70;
  unsigned __int8 md[16];
  __int128 v72;
  uint64_t v73;

  v68 = a2;
  v73 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = 0;
  v9 = 4;
  do
  {
    if (v8)
      goto LABEL_8;
    objc_msgSend_defaultContext(CKLogicalDeviceContext, v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_connection(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processScopedDaemonProxy(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0;
    objc_msgSend_globalDeviceIdentifierWithError_(v18, v19, (uint64_t)&v70, v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v70;

    objc_msgSend_domain(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v25, v26, (uint64_t)CFSTR("CKErrorDomain"), v27))
      goto LABEL_6;
    v31 = objc_msgSend_code(v21, v28, v29, v30);

    if (v31 == 8)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v32, v33, v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v35, (uint64_t)v68, (uint64_t)a1, CFSTR("CKMultiValueMergeableDeltaRegister.m"), 85, CFSTR("Process is not entitled to call CloudKit SPI"));
LABEL_6:

    }
LABEL_8:
    --v9;
  }
  while (v9);
  if (!v8)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v36 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)md = 0;
      _os_log_fault_impl(&dword_18A5C5000, v36, OS_LOG_TYPE_FAULT, "Could not fetch global device identifier, possibly due to attempted mergeables use by system user", md, 2u);
    }
    objc_msgSend_placeholderIdentifier(a1, v37, v38, v39, v68);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v40, v41, v42, v43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_dataUsingEncoding_(v8, v4, 4, v6, v68);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v7, v45, v46, v47))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v48, v49, v50);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v66, v67, v69, (uint64_t)a1, CFSTR("CKMultiValueMergeableDeltaRegister.m"), 96, CFSTR("Unexpected salt length"));

  }
  v51 = (void *)objc_msgSend_mutableCopy(v7, v48, v49, v50);
  objc_msgSend_appendData_(v51, v52, (uint64_t)v44, v53);
  *(_OWORD *)md = 0u;
  v72 = 0u;
  v54 = objc_retainAutorelease(v51);
  v58 = (const void *)objc_msgSend_bytes(v54, v55, v56, v57);
  v62 = objc_msgSend_length(v54, v59, v60, v61);
  CC_SHA256(v58, v62, md);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v63, (uint64_t)md, 32);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)installationIdentifier
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_opt_class();
  objc_msgSend_salt(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_installationIdentifierWithSalt_(v3, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)modifierLimitForInstallationIdentifierCheck
{
  return 50;
}

- (id)siteIdentifier
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  CKDistributedSiteIdentifier *v58;
  const char *v59;
  void *v60;
  CKMultiValueMergeableDeltaRegister *v62;
  _QWORD v63[6];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  _QWORD v72[2];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 1;
  v3 = (void *)objc_opt_new();
  v62 = self;
  objc_msgSend_vector(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSiteIdentifiers(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v12 = v11;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v64, (uint64_t)v73, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend_identifier(v20, v14, v15, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v3, v22, (uint64_t)v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v24 = (void *)objc_opt_new();
          objc_msgSend_identifier(v20, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v24, (uint64_t)v31);

        }
        objc_msgSend_modifier(v20, v25, v26, v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_length(v33, v34, v35, v36) == 0;

        if (!v37)
        {
          objc_msgSend_modifier(v20, v38, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v24, v42, (uint64_t)v41, v43);

        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v64, (uint64_t)v73, 16);
    }
    while (v17);
  }

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = sub_18A7177F8;
  v63[3] = &unk_1E1F62888;
  v63[4] = v62;
  v63[5] = &v68;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v44, (uint64_t)v63, v45);

  v72[0] = 0;
  v72[1] = 0;
  objc_msgSend_identifier(v62, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUUIDBytes_(v49, v50, (uint64_t)v72, v51);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v52, (uint64_t)v72, 16);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v69 + 24))
  {
    objc_msgSend_installationIdentifier(v62, v53, v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = 0;
  }
  v58 = [CKDistributedSiteIdentifier alloc];
  v60 = (void *)objc_msgSend_initWithIdentifier_modifier_(v58, v59, (uint64_t)v56, (uint64_t)v57);

  _Block_object_dispose(&v68, 8);
  return v60;
}

- (void)setContents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_18A717BD0;
  v8[3] = &unk_1E1F628B0;
  v8[4] = self;
  v4 = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v8, v6);
  v7.receiver = self;
  v7.super_class = (Class)CKMultiValueMergeableDeltaRegister;
  -[CKMultiValueRegister setContents:](&v7, sel_setContents_, v4);

}

- (BOOL)checkElementType:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  BOOL v19;
  objc_class *v20;
  objc_class *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  objc_class *v29;
  const char *v30;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v19 = 0;
      goto LABEL_12;
    }
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v22, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ element has wrong class (expected %@)"), v6, v15);
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend_metadata(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend__data(v6, v11, v12, v13);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v15 = (void *)v23;
      v19 = 1;
      goto LABEL_10;
    }
    objc_msgSend_fileURL(v6, v24, v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v19 = 1;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_18:
      v19 = 0;
      goto LABEL_11;
    }
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v30, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ delta element is malformed (missing payload)"), v15);
LABEL_7:
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_18;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)&unk_1EDF870D8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol((Protocol *)&unk_1EDF87048);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v18, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("%@ delta element was generated from a %@, not a %@"), v15, v16, v17);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v19 = 0;
LABEL_10:

LABEL_11:
LABEL_12:

  return v19;
}

- (id)stateVector
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_vector(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_mutableCopy(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)deltaDeliveryRequirements
{
  return 0;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  int v71;
  CKMultiValueRegister *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  char v81;
  id obj;
  void *v85;
  _QWORD v87[5];
  id v88;
  _QWORD *v89;
  uint64_t *v90;
  uint64_t *v91;
  _QWORD v92[4];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v6 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v107, (uint64_t)v112, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v108 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend_metadata(v14, v8, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v15, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v19, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v5, v24, (uint64_t)v23, v25);

        objc_msgSend_metadata(v14, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v29, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removals(v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v5, v38, (uint64_t)v37, v39);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v107, (uint64_t)v112, 16);
    }
    while (v11);
  }

  objc_msgSend_vectorFilteredByAtomState_(v5, v40, 1, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_opt_new();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v6;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v103, (uint64_t)v111, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v104;
    while (2)
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v104 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        v51 = (void *)objc_msgSend_mutableCopy(v42, v44, v45, v46);
        objc_msgSend_metadata(v50, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v55, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_intersectStateVector_(v51, v64, (uint64_t)v63, v65);

        if (objc_msgSend_timestampCount(v51, v66, v67, v68))
        {
          v97 = 0;
          v98 = &v97;
          v99 = 0x3032000000;
          v100 = sub_18A717098;
          v101 = sub_18A7170A8;
          v102 = 0;
          v93 = 0;
          v94 = &v93;
          v95 = 0x2020000000;
          v96 = 1;
          v92[0] = 0;
          v92[1] = v92;
          v92[2] = 0x2020000000;
          v92[3] = 0;
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = sub_18A718340;
          v87[3] = &unk_1E1F628D8;
          v87[4] = v50;
          v89 = v92;
          v90 = &v97;
          v91 = &v93;
          v88 = v85;
          objc_msgSend_enumerateAllClockValuesUsingBlock_(v51, v69, (uint64_t)v87, v70);
          v71 = *((unsigned __int8 *)v94 + 24);
          if (a4 && !*((_BYTE *)v94 + 24))
            *a4 = objc_retainAutorelease((id)v98[5]);

          _Block_object_dispose(v92, 8);
          _Block_object_dispose(&v93, 8);
          _Block_object_dispose(&v97, 8);

          if (!v71)
          {

            v81 = 0;
            v79 = obj;
            goto LABEL_24;
          }
        }

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v103, (uint64_t)v111, 16);
      if (v47)
        continue;
      break;
    }
  }

  v72 = [CKMultiValueRegister alloc];
  v73 = (void *)objc_opt_class();
  objc_msgSend_placeholderIdentifier(v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend_initWithIdentifier_vector_contents_error_(v72, v78, (uint64_t)v77, (uint64_t)v5, v85, a4);

  if (v79)
    v81 = objc_msgSend_merge_error_(self, v80, (uint64_t)v79, (uint64_t)a4);
  else
    v81 = 0;
LABEL_24:

  return v81;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
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
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  id v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  CKMergeableDelta *v157;
  void *v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  void *v164;
  const char *v165;
  void *v166;
  void *v167;
  _QWORD v168[4];
  id v169;
  CKMultiValueMergeableDeltaRegister *v170;
  id v171;
  id v172;
  id v173;
  uint64_t *v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t (*v179)(uint64_t, uint64_t);
  void (*v180)(uint64_t);
  id v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  void (*v186)(uint64_t);
  id v187;

  v7 = a3;
  objc_msgSend_vector(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_mutableCopy(v11, v12, v13, v14);

  objc_msgSend_vectors(v7, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_intersectVector_(v15, v28, (uint64_t)v27, v29);

  objc_msgSend_vectorFilteredByAtomState_(v15, v30, 2, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_timestampCount(v32, v33, v34, v35);

  if (v36)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v37, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Cannot generate a delta from a register in consumed state"));
      v40 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
  }
  else
  {
    objc_msgSend_vector(self, v37, v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend_mutableCopy(v41, v42, v43, v44);

    objc_msgSend_vectors(v7, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contents(v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockVector(v53, v54, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_intersectVector_(v45, v58, v57, v59);

    objc_msgSend_vectors(v7, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contents(v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v57) = objc_msgSend_isEqual_(v45, v68, (uint64_t)v67, v69);

    if ((v57 & 1) != 0)
    {
      v182 = 0;
      v183 = &v182;
      v184 = 0x3032000000;
      v185 = sub_18A717098;
      v186 = sub_18A7170A8;
      v187 = (id)objc_opt_new();
      objc_msgSend_vectors(v7, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v76, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectorFilteredByAtomState_(v80, v81, 1, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_vectors(v7, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v87, v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = (void *)objc_msgSend_mutableCopy(v91, v92, v93, v94);

      objc_msgSend_clockVector(v83, v95, v96, v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_minusVector_(v167, v99, (uint64_t)v98, v100);

      objc_msgSend_vectors(v7, v101, v102, v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dependencies(v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = (void *)objc_msgSend_mutableCopy(v108, v109, v110, v111);

      v176 = 0;
      v177 = &v176;
      v178 = 0x3032000000;
      v179 = sub_18A717098;
      v180 = sub_18A7170A8;
      v181 = 0;
      if (objc_msgSend_timestampCount(v83, v112, v113, v114))
      {
        if ((unint64_t)objc_msgSend_timestampCount(v83, v115, v116, v117) >= 2)
        {
          objc_msgSend_vectors(v7, v118, v119, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_contents(v121, v122, v123, v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_clockVector(v125, v126, v127, v128);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_unionVector_(v166, v130, (uint64_t)v129, v131);

        }
        objc_msgSend_timestampToContents(self, v118, v119, v120);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v168[0] = MEMORY[0x1E0C809B0];
        v168[1] = 3221225472;
        v168[2] = sub_18A718AC8;
        v168[3] = &unk_1E1F62900;
        v133 = v83;
        v169 = v133;
        v170 = self;
        v174 = &v176;
        v175 = &v182;
        v171 = v167;
        v172 = v7;
        v173 = v166;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v132, v134, (uint64_t)v168, v135);

        v139 = objc_msgSend_timestampCount(v133, v136, v137, v138);
        if (v139 != objc_msgSend_count((void *)v183[5], v140, v141, v142) && v183[5])
        {
          objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v143, v144, v145);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v164, v165, (uint64_t)a2, (uint64_t)self, CFSTR("CKMultiValueMergeableDeltaRegister.m"), 365, CFSTR("Unexpected number of deltas generated"));

        }
        v146 = v169;
      }
      else
      {
        v157 = [CKMergeableDelta alloc];
        v158 = (void *)objc_opt_new();
        v146 = (void *)objc_msgSend_initWithData_metadata_(v157, v159, (uint64_t)v158, (uint64_t)v7);

        objc_msgSend_addObject_((void *)v183[5], v160, (uint64_t)v146, v161);
      }

      v162 = (void *)v183[5];
      if (a4 && !v162)
      {
        *a4 = objc_retainAutorelease((id)v177[5]);
        v162 = (void *)v183[5];
      }
      v40 = v162;
      _Block_object_dispose(&v176, 8);

      _Block_object_dispose(&v182, 8);
    }
    else
    {
      if (a4)
      {
        objc_msgSend_vectors(v7, v70, v71, v72);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v147, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vector(self, v152, v153, v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v156, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Metadata contents vector %@ does not match local vector %@"), v151, v155);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v40 = 0;
    }

  }
  return v40;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKMultiValueMergeableDeltaRegister;
  -[CKMultiValueRegister CKDescribePropertiesUsing:](&v20, sel_CKDescribePropertiesUsing_, v4);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_msgSend_timestampToContents(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A718DD0;
  v15[3] = &unk_1E1F62928;
  v15[4] = &v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v9, (uint64_t)v15, v10);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v11, v17[3], v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("size"), (uint64_t)v13, 0);

  _Block_object_dispose(&v16, 8);
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
}

@end
