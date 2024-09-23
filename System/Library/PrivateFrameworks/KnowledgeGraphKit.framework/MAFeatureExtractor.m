@implementation MAFeatureExtractor

+ (BOOL)shouldRetryFailures
{
  return _shouldRetryFailures;
}

+ (void)setShouldRetryFailures:(BOOL)a3
{
  _shouldRetryFailures = a3;
}

- (NSString)name
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSArray)featureNames
{
  id v2;

  KGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  id v3;

  KGAbstractMethodException(self, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAProgressReporter ignoreProgress](MAProgressReporter, "ignoreProgress", v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAFeatureExtractor floatMatrixWithEntities:progressReporter:error:](self, "floatMatrixWithEntities:progressReporter:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "row:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)featureVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MASeries *v10;

  v6 = a3;
  -[MAFeatureExtractor name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAFeatureExtractor featureNames](self, "featureNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAFeatureExtractor floatVectorWithEntity:error:](self, "floatVectorWithEntity:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MASeries initWithName:labels:vector:]([MASeries alloc], "initWithName:labels:vector:", v7, v8, v9);
  return v10;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MAMutableFloatMatrix *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id *v19;
  void *v20;
  id v22;
  id *v23;
  id obj;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MAMutableFloatMatrix);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v9;
    v23 = a5;
    v13 = 0;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1CAA4B20C]();
        if (objc_msgSend((id)objc_opt_class(), "shouldRetryFailures"))
        {
          v26 = v16;
          v19 = &v26;
          -[MAFeatureExtractor floatVectorWithRetryForEntity:error:](self, "floatVectorWithRetryForEntity:error:", v17, &v26);
        }
        else
        {
          v25 = v16;
          v19 = &v25;
          -[MAFeatureExtractor floatVectorWithEntity:error:](self, "floatVectorWithEntity:error:", v17, &v25);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *v19;

        if (!v20)
        {

          objc_autoreleasePoolPop(v18);
          v10 = 0;
          goto LABEL_14;
        }
        -[MAMutableFloatMatrix appendRow:](v10, "appendRow:", v20);

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
        continue;
      break;
    }
LABEL_14:
    v9 = v22;
    a5 = v23;
  }
  else
  {
    v13 = 0;
  }

  if (a5 && !v10)
    *a5 = objc_retainAutorelease(v13);

  return v10;
}

- (id)floatVectorWithRetryForEntity:(id)a3 error:(id *)a4
{
  int v7;
  void *v8;

  v7 = 3;
  while (1)
  {
    -[MAFeatureExtractor floatVectorWithEntity:error:](self, "floatVectorWithEntity:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      break;
    if (!--v7)
    {
      v8 = 0;
      return v8;
    }
  }
  if (a4)
    *a4 = 0;
  return v8;
}

- (id)featureVectorsWithEntities:(id)a3 entityLabels:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  MADataFrame *v12;
  void *v13;
  void *v14;
  MADataFrame *v15;

  v10 = a4;
  -[MAFeatureExtractor floatMatrixWithEntities:progressReporter:error:](self, "floatMatrixWithEntities:progressReporter:error:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [MADataFrame alloc];
  -[MAFeatureExtractor name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAFeatureExtractor featureNames](self, "featureNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MADataFrame initWithName:rowLabels:columnLabels:matrix:](v12, "initWithName:rowLabels:columnLabels:matrix:", v13, v10, v14, v11);

  return v15;
}

@end
