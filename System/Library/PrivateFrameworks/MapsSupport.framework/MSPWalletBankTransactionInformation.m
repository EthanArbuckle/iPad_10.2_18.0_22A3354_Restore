@implementation MSPWalletBankTransactionInformation

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (NSString)bankTransactionDescription
{
  return self->_bankTransactionDescription;
}

- (void)setBankTransactionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)otherTransactionLocations
{
  return self->_otherTransactionLocations;
}

- (void)setOtherTransactionLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)transactionTimestamp
{
  return self->_transactionTimestamp;
}

- (void)setTransactionTimestamp:(double)a3
{
  self->_transactionTimestamp = a3;
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (BOOL)enableBrandMuidFallback
{
  return self->_enableBrandMuidFallback;
}

- (void)setEnableBrandMuidFallback:(BOOL)a3
{
  self->_enableBrandMuidFallback = a3;
}

- (NSString)transactionCurrencyCode
{
  return self->_transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(unint64_t)a3
{
  self->_transactionStatus = a3;
}

- (GEOPDMerchantInformation)merchantInformation
{
  return self->_merchantInformation;
}

- (void)setMerchantInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bankTransactionDescriptionClean
{
  return self->_bankTransactionDescriptionClean;
}

- (void)setBankTransactionDescriptionClean:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)bankIdentifier
{
  return self->_bankIdentifier;
}

- (void)setBankIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankIdentifier, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, 0);
  objc_storeStrong((id *)&self->_merchantInformation, 0);
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_otherTransactionLocations, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescription, 0);
}

@end
