@implementation HMDNetworkRouterWANFirewallRuleList

- (HMDNetworkRouterWANFirewallRuleList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterWANFirewallRuleList;
  return -[HMDNetworkRouterWANFirewallRuleList init](&v3, sel_init);
}

- (HMDNetworkRouterWANFirewallRuleList)initWithPortRules:(id)a3 icmpRules:(id)a4
{
  id v7;
  id v8;
  HMDNetworkRouterWANFirewallRuleList *v9;
  HMDNetworkRouterWANFirewallRuleList *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterWANFirewallRuleList;
  v9 = -[HMDNetworkRouterWANFirewallRuleList init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_portRules, a3);
    objc_storeStrong((id *)&v10->_icmpRules, a4);
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
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  HMDNetworkRouterWANFirewallRuleList *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_27:
    if (objc_msgSend(v10, "count", v24))
      v21 = v10;
    else
      v21 = 0;
    -[HMDNetworkRouterWANFirewallRuleList setPortRules:](self, "setPortRules:", v21);
    if (objc_msgSend(v11, "count"))
      v22 = v11;
    else
      v22 = 0;
    -[HMDNetworkRouterWANFirewallRuleList setIcmpRules:](self, "setIcmpRules:", v22);
    v12 = 0;
    v20 = 1;
    goto LABEL_35;
  }
  v24 = self;
  v12 = 0;
  v13 = v8 + v9;
  while (1)
  {
    v31 = 0;
    v29 = 0;
    v30 = 0;
    v27 = 0;
    v28 = 0;
    if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      break;
    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v19;
LABEL_23:
      self = v24;
      if (!v12)
        goto LABEL_27;
      if (a4)
      {
        v18 = objc_retainAutorelease(v12);
        v12 = v18;
        goto LABEL_26;
      }
      goto LABEL_34;
    }
    if (v31 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      +[HMDNetworkRouterWANICMPRule parsedFromData:error:](HMDNetworkRouterWANICMPRule, "parsedFromData:error:", v14, &v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v25;

      if (!v16)
      {
        v17 = v11;
LABEL_14:
        objc_msgSend(v17, "addObject:", v15, v24);
      }
LABEL_15:

      v12 = v16;
      goto LABEL_16;
    }
    if (v31 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      +[HMDNetworkRouterWANPortRule parsedFromData:error:](HMDNetworkRouterWANPortRule, "parsedFromData:error:", v14, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v26;

      if (!v16)
      {
        v17 = v10;
        goto LABEL_14;
      }
      goto LABEL_15;
    }
LABEL_16:
    if (v29)
      free(v29);
    if (v27 == v13)
      goto LABEL_23;
  }
  if (a4)
  {
    HMErrorFromOSStatus();
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
    v20 = 0;
    *a4 = v18;
    goto LABEL_35;
  }
LABEL_34:
  v20 = 0;
LABEL_35:

  return v20;
}

- (id)serializeWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  TLV8BufferInit();
  v37 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  -[HMDNetworkRouterWANFirewallRuleList portRules](self, "portRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v35;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
      if ((v8 & 1) != 0)
      {
        if (TLV8BufferAppend())
          break;
      }
      v33 = 0;
      objc_msgSend(v11, "serializeWithError:", &v33);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v33;
      if (v13)
      {
LABEL_24:
        v25 = v13;

        if (!a3)
          goto LABEL_30;
        v26 = objc_retainAutorelease(v25);
        v25 = v26;
        goto LABEL_28;
      }
      v14 = objc_retainAutorelease(v12);
      objc_msgSend(v14, "bytes");
      objc_msgSend(v14, "length");
      v15 = TLV8BufferAppend();

      if (v15)
        break;
      ++v10;
      v8 = 1;
      if (v7 == v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HMDNetworkRouterWANFirewallRuleList icmpRules](self, "icmpRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (!v16)
    {
LABEL_23:

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      goto LABEL_31;
    }
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v30;
LABEL_14:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v5);
      v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v20);
      if ((v18 & 1) != 0)
      {
        if (TLV8BufferAppend())
          break;
      }
      v28 = 0;
      objc_msgSend(v21, "serializeWithError:", &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v28;
      if (v13)
        goto LABEL_24;
      v22 = objc_retainAutorelease(v12);
      objc_msgSend(v22, "bytes");
      objc_msgSend(v22, "length");
      v23 = TLV8BufferAppend();

      if (v23)
        break;
      ++v20;
      v18 = 1;
      if (v17 == v20)
      {
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v17)
          goto LABEL_14;
        goto LABEL_23;
      }
    }
  }

  if (a3)
  {
    HMErrorFromOSStatus();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
LABEL_28:
    v24 = 0;
    *a3 = v26;
  }
  else
  {
    v25 = 0;
LABEL_30:
    v24 = 0;
  }
LABEL_31:
  TLV8BufferFree();

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterWANFirewallRuleList *v4;
  void *v5;
  void *v6;
  HMDNetworkRouterWANFirewallRuleList *v7;

  v4 = +[HMDNetworkRouterWANFirewallRuleList allocWithZone:](HMDNetworkRouterWANFirewallRuleList, "allocWithZone:", a3);
  -[HMDNetworkRouterWANFirewallRuleList portRules](self, "portRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterWANFirewallRuleList icmpRules](self, "icmpRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDNetworkRouterWANFirewallRuleList initWithPortRules:icmpRules:](v4, "initWithPortRules:icmpRules:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterWANFirewallRuleList *v5;
  HMDNetworkRouterWANFirewallRuleList *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (HMDNetworkRouterWANFirewallRuleList *)a3;
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
      -[HMDNetworkRouterWANFirewallRuleList portRules](self, "portRules");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterWANFirewallRuleList portRules](v6, "portRules");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterWANFirewallRuleList portRules](self, "portRules");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterWANFirewallRuleList portRules](v6, "portRules");
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
      -[HMDNetworkRouterWANFirewallRuleList icmpRules](self, "icmpRules");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterWANFirewallRuleList icmpRules](v6, "icmpRules");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[HMDNetworkRouterWANFirewallRuleList icmpRules](self, "icmpRules");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterWANFirewallRuleList icmpRules](v6, "icmpRules");
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
  -[HMDNetworkRouterWANFirewallRuleList portRules](self, "portRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterWANFirewallRuleList icmpRules](self, "icmpRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterWANFirewallRuleList portRules=%@, icmpRules=%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMutableArray)portRules
{
  return self->_portRules;
}

- (void)setPortRules:(id)a3
{
  objc_storeStrong((id *)&self->_portRules, a3);
}

- (NSMutableArray)icmpRules
{
  return self->_icmpRules;
}

- (void)setIcmpRules:(id)a3
{
  objc_storeStrong((id *)&self->_icmpRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpRules, 0);
  objc_storeStrong((id *)&self->_portRules, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterWANFirewallRuleList *v6;
  HMDNetworkRouterWANFirewallRuleList *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterWANFirewallRuleList);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterWANFirewallRuleList parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
