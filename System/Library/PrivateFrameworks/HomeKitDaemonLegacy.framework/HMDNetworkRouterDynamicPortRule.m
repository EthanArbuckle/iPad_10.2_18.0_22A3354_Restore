@implementation HMDNetworkRouterDynamicPortRule

- (void)addTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "dynamicPortRules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "addObject:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDynamicPortRules:", v6);

  }
}

+ (id)ruleForHAP
{
  HMDNetworkRouterRuleDirection *v2;
  void *v3;
  HMDNetworkRouterLANIdentifierList *v4;
  void *v5;
  HMDNetworkRouterLANIdentifierList *v6;
  HMDNetworkRouterProtocol *v7;
  HMDNetworkRouterAdvertisementProtocol *v8;
  HMDNetworkRouterServiceType *v9;
  HMDNetworkRouterDynamicPortRule *v10;
  void *v11;
  HMDNetworkRouterDynamicPortRule *v12;

  v2 = -[HMDNetworkRouterRuleDirection initWithDirection:]([HMDNetworkRouterRuleDirection alloc], "initWithDirection:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B33108);
  v4 = [HMDNetworkRouterLANIdentifierList alloc];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDNetworkRouterLANIdentifierList initWithIdentifiers:](v4, "initWithIdentifiers:", v5);

  v7 = -[HMDNetworkRouterProtocol initWithProtocol:]([HMDNetworkRouterProtocol alloc], "initWithProtocol:", 0);
  v8 = -[HMDNetworkRouterAdvertisementProtocol initWithAdvertisementProtocol:]([HMDNetworkRouterAdvertisementProtocol alloc], "initWithAdvertisementProtocol:", 0);
  v9 = -[HMDNetworkRouterServiceType initWithName:]([HMDNetworkRouterServiceType alloc], "initWithName:", CFSTR("hap"));
  v10 = [HMDNetworkRouterDynamicPortRule alloc];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16610]), "initWithValue:", &unk_1E8B33120);
  v12 = -[HMDNetworkRouterDynamicPortRule initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:](v10, "initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:", v2, v6, v7, v8, v11, v9);

  return v12;
}

+ (id)ruleFromFirewallRuleLAN:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDNetworkRouterServiceType *v8;
  HMDNetworkRouterServiceType *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDNetworkRouterDynamicPortRule *v15;

  v3 = a3;
  +[HMDNetworkRouterRuleDirection directionFromLANDirection:](HMDNetworkRouterRuleDirection, "directionFromLANDirection:", objc_msgSend(v3, "direction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  createIdentifierListFromLANRule(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNetworkRouterProtocol protocolFromTransportProtocol:](HMDNetworkRouterProtocol, "protocolFromTransportProtocol:", objc_msgSend(v3, "transportProtocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNetworkRouterAdvertisementProtocol protocolFromFirewallRuleAdvertisingProtocol:](HMDNetworkRouterAdvertisementProtocol, "protocolFromFirewallRuleAdvertisingProtocol:", objc_msgSend(v3, "advertisingProtocol"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v8 = (HMDNetworkRouterServiceType *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [HMDNetworkRouterServiceType alloc];
    objc_msgSend(v3, "serviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDNetworkRouterServiceType initWithName:](v9, "initWithName:", v10);

  }
  v11 = objc_alloc(MEMORY[0x1E0D16610]);
  if (objc_msgSend(v3, "isAdvertisingOnly"))
    v12 = &unk_1E8B33138;
  else
    v12 = &unk_1E8B33120;
  v13 = objc_msgSend(v11, "initWithValue:", v12);
  v14 = (void *)v13;
  v15 = 0;
  if (v4 && v5 && v6 && v7 && v13)
    v15 = -[HMDNetworkRouterDynamicPortRule initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:]([HMDNetworkRouterDynamicPortRule alloc], "initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:", v4, v5, v6, v7, v13, v8);

  return v15;
}

- (HMDNetworkRouterDynamicPortRule)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterDynamicPortRule;
  return -[HMDNetworkRouterDynamicPortRule init](&v3, sel_init);
}

- (HMDNetworkRouterDynamicPortRule)initWithDirection:(id)a3 lanIdentifierList:(id)a4 protocol:(id)a5 advertisementProtocol:(id)a6 flags:(id)a7 serviceType:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDNetworkRouterDynamicPortRule *v18;
  HMDNetworkRouterDynamicPortRule *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterDynamicPortRule;
  v18 = -[HMDNetworkRouterDynamicPortRule init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_direction, a3);
    objc_storeStrong((id *)&v19->_lanIdentifierList, a4);
    objc_storeStrong((id *)&v19->_protocol, a5);
    objc_storeStrong((id *)&v19->_advertisementProtocol, a6);
    objc_storeStrong((id *)&v19->_flags, a7);
    objc_storeStrong((id *)&v19->_serviceType, a8);
  }

  return v19;
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
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;

  v6 = a3;
  if (a4)
    *a4 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  v26 = v7;
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v10 = 0;
    v28 = 0;
    v29 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v27 = 0;
    v14 = v8 + v9;
    while (1)
    {
      v40 = 0;
      v39 = 0;
      v37 = 0;
      v38 = 0;
      v36 = 0;
      if (TLV8GetNext() || TLV8GetOrCopyCoalesced())
      {
        v23 = v26;
        if (a4)
        {
          HMErrorFromOSStatus();
          v19 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        goto LABEL_31;
      }
      if (!v39)
        break;
      switch(v40)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v10;
          v16 = &v35;
          +[HMDNetworkRouterRuleDirection parsedFromData:error:](HMDNetworkRouterRuleDirection, "parsedFromData:error:", v15, &v35);
          v17 = (void *)v29;
          v29 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 2:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v10;
          v16 = &v34;
          +[HMDNetworkRouterLANIdentifierList parsedFromData:error:](HMDNetworkRouterLANIdentifierList, "parsedFromData:error:", v15, &v34);
          v17 = (void *)v28;
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 3:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v10;
          v16 = &v33;
          +[HMDNetworkRouterProtocol parsedFromData:error:](HMDNetworkRouterProtocol, "parsedFromData:error:", v15, &v33);
          v17 = (void *)v27;
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 4:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v10;
          v16 = &v32;
          +[HMDNetworkRouterAdvertisementProtocol parsedFromData:error:](HMDNetworkRouterAdvertisementProtocol, "parsedFromData:error:", v15, &v32);
          v17 = v13;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 5:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v10;
          v16 = &v31;
          objc_msgSend(MEMORY[0x1E0D16610], "parsedFromData:error:", v15, &v31);
          v17 = v12;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        case 6:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v10;
          v16 = &v30;
          +[HMDNetworkRouterServiceType parsedFromData:error:](HMDNetworkRouterServiceType, "parsedFromData:error:", v15, &v30);
          v17 = v11;
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v18 = *v16;

          v10 = v18;
          break;
        default:
          break;
      }
      if (v38)
        free(v38);
      if (v36 == v14)
      {
        if (v10)
          goto LABEL_20;
LABEL_26:
        v23 = v26;
        v21 = (void *)v27;
        v22 = (void *)v28;
        v20 = (void *)v29;
        goto LABEL_27;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D27FC8], 3, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v24;
    if (!v24)
      goto LABEL_26;
LABEL_20:
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v19 = 0;
      *a4 = v10;
    }
    else
    {
      v19 = 0;
    }
    v23 = v26;
LABEL_31:
    v22 = (void *)v28;
    v20 = (void *)v29;
    v21 = (void *)v27;
  }
  else
  {
    v20 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v21 = 0;
    v22 = 0;
    v23 = v7;
LABEL_27:
    -[HMDNetworkRouterDynamicPortRule setDirection:](self, "setDirection:", v20);
    -[HMDNetworkRouterDynamicPortRule setLanIdentifierList:](self, "setLanIdentifierList:", v22);
    -[HMDNetworkRouterDynamicPortRule setProtocol:](self, "setProtocol:", v21);
    -[HMDNetworkRouterDynamicPortRule setAdvertisementProtocol:](self, "setAdvertisementProtocol:", v13);
    -[HMDNetworkRouterDynamicPortRule setFlags:](self, "setFlags:", v12);
    -[HMDNetworkRouterDynamicPortRule setServiceType:](self, "setServiceType:", v11);
    v10 = 0;
    v19 = 1;
  }

  return v19;
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
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
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
  v31 = 0u;
  TLV8BufferInit();
  -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v6, "serializeWithError:", &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v30;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v11, "serializeWithError:", &v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v29;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v13, "serializeWithError:", &v28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v28;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_17;
  -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v15, "serializeWithError:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v8)
    goto LABEL_27;
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  if (TLV8BufferAppend())
  {
LABEL_20:

    goto LABEL_21;
  }

LABEL_17:
  -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v17, "serializeWithError:", &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;

    if (v8)
      goto LABEL_27;
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "bytes");
    objc_msgSend(v9, "length");
    if (TLV8BufferAppend())
      goto LABEL_20;

  }
  -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_33;
  -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v20, "serializeWithError:", &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v8)
  {
LABEL_27:

    if (a3)
    {
      v18 = objc_retainAutorelease(v8);
      v8 = v18;
      goto LABEL_29;
    }
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v23 = objc_retainAutorelease(v7);
  objc_msgSend(v23, "bytes");
  objc_msgSend(v23, "length");
  v24 = TLV8BufferAppend();

  if (!v24)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    goto LABEL_31;
  }
LABEL_21:
  if (!a3)
  {
    v8 = 0;
    goto LABEL_30;
  }
  HMErrorFromOSStatus();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_29:
  v21 = 0;
  *a3 = v18;
LABEL_31:
  TLV8BufferFree();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDNetworkRouterDynamicPortRule *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterDynamicPortRule *v11;

  v4 = +[HMDNetworkRouterDynamicPortRule allocWithZone:](HMDNetworkRouterDynamicPortRule, "allocWithZone:", a3);
  -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDNetworkRouterDynamicPortRule initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:](v4, "initWithDirection:lanIdentifierList:protocol:advertisementProtocol:flags:serviceType:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HMDNetworkRouterDynamicPortRule *v5;
  HMDNetworkRouterDynamicPortRule *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v5 = (HMDNetworkRouterDynamicPortRule *)a3;
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
      -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule direction](v6, "direction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule direction](v6, "direction");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v9;
        if (!objc_msgSend(v9, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_36;
        }
      }
      -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule lanIdentifierList](v6, "lanIdentifierList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule lanIdentifierList](v6, "lanIdentifierList");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:"))
        {
          v10 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
      v13 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule protocol](v6, "protocol");
      v14 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v13;
      v15 = v13 == v14;
      v16 = (void *)v14;
      if (!v15)
      {
        -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule protocol](v6, "protocol");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v10 = 0;
          v18 = v46;
LABEL_32:

LABEL_33:
          if (v11 == v12)
            goto LABEL_35;
          goto LABEL_34;
        }
      }
      -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
      v19 = objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule advertisementProtocol](v6, "advertisementProtocol");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v19;
      v43 = v16;
      if (v19 == v44)
      {
        v37 = v12;
      }
      else
      {
        v20 = v3;
        -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule advertisementProtocol](v6, "advertisementProtocol");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          v10 = 0;
          v24 = (void *)v44;
          v3 = v20;
LABEL_30:

LABEL_31:
          v16 = v43;
          v18 = v46;
          if (v46 == v43)
            goto LABEL_33;
          goto LABEL_32;
        }
        v37 = v12;
        v3 = v20;
      }
      -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule flags](v6, "flags");
      v38 = objc_claimAutoreleasedReturnValue();
      if (v22 == (void *)v38)
      {
        v33 = v3;
        v34 = v11;
      }
      else
      {
        -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule flags](v6, "flags");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v23;
        if (!objc_msgSend(v23, "isEqual:"))
        {
          v10 = 0;
          v12 = v37;
          v30 = (void *)v38;
          goto LABEL_28;
        }
        v33 = v3;
        v34 = v11;
      }
      -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterDynamicPortRule serviceType](v6, "serviceType");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v26)
      {

        v10 = 1;
      }
      else
      {
        v27 = (void *)v26;
        -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
        v32 = v22;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterDynamicPortRule serviceType](v6, "serviceType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v28, "isEqual:", v29);

        v22 = v32;
      }
      v12 = v37;
      v30 = (void *)v38;
      v3 = v33;
      v11 = v34;
      if (v22 == (void *)v38)
      {
LABEL_29:

        v24 = (void *)v44;
        if (v45 == (void *)v44)
          goto LABEL_31;
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    v10 = 0;
  }
LABEL_38:

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
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDNetworkRouterDynamicPortRule direction](self, "direction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule lanIdentifierList](self, "lanIdentifierList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule protocol](self, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule advertisementProtocol](self, "advertisementProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule flags](self, "flags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterDynamicPortRule serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDNetworkRouterDynamicPortRule direction=%@, lanIdentifierList=%@, protocol=%@, advertisementProtocol=%@, flags=%@, serviceType=%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
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

- (HMDNetworkRouterProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (HMDNetworkRouterAdvertisementProtocol)advertisementProtocol
{
  return self->_advertisementProtocol;
}

- (void)setAdvertisementProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementProtocol, a3);
}

- (HAPTLVUnsignedNumberValue)flags
{
  return self->_flags;
}

- (void)setFlags:(id)a3
{
  objc_storeStrong((id *)&self->_flags, a3);
}

- (HMDNetworkRouterServiceType)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_advertisementProtocol, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_lanIdentifierList, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5;
  HMDNetworkRouterDynamicPortRule *v6;
  HMDNetworkRouterDynamicPortRule *v7;
  id v8;
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(HMDNetworkRouterDynamicPortRule);
  v7 = v6;
  if (v6)
  {
    v10 = 0;
    -[HMDNetworkRouterDynamicPortRule parseFromData:error:](v6, "parseFromData:error:", v5, &v10);
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
