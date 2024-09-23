@implementation HMDNetworkRouterFirewallRuleLANDynamic

- (HMDNetworkRouterFirewallRuleLANDynamic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 advertisingProtocol:(unsigned __int8)a11 advertisingOnly:(BOOL)a12 serviceType:(id)a13
{
  uint64_t v13;
  _BOOL8 v14;
  _BOOL8 v16;
  id v20;
  HMDNetworkRouterFirewallRuleLANDynamic *v21;
  HMDNetworkRouterFirewallRuleLANDynamic *v22;
  HMDNetworkRouterFirewallRuleLANDynamic *v23;
  objc_super v26;

  v13 = a8;
  v14 = a7;
  v16 = a5;
  v20 = a13;
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  v21 = -[HMDNetworkRouterFirewallRuleLAN initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:](&v26, sel_initWithJSONDictionary_name_critical_purpose_allowInterAccessoryConnections_direction_requiredForHAPFunctionality_, a3, a4, v16, a6, v14, v13, a9);
  v22 = v21;
  if (v21)
  {
    v21->_transportProtocol = a10;
    v21->_advertisingProtocol = a11;
    v21->_advertisingOnly = a12;
    objc_storeStrong((id *)&v21->_serviceType, a13);
    v23 = v22;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleLANDynamic *v4;
  HMDNetworkRouterFirewallRuleLANDynamic *v5;
  HMDNetworkRouterFirewallRuleLANDynamic *v6;
  HMDNetworkRouterFirewallRuleLANDynamic *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  char v11;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = (HMDNetworkRouterFirewallRuleLANDynamic *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
    if (-[HMDNetworkRouterFirewallRuleLAN isEqual:](&v15, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      v8 = -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol");
      if (v8 == -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](v7, "transportProtocol")
        && (v9 = -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol"),
            v9 == -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](v7, "advertisingProtocol"))
        && (v10 = -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly"),
            v10 == -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](v7, "isAdvertisingOnly")))
      {
        -[HMDNetworkRouterFirewallRuleLANDynamic serviceType](self, "serviceType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleLANDynamic serviceType](v7, "serviceType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = HMFEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol");
  v4 = -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol") ^ v3;
  v5 = v4 ^ -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly");
  -[HMDNetworkRouterFirewallRuleLANDynamic serviceType](self, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  -[HMDNetworkRouterFirewallRuleLAN attributeDescriptions](&v19, sel_attributeDescriptions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("TransportProtocol"), v18);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("AdvertisingProtocol"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("AdvertisingOnly"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleLANDynamic serviceType](self, "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("ServiceType"), v12);
  v20[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v12.receiver = self;
  v12.super_class = (Class)HMDNetworkRouterFirewallRuleLANDynamic;
  -[HMDNetworkRouterFirewallRuleLAN prettyJSONDictionary](&v12, sel_prettyJSONDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Dynamic Port Rule"), CFSTR("type"));
  objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleLANDynamic transportProtocol](self, "transportProtocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("transportProtocol"));

  objc_msgSend((id)objc_opt_class(), "__advertisingProtocolToString:", -[HMDNetworkRouterFirewallRuleLANDynamic advertisingProtocol](self, "advertisingProtocol"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("advertisingProtocol"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDNetworkRouterFirewallRuleLANDynamic isAdvertisingOnly](self, "isAdvertisingOnly"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("advertisingOnly"));

  -[HMDNetworkRouterFirewallRuleLANDynamic serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("serviceType"));

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (unsigned)advertisingProtocol
{
  return self->_advertisingProtocol;
}

- (BOOL)isAdvertisingOnly
{
  return self->_advertisingOnly;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
}

+ (id)__advertisingProtocolToString:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("SSDP");
  if (a3)
    return (id)v3;
  else
    return CFSTR("DNS-SD");
}

+ (BOOL)__decodeAdvertisingProtocol:(id)a3 advertisingProtocol:(unsigned __int8 *)a4 error:(id *)a5
{
  id v8;
  char v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = 0;
  v9 = decodeUnsignedIntegerFromJSONDictionary(v8, CFSTR("a"), 1, 0xFFuLL, &v20);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v13 = 0;
      *a5 = v14;
      goto LABEL_14;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v12 = objc_msgSend(v10, "unsignedCharValue");
  if (v12 == 1)
  {
    v13 = 1;
    *a4 = 1;
    goto LABEL_14;
  }
  if (v12)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = CFSTR("a");
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1070);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  *a4 = 0;
  v13 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)__decodeFlags:(id)a3 advertisingOnly:(BOOL *)a4 error:(id *)a5
{
  char v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  v7 = decodeUnsignedIntegerFromJSONDictionary(a3, CFSTR("f"), 0, 0xFFFFFFFFuLL, &v11);
  v8 = v11;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    *a4 = objc_msgSend(v8, "unsignedLongValue") & 1;
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)__decodeServiceType:(id)a3 serviceType:(id *)a4 error:(id *)a5
{
  char v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  v7 = decodeStringFromJSONDictionary(a3, CFSTR("s"), 1, &v11);
  v8 = v11;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    *a4 = objc_retainAutorelease(v8);
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  _BOOL8 v11;
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  uint64_t v29;
  unsigned int v30;
  id v31;
  char v32;
  unsigned __int8 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v30 = a8;
  v11 = a7;
  v13 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a10;
  v33 = 0;
  if (!objc_msgSend(a1, "__decodeTransportProtocolFromJSONDictionary:key:transportProtocol:error:", v18, CFSTR("r"), &v33, a11))goto LABEL_12;
  if (v33 >= 2u)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2112;
      v37 = CFSTR("r");
      v38 = 2112;
      v39 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    if (a11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v23 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  buf[0] = 0;
  if (!objc_msgSend(a1, "__decodeAdvertisingProtocol:advertisingProtocol:error:", v18, buf, a11))
    goto LABEL_12;
  v32 = 0;
  if (!objc_msgSend(a1, "__decodeFlags:advertisingOnly:error:", v18, &v32, a11))
    goto LABEL_12;
  v31 = 0;
  v24 = objc_msgSend(a1, "__decodeServiceType:serviceType:error:", v18, &v31, a11);
  v25 = v31;
  v23 = 0;
  if (v24)
  {
    v26 = v25;
    v27 = objc_alloc((Class)a1);
    BYTE3(v29) = v32;
    *(_WORD *)((char *)&v29 + 1) = __PAIR16__(buf[0], v33);
    LOBYTE(v29) = a9;
    v23 = (void *)objc_msgSend(v27, "initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:transportProtocol:advertisingProtocol:advertisingOnly:serviceType:", v16, v17, v13, a6, v11, v30, v29, v26);
    v25 = v26;
  }

LABEL_13:
  return v23;
}

@end
