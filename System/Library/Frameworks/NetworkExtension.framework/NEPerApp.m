@implementation NEPerApp

- (NEPerApp)init
{
  NEPerApp *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEPerApp;
  result = -[NEPerApp init](&v3, sel_init);
  if (result)
    result->_noRestriction = 1;
  return result;
}

- (NEPerApp)initWithCoder:(id)a3
{
  id v4;
  NEPerApp *v5;
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

  v4 = a3;
  v5 = -[NEPerApp init](self, "init");
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
  id v6;

  v4 = a3;
  -[NEPerApp appRules](self, "appRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Rules"));

  -[NEPerApp excludedDomains](self, "excludedDomains");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ExcludedDomains"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEPerApp appRules](self, "appRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[NEPerApp appRules](self, "appRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:copyItems:", v7, 1);
    objc_msgSend(v4, "setAppRules:", v8);

  }
  v9 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[NEPerApp excludedDomains](self, "excludedDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:copyItems:", v10, 1);
  objc_msgSend(v4, "setExcludedDomains:", v11);

  return v4;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NEPerApp appRules](self, "appRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NEPerApp appRules](self, "appRules", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = 1;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!objc_msgSend(v12, "checkValidityAndCollectErrors:", v4))
              v10 = 0;
          }
          else
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Invalid app rule"), v4);
            v10 = 0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }

    v13 = v10 & 1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[NEPerApp appRules](self, "appRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("appRules"), v5, a4);

  -[NEPerApp excludedDomains](self, "excludedDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("excludedDomains"), v5, a4);

  return v7;
}

- (id)copyAppRuleByID:(id)a3
{
  id v4;
  NEPerApp *v5;
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
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
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
  id v5;
  NSArray **p_appRules;
  NSArray *appRules;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  appRules = self->_appRules;
  p_appRules = &self->_appRules;
  v8 = (void *)objc_msgSend(v5, "initWithArray:", appRules);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "matchSigningIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
        break;

      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v8, "removeObjectAtIndex:", v9);
    objc_storeStrong((id *)p_appRules, v8);

    v13 = 1;
  }
  else
  {
LABEL_5:
    v13 = 0;
  }

  return v13;
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
                  v24 = -[NEPerApp copyAppRuleByID:](self, "copyAppRuleByID:", v23);

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
    -[NEPerApp appRules](self, "appRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPerApp setAppRules:](self, "setAppRules:", v29);

  }
}

- (id)copyCachedMachOUUIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NEPerApp appRules](self, "appRules", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "cachedMachOUUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          objc_msgSend(v9, "cachedMachOUUIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v13 = v3;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAppRules:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
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
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExcludedDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
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
