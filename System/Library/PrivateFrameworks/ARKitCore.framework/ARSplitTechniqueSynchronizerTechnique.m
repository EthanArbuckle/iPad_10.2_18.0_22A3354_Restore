@implementation ARSplitTechniqueSynchronizerTechnique

- (ARSplitTechniqueSynchronizerTechnique)initWithSynchronizedResultDataClasses:(id)a3
{
  id v4;
  ARSplitTechniqueSynchronizerTechnique *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *lastReceivedResultsSemaphore;
  uint64_t v8;
  NSMutableArray *lastReceivedResults;
  void *v10;
  ARCircularArray *v11;
  ARCircularArray *contextsWaitingForSynchronizationData;
  uint64_t v13;
  NSMutableDictionary *pendingResults;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARSplitTechniqueSynchronizerTechnique;
  v5 = -[ARTechnique init](&v16, sel_init);
  if (v5)
  {
    v6 = dispatch_semaphore_create(1);
    lastReceivedResultsSemaphore = v5->_lastReceivedResultsSemaphore;
    v5->_lastReceivedResultsSemaphore = (OS_dispatch_semaphore *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    lastReceivedResults = v5->_lastReceivedResults;
    v5->_lastReceivedResults = (NSMutableArray *)v8;

    if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.qatracing.dumpSemanticSegmantationData")))
    {
      v10 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v10, "addObject:", objc_opt_class());

      v4 = v10;
    }
    objc_storeStrong((id *)&v5->_synchronizedResultDataClasses, v4);
    v11 = -[ARCircularArray initWithCapacity:]([ARCircularArray alloc], "initWithCapacity:", 2);
    contextsWaitingForSynchronizationData = v5->_contextsWaitingForSynchronizationData;
    v5->_contextsWaitingForSynchronizationData = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    pendingResults = v5->_pendingResults;
    v5->_pendingResults = (NSMutableDictionary *)v13;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARSplitTechniqueSynchronizerTechnique;
  if (-[ARTechnique isEqual:](&v8, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "synchronizedResultDataClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToSet:", self->_synchronizedResultDataClasses);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  return 0;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ARNonSynchronousData *v14;
  void *v15;
  ARNonSynchronousData *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  ARNonSynchronousData *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (-[NSMutableArray count](self->_lastReceivedResults, "count"))
  {
    v19 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = self->_lastReceivedResults;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v7, "addObjectsFromArray:", v13);
          else
            objc_msgSend(v7, "addObject:", v13);
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    -[NSMutableArray removeAllObjects](self->_lastReceivedResults, "removeAllObjects");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
    v14 = [ARNonSynchronousData alloc];
    v6 = v19;
    objc_msgSend(v19, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    v16 = -[ARNonSynchronousData initWithGatheredData:timestamp:](v14, "initWithGatheredData:timestamp:", v7);

    -[ARTechnique delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "technique:didOutputResultData:timestamp:context:", self, v18, v19, a3);

  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
    -[ARTechnique delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);
  }

}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ARCircularArray *contextsWaitingForSynchronizationData;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  NSMutableArray *lastReceivedResults;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSplitTechniqueSynchronizerTechnique _recursivelyGatherData:fromContext:](self, "_recursivelyGatherData:fromContext:", v9, v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_synchronizedResultDataClasses, "containsObject:", objc_opt_class()))
          objc_msgSend(v10, "addObject:", v15);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v12);
  }

  if (-[NSSet containsObject:](self->_synchronizedResultDataClasses, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(v8, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

  }
  v38 = v10;
  v40 = v8;
  if (objc_msgSend(v10, "count"))
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "imageData", v10, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timestamp");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    contextsWaitingForSynchronizationData = self->_contextsWaitingForSynchronizationData;
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "imageData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timestamp");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARCircularArray addObject:](contextsWaitingForSynchronizationData, "addObject:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      -[NSMutableDictionary removeObjectForKey:](self->_pendingResults, "removeObjectForKey:", v24);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingResults, "objectForKeyedSubscript:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v25, "addObjectsFromArray:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingResults, "setObject:forKeyedSubscript:", v25, v19);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[NSMutableDictionary allKeys](self->_pendingResults, "allKeys", v38);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v26)
  {
    v27 = v26;
    v43 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(v41);
        v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingResults, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v45;
          do
          {
            for (k = 0; k != v33; ++k)
            {
              if (*(_QWORD *)v45 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(v30, "addObject:", objc_opt_class());
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          }
          while (v33);
        }

        if (objc_msgSend(v30, "isEqualToSet:", self->_synchronizedResultDataClasses))
        {
          dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
          lastReceivedResults = self->_lastReceivedResults;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingResults, "objectForKeyedSubscript:", v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](lastReceivedResults, "addObject:", v37);

          dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastReceivedResultsSemaphore);
          -[NSMutableDictionary removeObjectForKey:](self->_pendingResults, "removeObjectForKey:", v29);
        }

      }
      v27 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v27);
  }

}

- (void)_recursivelyGatherData:(id)a3 fromContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "gatheredData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v8);

      objc_msgSend(v7, "parentContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ARSplitTechniqueSynchronizerTechnique _recursivelyGatherData:fromContext:](self, "_recursivelyGatherData:fromContext:", v10, v9);
    }
  }

}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ARSplitTechniqueSynchronizerTechnique *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_ARLogTechnique_onceToken_2 != -1)
    dispatch_once(&_ARLogTechnique_onceToken_2, &__block_literal_global_24);
  v8 = (void *)_ARLogTechnique_logObj_2;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_2, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2048;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Split technique pipeline failed with error: %ld - %@", (uint8_t *)&v14, 0x2Au);

  }
}

- (NSSet)synchronizedResultDataClasses
{
  return self->_synchronizedResultDataClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizedResultDataClasses, 0);
  objc_storeStrong((id *)&self->_pendingResults, 0);
  objc_storeStrong((id *)&self->_contextsWaitingForSynchronizationData, 0);
  objc_storeStrong((id *)&self->_lastReceivedResultsSemaphore, 0);
  objc_storeStrong((id *)&self->_lastReceivedResults, 0);
}

@end
