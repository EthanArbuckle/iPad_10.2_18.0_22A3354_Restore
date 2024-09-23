@implementation JEMetricsDataPredicate

+ (id)predicateWithConfiguration:(id)a3
{
  id v3;
  JEMetricsDataPredicate *v4;
  JEMetricsDataPredicate *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[JEMetricsDataPredicate initWithConfigDictionary:]([JEMetricsDataPredicate alloc], "initWithConfigDictionary:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = -[JEMetricsDataPredicate initWithFormat:]([JEMetricsDataPredicate alloc], "initWithFormat:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)predicateWithType:(id)a3 argument:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("valueMatches")))
  {
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("nonEmpty"))
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v6, "BOOLValue"))
      v9 = CFSTR("self != nil && self != ''");
    else
      v9 = CFSTR("self == nil || self == ''");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (JEMetricsDataPredicate)initWithFormat:(id)a3
{
  id v4;
  JEMetricsDataPredicate *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *fieldPredicates;
  objc_super v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JEMetricsDataPredicate;
  v5 = -[JEMetricsDataPredicate init](&v11, sel_init);
  if (v5)
  {
    v13 = CFSTR("_");
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    fieldPredicates = v5->_fieldPredicates;
    v5->_fieldPredicates = (NSDictionary *)v8;

  }
  return v5;
}

- (JEMetricsDataPredicate)initWithConfigDictionary:(id)a3
{
  id v4;
  JEMetricsDataPredicate *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSDictionary *fieldPredicates;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JEMetricsDataPredicate;
  v5 = -[JEMetricsDataPredicate init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke;
    v11[3] = &unk_1E3DDEC90;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = objc_msgSend(v7, "copy");
    fieldPredicates = v5->_fieldPredicates;
    v5->_fieldPredicates = (NSDictionary *)v8;

  }
  return v5;
}

void __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  void *v18;
  id v19;

  v13 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke_2;
    v18 = &unk_1E3DDEC90;
    v19 = v6;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v15);

  }
  v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

  }
  if (objc_msgSend(v6, "count", v13, v15, v16, v17, v18))
  {
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v14);

  }
}

void __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  +[JEMetricsDataPredicate predicateWithType:argument:](JEMetricsDataPredicate, "predicateWithType:argument:", a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v4 = v5;
  }

}

- (BOOL)evaluateWithMetricsData:(id)a3
{
  id v4;
  NSDictionary *fieldPredicates;
  NSDictionary *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  if (self)
    fieldPredicates = self->_fieldPredicates;
  else
    fieldPredicates = 0;
  v6 = fieldPredicates;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__JEMetricsDataPredicate_evaluateWithMetricsData___block_invoke;
  v9[3] = &unk_1E3DDECB8;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

void __50__JEMetricsDataPredicate_evaluateWithMetricsData___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("_")) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_16;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "evaluateWithObject:", v9, (_QWORD)v16) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
          goto LABEL_14;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_14:

LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldPredicates, 0);
}

@end
