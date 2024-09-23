@implementation HMDNetworkRouterClientConfiguration

- (NSUUID)fingerprint
{
  uint64_t v3;
  HMDNetworkRouterClientConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNetworkRouterClientConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (HMDNetworkRouterClientConfiguration *)v3;
    -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_13:

      return (NSUUID *)v5;
    }
    -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v4 = self;
      -[HMDNetworkRouterClientConfiguration clientIdentifier](v4, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {

      }
      else
      {
        -[HMDNetworkRouterClientConfiguration credential](v4, "credential");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_9:
          -[HMDNetworkRouterClientConfiguration serializeWithError:](v4, "serializeWithError:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("5FA86C71-D9DE-4FE8-80BB-823164245F58"));
            objc_msgSend(MEMORY[0x24BDD1880], "hmf_UUIDWithNamespace:data:", v15, v14);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v5 = 0;
          }

          goto LABEL_13;
        }
      }
      v9 = [HMDNetworkRouterClientConfiguration alloc];
      -[HMDNetworkRouterClientConfiguration lanIdentifier](v4, "lanIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](v4, "wanFirewallConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](v4, "lanFirewallConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDNetworkRouterClientConfiguration initWithClientIdentifier:lanIdentifier:credential:wanFirewallConfiguration:lanFirewallConfiguration:](v9, "initWithClientIdentifier:lanIdentifier:credential:wanFirewallConfiguration:lanFirewallConfiguration:", 0, v10, 0, v11, v12);

      v4 = (HMDNetworkRouterClientConfiguration *)v13;
      goto LABEL_9;
    }
  }
  v5 = 0;
  return (NSUUID *)v5;
}

+ (id)configurationWithClientIdentifier:(id)a3 lanIdentifier:(int64_t)a4
{
  id v5;
  HMDNetworkRouterClientConfiguration *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterClientConfiguration);
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BC28]), "initWithValue:", v5);
    -[HMDNetworkRouterClientConfiguration setClientIdentifier:](v6, "setClientIdentifier:", v7);

  }
  v8 = objc_alloc(MEMORY[0x24BE1BC28]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithValue:", v9);
  -[HMDNetworkRouterClientConfiguration setLanIdentifier:](v6, "setLanIdentifier:", v10);

  return v6;
}

+ (id)configurationForOpenProtectionWithClientIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[HMDNetworkRouterClientConfiguration configurationWithClientIdentifier:lanIdentifier:](HMDNetworkRouterClientConfiguration, "configurationWithClientIdentifier:lanIdentifier:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNetworkRouterLANFirewallConfiguration configurationWithFullAccess](HMDNetworkRouterLANFirewallConfiguration, "configurationWithFullAccess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanFirewallConfiguration:", v4);

  +[HMDNetworkRouterWANFirewallConfiguration configurationWithFullAccess](HMDNetworkRouterWANFirewallConfiguration, "configurationWithFullAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWanFirewallConfiguration:", v5);

  return v3;
}

+ (id)configurationForFirewallConfiguration:(id)a3 hapAccessory:(BOOL)a4 airplayAccessory:(BOOL)a5 withClientIdentifier:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  if (objc_msgSend(v9, "hasFullAccessToLAN"))
    v11 = 1;
  else
    v11 = 3;
  +[HMDNetworkRouterClientConfiguration configurationWithClientIdentifier:lanIdentifier:](HMDNetworkRouterClientConfiguration, "configurationWithClientIdentifier:lanIdentifier:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:](HMDNetworkRouterLANFirewallConfiguration, "configurationFromFirewallRuleConfiguration:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLanFirewallConfiguration:", v13);

  +[HMDNetworkRouterWANFirewallConfiguration configurationFromFirewallRuleConfiguration:](HMDNetworkRouterWANFirewallConfiguration, "configurationFromFirewallRuleConfiguration:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWanFirewallConfiguration:", v14);

  if (v8 && (objc_msgSend(v9, "hasFullAccessToLAN") & 1) == 0)
  {
    +[HMDNetworkRouterDynamicPortRule ruleForHAP](HMDNetworkRouterDynamicPortRule, "ruleForHAP");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lanFirewallConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ruleList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTo:", v17);

  }
  if (v7 && (objc_msgSend(v9, "hasAirplayRules") & 1) == 0)
  {
    +[HMDNetworkRouterHomeKitOnlyFirewallConfiguration fallbackConfigurationForRuleset:](HMDNetworkRouterHomeKitOnlyFirewallConfiguration, "fallbackConfigurationForRuleset:", CFSTR("AirPlay2"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lanFirewallConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addRulesFromFirewallConfiguration:", v18);

  }
  return v12;
}

- (HMDNetworkRouterClientConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterClientConfiguration;
  return -[HMDNetworkRouterClientConfiguration init](&v3, sel_init);
}

- (HMDNetworkRouterClientConfiguration)initWithClientIdentifier:(id)a3 lanIdentifier:(id)a4 credential:(id)a5 wanFirewallConfiguration:(id)a6 lanFirewallConfiguration:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDNetworkRouterClientConfiguration *v17;
  HMDNetworkRouterClientConfiguration *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDNetworkRouterClientConfiguration;
  v17 = -[HMDNetworkRouterClientConfiguration init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    objc_storeStrong((id *)&v18->_lanIdentifier, a4);
    objc_storeStrong((id *)&v18->_credential, a5);
    objc_storeStrong((id *)&v18->_wanFirewallConfiguration, a6);
    objc_storeStrong((id *)&v18->_lanFirewallConfiguration, a7);
  }

  return v18;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  id v19;
  BOOL v20;
  void *v21;
  uint64_t v22;
  HMDNetworkRouterClientConfiguration *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v24 = self;
    v25 = v7;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v26 = 0;
    v15 = v8 + v9;
    while (1)
    {
      v36 = 0;
      v34 = 0;
      v35 = 0;
      v32 = 0;
      v33 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        v7 = v25;
        if (a4)
        {
          HMErrorFromOSStatus();
          v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_30;
      }
      if (!v35)
        break;
      switch(v36)
      {
        case 1:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v10;
          v17 = &v31;
          objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v16, &v31);
          v18 = (void *)v26;
          v26 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 3:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v10;
          v17 = &v30;
          objc_msgSend(MEMORY[0x24BE1BC28], "parsedFromData:error:", v16, &v30);
          v18 = v14;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 4:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v10;
          v17 = &v29;
          +[HMDNetworkRouterCredential parsedFromData:error:](HMDNetworkRouterCredential, "parsedFromData:error:", v16, &v29);
          v18 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 5:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v10;
          v17 = &v28;
          +[HMDNetworkRouterWANFirewallConfiguration parsedFromData:error:](HMDNetworkRouterWANFirewallConfiguration, "parsedFromData:error:", v16, &v28);
          v18 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 6:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v10;
          v17 = &v27;
          +[HMDNetworkRouterLANFirewallConfiguration parsedFromData:error:](HMDNetworkRouterLANFirewallConfiguration, "parsedFromData:error:", v16, &v27);
          v18 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v19 = *v17;

          v10 = v19;
          break;
        default:
          break;
      }
      if (v34)
        free(v34);
      if (v32 == v15)
      {
        if (v10)
          goto LABEL_19;
LABEL_25:
        v7 = v25;
        v21 = (void *)v26;
        self = v24;
        goto LABEL_26;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v22;
    if (!v22)
      goto LABEL_25;
LABEL_19:
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v20 = 0;
      *a4 = v10;
    }
    else
    {
      v20 = 0;
    }
    v7 = v25;
LABEL_30:
    v21 = (void *)v26;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v21 = 0;
LABEL_26:
    -[HMDNetworkRouterClientConfiguration setClientIdentifier:](self, "setClientIdentifier:", v21);
    -[HMDNetworkRouterClientConfiguration setLanIdentifier:](self, "setLanIdentifier:", v14);
    -[HMDNetworkRouterClientConfiguration setCredential:](self, "setCredential:", v13);
    -[HMDNetworkRouterClientConfiguration setWanFirewallConfiguration:](self, "setWanFirewallConfiguration:", v12);
    -[HMDNetworkRouterClientConfiguration setLanFirewallConfiguration:](self, "setLanFirewallConfiguration:", v11);
    v10 = 0;
    v20 = 1;
  }

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v6, "serializeWithError:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;

    if (v8)
      goto LABEL_23;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_16;

  }
  -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v11, "serializeWithError:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v8)
      goto LABEL_23;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_16;

  }
  -[HMDNetworkRouterClientConfiguration credential](self, "credential");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_13;
  -[HMDNetworkRouterClientConfiguration credential](self, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v13, "serializeWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
    goto LABEL_23;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (TLV8BufferAppend())
  {
LABEL_16:

    goto LABEL_17;
  }

LABEL_13:
  -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v15, "serializeWithError:", &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (v8)
      goto LABEL_23;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_16;

  }
  -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_29;
  -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v18, "serializeWithError:", &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;

  if (v8)
  {
LABEL_23:

    if (a3)
    {
      v16 = objc_retainAutorelease(v8);
      v8 = v16;
      goto LABEL_25;
    }
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }
  v21 = objc_retainAutorelease(v7);
  objc_msgSend(v21, "bytes");
  objc_msgSend(v21, "length");
  v22 = TLV8BufferAppend();

  if (!v22)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_27;
  }
LABEL_17:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_26;
  }
  HMErrorFromOSStatus();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_25:
  v19 = 0;
  *a3 = v16;
LABEL_27:
  TLV8BufferFree();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterClientConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDNetworkRouterClientConfiguration *v10;

  v4 = +[HMDNetworkRouterClientConfiguration allocWithZone:](HMDNetworkRouterClientConfiguration, "allocWithZone:", a3);
  -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration credential](self, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDNetworkRouterClientConfiguration initWithClientIdentifier:lanIdentifier:credential:wanFirewallConfiguration:lanFirewallConfiguration:](v4, "initWithClientIdentifier:lanIdentifier:credential:wanFirewallConfiguration:lanFirewallConfiguration:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterClientConfiguration *v5;
  HMDNetworkRouterClientConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;

  v5 = (HMDNetworkRouterClientConfiguration *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration clientIdentifier](v6, "clientIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientConfiguration clientIdentifier](v6, "clientIdentifier");
        v39 = v9;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_29;
        }
      }
      -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration lanIdentifier](v6, "lanIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientConfiguration lanIdentifier](v6, "lanIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v10 = 0;
LABEL_27:

LABEL_28:
          if (v7 == v8)
          {
LABEL_30:

            goto LABEL_31;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      -[HMDNetworkRouterClientConfiguration credential](self, "credential");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration credential](v6, "credential");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v13;
      if (v13 != v36)
      {
        -[HMDNetworkRouterClientConfiguration credential](self, "credential");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientConfiguration credential](v6, "credential");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v14;
        if (!objc_msgSend(v14, "isEqual:"))
        {
          v10 = 0;
          v16 = (void *)v36;
          v15 = v37;
LABEL_25:

LABEL_26:
          if (v11 == v12)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](v6, "wanFirewallConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      if (v17 == v18)
      {
        v29 = v12;
      }
      else
      {
        -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](v6, "wanFirewallConfiguration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v19;
        if (!objc_msgSend(v19, "isEqual:"))
        {
          v10 = 0;
          v3 = v32;
          goto LABEL_23;
        }
        v29 = v12;
      }
      -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](v6, "lanFirewallConfiguration");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

        v10 = 1;
      }
      else
      {
        v22 = (void *)v21;
        -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
        v27 = v17;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](v6, "lanFirewallConfiguration");
        v28 = v11;
        v24 = v18;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v23, "isEqual:", v25);

        v18 = v24;
        v11 = v28;

        v17 = v27;
      }
      v12 = v29;
      v3 = v32;
      if (v17 == v18)
      {
LABEL_24:

        v16 = (void *)v36;
        v15 = v37;
        if (v37 == (void *)v36)
          goto LABEL_26;
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    v10 = 0;
  }
LABEL_31:

  return v10;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDNetworkRouterClientConfiguration clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration lanIdentifier](self, "lanIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration credential](self, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration wanFirewallConfiguration](self, "wanFirewallConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterClientConfiguration lanFirewallConfiguration](self, "lanFirewallConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterClientConfiguration clientIdentifier=%@, lanIdentifier=%@, credential=%@, wanFirewallConfiguration=%@, lanFirewallConfiguration=%@>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HAPTLVUnsignedNumberValue)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (HAPTLVUnsignedNumberValue)lanIdentifier
{
  return self->_lanIdentifier;
}

- (void)setLanIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lanIdentifier, a3);
}

- (HMDNetworkRouterCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (HMDNetworkRouterWANFirewallConfiguration)wanFirewallConfiguration
{
  return self->_wanFirewallConfiguration;
}

- (void)setWanFirewallConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_wanFirewallConfiguration, a3);
}

- (HMDNetworkRouterLANFirewallConfiguration)lanFirewallConfiguration
{
  return self->_lanFirewallConfiguration;
}

- (void)setLanFirewallConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_lanFirewallConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanFirewallConfiguration, 0);
  objc_storeStrong((id *)&self->_wanFirewallConfiguration, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_lanIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterClientConfiguration *v6;
  HMDNetworkRouterClientConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterClientConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterClientConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
    v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  return v7;
}

@end
