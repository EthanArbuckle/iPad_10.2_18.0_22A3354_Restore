@implementation NMSPodcastSizeEstimation

- (NMSPodcastSizeEstimation)init
{
  NMSPodcastSizeEstimation *v2;
  NMSPodcastSizeEstimation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NMSPodcastSizeEstimation;
  v2 = -[NMSPodcastSizeEstimation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NMSPodcastSizeEstimation _setupFromCache](v2, "_setupFromCache");
  return v3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (BOOL)incrementSize:(unint64_t)a3 duration:(double)a4 forFeedURL:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  double v17;
  void *v18;
  NSObject *v19;
  int v21;
  unint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = v8;
  if (a3 && fabs(a4) >= 2.22044605e-16 && objc_msgSend(v8, "length"))
  {
    -[NMSPodcastSizeEstimation sizeInfoDict](self, "sizeInfoDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = objc_opt_new();
    v14 = v13;

    NMLogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = (unint64_t)v14;
      _os_log_impl(&dword_216E27000, v16, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Updating podcastSizeInfo. Before: %@", (uint8_t *)&v21, 0xCu);
    }

    -[NSObject setTotalSize:](v14, "setTotalSize:", -[NSObject totalSize](v14, "totalSize") + a3);
    -[NSObject totalDuration](v14, "totalDuration");
    -[NSObject setTotalDuration:](v14, "setTotalDuration:", v17 + a4);
    -[NSObject setCount:](v14, "setCount:", -[NSObject count](v14, "count") + 1);
    -[NMSPodcastSizeEstimation sizeInfoDict](self, "sizeInfoDict");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v9);

    NMLogForCategory(5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = (unint64_t)v14;
      _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Updating podcastSizeInfo. After: %@", (uint8_t *)&v21, 0xCu);
    }

    v15 = 1;
  }
  else
  {
    NMLogForCategory(5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = 134218498;
      v22 = a3;
      v23 = 2048;
      v24 = a4;
      v25 = 2112;
      v26 = v9;
      _os_log_error_impl(&dword_216E27000, v14, OS_LOG_TYPE_ERROR, "[PodcastSize] Failed to update podcast size estimation cache with size: %llu, duration: %f, feedURL: %@", (uint8_t *)&v21, 0x20u);
    }
    v15 = 0;
  }

  return v15;
}

- (void)synchronize
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[PodcastSize] Failed to archive podcasts size info due to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (unint64_t)sizeForFeedURL:(id)a3 duration:(double)a4 feedProvidedSize:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t totalAverageSize;
  double v13;
  double v14;
  double v15;
  const char *v16;
  double v17;
  double v18;
  NSObject *v19;
  uint32_t v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    -[NMSPodcastSizeEstimation sizeInfoDict](self, "sizeInfoDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend((id)objc_opt_class(), "_minimumSizeThreshold") < a5)
  {
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NMSPodcastSizeEstimation sizeForFeedURL:duration:feedProvidedSize:].cold.1((uint64_t)v8, a5, v11);
    totalAverageSize = a5;
    goto LABEL_23;
  }
  v13 = fabs(a4);
  if (v10)
  {
    if (v13 <= 2.22044605e-16)
    {
      totalAverageSize = objc_msgSend(v10, "averageSize");
      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      v25 = 138413058;
      v26 = v8;
      v27 = 2048;
      v28 = a5;
      v29 = 2048;
      v30 = a4;
      v31 = 2048;
      v32 = totalAverageSize;
      v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on podcast average.";
      v19 = v11;
      v20 = 42;
      goto LABEL_22;
    }
    objc_msgSend(v10, "sizeDurationRatio");
    -[NMSPodcastSizeEstimation _adjustedSizeDurationRatio:](self, "_adjustedSizeDurationRatio:");
    v15 = v14;
    totalAverageSize = (unint64_t)(v14 * a4);
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    v25 = 138413314;
    v26 = v8;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a4;
    v31 = 2048;
    v32 = totalAverageSize;
    v33 = 2048;
    v34 = *(_QWORD *)&v15;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on podcast ratio %f.";
LABEL_21:
    v19 = v11;
    v20 = 52;
LABEL_22:
    _os_log_debug_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v25, v20);
    goto LABEL_23;
  }
  if (v13 > 2.22044605e-16)
  {
    -[NMSPodcastSizeEstimation _adjustedSizeDurationRatio:](self, "_adjustedSizeDurationRatio:", self->_totalSizeDurationRatio);
    v18 = v17;
    totalAverageSize = (unint64_t)(v17 * a4);
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    v25 = 138413314;
    v26 = v8;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a4;
    v31 = 2048;
    v32 = totalAverageSize;
    v33 = 2048;
    v34 = *(_QWORD *)&v18;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size %llu based on total average ratio %f.";
    goto LABEL_21;
  }
  totalAverageSize = self->_totalAverageSize;
  v21 = objc_msgSend((id)objc_opt_class(), "_defaultEstimatedSize");
  if (totalAverageSize <= v21)
    totalAverageSize = v21;
  NMLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v22 = self->_totalAverageSize;
    v25 = 138413314;
    v26 = v8;
    v27 = 2048;
    v28 = a5;
    v29 = 2048;
    v30 = a4;
    v31 = 2048;
    v32 = v22;
    v33 = 2048;
    v34 = totalAverageSize;
    v16 = "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, total average is %llu, estimated size %llu bas"
          "ed on total average.";
    goto LABEL_21;
  }
LABEL_23:

  if (totalAverageSize < objc_msgSend((id)objc_opt_class(), "_minimumSizeThreshold"))
  {
    NMLogForCategory(5);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138413058;
      v26 = v8;
      v27 = 2048;
      v28 = a5;
      v29 = 2048;
      v30 = a4;
      v31 = 2048;
      v32 = totalAverageSize;
      _os_log_impl(&dword_216E27000, v23, OS_LOG_TYPE_DEFAULT, "[PodcastSize] Podcast %@ provided size is %llu, duration is %f, estimated size is %llu. Using static estimate instead.", (uint8_t *)&v25, 0x2Au);
    }

    totalAverageSize = objc_msgSend((id)objc_opt_class(), "_defaultEstimatedSize");
  }

  return totalAverageSize;
}

- (unint64_t)averageEpisodeSize
{
  return -[NMSPodcastSizeEstimation sizeForFeedURL:duration:feedProvidedSize:](self, "sizeForFeedURL:duration:feedProvidedSize:", 0, 0, 0.0);
}

+ (unint64_t)_minimumSizeThreshold
{
  return 1000000;
}

+ (unint64_t)_defaultEstimatedSize
{
  return 50000000;
}

+ (double)_defaultSizeDurationRatio
{
  return 16000.0;
}

- (double)_adjustedSizeDurationRatio:(double)a3
{
  double v3;

  if (fabs(a3) <= 2.22044605e-16)
    return 16000.0;
  v3 = 8000.0;
  if (a3 >= 8000.0)
  {
    v3 = a3;
    if (a3 > 40000.0)
      return 40000.0;
  }
  return v3;
}

- (void)_setupFromCache
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sizeInfoDict;
  double v5;
  id v6;

  -[NMSPodcastSizeEstimation _cachedPodcastSizeInfoDict](self, "_cachedPodcastSizeInfoDict");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sizeInfoDict = self->_sizeInfoDict;
  self->_sizeInfoDict = v3;

  self->_empty = v6 == 0;
  -[NMSPodcastSizeEstimation _totalSizeDurationRatio](self, "_totalSizeDurationRatio");
  self->_totalSizeDurationRatio = v5;
  self->_totalAverageSize = -[NMSPodcastSizeEstimation _totalAverageSize](self, "_totalAverageSize");

}

- (id)_cachedPodcastSizeInfoDict
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podcastSizeEstimationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v8, v3, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    if (v10)
    {
      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[NMSPodcastSizeEstimation _cachedPodcastSizeInfoDict].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)_totalSizeDurationRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NMSPodcastSizeEstimation sizeInfoDict](self, "sizeInfoDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NMSPodcastSizeEstimation__totalSizeDurationRatio__block_invoke;
  v7[3] = &unk_24D646D48;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);

  v3 = v9[3];
  if (fabs(v3) <= 2.22044605e-16)
  {
    +[NMSPodcastSizeEstimation _defaultSizeDurationRatio](NMSPodcastSizeEstimation, "_defaultSizeDurationRatio");
    v4 = v5;
  }
  else
  {
    v4 = (double)(unint64_t)v13[3] / v3;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

double __51__NMSPodcastSizeEstimation__totalSizeDurationRatio__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double result;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "totalSize");
  objc_msgSend(v4, "totalDuration");
  v6 = v5;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v6 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

- (unint64_t)_totalAverageSize
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NMSPodcastSizeEstimation sizeInfoDict](self, "sizeInfoDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__NMSPodcastSizeEstimation__totalAverageSize__block_invoke;
  v6[3] = &unk_24D646D48;
  v6[4] = &v11;
  v6[5] = &v7;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

  v3 = v12[3];
  v4 = v8[3];
  if (v3)
    v4 /= v3;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void __45__NMSPodcastSizeEstimation__totalAverageSize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v4, "count");
  v5 = objc_msgSend(v4, "totalSize");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

- (NSMutableDictionary)sizeInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSizeInfoDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeInfoDict, 0);
}

- (void)sizeForFeedURL:(uint64_t)a1 duration:(uint64_t)a2 feedProvidedSize:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_216E27000, log, OS_LOG_TYPE_DEBUG, "[PodcastSize] Podcast %@ provided size %llu is larger than threshold.", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_cachedPodcastSizeInfoDict
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[PodcastSize] Failed to uarchive podcasts size info due to: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
