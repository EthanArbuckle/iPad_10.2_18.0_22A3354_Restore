@implementation HKStatisticsCollection(HKCodingSupport)

+ (id)statisticsCollectionWithCodableCollection:()HKCodingSupport
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(v3, "statisticsInterval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hkui_dateComponentsWithCodableDateComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "statistics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_map:", &__block_literal_global_90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB6C70]);
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithAnchorDate:statisticsInterval:", v11, v6);

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v20;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v20 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(v12, "_insertStatistics:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), (_QWORD)v19);
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v15);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HKCodableStatisticsCollection)codableCollection
{
  HKCodableStatisticsCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(HKCodableStatisticsCollection);
  objc_msgSend(a1, "statisticsInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hkui_codableDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatisticsCollection setStatisticsInterval:](v2, "setStatisticsInterval:", v4);

  objc_msgSend(a1, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_240);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HKCodableStatisticsCollection setStatistics:](v2, "setStatistics:", v7);

  return v2;
}

@end
