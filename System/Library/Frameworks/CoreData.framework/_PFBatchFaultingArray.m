@implementation _PFBatchFaultingArray

- (_PFBatchFaultingArray)initWithPFArray:(id)a3 andRequest:(id)a4 andContext:(id)a5
{
  _PFBatchFaultingArray *v8;
  NSCachingFetchRequest *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _PFArray *v13;
  _PFArray *array;
  unsigned int v15;
  unsigned int v16;
  unsigned int batchSize;
  unsigned int count;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_PFBatchFaultingArray;
  v8 = -[_PFBatchFaultingArray init](&v23, sel_init);
  if (!v8)
    return v8;
  v8->_count = objc_msgSend(a3, "count");
  v9 = objc_alloc_init(NSCachingFetchRequest);
  v8->_request = v9;
  if (byte_1EDF62C0C == 1)
    -[NSCachingFetchRequest _disableSQLStatementCaching](v9, "_disableSQLStatementCaching");
  objc_msgSend(a4, "_resolveEntityWithContext:", a5);
  -[NSFetchRequest setEntity:](v8->_request, "setEntity:", objc_msgSend(a4, "entity"));
  -[NSFetchRequest setFetchBatchSize:](v8->_request, "setFetchBatchSize:", 0);
  -[NSFetchRequest setIncludesPendingChanges:](v8->_request, "setIncludesPendingChanges:", 0);
  -[NSFetchRequest setSortDescriptors:](v8->_request, "setSortDescriptors:", 0);
  -[NSFetchRequest setFetchOffset:](v8->_request, "setFetchOffset:", 0);
  -[NSFetchRequest setHavingPredicate:](v8->_request, "setHavingPredicate:", 0);
  -[NSFetchRequest setPropertiesToGroupBy:](v8->_request, "setPropertiesToGroupBy:", 0);
  -[NSFetchRequest setAffectedStores:](v8->_request, "setAffectedStores:", objc_msgSend(a4, "affectedStores"));
  -[NSFetchRequest setResultType:](v8->_request, "setResultType:", objc_msgSend(a4, "resultType"));
  -[NSFetchRequest setIncludesSubentities:](v8->_request, "setIncludesSubentities:", objc_msgSend(a4, "includesSubentities"));
  -[NSFetchRequest setIncludesPropertyValues:](v8->_request, "setIncludesPropertyValues:", objc_msgSend(a4, "includesPropertyValues"));
  -[NSFetchRequest setReturnsObjectsAsFaults:](v8->_request, "setReturnsObjectsAsFaults:", objc_msgSend(a4, "returnsObjectsAsFaults"));
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v8->_request, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(a4, "relationshipKeyPathsForPrefetching"));
  -[NSFetchRequest setReturnsDistinctResults:](v8->_request, "setReturnsDistinctResults:", objc_msgSend(a4, "returnsDistinctResults"));
  -[NSFetchRequest setPropertiesToFetch:](v8->_request, "setPropertiesToFetch:", objc_msgSend(a4, "propertiesToFetch"));
  -[NSFetchRequest setShouldRefreshRefetchedObjects:](v8->_request, "setShouldRefreshRefetchedObjects:", objc_msgSend(a4, "shouldRefreshRefetchedObjects"));
  if (objc_msgSend(a4, "_disablePersistentStoreResultCaching"))
    -[NSFetchRequest _setDisablePersistentStoreResultCaching:](v8->_request, "_setDisablePersistentStoreResultCaching:", 1);
  v10 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("batch"));
  v11 = objc_alloc(MEMORY[0x1E0CB3518]);
  v12 = (void *)objc_msgSend(v11, "initWithLeftExpression:rightExpression:modifier:type:options:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"), v10, 0, 10, 0);
  -[NSFetchRequest setPredicate:](v8->_request, "setPredicate:", v12);

  v8->_moc = (NSManagedObjectContext *)a5;
  v13 = (_PFArray *)a3;
  v8->_array = v13;
  if (v13)
  {
    *(_BYTE *)&v13->_flags |= 2u;
    *(_BYTE *)&v13->_flags &= ~4u;
    array = v8->_array;
    if (array)
      *(_BYTE *)&array->_flags &= ~4u;
  }
  v8->_batchSize = objc_msgSend(a4, "fetchBatchSize");
  v15 = objc_msgSend(a4, "_fetchBatchLRUEntriesLimit");
  if (v15)
    v16 = v15;
  else
    v16 = 4;
  v8->_flags = (_PFBatchFaultingArrayFlags)(*(_DWORD *)&v8->_flags & 0xFFF001FF | ((v16 & 0x7FF) << 9));
  batchSize = v8->_batchSize;
  if (!batchSize)
  {
    batchSize = 27;
LABEL_18:
    v8->_batchSize = batchSize;
    goto LABEL_19;
  }
  if (batchSize * v16 <= 0xF)
  {
    if (v16 >= 2)
      batchSize = 8;
    else
      batchSize = 16;
    goto LABEL_18;
  }
LABEL_19:
  -[NSFetchRequest setFetchLimit:](v8->_request, "setFetchLimit:", batchSize);
  count = v8->_count;
  v19 = v8->_batchSize;
  if (count % v19)
    v20 = count / v19 + 1;
  else
    v20 = count / v19;
  v8->_entryFlags = (unsigned int *)PF_CALLOC_UNSCANNED_BYTES(4 * v20);
  *(_DWORD *)&v8->_flags &= 0xFFFFFF00;
  v21 = (unsigned int *)PF_CALLOC_UNSCANNED_BYTES(4 * v16);
  v8->_LRUBatches = v21;
  memset(v21, 255, 4 * v16);
  return v8;
}

- (unint64_t)count
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return self->_count;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  uint64_t (*v5)(id, char *);
  id *v6;
  unsigned int count;
  id *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int batchSize;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (!a3)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (!a3)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = (uint64_t (*)(id, char *))objc_msgSend(a3, "methodForSelector:", sel_isEqual_);
  v6 = -[_PFArray _objectsPointer](self->_array, "_objectsPointer");
  count = self->_count;
  if (!count)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v6;
  v9 = 0;
  v10 = 24;
  while (1)
  {
    batchSize = self->_batchSize;
    v12 = batchSize + v9;
    v13 = batchSize + v9 >= count ? count : v12;
    v14 = v10;
    if ((((*(_DWORD **)((char *)&self->super.super.isa + v10))[(v9 / batchSize) >> 5] >> ~(v9 / batchSize)) & 1) == 0)
      break;
    if (v9 < v13)
    {
      v15 = v9;
      while (*((id *)v8[v15] + 5) != a3 && (v5(a3, sel_isEqual_) & 1) == 0)
      {
        if (v13 == ++v15)
          goto LABEL_20;
      }
      return v15;
    }
LABEL_20:
    v9 = v13;
    v10 = v14;
    if (count <= v12)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9 >= v13)
    goto LABEL_20;
  v15 = v9;
  while (v8[v15] != a3 && (v5(a3, sel_isEqual_) & 1) == 0)
  {
    if (v13 == ++v15)
      goto LABEL_20;
  }
  return v15;
}

- (void)dealloc
{
  NSManagedObjectContext *moc;
  unsigned int *entryFlags;
  unsigned int *LRUBatches;

  if (self)
  {

    moc = self->_moc;
    if (moc && self->_count)
    {
      -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)moc);
      moc = self->_moc;
    }

    entryFlags = self->_entryFlags;
    if (entryFlags)
      PF_FREE_OBJECT_ARRAY(entryFlags);
    LRUBatches = self->_LRUBatches;
    if (LRUBatches)
      PF_FREE_OBJECT_ARRAY(LRUBatches);
    _PFDeallocateObject(self);
  }
}

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[_PFBatchFaultingArray dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (_PFBatchFaultingArray)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t count;
  id *v10;
  unint64_t result;
  unint64_t var0;
  id *v13;
  unint64_t v14;
  unint64_t v15;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  if (!a3->var0)
    a3->var2 = (unint64_t *)&self->_count;
  a3->var1 = a4;
  count = self->_count;
  v10 = -[_PFArray _objectsPointer](self->_array, "_objectsPointer");
  result = 0;
  var0 = a3->var0;
  if (a5 && var0 < count)
  {
    result = 0;
    v13 = &v10[var0];
    do
    {
      v14 = result;
      v15 = var0 + result;
      _faultBatchAtIndex((uint64_t)self, var0 + result, 1);
      result = v14 + 1;
      a4[v14] = v13[v14];
    }
    while (v15 + 1 < count && result < a5);
    var0 += result;
  }
  a3->var0 = var0;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, a3);
}

- (id)retainedObjectAtIndex:(uint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*(_QWORD *)(a1 + 32), sel_retainedObjectAtIndex_);
    if (*(unsigned int *)(a1 + 12) > a2)
    {
      _faultBatchAtIndex(a1, a2, 1);
      return *(id *)(objc_msgSend(*(id *)(a1 + 16), "_objectsPointer") + 8 * a2);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%u)"), _NSMethodExceptionProem(), a2, *(unsigned int *)(a1 + 12));
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!_PF_Threading_Debugging_level)
    return self;
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return self;
}

- (id)arrayFromObjectIDs
{
  return -[_PFBatchFaultingArray newArrayFromObjectIDs](self, "newArrayFromObjectIDs");
}

- (id)newArrayFromObjectIDs
{
  id *v3;
  unsigned int count;
  unsigned int v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int batchSize;
  unsigned int v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  void **v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  id *v21;
  uint64_t v22;
  _PFArray *v23;
  _BYTE v25[4];
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v3 = -[_PFArray _objectsPointer](self->_array, "_objectsPointer");
  count = self->_count;
  MEMORY[0x1E0C80A78](v3);
  v7 = &v25[-v6];
  v26 = count;
  if (count > 0x200)
  {
    v7 = (_BYTE *)NSAllocateScannedUncollectable();
    v8 = self->_count;
    if (!v8)
      goto LABEL_20;
  }
  else
  {
    bzero(&v25[-v6], 8 * v5);
    v8 = count;
    if (!count)
      goto LABEL_20;
  }
  v9 = 0;
  do
  {
    batchSize = self->_batchSize;
    v11 = v9 / batchSize;
    v12 = ~(v9 / batchSize);
    v13 = batchSize + v9;
    if (v13 >= v8)
      v14 = v8;
    else
      v14 = v13;
    if (((self->_entryFlags[v11 >> 5] >> v12) & 1) != 0)
    {
      v15 = v14 - v9;
      if (v14 > v9)
      {
        v16 = &v7[8 * v9];
        v17 = &v3[v9];
        do
        {
          v18 = *v17++;
          *v16++ = objc_msgSend(v18, "objectID");
          --v15;
        }
        while (v15);
      }
    }
    else if (v14 > v9)
    {
      v19 = v14 - v9;
      v20 = &v7[8 * v9];
      v21 = &v3[v9];
      do
      {
        v22 = (uint64_t)*v21++;
        *v20++ = v22;
        --v19;
      }
      while (v19);
    }
    v8 = self->_count;
    v9 = v14;
  }
  while (v14 < v8);
LABEL_20:
  v23 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v7, self->_count, 27);
  if (v26 >= 0x201)
    NSZoneFree(0, v7);
  return v23;
}

+ (void)initialize
{
  const char *v2;
  const char *v3;

  objc_opt_self();
  v2 = getprogname();
  if (v2)
  {
    v3 = v2;
    if (!strncmp("iBooks", v2, 6uLL))
      _MergedGlobals_39 = 1;
    if (!strncmp("Music", v3, 5uLL))
      _MergedGlobals_39 = 1;
    if (!strncmp("homed", v3, 5uLL))
      byte_1EDF62C0C = 1;
  }
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  if (self->_count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%u)"), _NSMethodExceptionProem(), a3, self->_count);
    return 0;
  }
  else
  {
    _faultBatchAtIndex((uint64_t)self, a3, 1);
    return -[_PFArray _objectsPointer](self->_array, "_objectsPointer")[8 * a3];
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger count;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  length = a4.length;
  location = a4.location;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  count = self->_count;
  v9 = location + length;
  if (location + length > count)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), v9 - 1, self->_count);
  if (length)
  {
    if (v9 >= count)
      v10 = count;
    else
      v10 = location + length;
    if (location < v10)
    {
      v11 = location;
      do
        _faultBatchAtIndex((uint64_t)self, v11++, 0);
      while (v10 != v11);
    }
    memmove(a3, -[_PFArray _objectsPointer](self->_array, "_objectsPointer") + 8 * location, 8 * length);
  }
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (BOOL)isEqualToArray:(id)a3
{
  uint64_t count;
  id *v6;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int batchSize;
  unsigned int v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  char *v19;
  void **v20;
  void *v21;
  uint64_t v22;
  char *v23;
  id *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t i;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  id v42;
  unsigned int v43;
  id *v44;
  id *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (!a3)
      return 0;
  }
  else if (!a3)
  {
    return 0;
  }
  count = self->_count;
  if (objc_msgSend(a3, "count") != count)
    return 0;
  v6 = -[_PFArray _objectsPointer](self->_array, "_objectsPointer");
  v44 = &v42;
  v45 = v6;
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v42 - v8;
  v43 = v10;
  v42 = a3;
  if (v10 > 0x200)
    v9 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v42 - v8, 8 * v7);
  v11 = self->_count;
  if (v11)
  {
    v12 = 0;
    do
    {
      batchSize = self->_batchSize;
      v14 = v12 / batchSize;
      v15 = ~(v12 / batchSize);
      v16 = batchSize + v12;
      if (v16 >= v11)
        v17 = v11;
      else
        v17 = v16;
      if (((self->_entryFlags[v14 >> 5] >> v15) & 1) != 0)
      {
        v18 = v17 - v12;
        if (v17 > v12)
        {
          v19 = &v9[8 * v12];
          v20 = &v45[v12];
          do
          {
            v21 = *v20++;
            *(_QWORD *)v19 = objc_msgSend(v21, "objectID", v42);
            v19 += 8;
            --v18;
          }
          while (v18);
        }
      }
      else if (v17 > v12)
      {
        v22 = v17 - v12;
        v23 = &v9[8 * v12];
        v24 = &v45[v12];
        do
        {
          v25 = (uint64_t)*v24++;
          *(_QWORD *)v23 = v25;
          v23 += 8;
          --v22;
        }
        while (v22);
      }
      v11 = self->_count;
      v12 = v17;
    }
    while (v17 < v11);
  }
  v26 = v42;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "newArrayFromObjectIDs");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v27);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "isEqual:", *(_QWORD *)&v9[8 * (v30 + i)], v42))
          {
            v33 = 0;
            goto LABEL_43;
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        v30 += i;
        if (v29)
          continue;
        break;
      }
    }
    v33 = 1;
LABEL_43:

  }
  else
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v26);
          v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v40 = *(void **)&v9[8 * (v36 + j)];
          if ((objc_msgSend(v39, "isEqual:", v40, v42) & 1) == 0
            && ((objc_opt_respondsToSelector() & 1) == 0
             || !objc_msgSend(v40, "isEqual:", objc_msgSend(v39, "objectID"))))
          {
            v33 = 0;
            goto LABEL_46;
          }
        }
        v35 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        v36 += j;
        v33 = 1;
        if (v35)
          continue;
        break;
      }
    }
    else
    {
      v33 = 1;
    }
  }
LABEL_46:
  if (v43 >= 0x201)
    NSZoneFree(0, v9);
  return v33;
}

- (_PFMutableProxyArray)_newSubArrayInRange:(unint64_t)a3 asMutable:(int)a4
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _PFArray *v17;
  _PFArray *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v7 = a1;
  if (_PF_Threading_Debugging_level)
    a1 = _PFAssertSafeMultiThreadedAccess_impl(*(_QWORD *)(a1 + 32), sel__newSubArrayInRange_asMutable_);
  v8 = a2 + a3;
  v9 = a2;
  while (v9 < v8)
  {
    v10 = *(_DWORD *)(v7 + 48);
    v11 = v9 / v10;
    v12 = ~(v9 / v10);
    v9 += v10;
    if (v9 >= v8)
      v9 = a2 + a3;
    if (((*(_DWORD *)(*(_QWORD *)(v7 + 24) + 4 * (v11 >> 5)) >> v12) & 1) == 0)
      return -[_PFMutableProxyArray initWithPFArray:inRange:]([_PFMutableProxyArray alloc], "initWithPFArray:inRange:", v7, a2, a3);
  }
  MEMORY[0x1E0C80A78](a1);
  v16 = (char *)v19 - v15;
  if (a3 > 0x200)
    v16 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v19 - v15, 8 * v14);
  objc_msgSend((id)v7, "getObjects:range:", v16, a2, a3);
  if (a4)
    v17 = (_PFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v16, a3);
  else
    v17 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v16, a3, 59);
  v18 = v17;
  if (a3 >= 0x201)
    NSZoneFree(0, v16);
  return (_PFMutableProxyArray *)v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return -[_PFBatchFaultingArray _newSubArrayInRange:asMutable:]((uint64_t)self, 0, self->_count, 1);
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

- (void)_turnAllBatchesIntoFaults
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  unsigned int i;

  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*(_QWORD *)(a1 + 32), sel__turnAllBatchesIntoFaults);
    v2 = *(_DWORD *)(a1 + 12);
    v3 = *(_DWORD *)(a1 + 48);
    if (v2 % v3)
      v4 = v2 / v3 + 1;
    else
      v4 = v2 / v3;
    if (v4)
    {
      for (i = 0; i != v4; ++i)
        _releaseStaleBatch(a1, i);
    }
    -[NSManagedObjectContext _processReferenceQueue:](*(_QWORD *)(a1 + 32), 0);
  }
}

- (void)_turnAllBatchesIntoObjects
{
  uint64_t v2;
  uint64_t i;

  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(*(_QWORD *)(a1 + 32), sel__turnAllBatchesIntoObjects);
    v2 = *(unsigned int *)(a1 + 12);
    if ((_DWORD)v2)
    {
      for (i = 0; i != v2; ++i)
        _faultBatchAtIndex(a1, i, 0);
    }
  }
}

- (void)getObjects:(id *)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray getObjects:range:](self, "getObjects:range:", a3, 0, self->_count);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;

  v6 = a4;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v23 = 0;
  v9 = -[_PFBatchFaultingArray count](self, "count");
  v10 = objc_msgSend(a3, "rangeCount");
  if (v9)
  {
    v11 = v10;
    if (v10)
    {
      if ((v6 & 2) != 0)
      {
        do
        {
          if (!v11)
            break;
          v19 = objc_msgSend(a3, "rangeAtIndex:", --v11);
          v21 = v19 + v20;
          while (v21 <= v9 && v21 > v19)
          {
            v22 = -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, --v21);
            (*((void (**)(id, id, unint64_t, char *))a5 + 2))(a5, v22, v21, &v23);

            if (v23)
              return;
          }
        }
        while (!v23);
      }
      else
      {
        v12 = 0;
LABEL_7:
        while (1)
        {
          v13 = objc_msgSend(a3, "rangeAtIndex:", v12);
          v15 = v13;
          v16 = v9 >= v13 + v14 ? v13 + v14 : v9;
          if (v13 < v16)
            break;
          ++v12;
          if (v23)
            v18 = 1;
          else
            v18 = v12 == v11;
          if (v18)
            return;
        }
        while (1)
        {
          v17 = -[_PFBatchFaultingArray retainedObjectAtIndex:]((uint64_t)self, v15);
          (*((void (**)(id, id, unint64_t, char *))a5 + 2))(a5, v17, v15, &v23);

          if (v23)
            break;
          if (v16 == ++v15)
          {
            if (++v12 != v11)
              goto LABEL_7;
            return;
          }
        }
      }
    }
  }
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[_PFBatchFaultingArray count](self, "count") && objc_msgSend(a3, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68___PFBatchFaultingArray_indexOfObjectAtIndexes_options_passingTest___block_invoke;
    v11[3] = &unk_1E1EDD880;
    v11[4] = a5;
    v11[5] = &v12;
    -[_PFBatchFaultingArray enumerateObjectsAtIndexes:options:usingBlock:](self, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, v11);
  }
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  if (-[_PFBatchFaultingArray count](self, "count") && objc_msgSend(a3, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71___PFBatchFaultingArray_indexesOfObjectsAtIndexes_options_passingTest___block_invoke;
    v11[3] = &unk_1E1EDD880;
    v11[4] = a5;
    v11[5] = &v12;
    -[_PFBatchFaultingArray enumerateObjectsAtIndexes:options:usingBlock:](self, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, v11);
  }
  v9 = (void *)v13[5];
  if (!v9)
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v7;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  -[_PFBatchFaultingArray enumerateObjectsAtIndexes:options:usingBlock:](self, "enumerateObjectsAtIndexes:options:usingBlock:", v7, a3, a4);

}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  void *v7;
  unint64_t v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  v8 = -[_PFBatchFaultingArray indexOfObjectAtIndexes:options:passingTest:](self, "indexOfObjectAtIndexes:options:passingTest:", v7, a3, a4);

  return v8;
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  void *v7;
  id v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[_PFBatchFaultingArray count](self, "count"));
  v8 = -[_PFBatchFaultingArray indexesOfObjectsAtIndexes:options:passingTest:](self, "indexesOfObjectsAtIndexes:options:passingTest:", v7, a3, a4);

  return v8;
}

- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4
{
  objc_super v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v8.receiver = self;
  v8.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayUsingFunction:context:](&v8, sel_sortedArrayUsingFunction_context_, a3, a4);
}

- (id)sortedArrayUsingFunction:(void *)a3 context:(void *)a4 hint:(id)a5
{
  objc_super v10;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v10.receiver = self;
  v10.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayUsingFunction:context:hint:](&v10, sel_sortedArrayUsingFunction_context_hint_, a3, a4, a5);
}

- (id)sortedArrayUsingSelector:(SEL)a3
{
  objc_super v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayUsingSelector:](&v6, sel_sortedArrayUsingSelector_, a3);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  objc_super v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayUsingComparator:](&v6, sel_sortedArrayUsingComparator_, a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  objc_super v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v8.receiver = self;
  v8.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayWithOptions:usingComparator:](&v8, sel_sortedArrayWithOptions_usingComparator_, a3, a4);
}

- (id)filteredArrayUsingPredicate:(id)a3
{
  objc_super v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray filteredArrayUsingPredicate:](&v6, sel_filteredArrayUsingPredicate_, a3);
}

- (id)sortedArrayUsingDescriptors:(id)a3
{
  objc_super v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray sortedArrayUsingDescriptors:](&v6, sel_sortedArrayUsingDescriptors_, a3);
}

- (id)valueForKey:(id)a3
{
  id v5;
  objc_super v7;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  if (!objc_msgSend(a3, "isEqual:", CFSTR("objectID"))
    || -[NSFetchRequest resultType](self->_request, "resultType")
    || (v5 = -[_PFBatchFaultingArray arrayFromObjectIDs](self, "arrayFromObjectIDs"),
        objc_msgSend(v5, "count") != self->_count))
  {
    -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
    v7.receiver = self;
    v7.super_class = (Class)_PFBatchFaultingArray;
    return -[_PFBatchFaultingArray valueForKey:](&v7, sel_valueForKey_, a3);
  }
  return v5;
}

- (id)valueForKeyPath:(id)a3
{
  objc_super v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  -[_PFBatchFaultingArray _turnAllBatchesIntoObjects]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_PFBatchFaultingArray;
  return -[_PFBatchFaultingArray valueForKeyPath:](&v6, sel_valueForKeyPath_, a3);
}

- (id)objectsAtIndexes:(id)a3
{
  unint64_t v5;
  BOOL v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  v5 = objc_msgSend(a3, "count");
  if (self->_count)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = v5;
    if (v5 >= 0x201)
      v9 = 1;
    else
      v9 = v5;
    v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
    v11 = (char *)v18 - v10;
    if (v5 > 0x200)
      v11 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v18 - v10, 8 * v5);
    if (objc_msgSend(a3, "rangeCount"))
    {
      v12 = 0;
      v13 = 0;
      do
      {
        v14 = objc_msgSend(a3, "rangeAtIndex:", v12);
        v16 = v15;
        -[_PFBatchFaultingArray getObjects:range:](self, "getObjects:range:", &v11[8 * v13], v14, v15);
        v13 += v16;
        ++v12;
      }
      while (v12 < objc_msgSend(a3, "rangeCount"));
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, v8);
    if (v8 >= 0x201)
      NSZoneFree(0, v11);
  }
  if (v7)
    return v7;
  else
    return (id)NSArray_EmptyArray;
}

- (unint64_t)indexOfObject:(id)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  return -[_PFBatchFaultingArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  int length;
  unsigned int location;
  _PFBatchFaultingArray *v7;
  void *v8;
  uint64_t (*v9)(void *, char *);
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int batchSize;
  unsigned int v14;
  char v15;
  unsigned int v16;
  _PFBatchFaultingArray *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  BOOL v21;
  _PFBatchFaultingArray *v23;

  length = a4.length;
  location = a4.location;
  v7 = self;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)objc_msgSend(a3, "objectID");
  v9 = (uint64_t (*)(void *, char *))objc_msgSend(v8, "methodForSelector:", sel_isEqual_);
  v10 = -[_PFArray _objectsPointer](v7->_array, "_objectsPointer");
  v11 = location + length;
  if (location + length <= location)
    return 0x7FFFFFFFFFFFFFFFLL;
  v12 = v10;
  v23 = v7;
  while (1)
  {
    batchSize = v7->_batchSize;
    v14 = location / batchSize;
    v15 = ~(location / batchSize);
    v16 = batchSize + location;
    v17 = v7;
    v18 = v16 >= v11 ? v11 : v16;
    if (((v17->_entryFlags[v14 >> 5] >> v15) & 1) == 0)
      break;
    if (location < v18)
    {
      v19 = location;
      do
      {
        v20 = *(_QWORD **)(v12 + 8 * v19);
        v21 = v20 == a3 || v8 == (void *)v20[5];
        if (v21 || (v9(v8, sel_isEqual_) & 1) != 0)
          return v19;
      }
      while (v18 != ++v19);
    }
LABEL_24:
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    location = v18;
    v7 = v23;
    if (v11 <= v16)
      return v19;
  }
  if (location >= v18)
    goto LABEL_24;
  v19 = location;
  while (v8 != *(void **)(v12 + 8 * v19) && (v9(v8, sel_isEqual_) & 1) == 0)
  {
    if (v18 == ++v19)
      goto LABEL_24;
  }
  return v19;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  id result;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
  result = -[_PFArray _objectsPointer](self->_array, "_objectsPointer")[8 * a3];
  if (((self->_entryFlags[(a3 / self->_batchSize) >> 5] >> ~(a3
                                                                                           / self->_batchSize)) & 1) != 0)
    return (id)*((_QWORD *)result + 5);
  return result;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _PFBatchFaultingArray *v6;

  length = a3.length;
  location = a3.location;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_moc, a2);
    if (location)
      goto LABEL_6;
  }
  else if (a3.location)
  {
LABEL_6:
    v6 = (_PFBatchFaultingArray *)-[_PFBatchFaultingArray _newSubArrayInRange:asMutable:]((uint64_t)self, location, length, 0);
    return v6;
  }
  if (length != self->_count)
    goto LABEL_6;
  v6 = self;
  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p) of %lu items for request %@"), NSStringFromClass(v4), self, -[_PFArray count](self->_array, "count"), self->_request);
}

@end
