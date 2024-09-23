@implementation BLSHFlipbookHistory

- (BLSHFlipbookHistory)initWithFrameLimit:(unint64_t)a3 memoryLimit:(unint64_t)a4
{
  BLSHFlipbookHistory *v6;
  BLSHFlipbookHistory *v7;
  uint64_t v8;
  NSMutableArray *lock_frames;
  uint64_t v10;
  NSMutableDictionary *lock_framesDict;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BLSHFlipbookHistory;
  v6 = -[BLSHFlipbookHistory init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_frameLimit = a3;
    v6->_memoryLimit = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    lock_frames = v7->_lock_frames;
    v7->_lock_frames = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    lock_framesDict = v7->_lock_framesDict;
    v7->_lock_framesDict = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (unint64_t)memoryUsage
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_lock_frames;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "retainedMemoryUsage", (_QWORD)v11);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addRenderedFrameToHistory:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *lock_framesDict;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *lock_frames;
  _QWORD v11[8];
  _QWORD v12[3];
  int v13;
  _QWORD v14[4];
  _QWORD v15[3];
  char v16;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  +[BLSDiagnosticFlipbookFrame createWithFrame:](BLSHFlipbookHistoryFrame, "createWithFrame:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_lock_frames, "addObject:", v5);
  lock_framesDict = self->_lock_framesDict;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](lock_framesDict, "setObject:forKey:", v5, v7);

  if (-[NSMutableArray count](self->_lock_frames, "count") > self->_frameLimit)
  {
    -[NSMutableArray objectAtIndex:](self->_lock_frames, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_lock_frames, "removeObjectAtIndex:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_lock_framesDict, "removeObjectForKey:", v9);

  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  lock_frames = self->_lock_frames;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__BLSHFlipbookHistory_addRenderedFrameToHistory___block_invoke;
  v11[3] = &unk_24D1BD540;
  v11[4] = self;
  v11[5] = v15;
  v11[6] = v14;
  v11[7] = v12;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](lock_frames, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  os_unfair_lock_unlock(&self->_lock);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);

}

void __49__BLSHFlipbookHistory_addRenderedFrameToHistory___block_invoke(_QWORD *a1, void *a2, int a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = objc_msgSend(v7, "retainedMemoryUsage");
  if (v8)
  {
    v9 = *(_QWORD *)(a1[5] + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      v10 = *(_QWORD *)(a1[6] + 8);
      v11 = *(_QWORD *)(v10 + 24) + v8;
      if (v11 <= *(_QWORD *)(a1[4] + 16))
      {
        *(_QWORD *)(v10 + 24) = v11;
        ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      }
      else
      {
        *(_BYTE *)(v9 + 24) = 1;
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    if (objc_msgSend(v7, "isRetainingSurface"))
    {
      objc_msgSend(v7, "stopRetainingSurface");
      bls_diagnostics_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = a1[4];
        v14 = *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringFromByteCount:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE0B948], "sharedFormatter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringFromByteCount:", *(_QWORD *)(a1[4] + 16));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bls_shortLoggingString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134219266;
        v21 = v13;
        v22 = 1024;
        v23 = a3;
        v24 = 1024;
        v25 = v14;
        v26 = 2114;
        v27 = v16;
        v28 = 2114;
        v29 = v18;
        v30 = 2114;
        v31 = v19;
        _os_log_debug_impl(&dword_2145AC000, v12, OS_LOG_TYPE_DEBUG, "%p frame %u, reached memory limit (%u — %{public}@/%{public}@), purging %{public}@", (uint8_t *)&v20, 0x36u);

      }
    }
    else
    {
      *a4 = 1;
    }
  }

}

- (NSArray)allFrames
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray bs_reverse](self->_lock_frames, "bs_reverse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)frameWithUUID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKey:](self->_lock_framesDict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_framesDict, 0);
  objc_storeStrong((id *)&self->_lock_frames, 0);
}

@end
