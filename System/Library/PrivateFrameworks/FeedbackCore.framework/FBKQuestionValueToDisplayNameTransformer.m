@implementation FBKQuestionValueToDisplayNameTransformer

- (FBKQuestionValueToDisplayNameTransformer)initWithDictionary:(id)a3
{
  id v4;
  FBKQuestionValueToDisplayNameTransformer *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionValueToDisplayNameTransformer;
  v5 = -[FBKQuestionValueToDisplayNameTransformer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

  }
  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[FBKQuestionValueToDisplayNameTransformer dictionary](self, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v11 = v5;
    }
    else
    {
      v11 = (__CFString *)v4;
      if (!v11)
        goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v11 != v13)
      goto LABEL_17;
LABEL_16:

    v11 = &stru_24E15EAF8;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v4;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        -[FBKQuestionValueToDisplayNameTransformer transformedValue:](self, "transformedValue:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v11;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
