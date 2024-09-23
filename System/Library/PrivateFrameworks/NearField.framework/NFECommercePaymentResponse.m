@implementation NFECommercePaymentResponse

- (NFECommercePaymentResponse)initWithDictionary:(id)a3
{
  id v4;
  NFECommercePaymentResponse *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  NSData *confirmationBlobHash;
  uint64_t v12;
  NSData *confirmationBlobSignature;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NFECommercePaymentResponse;
  v5 = -[NFECommercePaymentResponse init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobHashSignature"));
    v12 = objc_claimAutoreleasedReturnValue();
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmationBlobVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_confirmationBlobVersion = objc_msgSend(v14, "integerValue");

  }
  return v5;
}

- (NFECommercePaymentResponse)initWithCoder:(id)a3
{
  id v4;
  NFECommercePaymentResponse *v5;
  uint64_t v6;
  NSString *transactionIdentifier;
  uint64_t v8;
  NSData *transactionData;
  uint64_t v10;
  NSDictionary *certs;
  uint64_t v12;
  NSData *confirmationBlobHash;
  uint64_t v14;
  NSData *confirmationBlobSignature;
  void *v16;
  uint64_t v17;
  NSArray *SEPcerts;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFECommercePaymentResponse;
  v5 = -[NFECommercePaymentResponse init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(), CFSTR("certs"));
    v10 = objc_claimAutoreleasedReturnValue();
    certs = v5->_certs;
    v5->_certs = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobHash"));
    v12 = objc_claimAutoreleasedReturnValue();
    confirmationBlobHash = v5->_confirmationBlobHash;
    v5->_confirmationBlobHash = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobHashSignature"));
    v14 = objc_claimAutoreleasedReturnValue();
    confirmationBlobSignature = v5->_confirmationBlobSignature;
    v5->_confirmationBlobSignature = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmationBlobVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_confirmationBlobVersion = objc_msgSend(v16, "integerValue");

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("sepCerts"));
    v17 = objc_claimAutoreleasedReturnValue();
    SEPcerts = v5->_SEPcerts;
    v5->_SEPcerts = (NSArray *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *confirmationBlobHash;
  NSData *confirmationBlobSignature;
  void *v6;
  NSArray *SEPcerts;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_transactionData, CFSTR("transactionData"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_certs, CFSTR("certs"));
  confirmationBlobHash = self->_confirmationBlobHash;
  if (confirmationBlobHash)
    objc_msgSend(v8, "encodeObject:forKey:", confirmationBlobHash, CFSTR("confirmationBlobHash"));
  confirmationBlobSignature = self->_confirmationBlobSignature;
  if (confirmationBlobSignature)
    objc_msgSend(v8, "encodeObject:forKey:", confirmationBlobSignature, CFSTR("confirmationBlobHashSignature"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_confirmationBlobVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("confirmationBlobVersion"));

  SEPcerts = self->_SEPcerts;
  if (SEPcerts)
    objc_msgSend(v8, "encodeObject:forKey:", SEPcerts, CFSTR("sepCerts"));

}

- (void)setCerts:(id)a3
{
  objc_storeStrong((id *)&self->_certs, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setConfirmationBlobHash:(id)a3 withSignature:(id)a4 version:(unint64_t)a5
{
  NSData *v8;
  NSData *v9;
  NSData *confirmationBlobHash;
  NSData *v11;
  NSData *confirmationBlobSignature;

  v8 = (NSData *)a3;
  v9 = (NSData *)a4;
  confirmationBlobHash = self->_confirmationBlobHash;
  self->_confirmationBlobHash = v8;
  v11 = v8;

  confirmationBlobSignature = self->_confirmationBlobSignature;
  self->_confirmationBlobSignature = v9;

  self->_confirmationBlobVersion = a5;
}

- (void)setSEPCerts:(id)a3
{
  objc_storeStrong((id *)&self->_SEPcerts, a3);
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certs
{
  return self->_certs;
}

- (NSArray)SEPcerts
{
  return self->_SEPcerts;
}

- (NSData)confirmationBlobHash
{
  return self->_confirmationBlobHash;
}

- (NSData)confirmationBlobSignature
{
  return self->_confirmationBlobSignature;
}

- (int64_t)confirmationBlobVersion
{
  return self->_confirmationBlobVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationBlobSignature, 0);
  objc_storeStrong((id *)&self->_confirmationBlobHash, 0);
  objc_storeStrong((id *)&self->_SEPcerts, 0);
  objc_storeStrong((id *)&self->_certs, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
