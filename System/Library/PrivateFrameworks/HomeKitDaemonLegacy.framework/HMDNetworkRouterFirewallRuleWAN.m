@implementation HMDNetworkRouterFirewallRuleWAN

- (HMDNetworkRouterFirewallRuleWAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 transportProtocol:(unsigned __int8)a7 subject:(id)a8 portStart:(unsigned __int16)a9 portEnd:(unsigned __int16)a10 icmpTypes:(id)a11
{
  _BOOL8 v14;
  id v18;
  id v19;
  HMDNetworkRouterFirewallRuleWAN *v20;
  HMDNetworkRouterFirewallRuleWAN *v21;
  HMDNetworkRouterFirewallRuleWAN *v22;
  objc_super v24;

  v14 = a5;
  v18 = a8;
  v19 = a11;
  v24.receiver = self;
  v24.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  v20 = -[HMDNetworkRouterFirewallRule initWithJSONDictionary:name:critical:](&v24, sel_initWithJSONDictionary_name_critical_, a3, a4, v14);
  v21 = v20;
  if (v20)
  {
    v20->_purpose = a6;
    v20->_transportProtocol = a7;
    objc_storeStrong((id *)&v20->_subject, a8);
    v21->_portStart = a9;
    v21->_portEnd = a10;
    objc_storeStrong((id *)&v21->_icmpTypes, a11);
    v22 = v21;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleWAN *v4;
  HMDNetworkRouterFirewallRuleWAN *v5;
  HMDNetworkRouterFirewallRuleWAN *v6;
  HMDNetworkRouterFirewallRuleWAN *v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;

  v4 = (HMDNetworkRouterFirewallRuleWAN *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
    if (-[HMDNetworkRouterFirewallRule isEqual:](&v18, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7
        && (v8 = -[HMDNetworkRouterFirewallRuleWAN purpose](self, "purpose"),
            v8 == -[HMDNetworkRouterFirewallRuleWAN purpose](v7, "purpose"))
        && (v9 = -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol"),
            v9 == -[HMDNetworkRouterFirewallRuleWAN transportProtocol](v7, "transportProtocol")))
      {
        -[HMDNetworkRouterFirewallRuleWAN subject](self, "subject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleWAN subject](v7, "subject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11)
          && (v12 = -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart"),
              v12 == -[HMDNetworkRouterFirewallRuleWAN portStart](v7, "portStart"))
          && (v13 = -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd"),
              v13 == -[HMDNetworkRouterFirewallRuleWAN portEnd](v7, "portEnd")))
        {
          -[HMDNetworkRouterFirewallRuleWAN icmpTypes](self, "icmpTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNetworkRouterFirewallRuleWAN icmpTypes](v7, "icmpTypes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = HMFEqualObjects();

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[HMDNetworkRouterFirewallRuleWAN purpose](self, "purpose");
  v4 = -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol");
  -[HMDNetworkRouterFirewallRuleWAN subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 ^ objc_msgSend(v5, "hash") ^ v4;

  v7 = -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart");
  v8 = v6 ^ v7 ^ -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd");
  -[HMDNetworkRouterFirewallRuleWAN icmpTypes](self, "icmpTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  -[HMDNetworkRouterFirewallRule attributeDescriptions](&v25, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[HMDNetworkRouterFirewallRuleWAN purpose](self, "purpose"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Purpose"), v24);
  v26[0] = v23;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("TransportProtocol"), v22);
  v26[1] = v21;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleWAN subject](self, "subject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Subject"), v20);
  v26[2] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("PortStart"), v9);
  v26[3] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("PortEnd"), v12);
  v26[4] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleWAN icmpTypes](self, "icmpTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("ICMPTypes"), v15);
  v26[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)prettyJSONDictionary
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int v16;
  int v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleWAN;
  -[HMDNetworkRouterFirewallRule prettyJSONDictionary](&v23, sel_prettyJSONDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "__transportProtocolToString:", -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("transportProtocol"));

  v6 = -[HMDNetworkRouterFirewallRuleWAN purpose](self, "purpose");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v6)
    goto LABEL_36;
  v8 = 1;
  v9 = v6;
  do
  {
    if ((v8 & v6) == 0)
      goto LABEL_33;
    if (v8 > 127)
    {
      if (v8 <= 1023)
      {
        switch(v8)
        {
          case 128:
            v10 = CFSTR("Metrics");
            break;
          case 256:
            v10 = CFSTR("Diagnostics");
            break;
          case 512:
            v10 = CFSTR("Remote Access");
            break;
          default:
            goto LABEL_33;
        }
      }
      else if (v8 > 4095)
      {
        if (v8 == 4096)
        {
          v10 = CFSTR("Connectivity Checks");
        }
        else
        {
          if (v8 != 0x2000)
            goto LABEL_33;
          v10 = CFSTR("Emergency Notifications");
        }
      }
      else if (v8 == 1024)
      {
        v10 = CFSTR("Alternative Home Ecosystem");
      }
      else
      {
        if (v8 != 2048)
          goto LABEL_33;
        v10 = CFSTR("Time Synchronization");
      }
      goto LABEL_32;
    }
    if (v8 > 15)
    {
      switch(v8)
      {
        case 16:
          v10 = CFSTR("Events");
          break;
        case 32:
          v10 = CFSTR("Storage");
          break;
        case 64:
          v10 = CFSTR("Notifications");
          break;
        default:
          goto LABEL_33;
      }
LABEL_32:
      v9 &= ~v8;
      objc_msgSend(v7, "addObject:", v10);
      goto LABEL_33;
    }
    v10 = CFSTR("Other");
    switch(v8)
    {
      case 1:
        goto LABEL_32;
      case 2:
        v10 = CFSTR("Firmware Update");
        goto LABEL_32;
      case 4:
        v10 = CFSTR("Account Management");
        goto LABEL_32;
      case 8:
        v10 = CFSTR("Peer to Peer");
        goto LABEL_32;
      default:
        break;
    }
LABEL_33:
    v8 *= 2;
  }
  while (v8 - 1 < v6);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (0x%llx)"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
LABEL_36:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("none");
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("purpose"));
  -[HMDNetworkRouterFirewallRuleWAN subject](self, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prettyJSONDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v14);

  v15 = -[HMDNetworkRouterFirewallRuleWAN transportProtocol](self, "transportProtocol");
  if (v15 >= 2)
  {
    if (v15 == 2)
    {
      -[HMDNetworkRouterFirewallRuleWAN icmpTypes](self, "icmpTypes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "na_map:", &__block_literal_global_161_137999);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("icmpTypes"));

      goto LABEL_46;
    }
  }
  else
  {
    v16 = -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart");
    v17 = -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portStart](self, "portStart"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v19 = CFSTR("port");
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("portStart"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[HMDNetworkRouterFirewallRuleWAN portEnd](self, "portEnd"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("portEnd");
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);
LABEL_46:

  }
  v21 = (void *)objc_msgSend(v4, "copy");

  return v21;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (unsigned)transportProtocol
{
  return self->_transportProtocol;
}

- (HMDNetworkRouterFirewallRuleWANSubject)subject
{
  return self->_subject;
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
  objc_storeStrong((id *)&self->_subject, 0);
}

uint64_t __55__HMDNetworkRouterFirewallRuleWAN_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prettyJSONDictionary");
}

+ (HMFNetAddress)ipAddressAnyIPv4
{
  if (ipAddressAnyIPv4_onceToken != -1)
    dispatch_once(&ipAddressAnyIPv4_onceToken, &__block_literal_global_121_138137);
  return (HMFNetAddress *)(id)ipAddressAnyIPv4_address;
}

+ (HMFNetAddress)ipAddressAnyIPv6
{
  if (ipAddressAnyIPv6_onceToken != -1)
    dispatch_once(&ipAddressAnyIPv6_onceToken, &__block_literal_global_123_138136);
  return (HMFNetAddress *)(id)ipAddressAnyIPv6_address;
}

+ (HMFNetAddress)ipAddressAny
{
  if (ipAddressAny_onceToken != -1)
    dispatch_once(&ipAddressAny_onceToken, &__block_literal_global_125);
  return (HMFNetAddress *)(id)ipAddressAny_address;
}

+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4
{
  int v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = decodeUnsignedIntegerFromJSONDictionary(a3, CFSTR("u"), 1, 0xFFFFFFFFFFFFFFFFLL, &v9);
  v6 = v9;
  v7 = v6;
  if (v5)
    *a4 = objc_msgSend(v6, "unsignedLongLongValue");

  return v5;
}

+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4
{
  int v5;
  id v6;
  void *v7;
  id v9;

  v9 = 0;
  v5 = decodeUnsignedIntegerFromJSONDictionary(a3, CFSTR("f"), 0, 0xFFFFFFFFuLL, &v9);
  v6 = v9;
  v7 = v6;
  if (v5)
    *a4 = objc_msgSend(v6, "unsignedLongValue") & 1;

  return v5;
}

+ (BOOL)__decodeType:(id)a3 transportProtocol:(unsigned __int8 *)a4 error:(id *)a5
{
  id v8;
  char v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = 0;
  v9 = decodeUnsignedIntegerFromJSONDictionary(v8, CFSTR("t"), 1, 0xFFuLL, &v20);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) != 0)
  {
    v12 = objc_msgSend(v10, "unsignedCharValue");
    switch(v12)
    {
      case 5:
        *a4 = 2;
        goto LABEL_10;
      case 2:
        v14 = 1;
        *a4 = 1;
        goto LABEL_17;
      case 1:
        *a4 = 0;
LABEL_10:
        v14 = 1;
        goto LABEL_17;
    }
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
      v24 = v11;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@WAN rule contains an unkown type value %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1070);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (!a5)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v14 = 0;
  *a5 = v13;
LABEL_17:

  return v14;
}

+ (BOOL)__decodeHostnames:(id)a3 subject:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  HMDNetworkRouterFirewallRuleWANSubject *v37;
  BOOL v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  id *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  id v102;
  uint8_t v103[4];
  void *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = v6;
  if (!v8)
  {
    v102 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v9, "count"))
  {
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = a1;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v112 = (uint64_t)v42;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an empty hostname array", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v39);
    v38 = 0;
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (!v13)
    goto LABEL_41;
  v14 = 0x1E0CB3000uLL;
  v15 = *(_QWORD *)v94;
  v89 = v11;
  v90 = v12;
  v91 = a1;
  v92 = v9;
  v87 = v10;
  v84 = *(_QWORD *)v94;
  v85 = a4;
LABEL_9:
  v16 = 0;
  v86 = v13;
LABEL_10:
  if (*(_QWORD *)v94 != v15)
    objc_enumerationMutation(v12);
  v17 = v14;
  v18 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * v16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (!v20)
  {
    v61 = (void *)MEMORY[0x1D17BA0A0]();
    v62 = a1;
    HMFGetOSLogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    v9 = v92;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = v18;
      v66 = (void *)v64;
      *(_DWORD *)buf = 138543618;
      v112 = v64;
      v113 = 2112;
      v114 = v65;
      _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a non-string hostname: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v61);
    goto LABEL_55;
  }
  v88 = v18;
  v21 = v20;
  if (!objc_msgSend(v21, "length") || (unint64_t)objc_msgSend(v21, "length") >= 0xFE)
  {
    v56 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v21, "length");
      *(_DWORD *)v103 = 138543874;
      v104 = v59;
      v105 = 2112;
      v106 = v21;
      v107 = 2048;
      v108 = v60;
      _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its length is out of bounds: %lu", v103, 0x20u);

      v11 = v89;
    }

    objc_autoreleasePoolPop(v56);
LABEL_61:
    v9 = v92;
    goto LABEL_52;
  }
  objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("."));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v22, "count") > 1)
  {
    if (validateHostNameForWANFirewallRule_onceTokenRegex != -1)
      dispatch_once(&validateHostNameForWANFirewallRule_onceTokenRegex, &__block_literal_global_143204);
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v22 = v22;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
    if (!v23)
      goto LABEL_30;
    v24 = v23;
    v25 = *(_QWORD *)v98;
LABEL_23:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v98 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v26);
      v28 = objc_msgSend(v27, "length");
      if ((unint64_t)(v28 - 64) <= 0xFFFFFFFFFFFFFFC0)
        break;
      if (objc_msgSend((id)validateHostNameForWANFirewallRule_componentRegex, "numberOfMatchesInString:options:range:", v27, 0, 0, v28) != 1)
      {
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v103 = 138543874;
          v104 = v46;
          v105 = 2112;
          v106 = v21;
          v107 = 2112;
          v108 = (uint64_t)v27;
          v48 = "%{public}@Hostname '%@' component '%@' is invalid because it does not match regular expression";
          v49 = v45;
          v50 = 32;
LABEL_49:
          _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_INFO, v48, v103, v50);

        }
        goto LABEL_50;
      }
      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
        v12 = v90;
        if (v24)
          goto LABEL_23;
LABEL_30:

        objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v22, "count") - 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsString:", CFSTR("*"));

        if (v30)
        {
          v71 = (void *)MEMORY[0x1D17BA0A0]();
          objc_opt_class();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          HMFGetOSLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v103 = 138543618;
            v104 = v74;
            v105 = 2112;
            v106 = v21;
            _os_log_impl(&dword_1CD062000, v73, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its second-to-last component contains a wildcard", v103, 0x16u);

          }
          objc_autoreleasePoolPop(v71);
          a1 = v91;
          v9 = v92;
          goto LABEL_51;
        }
        objc_msgSend(v22, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "isEqualToString:", CFSTR("local")))
        {
          v75 = (void *)MEMORY[0x1D17BA0A0]();
          objc_opt_class();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          HMFGetOSLogHandle();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v103 = 138543618;
            v104 = v78;
            v105 = 2112;
            v106 = v21;
            _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component is 'local'", v103, 0x16u);

          }
          a1 = v91;
          v9 = v92;
          goto LABEL_76;
        }
        a1 = v91;
        if (objc_msgSend(v31, "containsString:", CFSTR("*")))
        {
          v75 = (void *)MEMORY[0x1D17BA0A0]();
          objc_opt_class();
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          HMFGetOSLogHandle();
          v77 = objc_claimAutoreleasedReturnValue();
          v9 = v92;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v103 = 138543618;
            v104 = v79;
            v105 = 2112;
            v106 = v21;
            _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component contains a wildcard", v103, 0x16u);

            a1 = v91;
          }
LABEL_76:

          objc_autoreleasePoolPop(v75);
          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "rangeOfCharacterFromSet:", v32) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v80 = (void *)MEMORY[0x1D17BA0A0]();
          objc_opt_class();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          HMFGetOSLogHandle();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v103 = 138543618;
            v104 = v83;
            v105 = 2112;
            v106 = v21;
            _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because its last component does not contain letters", v103, 0x16u);

            a1 = v91;
          }

          objc_autoreleasePoolPop(v80);
          v11 = v89;
          goto LABEL_61;
        }

        v11 = v89;
        if (objc_msgSend(v89, "containsObject:", v21))
        {
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v91;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v112 = (uint64_t)v36;
            v113 = 2112;
            v114 = v21;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a duplicate hostname: %@", buf, 0x16u);

            a1 = v91;
          }

          objc_autoreleasePoolPop(v33);
          v12 = v90;
        }
        else
        {
          objc_msgSend(v87, "addObject:", v21);
          objc_msgSend(v89, "addObject:", v21);
        }

        ++v16;
        a4 = v85;
        v14 = v17;
        v9 = v92;
        v15 = v84;
        if (v16 == v86)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
          v10 = v87;
          if (!v13)
          {
LABEL_41:

            v37 = [HMDNetworkRouterFirewallRuleWANSubject alloc];
            v12 = (id)objc_msgSend(v10, "copy");
            *a4 = -[HMDNetworkRouterFirewallRuleWANSubject initWithHostnames:addresses:addressRange:](v37, "initWithHostnames:addresses:addressRange:", v12, 0, 0);
            v38 = 1;
            goto LABEL_56;
          }
          goto LABEL_9;
        }
        goto LABEL_10;
      }
    }
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v27, "length");
      *(_DWORD *)v103 = 138544130;
      v104 = v46;
      v105 = 2112;
      v106 = v21;
      v107 = 2112;
      v108 = (uint64_t)v27;
      v109 = 2048;
      v110 = v47;
      v48 = "%{public}@Hostname '%@' component '%@' is invalid because its length is out of bounds: %lu";
      v49 = v45;
      v50 = 42;
      goto LABEL_49;
    }
LABEL_50:
    v12 = v90;
    a1 = v91;
    v9 = v92;

    objc_autoreleasePoolPop(v43);
    goto LABEL_51;
  }
  v67 = (void *)MEMORY[0x1D17BA0A0]();
  objc_opt_class();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v69 = objc_claimAutoreleasedReturnValue();
  v9 = v92;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v103 = 138543874;
    v104 = v70;
    v105 = 2112;
    v106 = v21;
    v107 = 2048;
    v108 = 2;
    _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_INFO, "%{public}@Hostname '%@' is invalid because it does not contain at least %lu components", v103, 0x20u);

  }
  objc_autoreleasePoolPop(v67);
LABEL_51:

  v11 = v89;
LABEL_52:
  v51 = (void *)MEMORY[0x1D17BA0A0]();
  v52 = a1;
  HMFGetOSLogHandle();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v112 = (uint64_t)v54;
    v113 = 2112;
    v114 = v21;
    _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid hostname: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v51);

LABEL_55:
  v38 = 0;
  v10 = v87;
LABEL_56:

LABEL_57:
  return v38;
}

+ (BOOL)__decodeAddress:(id)a3 subject:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(a1, "__decodeAddresses:subject:", v8, a4, v10, v11);
  return (char)a4;
}

+ (BOOL)__decodeAddresses:(id)a3 subject:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  BOOL v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  HMDNetworkRouterFirewallRuleWANSubject *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  id *v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = a1;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v34;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an empty address array", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    v35 = 0;
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v8 = v6;
  v53 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (!v53)
  {

    goto LABEL_40;
  }
  v47 = a4;
  v48 = v6;
  v52 = 0;
  v49 = 0;
  v9 = *(_QWORD *)v55;
  v10 = v50;
  v51 = *(_QWORD *)v55;
  while (2)
  {
    for (i = 0; i != v53; ++i)
    {
      if (*(_QWORD *)v55 != v9)
        objc_enumerationMutation(v8);
      v12 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (!v14)
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v39;
          v60 = 2112;
          v61 = v12;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a non-string address: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
        goto LABEL_44;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("*")))
      {
        objc_msgSend(a1, "ipAddressAny");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0x100000001;
        goto LABEL_21;
      }
      createHMFNetAddressFromIPAddressString(v14);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = a1;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v45;
          v60 = 2112;
          v61 = v14;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid address: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v42);

LABEL_44:
        v6 = v48;

LABEL_45:
        v35 = 0;
        goto LABEL_46;
      }
      v15 = (void *)v16;
      objc_msgSend(a1, "ipAddressAnyIPv4");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqual:", v17);

      if ((v18 & 1) != 0)
      {
        HIDWORD(v52) = 1;
      }
      else
      {
        objc_msgSend(a1, "ipAddressAnyIPv6");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v15, "isEqual:", v19);

        if ((v20 & 1) != 0)
        {
          LODWORD(v52) = 1;
        }
        else if (objc_msgSend(v15, "addressFamily") == 1)
        {
          LODWORD(v49) = 1;
        }
        else
        {
          HIDWORD(v49) |= objc_msgSend(v15, "addressFamily") == 2;
        }
      }
LABEL_21:
      if (objc_msgSend(v10, "containsObject:", v15))
      {
        v21 = v8;
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = a1;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = v7;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v26;
          v60 = 2112;
          v61 = v15;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a duplicate address: %@", buf, 0x16u);

          v7 = v25;
          v10 = v50;
        }

        objc_autoreleasePoolPop(v22);
        v8 = v21;
        v9 = v51;
      }
      else
      {
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v10, "addObject:", v15);
      }

    }
    v53 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v53)
      continue;
    break;
  }

  a4 = v47;
  v6 = v48;
  if ((HIDWORD(v52) & v49 & 1) != 0 || (v52 & HIDWORD(v49) & 1) != 0)
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = a1;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v30;
      v60 = 2112;
      v61 = v8;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains a mix of wildcard and non-wildcard addresses: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    goto LABEL_45;
  }
LABEL_40:
  v40 = [HMDNetworkRouterFirewallRuleWANSubject alloc];
  v41 = (void *)objc_msgSend(v7, "copy");
  *a4 = -[HMDNetworkRouterFirewallRuleWANSubject initWithHostnames:addresses:addressRange:](v40, "initWithHostnames:addresses:addressRange:", 0, v41, 0);

  v35 = 1;
LABEL_46:

LABEL_47:
  return v35;
}

+ (id)__nonWildcardAddressFrom:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *v24;
  int v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("*")))
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v14;
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v10;
        v15 = "%{public}@WAN rule contains a wildcard address for %@: %@";
LABEL_10:
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v27, 0x20u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    createHMFNetAddressFromIPAddressString(v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(a1, "ipAddressAnyIPv4");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqual:", v18))
      {

      }
      else
      {
        objc_msgSend(a1, "ipAddressAnyIPv6");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v17, "isEqual:", v24);

        if (!v25)
        {
          v16 = v17;
          goto LABEL_22;
        }
      }
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v22;
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v10;
        v23 = "%{public}@WAN rule contains a wildcard address for %@: %@";
        goto LABEL_20;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v22;
        v29 = 2112;
        v30 = v7;
        v31 = 2112;
        v32 = v10;
        v23 = "%{public}@WAN rule contains an invalid %@: %@";
LABEL_20:
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v19);
    v16 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v14;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    v15 = "%{public}@WAN rule contains a non-string %@: %@";
    goto LABEL_10;
  }
LABEL_11:

  objc_autoreleasePoolPop(v11);
  v16 = 0;
LABEL_23:

  return v16;
}

+ (BOOL)__decodeAddressRange:(id)a3 endValue:(id)a4 subject:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDNetworkRouterFirewallRuleWANAddressRange *v13;
  BOOL v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "__nonWildcardAddressFrom:key:", v8, CFSTR("addressStart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "__nonWildcardAddressFrom:key:", v9, CFSTR("addressEnd"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_msgSend(v10, "addressFamily");
      if (v12 == objc_msgSend(v11, "addressFamily"))
      {
        v13 = -[HMDNetworkRouterFirewallRuleWANAddressRange initWithAddressStart:addressEnd:]([HMDNetworkRouterFirewallRuleWANAddressRange alloc], "initWithAddressStart:addressEnd:", v10, v11);
        *a5 = -[HMDNetworkRouterFirewallRuleWANSubject initWithHostnames:addresses:addressRange:]([HMDNetworkRouterFirewallRuleWANSubject alloc], "initWithHostnames:addresses:addressRange:", 0, 0, v13);

        v14 = 1;
LABEL_10:

        goto LABEL_11;
      }
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@IP address range must have matching address family", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }
    v14 = 0;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (BOOL)__decodeSubject:(id)a3 subject:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  BOOL v17;
  int v18;
  BOOL v19;
  char v20;
  char v22;
  BOOL v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *context;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("h"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("i"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("j"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("is"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v7 && !v8 && !v10)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      v16 = "%{public}@One subject must be set";
LABEL_24:
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (v8)
    v17 = v10 == 0;
  else
    v17 = 1;
  v18 = !v17;
  if (v8 | v10)
    v19 = v7 == 0;
  else
    v19 = 1;
  if (!v19 || v18)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      v16 = "%{public}@Only one subject can be set";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (v9 && !v8)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v15;
      v16 = "%{public}@ipAddressEnd is only valid if ipAddressStart is specified";
      goto LABEL_24;
    }
LABEL_25:

    objc_autoreleasePoolPop(v12);
    v20 = 0;
    goto LABEL_26;
  }
  if (v7)
  {
    v22 = objc_msgSend(a1, "__decodeHostnames:subject:", v7, a4);
LABEL_36:
    v20 = v22;
    goto LABEL_26;
  }
  if (v9)
    v23 = 1;
  else
    v23 = v8 == 0;
  if (v23 && !v10)
  {
    v22 = objc_msgSend(a1, "__decodeAddressRange:endValue:subject:", v8, v9, a4);
    goto LABEL_36;
  }
  if (v8)
    v24 = (void *)v8;
  else
    v24 = (void *)v10;
  v25 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;
  if (v27)
  {
    v20 = objc_msgSend(a1, "__decodeAddresses:subject:", v27, a4);
  }
  else
  {
    v28 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (v30)
    {
      v20 = objc_msgSend(a1, "__decodeAddress:subject:", v30, a4);
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v31 = a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v33;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid address value: %@", buf, 0x16u);

        v30 = 0;
      }

      objc_autoreleasePoolPop(context);
      v20 = 0;
    }

    v27 = 0;
  }

LABEL_26:
  return v20;
}

+ (BOOL)__decodePorts:(id)a3 portStart:(unsigned __int16 *)a4 portEnd:(unsigned __int16 *)a5
{
  id v8;
  BOOL v9;
  unsigned __int16 v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  BOOL v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19 = 0;
  v9 = 0;
  if (decodePortFromJSONDictionary(v8, CFSTR("p"), 1, &v19, 0))
  {
    v18 = 0;
    v17 = 0;
    v9 = 0;
    if (decodePortFromJSONDictionary(v8, CFSTR("q"), 0, &v18, &v17))
    {
      v10 = v19;
      if (v17)
      {
        v10 = v18;
        if (v19 > v18)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = a1;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v21 = v14;
            v15 = "%{public}@Must have portStart less than or equal to portEnd";
LABEL_11:
            _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

            goto LABEL_12;
          }
          goto LABEL_12;
        }
        if (v19 && !v18)
        {
          v11 = (void *)MEMORY[0x1D17BA0A0]();
          v12 = a1;
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v21 = v14;
            v15 = "%{public}@Must not have portEnd set to 0";
            goto LABEL_11;
          }
LABEL_12:

          objc_autoreleasePoolPop(v11);
          v9 = 0;
          goto LABEL_14;
        }
      }
      *a4 = v19;
      *a5 = v10;
      v9 = 1;
    }
  }
LABEL_14:

  return v9;
}

+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  HMDNetworkRouterFirewallRule *v7;
  HMDNetworkRouterFirewallRule *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0;
  if (!objc_msgSend(a1, "__decodeType:transportProtocol:error:", v6, &v29, a4))
    goto LABEL_15;
  v28 = 0;
  if ((objc_msgSend(a1, "__decodeFlags:critical:", v6, &v28) & 1) != 0)
  {
    v7 = [HMDNetworkRouterFirewallRule alloc];
    v8 = -[HMDNetworkRouterFirewallRule initWithJSONDictionary:critical:](v7, "initWithJSONDictionary:critical:", v6, v28);
    if (!v8 || (v27 = 0, (objc_msgSend(a1, "__decodePurpose:purpose:", v6, &v27) & 1) == 0))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_32;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("r"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (!v11)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v18;
        v32 = 2112;
        v33 = CFSTR("r");
        v34 = 2112;
        v35 = v6;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@WAN rule contains an invalid '%@' value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      goto LABEL_31;
    }
    v26 = 0;
    v12 = objc_msgSend(a1, "__decodeSubject:subject:", v11, &v26);
    v13 = v26;
    if ((v12 & 1) != 0)
    {
      *(_WORD *)buf = 0;
      v25 = 0;
      if (v29 >= 2u)
      {
        if (v29 != 2)
        {
LABEL_28:
          v19 = 0;
          goto LABEL_29;
        }
        +[HMDNetworkRouterFirewallRuleICMPType createListWithJSONDictionary:key:](HMDNetworkRouterFirewallRuleICMPType, "createListWithJSONDictionary:key:", v11, CFSTR("it"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
LABEL_29:
          v20 = objc_alloc((Class)a1);
          -[HMDNetworkRouterFirewallRule name](v8, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[HMDNetworkRouterFirewallRule isCritical](v8, "isCritical");
          WORD1(v24) = v25;
          LOWORD(v24) = *(_WORD *)buf;
          v14 = (void *)objc_msgSend(v20, "initWithJSONDictionary:name:critical:purpose:transportProtocol:subject:portStart:portEnd:icmpTypes:", v6, v21, v22, v27, v29, v13, v24, v19);

LABEL_30:
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
      }
      else if ((objc_msgSend(a1, "__decodePorts:portStart:portEnd:", v11, buf, &v25) & 1) != 0)
      {
        goto LABEL_28;
      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_30;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_15:
    v14 = 0;
  }
LABEL_33:

  return v14;
}

void __47__HMDNetworkRouterFirewallRuleWAN_ipAddressAny__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28600]), "initWithHostname:", CFSTR("*"));
  v1 = (void *)ipAddressAny_address;
  ipAddressAny_address = v0;

}

void __51__HMDNetworkRouterFirewallRuleWAN_ipAddressAnyIPv6__block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[2];

  v2[0] = xmmword_1CDB8F810;
  *(_OWORD *)((char *)v2 + 12) = *(__int128 *)((char *)&xmmword_1CDB8F810 + 12);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28600]), "initWithSocketAddress:", v2);
  v1 = (void *)ipAddressAnyIPv6_address;
  ipAddressAnyIPv6_address = v0;

}

void __51__HMDNetworkRouterFirewallRuleWAN_ipAddressAnyIPv4__block_invoke()
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_1CDB8FBC0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28600]), "initWithSocketAddress:", &v2);
  v1 = (void *)ipAddressAnyIPv4_address;
  ipAddressAnyIPv4_address = v0;

}

@end
