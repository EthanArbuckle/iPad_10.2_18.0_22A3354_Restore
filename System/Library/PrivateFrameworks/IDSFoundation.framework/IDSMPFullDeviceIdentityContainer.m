@implementation IDSMPFullDeviceIdentityContainer

+ (id)identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 error:(id *)a6
{
  double v6;

  return (id)objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(a1, a2, (uint64_t)a3, v6, a4, a5, 0, a6);
}

+ (id)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  NSObject *v5;
  const char *v6;
  double v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  double v19;
  NSObject *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  double v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const char *v34;
  double v35;
  NSObject *v36;
  const char *v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  uint64_t v49;
  id v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  double v56;
  NSObject *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  NSObject *v62;
  NSObject *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const __CFString *v70;
  uint8_t buf[4];
  NSObject *v72;
  __int16 v73;
  NSObject *v74;
  __int16 v75;
  NSObject *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v5, v7, 0, 0, a4);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("kLegacyFullIdentityKey"), v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend_identityWithData_error_(IDSMPFullLegacyIdentity, v12, (uint64_t)v14, v15, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend_accountIdentity(IDSFoundationLog, v16, v17, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          if (a4)
            v64 = *a4;
          else
            v64 = 0;
          *(_DWORD *)buf = 138543875;
          v72 = v64;
          v73 = 2113;
          v74 = v14;
          v75 = 2113;
          v76 = v5;
          _os_log_error_impl(&dword_19B949000, v20, OS_LOG_TYPE_ERROR, "Failed to deserialize IDSMPFullLegacyIdentity -- failed to create IDSMPFullDeviceIdentityContainer from data {error: %{public}@, legacyData: %{private}@, dataRepresentation: %{private}@}", buf, 0x20u);
        }
        v39 = 0;
        goto LABEL_43;
      }
      objc_msgSend_objectForKeyedSubscript_(v8, v16, (uint64_t)CFSTR("kNGMFullDeviceIdentity"), v19);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v8, v21, (uint64_t)CFSTR("kNGMVersion"), v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v27 = v23;
      if ((!v20 || v23) && (!v23 || v20))
      {
        if (v20)
        {
          v46 = MEMORY[0x1A1AC8274]();
          v66 = 0;
          objc_msgSend_identityWithDataRepresentation_error_(IDSNGMFullDeviceIdentity, v47, (uint64_t)v20, v48, &v66);
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v66;
          v51 = (void *)v46;
          v32 = v50;
          objc_autoreleasePoolPop(v51);
          if (a4 && v32)
            *a4 = objc_retainAutorelease(v32);
          if (!v49)
          {
            objc_msgSend_accountIdentity(IDSFoundationLog, v52, v53, v54);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              if (a4)
                v65 = *a4;
              else
                v65 = 0;
              *(_DWORD *)buf = 138543875;
              v72 = v65;
              v73 = 2113;
              v74 = v20;
              v75 = 2113;
              v76 = v8;
              _os_log_error_impl(&dword_19B949000, v36, OS_LOG_TYPE_ERROR, "Failed to create IDSNGMFullDeviceIdentity from dataRepresentation -- Failed to create IDSMPFullDeviceIdentityContainer {error: %{public}@, ngmData: %{private}@, dict: %{private}@}", buf, 0x20u);
            }
            v39 = 0;
            goto LABEL_41;
          }

          v32 = (void *)v49;
          objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(IDSMPFullDeviceIdentityContainer, v55, (uint64_t)v18, v56, v49, v27, v14, a4);
        }
        else
        {
          v32 = 0;
          objc_msgSend__identityWithLegacyFullIdentity_ngmFullDeviceIdentity_ngmVersion_legacyFullIdentitySerializedData_error_(IDSMPFullDeviceIdentityContainer, v24, (uint64_t)v18, v26, 0, v23, v14, a4);
        }
        v58 = objc_claimAutoreleasedReturnValue();
        v36 = v58;
        if (v58)
        {
          v36 = v58;
          v39 = v36;
        }
        else
        {
          objc_msgSend_accountIdentity(IDSFoundationLog, v59, v60, v61);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            sub_19BAEE0D4((uint64_t *)a4);

          v39 = 0;
        }
      }
      else
      {
        objc_msgSend_accountIdentity(IDSFoundationLog, v24, v25, v26);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138478339;
          v72 = v8;
          v73 = 2114;
          v74 = v27;
          v75 = 2113;
          v76 = v20;
          _os_log_fault_impl(&dword_19B949000, v28, OS_LOG_TYPE_FAULT, "Corrupt IDSMPFullDeviceIdentityContainer dataRepresentation, mismatch nullability for kNGMVersion an dkNGMFullDeviceIdentity - Failed to create IDSMPFullDeviceIdentityContainer {dict: %{private}@, ngmVersion: %{public}@, ngmData: %{private}@}", buf, 0x20u);
        }

        if (!a4)
        {
          v39 = 0;
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        v31 = CFSTR("NO");
        if (!v20)
          v31 = CFSTR("YES");
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("Corrupt IDSMPFullDeviceIdentityContainer mismatch nullability for kNGMVersion an dkNGMFullDeviceIdentity {ngmVersion: %@, ngmData==nil: %@}"), v30, v27, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v67 = *MEMORY[0x1E0CB2938];
        v68 = v32;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)&v68, v35, &v67, 1);
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v33, v37, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v38, -1000, v36);
        v39 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v12, v13, v15);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_19BAEE064((uint64_t)v8);

    if (a4)
    {
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2938];
      v70 = CFSTR("IDSMPFullDeviceIdentityContainer dataRepresentation missing legacyData}");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)&v70, v42, &v69, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v44, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v45, -1000, v18);
      v39 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

      goto LABEL_45;
    }
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      if (a4)
        v57 = *a4;
      else
        v57 = 0;
      *(_DWORD *)buf = 138543875;
      v72 = v57;
      v73 = 2113;
      v74 = v5;
      v75 = 2113;
      v76 = v8;
      _os_log_fault_impl(&dword_19B949000, v14, OS_LOG_TYPE_FAULT, "Failed to deserialize plist - failed to create IDSMPFullDeviceIdentityContainer from data {error: %{public}@, dataRepresentation: %{private}@, dict: %{private}@}", buf, 0x20u);
    }
  }
  v39 = 0;
LABEL_45:

  return v39;
}

+ (id)_identityWithLegacyFullIdentity:(id)a3 ngmFullDeviceIdentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  id v17;
  double v18;
  NSObject *v19;
  const char *v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;
  const char *v27;
  double v28;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v17 = a6;
  if (v12)
  {
    if (!v13 || v14)
    {
      if (!v13 && v14)
        objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v15, *MEMORY[0x1E0C99768], v18, CFSTR("Creating a IDSMPFullDeviceIdentityContainer with a non-nil ngmVersion requires a non-nill IDSNGMFullDeviceIdentity"));
    }
    else
    {
      objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v15, *MEMORY[0x1E0C99768], v18, CFSTR("Creating a IDSMPFullDeviceIdentityContainer with a non-nil IDSNGMFullDeviceIdentity requires a non-nil ngmVersion"));
    }
    v26 = objc_alloc((Class)a1);
    a7 = (id *)objc_msgSend_initWithFullLegacyIdentity_ngmFullDeviceidentity_ngmVersion_legacyFullIdentitySerializedData_(v26, v27, (uint64_t)v12, v28, v13, v14, v17);
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v15, v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_19BAEE154();

    if (a7)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("Failed to create IDSMPFullDeviceIdentityContainer becuase we are missing the legacyFullIdentity");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v31, v21, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v25, -1000, v23);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }

  return a7;
}

- (IDSMPFullDeviceIdentityContainer)initWithFullLegacyIdentity:(id)a3 ngmFullDeviceidentity:(id)a4 ngmVersion:(id)a5 legacyFullIdentitySerializedData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSMPFullDeviceIdentityContainer *v15;
  IDSMPFullDeviceIdentityContainer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSMPFullDeviceIdentityContainer;
  v15 = -[IDSMPFullDeviceIdentityContainer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_legacyFullIdentity, a3);
    objc_storeStrong((id *)&v16->_ngmFullDeviceIdentity, a4);
    objc_storeStrong((id *)&v16->_ngmVersion, a5);
    objc_storeStrong((id *)&v16->_cachedLegacySerializedData, a6);
  }

  return v16;
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
          objc_msgSend_ngmFullDeviceIdentity(self, v10, v11, v12),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      objc_msgSend_ngmVersion(v5, v10, v11, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15
        || (v19 = (void *)v15,
            objc_msgSend_ngmFullDeviceIdentity(v5, v16, v17, v18),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            !v20))
      {
        isEqual = 0;
        goto LABEL_13;
      }
      objc_msgSend_legacyFullIdentity(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_legacyFullIdentity(v5, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v24, v29, (uint64_t)v28, v30))
      {
        objc_msgSend_ngmVersion(self, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ngmVersion(v5, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqual_(v34, v39, (uint64_t)v38, v40))
        {
          objc_msgSend_ngmFullDeviceIdentity(self, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ngmFullDeviceIdentity(v5, v45, v46, v47);
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
      objc_msgSend_legacyFullIdentity(self, v10, v11, v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_legacyFullIdentity(v5, v52, v53, v54);
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

  objc_msgSend_legacyFullIdentity(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_ngmVersion(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16);
  objc_msgSend_ngmFullDeviceIdentity(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v9 ^ v17 ^ objc_msgSend_hash(v21, v22, v23, v24) ^ 0x11;

  return v25;
}

- (id)publicIdentityWithError:(id *)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  id v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  id v30;
  id v31;

  objc_msgSend_legacyFullIdentity(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend_publicIdentityWithError_(v6, v7, (uint64_t)&v31, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v31;

  if (!v9)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_19BAEE1B8();

    if (!a3)
    {
      v25 = 0;
      goto LABEL_17;
    }
    v27 = v10;
    goto LABEL_14;
  }
  objc_msgSend_ngmFullDeviceIdentity(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_ngmFullDeviceIdentity(self, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    objc_msgSend_publicDeviceIdentityWithError_(v18, v19, (uint64_t)&v30, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;

    if (v14)
    {
      v10 = v21;
      goto LABEL_5;
    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v15, v16, v17);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_19BAEE23C();

    if (!a3)
    {
      v25 = 0;
      v10 = v21;
      goto LABEL_17;
    }
    v27 = v21;
LABEL_14:
    v10 = objc_retainAutorelease(v27);
    v25 = 0;
    *a3 = v10;
    goto LABEL_17;
  }
LABEL_5:
  objc_msgSend_ngmVersion(self, v15, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identityWithLegacyPublicIdentity_ngmPublicDeviceIdentity_ngmVersion_error_(IDSMPPublicDeviceIdentityContainer, v23, (uint64_t)v9, v24, v14, v22, a3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v25;
}

- (id)dataRepresentationWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  double v8;
  NSData *cachedLegacySerializedData;
  NSObject *v10;
  const char *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  id v51;
  int v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  IDSMPFullDeviceIdentityContainer *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  cachedLegacySerializedData = self->_cachedLegacySerializedData;
  if (cachedLegacySerializedData)
  {
    v10 = cachedLegacySerializedData;
    objc_msgSend_setObject_forKeyedSubscript_(v7, v11, (uint64_t)v10, v12, CFSTR("kLegacyFullIdentityKey"));
  }
  else
  {
    objc_msgSend_legacyFullIdentity(self, v5, v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataRepresentationWithError_(v16, v17, (uint64_t)a3, v18);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_cachedLegacySerializedData, v10);
    if (!v10)
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v19, v20, v21);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_19BAEE2C0((uint64_t *)a3);
      goto LABEL_19;
    }
    objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v10, v21, CFSTR("kLegacyFullIdentityKey"));
  }
  objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
  v22 = objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_9;
  v26 = (void *)v22;
  objc_msgSend_ngmVersion(self, v23, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
    goto LABEL_9;
  objc_msgSend_ngmFullDeviceIdentity(self, v23, v28, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentationWithError_(v29, v30, (uint64_t)a3, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v35);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_19BAEE340((uint64_t *)a3);

LABEL_19:
    v46 = 0;
    goto LABEL_20;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v7, v33, (uint64_t)v32, v35, CFSTR("kNGMFullDeviceIdentity"));
  objc_msgSend_ngmVersion(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v40, (uint64_t)v39, v41, CFSTR("kNGMVersion"));

LABEL_9:
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v23, (uint64_t)v7, v25, 200, 0, a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v42;
  if (v42)
  {
    v47 = v42;
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v45);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      if (a3)
        v51 = *a3;
      else
        v51 = 0;
      v52 = 138543875;
      v53 = v51;
      v54 = 2113;
      v55 = v7;
      v56 = 2113;
      v57 = self;
      _os_log_fault_impl(&dword_19B949000, v48, OS_LOG_TYPE_FAULT, "Failed to create plist - failed to serialize IDSMPFullDeviceIdentityContainer {error: %{public}@, dict: %{private}@, container: %{private}@}", (uint8_t *)&v52, 0x20u);
    }

  }
LABEL_20:

  return v46;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 usingIdentityWithIdentifier:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  double v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  char *v24;
  uint64_t v25;
  double v26;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;

  v11 = a3;
  v12 = a4;
  v15 = a5;
  if (v15)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, v30, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityIdentifier"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, v33, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signingIdentityContainer"));

LABEL_3:
  if (objc_msgSend_isEqualToString_(v15, v13, (uint64_t)CFSTR("pair"), v16))
  {
    objc_msgSend__legacyUnsealMessage_signedByPublicIdentity_error_(self, v17, (uint64_t)v11, v18, v12, a6);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v23 = (void *)v19;
    goto LABEL_11;
  }
  if (objc_msgSend_isEqualToString_(v15, v17, (uint64_t)CFSTR("pair-ec"), v18))
  {
    objc_msgSend__ngmSynchronouslyUnsealMessage_signedByPublicIdentity_error_(self, v20, (uint64_t)v11, v22, v12, a6);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v22);
  v24 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_FAULT))
    sub_19BAEE3C0(self, v24, v25, v26);

  v23 = 0;
LABEL_11:

  return v23;
}

- (id)unsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 usingIdentityWithIdentifier:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  id v24;
  double v25;
  const char *v26;
  double v27;
  void *v28;
  id v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  id v34;
  double v35;
  IDSMPDecryptionResult *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  double v46;
  IDSMPFullDeviceIdentityContainer *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const char *v54;
  uint64_t v55;
  double v56;
  IDSMPFullDeviceIdentityContainer *v57;
  char *v58;
  uint64_t v59;
  double v60;
  id v61;
  void *v62;
  const char *v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  void *v68;
  const char *v69;
  double v70;
  const char *v71;
  uint64_t v72;
  double v73;
  void *v74;
  const char *v75;
  double v76;
  void *v77;
  const char *v78;
  double v79;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v84 = a4;
  v83 = a6;
  v82 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v24 = a12;
  if (v24)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23, v25);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, v76, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityIdentifier"));

    if (v21)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23, v25);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v77, v78, (uint64_t)a2, v79, self, CFSTR("IDSMPDeviceIdentityContainer.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signingIdentityContainer"));

LABEL_3:
  v28 = v17;
  if (objc_msgSend_isEqualToString_(v24, v22, (uint64_t)CFSTR("pair"), v25))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0D13230]);
    v85 = 0;
    objc_msgSend__legacyUnsealMessage_signedByPublicIdentity_error_(self, v30, (uint64_t)v28, v31, v21, &v85);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v85;
    if (v32)
    {
      v36 = [IDSMPDecryptionResult alloc];
      v39 = (void *)objc_msgSend_initWithData_encryptedAttributes_withCommitState_additionalDecryptionResult_(v36, v37, (uint64_t)v32, v38, 0, 0, 0);
      objc_msgSend_fulfillWithValue_(v29, v40, (uint64_t)v39, v41);

    }
    else
    {
      objc_msgSend_failWithError_(v29, v33, (uint64_t)v34, v35);
    }
    objc_msgSend_promise(v29, v42, v43, v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v50 = v83;
    v49 = v84;
    v51 = v82;
    goto LABEL_12;
  }
  if ((objc_msgSend_isEqualToString_(v24, v26, (uint64_t)CFSTR("pair-ec"), v27) & 1) == 0
    && !objc_msgSend_isEqualToString_(v24, v45, (uint64_t)CFSTR("pair-tetra"), v46))
  {
    if (objc_msgSend_isEqualToString_(v24, v45, (uint64_t)CFSTR("paddy"), v46))
    {
      v57 = self;
      v51 = v82;
      objc_msgSend__paddyUnsealMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_(v57, v54, (uint64_t)v17, v56, v82, v18, v19, v20, v21);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v83;
      v49 = v84;
      goto LABEL_12;
    }
    objc_msgSend_accountIdentity(IDSFoundationLog, v54, v55, v56);
    v58 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_FAULT))
      sub_19BAEE3C0(self, v58, v59, v60);

    v61 = objc_alloc_init(MEMORY[0x1E0D13230]);
    v62 = (void *)MEMORY[0x1E0CB35C8];
    v86 = *MEMORY[0x1E0CB2938];
    v87[0] = CFSTR("Called unseal without an identifier");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)v87, v64, &v86, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v62, v66, (uint64_t)CFSTR("IDSMPIdentityErrorDomain"), v67, -1000, v65);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_failWithError_(v61, v69, (uint64_t)v68, v70);
    objc_msgSend_promise(v61, v71, v72, v73);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v47 = self;
  v48 = (uint64_t)v17;
  v50 = v83;
  v49 = v84;
  v51 = v82;
  objc_msgSend__ngmUnsealMessage_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_(v47, v45, v48, v46, v84, a5, v83, v82, v18, v19, v20, v21);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v52;
}

- (id)_ngmValidateEncryptingAndSigningIdentity:(id)a3 forMessage:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  double v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  const char *v73;
  double v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  double v79;
  void *v80;
  const char *v81;
  double v82;
  id v83;
  const char *v84;
  double v85;
  const char *v86;
  uint64_t v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  double v105;
  NSObject *v106;
  char isVersionSupported;
  uint8_t buf[4];
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0x1E3C19000uLL;
  objc_msgSend_accountIdentity(IDSFoundationLog, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmPublicDeviceIdentity(v6, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB37E8];
    v25 = objc_msgSend_length(v7, v22, v23, v24);
    objc_msgSend_numberWithUnsignedInteger_(v21, v26, v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v110 = v16;
    v111 = 2113;
    v112 = v20;
    v113 = 2113;
    v114 = v28;
    _os_log_impl(&dword_19B949000, v12, OS_LOG_TYPE_DEFAULT, "Unsealing message using ngm identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

  }
  objc_msgSend_ngmPublicDeviceIdentity(v6, v29, v30, v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend_ngmFullDeviceIdentity(self, v32, v33, v35);
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      objc_msgSend_ngmVersion(self, v36, v37, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v44 = (void *)v40;
        objc_msgSend_ngmVersion(v6, v41, v42, v43);
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          v49 = (void *)v45;
          objc_msgSend_ngmVersion(self, v46, v47, v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ngmVersion(v6, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToNumber_(v50, v55, (uint64_t)v54, v56) & 1) != 0)
          {

LABEL_15:
            v60 = 0;
            goto LABEL_24;
          }
          objc_msgSend_ngmVersion(v6, v57, v58, v59);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend_intValue(v68, v69, v70, v71);
          isVersionSupported = objc_msgSend_isVersionSupported_(IDSNGMProtocolVersion, v73, v72, v74);

          v8 = 0x1E3C19000;
          if ((isVersionSupported & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v75 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_ngmVersion(self, v41, v42, v43);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ngmVersion(v6, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v75, v81, (uint64_t)CFSTR("Unable to ngm unseal message due to mismatching versions {encryptingIdentity.ngmVersion: %@, signingIdentity.ngmVersion: %@}"), v82, v76, v80);
      v67 = objc_claimAutoreleasedReturnValue();

      v83 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend_setObject_forKeyedSubscript_(v83, v84, (uint64_t)v67, v85, *MEMORY[0x1E0CB2938]);
      objc_msgSend_ngmVersion(self, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        objc_msgSend_ngmVersion(self, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v83, v94, (uint64_t)v93, v95, CFSTR("encryptingIdentityNGMVersion"));

      }
      objc_msgSend_ngmVersion(v6, v90, v91, v92);
      v96 = (void *)objc_claimAutoreleasedReturnValue();

      if (v96)
      {
        objc_msgSend_ngmVersion(v6, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v83, v101, (uint64_t)v100, v102, CFSTR("signingIdentityNGMVersion"));

      }
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v97, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v99, 14, v83);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountIdentity(*(void **)(v8 + 2856), v103, v104, v105);
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        sub_19BAEE548();

    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v36, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v39, 13, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountIdentity(IDSFoundationLog, v64, v65, v66);
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        sub_19BAEE4C4();
    }

    goto LABEL_24;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v32, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v35, 12, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountIdentity(IDSFoundationLog, v61, v62, v63);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    sub_19BAEE440();
LABEL_24:

  return v60;
}

- (id)_ngmSynchronouslyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  id v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v10, (uint64_t)v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (v12)
  {
    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmPublicDeviceIdentity(v9, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend_unsealMessage_signedByPublicIdentity_error_(v18, v23, (uint64_t)v8, v24, v22, &v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v32;

    if (!v17)
    {
      if (v25)
      {
        v33 = *MEMORY[0x1E0CB3388];
        v34[0] = v25;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v26, (uint64_t)v34, v27, &v33, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v29, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v30, 15, v28);
      }
      else
      {
        v28 = 0;
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v26, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v27, 15, 0);
      }
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v17;
}

- (id)_ngmUnsealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  double v23;
  void *v24;
  id v25;
  const char *v26;
  double v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  BOOL v39;
  BOOL v41;
  int v42;
  id v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  double v52;
  NSObject *v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  int v67;
  id v68;
  void *v70;
  id v71;
  void *v72;
  id v73;
  _QWORD aBlock[4];
  id v75;
  IDSMPFullDeviceIdentityContainer *v76;
  id v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v71 = a4;
  v73 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v22, (uint64_t)v21, v23, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0D13230]);
  v28 = v25;
  v70 = v16;
  v72 = v19;
  if (v24)
  {
    v29 = v18;
    objc_msgSend_failWithError_(v25, v26, (uint64_t)v24, v27);
    v33 = v71;
LABEL_21:
    objc_msgSend_promise(v28, v30, v31, v32);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19B97A2D8;
  aBlock[3] = &unk_1E3C1C6E8;
  v64 = v25;
  v75 = v64;
  v76 = self;
  v34 = v21;
  v77 = v34;
  v35 = _Block_copy(aBlock);
  if (v17)
    v39 = v18 == 0;
  else
    v39 = 1;
  v41 = v39 || v19 == 0 || v20 == 0;
  v42 = !v41;
  v67 = v42;
  v68 = v20;
  v66 = v35;
  if (v41)
  {
    v29 = v18;
    objc_msgSend_accountIdentity(IDSFoundationLog, v36, v37, v38);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v79 = v17;
      v80 = 2112;
      v81 = v18;
      v82 = 2112;
      v83 = v19;
      v84 = 2112;
      v85 = v20;
      _os_log_error_impl(&dword_19B949000, v53, OS_LOG_TYPE_ERROR, "Failed to unseal message - one or more required fields is nil {sendingURI: %@ sendingPushToken: %@ receivingURI: %@ receivingPushToken: %@}", buf, 0x2Au);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v54, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v55, 20, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v64, v57, (uint64_t)v56, v58);

    objc_msgSend_promise(v64, v59, v60, v61);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v71;
  }
  else
  {
    v43 = v19;
    v44 = v35;
    objc_msgSend_ngmFullDeviceIdentity(self, v36, v37, v38);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmPublicDeviceIdentity(v34, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v44;
    v49 = v65;
    v50 = (uint64_t)v16;
    v33 = v71;
    v29 = v18;
    objc_msgSend_unsealMessageAndAttributes_authenticatedData_messageType_guid_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock_(v65, v51, v50, v52, v71, a5, v73, v17, v18, v43, v68, v48, v63);

    v20 = v68;
  }

  if (v67)
    goto LABEL_21;
LABEL_22:

  return v49;
}

- (id)_legacyUnsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
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
  const char *v54;
  double v55;
  NSObject *v56;
  const char *v57;
  double v58;
  NSObject *v59;
  const char *v60;
  double v61;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_accountIdentity(IDSFoundationLog, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_legacyFullIdentity(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_legacyPublicIdentity(v9, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v26 = objc_msgSend_length(v8, v23, v24, v25);
    objc_msgSend_numberWithUnsignedInteger_(v22, v27, v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478339;
    v72 = v17;
    v73 = 2113;
    v74 = v21;
    v75 = 2113;
    v76 = v29;
    _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Unsealing message using legacy identities {encryptingIdentity: %{private}@, signingIdentity: %{private}@, message.length: %{private}@}", buf, 0x20u);

  }
  objc_msgSend_legacyPublicIdentity(v9, v30, v31, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend_legacyFullIdentity(self, v33, v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v37;
    if (v37)
    {
      v68 = 0;
      objc_msgSend_verifyAndExposeData_withSigner_error_(v37, v38, (uint64_t)v8, v40, v35, &v68);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v68;
      if (!v42)
      {
        objc_msgSend_accountIdentity(IDSFoundationLog, v43, v44, v46);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_debugDescription(self, v48, v49, v50);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_debugDescription(v9, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v72 = v45;
          v73 = 2113;
          v74 = v63;
          v75 = 2113;
          v76 = v67;
          _os_log_error_impl(&dword_19B949000, v47, OS_LOG_TYPE_ERROR, "MessageProtection failed to decrypt with legacy identities - fail to unseal message {error: %{public}@, encryptingIdentity: %{private}@, signingIdentity:%{private}@}", buf, 0x20u);

        }
        if (a5)
        {
          if (v45)
          {
            v69 = *MEMORY[0x1E0CB3388];
            v70 = v45;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)&v70, v52, &v69, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v54, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v55, 11, v53);
          }
          else
          {
            v53 = 0;
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v51, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v52, 11, 0);
          }
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v38, v39, v40);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
        sub_19BAEE6F4();

      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v60, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v61, 10, 0);
        v42 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }
    }

  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v33, v34, v36);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      sub_19BAEE678();

    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v57, (uint64_t)CFSTR("com.apple.ids.IDSDecryptionErrorDomain"), v58, 9, 0);
      v42 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
  }

  return v42;
}

- (id)_paddyUnsealMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  double v21;
  void *v22;
  id v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  id v47;
  _QWORD aBlock[5];
  id v49;
  id v50;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend__ngmValidateEncryptingAndSigningIdentity_forMessage_(self, v20, (uint64_t)v19, v21, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0D13230]);
  v26 = v23;
  if (v22)
  {
    objc_msgSend_failWithError_(v23, v24, (uint64_t)v22, v25);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_19B97AAE8;
    aBlock[3] = &unk_1E3C1C710;
    aBlock[4] = self;
    v47 = v18;
    v30 = v17;
    v31 = v16;
    v32 = v15;
    v33 = v19;
    v49 = v33;
    v50 = v26;
    v34 = _Block_copy(aBlock);
    objc_msgSend_ngmFullDeviceIdentity(self, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ngmPublicDeviceIdentity(v33, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_openPaddyMessage_sendingURI_sendingPushToken_receivingURI_receivingPushToken_signedByPublicIdentity_decryptionBlock_(v38, v43, (uint64_t)v14, v44, v32, v31, v30, v47, v42, v34);

    v15 = v32;
    v16 = v31;
    v17 = v30;
    v18 = v47;

  }
  objc_msgSend_promise(v26, v27, v28, v29);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
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
  objc_msgSend_legacyFullIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmFullDeviceIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmVersion(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@: %p legacyFullIdentity: %@, ngmFullDeviceIdentity: %@, ngmVersion: %@>"), v18, v4, self, v8, v12, v16);
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
  objc_msgSend_legacyFullIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmFullDeviceIdentity(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ngmVersion(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v25, (uint64_t)CFSTR("<%@: %p legacyFullIdentity: %@, ngmFullDeviceIdentity: %@, ngmVersion: %@>"), v26, v4, self, v12, v20, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (IDSMPFullLegacyIdentity)legacyFullIdentity
{
  return self->_legacyFullIdentity;
}

- (IDSNGMFullDeviceIdentity)ngmFullDeviceIdentity
{
  return self->_ngmFullDeviceIdentity;
}

- (NSNumber)ngmVersion
{
  return self->_ngmVersion;
}

- (NSData)cachedLegacySerializedData
{
  return self->_cachedLegacySerializedData;
}

- (void)setCachedLegacySerializedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLegacySerializedData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLegacySerializedData, 0);
  objc_storeStrong((id *)&self->_ngmVersion, 0);
  objc_storeStrong((id *)&self->_ngmFullDeviceIdentity, 0);
  objc_storeStrong((id *)&self->_legacyFullIdentity, 0);
}

@end
