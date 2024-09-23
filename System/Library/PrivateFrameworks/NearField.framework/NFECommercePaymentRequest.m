@implementation NFECommercePaymentRequest

- (NFECommercePaymentRequest)initWithDictionary:(id)a3
{
  id v4;
  NFECommercePaymentRequest *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSData *merchantData;
  uint64_t v10;
  NSString *currencyCode;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSDecimalNumber *transactionAmount;
  uint64_t v16;
  NSDate *transactionDate;
  void *v18;
  void *v19;
  uint64_t v20;
  NSData *networkMerchantIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NFECommercePaymentRequest;
  v5 = -[NFECommercePaymentRequest init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("merchantData"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchantData = v5->_merchantData;
    v5->_merchantData = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("merchantCapabilities"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merchantCapabilities = objc_msgSend(v18, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unpredictableNumber"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_unpredictableNumber = objc_msgSend(v19, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("merchantIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    networkMerchantIdentifier = v5->_networkMerchantIdentifier;
    v5->_networkMerchantIdentifier = (NSData *)v20;

  }
  return v5;
}

- (NFECommercePaymentRequest)initWithCoder:(id)a3
{
  id v4;
  NFECommercePaymentRequest *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSData *merchantData;
  uint64_t v10;
  NSString *currencyCode;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSDecimalNumber *transactionAmount;
  uint64_t v16;
  NSDate *transactionDate;
  uint64_t v18;
  NSData *networkMerchantIdentifier;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NFECommercePaymentRequest;
  v5 = -[NFECommercePaymentRequest init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantData"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchantData = v5->_merchantData;
    v5->_merchantData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v16;

    v5->_merchantCapabilities = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("merchantCapabilities"));
    v5->_unpredictableNumber = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("unpredictableNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    networkMerchantIdentifier = v5->_networkMerchantIdentifier;
    v5->_networkMerchantIdentifier = (NSData *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *networkMerchantIdentifier;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantData, CFSTR("merchantData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionAmount, CFSTR("transactionAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_merchantCapabilities, CFSTR("merchantCapabilities"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_unpredictableNumber, CFSTR("unpredictableNumber"));
  networkMerchantIdentifier = self->_networkMerchantIdentifier;
  if (networkMerchantIdentifier)
    objc_msgSend(v5, "encodeObject:forKey:", networkMerchantIdentifier, CFSTR("merchantIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appletIdentifier, a3);
}

- (NSData)merchantData
{
  return self->_merchantData;
}

- (void)setMerchantData:(id)a3
{
  objc_storeStrong((id *)&self->_merchantData, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (unsigned)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unsigned __int8)a3
{
  self->_merchantCapabilities = a3;
}

- (unsigned)unpredictableNumber
{
  return self->_unpredictableNumber;
}

- (void)setUnpredictableNumber:(unsigned int)a3
{
  self->_unpredictableNumber = a3;
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (void)setNetworkMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_merchantData, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
