@implementation IDSLegacyDeviceMessageProtectionCypher

- (IDSLegacyDeviceMessageProtectionCypher)initWithPublicIdentity:(id)a3
{
  id v5;
  IDSLegacyDeviceMessageProtectionCypher *v6;
  IDSLegacyDeviceMessageProtectionCypher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSLegacyDeviceMessageProtectionCypher;
  v6 = -[IDSLegacyDeviceMessageProtectionCypher init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_publicIdentity, a3);

  return v7;
}

+ (id)cypherWithEndpoint:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v5 = a3;
  v6 = objc_alloc((Class)a1);
  objc_msgSend_publicDeviceIdentityContainer(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_legacyPublicIdentity(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithPublicIdentity_(v6, v15, (uint64_t)v14, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend_publicIdentity(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, CFSTR("kIDSLegacyDeviceMessageProtectionCypherPublicIdentity"));

}

- (IDSLegacyDeviceMessageProtectionCypher)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  IDSLegacyDeviceMessageProtectionCypher *v12;
  NSObject *v13;
  uint8_t v15[16];

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSLegacyDeviceMessageProtectionCypherPublicIdentity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = (IDSLegacyDeviceMessageProtectionCypher *)(id)objc_msgSend_initWithPublicIdentity_(self, v9, (uint64_t)v8, v11);
    v12 = self;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Failed to initWithCoder MPLegacy cypher", v15, 2u);
    }

    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)IDSEncryptionTypeStringFromEncryptionType(1);
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  void *v50;
  id v51;
  int v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1E0D36AA8];
  v11 = a4;
  objc_msgSend_registration(v10, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v53) = 0;
    _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_INFO, "LegacyMP cypher data - Begin", (uint8_t *)&v53, 2u);
  }

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_19BAF73E8((uint64_t)v9, v19, v20, v21, v22, v23, v24, v25);

  objc_msgSend__fullIdentityFromAccountIdentity_error_(self, v26, (uint64_t)v11, v27, a6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_publicIdentity(self, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signAndProtectData_withSigner_error_(v32, v33, (uint64_t)v9, v34, v28, a6);
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v36, v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v35)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_INFO, "LegacyMP cypher data - encryption success - Done", (uint8_t *)&v53, 2u);
      }

      v35 = v35;
      v41 = v35;
    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_publicIdentity(self, v46, v47, v48);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v49;
        if (a6)
          v51 = *a6;
        else
          v51 = 0;
        v53 = 138478595;
        v54 = v9;
        v55 = 2113;
        v56 = v28;
        v57 = 2113;
        v58 = v49;
        v59 = 2114;
        v60 = v51;
        _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "LegacyMP cypher data - missing decryption failed - Fail {data: %{private}@, fullIdentity: %{private}@, publicIdentity: %{private}@, error: %{public}@}", (uint8_t *)&v53, 0x2Au);

      }
      v41 = 0;
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v29, v30, v31);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_publicIdentity(self, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 138478083;
      v54 = v9;
      v55 = 2114;
      v56 = v45;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "LegacyMP cypher data - missing full identity - Fail {data: %{private}@, publicIdentity: %{public}@}", (uint8_t *)&v53, 0x16u);

    }
    v41 = 0;
  }

  return v41;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  void *v51;
  id v52;
  int v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)MEMORY[0x1E0D36AA8];
  v12 = a4;
  objc_msgSend_registration(v11, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v54) = 0;
    _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_INFO, "LegacyMP decypher data - Begin", (uint8_t *)&v54, 2u);
  }

  objc_msgSend__fullIdentityFromAccountIdentity_error_(self, v17, (uint64_t)v12, v18, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_publicIdentity(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_verifyAndExposeData_withSigner_error_(v19, v24, (uint64_t)v10, v25, v23, a7);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v26)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v54) = 0;
        _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_INFO, "LegacyMP decypher data - decryption success - Done", (uint8_t *)&v54, 2u);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v32, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        sub_19BAF7450((uint64_t)v26, v35, v36, v37, v38, v39, v40, v41);

      v26 = v26;
      v42 = v26;
    }
    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_publicIdentity(self, v47, v48, v49);
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = (void *)v50;
        if (a7)
          v52 = *a7;
        else
          v52 = 0;
        v54 = 138478595;
        v55 = v10;
        v56 = 2114;
        v57 = v50;
        v58 = 2113;
        v59 = v19;
        v60 = 2114;
        v61 = v52;
        _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "LegacyMP decyper data - decryption failed - Fail {data: %{private}@, publicIdentity: %{public}@, fullIdentity: %{private}@, error: %{public}@}", (uint8_t *)&v54, 0x2Au);

      }
      v42 = 0;
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v20, v21, v22);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_publicIdentity(self, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138543618;
      v55 = v10;
      v56 = 2114;
      v57 = (uint64_t)v46;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "LegacyMP decypher data - missing full identity - Fail {data: %{public}@, publicIdentity: %{public}@", (uint8_t *)&v54, 0x16u);

    }
    v42 = 0;
  }

  return v42;
}

- (id)_fullIdentityFromAccountIdentity:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  double v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  NSObject *v26;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_deviceKey(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_legacyIdentity(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    if (v13)
    {
      v17 = v13;
      v18 = v17;
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15, v16);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v31 = v5;
        _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "Failed ot create full identity from account identity {accountIdentity: %{private}@}", buf, 0xCu);
      }

      v18 = 0;
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v31 = v5;
      _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Failed to create full identity from account identity - class mismatch {accountIdentity: %{private}@}", buf, 0xCu);
    }

    if (!a4)
    {
      v18 = 0;
      goto LABEL_12;
    }
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D1F420];
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Device Identity class mismatch expected IDSDeviceIdentity");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v29, v21, &v28, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, v23, v25, -2000, v17);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v18;
}

- (IDSMPPublicLegacyIdentity)publicIdentity
{
  return self->_publicIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicIdentity, 0);
}

@end
