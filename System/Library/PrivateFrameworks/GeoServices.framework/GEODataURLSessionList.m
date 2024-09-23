@implementation GEODataURLSessionList

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)MEMORY[0x18D764E2C]();
    -[NSMapTable objectForKey:](self->_pendingInvalidationGroups, "objectForKey:", v9);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMapTable removeObjectForKey:](self->_pendingInvalidationGroups, "removeObjectForKey:", v9);
      dispatch_group_leave(v8);
    }

    objc_autoreleasePoolPop(v7);
  }

}

void __69__GEODataURLSessionList_pruneSessionsNotInIdentifierArray_agressive___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t IdentifierFromSession;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (*(_BYTE *)(a1 + 64))
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 40)) != -1;
  IdentifierFromSession = GEODataURLSessionGetIdentifierFromSession(v11);
  if ((_DWORD)IdentifierFromSession)
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", IdentifierFromSession);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v9, "containsObject:", v10);

    if (((v7 | v9) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", a3);
  }

}

- (id)urlSessionForRequest:(id)a3
{
  id v4;
  NSMutableArray *urlSessions;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  GEODataURLSessionList *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__34;
  v17 = __Block_byref_object_dispose__34;
  v18 = 0;
  urlSessions = self->_urlSessions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__GEODataURLSessionList_urlSessionForRequest___block_invoke;
  v9[3] = &unk_1E1C09300;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](urlSessions, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)pruneSessionsNotInIdentifierArray:(id)a3 agressive:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *urlSessions;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x18D764E2C]();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -900.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  urlSessions = self->_urlSessions;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__GEODataURLSessionList_pruneSessionsNotInIdentifierArray_agressive___block_invoke;
  v16[3] = &unk_1E1C09328;
  v19 = a4;
  v16[4] = self;
  v16[5] = v8;
  v11 = v6;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](urlSessions, "enumerateObjectsUsingBlock:", v16);
  -[NSMutableArray objectsAtIndexes:](self->_urlSessions, "objectsAtIndexes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_urlSessions, "removeObjectsAtIndexes:", v12);
  -[NSMutableArray removeObjectsAtIndexes:](self->_lastUsedDates, "removeObjectsAtIndexes:", v12);
  objc_msgSend(v13, "makeObjectsPerformSelector:", sel_invalidateAndCancel);
  if (objc_msgSend(v12, "count"))
  {
    GEOGetDataSessionURLLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v15;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_INFO, "Pruned %zu underlying sessions", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v7);

}

- (void)addSession:(id)a3
{
  NSMutableArray *lastUsedDates;
  id v5;

  -[NSMutableArray addObject:](self->_urlSessions, "addObject:", a3);
  lastUsedDates = self->_lastUsedDates;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](lastUsedDates, "addObject:", v5);

}

void __46__GEODataURLSessionList_urlSessionForRequest___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "geo_isCompatibleWithRequest:", a1[4]);

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    v8 = *(void **)(a1[5] + 16);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v9);

  }
}

- (GEODataURLSessionList)init
{
  GEODataURLSessionList *v2;
  uint64_t v3;
  NSMutableArray *urlSessions;
  uint64_t v5;
  NSMutableArray *lastUsedDates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEODataURLSessionList;
  v2 = -[GEODataURLSessionList init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v3 = objc_claimAutoreleasedReturnValue();
    urlSessions = v2->_urlSessions;
    v2->_urlSessions = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v5 = objc_claimAutoreleasedReturnValue();
    lastUsedDates = v2->_lastUsedDates;
    v2->_lastUsedDates = (NSMutableArray *)v5;

  }
  return v2;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_urlSessions, "count");
}

- (id)urlSessionForIdentifier:(id)a3
{
  id v4;
  NSMutableArray *urlSessions;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  GEODataURLSessionList *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__34;
  v17 = __Block_byref_object_dispose__34;
  v18 = 0;
  urlSessions = self->_urlSessions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__GEODataURLSessionList_urlSessionForIdentifier___block_invoke;
  v9[3] = &unk_1E1C09300;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](urlSessions, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__GEODataURLSessionList_urlSessionForIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", a1[4]);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    v9 = *(void **)(a1[5] + 16);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", a3, v10);

  }
}

- (void)finishTasksAndInvalidateSessionsMatching:(id)a3 group:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *urlSessions;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMapTable *pendingInvalidationGroups;
  NSMapTable *v19;
  NSMapTable *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x18D764E2C]();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  urlSessions = self->_urlSessions;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __72__GEODataURLSessionList_finishTasksAndInvalidateSessionsMatching_group___block_invoke;
  v29[3] = &unk_1E1C09350;
  v23 = v6;
  v31 = v23;
  v10 = v8;
  v30 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](urlSessions, "enumerateObjectsUsingBlock:", v29);
  -[NSMutableArray objectsAtIndexes:](self->_urlSessions, "objectsAtIndexes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_urlSessions, "removeObjectsAtIndexes:", v10);
  -[NSMutableArray removeObjectsAtIndexes:](self->_lastUsedDates, "removeObjectsAtIndexes:", v10);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        if (v7)
        {
          dispatch_group_enter(v7);
          pendingInvalidationGroups = self->_pendingInvalidationGroups;
          if (!pendingInvalidationGroups)
          {
            v19 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v12, "count", v23));
            v20 = self->_pendingInvalidationGroups;
            self->_pendingInvalidationGroups = v19;

            pendingInvalidationGroups = self->_pendingInvalidationGroups;
          }
          -[NSMapTable setObject:forKey:](pendingInvalidationGroups, "setObject:forKey:", v7, v17, v23);
        }
        objc_msgSend(v17, "finishTasksAndInvalidate", v23);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v10, "count"))
  {
    GEOGetDataSessionURLLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v22;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "Pruned %zu underlying sessions", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(context);

}

uint64_t __72__GEODataURLSessionList_finishTasksAndInvalidateSessionsMatching_group___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvalidationGroups, 0);
  objc_storeStrong((id *)&self->_lastUsedDates, 0);
  objc_storeStrong((id *)&self->_urlSessions, 0);
}

@end
