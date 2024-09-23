@implementation SOKerberosContext

- (SOKerberosContext)initWithRequest:(id)a3 extensionData:(id)a4
{
  id v7;
  id v8;
  SOKerberosContext *v9;
  SOKerberosContext *v10;
  uint64_t v11;
  NSString *callerLocalizedName;
  void *v13;
  uint64_t v14;
  NSString *realm;
  void *v16;
  uint64_t v17;
  NSString *hostName;
  SOKerberosExtensionUserData *v19;
  SOKerberosExtensionUserData *extensionUserData;
  dispatch_group_t v21;
  OS_dispatch_group *dispatchGroup;
  uint64_t v23;
  NSString *callerBundleIdentifier;
  void *v25;
  uint64_t v26;
  NSString *impersonationBundleIdentifier;
  NSString *v28;
  dispatch_group_t v29;
  OS_dispatch_group *siteCodeGroup;
  void *v31;
  uint64_t v32;
  NSData *auditToken;
  SOKerberosRealmSettings *v34;
  void *v35;
  uint64_t v36;
  SOKerberosRealmSettings *currentSettings;
  SOKerberosRealmSettings *v38;
  uint64_t v39;
  NSUUID *credentialUUID;
  uint64_t v41;
  NSData *pkinitPersistientRef;
  uint64_t v43;
  NSString *certificateTokenID;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSString *userPrincipalName;
  uint64_t v49;
  NSString *userName;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  NSString *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  objc_super v61;

  v7 = a3;
  v8 = a4;
  v61.receiver = self;
  v61.super_class = (Class)SOKerberosContext;
  v9 = -[SOKerberosContext init](&v61, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorizationRequest, a3);
    -[ASAuthorizationProviderExtensionAuthorizationRequest localizedCallerDisplayName](v10->_authorizationRequest, "localizedCallerDisplayName");
    v11 = objc_claimAutoreleasedReturnValue();
    callerLocalizedName = v10->_callerLocalizedName;
    v10->_callerLocalizedName = (NSString *)v11;

    objc_msgSend(v7, "realm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uppercaseString");
    v14 = objc_claimAutoreleasedReturnValue();
    realm = v10->_realm;
    v10->_realm = (NSString *)v14;

    objc_msgSend(v7, "url");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "host");
    v17 = objc_claimAutoreleasedReturnValue();
    hostName = v10->_hostName;
    v10->_hostName = (NSString *)v17;

    objc_storeStrong((id *)&v10->_extensionData, a4);
    v19 = objc_alloc_init(SOKerberosExtensionUserData);
    extensionUserData = v10->_extensionUserData;
    v10->_extensionUserData = v19;

    v10->_returnCredentialOnly = 0;
    v21 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v21;

    -[ASAuthorizationProviderExtensionAuthorizationRequest callerBundleIdentifier](v10->_authorizationRequest, "callerBundleIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    callerBundleIdentifier = v10->_callerBundleIdentifier;
    v10->_callerBundleIdentifier = (NSString *)v23;

    -[ASAuthorizationProviderExtensionAuthorizationRequest authorizationRequest](v10->_authorizationRequest, "authorizationRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "impersonationBundleIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    impersonationBundleIdentifier = v10->_impersonationBundleIdentifier;
    v10->_impersonationBundleIdentifier = (NSString *)v26;

    if (-[NSString isEqualToString:](v10->_impersonationBundleIdentifier, "isEqualToString:", &stru_24D3EC758))
    {
      v28 = v10->_impersonationBundleIdentifier;
      v10->_impersonationBundleIdentifier = 0;

    }
    v10->_isManagedApp = objc_msgSend(v7, "isCallerManaged");
    *(_WORD *)&v10->_attemptedToGetCredsFromKeychain = 0;
    v10->_laContextFailureCount = 0;
    v10->_refreshCredential = 0;
    *(_WORD *)&v10->_smartCardNeedsInsert = 0;
    v29 = dispatch_group_create();
    siteCodeGroup = v10->_siteCodeGroup;
    v10->_siteCodeGroup = (OS_dispatch_group *)v29;

    objc_msgSend(v7, "authorizationRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "auditTokenData");
    v32 = objc_claimAutoreleasedReturnValue();
    auditToken = v10->_auditToken;
    v10->_auditToken = (NSData *)v32;

    v10->_useKerberosPasswordInsteadOfMDMIdentity = 0;
    v34 = [SOKerberosRealmSettings alloc];
    -[SOKerberosContext realm](v10, "realm");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[SOKerberosRealmSettings initWithRealm:](v34, "initWithRealm:", v35);
    currentSettings = v10->_currentSettings;
    v10->_currentSettings = (SOKerberosRealmSettings *)v36;

    -[SOKerberosRealmSettings startListeningForPlatformSSOTGTChanges](v10->_currentSettings, "startListeningForPlatformSSOTGTChanges");
    v38 = v10->_currentSettings;
    if (v38)
    {
      -[SOKerberosRealmSettings credentialUUID](v38, "credentialUUID");
      v39 = objc_claimAutoreleasedReturnValue();
      credentialUUID = v10->_credentialUUID;
      v10->_credentialUUID = (NSUUID *)v39;

      -[SOKerberosRealmSettings pkinitPersistientRef](v10->_currentSettings, "pkinitPersistientRef");
      v41 = objc_claimAutoreleasedReturnValue();
      pkinitPersistientRef = v10->_pkinitPersistientRef;
      v10->_pkinitPersistientRef = (NSData *)v41;

      -[SOKerberosRealmSettings smartCardTokenID](v10->_currentSettings, "smartCardTokenID");
      v43 = objc_claimAutoreleasedReturnValue();
      certificateTokenID = v10->_certificateTokenID;
      v10->_certificateTokenID = (NSString *)v43;

      -[SOKerberosRealmSettings userPrincipalName](v10->_currentSettings, "userPrincipalName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        SO_LOG_SOKerberosContext();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          -[SOKerberosContext initWithRequest:extensionData:].cold.4((id *)&v10->_currentSettings, v46);

        -[SOKerberosRealmSettings userPrincipalName](v10->_currentSettings, "userPrincipalName");
        v47 = objc_claimAutoreleasedReturnValue();
        userPrincipalName = v10->_userPrincipalName;
        v10->_userPrincipalName = (NSString *)v47;

        -[SOKerberosRealmSettings userName](v10->_currentSettings, "userName");
        v49 = objc_claimAutoreleasedReturnValue();
        userName = v10->_userName;
        v10->_userName = (NSString *)v49;

        v10->_userNameIsReadOnly = 1;
      }
      else
      {
        objc_msgSend(v8, "principalName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          SO_LOG_SOKerberosContext();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            -[SOKerberosContext initWithRequest:extensionData:].cold.3(v8, v52);

          objc_msgSend(v8, "principalName");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = v10->_userName;
          v10->_userName = (NSString *)v53;

        }
        else
        {
          objc_msgSend(v7, "httpHeaders");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKey:", CFSTR("user_name"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            SO_LOG_SOKerberosContext();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              -[SOKerberosContext initWithRequest:extensionData:].cold.2();

            objc_storeStrong((id *)&v10->_userName, v56);
            v10->_userNameIsReadOnly = 1;
          }

        }
      }
      objc_msgSend(v8, "principalName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        SO_LOG_SOKerberosContext();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          -[SOKerberosContext initWithRequest:extensionData:].cold.1(v59);

        v10->_userNameIsReadOnly = 1;
      }
    }
  }

  return v10;
}

- (NSString)userPrincipalName
{
  void *v3;
  NSString *userPrincipalName;
  _BOOL4 v5;
  NSString *v6;
  void *v7;
  void *v8;
  int v9;
  NSString *v10;
  NSString *userName;
  _BOOL4 v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSString *v19;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@%@"), self->_realm);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userPrincipalName = self->_userPrincipalName;
  if (userPrincipalName && self->_realm)
  {
    v5 = -[NSString hasSuffix:](userPrincipalName, "hasSuffix:", v3);
    v6 = self->_userPrincipalName;
    if (!v5)
    {
      -[NSString lowercaseString](v6, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "hasSuffix:", v8);

      if (v9)
      {
        v10 = self->_userPrincipalName;
LABEL_13:
        -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](v10, "stringByReplacingOccurrencesOfString:withString:options:range:", v3, v3, 1, 0, -[NSString length](v10, "length"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = self->_userPrincipalName;
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  userName = self->_userName;
  if (userName && self->_realm)
  {
    v12 = -[NSString hasSuffix:](userName, "hasSuffix:", v3);
    v6 = self->_userName;
    if (!v12)
    {
      -[NSString lowercaseString](v6, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "hasSuffix:", v16);

      if (v17)
      {
        v10 = self->_userName;
        goto LABEL_13;
      }
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = self->_userName;
LABEL_16:
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@@%@"), v19, self->_realm);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_9:
    v13 = v6;
LABEL_17:
    v14 = v13;
    goto LABEL_18;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (NSString)serviceName
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Kerberos:%@"), self->_realm);
}

- (void)setUserName:(id)a3
{
  id v5;
  NSString *userPrincipalName;
  id v7;

  v5 = a3;
  if (!self->_userNameIsReadOnly)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_userName, a3);
    userPrincipalName = self->_userPrincipalName;
    self->_userPrincipalName = 0;

    v5 = v7;
  }

}

- (void)setUserPrincipalNameAfterAuth:(id)a3
{
  objc_storeStrong((id *)&self->_userPrincipalName, a3);
}

- (void)startRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** starting request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finishRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** finishing request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)waitForCompletion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** waitForCompletion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelRequest
{
  -[SOKerberosContext cancelRequest:](self, "cancelRequest:", 1);
}

- (void)cancelRequest:(BOOL)a3
{
  NSObject *v4;
  void *v5;

  SO_LOG_SOKerberosContext();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext cancelRequest:].cold.1();

  -[SOKerberosContext setRequestCancelled:](self, "setRequestCancelled:", 1);
  -[SOKerberosContext finishRequest](self, "finishRequest");
  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

}

- (void)completeRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** completeRequest: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completeRequestWithHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  SO_LOG_SOKerberosContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext completeRequestWithHeaders:].cold.1();

  -[SOKerberosContext finishRequest](self, "finishRequest");
  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeWithHTTPAuthorizationHeaders:", v4);

}

- (void)completeRequestWithHTTPResponseHeaders:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  SO_LOG_SOKerberosContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext completeRequestWithHTTPResponseHeaders:].cold.1();

  v6 = objc_alloc(MEMORY[0x24BDD15B8]);
  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithURL:statusCode:HTTPVersion:headerFields:", v8, 200, CFSTR("HTTP/1.1"), v4);

  v10 = (void *)objc_opt_new();
  -[SOKerberosContext completeRequestWithHTTPResponse:httpBody:](self, "completeRequestWithHTTPResponse:httpBody:", v9, v10);

}

- (void)completeRequestWithHTTPResponse:(id)a3 httpBody:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  SO_LOG_SOKerberosContext();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext completeRequestWithHTTPResponse:httpBody:].cold.1();

  -[SOKerberosContext finishRequest](self, "finishRequest");
  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "completeWithHTTPResponse:httpBody:", v7, v6);

}

- (void)completeRequestWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  SO_LOG_SOKerberosContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext completeRequestWithError:].cold.1();

  -[SOKerberosContext finishRequest](self, "finishRequest");
  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completeWithError:", v4);

}

- (void)completeRequestWithDoNotHandle
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "completeRequestWithDoNotHandle: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAuthorizationViewControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SO_LOG_SOKerberosContext();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosContext presentAuthorizationViewControllerWithCompletion:].cold.1();

  -[SOKerberosContext authorizationRequest](self, "authorizationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_24D3F2CE8;
  v10[0] = &unk_24D3F2CE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentAuthorizationViewControllerWithHints:completion:", v8, v4);

}

- (void)setUserPrincipalName:(id)a3
{
  objc_storeStrong((id *)&self->_userPrincipalName, a3);
}

- (NSString)userName
{
  return self->_userName;
}

- (SOKerberosRealmSettings)currentSettings
{
  return self->_currentSettings;
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (SOKerberosExtensionData)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
  objc_storeStrong((id *)&self->_extensionData, a3);
}

- (SOKerberosExtensionUserData)extensionUserData
{
  return self->_extensionUserData;
}

- (void)setExtensionUserData:(id)a3
{
  objc_storeStrong((id *)&self->_extensionUserData, a3);
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
}

- (NSString)servicePrincipalName
{
  return self->_servicePrincipalName;
}

- (void)setServicePrincipalName:(id)a3
{
  objc_storeStrong((id *)&self->_servicePrincipalName, a3);
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)changedPassword
{
  return self->_changedPassword;
}

- (void)setChangedPassword:(id)a3
{
  objc_storeStrong((id *)&self->_changedPassword, a3);
}

- (BOOL)userNameIsReadOnly
{
  return self->_userNameIsReadOnly;
}

- (void)setUserNameIsReadOnly:(BOOL)a3
{
  self->_userNameIsReadOnly = a3;
}

- (NSUUID)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
  objc_storeStrong((id *)&self->_credentialUUID, a3);
}

- (NSString)certificateTokenID
{
  return self->_certificateTokenID;
}

- (void)setCertificateTokenID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateTokenID, a3);
}

- (__SecIdentity)pkinitIdentity
{
  return self->_pkinitIdentity;
}

- (void)setPkinitIdentity:(__SecIdentity *)a3
{
  self->_pkinitIdentity = a3;
}

- (NSData)pkinitPersistientRef
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPkinitPersistientRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (LAContext)smartCardLAContext
{
  return (LAContext *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSmartCardLAContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (LAContext)keychainLAContext
{
  return (LAContext *)objc_getProperty(self, a2, 152, 1);
}

- (void)setKeychainLAContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)useKerberosPasswordInsteadOfMDMIdentity
{
  return self->_useKerberosPasswordInsteadOfMDMIdentity;
}

- (void)setUseKerberosPasswordInsteadOfMDMIdentity:(BOOL)a3
{
  self->_useKerberosPasswordInsteadOfMDMIdentity = a3;
}

- (SOSiteCode)siteCode
{
  return self->_siteCode;
}

- (void)setSiteCode:(id)a3
{
  objc_storeStrong((id *)&self->_siteCode, a3);
}

- (NSString)cacheName
{
  return self->_cacheName;
}

- (void)setCacheName:(id)a3
{
  objc_storeStrong((id *)&self->_cacheName, a3);
}

- (BOOL)returnCredentialOnly
{
  return self->_returnCredentialOnly;
}

- (void)setReturnCredentialOnly:(BOOL)a3
{
  self->_returnCredentialOnly = a3;
}

- (BOOL)refreshCredential
{
  return self->_refreshCredential;
}

- (void)setRefreshCredential:(BOOL)a3
{
  self->_refreshCredential = a3;
}

- (NSString)callerBundleIdentifier
{
  return self->_callerBundleIdentifier;
}

- (void)setCallerBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_callerBundleIdentifier, a3);
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, a3);
}

- (NSString)callerLocalizedName
{
  return self->_callerLocalizedName;
}

- (void)setCallerLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_callerLocalizedName, a3);
}

- (BOOL)credsCameFromKeychain
{
  return self->_credsCameFromKeychain;
}

- (void)setCredsCameFromKeychain:(BOOL)a3
{
  self->_credsCameFromKeychain = a3;
}

- (BOOL)requestCancelled
{
  return self->_requestCancelled;
}

- (void)setRequestCancelled:(BOOL)a3
{
  self->_requestCancelled = a3;
}

- (BOOL)attemptedToGetCredsFromKeychain
{
  return self->_attemptedToGetCredsFromKeychain;
}

- (void)setAttemptedToGetCredsFromKeychain:(BOOL)a3
{
  self->_attemptedToGetCredsFromKeychain = a3;
}

- (int)laContextFailureCount
{
  return self->_laContextFailureCount;
}

- (void)setLaContextFailureCount:(int)a3
{
  self->_laContextFailureCount = a3;
}

- (BOOL)forceLoginViewController
{
  return self->_forceLoginViewController;
}

- (void)setForceLoginViewController:(BOOL)a3
{
  self->_forceLoginViewController = a3;
}

- (NSDate)loginTimeStamp
{
  return self->_loginTimeStamp;
}

- (void)setLoginTimeStamp:(id)a3
{
  objc_storeStrong((id *)&self->_loginTimeStamp, a3);
}

- (OS_dispatch_group)siteCodeGroup
{
  return self->_siteCodeGroup;
}

- (void)setSiteCodeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_siteCodeGroup, a3);
}

- (SONetworkIdentity)networkIdentity
{
  return self->_networkIdentity;
}

- (void)setNetworkIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_networkIdentity, a3);
}

- (NSData)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (BOOL)isManagedApp
{
  return self->_isManagedApp;
}

- (void)setIsManagedApp:(BOOL)a3
{
  self->_isManagedApp = a3;
}

- (BOOL)smartCardNeedsInsert
{
  return self->_smartCardNeedsInsert;
}

- (void)setSmartCardNeedsInsert:(BOOL)a3
{
  self->_smartCardNeedsInsert = a3;
}

- (SOKerberosPacData)pacData
{
  return self->_pacData;
}

- (void)setPacData:(id)a3
{
  objc_storeStrong((id *)&self->_pacData, a3);
}

- (ASAuthorizationProviderExtensionAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void)setAuthorizationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationRequest, a3);
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDispatchGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (BOOL)requestStarted
{
  return self->_requestStarted;
}

- (void)setRequestStarted:(BOOL)a3
{
  self->_requestStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_authorizationRequest, 0);
  objc_storeStrong((id *)&self->_pacData, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_networkIdentity, 0);
  objc_storeStrong((id *)&self->_siteCodeGroup, 0);
  objc_storeStrong((id *)&self->_loginTimeStamp, 0);
  objc_storeStrong((id *)&self->_callerLocalizedName, 0);
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheName, 0);
  objc_storeStrong((id *)&self->_siteCode, 0);
  objc_storeStrong((id *)&self->_keychainLAContext, 0);
  objc_storeStrong((id *)&self->_smartCardLAContext, 0);
  objc_storeStrong((id *)&self->_pkinitPersistientRef, 0);
  objc_storeStrong((id *)&self->_certificateTokenID, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_changedPassword, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_servicePrincipalName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_extensionUserData, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_currentSettings, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userPrincipalName, 0);
}

- (void)initWithRequest:(os_log_t)log extensionData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215A1B000, log, OS_LOG_TYPE_DEBUG, "user name is read only", v1, 2u);
}

- (void)initWithRequest:extensionData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "user principal name is set in request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRequest:(void *)a1 extensionData:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "principalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "user name is set in extensiondata: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)initWithRequest:(id *)a1 extensionData:(NSObject *)a2 .cold.4(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "userPrincipalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, a2, v4, "user principal name is set in saved settings: %@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)cancelRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** canceling request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completeRequestWithHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** completeRequestWithHeaders: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completeRequestWithHTTPResponseHeaders:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** completeRequesWithHTTPBody: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completeRequestWithHTTPResponse:httpBody:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** completeRequesWithHTTPResponse: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)completeRequestWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** completeRequestWithError: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAuthorizationViewControllerWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "*************** presentAuthorizationViewControllerWithCompletion: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
