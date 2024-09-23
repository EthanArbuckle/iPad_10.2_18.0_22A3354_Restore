@implementation NSSQLiteStatementCache

- (NSSQLiteStatementCache)initWithEntity:(id)a3
{
  NSSQLiteStatementCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLiteStatementCache;
  v4 = -[NSSQLiteStatementCache init](&v6, sel_init);
  if (v4)
    v4->_entity = (NSSQLEntity *)a3;
  return v4;
}

- (void)cacheFaultingStatement:(uint64_t)a3 andFetchRequest:(void *)a4 forRelationship:
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = objc_msgSend(a4, "name");
    v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v7);
    v9 = (unint64_t)objc_msgSend(v8, "count") < 2 ? 0 : (void *)objc_msgSend(v8, "objectAtIndex:", 0);
    if (v9 != a2)
    {
      -[NSSQLiteStatement clearCaches:](v9, 1);
      v10 = *(void **)(a1 + 48);
      if (a2)
      {
        if (!v10)
          *(_QWORD *)(a1 + 48) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12[0] = a2;
        v12[1] = a3;
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v12, 2);
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v11, v7);

      }
      else
      {
        objc_msgSend(v10, "removeObjectForKey:", v7);
      }
    }
  }
}

- (_QWORD)cacheDeletionStatement:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[4];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[4] = result;
    }
  }
  return result;
}

- (void)_clearSaveGeneratedCachedStatements
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
      -[NSSQLiteStatementCache cacheInsertStatement:]((_QWORD *)a1, 0);
    if (*(_QWORD *)(a1 + 24))
      -[NSSQLiteStatementCache cacheBatchInsertStatement:]((_QWORD *)a1, 0);
    if (*(_QWORD *)(a1 + 32))
      -[NSSQLiteStatementCache cacheDeletionStatement:]((_QWORD *)a1, 0);
    v2 = *(void **)(a1 + 56);
    if (v2)
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v3 = (void *)objc_msgSend(v2, "allValues");
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v49;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v49 != v6)
              objc_enumerationMutation(v3);
            -[NSSQLiteStatement clearCaches:](*(void **)(*((_QWORD *)&v48 + 1) + 8 * v7++), 1);
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v5);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
    }
    v8 = *(void **)(a1 + 72);
    if (v8)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v9 = (void *)objc_msgSend(v8, "allValues");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v45;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v45 != v12)
              objc_enumerationMutation(v9);
            -[NSSQLiteStatement clearCaches:](*(void **)(*((_QWORD *)&v44 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v11);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    }
    v14 = *(void **)(a1 + 80);
    if (v14)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = (void *)objc_msgSend(v14, "allValues");
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v41;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v41 != v18)
              objc_enumerationMutation(v15);
            -[NSSQLiteStatement clearCaches:](*(void **)(*((_QWORD *)&v40 + 1) + 8 * v19++), 1);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
        }
        while (v17);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 80));
    }
    v20 = *(void **)(a1 + 88);
    if (v20)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v21 = (void *)objc_msgSend(v20, "allValues");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v37;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v21);
            -[NSSQLiteStatement clearCaches:](*(void **)(*((_QWORD *)&v36 + 1) + 8 * v25++), 1);
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
        }
        while (v23);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 88));
    }
    v26 = *(void **)(a1 + 64);
    if (v26)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v27 = (void *)objc_msgSend(v26, "allValues", 0);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v33;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v33 != v30)
              objc_enumerationMutation(v27);
            -[NSSQLiteStatement clearCaches:](*(void **)(*((_QWORD *)&v32 + 1) + 8 * v31++), 1);
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
        }
        while (v29);
      }
      CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 64));
    }
  }
}

- (_QWORD)cacheInsertStatement:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[2];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[2] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  __CFDictionary *correlationInsertCache;
  __CFDictionary *correlationMasterReorderCache;
  __CFDictionary *correlationMasterReorderCachePart2;
  __CFDictionary *correlationReorderCache;
  __CFDictionary *correlationDeleteCache;
  objc_super v8;

  -[NSSQLiteStatementCache clearCachedStatements]((uint64_t)self);

  correlationInsertCache = self->_correlationInsertCache;
  if (correlationInsertCache)
    CFRelease(correlationInsertCache);
  correlationMasterReorderCache = self->_correlationMasterReorderCache;
  if (correlationMasterReorderCache)
    CFRelease(correlationMasterReorderCache);
  correlationMasterReorderCachePart2 = self->_correlationMasterReorderCachePart2;
  if (correlationMasterReorderCachePart2)
    CFRelease(correlationMasterReorderCachePart2);
  correlationReorderCache = self->_correlationReorderCache;
  if (correlationReorderCache)
    CFRelease(correlationReorderCache);
  correlationDeleteCache = self->_correlationDeleteCache;
  if (correlationDeleteCache)
    CFRelease(correlationDeleteCache);
  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteStatementCache;
  -[NSSQLiteStatementCache dealloc](&v8, sel_dealloc);
}

- (void)clearCachedStatements
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[NSSQLiteStatementCache _clearSaveGeneratedCachedStatements](a1);
    if (*(_QWORD *)(a1 + 40))
      -[NSSQLiteStatementCache cacheFaultingStatement:]((_QWORD *)a1, 0);
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v10;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v10 != v5)
              objc_enumerationMutation(v2);
            v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
            v8 = (void *)objc_msgSend(v7, "count");
            if (v8)
              v8 = (void *)objc_msgSend(v7, "objectAtIndex:", 0);
            -[NSSQLiteStatement clearCaches:](v8, 1);
            ++v6;
          }
          while (v4 != v6);
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v4);
      }
      objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
    }
  }
}

- (_QWORD)cacheFaultingStatement:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[5];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[5] = result;
    }
  }
  return result;
}

- (_QWORD)cacheBatchInsertStatement:(_QWORD *)result
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)result[3];
    if (result != a2)
    {
      -[NSSQLiteStatement clearCaches:](result, 1);

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (CFMutableDictionaryRef)createCorrelationCacheDictionary
{
  CFStringRef (__cdecl *v1)(const void *);
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;

  if (result)
  {
    keyCallBacks.version = *MEMORY[0x1E0C9B390];
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B390] + 8);
    v1 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 24);
    keyCallBacks.equal = 0;
    keyCallBacks.hash = 0;
    keyCallBacks.copyDescription = v1;
    valueCallBacks.version = *MEMORY[0x1E0C9B3A0];
    *(_OWORD *)&valueCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 8);
    valueCallBacks.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E0C9B3A0] + 24);
    valueCallBacks.equal = 0;
    return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, &valueCallBacks);
  }
  return result;
}

- (void)insertOrReplaceStatement:(void *)key forRelationship:(CFDictionaryRef)theDict inDictionary:
{
  void *Value;

  if (a1)
  {
    Value = (void *)CFDictionaryGetValue(theDict, key);
    if (Value)
      -[NSSQLiteStatement clearCaches:](Value, 1);
    CFDictionarySetValue(theDict, key, a2);
  }
}

- (void)cacheCorrelationInsertStatement:(void *)key forRelationship:
{
  const __CFDictionary *v6;

  if (a1)
  {
    v6 = (const __CFDictionary *)*((_QWORD *)a1 + 7);
    if (!v6)
    {
      v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((_QWORD *)a1 + 7) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationMasterReorderStatement:(void *)key forRelationship:
{
  const __CFDictionary *v6;

  if (a1)
  {
    v6 = (const __CFDictionary *)*((_QWORD *)a1 + 9);
    if (!v6)
    {
      v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((_QWORD *)a1 + 9) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationReorderStatement:(void *)key forRelationship:
{
  const __CFDictionary *v6;

  if (a1)
  {
    v6 = (const __CFDictionary *)*((_QWORD *)a1 + 11);
    if (!v6)
    {
      v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((_QWORD *)a1 + 11) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

- (void)cacheCorrelationDeleteStatement:(void *)key forRelationship:
{
  const __CFDictionary *v6;

  if (a1)
  {
    v6 = (const __CFDictionary *)*((_QWORD *)a1 + 8);
    if (!v6)
    {
      v6 = -[NSSQLiteStatementCache createCorrelationCacheDictionary](a1);
      *((_QWORD *)a1 + 8) = v6;
    }
    -[NSSQLiteStatementCache insertOrReplaceStatement:forRelationship:inDictionary:]((uint64_t)a1, a2, key, v6);
  }
}

@end
