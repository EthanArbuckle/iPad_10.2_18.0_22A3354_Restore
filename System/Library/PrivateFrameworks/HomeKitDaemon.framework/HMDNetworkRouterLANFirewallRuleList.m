@implementation HMDNetworkRouterLANFirewallRuleList

- (HMDNetworkRouterLANFirewallRuleList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterLANFirewallRuleList;
  return -[HMDNetworkRouterLANFirewallRuleList init](&v3, sel_init);
}

- (HMDNetworkRouterLANFirewallRuleList)initWithMulticastBridgingRules:(id)a3 staticPortRules:(id)a4 dynamicPortRules:(id)a5 staticICMPRules:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDNetworkRouterLANFirewallRuleList *v15;
  HMDNetworkRouterLANFirewallRuleList *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterLANFirewallRuleList;
  v15 = -[HMDNetworkRouterLANFirewallRuleList init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_multicastBridgingRules, a3);
    objc_storeStrong((id *)&v16->_staticPortRules, a4);
    objc_storeStrong((id *)&v16->_dynamicPortRules, a5);
    objc_storeStrong((id *)&v16->_staticICMPRules, a6);
  }

  return v16;
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDNetworkRouterLANFirewallRuleList *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;

  v27 = self;
  v5 = a3;
  if (a4)
    *a4 = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v29 = v10;
    v13 = 0;
    v14 = v7 + v8;
    while (1)
    {
      v38 = 0;
      v36 = 0;
      v37 = 0;
      v34 = 0;
      v35 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
        break;
      if (!v37)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
        v20 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v20;
LABEL_26:
        v10 = v29;
        if (!v13)
          goto LABEL_30;
        if (a4)
        {
          v19 = objc_retainAutorelease(v13);
          v13 = v19;
          goto LABEL_29;
        }
        goto LABEL_43;
      }
      switch(v38)
      {
        case 1:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v13;
          +[HMDNetworkRouterMulticastBridgingRule parsedFromData:error:](HMDNetworkRouterMulticastBridgingRule, "parsedFromData:error:", v15, &v33);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v33;

          if (v17)
            goto LABEL_18;
          v18 = v9;
          break;
        case 2:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v13;
          +[HMDNetworkRouterStaticPortRule parsedFromData:error:](HMDNetworkRouterStaticPortRule, "parsedFromData:error:", v15, &v32);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v32;

          if (v17)
            goto LABEL_18;
          v18 = v29;
          break;
        case 3:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v13;
          +[HMDNetworkRouterDynamicPortRule parsedFromData:error:](HMDNetworkRouterDynamicPortRule, "parsedFromData:error:", v15, &v31);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v31;

          if (v17)
            goto LABEL_18;
          v18 = v11;
          break;
        case 4:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v13;
          +[HMDNetworkRouterStaticICMPRule parsedFromData:error:](HMDNetworkRouterStaticICMPRule, "parsedFromData:error:", v15, &v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v30;

          if (v17)
            goto LABEL_18;
          v18 = v12;
          break;
        default:
          goto LABEL_19;
      }
      objc_msgSend(v18, "addObject:", v16, v27);
LABEL_18:

      v13 = v17;
LABEL_19:
      if (v36)
        free(v36);
      if (v34 == v14)
        goto LABEL_26;
    }
    v10 = v29;
    if (a4)
    {
      HMErrorFromOSStatus();
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      v21 = 0;
      *a4 = v19;
      goto LABEL_44;
    }
LABEL_43:
    v21 = 0;
  }
  else
  {
LABEL_30:
    if (objc_msgSend(v9, "count", v27))
      v22 = v9;
    else
      v22 = 0;
    objc_msgSend(v28, "setMulticastBridgingRules:", v22);
    if (objc_msgSend(v10, "count"))
      v23 = v10;
    else
      v23 = 0;
    objc_msgSend(v28, "setStaticPortRules:", v23);
    if (objc_msgSend(v11, "count"))
      v24 = v11;
    else
      v24 = 0;
    objc_msgSend(v28, "setDynamicPortRules:", v24);
    if (objc_msgSend(v12, "count"))
      v25 = v12;
    else
      v25 = 0;
    objc_msgSend(v28, "setStaticICMPRules:", v25);
    v13 = 0;
    v21 = 1;
  }
LABEL_44:

  return v21;
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
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v88 = 0u;
  v87 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v68 = 0u;
  TLV8BufferInit();
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](self, "multicastBridgingRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v61;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v10);
      if ((v8 & 1) != 0)
      {
        if (TLV8BufferAppend())
          break;
      }
      v59 = 0;
      objc_msgSend(v11, "serializeWithError:", &v59);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v59;
      if (v13)
      {
LABEL_46:
        v41 = v13;

        if (!a3)
          goto LABEL_52;
        v42 = objc_retainAutorelease(v41);
        v41 = v42;
        goto LABEL_50;
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
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[HMDNetworkRouterLANFirewallRuleList staticPortRules](self, "staticPortRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v56;
LABEL_14:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v19)
          objc_enumerationMutation(v5);
        v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v20);
        if ((v18 & 1) != 0)
        {
          if (TLV8BufferAppend())
            break;
        }
        v54 = 0;
        objc_msgSend(v21, "serializeWithError:", &v54);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v54;
        if (v13)
          goto LABEL_46;
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
          v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
          if (v17)
            goto LABEL_14;
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:

      v53 = 0u;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](self, "dynamicPortRules");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      if (v24)
      {
        v25 = v24;
        v26 = 0;
        v27 = *(_QWORD *)v51;
LABEL_25:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v27)
            objc_enumerationMutation(v5);
          v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v28);
          if ((v26 & 1) != 0)
          {
            if (TLV8BufferAppend())
              break;
          }
          v49 = 0;
          objc_msgSend(v29, "serializeWithError:", &v49);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v49;
          if (v13)
            goto LABEL_46;
          v30 = objc_retainAutorelease(v12);
          objc_msgSend(v30, "bytes");
          objc_msgSend(v30, "length");
          v31 = TLV8BufferAppend();

          if (v31)
            break;
          ++v28;
          v26 = 1;
          if (v25 == v28)
          {
            v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
            if (v25)
              goto LABEL_25;
            goto LABEL_34;
          }
        }
      }
      else
      {
LABEL_34:

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](self, "staticICMPRules");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
        if (!v32)
        {
LABEL_45:

          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v68);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          goto LABEL_53;
        }
        v33 = v32;
        v34 = 0;
        v35 = *(_QWORD *)v46;
LABEL_36:
        v36 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(v5);
          v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v36);
          if ((v34 & 1) != 0)
          {
            if (TLV8BufferAppend())
              break;
          }
          v44 = 0;
          objc_msgSend(v37, "serializeWithError:", &v44);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v44;
          if (v13)
            goto LABEL_46;
          v38 = objc_retainAutorelease(v12);
          objc_msgSend(v38, "bytes");
          objc_msgSend(v38, "length");
          v39 = TLV8BufferAppend();

          if (v39)
            break;
          ++v36;
          v34 = 1;
          if (v33 == v36)
          {
            v33 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
            if (v33)
              goto LABEL_36;
            goto LABEL_45;
          }
        }
      }
    }
  }

  if (a3)
  {
    HMErrorFromOSStatus();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v41 = 0;
LABEL_50:
    v40 = 0;
    *a3 = v42;
  }
  else
  {
    v41 = 0;
LABEL_52:
    v40 = 0;
  }
LABEL_53:
  TLV8BufferFree();

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterLANFirewallRuleList *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNetworkRouterLANFirewallRuleList *v9;

  v4 = +[HMDNetworkRouterLANFirewallRuleList allocWithZone:](HMDNetworkRouterLANFirewallRuleList, "allocWithZone:", a3);
  -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](self, "multicastBridgingRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList staticPortRules](self, "staticPortRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](self, "dynamicPortRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](self, "staticICMPRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDNetworkRouterLANFirewallRuleList initWithMulticastBridgingRules:staticPortRules:dynamicPortRules:staticICMPRules:](v4, "initWithMulticastBridgingRules:staticPortRules:dynamicPortRules:staticICMPRules:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterLANFirewallRuleList *v5;
  HMDNetworkRouterLANFirewallRuleList *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = (HMDNetworkRouterLANFirewallRuleList *)a3;
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
      -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](self, "multicastBridgingRules");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](v6, "multicastBridgingRules");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](self, "multicastBridgingRules");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](v6, "multicastBridgingRules");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[HMDNetworkRouterLANFirewallRuleList staticPortRules](self, "staticPortRules");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallRuleList staticPortRules](v6, "staticPortRules");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDNetworkRouterLANFirewallRuleList staticPortRules](self, "staticPortRules");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallRuleList staticPortRules](v6, "staticPortRules");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
LABEL_23:

LABEL_24:
          if (v7 == v8)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
        v29 = v13;
      }
      -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](self, "dynamicPortRules");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](v6, "dynamicPortRules");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](self, "dynamicPortRules");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](v6, "dynamicPortRules");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          v10 = 0;
          v22 = v30;
          goto LABEL_21;
        }
        v25 = v12;
        v26 = v11;
      }
      -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](self, "staticICMPRules");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](v6, "staticICMPRules");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](self, "staticICMPRules");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](v6, "staticICMPRules");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "isEqual:", v21);

        v3 = v24;
      }
      v22 = v30;
      v12 = v25;
      v11 = v26;
      if (v30 == v15)
      {
LABEL_22:

        v13 = v29;
        if (v11 == v12)
          goto LABEL_24;
        goto LABEL_23;
      }
LABEL_21:

      goto LABEL_22;
    }
    v10 = 0;
  }
LABEL_27:

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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDNetworkRouterLANFirewallRuleList multicastBridgingRules](self, "multicastBridgingRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList staticPortRules](self, "staticPortRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList dynamicPortRules](self, "dynamicPortRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterLANFirewallRuleList staticICMPRules](self, "staticICMPRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterLANFirewallRuleList multicastBridgingRules=%@, staticPortRules=%@, dynamicPortRules=%@, staticICMPRules=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSMutableArray)multicastBridgingRules
{
  return self->_multicastBridgingRules;
}

- (void)setMulticastBridgingRules:(id)a3
{
  objc_storeStrong((id *)&self->_multicastBridgingRules, a3);
}

- (NSMutableArray)staticPortRules
{
  return self->_staticPortRules;
}

- (void)setStaticPortRules:(id)a3
{
  objc_storeStrong((id *)&self->_staticPortRules, a3);
}

- (NSMutableArray)dynamicPortRules
{
  return self->_dynamicPortRules;
}

- (void)setDynamicPortRules:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicPortRules, a3);
}

- (NSMutableArray)staticICMPRules
{
  return self->_staticICMPRules;
}

- (void)setStaticICMPRules:(id)a3
{
  objc_storeStrong((id *)&self->_staticICMPRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticICMPRules, 0);
  objc_storeStrong((id *)&self->_dynamicPortRules, 0);
  objc_storeStrong((id *)&self->_staticPortRules, 0);
  objc_storeStrong((id *)&self->_multicastBridgingRules, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterLANFirewallRuleList *v6;
  HMDNetworkRouterLANFirewallRuleList *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterLANFirewallRuleList);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterLANFirewallRuleList parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
