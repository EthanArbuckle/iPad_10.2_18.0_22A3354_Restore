@implementation CPLFeatureVersionHistory

- (CPLFeatureVersionHistory)initWithCoder:(id)a3
{
  id v4;
  CPLFeatureVersionHistory *v5;
  void *v6;
  id *v7;
  int v8;
  CPLFeatureVersionHistory *v9;
  _QWORD block[4];
  CPLFeatureVersionHistory *v12;
  _QWORD v13[4];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = -[CPLFeatureVersionHistory initWithCurrentFeatureVersion:](self, "initWithCurrentFeatureVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("current")));
  if (v5)
  {
    if (initWithCoder__onceToken_17810 != -1)
      dispatch_once(&initWithCoder__onceToken_17810, &__block_literal_global_17811);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__versionsClasses, CFSTR("versions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_2;
        v13[3] = &unk_1E60DC658;
        v14[1] = &v15;
        v14[0] = v5;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
        v7 = (id *)v14;
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_8;
        block[3] = &unk_1E60D65B8;
        v7 = (id *)&v12;
        v12 = v5;
        if (initWithCoder__logOnceToken_17813 != -1)
          dispatch_once(&initWithCoder__logOnceToken_17813, block);
        *((_BYTE *)v16 + 24) = 0;
      }

      v8 = *((unsigned __int8 *)v16 + 24);
      _Block_object_dispose(&v15, 8);

      if (!v8)
      {
        v9 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      _Block_object_dispose(&v15, 8);

    }
  }
  v9 = v5;
LABEL_13:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t currentFeatureVersion;
  id v5;

  currentFeatureVersion = self->_currentFeatureVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", currentFeatureVersion, CFSTR("current"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionToAnchor, CFSTR("versions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CPLFeatureVersionHistory *v4;
  uint64_t v5;
  NSMutableDictionary *versionToAnchor;
  uint64_t v7;
  NSMutableDictionary *anchorToVersion;

  v4 = -[CPLFeatureVersionHistory initWithCurrentFeatureVersion:]([CPLFeatureVersionHistory alloc], "initWithCurrentFeatureVersion:", self->_currentFeatureVersion);
  v5 = -[NSMutableDictionary copy](self->_versionToAnchor, "copy");
  versionToAnchor = v4->_versionToAnchor;
  v4->_versionToAnchor = (NSMutableDictionary *)v5;

  v7 = -[NSMutableDictionary copy](self->_anchorToVersion, "copy");
  anchorToVersion = v4->_anchorToVersion;
  v4->_anchorToVersion = (NSMutableDictionary *)v7;

  return v4;
}

- (CPLFeatureVersionHistory)initWithCurrentFeatureVersion:(int64_t)a3
{
  CPLFeatureVersionHistory *v4;
  CPLFeatureVersionHistory *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *anchorToVersion;
  NSMutableDictionary *v8;
  NSMutableDictionary *versionToAnchor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPLFeatureVersionHistory;
  v4 = -[CPLFeatureVersionHistory init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_currentFeatureVersion = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    anchorToVersion = v5->_anchorToVersion;
    v5->_anchorToVersion = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    versionToAnchor = v5->_versionToAnchor;
    v5->_versionToAnchor = v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CPLFeatureVersionHistory *v4;
  unint64_t v5;
  NSMutableDictionary *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (CPLFeatureVersionHistory *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_currentFeatureVersion == v4->_currentFeatureVersion)
    {
      v5 = self->_versionToAnchor;
      v6 = v4->_versionToAnchor;
      v7 = (unint64_t)v6;
      v8 = v5 && v6 && (objc_msgSend((id)v5, "isEqual:", v6) & 1) != 0 || (v5 | v7) == 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t currentFeatureVersion;

  currentFeatureVersion = self->_currentFeatureVersion;
  return -[NSMutableDictionary hash](self->_versionToAnchor, "hash") ^ currentFeatureVersion;
}

- (void)addSyncAnchor:(id)a3 forFeatureVersion:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_versionToAnchor, "setObject:forKeyedSubscript:", v9, v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorToVersion, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "integerValue") > a4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_anchorToVersion, "setObject:forKeyedSubscript:", v6, v9);

}

- (id)syncAnchorForFeatureVersion:(int64_t)a3
{
  NSMutableDictionary *versionToAnchor;
  void *v4;
  void *v5;

  versionToAnchor = self->_versionToAnchor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](versionToAnchor, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)featureVersionForSyncAnchor:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorToVersion, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ %ld"), objc_opt_class(), self->_currentFeatureVersion);
  -[NSMutableDictionary allKeys](self->_versionToAnchor, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 1;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "integerValue");
        -[NSMutableDictionary objectForKeyedSubscript:](self->_versionToAnchor, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorToVersion, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");
        v16 = "-";
        if (v15 == v12)
          v16 = ", ";
        if ((v8 & 1) != 0)
          v16 = " anchors: ";
        objc_msgSend(v3, "appendFormat:", CFSTR("%s%ld"), v16, v12);

        v8 = 0;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = 0;
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)enumerateHistoryWithBlock:(id)a3
{
  void (**v4)(id, int64_t, void *, _BYTE *);
  int64_t v5;
  NSMutableDictionary *versionToAnchor;
  void *v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, int64_t, void *, _BYTE *))a3;
  if ((self->_currentFeatureVersion & 0x8000000000000000) == 0)
  {
    v5 = -1;
    while (1)
    {
      ++v5;
      versionToAnchor = self->_versionToAnchor;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](versionToAnchor, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = 0;
        v4[2](v4, v5, v8, &v9);
        if (v9)
          break;
      }

      if (v5 >= self->_currentFeatureVersion)
        goto LABEL_8;
    }

  }
LABEL_8:

}

- (int64_t)currentFeatureVersion
{
  return self->_currentFeatureVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionToAnchor, 0);
  objc_storeStrong((id *)&self->_anchorToVersion, 0);
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v12 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addSyncAnchor:forFeatureVersion:", v7, objc_msgSend(v12, "integerValue"));
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_3;
    block[3] = &unk_1E60D6EC0;
    v9 = *(id *)(a1 + 32);
    v14 = v9;
    v10 = v12;
    v15 = v10;
    v11 = v7;
    v16 = v11;
    if (initWithCoder__logOnceToken_17813 != -1)
    {
      dispatch_once(&initWithCoder__logOnceToken_17813, block);
      v10 = v15;
      v11 = v16;
      v9 = v14;
    }
    *a4 = 1;

  }
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_8()
{
  NSObject *v0;
  id v1;
  int v2;
  id v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v2 = 138412290;
      v3 = (id)objc_opt_class();
      v1 = v3;
      _os_log_impl(&dword_1B03C2000, v0, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - missing versionToAnchor", (uint8_t *)&v2, 0xCu);

    }
  }
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (void *)objc_opt_class();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v6 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Failed to deserialize %@ - invalid versionToAnchor dictionary %@: %@", (uint8_t *)&v7, 0x20u);

    }
  }
}

void __42__CPLFeatureVersionHistory_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithCoder__versionsClasses;
  initWithCoder__versionsClasses = v3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
