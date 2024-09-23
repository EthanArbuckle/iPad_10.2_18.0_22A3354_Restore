@implementation NEAppRule

- (NSString)matchSigningIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NEAppRule)initWithCoder:(id)a3
{
  id v4;
  NEAppRule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *matchDomains;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *matchAccountIdentifiers;
  uint64_t v16;
  NSString *matchSigningIdentifier;
  uint64_t v18;
  NSString *matchPath;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NEAppRule;
  v5 = -[NEAppRule init](&v21, sel_init);
  if (v5)
  {
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MatchAccountIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchAccountIdentifiers = v5->_matchAccountIdentifiers;
    v5->_matchAccountIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SigningIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v16;

    v5->_allowEmptyDesignatedRequirement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowEmptyDesignatedRequirement"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Path"));
    v18 = objc_claimAutoreleasedReturnValue();
    matchPath = v5->_matchPath;
    v5->_matchPath = (NSString *)v18;

    v5->_noDivertDNS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NoDivertDNS"));
  }

  return v5;
}

- (NEAppRule)initWithSigningIdentifier:(NSString *)signingIdentifier
{
  NSString *v4;
  NEAppRule *v5;
  uint64_t v6;
  NSString *matchSigningIdentifier;
  objc_super v9;

  v4 = signingIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)NEAppRule;
  v5 = -[NEAppRule init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    matchSigningIdentifier = v5->_matchSigningIdentifier;
    v5->_matchSigningIdentifier = (NSString *)v6;

    v5->_noRestriction = 1;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NEAppRule;
  -[NEAppRule dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NEAppRule matchDomains](self, "matchDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("MatchDomains"));

  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("MatchAccountIdentifiers"));

  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SigningIdentifier"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"), CFSTR("AllowEmptyDesignatedRequirement"));
  -[NEAppRule matchPath](self, "matchPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("Path"));

  objc_msgSend(v8, "encodeBool:forKey:", -[NEAppRule noDivertDNS](self, "noDivertDNS"), CFSTR("NoDivertDNS"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSigningIdentifier:", v5);

  -[NEAppRule matchPath](self, "matchPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMatchPath:", v7);

  -[NEAppRule matchDomains](self, "matchDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMatchDomains:", v8);

  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMatchAccountIdentifiers:", v9);

  objc_msgSend(v6, "setNoDivertDNS:", -[NEAppRule noDivertDNS](self, "noDivertDNS"));
  objc_msgSend(v6, "setAllowEmptyDesignatedRequirement:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"));
  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NEAppRule signingIdentifierAllowed:domainsOrAccountsRequired:](self, "signingIdentifierAllowed:domainsOrAccountsRequired:", v6, &v36);

    if (v7)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Dis-allowed app rule signing identifier (starts with com.apple): %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v11, v4);

  }
  else
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing signing identifier in app rule match executable"), v4);
  }
  v8 = 0;
LABEL_7:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NEAppRule matchDomains](self, "matchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  v27 = v13;
  if (v13)
  {
    v14 = *(_QWORD *)v33;
    v15 = v13;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v12);
        if ((isa_nsstring(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid app rule match domain"), v4);
          v8 = 0;
        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v15);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  v19 = v18;
  if (v18)
  {
    v20 = *(_QWORD *)v29;
    v21 = v18;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        if ((isa_nsstring(*(void **)(*((_QWORD *)&v28 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid account identifier"), v4);
          v8 = 0;
        }
      }
      v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v21);
  }

  if ((ne_session_disable_restrictions() & 1) == 0)
  {
    if (!(v19 | v27) && v36)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("At least one match domain or match account identifier is required for this app rule"), v4);
LABEL_32:
      v8 = 0;
      goto LABEL_33;
    }
    if (v19 | v27 && !v36)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("App rule matching %@ cannot have matchDomains or matchAccountIdentifiers"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v25, v4);

      goto LABEL_32;
    }
  }
LABEL_33:

  return v8 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  a4 |= 8uLL;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("matchSigningIdentifier"), v5, a4);

  -[NEAppRule matchPath](self, "matchPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("matchPath"), v5, a4);

  -[NEAppRule matchDomains](self, "matchDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("matchDomains"), v5, a4);

  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("accountIdentifiers"), v5, v8);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppRule allowEmptyDesignatedRequirement](self, "allowEmptyDesignatedRequirement"), CFSTR("allowEmptyDesignatedRequirement"), v5, v8);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEAppRule noDivertDNS](self, "noDivertDNS"), CFSTR("noDivertDNS"), v5, v8);
  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CE9198]);

    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE9190]);

  }
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CE9188]);

  -[NEAppRule matchDomains](self, "matchDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NEAppRule matchDomains](self, "matchDomains");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CE9180]);

  }
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CE9178]);

  }
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEAppRule *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  NSString *matchSigningIdentifier;
  uint64_t v17;
  void *v18;
  int v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *matchDomains;
  uint64_t v27;
  void *v28;
  int v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *matchAccountIdentifiers;
  NEAppRule *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)NEAppRule;
  v5 = -[NEAppRule init](&v47, sel_init);
  if (v5)
  {
    v6 = *MEMORY[0x1E0CE9188];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9188]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isa_nsarray(v7);

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0CE9190];
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9190]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = isa_nsstring(v12);

        if (v13)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "copy");
          matchSigningIdentifier = v5->_matchSigningIdentifier;
          v5->_matchSigningIdentifier = (NSString *)v15;

        }
      }

    }
    v17 = *MEMORY[0x1E0CE9180];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9180]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = isa_nsarray(v18);

    if (v19)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v20 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v44;
        while (2)
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v44 != v23)
              objc_enumerationMutation(v20);
            if (!isa_nsstring(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v24)))
            {
              matchDomains = v20;
              goto LABEL_19;
            }
            ++v24;
          }
          while (v22 != v24);
          v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          if (v22)
            continue;
          break;
        }
      }

      v25 = -[NSArray copy](v20, "copy");
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v25;
LABEL_19:

    }
    v27 = *MEMORY[0x1E0CE9178];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9178]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = isa_nsarray(v28);

    if (v29)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v27);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v30 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v40;
        while (2)
        {
          v34 = 0;
          do
          {
            if (*(_QWORD *)v40 != v33)
              objc_enumerationMutation(v30);
            if (!isa_nsstring(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v34)))
            {
              matchAccountIdentifiers = v30;
              goto LABEL_31;
            }
            ++v34;
          }
          while (v32 != v34);
          v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          if (v32)
            continue;
          break;
        }
      }

      v35 = -[NSArray copy](v30, "copy", (_QWORD)v39);
      matchAccountIdentifiers = v5->_matchAccountIdentifiers;
      v5->_matchAccountIdentifiers = (NSArray *)v35;
LABEL_31:

    }
    v37 = v5;
  }

  return v5;
}

- (BOOL)overlapsWithRule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  int v53;
  int v54;
  BOOL v55;
  NSObject *v56;
  void *v57;
  int v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchSigningIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_46;
  -[NEAppRule matchDomains](self, "matchDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

  }
  else
  {
    objc_msgSend(v4, "matchDomains");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      v30 = 0;
      v16 = 0;
      goto LABEL_24;
    }
  }
  -[NEAppRule matchDomains](self, "matchDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_21;
  }
  objc_msgSend(v4, "matchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
LABEL_21:
    v30 = 1;
    v16 = 1;
    goto LABEL_24;
  }
  -[NEAppRule matchDomains](self, "matchDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  v16 = 0;
  if (v15)
  {
    v17 = 0;
    do
    {
      -[NEAppRule matchDomains](self, "matchDomains");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "matchDomains");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      v22 = v16 & 1;

      if (v21 && (v16 & 1) == 0)
      {
        v23 = 1;
        do
        {
          objc_msgSend(v4, "matchDomains");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v23 - 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v19, "hasSuffix:", v25) & 1) != 0 || objc_msgSend(v25, "hasSuffix:", v19))
            v16 = 1;

          objc_msgSend(v4, "matchDomains");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");
          v22 = v16 & 1;

          if (v23 >= v27)
            break;
          ++v23;
        }
        while ((v16 & 1) == 0);
      }

      ++v17;
      -[NEAppRule matchDomains](self, "matchDomains");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      v30 = 1;
    }
    while (v17 < v29 && !v22);
  }
  else
  {
    v30 = 1;
  }
LABEL_24:
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {

    v32 = v16 & 1;
  }
  else
  {
    objc_msgSend(v4, "matchAccountIdentifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    v32 = v16 & 1;
    if (!v34)
    {
      v53 = 0;
      v54 = 0;
      goto LABEL_43;
    }
  }
  -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v35, "count"))
  {

    goto LABEL_47;
  }
  objc_msgSend(v4, "matchAccountIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39)
    {
      v40 = 0;
      v41 = 0;
      do
      {
        -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectAtIndexedSubscript:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "matchAccountIdentifiers");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "count");

        if (v45)
        {
          v46 = 0;
          do
          {
            objc_msgSend(v4, "matchAccountIdentifiers");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v43, "isEqualToString:", v48))
              v41 = 1;

            ++v46;
            objc_msgSend(v4, "matchAccountIdentifiers");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "count");

          }
          while (v46 < v50);
        }

        ++v40;
        -[NEAppRule matchAccountIdentifiers](self, "matchAccountIdentifiers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");
        v53 = v41 & 1;

      }
      while (v40 < v52 && (v41 & 1) == 0);
    }
    else
    {
      v53 = 0;
    }
    v54 = 1;
LABEL_43:
    if ((v30 | v54) == 1 && (v32 & 1) == 0 && !v53)
    {
LABEL_46:
      v55 = 0;
      goto LABEL_50;
    }
  }
LABEL_47:
  ne_log_obj();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    -[NEAppRule matchSigningIdentifier](self, "matchSigningIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 138412290;
    v60 = v57;
    _os_log_impl(&dword_19BD16000, v56, OS_LOG_TYPE_DEFAULT, "App Rule for %@ overlaps with an existing app rule", (uint8_t *)&v59, 0xCu);

  }
  v55 = 1;
LABEL_50:

  return v55;
}

- (BOOL)signingIdentifierAllowed:(id)a3 domainsOrAccountsRequired:(BOOL *)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  *a4 = 0;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.")))
  {
    v6 = 0;
    while (strcmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), (&signingIdentifierAllowed_domainsOrAccountsRequired__com_apple_exceptions)[v6]))
    {
      v6 += 2;
      if (v6 == 24)
        goto LABEL_7;
    }
    *a4 = 1;
  }
LABEL_7:

  return 1;
}

- (NSString)matchDesignatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)matchPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchPath:(NSString *)matchPath
{
  objc_setProperty_atomic_copy(self, a2, matchPath, 32);
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
  objc_setProperty_atomic_copy(self, a2, matchDomains, 40);
}

- (NSArray)matchTools
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMatchTools:(NSArray *)matchTools
{
  objc_setProperty_atomic_copy(self, a2, matchTools, 48);
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (NSArray)cachedMachOUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedMachOUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)matchAccountIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMatchAccountIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)noDivertDNS
{
  return self->_noDivertDNS;
}

- (void)setNoDivertDNS:(BOOL)a3
{
  self->_noDivertDNS = a3;
}

- (BOOL)allowEmptyDesignatedRequirement
{
  return self->_allowEmptyDesignatedRequirement;
}

- (void)setAllowEmptyDesignatedRequirement:(BOOL)a3
{
  self->_allowEmptyDesignatedRequirement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedMachOUUIDs, 0);
  objc_storeStrong((id *)&self->_matchTools, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_matchPath, 0);
  objc_storeStrong((id *)&self->_matchDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_matchSigningIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
