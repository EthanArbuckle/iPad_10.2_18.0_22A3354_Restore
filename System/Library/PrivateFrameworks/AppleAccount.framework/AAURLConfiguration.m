@implementation AAURLConfiguration

+ (AARemoteServer)remoteServer
{
  if (remoteServer_onceToken != -1)
    dispatch_once(&remoteServer_onceToken, &__block_literal_global_18);
  return (AARemoteServer *)(id)_AAURLConfigurationRemoteServer;
}

void __34__AAURLConfiguration_remoteServer__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!_AAURLConfigurationRemoteServer)
  {
    +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_AAURLConfigurationRemoteServer;
    _AAURLConfigurationRemoteServer = v0;

  }
}

+ (void)setRemoteServer:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AAURLConfiguration.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteServer"));

  }
  v6 = (void *)_AAURLConfigurationRemoteServer;
  _AAURLConfigurationRemoteServer = (uint64_t)v5;

}

- (AAURLConfiguration)init
{
  -[AAURLConfiguration doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AAURLConfiguration)initWithDictionary:(id)a3
{
  id v5;
  AAURLConfiguration *v6;
  uint64_t v7;
  NSDictionary *dictionary;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLConfiguration.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)AAURLConfiguration;
  v6 = -[AAURLConfiguration init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

  }
  return v6;
}

- (AAURLConfiguration)initWithCoder:(id)a3
{
  id v4;
  AAURLConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *dictionary;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAURLConfiguration;
  v5 = -[AAURLConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("configuration-dictionary"));
    v12 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("configuration-dictionary"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)urlForEndpoint:(id)a3
{
  NSDictionary *dictionary;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  dictionary = self->_dictionary;
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", CFSTR("urls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSNumber)absintheEnable
{
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("abs-enable"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSNumber *)v5;
}

- (NSNumber)termsUIType
{
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("terms-ui-type"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSNumber *)v5;
}

- (NSNumber)homepodSetupiCloudTerms
{
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homepod-setup-icloud-terms"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSNumber *)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, self->_dictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (id)urlConfiguration
{
  return (id)objc_msgSend(a1, "_urlConfigurationWithError:", 0);
}

+ (id)itemForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0;
  objc_msgSend(a1, "_urlConfigurationWithError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (a4 && v8)
  {
    v10 = 0;
    *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v7, "_urlStringForKey:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v11;
    if (a4 && !v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ICLOUD_CONFIG_ERROR"), 0, CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.appleaccount"), -2, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

+ (id)_urlConfigurationWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  objc_msgSend(a1, "remoteServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__AAURLConfiguration_Deprecated___urlConfigurationWithError___block_invoke;
  v10[3] = &unk_1E416FF30;
  v12 = &v20;
  v13 = &v14;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "configurationWithCompletion:", v10);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __61__AAURLConfiguration_Deprecated___urlConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSArray)urlsStoringCookies
{
  id v3;
  id v4;

  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("cookieDomainUrls"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (id)_envStringForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("env"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (NSString)apsEnvironment
{
  return (NSString *)-[AAURLConfiguration _envStringForKey:](self, "_envStringForKey:", CFSTR("apsEnv"));
}

- (id)_urlStringForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("urls"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (NSString)accountCreationURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("newAccount"));
}

- (NSString)updateAccountURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("updateAccount"));
}

- (NSString)registerURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("register"));
}

- (NSString)validateURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("validate"));
}

- (NSString)accountCreationUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("newAccountUI"));
}

- (NSString)updateAccountUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("updateAccountUI"));
}

- (NSString)signInURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loginOrCreateAccount"));
}

- (NSString)fetchAccountSettingsURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getAccountSettings"));
}

- (NSString)authenticateURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("authenticate"));
}

- (NSString)initiateValidateEmailURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("validateEmail"));
}

- (NSString)addEmailURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("addEmailUI"));
}

- (NSString)completeValidateEmailURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("completeVetting"));
}

- (NSString)mobileMeOfferAlertURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("rampAlert"));
}

- (NSString)signingSessionCertURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("qualifyCert"));
}

- (NSString)signingSessionURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("qualifySession"));
}

- (NSString)emailLookupURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("emailLookup"));
}

- (NSString)genericTermsURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("genericTermsUI"));
}

- (NSString)termsReportUserActionURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("termsReportUserAction"));
}

- (NSString)fmipAuthenticate
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("fmipauthenticate"));
}

- (NSString)iForgotUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("iForgotBuddyML"));
}

- (NSString)existingAppleIDTermsUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("existingAppleIdTermsUI"));
}

- (NSString)finishProvisioningURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("md-finish-provisioning"));
}

- (NSString)syncMachineURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("md-sync-machine"));
}

- (NSString)loginAccountURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("unifiedLoginAccount"));
}

- (NSString)loginDelegatesURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loginDelegates"));
}

- (NSString)createDelegatesURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("createDelegateAccounts"));
}

- (NSString)loginOrCreateDelegatesURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loginOrCreateSSODelegates"));
}

- (NSString)deviceListURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("deviceListUrl"));
}

- (NSString)sendCodeURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("sendCodeUrl"));
}

- (NSString)verifyCodeURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("verifyCodeUrl"));
}

- (NSString)accountManagementUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadAccountUI"));
}

- (NSString)familyUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadFamilyUI"));
}

- (NSString)devicesUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadDevicesUI"));
}

- (NSString)paymentSummaryURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadPaymentInfoUI"));
}

- (NSString)familySetupUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("setUpFamilyUI"));
}

- (NSString)personalInfoUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadPersonalInfoUI"));
}

- (NSString)passwordSecurityUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadPasswordSecurityUI"));
}

- (NSString)paymentInfoUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadPaymentUI"));
}

- (NSString)registerDeviceURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("registerDevice"));
}

- (NSString)unregisterDeviceURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("deregisterDevice"));
}

- (NSString)getFamilyPushDetailsURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getFamilyEventDetails"));
}

- (NSString)getAccountEventDetailsURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getAccountEventDetails"));
}

- (NSString)acceptFamilyInviteURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("acceptFamilyInvitation"));
}

- (NSString)declineFamilyInviteURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("rejectFamilyInvitation"));
}

- (NSString)secondaryAuthenticationURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("secondaryAuthUrl"));
}

- (NSString)getMyPhotoURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getMeCardPhoto"));
}

- (NSString)updateMyPhotoURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("putMeCardPhoto"));
}

- (NSString)getFamilyMemberPhotoURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getFamilyMemberPhoto"));
}

- (NSString)familyEligibilityURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("checkFamilyEligibility"));
}

- (NSString)checkiCloudMembershipURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("checkiCloudMembership"));
}

- (NSString)pendingFamilyInvitesUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadFamilyInvitationsUI"));
}

- (NSString)updateNameURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("updateNameUrl"));
}

- (NSString)familyMemberDetailsUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("viewMemberDetailsUI"));
}

- (NSString)addFamilyMemberUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("addFamilyMemberUI"));
}

- (NSString)getFamilyDetailsURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getFamilyDetails"));
}

- (NSString)childAccountCreationUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("createChildAccountUI"));
}

- (NSString)grandslamURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("grandslamUrl"));
}

- (NSString)acceptChildTransferURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("acceptChildTransferRequest"));
}

- (NSString)rejectChildTransferURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("rejectChildTransferRequest"));
}

- (NSString)familyLearnMoreURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("familyLearnMoreURL"));
}

- (NSString)cloudKitMigrationStateURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("icdMigrateStatus"));
}

- (NSString)cloudKitStartMigrationURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("icdMigrateInit"));
}

- (NSString)cloudKitDevicesListURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("icdMigrateDevices"));
}

- (NSString)familyPaymentInfoURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getFamilyPaymentInfo"));
}

- (NSString)aboutURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("about"));
}

- (NSString)familyPaymentCardUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("loadFamilyPaymentCardUI"));
}

- (NSString)dismissAlertURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("dismissAccountAlert"));
}

- (NSString)getDeviceListURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("getDeviceList"));
}

- (NSString)repairCloudAccountUIURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("repairCloudAccountUI"));
}

- (NSString)walrusWebAccessPCSAuthURL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("walrusWebAccessPCSAuthKey"));
}

- (NSString)initiateFamilyV2URL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("initiateFamily.v2"));
}

- (NSString)startFamilyInviteV2URL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("startFamilyInvite.v2"));
}

- (NSString)familyInviteSentV2URL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("familyInviteSent.v2"));
}

- (NSString)fetchFamilyInviteV2URL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("fetchFamilyInvite.v2"));
}

- (NSString)acceptFamilyInviteV2URL
{
  return (NSString *)-[AAURLConfiguration _urlStringForKey:](self, "_urlStringForKey:", CFSTR("acceptFamilyInvite.v2"));
}

+ (int64_t)beneficiaryStaleInviteDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inheritanceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", AAInheritanceConfigStaleInviteDurationKey[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    if (v6 >= 0)
      v7 = v6;
    else
      v7 = -v6;
  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[AAURLConfiguration(Deprecated) beneficiaryStaleInviteDuration].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v7 = 43200;
  }

  return v7;
}

+ (int64_t)beneficiaryDurationBeforeNotSetupCFU
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inheritanceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", AAInheritanceConfigDurationBeforeNotSetupCFUKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
    if (v6 >= 0)
      v7 = v6;
    else
      v7 = -v6;
  }
  else
  {
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[AAURLConfiguration(Deprecated) beneficiaryDurationBeforeNotSetupCFU].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v7 = 86400;
  }

  return v7;
}

@end
