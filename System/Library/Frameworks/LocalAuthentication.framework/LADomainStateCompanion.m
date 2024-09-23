@implementation LADomainStateCompanion

- (LADomainStateCompanion)initWithResult:(id)a3
{
  id v4;
  LADomainStateCompanion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *availableCompanions;
  uint64_t v12;
  NSMutableDictionary *stateHashForCompanionType;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LADomainStateCompanion;
  v5 = -[LADomainStateCompanion init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D442C0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D442D0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_new();
    availableCompanions = v5->_availableCompanions;
    v5->_availableCompanions = (NSMutableSet *)v10;

    v12 = objc_opt_new();
    stateHashForCompanionType = v5->_stateHashForCompanionType;
    v5->_stateHashForCompanionType = (NSMutableDictionary *)v12;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLValue");

          if (v21)
          {
            -[NSMutableSet addObject:](v5->_availableCompanions, "addObject:", v19);
            v22 = (void *)MEMORY[0x1E0D443D0];
            objc_msgSend(v9, "objectForKeyedSubscript:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "saltHash:withBundleID:", v23, v7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_stateHashForCompanionType, "setObject:forKeyedSubscript:", v24, v19);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    -[LADomainStateCompanion _resolveCombinedStateHash](v5, "_resolveCombinedStateHash");
    v4 = v26;
  }

  return v5;
}

- (NSSet)availableCompanionTypes
{
  return (NSSet *)self->_availableCompanions;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (id)stateHashForCompanionType:(int64_t)a3
{
  NSMutableDictionary *stateHashForCompanionType;
  void *v4;
  void *v5;

  stateHashForCompanionType = self->_stateHashForCompanionType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](stateHashForCompanionType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_resolveCombinedStateHash
{
  void *v3;
  void *v4;
  void *v5;
  NSData *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSData *stateHash;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_stateHashForCompanionType, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_stateHashForCompanionType, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendData:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0D443D0], "createHashForDomainState:", v5);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSMutableDictionary allValues](self->_stateHashForCompanionType, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  stateHash = self->_stateHash;
  self->_stateHash = v6;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainStateCompanion availableCompanionTypes](self, "availableCompanionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("availableCompanions: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainStateCompanion stateHash](self, "stateHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("stateHash: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHashForCompanionType, 0);
  objc_storeStrong((id *)&self->_stateHash, 0);
  objc_storeStrong((id *)&self->_availableCompanions, 0);
}

@end
