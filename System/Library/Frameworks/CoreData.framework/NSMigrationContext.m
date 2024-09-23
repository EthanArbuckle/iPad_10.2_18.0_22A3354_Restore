@implementation NSMigrationContext

- (NSMigrationContext)initWithMigrationManager:(id)a3
{
  NSMigrationContext *v4;
  NSMigrationContext *v5;
  const __CFAllocator *v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSMigrationContext;
  v4 = -[NSMigrationContext init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_migrationManager = (NSMigrationManager *)a3;
    v4->_currentStep = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v4->_bySourceAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5->_byDestinationAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0, v7, v8);
    v5->_byMappingBySourceAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0, v7, v8);
    v5->_byMappingByDestinationAssociationTable = (NSMutableDictionary *)CFDictionaryCreateMutable(v6, 0, v7, v8);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_migrationManager = 0;
  -[NSMigrationContext clearAssociationTables]((uint64_t)self);

  self->_currentMapping = 0;
  self->_currentPropertyMapping = 0;

  self->_destinationConfigurationForCloudKitValidation = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMigrationContext;
  -[NSMigrationContext dealloc](&v3, sel_dealloc);
}

- (void)clearAssociationTables
{
  if (a1)
  {

    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;

    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 56) = 0;
  }
}

- (uint64_t)setCurrentEntityMapping:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    if (*(void **)(result + 48) != a2)
    {
      objc_msgSend(*(id *)(result + 40), "willChangeValueForKey:", CFSTR("currentEntityMapping"));

      *(_QWORD *)(v3 + 48) = a2;
      objc_msgSend(*(id *)(v3 + 40), "didChangeValueForKey:", CFSTR("currentEntityMapping"));
    }
    v4 = *(_QWORD *)(v3 + 56) + 1;
    objc_msgSend(*(id *)(v3 + 40), "willChangeValueForKey:", CFSTR("migrationProgress"));
    *(_QWORD *)(v3 + 56) = v4;
    return objc_msgSend(*(id *)(v3 + 40), "didChangeValueForKey:", CFSTR("migrationProgress"));
  }
  return result;
}

- (uint64_t)setCurrentPropertyMapping:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if (*(void **)(result + 64) != a2)
    {
      objc_msgSend(*(id *)(result + 40), "willChangeValueForKey:", CFSTR("currentPropertyMapping"));

      *(_QWORD *)(v3 + 64) = a2;
      return objc_msgSend(*(id *)(v3 + 40), "didChangeValueForKey:", CFSTR("currentPropertyMapping"));
    }
  }
  return result;
}

- (uint64_t)_createAssociationsBySource:(uint64_t)a3 withDestination:(void *)a4 forEntityMapping:
{
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  id v9;
  id v10;

  if (result)
  {
    v7 = result;
    Mutable = (CFMutableDictionaryRef)objc_msgSend(*(id *)(result + 24), "objectForKey:", objc_msgSend(a4, "name"));
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      objc_msgSend(*(id *)(v7 + 24), "setObject:forKey:", Mutable, objc_msgSend(a4, "name"));

    }
    v9 = (id)-[__CFDictionary objectForKey:](Mutable, "objectForKey:", a2);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      CFDictionarySetValue(Mutable, a2, v9);

    }
    objc_msgSend(v9, "addObject:", a3);
    v10 = (id)objc_msgSend(*(id *)(v7 + 8), "objectForKey:", a2);
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 8), a2, v10);

    }
    return objc_msgSend(v10, "addObject:", a3);
  }
  return result;
}

- (uint64_t)_createAssociationsByDestination:(uint64_t)a3 fromSource:(void *)a4 forEntityMapping:
{
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  id v9;
  id v10;

  if (result)
  {
    v7 = result;
    Mutable = (CFMutableDictionaryRef)objc_msgSend(*(id *)(result + 32), "objectForKey:", objc_msgSend(a4, "name"));
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      objc_msgSend(*(id *)(v7 + 32), "setObject:forKey:", Mutable, objc_msgSend(a4, "name"));

    }
    v9 = (id)-[__CFDictionary objectForKey:](Mutable, "objectForKey:", a2);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      CFDictionarySetValue(Mutable, a2, v9);

    }
    objc_msgSend(v9, "addObject:", a3);
    v10 = (id)objc_msgSend(*(id *)(v7 + 16), "objectForKey:", a2);
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v7 + 16), a2, v10);

    }
    return objc_msgSend(v10, "addObject:", a3);
  }
  return result;
}

- (uint64_t)associateSourceInstance:(const void *)a3 withDestinationInstance:(void *)a4 forEntityMapping:
{
  uint64_t v7;

  if (result)
  {
    v7 = result;
    -[NSMigrationContext _createAssociationsBySource:withDestination:forEntityMapping:](result, a2, (uint64_t)a3, a4);
    return -[NSMigrationContext _createAssociationsByDestination:fromSource:forEntityMapping:](v7, a3, (uint64_t)a2, a4);
  }
  return result;
}

- (id)destinationInstancesForEntityMapping:(uint64_t)a3 sourceInstance:
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (a2)
    {
      if (!a3)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = (void *)objc_msgSend((id)objc_msgSend(v5[3], "objectForKey:", objc_msgSend(a2, "name")), "allValues");
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v10);
        }
        goto LABEL_7;
      }
      v6 = (id)objc_msgSend(result[3], "objectForKey:", objc_msgSend(a2, "name"));
    }
    else
    {
      v6 = result[1];
    }
    v7 = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", a3), "copy");
LABEL_7:
    if (v7)
      return (id *)v7;
    else
      return (id *)NSArray_EmptyArray;
  }
  return result;
}

- (id)sourceInstancesForEntityMapping:(uint64_t)a3 destinationInstance:
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (a2)
    {
      if (!a3)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = (void *)objc_msgSend((id)objc_msgSend(v5[4], "objectForKey:", objc_msgSend(a2, "name")), "allValues");
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v10);
        }
        goto LABEL_7;
      }
      v6 = (id)objc_msgSend(result[4], "objectForKey:", objc_msgSend(a2, "name"));
    }
    else
    {
      v6 = result[2];
    }
    v7 = (id)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", a3), "copy");
LABEL_7:
    if (v7)
      return (id *)v7;
    else
      return (id *)NSArray_EmptyArray;
  }
  return result;
}

@end
