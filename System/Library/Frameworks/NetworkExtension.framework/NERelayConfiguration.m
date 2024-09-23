@implementation NERelayConfiguration

- (NERelayConfiguration)init
{
  NERelayConfiguration *v2;
  NERelayConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NERelayConfiguration;
  v2 = -[NERelayConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NERelayConfiguration setEnabled:](v2, "setEnabled:", 0);
  return v3;
}

- (NERelayConfiguration)initWithCoder:(id)a3
{
  id v4;
  NERelayConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *relays;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *matchDomains;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *excludedDomains;
  uint64_t v21;
  NEPerApp *perApp;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *onDemandRules;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NERelayConfiguration;
  v5 = -[NERelayConfiguration init](&v29, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Enabled"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Relays"));
    v9 = objc_claimAutoreleasedReturnValue();
    relays = v5->_relays;
    v5->_relays = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("MatchDomains"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("ExcludedDomains"));
    v19 = objc_claimAutoreleasedReturnValue();
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PerApp"));
    v21 = objc_claimAutoreleasedReturnValue();
    perApp = v5->_perApp;
    v5->_perApp = (NEPerApp *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("OnDemandRules"));
    v26 = objc_claimAutoreleasedReturnValue();
    onDemandRules = v5->_onDemandRules;
    v5->_onDemandRules = (NSArray *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NERelayConfiguration isEnabled](self, "isEnabled"), CFSTR("Enabled"));
  -[NERelayConfiguration relays](self, "relays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Relays"));

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MatchDomains"));

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ExcludedDomains"));

  -[NERelayConfiguration perApp](self, "perApp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("PerApp"));

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("OnDemandRules"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NERelayConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = -[NERelayConfiguration init](+[NERelayConfiguration allocWithZone:](NERelayConfiguration, "allocWithZone:", a3), "init");
  -[NERelayConfiguration setEnabled:](v4, "setEnabled:", -[NERelayConfiguration isEnabled](self, "isEnabled"));
  -[NERelayConfiguration relays](self, "relays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setRelays:](v4, "setRelays:", v5);

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setMatchDomains:](v4, "setMatchDomains:", v6);

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setExcludedDomains:](v4, "setExcludedDomains:", v7);

  -[NERelayConfiguration perApp](self, "perApp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NERelayConfiguration setPerApp:](v4, "setPerApp:", v8);

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NERelayConfiguration onDemandRules](self, "onDemandRules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:copyItems:", v11, 1);
    -[NERelayConfiguration setOnDemandRules:](v4, "setOnDemandRules:", v12);

  }
  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t jj;
  void *v63;
  NERelayConfiguration *v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  id obj;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NERelayConfiguration relays](self, "relays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 != 0;

  if (!v6)
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing relays"), v4);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[NERelayConfiguration relays](self, "relays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v97 != v11)
          objc_enumerationMutation(v8);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "checkValidityAndCollectErrors:", v4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    }
    while (v10);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[NERelayConfiguration matchDomains](self, "matchDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v93;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v93 != v16)
          objc_enumerationMutation(v13);
        if ((isa_nsstring(*(void **)(*((_QWORD *)&v92 + 1) + 8 * j)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid match domain"), v4);
          v7 = 0;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v15);
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v89;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v89 != v21)
          objc_enumerationMutation(v18);
        if ((isa_nsstring(*(void **)(*((_QWORD *)&v88 + 1) + 8 * k)) & 1) == 0)
        {
          +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid excluded domain"), v4);
          v7 = 0;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    }
    while (v20);
  }

  -[NERelayConfiguration perApp](self, "perApp");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NERelayConfiguration perApp](self, "perApp");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "checkValidityAndCollectErrors:", v4);

    if ((v26 & v7) == 1)
      goto LABEL_30;
LABEL_68:
    v56 = 0;
    goto LABEL_74;
  }
  if ((v7 & 1) == 0)
    goto LABEL_68;
LABEL_30:
  -[NERelayConfiguration perApp](self, "perApp");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "restrictDomains"))
  {
    -[NERelayConfiguration matchDomains](self, "matchDomains");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (!v29)
    {
      v56 = 1;
      goto LABEL_74;
    }
    v69 = v4;
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v65 = self;
    -[NERelayConfiguration relays](self, "relays");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v85;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v85 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * m);
          objc_msgSend(v35, "HTTP3RelayURL");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "host");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NECopyETLDPlusOne(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            objc_msgSend(v27, "addObject:", v38);
          objc_msgSend(v35, "HTTP2RelayURL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "host");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NECopyETLDPlusOne(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v27, "addObject:", v41);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
      }
      while (v32);
    }

    if (objc_msgSend(v27, "count"))
    {
      v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      -[NERelayConfiguration matchDomains](v65, "matchDomains");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v4 = v69;
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
      if (v71)
      {
        v42 = *(_QWORD *)v81;
        v67 = *(_QWORD *)v81;
        v68 = v27;
        do
        {
          for (n = 0; n != v71; ++n)
          {
            if (*(_QWORD *)v81 != v42)
              objc_enumerationMutation(obj);
            v44 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * n);
            objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*."));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v27, "containsObject:", v46) & 1) == 0)
            {
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v47 = v27;
              v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
              if (v48)
              {
                v49 = v48;
                v50 = *(_QWORD *)v77;
                while (2)
                {
                  for (ii = 0; ii != v49; ++ii)
                  {
                    if (*(_QWORD *)v77 != v50)
                      objc_enumerationMutation(v47);
                    v52 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * ii);
                    objc_msgSend(CFSTR("."), "stringByAppendingString:", v52);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v54 = objc_msgSend(v46, "length");
                    if (v54 > objc_msgSend(v52, "length") && (objc_msgSend(v46, "hasSuffix:", v53) & 1) == 0)
                    {

                      goto LABEL_61;
                    }

                  }
                  v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v76, v101, 16);
                  if (v49)
                    continue;
                  break;
                }
              }

              objc_msgSend(v66, "addObject:", v46);
LABEL_61:
              v27 = v68;
              v4 = v69;
              v42 = v67;
            }

          }
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
        }
        while (v71);
      }

      v55 = objc_msgSend(v66, "count");
      v56 = v55 == 0;
      if (v55)
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid match domains, do not match relay domains"), v4);

    }
    else
    {
      v4 = v69;
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid relay domains"), v69);
      v56 = 0;
    }
    self = v65;
  }
  else
  {
    v56 = 1;
  }

LABEL_74:
  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[NERelayConfiguration onDemandRules](self, "onDemandRules");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v73;
      do
      {
        for (jj = 0; jj != v60; ++jj)
        {
          if (*(_QWORD *)v73 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 &= objc_msgSend(v63, "checkValidityAndCollectErrors:", v4);
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid on demand rule object"), v4);
            v56 = 0;
          }
        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
      }
      while (v60);
    }

  }
  return v56;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelayConfiguration isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NERelayConfiguration relays](self, "relays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("relays"), v5, a4);

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("matchDomains"), v5, a4);

  -[NERelayConfiguration excludedDomains](self, "excludedDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("excludedDomains"), v5, a4);

  -[NERelayConfiguration perApp](self, "perApp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("perApp"), v5, a4);

  -[NERelayConfiguration onDemandRules](self, "onDemandRules");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("onDemandRules"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NERelayConfiguration descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 0);
}

- (BOOL)overlapsWithRelayConfiguration:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  char v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  char v66;
  char v67;
  char v68;
  char v69;
  id obj;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  void *v82;
  NERelayConfiguration *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v83 = self;
  -[NERelayConfiguration perApp](self, "perApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v5, "perApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count") == 0;

  if ((v8 != 0) == v11)
    goto LABEL_58;
  -[NERelayConfiguration matchDomains](v83, "matchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v12, "count");

  objc_msgSend(v5, "matchDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count") == 0;

  if ((v80 != 0) == v14)
    goto LABEL_58;
  objc_msgSend(v5, "onDemandRules");
  v81 = (id)objc_claimAutoreleasedReturnValue();
  if (!v83)
    goto LABEL_57;
  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count") || !objc_msgSend(v81, "count"))
  {

    goto LABEL_60;
  }
  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v18 = objc_msgSend(v81, "count");

  if (v17 != v18)
    goto LABEL_60;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  -[NERelayConfiguration onDemandRules](v83, "onDemandRules");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (!v74)
    goto LABEL_56;
  v75 = *(_QWORD *)v104;
  v78 = v5;
  v72 = v8;
  while (2)
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v104 != v75)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v19);
      v76 = v19;
      v21 = objc_msgSend(v20, "action") == 2 || objc_msgSend(v20, "action") == 4;
      v77 = v21;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v93 = v81;
      v22 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
      if (!v22)
      {
LABEL_89:

LABEL_90:
        v5 = v78;
        v8 = v72;
LABEL_60:

        objc_msgSend(v5, "perApp");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "appRules");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)v83, v49);

        v51 = v5;
        -[NERelayConfiguration matchDomains](v83, "matchDomains");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "count"))
        {
          objc_msgSend(v51, "matchDomains");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "count");

          if (!v54)
            goto LABEL_79;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          -[NERelayConfiguration matchDomains](v83, "matchDomains");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
          if (v55)
          {
            v56 = v55;
            v57 = *(_QWORD *)v104;
            v79 = v5;
            v73 = v8;
            v96 = *(_QWORD *)v104;
            do
            {
              for (i = 0; i != v56; ++i)
              {
                if (*(_QWORD *)v104 != v57)
                  objc_enumerationMutation(v52);
                v59 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
                v99 = 0u;
                v100 = 0u;
                v101 = 0u;
                v102 = 0u;
                objc_msgSend(v51, "matchDomains");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
                if (v61)
                {
                  v62 = v61;
                  v63 = *(_QWORD *)v100;
                  v98 = v56;
                  while (2)
                  {
                    for (j = 0; j != v62; ++j)
                    {
                      if (*(_QWORD *)v100 != v63)
                        objc_enumerationMutation(v60);
                      v65 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
                      if ((objc_msgSend(v59, "hasSuffix:", v65) & 1) != 0
                        || objc_msgSend(v65, "hasSuffix:", v59))
                      {

                        v66 = 0;
                        v5 = v79;
                        v8 = v73;
                        goto LABEL_81;
                      }
                    }
                    v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
                    v57 = v96;
                    v56 = v98;
                    if (v62)
                      continue;
                    break;
                  }
                }

                v5 = v79;
                v8 = v73;
              }
              v56 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
            }
            while (v56);
          }
        }

LABEL_79:
        v66 = 1;
LABEL_81:

        if (v80)
          v67 = v66;
        else
          v67 = 0;
        v68 = v67 | ~v50;
        if (v8)
          v69 = 1;
        else
          v69 = v66;
        v47 = v68 & v69 ^ 1;
        goto LABEL_88;
      }
      v23 = v22;
      v24 = *(_QWORD *)v100;
      v89 = v20;
      v90 = *(_QWORD *)v100;
LABEL_17:
      v25 = 0;
      v91 = v23;
      while (1)
      {
        if (*(_QWORD *)v100 != v24)
          objc_enumerationMutation(v93);
        v26 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v25);
        v27 = v20;
        if (!v26)
          goto LABEL_36;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        objc_msgSend(v26, "DNSSearchDomainMatch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "DNSSearchDomainMatch");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28 != v29)
        {
          objc_msgSend(v26, "DNSSearchDomainMatch");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "DNSSearchDomainMatch");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v30;
          if (!objc_msgSend(v30, "isEqualToArray:", v95))
            goto LABEL_34;
        }
        objc_msgSend(v26, "DNSServerAddressMatch");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "DNSServerAddressMatch");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 == v32
          || (objc_msgSend(v26, "DNSServerAddressMatch"),
              v33 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v27, "DNSServerAddressMatch"),
              v34 = objc_claimAutoreleasedReturnValue(),
              v92 = (void *)v33,
              v35 = (void *)v33,
              v3 = (void *)v34,
              objc_msgSend(v35, "isEqualToArray:", v34)))
        {
          v36 = objc_msgSend(v26, "interfaceTypeMatch");
          if (v36 == objc_msgSend(v27, "interfaceTypeMatch"))
          {
            objc_msgSend(v26, "SSIDMatch");
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "SSIDMatch");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = (void *)v37;
            if ((void *)v37 == v38
              || (objc_msgSend(v26, "SSIDMatch"),
                  v39 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v27, "SSIDMatch"),
                  v84 = (void *)objc_claimAutoreleasedReturnValue(),
                  v85 = v39,
                  objc_msgSend(v39, "isEqualToArray:")))
            {
              v86 = v38;
              v87 = v3;
              objc_msgSend(v26, "probeURL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "probeURL");
              v41 = objc_claimAutoreleasedReturnValue();
              if (v40 == (void *)v41)
              {

                v94 = 1;
              }
              else
              {
                v82 = (void *)v41;
                objc_msgSend(v26, "probeURL");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "probeURL");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v42, "isEqual:", v43);

              }
              v3 = v87;
              v45 = v88;
              v38 = v86;
              if (v88 == v86)
              {
LABEL_41:

                v20 = v89;
                if (v31 == v32)
                  goto LABEL_43;
                goto LABEL_42;
              }
            }
            else
            {
              v94 = 0;
              v45 = v88;
            }

            goto LABEL_41;
          }
          v20 = v89;
          if (v31 == v32)
          {

            v44 = v28;
            v24 = v90;
            v23 = v91;
            if (v28 != v29)
            {
LABEL_34:

              v44 = v29;
            }

LABEL_36:
            goto LABEL_47;
          }
        }
        v94 = 0;
LABEL_42:

LABEL_43:
        if (v28 == v29)
          break;

        v24 = v90;
        v23 = v91;
        if ((v94 & 1) != 0)
          goto LABEL_50;
LABEL_47:
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
          if (v23)
            goto LABEL_17;
          goto LABEL_89;
        }
      }

      v24 = v90;
      v23 = v91;
      if (!v94)
        goto LABEL_47;
LABEL_50:
      if (objc_msgSend(v26, "action") == 2)
      {

        if (v77)
          goto LABEL_90;
      }
      else
      {
        v46 = v77 ^ (objc_msgSend(v26, "action") == 4);

        if ((v46 & 1) == 0)
          goto LABEL_90;
      }
      v19 = v76 + 1;
      v5 = v78;
    }
    while (v76 + 1 != v74);
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
    if (v74)
      continue;
    break;
  }
LABEL_56:

LABEL_57:
LABEL_58:
  v47 = 0;
LABEL_88:

  return v47;
}

- (BOOL)overlapsWithVPNConfiguration:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[NERelayConfiguration perApp](self, "perApp", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[NERelayConfiguration matchDomains](self, "matchDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 | objc_msgSend(v7, "count");

  return v8 == 0;
}

- (BOOL)overlapsWithAppVPNConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  -[NERelayConfiguration perApp](self, "perApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "appRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NERelayConfiguration overlapsWithAppsFromOtherAppRules:]((uint64_t)self, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)relays
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRelays:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatchDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExcludedDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NEPerApp)perApp
{
  return (NEPerApp *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPerApp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)onDemandRules
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOnDemandRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRules, 0);
  objc_storeStrong((id *)&self->_perApp, 0);
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_relays, 0);
}

- (uint64_t)overlapsWithAppsFromOtherAppRules:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "perApp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = objc_msgSend(v3, "count");

      if (v6)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend((id)a1, "perApp");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appRules");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
              v20 = 0u;
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              v14 = v3;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v21;
                while (2)
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v21 != v17)
                      objc_enumerationMutation(v14);
                    if (objc_msgSend(v13, "overlapsWithRule:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18)))
                    {

                      a1 = 1;
                      goto LABEL_23;
                    }
                    ++v18;
                  }
                  while (v16 != v18);
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                  if (v16)
                    continue;
                  break;
                }
              }

              ++v12;
            }
            while (v12 != v10);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v10);
        }

      }
    }
    else
    {

    }
    a1 = 0;
  }
LABEL_23:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
