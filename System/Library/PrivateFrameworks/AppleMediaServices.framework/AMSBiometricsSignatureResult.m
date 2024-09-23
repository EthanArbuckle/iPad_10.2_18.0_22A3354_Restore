@implementation AMSBiometricsSignatureResult

- (AMSBiometricsSignatureResult)initWithCoder:(id)a3
{
  id v4;
  AMSBiometricsSignatureResult *v5;
  uint64_t v6;
  NSData *publicKey;
  uint64_t v8;
  NSString *signature;
  uint64_t v10;
  AMSBiometricsSignatureRequest *originalRequest;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSBiometricsSignatureResult;
  v5 = -[AMSBiometricsSignatureResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPublicKeyKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSignatureKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOriginalRequestKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    originalRequest = v5->_originalRequest;
    v5->_originalRequest = (AMSBiometricsSignatureRequest *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSBiometricsSignatureResult publicKey](self, "publicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kPublicKeyKey"));

  -[AMSBiometricsSignatureResult signature](self, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSignatureKey"));

  -[AMSBiometricsSignatureResult originalRequest](self, "originalRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kOriginalRequestKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSBiometricsSignatureRequest)originalRequest
{
  return self->_originalRequest;
}

- (void)setOriginalRequest:(id)a3
{
  objc_storeStrong((id *)&self->_originalRequest, a3);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSString)signature
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
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
}

@end
