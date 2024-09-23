@implementation HKAxisLabelCache

- (HKAxisLabelCache)initWithLabelDataSource:(id)a3
{
  id v4;
  HKAxisLabelCache *v5;
  NSCache *v6;
  NSCache *mainCache;
  HKValueRange *lastRequestRange;
  NSArray *lastRequestData;
  NSLock *v10;
  NSLock *axisLabelCacheLock;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKAxisLabelCache;
  v5 = -[HKAxisLabelCache init](&v15, sel_init);
  if (v5)
  {
    v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    mainCache = v5->_mainCache;
    v5->_mainCache = v6;

    lastRequestRange = v5->_lastRequestRange;
    v5->_lastRequestRange = 0;

    lastRequestData = v5->_lastRequestData;
    v5->_lastRequestData = 0;

    objc_storeWeak((id *)&v5->_axisLabelDataSource, v4);
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    axisLabelCacheLock = v5->_axisLabelCacheLock;
    v5->_axisLabelCacheLock = v10;

    -[NSLock setName:](v5->_axisLabelCacheLock, "setName:", CFSTR("HKAxisLabelCacheLock"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__handleTimeChangeNotification_, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v5, sel__handleTimeChangeNotification_, *MEMORY[0x1E0C99720], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKAxisLabelCache;
  -[HKAxisLabelCache dealloc](&v4, sel_dealloc);
}

- (id)allAxisLabelsForRange:(id)a3 zoomScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[HKAxisLabelCache lastRequestRange](self, "lastRequestRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    -[HKAxisLabelCache lastRequestData](self, "lastRequestData");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlock");

  }
  else
  {
    -[HKAxisLabelCache axisLabelDataSource](self, "axisLabelDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cacheKeysForModelRange:zoomScale:", v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v28 = v13;
      obj = v13;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v14 = 0;
      if (v31)
      {
        v30 = *(_QWORD *)v38;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v38 != v30)
              objc_enumerationMutation(obj);
            v32 = v15;
            -[HKAxisLabelCache _axisLabelsForPage:zoomScale:](self, "_axisLabelsForPage:zoomScale:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v15), a4);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v34;
              v20 = 1;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v34 != v19)
                    objc_enumerationMutation(v16);
                  v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                  if (-[HKAxisLabelCache _axisLabel:insideModelRange:](self, "_axisLabel:insideModelRange:", v22, v6))
                  {
                    if ((v20 & 1) != 0 && (objc_msgSend(v22, "isEqual:", v14) & 1) != 0)
                    {
                      v20 = 0;
                    }
                    else
                    {
                      objc_msgSend(v10, "addObject:", v22);
                      v23 = v22;

                      v20 = 0;
                      v14 = v23;
                    }
                  }
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v18);
            }

            v15 = v32 + 1;
          }
          while (v32 + 1 != v31);
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v31);
      }

      -[HKAxisLabelCache setLastRequestRange:](self, "setLastRequestRange:", v6);
      -[HKAxisLabelCache setLastRequestData:](self, "setLastRequestData:", v10);
      -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unlock");

      v13 = v28;
    }
    else
    {
      -[HKAxisLabelCache axisLabelDataSource](self, "axisLabelDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "findAxisLabelsInModelRange:zoomScale:", v6, a4);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[HKAxisLabelCache setLastRequestRange:](self, "setLastRequestRange:", v6);
      -[HKAxisLabelCache setLastRequestData:](self, "setLastRequestData:", v10);
      -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "unlock");

    }
  }

  return v10;
}

- (BOOL)_axisLabel:(id)a3 insideModelRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  objc_msgSend(v6, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "maxValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v10, "compare:", v11);
  return v9 != -1 && v12 != 1;
}

- (id)_axisLabelsForPage:(id)a3 zoomScale:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[HKAxisLabelCache mainCache](self, "mainCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[HKAxisLabelCache axisLabelDataSource](self, "axisLabelDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "findAxisLabelsInModelRange:zoomScale:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKAxisLabelCache mainCache](self, "mainCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v8, v6);

  }
  return v8;
}

- (void)invalidateCache
{
  void *v3;
  id v4;

  -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[NSCache removeAllObjects](self->_mainCache, "removeAllObjects");
  -[HKAxisLabelCache setLastRequestRange:](self, "setLastRequestRange:", 0);
  -[HKAxisLabelCache setLastRequestData:](self, "setLastRequestData:", 0);
  -[HKAxisLabelCache axisLabelCacheLock](self, "axisLabelCacheLock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

}

- (void)_handleTimeChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HKAxisLabelCache__handleTimeChangeNotification___block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__HKAxisLabelCache__handleTimeChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateCache");
}

- (NSCache)mainCache
{
  return self->_mainCache;
}

- (void)setMainCache:(id)a3
{
  objc_storeStrong((id *)&self->_mainCache, a3);
}

- (HKValueRange)lastRequestRange
{
  return self->_lastRequestRange;
}

- (void)setLastRequestRange:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestRange, a3);
}

- (NSArray)lastRequestData
{
  return self->_lastRequestData;
}

- (void)setLastRequestData:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestData, a3);
}

- (HKAxisLabelDataSource)axisLabelDataSource
{
  return (HKAxisLabelDataSource *)objc_loadWeakRetained((id *)&self->_axisLabelDataSource);
}

- (NSLock)axisLabelCacheLock
{
  return self->_axisLabelCacheLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelCacheLock, 0);
  objc_destroyWeak((id *)&self->_axisLabelDataSource);
  objc_storeStrong((id *)&self->_lastRequestData, 0);
  objc_storeStrong((id *)&self->_lastRequestRange, 0);
  objc_storeStrong((id *)&self->_mainCache, 0);
}

@end
