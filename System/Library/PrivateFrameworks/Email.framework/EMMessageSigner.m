@implementation EMMessageSigner

- (EMMessageSigner)initWithSigningTrust:(id)a3 encryptionTrust:(id)a4
{
  id v7;
  id v8;
  EMMessageSigner *v9;
  EMMessageSigner *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageSigner;
  v9 = -[EMMessageSigner init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingCertificateTrustInfo, a3);
    objc_storeStrong((id *)&v10->_encryptionCertificateTrustInfo, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageSigner)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMMessageSigner *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_signingCertificateTrustInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_encryptionCertificateTrustInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMMessageSigner initWithSigningTrust:encryptionTrust:](self, "initWithSigningTrust:encryptionTrust:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMMessageSigner signingCertificateTrustInfo](self, "signingCertificateTrustInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_signingCertificateTrustInfo"));

  -[EMMessageSigner encryptionCertificateTrustInfo](self, "encryptionCertificateTrustInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_encryptionCertificateTrustInfo"));

}

- (BOOL)hasSeparateSigningAndEncryptionCertificates
{
  EMCertificateTrustInformation *signingCertificateTrustInfo;

  signingCertificateTrustInfo = self->_signingCertificateTrustInfo;
  if (signingCertificateTrustInfo)
  {
    if (self->_encryptionCertificateTrustInfo)
      LOBYTE(signingCertificateTrustInfo) = !-[EMCertificateTrustInformation isEqual:](signingCertificateTrustInfo, "isEqual:");
    else
      LOBYTE(signingCertificateTrustInfo) = 0;
  }
  return (char)signingCertificateTrustInfo;
}

- (void)evaluateTrustsWithOptions:(unint64_t)a3
{
  id v5;
  id v6;

  -[EMMessageSigner signingCertificateTrustInfo](self, "signingCertificateTrustInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "evaluateTrustWithOptions:", a3);

  -[EMMessageSigner encryptionCertificateTrustInfo](self, "encryptionCertificateTrustInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "evaluateTrustWithOptions:", a3);

}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  id v3;
  id v4;

  -[EMMessageSigner signingCertificateTrustInfo](self, "signingCertificateTrustInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reevaluateTrustWithNetworkAccessAllowed");

  -[EMMessageSigner encryptionCertificateTrustInfo](self, "encryptionCertificateTrustInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reevaluateTrustWithNetworkAccessAllowed");

}

- (EMCertificateTrustInformation)signingCertificateTrustInfo
{
  return self->_signingCertificateTrustInfo;
}

- (void)setSigningCertificateTrustInfo:(id)a3
{
  objc_storeStrong((id *)&self->_signingCertificateTrustInfo, a3);
}

- (EMCertificateTrustInformation)encryptionCertificateTrustInfo
{
  return self->_encryptionCertificateTrustInfo;
}

- (void)setEncryptionCertificateTrustInfo:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionCertificateTrustInfo, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_encryptionCertificateTrustInfo, 0);
  objc_storeStrong((id *)&self->_signingCertificateTrustInfo, 0);
}

@end
