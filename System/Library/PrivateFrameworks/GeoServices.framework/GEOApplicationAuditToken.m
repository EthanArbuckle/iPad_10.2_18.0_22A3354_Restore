@implementation GEOApplicationAuditToken

+ (id)compositeTokenForTokens:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOApplicationAuditToken *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    {
      objc_msgSend(v3, "anyObject");
      v12 = (GEOApplicationAuditToken *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "bundleId", (_QWORD)v14);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "length"))
              objc_msgSend(v4, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOApplicationAuditToken initWithProxiedApplicationBundleId:]([GEOApplicationAuditToken alloc], "initWithProxiedApplicationBundleId:", v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)offlineCohortId
{
  NSString *overrideOfflineCohortId;
  NSString *v3;
  void *v5;
  NSString *v6;

  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId)
  {
    v3 = overrideOfflineCohortId;
  }
  else
  {
    -[GEOApplicationAuditToken valueForEntitlement:](self, "valueForEntitlement:", CFSTR("com.apple.geoservices.offline.cohort-id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "length"))
    {
      v6 = v5;
    }
    else
    {
      -[GEOApplicationAuditToken bundleId](self, "bundleId");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v6;

  }
  return v3;
}

- (id)bundleId
{
  void *v4;
  geo_isolater *v5;

  if (-[NSString length](self->_proxiedBundleId, "length"))
    return self->_proxiedBundleId;
  v5 = self->_isolater;
  _geo_isolate_lock_data();
  -[GEOApplicationAuditToken _bundleIdForAuditToken](self, "_bundleIdForAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return v4;
}

- (id)_bundleIdForAuditToken
{
  id *p_resolvedBundleId;
  SecTaskRef v4;
  __SecTask *v5;
  NSString *resolvedNetworkAttributionBundleId;
  NSString *v7;
  NSString *v8;
  CFStringRef v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  int pid[4];
  audit_token_t token;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  geo_assert_isolated();
  p_resolvedBundleId = (id *)&self->_resolvedBundleId;
  if (!self->_resolvedBundleId && -[NSData length](self->_tokenData, "length") == 32)
  {
    v18 = 0u;
    *(_OWORD *)pid = 0u;
    -[NSData getBytes:range:](self->_tokenData, "getBytes:range:", &v18, 0, 32);
    *(_OWORD *)token.val = v18;
    *(_OWORD *)&token.val[4] = *(_OWORD *)pid;
    v4 = SecTaskCreateWithAuditToken(0, &token);
    if (v4)
    {
      v5 = v4;
      if (AppSupportLibraryCore())
      {
        *(_QWORD *)token.val = 0;
        if (geoCPCopyBundleIdentifierAndTeamFromSecTaskRef((uint64_t)v5, (uint64_t)&token, 0))
        {
          resolvedNetworkAttributionBundleId = self->_resolvedNetworkAttributionBundleId;
          self->_resolvedNetworkAttributionBundleId = *(NSString **)token.val;

          objc_storeStrong((id *)&self->_resolvedBundleId, self->_resolvedNetworkAttributionBundleId);
        }
      }
      if (!-[NSString length](self->_resolvedNetworkAttributionBundleId, "length"))
      {
        v7 = (NSString *)SecTaskCopyValueForEntitlement(v5, CFSTR("application-identifier"), 0);
        v8 = self->_resolvedNetworkAttributionBundleId;
        self->_resolvedNetworkAttributionBundleId = v7;

        objc_storeStrong((id *)&self->_resolvedBundleId, self->_resolvedNetworkAttributionBundleId);
      }
      if (!objc_msgSend(*p_resolvedBundleId, "length"))
      {
        v9 = SecTaskCopySigningIdentifier(v5, 0);
        v10 = *p_resolvedBundleId;
        *p_resolvedBundleId = (id)v9;

      }
      CFRelease(v5);
    }
    if (!objc_msgSend(*p_resolvedBundleId, "length"))
    {
      v11 = pid[1];
      v12 = proc_pidpath(pid[1], &token, 0x400u);
      if (v12 < 1)
      {
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown(%d)"), v11);
        v13 = *p_resolvedBundleId;
        *p_resolvedBundleId = (id)v16;
      }
      else
      {
        *((_BYTE *)token.val + v12) = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &token);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *p_resolvedBundleId;
        *p_resolvedBundleId = (id)v14;

      }
    }
  }
  return *p_resolvedBundleId;
}

+ (id)currentProcessAuditToken
{
  if (qword_1ECDBCB38 != -1)
    dispatch_once(&qword_1ECDBCB38, &__block_literal_global_194);
  return (id)_MergedGlobals_328;
}

- (unint64_t)hash
{
  NSData *tokenData;
  objc_super v4;

  tokenData = self->_tokenData;
  if (tokenData)
    return -[NSData hash](tokenData, "hash");
  tokenData = (NSData *)self->_proxiedBundleId;
  if (tokenData)
    return -[NSData hash](tokenData, "hash");
  v4.receiver = self;
  v4.super_class = (Class)GEOApplicationAuditToken;
  return -[GEOApplicationAuditToken hash](&v4, sel_hash);
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  char v8;
  NSObject *v9;
  id v10;
  geo_isolater *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = self->_isolater;
  _geo_isolate_lock();
  -[GEOApplicationAuditToken _valueForEntitlement:](self, "_valueForEntitlement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_retainAutorelease(v5);
    v7 = *(char *)objc_msgSend(v6, "objCType");
    if (v7 == 66 || v7 == 99)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        v14 = 66;
        v15 = 1024;
        v16 = 99;
        v17 = 2080;
        v18 = objc_msgSend(objc_retainAutorelease(v6), "objCType");
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: entitlement type was not BOOL. expected %c or %c got '%s'", buf, 0x18u);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  _geo_isolate_unlock();
  return v8;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock();
  -[GEOApplicationAuditToken _valueForEntitlement:](self, "_valueForEntitlement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _geo_isolate_unlock();

  return v5;
}

- (id)_valueForEntitlement:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *entitlementValueCache;
  __SecTask *v10;
  __SecTask *v11;
  NSObject *v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  CFErrorRef error;
  audit_token_t v19;
  audit_token_t token;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (!self->_tokenData)
  {
    v16 = 0;
    goto LABEL_20;
  }
  geo_assert_isolated();
  memset(&v19, 0, sizeof(v19));
  -[NSData getBytes:range:](self->_tokenData, "getBytes:range:", &v19, 0, 32);
  -[NSMutableDictionary objectForKey:](self->_entitlementValueCache, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 0;
    else
      v7 = v6;
    goto LABEL_19;
  }
  if (!self->_entitlementValueCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    entitlementValueCache = self->_entitlementValueCache;
    self->_entitlementValueCache = v8;

  }
  token = v19;
  v10 = SecTaskCreateWithAuditToken(0, &token);
  if (!v10)
  {
    GEOGetAuditTokenLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Unable to create security task from audit token", (uint8_t *)&token, 2u);
    }

    goto LABEL_18;
  }
  v11 = v10;
  error = 0;
  v7 = (void *)SecTaskCopyValueForEntitlement(v10, v4, &error);
  if (error)
  {
    GEOGetAuditTokenLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      token.val[0] = 138412290;
      *(_QWORD *)&token.val[1] = error;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable to get entitlements for peer. Error: %@", (uint8_t *)&token, 0xCu);
    }

    CFRelease(error);
  }
  CFRelease(v11);
  if (!v7)
  {
LABEL_18:
    v14 = self->_entitlementValueCache;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v4);

    v7 = 0;
    v6 = 0;
    goto LABEL_19;
  }
  -[NSMutableDictionary setObject:forKey:](self->_entitlementValueCache, "setObject:forKey:", v7, v4);
  v6 = v7;
LABEL_19:
  v16 = v7;

LABEL_20:
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __52__GEOApplicationAuditToken_currentProcessAuditToken__block_invoke()
{
  GEOApplicationAuditToken *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;

  *(_OWORD *)task_info_out = 0u;
  v6 = 0u;
  task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt))
  {
    v0 = [GEOApplicationAuditToken alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", task_info_out, 32);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[GEOApplicationAuditToken initWithAuditTokenData:](v0, "initWithAuditTokenData:", v1);
    v3 = (void *)_MergedGlobals_328;
    _MergedGlobals_328 = v2;

  }
}

- (NSString)proxiedBundleId
{
  return self->_proxiedBundleId;
}

- (id)backingTokenData
{
  return self->_tokenData;
}

- (NSString)_secondaryIdentifier
{
  return self->_secondaryIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *overrideOfflineCohortId;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenData, CFSTR("tokenData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedBundleId, CFSTR("bundleId"));
  if (self->_proxiedBundleId)
    objc_msgSend(v5, "encodeBool:forKey:", self->_proxiedExternalBundleId, CFSTR("externalBundleId"));
  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId)
    objc_msgSend(v5, "encodeObject:forKey:", overrideOfflineCohortId, CFSTR("offlineCohortId"));

}

- (GEOApplicationAuditToken)initWithProxiedApplicationBundleId:(id)a3
{
  id v4;
  GEOApplicationAuditToken *v5;
  uint64_t v6;
  NSString *proxiedBundleId;
  GEOApplicationAuditToken *v8;

  v4 = a3;
  objc_msgSend(v4, "length");
  v5 = -[GEOApplicationAuditToken initCommon](self, "initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (GEOApplicationAuditToken)initWithCoder:(id)a3
{
  id v4;
  GEOApplicationAuditToken *v5;
  uint64_t v6;
  NSData *tokenData;
  uint64_t v8;
  NSString *proxiedBundleId;
  uint64_t v10;
  NSString *overrideOfflineCohortId;
  GEOApplicationAuditToken *v12;

  v4 = a3;
  v5 = -[GEOApplicationAuditToken initCommon](self, "initCommon");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenData"));
    v6 = objc_claimAutoreleasedReturnValue();
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v8 = objc_claimAutoreleasedReturnValue();
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v8;

    if (v5->_proxiedBundleId)
      v5->_proxiedExternalBundleId = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("externalBundleId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offlineCohortId"));
    v10 = objc_claimAutoreleasedReturnValue();
    overrideOfflineCohortId = v5->_overrideOfflineCohortId;
    v5->_overrideOfflineCohortId = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (GEOApplicationAuditToken)initWithXPCConnection:(id)a3
{
  void *v4;
  GEOApplicationAuditToken *v5;
  __int128 v7;
  __int128 v8;

  if (a3)
  {
    v7 = 0u;
    v8 = 0u;
    xpc_connection_get_audit_token();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEOApplicationAuditToken initWithAuditTokenData:](self, "initWithAuditTokenData:", v4, v7, v8);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOApplicationAuditToken)initWithAuditTokenData:(id)a3
{
  id v4;
  GEOApplicationAuditToken *v5;
  uint64_t v6;
  NSData *tokenData;
  GEOApplicationAuditToken *v8;

  v4 = a3;
  objc_msgSend(v4, "length");
  v5 = -[GEOApplicationAuditToken initCommon](self, "initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokenData = v5->_tokenData;
    v5->_tokenData = (NSData *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)initCommon
{
  GEOApplicationAuditToken *v2;
  uint64_t v3;
  geo_isolater *isolater;
  GEOApplicationAuditToken *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOApplicationAuditToken;
  v2 = -[GEOApplicationAuditToken init](&v7, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementValueCache, 0);
  objc_storeStrong((id *)&self->_overrideOfflineCohortId, 0);
  objc_storeStrong((id *)&self->_secondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_resolvedNetworkAttributionBundleId, 0);
  objc_storeStrong((id *)&self->_resolvedBundleId, 0);
  objc_storeStrong((id *)&self->_proxiedBundleId, 0);
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

- (id)publicLogDescription
{
  __CFString *v3;
  void *v4;
  NSString *proxiedBundleId;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = CFSTR(" (ext)");
  if (!self->_proxiedExternalBundleId)
    v3 = &stru_1E1C241D0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  proxiedBundleId = self->_proxiedBundleId;
  v6 = v3;
  -[GEOApplicationAuditToken bundleId](self, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("ProxiedBundleId: %@%@, BundleId:%@, TokenData: %@"), proxiedBundleId, v6, v7, self->_tokenData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;

  v4 = -[GEOApplicationAuditToken initCommon]([GEOApplicationAuditToken alloc], "initCommon");
  if (v4)
  {
    v5 = -[NSData copy](self->_tokenData, "copy");
    v6 = (void *)v4[2];
    v4[2] = v5;

    *((_BYTE *)v4 + 24) = self->_proxiedExternalBundleId;
    v7 = -[NSString copy](self->_proxiedBundleId, "copy");
    v8 = (void *)v4[4];
    v4[4] = v7;

    v9 = -[NSString copy](self->_secondaryIdentifier, "copy");
    v10 = (void *)v4[7];
    v4[7] = v9;

    v11 = -[NSString copy](self->_overrideOfflineCohortId, "copy");
    v12 = (void *)v4[8];
    v4[8] = v11;

    v13 = v4;
  }

  return v4;
}

- (GEOApplicationAuditToken)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOApplicationAuditToken *v6;
  const void *data;
  uint64_t v8;
  NSData *tokenData;
  const char *string;
  uint64_t v11;
  NSString *proxiedBundleId;
  const char *v13;
  uint64_t v14;
  NSString *overrideOfflineCohortId;
  GEOApplicationAuditToken *v16;
  size_t length;

  v5 = a3;
  v6 = -[GEOApplicationAuditToken initCommon](self, "initCommon");
  if (v6)
  {
    length = 0;
    data = xpc_dictionary_get_data(v5, "token", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v8 = objc_claimAutoreleasedReturnValue();
      tokenData = v6->_tokenData;
      v6->_tokenData = (NSData *)v8;

    }
    string = xpc_dictionary_get_string(v5, "bundle_id");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v11 = objc_claimAutoreleasedReturnValue();
      proxiedBundleId = v6->_proxiedBundleId;
      v6->_proxiedBundleId = (NSString *)v11;

      if (v6->_proxiedBundleId)
        v6->_proxiedExternalBundleId = xpc_dictionary_get_BOOL(v5, "ext_bundle_id");
    }
    v13 = xpc_dictionary_get_string(v5, "offline_cohort_id");
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      overrideOfflineCohortId = v6->_overrideOfflineCohortId;
      v6->_overrideOfflineCohortId = (NSString *)v14;

    }
    v16 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  NSData *tokenData;
  NSString *proxiedBundleId;
  NSString *overrideOfflineCohortId;
  xpc_object_t xdict;

  xdict = a3;
  tokenData = self->_tokenData;
  if (tokenData)
    xpc_dictionary_set_data(xdict, "token", -[NSData bytes](tokenData, "bytes"), -[NSData length](self->_tokenData, "length"));
  proxiedBundleId = self->_proxiedBundleId;
  if (proxiedBundleId)
  {
    xpc_dictionary_set_string(xdict, "bundle_id", -[NSString UTF8String](proxiedBundleId, "UTF8String"));
    xpc_dictionary_set_BOOL(xdict, "ext_bundle_id", self->_proxiedExternalBundleId);
  }
  overrideOfflineCohortId = self->_overrideOfflineCohortId;
  if (overrideOfflineCohortId)
    xpc_dictionary_set_string(xdict, "offline_cohort_id", -[NSString UTF8String](overrideOfflineCohortId, "UTF8String"));

}

- (id)overrideTokenWithProxiedBundleId:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[GEOApplicationAuditToken copy](self, "copy");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v6;

    *(_BYTE *)(v5 + 24) = 0;
    v8 = (id)v5;
  }

  return (id)v5;
}

- (GEOApplicationAuditToken)initWithProxiedExternalApplicationBundleId:(id)a3
{
  id v4;
  GEOApplicationAuditToken *v5;
  uint64_t v6;
  NSString *proxiedBundleId;
  GEOApplicationAuditToken *v8;

  v4 = a3;
  objc_msgSend(v4, "length");
  v5 = -[GEOApplicationAuditToken initCommon](self, "initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    proxiedBundleId = v5->_proxiedBundleId;
    v5->_proxiedBundleId = (NSString *)v6;

    v5->_proxiedExternalBundleId = 1;
    v8 = v5;
  }

  return v5;
}

- (GEOApplicationAuditToken)initWithSecondaryIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *secondaryIdentifier;
  GEOApplicationAuditToken *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length") && (self = -[GEOApplicationAuditToken initCommon](self, "initCommon")) != 0)
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    secondaryIdentifier = self->_secondaryIdentifier;
    self->_secondaryIdentifier = v5;

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  NSString *proxiedBundleId;
  void *v8;
  void *v9;

  if (self->_proxiedExternalBundleId)
    v3 = CFSTR(" (ext)");
  else
    v3 = &stru_1E1C241D0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = v3;
  v6 = objc_opt_class();
  proxiedBundleId = self->_proxiedBundleId;
  -[GEOApplicationAuditToken bundleId](self, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> %@%@, %@, %@"), v6, self, proxiedBundleId, v5, v8, self->_tokenData);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (GEOApplicationAuditToken)init
{

  return 0;
}

- (id)bundleIdForNetworkAttribution
{
  void *v4;
  NSString *v5;
  geo_isolater *v6;

  if (-[NSString length](self->_proxiedBundleId, "length"))
    return self->_proxiedBundleId;
  v6 = self->_isolater;
  _geo_isolate_lock_data();
  -[GEOApplicationAuditToken _bundleIdForAuditToken](self, "_bundleIdForAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_resolvedNetworkAttributionBundleId;

  _geo_isolate_unlock();
  return v5;
}

- (id)overrideTokenWithOfflineCohortId:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v4 = a3;
  v5 = (_QWORD *)-[GEOApplicationAuditToken copy](self, "copy");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[8];
    v5[8] = v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString **v5;
  NSData *tokenData;
  NSString *proxiedBundleId;
  BOOL v8;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (NSString **)v4;
      tokenData = self->_tokenData;
      if (tokenData == (NSData *)v5[2] || -[NSData isEqualToData:](tokenData, "isEqualToData:"))
      {
        proxiedBundleId = self->_proxiedBundleId;
        if (proxiedBundleId == v5[4])
          goto LABEL_8;
        if (-[NSString isEqualToString:](proxiedBundleId, "isEqualToString:"))
        {
          proxiedBundleId = self->_proxiedBundleId;
LABEL_8:
          if (proxiedBundleId)
            v8 = self->_proxiedExternalBundleId == *((unsigned __int8 *)v5 + 24);
          else
            v8 = 1;
          goto LABEL_13;
        }
      }
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)isProxiedExternalBundleId
{
  return self->_proxiedExternalBundleId;
}

- (GEOApplicationAuditToken)initWithNSXPCConnection:(id)a3
{
  void *v4;
  GEOApplicationAuditToken *v5;
  __int128 v7;

  if (a3)
  {
    objc_msgSend(a3, "auditToken", 0, 0, 0, 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v7, 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEOApplicationAuditToken initWithAuditTokenData:](self, "initWithAuditTokenData:", v4);

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)valuesForEntitlement:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[GEOApplicationAuditToken valueForEntitlement:](self, "valueForEntitlement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_geo_filtered:", &__block_literal_global_136_0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_7;
    }
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__GEOApplicationAuditToken_Entitlements__valuesForEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
