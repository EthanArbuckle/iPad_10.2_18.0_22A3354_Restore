@implementation MPCPlaybackRequestEnvironment

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (id)_createStoreRequestContext
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x24BEC88D0]);
  objc_msgSend(v3, "setClientIdentifier:", self->_clientIdentifier);
  objc_msgSend(v3, "setClientVersion:", self->_clientVersion);
  objc_msgSend(v3, "setRequestingBundleIdentifier:", self->_requestingBundleIdentifier);
  objc_msgSend(v3, "setRequestingBundleVersion:", self->_requestingBundleVersion);
  v4 = objc_alloc_init(MEMORY[0x24BEC89D0]);
  objc_msgSend(v4, "setAllowsHandlingNonAuthenticationDialogs:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C8]), "initWithConfiguration:", v4);
  v6 = objc_alloc(MEMORY[0x24BEC89F8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__MPCPlaybackRequestEnvironment__createStoreRequestContext__block_invoke;
  v11[3] = &unk_24CAB9798;
  v11[4] = self;
  v12 = v3;
  v13 = v5;
  v7 = v5;
  v8 = v3;
  v9 = (void *)objc_msgSend(v6, "initWithBlock:", v11);

  return v9;
}

+ (MPCPlaybackRequestEnvironment)activeAccountRequestEnvironment
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "requestEnvironmentWithUserIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlaybackRequestEnvironment *)v4;
}

- (MPCPlaybackRequestEnvironment)init
{
  void *v3;
  MPCPlaybackRequestEnvironment *v4;

  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](self, "initWithUserIdentity:", v3);

  return v4;
}

+ (MPCPlaybackRequestEnvironment)requestEnvironmentWithUserIdentity:(id)a3
{
  id v3;
  MPCMutablePlaybackRequestEnvironment *v4;

  v3 = a3;
  v4 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:]([MPCMutablePlaybackRequestEnvironment alloc], "initWithUserIdentity:", v3);

  return (MPCPlaybackRequestEnvironment *)v4;
}

- (MPCPlaybackRequestEnvironment)initWithUserIdentity:(id)a3
{
  id v5;
  MPCPlaybackRequestEnvironment *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void **p_clientIdentifier;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void **p_clientVersion;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlaybackRequestEnvironment;
  v6 = -[MPCPlaybackRequestEnvironment init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEC8770], "defaultInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = &stru_24CABB5D0;
    p_clientIdentifier = (void **)&v6->_clientIdentifier;
    objc_storeStrong((id *)&v6->_clientIdentifier, v10);

    objc_msgSend(v7, "clientVersion");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_24CABB5D0;
    p_clientVersion = (void **)&v6->_clientVersion;
    objc_storeStrong((id *)&v6->_clientVersion, v14);

    objc_storeStrong((id *)&v6->_userIdentity, a3);
    if (-[NSString isEqualToString:](v6->_clientIdentifier, "isEqualToString:", CFSTR("AirMusic")))
    {
      v16 = *p_clientIdentifier;
      *p_clientIdentifier = CFSTR("Music");

      v17 = *p_clientVersion;
      *p_clientVersion = CFSTR("3.1");

    }
  }

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rectifiedPlaybackRequestEnvironmentWithReasons:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t quot;
  uint64_t v13;
  char *v14;
  lldiv_t v15;
  uint64_t v16;
  const UInt8 *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  lldiv_t v29;
  uint64_t v30;
  const UInt8 *v31;
  __CFString *v32;
  void *v33;
  NSObject *v34;
  MPCMutablePlaybackDelegationProperties *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v45;
  uint8_t buf[4];
  __CFString *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[MPCPlaybackRequestEnvironment mutableCopy](self, "mutableCopy");
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "accounts");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v9;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Account Manager accounts: %@", buf, 0xCu);

  }
  objc_msgSend(v7, "delegationProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "delegationProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    quot = objc_msgSend(v11, "storeAccountID");
    v13 = quot;
    v14 = (char *)&v50 + 1;
    do
    {
      v15 = lldiv(quot, 10);
      quot = v15.quot;
      if (v15.rem >= 0)
        LOBYTE(v16) = v15.rem;
      else
        v16 = -v15.rem;
      *(v14 - 2) = v16 + 48;
      v17 = (const UInt8 *)(v14 - 2);
      --v14;
    }
    while (v15.quot);
    if (v13 < 0)
    {
      *(v14 - 2) = 45;
      v17 = (const UInt8 *)(v14 - 2);
    }
    v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)&v50 - (char *)v17, 0x8000100u, 0);

    objc_msgSend(v5, "accountForDSID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if ((objc_msgSend(v19, "isDelegated") & 1) != 0)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v7, "setDelegationProperties:", 0);
      objc_msgSend(v20, "userIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserIdentity:", v21);

      v22 = CFSTR("[promoting delegated account]");
    }
    else
    {
      objc_msgSend(v7, "setDelegationProperties:", 0);
      v22 = CFSTR("[delegated account missing]");
    }
    objc_msgSend(v6, "addObject:", v22);
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "DSIDForUserIdentity:outError:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "longLongValue");

  v27 = (char *)&v50 + 1;
  v28 = v26;
  do
  {
    v29 = lldiv(v28, 10);
    v28 = v29.quot;
    if (v29.rem >= 0)
      LOBYTE(v30) = v29.rem;
    else
      v30 = -v29.rem;
    *(v27 - 2) = v30 + 48;
    v31 = (const UInt8 *)(v27 - 2);
    --v27;
  }
  while (v29.quot);
  if (v26 < 0)
  {
    *(v27 - 2) = 45;
    v31 = (const UInt8 *)(v27 - 2);
  }
  v32 = (__CFString *)CFStringCreateWithBytes(0, v31, (char *)&v50 - (char *)v31, 0x8000100u, 0);
  objc_msgSend(v5, "accountForDSID:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v32;
    v48 = 2112;
    v49 = v33;
    _os_log_impl(&dword_210BD8000, v34, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Base account for DSID %@: %@", buf, 0x16u);
  }

  if (v33)
  {
    if (objc_msgSend(v33, "isDelegated"))
    {
      v35 = -[MPCPlaybackDelegationProperties initWithStoreAccountID:deviceGUID:]([MPCMutablePlaybackDelegationProperties alloc], "initWithStoreAccountID:deviceGUID:", v26, CFSTR("unknown-guid"));
      objc_msgSend(v7, "setDelegationProperties:", v35);

      objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserIdentity:", v36);

      objc_msgSend(v6, "addObject:", CFSTR("[base account is delegated]"));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserIdentity:", v37);

    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v38, "DSIDForUserIdentity:outError:", v39, &v45);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = v45;

    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v40;
      _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Base account missing & replaced by activeAccount with DSID %@", buf, 0xCu);
    }

    objc_msgSend(v6, "addObject:", CFSTR("[base account missing]"));
  }
  if (objc_msgSend(v6, "count"))
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    v43 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)_copyWithPlaybackRequestEnvironmentClass:(Class)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_alloc_init(a3);
  if (v4)
  {
    v5 = -[NSString copy](self->_clientIdentifier, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[NSString copy](self->_clientVersion, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = -[MPCPlaybackDelegationProperties copy](self->_delegationProperties, "copy");
    v10 = (void *)v4[3];
    v4[3] = v9;

    v11 = -[NSString copy](self->_requestingBundleIdentifier, "copy");
    v12 = (void *)v4[4];
    v4[4] = v11;

    v13 = -[NSString copy](self->_requestingBundleVersion, "copy");
    v14 = (void *)v4[5];
    v4[5] = v13;

    v15 = -[ICUserIdentity copy](self->_userIdentity, "copy");
    v16 = (void *)v4[6];
    v4[6] = v15;

  }
  return v4;
}

void __59__MPCPlaybackRequestEnvironment__createStoreRequestContext__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "setIdentity:", *(_QWORD *)(a1[4] + 48));
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentityStore:", v3);

  objc_msgSend(v9, "setClientInfo:", a1[5]);
  objc_msgSend(v9, "setStoreDialogResponseHandler:", a1[6]);
  objc_msgSend(v9, "setAllowsExpiredBags:", 1);
  v4 = *(void **)(a1[4] + 24);
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEC8A58];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "storeAccountID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specificAccountWithDSID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityAllowingDelegation:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegatedIdentity:", v8);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MPCPlaybackRequestEnvironment delegationProperties](self, "delegationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeAccountID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCreateLoggableValueForDSID();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlaybackRequestEnvironment userIdentity](self, "userIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<MPCPlaybackRequestEnvironment: %p [DelegateAccount: <%@> %@] underlyingUserIdentity=%@>"), self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MPCPlaybackRequestEnvironment userIdentity](self, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<MPCPlaybackRequestEnvironment: %p identity=%@>"), self, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v10;
}

- (MPCPlaybackDelegationProperties)delegationProperties
{
  return self->_delegationProperties;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_delegationProperties, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (MPCPlaybackRequestEnvironment)initWithCoder:(id)a3
{
  id v4;
  MPCPlaybackRequestEnvironment *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  MPCPlaybackDelegationProperties *delegationProperties;
  uint64_t v14;
  NSString *requestingBundleIdentifier;
  uint64_t v16;
  NSString *requestingBundleVersion;
  uint64_t v18;
  ICUserIdentity *userIdentity;
  uint64_t v20;
  ICUserIdentity *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPCPlaybackRequestEnvironment;
  v5 = -[MPCPlaybackRequestEnvironment init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_24CABB5D0;
    objc_storeStrong((id *)&v5->_clientIdentifier, v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_24CABB5D0;
    objc_storeStrong((id *)&v5->_clientVersion, v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delegationProperties"));
    v12 = objc_claimAutoreleasedReturnValue();
    delegationProperties = v5->_delegationProperties;
    v5->_delegationProperties = (MPCPlaybackDelegationProperties *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingBundleIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingBundleVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentity"));
    v18 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v18;

    if (!v5->_userIdentity)
    {
      objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_userIdentity;
      v5->_userIdentity = (ICUserIdentity *)v20;

    }
  }

  return v5;
}

- (id)mpc_jsonValue
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackRequestEnvironment userIdentity](self, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountForUserIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hashedDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("user"));

  -[MPCPlaybackRequestEnvironment clientIdentifier](self, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("clientID"));

  -[MPCPlaybackRequestEnvironment clientVersion](self, "clientVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientVersion"));

  -[MPCPlaybackRequestEnvironment requestingBundleIdentifier](self, "requestingBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("requestingID"));

  -[MPCPlaybackRequestEnvironment requestingBundleVersion](self, "requestingBundleVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requestingVersion"));

  -[MPCPlaybackRequestEnvironment delegationProperties](self, "delegationProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mpc_jsonValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("delegation"));

  return v3;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPCMutablePlaybackRequestEnvironment *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("user"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountForHashedDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:]([MPCMutablePlaybackRequestEnvironment alloc], "initWithUserIdentity:", v7);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMutablePlaybackRequestEnvironment setClientIdentifier:](v8, "setClientIdentifier:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMutablePlaybackRequestEnvironment setClientVersion:](v8, "setClientVersion:", v10);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("requestingID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMutablePlaybackRequestEnvironment setRequestingBundleIdentifier:](v8, "setRequestingBundleIdentifier:", v11);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("requestingVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMutablePlaybackRequestEnvironment setRequestingBundleVersion:](v8, "setRequestingBundleVersion:", v12);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("delegation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPCPlaybackDelegationProperties payloadValueFromJSONValue:](MPCMutablePlaybackDelegationProperties, "payloadValueFromJSONValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCMutablePlaybackRequestEnvironment setDelegationProperties:](v8, "setDelegationProperties:", v14);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientIdentifier;
  id v5;

  clientIdentifier = self->_clientIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientVersion, CFSTR("clientVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_delegationProperties, CFSTR("delegationProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleIdentifier, CFSTR("requestingBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleVersion, CFSTR("requestingBundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentity, CFSTR("userIdentity"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPCPlaybackRequestEnvironment _copyWithPlaybackRequestEnvironmentClass:](self, "_copyWithPlaybackRequestEnvironmentClass:", objc_opt_class());
}

- (id)_createMusicKitRequestContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  MPCPlaybackRequestEnvironment *v15;
  id v16;

  v3 = (void *)MEMORY[0x24BEC8770];
  ICBundleIdentifierForSystemApplicationType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:", CFSTR("com.apple.Music"), CFSTR("1"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BEC89D0]);
  objc_msgSend(v6, "setAllowsHandlingNonAuthenticationDialogs:", 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC89C8]), "initWithConfiguration:", v6);
  v8 = objc_alloc(MEMORY[0x24BEC8870]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__MPCPlaybackRequestEnvironment__createMusicKitRequestContext__block_invoke;
  v13[3] = &unk_24CAB97C0;
  v14 = v5;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v5;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v13);

  return v11;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

void __62__MPCPlaybackRequestEnvironment__createMusicKitRequestContext__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a1[4];
  v5 = a2;
  objc_msgSend(v5, "setClientInfo:", v3);
  objc_msgSend(v5, "setIdentity:", *(_QWORD *)(a1[5] + 48));
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentityStore:", v4);

  objc_msgSend(v5, "setStoreDialogResponseHandler:", a1[6]);
}

@end
