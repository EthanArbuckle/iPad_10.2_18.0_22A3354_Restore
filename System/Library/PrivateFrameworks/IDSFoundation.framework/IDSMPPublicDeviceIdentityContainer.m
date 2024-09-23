@implementation IDSMPPublicDeviceIdentityContainer

+ (id)identityWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;
  const char *v25;
  double v26;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16 = v12;
  if (v10)
  {
    if (!v11 || v12)
    {
      if (!v11 && v12)
        objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v13, *MEMORY[0x1E0C99768], v15, CFSTR("Creating a IDSMPPublicDeviceIdentityContainer with a non-nil ngmVersion requires a non-nill IDSNGMPublicDeviceIdentity"));
    }
    else
    {
      objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v13, *MEMORY[0x1E0C99768], v15, CFSTR("Creating a IDSMPPublicDeviceIdentityContainer with a non-nil IDSNGMPublicDeviceIdentity requires a non-nil ngmVersion"));
    }
    v24 = objc_alloc((Class)a1);
    a6 = (id *)objc_msgSend_initWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_(v24, v25, (uint64_t)v10, v26, v11, v16);
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_19BAEE80C();

    if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2938];
      v29[0] = CFSTR("Failed to create IDSMPPublicDeviceIdentityContainer becuase we are missing the legacyPublicIdentity");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v29, v19, &v28, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v20, v22, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v23, -1000, v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return a6;
}

- (IDSMPPublicDeviceIdentityContainer)initWithLegacyPublicIdentity:(id)a3 ngmPublicDeviceIdentity:(id)a4 ngmVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSMPPublicDeviceIdentityContainer *v12;
  IDSMPPublicDeviceIdentityContainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSMPPublicDeviceIdentityContainer;
  v12 = -[IDSMPPublicDeviceIdentityContainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyPublicIdentity, a3);
    objc_storeStrong((id *)&v13->_ngmPublicDeviceIdentity, a4);
    objc_storeStrong((id *)&v13->_ngmVersion, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  char isEqual;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  double v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_ngmVersion(self, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9
      && (v13 = (void *)v9,
          objc_msgSend_ngmPublicDeviceIdentity(self, v10, v11, v12),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      objc_msgSend_ngmVersion(v5, v10, v11, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15
        || (v19 = (void *)v15,
            objc_msgSend_ngmPublicDeviceIdentity(v5, v16, v17, v18),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            !v20))
      {
        isEqual = 0;
        goto LABEL_13;
      }
      objc_msgSend_legacyPublicIdentity(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_legacyPublicIdentity(v5, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v24, v29, (uint64_t)v28, v30))
      {
        objc_msgSend_ngmVersion(self, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ngmVersion(v5, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v34, v39, (uint64_t)v38, v40))
        {
          objc_msgSend_ngmPublicDeviceIdentity(self, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ngmPublicDeviceIdentity(v5, v45, v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v44, v49, (uint64_t)v48, v50);

        }
        else
        {
          isEqual = 0;
        }

      }
      else
      {
        isEqual = 0;
      }
    }
    else
    {
      objc_msgSend_legacyPublicIdentity(self, v10, v11, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_legacyPublicIdentity(v5, v52, v53, v54);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v24, v55, (uint64_t)v28, v56);
    }

LABEL_13:
    goto LABEL_14;
  }
  isEqual = 0;
LABEL_14:

  return isEqual;
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  double v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  BOOL v32;
  int v33;
  char v34;
  NSObject *v35;
  const char *v36;
  double v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  const char *v41;
  double v42;
  NSObject *v43;
  const char *v44;
  double v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  double v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  double v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  NSObject *v72;
  id v73;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint8_t buf[4];
  id v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC8274]();
  v81 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v7, (uint64_t)v5, v8, 0, 0, &v81);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v81;
  objc_autoreleasePoolPop(v6);
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("kLegacyPublicIdentityKey"), v13);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, v14, (uint64_t)v16, v17, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          if (a4)
            v75 = *a4;
          else
            v75 = 0;
          *(_DWORD *)buf = 138543875;
          v85 = v75;
          v86 = 2113;
          v87 = (uint64_t)v16;
          v88 = 2113;
          v89 = (uint64_t)v5;
          _os_log_error_impl(&dword_19B949000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Failed to deserialize IDSMPPublicLegacyIdentity -- failed to create IDSMPPublicDeviceIdentityContainer from data {error: %{public}@, legacyData: %{private}@, dataRepresentation: %{private}@}", buf, 0x20u);
        }
        v46 = 0;
        goto LABEL_53;
      }
      objc_msgSend_objectForKeyedSubscript_(v9, v18, (uint64_t)CFSTR("kNGMPublicDeviceIdentityDataKey"), v21);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v9, v23, (uint64_t)CFSTR("kNGMPublicDevicePrekeyDataKey"), v24);
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v9, v26, (uint64_t)CFSTR("kNGMVersion"), v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v22)
        v32 = v25 == 0;
      else
        v32 = 1;
      v33 = !v32;
      if (v28)
        v34 = v33;
      else
        v34 = 0;
      v80 = (void *)v28;
      if ((v34 & 1) != 0 || !(v22 | v25 | v28))
      {
        v79 = v20;
        if (v33)
        {
          v53 = MEMORY[0x1A1AC8274]();
          v54 = v25;
          v55 = (void *)v53;
          v56 = v54;
          objc_msgSend_identityWithIdentityData_prekeyData_error_(IDSNGMPublicDeviceIdentity, v57, v22, v58);
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = 0;
          objc_autoreleasePoolPop(v55);
          v64 = v60;
          if (a4 && v60)
          {
            v65 = objc_retainAutorelease(v60);
            v64 = v60;
            *a4 = v65;
          }
          v20 = v79;
          if (!v59)
          {
            v40 = v64;
            objc_msgSend_accountIdentity(IDSFoundationLog, v61, v62, v63);
            v43 = objc_claimAutoreleasedReturnValue();
            v25 = v56;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              if (a4)
                v77 = *a4;
              else
                v77 = 0;
              *(_DWORD *)buf = 138544131;
              v85 = v77;
              v86 = 2113;
              v87 = v22;
              v88 = 2113;
              v89 = v56;
              v90 = 2113;
              v91 = (uint64_t)v9;
              _os_log_error_impl(&dword_19B949000, v43, OS_LOG_TYPE_ERROR, "Failed to create IDSNGMFullDeviceIdentity from dataRepresentation -- Failed to create IDSMPFullDeviceIdentityContainer {error: %{public}@, ngmIdentityData: %{private}@, ngmPrekeyData: %{private}@, dict: %{private}@}", buf, 0x2Au);
            }
            v46 = 0;
            goto LABEL_51;
          }

          v66 = (void *)v59;
          v25 = v56;
        }
        else
        {
          v66 = 0;
        }
        v67 = (uint64_t)v20;
        v40 = v66;
        objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v29, v67, v31);
        v68 = objc_claimAutoreleasedReturnValue();
        v43 = v68;
        if (v68)
        {
          v43 = v68;
          v46 = v43;
        }
        else
        {
          objc_msgSend_accountIdentity(IDSFoundationLog, v69, v70, v71);
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            if (a4)
              v76 = *a4;
            else
              v76 = 0;
            *(_DWORD *)buf = 138543619;
            v85 = v76;
            v86 = 2113;
            v87 = (uint64_t)v9;
            _os_log_error_impl(&dword_19B949000, v72, OS_LOG_TYPE_ERROR, "Failed to create IDSMPPublicDeviceIdentityContainer from parameters -- Failed to deserialize IDSMPPublicDeviceIdentityContainer {error: %{public}@, dict: %{private}@}", buf, 0x16u);
          }

          v46 = 0;
        }
      }
      else
      {
        objc_msgSend_accountIdentity(IDSFoundationLog, v29, v30, v31);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138478595;
          v85 = v9;
          v86 = 2114;
          v87 = (uint64_t)v80;
          v88 = 2113;
          v89 = v22;
          v90 = 2113;
          v91 = v25;
          _os_log_fault_impl(&dword_19B949000, v35, OS_LOG_TYPE_FAULT, "Corrupt IDSMPPublicDeviceIdentityContainer dataRepresentation, mismatch nullability for kNGMVersion/kNGMPublicDeviceIdentityDataKey/kNGMPublicDevicePrekeyDataKey - Failed to create IDSMPPublicDeviceIdentityContainer {dict: %{private}@, ngmVersion: %{public}@, ngmIdentityData: %{private}@, ngmPrekeyData: %{private}@}", buf, 0x2Au);
        }

        if (!a4)
        {
          v46 = 0;
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        v79 = v20;
        v38 = CFSTR("NO");
        if (v22)
          v39 = CFSTR("NO");
        else
          v39 = CFSTR("YES");
        if (!v25)
          v38 = CFSTR("YES");
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v36, (uint64_t)CFSTR("Corrupt IDSMPPublicDeviceIdentityContainer mismatch nullability for kNGMVersion/kNGMPublicDeviceIdentityDataKey/kNGMPublicDevicePrekeyDataKey {ngmVersion: %@, ngmIdentityData==nil: %@, ngmPrekeyData==nil: %@}"), v37, v80, v39, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)MEMORY[0x1E0CB35C8];
        v82 = *MEMORY[0x1E0CB2938];
        v83 = v40;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)&v83, v42, &v82, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v78, v44, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v45, -1000, v43);
        v46 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_51:

      v20 = v79;
      goto LABEL_52;
    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v14, v15, v17);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_19BAEE880((uint64_t)v9);

    if (a4)
    {
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v92 = *MEMORY[0x1E0CB2938];
      v93[0] = CFSTR("IDSMPPublicDeviceIdentityContainer dataRepresentation missing legacyData}");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)v93, v49, &v92, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v50, v51, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v52, -1000, v20);
      v46 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      if (a4)
        v73 = *a4;
      else
        v73 = 0;
      *(_DWORD *)buf = 138543875;
      v85 = v73;
      v86 = 2113;
      v87 = (uint64_t)v5;
      v88 = 2113;
      v89 = (uint64_t)v9;
      _os_log_fault_impl(&dword_19B949000, v16, OS_LOG_TYPE_FAULT, "Failed to deserialize plist - failed to create IDSMPPublicDeviceIdentityContainer from data {error: %{public}@, dataRepresentation: %{private}@, dict: %{private}@}", buf, 0x20u);
    }
  }
  v46 = 0;
LABEL_55:

  return v46;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  unint64_t v25;

  objc_msgSend_legacyPublicIdentity(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_ngmVersion(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16);
  objc_msgSend_ngmPublicDeviceIdentity(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9 ^ v17 ^ objc_msgSend_hash(v21, v22, v23, v24) ^ 0x11;

  return v25;
}

- (id)legacySealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 usingIdentitiesWithIdentifier:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  double v19;
  void *v20;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v18 = a6;
  if (!v18)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v24, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 617, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v15)
      goto LABEL_3;
LABEL_5:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, v27, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 618, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signingIdentity"));

    goto LABEL_3;
  }
  if (!v15)
    goto LABEL_5;
LABEL_3:
  objc_msgSend__legacySealMessage_signedWithFullIdentity_error_(self, v16, (uint64_t)v13, v19, v15, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  _BOOL4 v37;
  IDSMPPublicDeviceIdentityContainer *v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  __int16 v54;
  id v57;
  id v58;
  id v59;
  uint8_t v60[16];
  uint8_t buf[16];

  v59 = a3;
  v58 = a4;
  v57 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a13;
  v27 = a14;
  v31 = v27;
  if (a15)
  {
    if (v27)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29, v30);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, v50, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outUsedIdentityIdentifier"));

    if (v31)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29, v30);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v51, v52, (uint64_t)a2, v53, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signingIdentity"));

LABEL_3:
  objc_msgSend_ngmPublicDeviceIdentity(self, v28, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v35);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "Seal using ngm identities", buf, 2u);
    }

    HIBYTE(v54) = a12;
    LOBYTE(v54) = a11;
    v38 = self;
    v40 = v58;
    v39 = v59;
    v41 = v57;
    objc_msgSend__ngmSealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_forceSizeOptimizations_resetState_withEncryptedAttributes_signedWithFullIdentity_usedIdentityWithIdentifier_error_additionalResult_(v38, v42, (uint64_t)v59, v43, v58, a5, v57, v22, v23, v24, v25, v54, v26, v31, a15, a16, a17);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v37)
    {
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "Seal using legacy identities", v60, 2u);
    }

    *a15 = objc_retainAutorelease(CFSTR("pair"));
    v39 = v59;
    objc_msgSend__legacySealMessage_signedWithFullIdentity_error_(self, v45, (uint64_t)v59, v46, v31, a16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v57;
    v40 = v58;
  }

  return v44;
}

- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  id v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  double v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  NSObject *v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  double v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  const char *v66;
  double v67;
  void *v68;
  void *v69;
  const char *v70;
  double v71;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  uint8_t buf[4];
  id v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v82 = a4;
  v81 = a5;
  v80 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ngmPublicDeviceIdentity(self, v22, v23, v24);
    v25 = v16;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmFullDeviceIdentity(v17, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v35 = objc_msgSend_length(v15, v32, v33, v34);
    objc_msgSend_numberWithUnsignedInteger_(v31, v36, v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v91 = v26;
    v92 = 2113;
    v93 = v30;
    v94 = 2113;
    v95 = v38;
    _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "Sealing paddy message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

    v16 = v25;
  }

  objc_msgSend_ngmFullDeviceIdentity(v17, v39, v40, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend_ngmPublicDeviceIdentity(self, v42, v43, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    v50 = v46;
    if (!v46)
    {
      v51 = v15;
      if (a9)
      {
        v68 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2938];
        v87 = CFSTR("Tried to perform ngm encryption but encrypting container is missing NGMPublicDeviceIdentity");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)&v87, v49, &v86, 1);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v68, v70, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v71, 12, v69);
        *a9 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend_accountIdentity(IDSFoundationLog, v47, v48, v49);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        sub_19BAEE974();
      v52 = 0;
      goto LABEL_21;
    }
    v83 = 0;
    v51 = v15;
    objc_msgSend_sealPaddyMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByFullIdentity_error_(v46, v47, (uint64_t)v15, v49, v82, v81, v80, v16, v44, &v83);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v83;
    if (v52)
    {
LABEL_21:

      goto LABEL_22;
    }
    v79 = v16;
    objc_msgSend_accountIdentity(IDSFoundationLog, v53, v54, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      if (a9)
        v78 = *a9;
      else
        v78 = 0;
      objc_msgSend_debugDescription(self, v58, v59, v60);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(v17, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v91 = v78;
      v92 = 2113;
      v93 = v73;
      v94 = 2113;
      v95 = v77;
      _os_log_error_impl(&dword_19B949000, v57, OS_LOG_TYPE_ERROR, "Contianer failed to encrypt with ngm identities - fail to seal paddy message {error: %{public}@, publicContainer: %{private}@, signingContainer:%{private}@}", buf, 0x20u);

    }
    if (v55)
    {
      v84 = *MEMORY[0x1E0CB3388];
      v85 = v55;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v61, (uint64_t)&v85, v62, &v84, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a9)
      {
LABEL_10:

        v16 = v79;
        goto LABEL_21;
      }
    }
    else
    {
      v63 = 0;
      if (!a9)
        goto LABEL_10;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v61, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v62, 21, v63);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a9)
  {
    v64 = (void *)MEMORY[0x1E0CB35C8];
    v88 = *MEMORY[0x1E0CB2938];
    v89 = CFSTR("Tried to perform ngm encryption but signing container is missing NGMFullDeviceIdentity");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v42, (uint64_t)&v89, v45, &v88, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v64, v66, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v67, 11, v65);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v51 = v15;
  objc_msgSend_accountIdentity(IDSFoundationLog, v42, v43, v45);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    sub_19BAEE8F0();
  v52 = 0;
LABEL_22:

  return v52;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_legacyPublicIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmPublicDeviceIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmVersion(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@: %p legacyPublicIdentity: %@, ngmPublicDeviceIdentity: %@, ngmVersion: %@>"), v18, v4, self, v8, v12, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_legacyPublicIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmPublicDeviceIdentity(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmVersion(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v25, (uint64_t)CFSTR("<%@: %p legacyPublicIdentity: %@, ngmPublicDeviceIdentity: %@, ngmVersion: %@>"), v26, v4, self, v12, v20, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_legacySealMessage:(id)a3 signedWithFullIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  double v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  const char *v51;
  double v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  double v56;
  NSObject *v57;
  const char *v58;
  double v59;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_accountIdentity(IDSFoundationLog, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_legacyPublicIdentity(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_legacyFullIdentity(v9, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v26 = objc_msgSend_length(v8, v23, v24, v25);
    objc_msgSend_numberWithUnsignedInteger_(v22, v27, v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v71 = v17;
    v72 = 2113;
    v73 = v21;
    v74 = 2113;
    v75 = v29;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Sealing message using legacy identities {publicLegacyIdentity: %{private}@, fullLegacyIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

  }
  objc_msgSend_legacyFullIdentity(v9, v30, v31, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend_legacyPublicIdentity(self, v33, v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v37;
    if (!v37)
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v38, v39, v40);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        sub_19BAEEA74();

      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v58, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v59, 9, 0);
        v42 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
      goto LABEL_22;
    }
    v67 = 0;
    objc_msgSend_signAndProtectData_withSigner_error_(v37, v38, (uint64_t)v8, v40, v35, &v67);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v67;
    if (v42)
    {
LABEL_11:

LABEL_22:
      goto LABEL_23;
    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      if (a5)
        objc_msgSend_debugDescription(self, v48, v49, v50, *a5);
      else
        objc_msgSend_debugDescription(self, v48, v49, v50, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(v9, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v71 = v66;
      v72 = 2113;
      v73 = v61;
      v74 = 2113;
      v75 = v65;
      _os_log_error_impl(&dword_19B949000, v47, OS_LOG_TYPE_ERROR, "Contianer failed to encrypt with legacy identities - fail to seal message {error: %{public}@, publicContainer: %{private}@, signingContainer:%{private}@}", buf, 0x20u);

    }
    if (v45)
    {
      v68 = *MEMORY[0x1E0CB3388];
      v69 = v45;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)&v69, v52, &v68, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v53 = 0;
      if (!a5)
        goto LABEL_10;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v51, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v52, 10, v53);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v36);
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    sub_19BAEE9F8();

  if (a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v55, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v56, 8, 0);
    v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
LABEL_23:

  return v42;
}

- (id)_ngmSealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 withEncryptedAttributes:(id)a13 signedWithFullIdentity:(id)a14 usedIdentityWithIdentifier:(id *)a15 error:(id *)a16 additionalResult:(id *)a17
{
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  double v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  double v55;
  void *v56;
  id *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  id v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  double v78;
  unint64_t v79;
  id *v80;
  void *v81;
  void *v82;
  const char *v83;
  double v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  const char *v90;
  double v91;
  NSObject *v92;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  const char *v99;
  double v100;
  char isVersionSupported;
  void *v102;
  const char *v103;
  double v104;
  id v105;
  void *v106;
  const char *v107;
  double v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  double v112;
  const char *v113;
  uint64_t v114;
  double v115;
  const char *v116;
  uint64_t v117;
  double v118;
  id *v119;
  void *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  double v124;
  void *v125;
  const char *v126;
  double v127;
  void *v128;
  id v129;
  const char *v130;
  double v131;
  const char *v132;
  uint64_t v133;
  double v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  double v138;
  void *v139;
  const char *v140;
  double v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  double v145;
  void *v146;
  const char *v147;
  double v148;
  NSObject *v149;
  NSObject *v150;
  const char *v151;
  double v152;
  id *v153;
  void *v154;
  void *v155;
  const char *v156;
  double v157;
  void *v158;
  const char *v159;
  double v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  double v164;
  const char *v165;
  double v166;
  void *v167;
  void *v168;
  __CFDictionary *v169;
  const char *v170;
  double v171;
  void *v172;
  __CFDictionary *v173;
  const char *v174;
  void *v175;
  double v176;
  void *v177;
  __CFString **v178;
  id *v179;
  const char *v180;
  uint64_t v181;
  double v182;
  NSObject *v183;
  id v184;
  void *v186;
  const char *v187;
  uint64_t v188;
  double v189;
  void *v190;
  __int16 v191;
  void *v192;
  void *v193;
  void *v194;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  const __CFString *v208;
  uint8_t buf[4];
  id v210;
  __int16 v211;
  id v212;
  __int16 v213;
  id v214;
  __int16 v215;
  id v216;
  __int16 v217;
  id v218;
  uint64_t v219;
  const __CFString *v220;
  uint64_t v221;
  _QWORD v222[3];

  v222[1] = *MEMORY[0x1E0C80C00];
  v203 = a3;
  v22 = a4;
  v197 = a6;
  v202 = a7;
  v201 = a8;
  v200 = a9;
  v199 = a10;
  v198 = a13;
  v23 = a14;
  objc_msgSend_accountIdentity(IDSFoundationLog, v24, v25, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ngmPublicDeviceIdentity(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmFullDeviceIdentity(v23, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v22;
    v37 = (void *)MEMORY[0x1E0CB37E8];
    v41 = objc_msgSend_length(v203, v38, v39, v40);
    objc_msgSend_numberWithUnsignedInteger_(v37, v42, v41, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v210 = v31;
    v211 = 2113;
    v212 = v35;
    v213 = 2113;
    v214 = v44;
    _os_log_impl(&dword_19B949000, v27, OS_LOG_TYPE_DEFAULT, "Sealing message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

    v22 = v36;
  }

  objc_msgSend_ngmFullDeviceIdentity(v23, v45, v46, v47);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend_ngmPublicDeviceIdentity(self, v48, v49, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v52;
    v57 = a16;
    if (!v52)
    {
      if (a16)
      {
        v87 = (void *)MEMORY[0x1E0CB35C8];
        v219 = *MEMORY[0x1E0CB2938];
        v220 = CFSTR("Tried to perform ngm encryption but encrypting container is missing NGMPublicDeviceIdentity");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v53, (uint64_t)&v220, v55, &v219, 1);
        v88 = v50;
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(v87, v90, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v91, 12, v89);
        *a16 = (id)objc_claimAutoreleasedReturnValue();

        v50 = v88;
      }
      objc_msgSend_accountIdentity(IDSFoundationLog, v53, v54, v55);
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        sub_19BAEEB74();

      v93 = v197;
      v86 = 0;
      if (a15)
        *a15 = objc_retainAutorelease(CFSTR("pair-ec"));
      goto LABEL_77;
    }
    v192 = (void *)v52;
    v193 = v50;
    objc_msgSend_ngmVersion(self, v53, v54, v55);
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v62 = (void *)v58;
      objc_msgSend_ngmVersion(v23, v59, v60, v61);
      v63 = objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        v67 = (void *)v63;
        v68 = v22;
        objc_msgSend_ngmVersion(self, v64, v65, v66);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ngmVersion(v23, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToNumber_(v69, v74, (uint64_t)v73, v75) & 1) != 0)
        {

          v22 = v68;
          v79 = 0x1E3C19000;
          v80 = a17;
LABEL_25:
          v93 = v197;
          if (!v197 || !v202 || !v201 || !v200 || !v199)
          {
            objc_msgSend_accountIdentity(*(void **)(v79 + 2856), v59, v60, v61);
            v150 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413314;
              v210 = v197;
              v211 = 2112;
              v212 = v202;
              v213 = 2112;
              v214 = v201;
              v215 = 2112;
              v216 = v200;
              v217 = 2112;
              v218 = v199;
              _os_log_error_impl(&dword_19B949000, v150, OS_LOG_TYPE_ERROR, "Failed to seal message - one or more required fields is nil {guid: %@ sendingURI: %@ sendingPushToken: %@ receivingURI: %@ receivingPushToken: %@}", buf, 0x34u);
            }

            v50 = v193;
            if (v57)
            {
              v153 = v57;
              v154 = (void *)MEMORY[0x1E0CB35C8];
              v207 = *MEMORY[0x1E0CB2938];
              v208 = CFSTR("Tried to perform ngm encryption but one or more required fields is missing");
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v151, (uint64_t)&v208, v152, &v207, 1);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = v197;
              objc_msgSend_errorWithDomain_code_userInfo_(v154, v156, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v157, 22, v155);
              *v153 = (id)objc_claimAutoreleasedReturnValue();

            }
            v86 = 0;
            if (a15)
              *a15 = objc_retainAutorelease(CFSTR("pair-ec"));
            goto LABEL_76;
          }
          objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v59, v60, v61);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v204 = v102;
          HIBYTE(v191) = a12;
          LOBYTE(v191) = a11;
          objc_msgSend_sealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_forceSizeOptimizations_resetState_encryptedAttributes_signedByFullIdentity_errors_(v192, v103, (uint64_t)v203, v104, v22, a5, v197, v202, v201, v200, v199, v191, v198, v193, &v204);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v204;

          v106 = v105;
          objc_msgSend_objectForKey_(v105, v107, (uint64_t)&unk_1E3C86778, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = v109;
          if (objc_msgSend_code(v109, v110, v111, v112))
          {
            v196 = v109;
            v119 = a16;
            if (!v86)
            {
LABEL_55:
              objc_msgSend_accountIdentity(*(void **)(v79 + 2856), v116, v117, v118);
              v161 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend_debugDescription(self, v162, v163, v164);
                v186 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_debugDescription(v23, v187, v188, v189);
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543875;
                v210 = v196;
                v211 = 2113;
                v212 = v186;
                v213 = 2113;
                v214 = v190;
                _os_log_error_impl(&dword_19B949000, v161, OS_LOG_TYPE_ERROR, "Container failed to encrypt with ngm identities - fail to seal message {error: %{public}@, encryptingIdentity: %{private}@, signingIdentity: %{private}@}", buf, 0x20u);

                v93 = v197;
                v119 = a16;
              }

              if (v196)
              {
                v205 = *MEMORY[0x1E0CB3388];
                v206 = v196;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v165, (uint64_t)&v206, v166, &v205, 1);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v167 = 0;
              }
              if (v119)
              {
                objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v165, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v166, 15, v167);
                *v119 = (id)objc_claimAutoreleasedReturnValue();
              }

            }
          }
          else
          {
            objc_msgSend_domain(v109, v113, v114, v115);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_isEqualToString_(v158, v159, (uint64_t)CFSTR("com.apple.messageprotection"), v160) & 1) != 0)
              v196 = 0;
            else
              v196 = v109;
            v119 = a16;

            if (!v86)
              goto LABEL_55;
          }
          v168 = v106;
          if (v80 && v106)
          {
            v169 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend_objectForKey_(v106, v170, (uint64_t)&unk_1E3C86790, v171);
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            if (v172)
              CFDictionarySetValue(v169, &unk_1E3C867A8, v172);
            v173 = objc_retainAutorelease(v169);
            *v80 = v173;

          }
          objc_msgSend_objectForKey_(v168, v116, (uint64_t)&unk_1E3C86790, v118);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          if (v175)
          {
            objc_msgSend_objectForKey_(v168, v174, (uint64_t)&unk_1E3C86778, v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            v178 = IDSSecondaryIdentityIdentifier;
            if (v177)
              v178 = IDSNGMDeviceIdentityIdentifier;
            v179 = a15;
            *a15 = objc_retainAutorelease(*v178);

          }
          else
          {
            v179 = a15;
            *a15 = objc_retainAutorelease(CFSTR("pair-ec"));
          }

          objc_msgSend_accountIdentity(*(void **)(v79 + 2856), v180, v181, v182);
          v183 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
          {
            v184 = *v179;
            *(_DWORD *)buf = 138412290;
            v210 = v184;
            _os_log_impl(&dword_19B949000, v183, OS_LOG_TYPE_DEFAULT, "Finished encrypting message with identifier type: %@", buf, 0xCu);
          }

          v50 = v193;
LABEL_76:
          v56 = v192;
LABEL_77:

          goto LABEL_78;
        }
        objc_msgSend_ngmVersion(self, v76, v77, v78);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend_intValue(v94, v95, v96, v97);
        isVersionSupported = objc_msgSend_isVersionSupported_(IDSNGMProtocolVersion, v99, v98, v100);

        v57 = a16;
        v22 = v68;
        v79 = 0x1E3C19000uLL;
        v80 = a17;
        if ((isVersionSupported & 1) != 0)
          goto LABEL_25;
      }
      else
      {

      }
    }
    if (v57)
    {
      v120 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_ngmVersion(self, v59, v60, v61);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ngmVersion(v23, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v120, v126, (uint64_t)CFSTR("Unable to ngm seal message due to mismatching versions {encryptingIdentity.ngmVersion: %@, signingIdentity.ngmVersion: %@}"), v127, v121, v125);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v129 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend_setObject_forKeyedSubscript_(v129, v130, (uint64_t)v128, v131, *MEMORY[0x1E0CB2938]);
      objc_msgSend_ngmVersion(self, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      if (v135)
      {
        objc_msgSend_ngmVersion(self, v136, v137, v138);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v129, v140, (uint64_t)v139, v141, CFSTR("encryptingIdentityNGMVersion"));

      }
      objc_msgSend_ngmVersion(v23, v136, v137, v138);
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      if (v142)
      {
        objc_msgSend_ngmVersion(v23, v143, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v129, v147, (uint64_t)v146, v148, CFSTR("signingIdentityNGMVersion"));

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v143, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v145, 13, v129);
      *a16 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v59, v60, v61);
    v149 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
      sub_19BAEEBF8();

    v56 = v192;
    v86 = 0;
    if (a15)
      *a15 = objc_retainAutorelease(CFSTR("pair-ec"));
    v93 = v197;
    v50 = v193;
    goto LABEL_77;
  }
  if (a16)
  {
    v81 = (void *)MEMORY[0x1E0CB35C8];
    v221 = *MEMORY[0x1E0CB2938];
    v222[0] = CFSTR("Tried to perform ngm encryption but signing container is missing NGMFullDeviceIdentity");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v48, (uint64_t)v222, v51, &v221, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v81, v83, (uint64_t)CFSTR("com.apple.ids.IDSEncryptionErrorDomain"), v84, 11, v82);
    *a16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_accountIdentity(IDSFoundationLog, v48, v49, v51);
  v85 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    sub_19BAEEAF0();

  v86 = 0;
  if (a15)
    *a15 = objc_retainAutorelease(CFSTR("pair-ec"));
  v93 = v197;
LABEL_78:

  return v86;
}

- (id)dataRepresentationWithError:(id *)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  id v58;
  int v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  IDSMPPublicDeviceIdentityContainer *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_legacyPublicIdentity(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentationWithError_(v9, v10, (uint64_t)a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_19BAEE2C0((uint64_t *)a3);
    goto LABEL_16;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v13, (uint64_t)v12, v15, CFSTR("kLegacyPublicIdentityKey"));
  objc_msgSend_ngmPublicDeviceIdentity(self, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v23 = (void *)v19;
    objc_msgSend_ngmVersion(self, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_ngmPublicDeviceIdentity(self, v20, v25, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identityData(v26, v27, v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_ngmPublicDeviceIdentity(self, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_prekeyData(v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 && v38)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v5, v39, (uint64_t)v30, v41, CFSTR("kNGMPublicDeviceIdentityDataKey"));
        objc_msgSend_setObject_forKeyedSubscript_(v5, v42, (uint64_t)v38, v43, CFSTR("kNGMPublicDevicePrekeyDataKey"));
        objc_msgSend_ngmVersion(self, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v5, v48, (uint64_t)v47, v49, CFSTR("kNGMVersion"));

        goto LABEL_7;
      }
      objc_msgSend_accountIdentity(IDSFoundationLog, v39, v40, v41);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_19BAEEC8C((uint64_t)self, v56);

LABEL_16:
      v54 = 0;
      goto LABEL_17;
    }
  }
LABEL_7:
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v20, (uint64_t)v5, v22, 200, 0, a3);
  v50 = objc_claimAutoreleasedReturnValue();
  v30 = v50;
  if (v50)
  {
    v30 = v50;
    v54 = v30;
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v51, v52, v53);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
    {
      if (a3)
        v58 = *a3;
      else
        v58 = 0;
      v59 = 138543875;
      v60 = v58;
      v61 = 2113;
      v62 = v5;
      v63 = 2113;
      v64 = self;
      _os_log_fault_impl(&dword_19B949000, v55, OS_LOG_TYPE_FAULT, "Failed to create plist - failed to serialize IDSMPFullDeviceIdentityContainer {error: %{public}@, dict: %{private}@, container: %{private}@}", (uint8_t *)&v59, 0x20u);
    }

    v54 = 0;
  }
LABEL_17:

  return v54;
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  double v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend_ngmFullDeviceIdentity(v14, v17, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v23);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_19BAEECFC(v28, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  objc_msgSend_ngmPublicDeviceIdentity(self, v20, v21, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v28 = v24;
  if (!v24)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v25, v26, v27);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_19BAEED2C(v40, v41, v42, v43, v44, v45, v46, v47);
    goto LABEL_17;
  }
  if (!v12 || !v13 || !v15 || !v16)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v25, v26, v27);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_19BAEEDCC(v40, v48, v49, v50, v51, v52, v53, v54);
    goto LABEL_17;
  }
  if ((objc_msgSend_markForStateResetWithOurURI_ourPushToken_ourSigningIdentity_theirURI_theirPushToken_(v24, v25, (uint64_t)v12, v27, v13, v22, v15, v16) & 1) == 0)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v29, v30, v31);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_19BAEED5C((uint64_t)self);
LABEL_17:

LABEL_18:
    v32 = 0;
    goto LABEL_19;
  }
  v32 = 1;
LABEL_19:

  return v32;
}

- (IDSMPPublicLegacyIdentity)legacyPublicIdentity
{
  return self->_legacyPublicIdentity;
}

- (IDSNGMPublicDeviceIdentity)ngmPublicDeviceIdentity
{
  return self->_ngmPublicDeviceIdentity;
}

- (NSNumber)ngmVersion
{
  return self->_ngmVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ngmVersion, 0);
  objc_storeStrong((id *)&self->_ngmPublicDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_legacyPublicIdentity, 0);
}

@end
