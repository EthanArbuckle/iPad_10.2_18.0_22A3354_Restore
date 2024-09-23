@implementation HMDNetworkRouterHomeKitOnlyFirewallConfiguration

- (HMDNetworkRouterHomeKitOnlyFirewallConfiguration)initWithAccessory:(id)a3 sourceConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(void *, id);
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDNetworkRouterHomeKitOnlyFirewallConfiguration *v27;
  void *context;
  id v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;
  void (**v34)(void *, id);
  _QWORD aBlock[6];
  _QWORD v36[4];
  void (**v37)(void *, id);
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  unsigned __int8 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v6 = a4;
  v46 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (v6)
  {
    objc_msgSend(v6, "accessoryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastModifiedTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lanRules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_20;
    objc_msgSend(v6, "lanRules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke;
    v36[3] = &unk_24E7871C8;
    v37 = v7;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

    LODWORD(v10) = 0;
    v12 = v37;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "fallbackIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_2;
    aBlock[3] = &unk_24E7871F0;
    aBlock[4] = &v42;
    aBlock[5] = &v38;
    v12 = (void (**)(void *, id))_Block_copy(aBlock);
    v14 = v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v12[2](v12, v16);
      objc_msgSend(v16, "identifiersForBridgedAccessories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v13;
      v32[1] = 3221225472;
      v32[2] = __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_3;
      v32[3] = &unk_24E787218;
      v33 = v16;
      v34 = v12;
      objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);

      if (*((_BYTE *)v43 + 24))
      {
        context = (void *)MEMORY[0x227676638]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v20;
          v49 = 2112;
          v50 = CFSTR("RTP");
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding fallback LAN rules for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend((id)objc_opt_class(), "fallbackConfigurationForRuleset:", CFSTR("RTP"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        addFallbackLANRules(&v46, v7, v21);

      }
      if (*((_BYTE *)v39 + 24))
      {
        context = (void *)MEMORY[0x227676638]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v24;
          v49 = 2112;
          v50 = CFSTR("HDS");
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Adding fallback LAN rules for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend((id)objc_opt_class(), "fallbackConfigurationForRuleset:", CFSTR("HDS"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        addFallbackLANRules(&v46, v7, v25);

      }
      LODWORD(v10) = v46;
    }
    else
    {
      LODWORD(v10) = 0;
    }

  }
LABEL_20:
  v26 = (void *)objc_msgSend(v7, "copy", context);
  v31.receiver = self;
  v31.super_class = (Class)HMDNetworkRouterHomeKitOnlyFirewallConfiguration;
  v27 = -[HMDNetworkRouterFirewallRuleConfiguration initWithAccessoryIdentifier:lastModifiedTime:fullAccessLAN:lanRules:fullAccessWAN:wanRules:](&v31, sel_initWithAccessoryIdentifier_lastModifiedTime_fullAccessLAN_lanRules_fullAccessWAN_wanRules_, v8, v9, (_DWORD)v10 != 0, v26, 0, MEMORY[0x24BDBD1A8]);

  if (v27)
  {
    v27->_isFiltered = v6 != 0;
    v27->_useFallbackForRTP = *((_BYTE *)v43 + 24);
    v27->_useFallbackForHDS = *((_BYTE *)v39 + 24);
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v27;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (self->_isFiltered)
  {
    -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN");
    HMFBooleanToString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleConfiguration lanRules](self, "lanRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[HMDNetworkRouterFirewallRuleConfiguration wanRules](self, "wanRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<HomeKitOnly filtered Full LAN = %@, # LAN rules = %lu, # WAN rules = %lu>"), v4, v6, objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HMFBooleanToString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<HomeKitOnly synthetic RTP = %@, HDS = %@>"), v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isRequiredForHAPFunctionality"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *MEMORY[0x24BDD6B68];
  v4 = a2;
  objc_msgSend(v4, "findServiceWithServiceType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_msgSend(v4, "findServiceWithServiceType:", CFSTR("00000129-0000-1000-8000-0026BB765291"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __90__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_initWithAccessory_sourceConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v9 = v7;

  v8 = v9;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = v9;
  }

}

+ (id)fallbackIdentifier
{
  void *v2;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithMajorVersion:minorVersion:updateVersion:", 0, 0, 0);
  v3 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", CFSTR("00000000"), CFSTR("00000000"), v2);

  return v3;
}

+ (id)fallbackConfigurationForRuleset:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = fallbackConfigurationForRuleset__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&fallbackConfigurationForRuleset__once, block);
  objc_msgSend((id)fallbackConfigurationForRuleset__fallback, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("NetworkProtectionRules"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke_15;
      v21 = &unk_24E7871A0;
      v6 = *(_QWORD *)(a1 + 32);
      v22 = v5;
      v23 = v6;
      v7 = v5;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v18);
      v8 = objc_msgSend(v7, "copy", v18, v19, v20, v21);
      v9 = (void *)fallbackConfigurationForRuleset__fallback;
      fallbackConfigurationForRuleset__fallback = v8;

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to load fallback network protection rules", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to locate fallback network protection rules", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

void __84__HMDNetworkRouterHomeKitOnlyFirewallConfiguration_fallbackConfigurationForRuleset___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  HMDNetworkRouterFirewallRuleConfiguration *v14;
  void *v15;
  HMDNetworkRouterFirewallRuleConfiguration *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13
    || (v14 = [HMDNetworkRouterFirewallRuleConfiguration alloc],
        objc_msgSend(*(id *)(a1 + 40), "fallbackIdentifier"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = -[HMDNetworkRouterFirewallRuleConfiguration initWithAccessoryIdentifier:jsonDictionary:](v14, "initWithAccessoryIdentifier:jsonDictionary:", v15, v12), v15, !v16))
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v20;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse fallback network protection rules for '%@'", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v9);

  }
}

@end
