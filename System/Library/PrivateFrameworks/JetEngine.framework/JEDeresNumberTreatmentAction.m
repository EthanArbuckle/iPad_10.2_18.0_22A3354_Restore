@implementation JEDeresNumberTreatmentAction

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  id v6;
  NSArray *buckets;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  objc_super v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)JEDeresNumberTreatmentAction;
  -[JETreatmentAction performAction:context:](&v22, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
    goto LABEL_21;
  if (self)
    buckets = self->_buckets;
  else
    buckets = 0;
  if (!-[NSArray count](buckets, "count"))
  {
    if (self && self->_precision > 0.0)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_precision * floor(v20 / self->_precision));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_21:
    v14 = 0;
    goto LABEL_24;
  }
  if (self)
    v8 = self->_buckets;
  else
    v8 = 0;
  v9 = v8;
  v23 = CFSTR("start");
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v11 = self->_buckets;
  else
    v11 = 0;
  v12 = v11;
  v13 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, -[NSArray count](v12, "count"), 1536, &__block_literal_global_1);

  v14 = 0;
  if (v13 && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self)
      v15 = self->_buckets;
    else
      v15 = 0;
    -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", v13 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("value"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("start"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v19;

  }
LABEL_24:

  return v14;
}

- (JEDeresNumberTreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6;
  JEDeresNumberTreatmentAction *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *buckets;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)JEDeresNumberTreatmentAction;
  v7 = -[JETreatmentAction initWithField:configuration:](&v28, sel_initWithField_configuration_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("precision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v9, "doubleValue");
    v7->_precision = v10;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buckets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    v15 = v13;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("start"), (_QWORD)v24);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              continue;
          }

          v15 = 0;
          goto LABEL_19;
        }
        v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v16)
          continue;
        break;
      }
      v15 = v13;
    }
LABEL_19:

    objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v21 = objc_claimAutoreleasedReturnValue();
    buckets = v7->_buckets;
    v7->_buckets = (NSArray *)v21;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
}

@end
