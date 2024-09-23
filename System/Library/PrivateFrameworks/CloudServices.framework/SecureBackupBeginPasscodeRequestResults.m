@implementation SecureBackupBeginPasscodeRequestResults

- (SecureBackupBeginPasscodeRequestResults)initWithStoredCertificate:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  SecureBackupBeginPasscodeRequestResults *v10;
  uint64_t v11;
  NSString *iCloudEnvironment;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *escrowFederation;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSData *cert;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *dsid;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SecureBackupBeginPasscodeRequestResults;
  v10 = -[SecureBackupBeginPasscodeRequestResults init](&v26, sel_init);
  if (v10)
  {
    objc_msgSend_iCloudEnvironment(v6, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    iCloudEnvironment = v10->_iCloudEnvironment;
    v10->_iCloudEnvironment = (NSString *)v11;

    objc_msgSend_escrowBaseURL(v6, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    escrowFederation = v10->_escrowFederation;
    v10->_escrowFederation = (NSString *)v15;

    objc_msgSend_escrowCertificate(v6, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    cert = v10->_cert;
    v10->_cert = (NSData *)v19;

    objc_msgSend_dsid(v6, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    dsid = v10->_dsid;
    v10->_dsid = (NSString *)v23;

    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_uuid(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_iCloudEnvironment(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_escrowFederation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cert(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dsid(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v20, (uint64_t)CFSTR("<SBBPRR: %@ %@ %@ %@ %@>"), v5, v8, v11, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  id v20;

  v4 = a3;
  objc_msgSend_iCloudEnvironment(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("iCloudEnvironment"));

  objc_msgSend_escrowFederation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, CFSTR("escrowFederation"));

  objc_msgSend_cert(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, CFSTR("cert"));

  objc_msgSend_dsid(self, v17, v18);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v20, CFSTR("dsid"));

}

- (SecureBackupBeginPasscodeRequestResults)initWithCoder:(id)a3
{
  id v4;
  SecureBackupBeginPasscodeRequestResults *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *iCloudEnvironment;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *escrowFederation;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSData *cert;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *dsid;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SecureBackupBeginPasscodeRequestResults;
  v5 = -[SecureBackupBeginPasscodeRequestResults init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("iCloudEnvironment"));
    v8 = objc_claimAutoreleasedReturnValue();
    iCloudEnvironment = v5->_iCloudEnvironment;
    v5->_iCloudEnvironment = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("escrowFederation"));
    v12 = objc_claimAutoreleasedReturnValue();
    escrowFederation = v5->_escrowFederation;
    v5->_escrowFederation = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("cert"));
    v16 = objc_claimAutoreleasedReturnValue();
    cert = v5->_cert;
    v5->_cert = (NSData *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("dsid"));
    v20 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v20;

  }
  return v5;
}

- (NSString)iCloudEnvironment
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)escrowFederation
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)cert
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_cert, 0);
  objc_storeStrong((id *)&self->_escrowFederation, 0);
  objc_storeStrong((id *)&self->_iCloudEnvironment, 0);
}

@end
