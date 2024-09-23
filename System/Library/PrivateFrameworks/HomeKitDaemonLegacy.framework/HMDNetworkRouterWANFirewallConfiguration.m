@implementation HMDNetworkRouterWANFirewallConfiguration

+ (HMDNetworkRouterWANFirewallConfiguration)configurationWithFullAccess
{
  HMDNetworkRouterWANFirewallConfiguration *v2;
  HMDNetworkRouterWANFirewall *v3;
  HMDNetworkRouterWANFirewallRuleList *v4;

  v2 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  v3 = -[HMDNetworkRouterWANFirewall initWithType:]([HMDNetworkRouterWANFirewall alloc], "initWithType:", 0);
  -[HMDNetworkRouterWANFirewallConfiguration setType:](v2, "setType:", v3);

  v4 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
  -[HMDNetworkRouterWANFirewallConfiguration setRuleList:](v2, "setRuleList:", v4);

  return v2;
}

+ (id)configurationFromFirewallRuleConfiguration:(id)a3
{
  id v3;
  HMDNetworkRouterWANFirewallConfiguration *v4;
  int v5;
  char v6;
  HMDNetworkRouterWANFirewall *v7;
  HMDNetworkRouterWANFirewallRuleList *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDNetworkRouterWANICMPRule *v54;
  HMDNetworkRouterWANICMPRule *v55;
  uint64_t v56;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  HMDNetworkRouterWANFirewallConfiguration *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  HMDNetworkRouterWANFirewallConfiguration *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  _BYTE buf[24];
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  v5 = objc_msgSend(v3, "hasFullAccessToWAN");
  v6 = v5;
  v7 = -[HMDNetworkRouterWANFirewall initWithType:]([HMDNetworkRouterWANFirewall alloc], "initWithType:", v5 ^ 1u);
  v63 = v4;
  -[HMDNetworkRouterWANFirewallConfiguration setType:](v4, "setType:", v7);

  if ((v6 & 1) == 0)
  {
    v8 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
    -[HMDNetworkRouterWANFirewallConfiguration setRuleList:](v4, "setRuleList:", v8);

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v58 = v3;
    objc_msgSend(v3, "wanRules");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (!v66)
      goto LABEL_35;
    v65 = *(_QWORD *)v74;
    v9 = 0x1E0D16000uLL;
    v10 = 0x1E0CB3000uLL;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v74 != v65)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * v11);
        if (objc_msgSend(v12, "transportProtocol") == 2)
        {
          objc_msgSend(v12, "icmpTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDNetworkRouterICMPTypeList typeListFromICMPTypes:](HMDNetworkRouterICMPTypeList, "typeListFromICMPTypes:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            goto LABEL_13;
          v15 = 0;
          v16 = 0;
          v70 = 0;
        }
        else
        {
          +[HMDNetworkRouterProtocol protocolFromTransportProtocol:](HMDNetworkRouterProtocol, "protocolFromTransportProtocol:", objc_msgSend(v12, "transportProtocol"));
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
LABEL_13:

            goto LABEL_24;
          }
          v15 = (void *)v17;
          v18 = objc_alloc(*(Class *)(v9 + 1552));
          objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedShort:", objc_msgSend(v12, "portStart"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v18, "initWithValue:", v19);

          LODWORD(v18) = objc_msgSend(v12, "portStart");
          if ((_DWORD)v18 == objc_msgSend(v12, "portEnd"))
          {
            v70 = 0;
          }
          else
          {
            v20 = objc_alloc(*(Class *)(v9 + 1552));
            objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedShort:", objc_msgSend(v12, "portEnd"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (void *)objc_msgSend(v20, "initWithValue:", v21);

          }
          v14 = 0;
        }
        objc_msgSend(v12, "subject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hostnames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = v16;
        v69 = v15;
        v67 = v14;
        if (v23)
        {
          objc_msgSend(v22, "hostnames");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v14;
          v26 = v15;
          v27 = v16;
          v28 = v70;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __HMDNetworkRouterWANRulesFromHostNames_block_invoke;
          v79 = &unk_1E89AC548;
          v80 = v25;
          v81 = v26;
          v82 = v27;
          v83 = v28;
          v84 = v29;
          v30 = v25;
          v31 = v26;
          v32 = v27;
          v33 = v28;
          v34 = v29;
          objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
          v35 = (void *)objc_msgSend(v34, "copy");

          v9 = 0x1E0D16000;
          v10 = 0x1E0CB3000;

          goto LABEL_20;
        }
        objc_msgSend(v22, "addresses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v22, "addresses");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v14;
          v38 = v15;
          v39 = v16;
          v40 = v70;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __HMDNetworkRouterWANRulesFromAddresses_block_invoke;
          v79 = &unk_1E89AC570;
          v80 = v37;
          v81 = v38;
          v82 = v39;
          v83 = v40;
          v84 = v41;
          v61 = v37;
          v31 = v38;
          v32 = v39;
          v42 = v40;
          v9 = 0x1E0D16000;
          v43 = v42;
          v44 = v41;
          objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
          v35 = (void *)objc_msgSend(v44, "copy");

          v10 = 0x1E0CB3000;
LABEL_20:

LABEL_21:
          v16 = v68;
          v15 = v69;
          v14 = v67;
          goto LABEL_22;
        }
        objc_msgSend(v22, "addressRange");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v22, "addressRange");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v14;
          v62 = v15;
          v60 = v16;
          v59 = v70;
          objc_msgSend(v24, "addressStart");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:allowWildcard:](HMDNetworkRouterIPAddress, "ipAddressFromRuleAddress:allowWildcard:", v49, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addressEnd");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:allowWildcard:](HMDNetworkRouterIPAddress, "ipAddressFromRuleAddress:allowWildcard:", v51, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = v48;
          if (v48)
            v54 = -[HMDNetworkRouterWANICMPRule initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:]([HMDNetworkRouterWANICMPRule alloc], "initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:", 0, v50, v52, v48);
          else
            v54 = -[HMDNetworkRouterWANPortRule initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:]([HMDNetworkRouterWANPortRule alloc], "initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:", v62, 0, v50, v52, v60, v59);
          v55 = v54;
          *(_QWORD *)buf = v54;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = 0x1E0CB3000;
          goto LABEL_21;
        }
LABEL_22:

        if (v35)
        {
          v71[0] = MEMORY[0x1E0C809B0];
          v71[1] = 3221225472;
          v71[2] = __98__HMDNetworkRouterWANFirewallConfiguration_Additions__configurationFromFirewallRuleConfiguration___block_invoke;
          v71[3] = &unk_1E89AC520;
          v72 = v63;
          objc_msgSend(v35, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v71);

          goto LABEL_27;
        }
LABEL_24:
        v45 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v47;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v12;
          _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert WAN rule to TLV, skipping: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v45);
        v35 = 0;
LABEL_27:

        ++v11;
      }
      while (v66 != v11);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      v66 = v56;
      if (!v56)
      {
LABEL_35:

        v3 = v58;
        break;
      }
    }
  }

  return v63;
}

void __98__HMDNetworkRouterWANFirewallConfiguration_Additions__configurationFromFirewallRuleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "ruleList");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTo:", v4);

}

- (HMDNetworkRouterWANFirewallConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANFirewallConfiguration;
  return -[HMDNetworkRouterWANFirewallConfiguration init](&v3, sel_init);
}

- (HMDNetworkRouterWANFirewallConfiguration)initWithType:(id)a3 ruleList:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterWANFirewallConfiguration *v9;
  HMDNetworkRouterWANFirewallConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterWANFirewallConfiguration;
  v9 = -[HMDNetworkRouterWANFirewallConfiguration init](&v12, sel_init);
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
  HMDNetworkRouterWANFirewallConfiguration *v22;
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
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
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
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v15 = &v23;
      +[HMDNetworkRouterWANFirewallRuleList parsedFromData:error:](HMDNetworkRouterWANFirewallRuleList, "parsedFromData:error:", v14, &v23);
      v16 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v29 != 1)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v12;
      v15 = &v24;
      +[HMDNetworkRouterWANFirewall parsedFromData:error:](HMDNetworkRouterWANFirewall, "parsedFromData:error:", v14, &v24);
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
  -[HMDNetworkRouterWANFirewallConfiguration setType:](self, "setType:", v11, v22);
  -[HMDNetworkRouterWANFirewallConfiguration setRuleList:](self, "setRuleList:", v10);
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

  v41 = *MEMORY[0x1E0C80C00];
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
  -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
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
  -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_15;
  }
  -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
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
  HMDNetworkRouterWANFirewallConfiguration *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterWANFirewallConfiguration *v7;

  v4 = +[HMDNetworkRouterWANFirewallConfiguration allocWithZone:](HMDNetworkRouterWANFirewallConfiguration, "allocWithZone:", a3);
  -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterWANFirewallConfiguration initWithType:ruleList:](v4, "initWithType:ruleList:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterWANFirewallConfiguration *v5;
  HMDNetworkRouterWANFirewallConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterWANFirewallConfiguration *)a3;
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
      -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterWANFirewallConfiguration type](v6, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterWANFirewallConfiguration type](v6, "type");
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
      -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterWANFirewallConfiguration ruleList](v6, "ruleList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterWANFirewallConfiguration ruleList](v6, "ruleList");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDNetworkRouterWANFirewallConfiguration type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterWANFirewallConfiguration ruleList](self, "ruleList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterWANFirewallConfiguration type=%@, ruleList=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HMDNetworkRouterWANFirewall)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (HMDNetworkRouterWANFirewallRuleList)ruleList
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
  HMDNetworkRouterWANFirewallConfiguration *v6;
  HMDNetworkRouterWANFirewallConfiguration *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterWANFirewallConfiguration);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterWANFirewallConfiguration parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
