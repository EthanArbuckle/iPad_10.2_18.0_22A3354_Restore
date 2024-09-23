@implementation CNContactProviderSupportDomainCommand

- (CNContactProviderSupportDomainCommand)init
{
  CNContactProviderSupportDomainCommand *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)new
{
  id v2;
  id v3;

  v2 = a1;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactProviderSupportDomainCommand)initWithCommandType:(id)a3
{
  id v5;
  CNContactProviderSupportDomainCommand *v6;
  CNContactProviderSupportDomainCommand *v7;
  CNContactProviderSupportDomainCommand *v8;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      -[CNContactProviderSupportDomainCommand initWithCommandType:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)CNContactProviderSupportDomainCommand;
  v6 = -[CNContactProviderSupportDomainCommand init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandType, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)addDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand addDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("AddDomain"));
  -[CNContactProviderSupportDomainCommand setDomain:](v4, "setDomain:", v3);

  return v4;
}

+ (id)removeDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("RemoveDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)fetchDomains
{
  return -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("FetchDomains"));
}

+ (id)fetchDomainEnabled:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("FetchDomainEnabled"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)enableDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("EnableDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)disableDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("DisableDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)fetchContainerIdentifierForDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("FetchDomainContainerIdentifier"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)synchronizeDomain:(id)a3 usingSession:(id)a4
{
  id v5;
  id v6;
  CNContactProviderSupportDomainCommand *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
    if (v6)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v6)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
    +[CNContactProviderSupportDomainCommand synchronizeDomain:usingSession:].cold.1();
LABEL_10:
  v7 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("SynchronizeDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v7, "setDomainIdentifier:", v5);
  -[CNContactProviderSupportDomainCommand setSession:](v7, "setSession:", v6);

  return v7;
}

+ (id)invalidateExtensionForDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("InvalidateExtension"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)resetEnumerationForDomain:(id)a3
{
  id v3;
  CNContactProviderSupportDomainCommand *v4;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
      +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
  }
  v4 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("ResetEnumeration"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v4, "setDomainIdentifier:", v3);

  return v4;
}

+ (id)fetchAllDomainsCount
{
  return -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("FetchAllDomainsCount"));
}

+ (id)fetchAllDomains
{
  return -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("FetchAllDomains"));
}

+ (id)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  CNContactProviderSupportDomainCommand *v9;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v7)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
    if (v8)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v8)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
    +[CNContactProviderSupportDomainCommand enableDomain:bundleIdentifier:shouldSynchronize:].cold.1();
LABEL_10:
  v9 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("EnableDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v9, "setDomainIdentifier:", v7);
  -[CNContactProviderSupportDomainCommand setBundleIdentifier:](v9, "setBundleIdentifier:", v8);
  -[CNContactProviderSupportDomainCommand setShouldSynchronize:](v9, "setShouldSynchronize:", v5);

  return v9;
}

+ (id)disableDomain:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  CNContactProviderSupportDomainCommand *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:].cold.1();
    if (v6)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v6)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
    +[CNContactProviderSupportDomainCommand enableDomain:bundleIdentifier:shouldSynchronize:].cold.1();
LABEL_10:
  v7 = -[CNContactProviderSupportDomainCommand initWithCommandType:]([CNContactProviderSupportDomainCommand alloc], "initWithCommandType:", CFSTR("DisableDomain"));
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v7, "setDomainIdentifier:", v5);
  -[CNContactProviderSupportDomainCommand setBundleIdentifier:](v7, "setBundleIdentifier:", v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportDomainCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CNContactProviderSupportDomainCommand *v6;
  void *v7;
  uint64_t v8;
  NSString *domainIdentifier;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  void *v13;
  uint64_t v14;
  CNContactProviderSupportDomain *domain;
  void *v16;
  uint64_t v17;
  CNContactProviderSupportSession *session;
  CNContactProviderSupportDomainCommand *v19;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactProviderSupportDomainCommand initWithCommandType:](self, "initWithCommandType:", v5);
  if (v6)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_domainIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      domainIdentifier = v6->_domainIdentifier;
      v6->_domainIdentifier = (NSString *)v8;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_bundleIdentifier")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v11;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_domain")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domain"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      domain = v6->_domain;
      v6->_domain = (CNContactProviderSupportDomain *)v14;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_session")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_session"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      session = v6->_session;
      v6->_session = (CNContactProviderSupportSession *)v17;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_shouldSynchronize")))
      v6->_shouldSynchronize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldSynchronize"));
    v19 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainIdentifier;
  NSString *bundleIdentifier;
  void *v6;
  CNContactProviderSupportSession *session;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_commandType, CFSTR("commandType"));
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier)
    objc_msgSend(v8, "encodeObject:forKey:", domainIdentifier, CFSTR("_domainIdentifier"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v8, "encodeObject:forKey:", bundleIdentifier, CFSTR("_bundleIdentifier"));
  v6 = v8;
  if (self->_session)
  {
    objc_msgSend(v8, "encodeObject:forKey:", self->_domain, CFSTR("_domain"));
    v6 = v8;
    session = self->_session;
    if (session)
    {
      objc_msgSend(v8, "encodeObject:forKey:", session, CFSTR("_session"));
      v6 = v8;
    }
  }
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldSynchronize, CFSTR("_shouldSynchronize"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNContactProviderSupportDomainCommand *v4;
  void *v5;
  CNContactProviderSupportDomainCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = [CNContactProviderSupportDomainCommand alloc];
  -[CNContactProviderSupportDomainCommand commandType](self, "commandType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactProviderSupportDomainCommand initWithCommandType:](v4, "initWithCommandType:", v5);

  -[CNContactProviderSupportDomainCommand domainIdentifier](self, "domainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomainCommand setDomainIdentifier:](v6, "setDomainIdentifier:", v7);

  -[CNContactProviderSupportDomainCommand bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomainCommand setBundleIdentifier:](v6, "setBundleIdentifier:", v8);

  -[CNContactProviderSupportDomainCommand domain](self, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomainCommand setDomain:](v6, "setDomain:", v9);

  -[CNContactProviderSupportDomainCommand session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactProviderSupportDomainCommand setSession:](v6, "setSession:", v10);

  -[CNContactProviderSupportDomainCommand setShouldSynchronize:](v6, "setShouldSynchronize:", -[CNContactProviderSupportDomainCommand shouldSynchronize](self, "shouldSynchronize"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CNContactProviderSupportDomainCommand *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;

  v4 = (CNContactProviderSupportDomainCommand *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v5 = (unint64_t)-[CNContactProviderSupportDomainCommand commandType](self, "commandType");
    v6 = (unint64_t)-[CNContactProviderSupportDomainCommand commandType](v4, "commandType");
    if (v5 | v6)
    {
      if (!objc_msgSend((id)v5, "isEqual:", v6))
        goto LABEL_14;
    }
    v7 = (unint64_t)-[CNContactProviderSupportDomainCommand domainIdentifier](self, "domainIdentifier");
    v8 = (unint64_t)-[CNContactProviderSupportDomainCommand domainIdentifier](v4, "domainIdentifier");
    if (v7 | v8)
    {
      if (!objc_msgSend((id)v7, "isEqual:", v8))
        goto LABEL_14;
    }
    if (((v9 = (unint64_t)-[CNContactProviderSupportDomainCommand bundleIdentifier](self, "bundleIdentifier"),
           v10 = (unint64_t)-[CNContactProviderSupportDomainCommand bundleIdentifier](v4, "bundleIdentifier"),
           !(v9 | v10))
       || objc_msgSend((id)v9, "isEqual:", v10))
      && ((v11 = (unint64_t)-[CNContactProviderSupportDomainCommand domain](self, "domain"),
           v12 = (unint64_t)-[CNContactProviderSupportDomainCommand domain](v4, "domain"),
           !(v11 | v12))
       || objc_msgSend((id)v11, "isEqual:", v12))
      && ((v13 = (unint64_t)-[CNContactProviderSupportDomainCommand session](self, "session"),
           v14 = (unint64_t)-[CNContactProviderSupportDomainCommand session](v4, "session"),
           !(v13 | v14))
       || objc_msgSend((id)v13, "isEqual:", v14)))
    {
      v15 = -[CNContactProviderSupportDomainCommand shouldSynchronize](self, "shouldSynchronize");
      v16 = v15 ^ -[CNContactProviderSupportDomainCommand shouldSynchronize](v4, "shouldSynchronize") ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (CNContactProviderSupportDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (CNContactProviderSupportSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)shouldSynchronize
{
  return self->_shouldSynchronize;
}

- (void)setShouldSynchronize:(BOOL)a3
{
  self->_shouldSynchronize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_commandType, 0);
}

- (void)initWithCommandType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘commandType’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)addDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘domain’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)removeDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘domainIdentifier’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)synchronizeDomain:usingSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘session’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)enableDomain:bundleIdentifier:shouldSynchronize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F8BD000, v0, v1, "parameter ‘bundleIdentifier’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
