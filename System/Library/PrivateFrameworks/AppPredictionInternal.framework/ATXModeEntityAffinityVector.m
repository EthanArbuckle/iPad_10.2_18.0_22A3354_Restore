@implementation ATXModeEntityAffinityVector

- (ATXModeEntityAffinityVector)init
{
  return -[ATXModeEntityAffinityVector initWithAffinities:](self, "initWithAffinities:", MEMORY[0x1E0C9AA70]);
}

- (id)_initWithAffinityVector:(id)a3
{
  id v5;
  ATXModeEntityAffinityVector *v6;
  ATXModeEntityAffinityVector *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeEntityAffinityVector;
  v6 = -[ATXModeEntityAffinityVector init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_affinityVector, a3);

  return v7;
}

- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3 shouldResize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ATXModeEntityAffinityVector *v7;
  int v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  NSArray *affinityVector;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ATXModeEntityAffinityVector;
  v7 = -[ATXModeEntityAffinityVector init](&v25, sel_init);
  if (v7)
  {
    v8 = 16;
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 16);
    do
    {
      -[NSArray addObject:](v9, "addObject:", &unk_1E83CDD50);
      --v8;
    }
    while (v8);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = ATXStringToMode();
          if (v16 <= 0xF)
          {
            v17 = v16;
            objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v21);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", v18, v17);

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    affinityVector = v7->_affinityVector;
    v7->_affinityVector = v9;

    if (v4)
      -[ATXModeEntityAffinityVector resizeToUnit](v7, "resizeToUnit");
  }

  return v7;
}

- (ATXModeEntityAffinityVector)initWithAffinities:(id)a3
{
  return -[ATXModeEntityAffinityVector initWithAffinities:shouldResize:](self, "initWithAffinities:shouldResize:", a3, 0);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[NSArray _pas_mappedArrayWithTransform:](self->_affinityVector, "_pas_mappedArrayWithTransform:", &__block_literal_global_201);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __42__ATXModeEntityAffinityVector_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (id)prettyDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXModeEntityAffinityVector sortedAffinities](self, "sortedAffinities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_7_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__ATXModeEntityAffinityVector_prettyDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %f"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sortedAffinities
{
  void *v2;
  void *v3;

  -[NSArray _pas_mappedArrayWithIndexedTransform:](self->_affinityVector, "_pas_mappedArrayWithIndexedTransform:", &__block_literal_global_11_3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_14_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __47__ATXModeEntityAffinityVector_sortedAffinities__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "doubleValue");
  if (v3 >= 0.0001)
  {
    v5 = (void *)MEMORY[0x1E0D81638];
    ATXModeToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tupleWithFirst:second:", v2, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __47__ATXModeEntityAffinityVector_sortedAffinities__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (double)scoreForMode:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  if (a3 > 0xF)
    return 0.0;
  -[NSArray objectAtIndexedSubscript:](self->_affinityVector, "objectAtIndexedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)magnitude
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_affinityVector;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "doubleValue", (_QWORD)v10);
        v6 = v6 + v8 * v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  result = fabs(sqrt(v6));
  if (v6 == -INFINITY)
    return INFINITY;
  return result;
}

- (BOOL)isZeroVector
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  double v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_affinityVector;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "doubleValue", (_QWORD)v10);
        if (v7 < 0.0)
          v7 = -v7;
        if (v7 > 0.0001)
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (void)resizeToUnit
{
  NSArray *affinityVector;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  _QWORD v7[5];

  if (!-[ATXModeEntityAffinityVector isZeroVector](self, "isZeroVector"))
  {
    -[ATXModeEntityAffinityVector magnitude](self, "magnitude");
    affinityVector = self->_affinityVector;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__ATXModeEntityAffinityVector_resizeToUnit__block_invoke;
    v7[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    v7[4] = v4;
    -[NSArray _pas_mappedArrayWithTransform:](affinityVector, "_pas_mappedArrayWithTransform:", v7);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_affinityVector;
    self->_affinityVector = v5;

  }
}

uint64_t __43__ATXModeEntityAffinityVector_resizeToUnit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "numberWithDouble:", v4 / *(double *)(a1 + 32));
}

+ (id)centroid:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_18_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "weightedCentroid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __40__ATXModeEntityAffinityVector_centroid___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", a2, &unk_1E83CDD68);
}

+ (id)weightedCentroid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t k;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_class *v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "first");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "affinityVector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    if (v8)
    {
      v10 = v8;
      do
      {
        objc_msgSend(v9, "addObject:", &unk_1E83CDD50);
        --v10;
      }
      while (v10);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v12)
    {
      v13 = v12;
      v39 = (objc_class *)a1;
      v40 = v4;
      v14 = *(_QWORD *)v43;
      v15 = 0.0;
      obj = v11;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v17, "first");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "affinityVector");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "second");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "doubleValue");
          v22 = v21;

          if (v8)
          {
            for (j = 0; j != v8; ++j)
            {
              objc_msgSend(v19, "objectAtIndexedSubscript:", j);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "doubleValue");
              v26 = v22 * v25;

              v27 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v9, "objectAtIndexedSubscript:", j);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "doubleValue");
              objc_msgSend(v27, "numberWithDouble:", v26 + v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:atIndexedSubscript:", v30, j);

            }
          }
          v15 = v15 + v22;

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v13);

      v4 = v40;
      if (v15 >= 0.0001)
      {
        if (v8)
        {
          for (k = 0; k != v8; ++k)
          {
            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v9, "objectAtIndexedSubscript:", k);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            objc_msgSend(v32, "numberWithDouble:", v34 / v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:atIndexedSubscript:", v35, k);

          }
        }
        v36 = objc_msgSend([v39 alloc], "_initWithAffinityVector:", v9);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v36 = objc_opt_new();
LABEL_23:
    v37 = (void *)v36;

    goto LABEL_24;
  }
  v37 = (void *)objc_opt_new();
LABEL_24:

  return v37;
}

- (NSArray)affinityVector
{
  return self->_affinityVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affinityVector, 0);
}

@end
