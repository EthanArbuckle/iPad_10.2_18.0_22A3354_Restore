@implementation HDMultiTypeSortedSampleIterator

- (HDMultiTypeSortedSampleIterator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

HDSortedSampleIterator *__138__HDMultiTypeSortedSampleIterator__upstreamIteratorsWithQueryDescriptors_includeDeletedObjects_sortDescriptors_anchor_bufferSize_profile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDSortedSampleIterator *v4;

  v3 = a2;
  v4 = -[HDSortedSampleIterator initWithQueryDescriptor:includeDeletedObjects:sortDescriptors:anchor:bufferSize:profile:]([HDSortedSampleIterator alloc], "initWithQueryDescriptor:includeDeletedObjects:sortDescriptors:anchor:bufferSize:profile:", v3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  return v4;
}

- (HDMultiTypeSortedSampleIterator)initWithQueryDescriptors:(id)a3 includeDeletedObjects:(BOOL)a4 anchor:(id)a5 sortDescriptors:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  id v18;
  HDMultiTypeSortedSampleIterator *v19;
  uint64_t v20;
  NSArray *queryDescriptors;
  uint64_t v22;
  NSArray *sortDescriptors;
  uint64_t v24;
  HKSortedQueryAnchor *anchor;
  HDSortedSampleIterator *nextIterator;
  void *v28;
  void *v29;
  objc_super v30;

  v12 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMultiTypeSortedSampleIterator.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryDescriptors.count > 0"));

  }
  v30.receiver = self;
  v30.super_class = (Class)HDMultiTypeSortedSampleIterator;
  v19 = -[HDMultiTypeSortedSampleIterator init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    queryDescriptors = v19->_queryDescriptors;
    v19->_queryDescriptors = (NSArray *)v20;

    if (v12 && objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("HDMultiTypeSortedSampleIterator.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("includeDeletedObjects == NO || (includeDeletedObjects && sortDescriptors.count == 0)"));

    }
    v19->_includeDeletedObjects = v12;
    v22 = objc_msgSend(v17, "copy");
    sortDescriptors = v19->_sortDescriptors;
    v19->_sortDescriptors = (NSArray *)v22;

    v19->_bufferSize = a7;
    objc_storeWeak((id *)&v19->_profile, v18);
    v24 = objc_msgSend(v16, "copy");
    anchor = v19->_anchor;
    v19->_anchor = (HKSortedQueryAnchor *)v24;

    nextIterator = v19->_nextIterator;
    v19->_nextIterator = 0;

    v19->_isInitialized = 0;
  }

  return v19;
}

BOOL __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "sample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v17 = 0;
        v11 = objc_msgSend(v10, "advanceWithError:", &v17);
        v12 = v17;
        v13 = v12;
        if ((v11 & 1) == 0)
        {
          if ((objc_msgSend(v12, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
          {
            v15 = v13;
            if (v15)
            {
              if (a3)
                *a3 = objc_retainAutorelease(v15);
              else
                _HKLogDroppedError();
            }

            v14 = 0;
            goto LABEL_17;
          }
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)advanceWithError:(id *)a3
{
  HDMultiTypeSortedSampleIterator *v4;
  NSArray *queryDescriptors;
  BOOL includeDeletedObjects;
  HKSortedQueryAnchor *anchor;
  HDProfile **p_profile;
  NSArray *sortDescriptors;
  int64_t bufferSize;
  id WeakRetained;
  NSArray *v12;
  HKSortedQueryAnchor *v13;
  id v14;
  NSArray *v15;
  uint64_t v16;
  id v17;
  HKSortedQueryAnchor *v18;
  NSArray *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *iterators;
  void *v23;
  HKSortedQueryAnchor *v24;
  id v25;
  void *v26;
  NSArray *v27;
  HKSortedQueryAnchor *v28;
  _BOOL4 v29;
  HDSortedSampleIterator *nextIterator;
  BOOL v31;
  id v32;
  void *v33;
  uint64_t v34;
  HDSortedSampleIterator *v35;
  uint64_t i;
  void *v37;
  NSArray *v38;
  HDSortedSampleIterator *v39;
  HDSortedSampleIterator *v40;
  NSArray *v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  HDSortedSampleIterator *v52;
  HDSortedSampleIterator *v53;
  HDSortedSampleIterator *v54;
  HDSortedSampleIterator *v55;
  id v57;
  NSMutableArray *obj;
  uint64_t v59;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  NSArray *v76;
  HKSortedQueryAnchor *v77;
  id v78;
  int64_t v79;
  BOOL v80;
  uint64_t v81;

  v4 = self;
  v81 = *MEMORY[0x1E0C80C00];
  if (!self->_isInitialized)
  {
    queryDescriptors = self->_queryDescriptors;
    includeDeletedObjects = self->_includeDeletedObjects;
    anchor = self->_anchor;
    p_profile = &self->_profile;
    sortDescriptors = self->_sortDescriptors;
    bufferSize = self->_bufferSize;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v12 = sortDescriptors;
    v13 = anchor;
    v14 = WeakRetained;
    v15 = queryDescriptors;
    objc_opt_self();
    v16 = MEMORY[0x1E0C809B0];
    v72 = MEMORY[0x1E0C809B0];
    v73 = 3221225472;
    v74 = __138__HDMultiTypeSortedSampleIterator__upstreamIteratorsWithQueryDescriptors_includeDeletedObjects_sortDescriptors_anchor_bufferSize_profile___block_invoke;
    v75 = &unk_1E6CFE8E8;
    v80 = includeDeletedObjects;
    v76 = v12;
    v77 = v13;
    v78 = v14;
    v79 = bufferSize;
    v17 = v14;
    v18 = v13;
    v19 = v12;
    -[NSArray hk_map:](v15, "hk_map:", &v72);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = self;
    v21 = (NSMutableArray *)objc_msgSend(v20, "mutableCopy");
    iterators = self->_iterators;
    self->_iterators = v21;

    -[NSMutableArray hk_filter:](self->_iterators, "hk_filter:", &__block_literal_global_155);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      v24 = (HKSortedQueryAnchor *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v25, "database");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v16;
      v73 = 3221225472;
      v74 = __62__HDMultiTypeSortedSampleIterator__prepareIteratorsWithError___block_invoke_2;
      v75 = &unk_1E6CE7950;
      v27 = v23;
      v76 = v27;
      v77 = v24;
      v28 = v24;
      v29 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v26, a3, &v72);

      -[NSMutableArray removeObjectsInArray:](self->_iterators, "removeObjectsInArray:", v28);
      if (!v29)
        return 0;
    }
    else
    {

    }
    self->_isInitialized = 1;
  }
  nextIterator = v4->_nextIterator;
  if (nextIterator)
  {
    v66 = 0;
    v31 = -[HDSortedSampleIterator advanceWithError:](nextIterator, "advanceWithError:", &v66);
    v32 = v66;
    v33 = v32;
    if (!v31)
    {
      if ((objc_msgSend(v32, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
      {
        v57 = v33;
        if (v57)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v57);
          else
            _HKLogDroppedError();
        }

        return 0;
      }
      -[NSMutableArray removeObject:](v4->_iterators, "removeObject:", v4->_nextIterator);
    }

  }
  if (!-[NSMutableArray count](v4->_iterators, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 900, CFSTR("All child iterators of the multi-type iterator are exhausted"));
    return 0;
  }
  -[NSMutableArray firstObject](v4->_iterators, "firstObject");
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v4->_nextIterator;
  v4->_nextIterator = (HDSortedSampleIterator *)v34;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v4->_iterators;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v63 != v59)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v38 = v4->_sortDescriptors;
        v39 = v4->_nextIterator;
        v40 = v37;
        v41 = v38;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v42 = v41;
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v67, &v72, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v68;
          while (2)
          {
            for (j = 0; j != v44; ++j)
            {
              if (*(_QWORD *)v68 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
              -[HDSortedSampleIterator sample](v39, "sample");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDSortedSampleIterator sample](v40, "sample");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v47, "compareObject:toObject:", v48, v49);

              if (v50)
              {
                if (v50 == -1)
                  v53 = v39;
                else
                  v53 = v40;
                v54 = v53;

                goto LABEL_34;
              }
            }
            v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v67, &v72, 16);
            if (v44)
              continue;
            break;
          }
        }

        v51 = -[HDSortedSampleIterator objectID](v39, "objectID");
        if (v51 >= -[HDSortedSampleIterator objectID](v40, "objectID"))
          v52 = v40;
        else
          v52 = v39;
        v54 = v52;
LABEL_34:
        v4 = self;

        v55 = self->_nextIterator;
        self->_nextIterator = v54;

      }
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v61);
  }

  return 1;
}

- (id)object
{
  return -[HDSortedSampleIterator object](self->_nextIterator, "object");
}

- (HKSample)sample
{
  return -[HDSortedSampleIterator sample](self->_nextIterator, "sample");
}

- (HKDeletedObject)deletedObject
{
  return -[HDSortedSampleIterator deletedObject](self->_nextIterator, "deletedObject");
}

- (int64_t)objectID
{
  return -[HDSortedSampleIterator objectID](self->_nextIterator, "objectID");
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSArray hash](self->_queryDescriptors, "hash");
  v4 = -[NSArray hash](self->_sortDescriptors, "hash") ^ v3;
  v5 = v4 ^ -[HKSortedQueryAnchor hash](self->_anchor, "hash") ^ self->_bufferSize;
  return v5 ^ -[HDSortedSampleIterator hash](self->_nextIterator, "hash") ^ self->_includeDeletedObjects ^ self->_isInitialized;
}

- (BOOL)isEqual:(id)a3
{
  HDMultiTypeSortedSampleIterator *v4;
  HDMultiTypeSortedSampleIterator *v5;
  NSArray *queryDescriptors;
  NSArray *v7;
  NSArray *sortDescriptors;
  NSArray *v9;
  HKSortedQueryAnchor *anchor;
  HKSortedQueryAnchor *v11;
  HDSortedSampleIterator *nextIterator;
  HDSortedSampleIterator *v13;
  BOOL v14;

  v4 = (HDMultiTypeSortedSampleIterator *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      queryDescriptors = self->_queryDescriptors;
      v7 = v5->_queryDescriptors;
      v14 = (queryDescriptors == v7 || v7 && -[NSArray isEqualToArray:](queryDescriptors, "isEqualToArray:"))
         && ((sortDescriptors = self->_sortDescriptors, v9 = v5->_sortDescriptors, sortDescriptors == v9)
          || v9 && -[NSArray isEqual:](sortDescriptors, "isEqual:"))
         && ((anchor = self->_anchor, v11 = v5->_anchor, anchor == v11)
          || v11 && -[HKSortedQueryAnchor isEqual:](anchor, "isEqual:"))
         && self->_bufferSize == v5->_bufferSize
         && ((nextIterator = self->_nextIterator, v13 = v5->_nextIterator, nextIterator == v13)
          || v13 && -[HDSortedSampleIterator isEqual:](nextIterator, "isEqual:"))
         && self->_isInitialized == v5->_isInitialized
         && self->_includeDeletedObjects == v5->_includeDeletedObjects;

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDMultiTypeSortedSampleIterator *v5;
  HDMultiTypeSortedSampleIterator *v6;
  uint64_t v7;
  NSArray *queryDescriptors;
  uint64_t v9;
  NSArray *sortDescriptors;
  uint64_t v11;
  HKSortedQueryAnchor *anchor;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  NSMutableArray *iterators;
  uint64_t v17;
  HDSortedSampleIterator *v18;
  HDSortedSampleIterator *nextIterator;
  objc_super v21;

  v5 = [HDMultiTypeSortedSampleIterator alloc];
  if (v5)
  {
    v21.receiver = v5;
    v21.super_class = (Class)HDMultiTypeSortedSampleIterator;
    v6 = -[HDMultiTypeSortedSampleIterator init](&v21, sel_init);
  }
  else
  {
    v6 = 0;
  }
  v7 = -[NSArray copyWithZone:](self->_queryDescriptors, "copyWithZone:", a3);
  queryDescriptors = v6->_queryDescriptors;
  v6->_queryDescriptors = (NSArray *)v7;

  v9 = -[NSArray copyWithZone:](self->_sortDescriptors, "copyWithZone:", a3);
  sortDescriptors = v6->_sortDescriptors;
  v6->_sortDescriptors = (NSArray *)v9;

  v11 = -[HKSortedQueryAnchor copyWithZone:](self->_anchor, "copyWithZone:", a3);
  anchor = v6->_anchor;
  v6->_anchor = (HKSortedQueryAnchor *)v11;

  v6->_bufferSize = self->_bufferSize;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_storeWeak((id *)&v6->_profile, WeakRetained);

  v6->_includeDeletedObjects = self->_includeDeletedObjects;
  -[NSMutableArray hk_map:](self->_iterators, "hk_map:", &__block_literal_global_205_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mutableCopy");
  iterators = v6->_iterators;
  v6->_iterators = (NSMutableArray *)v15;

  v17 = -[NSMutableArray indexOfObject:](self->_iterators, "indexOfObject:", self->_nextIterator);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = -[HDSortedSampleIterator copyWithZone:](self->_nextIterator, "copyWithZone:", a3);
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](v6->_iterators, "objectAtIndexedSubscript:", v17);
    v18 = (HDSortedSampleIterator *)objc_claimAutoreleasedReturnValue();
  }
  nextIterator = v6->_nextIterator;
  v6->_nextIterator = v18;

  v6->_isInitialized = self->_isInitialized;
  return v6;
}

id __48__HDMultiTypeSortedSampleIterator_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  HKSortedQueryAnchor *v14;
  HKSortedQueryAnchor *anchor;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_isInitialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMultiTypeSortedSampleIterator.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isInitialized"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, a4);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v11, CFSTR("CurrentAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v12;
        anchor = self->_anchor;
        self->_anchor = v14;
      }
      else
      {
        anchor = self->_anchor;
        self->_anchor = 0;
      }
    }
    else
    {
      objc_msgSend(v8, "error");
      anchor = (HKSortedQueryAnchor *)(id)objc_claimAutoreleasedReturnValue();
      if (anchor)
      {
        if (a4)
          *a4 = objc_retainAutorelease(anchor);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)iteratorStateData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[HDSortedSampleIterator nextAnchor](self->_nextIterator, "nextAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("CurrentAnchor"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "encodeObject:forKey:", v5, CFSTR("CurrentAnchor"));

  }
  objc_msgSend(v3, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextIterator, 0);
  objc_storeStrong((id *)&self->_iterators, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end
