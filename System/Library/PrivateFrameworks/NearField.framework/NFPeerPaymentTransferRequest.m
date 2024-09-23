@implementation NFPeerPaymentTransferRequest

- (NFPeerPaymentTransferRequest)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentTransferRequest *v5;
  uint64_t v6;
  NSDecimalNumber *transactionAmount;
  uint64_t v8;
  NSString *appleTransactionHash;
  uint64_t v10;
  NSString *publicTransactionHash;
  uint64_t v12;
  NSDate *transactionDate;
  uint64_t v14;
  NSString *transactionCurrency;
  uint64_t v16;
  NSString *transactionCountry;
  uint64_t v18;
  NSData *nonce;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = -[NFPeerPaymentTransferRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferAppleTransactionHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferPublicTransactionHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferCurrency"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferCountry"));
    v16 = objc_claimAutoreleasedReturnValue();
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transferNonce"));
    v18 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v18;

  }
  return v5;
}

- (NFPeerPaymentTransferRequest)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentTransferRequest *v5;
  uint64_t v6;
  NSDecimalNumber *transactionAmount;
  uint64_t v8;
  NSString *appleTransactionHash;
  uint64_t v10;
  NSString *publicTransactionHash;
  uint64_t v12;
  NSDate *transactionDate;
  uint64_t v14;
  NSString *transactionCurrency;
  uint64_t v16;
  NSString *transactionCountry;
  uint64_t v18;
  NSData *nonce;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFPeerPaymentTransferRequest;
  v5 = -[NFPeerPaymentTransferRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferAppleTransactionHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleTransactionHash = v5->_appleTransactionHash;
    v5->_appleTransactionHash = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferPublicTransactionHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicTransactionHash = v5->_publicTransactionHash;
    v5->_publicTransactionHash = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferCurrency"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionCurrency = v5->_transactionCurrency;
    v5->_transactionCurrency = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferCountry"));
    v16 = objc_claimAutoreleasedReturnValue();
    transactionCountry = v5->_transactionCountry;
    v5->_transactionCountry = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferNonce"));
    v18 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *transactionAmount;
  id v5;

  transactionAmount = self->_transactionAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transactionAmount, CFSTR("transferAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleTransactionHash, CFSTR("transferAppleTransactionHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_publicTransactionHash, CFSTR("transferPublicTransactionHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transferDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionCurrency, CFSTR("transferCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionCountry, CFSTR("transferCountry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("transferNonce"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appleTransactionHash
{
  return self->_appleTransactionHash;
}

- (void)setAppleTransactionHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)publicTransactionHash
{
  return self->_publicTransactionHash;
}

- (void)setPublicTransactionHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)transactionCurrency
{
  return self->_transactionCurrency;
}

- (void)setTransactionCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)transactionCountry
{
  return self->_transactionCountry;
}

- (void)setTransactionCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_transactionCountry, 0);
  objc_storeStrong((id *)&self->_transactionCurrency, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_publicTransactionHash, 0);
  objc_storeStrong((id *)&self->_appleTransactionHash, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end
