@implementation GEOTaskQueue

- (GEOTaskQueue)init
{
  GEOTaskQueue *v2;
  uint64_t v3;
  geo_isolater *isolation;
  GEOTaskQueue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTaskQueue;
  v2 = -[GEOTaskQueue init](&v7, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolation = v2->_isolation;
    v2->_isolation = (geo_isolater *)v3;

    v5 = v2;
  }

  return v2;
}

- (unint64_t)width
{
  unint64_t width;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock_data();
  width = self->_width;
  _geo_isolate_unlock();

  return width;
}

- (void)setWidth:(unint64_t)a3
{
  geo_isolate_sync_data();
  -[GEOTaskQueue _sendMoreRequestsIfPossible]((uint64_t)self);
}

uint64_t __25__GEOTaskQueue_setWidth___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (void)_sendMoreRequestsIfPossible
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__46;
    v19 = __Block_byref_object_dispose__46;
    v20 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __43__GEOTaskQueue__sendMoreRequestsIfPossible__block_invoke;
    v12 = &unk_1E1BFF920;
    v13 = a1;
    v14 = &v15;
    geo_isolate_sync_data();
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = (id)v16[5];
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v21, 16);
    if (v2)
    {
      v3 = *(_QWORD *)v6;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "runTask", (_QWORD)v5);
        }
        while (v2 != v4);
        v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v21, 16);
      }
      while (v2);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)addTask:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v5 + 24))
    objc_msgSend(v3, "runTask");

  _Block_object_dispose(&v4, 8);
}

uint64_t __24__GEOTaskQueue_addTask___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a1[4];
  if (*(_QWORD *)(v2 + 16))
    v3 = (unint64_t)objc_msgSend(*(id *)(v2 + 24), "count") < *(_QWORD *)(a1[4] + 16);
  else
    v3 = 1;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  v4 = a1[4];
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v5 = *(void **)(v4 + 24);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[4];
      v8 = *(void **)(v7 + 24);
      *(_QWORD *)(v7 + 24) = v6;
      v9 = 24;
LABEL_9:

      v5 = *(void **)(a1[4] + v9);
    }
  }
  else
  {
    v5 = *(void **)(v4 + 32);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      v8 = *(void **)(v11 + 32);
      *(_QWORD *)(v11 + 32) = v10;
      v9 = 32;
      goto LABEL_9;
    }
  }
  return objc_msgSend(v5, "addObject:", a1[5]);
}

- (BOOL)removeTaskIfPending:(id)a3
{
  id v4;
  char v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolation;
  _geo_isolate_lock_data();
  v5 = -[NSMutableArray containsObject:](self->_pending, "containsObject:", v4);
  -[NSMutableArray removeObject:](self->_pending, "removeObject:", v4);
  _geo_isolate_unlock();

  return v5;
}

- (void)taskFinished:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = a3;
  geo_isolate_sync_data();
  if (*((_BYTE *)v6 + 24))
    -[GEOTaskQueue _sendMoreRequestsIfPossible]((uint64_t)self);

  _Block_object_dispose(&v5, 8);
}

uint64_t __29__GEOTaskQueue_taskFinished___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 24), "containsObject:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 24), "removeObject:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 32), "removeObject:", a1[5]);
}

unint64_t __43__GEOTaskQueue__sendMoreRequestsIfPossible__block_invoke(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  v3 = *(_QWORD *)(a1 + 32);
  if (result < *(_QWORD *)(v3 + 16))
  {
    result = objc_msgSend(*(id *)(v3 + 32), "count");
    if (result)
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
      {
        v6 = v5 - objc_msgSend(*(id *)(v4 + 24), "count");
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        v8 = *(_QWORD *)(a1 + 32);
        if (v6 >= v7)
        {
          v10 = objc_msgSend(*(id *)(v8 + 32), "count");
        }
        else
        {
          v9 = *(_QWORD *)(v8 + 16);
          v10 = v9 - objc_msgSend(*(id *)(v8 + 24), "count");
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "subarrayWithRange:", 0, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsInRange:", 0, v10);
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v4 + 32));
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 32);
        *(_QWORD *)(v11 + 32) = 0;

      }
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 24);
        *(_QWORD *)(v18 + 24) = v17;

        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      }
      return objc_msgSend(v16, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_inFlight, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
