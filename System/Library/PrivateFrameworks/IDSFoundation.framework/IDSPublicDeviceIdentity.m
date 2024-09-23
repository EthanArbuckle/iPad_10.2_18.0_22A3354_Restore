@implementation IDSPublicDeviceIdentity

- (IDSPublicDeviceIdentity)initWithPublicLegacyIdentity:(id)a3 modernIdentity:(id)a4 accountIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSPublicDeviceIdentity *v12;
  IDSPublicDeviceIdentity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSPublicDeviceIdentity;
  v12 = -[IDSPublicDeviceIdentity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_legacyIdentity, a3);
    objc_storeStrong((id *)&v13->_modernIdentity, a4);
    objc_storeStrong((id *)&v13->_accountIdentity, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPublicDeviceIdentity)initWithCoder:(id)a3
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
  void *v30;
  id v31;
  const char *v32;
  double v33;
  IDSPublicDeviceIdentity *v34;
  id v36;
  id v37;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("kIDSPublicDeviceIdentityLegacy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend_identityWithData_error_(IDSMPPublicLegacyIdentity, v9, (uint64_t)v8, v10, &v37);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v37;
  if (v11)
  {
    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, v17, CFSTR("kIDSPublicDeviceIdentityAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, v21, CFSTR("kIDSPublicDeviceIdentityModern"));
    v22 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v22;
    if (v18 && v22)
    {
      objc_msgSend_adminIdentity(v18, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v13;
      objc_msgSend_deviceIdentityFromDataRepresentation_publicAdminServiceIdentity_error_(IDSMPPublicDeviceIdentity, v28, (uint64_t)v26, v29, v27, &v36);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v36;

      if (v30)
      {
        self = (IDSPublicDeviceIdentity *)(id)objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(self, v32, (uint64_t)v11, v33, v30, v18);
        v13 = v31;
        v34 = self;
      }
      else
      {
        objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
        v13 = v31;
        v34 = 0;
      }

    }
    else
    {
      self = (IDSPublicDeviceIdentity *)(id)objc_msgSend_initWithPublicLegacyIdentity_modernIdentity_accountIdentity_(self, v23, (uint64_t)v11, v25, 0, 0);
      v34 = self;
    }

  }
  else
  {
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v13, v14);
    v34 = 0;
  }

  return v34;
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
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v14, CFSTR("kIDSPublicDeviceIdentityLegacy"));
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
    objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v30, v33, CFSTR("kIDSPublicDeviceIdentityModern"));
    objc_msgSend_accountIdentity(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, v39, CFSTR("kIDSPublicDeviceIdentityAccount"));

  }
  else
  {
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31, v33);
  }

LABEL_10:
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

- (IDSMPPublicLegacyIdentity)legacyIdentity
{
  return self->_legacyIdentity;
}

- (IDSMPPublicDeviceIdentity)modernIdentity
{
  return self->_modernIdentity;
}

- (IDSPublicAccountIdentity)accountIdentity
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
