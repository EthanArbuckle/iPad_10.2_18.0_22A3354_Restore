@implementation IDSAuthenticationSigningResult

- (IDSAuthenticationSigningResult)initWithSubscriptionIdentifiers:(id)a3 authenticationCertificates:(id)a4 inputData:(id)a5 nonce:(id)a6 signature:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  IDSAuthenticationSigningResult *v17;
  IDSAuthenticationSigningResult *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSArray *authenticationCertificateSignatures;
  IDSAuthenticationSigningResult *v29;
  IDSAuthenticationSigningResult *v30;
  id v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)IDSAuthenticationSigningResult;
  v17 = -[IDSAuthenticationSigningResult init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputData, a5);
    objc_storeStrong((id *)&v18->_nonce, a6);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_msgSend(v12, "count");
    v29 = v18;
    v31 = v14;
    if (v20 == objc_msgSend(v13, "count"))
    {
      if (objc_msgSend(v12, "count"))
      {
        v21 = 0;
        do
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v21, v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34CB0]), "initWithSubscriptionIdentifier:authenticationCertificate:signature:nonce:", v23, v22, v16, v15);
          objc_msgSend(v19, "addObject:", v24);

          ++v21;
        }
        while (objc_msgSend(v12, "count") > v21);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "sms");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        sub_1907EA1B0((uint64_t)v12, (uint64_t)v13, v25);

    }
    v26 = objc_msgSend(v19, "copy", v29);
    v18 = v30;
    authenticationCertificateSignatures = v30->_authenticationCertificateSignatures;
    v30->_authenticationCertificateSignatures = (NSArray *)v26;

    v14 = v31;
  }

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IDSAuthenticationSigningResult authenticationCertificateSignatures](self, "authenticationCertificateSignatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p authenticationCertificateSignatures: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)authenticationCertificateSignatures
{
  return self->_authenticationCertificateSignatures;
}

- (NSData)inputData
{
  return self->_inputData;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_authenticationCertificateSignatures, 0);
}

- (NSString)serverVerifiableEncoding
{
  void *v2;
  void *v3;
  void *v4;

  -[IDSAuthenticationSigningResult authenticationCertificateSignatures](self, "authenticationCertificateSignatures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverVerifiableEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
