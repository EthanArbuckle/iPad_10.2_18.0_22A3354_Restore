@implementation HMDNetworkRouterFirewallRuleConfiguration

- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 lastModifiedTime:(id)a4 fullAccessLAN:(BOOL)a5 lanRules:(id)a6 fullAccessWAN:(BOOL)a7 wanRules:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HMDNetworkRouterFirewallRuleConfiguration *v18;
  HMDNetworkRouterFirewallRuleConfiguration *v19;
  HMDNetworkRouterFirewallRuleConfiguration *v20;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleConfiguration;
  v18 = -[HMDNetworkRouterFirewallRuleConfiguration init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v19->_lastModifiedTime, a4);
    v19->_fullAccessLAN = a5;
    objc_storeStrong((id *)&v19->_lanRules, a6);
    v19->_fullAccessWAN = a7;
    objc_storeStrong((id *)&v19->_wanRules, a8);
    v20 = v19;
  }

  return v19;
}

- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleConfiguration *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firmwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v24 = 0;
    v9 = decodeTimeFromJSONDictionary(v7, CFSTR("t"), &v24);
    v10 = v24;
    if (v9)
    {
      v23 = 0;
      v11 = objc_msgSend((id)objc_opt_class(), "__decodeNetworkDeclarationsFromJSONDictionary:networkDeclarations:", v7, &v23);
      v12 = v23;
      if (v11
        && (buf[0] = 0,
            objc_msgSend((id)objc_opt_class(), "__decodeFullAccessFromNetworkDeclarations:key:fullAccess:", v12, CFSTR("l"), buf)))
      {
        v13 = (void *)objc_opt_class();
        objc_msgSend(v13, "__decodeRulesFromNetworkDeclarations:key:class:required:", v12, CFSTR("m"), objc_opt_class(), buf[0] == 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14
          && (v22 = 0,
              objc_msgSend((id)objc_opt_class(), "__decodeFullAccessFromNetworkDeclarations:key:fullAccess:", v12, CFSTR("w"), &v22)))
        {
          v15 = (void *)objc_opt_class();
          objc_msgSend(v15, "__decodeRulesFromNetworkDeclarations:key:class:required:", v12, CFSTR("x"), objc_opt_class(), v22 == 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            self = -[HMDNetworkRouterFirewallRuleConfiguration initWithAccessoryIdentifier:lastModifiedTime:fullAccessLAN:lanRules:fullAccessWAN:wanRules:](self, "initWithAccessoryIdentifier:lastModifiedTime:fullAccessLAN:lanRules:fullAccessWAN:wanRules:", v6, v10, buf[0], v14, v22, v16);
            v17 = self;
          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    self = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Network declaration must contain firmware version: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleConfiguration *v4;
  HMDNetworkRouterFirewallRuleConfiguration *v5;
  HMDNetworkRouterFirewallRuleConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  char v15;
  void *v17;
  void *v18;

  v4 = (HMDNetworkRouterFirewallRuleConfiguration *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDNetworkRouterFirewallRuleConfiguration accessoryIdentifier](self, "accessoryIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleConfiguration accessoryIdentifier](v6, "accessoryIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleConfiguration lanRules](v6, "lanRules");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToArray:", v10))
        {
          -[HMDNetworkRouterFirewallRuleConfiguration wanRules](self, "wanRules");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNetworkRouterFirewallRuleConfiguration wanRules](v6, "wanRules");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToArray:", v12)
            && (v13 = -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN"),
                v13 == -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](v6, "hasFullAccessToLAN"))
            && (v14 = -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN"),
                v14 == -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](v6, "hasFullAccessToWAN")))
          {
            -[HMDNetworkRouterFirewallRuleConfiguration lastModifiedTime](self, "lastModifiedTime");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDNetworkRouterFirewallRuleConfiguration lastModifiedTime](v6, "lastModifiedTime");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v18, "isEqual:", v17);

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HMDNetworkRouterFirewallRuleConfiguration accessoryIdentifier](self, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDNetworkRouterFirewallRuleConfiguration wanRules](self, "wanRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  v9 = -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN");
  v10 = v8 ^ v9 ^ -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN");
  -[HMDNetworkRouterFirewallRuleConfiguration lastModifiedTime](self, "lastModifiedTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleConfiguration accessoryIdentifier](self, "accessoryIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("AccessoryIdentifier"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleConfiguration lastModifiedTime](self, "lastModifiedTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("LastModifiedTime"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("FullAccessLAN"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("FullAccessWAN"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("LANRules"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDNetworkRouterFirewallRuleConfiguration wanRules](self, "wanRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("WANRules"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[8];

  v24[6] = *MEMORY[0x24BDAC8D0];
  +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:](HMDNetworkRouterClientConfiguration, "configurationForFirewallConfiguration:hapAccessory:airplayAccessory:withClientIdentifier:", self, 1, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fingerprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR("lastModifiedTime");
  -[HMDNetworkRouterFirewallRuleConfiguration lastModifiedTime](self, "lastModifiedTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v23[1] = CFSTR("lanRules");
  -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "na_map:", &__block_literal_global_37_239446);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v19, "copy");
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v5;
  v23[2] = CFSTR("hasFullAccessToLAN");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  v23[3] = CFSTR("wanRules");
  -[HMDNetworkRouterFirewallRuleConfiguration wanRules](self, "wanRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_44_239451);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v11;
  v23[4] = CFSTR("hasFullAccessToWAN");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v12;
  v23[5] = CFSTR("fingerprint");
  v13 = v4;
  objc_msgSend(v4, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v10)
  if (!v6)

  return (NSDictionary *)v18;
}

- (BOOL)hasAirplayRules
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        if (v8)
        {
          v9 = objc_msgSend(v8, "direction");
          v10 = objc_msgSend(v8, "advertisingProtocol");
          objc_msgSend(v8, "serviceType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", CFSTR("airplay"));

          v13 = v9 == 1 && v10 == 0;
          if (v13 && v12 != 0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_20;
          }
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }
LABEL_20:

  return v3;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSDate)lastModifiedTime
{
  return self->_lastModifiedTime;
}

- (NSArray)lanRules
{
  return self->_lanRules;
}

- (BOOL)hasFullAccessToLAN
{
  return self->_fullAccessLAN;
}

- (NSArray)wanRules
{
  return self->_wanRules;
}

- (BOOL)hasFullAccessToWAN
{
  return self->_fullAccessWAN;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wanRules, 0);
  objc_storeStrong((id *)&self->_lanRules, 0);
  objc_storeStrong((id *)&self->_lastModifiedTime, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

uint64_t __65__HMDNetworkRouterFirewallRuleConfiguration_prettyJSONDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prettyJSONDictionary");
}

uint64_t __65__HMDNetworkRouterFirewallRuleConfiguration_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prettyJSONDictionary");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_239510 != -1)
    dispatch_once(&logCategory__hmf_once_t0_239510, &__block_literal_global_239511);
  return (id)logCategory__hmf_once_v1_239512;
}

+ (BOOL)__decodeNetworkDeclarationsFromJSONDictionary:(id)a3 networkDeclarations:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  id v19;
  int v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = CFSTR("n");
      v25 = 2112;
      v26 = v6;
      v18 = "%{public}@JSON contains no '%@' value: %@";
LABEL_11:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, 0x20u);

    }
LABEL_12:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_13;
  }
  v9 = v7;
  objc_opt_class();
  v10 = objc_opt_isKindOfClass() & 1;
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  v12 = objc_retainAutorelease(v11);

  *a4 = v12;
  if (!v10)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = CFSTR("n");
      v25 = 2112;
      v26 = v6;
      v18 = "%{public}@JSON contains an invalid '%@' value: %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

+ (BOOL)__decodeFullAccessFromNetworkDeclarations:(id)a3 key:(id)a4 fullAccess:(BOOL *)a5
{
  id v8;
  id v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v20 = 0;
  v10 = decodeUnsignedIntegerFromJSONDictionary(v8, v9, 1, 0xFFuLL, &v20);
  v11 = v20;
  v12 = v11;
  if (!v10)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v13 = objc_msgSend(v11, "unsignedIntegerValue");
  if (v13 == 1)
  {
    *a5 = 0;
    v14 = 1;
    goto LABEL_10;
  }
  if (v13)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid '%@' value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    goto LABEL_9;
  }
  v14 = 1;
  *a5 = 1;
LABEL_10:

  return v14;
}

+ (id)__decodeRulesFromNetworkDeclarations:(id)a3 key:(id)a4 class:(Class)a5 required:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v6 = a6;
  v62 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
    objc_opt_class();
    v15 = objc_opt_isKindOfClass() & 1;
    if (v15)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    if (v15)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v18)
      {
        v19 = v18;
        v46 = a1;
        v47 = v13;
        v20 = 0;
        v21 = *(_QWORD *)v52;
        v48 = v11;
        v49 = v10;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v17);
            v23 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
            v25 = v24;

            if (!v25)
            {
              v41 = (void *)MEMORY[0x227676638]();
              v42 = v46;
              HMFGetOSLogHandle();
              v43 = objc_claimAutoreleasedReturnValue();
              v11 = v48;
              v10 = v49;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v57 = v44;
                v58 = 2112;
                v59 = v48;
                v60 = 2112;
                v61 = v49;
                _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid rule in '%@' value: %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v41);
              v33 = 0;
              v39 = v17;
              goto LABEL_41;
            }
            v50 = 0;
            -[objc_class createWithJSONDictionary:error:](a5, "createWithJSONDictionary:error:", v25, &v50);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v50;
            v28 = v27;
            if (v26)
            {
              if (v20)
              {
                objc_msgSend(v20, "addObject:", v26);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v26);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else if (!objc_msgSend(v27, "isHMError") || objc_msgSend(v28, "code") != 1070)
            {

              v33 = 0;
              v39 = v17;
              v11 = v48;
              v10 = v49;
LABEL_41:
              v13 = v47;
              goto LABEL_42;
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          v11 = v48;
          v10 = v49;
          v13 = v47;
          if (v19)
            continue;
          break;
        }
      }
      else
      {
        v20 = 0;
      }

      v38 = objc_msgSend(v20, "copy");
      v39 = (void *)v38;
      v40 = (void *)MEMORY[0x24BDBD1A8];
      if (v38)
        v40 = (void *)v38;
      v33 = v40;
LABEL_42:

    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v57 = v37;
        v58 = 2112;
        v59 = v11;
        v60 = 2112;
        v61 = v10;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid '%@' value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      v33 = 0;
    }

  }
  else if (v6)
  {
    v29 = (void *)MEMORY[0x227676638]();
    v30 = a1;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v32;
      v58 = 2112;
      v59 = v11;
      v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains no '%@' value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    v33 = 0;
  }
  else
  {
    v33 = (id)MEMORY[0x24BDBD1A8];
  }

  return v33;
}

void __56__HMDNetworkRouterFirewallRuleConfiguration_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_239512;
  logCategory__hmf_once_v1_239512 = v0;

}

@end
