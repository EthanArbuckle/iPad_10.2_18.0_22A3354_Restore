@implementation TabSnapshotCacheStressTestRunner

- (id)_mutableOrderedSetOfUUIDsWithCount:(unint64_t)a3
{
  void *i;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v5);

  }
  return i;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  TabSnapshotCache *v11;
  TabSnapshotCache *v12;
  TabSnapshotCache *cache;
  NSObject *v14;
  unint64_t iterations;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!start_temporaryCacheDirectoryURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "temporaryDirectory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globallyUniqueString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)start_temporaryCacheDirectoryURL;
    start_temporaryCacheDirectoryURL = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)start_temporaryCacheDirectoryURL, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v10, 0);

  v11 = [TabSnapshotCache alloc];
  v12 = -[TabSnapshotCache initWithThumbnailCacheDirectoryURL:](v11, "initWithThumbnailCacheDirectoryURL:", start_temporaryCacheDirectoryURL);
  cache = self->_cache;
  self->_cache = v12;

  srand(1u);
  v14 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    iterations = self->_iterations;
    v16 = 134217984;
    v17 = iterations;
    _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest starting with %lu iterations", (uint8_t *)&v16, 0xCu);
  }
  -[TabSnapshotCacheStressTestRunner _runIteration](self, "_runIteration");
}

- (id)_mutatedUUIDsFromUUIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(v5, "count");
    v7 = rand() % v6;
    v8 = rand() % (v6 - v7);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:range:copyItems:", v5, v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabSnapshotCacheStressTestRunner _mutableOrderedSetOfUUIDsWithCount:](self, "_mutableOrderedSetOfUUIDsWithCount:", rand() % (501 - v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unionOrderedSet:", v10);

  }
  else
  {
    -[TabSnapshotCacheStressTestRunner _mutableOrderedSetOfUUIDsWithCount:](self, "_mutableOrderedSetOfUUIDsWithCount:", rand() % 501);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_runIteration
{
  unint64_t v3;
  unint64_t maxIterations;
  NSObject *v5;
  _BOOL4 v6;
  id WeakRetained;
  unint64_t iterations;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *currentUUIDs;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_iterations + 1;
  self->_iterations = v3;
  maxIterations = self->_maxIterations;
  v5 = WBS_LOG_CHANNEL_PREFIXPerformanceTest();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3 <= maxIterations)
  {
    if (v6)
    {
      iterations = self->_iterations;
      v12 = 134217984;
      v13 = iterations;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest iteration %lu", (uint8_t *)&v12, 0xCu);
    }
    -[TabSnapshotCacheStressTestRunner _mutatedUUIDsFromUUIDs:](self, "_mutatedUUIDsFromUUIDs:", self->_currentUUIDs);
    v9 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    currentUUIDs = self->_currentUUIDs;
    self->_currentUUIDs = v9;

    -[TabSnapshotCache setIdentifiersToCache:forDelegate:](self->_cache, "setIdentifiersToCache:forDelegate:", self->_currentUUIDs, self);
    -[TabSnapshotCache setUpdating:forDelegate:](self->_cache, "setUpdating:forDelegate:", 1, self);
    v11 = -[NSMutableOrderedSet count](self->_currentUUIDs, "count");
    self->_cachesUntilNextIteration = rand() % v11 + 1;
  }
  else
  {
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "TabSnapshotCacheStressTest finished", (uint8_t *)&v12, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tabSnapshotCacheStressTestRunnerDidFinish:", self);

  }
}

- (void)tabSnapshotCache:(id)a3 didCacheSnapshotWithIdentifier:(id)a4
{
  unint64_t cachesUntilNextIteration;

  cachesUntilNextIteration = self->_cachesUntilNextIteration;
  if (cachesUntilNextIteration)
    self->_cachesUntilNextIteration = cachesUntilNextIteration - 1;
  else
    -[TabSnapshotCacheStressTestRunner _runIteration](self, "_runIteration", a3, a4);
}

- (void)tabSnapshotCache:(id)a3 requestSnapshotWithIdentifier:(id)a4 completion:(id)a5
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;

  v5 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__TabSnapshotCacheStressTestRunner_tabSnapshotCache_requestSnapshotWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E9CF1950;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__TabSnapshotCacheStressTestRunner_tabSnapshotCache_requestSnapshotWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CGContext *CurrentContext;
  id v4;
  CGSize v5;
  CGRect v6;

  v5.width = 1024.0;
  v5.height = 768.0;
  UIGraphicsBeginImageContext(v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  CurrentContext = UIGraphicsGetCurrentContext();
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1024.0;
  v6.size.height = 768.0;
  CGContextFillRect(CurrentContext, v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)snapshotsToPersistOnDiskForTabSnapshotCache:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (BOOL)tabSnapshotCacheShouldDeferNextSnapshotRequest:(id)a3
{
  return 0;
}

- (unint64_t)capacityForTabSnapshotCache:(id)a3
{
  return 0x8000000;
}

- (unint64_t)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(unint64_t)a3
{
  self->_maxIterations = a3;
}

- (TabSnapshotCacheStressTestRunnerDelegate)delegate
{
  return (TabSnapshotCacheStressTestRunnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TabSnapshotCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSMutableOrderedSet)currentUUIDs
{
  return self->_currentUUIDs;
}

- (void)setCurrentUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_currentUUIDs, a3);
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (unint64_t)cachesUntilNextIteration
{
  return self->_cachesUntilNextIteration;
}

- (void)setCachesUntilNextIteration:(unint64_t)a3
{
  self->_cachesUntilNextIteration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUUIDs, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
