@implementation NEOnDemandRule

- (NEOnDemandRule)initWithAction:(int64_t)a3
{
  NEOnDemandRule *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEOnDemandRule;
  result = -[NEOnDemandRule init](&v5, sel_init);
  if (result)
    result->_action = a3;
  return result;
}

- (NEOnDemandRule)initWithCoder:(id)a3
{
  id v4;
  NEOnDemandRule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *DNSSearchDomainMatch;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *DNSServerAddressMatch;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *SSIDMatch;
  uint64_t v21;
  NSURL *probeURL;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NEOnDemandRule;
  v5 = -[NEOnDemandRule init](&v24, sel_init);
  if (v5)
  {
    v5->_action = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Action"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("DNSSearchDomainMatch"));
    v9 = objc_claimAutoreleasedReturnValue();
    DNSSearchDomainMatch = v5->_DNSSearchDomainMatch;
    v5->_DNSSearchDomainMatch = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("DNSServerAddressMatch"));
    v14 = objc_claimAutoreleasedReturnValue();
    DNSServerAddressMatch = v5->_DNSServerAddressMatch;
    v5->_DNSServerAddressMatch = (NSArray *)v14;

    v5->_interfaceTypeMatch = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("InterfaceTypeMatch"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("SSIDMatch"));
    v19 = objc_claimAutoreleasedReturnValue();
    SSIDMatch = v5->_SSIDMatch;
    v5->_SSIDMatch = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v21;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  NEOnDemandRuleAction v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  NEOnDemandRuleInterfaceType v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[NEOnDemandRule action](self, "action");
    if (v6 == objc_msgSend(v5, "action"))
    {
      -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "DNSSearchDomainMatch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "DNSSearchDomainMatch");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v9;
        if (!objc_msgSend(v9, "isEqualToArray:"))
        {
          v10 = 0;
          goto LABEL_26;
        }
      }
      -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "DNSServerAddressMatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "DNSServerAddressMatch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToArray:", v13))
        {
          v10 = 0;
          goto LABEL_24;
        }
        v33 = v13;
      }
      v14 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
      if (v14 == objc_msgSend(v5, "interfaceTypeMatch"))
      {
        -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "SSIDMatch");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v15 == v16;
        v13 = v33;
        v31 = (void *)v16;
        v32 = (void *)v17;
        if (v18
          || (-[NEOnDemandRule SSIDMatch](self, "SSIDMatch"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v5, "SSIDMatch"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = v19,
              objc_msgSend(v19, "isEqualToArray:")))
        {
          -[NEOnDemandRule probeURL](self, "probeURL", v3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "probeURL");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v20 == (void *)v21)
          {

            v10 = 1;
          }
          else
          {
            v22 = (void *)v21;
            -[NEOnDemandRule probeURL](self, "probeURL");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "probeURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v23, "isEqual:", v24);

          }
          v26 = v31;
          v25 = v32;
          v3 = v28;
          v13 = v33;
          if (v32 == v31)
          {
LABEL_23:

            if (v11 == v12)
              goto LABEL_25;
            goto LABEL_24;
          }
        }
        else
        {
          v10 = 0;
          v26 = v31;
          v25 = v32;
        }

        goto LABEL_23;
      }
      v10 = 0;
      v13 = v33;
      if (v11 == v12)
      {
LABEL_25:

        if (v7 == v8)
        {
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
LABEL_24:

      goto LABEL_25;
    }
  }
  v10 = 0;
LABEL_28:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEOnDemandRule action](self, "action"), CFSTR("Action"));
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DNSSearchDomainMatch"));

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("DNSServerAddressMatch"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"), CFSTR("InterfaceTypeMatch"));
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SSIDMatch"));

  -[NEOnDemandRule probeURL](self, "probeURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ProbeURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAction:", -[NEOnDemandRule action](self, "action"));
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDNSSearchDomainMatch:", v5);

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDNSServerAddressMatch:", v6);

  objc_msgSend(v4, "setInterfaceTypeMatch:", -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch"));
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSSIDMatch:", v7);

  -[NEOnDemandRule probeURL](self, "probeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProbeURL:", v8);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NEOnDemandRule action](self, "action") >= NEOnDemandRuleActionConnect
    && -[NEOnDemandRule action](self, "action") < (NEOnDemandRuleActionIgnore|NEOnDemandRuleActionConnect))
  {
    v5 = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid action"), v4);
    v5 = 0;
  }
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v11)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid search domain"), v4);
            v5 = 0;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }

  }
  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v17)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid DNS server"), v4);
            v5 = 0;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

  }
  return v5 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  NEOnDemandRuleInterfaceType v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = -[NEOnDemandRule action](self, "action") - 1;
  if (v8 <= 3)
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", off_1E3CC26D8[v8], CFSTR("action"), v5, a4);
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a4 | 1;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("DNSSearchDomainMatch"), v5, a4 | 1);

  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("DNSServerAddressMatch"), v5, a4 | 1);

  v12 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
  switch(v12)
  {
    case NEOnDemandRuleInterfaceTypeAny:
      v13 = CFSTR("any");
      goto LABEL_9;
    case NEOnDemandRuleInterfaceTypeWiFi:
      v13 = CFSTR("WiFi");
      goto LABEL_9;
    case NEOnDemandRuleInterfaceTypeCellular:
      v13 = CFSTR("cellular");
LABEL_9:
      objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v13, CFSTR("interfaceTypeMatch"), v5, a4);
      break;
  }
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("SSIDMatch"), v5, v10);

  -[NEOnDemandRule probeURL](self, "probeURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v16, CFSTR("probeURL"), v5, v10);

  return v7;
}

- (id)description
{
  return -[NEOnDemandRule descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (id)copyLegacyDictionary
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NEOnDemandRuleInterfaceType v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[NEOnDemandRule action](self, "action") - 1;
  if (v4 <= 3)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", **((_QWORD **)&unk_1E3CC26F8 + v4), *MEMORY[0x1E0CE9030]);
  -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEOnDemandRule DNSSearchDomainMatch](self, "DNSSearchDomainMatch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CE9060]);

  }
  -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NEOnDemandRule DNSServerAddressMatch](self, "DNSServerAddressMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CE9068]);

  }
  v9 = -[NEOnDemandRule interfaceTypeMatch](self, "interfaceTypeMatch");
  if (v9 == NEOnDemandRuleInterfaceTypeCellular)
  {
    v11 = *MEMORY[0x1E0CE9070];
    v10 = CFSTR("Cellular");
  }
  else
  {
    if (v9 != NEOnDemandRuleInterfaceTypeWiFi)
      goto LABEL_12;
    v10 = (const __CFString *)*MEMORY[0x1E0CE91F8];
    v11 = *MEMORY[0x1E0CE9070];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);
LABEL_12:
  -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NEOnDemandRule SSIDMatch](self, "SSIDMatch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CE9078]);

  }
  -[NEOnDemandRule probeURL](self, "probeURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NEOnDemandRule probeURL](self, "probeURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CE9080]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEOnDemandRule *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSArray *DNSSearchDomainMatch;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSArray *DNSServerAddressMatch;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  NSArray *SSIDMatch;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSURL *probeURL;
  NEOnDemandRule *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)NEOnDemandRule;
  v5 = -[NEOnDemandRule init](&v37, sel_init);
  if (!v5)
    goto LABEL_29;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9030]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v6))
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91D8]) & 1) != 0)
    {
      v7 = 4;
LABEL_12:
      v5->_action = v7;
      goto LABEL_13;
    }
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91C0]) & 1) != 0)
    {
      v7 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91C8]) & 1) != 0)
    {
      v7 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91D0]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91B8]))
    {
      v7 = 3;
      goto LABEL_12;
    }
  }
LABEL_13:
  v8 = *MEMORY[0x1E0CE9060];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9060]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = isa_nsarray(v9);

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    DNSSearchDomainMatch = v5->_DNSSearchDomainMatch;
    v5->_DNSSearchDomainMatch = (NSArray *)v12;

  }
  v14 = *MEMORY[0x1E0CE9068];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9068]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = isa_nsarray(v15);

  if (v16)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    DNSServerAddressMatch = v5->_DNSServerAddressMatch;
    v5->_DNSServerAddressMatch = (NSArray *)v18;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9070]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isa_nsstring(v20))
    goto LABEL_24;
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Cellular")) & 1) != 0)
  {
    v21 = 3;
  }
  else
  {
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CE91F0]) & 1) != 0
      || !objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CE91F8]))
    {
      goto LABEL_24;
    }
    v21 = 2;
  }
  v5->_interfaceTypeMatch = v21;
LABEL_24:
  v22 = *MEMORY[0x1E0CE9078];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9078]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = isa_nsarray(v23);

  if (v24)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    SSIDMatch = v5->_SSIDMatch;
    v5->_SSIDMatch = (NSArray *)v26;

  }
  v28 = *MEMORY[0x1E0CE9080];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9080]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = isa_nsstring(v29);

  if (v30)
  {
    v31 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLWithString:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v33;

  }
  v35 = v5;

LABEL_29:
  return v5;
}

- (NEOnDemandRuleAction)action
{
  return self->_action;
}

- (NSArray)DNSSearchDomainMatch
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDNSSearchDomainMatch:(NSArray *)DNSSearchDomainMatch
{
  objc_setProperty_atomic_copy(self, a2, DNSSearchDomainMatch, 16);
}

- (NSArray)DNSServerAddressMatch
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDNSServerAddressMatch:(NSArray *)DNSServerAddressMatch
{
  objc_setProperty_atomic_copy(self, a2, DNSServerAddressMatch, 24);
}

- (NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  return self->_interfaceTypeMatch;
}

- (void)setInterfaceTypeMatch:(NEOnDemandRuleInterfaceType)interfaceTypeMatch
{
  self->_interfaceTypeMatch = interfaceTypeMatch;
}

- (NSArray)SSIDMatch
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSSIDMatch:(NSArray *)SSIDMatch
{
  objc_setProperty_atomic_copy(self, a2, SSIDMatch, 40);
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProbeURL:(NSURL *)probeURL
{
  objc_setProperty_atomic_copy(self, a2, probeURL, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_SSIDMatch, 0);
  objc_storeStrong((id *)&self->_DNSServerAddressMatch, 0);
  objc_storeStrong((id *)&self->_DNSSearchDomainMatch, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createOnDemandRulesFromLegacyDictionary:(uint64_t)a1
{
  id v2;
  void *v3;
  NEEvaluateConnectionRule *v4;
  id v5;
  void *v6;
  NEEvaluateConnectionRule *v7;
  void *v8;
  NEEvaluateConnectionRule *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __objc2_class *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  NEOnDemandRuleEvaluateConnection *v29;
  void *v31;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9020]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsarray(v3) && objc_msgSend(v3, "count"))
  {
    v4 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]([NEEvaluateConnectionRule alloc], "initWithMatchDomains:andAction:", v3, 2);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v4);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9018]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v6) && objc_msgSend(v6, "count"))
  {
    v7 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]([NEEvaluateConnectionRule alloc], "initWithMatchDomains:andAction:", v6, 1);
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v7);

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9028]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v8) && objc_msgSend(v8, "count"))
  {
    v9 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:]([NEEvaluateConnectionRule alloc], "initWithMatchDomains:andAction:", v8, 1);
    if (!v5)
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "addObject:", v9);

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9088]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (isa_nsarray(v10))
  {
    v34 = v5;
    v31 = v10;
    v32 = v2;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (!v12)
    {
      v14 = 0;
      LOBYTE(v33) = 0;
      goto LABEL_58;
    }
    v13 = v12;
    v14 = 0;
    v33 = 0;
    v15 = *(_QWORD *)v40;
    v16 = *MEMORY[0x1E0CE9030];
    v17 = *MEMORY[0x1E0CE91D8];
    v18 = *MEMORY[0x1E0CE91C0];
    v38 = *MEMORY[0x1E0CE91C8];
    v36 = *MEMORY[0x1E0CE91D0];
    v35 = *MEMORY[0x1E0CE91B8];
    v37 = *MEMORY[0x1E0CE91C0];
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(v11);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v19);
        if (isa_nsdictionary(v20))
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v21))
          {
            if (objc_msgSend(v21, "isEqualToString:", v17))
            {
              v22 = NEOnDemandRuleIgnore;
              goto LABEL_31;
            }
            if (objc_msgSend(v21, "isEqualToString:", v18))
            {
              v22 = NEOnDemandRuleConnect;
              goto LABEL_31;
            }
            if (objc_msgSend(v21, "isEqualToString:", v38))
            {
              v22 = NEOnDemandRuleDisconnect;
              goto LABEL_31;
            }
            if (objc_msgSend(v21, "isEqualToString:", v36))
            {
              v22 = NEOnDemandRuleEvaluateConnection;
LABEL_31:
              v23 = (id)objc_msgSend([v22 alloc], "initFromLegacyDictionary:", v20);
              if (v23)
              {
LABEL_32:
                objc_msgSend(v23, "DNSSearchDomainMatch", v31, v32);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24
                  || (objc_msgSend(v23, "DNSServerAddressMatch"),
                      (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
                {

                  if (!v14)
                    goto LABEL_35;
                }
                else
                {
                  objc_msgSend(v23, "SSIDMatch");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v25 || objc_msgSend(v23, "interfaceTypeMatch"))
                  {

                  }
                  else
                  {
                    objc_msgSend(v23, "probeURL");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v26)
                      v27 = v33;
                    else
                      v27 = 1;
                    v33 = v27;
                  }
                  v18 = v37;
                  if (!v14)
LABEL_35:
                    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                }
                objc_msgSend(v14, "addObject:", v23);

              }
            }
            else if (objc_msgSend(v21, "isEqualToString:", v35))
            {
              if (v34)
              {
                v23 = -[NEOnDemandRuleEvaluateConnection initFromLegacyDictionary:]([NEOnDemandRuleEvaluateConnection alloc], "initFromLegacyDictionary:", v20);
                objc_msgSend(v23, "setConnectionRules:", v34);
                v18 = v37;
                if (v23)
                  goto LABEL_32;
              }
              else
              {
                v18 = v37;
              }
            }
          }

        }
        ++v19;
      }
      while (v13 != v19);
      v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v13 = v28;
      if (!v28)
      {
LABEL_58:

        v10 = v31;
        v2 = v32;
        v5 = v34;
        if ((v33 & 1) == 0)
          goto LABEL_59;
        goto LABEL_63;
      }
    }
  }
  v14 = 0;
LABEL_59:
  if (v5)
  {
    v29 = objc_alloc_init(NEOnDemandRuleEvaluateConnection);
    -[NEOnDemandRuleEvaluateConnection setConnectionRules:](v29, "setConnectionRules:", v5);
    if (!v14)
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v14, "addObject:", v29, v31, v32);

  }
LABEL_63:

  return v14;
}

@end
