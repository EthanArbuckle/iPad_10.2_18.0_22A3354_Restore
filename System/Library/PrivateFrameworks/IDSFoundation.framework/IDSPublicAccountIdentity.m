@implementation IDSPublicAccountIdentity

- (IDSPublicAccountIdentity)initWithAccountIdentity:(id)a3 adminIdentity:(id)a4 signingIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSPublicAccountIdentity *v12;
  IDSPublicAccountIdentity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSPublicAccountIdentity;
  v12 = -[IDSPublicAccountIdentity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_adminIdentity, a4);
    objc_storeStrong((id *)&v13->_signingIdentity, a5);
  }

  return v13;
}

- (IDSPublicAccountIdentity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  id v21;
  double v22;
  void *v23;
  id v24;
  const char *v25;
  double v26;
  uint64_t v27;
  IDSPublicAccountIdentity *v28;
  void *v29;
  const char *v30;
  double v31;
  IDSPublicAccountIdentity *v32;
  void *v34;
  id v35;
  id v36;
  id v37;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSPublicAccountIdentityAccountData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("kIDSPublicAccountIdentityAdminData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("kIDSPublicAccountIdentitySigningData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend_publicAccountIdentitywithDataRepresentation_error_(IDSMPPublicAccountIdentity, v17, (uint64_t)v8, v18, &v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v37;
  if (v19)
  {
    v36 = v21;
    objc_msgSend_publicServiceIdentityAdminWithDataRepresentation_publicAccountIdentity_error_(IDSMPPublicServiceIdentityAdmin, v20, (uint64_t)v12, v22, v19, &v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v36;

    if (v23)
    {
      v27 = (uint64_t)v16;
      v28 = self;
      v34 = (void *)v27;
      v35 = v24;
      objc_msgSend_publicServiceIdentitySigningWithDataRepresentation_publicAccountIdentity_error_(IDSMPPublicServiceIdentitySigning, v25, v27, v26, v19, &v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v35;

      if (v29)
      {
        v32 = (IDSPublicAccountIdentity *)(id)objc_msgSend_initWithAccountIdentity_adminIdentity_signingIdentity_(v28, v30, (uint64_t)v19, v31, v23, v29);
        v28 = v32;
      }
      else
      {
        objc_msgSend_failWithError_(v4, v30, (uint64_t)v21, v31);
        v32 = 0;
      }

      self = v28;
      v16 = v34;
    }
    else
    {
      objc_msgSend_failWithError_(v4, v25, (uint64_t)v24, v26);
      v32 = 0;
      v21 = v24;
    }

  }
  else
  {
    objc_msgSend_failWithError_(v4, v20, (uint64_t)v21, v22);
    v32 = 0;
  }

  return v32;
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
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  id v34;
  id v35;
  id v36;

  v4 = a3;
  objc_msgSend_accountIdentity(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend_dataRepresentationWithError_(v8, v9, (uint64_t)&v36, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v36;

  if (v11)
  {
    objc_msgSend_adminIdentity(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v12;
    objc_msgSend_dataRepresentationWithError_(v16, v17, (uint64_t)&v35, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v35;

    if (v19)
    {
      objc_msgSend_signingIdentity(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      objc_msgSend_dataRepresentationWithError_(v24, v25, (uint64_t)&v34, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v34;

      if (v27)
      {
        objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v11, v29, CFSTR("kIDSPublicAccountIdentityAccountData"));
        objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v19, v31, CFSTR("kIDSPublicAccountIdentityAdminData"));
        objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v27, v33, CFSTR("kIDSPublicAccountIdentitySigningData"));
      }
      else
      {
        objc_msgSend_failWithError_(v4, v28, (uint64_t)v12, v29);
      }

    }
    else
    {
      objc_msgSend_failWithError_(v4, v21, (uint64_t)v20, v23);
      v12 = v20;
    }

  }
  else
  {
    objc_msgSend_failWithError_(v4, v13, (uint64_t)v12, v15);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (IDSMPPublicAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (IDSMPPublicServiceIdentityAdmin)adminIdentity
{
  return self->_adminIdentity;
}

- (IDSMPPublicServiceIdentitySigning)signingIdentity
{
  return self->_signingIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_adminIdentity, 0);
  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end
