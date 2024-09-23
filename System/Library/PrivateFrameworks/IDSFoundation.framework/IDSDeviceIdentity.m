@implementation IDSDeviceIdentity

- (IDSDeviceIdentity)initWithLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSDeviceIdentity *v12;
  IDSDeviceIdentity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSDeviceIdentity;
  v12 = -[IDSDeviceIdentity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyIdentity, a3);
    objc_storeStrong((id *)&v13->_modernIdentity, a4);
    objc_storeStrong((id *)&v13->_accountIdentity, a5);
  }

  return v13;
}

- (ENDevicePublicKey)devicePublicKey
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  NSObject *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  IDSPublicDeviceIdentity *v26;
  const char *v27;
  double v28;
  void *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  IDSDeviceIdentity *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_legacyIdentity(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend_publicIdentityWithError_(v5, v6, (uint64_t)&v32, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v32;

  if (v8)
  {
    objc_msgSend_modernIdentity(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v9;
    objc_msgSend_publicDeviceIdentityWithError_(v13, v14, (uint64_t)&v31, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v31;

    if (v16)
    {
      objc_msgSend_accountIdentity(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountPublicKey(v21, v22, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = [IDSPublicDeviceIdentity alloc];
      v29 = (void *)objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(v26, v27, (uint64_t)v8, v28, v16, v25);
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19, v20);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v34 = self;
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_19B949000, v25, OS_LOG_TYPE_DEFAULT, "Failed to create modernPublicKey {deviceIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
      }
      v29 = 0;
    }

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v34 = self;
      v35 = 2114;
      v36 = v9;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create legacyPublicKey {deviceIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
    }
    v29 = 0;
    v17 = v9;
  }

  return (ENDevicePublicKey *)v29;
}

- (NSString)description
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
  objc_msgSend_legacyIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modernIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountIdentity(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@ %p legacyIdentity: %@, modernIdentity: %@, accountIdentity: %@>"), v18, v4, self, v8, v12, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSDeviceIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  id v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  id v36;
  const char *v37;
  double v38;
  IDSDeviceIdentity *v39;
  NSObject *v40;
  const char *v41;
  double v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSDeviceIdentityLegacy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend_identityWithData_error_(IDSMPFullLegacyIdentity, v9, (uint64_t)v8, v10, &v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v47;
  if (v11)
  {
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, v17, CFSTR("kIDSDeviceIdentityAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, v21, CFSTR("kIDSDeviceIdentityModern"));
    v22 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v22;
    if (v18 && v22)
    {
      objc_msgSend_adminIdentity(v18, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      objc_msgSend_publicServiceIdentityAdminWithError_(v27, v28, (uint64_t)&v46, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v46;

      if (v30)
      {
        v45 = v31;
        objc_msgSend_deviceIdentityFromDataRepresentation_publicAdminServiceIdentity_error_(IDSMPFullDeviceIdentity, v32, (uint64_t)v26, v34, v30, &v45, v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v45;

        if (v35)
        {
          self = (IDSDeviceIdentity *)(id)objc_msgSend_initWithLegacyIdentity_modernIdentity_accountIdentity_(self, v37, (uint64_t)v11, v38, v35, v18);
          v39 = self;
        }
        else
        {
          objc_msgSend_failWithError_(v4, v37, (uint64_t)v36, v38);
          v39 = 0;
        }

        v31 = v36;
      }
      else
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v32, v33, v34, 0);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v49 = v18;
          v50 = 2114;
          v51 = v31;
          _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "Failed to initWithCoder missing publicAdminKey from account {account: %{public}@, error: %{public}@", buf, 0x16u);
        }

        objc_msgSend_failWithError_(v4, v41, (uint64_t)v31, v42);
        v39 = 0;
      }

      v13 = v31;
    }
    else
    {
      self = (IDSDeviceIdentity *)(id)objc_msgSend_initWithLegacyIdentity_modernIdentity_accountIdentity_(self, v23, (uint64_t)v11, v25, 0, 0);
      v39 = self;
    }

  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    v39 = 0;
  }

  return v39;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  id v31;
  const char *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  id v40;
  id v41;

  v4 = a3;
  objc_msgSend_legacyIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v41, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v41;

  if (!v11)
  {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v14);
LABEL_7:
    v31 = v12;
    goto LABEL_10;
  }
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, CFSTR("kIDSDeviceIdentityLegacy"));
  objc_msgSend_modernIdentity(self, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_7;
  v22 = (void *)v18;
  objc_msgSend_accountIdentity(self, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_7;
  objc_msgSend_modernIdentity(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  objc_msgSend_dataRepresentationWithError_(v27, v28, (uint64_t)&v40, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v40;

  if (v30)
  {
    objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v30, v33, CFSTR("kIDSDeviceIdentityModern"));
    objc_msgSend_accountIdentity(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, v39, CFSTR("kIDSDeviceIdentityAccount"));

  }
  else
  {
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
  }

LABEL_10:
}

- (IDSMPFullLegacyIdentity)legacyIdentity
{
  return self->_legacyIdentity;
}

- (IDSMPFullDeviceIdentity)modernIdentity
{
  return self->_modernIdentity;
}

- (IDSAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentity, 0);
  objc_storeStrong((id *)&self->_modernIdentity, 0);
  objc_storeStrong((id *)&self->_legacyIdentity, 0);
}

@end
