@implementation APSSignDataWithIdentityResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *signature;
  id v5;

  signature = self->_signature;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", signature, CFSTR("signatureKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificates, CFSTR("certificatesKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonceKey"));

}

- (APSSignDataWithIdentityResponse)initWithCoder:(id)a3
{
  id v4;
  APSSignDataWithIdentityResponse *v5;
  uint64_t v6;
  NSData *signature;
  uint64_t v8;
  NSArray *certificates;
  uint64_t v10;
  NSData *nonce;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSSignDataWithIdentityResponse;
  v5 = -[APSSignDataWithIdentityResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signatureKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("certificatesKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonceKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v10;

  }
  return v5;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_certificates, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
