@implementation MLDictionaryFeatureProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFeatureNames, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (MLDictionaryFeatureProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error
{
  NSDictionary *v6;
  MLDictionaryFeatureProvider *v7;
  MLDictionaryFeatureProvider *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *cachedFeatureNames;
  MLDictionaryFeatureProvider *v25;
  NSDictionary *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = dictionary;
  v31.receiver = self;
  v31.super_class = (Class)MLDictionaryFeatureProvider;
  v7 = -[MLDictionaryFeatureProvider init](&v31, sel_init);
  v8 = v7;
  if (v7)
  {
    v25 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSDictionary count](v6, "count"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v6;
    v10 = v6;
    v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v15);
          else
            +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", +[MLFeatureTypeUtils featureTypeForObject:](MLFeatureTypeUtils, "featureTypeForObject:", v16), v16, error);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v15);

        }
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v12);
    }

    v8 = v25;
    v18 = v25->_dictionary;
    v25->_dictionary = v9;
    v19 = v9;

    v20 = (void *)MEMORY[0x1E0C99E60];
    -[NSDictionary allKeys](v19, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    cachedFeatureNames = v25->_cachedFeatureNames;
    v25->_cachedFeatureNames = (NSSet *)v22;

    v6 = v26;
  }

  return v8;
}

- (MLDictionaryFeatureProvider)initWithFeatureValueDictionary:(id)a3
{
  id v5;
  MLDictionaryFeatureProvider *v6;
  MLDictionaryFeatureProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *cachedFeatureNames;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLDictionaryFeatureProvider;
  v6 = -[MLDictionaryFeatureProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[NSDictionary allKeys](v7->_dictionary, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    cachedFeatureNames = v7->_cachedFeatureNames;
    v7->_cachedFeatureNames = (NSSet *)v10;

  }
  return v7;
}

- (id)featureValueForName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
}

- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3
{
  id v4;
  void *v5;
  MLDictionaryFeatureProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "featureNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLDictionaryFeatureProvider initWithFeatureProvider:featureNames:](self, "initWithFeatureProvider:featureNames:", v4, v5);

  return v6;
}

- (MLDictionaryFeatureProvider)initWithFeatureProvider:(id)a3 featureNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  MLDictionaryFeatureProvider *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "featureValueForName:", v14, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v16 = -[MLDictionaryFeatureProvider initWithDictionary:error:](self, "initWithDictionary:error:", v8, 0);
  return v16;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSSet)cachedFeatureNames
{
  return self->_cachedFeatureNames;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[MLDictionaryFeatureProvider dictionary](self, "dictionary");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        -[MLDictionaryFeatureProvider dictionary](self, "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ = %@\n"), v8, v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSDictionary countByEnumeratingWithState:objects:count:](self->_dictionary, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (MLFeatureValue)objectForKeyedSubscript:(NSString *)featureName
{
  return (MLFeatureValue *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", featureName);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MLDictionaryFeatureProvider dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (MLDictionaryFeatureProvider)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MLDictionaryFeatureProvider *v10;
  uint64_t v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v10 = -[MLDictionaryFeatureProvider initWithDictionary:error:](self, "initWithDictionary:error:", v9, &v12);

  return v10;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
