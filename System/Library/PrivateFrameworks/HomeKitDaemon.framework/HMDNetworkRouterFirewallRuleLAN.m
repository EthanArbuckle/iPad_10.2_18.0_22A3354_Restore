@implementation HMDNetworkRouterFirewallRuleLAN

- (HMDNetworkRouterFirewallRuleLAN)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9
{
  HMDNetworkRouterFirewallRuleLAN *v12;
  HMDNetworkRouterFirewallRuleLAN *v13;
  HMDNetworkRouterFirewallRuleLAN *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  v12 = -[HMDNetworkRouterFirewallRule initWithJSONDictionary:name:critical:](&v16, sel_initWithJSONDictionary_name_critical_, a3, a4, a5);
  v13 = v12;
  if (v12)
  {
    v12->_purpose = a6;
    v12->_allowInterAccessoryConnections = a7;
    v12->_direction = a8;
    v12->_requiredForHAPFunctionality = a9;
    v14 = v12;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMDNetworkRouterFirewallRuleLAN *v4;
  HMDNetworkRouterFirewallRuleLAN *v5;
  HMDNetworkRouterFirewallRuleLAN *v6;
  HMDNetworkRouterFirewallRuleLAN *v7;
  unint64_t v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = (HMDNetworkRouterFirewallRuleLAN *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
    if (-[HMDNetworkRouterFirewallRule isEqual:](&v14, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7
        && (v8 = -[HMDNetworkRouterFirewallRuleLAN purpose](self, "purpose"),
            v8 == -[HMDNetworkRouterFirewallRuleLAN purpose](v7, "purpose"))
        && (v9 = -[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](self, "areConnectionsWithOtherAccessoriesAllowed"), v9 == -[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](v7, "areConnectionsWithOtherAccessoriesAllowed"))&& (v10 = -[HMDNetworkRouterFirewallRuleLAN direction](self, "direction"), v10 == -[HMDNetworkRouterFirewallRuleLAN direction](v7, "direction")))
      {
        v11 = -[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](self, "isRequiredForHAPFunctionality");
        v12 = v11 ^ -[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](v7, "isRequiredForHAPFunctionality") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;

  v3 = -[HMDNetworkRouterFirewallRuleLAN purpose](self, "purpose");
  v4 = -[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](self, "areConnectionsWithOtherAccessoriesAllowed");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 ^ v3 ^ (4 * -[HMDNetworkRouterFirewallRuleLAN direction](self, "direction"));
  v7 = -[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](self, "isRequiredForHAPFunctionality");
  v8 = 8;
  if (!v7)
    v8 = 0;
  return v6 ^ v8;
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

  v20[4] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  -[HMDNetworkRouterFirewallRule attributeDescriptions](&v19, sel_attributeDescriptions);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDNetworkRouterFirewallRuleLAN purpose](self, "purpose"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Purpose"), v18);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](self, "areConnectionsWithOtherAccessoriesAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("AreConnectionsWithOtherAccessoriesAllowed"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[HMDNetworkRouterFirewallRuleLAN direction](self, "direction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Direction"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](self, "isRequiredForHAPFunctionality"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("IsRequiredForHAPFunctionality"), v12);
  v20[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)prettyJSONDictionary
{
  int v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDNetworkRouterFirewallRuleLAN direction](self, "direction");
  v4 = CFSTR("fromAccessory");
  if (v3 == 1)
    v4 = CFSTR("toAccessory");
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterFirewallRuleLAN;
  v5 = v4;
  -[HMDNetworkRouterFirewallRule prettyJSONDictionary](&v18, sel_prettyJSONDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v19[0] = CFSTR("direction");
  v19[1] = CFSTR("purpose");
  v20[0] = v5;
  v8 = -[HMDNetworkRouterFirewallRuleLAN purpose](self, "purpose");
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v8)
  {
    v10 = 1;
    v11 = v8;
    while (1)
    {
      if ((v10 & v8) != 0)
      {
        if (v10 <= 15)
        {
          v12 = CFSTR("Other");
          switch(v10)
          {
            case 1:
              goto LABEL_17;
            case 2:
              v12 = CFSTR("Local Access");
              goto LABEL_17;
            case 4:
              v12 = CFSTR("Local IoT Access");
              goto LABEL_17;
            case 8:
              v12 = CFSTR("Firmware Update");
              goto LABEL_17;
            default:
              goto LABEL_18;
          }
          goto LABEL_18;
        }
        switch(v10)
        {
          case 16:
            v12 = CFSTR("Time Synchronization");
            goto LABEL_17;
          case 32:
            v12 = CFSTR("Connectivity Checks");
            goto LABEL_17;
          case 64:
            v12 = CFSTR("Emergency Notifications");
LABEL_17:
            v11 &= ~v10;
            objc_msgSend(v9, "addObject:", v12);
            break;
        }
      }
LABEL_18:
      v10 *= 2;
      if (v10 - 1 >= v8)
      {
        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (0x%llx)"), v11, v18.receiver, v18.super_class);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v13);

        }
        break;
      }
    }
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("none");
  }

  v20[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addEntriesFromDictionary:", v15);
  if (-[HMDNetworkRouterFirewallRuleLAN areConnectionsWithOtherAccessoriesAllowed](self, "areConnectionsWithOtherAccessoriesAllowed"))
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("allowInterAccessoryConnections"));
  }
  if (-[HMDNetworkRouterFirewallRuleLAN isRequiredForHAPFunctionality](self, "isRequiredForHAPFunctionality"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("requiredForHAPFunctionality"));
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (BOOL)areConnectionsWithOtherAccessoriesAllowed
{
  return self->_allowInterAccessoryConnections;
}

- (unsigned)direction
{
  return self->_direction;
}

- (BOOL)isRequiredForHAPFunctionality
{
  return self->_requiredForHAPFunctionality;
}

+ (BOOL)__decodePurpose:(id)a3 purpose:(unint64_t *)a4 error:(id *)a5
{
  char v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  v7 = decodeUnsignedIntegerFromJSONDictionary(a3, CFSTR("u"), 1, 0xFFFFFFFFFFFFFFFFLL, &v11);
  v8 = v11;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    *a4 = objc_msgSend(v8, "unsignedLongLongValue");
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)__decodeFlags:(id)a3 critical:(BOOL *)a4 allowInterAccessoryConnections:(BOOL *)a5 requiredForHAPFunctionality:(BOOL *)a6 error:(id *)a7
{
  char v11;
  id v12;
  void *v13;
  char v14;
  id v16;

  v16 = 0;
  v11 = decodeUnsignedIntegerFromJSONDictionary(a3, CFSTR("f"), 0, 0xFFFFFFFFuLL, &v16);
  v12 = v16;
  v13 = v12;
  if ((v11 & 1) != 0)
  {
    v14 = objc_msgSend(v12, "unsignedLongValue");
    *a4 = v14 & 1;
    *a5 = (v14 & 2) != 0;
    *a6 = (v14 & 4) != 0;
  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (BOOL)__decodeType:(id)a3 type:(unsigned __int8 *)a4 error:(id *)a5
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
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v20 = 0;
  v9 = decodeUnsignedIntegerFromJSONDictionary(v8, CFSTR("t"), 1, 0xFFuLL, &v20);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v13 = 0;
      *a5 = v14;
      goto LABEL_12;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v10, "unsignedCharValue");
  if ((v12 - 1) > 2)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v18;
      v23 = 2112;
      v24 = CFSTR("t");
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1070);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  *a4 = v12;
  v13 = 1;
LABEL_12:

  return v13;
}

+ (BOOL)__decodeDirection:(id)a3 direction:(unsigned __int8 *)a4 error:(id *)a5
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
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v20 = 0;
  v9 = decodeUnsignedIntegerFromJSONDictionary(v8, CFSTR("d"), 1, 0xFFuLL, &v20);
  v10 = v20;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
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
  if (!v12)
  {
    *a4 = 0;
    v13 = 1;
    goto LABEL_14;
  }
  if (v12 != 1)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v18;
      v23 = 2112;
      v24 = CFSTR("d");
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1070);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v13 = 1;
  *a4 = 1;
LABEL_14:

  return v13;
}

+ (BOOL)__decodeTransportProtocolFromJSONDictionary:(id)a3 key:(id)a4 transportProtocol:(unsigned __int8 *)a5 error:(id *)a6
{
  id v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v23 = 0;
  v12 = decodeUnsignedIntegerFromJSONDictionary(v10, v11, 1, 0xFFuLL, &v23);
  v13 = v23;
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    v15 = objc_msgSend(v13, "unsignedCharValue");
    switch(v15)
    {
      case 2:
        *a5 = 2;
        goto LABEL_10;
      case 1:
        v17 = 1;
        *a5 = 1;
        goto LABEL_17;
      case 0:
        *a5 = 0;
LABEL_10:
        v17 = 1;
        goto LABEL_17;
    }
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v21;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Rule contains an unknown '%@' value %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1070);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  if (!a6)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v17 = 0;
  *a6 = v16;
LABEL_17:

  return v17;
}

+ (id)createWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  __objc2_class *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  unsigned __int8 v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = 0;
  if (objc_msgSend(a1, "__decodeType:type:error:", v6, &v25, a4))
  {
    v24 = 0;
    v23 = 0;
    if (objc_msgSend(a1, "__decodeFlags:critical:allowInterAccessoryConnections:requiredForHAPFunctionality:error:", v6, &v24, (char *)&v23 + 1, &v23, a4))
    {
      v7 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "superclass"));
      v8 = (void *)objc_msgSend(v7, "initWithJSONDictionary:critical:", v6, v24);
      if (!v8)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        goto LABEL_27;
      }
      v22 = 0;
      v9 = 0;
      if (!objc_msgSend(a1, "__decodePurpose:purpose:error:", v6, &v22, a4))
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("r"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      if (v12)
      {
        buf[0] = 0;
        if (objc_msgSend(a1, "__decodeDirection:direction:error:", v12, buf, a4))
        {
          switch(v25)
          {
            case 1:
              v13 = HMDNetworkRouterFirewallRuleLANMulticast;
              goto LABEL_25;
            case 2:
              v13 = HMDNetworkRouterFirewallRuleLANStatic;
              goto LABEL_25;
            case 3:
              v13 = HMDNetworkRouterFirewallRuleLANDynamic;
LABEL_25:
              objc_msgSend(v8, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v8, "isCritical");
              LOBYTE(v21) = v23;
              -[__objc2_class createWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:ruleDictionary:error:](v13, "createWithJSONDictionary:name:critical:purpose:allowInterAccessoryConnections:direction:requiredForHAPFunctionality:ruleDictionary:error:", v6, v18, v19, v22, HIBYTE(v23), buf[0], v21, v12, a4);
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_26;
          }
        }
      }
      else
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = a1;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v27 = v17;
          v28 = 2112;
          v29 = CFSTR("r");
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v14);
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

          goto LABEL_27;
        }
      }
      v9 = 0;
      goto LABEL_26;
    }
  }
  v9 = 0;
LABEL_28:

  return v9;
}

+ (id)createWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5 purpose:(unint64_t)a6 allowInterAccessoryConnections:(BOOL)a7 direction:(unsigned __int8)a8 requiredForHAPFunctionality:(BOOL)a9 ruleDictionary:(id)a10 error:(id *)a11
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v13 = a3;
  v14 = a4;
  v15 = a10;
  v16 = (void *)MEMORY[0x24BDBCE88];
  v17 = *MEMORY[0x24BDBCAB0];
  v18 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v20, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v21);
}

@end
