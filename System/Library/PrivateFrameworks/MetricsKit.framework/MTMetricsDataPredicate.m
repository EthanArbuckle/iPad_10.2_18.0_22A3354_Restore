@implementation MTMetricsDataPredicate

+ (id)predicateWithType:(id)a3 argument:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("valueMatches")))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self in %@"), v6);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("nonEmpty")))
  {
    if (objc_msgSend(v6, "BOOLValue"))
      v7 = CFSTR("self != nil && self != ''");
    else
      v7 = CFSTR("self == nil || self == ''");
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v7, v10);
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (id)predicateWithConfigData:(id)a3
{
  id v3;
  MTMetricsDataPredicate *v4;
  MTMetricsDataPredicate *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[MTMetricsDataPredicate initWithConfigDictionary:]([MTMetricsDataPredicate alloc], "initWithConfigDictionary:", v3);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = -[MTMetricsDataPredicate initWithFormat:]([MTMetricsDataPredicate alloc], "initWithFormat:", v3);
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (MTMetricsDataPredicate)initWithFormat:(id)a3
{
  id v4;
  MTMetricsDataPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTMetricsDataPredicate;
  v5 = -[MTMetricsDataPredicate init](&v10, sel_init);
  if (v5)
  {
    v12 = CFSTR("_");
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMetricsDataPredicate setFieldPredicates:](v5, "setFieldPredicates:", v8);

  }
  return v5;
}

- (MTMetricsDataPredicate)initWithConfigDictionary:(id)a3
{
  id v4;
  MTMetricsDataPredicate *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTMetricsDataPredicate;
  v5 = -[MTMetricsDataPredicate init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke;
    v10[3] = &unk_24C79FEF8;
    v11 = v6;
    v7 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
    v8 = (void *)objc_msgSend(v7, "copy");
    -[MTMetricsDataPredicate setFieldPredicates:](v5, "setFieldPredicates:", v8);

  }
  return v5;
}

void __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDBCEB8];
    v8 = v6;
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke_2;
    v13[3] = &unk_24C79FEF8;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

    v11 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  if (objc_msgSend(v11, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v5);

}

void __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  +[MTMetricsDataPredicate predicateWithType:argument:](MTMetricsDataPredicate, "predicateWithType:argument:", a2, a3);
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
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  -[MTMetricsDataPredicate fieldPredicates](self, "fieldPredicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__MTMetricsDataPredicate_evaluateWithMetricsData___block_invoke;
  v8[3] = &unk_24C79FF20;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __50__MTMetricsDataPredicate_evaluateWithMetricsData___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("_")))
  {
    v9 = *(id *)(a1 + 32);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "evaluateWithObject:", v10, (_QWORD)v19);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v17 + 24))
          v18 = v16;
        else
          v18 = 0;
        *(_BYTE *)(v17 + 24) = v18;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          *a4 = 1;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

}

- (NSDictionary)fieldPredicates
{
  return self->_fieldPredicates;
}

- (void)setFieldPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_fieldPredicates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldPredicates, 0);
}

@end
