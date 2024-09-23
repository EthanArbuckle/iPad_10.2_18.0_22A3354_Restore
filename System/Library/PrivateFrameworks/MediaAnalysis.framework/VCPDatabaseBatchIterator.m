@implementation VCPDatabaseBatchIterator

+ (id)iteratorForAssets:(id)a3 withDatabaseReader:(id)a4 resultTypes:(id)a5 batchSize:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  VCPDatabaseBatchIterator *v12;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[VCPDatabaseBatchIterator initWithDatabaseReader:forAssets:resultsTypes:batchSize:]([VCPDatabaseBatchIterator alloc], "initWithDatabaseReader:forAssets:resultsTypes:batchSize:", v10, v9, v11, v6);

  return v12;
}

- (VCPDatabaseBatchIterator)initWithDatabaseReader:(id)a3 forAssets:(id)a4 resultsTypes:(id)a5 batchSize:(int)a6
{
  id v11;
  id v12;
  id v13;
  VCPDatabaseBatchIterator *v14;
  VCPDatabaseBatchIterator *v15;
  int v16;
  VCPDatabaseBatchIterator *v17;
  VCPDatabaseBatchIterator *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VCPDatabaseBatchIterator;
  v14 = -[VCPDatabaseBatchIterator init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_reader, a3);
    objc_storeStrong((id *)&v15->_assets, a4);
    objc_storeStrong((id *)&v15->_resultsTypes, a5);
    v15->_idxLast = 0;
    v15->_idxCurrent = 0;
    if (a6 <= 1)
      v16 = 1;
    else
      v16 = a6;
    v15->_batchSize = v16;
  }
  if (v15->_reader)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (BOOL)next
{
  PHAsset *asset;
  NSDictionary *analysis;
  NSUInteger idxCurrent;
  NSUInteger v6;
  int v7;
  PHAsset *v8;
  PHAsset *v9;
  void *v10;
  NSDictionary *batchAnalyses;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;

  asset = self->_asset;
  self->_asset = 0;

  analysis = self->_analysis;
  self->_analysis = 0;

  idxCurrent = self->_idxCurrent;
  v6 = -[NSArray count](self->_assets, "count");
  if (v6 > idxCurrent)
  {
    v7 = self->_idxCurrent;
    if (v7 >= self->_idxLast)
    {
      -[VCPDatabaseBatchIterator nextBatch](self, "nextBatch");
      v7 = self->_idxCurrent;
    }
    -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", v7);
    v8 = (PHAsset *)objc_claimAutoreleasedReturnValue();
    v9 = self->_asset;
    self->_asset = v8;

    -[PHAsset localIdentifier](self->_asset, "localIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      batchAnalyses = self->_batchAnalyses;
      -[PHAsset localIdentifier](self->_asset, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](batchAnalyses, "objectForKeyedSubscript:", v12);
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v14 = self->_analysis;
      self->_analysis = v13;

    }
    ++self->_idxCurrent;
  }
  return v6 > idxCurrent;
}

- (void)nextBatch
{
  void *v3;
  int v4;
  int batchSize;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *batchAnalyses;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v4 = -[NSArray count](self->_assets, "count");
  if (v4 - self->_idxLast >= self->_batchSize)
    batchSize = self->_batchSize;
  else
    batchSize = v4 - self->_idxLast;
  -[NSArray subarrayWithRange:](self->_assets, "subarrayWithRange:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v17;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (!v13)
        {
          objc_msgSend(v11, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  -[VCPDatabaseReader queryAnalysesForAssets:withTypes:](self->_reader, "queryAnalysesForAssets:withTypes:", v6, self->_resultsTypes);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  batchAnalyses = self->_batchAnalyses;
  self->_batchAnalyses = v15;

  self->_idxLast += batchSize;
  objc_autoreleasePoolPop(v3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSDictionary)analysis
{
  return self->_analysis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_batchAnalyses, 0);
  objc_storeStrong((id *)&self->_resultsTypes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
