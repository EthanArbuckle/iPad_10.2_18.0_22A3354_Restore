@implementation TKTokenKeychainCertificate

- (TKTokenKeychainCertificate)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  TKTokenKeychainCertificate *v5;
  CFDataRef v6;
  NSData *data;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSNumber *certificateType;
  uint64_t v14;
  NSNumber *certificateEncoding;
  uint64_t v16;
  NSData *subject;
  uint64_t v18;
  NSData *issuer;
  uint64_t v20;
  NSData *serialNumber;
  uint64_t v22;
  NSData *subjectKeyID;
  uint64_t v24;
  void *publicKeyHash;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  SecCertificateRef v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)TKTokenKeychainCertificate;
  v5 = -[TKTokenKeychainItem initWithObjectID:](&v28, sel_initWithObjectID_, objectID);
  if (v5)
  {
    v6 = SecCertificateCopyData(certificateRef);
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    -[TKTokenKeychainItem setLabel:](v5, "setLabel:", v8);

    v31 = &unk_1E7097798;
    v32[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenKeychainItem setConstraints:](v5, "setConstraints:", v9);

    v10 = (void *)SecCertificateCopyAttributeDictionary();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CD6980]);
      v12 = objc_claimAutoreleasedReturnValue();
      certificateType = v5->_certificateType;
      v5->_certificateType = (NSNumber *)v12;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD6978]);
      v14 = objc_claimAutoreleasedReturnValue();
      certificateEncoding = v5->_certificateEncoding;
      v5->_certificateEncoding = (NSNumber *)v14;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD6B68]);
      v16 = objc_claimAutoreleasedReturnValue();
      subject = v5->_subject;
      v5->_subject = (NSData *)v16;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD69E8]);
      v18 = objc_claimAutoreleasedReturnValue();
      issuer = v5->_issuer;
      v5->_issuer = (NSData *)v18;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD6B48]);
      v20 = objc_claimAutoreleasedReturnValue();
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSData *)v20;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD6B70]);
      v22 = objc_claimAutoreleasedReturnValue();
      subjectKeyID = v5->_subjectKeyID;
      v5->_subjectKeyID = (NSData *)v22;

      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CD6B30]);
      v24 = objc_claimAutoreleasedReturnValue();
      publicKeyHash = v5->_publicKeyHash;
      v5->_publicKeyHash = (NSData *)v24;
    }
    else
    {
      TK_LOG_token_2();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v30 = certificateRef;
        _os_log_impl(&dword_1B9768000, v26, OS_LOG_TYPE_DEFAULT, "Failed to get attributes from certificate %{public}@", buf, 0xCu);
      }

      publicKeyHash = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (id)encodedObjectID
{
  void *v2;
  void *v3;

  -[TKTokenKeychainItem objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TKTokenID encodedCertificateID:](TKTokenID, "encodedCertificateID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TKTokenKeychainCertificate)initWithItemInfo:(id)a3
{
  id v4;
  TKTokenKeychainCertificate *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSNumber *certificateType;
  uint64_t v10;
  NSNumber *certificateEncoding;
  uint64_t v12;
  NSData *subject;
  uint64_t v14;
  NSData *issuer;
  uint64_t v16;
  NSData *serialNumber;
  uint64_t v18;
  NSData *subjectKeyID;
  uint64_t v20;
  NSData *publicKeyHash;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TKTokenKeychainCertificate;
  v5 = -[TKTokenKeychainItem initWithItemInfo:](&v23, sel_initWithItemInfo_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD70D8]);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6980]);
    v8 = objc_claimAutoreleasedReturnValue();
    certificateType = v5->_certificateType;
    v5->_certificateType = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6978]);
    v10 = objc_claimAutoreleasedReturnValue();
    certificateEncoding = v5->_certificateEncoding;
    v5->_certificateEncoding = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6B68]);
    v12 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSData *)v12;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD69E8]);
    v14 = objc_claimAutoreleasedReturnValue();
    issuer = v5->_issuer;
    v5->_issuer = (NSData *)v14;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6B48]);
    v16 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSData *)v16;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6B70]);
    v18 = objc_claimAutoreleasedReturnValue();
    subjectKeyID = v5->_subjectKeyID;
    v5->_subjectKeyID = (NSData *)v18;

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD6B30]);
    v20 = objc_claimAutoreleasedReturnValue();
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v20;

  }
  return v5;
}

- (id)keychainAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TKTokenKeychainCertificate;
  -[TKTokenKeychainItem keychainAttributes](&v13, sel_keychainAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA0], *MEMORY[0x1E0CD6C98]);
  -[TKTokenKeychainCertificate data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD70D8]);

  -[TKTokenKeychainCertificate subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6B68]);

  -[TKTokenKeychainCertificate issuer](self, "issuer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CD69E8]);

  -[TKTokenKeychainCertificate serialNumber](self, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6B48]);

  -[TKTokenKeychainCertificate subjectKeyID](self, "subjectKeyID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD6B70]);

  -[TKTokenKeychainCertificate publicKeyHash](self, "publicKeyHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6B30]);

  -[TKTokenKeychainCertificate certificateType](self, "certificateType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CD6980]);

  -[TKTokenKeychainCertificate certificateEncoding](self, "certificateEncoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6978]);

  return v3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)subject
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)issuer
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIssuer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSData)serialNumber
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSData)subjectKeyID
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubjectKeyID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)certificateType
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCertificateType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)certificateEncoding
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCertificateEncoding:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateEncoding, 0);
  objc_storeStrong((id *)&self->_certificateType, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_subjectKeyID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
