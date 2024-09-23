@implementation NFPeerPaymentResponse

- (NFPeerPaymentResponse)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentResponse *v5;
  uint64_t v6;
  NSData *transactionData;
  uint64_t v8;
  NSDictionary *certificates;
  uint64_t v10;
  NSString *transactionIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentResponse;
  v5 = -[NFPeerPaymentResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionData"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("certificates"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v10;

  }
  return v5;
}

- (NFPeerPaymentResponse)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentResponse *v5;
  uint64_t v6;
  NSData *transactionData;
  uint64_t v8;
  NSDictionary *certificates;
  uint64_t v10;
  NSString *transactionIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFPeerPaymentResponse;
  v5 = -[NFPeerPaymentResponse init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionData"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v6;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(), CFSTR("certificates"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *transactionIdentifier;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionData, CFSTR("transactionData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificates, CFSTR("certificates"));
  transactionIdentifier = self->_transactionIdentifier;
  if (transactionIdentifier)
    objc_msgSend(v5, "encodeObject:forKey:", transactionIdentifier, CFSTR("transactionIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
}

@end
