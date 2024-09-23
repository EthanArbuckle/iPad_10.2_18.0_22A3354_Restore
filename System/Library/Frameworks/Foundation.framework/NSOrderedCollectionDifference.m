@implementation NSOrderedCollectionDifference

- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects additionalChanges:(NSArray *)changes
{
  NSOrderedCollectionDifference *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSIndexSet *v14;
  NSIndexSet *v15;
  NSArray *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _NSOrderedCollectionDifferenceMoves *v31;
  NSOrderedCollectionDifference *v32;
  NSOrderedCollectionDifference *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id *p_insertObjects;
  uint64_t v44;
  _NSOrderedCollectionDifferenceMoves *v45;
  NSIndexSet *v46;
  uint64_t v47;
  NSIndexSet *v48;
  uint64_t v49;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const __CFString *v56;
  NSOrderedCollectionDifference *v57;
  NSOrderedCollectionDifference *v58;
  NSIndexSet *v59;
  void *v60;
  void *v61;
  NSArray *v62;
  uint64_t v64;
  objc_super v65;
  objc_super v66;
  const __CFString *v67;
  NSNumber *v68;
  const __CFString *v69;
  NSNumber *v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)NSOrderedCollectionDifference;
  v11 = -[NSOrderedCollectionDifference init](&v65, sel_init);
  if (!v11)
    return v11;
  if (insertedObjects)
  {
    v12 = -[NSArray count](insertedObjects, "count");
    if (v12 != -[NSIndexSet count](inserts, "count"))
    {

      v54 = (void *)MEMORY[0x1E0C99DA0];
      v55 = *MEMORY[0x1E0C99778];
      v56 = CFSTR("Count of inserted objects does not match count of inserted indexes");
      goto LABEL_83;
    }
  }
  if (removedObjects)
  {
    v13 = -[NSArray count](removedObjects, "count");
    if (v13 != -[NSIndexSet count](removes, "count"))
    {

      v54 = (void *)MEMORY[0x1E0C99DA0];
      v55 = *MEMORY[0x1E0C99778];
      v56 = CFSTR("Count of removed objects does not match count of removed indexes");
      goto LABEL_83;
    }
  }
  if (-[NSArray count](changes, "count"))
  {
    v57 = v11;
    v60 = (void *)objc_opt_new();
    v61 = (void *)objc_opt_new();
    v14 = (NSIndexSet *)-[NSIndexSet mutableCopy](inserts, "mutableCopy");
    v62 = (NSArray *)-[NSArray mutableCopy](insertedObjects, "mutableCopy");
    v15 = (NSIndexSet *)-[NSIndexSet mutableCopy](removes, "mutableCopy");
    v16 = (NSArray *)-[NSArray mutableCopy](removedObjects, "mutableCopy");
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v17 = changes;
    v64 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
    if (!v64)
      goto LABEL_45;
    v18 = *(_QWORD *)v73;
    v59 = v14;
    while (1)
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v73 != v18)
          objc_enumerationMutation(v17);
        v20 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "index", v57);
        v22 = objc_msgSend(v20, "object");
        if (objc_msgSend(v20, "changeType") == 1)
        {
          if (-[NSIndexSet containsIndex:](v15, "containsIndex:", v21))
          {

            v51 = (void *)MEMORY[0x1E0C99DA0];
            v52 = *MEMORY[0x1E0C99778];
            v69 = CFSTR("index");
            v70 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21);
            v53 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
            v56 = CFSTR("Insert index duplicated between index set and additional changes parameters");
LABEL_79:
            v54 = v51;
            v55 = v52;
            goto LABEL_84;
          }
          -[NSIndexSet addIndex:](v15, "addIndex:", v21);
          if (v22)
            v23 = v16 == 0;
          else
            v23 = 1;
          if (v23)
          {
            if (v22)
              v24 = v16 == 0;
            else
              v24 = 0;
            if (v24)
            {

              v54 = (void *)MEMORY[0x1E0C99DA0];
              v55 = *MEMORY[0x1E0C99778];
              v56 = CFSTR("No removed objects array provided, but additional change included object");
              goto LABEL_83;
            }
            if (!v22 && v16)
            {

              v54 = (void *)MEMORY[0x1E0C99DA0];
              v55 = *MEMORY[0x1E0C99778];
              v56 = CFSTR("Removed objects array provided, but additional change omitted object");
              goto LABEL_83;
            }
          }
          else
          {
            -[NSArray insertObject:atIndex:](v16, "insertObject:atIndex:", v22, -[NSIndexSet countOfIndexesInRange:](v15, "countOfIndexesInRange:", 0, v21));
          }
          v27 = objc_msgSend(v20, "associatedIndex");
          v28 = v61;
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_42;
        }
        else
        {
          if (-[NSIndexSet containsIndex:](v14, "containsIndex:", v21))
          {

            v51 = (void *)MEMORY[0x1E0C99DA0];
            v52 = *MEMORY[0x1E0C99778];
            v67 = CFSTR("index");
            v68 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21);
            v53 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
            v56 = CFSTR("Remove index duplicated between index set and additional changes parameters");
            goto LABEL_79;
          }
          -[NSIndexSet addIndex:](v14, "addIndex:", v21);
          if (v22)
            v25 = v62 == 0;
          else
            v25 = 1;
          if (v25)
          {
            if (v22)
              v26 = v62 == 0;
            else
              v26 = 0;
            if (v26)
            {

              v54 = (void *)MEMORY[0x1E0C99DA0];
              v55 = *MEMORY[0x1E0C99778];
              v56 = CFSTR("No inserted objects array provided, but additional changes included objects");
              goto LABEL_83;
            }
            if (!v22 && v62)
            {

              v54 = (void *)MEMORY[0x1E0C99DA0];
              v55 = *MEMORY[0x1E0C99778];
              v56 = CFSTR("Inserted objects array provided, but additional change omitted object");
              goto LABEL_83;
            }
          }
          else
          {
            -[NSArray insertObject:atIndex:](v62, "insertObject:atIndex:", v22, -[NSIndexSet countOfIndexesInRange:](v14, "countOfIndexesInRange:", 0, v21));
          }
          v29 = objc_msgSend(v20, "associatedIndex");
          v27 = v21;
          v21 = v29;
          v14 = v59;
          v28 = v60;
          v17 = changes;
          if (v29 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_42:
            objc_msgSend(v28, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21));
            continue;
          }
        }
      }
      v64 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
      if (!v64)
      {
LABEL_45:
        v30 = v60;
        if ((objc_msgSend(v60, "isEqual:", v61, v57) & 1) != 0)
        {
          v11 = v58;
          if (objc_msgSend(v60, "count"))
          {
            v31 = [_NSOrderedCollectionDifferenceMoves alloc];
            if (v31
              && (v66.receiver = v31,
                  v66.super_class = (Class)_NSOrderedCollectionDifferenceMoves,
                  (v32 = -[NSOrderedCollectionDifference init](&v66, sel_init)) != 0))
            {
              v33 = v32;
              v32->_insertIndexes = (NSIndexSet *)objc_opt_new();
              v33->_insertObjects = (NSArray *)objc_opt_new();
              v33->_removeIndexes = (NSIndexSet *)0x7FFFFFFFFFFFFFFFLL;
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v34 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v78;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v78 != v36)
                      objc_enumerationMutation(changes);
                    v38 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                    v39 = objc_msgSend(v38, "associatedIndex");
                    if (v39 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v40 = v39;
                      v41 = objc_msgSend(v38, "index");
                      v42 = objc_msgSend(v38, "changeType");
                      p_insertObjects = (id *)&v33->_insertObjects;
                      if (v42 == 1)
                      {
                        p_insertObjects = (id *)&v33->_insertIndexes;
                        if ((NSIndexSet *)v41 < v33->_removeIndexes)
                        {
                          p_insertObjects = (id *)&v33->_insertIndexes;
                          v33->_removeIndexes = (NSIndexSet *)v41;
                        }
                      }
                      objc_msgSend(*p_insertObjects, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v40), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v41));
                    }
                  }
                  v35 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
                }
                while (v35);
              }
              v44 = -[NSArray count](v33->_insertObjects, "count");
              if (v44 == -[NSIndexSet count](v33->_insertIndexes, "count"))
              {
                v11 = v58;
                v45 = (_NSOrderedCollectionDifferenceMoves *)v33;
                v30 = v60;
              }
              else
              {
                v45 = (_NSOrderedCollectionDifferenceMoves *)v33;
                -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithChanges_, v33, CFSTR("NSOrderedCollectionDifference.m"), 38, CFSTR("Unbalanced number of remove and insert changes with associations."));
                v11 = v58;
                v30 = v60;
              }
            }
            else
            {
              v45 = 0;
            }
            v11->_moves = v45;
          }

          v11->_removeIndexes = v15;
          if (-[NSIndexSet count](v15, "count"))
          {
            v11->_removeObjects = v16;
          }
          else
          {
            v11->_removeObjects = 0;

          }
          v11->_insertIndexes = v14;
          if (-[NSIndexSet count](v14, "count"))
          {
            v11->_insertObjects = v62;
          }
          else
          {
            v11->_insertObjects = 0;

          }
          return v11;
        }

        v54 = (void *)MEMORY[0x1E0C99DA0];
        v55 = *MEMORY[0x1E0C99778];
        v56 = CFSTR("Inconsistent associations for moves");
LABEL_83:
        v53 = 0;
LABEL_84:
        objc_exception_throw((id)objc_msgSend(v54, "exceptionWithName:reason:userInfo:", v55, v56, v53));
      }
    }
  }
  v46 = (NSIndexSet *)-[NSIndexSet copy](inserts, "copy");
  v11->_insertIndexes = v46;
  v47 = -[NSIndexSet count](v46, "count");
  if (v47)
    v47 = -[NSArray copy](insertedObjects, "copy");
  v11->_insertObjects = (NSArray *)v47;
  v48 = (NSIndexSet *)-[NSIndexSet copy](removes, "copy");
  v11->_removeIndexes = v48;
  v49 = -[NSIndexSet count](v48, "count");
  if (v49)
    v49 = -[NSArray copy](removedObjects, "copy");
  v11->_removeObjects = (NSArray *)v49;
  return v11;
}

uint64_t __43__NSOrderedCollectionDifference_insertions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(a1 + 40), "_changeWithType:index:object:", 0, a2, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectAtIndex:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))++)));
}

uint64_t __41__NSOrderedCollectionDifference_removals__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(a1 + 40), "_changeWithType:index:object:", 1, a2, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectAtIndex:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))++)));
}

- (id)_changeWithType:(int64_t)a3 index:(unint64_t)a4 object:(id)a5
{
  _NSOrderedCollectionDifferenceMoves *moves;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  moves = self->_moves;
  if (!moves)
    goto LABEL_6;
  v9 = 16;
  if (a3 == 1)
    v9 = 8;
  v10 = (void *)objc_msgSend(*(id *)((char *)&moves->super.isa + v9), "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  if (v10)
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
  else
LABEL_6:
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  return -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]([NSOrderedCollectionChange alloc], "initWithObject:type:index:associatedIndex:", a5, a3, a4, v11);
}

- (NSOrderedCollectionDifference)initWithChanges:(NSArray *)changes
{
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSIndexSet *v14;
  NSIndexSet *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (!v5)
  {
    v14 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
    v15 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
    v17 = 0;
    v16 = 0;
    return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:](self, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:", v14, v17, v15, v16, changes);
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(changes);
      v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "changeType");
      v13 = objc_msgSend(v11, "object");
      if (v12 == 1)
      {
        if ((v7 & (v13 != 0)) != 0)
          goto LABEL_18;
        v8 |= v13 != 0;
      }
      else
      {
        if ((v8 & (v13 != 0)) != 0)
        {
LABEL_18:
          v14 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
          v15 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
          v17 = MEMORY[0x1E0C9AA60];
LABEL_19:
          v16 = MEMORY[0x1E0C9AA60];
          return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:](self, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:", v14, v17, v15, v16, changes);
        }
        v7 |= v13 != 0;
      }
    }
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](changes, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v6)
      continue;
    break;
  }
  v14 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
  v15 = +[NSIndexSet indexSet](NSIndexSet, "indexSet");
  v16 = 0;
  if ((v7 & 1) != 0)
    v17 = MEMORY[0x1E0C9AA60];
  else
    v17 = 0;
  if ((v8 & 1) != 0)
    goto LABEL_19;
  return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:](self, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:", v14, v17, v15, v16, changes);
}

- (NSOrderedCollectionDifference)differenceByTransformingChangesWithBlock:(void *)block
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSOrderedCollectionDifference *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSIndexSet count](self->_insertIndexes, "count") + -[NSIndexSet count](self->_removeIndexes, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(self);
        objc_msgSend(v5, "addObject:", (*((uint64_t (**)(void *, _QWORD))block + 2))(block, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      v7 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }
  v10 = -[NSOrderedCollectionDifference initWithChanges:]([NSOrderedCollectionDifference alloc], "initWithChanges:", v5);

  return v10;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  $F47E6FD2C860BA709628269A5CAA8F34 *v7;
  unint64_t var0;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  NSUInteger v19;
  SEL v21;
  $F47E6FD2C860BA709628269A5CAA8F34 *v22;
  unint64_t v23;

  v7 = a3;
  var0 = a3->var0;
  if (a3->var0)
  {
    v11 = a3->var3[0];
    v12 = a3->var3[1];
  }
  else if (-[NSIndexSet count](self->_removeIndexes, "count"))
  {
    v12 = -[NSIndexSet lastIndex](self->_removeIndexes, "lastIndex");
    v11 = 1;
  }
  else
  {
    if (!-[NSIndexSet count](self->_insertIndexes, "count"))
      return 0;
    v12 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
    v11 = 0;
  }
  v13 = -[NSIndexSet count](self->_removeIndexes, "count");
  v14 = -[NSIndexSet count](self->_insertIndexes, "count");
  v15 = 0;
  if (a5)
  {
    v21 = a2;
    v16 = v14 + v13;
    if (var0 < v14 + v13)
    {
      v15 = 0;
      v22 = v7;
      v23 = var0 - v13;
      v17 = ~var0 + v13;
      while (1)
      {
        if (v11 == 1)
        {
          v18 = -[NSOrderedCollectionDifference _changeWithType:index:object:](self, "_changeWithType:index:object:", 1, v12, -[NSArray objectAtIndex:](self->_removeObjects, "objectAtIndex:", v17));
          v19 = -[NSIndexSet indexLessThanIndex:](self->_removeIndexes, "indexLessThanIndex:", v12);
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
            v11 = 0;
            if (v18)
              goto LABEL_15;
          }
          else
          {
            v12 = v19;
            v11 = 1;
            if (v18)
              goto LABEL_15;
          }
        }
        else
        {
          v18 = -[NSOrderedCollectionDifference _changeWithType:index:object:](self, "_changeWithType:index:object:", 0, v12, -[NSArray objectAtIndex:](self->_insertObjects, "objectAtIndex:", v23 + v15));
          v12 = -[NSIndexSet indexGreaterThanIndex:](self->_insertIndexes, "indexGreaterThanIndex:", v12);
          if (v18)
            goto LABEL_15;
        }
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v21, self, CFSTR("NSOrderedCollectionDifference.m"), 502, CFSTR("Failed to materialize change for diff offset %lu"), var0 + v15);
LABEL_15:
        a4[v15++] = v18;
        if (v15 + var0 < v16)
        {
          --v17;
          if (v15 < a5)
            continue;
        }
        var0 += v15;
        v7 = v22;
        break;
      }
    }
  }
  v7->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  v7->var3[0] = v11;
  v7->var3[1] = v12;
  v7->var0 = var0;
  v7->var1 = a4;
  return v15;
}

- (NSArray)insertions
{
  void *v3;
  void *v4;
  NSIndexSet *insertIndexes;
  void *v6;
  _QWORD v8[7];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x186DA8F78](self, a2);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSIndexSet count](self->_insertIndexes, "count"));
  insertIndexes = self->_insertIndexes;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NSOrderedCollectionDifference_insertions__block_invoke;
  v8[3] = &unk_1E0F51990;
  v8[4] = v4;
  v8[5] = self;
  v8[6] = v9;
  -[NSIndexSet enumerateIndexesUsingBlock:](insertIndexes, "enumerateIndexesUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v4, "copy");
  _Block_object_dispose(v9, 8);
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v6;
}

- (NSArray)removals
{
  void *v3;
  void *v4;
  NSIndexSet *removeIndexes;
  void *v6;
  _QWORD v8[7];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x186DA8F78](self, a2);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSIndexSet count](self->_removeIndexes, "count"));
  removeIndexes = self->_removeIndexes;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__NSOrderedCollectionDifference_removals__block_invoke;
  v8[3] = &unk_1E0F51990;
  v8[4] = v4;
  v8[5] = self;
  v8[6] = v9;
  -[NSIndexSet enumerateIndexesUsingBlock:](removeIndexes, "enumerateIndexesUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v4, "copy");
  _Block_object_dispose(v9, 8);
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSOrderedCollectionDifference;
  -[NSOrderedCollectionDifference dealloc](&v3, sel_dealloc);
}

- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects
{
  return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:](self, "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:", inserts, insertedObjects, removes, removedObjects, MEMORY[0x1E0C9AA60]);
}

- (BOOL)hasChanges
{
  NSUInteger v3;

  v3 = -[NSIndexSet count](self->_removeIndexes, "count");
  return v3 + -[NSIndexSet count](self->_insertIndexes, "count") != 0;
}

- (NSOrderedCollectionDifference)init
{
  return -[NSOrderedCollectionDifference initWithChanges:](self, "initWithChanges:", MEMORY[0x1E0C9AA60]);
}

- (void)_enumerateChangesInDiffOrderWithBlock:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  v5 = -[NSIndexSet count](self->_removeIndexes, "count");
  v6 = -[NSIndexSet count](self->_insertIndexes, "count");
  v7 = -[NSIndexSet firstIndex](self->_removeIndexes, "firstIndex");
  v8 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
  if (v5 | v6)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    do
    {
      if (v7 - v11 <= v9 - v10)
      {
        (*((void (**)(id, id))a3 + 2))(a3, -[NSOrderedCollectionDifference _changeWithType:index:object:](self, "_changeWithType:index:object:", 1, v7, -[NSArray objectAtIndex:](self->_removeObjects, "objectAtIndex:", v11++)));
        v7 = -[NSIndexSet indexGreaterThanIndex:](self->_removeIndexes, "indexGreaterThanIndex:", v7);
      }
      else
      {
        (*((void (**)(id, id))a3 + 2))(a3, -[NSOrderedCollectionDifference _changeWithType:index:object:](self, "_changeWithType:index:object:", 0, v9, -[NSArray objectAtIndex:](self->_insertObjects, "objectAtIndex:", v10++)));
        v9 = -[NSIndexSet indexGreaterThanIndex:](self->_insertIndexes, "indexGreaterThanIndex:", v9);
      }
    }
    while (v11 < v5 || v10 < v6);
  }
}

- (NSOrderedCollectionDifference)inverseDifference
{
  void *v3;
  NSOrderedCollectionDifference *v4;

  v3 = (void *)MEMORY[0x186DA8F78](self, a2);
  v4 = -[NSOrderedCollectionDifference differenceByTransformingChangesWithBlock:](self, "differenceByTransformingChangesWithBlock:", &__block_literal_global_62);
  objc_autoreleasePoolPop(v3);
  return v4;
}

NSOrderedCollectionChange *__50__NSOrderedCollectionDifference_inverseDifference__block_invoke(uint64_t a1, void *a2)
{
  return -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]([NSOrderedCollectionChange alloc], "initWithObject:type:index:associatedIndex:", objc_msgSend(a2, "object"), objc_msgSend(a2, "changeType") != 1, objc_msgSend(a2, "index"), objc_msgSend(a2, "associatedIndex"));
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSIndexSet hash](self->_insertIndexes, "hash");
  v4 = -[NSIndexSet hash](self->_removeIndexes, "hash") + v3;
  v5 = v4 ^ (-[NSArray hash](self->_removeObjects, "hash") << 8);
  v6 = v5 ^ (-[NSArray hash](self->_insertObjects, "hash") << 16);
  return v6 ^ (-[_NSOrderedCollectionDifferenceMoves hash](self->_moves, "hash") << 24);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSArray *removeObjects;
  NSArray *insertObjects;
  _NSOrderedCollectionDifferenceMoves *moves;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = -[NSIndexSet isEqual:](self->_removeIndexes, "isEqual:", *((_QWORD *)a3 + 3));
    if (v5)
    {
      removeObjects = self->_removeObjects;
      if (removeObjects == *((NSArray **)a3 + 4) || (v5 = -[NSArray isEqual:](removeObjects, "isEqual:")) != 0)
      {
        v5 = -[NSIndexSet isEqual:](self->_insertIndexes, "isEqual:", *((_QWORD *)a3 + 1));
        if (v5)
        {
          insertObjects = self->_insertObjects;
          if (insertObjects == *((NSArray **)a3 + 2) || (v5 = -[NSArray isEqual:](insertObjects, "isEqual:")) != 0)
          {
            moves = self->_moves;
            LOBYTE(v5) = moves == *((_NSOrderedCollectionDifferenceMoves **)a3 + 5)
                      || -[_NSOrderedCollectionDifferenceMoves isEqual:](moves, "isEqual:");
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  NSUInteger v3;
  NSUInteger v4;
  objc_class *v5;
  NSString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = -[NSIndexSet count](self->_removeIndexes, "count");
  v4 = -[NSIndexSet count](self->_insertIndexes, "count");
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = CFSTR("s");
  if (v4 == 1)
    v8 = &stru_1E0F56070;
  else
    v8 = CFSTR("s");
  if (v3 == 1)
    v7 = &stru_1E0F56070;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>(%lu insertion%@, %lu removal%@)"), v6, self, v4, v8, v3, v7);
}

- (id)debugDescription
{
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableString *v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t i;
  _QWORD v13[14];
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  NSMutableString *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD v23[3];
  char v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  _QWORD v36[4];
  _QWORD v37[4];
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOrderedCollectionDifference hasChanges](self, "hasChanges");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v45;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v5)
        objc_enumerationMutation(self);
      objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v6), "object");
      if (!_NSIsNSString())
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else if (v3)
  {
LABEL_11:
    v7 = (NSMutableString *)(id)objc_opt_new();
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__20;
    v34 = __Block_byref_object_dispose__20;
    v35 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v15 = ___diffStr_block_invoke;
    v16 = &unk_1E0F519D8;
    v17 = v7;
    v18 = v29;
    v19 = v27;
    v20 = v28;
    v21 = v26;
    v22 = &v30;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___diffStr_block_invoke_2;
    v13[3] = &unk_1E0F51A00;
    v13[6] = v26;
    v13[7] = v23;
    v13[8] = v25;
    v13[9] = &v30;
    v13[4] = v14;
    v13[5] = v27;
    v13[10] = v29;
    v13[11] = v28;
    v13[12] = v36;
    v13[13] = v37;
    -[NSOrderedCollectionDifference _enumerateChangesInDiffOrderWithBlock:](self, "_enumerateChangesInDiffOrderWithBlock:", v13);
    if (v31[5])
      v15((uint64_t)v14);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v37, 8);
    return v7;
  }
  v7 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@ ("), -[NSOrderedCollectionDifference description](self, "description"));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v40;
    v10 = CFSTR("\n");
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(self);
        -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("\n\t%@"), objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "debugDescription"));
      }
      v8 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v8);
  }
  else
  {
    v10 = &stru_1E0F56070;
  }
  -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("%@)"), v10);
  return v7;
}

@end
