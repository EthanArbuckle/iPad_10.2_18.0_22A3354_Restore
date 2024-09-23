@implementation HMDNetworkRouterFirewallRuleICMPType

- (HMDNetworkRouterFirewallRuleICMPType)initWithJSONDictionary:(id)a3 protocol:(unsigned __int8)a4 typeValue:(id)a5
{
  id v9;
  id v10;
  HMDNetworkRouterFirewallRuleICMPType *v11;
  HMDNetworkRouterFirewallRuleICMPType *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDNetworkRouterFirewallRuleICMPType;
  v11 = -[HMDNetworkRouterFirewallRuleICMPType init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_jsonDictionary, a3);
    v12->_protocol = a4;
    objc_storeStrong((id *)&v12->_typeValue, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleICMPType *v4;
  HMDNetworkRouterFirewallRuleICMPType *v5;
  HMDNetworkRouterFirewallRuleICMPType *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMDNetworkRouterFirewallRuleICMPType *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_9;
    v7 = -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol");
    if (v7 != -[HMDNetworkRouterFirewallRuleICMPType protocol](v6, "protocol"))
      goto LABEL_9;
    -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleICMPType typeValue](v6, "typeValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if (v10)
    {
      -[HMDNetworkRouterFirewallRuleICMPType jsonDictionary](self, "jsonDictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleICMPType jsonDictionary](v6, "jsonDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol");
  -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue") ^ v3;

  -[HMDNetworkRouterFirewallRuleICMPType jsonDictionary](self, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (NSDictionary)prettyJSONDictionary
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  v4 = -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol");
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = CFSTR("IPv6");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%d)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("IPv4");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("protocol"));

  -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v8;
}

- (id)description
{
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 8);
  v4 = -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol");
  if (v4 == 1)
  {
    v5 = CFSTR("v6:");
    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = CFSTR("v4:");
LABEL_5:
    objc_msgSend(v3, "appendString:", v5);
    goto LABEL_7;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%d:"), -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol"));
LABEL_7:
  -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDNetworkRouterFirewallRuleICMPType typeValue](self, "typeValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%d"), objc_msgSend(v7, "unsignedIntValue"));

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("*"));
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (unsigned)protocol
{
  return self->_protocol;
}

- (NSNumber)typeValue
{
  return self->_typeValue;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_typeValue, 0);
}

+ (id)createWithJSONDictionary:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v5 = decodeUnsignedIntegerFromJSONDictionary(v4, CFSTR("p"), 1, 0xFFuLL, &v18);
  v6 = v18;
  v7 = v6;
  v8 = 0;
  if (v5)
  {
    if (objc_msgSend(v6, "unsignedCharValue") > 1)
    {
      v12 = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v20 = v15;
        v21 = 2112;
        v22 = CFSTR("p");
        v23 = 2112;
        v24 = v4;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      v8 = 0;
    }
    else
    {
      v9 = objc_msgSend(v7, "unsignedCharValue");
      v17 = 0;
      v10 = decodeUnsignedIntegerFromJSONDictionary(v4, CFSTR("t"), 0, 0xFFuLL, &v17);
      v11 = v17;
      v8 = 0;
      if ((v10 & 1) != 0)
        v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithJSONDictionary:protocol:typeValue:", v4, v9, v11);

    }
  }

  return v8;
}

+ (id)createListWithJSONDictionary:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10 && !objc_msgSend(v10, "hmf_isEmpty"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      v32 = v7;
LABEL_11:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v21);
        objc_opt_class();
        v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
        v24 = v23;

        if (!v24)
          break;
        +[HMDNetworkRouterFirewallRuleICMPType createWithJSONDictionary:](HMDNetworkRouterFirewallRuleICMPType, "createWithJSONDictionary:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {

          v7 = v32;
LABEL_26:

          v15 = 0;
          goto LABEL_27;
        }
        v26 = (void *)v25;
        objc_msgSend(v16, "addObject:", v25);

        if (v19 == ++v21)
        {
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          v7 = v32;
          if (v19)
            goto LABEL_11;
          goto LABEL_21;
        }
      }
      v27 = (void *)MEMORY[0x227676638]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      v7 = v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v30;
        v40 = 2112;
        v41 = v32;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      goto LABEL_26;
    }
LABEL_21:

    v15 = (void *)objc_msgSend(v16, "copy");
LABEL_27:

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v14;
      v40 = 2112;
      v41 = v7;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = 0;
  }

  return v15;
}

@end
