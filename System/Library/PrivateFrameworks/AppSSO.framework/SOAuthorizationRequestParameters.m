@implementation SOAuthorizationRequestParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOAuthorizationRequestParameters)initWithAuthorizationRequestParametersCore:(id)a3
{
  id v4;
  SOAuthorizationRequestParameters *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *url;
  uint64_t v10;
  NSDictionary *httpHeaders;
  uint64_t v12;
  NSData *httpBody;
  uint64_t v14;
  NSString *requestedOperation;
  uint64_t v16;
  NSData *auditTokenData;
  uint64_t v18;
  NSDictionary *authorizationOptions;
  uint64_t v20;
  NSString *realm;
  uint64_t v22;
  NSDictionary *extensionData;
  uint64_t v24;
  NSString *callerBundleIdentifier;
  uint64_t v26;
  NSString *callerTeamIdentifier;
  uint64_t v28;
  NSString *localizedCallerDisplayName;
  uint64_t v30;
  NSString *impersonationBundleIdentifier;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SOAuthorizationRequestParameters;
  v5 = -[SOAuthorizationRequestParameters init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "url");
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    objc_msgSend(v4, "httpHeaders");
    v10 = objc_claimAutoreleasedReturnValue();
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v10;

    objc_msgSend(v4, "httpBody");
    v12 = objc_claimAutoreleasedReturnValue();
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v12;

    objc_msgSend(v4, "requestedOperation");
    v14 = objc_claimAutoreleasedReturnValue();
    requestedOperation = v5->_requestedOperation;
    v5->_requestedOperation = (NSString *)v14;

    objc_msgSend(v4, "auditTokenData");
    v16 = objc_claimAutoreleasedReturnValue();
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v16;

    objc_msgSend(v4, "authorizationOptions");
    v18 = objc_claimAutoreleasedReturnValue();
    authorizationOptions = v5->_authorizationOptions;
    v5->_authorizationOptions = (NSDictionary *)v18;

    v5->_useInternalExtensions = objc_msgSend(v4, "useInternalExtensions");
    objc_msgSend(v4, "realm");
    v20 = objc_claimAutoreleasedReturnValue();
    realm = v5->_realm;
    v5->_realm = (NSString *)v20;

    objc_msgSend(v4, "extensionData");
    v22 = objc_claimAutoreleasedReturnValue();
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v22;

    objc_msgSend(v4, "callerBundleIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    callerBundleIdentifier = v5->_callerBundleIdentifier;
    v5->_callerBundleIdentifier = (NSString *)v24;

    v5->_responseCode = objc_msgSend(v4, "responseCode");
    v5->_cfNetworkInterception = objc_msgSend(v4, "isCFNetworkInterception");
    v5->_callerManaged = objc_msgSend(v4, "isCallerManaged");
    objc_msgSend(v4, "callerTeamIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    callerTeamIdentifier = v5->_callerTeamIdentifier;
    v5->_callerTeamIdentifier = (NSString *)v26;

    objc_msgSend(v4, "localizedCallerDisplayName");
    v28 = objc_claimAutoreleasedReturnValue();
    localizedCallerDisplayName = v5->_localizedCallerDisplayName;
    v5->_localizedCallerDisplayName = (NSString *)v28;

    v5->_enableUserInteraction = objc_msgSend(v4, "isUserInteractionEnabled");
    objc_msgSend(v4, "impersonationBundleIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    impersonationBundleIdentifier = v5->_impersonationBundleIdentifier;
    v5->_impersonationBundleIdentifier = (NSString *)v30;

    v5->_showOnCoverScreen = objc_msgSend(v4, "canShowOnCoverScreen");
  }

  return v5;
}

- (SOAuthorizationRequestParameters)initWithCoder:(id)a3
{
  id v4;
  SOAuthorizationRequestParameters *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSURL *url;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *requestedOperation;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *httpHeaders;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSData *httpBody;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *extensionData;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSString *callerBundleIdentifier;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSData *auditTokenData;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSString *realm;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSDictionary *authorizationOptions;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSString *callerTeamIdentifier;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSString *localizedCallerDisplayName;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSString *impersonationBundleIdentifier;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  objc_super v94;

  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)SOAuthorizationRequestParameters;
  v5 = -[SOAuthorizationRequestParameters init](&v94, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector("url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_requestedOperation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    requestedOperation = v5->_requestedOperation;
    v5->_requestedOperation = (NSString *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_httpHeaders);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v22;

    v24 = objc_opt_class();
    NSStringFromSelector(sel_httpBody);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    httpBody = v5->_httpBody;
    v5->_httpBody = (NSData *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_extensionData);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v36;

    v38 = objc_opt_class();
    NSStringFromSelector(sel_callerBundleIdentifier);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    callerBundleIdentifier = v5->_callerBundleIdentifier;
    v5->_callerBundleIdentifier = (NSString *)v40;

    v42 = objc_opt_class();
    NSStringFromSelector(sel_auditTokenData);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v44;

    v46 = objc_opt_class();
    NSStringFromSelector(sel_realm);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    realm = v5->_realm;
    v5->_realm = (NSString *)v48;

    v50 = (void *)MEMORY[0x24BDBCF20];
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, v52, v53, v54, v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_authorizationOptions);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    authorizationOptions = v5->_authorizationOptions;
    v5->_authorizationOptions = (NSDictionary *)v58;

    v60 = objc_opt_class();
    NSStringFromSelector(sel_useInternalExtensions);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useInternalExtensions = objc_msgSend(v62, "BOOLValue");

    v63 = objc_opt_class();
    NSStringFromSelector(sel_responseCode);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_responseCode = objc_msgSend(v65, "integerValue");

    v66 = objc_opt_class();
    NSStringFromSelector(sel_isCFNetworkInterception);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cfNetworkInterception = objc_msgSend(v68, "BOOLValue");

    v69 = objc_opt_class();
    NSStringFromSelector(sel_isCallerManaged);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_callerManaged = objc_msgSend(v71, "BOOLValue");

    v72 = objc_opt_class();
    NSStringFromSelector(sel_callerTeamIdentifier);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    callerTeamIdentifier = v5->_callerTeamIdentifier;
    v5->_callerTeamIdentifier = (NSString *)v74;

    v76 = objc_opt_class();
    NSStringFromSelector(sel_localizedCallerDisplayName);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v76, v77);
    v78 = objc_claimAutoreleasedReturnValue();
    localizedCallerDisplayName = v5->_localizedCallerDisplayName;
    v5->_localizedCallerDisplayName = (NSString *)v78;

    v80 = objc_opt_class();
    NSStringFromSelector(sel_isUserInteractionEnabled);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enableUserInteraction = objc_msgSend(v82, "BOOLValue");

    v83 = objc_opt_class();
    NSStringFromSelector(sel_impersonationBundleIdentifier);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v83, v84);
    v85 = objc_claimAutoreleasedReturnValue();
    impersonationBundleIdentifier = v5->_impersonationBundleIdentifier;
    v5->_impersonationBundleIdentifier = (NSString *)v85;

    v87 = objc_opt_class();
    NSStringFromSelector(sel_pssoAuthenticationMethod);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pssoAuthenticationMethod = objc_msgSend(v89, "integerValue");

    v90 = objc_opt_class();
    NSStringFromSelector(sel_canShowOnCoverScreen);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showOnCoverScreen = objc_msgSend(v92, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  NSURL *url;
  void *v8;
  NSString *requestedOperation;
  void *v10;
  NSDictionary *httpHeaders;
  void *v12;
  NSData *httpBody;
  void *v14;
  NSDictionary *extensionData;
  void *v16;
  NSString *callerBundleIdentifier;
  void *v18;
  NSData *auditTokenData;
  void *v20;
  NSString *realm;
  void *v22;
  NSDictionary *authorizationOptions;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *callerTeamIdentifier;
  void *v34;
  NSString *localizedCallerDisplayName;
  void *v36;
  void *v37;
  void *v38;
  NSString *impersonationBundleIdentifier;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  url = self->_url;
  NSStringFromSelector("url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", url, v8);

  requestedOperation = self->_requestedOperation;
  NSStringFromSelector(sel_requestedOperation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", requestedOperation, v10);

  httpHeaders = self->_httpHeaders;
  NSStringFromSelector(sel_httpHeaders);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", httpHeaders, v12);

  httpBody = self->_httpBody;
  NSStringFromSelector(sel_httpBody);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", httpBody, v14);

  extensionData = self->_extensionData;
  NSStringFromSelector(sel_extensionData);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", extensionData, v16);

  callerBundleIdentifier = self->_callerBundleIdentifier;
  NSStringFromSelector(sel_callerBundleIdentifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callerBundleIdentifier, v18);

  auditTokenData = self->_auditTokenData;
  NSStringFromSelector(sel_auditTokenData);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", auditTokenData, v20);

  realm = self->_realm;
  NSStringFromSelector(sel_realm);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", realm, v22);

  authorizationOptions = self->_authorizationOptions;
  NSStringFromSelector(sel_authorizationOptions);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", authorizationOptions, v24);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useInternalExtensions);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_useInternalExtensions);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v25, v26);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_responseCode);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_responseCode);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v27, v28);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cfNetworkInterception);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isCFNetworkInterception);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v29, v30);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_callerManaged);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isCallerManaged);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v31, v32);

  callerTeamIdentifier = self->_callerTeamIdentifier;
  NSStringFromSelector(sel_callerTeamIdentifier);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callerTeamIdentifier, v34);

  localizedCallerDisplayName = self->_localizedCallerDisplayName;
  NSStringFromSelector(sel_localizedCallerDisplayName);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedCallerDisplayName, v36);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableUserInteraction);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isUserInteractionEnabled);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v37, v38);

  impersonationBundleIdentifier = self->_impersonationBundleIdentifier;
  NSStringFromSelector(sel_impersonationBundleIdentifier);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", impersonationBundleIdentifier, v40);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_pssoAuthenticationMethod);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pssoAuthenticationMethod);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v41, v42);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showOnCoverScreen);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_canShowOnCoverScreen);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v44, v43);

}

- (id)description
{
  const __CFString *identifier;
  NSURL *url;
  const __CFString *v5;
  const __CFString *requestedOperation;
  const __CFString *realm;
  int64_t responseCode;
  NSDictionary *authorizationOptions;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *callerTeamIdentifier;
  NSString *localizedCallerDisplayName;
  const __CFString *v17;
  const __CFString *v18;
  int64_t pssoAuthenticationMethod;
  const __CFString *impersonationBundleIdentifier;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[14];
  _QWORD v26[15];

  v26[14] = *MEMORY[0x24BDAC8D0];
  identifier = (const __CFString *)self->_identifier;
  url = self->_url;
  if (!identifier)
    identifier = CFSTR("(null)");
  v25[0] = CFSTR("Identifier");
  v25[1] = CFSTR("URL");
  if (url)
    v5 = (const __CFString *)url;
  else
    v5 = CFSTR("(null)");
  v26[0] = identifier;
  v26[1] = v5;
  requestedOperation = (const __CFString *)self->_requestedOperation;
  if (!requestedOperation)
    requestedOperation = CFSTR("(null)");
  v25[2] = CFSTR("RequestedOperation");
  v25[3] = CFSTR("Realm");
  realm = (const __CFString *)self->_realm;
  if (!realm)
    realm = CFSTR("(null)");
  v26[2] = requestedOperation;
  v26[3] = realm;
  authorizationOptions = self->_authorizationOptions;
  responseCode = self->_responseCode;
  if (!authorizationOptions)
    authorizationOptions = (NSDictionary *)CFSTR("(null)");
  v25[4] = CFSTR("AuthorizationOptions");
  v25[5] = CFSTR("UseInternalExtensions");
  if (self->_useInternalExtensions)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v26[4] = authorizationOptions;
  v26[5] = v10;
  v25[6] = CFSTR("ResponseCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", responseCode);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (self->_cfNetworkInterception)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v26[6] = v11;
  v26[7] = v13;
  v25[7] = CFSTR("CFNetworkInterception");
  v25[8] = CFSTR("CallerManaged");
  if (self->_callerManaged)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  callerTeamIdentifier = (const __CFString *)self->_callerTeamIdentifier;
  localizedCallerDisplayName = self->_localizedCallerDisplayName;
  if (!callerTeamIdentifier)
    callerTeamIdentifier = CFSTR("(null)");
  v26[8] = v14;
  v26[9] = callerTeamIdentifier;
  v25[9] = CFSTR("CallerTeamIdentifier");
  v25[10] = CFSTR("LocalizedCallerDisplayName");
  if (localizedCallerDisplayName)
    v17 = (const __CFString *)localizedCallerDisplayName;
  else
    v17 = CFSTR("(null)");
  if (self->_enableUserInteraction)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  v26[10] = v17;
  v26[11] = v18;
  v25[11] = CFSTR("EnableUserInteraction");
  v25[12] = CFSTR("ImpersonationBundleIdentifier");
  impersonationBundleIdentifier = (const __CFString *)self->_impersonationBundleIdentifier;
  pssoAuthenticationMethod = self->_pssoAuthenticationMethod;
  if (!impersonationBundleIdentifier)
    impersonationBundleIdentifier = CFSTR("(null)");
  v26[12] = impersonationBundleIdentifier;
  v25[13] = CFSTR("AuthenticationMethod");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", pssoAuthenticationMethod);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[13] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)requestedOperation
{
  return self->_requestedOperation;
}

- (void)setRequestedOperation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (void)setHttpBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void)setAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_auditTokenData, a3);
}

- (NSString)callerBundleIdentifier
{
  return self->_callerBundleIdentifier;
}

- (void)setCallerBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationOptions, a3);
}

- (BOOL)useInternalExtensions
{
  return self->_useInternalExtensions;
}

- (void)setUseInternalExtensions:(BOOL)a3
{
  self->_useInternalExtensions = a3;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (BOOL)isCFNetworkInterception
{
  return self->_cfNetworkInterception;
}

- (void)setCfNetworkInterception:(BOOL)a3
{
  self->_cfNetworkInterception = a3;
}

- (BOOL)isCallerManaged
{
  return self->_callerManaged;
}

- (void)setCallerManaged:(BOOL)a3
{
  self->_callerManaged = a3;
}

- (NSString)callerTeamIdentifier
{
  return self->_callerTeamIdentifier;
}

- (void)setCallerTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)localizedCallerDisplayName
{
  return self->_localizedCallerDisplayName;
}

- (void)setLocalizedCallerDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_enableUserInteraction;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  self->_enableUserInteraction = a3;
}

- (NSString)impersonationBundleIdentifier
{
  return self->_impersonationBundleIdentifier;
}

- (void)setImpersonationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)pssoAuthenticationMethod
{
  return self->_pssoAuthenticationMethod;
}

- (void)setPssoAuthenticationMethod:(int64_t)a3
{
  self->_pssoAuthenticationMethod = a3;
}

- (BOOL)canShowOnCoverScreen
{
  return self->_showOnCoverScreen;
}

- (void)setShowOnCoverScreen:(BOOL)a3
{
  self->_showOnCoverScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impersonationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_callerTeamIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationOptions, 0);
  objc_storeStrong((id *)&self->_callerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_requestedOperation, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
