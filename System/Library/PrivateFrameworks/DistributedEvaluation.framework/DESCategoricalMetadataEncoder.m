@implementation DESCategoricalMetadataEncoder

- (DESCategoricalMetadataEncoder)initWithSingleSchema:(id)a3
{
  id v5;
  DESCategoricalMetadataEncoder *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  DESCategoricalMetadataEncoder *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DESCategoricalMetadataEncoder;
  v6 = -[DESCategoricalMetadataEncoder init](&v16, sel_init);
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("range"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v8 = (void *)v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("range"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
    goto LABEL_10;
  objc_storeStrong((id *)&v6->_schemaDict, a3);
  -[NSDictionary objectForKeyedSubscript:](v6->_schemaDict, "objectForKeyedSubscript:", CFSTR("range"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_useRange = objc_msgSend(v13, "BOOLValue");

LABEL_7:
  v14 = v6;
LABEL_11:

  return v14;
}

- (id)encodeString:(id)a3 toLength:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v13;

  v6 = (void *)MEMORY[0x1E0C99DF0];
  v7 = a3;
  objc_msgSend(v6, "dataWithLength:", a4);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "mutableBytes");
  -[NSDictionary objectForKeyedSubscript:](self->_schemaDict, "objectForKeyedSubscript:", CFSTR("items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DESCategoricalMetadataEncoder findBucketIndexOfString:inItems:](self, "findBucketIndexOfString:inItems:", v7, v10);

  if (v11 >= a4 - 1 || v11 == 0x7FFFFFFFFFFFFFFFLL)
    v13 = 0;
  else
    v13 = v11 + 1;
  *(_BYTE *)(v9 + v13) = 1;

  return v8;
}

- (id)encodeNumber:(id)a3 toLength:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "mutableBytes");
  -[NSDictionary objectForKeyedSubscript:](self->_schemaDict, "objectForKeyedSubscript:", CFSTR("items"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12++), "floatValue", (_QWORD)v17);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "floatValue");
  if ((v10 & 1) == 0)
  {
    v13 = -[DESCategoricalMetadataEncoder findBucketIndexOfNumber:inItems:](self, "findBucketIndexOfNumber:inItems:", v6, v9);
    if (v13 >= a4 - 1 || v13 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = 0;
    else
      v15 = v13 + 1;
    *(_BYTE *)(v8 + v15) = 1;
  }

  return v7;
}

- (id)encodeStringVector:(id)a3 toLength:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v19, "mutableBytes");
  -[NSDictionary objectForKeyedSubscript:](self->_schemaDict, "objectForKeyedSubscript:", CFSTR("items"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = a4 - 1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = -[DESCategoricalMetadataEncoder findBucketIndexOfString:inItems:](self, "findBucketIndexOfString:inItems:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14), v8);
        if (v15 >= v13 || v15 == 0x7FFFFFFFFFFFFFFFLL)
          v17 = 0;
        else
          v17 = v15 + 1;
        *(_BYTE *)(v7 + v17) = 1;
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v19;
}

- (id)encodeNumberVector:(id)a3 toLength:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t j;
  void *v19;
  unint64_t v20;
  unint64_t v22;
  id v24;
  uint64_t v25;
  DESCategoricalMetadataEncoder *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v25 = objc_msgSend(v7, "mutableBytes");
  v26 = self;
  -[NSDictionary objectForKeyedSubscript:](self->_schemaDict, "objectForKeyedSubscript:", CFSTR("items"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  v24 = v7;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "floatValue");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    v17 = a4 - 1;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v19, "floatValue");
        v20 = -[DESCategoricalMetadataEncoder findBucketIndexOfNumber:inItems:](v26, "findBucketIndexOfNumber:inItems:", v19, v8);
        if (v20 >= v17 || v20 == 0x7FFFFFFFFFFFFFFFLL)
          v22 = 0;
        else
          v22 = v20 + 1;
        *(_BYTE *)(v25 + v22) = 1;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v15);
  }

  return v24;
}

- (id)zeroWithLength:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", a3);
}

- (unint64_t)findBucketIndexOfString:(id)a3 inItems:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  if (-[DESCategoricalMetadataEncoder useRange](self, "useRange"))
    v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global_2);
  else
    v8 = objc_msgSend(v7, "indexOfObject:", v6);
  v9 = v8;

  return v9;
}

uint64_t __65__DESCategoricalMetadataEncoder_findBucketIndexOfString_inItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (objc_msgSend(a2, "compare:options:", a3, 64) == -1)
    return -1;
  else
    return 0;
}

- (unint64_t)findBucketIndexOfNumber:(id)a3 inItems:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[DESCategoricalMetadataEncoder useRange](self, "useRange"))
  {
    v8 = objc_msgSend(v7, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v7, "count"), 256, &__block_literal_global_3);
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke_2;
    v10[3] = &unk_1E706EB98;
    v11 = v6;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v10);

  }
  return v8;
}

uint64_t __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1)
    return -1;
  else
    return 0;
}

BOOL __65__DESCategoricalMetadataEncoder_findBucketIndexOfNumber_inItems___block_invoke_2(uint64_t a1, void *a2)
{
  float v3;
  float v4;
  float v5;

  objc_msgSend(a2, "floatValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "floatValue");
  return almostEqual(v4, v5);
}

- (BOOL)useRange
{
  return self->_useRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaDict, 0);
}

@end
