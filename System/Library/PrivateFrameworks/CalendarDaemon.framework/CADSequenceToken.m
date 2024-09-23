@implementation CADSequenceToken

- (CADSequenceToken)initWithMainDBSequence:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  CADSequenceToken *v8;
  void *v10;
  _QWORD v11[2];

  v3 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CADSequenceToken initWithAllDBSequenceMap:](self, "initWithAllDBSequenceMap:", v7);

  return v8;
}

- (CADSequenceToken)initWithAllDBSequenceMap:(id)a3
{
  id v5;
  CADSequenceToken *v6;
  CADSequenceToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSequenceToken;
  v6 = -[CADSequenceToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_allDBSequenceMap, a3);

  return v7;
}

- (CADSequenceToken)initWithSerializedSequenceString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CADSequenceToken *v23;
  void *v25;
  CADSequenceToken *v26;
  id v27;
  void *v28;

  v4 = a3;
  if ((objc_msgSend(v4, "containsString:", CFSTR("|")) & 1) != 0)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v26 = self;
      v27 = v4;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v5;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v8, "count");
      v28 = v10;
      v12 = objc_msgSend(v10, "count");
      if (v11 >= v12)
        v13 = v12;
      else
        v13 = v11;
      if (v13)
      {
        for (i = 0; i != v13; ++i)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isEqual:", &stru_1E6A39768) & 1) == 0)
          {
            v16 = v6;
            v17 = objc_msgSend(v15, "intValue");
            objc_msgSend(v28, "objectAtIndexedSubscript:", i);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "intValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v17;
            v6 = v16;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v22);

          }
        }
      }

      self = v26;
      v4 = v27;
      v5 = v25;
    }
    v23 = -[CADSequenceToken initWithAllDBSequenceMap:](self, "initWithAllDBSequenceMap:", v6);

  }
  else
  {
    v23 = -[CADSequenceToken initWithMainDBSequence:](self, "initWithMainDBSequence:", objc_msgSend(v4, "intValue"));
  }

  return v23;
}

- (int)mainDBSequence
{
  NSDictionary *allDBSequenceMap;
  void *v3;
  void *v4;

  allDBSequenceMap = self->_allDBSequenceMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0D0BE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](allDBSequenceMap, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "intValue");
  return (int)v3;
}

- (int)sequenceForDatabaseID:(int)a3
{
  NSDictionary *allDBSequenceMap;
  void *v4;
  void *v5;
  int v6;

  allDBSequenceMap = self->_allDBSequenceMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](allDBSequenceMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "intValue");
  else
    v6 = -1;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_allDBSequenceMap, CFSTR("kAllDBSequenceMapKey"));
}

- (CADSequenceToken)initWithCoder:(id)a3
{
  id v4;
  CADSequenceToken *v5;
  uint64_t v6;
  NSDictionary *allDBSequenceMap;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADSequenceToken;
  v5 = -[CADSequenceToken init](&v9, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_19);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder____whitelistedClasses, CFSTR("kAllDBSequenceMapKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    allDBSequenceMap = v5->_allDBSequenceMap;
    v5->_allDBSequenceMap = (NSDictionary *)v6;

  }
  return v5;
}

void __34__CADSequenceToken_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)initWithCoder____whitelistedClasses;
  initWithCoder____whitelistedClasses = v2;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CADSequenceToken allDBSequenceMap](self, "allDBSequenceMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allDBSequenceMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (id)serializedSequenceString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CADSequenceToken allDBSequenceMap](self, "allDBSequenceMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("|"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CADSequenceToken allDBSequenceMap](self, "allDBSequenceMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[CADSequenceToken allDBSequenceMap](self, "allDBSequenceMap");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendFormat:", CFSTR("%@,"), v16);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v11);
  }

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  CADSequenceToken *v6;

  v6 = self;
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CADSequenceToken serializedSequenceString](self, "serializedSequenceString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<CADSequenceToken: %p> {%@}"), &v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)allDBSequenceMap
{
  return self->_allDBSequenceMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDBSequenceMap, 0);
}

@end
