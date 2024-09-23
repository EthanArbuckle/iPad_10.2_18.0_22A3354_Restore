@implementation NEPathRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsCellularBehavior:(int64_t)a3
{
  BOOL v5;
  const char *v6;
  uint64_t v7;

  if (!self)
    return 1;
  v5 = 1;
  if (objc_getProperty(self, a2, 96, 1))
  {
    v7 = objc_msgSend(objc_getProperty(self, v6, 96, 1), "integerValue");
    return v7 != 1 && (a3 != 2 || v7 != 0);
  }
  return v5;
}

- (NEPathRule)initWithCoder:(id)a3
{
  id v4;
  NEPathRule *v5;
  uint64_t v6;
  NSNumber *aggregateEnterpriseCellular;
  uint64_t v8;
  NSNumber *aggregatePersonalCellular;
  uint64_t v10;
  NSNumber *aggregateEnterpriseWiFi;
  uint64_t v12;
  NSNumber *aggregatePersonalWiFi;
  uint64_t v14;
  NSString *temporaryAllowMulticastNetworkName;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEPathRule;
  v5 = -[NEAppRule initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_internalCellularBehavior = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("CellularBehavior"));
    v5->_denyCellularFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DenyCellularFallback"));
    v5->_denyMulticast = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DenyMulticast"));
    v5->_multicastPreferenceSet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MulticastPreferenceSet"));
    v5->_isIdentifierExternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsIdentifierExternal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AggregateEnterpriseCellularBehavior"));
    v6 = objc_claimAutoreleasedReturnValue();
    aggregateEnterpriseCellular = v5->_aggregateEnterpriseCellular;
    v5->_aggregateEnterpriseCellular = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AggregatePersonalCellularBehavior"));
    v8 = objc_claimAutoreleasedReturnValue();
    aggregatePersonalCellular = v5->_aggregatePersonalCellular;
    v5->_aggregatePersonalCellular = (NSNumber *)v8;

    v5->_internalWiFiBehavior = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("WiFiBehavior"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AggregateEnterpriseWiFiBehavior"));
    v10 = objc_claimAutoreleasedReturnValue();
    aggregateEnterpriseWiFi = v5->_aggregateEnterpriseWiFi;
    v5->_aggregateEnterpriseWiFi = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AggregatePersonalWiFiBehavior"));
    v12 = objc_claimAutoreleasedReturnValue();
    aggregatePersonalWiFi = v5->_aggregatePersonalWiFi;
    v5->_aggregatePersonalWiFi = (NSNumber *)v12;

    v5->_denyAll = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DenyAll"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TemporaryAllowMulticastNetworkName"));
    v14 = objc_claimAutoreleasedReturnValue();
    temporaryAllowMulticastNetworkName = v5->_temporaryAllowMulticastNetworkName;
    v5->_temporaryAllowMulticastNetworkName = (NSString *)v14;

  }
  return v5;
}

- (int64_t)cellularBehavior
{
  const char *v3;
  id Property;
  SEL v5;
  id v6;
  const char *v7;
  int64_t v8;
  SEL v9;
  uint64_t v10;
  int64_t result;
  BOOL v12;

  if (!-[NEPathRule isAggregateRule](self, a2))
  {
    if (self)
      return self->_internalCellularBehavior;
    else
      return 0;
  }
  if (!self)
  {
    v6 = 0;
    return objc_msgSend(v6, "integerValue");
  }
  Property = objc_getProperty(self, v3, 96, 1);
  v6 = objc_getProperty(self, v5, 88, 1);
  if (!Property)
    return objc_msgSend(v6, "integerValue");
  if (!v6)
  {
    v6 = objc_getProperty(self, v7, 96, 1);
    return objc_msgSend(v6, "integerValue");
  }
  v8 = objc_msgSend(objc_getProperty(self, v7, 96, 1), "integerValue");
  v10 = objc_msgSend(objc_getProperty(self, v9, 88, 1), "integerValue");
  objc_opt_self();
  result = v8;
  if (v8 != v10)
  {
    result = 1;
    if (v8 != 1 && v10 != 1)
    {
      if (v10)
        v12 = v8 == 0;
      else
        v12 = 1;
      if (v12)
        return 0;
      else
        return 2;
    }
  }
  return result;
}

- (int64_t)wifiBehavior
{
  const char *v3;
  id Property;
  SEL v5;
  id v6;
  const char *v7;
  int64_t v8;
  SEL v9;
  uint64_t v10;
  int64_t result;
  BOOL v12;

  if (!-[NEPathRule isAggregateRule](self, a2))
  {
    if (self)
      return self->_internalWiFiBehavior;
    else
      return 0;
  }
  if (!self)
  {
    v6 = 0;
    return objc_msgSend(v6, "integerValue");
  }
  Property = objc_getProperty(self, v3, 120, 1);
  v6 = objc_getProperty(self, v5, 112, 1);
  if (!Property)
    return objc_msgSend(v6, "integerValue");
  if (!v6)
  {
    v6 = objc_getProperty(self, v7, 120, 1);
    return objc_msgSend(v6, "integerValue");
  }
  v8 = objc_msgSend(objc_getProperty(self, v7, 120, 1), "integerValue");
  v10 = objc_msgSend(objc_getProperty(self, v9, 112, 1), "integerValue");
  objc_opt_self();
  result = v8;
  if (v8 != v10)
  {
    result = 1;
    if (v8 != 1 && v10 != 1)
    {
      if (v10)
        v12 = v8 == 0;
      else
        v12 = 1;
      if (v12)
        return 0;
      else
        return 2;
    }
  }
  return result;
}

- (BOOL)isAggregateRule
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  const char *v6;

  if (!a1)
    return 0;
  v3 = 1;
  if (!objc_getProperty(a1, a2, 96, 1) && !objc_getProperty(a1, v4, 88, 1) && !objc_getProperty(a1, v5, 120, 1))
    return objc_getProperty(a1, v6, 112, 1) != 0;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v19;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "matchSigningIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(v4, "matchPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEAppRule matchPath](self, "matchPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        objc_msgSend(v4, "temporaryAllowMulticastNetworkName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEPathRule temporaryAllowMulticastNetworkName](self, "temporaryAllowMulticastNetworkName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12)
          && (v13 = objc_msgSend(v4, "cellularBehavior"), v13 == -[NEPathRule cellularBehavior](self, "cellularBehavior"))&& (v14 = objc_msgSend(v4, "wifiBehavior"), v14 == -[NEPathRule wifiBehavior](self, "wifiBehavior"))&& (v15 = objc_msgSend(v4, "isIdentifierExternal"), v15 == -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"))&& (v16 = objc_msgSend(v4, "denyMulticast"), v16 == -[NEPathRule denyMulticast](self, "denyMulticast"))&& (v17 = objc_msgSend(v4, "multicastPreferenceSet"), v17 == -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet")))
        {
          v19 = objc_msgSend(v4, "denyAll");
          v6 = v19 ^ -[NEPathRule denyAll](self, "denyAll") ^ 1;
        }
        else
        {
          LOBYTE(v6) = 0;
        }

      }
      else
      {
        LOBYTE(v6) = 0;
      }

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)initDefaultPathRule
{
  return -[NEAppRule initWithSigningIdentifier:](self, "initWithSigningIdentifier:", CFSTR("PathRuleDefaultIdentifier"));
}

- (id)initDefaultNonSystemPathRule
{
  return -[NEAppRule initWithSigningIdentifier:](self, "initWithSigningIdentifier:", CFSTR("PathRuleDefaultNonSystemIdentifier"));
}

- (BOOL)isDefaultPathRule
{
  void *v3;
  char v4;
  void *v5;

  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PathRuleDefaultIdentifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("PathRuleDefaultNonSystemIdentifier"));

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SEL v5;
  SEL v6;
  SEL v7;
  SEL v8;
  id Property;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEPathRule;
  -[NEAppRule encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  if (self)
  {
    objc_msgSend(v4, "encodeInt32:forKey:", self->_internalCellularBehavior, CFSTR("CellularBehavior"));
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), CFSTR("DenyCellularFallback"));
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyMulticast](self, "denyMulticast"), CFSTR("DenyMulticast"));
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), CFSTR("MulticastPreferenceSet"));
    objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), CFSTR("IsIdentifierExternal"));
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v5, 96, 1), CFSTR("AggregateEnterpriseCellularBehavior"));
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v6, 88, 1), CFSTR("AggregatePersonalCellularBehavior"));
    objc_msgSend(v4, "encodeInt32:forKey:", self->_internalWiFiBehavior, CFSTR("WiFiBehavior"));
    objc_msgSend(v4, "encodeObject:forKey:", objc_getProperty(self, v7, 120, 1), CFSTR("AggregateEnterpriseWiFiBehavior"));
    Property = objc_getProperty(self, v8, 112, 1);
  }
  else
  {
    objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("CellularBehavior"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "denyCellularFallback"), CFSTR("DenyCellularFallback"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "denyMulticast"), CFSTR("DenyMulticast"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "multicastPreferenceSet"), CFSTR("MulticastPreferenceSet"));
    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(0, "isIdentifierExternal"), CFSTR("IsIdentifierExternal"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("AggregateEnterpriseCellularBehavior"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("AggregatePersonalCellularBehavior"));
    objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("WiFiBehavior"));
    objc_msgSend(v4, "encodeObject:forKey:", 0, CFSTR("AggregateEnterpriseWiFiBehavior"));
    Property = 0;
  }
  objc_msgSend(v4, "encodeObject:forKey:", Property, CFSTR("AggregatePersonalWiFiBehavior"));
  objc_msgSend(v4, "encodeBool:forKey:", -[NEPathRule denyAll](self, "denyAll"), CFSTR("DenyAll"));
  -[NEPathRule temporaryAllowMulticastNetworkName](self, "temporaryAllowMulticastNetworkName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("TemporaryAllowMulticastNetworkName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  int64_t internalCellularBehavior;
  const char *v7;
  id Property;
  id v9;
  int64_t internalWiFiBehavior;
  id v11;
  id v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NEPathRule;
  v4 = -[NEAppRule copyWithZone:](&v15, sel_copyWithZone_, a3);
  v5 = v4;
  if (self)
  {
    internalCellularBehavior = self->_internalCellularBehavior;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  internalCellularBehavior = 0;
  if (v4)
LABEL_3:
    v4[13] = internalCellularBehavior;
LABEL_4:
  objc_msgSend(v4, "setDenyCellularFallback:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"));
  objc_msgSend(v5, "setDenyMulticast:", -[NEPathRule denyMulticast](self, "denyMulticast"));
  objc_msgSend(v5, "setMulticastPreferenceSet:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"));
  objc_msgSend(v5, "setIsIdentifierExternal:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"));
  if (self)
  {
    Property = objc_getProperty(self, v7, 96, 1);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  Property = 0;
  if (v5)
LABEL_6:
    objc_setProperty_atomic(v5, v7, Property, 96);
LABEL_7:
  if (self)
  {
    v9 = objc_getProperty(self, v7, 88, 1);
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = 0;
  if (v5)
LABEL_9:
    objc_setProperty_atomic(v5, v7, v9, 88);
LABEL_10:
  if (self)
  {
    internalWiFiBehavior = self->_internalWiFiBehavior;
    if (!v5)
      goto LABEL_13;
    goto LABEL_12;
  }
  internalWiFiBehavior = 0;
  if (v5)
LABEL_12:
    v5[16] = internalWiFiBehavior;
LABEL_13:
  if (self)
  {
    v11 = objc_getProperty(self, v7, 120, 1);
    if (!v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  v11 = 0;
  if (v5)
LABEL_15:
    objc_setProperty_atomic(v5, v7, v11, 120);
LABEL_16:
  if (!self)
  {
    v12 = 0;
    if (!v5)
      goto LABEL_19;
    goto LABEL_18;
  }
  v12 = objc_getProperty(self, v7, 112, 1);
  if (v5)
LABEL_18:
    objc_setProperty_atomic(v5, v7, v12, 112);
LABEL_19:
  objc_msgSend(v5, "setDenyAll:", -[NEPathRule denyAll](self, "denyAll", v12));
  -[NEPathRule temporaryAllowMulticastNetworkName](self, "temporaryAllowMulticastNetworkName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemporaryAllowMulticastNetworkName:", v13);

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)NEPathRule;
  -[NEAppRule descriptionWithIndent:options:](&v12, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule cellularBehavior](self, "cellularBehavior"), CFSTR("cellularBehavior"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), CFSTR("denyCellularFallback"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyMulticast](self, "denyMulticast"), CFSTR("denyMulticast"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), CFSTR("multicastPreferenceSet"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), CFSTR("isIdentifierExternal"), v5, a4);
  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule wifiBehavior](self, "wifiBehavior"), CFSTR("wifiBehavior"), v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyAll](self, "denyAll"), CFSTR("denyAll"), v5, a4);
  -[NEPathRule temporaryAllowMulticastNetworkName](self, "temporaryAllowMulticastNetworkName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("temporaryAllowMulticastNetworkName"), 0, a4);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  objc_msgSend(v3, "appendString:", CFSTR("{"));
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v4, CFSTR("matchSigningIdentifier"), 0, 0);

  -[NEAppRule matchPath](self, "matchPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v5, CFSTR("matchPath"), 0, 0);

  objc_msgSend(v3, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule cellularBehavior](self, "cellularBehavior"), CFSTR("cellularBehavior"), 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyCellularFallback](self, "denyCellularFallback"), CFSTR("denyCellularFallback"), 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyMulticast](self, "denyMulticast"), CFSTR("denyMulticast"), 0, 0);
  -[NEPathRule temporaryAllowMulticastNetworkName](self, "temporaryAllowMulticastNetworkName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendPrettyObject:withName:andIndent:options:", v6, CFSTR("temporaryAllowMulticastNetworkName"), 0, 0);

  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule multicastPreferenceSet](self, "multicastPreferenceSet"), CFSTR("multicastPreferenceSet"), 0, 0);
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule isIdentifierExternal](self, "isIdentifierExternal"), CFSTR("isIdentifierExternal"), 0, 0);
  objc_msgSend(v3, "appendPrettyInt:withName:andIndent:options:", -[NEPathRule wifiBehavior](self, "wifiBehavior"), CFSTR("wifiBehavior"), 0, 0);
  if (-[NEPathRule isAggregateRule](self, v7))
  {
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 0), CFSTR("supportsAllowCellular"), 0, 0);
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 1), CFSTR("supportsDenyCellular"), 0, 0);
    objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule supportsCellularBehavior:](self, "supportsCellularBehavior:", 2), CFSTR("supportsAllowCellularWhileRoaming"), 0, 0);
  }
  objc_msgSend(v3, "appendPrettyBOOL:withName:andIndent:options:", -[NEPathRule denyAll](self, "denyAll"), CFSTR("denyAll"), 0, 0);
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  return v3;
}

- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4
{
  *a4 = 0;
  return 1;
}

- (void)setCellularBehavior:(int64_t)a3
{
  BOOL v5;

  v5 = -[NEPathRule isAggregateRule](self, a2);
  if (self)
  {
    if (!v5)
      self->_internalCellularBehavior = a3;
  }
}

- (void)setWifiBehavior:(int64_t)a3
{
  BOOL v5;

  v5 = -[NEPathRule isAggregateRule](self, a2);
  if (self)
  {
    if (!v5)
      self->_internalWiFiBehavior = a3;
  }
}

- (void)addCellularBehavior:(int64_t)a3 grade:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  int64_t v20;
  int *v21;
  char *v22;

  if (a4 == 1)
  {
    if (self && objc_getProperty(self, a2, 96, 1))
    {
      v15 = objc_msgSend(objc_getProperty(self, v14, 96, 1), "integerValue");
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_opt_self();
      v17 = 1;
      if (v15)
        v18 = a3 == 0;
      else
        v18 = 1;
      v19 = 2;
      if (v18)
        v19 = 0;
      if (v15 == 1)
        v19 = 1;
      if (a3 != 1)
        v17 = v19;
      if (v15 == a3)
        v20 = a3;
      else
        v20 = v17;
      objc_msgSend(v16, "numberWithInteger:", v20);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      if (!self)
        goto LABEL_40;
    }
    v21 = &OBJC_IVAR___NEPathRule__aggregateEnterpriseCellular;
    goto LABEL_38;
  }
  if (a4 == 2)
  {
    if (self && objc_getProperty(self, a2, 88, 1))
    {
      v7 = objc_msgSend(objc_getProperty(self, v6, 88, 1), "integerValue");
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_opt_self();
      v9 = 1;
      if (v7)
        v10 = a3 == 0;
      else
        v10 = 1;
      v11 = 2;
      if (v10)
        v11 = 0;
      if (v7 == 1)
        v11 = 1;
      if (a3 != 1)
        v9 = v11;
      if (v7 == a3)
        v12 = a3;
      else
        v12 = v9;
      objc_msgSend(v8, "numberWithInteger:", v12);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
LABEL_35:
      v21 = &OBJC_IVAR___NEPathRule__aggregatePersonalCellular;
LABEL_38:
      v22 = v13;
      objc_setProperty_atomic(self, v13, v13, *v21);
LABEL_39:

      return;
    }
LABEL_40:
    v22 = v13;
    goto LABEL_39;
  }
}

- (void)addWiFiBehavior:(int64_t)a3 grade:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  int64_t v20;
  int *v21;
  char *v22;

  if (a4 == 1)
  {
    if (self && objc_getProperty(self, a2, 120, 1))
    {
      v15 = objc_msgSend(objc_getProperty(self, v14, 120, 1), "integerValue");
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_opt_self();
      v17 = 1;
      if (v15)
        v18 = a3 == 0;
      else
        v18 = 1;
      v19 = 2;
      if (v18)
        v19 = 0;
      if (v15 == 1)
        v19 = 1;
      if (a3 != 1)
        v17 = v19;
      if (v15 == a3)
        v20 = a3;
      else
        v20 = v17;
      objc_msgSend(v16, "numberWithInteger:", v20);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      if (!self)
        goto LABEL_40;
    }
    v21 = &OBJC_IVAR___NEPathRule__aggregateEnterpriseWiFi;
    goto LABEL_38;
  }
  if (a4 == 2)
  {
    if (self && objc_getProperty(self, a2, 112, 1))
    {
      v7 = objc_msgSend(objc_getProperty(self, v6, 112, 1), "integerValue");
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_opt_self();
      v9 = 1;
      if (v7)
        v10 = a3 == 0;
      else
        v10 = 1;
      v11 = 2;
      if (v10)
        v11 = 0;
      if (v7 == 1)
        v11 = 1;
      if (a3 != 1)
        v9 = v11;
      if (v7 == a3)
        v12 = a3;
      else
        v12 = v9;
      objc_msgSend(v8, "numberWithInteger:", v12);
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
LABEL_35:
      v21 = &OBJC_IVAR___NEPathRule__aggregatePersonalWiFi;
LABEL_38:
      v22 = v13;
      objc_setProperty_atomic(self, v13, v13, *v21);
LABEL_39:

      return;
    }
LABEL_40:
    v22 = v13;
    goto LABEL_39;
  }
}

- (BOOL)supportsWiFiBehavior:(int64_t)a3
{
  BOOL v5;
  const char *v6;
  uint64_t v7;

  if (!self)
    return 1;
  v5 = 1;
  if (objc_getProperty(self, a2, 120, 1))
  {
    v7 = objc_msgSend(objc_getProperty(self, v6, 120, 1), "integerValue");
    return v7 != 1 && (a3 != 2 || v7 != 0);
  }
  return v5;
}

- (BOOL)denyCellularFallback
{
  return self->_denyCellularFallback;
}

- (void)setDenyCellularFallback:(BOOL)a3
{
  self->_denyCellularFallback = a3;
}

- (BOOL)denyMulticast
{
  return self->_denyMulticast;
}

- (void)setDenyMulticast:(BOOL)a3
{
  self->_denyMulticast = a3;
}

- (NSString)temporaryAllowMulticastNetworkName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTemporaryAllowMulticastNetworkName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)multicastPreferenceSet
{
  return self->_multicastPreferenceSet;
}

- (void)setMulticastPreferenceSet:(BOOL)a3
{
  self->_multicastPreferenceSet = a3;
}

- (BOOL)isIdentifierExternal
{
  return self->_isIdentifierExternal;
}

- (void)setIsIdentifierExternal:(BOOL)a3
{
  self->_isIdentifierExternal = a3;
}

- (BOOL)denyAll
{
  return self->_denyAll;
}

- (void)setDenyAll:(BOOL)a3
{
  self->_denyAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateEnterpriseWiFi, 0);
  objc_storeStrong((id *)&self->_aggregatePersonalWiFi, 0);
  objc_storeStrong((id *)&self->_aggregateEnterpriseCellular, 0);
  objc_storeStrong((id *)&self->_aggregatePersonalCellular, 0);
  objc_storeStrong((id *)&self->_temporaryAllowMulticastNetworkName, 0);
}

@end
