@implementation BRNotificationQueue

- (BRNotificationQueue)init
{
  BRNotificationQueue *v2;
  uint64_t v3;
  NSMutableArray *array;
  NSMutableArray *v5;
  NSMutableArray *callbacks;
  uint64_t v7;
  NSMutableDictionary *index;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BRNotificationQueue;
  v2 = -[BRNotificationQueue init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 128);
    array = v2->_array;
    v2->_array = (NSMutableArray *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    callbacks = v2->_callbacks;
    v2->_callbacks = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 128);
    index = v2->_index;
    v2->_index = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p updates:%lld>"), objc_opt_class(), self, -[NSMutableArray count](self->_array, "count"));
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_array, "count");
}

- (void)removeAllObjects
{
  uint64_t v3;
  NSMutableDictionary *index;

  v3 = -[NSMutableArray count](self->_array, "count");
  index = self->_index;
  self->_dequeued += v3;
  -[NSMutableDictionary removeAllObjects](index, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_array, "removeAllObjects");
}

- (void)addNotification:(id)a3 asDead:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *index;
  void *v15;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "fileObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKey:](self->_index, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      -[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", objc_msgSend(v8, "unsignedIntegerValue") - self->_dequeued);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "canMerge:", v6))
      {
        objc_msgSend(v10, "merge:", v6);
        if (v4)
          objc_msgSend(v10, "markDead");
        goto LABEL_12;
      }

      if (!v4)
      {
LABEL_11:
        -[NSMutableArray addObject:](self->_array, "addObject:", v6);
        index = self->_index;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dequeued + -[NSMutableArray count](self->_array, "count") - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](index, "setObject:forKey:", v15, v7);

        v9 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v10 = 0;
      if (!v4)
        goto LABEL_11;
    }
    v13 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v13, "markDead");
    v6 = v13;
    goto LABEL_11;
  }
  brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addNotification:asDead:]", 63);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    -[BRNotificationQueue addNotification:asDead:].cold.1((uint64_t)v6, (uint64_t)v11, v12);

LABEL_13:
}

- (void)processDequeueCallbacks
{
  NSMutableArray *v3;
  uint64_t v4;
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
  self->_dequeuedNotificationCount = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_callbacks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      v9 = v6 + v5;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (!(*(unsigned int (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)))
        {
          v9 = v6 + v8;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
LABEL_11:

    if (v9)
      -[NSMutableArray removeObjectsInRange:](self->_callbacks, "removeObjectsInRange:", 0, v9, (_QWORD)v10);
  }
  else
  {

  }
}

- (void)addDequeueCallback:(id)a3
{
  void (**v4)(_QWORD);
  unint64_t dequeued;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableArray *callbacks;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, unint64_t);
  void *v18;
  void (**v19)(_QWORD);
  id v20[2];
  id location;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  BRNotificationQueue *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (-[NSMutableArray count](self->_array, "count") || self->_dequeuedNotificationCount)
  {
    dequeued = self->_dequeued;
    v6 = -[NSMutableArray count](self->_array, "count");
    objc_initWeak(&location, self);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __42__BRNotificationQueue_addDequeueCallback___block_invoke;
    v18 = &unk_1E3DA75F8;
    v20[1] = (id)(v6 + dequeued);
    objc_copyWeak(v20, &location);
    v19 = v4;
    v7 = (void *)MEMORY[0x1A1AD85E4](&v15);
    brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]", 122);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v23 = v7;
      v24 = 2112;
      v25 = self;
      v26 = 2112;
      v27 = v8;
      _os_log_debug_impl(&dword_19CBF0000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Delaying callback %p in %@%@", buf, 0x20u);
    }

    callbacks = self->_callbacks;
    v11 = (void *)MEMORY[0x1A1AD85E4](v7);
    -[NSMutableArray addObject:](callbacks, "addObject:", v11, v15, v16, v17, v18);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]", 125);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)MEMORY[0x1A1AD85E4](v4);
      *(_DWORD *)buf = 134218498;
      v23 = v14;
      v24 = 2112;
      v25 = self;
      v26 = 2112;
      v27 = v12;
      _os_log_debug_impl(&dword_19CBF0000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Firing callback %p right away in %@%@", buf, 0x20u);

    }
    v4[2](v4);
  }

}

BOOL __42__BRNotificationQueue_addDequeueCallback___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 <= a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    brc_bread_crumbs((uint64_t)"-[BRNotificationQueue addDequeueCallback:]_block_invoke", 116);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)MEMORY[0x1A1AD85E4](*(_QWORD *)(a1 + 32));
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 134219010;
      v12 = v9;
      v13 = 2112;
      v14 = WeakRetained;
      v15 = 2048;
      v16 = v10;
      v17 = 2048;
      v18 = a2;
      v19 = 2112;
      v20 = v6;
      _os_log_debug_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Firing delayed callback %p in %@ (%lu vs %lu)%@", (uint8_t *)&v11, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  return v3 <= a2;
}

- (void)_filterIndex:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t dequeued;
  uint64_t i;
  void *v16;
  NSMutableDictionary *index;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray count](self->_array, "count");
  if (objc_msgSend(v4, "count") >= v5)
  {
    -[NSMutableDictionary removeAllObjects](self->_index, "removeAllObjects");
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_array, "objectAtIndex:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        index = self->_index;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i + self->_dequeued);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "fileObjectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](index, "setObject:forKey:", v18, v19);

      }
    }
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "fileObjectID", (_QWORD)v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[NSMutableDictionary objectForKey:](self->_index, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "unsignedIntegerValue");
            dequeued = self->_dequeued;

            if (v13 < dequeued)
              -[NSMutableDictionary removeObjectForKey:](self->_index, "removeObjectForKey:", v11);
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
}

- (void)dequeue:(unint64_t)a3 block:(id)a4
{
  unint64_t v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *array;
  void (**v11)(id, NSMutableArray *);

  v11 = (void (**)(id, NSMutableArray *))a4;
  v6 = -[NSMutableArray count](self->_array, "count");
  if (v6)
  {
    if (v6 <= a3)
    {
      self->_dequeued += v6;
      v8 = self->_array;
      v9 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 128);
      array = self->_array;
      self->_array = v9;

    }
    else
    {
      v7 = (void *)MEMORY[0x1A1AD841C]();
      self->_dequeued += a3;
      -[NSMutableArray subarrayWithRange:](self->_array, "subarrayWithRange:", 0, a3);
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_array, "removeObjectsInRange:", 0, a3);
      objc_autoreleasePoolPop(v7);
    }
    -[BRNotificationQueue _filterIndex:](self, "_filterIndex:", v8);
    self->_dequeuedNotificationCount += -[NSMutableArray count](v8, "count");
    v11[2](v11, v8);

  }
  else
  {
    v11[2](v11, 0);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_array, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_array, 0);
}

- (void)addNotification:(os_log_t)log asDead:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] No object id for update %@%@", (uint8_t *)&v3, 0x16u);
}

@end
