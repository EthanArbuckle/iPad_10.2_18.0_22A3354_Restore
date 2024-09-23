@implementation NSConstraintValidator

- (uint64_t)reset
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  void *v5;
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
  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 24))
    {
      result = objc_msgSend(*(id *)(result + 16), "count");
      if (result)
      {
        v2 = result;
        for (i = 0; i != v2; ++i)
        {
          v4 = *(_QWORD *)(v1 + 24);
          if (*(_QWORD *)(v4 + 8 * i))
          {
            v11 = 0u;
            v12 = 0u;
            v9 = 0u;
            v10 = 0u;
            v5 = *(void **)(v4 + 8 * i);
            result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
            if (result)
            {
              v6 = result;
              v7 = *(_QWORD *)v10;
              do
              {
                v8 = 0;
                do
                {
                  if (*(_QWORD *)v10 != v7)
                    objc_enumerationMutation(v5);
                  -[NSConstraintCache reset](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
                }
                while (v6 != v8);
                result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
                v6 = result;
              }
              while (result);
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t i;
  id v6;
  objc_super v7;

  if (self->_cachesByEntity)
  {
    v3 = -[NSArray count](self->_entities, "count");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)
      {
        v6 = self->_cachesByEntity[i];
        if (v6)
        {

          self->_cachesByEntity[i] = 0;
        }
      }
    }
    PF_FREE_OBJECT_ARRAY(self->_cachesByEntity);
  }

  self->_modelMap = 0;
  self->_entities = 0;
  v7.receiver = self;
  v7.super_class = (Class)NSConstraintValidator;
  -[NSConstraintValidator dealloc](&v7, sel_dealloc);
}

- (id)initWithManagedObjectContext:(void *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)NSConstraintValidator;
  v3 = objc_msgSendSuper2(&v18, sel_init);
  if (v3)
  {
    v4 = objc_msgSend(a2, "persistentStoreCoordinator");
    v5 = v4 ? *(void **)(v4 + 96) : 0;
    v6 = v5;
    *((_QWORD *)v3 + 1) = v6;
    v7 = -[_PFModelMap entitiesForContext:configuration:]((uint64_t)v6, a2, 0);
    *((_QWORD *)v3 + 2) = v7;
    *((_QWORD *)v3 + 3) = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[NSEntityDescription _hasUniqueProperties]((_BOOL8)v12))
          {
            if (!*((_QWORD *)v3 + 3))
              *((_QWORD *)v3 + 3) = PF_CALLOC_OBJECT_ARRAY(objc_msgSend(*((id *)v3 + 2), "count"));
            +[NSConstraintCache createCachesForEntity:forValidator:]((uint64_t)NSConstraintCache, v12, (uint64_t)v3);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }
  }
  return v3;
}

- (uint64_t)_addConstraintRoot:(_QWORD *)a3 forEntity:
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (result)
  {
    v4 = result;
    v5 = _PFModelMapSlotForEntity(*(_QWORD *)(result + 8), a3);
    v6 = *(id *)(*(_QWORD *)(v4 + 24) + 8 * v5);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(*(_QWORD *)(v4 + 24) + 8 * v5) = v6;
    }
    return objc_msgSend(v6, "addObject:", a2);
  }
  return result;
}

- (uint64_t)validateForSave
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  _QWORD *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v1 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (*(_QWORD *)(v1 + 24))
    {
      v3 = objc_msgSend(*(id *)(v1 + 16), "count");
      if (v3)
      {
        v4 = v3;
        for (i = 0; i != v4; ++i)
        {
          v6 = *(_QWORD *)(v1 + 24);
          if (*(_QWORD *)(v6 + 8 * i))
          {
            v17 = 0u;
            v18 = 0u;
            v15 = 0u;
            v16 = 0u;
            v7 = *(void **)(v6 + 8 * i);
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v16;
              do
              {
                for (j = 0; j != v9; ++j)
                {
                  if (*(_QWORD *)v16 != v10)
                    objc_enumerationMutation(v7);
                  v12 = -[NSConstraintCache validateForSave:](*(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * j), 0);
                  if (objc_msgSend(v12, "count"))
                    objc_msgSend(v2, "addObjectsFromArray:", v12);
                }
                v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
              }
              while (v9);
            }
          }
        }
      }
    }
    if (objc_msgSend(v2, "count"))
    {
      v13 = *MEMORY[0x1E0CB28A8];
      v19 = CFSTR("Conflicts");
      v20 = v2;
      v1 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v13, 1551, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)registerObjects:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 24))
    {
      v9 = 0u;
      v10 = 0u;
      v7 = 0u;
      v8 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (result)
      {
        v4 = result;
        v5 = *(_QWORD *)v8;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v8 != v5)
              objc_enumerationMutation(a2);
            -[NSConstraintValidator registerObject:](v2, *(void **)(*((_QWORD *)&v7 + 1) + 8 * v6++));
          }
          while (v4 != v6);
          result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
          v4 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)registerObject:(uint64_t)result
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend(a2, "entity");
    if (result)
    {
      v4 = (_QWORD *)result;
      do
      {
        v5 = *(_QWORD *)(v3 + 24);
        v6 = *(void **)(v5 + 8 * _PFModelMapSlotForEntity(*(_QWORD *)(v3 + 8), v4));
        if (v6)
        {
          v13 = 0u;
          v14 = 0u;
          v11 = 0u;
          v12 = 0u;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v12;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v12 != v9)
                  objc_enumerationMutation(v6);
                -[NSConstraintCache registerObject:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a2);
              }
              while (v8 != v10);
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
            }
            while (v8);
          }
        }
        result = objc_msgSend(v4, "superentity");
        v4 = (_QWORD *)result;
      }
      while (result);
    }
  }
  return result;
}

@end
