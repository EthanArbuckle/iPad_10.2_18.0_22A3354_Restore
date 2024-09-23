@implementation PrivacyProxyInfo

- (id)description
{
  PrivacyProxyInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id obj;
  PrivacyProxyInfo *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  v2 = self;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[PrivacyProxyInfo ingressProxyURL](v2, "ingressProxyURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v4, CFSTR("Ingress proxy URL"), 0, 14);

  -[PrivacyProxyInfo egressProxyURL](v2, "egressProxyURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v5, CFSTR("Egress proxy URL"), 0, 14);

  -[PrivacyProxyInfo ingressFallbackProxyURL](v2, "ingressFallbackProxyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v6, CFSTR("Ingress fallback proxy URL"), 0, 14);

  -[PrivacyProxyInfo egressFallbackProxyURL](v2, "egressFallbackProxyURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v7, CFSTR("Egress fallback proxy URL"), 0, 14);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[PrivacyProxyInfo tokenCounts](v2, "tokenCounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v36 = v2;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11);
        -[PrivacyProxyInfo tokenCounts](v2, "tokenCounts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "cachedTokens");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cached token count"), v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v15, (uint64_t)v16, 0, 14);

        v17 = objc_msgSend(v14, "agentTokens");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ agent token count"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v17, (uint64_t)v18, 0, 14);

        v19 = objc_msgSend(v14, "cacheLowWaterMark");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cache low water mark"), v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v19, (uint64_t)v20, 0, 14);

        v21 = objc_msgSend(v14, "agentLowWaterMark");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ agent low water mark"), v12);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v21, (uint64_t)v22, 0, 14);

        v2 = v36;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v9);
  }

  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo requestedTokenCount](v2, "requestedTokenCount"), (uint64_t)CFSTR("Requested token count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo unactivatedTokenCount](v2, "unactivatedTokenCount"), (uint64_t)CFSTR("Unactivated token count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo activatedTokenCount](v2, "activatedTokenCount"), (uint64_t)CFSTR("Activated token count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo deviceIdentityValidationCount](v2, "deviceIdentityValidationCount"), (uint64_t)CFSTR("Device identity validated count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo anisetteValidationCount](v2, "anisetteValidationCount"), (uint64_t)CFSTR("Anisette validated count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyTokenFetchSuccessCount](v2, "proxyTokenFetchSuccessCount"), (uint64_t)CFSTR("Proxy token fetch success count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyTokenFetchFailedCount](v2, "proxyTokenFetchFailedCount"), (uint64_t)CFSTR("Proxy token fetch failed count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyTokenConsumedCount](v2, "proxyTokenConsumedCount"), (uint64_t)CFSTR("Proxy token consumed count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyTokenExpiredCount](v2, "proxyTokenExpiredCount"), (uint64_t)CFSTR("Proxy token expired count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](v2, "proxyAgentLowWaterMarkHitCount"), (uint64_t)CFSTR("Proxy agent low water mark hit count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](v2, "proxyCacheLowWaterMarkHitCount"), (uint64_t)CFSTR("Proxy cache low water mark hit count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo badTokenCount](v2, "badTokenCount"), (uint64_t)CFSTR("Bad tokens count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo missingTokenCount](v2, "missingTokenCount"), (uint64_t)CFSTR("Missing tokens count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo networkProxiesRotated](v2, "networkProxiesRotated"), (uint64_t)CFSTR("Network proxies rotated"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo networkFallbackProxiesRotated](v2, "networkFallbackProxiesRotated"), (uint64_t)CFSTR("Network fallback proxies rotated"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo proxiesRotated](v2, "proxiesRotated"), (uint64_t)CFSTR("Proxies rotated"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo configFetchedSuccessCount](v2, "configFetchedSuccessCount"), (uint64_t)CFSTR("Configuration fetch success count"), 0, 14);
  -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, -[PrivacyProxyInfo configFetchedFailedCount](v2, "configFetchedFailedCount"), (uint64_t)CFSTR("Configuration fetch failed count"), 0, 14);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PrivacyProxyInfo resumableSessionCounts](v2, "resumableSessionCounts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v38;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v27);
        -[PrivacyProxyInfo resumableSessionCounts](v36, "resumableSessionCounts");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "unsignedIntValue");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ resumable session count"), v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v31, (uint64_t)v32, 0, 14);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  -[PrivacyProxyInfo enabledProxiedContentMaps](v36, "enabledProxiedContentMaps");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v33, CFSTR("Enabled proxied content maps"), 0, 14);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyInfo *v5;
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

  v5 = -[PrivacyProxyInfo init](+[PrivacyProxyInfo allocWithZone:](PrivacyProxyInfo, "allocWithZone:"), "init");
  -[PrivacyProxyInfo ingressProxyURL](self, "ingressProxyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyInfo setIngressProxyURL:](v5, "setIngressProxyURL:", v6);

  -[PrivacyProxyInfo egressProxyURL](self, "egressProxyURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyInfo setEgressProxyURL:](v5, "setEgressProxyURL:", v7);

  -[PrivacyProxyInfo ingressFallbackProxyURL](self, "ingressFallbackProxyURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyInfo setIngressFallbackProxyURL:](v5, "setIngressFallbackProxyURL:", v8);

  -[PrivacyProxyInfo egressFallbackProxyURL](self, "egressFallbackProxyURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyInfo setEgressFallbackProxyURL:](v5, "setEgressFallbackProxyURL:", v9);

  -[PrivacyProxyInfo tokenCounts](self, "tokenCounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[PrivacyProxyInfo setTokenCounts:](v5, "setTokenCounts:", v11);

  -[PrivacyProxyInfo resumableSessionCounts](self, "resumableSessionCounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[PrivacyProxyInfo setResumableSessionCounts:](v5, "setResumableSessionCounts:", v13);

  -[PrivacyProxyInfo enabledProxiedContentMaps](self, "enabledProxiedContentMaps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  -[PrivacyProxyInfo setEnabledProxiedContentMaps:](v5, "setEnabledProxiedContentMaps:", v15);

  -[PrivacyProxyInfo setDeviceIdentityValidationCount:](v5, "setDeviceIdentityValidationCount:", -[PrivacyProxyInfo deviceIdentityValidationCount](self, "deviceIdentityValidationCount"));
  -[PrivacyProxyInfo setAnisetteValidationCount:](v5, "setAnisetteValidationCount:", -[PrivacyProxyInfo anisetteValidationCount](self, "anisetteValidationCount"));
  -[PrivacyProxyInfo setRequestedTokenCount:](v5, "setRequestedTokenCount:", -[PrivacyProxyInfo requestedTokenCount](self, "requestedTokenCount"));
  -[PrivacyProxyInfo setUnactivatedTokenCount:](v5, "setUnactivatedTokenCount:", -[PrivacyProxyInfo unactivatedTokenCount](self, "unactivatedTokenCount"));
  -[PrivacyProxyInfo setActivatedTokenCount:](v5, "setActivatedTokenCount:", -[PrivacyProxyInfo activatedTokenCount](self, "activatedTokenCount"));
  -[PrivacyProxyInfo setProxyTokenFetchSuccessCount:](v5, "setProxyTokenFetchSuccessCount:", -[PrivacyProxyInfo proxyTokenFetchSuccessCount](self, "proxyTokenFetchSuccessCount"));
  -[PrivacyProxyInfo setProxyTokenFetchFailedCount:](v5, "setProxyTokenFetchFailedCount:", -[PrivacyProxyInfo proxyTokenFetchFailedCount](self, "proxyTokenFetchFailedCount"));
  -[PrivacyProxyInfo setProxyTokenConsumedCount:](v5, "setProxyTokenConsumedCount:", -[PrivacyProxyInfo proxyTokenConsumedCount](self, "proxyTokenConsumedCount"));
  -[PrivacyProxyInfo setProxyTokenExpiredCount:](v5, "setProxyTokenExpiredCount:", -[PrivacyProxyInfo proxyTokenExpiredCount](self, "proxyTokenExpiredCount"));
  -[PrivacyProxyInfo setProxyAgentLowWaterMarkHitCount:](v5, "setProxyAgentLowWaterMarkHitCount:", -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](self, "proxyAgentLowWaterMarkHitCount"));
  -[PrivacyProxyInfo setProxyCacheLowWaterMarkHitCount:](v5, "setProxyCacheLowWaterMarkHitCount:", -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](self, "proxyCacheLowWaterMarkHitCount"));
  -[PrivacyProxyInfo setBadTokenCount:](v5, "setBadTokenCount:", -[PrivacyProxyInfo badTokenCount](self, "badTokenCount"));
  -[PrivacyProxyInfo setMissingTokenCount:](v5, "setMissingTokenCount:", -[PrivacyProxyInfo missingTokenCount](self, "missingTokenCount"));
  -[PrivacyProxyInfo setNetworkProxiesRotated:](v5, "setNetworkProxiesRotated:", -[PrivacyProxyInfo networkProxiesRotated](self, "networkProxiesRotated"));
  -[PrivacyProxyInfo setNetworkFallbackProxiesRotated:](v5, "setNetworkFallbackProxiesRotated:", -[PrivacyProxyInfo networkFallbackProxiesRotated](self, "networkFallbackProxiesRotated"));
  -[PrivacyProxyInfo setProxiesRotated:](v5, "setProxiesRotated:", -[PrivacyProxyInfo proxiesRotated](self, "proxiesRotated"));
  -[PrivacyProxyInfo setConfigFetchedSuccessCount:](v5, "setConfigFetchedSuccessCount:", -[PrivacyProxyInfo configFetchedSuccessCount](self, "configFetchedSuccessCount"));
  -[PrivacyProxyInfo setConfigFetchedFailedCount:](v5, "setConfigFetchedFailedCount:", -[PrivacyProxyInfo configFetchedFailedCount](self, "configFetchedFailedCount"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyInfo)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyInfo *v5;
  uint64_t v6;
  NSString *ingressProxyURL;
  uint64_t v8;
  NSString *egressProxyURL;
  uint64_t v10;
  NSString *ingressFallbackProxyURL;
  uint64_t v12;
  NSString *egressFallbackProxyURL;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *tokenCounts;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *resumableSessionCounts;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *enabledProxiedContentMaps;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PrivacyProxyInfo;
  v5 = -[PrivacyProxyInfo init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyInfoIngressProxyURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    ingressProxyURL = v5->_ingressProxyURL;
    v5->_ingressProxyURL = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyInfoEgressProxyURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    egressProxyURL = v5->_egressProxyURL;
    v5->_egressProxyURL = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyInfoIngressFallbackProxyURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    ingressFallbackProxyURL = v5->_ingressFallbackProxyURL;
    v5->_ingressFallbackProxyURL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyInfoEgressFallbackProxyURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    egressFallbackProxyURL = v5->_egressFallbackProxyURL;
    v5->_egressFallbackProxyURL = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("PrivacyProxyInfoTokenCounts"));
    v18 = objc_claimAutoreleasedReturnValue();
    tokenCounts = v5->_tokenCounts;
    v5->_tokenCounts = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("PrivacyProxyInfoResumableSessionCounts"));
    v24 = objc_claimAutoreleasedReturnValue();
    resumableSessionCounts = v5->_resumableSessionCounts;
    v5->_resumableSessionCounts = (NSDictionary *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("PrivacyProxyInfoEnabledProxiedContentMaps"));
    v29 = objc_claimAutoreleasedReturnValue();
    enabledProxiedContentMaps = v5->_enabledProxiedContentMaps;
    v5->_enabledProxiedContentMaps = (NSArray *)v29;

    v5->_deviceIdentityValidationCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoDeviceValidationCount"));
    v5->_anisetteValidationCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoAnisetteValidationCount"));
    v5->_requestedTokenCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoRequestedTokenCount"));
    v5->_unactivatedTokenCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoUnactivatedTokenCount"));
    v5->_activatedTokenCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoActivatedTokenCount"));
    v5->_proxyTokenFetchSuccessCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyTokenFetchSuccessCount"));
    v5->_proxyTokenFetchFailedCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyTokenFetchFailedCount"));
    v5->_proxyTokenConsumedCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyTokenConsumedCount"));
    v5->_proxyTokenExpiredCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyTokenExpiredCount"));
    v5->_proxyAgentLowWaterMarkHitCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyAgentLowWaterMarkHitCount"));
    v5->_proxyCacheLowWaterMarkHitCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxyCacheLowWaterMarkHitCount"));
    v5->_badTokenCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoBadTokensCount"));
    v5->_missingTokenCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoMissingTokensCount"));
    v5->_networkProxiesRotated = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoNetworkProxiesRotated"));
    v5->_networkFallbackProxiesRotated = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoNetworkFallbackProxiesRotated"));
    v5->_proxiesRotated = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoProxiesRotated"));
    v5->_configFetchedSuccessCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoConfigFetchSuccessCount"));
    v5->_configFetchedFailedCount = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyInfoConfigFetchFailedCount"));
  }

  return v5;
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
  -[PrivacyProxyInfo ingressProxyURL](self, "ingressProxyURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("PrivacyProxyInfoIngressProxyURL"));

  -[PrivacyProxyInfo egressProxyURL](self, "egressProxyURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("PrivacyProxyInfoEgressProxyURL"));

  -[PrivacyProxyInfo ingressFallbackProxyURL](self, "ingressFallbackProxyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("PrivacyProxyInfoIngressFallbackProxyURL"));

  -[PrivacyProxyInfo egressFallbackProxyURL](self, "egressFallbackProxyURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("PrivacyProxyInfoEgressFallbackProxyURL"));

  -[PrivacyProxyInfo tokenCounts](self, "tokenCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("PrivacyProxyInfoTokenCounts"));

  -[PrivacyProxyInfo resumableSessionCounts](self, "resumableSessionCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("PrivacyProxyInfoResumableSessionCounts"));

  -[PrivacyProxyInfo enabledProxiedContentMaps](self, "enabledProxiedContentMaps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("PrivacyProxyInfoEnabledProxiedContentMaps"));

  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo deviceIdentityValidationCount](self, "deviceIdentityValidationCount"), CFSTR("PrivacyProxyInfoDeviceValidationCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo anisetteValidationCount](self, "anisetteValidationCount"), CFSTR("PrivacyProxyInfoAnisetteValidationCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo requestedTokenCount](self, "requestedTokenCount"), CFSTR("PrivacyProxyInfoRequestedTokenCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo unactivatedTokenCount](self, "unactivatedTokenCount"), CFSTR("PrivacyProxyInfoUnactivatedTokenCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo activatedTokenCount](self, "activatedTokenCount"), CFSTR("PrivacyProxyInfoActivatedTokenCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenFetchSuccessCount](self, "proxyTokenFetchSuccessCount"), CFSTR("PrivacyProxyInfoProxyTokenFetchSuccessCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenFetchFailedCount](self, "proxyTokenFetchFailedCount"), CFSTR("PrivacyProxyInfoProxyTokenFetchFailedCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenConsumedCount](self, "proxyTokenConsumedCount"), CFSTR("PrivacyProxyInfoProxyTokenConsumedCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenExpiredCount](self, "proxyTokenExpiredCount"), CFSTR("PrivacyProxyInfoProxyTokenExpiredCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](self, "proxyAgentLowWaterMarkHitCount"), CFSTR("PrivacyProxyInfoProxyAgentLowWaterMarkHitCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](self, "proxyCacheLowWaterMarkHitCount"), CFSTR("PrivacyProxyInfoProxyCacheLowWaterMarkHitCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo badTokenCount](self, "badTokenCount"), CFSTR("PrivacyProxyInfoBadTokensCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo missingTokenCount](self, "missingTokenCount"), CFSTR("PrivacyProxyInfoMissingTokensCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo networkProxiesRotated](self, "networkProxiesRotated"), CFSTR("PrivacyProxyInfoNetworkProxiesRotated"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo networkFallbackProxiesRotated](self, "networkFallbackProxiesRotated"), CFSTR("PrivacyProxyInfoNetworkFallbackProxiesRotated"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxiesRotated](self, "proxiesRotated"), CFSTR("PrivacyProxyInfoProxiesRotated"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo configFetchedSuccessCount](self, "configFetchedSuccessCount"), CFSTR("PrivacyProxyInfoConfigFetchSuccessCount"));
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo configFetchedFailedCount](self, "configFetchedFailedCount"), CFSTR("PrivacyProxyInfoConfigFetchFailedCount"));

}

- (id)diagnostics
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo configFetchedFailedCount](self, "configFetchedFailedCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PrivacyProxyInfoConfigFetchFailedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo configFetchedSuccessCount](self, "configFetchedSuccessCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PrivacyProxyInfoConfigFetchSuccessCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxiesRotated](self, "proxiesRotated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("PrivacyProxyInfoProxiesRotated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo networkFallbackProxiesRotated](self, "networkFallbackProxiesRotated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PrivacyProxyInfoNetworkFallbackProxiesRotated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo networkProxiesRotated](self, "networkProxiesRotated"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("PrivacyProxyInfoNetworkProxiesRotated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo missingTokenCount](self, "missingTokenCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("PrivacyProxyInfoMissingTokensCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo badTokenCount](self, "badTokenCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PrivacyProxyInfoBadTokensCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](self, "proxyCacheLowWaterMarkHitCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("PrivacyProxyInfoProxyCacheLowWaterMarkHitCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](self, "proxyAgentLowWaterMarkHitCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("PrivacyProxyInfoProxyAgentLowWaterMarkHitCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenExpiredCount](self, "proxyTokenExpiredCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("PrivacyProxyInfoProxyTokenExpiredCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenConsumedCount](self, "proxyTokenConsumedCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PrivacyProxyInfoProxyTokenConsumedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenFetchFailedCount](self, "proxyTokenFetchFailedCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PrivacyProxyInfoProxyTokenFetchFailedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenFetchSuccessCount](self, "proxyTokenFetchSuccessCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("PrivacyProxyInfoProxyTokenFetchSuccessCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo activatedTokenCount](self, "activatedTokenCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("PrivacyProxyInfoActivatedTokenCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo unactivatedTokenCount](self, "unactivatedTokenCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("PrivacyProxyInfoUnactivatedTokenCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo requestedTokenCount](self, "requestedTokenCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("PrivacyProxyInfoRequestedTokenCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo anisetteValidationCount](self, "anisetteValidationCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("PrivacyProxyInfoAnisetteValidationCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PrivacyProxyInfo deviceIdentityValidationCount](self, "deviceIdentityValidationCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("PrivacyProxyInfoDeviceValidationCount"));

  -[PrivacyProxyInfo egressProxyURL](self, "egressProxyURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("PrivacyProxyInfoEgressProxyURL"));

  -[PrivacyProxyInfo ingressProxyURL](self, "ingressProxyURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("PrivacyProxyInfoIngressProxyURL"));

  -[PrivacyProxyInfo egressFallbackProxyURL](self, "egressFallbackProxyURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("PrivacyProxyInfoEgressFallbackProxyURL"));

  -[PrivacyProxyInfo ingressFallbackProxyURL](self, "ingressFallbackProxyURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("PrivacyProxyInfoIngressFallbackProxyURL"));

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[PrivacyProxyInfo tokenCounts](self, "tokenCounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v26)
  {
    v27 = v26;
    v42 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v44 != v42)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[PrivacyProxyInfo tokenCounts](self, "tokenCounts");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "cachedTokens"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PrivacyProxyInfoCachedTokenCount"), v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, v33);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "agentTokens"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PrivacyProxyInfoAgentTokenCount"), v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, v35);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "cacheLowWaterMark"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PrivacyProxyInfoCacheLowWaterMark"), v29);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, v37);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "agentLowWaterMark"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("PrivacyProxyInfoAgentLowWaterMark"), v29);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, v39);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v27);
  }

  return v3;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[PrivacyProxyInfo encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PrivacyProxyInfo)initWithData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  PrivacyProxyInfo *v11;
  PrivacyProxyInfo *v12;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v15 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v15);

  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PrivacyProxyInfo;
    v12 = -[PrivacyProxyInfo init](&v14, sel_init);
    if (v12)
      v12 = -[PrivacyProxyInfo initWithCoder:](v12, "initWithCoder:", v6);
    self = v12;
    v11 = self;
  }
  else
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the proxy info %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (NSString)egressProxyURL
{
  return self->_egressProxyURL;
}

- (void)setEgressProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_egressProxyURL, a3);
}

- (NSString)ingressProxyURL
{
  return self->_ingressProxyURL;
}

- (void)setIngressProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_ingressProxyURL, a3);
}

- (NSString)egressFallbackProxyURL
{
  return self->_egressFallbackProxyURL;
}

- (void)setEgressFallbackProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_egressFallbackProxyURL, a3);
}

- (NSString)ingressFallbackProxyURL
{
  return self->_ingressFallbackProxyURL;
}

- (void)setIngressFallbackProxyURL:(id)a3
{
  objc_storeStrong((id *)&self->_ingressFallbackProxyURL, a3);
}

- (NSDictionary)tokenCounts
{
  return self->_tokenCounts;
}

- (void)setTokenCounts:(id)a3
{
  objc_storeStrong((id *)&self->_tokenCounts, a3);
}

- (NSDictionary)resumableSessionCounts
{
  return self->_resumableSessionCounts;
}

- (void)setResumableSessionCounts:(id)a3
{
  objc_storeStrong((id *)&self->_resumableSessionCounts, a3);
}

- (NSArray)enabledProxiedContentMaps
{
  return self->_enabledProxiedContentMaps;
}

- (void)setEnabledProxiedContentMaps:(id)a3
{
  objc_storeStrong((id *)&self->_enabledProxiedContentMaps, a3);
}

- (unint64_t)deviceIdentityValidationCount
{
  return self->_deviceIdentityValidationCount;
}

- (void)setDeviceIdentityValidationCount:(unint64_t)a3
{
  self->_deviceIdentityValidationCount = a3;
}

- (unint64_t)anisetteValidationCount
{
  return self->_anisetteValidationCount;
}

- (void)setAnisetteValidationCount:(unint64_t)a3
{
  self->_anisetteValidationCount = a3;
}

- (unint64_t)unactivatedTokenCount
{
  return self->_unactivatedTokenCount;
}

- (void)setUnactivatedTokenCount:(unint64_t)a3
{
  self->_unactivatedTokenCount = a3;
}

- (unint64_t)activatedTokenCount
{
  return self->_activatedTokenCount;
}

- (void)setActivatedTokenCount:(unint64_t)a3
{
  self->_activatedTokenCount = a3;
}

- (unint64_t)requestedTokenCount
{
  return self->_requestedTokenCount;
}

- (void)setRequestedTokenCount:(unint64_t)a3
{
  self->_requestedTokenCount = a3;
}

- (unint64_t)proxyTokenFetchSuccessCount
{
  return self->_proxyTokenFetchSuccessCount;
}

- (void)setProxyTokenFetchSuccessCount:(unint64_t)a3
{
  self->_proxyTokenFetchSuccessCount = a3;
}

- (unint64_t)proxyTokenFetchFailedCount
{
  return self->_proxyTokenFetchFailedCount;
}

- (void)setProxyTokenFetchFailedCount:(unint64_t)a3
{
  self->_proxyTokenFetchFailedCount = a3;
}

- (unint64_t)proxyTokenConsumedCount
{
  return self->_proxyTokenConsumedCount;
}

- (void)setProxyTokenConsumedCount:(unint64_t)a3
{
  self->_proxyTokenConsumedCount = a3;
}

- (unint64_t)proxyTokenExpiredCount
{
  return self->_proxyTokenExpiredCount;
}

- (void)setProxyTokenExpiredCount:(unint64_t)a3
{
  self->_proxyTokenExpiredCount = a3;
}

- (unint64_t)proxyAgentLowWaterMarkHitCount
{
  return self->_proxyAgentLowWaterMarkHitCount;
}

- (void)setProxyAgentLowWaterMarkHitCount:(unint64_t)a3
{
  self->_proxyAgentLowWaterMarkHitCount = a3;
}

- (unint64_t)proxyCacheLowWaterMarkHitCount
{
  return self->_proxyCacheLowWaterMarkHitCount;
}

- (void)setProxyCacheLowWaterMarkHitCount:(unint64_t)a3
{
  self->_proxyCacheLowWaterMarkHitCount = a3;
}

- (unint64_t)badTokenCount
{
  return self->_badTokenCount;
}

- (void)setBadTokenCount:(unint64_t)a3
{
  self->_badTokenCount = a3;
}

- (unint64_t)missingTokenCount
{
  return self->_missingTokenCount;
}

- (void)setMissingTokenCount:(unint64_t)a3
{
  self->_missingTokenCount = a3;
}

- (unint64_t)networkProxiesRotated
{
  return self->_networkProxiesRotated;
}

- (void)setNetworkProxiesRotated:(unint64_t)a3
{
  self->_networkProxiesRotated = a3;
}

- (unint64_t)networkFallbackProxiesRotated
{
  return self->_networkFallbackProxiesRotated;
}

- (void)setNetworkFallbackProxiesRotated:(unint64_t)a3
{
  self->_networkFallbackProxiesRotated = a3;
}

- (unint64_t)proxiesRotated
{
  return self->_proxiesRotated;
}

- (void)setProxiesRotated:(unint64_t)a3
{
  self->_proxiesRotated = a3;
}

- (unint64_t)configFetchedSuccessCount
{
  return self->_configFetchedSuccessCount;
}

- (void)setConfigFetchedSuccessCount:(unint64_t)a3
{
  self->_configFetchedSuccessCount = a3;
}

- (unint64_t)configFetchedFailedCount
{
  return self->_configFetchedFailedCount;
}

- (void)setConfigFetchedFailedCount:(unint64_t)a3
{
  self->_configFetchedFailedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledProxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_resumableSessionCounts, 0);
  objc_storeStrong((id *)&self->_tokenCounts, 0);
  objc_storeStrong((id *)&self->_ingressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_egressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_ingressProxyURL, 0);
  objc_storeStrong((id *)&self->_egressProxyURL, 0);
}

@end
