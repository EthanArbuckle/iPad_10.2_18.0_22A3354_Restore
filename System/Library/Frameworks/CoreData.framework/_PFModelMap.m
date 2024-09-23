@implementation _PFModelMap

- (void)addManagedObjectModel:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *context;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 32))
      *(_QWORD *)(a1 + 32) = PF_CALLOC_OBJECT_ARRAY(*(_QWORD *)(a1 + 48));
    context = (void *)MEMORY[0x18D76B4E4]();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v4 = *(void **)(a1 + 24);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (!v5)
      goto LABEL_16;
    v6 = *(_QWORD *)v37;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "_modelsReferenceIDOffset");
        if (v10 == objc_msgSend(a2, "_modelsReferenceIDOffset"))
        {
          v11 = objc_msgSend((id)objc_msgSend(v9, "entities"), "count");
          if (v11 != objc_msgSend((id)objc_msgSend(a2, "entities"), "count"))
          {
            v29 = (void *)MEMORY[0x1E0C99DA0];
            v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to register ancillary model with offset %ld but different entity count."), objc_msgSend(v9, "_modelsReferenceIDOffset"));
            objc_exception_throw((id)objc_msgSend(v29, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v30, 0));
          }
          if ((objc_msgSend((id)objc_msgSend(v9, "entityVersionHashesByName"), "isEqual:", objc_msgSend(a2, "entityVersionHashesByName")) & 1) == 0)
          {
            v27 = (void *)MEMORY[0x1E0C99DA0];
            v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to register ancillary model with different version hashes than the currently registered model: %p has hashes\n%@\n%p has hashes\n%@"), v9, objc_msgSend(v9, "entityVersionHashesByName"), a2, objc_msgSend(a2, "entityVersionHashesByName"));
            objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v28, 0));
          }
          v7 = 0;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v5);
    if ((v7 & 1) != 0)
    {
LABEL_16:
      v12 = *(void **)(a1 + 16);
      if (v12)
        v13 = (id)objc_msgSend(v12, "mutableCopy");
      else
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = v13;
      v15 = *(void **)(a1 + 56);
      if (v15)
        v16 = (id)objc_msgSend(v15, "mutableCopy");
      else
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = v16;
      v18 = *(void **)(a1 + 24);
      if (v18)
        v19 = (id)objc_msgSend(v18, "mutableCopy");
      else
        v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = v19;
      objc_msgSend(v19, "addObject:", a2);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(a2);
            v24 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * j);
            v25 = _PFModelMapSlotForEntity(a1, v24);
            objc_msgSend(v17, "setObject:forKey:", v24, _PFModelMapPathForEntity(v24));
            v26 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8 * v25);
            if (v26 != v24)
            {

              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v25) = v24;
            }
            objc_msgSend(v14, "addObject:", v24);
          }
          v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v21);
      }

      *(_QWORD *)(a1 + 24) = objc_msgSend(v20, "copy");
      *(_QWORD *)(a1 + 16) = v14;

      *(_QWORD *)(a1 + 56) = objc_msgSend(v17, "copy");
    }
    objc_autoreleasePoolPop(context);
  }
}

- (_QWORD)initWithClientModel:(_QWORD *)a1
{
  _QWORD *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v2 = a1;
  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a2, "_modelsReferenceIDOffset"))
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Illegal attempt to register a client managed object model with a non-zero offset (%ld).\n%@"), objc_msgSend(a2, "_modelsReferenceIDOffset"), a2), 0));
    }
    v20.receiver = v2;
    v20.super_class = (Class)_PFModelMap;
    v2 = objc_msgSendSuper2(&v20, sel_init);
    if (v2)
    {
      v4 = (void *)MEMORY[0x18D76B4E4]();
      v2[1] = a2;
      v5 = objc_msgSend((id)objc_msgSend(a2, "entitiesByName"), "count");
      v2[5] = v5;
      v2[6] = v5;
      v6 = (void *)objc_msgSend(+[_PFModelMap ancillaryModelFactoryClasses](_PFModelMap, "ancillaryModelFactoryClasses"), "sortedArrayUsingComparator:", &__block_literal_global_18);
      v7 = malloc_type_malloc(8 * objc_msgSend(v6, "count") + 8, 0x100004000313F17uLL);
      v2[8] = v7;
      *v7 = v2[6];
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          v13 = v10;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v6);
            v10 = v13 + 1;
            v14 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "ancillaryEntityCount");
            *(_QWORD *)(v2[8] + 8 * v13 + 8) = v14;
            v2[6] += v14;
            ++v12;
            ++v13;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v9);
      }
      -[_PFModelMap addManagedObjectModel:]((uint64_t)v2, a2);
      objc_autoreleasePoolPop(v4);
    }
  }
  return v2;
}

+ (id)ancillaryModelFactoryClasses
{
  if (qword_1ECD8DAD0 != -1)
    dispatch_once(&qword_1ECD8DAD0, &__block_literal_global_29);
  return (id)_MergedGlobals_82;
}

- (void)dealloc
{
  unint64_t *modelEntityCounts;
  id *indexedEntities;
  unint64_t entityCount;
  unint64_t i;
  id v7;
  objc_super v8;

  self->_clientModel = 0;
  self->_models = 0;
  modelEntityCounts = self->_modelEntityCounts;
  if (modelEntityCounts)
    free(modelEntityCounts);
  indexedEntities = self->_indexedEntities;
  if (indexedEntities)
  {
    entityCount = self->_entityCount;
    if (entityCount)
    {
      for (i = 0; i < entityCount; ++i)
      {
        v7 = self->_indexedEntities[i];
        if (v7)
        {

          self->_indexedEntities[i] = 0;
          entityCount = self->_entityCount;
        }
      }
      indexedEntities = self->_indexedEntities;
    }
    free(indexedEntities);
  }

  self->_allEntities = 0;
  self->_entitiesByPath = 0;
  v8.receiver = self;
  v8.super_class = (Class)_PFModelMap;
  -[_PFModelMap dealloc](&v8, sel_dealloc);
}

- (id)entitiesForContext:(uint64_t)a3 configuration:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a2, "_allowAncillaryEntities"))
  {
    if (a3)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v6 = *(void **)(a1 + 24);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (v11 == *(void **)(a1 + 8))
              v12 = objc_msgSend(v11, "entitiesForConfiguration:", a3);
            else
              v12 = objc_msgSend(v11, "entities");
            objc_msgSend(v5, "addObjectsFromArray:", v12);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }
      v13 = (id)objc_msgSend(v5, "copy");

      return v13;
    }
    v15 = *(id *)(a1 + 16);
  }
  else
  {
    v15 = (id)objc_msgSend(*(id *)(a1 + 8), "entitiesForConfiguration:", a3);
  }
  return v15;
}

- (void)ancillaryEntityWithName:(_QWORD *)a1
{
  unint64_t v3;
  void *v5;

  if (!a1)
    return 0;
  v3 = a1[5];
  if (v3 >= a1[6])
    return 0;
  while (1)
  {
    v5 = *(void **)(a1[4] + 8 * v3);
    if (objc_msgSend((id)objc_msgSend(v5, "name"), "isEqualToString:", a2))
      break;
    if (++v3 >= a1[6])
      return 0;
  }
  return v5;
}

- (void)entityForClassName:(void *)a3 inContext:
{
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t i;
  void *v9;
  void *v10;

  if (!a1)
    return 0;
  v5 = objc_msgSend(a3, "_allowAncillaryEntities");
  v6 = 40;
  if (v5)
    v6 = 48;
  v7 = *(_QWORD *)(a1 + v6);
  if (!v7)
    return 0;
  for (i = 0; i < v7; ++i)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8 * i);
    v10 = (void *)objc_msgSend(v9, "managedObjectClassName");
    if (v10 && objc_msgSend(v10, "isEqualToString:", a2))
      i = *(_QWORD *)(a1 + 48);
    else
      v9 = 0;
  }
  return v9;
}

- (NSManagedObjectModel)clientModel
{
  return self->_clientModel;
}

- (NSArray)allEntities
{
  return self->_allEntities;
}

- (NSDictionary)entitiesByPath
{
  return self->_entitiesByPath;
}

- (unint64_t)clientEntityCount
{
  return self->_clientEntityCount;
}

@end
