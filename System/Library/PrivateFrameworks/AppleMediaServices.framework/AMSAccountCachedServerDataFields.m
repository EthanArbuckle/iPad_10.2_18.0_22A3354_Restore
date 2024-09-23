@implementation AMSAccountCachedServerDataFields

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[AMSAccountCachedServerDataFields acAccountName](self, "acAccountName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kACAccountName"));

  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields accountFlagsVersion](self, "accountFlagsVersion"), CFSTR("kAccountFlagsVersion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields autoPlayEnabled](self, "autoPlayEnabled"), CFSTR("kAutoPlayEnabled"));
  -[AMSAccountCachedServerDataFields combinedStoreFrontID](self, "combinedStoreFrontID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCombinedStoreFrontID"));

  -[AMSAccountCachedServerDataFields creditBalance](self, "creditBalance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCreditBalance"));

  -[AMSAccountCachedServerDataFields firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kFirstName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasAgreedToAppClipTerms](self, "hasAgreedToAppClipTerms"), CFSTR("kHasAgreedToAppClipTerms"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasAgreedToTerms](self, "hasAgreedToTerms"), CFSTR("kHasAgreedToTerms"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasSubscriptionFamilySharingEnabled](self, "hasSubscriptionFamilySharingEnabled"), CFSTR("kHasSubscriptionFamilySharingEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields hasHardwareWatchOffer](self, "hasHardwareWatchOffer"), CFSTR("kHasHardwareWatchOffer"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields identityLastVerified](self, "identityLastVerified"), CFSTR("kIdentityLastVerified"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isAskToBuy](self, "isAskToBuy"), CFSTR("kIsAskToBuy"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isDisabledAccount](self, "isDisabledAccount"), CFSTR("kIsDisabledAccount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInBadCredit](self, "isInBadCredit"), CFSTR("kIsInBadCredit"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInFamily](self, "isInFamily"), CFSTR("kIsInFamily"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isInRestrictedRegion](self, "isInRestrictedRegion"), CFSTR("kIsInRestrictedRegion"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isDisabledAccount](self, "isDisabledAccount"), CFSTR("kIsDisabledAccount"));
  -[AMSAccountCachedServerDataFields isU18OrCountrysEquivalent](self, "isU18OrCountrysEquivalent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kIsU18OrCountrysEquivalent"));

  -[AMSAccountCachedServerDataFields isoCountryCode](self, "isoCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kISOCountryCode"));

  -[AMSAccountCachedServerDataFields iso2CountryCode](self, "iso2CountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kISO2CountryCode"));

  -[AMSAccountCachedServerDataFields iso3CountryCode](self, "iso3CountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("kISO3CountryCode"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isRestrictedAccount](self, "isRestrictedAccount"), CFSTR("kIsRestrictedAccount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields isManagedAccount](self, "isManagedAccount"), CFSTR("kIsManagedAccount"));
  -[AMSAccountCachedServerDataFields lastName](self, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("kLastName"));

  -[AMSAccountCachedServerDataFields oneAccountLinkedDSID](self, "oneAccountLinkedDSID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("kOneAccountLinkedDSID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields personalization](self, "personalization"), CFSTR("kPersonalization"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields retailDemo](self, "retailDemo"), CFSTR("kRetailDemo"));
  -[AMSAccountCachedServerDataFields storefrontId](self, "storefrontId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("kStorefrontId"));

  objc_msgSend(v4, "encodeBool:forKey:", -[AMSAccountCachedServerDataFields underThirteen](self, "underThirteen"), CFSTR("kUnderThirteen"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[AMSAccountCachedServerDataFields verifiedExpirationDate](self, "verifiedExpirationDate"), CFSTR("kVerifiedExpirationDate"));
  -[AMSAccountCachedServerDataFields expiration](self, "expiration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("kExpiryTimestamp"));

}

- (BOOL)isDisabledAccount
{
  return self->_isDisabledAccount;
}

- (unint64_t)verifiedExpirationDate
{
  return self->_verifiedExpirationDate;
}

- (BOOL)underThirteen
{
  return self->_underThirteen;
}

- (NSString)storefrontId
{
  return self->_storefrontId;
}

- (BOOL)retailDemo
{
  return self->_retailDemo;
}

- (BOOL)personalization
{
  return self->_personalization;
}

- (NSNumber)oneAccountLinkedDSID
{
  return self->_oneAccountLinkedDSID;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)iso3CountryCode
{
  return self->_iso3CountryCode;
}

- (NSString)iso2CountryCode
{
  return self->_iso2CountryCode;
}

- (NSNumber)isU18OrCountrysEquivalent
{
  return self->_isU18OrCountrysEquivalent;
}

- (BOOL)isRestrictedAccount
{
  return self->_isRestrictedAccount;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (BOOL)isInRestrictedRegion
{
  return self->_isInRestrictedRegion;
}

- (BOOL)isInFamily
{
  return self->_isInFamily;
}

- (BOOL)isInBadCredit
{
  return self->_isInBadCredit;
}

- (BOOL)isAskToBuy
{
  return self->_isAskToBuy;
}

- (unint64_t)identityLastVerified
{
  return self->_identityLastVerified;
}

- (BOOL)hasSubscriptionFamilySharingEnabled
{
  return self->_hasSubscriptionFamilySharingEnabled;
}

- (BOOL)hasHardwareWatchOffer
{
  return self->_hasHardwareWatchOffer;
}

- (BOOL)hasAgreedToTerms
{
  return self->_hasAgreedToTerms;
}

- (BOOL)hasAgreedToAppClipTerms
{
  return self->_hasAgreedToAppClipTerms;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSString)creditBalance
{
  return self->_creditBalance;
}

- (NSString)combinedStoreFrontID
{
  return self->_combinedStoreFrontID;
}

- (BOOL)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (unint64_t)accountFlagsVersion
{
  return self->_accountFlagsVersion;
}

- (NSString)acAccountName
{
  return self->_acAccountName;
}

- (AMSAccountCachedServerDataFields)initWithCoder:(id)a3
{
  id v4;
  AMSAccountCachedServerDataFields *v5;
  uint64_t v6;
  NSString *acAccountName;
  uint64_t v8;
  NSString *combinedStoreFrontID;
  uint64_t v10;
  NSString *creditBalance;
  uint64_t v12;
  NSString *firstName;
  uint64_t v14;
  NSNumber *isU18OrCountrysEquivalent;
  uint64_t v16;
  NSString *isoCountryCode;
  uint64_t v18;
  NSString *iso2CountryCode;
  uint64_t v20;
  NSString *iso3CountryCode;
  uint64_t v22;
  NSString *lastName;
  uint64_t v24;
  NSNumber *oneAccountLinkedDSID;
  uint64_t v26;
  NSString *storefrontId;
  uint64_t v28;
  NSDate *expiration;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AMSAccountCachedServerDataFields;
  v5 = -[AMSAccountCachedServerDataFields init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kACAccountName"));
    v6 = objc_claimAutoreleasedReturnValue();
    acAccountName = v5->_acAccountName;
    v5->_acAccountName = (NSString *)v6;

    v5->_accountFlagsVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kAccountFlagsVersion"));
    v5->_autoPlayEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoPlayEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCombinedStoreFrontID"));
    v8 = objc_claimAutoreleasedReturnValue();
    combinedStoreFrontID = v5->_combinedStoreFrontID;
    v5->_combinedStoreFrontID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCreditBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    creditBalance = v5->_creditBalance;
    v5->_creditBalance = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFirstName"));
    v12 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v12;

    v5->_hasAgreedToAppClipTerms = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasAgreedToAppClipTerms"));
    v5->_hasAgreedToTerms = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasAgreedToTerms"));
    v5->_hasSubscriptionFamilySharingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasSubscriptionFamilySharingEnabled"));
    v5->_hasHardwareWatchOffer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHasHardwareWatchOffer"));
    v5->_identityLastVerified = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kIdentityLastVerified"));
    v5->_isAskToBuy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsAskToBuy"));
    v5->_isDisabledAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsDisabledAccount"));
    v5->_isInBadCredit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsInBadCredit"));
    v5->_isInFamily = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsInFamily"));
    v5->_isInRestrictedRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsInRestrictedRegion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIsU18OrCountrysEquivalent"));
    v14 = objc_claimAutoreleasedReturnValue();
    isU18OrCountrysEquivalent = v5->_isU18OrCountrysEquivalent;
    v5->_isU18OrCountrysEquivalent = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kISOCountryCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kISO2CountryCode"));
    v18 = objc_claimAutoreleasedReturnValue();
    iso2CountryCode = v5->_iso2CountryCode;
    v5->_iso2CountryCode = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kISO3CountryCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    iso3CountryCode = v5->_iso3CountryCode;
    v5->_iso3CountryCode = (NSString *)v20;

    v5->_isRestrictedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsRestrictedAccount"));
    v5->_isManagedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kIsManagedAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLastName"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kOneAccountLinkedDSID"));
    v24 = objc_claimAutoreleasedReturnValue();
    oneAccountLinkedDSID = v5->_oneAccountLinkedDSID;
    v5->_oneAccountLinkedDSID = (NSNumber *)v24;

    v5->_personalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPersonalization"));
    v5->_retailDemo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRetailDemo"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kStorefrontId"));
    v26 = objc_claimAutoreleasedReturnValue();
    storefrontId = v5->_storefrontId;
    v5->_storefrontId = (NSString *)v26;

    v5->_underThirteen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kUnderThirteen"));
    v5->_verifiedExpirationDate = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("kVerifiedExpirationDate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExpiryTimestamp"));
    v28 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSDate *)v28;

  }
  return v5;
}

- (void)setVerifiedExpirationDate:(unint64_t)a3
{
  self->_verifiedExpirationDate = a3;
}

- (void)setUnderThirteen:(BOOL)a3
{
  self->_underThirteen = a3;
}

- (void)setRetailDemo:(BOOL)a3
{
  self->_retailDemo = a3;
}

- (void)setPersonalization:(BOOL)a3
{
  self->_personalization = a3;
}

- (void)setIsRestrictedAccount:(BOOL)a3
{
  self->_isRestrictedAccount = a3;
}

- (void)setIsManagedAccount:(BOOL)a3
{
  self->_isManagedAccount = a3;
}

- (void)setIsInRestrictedRegion:(BOOL)a3
{
  self->_isInRestrictedRegion = a3;
}

- (void)setIsInFamily:(BOOL)a3
{
  self->_isInFamily = a3;
}

- (void)setIsInBadCredit:(BOOL)a3
{
  self->_isInBadCredit = a3;
}

- (void)setIsDisabledAccount:(BOOL)a3
{
  self->_isDisabledAccount = a3;
}

- (void)setIsAskToBuy:(BOOL)a3
{
  self->_isAskToBuy = a3;
}

- (void)setIdentityLastVerified:(unint64_t)a3
{
  self->_identityLastVerified = a3;
}

- (void)setHasSubscriptionFamilySharingEnabled:(BOOL)a3
{
  self->_hasSubscriptionFamilySharingEnabled = a3;
}

- (void)setHasHardwareWatchOffer:(BOOL)a3
{
  self->_hasHardwareWatchOffer = a3;
}

- (void)setHasAgreedToTerms:(BOOL)a3
{
  self->_hasAgreedToTerms = a3;
}

- (void)setHasAgreedToAppClipTerms:(BOOL)a3
{
  self->_hasAgreedToAppClipTerms = a3;
}

- (void)setAutoPlayEnabled:(BOOL)a3
{
  self->_autoPlayEnabled = a3;
}

- (void)setAccountFlagsVersion:(unint64_t)a3
{
  self->_accountFlagsVersion = a3;
}

- (void)setStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_storefrontId, a3);
}

- (void)setOneAccountLinkedDSID:(id)a3
{
  objc_storeStrong((id *)&self->_oneAccountLinkedDSID, a3);
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (void)setIso3CountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_iso3CountryCode, a3);
}

- (void)setIso2CountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_iso2CountryCode, a3);
}

- (void)setIsU18OrCountrysEquivalent:(id)a3
{
  objc_storeStrong((id *)&self->_isU18OrCountrysEquivalent, a3);
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (void)setCreditBalance:(id)a3
{
  objc_storeStrong((id *)&self->_creditBalance, a3);
}

- (void)setCombinedStoreFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_combinedStoreFrontID, a3);
}

- (void)setAcAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_acAccountName, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_storefrontId, 0);
  objc_storeStrong((id *)&self->_oneAccountLinkedDSID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iso3CountryCode, 0);
  objc_storeStrong((id *)&self->_iso2CountryCode, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_isU18OrCountrysEquivalent, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_creditBalance, 0);
  objc_storeStrong((id *)&self->_combinedStoreFrontID, 0);
  objc_storeStrong((id *)&self->_acAccountName, 0);
}

@end
