@implementation CIDCBuilderSignatureDetails

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 signature:(id)a5
{
  return -[CIDCBuilderSignatureDetails initWithSigningAlgorithm:issuerCertificate:issuerKey:signature:](self, "initWithSigningAlgorithm:issuerCertificate:issuerKey:signature:", a3, a4, 0, a5);
}

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerKey:(id)a4 signature:(id)a5
{
  return -[CIDCBuilderSignatureDetails initWithSigningAlgorithm:issuerCertificate:issuerKey:signature:](self, "initWithSigningAlgorithm:issuerCertificate:issuerKey:signature:", a3, 0, a4, a5);
}

- (CIDCBuilderSignatureDetails)initWithSigningAlgorithm:(int64_t)a3 issuerCertificate:(id)a4 issuerKey:(id)a5 signature:(id)a6
{
  id v10;
  id v11;
  id v12;
  CIDCBuilderSignatureDetails *v13;
  CIDCBuilderSignatureDetails *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CIDCBuilderSignatureDetails;
  v13 = -[CIDCBuilderSignatureDetails init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[CIDCBuilderSignatureDetails setSigningAlgorithm:](v13, "setSigningAlgorithm:", a3);
    -[CIDCBuilderSignatureDetails setIssuerCertificate:](v14, "setIssuerCertificate:", v10);
    -[CIDCBuilderSignatureDetails setIssuerKey:](v14, "setIssuerKey:", v11);
    -[CIDCBuilderSignatureDetails setSignature:](v14, "setSignature:", v12);
  }

  return v14;
}

- (int64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(int64_t)a3
{
  self->_signingAlgorithm = a3;
}

- (NSArray)issuerCertificate
{
  return self->_issuerCertificate;
}

- (void)setIssuerCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_issuerCertificate, a3);
}

- (NSData)issuerKey
{
  return self->_issuerKey;
}

- (void)setIssuerKey:(id)a3
{
  objc_storeStrong((id *)&self->_issuerKey, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_issuerKey, 0);
  objc_storeStrong((id *)&self->_issuerCertificate, 0);
}

@end
