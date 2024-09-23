@implementation CPLScopeFilter

- (id)_setOfScopeIdentifiersFromEnumeration:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v3, "copy");
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (CPLScopeFilter)initWithIncludedScopeIdentifiers:(id)a3
{
  id v4;
  CPLScopeFilter *v5;
  CPLScopeFilter *v6;
  uint64_t v7;
  NSSet *includedScopeIdentifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeFilter;
  v5 = -[CPLScopeFilter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CPLScopeFilter _setOfScopeIdentifiersFromEnumeration:](v5, "_setOfScopeIdentifiersFromEnumeration:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    includedScopeIdentifiers = v6->_includedScopeIdentifiers;
    v6->_includedScopeIdentifiers = (NSSet *)v7;

  }
  return v6;
}

- (CPLScopeFilter)initWithExcludedScopeIdentifiers:(id)a3
{
  id v4;
  CPLScopeFilter *v5;
  CPLScopeFilter *v6;
  uint64_t v7;
  NSSet *excludedScopeIdentifiers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLScopeFilter;
  v5 = -[CPLScopeFilter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CPLScopeFilter _setOfScopeIdentifiersFromEnumeration:](v5, "_setOfScopeIdentifiersFromEnumeration:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    excludedScopeIdentifiers = v6->_excludedScopeIdentifiers;
    v6->_excludedScopeIdentifiers = (NSSet *)v7;

  }
  return v6;
}

- (BOOL)filterOnScopeIdentifier:(id)a3
{
  id v4;
  NSSet *includedScopeIdentifiers;
  _BOOL4 v6;
  NSSet *excludedScopeIdentifiers;

  v4 = a3;
  includedScopeIdentifiers = self->_includedScopeIdentifiers;
  if (includedScopeIdentifiers)
  {
    LOBYTE(v6) = -[NSSet containsObject:](includedScopeIdentifiers, "containsObject:", v4);
  }
  else
  {
    excludedScopeIdentifiers = self->_excludedScopeIdentifiers;
    if (excludedScopeIdentifiers)
      v6 = !-[NSSet containsObject:](excludedScopeIdentifiers, "containsObject:", v4);
    else
      LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  __CFString *v8;

  if (self->_includedScopeIdentifiers)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSSet allObjects](self->_includedScopeIdentifiers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("[incl: %@]"), v5);
  }
  else
  {
    if (!self->_excludedScopeIdentifiers)
    {
      v8 = CFSTR("[none]");
      return v8;
    }
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSSet allObjects](self->_excludedScopeIdentifiers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "initWithFormat:", CFSTR("[excl: %@]"), v5);
  }
  v8 = (__CFString *)v6;

  return v8;
}

- (NSString)simpleDescription
{
  NSSet *includedScopeIdentifiers;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;

  includedScopeIdentifiers = self->_includedScopeIdentifiers;
  if (includedScopeIdentifiers)
  {
    -[NSSet allObjects](includedScopeIdentifiers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_excludedScopeIdentifiers)
    {
      v5 = CFSTR("All Scopes");
      return (NSString *)v5;
    }
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NSSet allObjects](self->_excludedScopeIdentifiers, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("All Scopes but %@"), v7);

  }
  return (NSString *)v5;
}

- (NSSet)includedScopeIdentifiers
{
  return self->_includedScopeIdentifiers;
}

- (NSSet)excludedScopeIdentifiers
{
  return self->_excludedScopeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedScopeIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedScopeIdentifiers, 0);
}

@end
