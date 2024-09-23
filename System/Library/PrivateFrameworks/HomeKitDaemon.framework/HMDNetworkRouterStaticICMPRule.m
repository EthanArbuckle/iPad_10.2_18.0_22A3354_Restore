@implementation HMDNetworkRouterStaticICMPRule

- (void)addTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "staticICMPRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "addObject:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStaticICMPRules:", v6);

  }
}

+ (id)ruleFromFirewallRuleLAN:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDNetworkRouterStaticICMPRule *v10;

  v3 = a3;
  if (objc_msgSend(v3, "transportProtocol") == 2)
  {
    +[HMDNetworkRouterRuleDirection directionFromLANDirection:](HMDNetworkRouterRuleDirection, "directionFromLANDirection:", objc_msgSend(v3, "direction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    createIdentifierListFromLANRule(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ipAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (objc_msgSend(v3, "ipAddress"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:allowWildcard:](HMDNetworkRouterIPAddress, "ipAddressFromRuleAddress:allowWildcard:", v7, 0), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v6))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v3, "icmpTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDNetworkRouterICMPTypeList typeListFromICMPTypes:](HMDNetworkRouterICMPTypeList, "typeListFromICMPTypes:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      if (v4 && v5 && v9)
        v10 = -[HMDNetworkRouterStaticICMPRule initWithDirection:lanIdentifierList:destinationIPAddress:icmpTypeList:]([HMDNetworkRouterStaticICMPRule alloc], "initWithDirection:lanIdentifierList:destinationIPAddress:icmpTypeList:", v4, v5, v6, v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDNetworkRouterStaticICMPRule)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterStaticICMPRule;
  return -[HMDNetworkRouterStaticICMPRule init](&v3, sel_init);
}

- (HMDNetworkRouterStaticICMPRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 destinationIPAddress:(id)a5 icmpTypeList:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDNetworkRouterStaticICMPRule *v15;
  HMDNetworkRouterStaticICMPRule *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterStaticICMPRule;
  v15 = -[HMDNetworkRouterStaticICMPRule init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_direction, a3);
    objc_storeStrong((id *)&v16->_lanIdentifierList, a4);
    objc_storeStrong((id *)&v16->_destinationIPAddress, a5);
    objc_storeStrong((id *)&v16->_icmpTypeList, a6);
  }

  return v16;
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
  uint64_t v21;
  HMDNetworkRouterStaticICMPRule *v23;
  id *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char v34;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v23 = self;
    v24 = a4;
    v25 = v7;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = v8 + v9;
    while (1)
    {
      v34 = 0;
      v32 = 0;
      v33 = 0;
      v30 = 0;
      v31 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        v7 = v25;
        if (v24)
        {
          HMErrorFromOSStatus();
          v20 = 0;
          *v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        goto LABEL_29;
      }
      if (!v33)
        break;
      switch(v34)
      {
        case 1:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v10;
          v17 = &v29;
          +[HMDNetworkRouterRuleDirection parsedFromData:error:](HMDNetworkRouterRuleDirection, "parsedFromData:error:", v16, &v29);
          v18 = v14;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        case 2:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v10;
          v17 = &v28;
          +[HMDNetworkRouterLANIdentifierList parsedFromData:error:](HMDNetworkRouterLANIdentifierList, "parsedFromData:error:", v16, &v28);
          v18 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        case 3:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v10;
          v17 = &v27;
          +[HMDNetworkRouterIPAddress parsedFromData:error:](HMDNetworkRouterIPAddress, "parsedFromData:error:", v16, &v27);
          v18 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        case 4:
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v10;
          v17 = &v26;
          +[HMDNetworkRouterICMPTypeList parsedFromData:error:](HMDNetworkRouterICMPTypeList, "parsedFromData:error:", v16, &v26);
          v18 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
          v19 = *v17;

          v10 = v19;
          break;
        default:
          break;
      }
      if (v32)
        free(v32);
      if (v30 == v15)
      {
        if (v10)
          goto LABEL_18;
LABEL_24:
        v7 = v25;
        self = v23;
        goto LABEL_25;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 3, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v21;
    if (!v21)
      goto LABEL_24;
LABEL_18:
    if (v24)
    {
      v10 = objc_retainAutorelease(v10);
      v20 = 0;
      *v24 = v10;
    }
    else
    {
      v20 = 0;
    }
    v7 = v25;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
LABEL_25:
    -[HMDNetworkRouterStaticICMPRule setDirection:](self, "setDirection:", v14, v23);
    -[HMDNetworkRouterStaticICMPRule setLanIdentifierList:](self, "setLanIdentifierList:", v13);
    -[HMDNetworkRouterStaticICMPRule setDestinationIPAddress:](self, "setDestinationIPAddress:", v12);
    -[HMDNetworkRouterStaticICMPRule setIcmpTypeList:](self, "setIcmpTypeList:", v11);
    v10 = 0;
    v20 = 1;
  }
LABEL_29:

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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id v24;
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
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v6, "serializeWithError:", &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (v8)
      goto LABEL_19;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_12;

  }
  -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "serializeWithError:", &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;

  if (v8)
    goto LABEL_19;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (TLV8BufferAppend())
  {
LABEL_12:

    goto LABEL_13;
  }

LABEL_9:
  -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v13, "serializeWithError:", &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (v8)
      goto LABEL_19;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_12;

  }
  -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_25;
  -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v16, "serializeWithError:", &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  if (v8)
  {
LABEL_19:

    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v8 = v14;
      goto LABEL_21;
    }
LABEL_22:
    v17 = 0;
    goto LABEL_23;
  }
  v19 = objc_retainAutorelease(v7);
  objc_msgSend(v19, "bytes");
  objc_msgSend(v19, "length");
  v20 = TLV8BufferAppend();

  if (!v20)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_23;
  }
LABEL_13:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_22;
  }
  HMErrorFromOSStatus();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_21:
  v17 = 0;
  *a3 = v14;
LABEL_23:
  TLV8BufferFree();

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterStaticICMPRule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNetworkRouterStaticICMPRule *v9;

  v4 = +[HMDNetworkRouterStaticICMPRule allocWithZone:](HMDNetworkRouterStaticICMPRule, "allocWithZone:", a3);
  -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDNetworkRouterStaticICMPRule initWithDirection:lanIdentifierList:destinationIPAddress:icmpTypeList:](v4, "initWithDirection:lanIdentifierList:destinationIPAddress:icmpTypeList:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterStaticICMPRule *v5;
  HMDNetworkRouterStaticICMPRule *v6;
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

  v5 = (HMDNetworkRouterStaticICMPRule *)a3;
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
      -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterStaticICMPRule direction](v6, "direction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterStaticICMPRule direction](v6, "direction");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v9;
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
          goto LABEL_25;
        }
      }
      -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterStaticICMPRule lanIdentifierList](v6, "lanIdentifierList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterStaticICMPRule lanIdentifierList](v6, "lanIdentifierList");
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
      -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
      v14 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterStaticICMPRule destinationIPAddress](v6, "destinationIPAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)v14;
      if ((void *)v14 == v15)
      {
        v25 = v12;
        v26 = v11;
      }
      else
      {
        -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterStaticICMPRule destinationIPAddress](v6, "destinationIPAddress");
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
      -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterStaticICMPRule icmpTypeList](v6, "icmpTypeList");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

        v10 = 1;
      }
      else
      {
        v19 = (void *)v18;
        -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
        v24 = v3;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterStaticICMPRule icmpTypeList](v6, "icmpTypeList");
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
  -[HMDNetworkRouterStaticICMPRule direction](self, "direction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule lanIdentifierList](self, "lanIdentifierList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule destinationIPAddress](self, "destinationIPAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterStaticICMPRule icmpTypeList](self, "icmpTypeList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterStaticICMPRule direction=%@, lanIdentifierList=%@, destinationIPAddress=%@, icmpTypeList=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HMDNetworkRouterRuleDirection)direction
{
  return self->_direction;
}

- (void)setDirection:(id)a3
{
  objc_storeStrong((id *)&self->_direction, a3);
}

- (HMDNetworkRouterLANIdentifierList)lanIdentifierList
{
  return self->_lanIdentifierList;
}

- (void)setLanIdentifierList:(id)a3
{
  objc_storeStrong((id *)&self->_lanIdentifierList, a3);
}

- (HMDNetworkRouterIPAddress)destinationIPAddress
{
  return self->_destinationIPAddress;
}

- (void)setDestinationIPAddress:(id)a3
{
  objc_storeStrong((id *)&self->_destinationIPAddress, a3);
}

- (HMDNetworkRouterICMPTypeList)icmpTypeList
{
  return self->_icmpTypeList;
}

- (void)setIcmpTypeList:(id)a3
{
  objc_storeStrong((id *)&self->_icmpTypeList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypeList, 0);
  objc_storeStrong((id *)&self->_destinationIPAddress, 0);
  objc_storeStrong((id *)&self->_lanIdentifierList, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterStaticICMPRule *v6;
  HMDNetworkRouterStaticICMPRule *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterStaticICMPRule);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterStaticICMPRule parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
