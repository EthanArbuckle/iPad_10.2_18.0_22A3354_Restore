@implementation CPLTransportScopeMapping

- (CPLTransportScopeMapping)initWithTranslator:(id)a3
{
  id v5;
  CPLTransportScopeMapping *v6;
  CPLTransportScopeMapping *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mapping;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLTransportScopeMapping;
  v6 = -[CPLTransportScopeMapping init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_translator, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapping = v7->_mapping;
    v7->_mapping = v8;

  }
  return v7;
}

- (void)addTransportScope:(id)a3 forScopeWithIdentifier:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[CPLTransportScopeTranslator concreteScopeFromTransportScope:](self->_translator, "concreteScopeFromTransportScope:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)addConcreteScope:(id)a3 forScopeWithIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)concreteScopeForScopeWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (BOOL)hasConcreteScopeForScopeWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setSharedScopeIdentifier:(id)a3 forScopeWithIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *sharedScopeIdentifierMapping;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_sharedScopeIdentifierMapping)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharedScopeIdentifierMapping = self->_sharedScopeIdentifierMapping;
    self->_sharedScopeIdentifierMapping = v7;

  }
  if (v10)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedScopeIdentifierMapping, "setObject:forKeyedSubscript:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sharedScopeIdentifierMapping, "setObject:forKeyedSubscript:", v9, v6);

  }
}

- (BOOL)shouldSetSharedScopeIdentifierForScopeWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedScopeIdentifierMapping, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)sharedScopeIdentifierForScopeWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sharedScopeIdentifierMapping, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_mapping, "count");
}

- (void)enumerateConcreteScopesWithBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_mapping, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (BOOL)_checkTransportScopeForScopeIdentifier:(id)a3 hasConcreteScope:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mapping, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    if (a5)
    {
      +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("Scope %@ has an invalid transport scope"), v8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *a4 = v9 != 0;
  }

  return v9 != v10;
}

- (BOOL)_addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  CPLTransportScopeTranslator **p_translator;
  uint64_t v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  CPLTransportScopeMapping *v33;
  uint64_t v34;

  v8 = a6;
  v9 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "scopeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", objc_msgSend(v12, "scopeType")))
  {
    objc_msgSend(v13, "stagingScopeForScope:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v15 != 0;
    if (v15)
    {
      v18 = v15;

      v12 = v18;
    }

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v13, "transportScopeForScope:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    if (!v9)
      goto LABEL_24;
    p_translator = &self->_translator;
LABEL_14:
    -[CPLTransportScopeTranslator tentativeConcreteScopeForScope:](*p_translator, "tentativeConcreteScopeForScope:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_24;
    goto LABEL_15;
  }
  p_translator = &self->_translator;
  -[CPLTransportScopeTranslator concreteScopeFromTransportScope:](self->_translator, "concreteScopeFromTransportScope:", v19);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (!v21 && v9)
    goto LABEL_14;
  if (!v21)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", v26, v14);

    if (a7)
    {
      +[CPLErrors invalidScopeErrorWithScopeIdentifier:](CPLErrors, "invalidScopeErrorWithScopeIdentifier:", v14);
      v22 = 0;
      v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
      v25 = 0;
    }
    goto LABEL_27;
  }
LABEL_15:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", v22, v14);
  v23 = self->_hasStagingScopes && v17;
  self->_hasStagingScopes = v23;
  if (!_CPLSilentLogging)
  {
    if (__CPLTransportScopeOSLogDomain_onceToken != -1)
      dispatch_once(&__CPLTransportScopeOSLogDomain_onceToken, &__block_literal_global_3871);
    v24 = __CPLTransportScopeOSLogDomain_result;
    if (os_log_type_enabled((os_log_t)__CPLTransportScopeOSLogDomain_result, OS_LOG_TYPE_DEBUG))
    {
      v28 = 138412802;
      v29 = v22;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = self;
      _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_DEBUG, "Adding %@ for %@ to %@", (uint8_t *)&v28, 0x20u);
    }
  }
  v25 = 1;
LABEL_27:

  return v25;
}

- (BOOL)_addAllTransportScopesForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  if (-[CPLTransportScopeMapping _addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:](self, "_addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v12, v13, v9, v8, a7))
  {
    objc_msgSend(v13, "sharingScopeForScope:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scopeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scopeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLTransportScopeMapping setSharedScopeIdentifier:forScopeWithIdentifier:](self, "setSharedScopeIdentifier:forScopeWithIdentifier:", v15, v16);

    if (v14)
      v17 = -[CPLTransportScopeMapping _addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:](self, "_addTransportScopeForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v14, v13, v9, v8, a7);
    else
      v17 = 1;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)addTransportScopeForScopeIdentifier:(id)a3 scopes:(id)a4 useStagingScopeIfNecessary:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  char v16;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v16 = 0;
  v12 = -[CPLTransportScopeMapping _checkTransportScopeForScopeIdentifier:hasConcreteScope:error:](self, "_checkTransportScopeForScopeIdentifier:hasConcreteScope:error:", v10, &v16, a6);
  if (v12 && !v16)
  {
    objc_msgSend(v11, "scopeWithIdentifier:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      LOBYTE(v12) = -[CPLTransportScopeMapping _addAllTransportScopesForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:](self, "_addAllTransportScopesForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v13, v11, 0, v7, a6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mapping, "setObject:forKeyedSubscript:", v14, v10);

      if (a6)
      {
        +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 32, CFSTR("Unknown scope %@"), v10);
        LOBYTE(v12) = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }

  }
  return v12;
}

- (BOOL)addTransportScopeForScope:(id)a3 scopes:(id)a4 allowsTentativeTransportScope:(BOOL)a5 useStagingScopeIfNecessary:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  char v17;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v17 = 0;
  objc_msgSend(v12, "scopeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CPLTransportScopeMapping _checkTransportScopeForScopeIdentifier:hasConcreteScope:error:](self, "_checkTransportScopeForScopeIdentifier:hasConcreteScope:error:", v14, &v17, a7);
  if (v15 && !v17)
    LOBYTE(v15) = -[CPLTransportScopeMapping _addAllTransportScopesForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:](self, "_addAllTransportScopesForScope:scopes:allowsTentativeTransportScope:useStagingScopeIfNecessary:error:", v12, v13, v9, v8, a7);

  return v15;
}

- (void)updateWithTransportScopeMapping:(id)a3
{
  CPLTransportScopeMapping *v5;
  CPLTransportScopeMapping *v6;
  NSObject *v7;
  CPLTransportScopeTranslator *translator;
  CPLTransportScopeTranslator *v9;
  void *v10;
  void *v11;
  CPLTransportScopeMapping *v12;
  uint8_t buf[4];
  CPLTransportScopeTranslator *v14;
  __int16 v15;
  CPLTransportScopeTranslator *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (CPLTransportScopeMapping *)a3;
  v6 = v5;
  if (v5 != self)
  {
    v12 = v5;
    if (self->_translator != v5->_translator)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          translator = self->_translator;
          v9 = v12->_translator;
          *(_DWORD *)buf = 138412546;
          v14 = translator;
          v15 = 2112;
          v16 = v9;
          _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Trying to merge two incompatible mappings (%@ / %@)", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLTransportScopeMapping.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 184, CFSTR("Trying to merge two incompatible mappings (%@ / %@)"), self->_translator, v12->_translator);

      abort();
    }
    -[NSMutableDictionary addEntriesFromDictionary:](self->_mapping, "addEntriesFromDictionary:", v5->_mapping);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_sharedScopeIdentifierMapping, "addEntriesFromDictionary:", v12->_sharedScopeIdentifierMapping);
    v6 = v12;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p for %@ (count: %lu)>"), objc_opt_class(), self, self->_translator, -[NSMutableDictionary count](self->_mapping, "count"));
}

- (CPLTransportScopeTranslator)translator
{
  return self->_translator;
}

- (BOOL)hasStagingScopes
{
  return self->_hasStagingScopes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_sharedScopeIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end
