@implementation HMDNetworkRouterFirewallRuleLANStatic

- (HMDNetworkRouterFirewallRuleLANStatic)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 transportProtocol:(unsigned __int8)a10 ipAddress:(id)a11 portStart:(unsigned __int16)a12 portEnd:(unsigned __int16)a13 icmpTypes:(id)a14
{
  uint64_t v14;
  _BOOL8 v15;
  _BOOL8 v17;
  HMDNetworkRouterFirewallRuleLANStatic *v21;
  HMDNetworkRouterFirewallRuleLANStatic *v22;
  HMDNetworkRouterFirewallRuleLANStatic *v23;
  id v26;
  id v27;
  objc_super v28;

  v14 = a8;
  v15 = a7;
  v17 = a5;
  v27 = a11;
  v26 = a14;
  v28.receiver = self;
  v28.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  v21 = -[HMDNetworkRouterFirewallRuleLAN initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:](&v28, sel_initWithJSONDictionary_name_critical_purpose_allowInterAccessoryConnections_direction_requiredForHAPFunctionality_, a3, a4, v17, a6, v15, v14, a9);
  v22 = v21;
  if (v21)
  {
    v21->_transportProtocol = a10;
    objc_storeStrong((id *)&v21->_ipAddress, a11);
    v22->_portStart = a12;
    v22->_portEnd = a13;
    objc_storeStrong((id *)&v22->_icmpTypes, a14);
    v23 = v22;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleLANStatic *v4;
  HMDNetworkRouterFirewallRuleLANStatic *v5;
  HMDNetworkRouterFirewallRuleLANStatic *v6;
  HMDNetworkRouterFirewallRuleLANStatic *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = (HMDNetworkRouterFirewallRuleLANStatic *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
    if (-[HMDNetworkRouterFirewallRuleLAN isEqual:](&v17, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (!v7)
        goto LABEL_13;
      -[HMDNetworkRouterFirewallRuleLANStatic ipAddress](self, "ipAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleLANStatic ipAddress](v7, "ipAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = HMFEqualObjects();

      if (!v10)
        goto LABEL_13;
      v11 = -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart");
      if (v11 == -[HMDNetworkRouterFirewallRuleLANStatic portStart](v7, "portStart")
        && (v12 = -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd"),
            v12 == -[HMDNetworkRouterFirewallRuleLANStatic portEnd](v7, "portEnd")))
      {
        -[HMDNetworkRouterFirewallRuleLANStatic icmpTypes](self, "icmpTypes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleLANStatic icmpTypes](v7, "icmpTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = HMFEqualObjects();

      }
      else
      {
LABEL_13:
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDNetworkRouterFirewallRuleLANStatic ipAddress](self, "ipAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = v4 ^ -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart");
  v6 = -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd");
  -[HMDNetworkRouterFirewallRuleLANStatic icmpTypes](self, "icmpTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)attributeDescriptions
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  -[HMDNetworkRouterFirewallRuleLAN attributeDescriptions](&v19, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleLANStatic ipAddress](self, "ipAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("IPAddress"), v18);
  v20[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("PortStart"), v7);
  v20[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("PortEnd"), v10);
  v20[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleLANStatic icmpTypes](self, "icmpTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("ICMPTypes"), v13);
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  int v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v17.receiver = self;
  v17.super_class = (Class)HMDNetworkRouterFirewallRuleLANStatic;
  -[HMDNetworkRouterFirewallRuleLAN prettyJSONDictionary](&v17, sel_prettyJSONDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Static Port Rule"), CFSTR("type"));
  objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleLANStatic transportProtocol](self, "transportProtocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("transportProtocol"));

  -[HMDNetworkRouterFirewallRuleLANStatic ipAddress](self, "ipAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("ipAddress"));

  v9 = -[HMDNetworkRouterFirewallRuleLANStatic transportProtocol](self, "transportProtocol");
  if (v9 < 2)
  {
    v10 = -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart");
    v11 = -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portStart](self, "portStart"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v13 = CFSTR("port");
    }
    else
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("portStart"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleLANStatic portEnd](self, "portEnd"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("portEnd");
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);
    goto LABEL_8;
  }
  if (v9 == 2)
  {
    -[HMDNetworkRouterFirewallRuleLANStatic icmpTypes](self, "icmpTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_map:", &__block_literal_global_184509);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("icmpTypes"));

LABEL_8:
  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (HMFNetAddress)ipAddress
{
  return self->_ipAddress;
}

- (unsigned)portStart
{
  return self->_portStart;
}

- (unsigned)portEnd
{
  return self->_portEnd;
}

- (NSArray)icmpTypes
{
  return self->_icmpTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icmpTypes, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

uint64_t __61__HMDNetworkRouterFirewallRuleLANStatic_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prettyJSONDictionary");
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  BOOL v23;
  __int16 v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  __int16 v34;
  __int16 v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  BOOL v49;
  int v50;
  id v51;
  unsigned __int8 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v11 = a8;
  v12 = a7;
  v14 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a10;
  v52 = 0;
  if (objc_msgSend(a1, "__decodeTransportProtocolFromJSONDictionary:key:transportProtocol:error:", v19, CFSTR("r"), &v52, a11))
  {
    v48 = v17;
    v51 = 0;
    v20 = decodeAddressFromJSONDictionary(v19, CFSTR("i"), 0, &v51);
    v21 = v51;
    if ((v20 & 1) == 0)
    {
      if (a11)
      {
        v31 = v21;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v30 = 0;
        *a11 = (id)objc_claimAutoreleasedReturnValue();
        v21 = v31;
      }
      else
      {
        v30 = 0;
      }
      v17 = v48;
      goto LABEL_49;
    }
    v47 = v18;
    if (v21)
    {
      v22 = v21;
      v23 = objc_msgSend(v21, "addressFamily") == 1;
      v21 = v22;
      if (!v23)
      {
        v23 = objc_msgSend(v22, "addressFamily") == 2;
        v21 = v22;
        if (!v23)
        {
          v37 = (void *)MEMORY[0x1D17BA0A0](v22);
          v38 = a1;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v41;
            v55 = 2112;
            v56 = v22;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid IP address value: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v37);
          if (a11)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
            v30 = 0;
            *a11 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v30 = 0;
          }
          v21 = v22;
          v18 = v47;
          v17 = v48;
          goto LABEL_49;
        }
      }
    }
    v50 = 0;
    if (v52 >= 2u)
    {
      if (v52 != 2)
      {
        v18 = v47;
        v17 = v48;
        if (a11)
        {
          v36 = v21;
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v30 = 0;
          *a11 = (id)objc_claimAutoreleasedReturnValue();
          v21 = v36;
        }
        else
        {
          v30 = 0;
        }
        goto LABEL_49;
      }
      v46 = v21;
      +[HMDNetworkRouterFirewallRuleICMPType createListWithJSONDictionary:key:](HMDNetworkRouterFirewallRuleICMPType, "createListWithJSONDictionary:key:", v19, CFSTR("it"));
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        if (a11)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v30 = 0;
          *a11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = 0;
        }
        v17 = v48;
        goto LABEL_48;
      }
      v33 = (void *)v32;
      v34 = 0;
      v35 = 0;
    }
    else
    {
      v46 = v21;
      v17 = v48;
      if ((decodePortFromJSONDictionary(v19, CFSTR("p"), 1, (_WORD *)&v50 + 1, 0) & 1) == 0)
      {
        if (a11)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v30 = 0;
          *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:
          v21 = v46;
          v18 = v47;
          goto LABEL_49;
        }
LABEL_43:
        v30 = 0;
        goto LABEL_48;
      }
      v49 = 0;
      if ((decodePortFromJSONDictionary(v19, CFSTR("q"), 0, &v50, &v49) & 1) == 0)
      {
LABEL_41:
        if (a11)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          *a11 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_43;
      }
      v24 = HIWORD(v50);
      if (v49)
      {
        v24 = v50;
        if (HIWORD(v50) > (unsigned __int16)v50)
        {
          v25 = (void *)MEMORY[0x1D17BA0A0]();
          v26 = a1;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v28;
            v29 = "%{public}@Must have portStart less than or equal to portEnd";
LABEL_39:
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);

            goto LABEL_40;
          }
          goto LABEL_40;
        }
        if (HIWORD(v50) && !(_WORD)v50)
        {
          v25 = (void *)MEMORY[0x1D17BA0A0]();
          v26 = a1;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v54 = v28;
            v29 = "%{public}@Must not have portEnd set to 0";
            goto LABEL_39;
          }
LABEL_40:

          objc_autoreleasePoolPop(v25);
          v17 = v48;
          goto LABEL_41;
        }
      }
      v33 = 0;
      v35 = HIWORD(v50);
      v34 = v24;
    }
    v42 = objc_alloc((Class)a1);
    WORD1(v45) = v34;
    LOWORD(v45) = v35;
    BYTE1(v44) = v52;
    LOBYTE(v44) = a9;
    v30 = (void *)objc_msgSend(v42, "initWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:transportProtocol:ipAddress:portStart:portEnd:icmpTypes:", v48, v47, v14, a6, v12, v11, v44, v46, v45, v33);

    v21 = v46;
    v18 = v47;
    v17 = v48;
LABEL_49:

    goto LABEL_50;
  }
  v30 = 0;
LABEL_50:

  return v30;
}

@end
