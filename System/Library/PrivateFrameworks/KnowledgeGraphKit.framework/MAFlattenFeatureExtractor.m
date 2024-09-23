@implementation MAFlattenFeatureExtractor

- (MAFlattenFeatureExtractor)initWithName:(id)a3 featureExtractors:(id)a4
{
  id v6;
  id v7;
  MAFlattenFeatureExtractor *v8;
  uint64_t v9;
  NSString *name;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSArray *featureNames;
  NSArray *v26;
  uint64_t v27;
  NSArray *featureExtractors;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)MAFlattenFeatureExtractor;
  v8 = -[MAFlattenFeatureExtractor init](&v38, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      name = v8->_name;
      v8->_name = (NSString *)v9;
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Flatten["));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v35;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendFormat:", CFSTR("...%@, "), v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v14);
      }

      objc_msgSend(v11, "appendString:", CFSTR("]"));
      name = v8->_name;
      v8->_name = (NSString *)v11;
    }

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "featureNames");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v18, "addObjectsFromArray:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v21);
    }

    featureNames = v8->_featureNames;
    v8->_featureNames = v18;
    v26 = v18;

    v27 = objc_msgSend(v19, "copy");
    featureExtractors = v8->_featureExtractors;
    v8->_featureExtractors = (NSArray *)v27;

  }
  return v8;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  MAMutableFloatVector *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MAMutableFloatVector);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MAFlattenFeatureExtractor featureExtractors](self, "featureExtractors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v14 = (void *)MEMORY[0x1CAA4B20C]();
        v17 = v12;
        objc_msgSend(v13, "defaultFloatVectorWithError:", &v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v17;

        if (!v15)
        {

          objc_autoreleasePoolPop(v14);
          v5 = 0;
          goto LABEL_12;
        }
        -[MAMutableFloatVector appendVector:](v5, "appendVector:", v15);

        objc_autoreleasePoolPop(v14);
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v5;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v29;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = v10;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v8);
        --v13;
      }
      while (v13);
      v11 += v10;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  +[MAFloatMatrix zerosWithRows:columns:](MAFloatMatrix, "zerosWithRows:columns:", v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAFlattenFeatureExtractor featureExtractors](self, "featureExtractors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v29 = v7;
  objc_msgSend(v7, "progressReportersForParallelOperationsWithCount:", v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (v16)
  {
    v18 = 0;
    v19 = v16 - 1;
    v20 = v14;
    do
    {
      v21 = v17;
      v22 = (void *)MEMORY[0x1CAA4B20C]();
      -[MAFlattenFeatureExtractor featureExtractors](self, "featureExtractors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "objectAtIndexedSubscript:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v17;
      objc_msgSend(v24, "floatMatrixWithEntities:progressReporter:error:", v8, v25, &v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v33;

      if (v26)
      {
        objc_msgSend(v20, "matrixByAppendingColumnsOfMatrix:", v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      objc_autoreleasePoolPop(v22);
      if (!v26)
        break;
      v20 = v14;
    }
    while (v19 != v18++);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v14;
}

- (id)name
{
  return self->_name;
}

- (id)featureNames
{
  return self->_featureNames;
}

- (NSArray)featureExtractors
{
  return self->_featureExtractors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureExtractors, 0);
  objc_storeStrong((id *)&self->_featureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
