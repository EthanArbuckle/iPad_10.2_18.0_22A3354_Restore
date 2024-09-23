@implementation GEOClientRankingModel

- (GEOClientRankingModel)init
{
  GEOClientRankingModel *result;

  result = (GEOClientRankingModel *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModel)initWithFeatures:(id)a3
{
  id v4;
  GEOClientRankingModel *v5;
  uint64_t v6;
  NSArray *features;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOClientRankingModel;
  v5 = -[GEOClientRankingModel init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    features = v5->_features;
    v5->_features = (NSArray *)v6;

  }
  return v5;
}

- (GEOClientRankingModel)initWithGEOPDClientRankingFeatureMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOClientRankingModelFeature *v12;
  GEOClientRankingModelFeature *v13;
  GEOClientRankingModel *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [GEOClientRankingModelFeature alloc];
        v13 = -[GEOClientRankingModelFeature initWithGEOPDClientRankingFeatureMetadata:](v12, "initWithGEOPDClientRankingFeatureMetadata:", v11, (_QWORD)v16);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = -[GEOClientRankingModel initWithFeatures:](self, "initWithFeatures:", v5);
  return v14;
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
