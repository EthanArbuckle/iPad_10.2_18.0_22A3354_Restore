@implementation HDStatisticsCollectionCalculatorCachingSourceOrderProvider

+ (id)sleepSourceOrderProviderForProfile:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HDStatisticsCollectionCalculatorCachingSourceOrderProvider *v9;

  v3 = (void *)MEMORY[0x1E0CB6380];
  v4 = *MEMORY[0x1E0CB4980];
  v5 = a3;
  objc_msgSend(v3, "categoryTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:", v6, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDStatisticsCollectionCalculatorCachingSourceOrderProvider initWithProfile:quantityType:]([HDStatisticsCollectionCalculatorCachingSourceOrderProvider alloc], "initWithProfile:quantityType:", v5, v8);
  return v9;
}

- (HDStatisticsCollectionCalculatorCachingSourceOrderProvider)initWithProfile:(id)a3 quantityType:(id)a4
{
  HDStatisticsCollectionCalculatorCachingSourceOrderProvider *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedSources;
  NSArray *v7;
  NSArray *cachedOrderedSourceIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
  v4 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](&v10, sel_initWithProfile_quantityType_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedSources = v4->_cachedSources;
    v4->_cachedSources = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    cachedOrderedSourceIDs = v4->_cachedOrderedSourceIDs;
    v4->_cachedOrderedSourceIDs = v7;

  }
  return v4;
}

- (id)sourceForSourceID:(int64_t)a3
{
  NSMutableDictionary *cachedSources;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  objc_super v11;

  cachedSources = self->_cachedSources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedSources, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
    -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider sourceForSourceID:](&v11, sel_sourceForSourceID_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedSources;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (id)orderedSourceIDsWithUnorderedIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *cachedOrderedSourceIDs;
  NSArray *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_cachedOrderedSourceIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToSet:", v6) & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDStatisticsCollectionCalculatorCachingSourceOrderProvider;
    -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider orderedSourceIDsWithUnorderedIDs:](&v11, sel_orderedSourceIDsWithUnorderedIDs_, v4);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedOrderedSourceIDs = self->_cachedOrderedSourceIDs;
    self->_cachedOrderedSourceIDs = v7;

  }
  v9 = self->_cachedOrderedSourceIDs;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOrderedSourceIDs, 0);
  objc_storeStrong((id *)&self->_cachedSources, 0);
}

@end
