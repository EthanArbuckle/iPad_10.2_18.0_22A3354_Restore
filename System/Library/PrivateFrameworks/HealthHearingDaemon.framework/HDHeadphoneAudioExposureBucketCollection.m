@implementation HDHeadphoneAudioExposureBucketCollection

- (HDHeadphoneAudioExposureBucketCollection)init
{
  HDHeadphoneAudioExposureBucketCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *storage;
  HDHeadphoneAudioExposureBucketCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDHeadphoneAudioExposureBucketCollection;
  v2 = -[HDHeadphoneAudioExposureBucketCollection init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    storage = v2->_storage;
    v2->_storage = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (HDHeadphoneAudioExposureBucketCollection)initWithBuckets:(id)a3
{
  id v4;
  HDHeadphoneAudioExposureBucketCollection *v5;
  NSMutableArray *v6;
  NSMutableArray *storage;
  HDHeadphoneAudioExposureBucketCollection *v8;

  v4 = a3;
  v5 = -[HDHeadphoneAudioExposureBucketCollection init](self, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    storage = v5->_storage;
    v5->_storage = v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    -[HDHeadphoneAudioExposureBucketCollection insertBuckets:](v5, "insertBuckets:", v4);
    v8 = v5;
  }

  return v5;
}

- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_storage;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "copyWithEarliestStartDate:resetDoseToZero:error:", v8, v6, a5);
        if (!v16)
        {
          os_unfair_lock_unlock(p_lock);
          v19 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        objc_msgSend(v9, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  v18 = objc_alloc((Class)objc_opt_class());
  v11 = (NSMutableArray *)objc_msgSend(v9, "copy");
  v19 = (void *)objc_msgSend(v18, "initWithBuckets:", v11);
LABEL_11:

  return v19;
}

- (id)snapshotStatisticsForNowDate:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDHeadphoneAudioExposureBucketCollection _lock_snapshotStatisticsForNowDate:error:](self, "_lock_snapshotStatisticsForNowDate:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_lock_snapshotStatisticsForNowDate:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableArray *storage;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  storage = self->_storage;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__HDHeadphoneAudioExposureBucketCollection__lock_snapshotStatisticsForNowDate_error___block_invoke;
  v12[3] = &unk_24DC5F0F8;
  v8 = v6;
  v13 = v8;
  -[NSMutableArray hk_firstObjectPassingTest:](storage, "hk_firstObjectPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[NSMutableArray lastObject](self->_storage, "lastObject"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v9, "snapshotStatisticsWithError:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 100, CFSTR("missing all buckets"));
    v10 = 0;
  }

  return v10;
}

uint64_t __85__HDHeadphoneAudioExposureBucketCollection__lock_snapshotStatisticsForNowDate_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)clear
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_storage, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)pruneWithNowDate:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *storage;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  HDHeadphoneAudioExposureBucketCollection *v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  storage = self->_storage;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke;
  v9[3] = &unk_24DC5F120;
  v10 = v4;
  v11 = v5;
  v12 = self;
  v7 = v5;
  v8 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](storage, "enumerateObjectsUsingBlock:", v9);
  -[NSMutableArray removeObjectsAtIndexes:](self->_storage, "removeObjectsAtIndexes:", v7);
  os_unfair_lock_unlock(&self->_lock);

}

void __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5;
  NSObject *v6;

  if (objc_msgSend(a2, "isExpiredForNowDate:", *(_QWORD *)(a1 + 32)))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v5 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "count") - 1)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
        __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke_cold_1(v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    }
  }
}

- (void)insertBuckets:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObjectsFromArray:](self->_storage, "addObjectsFromArray:", v4);
    -[NSMutableArray sortUsingComparator:](self->_storage, "sortUsingComparator:", &__block_literal_global_2);
    os_unfair_lock_unlock(&self->_lock);
  }

}

uint64_t __58__HDHeadphoneAudioExposureBucketCollection_insertBuckets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    objc_msgSend(v4, "dateInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "compare:", v14);

  }
  return v10;
}

- (id)_updateWithSampleBatch:(id)a3 needsRebuild:(BOOL *)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDHeadphoneAudioExposureBucketCollection _lock_updateWithSampleBatch:error:](self, "_lock_updateWithSampleBatch:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "includedSeries") & 1) == 0)
    self->_dirty = 1;
  if (v10)
    v11 = (void *)-[NSMutableArray copy](self->_storage, "copy");
  else
    v11 = 0;
  os_unfair_lock_unlock(p_lock);
  if (self->_dirty)
  {
    if (a4)
    {
      *a4 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
        -[HDHeadphoneAudioExposureBucketCollection _updateWithSampleBatch:needsRebuild:error:].cold.1(v12);
    }
  }

  return v11;
}

- (id)_bucketsWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_storage;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v15), "copyWithEarliestStartDate:resetDoseToZero:error:", v8, v6, a5, (_QWORD)v20);
        if (!v16)
        {
          os_unfair_lock_unlock(p_lock);

          v18 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        objc_msgSend(v9, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  v18 = (void *)objc_msgSend(v9, "copy");
LABEL_11:

  return v18;
}

- (id)_lock_updateWithSampleBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v6, "samples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    +[HDHeadphoneExposureStatisticUpdateResult resultForAggregation](HDHeadphoneExposureStatisticUpdateResult, "resultForAggregation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = self->_storage;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "updateWithSampleBatch:error:", v6, a4, (_QWORD)v19);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

            v17 = 0;
            goto LABEL_12;
          }
          v16 = (void *)v15;
          objc_msgSend(v9, "combineWithResult:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }

    v17 = v9;
LABEL_12:

  }
  else
  {
    +[HDHeadphoneExposureStatisticUpdateResult resultForEmptySamplesAdded](HDHeadphoneExposureStatisticUpdateResult, "resultForEmptySamplesAdded");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)unitTesting_snapshotBuckets
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray hk_map:](self->_storage, "hk_map:", &__block_literal_global_194_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

id __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a2, "snapshotStatisticsWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  v4 = v3;
  if (!v2 || v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke_cold_1((uint64_t)v4, v5);
  }

  return v2;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

void __61__HDHeadphoneAudioExposureBucketCollection_pruneWithNowDate___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A0AA000, log, OS_LOG_TYPE_FAULT, "Refusing to prune last bucket from memory cache.", v1, 2u);
}

- (void)_updateWithSampleBatch:(os_log_t)log needsRebuild:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A0AA000, log, OS_LOG_TYPE_ERROR, "Unable to request rebuild after partially apply sample batch to calculator.", v1, 2u);
}

void __71__HDHeadphoneAudioExposureBucketCollection_unitTesting_snapshotBuckets__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_21A0AA000, a2, OS_LOG_TYPE_FAULT, "Failed to compute current statistics: %@", (uint8_t *)&v2, 0xCu);
}

@end
