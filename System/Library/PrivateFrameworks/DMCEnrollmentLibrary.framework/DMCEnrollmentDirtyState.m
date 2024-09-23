@implementation DMCEnrollmentDirtyState

- (DMCEnrollmentDirtyState)initWithDictionary:(id)a3
{
  id v4;
  DMCEnrollmentDirtyState *v5;
  uint64_t v6;
  NSMutableDictionary *stateDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCEnrollmentDirtyState;
  v5 = -[DMCEnrollmentDirtyState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    stateDictionary = v5->_stateDictionary;
    v5->_stateDictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)dictionary
{
  void *v3;

  v3 = (void *)-[NSMutableDictionary count](self->_stateDictionary, "count");
  if (v3)
    v3 = (void *)-[NSMutableDictionary copy](self->_stateDictionary, "copy");
  return v3;
}

- (NSArray)dirtyPersonaIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PersonaID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)addDirtyPersonaID:(id)a3
{
  -[DMCEnrollmentDirtyState _addValue:toArrayForKey:](self, "_addValue:toArrayForKey:", a3, CFSTR("PersonaID"));
}

- (void)removeDirtyPersonaID:(id)a3
{
  -[DMCEnrollmentDirtyState _removeValue:fromArrayForKey:](self, "_removeValue:fromArrayForKey:", a3, CFSTR("PersonaID"));
}

- (NSArray)dirtyRMAccounts
{
  void *v2;
  void *v3;
  void *v4;

  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RMAccountIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)addDirtyRMAccount:(id)a3
{
  -[DMCEnrollmentDirtyState _addValue:toArrayForKey:](self, "_addValue:toArrayForKey:", a3, CFSTR("RMAccountIdentifier"));
}

- (void)removeDirtyRMAccount:(id)a3
{
  -[DMCEnrollmentDirtyState _removeValue:fromArrayForKey:](self, "_removeValue:fromArrayForKey:", a3, CFSTR("RMAccountIdentifier"));
}

- (NSArray)dirtyAltDISDs
{
  void *v2;
  void *v3;
  void *v4;

  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AltDSID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)addDirtyAltDSID:(id)a3
{
  -[DMCEnrollmentDirtyState _addValue:toArrayForKey:](self, "_addValue:toArrayForKey:", a3, CFSTR("AltDSID"));
}

- (void)removeDirtyAltDSID:(id)a3
{
  -[DMCEnrollmentDirtyState _removeValue:fromArrayForKey:](self, "_removeValue:fromArrayForKey:", a3, CFSTR("AltDSID"));
}

- (NSArray)dirtyProfileIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ProfileIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)addDirtyProfileIdentifier:(id)a3
{
  -[DMCEnrollmentDirtyState _addValue:toArrayForKey:](self, "_addValue:toArrayForKey:", a3, CFSTR("ProfileIdentifier"));
}

- (void)removeDirtyProfileIdentifier:(id)a3
{
  -[DMCEnrollmentDirtyState _removeValue:fromArrayForKey:](self, "_removeValue:fromArrayForKey:", a3, CFSTR("ProfileIdentifier"));
}

- (NSArray)dirtyBundleIDs
{
  void *v2;
  void *v3;
  void *v4;

  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)addDirtyBundleID:(id)a3
{
  -[DMCEnrollmentDirtyState _addValue:toArrayForKey:](self, "_addValue:toArrayForKey:", a3, CFSTR("BundleID"));
}

- (void)removeDirtyBundleID:(id)a3
{
  -[DMCEnrollmentDirtyState _removeValue:fromArrayForKey:](self, "_removeValue:fromArrayForKey:", a3, CFSTR("BundleID"));
}

- (void)_addValue:(id)a3 toArrayForKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v23);

  if ((v9 & 1) == 0)
  {
    -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

    }
    -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");
      -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v6);

    }
    -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v23);

  }
}

- (void)_removeValue:(id)a3 fromArrayForKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v19);

  if (v9)
  {
    -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");
      -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v6);

    }
    -[DMCEnrollmentDirtyState stateDictionary](self, "stateDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObject:", v19);

  }
}

- (NSMutableDictionary)stateDictionary
{
  NSMutableDictionary *stateDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  stateDictionary = self->_stateDictionary;
  if (!stateDictionary)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_stateDictionary;
    self->_stateDictionary = v4;

    stateDictionary = self->_stateDictionary;
  }
  return stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_stateDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDictionary, 0);
}

@end
