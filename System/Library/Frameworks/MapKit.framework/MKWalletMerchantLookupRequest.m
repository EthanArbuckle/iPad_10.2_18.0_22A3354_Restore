@implementation MKWalletMerchantLookupRequest

- (NSString)merchantCode
{
  return self->_merchantCode;
}

- (void)setMerchantCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)rawMerchantCode
{
  return self->_rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (GEOLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)terminalId
{
  return self->_terminalId;
}

- (void)setTerminalId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)transactionCurrencyCode
{
  return self->_transactionCurrencyCode;
}

- (void)setTransactionCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)warsawMerchantDomain
{
  return self->_warsawMerchantDomain;
}

- (void)setWarsawMerchantDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)warsawMerchantName
{
  return self->_warsawMerchantName;
}

- (void)setWarsawMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)warsawMerchantId
{
  return self->_warsawMerchantId;
}

- (void)setWarsawMerchantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)merchantDoingBizAsName
{
  return self->_merchantDoingBizAsName;
}

- (void)setMerchantDoingBizAsName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)merchantEnhancedName
{
  return self->_merchantEnhancedName;
}

- (void)setMerchantEnhancedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)merchantCity
{
  return self->_merchantCity;
}

- (void)setMerchantCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)merchantRawCity
{
  return self->_merchantRawCity;
}

- (void)setMerchantRawCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)merchantState
{
  return self->_merchantState;
}

- (void)setMerchantState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)merchantRawState
{
  return self->_merchantRawState;
}

- (void)setMerchantRawState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)merchantZip
{
  return self->_merchantZip;
}

- (void)setMerchantZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)merchantAddress
{
  return self->_merchantAddress;
}

- (void)setMerchantAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)merchantRawAddress
{
  return self->_merchantRawAddress;
}

- (void)setMerchantRawAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)merchantType
{
  return self->_merchantType;
}

- (void)setMerchantType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)merchantCleanConfidenceLevel
{
  return self->_merchantCleanConfidenceLevel;
}

- (void)setMerchantCleanConfidenceLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)merchantAdditionalData
{
  return self->_merchantAdditionalData;
}

- (void)setMerchantAdditionalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)merchantCanl
{
  return self->_merchantCanl;
}

- (void)setMerchantCanl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSNumber)fuzzyMatched
{
  return self->_fuzzyMatched;
}

- (void)setFuzzyMatched:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)coarseLocationUsed
{
  return self->_coarseLocationUsed;
}

- (void)setCoarseLocationUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (unint64_t)bankTransactionType
{
  return self->_bankTransactionType;
}

- (void)setBankTransactionType:(unint64_t)a3
{
  self->_bankTransactionType = a3;
}

- (unint64_t)bankMerchantStatus
{
  return self->_bankMerchantStatus;
}

- (void)setBankMerchantStatus:(unint64_t)a3
{
  self->_bankMerchantStatus = a3;
}

- (NSString)bankAnonymisedUserId
{
  return self->_bankAnonymisedUserId;
}

- (void)setBankAnonymisedUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)otherBankTransactionLocations
{
  return self->_otherBankTransactionLocations;
}

- (void)setOtherBankTransactionLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSString)bankTransactionDescription
{
  return self->_bankTransactionDescription;
}

- (void)setBankTransactionDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)bankTransactionTimestamp
{
  return self->_bankTransactionTimestamp;
}

- (void)setBankTransactionTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)bankRawMerchantCode
{
  return self->_bankRawMerchantCode;
}

- (void)setBankRawMerchantCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSString)bankIndustryCategory
{
  return self->_bankIndustryCategory;
}

- (void)setBankIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)bankIndustryCode
{
  return self->_bankIndustryCode;
}

- (void)setBankIndustryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)bankTransactionCurrencyCode
{
  return self->_bankTransactionCurrencyCode;
}

- (void)setBankTransactionCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (MKWalletMerchantLookupBankMerchantInfo)bankMerchantInfo
{
  return self->_bankMerchantInfo;
}

- (void)setBankMerchantInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSArray)baaCerts
{
  return self->_baaCerts;
}

- (void)setBaaCerts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSData)baaSignature
{
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSNumber)bankEnableBrandMUIDFallback
{
  return self->_bankEnableBrandMUIDFallback;
}

- (void)setBankEnableBrandMUIDFallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)bankIdentifier
{
  return self->_bankIdentifier;
}

- (void)setBankIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)bankTransactionDescriptionClean
{
  return self->_bankTransactionDescriptionClean;
}

- (void)setBankTransactionDescriptionClean:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSNumber)piiRedactionOccurred
{
  return self->_piiRedactionOccurred;
}

- (void)setPiiRedactionOccurred:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSNumber)rotationPeriodsSinceEpoch
{
  return self->_rotationPeriodsSinceEpoch;
}

- (void)setRotationPeriodsSinceEpoch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationPeriodsSinceEpoch, 0);
  objc_storeStrong((id *)&self->_piiRedactionOccurred, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescriptionClean, 0);
  objc_storeStrong((id *)&self->_bankIdentifier, 0);
  objc_storeStrong((id *)&self->_bankEnableBrandMUIDFallback, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaCerts, 0);
  objc_storeStrong((id *)&self->_bankMerchantInfo, 0);
  objc_storeStrong((id *)&self->_bankTransactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_bankIndustryCode, 0);
  objc_storeStrong((id *)&self->_bankIndustryCategory, 0);
  objc_storeStrong((id *)&self->_bankRawMerchantCode, 0);
  objc_storeStrong((id *)&self->_bankTransactionTimestamp, 0);
  objc_storeStrong((id *)&self->_bankTransactionDescription, 0);
  objc_storeStrong((id *)&self->_otherBankTransactionLocations, 0);
  objc_storeStrong((id *)&self->_bankAnonymisedUserId, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_coarseLocationUsed, 0);
  objc_storeStrong((id *)&self->_fuzzyMatched, 0);
  objc_storeStrong((id *)&self->_merchantCanl, 0);
  objc_storeStrong((id *)&self->_merchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_merchantCleanConfidenceLevel, 0);
  objc_storeStrong((id *)&self->_merchantType, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_merchantRawAddress, 0);
  objc_storeStrong((id *)&self->_merchantAddress, 0);
  objc_storeStrong((id *)&self->_merchantZip, 0);
  objc_storeStrong((id *)&self->_merchantRawState, 0);
  objc_storeStrong((id *)&self->_merchantState, 0);
  objc_storeStrong((id *)&self->_merchantRawCity, 0);
  objc_storeStrong((id *)&self->_merchantCity, 0);
  objc_storeStrong((id *)&self->_merchantEnhancedName, 0);
  objc_storeStrong((id *)&self->_merchantDoingBizAsName, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_warsawMerchantId, 0);
  objc_storeStrong((id *)&self->_warsawMerchantName, 0);
  objc_storeStrong((id *)&self->_warsawMerchantDomain, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_transactionCurrencyCode, 0);
  objc_storeStrong((id *)&self->_terminalId, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
}

@end
