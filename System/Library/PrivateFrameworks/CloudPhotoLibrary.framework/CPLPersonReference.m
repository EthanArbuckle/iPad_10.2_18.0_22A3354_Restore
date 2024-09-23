@implementation CPLPersonReference

- (CPLPersonReference)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLPersonReference;
  return -[CPLPersonReference init](&v3, sel_init);
}

- (CPLPersonReference)initWithSerializedString:(id)a3
{
  id v4;
  CPLPersonReference *v5;
  CPLPersonReference *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  CPLPersonReference *v21;
  id v22;
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
  v27.super_class = (Class)CPLPersonReference;
  v5 = -[CPLPersonReference init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    v20 = v4;
    v21 = v5;
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(";"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count") == 2)
          {
            objc_msgSend(v14, "objectAtIndex:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "objectAtIndex:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v16, "isEqualToString:", CFSTR("id")))
              objc_storeStrong((id *)&v21->_personIdentifier, v18);
            else
              objc_msgSend(v22, "setValue:forKey:", v18, v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    v6 = v21;
    if (objc_msgSend(v22, "count"))
      objc_storeStrong((id *)&v21->_extraProperties, v22);

    v4 = v20;
  }

  return v6;
}

- (id)serializedString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@%@%@"), CFSTR("id"), CFSTR("="), self->_personIdentifier);
  if (-[NSDictionary count](self->_extraProperties, "count"))
  {
    -[NSDictionary allKeys](self->_extraProperties, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_extraProperties, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@%@%@%@"), CFSTR(";"), v11, CFSTR("="), v12, (_QWORD)v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CPLPersonReference *v4;
  CPLPersonReference *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (CPLPersonReference *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_personIdentifier;
      -[CPLPersonReference personIdentifier](v5, "personIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (unint64_t)v7;
      if (v6 && v7)
      {
        v9 = objc_msgSend((id)v6, "isEqual:", v7);

        if ((v9 & 1) == 0)
        {
LABEL_6:
          v10 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

        if (v6 | v8)
          goto LABEL_6;
      }
      v11 = self->_extraProperties;
      -[CPLPersonReference extraProperties](v5, "extraProperties");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v10 = v11 && v12 && (objc_msgSend((id)v11, "isEqual:", v12) & 1) != 0 || (v11 | v13) == 0;

      goto LABEL_16;
    }
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_personIdentifier, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Identifier: %@ Extra properties: %@"), self->_personIdentifier, self->_extraProperties);
}

- (NSDictionary)extraProperties
{
  return self->_extraProperties;
}

- (void)setExtraProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_extraProperties, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CPLPersonReference personIdentifier](self, "personIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("personIdentifier"));
  -[CPLPersonReference extraProperties](self, "extraProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("extraProperties"));

  }
}

- (CPLPersonReference)initWithCoder:(id)a3
{
  id v4;
  CPLPersonReference *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLPersonReference;
  v5 = -[CPLPersonReference init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLPersonReference setPersonIdentifier:](v5, "setPersonIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[CPLPersonReference setExtraProperties:](v5, "setExtraProperties:", v8);

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[CPLPersonReference personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonIdentifier:", v5);

  -[CPLPersonReference extraProperties](self, "extraProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtraProperties:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CPLPersonReference personIdentifier](self, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "_encodeKey:", CFSTR("personIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v7);

  }
  -[CPLPersonReference extraProperties](self, "extraProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "_encodeKey:", CFSTR("extraProperties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v9);

  }
  return v5;
}

- (CPLPersonReference)initWithCPLArchiver:(id)a3
{
  _QWORD *v5;
  CPLPersonReference *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_opt_class();
        v12 = v5[2];
        *(_DWORD *)buf = 138412546;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        v13 = v11;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Incorrect string for CPLPersonReference. Found %@: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1322, CFSTR("Incorrect string for CPLPersonReference. Found %@: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  v16.receiver = self;
  v16.super_class = (Class)CPLPersonReference;
  v6 = -[CPLPersonReference init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "_decodeKey:class:inDictionary:", CFSTR("personIdentifier"), objc_opt_class(), v5[2]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_decodeKey:class:inDictionary:", CFSTR("extraProperties"), objc_opt_class(), v5[2]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLPersonReference setPersonIdentifier:](v6, "setPersonIdentifier:", v7);
    -[CPLPersonReference setExtraProperties:](v6, "setExtraProperties:", v8);

  }
  return v6;
}

@end
