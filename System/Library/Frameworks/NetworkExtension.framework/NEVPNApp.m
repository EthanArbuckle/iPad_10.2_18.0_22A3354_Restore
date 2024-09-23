@implementation NEVPNApp

- (NEVPNApp)init
{
  NEVPNApp *v2;
  NEVPNApp *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NEVPNApp;
  v2 = -[NEVPN init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NEVPN setEnabled:](v2, "setEnabled:", 1);
    -[NEVPN setTunnelType:](v3, "setTunnelType:", 2);
    v3->_noRestriction = 1;
  }
  return v3;
}

- (NEVPNApp)initWithCoder:(id)a3
{
  id v4;
  NEVPNApp *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *appRules;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *excludedDomains;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNApp;
  v5 = -[NEVPN initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    appRules = v5->_appRules;
    v5->_appRules = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("ExcludedDomains"));
    v14 = objc_claimAutoreleasedReturnValue();
    excludedDomains = v5->_excludedDomains;
    v5->_excludedDomains = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NEVPNApp;
  v4 = a3;
  -[NEVPN encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[NEVPNApp appRules](self, "appRules", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Rules"));

  -[NEVPNApp excludedDomains](self, "excludedDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ExcludedDomains"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NEVPNApp;
  v4 = -[NEVPN copyWithZone:](&v13, sel_copyWithZone_, a3);
  -[NEVPNApp appRules](self, "appRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEVPNApp appRules](self, "appRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setAppRules:", v8);

  }
  v9 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[NEVPNApp excludedDomains](self, "excludedDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
  objc_msgSend(v4, "setExcludedDomains:", v11);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NEVPNApp *v36;
  id v37;
  char *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  id obj;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  id v71;
  NEVPNApp *v72;
  void *v73;
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
  objc_super v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)NEVPNApp;
  v5 = -[NEVPN checkValidityAndCollectErrors:](&v94, sel_checkValidityAndCollectErrors_, v4);
  -[NEVPNApp appRules](self, "appRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v72 = self;
    -[NEVPNApp appRules](self, "appRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          v12 = v5;
          if (*(_QWORD *)v91 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v13, "checkValidityAndCollectErrors:", v4))
              v5 = v12;
            else
              v5 = 0;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid app rule"), v4);
            v5 = 0;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      }
      while (v9);
    }

    LOBYTE(v5) = v5;
    self = v72;
  }
  -[NEVPNApp excludedDomains](self, "excludedDomains");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    -[NEVPNApp excludedDomains](self, "excludedDomains");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
    if (v17)
    {
      v18 = v17;
      v19 = v5;
      v20 = *(_QWORD *)v87;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v87 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v22, "length"))
          {
            NEResourcesCopyLocalizedNSString(CFSTR("APP_VPN_EMPTY_EXCLUDED_DOMAIN"), CFSTR("APP_VPN_EMPTY_EXCLUDED_DOMAIN"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v23, v4);

            LOBYTE(v5) = 0;
            goto LABEL_27;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
        if (v18)
          continue;
        break;
      }
      LOBYTE(v5) = v19;
    }
LABEL_27:

  }
  if (-[NEVPNApp restrictDomains](self, "restrictDomains"))
  {
    -[NEVPN protocol](self, "protocol");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "serverAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v25);
      v27 = v26;
      if (!v26 || (objc_msgSend(v26, "host"), (v28 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        v28 = v25;
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("."));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = v30;
      objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("."));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v31, "count") > 1)
      {
        v62 = v27;
        v63 = v25;
        v64 = v5;
        v67 = v4;
        v61 = v31;
        objc_msgSend(v31, "subarrayWithRange:", objc_msgSend(v31, "count") - 2, 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "componentsJoinedByString:", CFSTR("."));
        v36 = self;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("."), "stringByAppendingString:", v34);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        -[NEVPNApp appRules](v36, "appRules");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
        if (v69)
        {
          v68 = *(_QWORD *)v83;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v83 != v68)
                objc_enumerationMutation(obj);
              v70 = v38;
              v39 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v38);
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              objc_msgSend(v39, "matchDomains");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v79;
                do
                {
                  for (k = 0; k != v42; ++k)
                  {
                    if (*(_QWORD *)v79 != v43)
                      objc_enumerationMutation(v40);
                    v45 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
                    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*."));
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "stringByTrimmingCharactersInSet:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    v48 = objc_msgSend(v47, "length");
                    if (v48 > objc_msgSend(v34, "length") && !objc_msgSend(v47, "hasSuffix:", v73)
                      || (v49 = objc_msgSend(v47, "length"), v49 == objc_msgSend(v34, "length"))
                      && !objc_msgSend(v47, "isEqualToString:", v34)
                      || (v50 = objc_msgSend(v47, "length"), v50 < objc_msgSend(v34, "length")))
                    {
                      objc_msgSend(v37, "setObject:forKeyedSubscript:", v47, v47);
                    }

                  }
                  v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
                }
                while (v42);
              }

              v38 = v70 + 1;
            }
            while (v70 + 1 != (char *)v69);
            v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
          }
          while (v69);
        }

        LOBYTE(v5) = v64;
        if (objc_msgSend(v37, "count"))
        {
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v71 = v37;
          v51 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v75;
            do
            {
              for (m = 0; m != v52; ++m)
              {
                if (*(_QWORD *)v75 != v53)
                  objc_enumerationMutation(v71);
                v55 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m);
                v56 = objc_alloc(MEMORY[0x1E0CB3940]);
                NEResourcesCopyLocalizedNSString(CFSTR("APP_VPN_INVALID_MATCH_DOMAIN"), CFSTR("APP_VPN_INVALID_MATCH_DOMAIN"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = (void *)objc_msgSend(v56, "initWithFormat:", v57, v55, v34);
                objc_msgSend(v67, "addObject:", v58);

              }
              v52 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v74, v95, 16);
            }
            while (v52);
          }

          LOBYTE(v5) = 0;
        }

        v4 = v67;
        v27 = v62;
        v25 = v63;
        v33 = v60;
        v31 = v61;
      }
      else
      {
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        NEResourcesCopyLocalizedNSString(CFSTR("APP_VPN_INVALID_DOMAIN"), CFSTR("APP_VPN_INVALID_DOMAIN"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v32, "initWithFormat:", v33, objc_msgSend(v31, "count"));
        objc_msgSend(v4, "addObject:", v34);
        LOBYTE(v5) = 0;
      }

      v35 = v65;
    }
    else
    {
      NEResourcesCopyLocalizedNSString(CFSTR("APP_VPN_NO_DOMAIN"), CFSTR("APP_VPN_NO_DOMAIN"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v35);
      LOBYTE(v5) = 0;
    }

  }
  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)NEVPNApp;
  -[NEVPN descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_, v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  -[NEVPNApp appRules](self, "appRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("appRules"), v5, a4);

  -[NEVPNApp excludedDomains](self, "excludedDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("excludedDomains"), v5, a4);

  return v9;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NEAppRule *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NEVPNApp;
  v5 = -[NEVPN initFromLegacyDictionary:](&v27, sel_initFromLegacyDictionary_, v4);
  if (v5)
  {
    v6 = *MEMORY[0x1E0CE9010];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9010]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isa_nsnumber(v7);

    if ((v8 & 1) != 0
      || (v6 = *MEMORY[0x1E0CE9008],
          objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE9008]),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = isa_nsnumber(v9),
          v9,
          v10))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOnDemandEnabled:", objc_msgSend(v11, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8F78]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsarray(v12))
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (isa_nsdictionary(v19))
            {
              v20 = [NEAppRule alloc];
              v21 = -[NEAppRule initFromLegacyDictionary:](v20, "initFromLegacyDictionary:", v19, (_QWORD)v23);
              if (v21)
                objc_msgSend(v13, "addObject:", v21);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v16);
      }

      if (objc_msgSend(v13, "count"))
        objc_msgSend(v5, "setAppRules:", v13);

    }
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NEVPNApp;
  v3 = -[NEVPN copyLegacyDictionary](&v6, sel_copyLegacyDictionary);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NEVPN isOnDemandEnabled](self, "isOnDemandEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CE9010]);

  return v3;
}

- (id)copyAppRuleByID:(id)a3
{
  id v4;
  NEVPNApp *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5->_appRules;
  v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "matchSigningIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v7 = (void *)objc_msgSend(v10, "copy");
          goto LABEL_11;
        }
      }
      v7 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)removeAppRuleByID:(id)a3
{
  id v4;
  NSArray **p_appRules;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  p_appRules = &self->_appRules;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_appRules);
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "matchSigningIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v4);

      if (v10)
        break;

      if (++v7 >= (unint64_t)objc_msgSend(v6, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v6, "removeObjectAtIndex:", v7);
    objc_storeStrong((id *)p_appRules, v6);

    v11 = 1;
  }
  else
  {
LABEL_5:
    v11 = 0;
  }

  return v11;
}

- (id)copyAppRuleIDs
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_appRules, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_appRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "matchSigningIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)installSigningIdentifiersWithFlowDivertControlSocket:(int)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ssize_t v19;
  CFAllocatorRef *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  BOOL v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  int *v40;
  char *v41;
  char *v42;
  int *v43;
  char *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  char *v60;
  __int16 v61;
  char *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v51 = 0;
  v52 = 0;
  v50 = 0;
  if (self)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[NEVPNApp appRules](self, "appRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, buf, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v55 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v10, "matchSigningIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v10, "matchSigningIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              objc_msgSend(v10, "matchSigningIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "matchSigningIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v54, buf, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  if (-[NEVPN tunnelType](self, "tunnelType") == 2)
  {
    if (objc_msgSend(v17, "count"))
    {
      v18 = (void *)NEFlowTLVMsgCreate();
      NEFlowTLVAdd();
      v19 = send(a3, v18, v50 - v52, 0);
      v20 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
      if (v19 < 0)
      {
        ne_log_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v40 = __error();
          v41 = strerror(*v40);
          *(_DWORD *)buf = 136315138;
          v60 = v41;
          _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE message: %s", buf, 0xCu);
        }
        v32 = 0;
        v21 = 0;
      }
      else
      {
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v18);
        v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v17, "allKeys");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
        {
          v23 = 0;
          v24 = 0;
          v25 = 0;
          do
          {
            if (objc_msgSend(v22, "count"))
            {
              v26 = 0;
              v27 = 0;
              do
              {
                if (v25 != v27)
                {
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectAtIndexedSubscript:", v26);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "commonPrefixWithString:options:", v29, 2);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v30, "length"))
                    objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, v30);

                }
                v26 = ++v27;
              }
              while (objc_msgSend(v22, "count") > (unint64_t)v27);
            }
            objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v24 += strlen((const char *)objc_msgSend(v31, "cStringUsingEncoding:", 1));

            v23 = ++v25;
          }
          while (objc_msgSend(v22, "count") > (unint64_t)v25);
          v20 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
        }
        v53 = objc_msgSend(v21, "count");
        objc_msgSend(v22, "count");
        v18 = (void *)NEFlowTLVMsgCreate();
        NEFlowTLVAdd();
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v32 = v22;
        v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v47 != v37)
                objc_enumerationMutation(v32);
              strlen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j)), "cStringUsingEncoding:", 1));
              NEFlowTLVAdd();
            }
            v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v36);
        }

        if ((send(a3, v18, v50 - v52, 0) & 0x8000000000000000) == 0)
        {
          v33 = 1;
          if (!v18)
            goto LABEL_46;
          goto LABEL_45;
        }
        ne_log_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v42 = (char *)(v50 - v52);
          v43 = __error();
          v44 = strerror(*v43);
          *(_DWORD *)buf = 134218242;
          v60 = v42;
          v61 = 2080;
          v62 = v44;
          _os_log_error_impl(&dword_19BD16000, v34, OS_LOG_TYPE_ERROR, "Failed to send a FLOW_DIVERT_PKT_APP_MAP_CREATE with size %lu bytes: %s", buf, 0x16u);
        }
      }

      v33 = 0;
      if (v18)
LABEL_45:
        CFAllocatorDeallocate(*v20, v18);
    }
    else
    {
      v32 = 0;
      v21 = 0;
      v33 = 1;
    }
  }
  else
  {
    v32 = 0;
    v21 = 0;
    v33 = 0;
  }
LABEL_46:

  return v33;
}

- (void)updateAppRulesForUID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  NEAppRule *v25;
  void *v26;
  NEAppRule *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = *(_QWORD *)&a3;
  v48 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_appRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v43;
    v9 = &off_1E3CBB000;
    v31 = v3;
    v30 = *(_QWORD *)v43;
    do
    {
      v10 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v10);
        objc_msgSend(v11, "matchSigningIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = v9[405];
          objc_msgSend(v11, "matchSigningIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0;
          objc_msgSend(v13, "bundleProxyForIdentifier:uid:plugins:", v14, v3, &v41);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v41;

          v36 = v16;
          if (v15 && objc_msgSend(v16, "count"))
          {
            v33 = v15;
            v34 = v10;
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v38 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  objc_msgSend(v22, "identifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = -[NEVPNApp copyAppRuleByID:](self, "copyAppRuleByID:", v23);

                  if (!v24)
                  {
                    v25 = [NEAppRule alloc];
                    objc_msgSend(v22, "identifier");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = -[NEAppRule initWithSigningIdentifier:](v25, "initWithSigningIdentifier:", v26);

                    if (v27)
                    {
                      if (!v7)
                        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend(v7, "addObject:", v27);
                    }

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              }
              while (v19);
            }

            v3 = v31;
            v8 = v30;
            v6 = v32;
            v15 = v33;
            v9 = &off_1E3CBB000;
            v10 = v34;
          }

        }
        ++v10;
      }
      while (v10 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (objc_msgSend(v7, "count"))
  {
    -[NEVPNApp appRules](self, "appRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNApp setAppRules:](self, "setAppRules:", v29);

  }
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)noRestriction
{
  return self->_noRestriction;
}

- (void)setNoRestriction:(BOOL)a3
{
  self->_noRestriction = a3;
}

- (BOOL)restrictDomains
{
  return self->_restrictDomains;
}

- (void)setRestrictDomains:(BOOL)a3
{
  self->_restrictDomains = a3;
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExcludedDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedDomains, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
