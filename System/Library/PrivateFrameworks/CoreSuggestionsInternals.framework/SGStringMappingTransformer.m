@implementation SGStringMappingTransformer

- (id)withHelperMappingType:(id)a3 andLanguage:(id)a4
{
  id v5;
  id v6;
  SGStringMappingTransformer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SGStringMappingTransformer initWithHelperMappingType:andLanguage:]([SGStringMappingTransformer alloc], "initWithHelperMappingType:andLanguage:", v6, v5);

  return v7;
}

- (SGStringMappingTransformer)initWithMappings:(id)a3
{
  id v4;
  SGStringMappingTransformer *v5;
  SGStringMappingTransformer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGStringMappingTransformer;
  v5 = -[SGStringMappingTransformer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SGStringMappingTransformer setMappings:](v5, "setMappings:", v4);

  return v6;
}

- (SGStringMappingTransformer)initWithHelperMappingType:(id)a3 andLanguage:(id)a4
{
  id v6;
  id v7;
  SGStringMappingTransformer *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SGStringMappingTransformer;
  v8 = -[SGStringMappingTransformer init](&v11, sel_init);
  if (v8)
  {
    +[SGModelMappingHelper mappingsForType:andLanguage:](SGModelMappingHelper, "mappingsForType:andLanguage:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGStringMappingTransformer setMappings:](v8, "setMappings:", v9);

  }
  return v8;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGStringMappingTransformer transform:]", "SGStringMappingTransformer.m", 59, "[input isKindOfClass:[NSArray class]]");
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SGStringMappingTransformer mappings](self, "mappings", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v13;
        else
          v14 = v11;
        objc_msgSend(v5, "addObject:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)toPlistWithChunks:(id)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("MAPPINGS");
  -[SGStringMappingTransformer mappings](self, "mappings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SGStringMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SGStringMappingTransformer *v12;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAPPING_TYPE"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAPPING_LANGUAGE")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAPPING_TYPE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAPPING_LANGUAGE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGStringMappingTransformer initWithHelperMappingType:andLanguage:](self, "initWithHelperMappingType:andLanguage:", v10, v11);

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MAPPINGS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SGStringMappingTransformer initWithMappings:](self, "initWithMappings:", v10);
  }

  return v12;
}

- (BOOL)isEqualToStringMappingTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[SGStringMappingTransformer mappings](self, "mappings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mappings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[SGStringMappingTransformer mappings](self, "mappings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mappings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGStringMappingTransformer *v4;
  SGStringMappingTransformer *v5;
  BOOL v6;

  v4 = (SGStringMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStringMappingTransformer isEqualToStringMappingTransformer:](self, "isEqualToStringMappingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SGStringMappingTransformer mappings](self, "mappings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSDictionary)mappings
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMappings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappings, 0);
}

+ (id)withMappings:(id)a3
{
  id v3;
  SGStringMappingTransformer *v4;

  v3 = a3;
  v4 = -[SGStringMappingTransformer initWithMappings:]([SGStringMappingTransformer alloc], "initWithMappings:", v3);

  return v4;
}

@end
