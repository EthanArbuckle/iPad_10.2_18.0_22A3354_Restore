@implementation IDSAccountIdentity

- (IDSAccountIdentity)initWithFullCluster:(id)a3
{
  id v5;
  IDSAccountIdentity *v6;
  IDSAccountIdentity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAccountIdentity;
  v6 = -[IDSAccountIdentity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identityCluster, a3);

  return v7;
}

- (IDSPublicAccountIdentity)accountPublicKey
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
  double v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  IDSPublicAccountIdentity *v28;
  const char *v29;
  double v30;
  void *v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  IDSAccountIdentity *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend_adminIdentity(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend_publicServiceIdentityAdminWithError_(v5, v6, (uint64_t)&v36, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v36;

  if (v8)
  {
    objc_msgSend_signingIdentity(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v9;
    objc_msgSend_publicServiceIdentitySigningWithError_(v13, v14, (uint64_t)&v35, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v35;

    if (v16)
    {
      objc_msgSend_accountIdentity(self, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v17;
      objc_msgSend_publicAccountIdentityWithError_(v21, v22, (uint64_t)&v34, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v9 = v34;

      if (v24)
      {
        v28 = [IDSPublicAccountIdentity alloc];
        v31 = (void *)objc_msgSend_initWithAccountIdentity_adminIdentity_signingIdentity_(v28, v29, (uint64_t)v24, v30, v8, v16);
      }
      else
      {
        objc_msgSend_registration(MEMORY[0x1E0D36AA8], v25, v26, v27);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v38 = self;
          v39 = 2114;
          v40 = v9;
          _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "Failed to create publicAccountIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
        }

        v31 = 0;
      }
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19, v20);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = self;
        v39 = 2114;
        v40 = v17;
        _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "Failed to create publicSigningIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
      }
      v31 = 0;
      v9 = v17;
    }

  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v38 = self;
      v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create publicAdminIdentity for IDSPublicAccountIdentity {IDSAccountIdentity: %{public}@, error: %{public}@}", buf, 0x16u);
    }
    v31 = 0;
  }

  return (IDSPublicAccountIdentity *)v31;
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
  objc_msgSend_accountIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adminIdentity(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signingIdentity(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@ %p accountIdentity: %@, adminIdentity: %@, signingIdentity: %@>"), v18, v4, self, v8, v12, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (IDSAccountIdentity)initWithCoder:(id)a3
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
  IDSAccountIdentity *v15;
  id v17;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSAccountIdentityClusterData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend_clusterWithDataRepresentation_error_(IDSMPFullAccountIdentityCluster, v9, (uint64_t)v8, v10, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v11)
  {
    self = (IDSAccountIdentity *)(id)objc_msgSend_initWithFullCluster_(self, v12, (uint64_t)v11, v14);
    v15 = self;
  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    v15 = 0;
  }

  return v15;
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
  id v15;

  v4 = a3;
  objc_msgSend_identityCluster(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v15, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v11)
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, CFSTR("kIDSAccountIdentityClusterData"));
  else
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v14);

}

- (IDSMPFullAccountIdentity)accountIdentity
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_identityCluster(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fullAccountIdentity(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSMPFullAccountIdentity *)v8;
}

- (IDSMPFullServiceIdentityAdmin)adminIdentity
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_identityCluster(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adminServiceIdentityWithType_(v4, v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSMPFullServiceIdentityAdmin *)v7;
}

- (IDSMPFullServiceIdentitySigning)signingIdentity
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_identityCluster(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signingServiceIdentityWithType_(v4, v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSMPFullServiceIdentitySigning *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMPFullAccountIdentityCluster)identityCluster
{
  return self->_identityCluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityCluster, 0);
}

@end
