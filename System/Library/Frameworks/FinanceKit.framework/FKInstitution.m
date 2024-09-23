@implementation FKInstitution

- (FKInstitution)initWithInstitutionIdentifier:(id)a3 name:(id)a4 reconsentType:(unint64_t)a5 supportedAuthTypes:(signed __int16)a6 firstTransactionsRequestWindow:(id)a7 maxAgeTransactionsFirstRequest:(double)a8 maxAgeTransactionsRefreshRequest:(double)a9 extensionsBundleIdentifiers:(id)a10 maximumNumberOfBackgroundRefreshes:(int64_t)a11 numberOfRemainingBackgroundRefreshes:(int64_t)a12 backgroundRefreshRetryAfterDate:(id)a13 lastBackgroundRefreshDate:(id)a14 backgroundRefreshConfirmationWindow:(id)a15 backgroundRefreshConfirmationExpiryWindow:(id)a16 multipleConsentsEnabled:(BOOL)a17 termsAndConditions:(id)a18 problemReportingEnabled:(BOOL)a19 financialLabEnabled:(BOOL)a20 consentSyncingEnabled:(BOOL)a21 consentSyncingOutdatedTokenWaitTimeout:(id)a22 timestampSuitableForUserDisplay:(BOOL)a23 piiRedactionConfigurationCountryCodes:(id)a24 privacyLabels:(signed __int16)a25
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  FKInstitution *v36;
  uint64_t v37;
  NSString *institutionIdentifier;
  uint64_t v39;
  NSString *name;
  uint64_t v41;
  NSNumber *firstTransactionsRequestWindow;
  uint64_t v43;
  NSArray *extensionsBundleIdentifiers;
  uint64_t v45;
  NSDate *backgroundRefreshRetryAfterDate;
  uint64_t v47;
  NSDate *lastBackgroundRefreshDate;
  uint64_t v49;
  NSNumber *backgroundRefreshConfirmationWindow;
  uint64_t v51;
  NSNumber *backgroundRefreshConfirmationExpiryWindow;
  uint64_t v53;
  FKBankConnectTermsAndConditions *termsAndConditions;
  uint64_t v55;
  NSNumber *consentSyncingOutdatedTokenWaitTimeout;
  uint64_t v57;
  NSSet *piiRedactionConfigurationCountryCodes;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  objc_super v68;

  v67 = a3;
  v66 = a4;
  v65 = a7;
  v64 = a10;
  v63 = a13;
  v30 = a14;
  v31 = a15;
  v32 = a16;
  v33 = a18;
  v34 = a22;
  v35 = a24;
  v68.receiver = self;
  v68.super_class = (Class)FKInstitution;
  v36 = -[FKInstitution init](&v68, sel_init);
  if (v36)
  {
    v37 = objc_msgSend(v67, "copy");
    institutionIdentifier = v36->_institutionIdentifier;
    v36->_institutionIdentifier = (NSString *)v37;

    v39 = objc_msgSend(v66, "copy");
    name = v36->_name;
    v36->_name = (NSString *)v39;

    v36->_reconsentType = a5;
    v36->_supportedAuthTypes = a6;
    v41 = objc_msgSend(v65, "copy");
    firstTransactionsRequestWindow = v36->_firstTransactionsRequestWindow;
    v36->_firstTransactionsRequestWindow = (NSNumber *)v41;

    v36->_maxAgeTransactionsFirstRequest = a8;
    v36->_maxAgeTransactionsRefreshRequest = a9;
    v43 = objc_msgSend(v64, "copy");
    extensionsBundleIdentifiers = v36->_extensionsBundleIdentifiers;
    v36->_extensionsBundleIdentifiers = (NSArray *)v43;

    v36->_maximumNumberOfBackgroundRefreshes = a11;
    v36->_numberOfRemainingBackgroundRefreshes = a12;
    v45 = objc_msgSend(v63, "copy");
    backgroundRefreshRetryAfterDate = v36->_backgroundRefreshRetryAfterDate;
    v36->_backgroundRefreshRetryAfterDate = (NSDate *)v45;

    v47 = objc_msgSend(v30, "copy");
    lastBackgroundRefreshDate = v36->_lastBackgroundRefreshDate;
    v36->_lastBackgroundRefreshDate = (NSDate *)v47;

    v49 = objc_msgSend(v31, "copy");
    backgroundRefreshConfirmationWindow = v36->_backgroundRefreshConfirmationWindow;
    v36->_backgroundRefreshConfirmationWindow = (NSNumber *)v49;

    v51 = objc_msgSend(v32, "copy");
    backgroundRefreshConfirmationExpiryWindow = v36->_backgroundRefreshConfirmationExpiryWindow;
    v36->_backgroundRefreshConfirmationExpiryWindow = (NSNumber *)v51;

    v36->_multipleConsentsEnabled = a17;
    v53 = objc_msgSend(v33, "copy");
    termsAndConditions = v36->_termsAndConditions;
    v36->_termsAndConditions = (FKBankConnectTermsAndConditions *)v53;

    v36->_problemReportingEnabled = a19;
    v36->_financialLabEnabled = a20;
    v36->_consentSyncingEnabled = a21;
    v55 = objc_msgSend(v34, "copy");
    consentSyncingOutdatedTokenWaitTimeout = v36->_consentSyncingOutdatedTokenWaitTimeout;
    v36->_consentSyncingOutdatedTokenWaitTimeout = (NSNumber *)v55;

    v36->_timestampSuitableForUserDisplay = a23;
    v57 = objc_msgSend(v35, "copy");
    piiRedactionConfigurationCountryCodes = v36->_piiRedactionConfigurationCountryCodes;
    v36->_piiRedactionConfigurationCountryCodes = (NSSet *)v57;

    v36->_privacyLabels = a25;
  }

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKInstitution *v5;
  uint64_t v6;
  NSString *institutionIdentifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSNumber *firstTransactionsRequestWindow;
  uint64_t v12;
  NSArray *extensionsBundleIdentifiers;
  uint64_t v14;
  NSDate *backgroundRefreshRetryAfterDate;
  uint64_t v16;
  NSDate *lastBackgroundRefreshDate;
  uint64_t v18;
  NSNumber *backgroundRefreshConfirmationWindow;
  uint64_t v20;
  NSNumber *backgroundRefreshConfirmationExpiryWindow;
  FKBankConnectTermsAndConditions *v22;
  FKBankConnectTermsAndConditions *termsAndConditions;
  uint64_t v24;
  NSNumber *consentSyncingOutdatedTokenWaitTimeout;
  uint64_t v26;
  NSSet *piiRedactionConfigurationCountryCodes;

  v5 = objc_alloc_init(FKInstitution);
  v6 = -[NSString copyWithZone:](self->_institutionIdentifier, "copyWithZone:", a3);
  institutionIdentifier = v5->_institutionIdentifier;
  v5->_institutionIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  name = v5->_name;
  v5->_name = (NSString *)v8;

  v5->_reconsentType = self->_reconsentType;
  v5->_supportedAuthTypes = self->_supportedAuthTypes;
  v10 = -[NSNumber copyWithZone:](self->_firstTransactionsRequestWindow, "copyWithZone:", a3);
  firstTransactionsRequestWindow = v5->_firstTransactionsRequestWindow;
  v5->_firstTransactionsRequestWindow = (NSNumber *)v10;

  v5->_maxAgeTransactionsFirstRequest = self->_maxAgeTransactionsFirstRequest;
  v5->_maxAgeTransactionsRefreshRequest = self->_maxAgeTransactionsRefreshRequest;
  v12 = -[NSArray copyWithZone:](self->_extensionsBundleIdentifiers, "copyWithZone:", a3);
  extensionsBundleIdentifiers = v5->_extensionsBundleIdentifiers;
  v5->_extensionsBundleIdentifiers = (NSArray *)v12;

  v5->_maximumNumberOfBackgroundRefreshes = self->_maximumNumberOfBackgroundRefreshes;
  v5->_numberOfRemainingBackgroundRefreshes = self->_numberOfRemainingBackgroundRefreshes;
  v14 = -[NSDate copyWithZone:](self->_backgroundRefreshRetryAfterDate, "copyWithZone:", a3);
  backgroundRefreshRetryAfterDate = v5->_backgroundRefreshRetryAfterDate;
  v5->_backgroundRefreshRetryAfterDate = (NSDate *)v14;

  v16 = -[NSDate copyWithZone:](self->_lastBackgroundRefreshDate, "copyWithZone:", a3);
  lastBackgroundRefreshDate = v5->_lastBackgroundRefreshDate;
  v5->_lastBackgroundRefreshDate = (NSDate *)v16;

  v18 = -[NSNumber copyWithZone:](self->_backgroundRefreshConfirmationWindow, "copyWithZone:", a3);
  backgroundRefreshConfirmationWindow = v5->_backgroundRefreshConfirmationWindow;
  v5->_backgroundRefreshConfirmationWindow = (NSNumber *)v18;

  v20 = -[NSNumber copyWithZone:](self->_backgroundRefreshConfirmationExpiryWindow, "copyWithZone:", a3);
  backgroundRefreshConfirmationExpiryWindow = v5->_backgroundRefreshConfirmationExpiryWindow;
  v5->_backgroundRefreshConfirmationExpiryWindow = (NSNumber *)v20;

  v5->_multipleConsentsEnabled = self->_multipleConsentsEnabled;
  v22 = -[FKBankConnectTermsAndConditions copyWithZone:](self->_termsAndConditions, "copyWithZone:", a3);
  termsAndConditions = v5->_termsAndConditions;
  v5->_termsAndConditions = v22;

  v5->_problemReportingEnabled = self->_problemReportingEnabled;
  v5->_financialLabEnabled = self->_financialLabEnabled;
  v5->_consentSyncingEnabled = self->_consentSyncingEnabled;
  v24 = -[NSNumber copyWithZone:](self->_consentSyncingOutdatedTokenWaitTimeout, "copyWithZone:", a3);
  consentSyncingOutdatedTokenWaitTimeout = v5->_consentSyncingOutdatedTokenWaitTimeout;
  v5->_consentSyncingOutdatedTokenWaitTimeout = (NSNumber *)v24;

  v5->_timestampSuitableForUserDisplay = self->_timestampSuitableForUserDisplay;
  v26 = -[NSSet copyWithZone:](self->_piiRedactionConfigurationCountryCodes, "copyWithZone:", a3);
  piiRedactionConfigurationCountryCodes = v5->_piiRedactionConfigurationCountryCodes;
  v5->_piiRedactionConfigurationCountryCodes = (NSSet *)v26;

  v5->_privacyLabels = self->_privacyLabels;
  return v5;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_institutionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_extensionsBundleIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_firstTransactionsRequestWindow);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundRefreshConfirmationWindow);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundRefreshConfirmationExpiryWindow);
  objc_msgSend(v3, "safelyAddObject:", self->_termsAndConditions);
  objc_msgSend(v3, "safelyAddObject:", self->_piiRedactionConfigurationCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundRefreshRetryAfterDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastBackgroundRefreshDate);
  objc_msgSend(v3, "safelyAddObject:", self->_consentSyncingOutdatedTokenWaitTimeout);
  v4 = FKCombinedHash(17, v3);
  v5 = FKIntegerHash(v4, self->_reconsentType);
  v6 = FKIntegerHash(v5, self->_supportedAuthTypes);
  v7 = FKIntegerHash(v6, (unint64_t)self->_maxAgeTransactionsFirstRequest);
  v8 = FKIntegerHash(v7, (unint64_t)self->_maxAgeTransactionsRefreshRequest);
  v9 = FKIntegerHash(v8, self->_multipleConsentsEnabled);
  v10 = FKIntegerHash(v9, self->_problemReportingEnabled);
  v11 = FKIntegerHash(v10, self->_financialLabEnabled);
  v12 = FKIntegerHash(v11, self->_consentSyncingEnabled);
  v13 = FKIntegerHash(v12, self->_timestampSuitableForUserDisplay);
  v14 = FKIntegerHash(v13, self->_privacyLabels);
  v15 = FKIntegerHash(v14, self->_maximumNumberOfBackgroundRefreshes);
  v16 = FKIntegerHash(v15, self->_numberOfRemainingBackgroundRefreshes);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  FKInstitution *v4;
  FKInstitution *v5;
  void **v6;
  BOOL v7;

  v4 = (FKInstitution *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = FKEqualObjects(self->_institutionIdentifier, v6[3])
      && FKEqualObjects(self->_name, v6[4])
      && FKEqualObjects(self->_extensionsBundleIdentifiers, v6[9])
      && FKEqualObjects(self->_firstTransactionsRequestWindow, v6[6])
      && FKEqualObjects(self->_backgroundRefreshConfirmationWindow, v6[14])
      && FKEqualObjects(self->_backgroundRefreshConfirmationExpiryWindow, v6[15])
      && FKEqualObjects(self->_termsAndConditions, v6[16])
      && FKEqualObjects(self->_piiRedactionConfigurationCountryCodes, v6[18])
      && FKEqualObjects(self->_backgroundRefreshRetryAfterDate, v6[12])
      && FKEqualObjects(self->_lastBackgroundRefreshDate, v6[13])
      && FKEqualObjects(self->_consentSyncingOutdatedTokenWaitTimeout, v6[17])
      && (void *)self->_reconsentType == v6[5]
      && (unsigned __int16)self->_supportedAuthTypes == *((unsigned __int16 *)v6 + 7)
      && self->_maxAgeTransactionsFirstRequest == *((double *)v6 + 7)
      && self->_maxAgeTransactionsRefreshRequest == *((double *)v6 + 8)
      && self->_multipleConsentsEnabled == *((unsigned __int8 *)v6 + 8)
      && self->_problemReportingEnabled == *((unsigned __int8 *)v6 + 9)
      && self->_financialLabEnabled == *((unsigned __int8 *)v6 + 10)
      && self->_consentSyncingEnabled == *((unsigned __int8 *)v6 + 11)
      && self->_timestampSuitableForUserDisplay == *((unsigned __int8 *)v6 + 12)
      && (unsigned __int16)self->_privacyLabels == *((unsigned __int16 *)v6 + 8)
      && (void *)self->_maximumNumberOfBackgroundRefreshes == v6[10]
      && self->_numberOfRemainingBackgroundRefreshes == (_QWORD)v6[11];

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)institutionIdentifier
{
  return self->_institutionIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)reconsentType
{
  return self->_reconsentType;
}

- (signed)supportedAuthTypes
{
  return self->_supportedAuthTypes;
}

- (NSNumber)firstTransactionsRequestWindow
{
  return self->_firstTransactionsRequestWindow;
}

- (double)maxAgeTransactionsFirstRequest
{
  return self->_maxAgeTransactionsFirstRequest;
}

- (double)maxAgeTransactionsRefreshRequest
{
  return self->_maxAgeTransactionsRefreshRequest;
}

- (NSArray)extensionsBundleIdentifiers
{
  return self->_extensionsBundleIdentifiers;
}

- (int64_t)maximumNumberOfBackgroundRefreshes
{
  return self->_maximumNumberOfBackgroundRefreshes;
}

- (int64_t)numberOfRemainingBackgroundRefreshes
{
  return self->_numberOfRemainingBackgroundRefreshes;
}

- (NSDate)backgroundRefreshRetryAfterDate
{
  return self->_backgroundRefreshRetryAfterDate;
}

- (NSDate)lastBackgroundRefreshDate
{
  return self->_lastBackgroundRefreshDate;
}

- (NSNumber)backgroundRefreshConfirmationWindow
{
  return self->_backgroundRefreshConfirmationWindow;
}

- (NSNumber)backgroundRefreshConfirmationExpiryWindow
{
  return self->_backgroundRefreshConfirmationExpiryWindow;
}

- (BOOL)multipleConsentsEnabled
{
  return self->_multipleConsentsEnabled;
}

- (FKBankConnectTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (BOOL)problemReportingEnabled
{
  return self->_problemReportingEnabled;
}

- (BOOL)financialLabEnabled
{
  return self->_financialLabEnabled;
}

- (BOOL)consentSyncingEnabled
{
  return self->_consentSyncingEnabled;
}

- (NSNumber)consentSyncingOutdatedTokenWaitTimeout
{
  return self->_consentSyncingOutdatedTokenWaitTimeout;
}

- (BOOL)timestampSuitableForUserDisplay
{
  return self->_timestampSuitableForUserDisplay;
}

- (NSSet)piiRedactionConfigurationCountryCodes
{
  return self->_piiRedactionConfigurationCountryCodes;
}

- (signed)privacyLabels
{
  return self->_privacyLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_piiRedactionConfigurationCountryCodes, 0);
  objc_storeStrong((id *)&self->_consentSyncingOutdatedTokenWaitTimeout, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationExpiryWindow, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationWindow, 0);
  objc_storeStrong((id *)&self->_lastBackgroundRefreshDate, 0);
  objc_storeStrong((id *)&self->_backgroundRefreshRetryAfterDate, 0);
  objc_storeStrong((id *)&self->_extensionsBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_firstTransactionsRequestWindow, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_institutionIdentifier, 0);
}

@end
