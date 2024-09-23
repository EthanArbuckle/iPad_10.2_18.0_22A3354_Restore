@implementation BWStreamStartStopSynchronizer

- (void)setSynchronizationSlavesOrderedByPriority:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];

  self->_synchronizationSlavesOrderedByPriority = (NSArray *)a3;
  v5 = (void *)MEMORY[0x1A858DD40]();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", objc_msgSend(v11, "portType"));
        if (v12)
        {
          v13 = v12;
          if ((objc_msgSend(v11, "isSynchronizationMaster") & 1) == 0
            && (objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
          {
            objc_msgSend(v6, "addObject:", v13);
          }
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = -[NSDictionary allValues](self->_streamStatesByPortType, "allValues", 0);
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        if (v19)
          v20 = (void *)v19[2];
        else
          v20 = 0;
        if ((objc_msgSend(v20, "isSynchronizationMaster") & 1) == 0)
        {
          v21 = objc_msgSend(v6, "indexOfObject:", v19);
          if (v21)
          {
            v23 = v6;
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
              v23 = (void *)objc_msgSend(v6, "subarrayWithRange:", 0, v21);
          }
          else
          {
            v23 = 0;
          }
          if (v19)
            objc_setProperty_nonatomic(v19, v22, v23, 56);
        }
        ++v18;
      }
      while (v16 != v18);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      v16 = v24;
    }
    while (v24);
  }
  objc_autoreleasePoolPop(v5);
}

- (BWStreamStartStopSynchronizer)initWithStreams:(id)a3 timeoutInSeconds:(float)a4
{
  BWStreamStartStopSynchronizer *v6;
  id v7;
  float *v8;
  uint64_t v9;
  float *i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  float *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)BWStreamStartStopSynchronizer;
  v6 = -[BWStreamStartStopSynchronizer init](&v27, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = (float *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; i = (float *)((char *)i + 1))
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "isSynchronizationMaster"))
          {
            v8 = -[BWStreamStartStopState initWithStream:masterState:timeoutInSeconds:]([BWStreamStartStopState alloc], v11, 0, a4);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, objc_msgSend(v11, "portType"));
            goto LABEL_12;
          }
        }
        v8 = (float *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(a3);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          if ((objc_msgSend(v16, "isSynchronizationMaster") & 1) == 0)
          {
            v17 = -[BWStreamStartStopState initWithStream:masterState:timeoutInSeconds:]([BWStreamStartStopState alloc], v16, v8, a4);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, objc_msgSend(v16, "portType"));

          }
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      }
      while (v13);
    }
    v6->_streamStatesByPortType = (NSDictionary *)objc_msgSend(v7, "copy");

  }
  return v6;
}

- (void)setWaitForMasterAEToSettle:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSDictionary allValues](self->_streamStatesByPortType, "allValues", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9)
          *(_BYTE *)(v9 + 68) = a3;
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (BOOL)streamWillStart:(id)a3
{
  return -[BWStreamStartStopState streamWillStart]((uint64_t)-[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType")));
}

- (void)streamDidStart:(id)a3
{
  dispatch_group_t *v3;
  dispatch_group_t *v4;

  v3 = -[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType"));
  if (v3)
  {
    v4 = v3;
    if (*((_DWORD *)v3 + 2) == 1)
    {
      *((_DWORD *)v3 + 2) = 2;
      dispatch_group_leave(v3[3]);
      *((_BYTE *)v4 + 32) = 0;
    }
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamStartStopSynchronizer;
  -[BWStreamStartStopSynchronizer dealloc](&v3, sel_dealloc);
}

- (BOOL)waitForMasterAEToSettle
{
  _BYTE *v2;

  v2 = -[NSArray firstObject](-[NSDictionary allValues](self->_streamStatesByPortType, "allValues"), "firstObject");
  if (v2)
    LOBYTE(v2) = v2[68] != 0;
  return (char)v2;
}

- (NSArray)synchronizationSlavesOrderedByPriority
{
  return self->_synchronizationSlavesOrderedByPriority;
}

- (BOOL)streamWillStop:(id)a3
{
  return -[BWStreamStartStopState streamWillStop]((uint64_t)-[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType")));
}

- (void)streamDidStop:(id)a3
{
  -[BWStreamStartStopState streamDidStop]((uint64_t)-[NSDictionary objectForKeyedSubscript:](self->_streamStatesByPortType, "objectForKeyedSubscript:", objc_msgSend(a3, "portType")));
}

@end
