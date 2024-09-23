@implementation VNDetectorCache

- (id)detectorOfClass:(Class)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1A1B0B060]();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_detectors;
  v11 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "canBehaveAsDetectorOfClass:withConfiguration:", a3, v8))
        {
          v11 = v14;
          v15 = 0;
          goto LABEL_11;
        }
      }
      v11 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  objc_autoreleasePoolPop(v9);
  if (v15)
  {
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ not available"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = 0;
  }

  return v11;
}

- (void)releaseDetectorsThatCanBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  Class v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__VNDetectorCache_releaseDetectorsThatCanBeReplacedByDetectorOfClass_withConfiguration___block_invoke;
  v8[3] = &unk_1E4545CB0;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[VNDetectorCache evictDetectorsPassingTest:](self, "evictDetectorsPassingTest:", v8);

}

- (void)evictDetectorsPassingTest:(id)a3
{
  unsigned int (**v4)(id, uint64_t, char *);
  void *v5;
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, uint64_t, char *))a3;
  if (-[NSMutableSet count](self->_detectors, "count"))
  {
    v5 = (void *)MEMORY[0x1A1B0B060]();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_detectors;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (v4[2](v4, v11, &v16))
          objc_msgSend(v6, "addObject:", v11, (_QWORD)v12);
        if (v16)
          break;
        if (v8 == ++v10)
        {
          v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    if (objc_msgSend(v6, "count"))
    {
      -[NSMutableSet minusSet:](self->_detectors, "minusSet:", v6);
      -[VNDetectorCache _reportEvictedDetectors:](self, v6);
    }

    objc_autoreleasePoolPop(v5);
  }

}

- (void)cacheDetector:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSMutableSet containsObject:](self->_detectors, "containsObject:") & 1) == 0)
  {
    v4 = -[NSMutableSet addObject:](self->_detectors, "addObject:", v7);
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1A1B0B060](v4);
      -[VNDetectorCache delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "detectorCache:didCacheDetector:", self, v7);

      objc_autoreleasePoolPop(v5);
    }
  }

}

- (VNDetectorCacheDelegate)delegate
{
  return (VNDetectorCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

uint64_t __88__VNDetectorCache_releaseDetectorsThatCanBeReplacedByDetectorOfClass_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldBeReplacedByDetectorOfClass:withConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setDelegate:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = 2;
  else
    v4 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v4;

}

- (VNDetectorCache)init
{
  VNDetectorCache *v2;
  NSMutableSet *v3;
  NSMutableSet *detectors;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNDetectorCache;
  v2 = -[VNDetectorCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    detectors = v2->_detectors;
    v2->_detectors = v3;

  }
  return v2;
}

- (void)evictAllDetectors
{
  void *v3;
  void *v4;

  if (-[NSMutableSet count](self->_detectors, "count"))
  {
    v3 = (void *)MEMORY[0x1A1B0B060]();
    v4 = (void *)-[NSMutableSet copy](self->_detectors, "copy");
    -[NSMutableSet removeAllObjects](self->_detectors, "removeAllObjects");
    -[VNDetectorCache _reportEvictedDetectors:](self, v4);

    objc_autoreleasePoolPop(v3);
  }
}

- (id)detectorOfType:(id)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[VNDetector detectorClassAndConfigurationOptions:forDetectorType:options:error:](VNDetector, "detectorClassAndConfigurationOptions:forDetectorType:options:error:", 0, v8, v9, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VNDetectorCache detectorOfClass:configuredWithOptions:error:](self, "detectorOfClass:configuredWithOptions:error:", v10, v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)loadedDetectors
{
  void *v2;
  void *v3;

  -[NSMutableSet allObjects](self->_detectors, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_reportEvictedDetectors:(_BYTE *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (a1[16] & 2) != 0)
  {
    objc_msgSend(a1, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "detectorCache:didEvictDetector:", a1, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

@end
