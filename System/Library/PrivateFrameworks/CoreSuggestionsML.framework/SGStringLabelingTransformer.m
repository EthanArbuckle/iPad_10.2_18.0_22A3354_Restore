@implementation SGStringLabelingTransformer

- (SGStringLabelingTransformer)initWithLabelStrings:(id)a3
{
  id v5;
  void *v6;
  SGStringLabelingTransformer *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringLabelingTransformer.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labels"));

  }
  +[SGStringLabelingTransformer convertLabelsToMapping:](SGStringLabelingTransformer, "convertLabelsToMapping:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGStringLabelingTransformer initWithLabelMapping:](self, "initWithLabelMapping:", v6);

  return v7;
}

- (SGStringLabelingTransformer)initWithLabelMapping:(id)a3
{
  id v6;
  SGStringLabelingTransformer *v7;
  SGStringLabelingTransformer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGStringLabelingTransformer.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mapping"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGStringLabelingTransformer;
  v7 = -[SGStringLabelingTransformer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_labelMapping, a3);

  return v8;
}

- (id)transform:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[SGStringLabelingTransformer transform:]", "SGStringLabelingTransformer.m", 58, "[input isKindOfClass:[NSString class]]");
  -[NSDictionary objectForKeyedSubscript:](self->_labelMapping, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_24DDCF750;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  return v8;
}

- (id)toPlistWithChunks:(id)a3
{
  NSDictionary *labelMapping;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  labelMapping = self->_labelMapping;
  v5 = CFSTR("LABEL_MAPPING");
  v6[0] = labelMapping;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SGStringLabelingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  void *v6;
  SGStringLabelingTransformer *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LABEL_MAPPING"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SGStringLabelingTransformer initWithLabelMapping:](self, "initWithLabelMapping:", v6);

  return v7;
}

- (BOOL)isEqualToStringLabelingTransformer:(id)a3
{
  _QWORD *v4;
  NSDictionary *v5;
  NSDictionary *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    v5 = self->_labelMapping;
    v6 = v5;
    if (v5 == (NSDictionary *)v4[1])
      v7 = 1;
    else
      v7 = -[NSDictionary isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SGStringLabelingTransformer *v4;
  SGStringLabelingTransformer *v5;
  BOOL v6;

  v4 = (SGStringLabelingTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGStringLabelingTransformer isEqualToStringLabelingTransformer:](self, "isEqualToStringLabelingTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_labelMapping, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMapping, 0);
}

+ (id)withLabelStrings:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabelStrings:", v4);

  return v5;
}

+ (id)convertLabelsToMapping:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v20;
  void *v21;
  void *context;
  unint64_t v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGStringLabelingTransformer.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labels"));

  }
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v21 = v3;
    do
    {
      context = (void *)MEMORY[0x220753E80]();
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v5 + 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v4, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)v14;
              objc_msgSend(v4, "objectForKeyedSubscript:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToNumber:", v7);

              if ((v17 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGStringLabelingTransformer.m"), 34, CFSTR("duplicate label %@"), v13);

              }
            }
            objc_msgSend(v4, "setObject:forKey:", v7, v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v10);
      }

      objc_autoreleasePoolPop(context);
      v3 = v21;
      v5 = v23;
    }
    while (v23 < objc_msgSend(v21, "count"));
  }

  return v4;
}

@end
