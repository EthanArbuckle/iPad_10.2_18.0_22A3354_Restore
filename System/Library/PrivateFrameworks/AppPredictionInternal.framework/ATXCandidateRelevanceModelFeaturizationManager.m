@implementation ATXCandidateRelevanceModelFeaturizationManager

- (ATXCandidateRelevanceModelFeaturizationManager)initWithFeaturizers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  ATXCandidateRelevanceModelFeaturizationManager *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "immutableCopy", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[ATXCandidateRelevanceModelFeaturizationManager initWithImmutableFeaturizers:](self, "initWithImmutableFeaturizers:", v5);
  return v12;
}

- (ATXCandidateRelevanceModelFeaturizationManager)initWithImmutableFeaturizers:(id)a3
{
  id v5;
  ATXCandidateRelevanceModelFeaturizationManager *v6;
  ATXCandidateRelevanceModelFeaturizationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelFeaturizationManager;
  v6 = -[ATXCandidateRelevanceModelFeaturizationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featurizers, a3);

  return v7;
}

- (id)featureNames
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ATXCandidateRelevanceModelFeaturizationManager featurizers](self, "featurizers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = v4;
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v5, "featureValueNames");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v22;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
              v12 = (void *)MEMORY[0x1E0CB3940];
              v13 = (objc_class *)objc_opt_class();
              NSStringFromClass(v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%@)"), v14, v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3, "addObject:", v15);
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v8);
        }

        v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)numberOfInputDimensions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ATXCandidateRelevanceModelFeaturizationManager featurizers](self, "featurizers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "dimensions");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)featuresForContext:(id)a3 candidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ATXCandidateRelevanceModelFeaturizationManager featurizers](self, "featurizers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "featureVectorForContext:candidate:", v6, v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)labelsFromDataPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "engaged", (_QWORD)v12));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidateRelevanceModelFeaturizationManager *v4;
  ATXCandidateRelevanceModelFeaturizationManager *v5;
  BOOL v6;

  v4 = (ATXCandidateRelevanceModelFeaturizationManager *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidateRelevanceModelFeaturizationManager isEqualToATXCandidateRelevanceModelFeaturizationManager:](self, "isEqualToATXCandidateRelevanceModelFeaturizationManager:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelFeaturizationManager:(id)a3
{
  id *v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (id *)a3;
  v5 = -[ATXCandidateRelevanceModelFeaturizationManager numberOfInputDimensions](self, "numberOfInputDimensions");
  if (v5 == objc_msgSend(v4, "numberOfInputDimensions")
    && (v6 = -[NSArray count](self->_featurizers, "count"), v6 == objc_msgSend(v4[1], "count")))
  {
    if (-[NSArray count](self->_featurizers, "count"))
    {
      v7 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_featurizers, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4[1], "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if ((v10 & 1) == 0)
          break;
        ++v7;
      }
      while (-[NSArray count](self->_featurizers, "count") > v7);
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_featurizers, CFSTR("featurizationManagerFeaturizers"));
}

- (ATXCandidateRelevanceModelFeaturizationManager)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXCandidateRelevanceModelFeaturizationManager *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_relevance_model();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("featurizationManagerFeaturizers"), v5, 1, CFSTR("com.apple.duetexpertd.ATXCandidateRelevanceModelFeaturizationManager"), -1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[ATXCandidateRelevanceModelFeaturizationManager initWithImmutableFeaturizers:](self, "initWithImmutableFeaturizers:", v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)featurizers
{
  return self->_featurizers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurizers, 0);
}

+ (id)denseLabelVectorFromDataPoints:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "labelsFromDataPoints:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81020]), "initWithNumbers:", v3);

  return v4;
}

- (id)sparseFeatureVectorForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[ATXCandidateRelevanceModelFeaturizationManager featuresForContext:candidate:](self, "featuresForContext:candidate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81020]), "initWithNumbers:", v4);
  objc_msgSend(MEMORY[0x1E0D81070], "sparseVectorFromDense:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sparseFeatureMatrixFromDataPoints:(id)a3
{
  sparse_dimension v4;
  sparse_dimension v5;
  sparse_m_float *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  sparse_dimension v21;
  ATXCandidateRelevanceModelFeaturizationManager *v22;
  id v23;
  void *context;

  v23 = a3;
  v4 = objc_msgSend(v23, "count");
  v22 = self;
  v5 = -[ATXCandidateRelevanceModelFeaturizationManager numberOfInputDimensions](self, "numberOfInputDimensions");
  v6 = sparse_matrix_create_float(v4, v5);
  v21 = v4;
  if (v4)
  {
    for (i = 0; i != v21; ++i)
    {
      context = (void *)MEMORY[0x1CAA48B6C]();
      objc_msgSend(v23, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "candidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCandidateRelevanceModelFeaturizationManager featuresForContext:candidate:](v22, "featuresForContext:candidate:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count") == v5)
      {
        if (v5)
          goto LABEL_5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v22, CFSTR("ATXCandidateRelevanceModelFeaturizationManager.m"), 144, CFSTR("Invalid shape, all rows must be the same length (row %lu length: %lu, first row length: %lu)"), i, objc_msgSend(v11, "count"), v5);

        if (v5)
        {
LABEL_5:
          v12 = 0;
          for (j = 0; j != v5; ++j)
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", j);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;

            if (v16 != 0.0)
              sparse_insert_entry_float(v6, v16, (int)i, v12 >> 32);
            v12 += 0x100000000;
          }
        }
      }

      objc_autoreleasePoolPop(context);
    }
  }
  sparse_commit(v6);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81068]), "initWithSparseMatrix:", v6);

  return v18;
}

@end
