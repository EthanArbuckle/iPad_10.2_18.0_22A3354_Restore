@implementation NEEvaluateConnectionRule

- (NEEvaluateConnectionRule)initWithMatchDomains:(NSArray *)domains andAction:(NEEvaluateConnectionRuleAction)action
{
  NSArray *v6;
  NEEvaluateConnectionRule *v7;
  NEEvaluateConnectionRule *v8;
  uint64_t v9;
  NSArray *matchDomains;
  objc_super v12;

  v6 = domains;
  v12.receiver = self;
  v12.super_class = (Class)NEEvaluateConnectionRule;
  v7 = -[NEEvaluateConnectionRule init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_action = action;
    v9 = -[NSArray copy](v6, "copy");
    matchDomains = v8->_matchDomains;
    v8->_matchDomains = (NSArray *)v9;

  }
  return v8;
}

- (NEEvaluateConnectionRule)initWithCoder:(id)a3
{
  id v4;
  NEEvaluateConnectionRule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *matchDomains;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *useDNSServers;
  uint64_t v16;
  NSURL *probeURL;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NEEvaluateConnectionRule;
  v5 = -[NEEvaluateConnectionRule init](&v19, sel_init);
  if (v5)
  {
    v5->_action = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("Action"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MatchDomains"));
    v9 = objc_claimAutoreleasedReturnValue();
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("UseDNSServers"));
    v14 = objc_claimAutoreleasedReturnValue();
    useDNSServers = v5->_useDNSServers;
    v5->_useDNSServers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProbeURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v16;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NEEvaluateConnectionRuleAction v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NEEvaluateConnectionRule action](self, "action"), v5 == objc_msgSend(v4, "action")))
  {
    -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToArray:", v7))
    {
      -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "useDNSServers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToArray:", v9))
      {
        -[NEEvaluateConnectionRule probeURL](self, "probeURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "probeURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NEEvaluateConnectionRule *v4;
  void *v5;
  NEEvaluateConnectionRule *v6;
  void *v7;
  void *v8;

  v4 = +[NEEvaluateConnectionRule allocWithZone:](NEEvaluateConnectionRule, "allocWithZone:", a3);
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NEEvaluateConnectionRule initWithMatchDomains:andAction:](v4, "initWithMatchDomains:andAction:", v5, -[NEEvaluateConnectionRule action](self, "action"));

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEEvaluateConnectionRule setUseDNSServers:](v6, "setUseDNSServers:", v7);

  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEEvaluateConnectionRule setProbeURL:](v6, "setProbeURL:", v8);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEEvaluateConnectionRule action](self, "action"), CFSTR("Action"));
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MatchDomains"));

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UseDNSServers"));

  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ProbeURL"));

}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NEEvaluateConnectionRule action](self, "action") >= NEEvaluateConnectionRuleActionConnectIfNeeded
    && -[NEEvaluateConnectionRule action](self, "action") < (NEEvaluateConnectionRuleActionNeverConnect|NEEvaluateConnectionRuleActionConnectIfNeeded))
  {
    v5 = 1;
  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid connection rule action"), v4);
    v5 = 0;
  }
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[NEEvaluateConnectionRule matchDomains](self, "matchDomains"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7,
        v9))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v14)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid connection rule domain"), v4);
            v5 = 0;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }

  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing connection rule match domains"), v4);
    v5 = 0;
  }
  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v20)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid connection rule required DNS server"), v4);
            v5 = 0;
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

  }
  return v5 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  NEEvaluateConnectionRuleAction v8;
  const __CFString *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = -[NEEvaluateConnectionRule action](self, "action");
  if (v8 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    v9 = CFSTR("connect-if-needed");
    goto LABEL_5;
  }
  if (v8 == NEEvaluateConnectionRuleActionNeverConnect)
  {
    v9 = CFSTR("never-connect");
LABEL_5:
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("action"), v5, a4);
  }
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 | 1;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("matchDomains"), v5, v11);

  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("useDNSServers"), v5, v11);

  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v14, CFSTR("probeURL"), v5, v11);

  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  NEEvaluateConnectionRuleAction v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[NEEvaluateConnectionRule action](self, "action");
  if (v4 == NEEvaluateConnectionRuleActionConnectIfNeeded)
  {
    v5 = (_QWORD *)MEMORY[0x1E0CE91E0];
  }
  else
  {
    if (v4 != NEEvaluateConnectionRuleActionNeverConnect)
      goto LABEL_6;
    v5 = (_QWORD *)MEMORY[0x1E0CE91E8];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *v5, *MEMORY[0x1E0CE9040]);
LABEL_6:
  -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEEvaluateConnectionRule matchDomains](self, "matchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE9048]);

  }
  -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEEvaluateConnectionRule useDNSServers](self, "useDNSServers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE9050]);

  }
  -[NEEvaluateConnectionRule probeURL](self, "probeURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEEvaluateConnectionRule probeURL](self, "probeURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CE9058]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEEvaluateConnectionRule *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSArray *matchDomains;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSArray *useDNSServers;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *probeURL;
  NEEvaluateConnectionRule *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NEEvaluateConnectionRule;
  v5 = -[NEEvaluateConnectionRule init](&v27, sel_init);
  if (!v5)
    goto LABEL_15;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9040]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (isa_nsstring(v6))
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91E0]) & 1) != 0)
    {
      v7 = 1;
LABEL_7:
      v5->_action = v7;
      goto LABEL_8;
    }
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CE91E8]))
    {
      v7 = 2;
      goto LABEL_7;
    }
  }
LABEL_8:
  v8 = *MEMORY[0x1E0CE9048];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9048]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = isa_nsarray(v9);

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v11;

  }
  v13 = *MEMORY[0x1E0CE9050];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9050]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = isa_nsarray(v14);

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v13);
    v16 = objc_claimAutoreleasedReturnValue();
    useDNSServers = v5->_useDNSServers;
    v5->_useDNSServers = (NSArray *)v16;

  }
  v18 = *MEMORY[0x1E0CE9058];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9058]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = isa_nsstring(v19);

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLWithString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    probeURL = v5->_probeURL;
    v5->_probeURL = (NSURL *)v23;

  }
  v25 = v5;

LABEL_15:
  return v5;
}

- (NEEvaluateConnectionRuleAction)action
{
  return self->_action;
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)useDNSServers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUseDNSServers:(NSArray *)useDNSServers
{
  objc_setProperty_atomic_copy(self, a2, useDNSServers, 24);
}

- (NSURL)probeURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProbeURL:(NSURL *)probeURL
{
  objc_setProperty_atomic_copy(self, a2, probeURL, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeURL, 0);
  objc_storeStrong((id *)&self->_useDNSServers, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
