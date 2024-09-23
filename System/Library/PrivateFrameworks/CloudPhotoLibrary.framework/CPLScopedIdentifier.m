@implementation CPLScopedIdentifier

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "archiveCursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArchiveCursor:", v6);
  -[CPLScopedIdentifier encodeWithCoder:](self, "encodeWithCoder:", v5);
  objc_msgSend(v5, "setArchiveCursor:", v7);

  return v6;
}

- (CPLScopedIdentifier)initWithCPLArchiver:(id)a3
{
  _QWORD *v5;
  CPLScopedIdentifier *v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        v11 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Incorrect class for CPLScopedIdentifier. Found %@: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 1167, CFSTR("Incorrect class for CPLScopedIdentifier. Found %@: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  v6 = -[CPLScopedIdentifier initWithCoder:](self, "initWithCoder:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("i"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_scopeIdentifier, CFSTR("s"));
  if (self->_scopeIndex >= 1)
    objc_msgSend(v4, "encodeInteger:forKey:");

}

- (CPLScopedIdentifier)initWithCoder:(id)a3
{
  id v4;
  CPLScopedIdentifier *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *scopeIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLScopedIdentifier;
  v5 = -[CPLScopedIdentifier init](&v11, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken_9259 != -1)
      dispatch_once(&initWithCoder__onceToken_9259, &__block_literal_global_32_9260);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCoder__stringClass_9261, CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCoder__stringClass_9261, CFSTR("s"));
    v8 = objc_claimAutoreleasedReturnValue();
    scopeIdentifier = v5->_scopeIdentifier;
    v5->_scopeIdentifier = (NSString *)v8;

    v5->_scopeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("#"));
  }

  return v5;
}

- (int64_t)scopeIndex
{
  if (self->_scopeIndex <= 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return self->_scopeIndex;
}

- (void)setScopeIndex:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "invalid scope index", v8, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 130, CFSTR("invalid scope index"));

    abort();
  }
  self->_scopeIndex = a3;
}

- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CPLScopedIdentifier *v10;
  uint64_t v11;
  NSString *scopeIdentifier;
  uint64_t v13;
  NSString *identifier;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_super v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "nil identifier", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 221, CFSTR("nil identifier"));

    abort();
  }
  v9 = v8;
  v19.receiver = self;
  v19.super_class = (Class)CPLScopedIdentifier;
  v10 = -[CPLScopedIdentifier init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    scopeIdentifier = v10->_scopeIdentifier;
    v10->_scopeIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v13;

  }
  return v10;
}

- (id)initRelativeToScopedIdentifier:(id)a3 identifier:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  CPLScopedIdentifier *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](self, "initWithScopeIdentifier:identifier:", v8, v7);

  if (v9)
    v9->_scopeIndex = v6[1];

  return v9;
}

- (id)initInMainScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  CPLScopedIdentifier *v6;

  v4 = a3;
  CPLPrimaryScopeIdentifierForCurrentUniverse();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](self, "initWithScopeIdentifier:identifier:", v5, v4);

  return v6;
}

- (CPLScopedIdentifier)initWithScopeIdentifier:(id)a3 identifier:(id)a4 scopeIndex:(int64_t)a5
{
  CPLScopedIdentifier *result;

  result = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](self, "initWithScopeIdentifier:identifier:", a3, a4);
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (result)
      result->_scopeIndex = a5;
  }
  return result;
}

- (id)descriptionWithNoScopeIndex
{
  return +[CPLScopedIdentifier descriptionWithScopeIdentifier:identifier:](CPLScopedIdentifier, "descriptionWithScopeIdentifier:identifier:", self->_scopeIdentifier, self->_identifier);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  if (self->_scopeIndex <= 0)
  {
    -[CPLScopedIdentifier descriptionWithNoScopeIndex](self, "descriptionWithNoScopeIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[CPLScopedIdentifier descriptionWithNoScopeIndex](self, "descriptionWithNoScopeIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(%ld)"), v4, self->_scopeIndex);

  }
  return v5;
}

- (unint64_t)hash
{
  NSString *scopeIdentifier;
  unint64_t v4;

  scopeIdentifier = self->_scopeIdentifier;
  v4 = -[NSString hash](self->_identifier, "hash");
  if (scopeIdentifier)
    v4 ^= -[NSString hash](self->_scopeIdentifier, "hash");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CPLScopedIdentifier *v4;
  unint64_t v5;
  void *v6;
  NSString *scopeIdentifier;
  char v8;
  BOOL v9;
  unint64_t v10;

  v4 = (CPLScopedIdentifier *)a3;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self->_scopeIdentifier;
    v6 = (void *)v5;
    scopeIdentifier = v4->_scopeIdentifier;
    if (v5 && scopeIdentifier)
    {
      v8 = objc_msgSend((id)v5, "isEqual:");

      if ((v8 & 1) == 0)
        goto LABEL_6;
    }
    else
    {
      v10 = v5 | (unint64_t)scopeIdentifier;

      if (v10)
        goto LABEL_6;
    }
    v9 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4->_identifier);
    goto LABEL_10;
  }
LABEL_6:
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", self->_scopeIdentifier, self->_identifier);
}

- (id)safeFilename
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@#%@"), self->_scopeIdentifier, self->_identifier);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR(":"), 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (BOOL)isInAMomentShare
{
  return -[NSString hasPrefix:](self->_scopeIdentifier, "hasPrefix:", CFSTR("CMM-"));
}

- (NSString)scopeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
}

uint64_t __37__CPLScopedIdentifier_initWithCoder___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCoder__stringClass_9261 = result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scopedIdentifiersFromArrayOfUnknownIdentifiers:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  CPLScopedIdentifier *v14;
  CPLScopedIdentifier *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "firstObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          if (v12)
          {
            v13 = v12;
            v14 = [CPLScopedIdentifier alloc];
            v15 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v14, "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v13, (_QWORD)v17);

          }
          else
          {
            v15 = 0;
          }
          objc_msgSend(v6, "addObject:", v15, (_QWORD)v17);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

+ (id)scopedIdentifiersFromSetOfUnknownIdentifiers:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  CPLScopedIdentifier *v14;
  CPLScopedIdentifier *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "anyObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          if (v12)
          {
            v13 = v12;
            v14 = [CPLScopedIdentifier alloc];
            v15 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v14, "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v13, (_QWORD)v17);

          }
          else
          {
            v15 = 0;
          }
          objc_msgSend(v6, "addObject:", v15, (_QWORD)v17);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

+ (id)scopedIdentifiersFromDictionaryOfUnknownIdentifiers:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _OWORD v10[4];
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    memset(v10, 0, sizeof(v10));
    if (objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", v10, v11, 16))
      v4 = **((id **)&v10[0] + 1);
    else
      v4 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __75__CPLScopedIdentifier_scopedIdentifiersFromDictionaryOfUnknownIdentifiers___block_invoke;
      v8[3] = &unk_1E60D9BA8;
      v5 = v6;
      v9 = v5;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

    }
    else
    {
      v5 = v3;
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

+ (id)unscopedIdentifiersFromArrayOfScopedIdentifiers:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "identifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (!v3)
      v11 = 0;
    v4 = v11;
  }

  return v4;
}

+ (id)unscopedIdentifiersFromSetOfScopedIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identifier", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)unscopedIdentifiersFromDictionaryOfScopedIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__CPLScopedIdentifier_unscopedIdentifiersFromDictionaryOfScopedIdentifiers___block_invoke;
    v8[3] = &unk_1E60D9BD0;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
    if (!v3)
      v6 = 0;
    v5 = v6;
  }

  return v5;
}

+ (id)descriptionWithScopeIdentifier:(id)a3 identifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@#%@"), v6, v7);

  return v8;
}

+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  CPLPrimaryScopeIdentifierForCurrentUniverse();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scopedIdentifierWithString:includeScopeIndex:defaultScopeIdentifier:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPLScopedIdentifier *)v8;
}

+ (CPLScopedIdentifier)scopedIdentifierWithString:(id)a3 includeScopeIndex:(BOOL)a4 defaultScopeIdentifier:(id)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  uint64_t v11;
  CPLScopedIdentifier *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CPLScopedIdentifier *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  SEL v31;
  id v32;

  v5 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("#"));
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", v9, v10);
    v13 = v10;
  }
  else
  {
    v14 = v11;
    objc_msgSend(v10, "substringToIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", v14 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __91__CPLScopedIdentifier_scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier___block_invoke;
    v30 = &__block_descriptor_48_e5_v8__0l;
    v31 = a2;
    v32 = a1;
    if (scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__onceToken != -1)
      dispatch_once(&scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__onceToken, &v27);
    objc_msgSend((id)scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp, "firstMatchInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length", v27, v28, v29, v30, v31, v32));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = objc_msgSend(v16, "rangeAtIndex:", 2);
      objc_msgSend(v15, "substringWithRange:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      v22 = objc_msgSend(v17, "rangeAtIndex:", 1);
      objc_msgSend(v15, "substringWithRange:", v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v24;
    }
    else
    {
      v21 = 0;
    }
    v25 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", v15, v13);
    v12 = v25;
    if (v5 && v21 >= 1)
      -[CPLScopedIdentifier setScopeIndex:](v25, "setScopeIndex:", v21);

  }
  return v12;
}

void __91__CPLScopedIdentifier_scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^(.*)\\(([0-9]+)\\)$"), 0, 0);
  v3 = (void *)scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp;
  scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp = v2;

  if (!scopedIdentifierWithString_includeScopeIndex_defaultScopeIdentifier__regExp)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Impossible to create regular expression for scopes", v9, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopedIdentifier.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v7, v6, v8, 306, CFSTR("Impossible to create regular expression for scopes"));

    abort();
  }
}

void __76__CPLScopedIdentifier_unscopedIdentifiersFromDictionaryOfScopedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

}

void __75__CPLScopedIdentifier_scopedIdentifiersFromDictionaryOfUnknownIdentifiers___block_invoke(uint64_t a1, CPLScopedIdentifier *a2, void *a3)
{
  CPLScopedIdentifier *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, a2);

}

@end
