@implementation _ATXCoreAnalyticsDimensionSet

- (id)coreAnalyticsDictionary
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)powerset
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dictionaryKeys
{
  void *v2;
  void *v3;
  void *v4;

  -[_ATXCoreAnalyticsDimensionSet coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_120);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_ATXCoreAnalyticsDimensionSet _dictionaryKeys](self, "_dictionaryKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXCoreAnalyticsDimensionSet coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v11, "hash") - v8 + 32 * v8;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _ATXCoreAnalyticsDimensionSet *v4;
  _ATXCoreAnalyticsDimensionSet *v5;
  _ATXCoreAnalyticsDimensionSet *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_ATXCoreAnalyticsDimensionSet *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_ATXCoreAnalyticsDimensionSet coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXCoreAnalyticsDimensionSet coreAnalyticsDictionary](v6, "coreAnalyticsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_ATXCoreAnalyticsDimensionSet init](+[_ATXCoreAnalyticsDimensionSet allocWithZone:](_ATXCoreAnalyticsDimensionSet, "allocWithZone:", a3), "init");
}

@end
