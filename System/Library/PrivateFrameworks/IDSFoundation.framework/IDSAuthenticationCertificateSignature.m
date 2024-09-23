@implementation IDSAuthenticationCertificateSignature

- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 nonce:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  IDSAuthenticationCertificateSignature *v31;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend_base64EncodedStringWithOptions_(a6, v13, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v10, v16, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentation(v11, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v22, v23, 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("%ld:%@:%@:%@"), v27, 0, v25, v15, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (IDSAuthenticationCertificateSignature *)objc_msgSend_initWithSubscriptionIdentifier_authenticationCertificate_signature_serverVerifiableEncoding_(self, v29, (uint64_t)v12, v30, v11, v10, v28);

  return v31;
}

- (IDSAuthenticationCertificateSignature)initWithSubscriptionIdentifier:(id)a3 authenticationCertificate:(id)a4 signature:(id)a5 serverVerifiableEncoding:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSAuthenticationCertificateSignature *v15;
  IDSAuthenticationCertificateSignature *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSAuthenticationCertificateSignature;
  v15 = -[IDSAuthenticationCertificateSignature init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_subscriptionIdentifier, a3);
    objc_storeStrong((id *)&v16->_authenticationCertificate, a4);
    objc_storeStrong((id *)&v16->_signature, a5);
    objc_storeStrong((id *)&v16->_serverVerifiableEncoding, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_subscriptionIdentifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_serverVerifiableEncoding(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16);
  objc_msgSend_numberWithUnsignedInteger_(v9, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("<%@: %p subscriptionIdentifier: %@, serverVerifiableEncodingHash: %@>"), v22, v4, self, v8, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (IDSAuthenticationCertificate)authenticationCertificate
{
  return self->_authenticationCertificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)serverVerifiableEncoding
{
  return self->_serverVerifiableEncoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVerifiableEncoding, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticationCertificate, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end
