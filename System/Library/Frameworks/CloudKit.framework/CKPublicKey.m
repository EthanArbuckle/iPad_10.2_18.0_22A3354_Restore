@implementation CKPublicKey

- (CKPublicKey)initWithPublicKey:(id)a3 version:(int64_t)a4 expiration:(id)a5 certificateData:(id)a6 protectionSource:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKPublicKey *v19;
  uint64_t v20;
  NSData *publicKey;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSDate *expiration;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSData *certData;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *protectionSource;
  objc_super v38;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v38.receiver = self;
  v38.super_class = (Class)CKPublicKey;
  v19 = -[CKPublicKey init](&v38, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v12, v16, v17, v18);
    publicKey = v19->_publicKey;
    v19->_publicKey = (NSData *)v20;

    v19->_version = a4;
    v25 = objc_msgSend_copy(v13, v22, v23, v24);
    expiration = v19->_expiration;
    v19->_expiration = (NSDate *)v25;

    v30 = objc_msgSend_copy(v14, v27, v28, v29);
    certData = v19->_certData;
    v19->_certData = (NSData *)v30;

    v35 = objc_msgSend_copy(v15, v32, v33, v34);
    protectionSource = v19->_protectionSource;
    v19->_protectionSource = (NSString *)v35;

  }
  return v19;
}

- (BOOL)hasExpired
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;

  objc_msgSend_expiration(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_compare_(v4, v9, (uint64_t)v8, v10) == -1;

  return v11;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (int64_t)version
{
  return self->_version;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSData)certData
{
  return self->_certData;
}

- (NSString)protectionSource
{
  return self->_protectionSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionSource, 0);
  objc_storeStrong((id *)&self->_certData, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
