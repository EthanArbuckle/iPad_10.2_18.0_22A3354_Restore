@implementation MCGlobalHTTPProxyPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.proxy.http.global"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("GLOBAL_PROXY_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("GLOBAL_PROXY_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCGlobalHTTPProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCGlobalHTTPProxyPayload *v10;
  uint64_t v11;
  id v12;
  NSNumber *proxyPACFallbackAllowedNum;
  uint64_t v14;
  NSNumber *proxyCaptiveLoginAllowedNum;
  void *v16;
  id v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSNumber *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v37;
  void *v38;
  uint64_t v39;
  void *credentialUUID;
  int proxyType;
  uint64_t v42;
  NSString *proxyServer;
  uint64_t v44;
  NSNumber *proxyServerPort;
  uint64_t v46;
  NSString *proxyUsername;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v70.receiver = self;
  v70.super_class = (Class)MCGlobalHTTPProxyPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v70, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_23;
  v69 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyPACFallbackAllowed"), 0, &v69);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v69;
  proxyPACFallbackAllowedNum = v10->_proxyPACFallbackAllowedNum;
  v10->_proxyPACFallbackAllowedNum = (NSNumber *)v11;

  if (v12)
    goto LABEL_14;
  v10->_proxyPACFallbackAllowed = -[NSNumber BOOLValue](v10->_proxyPACFallbackAllowedNum, "BOOLValue");
  v68 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyCaptiveLoginAllowed"), 0, &v68);
  v14 = objc_claimAutoreleasedReturnValue();
  v12 = v68;
  proxyCaptiveLoginAllowedNum = v10->_proxyCaptiveLoginAllowedNum;
  v10->_proxyCaptiveLoginAllowedNum = (NSNumber *)v14;

  if (v12)
    goto LABEL_14;
  v10->_proxyCaptiveLoginAllowed = -[NSNumber BOOLValue](v10->_proxyCaptiveLoginAllowedNum, "BOOLValue");
  if (!objc_msgSend(v9, "isStub"))
  {
    v60 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyType"), 0, &v60);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v60;
    if (v17)
      goto LABEL_12;
    if (v16)
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Manual")) & 1) != 0)
      {
        v37 = 1;
LABEL_33:
        v10->_proxyType = v37;
        goto LABEL_34;
      }
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Auto")) & 1) != 0)
      {
        v37 = 0;
        goto LABEL_33;
      }
      +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("ProxyType"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_12;
    }
LABEL_34:
    proxyType = v10->_proxyType;
    if (proxyType)
    {
      if (proxyType != 1)
        goto LABEL_42;
      v59 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyServer"), 1, &v59);
      v42 = objc_claimAutoreleasedReturnValue();
      v12 = v59;
      proxyServer = v10->_proxyServer;
      v10->_proxyServer = (NSString *)v42;

      if (v12)
        goto LABEL_13;
      v58 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyServerPort"), 0, &v58);
      v44 = objc_claimAutoreleasedReturnValue();
      v12 = v58;
      proxyServerPort = v10->_proxyServerPort;
      v10->_proxyServerPort = (NSNumber *)v44;

      if (v12)
        goto LABEL_13;
      v57 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyUsername"), 0, &v57);
      v46 = objc_claimAutoreleasedReturnValue();
      v12 = v57;
      proxyUsername = v10->_proxyUsername;
      v10->_proxyUsername = (NSString *)v46;

      if (v12)
        goto LABEL_13;
      v56 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPassword"), 0, &v56);
      v48 = objc_claimAutoreleasedReturnValue();
      v12 = v56;
      v49 = 120;
    }
    else
    {
      v55 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPACURL"), 0, &v55);
      v48 = objc_claimAutoreleasedReturnValue();
      v12 = v55;
      v49 = 128;
    }
    v50 = *(Class *)((char *)&v10->super.super.isa + v49);
    *(Class *)((char *)&v10->super.super.isa + v49) = (Class)v48;

    if (v12)
      goto LABEL_13;
LABEL_42:
    if (!v10->_proxyPACURLString)
    {
      v12 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    credentialUUID = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(credentialUUID, "scheme");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "isEqualToString:", CFSTR("http")))
    {

    }
    else
    {
      objc_msgSend(credentialUUID, "scheme");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("https"));

      if ((v53 & 1) == 0)
      {
        +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("ProxyPACURL"));
        v54 = objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v12 = (id)v54;
          goto LABEL_52;
        }
      }
    }
    v12 = 0;
    goto LABEL_52;
  }
  v67 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyType"), 0, &v67);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v67;
  if (v17)
  {
LABEL_12:
    v12 = v17;
    goto LABEL_13;
  }
  -[MCGlobalHTTPProxyPayload setProxyType:](v10, "setProxyType:", objc_msgSend(v16, "intValue"));
  if (-[MCGlobalHTTPProxyPayload proxyType](v10, "proxyType") != 1)
  {
    if (v10->_proxyType)
    {
LABEL_30:
      v61 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("credentialUUID"), 0, &v61);
      v39 = objc_claimAutoreleasedReturnValue();
      v12 = v61;
      credentialUUID = v10->_credentialUUID;
      v10->_credentialUUID = (NSString *)v39;
LABEL_52:

      goto LABEL_13;
    }
    v62 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPACURL"), 0, &v62);
    v24 = objc_claimAutoreleasedReturnValue();
    v12 = v62;
    v25 = 128;
LABEL_29:
    v38 = *(Class *)((char *)&v10->super.super.isa + v25);
    *(Class *)((char *)&v10->super.super.isa + v25) = (Class)v24;

    if (v12)
      goto LABEL_13;
    goto LABEL_30;
  }
  v66 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyServer"), 0, &v66);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v66;
  v19 = v10->_proxyServer;
  v10->_proxyServer = (NSString *)v18;

  if (!v12)
  {
    v65 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("ProxyServerPort"), 0, &v65);
    v20 = objc_claimAutoreleasedReturnValue();
    v12 = v65;
    v21 = v10->_proxyServerPort;
    v10->_proxyServerPort = (NSNumber *)v20;

    if (!v12)
    {
      v64 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyUsername"), 0, &v64);
      v22 = objc_claimAutoreleasedReturnValue();
      v12 = v64;
      v23 = v10->_proxyUsername;
      v10->_proxyUsername = (NSString *)v22;

      if (!v12)
      {
        v63 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ProxyPassword"), 0, &v63);
        v24 = objc_claimAutoreleasedReturnValue();
        v12 = v63;
        v25 = 120;
        goto LABEL_29;
      }
    }
  }
LABEL_13:

  if (v12)
  {
LABEL_14:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a5)
      *a5 = objc_retainAutorelease(v26);
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = (void *)objc_opt_class();
      v31 = v30;
      objc_msgSend(v27, "MCVerboseDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v30;
      v73 = 2114;
      v74 = v32;
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      -[MCPayload friendlyName](v10, "friendlyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v35;
      v73 = 2114;
      v74 = v8;
      _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_23:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MCGlobalHTTPProxyPayload;
  -[MCPayload stubDictionary](&v16, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MCGlobalHTTPProxyPayload proxyType](self, "proxyType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ProxyType"));

  -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ProxyServer"));

  }
  -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ProxyServerPort"));

  }
  -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ProxyPACURL"));

  }
  -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("credentialUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCGlobalHTTPProxyPayload proxyPACFallbackAllowed](self, "proxyPACFallbackAllowed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ProxyPACFallbackAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCGlobalHTTPProxyPayload proxyCaptiveLoginAllowed](self, "proxyCaptiveLoginAllowed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ProxyCaptiveLoginAllowed"));

  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;

  -[MCGlobalHTTPProxyPayload subtitle1Description](self, "subtitle1Description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    MCLocalizedFormat(CFSTR("GLOBAL_PROXY_SERVER_COLON"), v2, v3, v4, v5, v6, v7, v8, v12);
  else
    MCLocalizedString(CFSTR("GLOBAL_PROXY_SERVER_MISSING"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)subtitle1Description
{
  if (-[MCGlobalHTTPProxyPayload proxyType](self, "proxyType") == 1)
    -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
  else
    -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)subtitle2Label
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    MCLocalizedFormat(CFSTR("GLOBAL_PROXY_SERVER_PORT_COLON"), v3, v4, v5, v6, v7, v8, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)subtitle2Description
{
  void *v3;
  void *v4;
  void *v5;

  -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCFormattedStringForNumber(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  void *v7;
  MCKeyValue *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MCKeyValue *v13;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  void *v20;
  MCKeyValue *v21;
  void *v22;
  void *v23;
  MCKeyValue *v24;
  void *v25;
  MCKeyValue *v26;
  void *v27;
  void *v28;
  MCKeyValue *v29;
  void *v30;
  void *v31;
  void *v32;
  MCKeyValue *v33;
  MCKeyValue *v34;
  void *v35;
  MCKeyValue *v36;
  MCKeyValue *v37;
  void *v38;
  void *v39;
  MCKeyValue *v40;
  void *v41;
  MCKeyValue *v42;
  void *v43;
  void *v44;
  MCKeyValue *v45;
  void *v46;
  MCKeyValue *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  MCKeyValue *v52;
  void *v53;
  void *v54;
  void *v55;
  MCKeyValue *v56;
  void *v57;
  void *v58;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [MCKeyValue alloc];
    -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("SERVER"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", v6, v7);

    objc_msgSend(v3, "addObject:", v8);
  }
  -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v11, "intValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PORT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v13, "initWithLocalizedString:localizedKey:", v12, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (-[MCGlobalHTTPProxyPayload proxyType](self, "proxyType"))
  {
    if (-[MCGlobalHTTPProxyPayload proxyType](self, "proxyType") == 1)
    {
      v16 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("TYPE_MANUAL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("TYPE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);
      objc_msgSend(v3, "addObject:", v19);

      -[MCGlobalHTTPProxyPayload proxyUsername](self, "proxyUsername");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = [MCKeyValue alloc];
        -[MCGlobalHTTPProxyPayload proxyUsername](self, "proxyUsername");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        MCLocalizedString(CFSTR("USERNAME"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCKeyValue initWithLocalizedString:localizedKey:](v21, "initWithLocalizedString:localizedKey:", v22, v23);

        objc_msgSend(v3, "addObject:", v24);
      }
      -[MCGlobalHTTPProxyPayload proxyPassword](self, "proxyPassword");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = [MCKeyValue alloc];
        MCLocalizedString(CFSTR("PRESENT"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        MCLocalizedString(CFSTR("PASSWORD"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[MCKeyValue initWithLocalizedString:localizedKey:](v26, "initWithLocalizedString:localizedKey:", v27, v28);

        objc_msgSend(v3, "addObject:", v29);
      }
      -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[MCPayload profile](self, "profile");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "subjectSummaryFromCertificatePayloadWithUUID:", v32);
        v33 = (MCKeyValue *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v34 = [MCKeyValue alloc];
          MCLocalizedString(CFSTR("CREDENTIAL"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[MCKeyValue initWithLocalizedString:localizedKey:](v34, "initWithLocalizedString:localizedKey:", v33, v35);

          objc_msgSend(v3, "addObject:", v36);
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    v37 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("TYPE_AUTOMATIC"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("TYPE"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[MCKeyValue initWithLocalizedString:localizedKey:](v37, "initWithLocalizedString:localizedKey:", v38, v39);
    objc_msgSend(v3, "addObject:", v40);

    -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = [MCKeyValue alloc];
      -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("PAC"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[MCKeyValue initWithLocalizedString:localizedKey:](v42, "initWithLocalizedString:localizedKey:", v43, v44);

      objc_msgSend(v3, "addObject:", v45);
    }
    -[MCGlobalHTTPProxyPayload proxyPACFallbackAllowedNum](self, "proxyPACFallbackAllowedNum");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [MCKeyValue alloc];
      -[MCGlobalHTTPProxyPayload proxyPACFallbackAllowedNum](self, "proxyPACFallbackAllowedNum");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedStringForBool(objc_msgSend(v48, "BOOLValue"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      MCLocalizedString(CFSTR("FALLBACK"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[MCKeyValue initWithLocalizedString:localizedKey:](v47, "initWithLocalizedString:localizedKey:", v49, v50);

      objc_msgSend(v3, "addObject:", v33);
LABEL_18:

    }
  }
  -[MCGlobalHTTPProxyPayload proxyCaptiveLoginAllowedNum](self, "proxyCaptiveLoginAllowedNum");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v52 = [MCKeyValue alloc];
    -[MCGlobalHTTPProxyPayload proxyCaptiveLoginAllowedNum](self, "proxyCaptiveLoginAllowedNum");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedStringForBool(objc_msgSend(v53, "BOOLValue"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("CAPTIVE_LOGIN_ALLOWED"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[MCKeyValue initWithLocalizedString:localizedKey:](v52, "initWithLocalizedString:localizedKey:", v54, v55);
    objc_msgSend(v3, "addObject:", v56);

  }
  +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  return v58;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MCGlobalHTTPProxyPayload;
  -[MCPayload verboseDescription](&v16, sel_verboseDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCGlobalHTTPProxyPayload proxyServer](self, "proxyServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Server      : %@\n"), v5);

  -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCGlobalHTTPProxyPayload proxyServerPort](self, "proxyServerPort");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Port        : %@\n"), v7);

  }
  if (!-[MCGlobalHTTPProxyPayload proxyType](self, "proxyType"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("Type        : Auto\n"));
    -[MCGlobalHTTPProxyPayload proxyPACURLString](self, "proxyPACURLString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("PAC         : %@\n"), v13);

    MCStringForBool(-[MCGlobalHTTPProxyPayload proxyPACFallbackAllowed](self, "proxyPACFallbackAllowed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" fallback   : %@\n"), v12);
    goto LABEL_12;
  }
  if (-[MCGlobalHTTPProxyPayload proxyType](self, "proxyType") == 1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("Type        : Manual\n"));
    -[MCGlobalHTTPProxyPayload proxyUsername](self, "proxyUsername");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MCGlobalHTTPProxyPayload proxyUsername](self, "proxyUsername");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("User        : %@\n"), v9);

    }
    -[MCGlobalHTTPProxyPayload proxyPassword](self, "proxyPassword");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v4, "appendFormat:", CFSTR("Pass        : (present)\n"));
    -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MCGlobalHTTPProxyPayload credentialUUID](self, "credentialUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("Cred UUID   : %@\n"), v12);
LABEL_12:

    }
  }
  MCStringForBool(-[MCGlobalHTTPProxyPayload proxyCaptiveLoginAllowed](self, "proxyCaptiveLoginAllowed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Captive OK  : %@\n"), v14);

  return v4;
}

- (id)installationWarnings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  MCLocalizedString(CFSTR("INSTALL_WARNING_HTTP_PROXY_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedStringByDevice(CFSTR("INSTALL_WARNING_HTTP_PROXY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v2, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(int)a3
{
  self->_proxyType = a3;
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServer, a3);
}

- (NSNumber)proxyServerPort
{
  return self->_proxyServerPort;
}

- (void)setProxyServerPort:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServerPort, a3);
}

- (NSString)proxyUsername
{
  return self->_proxyUsername;
}

- (void)setProxyUsername:(id)a3
{
  objc_storeStrong((id *)&self->_proxyUsername, a3);
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (void)setProxyPassword:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPassword, a3);
}

- (NSString)proxyPACURLString
{
  return self->_proxyPACURLString;
}

- (void)setProxyPACURLString:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPACURLString, a3);
}

- (NSString)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
  objc_storeStrong((id *)&self->_credentialUUID, a3);
}

- (BOOL)proxyPACFallbackAllowed
{
  return self->_proxyPACFallbackAllowed;
}

- (void)setProxyPACFallbackAllowed:(BOOL)a3
{
  self->_proxyPACFallbackAllowed = a3;
}

- (BOOL)proxyCaptiveLoginAllowed
{
  return self->_proxyCaptiveLoginAllowed;
}

- (void)setProxyCaptiveLoginAllowed:(BOOL)a3
{
  self->_proxyCaptiveLoginAllowed = a3;
}

- (NSNumber)proxyPACFallbackAllowedNum
{
  return self->_proxyPACFallbackAllowedNum;
}

- (void)setProxyPACFallbackAllowedNum:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, a3);
}

- (NSNumber)proxyCaptiveLoginAllowedNum
{
  return self->_proxyCaptiveLoginAllowedNum;
}

- (void)setProxyCaptiveLoginAllowedNum:(id)a3
{
  objc_storeStrong((id *)&self->_proxyCaptiveLoginAllowedNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyCaptiveLoginAllowedNum, 0);
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_proxyPACURLString, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyServerPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
}

@end
