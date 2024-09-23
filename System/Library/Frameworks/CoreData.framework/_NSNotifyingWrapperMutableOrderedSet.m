@implementation _NSNotifyingWrapperMutableOrderedSet

- (unint64_t)count
{
  return -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length;
  _BOOL4 v9;
  NSFetchRequest *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _DWORD *v20;
  int v21;
  BOOL v22;
  void *v23;
  char v24;
  int v25;
  _QWORD v26[2];
  unint64_t v27;
  id v28;
  NSUInteger location;
  objc_super v30;
  uint64_t v31;

  length = a3.length;
  location = a3.location;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = -[NSManagedObject hasFaultForRelationshipNamed:](self->_container, "hasFaultForRelationshipNamed:", self->_key);
  v27 = a4;
  v28 = a5;
  if (v9)
  {
    v10 = objc_alloc_init(NSFetchRequest);
    -[NSFetchRequest setEntity:](v10, "setEntity:", -[NSManagedObject entity](self->_container, "entity"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v10, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_key));
    -[NSFetchRequest setPredicate:](v10, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), -[NSManagedObject objectID](self->_container, "objectID")));
    -[NSFetchRequest setReturnsObjectsAsFaults:](v10, "setReturnsObjectsAsFaults:", 0);
    -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0);
    if (!v10)
      goto LABEL_34;
LABEL_33:
    -[NSManagedObjectContext executeFetchRequest:error:](-[NSManagedObject managedObjectContext](self->_container, "managedObjectContext"), "executeFetchRequest:error:", v10, 0);
    goto LABEL_34;
  }
  v11 = -[NSManagedObject valueForKey:](self->_container, "valueForKey:", self->_key);
  v12 = objc_msgSend(v11, "count");
  if (length == 0x7FFFFFFFFFFFFFFFLL)
    length = v12;
  if (v12)
  {
    v13 = v12;
    v26[1] = v26;
    v14 = v12 >= 0x201 ? 1 : v12;
    v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
    v16 = (char *)v26 - v15;
    if (v12 > 0x200)
      v16 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v26 - v15, 8 * v12);
    objc_msgSend(v11, "getObjects:", v16);
    if (location >= v13 + location)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 8 * location;
      v19 = v13;
      do
      {
        v20 = *(_DWORD **)&v16[v18];
        v21 = (v20[4] >> 15) & 7;
        if (v21)
          v22 = v21 == 5;
        else
          v22 = 1;
        if (!v22)
        {
          v23 = (void *)objc_msgSend(v20, "objectID");
          v24 = objc_msgSend(v23, "isTemporaryID");
          if ((v24 & 1) == 0)
            *(_QWORD *)&v16[8 * v17++] = v23;
        }
        v18 += 8;
        --v19;
      }
      while (v19);
      if (v17)
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v16, v17);
    }
    if (v13 >= 0x201)
      NSZoneFree(0, v16);
    if (objc_msgSend((id)v17, "count"))
    {
      v10 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v10, "setEntity:", objc_msgSend(-[NSDictionary objectForKey:](-[NSEntityDescription relationshipsByName](-[NSManagedObject entity](self->_container, "entity"), "relationshipsByName"), "objectForKey:", self->_key), "destinationEntity"));
      -[NSFetchRequest setPredicate:](v10, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v17));
      -[NSFetchRequest setReturnsObjectsAsFaults:](v10, "setReturnsObjectsAsFaults:", 0);
      -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0);
    }
    else
    {
      v10 = 0;
    }

    if (v10)
      goto LABEL_33;
  }
LABEL_34:
  v25 = -[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange");
  if (v25)
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1);
  if (length == 0x7FFFFFFFFFFFFFFFLL)
    length = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
  v30.receiver = self;
  v30.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:](&v30, sel_sortRange_options_usingComparator_, location, length, v27, v28);
  if (v25)
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", a3, a4.location, a4.length);
}

- (void)sortUsingComparator:(id)a3
{
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, a3);
}

- (void)insertObjects:(id *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v9;

  if (a4)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", a5, a4);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 2, v9, self->_key);
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self->_mutableOrderedSet, "insertObjects:count:atIndex:", a3, a4, a5);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 2, v9, self->_key);

  }
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", a3.location, a3.length);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v6, self->_key);
    -[NSMutableOrderedSet removeObjectsInRange:](self->_mutableOrderedSet, "removeObjectsInRange:", location, length);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v6, self->_key);

  }
}

- (_NSNotifyingWrapperMutableOrderedSet)initWithContainer:(id)a3 key:(id)a4 mutableOrderedSet:(id)a5
{
  _NSNotifyingWrapperMutableOrderedSet *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  v8 = -[_NSNotifyingWrapperMutableOrderedSet init](&v10, sel_init);
  if (v8)
  {
    v8->_container = (NSManagedObject *)a3;
    v8->_key = (NSString *)objc_msgSend(a4, "copy");
    v8->_mutableOrderedSet = (NSMutableOrderedSet *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_container = 0;
  self->_key = 0;

  self->_mutableOrderedSet = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet dealloc](&v3, sel_dealloc);
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  const void **v14;
  const __CFAllocator *v15;
  const __CFSet *v16;
  const __CFSet *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  BOOL v21;
  _QWORD v22[2];
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  length = a3.length;
  location = a3.location;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = -[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange");
  if ((_DWORD)v10)
    v11 = length == a5;
  else
    v11 = 0;
  if (!v11)
    goto LABEL_23;
  v22[1] = v22;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0uLL;
  v27 = 0uLL;
  v24 = 0uLL;
  v25 = 0uLL;
  MEMORY[0x1E0C80A78](v10);
  v14 = (const void **)((char *)v22 - v13);
  if (a5 > 0x200)
    v14 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)v22 - v13, 8 * v12);
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v14, location, length);
  v15 = _PFStackAllocatorCreate((unint64_t *)&v24, 1024);
  v16 = CFSetCreate(v15, v14, a5, 0);
  v17 = v16;
  if (a5)
  {
    if (CFSetContainsValue(v16, *a4))
    {
      v18 = 1;
      do
      {
        v19 = v18;
        if (a5 == v18)
          break;
        v20 = CFSetContainsValue(v17, a4[v18]);
        v18 = v19 + 1;
      }
      while (v20);
      v21 = v19 < a5;
    }
    else
    {
      v21 = 1;
    }
    if (a5 >= 0x201)
      NSZoneFree(0, v14);
  }
  else
  {
    v21 = 0;
  }
  if (*((_QWORD *)&v25 + 1))
  {
    if (v17)
      CFRelease(v17);
    if (v21)
      goto LABEL_23;
  }
  else
  {
    *((_QWORD *)&v24 + 1) = v24;
    if (v21)
    {
LABEL_23:
      v23.receiver = self;
      v23.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
      -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:](&v23, sel_replaceObjectsInRange_withObjects_count_, location, length, a4, a5);
      return;
    }
  }
  -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1);
  v23.receiver = self;
  v23.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsInRange:withObjects:count:](&v23, sel_replaceObjectsInRange_withObjects_count_, location, length, a4, a5);
  -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithOrderedSet:copyItems:", self->_mutableOrderedSet, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:copyItems:", self->_mutableOrderedSet, 0);
}

- (id)allObjects
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
  v4 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v10 - v6;
  if (v4 > 0x200)
    v7 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v10 - v6, 8 * v5);
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", v7, 0, v3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v3);
  if (v3 >= 0x201)
    NSZoneFree(0, v7);
  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", a3);
}

- (void)getObjects:(id *)a3
{
  -[NSMutableOrderedSet getObjects:range:](self->_mutableOrderedSet, "getObjects:range:", a3, 0, -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
}

- (id)objectsAtIndexes:(id)a3
{
  return (id)-[NSMutableOrderedSet objectsAtIndexes:](self->_mutableOrderedSet, "objectsAtIndexes:", a3);
}

- (id)firstObject
{
  return (id)-[NSMutableOrderedSet firstObject](self->_mutableOrderedSet, "firstObject");
}

- (id)lastObject
{
  return (id)-[NSMutableOrderedSet lastObject](self->_mutableOrderedSet, "lastObject");
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet isEqualToOrderedSet:](self->_mutableOrderedSet, "isEqualToOrderedSet:", a3);
}

- (BOOL)containsObject:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:", a3);
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet intersectsOrderedSet:](self->_mutableOrderedSet, "intersectsOrderedSet:", a3);
}

- (BOOL)intersectsSet:(id)a3
{
  return -[NSMutableOrderedSet intersectsSet:](self->_mutableOrderedSet, "intersectsSet:", a3);
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return -[NSMutableOrderedSet isSubsetOfSet:](self->_mutableOrderedSet, "isSubsetOfSet:", a3);
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  return -[NSMutableOrderedSet isSubsetOfOrderedSet:](self->_mutableOrderedSet, "isSubsetOfOrderedSet:", a3);
}

- (id)objectEnumerator
{
  return (id)-[NSMutableOrderedSet objectEnumerator](self->_mutableOrderedSet, "objectEnumerator");
}

- (id)reverseObjectEnumerator
{
  return (id)-[NSMutableOrderedSet reverseObjectEnumerator](self->_mutableOrderedSet, "reverseObjectEnumerator");
}

- (id)reversedOrderedSet
{
  return (id)-[NSMutableOrderedSet reversedOrderedSet](self->_mutableOrderedSet, "reversedOrderedSet");
}

- (id)array
{
  return (id)-[NSMutableOrderedSet array](self->_mutableOrderedSet, "array");
}

- (id)set
{
  return (id)-[NSMutableOrderedSet set](self->_mutableOrderedSet, "set");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](self->_mutableOrderedSet, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableOrderedSet enumerateObjectsWithOptions:usingBlock:](self->_mutableOrderedSet, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  -[NSMutableOrderedSet enumerateObjectsAtIndexes:options:usingBlock:](self->_mutableOrderedSet, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, a5);
}

- (unint64_t)indexOfObjectPassingTest:(id)a3
{
  return -[NSMutableOrderedSet indexOfObjectPassingTest:](self->_mutableOrderedSet, "indexOfObjectPassingTest:", a3);
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSMutableOrderedSet indexOfObjectWithOptions:passingTest:](self->_mutableOrderedSet, "indexOfObjectWithOptions:passingTest:", a3, a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSMutableOrderedSet indexOfObjectAtIndexes:options:passingTest:](self->_mutableOrderedSet, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)indexesOfObjectsPassingTest:(id)a3
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsPassingTest:](self->_mutableOrderedSet, "indexesOfObjectsPassingTest:", a3);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsWithOptions:passingTest:](self->_mutableOrderedSet, "indexesOfObjectsWithOptions:passingTest:", a3, a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return (id)-[NSMutableOrderedSet indexesOfObjectsAtIndexes:options:passingTest:](self->_mutableOrderedSet, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5);
}

- (unint64_t)indexOfObject:(id)a3 inSortedRange:(_NSRange)a4 options:(unint64_t)a5 usingComparator:(id)a6
{
  return -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](self->_mutableOrderedSet, "indexOfObject:inSortedRange:options:usingComparator:", a3, a4.location, a4.length, a5, a6);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return (id)-[NSMutableOrderedSet sortedArrayUsingComparator:](self->_mutableOrderedSet, "sortedArrayUsingComparator:", a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return (id)-[NSMutableOrderedSet sortedArrayWithOptions:usingComparator:](self->_mutableOrderedSet, "sortedArrayWithOptions:usingComparator:", a3, a4);
}

- (id)description
{
  return (id)-[NSMutableOrderedSet description](self->_mutableOrderedSet, "description");
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)-[NSMutableOrderedSet descriptionWithLocale:](self->_mutableOrderedSet, "descriptionWithLocale:", a3);
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  return (id)-[NSMutableOrderedSet descriptionWithLocale:indent:](self->_mutableOrderedSet, "descriptionWithLocale:indent:", a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[NSMutableOrderedSet setValue:forKey:](self->_mutableOrderedSet, "setValue:forKey:", a3, a4);
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableOrderedSet valueForKey:](self->_mutableOrderedSet, "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  return (id)-[NSMutableOrderedSet valueForKeyPath:](self->_mutableOrderedSet, "valueForKeyPath:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](self->_mutableOrderedSet, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  int v7;
  void *v8;

  if (-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:")
    && -[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    v7 = 1;
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a4);
  -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 2, v8, self->_key);
  -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableOrderedSet, "insertObject:atIndex:", a3, a4);
  -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 2, v8, self->_key);

  if (v7)
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
  -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_mutableOrderedSet, "removeObjectAtIndex:", a3);
  -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v7;

  if ((objc_msgSend(a4, "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_mutableOrderedSet, "objectAtIndex:")) & 1) == 0)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", a3);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 4, v7, self->_key);
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_mutableOrderedSet, "replaceObjectAtIndex:withObject:", a3, a4);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 4, v7, self->_key);

  }
}

- (void)addObject:(id)a3
{
  id v5;

  if ((-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:") & 1) == 0)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 2, v5, self->_key);
    -[NSMutableOrderedSet insertObject:atIndex:](self->_mutableOrderedSet, "insertObject:atIndex:", a3, -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"));
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 2, v5, self->_key);

  }
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  const void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](self);
  v9 = (char *)v15 - v8;
  if (v10 >= 0x201)
  {
    v9 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v15 - v8, 8 * v7);
    if (!a4)
      return;
  }
  v11 = 0;
  v12 = a4;
  do
  {
    v13 = *a3;
    if ((-[NSMutableOrderedSet containsObject:](self->_mutableOrderedSet, "containsObject:", *a3) & 1) == 0)
      *(_QWORD *)&v9[8 * v11++] = v13;
    ++a3;
    --v12;
  }
  while (v12);
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count"), v11);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 2, v14, self->_key);
    -[NSMutableOrderedSet addObjects:count:](self->_mutableOrderedSet, "addObjects:count:", v9, v11);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 2, v14, self->_key);

  }
  if (a4 >= 0x201)
    NSZoneFree(0, v9);
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0C80A78](v5);
    v9 = (char *)v10 - v8;
    if (v7 > 0x200)
      v9 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v10 - v8, 8 * v7);
    objc_msgSend(a3, "getObjects:range:", v9, 0, v6);
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201)
      NSZoneFree(0, v9);
  }
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1);
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:](&v7, sel_exchangeObjectAtIndex_withObjectAtIndex_, a3, a4);
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:](&v7, sel_exchangeObjectAtIndex_withObjectAtIndex_, a3, a4);
  }
}

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  objc_super v7;

  if (-[NSMutableOrderedSet _shouldProcessKVOChange](self->_mutableOrderedSet, "_shouldProcessKVOChange"))
  {
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 1);
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet moveObjectsAtIndexes:toIndex:](&v7, sel_moveObjectsAtIndexes_toIndex_, a3, a4);
    -[NSMutableOrderedSet _setProcessingIdempotentKVO:](self->_mutableOrderedSet, "_setProcessingIdempotentKVO:", 0);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
    -[_NSNotifyingWrapperMutableOrderedSet moveObjectsAtIndexes:toIndex:](&v7, sel_moveObjectsAtIndexes_toIndex_, a3, a4);
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  if (objc_msgSend(a3, "count"))
  {
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 2, a4, self->_key);
    -[NSMutableOrderedSet insertObjects:atIndexes:](self->_mutableOrderedSet, "insertObjects:atIndexes:", a3, a4);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 2, a4, self->_key);
  }
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet setObject:atIndex:](&v4, sel_setObject_atIndex_, a3, a4);
}

- (void)replaceObjectsAtIndexes:(id)a3 withObjects:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet replaceObjectsAtIndexes:withObjects:](&v4, sel_replaceObjectsAtIndexes_withObjects_, a3, a4);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  if (objc_msgSend(a3, "count"))
  {
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, a3, self->_key);
    -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", a3);
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, a3, self->_key);
  }
}

- (void)removeAllObjects
{
  uint64_t v3;
  id v4;

  v3 = -[NSMutableOrderedSet count](self->_mutableOrderedSet, "count");
  if (v3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v3);
    -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v4, self->_key);
    -[NSMutableOrderedSet removeAllObjects](self->_mutableOrderedSet, "removeAllObjects");
    -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v4, self->_key);

  }
}

- (void)removeObject:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSNotifyingWrapperMutableOrderedSet;
  -[_NSNotifyingWrapperMutableOrderedSet removeObject:](&v3, sel_removeObject_, a3);
}

- (void)removeObjectsInArray:(id)a3
{
  id v5;
  uint64_t v6;
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
  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    if (objc_msgSend(v5, "count"))
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
    }

  }
}

- (void)intersectOrderedSet:(id)a3
{
  id v5;
  NSMutableOrderedSet *mutableOrderedSet;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(mutableOrderedSet);
          if (objc_msgSend(a3, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v9 + i);
        }
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v9 += i;
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
    }

  }
}

- (void)minusOrderedSet:(id)a3
{
  id v5;
  uint64_t v6;
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
  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          v10 = -[NSMutableOrderedSet indexOfObject:](self->_mutableOrderedSet, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    if (objc_msgSend(v5, "count"))
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
    }

  }
}

- (void)unionOrderedSet:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    if (v5 >= 0x201)
      v7 = 1;
    else
      v7 = v5;
    v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    v9 = (char *)v10 - v8;
    if (v5 > 0x200)
      v9 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v10 - v8, 8 * v5);
    objc_msgSend(a3, "getObjects:", v9);
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201)
      NSZoneFree(0, v9);
  }
}

- (void)intersectSet:(id)a3
{
  id v5;
  NSMutableOrderedSet *mutableOrderedSet;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(mutableOrderedSet);
          if ((objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)) & 1) == 0)
            objc_msgSend(v5, "addIndex:", v9 + i);
        }
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v9 += i;
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
    }

  }
}

- (void)minusSet:(id)a3
{
  id v5;
  NSMutableOrderedSet *mutableOrderedSet;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    mutableOrderedSet = self->_mutableOrderedSet;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(mutableOrderedSet);
          if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)))
            objc_msgSend(v5, "addIndex:", v9 + i);
        }
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](mutableOrderedSet, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v9 += i;
      }
      while (v8);
    }
    if (objc_msgSend(v5, "count"))
    {
      -[NSManagedObject willChange:valuesAtIndexes:forKey:](self->_container, "willChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
      -[NSMutableOrderedSet removeObjectsAtIndexes:](self->_mutableOrderedSet, "removeObjectsAtIndexes:", v5);
      -[NSManagedObject didChange:valuesAtIndexes:forKey:](self->_container, "didChange:valuesAtIndexes:forKey:", 3, v5, self->_key);
    }

  }
}

- (void)unionSet:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    if (v5 >= 0x201)
      v7 = 1;
    else
      v7 = v5;
    v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    v9 = (char *)v10 - v8;
    if (v5 > 0x200)
      v9 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v10 - v8, 8 * v5);
    objc_msgSend(a3, "getObjects:", v9);
    -[_NSNotifyingWrapperMutableOrderedSet addObjects:count:](self, "addObjects:count:", v9, v6);
    if (v6 >= 0x201)
      NSZoneFree(0, v9);
  }
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  -[_NSNotifyingWrapperMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, 0x7FFFFFFFFFFFFFFFLL, a3, a4);
}

- (id)_orderedObjectsAndKeys
{
  return (id)-[NSMutableOrderedSet _orderedObjectsAndKeys](self->_mutableOrderedSet, "_orderedObjectsAndKeys");
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  return -[NSMutableOrderedSet _reorderObjectsToLocationsByOrderKey:error:](self->_mutableOrderedSet, "_reorderObjectsToLocationsByOrderKey:error:", a3, a4);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end
