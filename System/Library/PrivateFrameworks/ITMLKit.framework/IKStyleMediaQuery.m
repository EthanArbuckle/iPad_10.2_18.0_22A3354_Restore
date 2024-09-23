@implementation IKStyleMediaQuery

+ (id)mediaQueryListWithCSSMediaQuery:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  IKStyleMediaQuery *v18;
  void *v19;
  IKStyleMediaQuery *v20;
  id v21;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  objc_msgSend(v3, "queryList");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subQueryList");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v36;
    v27 = v4;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v5);
        v30 = v5;
        objc_msgSend(v29, "expressionList");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "valueAsString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v15, "isEqualToString:", &stru_1E9F50578) & 1) == 0)
              {
                v16 = v15;

                v14 = v16;
              }
              objc_msgSend(v13, "key");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v14, v17);

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v10);
        }

        v18 = [IKStyleMediaQuery alloc];
        objc_msgSend(v29, "type");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[IKStyleMediaQuery initWithMediaType:featureValues:isNegated:](v18, "initWithMediaType:featureValues:isNegated:", v19, v7, objc_msgSend(v29, "negated"));

        v4 = v27;
        objc_msgSend(v27, "addObject:", v20);

        v5 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v28);
  }
  if (objc_msgSend(v4, "count"))
    v21 = v4;
  else
    v21 = 0;

  return v21;
}

- (IKStyleMediaQuery)initWithMediaType:(id)a3 featureValues:(id)a4 isNegated:(BOOL)a5
{
  id v9;
  id v10;
  IKStyleMediaQuery *v11;
  IKStyleMediaQuery *v12;
  uint64_t v13;
  NSDictionary *featureValues;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IKStyleMediaQuery;
  v11 = -[IKStyleMediaQuery init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isNegated = a5;
    objc_storeStrong((id *)&v11->_mediaType, a3);
    v13 = objc_msgSend(v10, "copy");
    featureValues = v12->_featureValues;
    v12->_featureValues = (NSDictionary *)v13;

  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKStyleMediaQuery identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IKStyleMediaQuery identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  NSString *identifier;
  void *v4;
  void *v5;
  NSDictionary *featureValues;
  id v7;
  NSString *v8;
  NSString *v9;
  _QWORD v11[4];
  id v12;

  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_isNegated)
      objc_msgSend(v4, "appendString:", CFSTR("not "));
    objc_msgSend(v5, "appendString:", self->_mediaType);
    featureValues = self->_featureValues;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __31__IKStyleMediaQuery_identifier__block_invoke;
    v11[3] = &unk_1E9F4CBA0;
    v12 = v5;
    v7 = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](featureValues, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    v9 = self->_identifier;
    self->_identifier = v8;

    identifier = self->_identifier;
  }
  return identifier;
}

void __31__IKStyleMediaQuery_identifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "appendString:", CFSTR(" and "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("("));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(": "));
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(")"));

}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (BOOL)isNegated
{
  return self->_isNegated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
