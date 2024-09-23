@implementation HMDNetworkRouterFirewallRuleLANMulticast

- (HMDNetworkRouterFirewallRuleLANMulticast)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ipAddress:(id)a10 port:(unsigned __int16)a11
{
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v14;
  id v18;
  HMDNetworkRouterFirewallRuleLANMulticast *v19;
  HMDNetworkRouterFirewallRuleLANMulticast *v20;
  HMDNetworkRouterFirewallRuleLANMulticast *v21;
  objc_super v24;

  v11 = a8;
  v12 = a7;
  v14 = a5;
  v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  v19 = -[HMDNetworkRouterFirewallRuleLAN initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:](&v24, sel_initWithJSONDictionary_name_critical_purpose_allowInterAccessoryConnections_direction_requiredForHAPFunctionality_, a3, a4, v14, a6, v12, v11, a9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_ipAddress, a10);
    v20->_port = a11;
    v21 = v20;
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleLANMulticast *v4;
  HMDNetworkRouterFirewallRuleLANMulticast *v5;
  HMDNetworkRouterFirewallRuleLANMulticast *v6;
  HMDNetworkRouterFirewallRuleLANMulticast *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  objc_super v13;

  v4 = (HMDNetworkRouterFirewallRuleLANMulticast *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
    if (-[HMDNetworkRouterFirewallRuleLAN isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7)
      {
        -[HMDNetworkRouterFirewallRuleLANMulticast ipAddress](self, "ipAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleLANMulticast ipAddress](v7, "ipAddress");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port");
          v11 = v10 == -[HMDNetworkRouterFirewallRuleLANMulticast port](v7, "port");
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
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[HMDNetworkRouterFirewallRuleLANMulticast ipAddress](self, "ipAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4 ^ -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port");
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  -[HMDNetworkRouterFirewallRuleLAN attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleLANMulticast ipAddress](self, "ipAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("IPAddress"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Port"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v11.receiver = self;
  v11.super_class = (Class)HMDNetworkRouterFirewallRuleLANMulticast;
  -[HMDNetworkRouterFirewallRuleLAN prettyJSONDictionary](&v11, sel_prettyJSONDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Multicast Bridging Rule"), CFSTR("type"));
  -[HMDNetworkRouterFirewallRuleLANMulticast ipAddress](self, "ipAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ipAddress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANMulticast port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("port"));

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (HMFNetAddress)ipAddress
{
  return self->_ipAddress;
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  _BOOL8 v11;
  _BOOL8 v13;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v31 = a8;
  v11 = a7;
  v13 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v16 = a4;
  v17 = a10;
  v33 = 0;
  v18 = decodeAddressFromJSONDictionary(v17, CFSTR("i"), 1, &v33);
  v19 = v33;
  v20 = v19;
  if ((v18 & 1) == 0)
    goto LABEL_11;
  if (objc_msgSend(v19, "addressFamily") != 1 && objc_msgSend(v20, "addressFamily") != 2)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid IP address value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    goto LABEL_11;
  }
  *(_WORD *)buf = 0;
  if ((decodePortFromJSONDictionary(v17, CFSTR("p"), 1, buf, 0) & 1) == 0)
  {
LABEL_11:
    if (a11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v23 = 0;
      *a11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v22 = v32;
    goto LABEL_15;
  }
  if (a11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_alloc((Class)a1);
  LOWORD(v30) = *(_WORD *)buf;
  LOBYTE(v29) = a9;
  v22 = v32;
  v23 = (void *)objc_msgSend(v21, "initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:ipAddress:port:", v32, v16, v13, a6, v11, v31, v29, v20, v30);
LABEL_15:

  return v23;
}

@end
