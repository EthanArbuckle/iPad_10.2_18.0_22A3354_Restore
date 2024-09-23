@implementation AMSBiometricsSignatureRequest

+ (id)biometricsSignatureRequestForURLResponse:(id)a3 account:(id)a4 session:(id)a5 task:(id)a6 clientInfo:(id)a7 options:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  AMSBiometricsIdentityMapChangeTask *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  AMSBiometricsSignatureRequest *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  AMSBiometricsSignatureRequest *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  AMSBiometricsSignatureRequest *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v14, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-TID-Challenge"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v53 = v17;
    v54 = v16;
    v21 = -[AMSBiometricsIdentityMapChangeTask initWithAccount:session:task:]([AMSBiometricsIdentityMapChangeTask alloc], "initWithAccount:session:task:", v15, v16, v17);
    -[AMSTask setRunMode:](v21, "setRunMode:", 1);
    -[AMSBiometricsIdentityMapChangeTask perform](v21, "perform");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v23 = objc_msgSend(v22, "resultWithError:", &v60);
    v24 = v60;

    if (!v23)
    {
      v57 = v18;
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "OSLogObject");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = (void *)objc_opt_class();
        v51 = v19;
        v41 = v40;
        AMSLogKey();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v40;
        v63 = 2114;
        v64 = v42;
        _os_log_impl(&dword_18C849000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric authentication for invalid identity map", buf, 0x16u);

        v19 = v51;
      }

      if (a9)
      {
        v36 = objc_retainAutorelease(v24);
        v37 = 0;
        *a9 = v36;
      }
      else
      {
        v37 = 0;
        v36 = v24;
      }
      v17 = v53;
      v18 = v57;
      goto LABEL_34;
    }
    v50 = v19;
    v52 = v15;
    v25 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v14, "ams_valueForHTTPHeaderField:", CFSTR("X-Apple-TID-Pkeyid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", 0x1E254D760) & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      if (!objc_msgSend(v26, "isEqual:", 0x1E254D780))
      {
LABEL_20:
        v59 = v24;
        v43 = -[AMSBiometricsSignatureRequest initWithAccount:clientInfo:challenge:localAuthContext:options:error:]([AMSBiometricsSignatureRequest alloc], "initWithAccount:clientInfo:challenge:localAuthContext:options:error:", v52, v18, v20, 0, v25, &v59);
        v36 = v59;

        if (v36)
        {
          v58 = v18;
          +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v44)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v44, "OSLogObject");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v55 = v43;
            v46 = (void *)objc_opt_class();
            v49 = v46;
            AMSLogKey();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v46;
            v43 = v55;
            v63 = 2114;
            v64 = v47;
            v65 = 2114;
            v66 = v36;
            _os_log_impl(&dword_18C849000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate biometrics request. Error: %{public}@", buf, 0x20u);

          }
          v37 = 0;
          if (a9)
            *a9 = objc_retainAutorelease(v36);
          v17 = v53;
          v18 = v58;
        }
        else
        {
          v37 = v43;
          v17 = v53;
        }

        v19 = v50;
        v15 = v52;
LABEL_34:

        v16 = v54;
        goto LABEL_35;
      }
      v27 = 1;
    }
    objc_msgSend(v25, "setPurpose:", v27);
    goto LABEL_20;
  }
  v56 = v18;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v28, "OSLogObject");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (void *)objc_opt_class();
    v31 = v14;
    v32 = v19;
    v33 = v30;
    AMSLogKey();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v30;
    v63 = 2114;
    v64 = v34;
    _os_log_impl(&dword_18C849000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping biometric authentication, response does not have challenge header", buf, 0x16u);

    v19 = v32;
    v14 = v31;
    v20 = 0;
  }

  AMSError(301, CFSTR("Missing Challenge Header"), CFSTR("The response is missing the X-Apple-TID-Challenge header."), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (a9)
  {
    v36 = objc_retainAutorelease(v35);
    v37 = 0;
    *a9 = v36;
  }
  else
  {
    v37 = 0;
  }
  v18 = v56;
LABEL_35:

  return v37;
}

- (AMSBiometricsSignatureRequest)initWithAccount:(id)a3 clientInfo:(id)a4 challenge:(id)a5 localAuthContext:(id)a6 options:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  AMSBiometricsSignatureRequest *v19;
  AMSBiometricsSignatureRequest *v20;
  __SecAccessControl *v21;
  id v22;
  LAContext *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __SecAccessControl *v28;
  id v29;
  LAContext *localAuthContext;
  uint64_t v31;
  NSDictionary *localAuthOptions;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v36 = a5;
  v17 = a6;
  v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)AMSBiometricsSignatureRequest;
  v19 = -[AMSBiometricsSignatureRequest init](&v39, sel_init);
  v20 = v19;
  if (!v19)
  {
    v22 = 0;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v19->_account, a3);
  objc_storeStrong((id *)&v20->_clientInfo, a4);
  objc_storeStrong((id *)&v20->_challenge, a5);
  objc_storeStrong((id *)&v20->_keychainOptions, a7);
  v38 = 0;
  v21 = +[AMSKeychain copyAccessControlRefWithAccount:options:error:](AMSKeychain, "copyAccessControlRefWithAccount:options:error:", v15, v18, &v38);
  v22 = v38;
  v20->_localAuthAccessControlRef = v21;
  if (v21)
  {
    if (v17)
    {
LABEL_4:
      v23 = (LAContext *)v17;
      goto LABEL_12;
    }
  }
  else
  {
    v35 = v16;
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_opt_class();
      v34 = v26;
      AMSLogKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      v42 = 2114;
      v43 = v27;
      v44 = 2114;
      v45 = v22;
      _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to copy access control reference with error: %{public}@", buf, 0x20u);

    }
    v37 = v22;
    v28 = +[AMSKeychain createAccessControlRefWithOptions:error:](AMSKeychain, "createAccessControlRefWithOptions:error:", v18, &v37);
    v29 = v37;

    v20->_localAuthAccessControlRef = v28;
    v22 = v29;
    v16 = v35;
    if (v17)
      goto LABEL_4;
  }
  v23 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
LABEL_12:
  localAuthContext = v20->_localAuthContext;
  v20->_localAuthContext = v23;

  if (v22)
  {

    if (a8)
    {
      v22 = objc_retainAutorelease(v22);
      v20 = 0;
      *a8 = v22;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    -[AMSBiometricsSignatureRequest _localAuthOptions](v20, "_localAuthOptions");
    v31 = objc_claimAutoreleasedReturnValue();
    localAuthOptions = v20->_localAuthOptions;
    v20->_localAuthOptions = (NSDictionary *)v31;

  }
LABEL_17:

  return v20;
}

- (AMSBiometricsSignatureRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AMSKeychainOptions *v12;
  void *v13;
  void *v14;
  AMSBiometricsSignatureRequest *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("kAccountKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChallengeKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kClientInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kDualActionKey"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kUseApplePayClassicKey"));
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kUseAutoEnrollmentKey"));
  objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kKeychainOptionsKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AMSKeychainOptions initWithOptionsDictionary:]([AMSKeychainOptions alloc], "initWithOptionsDictionary:", v11);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kLocalAuthContextKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC12A0]), "initWithExternalizedContext:", v13);
  else
    v14 = 0;
  v23 = 0;
  v15 = -[AMSBiometricsSignatureRequest initWithAccount:clientInfo:challenge:localAuthContext:options:error:](self, "initWithAccount:clientInfo:challenge:localAuthContext:options:error:", v22, v6, v21, v14, v12, &v23);
  v16 = v23;
  -[AMSBiometricsSignatureRequest setDualAction:](v15, "setDualAction:", v7);
  -[AMSBiometricsSignatureRequest setUseApplePayClassic:](v15, "setUseApplePayClassic:", v8);
  -[AMSBiometricsSignatureRequest setUseAutoEnrollment:](v15, "setUseAutoEnrollment:", v9);
  if (v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_18C849000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Error re-initializing signature request. %{public}@", buf, 0x16u);
    }

  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[AMSBiometricsSignatureRequest account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("kAccountKey"));

  -[AMSBiometricsSignatureRequest challenge](self, "challenge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("kChallengeKey"));

  -[AMSBiometricsSignatureRequest clientInfo](self, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("kClientInfoKey"));

  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest isDualAction](self, "isDualAction"), CFSTR("kDualActionKey"));
  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest shouldUseApplePayClassic](self, "shouldUseApplePayClassic"), CFSTR("kUseApplePayClassicKey"));
  objc_msgSend(v11, "encodeBool:forKey:", -[AMSBiometricsSignatureRequest shouldUseAutoEnrollment](self, "shouldUseAutoEnrollment"), CFSTR("kUseAutoEnrollmentKey"));
  -[AMSBiometricsSignatureRequest keychainOptions](self, "keychainOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("kKeychainOptionsKey"));

  -[AMSBiometricsSignatureRequest localAuthContext](self, "localAuthContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "externalizedContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("kLocalAuthContextKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__SecAccessControl)localAuthAccessControlRef
{
  return self->_localAuthAccessControlRef;
}

- (void)setLocalAuthAccessControlRef:(__SecAccessControl *)a3
{
  __SecAccessControl *localAuthAccessControlRef;

  if (a3)
    CFRetain(a3);
  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef)
    CFRelease(localAuthAccessControlRef);
  self->_localAuthAccessControlRef = a3;
}

- (void)dealloc
{
  __SecAccessControl *localAuthAccessControlRef;
  objc_super v4;

  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef)
    CFRelease(localAuthAccessControlRef);
  v4.receiver = self;
  v4.super_class = (Class)AMSBiometricsSignatureRequest;
  -[AMSBiometricsSignatureRequest dealloc](&v4, sel_dealloc);
}

- (id)_localAuthOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AMSProcessInfo *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AMSSetLogKeyIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBiometricsSignatureRequest clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBiometricsSignatureRequest clientInfo](self, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proxyAppBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [AMSProcessInfo alloc];
    -[AMSBiometricsSignatureRequest clientInfo](self, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "proxyAppBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[AMSProcessInfo initWithBundleIdentifier:](v8, "initWithBundleIdentifier:", v10);

    v5 = (void *)v11;
  }
  -[AMSBiometricsSignatureRequest keychainOptions](self, "keychainOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "displayAuthenticationReason");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    AMSLocalizedString(CFSTR("TOUCHID_AUTHENTICATION_REASON_APPLE_ACCOUNT"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBiometricsSignatureRequest account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "username");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, &unk_1E25AF038);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], &unk_1E25AF050);
  objc_msgSend(v5, "bundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (os_variant_has_internal_content()
      && !+[AMSProcessInfo BOOLForEntitlement:](AMSProcessInfo, "BOOLForEntitlement:", CFSTR("com.apple.private.CoreAuthentication.SPI")))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "OSLogObject");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        v23 = objc_opt_class();
        if (v4)
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v4);
        else
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: "), v23, v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v24;
        v44 = 2114;
        v45 = CFSTR("Attempting to set the icon bundle path on the local auth options, but we don’t have the correct entitlement.");
        _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@%{public}@", buf, 0x16u);

      }
    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "bundleURL");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v25, "stringWithUTF8String:", objc_msgSend(v26, "fileSystemRepresentation"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, &unk_1E25AF068);

  }
  objc_msgSend(v5, "localizedName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (os_variant_has_internal_content()
      && !+[AMSProcessInfo BOOLForEntitlement:](AMSProcessInfo, "BOOLForEntitlement:", CFSTR("com.apple.private.LocalAuthentication.CallerName")))
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v29, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        v32 = objc_opt_class();
        if (v4)
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] "), v32, v4);
        else
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: "), v32, v41);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2114;
        v45 = CFSTR("Attempting to set the caller name on the local auth options, but we don’t have the correct entitlement.");
        _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@%{public}@", buf, 0x16u);

      }
    }
    objc_msgSend(v5, "localizedName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, &unk_1E25AF080);

  }
  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[AMSBiometricsSignatureRequest keychainOptions](self, "keychainOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithBool:", objc_msgSend(v36, "authenticationFallbackVisible"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, &unk_1E25AF098);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, &unk_1E25AF0B0);

  AMSLocalizedString(CFSTR("BIO_USE_PASSWORD"), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, &unk_1E25AF0C8);

  return v3;
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)challenge
{
  return self->_challenge;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)isDualAction
{
  return self->_dualAction;
}

- (void)setDualAction:(BOOL)a3
{
  self->_dualAction = a3;
}

- (AMSKeychainOptions)keychainOptions
{
  return self->_keychainOptions;
}

- (NSDictionary)localAuthOptions
{
  return self->_localAuthOptions;
}

- (BOOL)shouldUseApplePayClassic
{
  return self->_useApplePayClassic;
}

- (void)setUseApplePayClassic:(BOOL)a3
{
  self->_useApplePayClassic = a3;
}

- (BOOL)shouldUseAutoEnrollment
{
  return self->_useAutoEnrollment;
}

- (void)setUseAutoEnrollment:(BOOL)a3
{
  self->_useAutoEnrollment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthOptions, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_localAuthContext, 0);
}

@end
