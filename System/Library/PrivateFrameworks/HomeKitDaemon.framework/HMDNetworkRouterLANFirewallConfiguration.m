@implementation HMDNetworkRouterLANFirewallConfiguration

- (void)addRulesFromFirewallConfiguration:(id)a3
{
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
  id v20;

  +[HMDNetworkRouterLANFirewallConfiguration configurationFromFirewallRuleConfiguration:](HMDNetworkRouterLANFirewallConfiguration, "configurationFromFirewallRuleConfiguration:", a3);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dynamicPortRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ruleList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dynamicPortRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "staticPortRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ruleList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "staticPortRules");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "staticICMPRules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ruleList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "staticICMPRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "multicastBridgingRules");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ruleList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "multicastBridgingRules");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v19);

}

+ (HMDNetworkRouterLANFirewallConfiguration)configurationWithFullAccess
{
  HMDNetworkRouterLANFirewallConfiguration *v2;
  HMDNetworkRouterLANFirewall *v3;
  HMDNetworkRouterLANFirewallRuleList *v4;

  v2 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  v3 = -[HMDNetworkRouterLANFirewall initWithType:]([HMDNetworkRouterLANFirewall alloc], "initWithType:", 0);
  -[HMDNetworkRouterLANFirewallConfiguration setType:](v2, "setType:", v3);

  v4 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
  -[HMDNetworkRouterLANFirewallConfiguration setRuleList:](v2, "setRuleList:", v4);

  return v2;
}

+ (id)configurationFromFirewallRuleConfiguration:(id)a3
{
  id v3;
  HMDNetworkRouterLANFirewallConfiguration *v4;
  int v5;
  char v6;
  HMDNetworkRouterLANFirewall *v7;
  HMDNetworkRouterLANFirewallRuleList *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class **p_superclass;
  __objc2_class **v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  __objc2_class **v18;
  char v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  __objc2_class **v27;
  __objc2_class **v28;
  void *v29;
  HMDNetworkRouterLANFirewallConfiguration *v30;
  void *v31;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  v5 = objc_msgSend(v3, "hasFullAccessToLAN");
  v6 = v5;
  v7 = -[HMDNetworkRouterLANFirewall initWithType:]([HMDNetworkRouterLANFirewall alloc], "initWithType:", v5 ^ 1u);
  -[HMDNetworkRouterLANFirewallConfiguration setType:](v4, "setType:", v7);

  if ((v6 & 1) == 0)
  {
    v8 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
    -[HMDNetworkRouterLANFirewallConfiguration setRuleList:](v4, "setRuleList:", v8);

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = v3;
    objc_msgSend(v3, "lanRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (!v10)
      goto LABEL_19;
    v11 = v10;
    v12 = *(_QWORD *)v36;
    p_superclass = &OBJC_METACLASS___HMDRemoveAccessoryPairingSharedUserOperation.superclass;
    v14 = off_24E7626C8;
    while (1)
    {
      v15 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v18 = v14;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();
          v18 = off_24E7626D0;
          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_14;
            v20 = objc_msgSend(v16, "transportProtocol");
            v18 = off_24E7626E0;
            if (v20 == 2)
              v18 = off_24E7626D8;
          }
        }
        -[__objc2_class ruleFromFirewallRuleLAN:](*v18, "ruleFromFirewallRuleLAN:", v16);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          -[HMDNetworkRouterLANFirewallConfiguration ruleList](v4, "ruleList");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addTo:", v23);

          goto LABEL_17;
        }
LABEL_14:
        v24 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = v12;
          v27 = v14;
          v28 = p_superclass;
          v29 = v9;
          v30 = v4;
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v31;
          v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert LAN rule to TLV, skipping: %@", buf, 0x16u);

          v4 = v30;
          v9 = v29;
          p_superclass = v28;
          v14 = v27;
          v12 = v26;
          v11 = v34;
        }

        objc_autoreleasePoolPop(v24);
LABEL_17:
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (!v11)
      {
LABEL_19:

        v3 = v33;
        break;
      }
    }
  }

  return v4;
}

- (HMDNetworkRouterLANFirewallConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterLANFirewallConfiguration;
  return -[HMDNetworkRouterLANFirewallConfiguration init](&v3, sel_init);
}

- (HMDNetworkRouterLANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterLANFirewallConfiguration *v9;
  HMDNetworkRouterLANFirewallConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterLANFirewallConfiguration;
  v9 = -[HMDNetworkRouterLANFirewallConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_ruleList, a4);
  }

  return v10;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  HMDNetworkRouterLANFirewallConfiguration *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (!v9)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_26;
  }
  v22 = self;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = v8 + v9;
  do
  {
    v29 = 0;
    v27 = 0;
    v28 = 0;
    v25 = 0;
    v26 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
    {
      if (a4)
      {
        HMErrorFromOSStatus();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
LABEL_23:
      v19 = 0;
      goto LABEL_27;
    }
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v20;
      if (!v20)
        goto LABEL_25;
LABEL_17:
      if (a4)
      {
        v18 = objc_retainAutorelease(v12);
        v12 = v18;
LABEL_22:
        v19 = 0;
        *a4 = v18;
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (v29 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v15 = &v23;
      +[HMDNetworkRouterLANFirewallRuleList parsedFromData:error:](HMDNetworkRouterLANFirewallRuleList, "parsedFromData:error:", v14, &v23);
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v29 != 1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      v15 = &v24;
      +[HMDNetworkRouterLANFirewall parsedFromData:error:](HMDNetworkRouterLANFirewall, "parsedFromData:error:", v14, &v24);
      v16 = v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = *v15;

    v12 = v17;
LABEL_13:
    if (v27)
      free(v27);
  }
  while (v25 != v13);
  if (v12)
    goto LABEL_17;
LABEL_25:
  self = v22;
LABEL_26:
  -[HMDNetworkRouterLANFirewallConfiguration setType:](self, "setType:", v11, v22);
  -[HMDNetworkRouterLANFirewallConfiguration setRuleList:](self, "setRuleList:", v10);
  v12 = 0;
  v19 = 1;
LABEL_27:

  return v19;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
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
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v6, "serializeWithError:", &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;

    if (v8)
      goto LABEL_6;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    v10 = TLV8BufferAppend();

    if (v10)
    {
LABEL_9:
      if (a3)
      {
        HMErrorFromOSStatus();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v8 = 0;
        goto LABEL_11;
      }
      v8 = 0;
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
  }
  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v12, "serializeWithError:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (!v8)
  {
    v14 = objc_retainAutorelease(v7);
    objc_msgSend(v14, "bytes");
    objc_msgSend(v14, "length");
    v15 = TLV8BufferAppend();

    if (v15)
      goto LABEL_9;
    goto LABEL_12;
  }
LABEL_6:

  if (!a3)
    goto LABEL_14;
  v13 = objc_retainAutorelease(v8);
  v8 = v13;
LABEL_11:
  v16 = 0;
  *a3 = v13;
LABEL_15:
  TLV8BufferFree();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterLANFirewallConfiguration *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterLANFirewallConfiguration *v7;

  v4 = +[HMDNetworkRouterLANFirewallConfiguration allocWithZone:](HMDNetworkRouterLANFirewallConfiguration, "allocWithZone:", a3);
  -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterLANFirewallConfiguration initWithType:ruleList:](v4, "initWithType:ruleList:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterLANFirewallConfiguration *v5;
  HMDNetworkRouterLANFirewallConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterLANFirewallConfiguration *)a3;
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
      -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallConfiguration type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallConfiguration type](v6, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallConfiguration ruleList](v6, "ruleList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallConfiguration ruleList](v6, "ruleList");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDNetworkRouterLANFirewallConfiguration type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallConfiguration ruleList](self, "ruleList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterLANFirewallConfiguration type=%@, ruleList=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HMDNetworkRouterLANFirewall)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (HMDNetworkRouterLANFirewallRuleList)ruleList
{
  return self->_ruleList;
}

- (void)setRuleList:(id)a3
{
  objc_storeStrong((id *)&self->_ruleList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleList, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterLANFirewallConfiguration *v6;
  HMDNetworkRouterLANFirewallConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterLANFirewallConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterLANFirewallConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
