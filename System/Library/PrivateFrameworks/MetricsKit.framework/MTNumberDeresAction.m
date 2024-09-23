@implementation MTNumberDeresAction

- (MTNumberDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6;
  MTNumberDeresAction *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTNumberDeresAction;
  v7 = -[MTTreatmentAction initWithField:configDictionary:](&v23, sel_initWithField_configDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("precision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "doubleValue");
      -[MTNumberDeresAction setPrecision:](v7, "setPrecision:");
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buckets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v9 = v10;
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("start"), (_QWORD)v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
                continue;
            }

            v9 = 0;
            goto LABEL_16;
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v12)
            continue;
          break;
        }
        v9 = v10;
      }
LABEL_16:

      objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTNumberDeresAction setBuckets:](v7, "setBuckets:", v17);

    }
  }

  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)MTNumberDeresAction;
  -[MTTreatmentAction performAction:context:](&v20, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MTNumberDeresAction buckets](self, "buckets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
      goto LABEL_12;
    v21 = CFSTR("start");
    v22[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v6, "count"), 1536, &__block_literal_global_6);

    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("start"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v12;

      v5 = v14;
    }
    v13 = 0;
    if (v8)
    {
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_12:
        if (self->_precision == 0.0)
        {
          v18 = v5;
          v5 = v18;
        }
        else
        {
          objc_msgSend(v5, "doubleValue");
          v16 = v15;
          -[MTNumberDeresAction precision](self, "precision");
          if (v17 > 0.0)
            v16 = v17 * floor(v16 / v17);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v18;
      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)precision
{
  return self->_precision;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (NSArray)buckets
{
  return self->_buckets;
}

- (void)setBuckets:(id)a3
{
  objc_storeStrong((id *)&self->_buckets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
}

@end
