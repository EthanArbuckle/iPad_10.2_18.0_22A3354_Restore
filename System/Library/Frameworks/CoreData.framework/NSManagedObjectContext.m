@implementation NSManagedObjectContext

- (id)_retainedObjectWithID:(_QWORD *)a1 optionalHandler:(void *)a2 withInlineStorage:(uint64_t)a3
{
  void *Value;
  unint64_t *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a1)
    return 0;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a1, sel__retainedObjectWithID_optionalHandler_withInlineStorage_);
  Value = (void *)_PFCMT_GetValue(a1[15], a2);
  if (Value)
    return Value;
  v8 = (unint64_t *)objc_msgSend(a2, "entity");
  v9 = (void *)objc_msgSend(_PFFastEntityClass(v8), "allocWithEntity:", v8);
  _PFfastOidRetain(0, (unint64_t)a2);
  v10 = (void *)objc_msgSend(v9, "_initWithEntity:withID:withHandler:withContext:", v8, a2, a3, a1);
  -[NSManagedObjectContext _registerObject:withID:]((uint64_t)a1, (uint64_t)v10, a2);
  v11 = (void *)*a1[23];
  if (v11 && objc_msgSend(v11, "containsObject:", a2))
  {
    if (!objc_msgSend(v10, "managedObjectContext"))
      -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)a1, v10);
    objc_msgSend(a1, "deleteObject:", v10);
  }
  return v10;
}

- (void)_registerObject:(void *)a3 withID:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;

  if (a1)
  {
    if (!a3)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = CFSTR("cannot record object with null globalID");
LABEL_19:
      objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
    }
    v6 = *(_QWORD *)(a2 + 32);
    if (v6)
    {
      if (v6 != a1)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("An NSManagedObject may only be in (or observed by) a single NSManagedObjectContext.");
        goto LABEL_19;
      }
    }
    else
    {
      *(_QWORD *)(a2 + 32) = a1;
    }
    v10 = *(void **)(a2 + 40);
    if (!v10 || v10 == a3)
    {
      *(_QWORD *)(a2 + 40) = a3;
    }
    else
    {
      -[NSManagedObject _setObjectID__:]((_QWORD *)a2, a3);
      v11 = *(_QWORD *)(a2 + 24);
      if (v11)
        snapshot_set_objectID(v11, a3);
    }
    if (!*(_QWORD *)(a2 + 56))
    {
      v12 = (unsigned int *)(*(_QWORD *)(a1 + 160) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
      *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 160);
    }
    *(_DWORD *)(a2 + 16) &= 0xFFF7FF7F;
    _PFCMT_SetValue(*(_QWORD *)(a1 + 120), a3, (const void *)a2);
  }
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

- (id)_createStoreFetchRequestForFetchRequest:(id *)a1
{
  id *v2;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSExpressionDescription *v38;
  int v39;
  id *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFRange result;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  CFRange v56;
  CFRange v57;

  v2 = a1;
  v55 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)MEMORY[0x18D76B4E4]();
    v5 = objc_msgSend(a2, "resultType");
    if (v5 == 2)
      v6 = 0;
    else
      v6 = objc_msgSend(a2, "includesPendingChanges");
    v7 = objc_msgSend(a2, "fetchLimit");
    v8 = (void *)objc_msgSend(a2, "propertiesToFetch");
    v9 = (void *)objc_msgSend(a2, "relationshipKeyPathsForPrefetching");
    if (objc_msgSend(v8, "count"))
    {
      v10 = (id)objc_msgSend(a2, "copy");
      a2 = v10;
      if (v5 == 4 || v5 == 1)
      {
        objc_msgSend(v10, "setPropertiesToFetch:", 0);
        objc_msgSend(a2, "setRelationshipKeyPathsForPrefetching:", 0);
      }
      else if (!v5 && objc_msgSend(v9, "count"))
      {
        v39 = v6;
        v40 = v2;
        v41 = v7;
        v42 = a2;
        v43 = v4;
        v11 = (void *)objc_msgSend((id)objc_msgSend(a2, "entity"), "relationshipsByName");
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v50 != v15)
                objc_enumerationMutation(v9);
              v17 = *(const __CFString **)(*((_QWORD *)&v49 + 1) + 8 * i);
              result.location = 0;
              result.length = 0;
              if (v17
                && (v56.length = CFStringGetLength(v17),
                    v56.location = 0,
                    CFStringFindWithOptions(v17, CFSTR("."), v56, 0, &result)))
              {
                v57.length = result.location;
                v57.location = 0;
                v17 = CFStringCreateWithSubstring(0, v17, v57);
                v18 = v17;
              }
              else
              {
                v18 = 0;
              }
              v19 = (void *)objc_msgSend(v11, "objectForKey:", v17);
              if (v19)
              {
                v20 = v19;
                if ((objc_msgSend(v19, "_isToManyRelationship") & 1) == 0)
                  objc_msgSend(v12, "addObject:", v20);
              }
              if (v18)
                CFRelease(v18);
            }
            v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
          }
          while (v14);
        }
        a2 = v42;
        if (objc_msgSend(v12, "count"))
        {
          v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v45 != v24)
                  objc_enumerationMutation(v12);
                v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
                if (objc_msgSend(v8, "indexOfObjectIdenticalTo:", v26) == 0x7FFFFFFFFFFFFFFFLL)
                  objc_msgSend(v21, "addObject:", v26);
              }
              v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
            }
            while (v23);
          }
          objc_msgSend(v42, "setPropertiesToFetch:", v21);
        }

        v4 = v43;
        v2 = v40;
        v7 = v41;
        v6 = v39;
      }
    }
    if (v7)
      v27 = v6;
    else
      v27 = 0;
    if (v27 == 1
      && (*((_BYTE *)v2 + 41) & 8) != 0
      && (v28 = objc_msgSend(v2[12], "count"),
          v29 = objc_msgSend(v2[7], "count") + v28,
          (v30 = v29 + objc_msgSend(v2[11], "count")) != 0))
    {
      v2 = (id *)objc_msgSend(a2, "_copyForDirtyContext");
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend((id)objc_msgSend(v2, "substitutionVariables"), "mutableCopy");
        v32 = (void *)objc_msgSend((id)objc_msgSend(v31, "objectForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")), "constantValue");
        if (v32)
          v7 = objc_msgSend(v32, "unsignedIntegerValue");
        v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + v30);
        objc_msgSend(v31, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v33), CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"));
        objc_msgSend(v2, "setSubstitutionVariables:", v31);

      }
      else
      {
        objc_msgSend(v2, "setFetchLimit:", v30 + v7);
      }
    }
    else if (objc_msgSend(a2, "resultType") == 2
           && objc_msgSend(a2, "fetchBatchSize")
           && !objc_msgSend((id)objc_msgSend(a2, "propertiesToFetch"), "count"))
    {
      v35 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entity"), "attributesByName"), "allValues"), "mutableCopy");
      objc_msgSend(v35, "sortUsingFunction:context:", _comparePropertiesByName, 0);
      v36 = objc_msgSend(v35, "count");
      v37 = v36 - 1;
      if (v36 != 1)
      {
        do
        {
          if (objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v37), "isTransient"))
            objc_msgSend(v35, "removeObjectAtIndex:", v37);
          --v37;
        }
        while (v37);
      }
      v38 = objc_alloc_init(NSExpressionDescription);
      -[NSPropertyDescription setName:](v38, "setName:", CFSTR("objectID"));
      -[NSExpressionDescription setExpression:](v38, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
      -[NSExpressionDescription setExpressionResultType:](v38, "setExpressionResultType:", 2000);
      objc_msgSend(v35, "addObject:", v38);

      v2 = (id *)objc_msgSend(a2, "copy");
      objc_msgSend(v2, "setPropertiesToFetch:", v35);
    }
    else
    {
      v2 = a2;
    }
    objc_autoreleasePoolPop(v4);
  }
  return v2;
}

- (NSTimeInterval)stalenessInterval
{
  return self->_fetchTimestamp;
}

- (id)_queryGenerationToken__
{
  id v2;

  if (self->_parentObjectStore && (*((_BYTE *)&self->_flags + 2) & 8) != 0)
    v2 = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
  else
    v2 = (id)*((_QWORD *)self->_additionalPrivateIvars + 12);
  return v2;
}

- (NSManagedObjectContext)retain
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

- (BOOL)_setChangeTrackingTokenFromToken:(id)a3 error:(id *)a4
{
  _QWORD v5[6];

  if (self->_parentObjectStore && (*((_BYTE *)&self->_flags + 2) & 8) != 0)
    return 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke;
  v5[3] = &unk_1E1EDD430;
  v5[4] = a3;
  v5[5] = self;
  if (self->_dispatchQueue)
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5, a4);
  else
    __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke((uint64_t)v5);
  return 1;
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
          -[NSManagedObjectContext dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (void)_processReferenceQueue:(uint64_t)a1
{
  if (a1)
  {
    if (_PF_Threading_Debugging_level && (a2 & 1) == 0)
    {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processReferenceQueue_);
      if ((a2 & 1) != 0)
        goto LABEL_6;
    }
    else if ((a2 & 1) != 0)
    {
LABEL_6:
      -[_PFManagedObjectReferenceQueue _processReferenceQueue:](*(_QWORD *)(a1 + 160), a2);
      return;
    }
    if ((*(_BYTE *)(a1 + 42) & 0x20) == 0)
      goto LABEL_6;
  }
}

- (void)_forgetObject:(id)a3 propagateToObjectStore:(BOOL)a4 removeFromRegistry:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _DWORD *v7;
  void *v9;
  int v10;
  int v11;
  const __CFAllocator *v12;
  CFArrayRef v13;
  id parentObjectStore;
  void *v15;
  uint64_t v16;
  uint64_t i;
  _DWORD *v18;
  void *v19;
  void *values;
  __int128 v21;
  __int128 v22;
  __int128 v23;
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
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  values = a3;
  if (a3)
  {
    v5 = a5;
    v6 = a4;
    v7 = a3;
    v9 = (void *)objc_msgSend(a3, "objectID");
    v10 = v7[4];
    v11 = v10 | 0x80;
    v7[4] = v10 | 0x80;
    if (v5 && (v10 & 0x80000) == 0)
    {
      _PFCMT_RemoveValue(&self->_infoByGID->super.isa, v9);
      v11 = v7[4];
    }
    v7[4] = v11 | 0x80080;
    if (!v6 || (v11 & 0x200) == 0 || (objc_msgSend(v9, "isTemporaryID") & 1) != 0)
      goto LABEL_30;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = _PFStackAllocatorCreate((unint64_t *)&v21, 1024);
    v13 = CFArrayCreate(v12, (const void **)&values, 1, 0);
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    parentObjectStore = self->_parentObjectStore;
    if (-[__CFArray count](v13, "count"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[__CFArray count](v13, "count"));
      v16 = -[__CFArray count](v13, "count");
      if (v16)
      {
        for (i = 0; i != v16; ++i)
        {
          v18 = (_DWORD *)-[__CFArray objectAtIndex:](v13, "objectAtIndex:", i);
          v19 = (void *)objc_msgSend(v18, "objectID");
          if ((objc_msgSend(v19, "isTemporaryID") & 1) == 0)
          {
            objc_msgSend(v15, "addObject:", v19);
            if (v18)
              v18[4] &= ~0x200u;
          }
        }
      }
      objc_msgSend(parentObjectStore, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v15, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));

    }
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    if (*((_QWORD *)&v22 + 1))
    {
      if (v13)
        CFRelease(v13);
    }
    else
    {
      *((_QWORD *)&v21 + 1) = v21;
    }
    v7 = values;
    if (values)
    {
LABEL_30:
      if ((v7[4] & 9) == 0
        || (-[NSMutableSet removeObject:](self->_unprocessedChanges, "removeObject:", v7),
            -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", values),
            (v7 = values) != 0))
      {
        if ((v7[4] & 0x12) == 0
          || (-[NSMutableSet removeObject:](self->_unprocessedInserts, "removeObject:", v7),
              -[NSMutableSet removeObject:](self->_insertedObjects, "removeObject:", values),
              (v7 = values) != 0))
        {
          if ((v7[4] & 0x24) == 0
            || (-[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", v7),
                -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", values),
                (v7 = values) != 0))
          {
            v7[4] &= 0xFFFFFFC0;
          }
        }
      }
    }
  }
}

- (uint64_t)lockObjectStore
{
  _QWORD *v1;

  if (result && _PF_Threading_Debugging_level)
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 24))
    {
      result = _PFAssertSafeMultiThreadedAccess_impl(result, sel_lockObjectStore);
    }
    else
    {
      result = objc_msgSend(*(id *)(result + 136), "tryLock");
      if ((result & 1) == 0)
      {
        result = objc_opt_self();
        __break(1u);
        return result;
      }
    }
    if (!v1[3])
    {
      if (v1[1])
        return objc_msgSend(*(id *)(*(_QWORD *)(v1[23] + 56) + 32), "addObject:", NSKeyValueCoding_NullValue);
      else
        v1[1] = v1[4];
    }
  }
  return result;
}

- (uint64_t)unlockObjectStore
{
  uint64_t v1;

  if (result && _PF_Threading_Debugging_level)
  {
    v1 = result;
    if (*(_QWORD *)(result + 24))
      return _PFAssertSafeMultiThreadedAccess_impl(v1, sel_unlockObjectStore);
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 184) + 56) + 32), "count");
    if (result)
      result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 184) + 56) + 32), "removeLastObject");
    else
      *(_QWORD *)(v1 + 8) = 0;
    if (!*(_QWORD *)(v1 + 24))
      return objc_msgSend(*(id *)(v1 + 136), "unlock");
    if (_PF_Threading_Debugging_level)
      return _PFAssertSafeMultiThreadedAccess_impl(v1, sel_unlockObjectStore);
  }
  return result;
}

void __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke(uint64_t a1)
{
  id Weak;
  uint64_t v2;

  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = (uint64_t)Weak;
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)Weak, sel_processPendingChanges);
    -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
  }
}

void __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  const void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    v4 = WeakRetained;
    v5 = *(const void **)(a1 + 40);
    if (WeakRetained)
    {
      if ((*((_BYTE *)WeakRetained + 42) & 0x20) == 0)
      {
        v6 = (void *)MEMORY[0x18D76B4E4]();
        -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)v5, 0);
        objc_autoreleasePoolPop(v6);
        if (v4[3])
        {
          v4[19] = 0;
          __dmb(0xBu);
        }
      }
    }
  }
  else
  {
    v4 = 0;
    v5 = *(const void **)(a1 + 40);
  }

  CFRelease(v5);
}

uint64_t __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setPersistentStoreCoordinator:](*(_QWORD *)(a1 + 32), *(CFTypeRef *)(a1 + 40));
}

_QWORD *__41__NSManagedObjectContext_setMergePolicy___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  id v3;

  v1 = *(void **)(*(_QWORD *)(result[5] + 184) + 24);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    v3 = NSErrorMergePolicy;
    if (v2[4])
      v3 = (id)v2[4];
    *(_QWORD *)(*(_QWORD *)(v2[5] + 184) + 24) = v3;
    return *(id *)(*(_QWORD *)(v2[5] + 184) + 24);
  }
  return result;
}

- (void)_setUndoManager:(uint64_t)a1
{
  id v4;

  if (a1 && *(void **)(*(_QWORD *)(a1 + 184) + 40) != a2)
  {
    -[NSManagedObjectContext _stopObservingUndoManagerNotifications](a1);

    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 40) = a2;
    if (a2)
    {
      v4 = a2;
      -[NSManagedObjectContext _startObservingUndoManagerNotifications](a1);
    }
  }
}

void __41__NSManagedObjectContext_setUndoManager___block_invoke(uint64_t a1)
{
  -[NSManagedObjectContext _setUndoManager:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

_BYTE *__83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if ((result[43] & 4) != 0)
    return (_BYTE *)objc_msgSend(result, "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __43__NSManagedObjectContext_transactionAuthor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) + 128), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __47__NSManagedObjectContext_setTransactionAuthor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 128)) & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184);
    v4 = *(void **)(v3 + 128);
    if (v2)
    {
      v5 = *(void **)(v3 + 128);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 128) = objc_msgSend(v2, "copy");

    }
    else
    {
      *(_QWORD *)(v3 + 128) = 0;

    }
  }
}

uint64_t __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 40);
  if (((v3 >> 26) & 1) != (_DWORD)v1)
  {
    *(_QWORD *)(v2 + 40) = v3 & 0xFFFFFFFFFBFFFFFFLL | (v1 << 26);
    v4 = *(_QWORD *)(result + 32);
    if ((*(_BYTE *)(v4 + 43) & 4) != 0)
    {
      if (*(_QWORD *)(v4 + 32))
      {
        if (*(_QWORD *)(v4 + 24))
          return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", *(_QWORD *)(result + 32), sel__automaticallyMergeChangesFromContextDidSaveNotification_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), *(_QWORD *)(*(_QWORD *)(result + 32) + 32));
      }
    }
    else
    {
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", *(_QWORD *)(result + 32), CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), *(_QWORD *)(*(_QWORD *)(result + 32) + 32));
    }
  }
  return result;
}

uint64_t __30__NSManagedObjectContext_name__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  void *v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke;
  v7[3] = &unk_1E1EDE590;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  _perform((uint64_t)self, (uint64_t)v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __65__NSManagedObjectContext__setChangeTrackingTokenFromToken_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184);
  v4 = *(void **)(v3 + 120);
  if (v2 != v4)
  {
    if (v2)
    {
      v5 = *(void **)(v3 + 120);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 120) = v2;
      v4 = v5;
    }
    else
    {
      *(_QWORD *)(v3 + 120) = 0;
    }

  }
}

void __34__NSManagedObjectContext_setName___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  char *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  void (*v7)(uint64_t);
  uint64_t *p_block;
  uint64_t v9;
  uint64_t block;
  char __str[512];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = *(_QWORD *)(a1 + 40);
  v2 = *(_BYTE **)(a1 + 32);
  if ((v2[42] & 0x40) != 0)
  {
    __str[0] = 0;
    if (*(_QWORD *)(a1 + 40))
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p: ", v2);
      objc_msgSend(*(id *)(a1 + 40), "UTF8String");
      __strlcat_chk();
    }
    else
    {
      snprintf(__str, 0x1FFuLL, "NSManagedObjectContext %p", v2);
    }
    v3 = strdup(__str);
    __dmb(0xBu);
    v4 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + *(unsigned __int16 *)(MEMORY[0x1E0C82E70] + 2));
    v5 = *v4;
    do
    {
      v6 = __ldaxr(v4);
      if (v6 != v5)
      {
        __clrex();
        block = MEMORY[0x1E0C809B0];
        v7 = __34__NSManagedObjectContext_setName___block_invoke_2;
        p_block = &block;
        goto LABEL_11;
      }
    }
    while (__stlxr((unint64_t)v3, v4));
    if (!v5)
      return;
    v9 = MEMORY[0x1E0C809B0];
    v7 = __34__NSManagedObjectContext_setName___block_invoke_3;
    p_block = &v9;
    v3 = (char *)v5;
LABEL_11:
    p_block[1] = 3221225472;
    p_block[2] = (uint64_t)v7;
    p_block[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
    p_block[4] = (uint64_t)v3;
    dispatch_async(MEMORY[0x1E0C80D38], p_block);
  }
}

uint64_t __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(result + 40) << 33);
  return result;
}

uint64_t __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)*(unsigned __int8 *)(result + 40) << 23);
  return result;
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), &v5);
  if (v3)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v3);
  return objc_msgSend(v2, "drain");
}

_QWORD *__43__NSManagedObjectContext_setParentContext___block_invoke(uint64_t a1)
{
  return -[NSManagedObjectContext _setParentContext:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

- (_QWORD)_setParentContext:(_QWORD *)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = (uint64_t)result;
    result[5] |= 0x80000uLL;
    v4 = objc_msgSend(a2, "persistentStoreCoordinator");
    *(_QWORD *)(v3 + 32) = a2;
    if (a2)
      CFRetain(a2);
    -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, v4);
    result = -[_PFContextMapTable setForUseWithCoordinator:](*(_QWORD **)(v3 + 120), v4);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 96);
      if (v5)
        v5 = *(_QWORD *)(v5 + 48);
    }
    else
    {
      v5 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(v3 + 184) + 80) = v5;
  }
  return result;
}

double __47__NSManagedObjectContext_setStalenessInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 144) = result;
  return result;
}

void __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  char v3;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1)
  {
    if ((v1[41] & 1) == 0)
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "_isDeallocating");
      v1 = *(_BYTE **)(a1 + 32);
      if ((v3 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *(_QWORD *)(a1 + 40)));
        -[NSManagedObjectContext _processReferenceQueue:](*(_QWORD *)(a1 + 32), 0);
        v1 = *(_BYTE **)(a1 + 32);
      }
    }
  }

}

- (NSArray)executeFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  void *v8;
  NSError *v9;
  NSArray *result;
  NSManagedObjectModel *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSFetchRequestResultType v22;
  NSUInteger v23;
  uint64_t v24;
  NSFetchRequestResultType v25;
  id v26;
  int v27;
  id *v28;
  int v29;
  void *v30;
  id v31;
  id v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  _BOOL4 v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  NSArray *v63;
  NSArray *v64;
  CFIndex v65;
  CFStringRef (__cdecl *v66)(const void *);
  uint64_t v67;
  __CFSet *changedObjects;
  NSMutableSet *unprocessedChanges;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  NSMutableSet *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  int v86;
  void *v87;
  uint64_t v88;
  __CFSet *insertedObjects;
  NSMutableSet *unprocessedInserts;
  uint64_t v91;
  uint64_t v92;
  uint64_t m;
  NSMutableSet *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  uint64_t v98;
  uint64_t v99;
  uint64_t ii;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  NSMutableSet *deletedObjects;
  uint64_t v109;
  uint64_t v110;
  uint64_t jj;
  void *v112;
  uint64_t v113;
  void *v114;
  BOOL v115;
  unint64_t v116;
  id v117;
  uint64_t v118;
  NSEntityDescription *v119;
  uint64_t v120;
  NSArray *v121;
  id v122;
  int v123;
  int v124;
  int v125;
  NSFetchRequest *v126;
  NSManagedObjectContext *v127;
  id v128;
  id v129;
  uint64_t v130;
  _BOOL4 v131;
  NSEntityDescription *v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  id v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  CFSetCallBacks callBacks;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v161 = 0;
  if (!request)
  {
    request = (NSFetchRequest *)CFSTR("<null>");
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:
    v34 = (void *)MEMORY[0x1E0C99DA0];
    v35 = *MEMORY[0x1E0C99778];
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ is not a valid NSFetchRequest."), NSStringFromSelector(a2), request);
LABEL_27:
    v37 = v36;
    v38 = v34;
    v39 = v35;
    goto LABEL_28;
  }
  v8 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 19);
  if (v8)
  {
    if (error)
    {
      v9 = v8;
      result = 0;
      *error = v9;
      return result;
    }
    return 0;
  }
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  -[NSFetchRequest _resolveEntityWithContext:](request, "_resolveEntityWithContext:", self);
  if (!-[NSFetchRequest entity](request, "entity"))
  {
    v34 = (void *)MEMORY[0x1E0C99DA0];
    v35 = *MEMORY[0x1E0C99778];
    v36 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ A fetch request must have an entity."), NSStringFromSelector(a2), v120);
    goto LABEL_27;
  }
  v11 = -[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"), "managedObjectModel");
  if (v11 != -[NSEntityDescription managedObjectModel](-[NSFetchRequest entity](request, "entity"), "managedObjectModel")&& !-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v119 = -[NSFetchRequest entity](request, "entity");
    -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name");
    v13 = objc_msgSend(v12, "stringWithFormat:", CFSTR("The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's"));
    v14 = -[NSDictionary objectForKey:](-[NSManagedObjectModel entitiesByName](-[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name"));
    if (v14)
    {
      v21 = v14;
      _NSCoreDataLog(1, v13, v15, v16, v17, v18, v19, v20, (uint64_t)v119);
      request = (NSFetchRequest *)(id)-[NSFetchRequest copy](request, "copy");
      -[NSFetchRequest setEntity:](request, "setEntity:", v21);
      goto LABEL_13;
    }
    v40 = (void *)MEMORY[0x1E0C99DA0];
    v41 = *MEMORY[0x1E0C99778];
    v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The fetch request's entity %p '%@' appears to be from a different NSManagedObjectModel than this context's"), -[NSFetchRequest entity](request, "entity"), -[NSEntityDescription name](-[NSFetchRequest entity](request, "entity"), "name"));
    v38 = v40;
    v39 = v41;
LABEL_28:
    objc_exception_throw((id)objc_msgSend(v38, "exceptionWithName:reason:userInfo:", v39, v37, 0));
  }
LABEL_13:
  -[NSFetchRequest allowEvaluation](request, "allowEvaluation");
  v22 = -[NSFetchRequest resultType](request, "resultType");
  if (v22 == 4)
  {
    v23 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", request, error);
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
      return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v24);
    }
    return 0;
  }
  v25 = v22;
  v26 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (v25 != 2
    && -[NSFetchRequest includesPendingChanges](request, "includesPendingChanges")
    && -[NSManagedObjectContext hasChanges](self, "hasChanges"))
  {
    if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((_BOOL8)self))
      -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  v126 = request;
  v28 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, request);
  v130 = objc_msgSend(v28, "resultType");
  v29 = objc_msgSend(v28, "includesPropertyValues");
  -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
  v127 = self;
  v125 = v29;
  v30 = (void *)objc_msgSend(self->_parentObjectStore, "executeRequest:withContext:error:", v28, self, &v161);
  v31 = v30;
  if (v30)
  {
    v32 = v30;
    v33 = 1;
  }
  else
  {
    v33 = 0;
  }
  v42 = v161;

  objc_msgSend(v26, "drain");
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  v43 = v161;
  if (v161)
  {
    if (v31)
    {
      v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetching generated an error AND a result: %@");
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, (uint64_t)v161);
      v51 = __pflogFaultLog;
      v52 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      v43 = v161;
      if (v52)
      {
        LODWORD(callBacks.version) = 138412290;
        *(CFIndex *)((char *)&callBacks.version + 4) = (CFIndex)v161;
        _os_log_fault_impl(&dword_18A253000, v51, OS_LOG_TYPE_FAULT, "CoreData: Fetching generated an error AND a result: %@", (uint8_t *)&callBacks, 0xCu);
        v43 = v161;
      }
    }
    v53 = v43;
    if (error)
      *error = (NSError *)v161;
    return 0;
  }
  if (!v31)
  {
    v54 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetching failed to generate a result OR an error OR an exception");
    _NSCoreDataLog(17, v54, v55, v56, v57, v58, v59, v60, v118);
    v61 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(callBacks.version) = 0;
      _os_log_fault_impl(&dword_18A253000, v61, OS_LOG_TYPE_FAULT, "CoreData: Fetching failed to generate a result OR an error OR an exception", (uint8_t *)&callBacks, 2u);
    }
  }
  if (!v33)
    return 0;
  if (!v31)
    v31 = (id)NSArray_EmptyArray;
  v128 = v31;
  if (v27)
  {
    v122 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v62 = -[NSFetchRequest predicate](v126, "predicate");
    v121 = -[NSFetchRequest sortDescriptors](v126, "sortDescriptors");
    v63 = -[NSFetchRequest affectedStores](v126, "affectedStores");
    v132 = -[NSFetchRequest entity](v126, "entity");
    if (-[NSDictionary count](-[NSEntityDescription subentitiesByName](v132, "subentitiesByName"), "count"))
      v131 = -[NSFetchRequest includesSubentities](v126, "includesSubentities");
    else
      v131 = 0;
    if (v62)
      v129 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v62, 0);
    else
      v129 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    if (-[NSArray count](v63, "count"))
      v64 = v63;
    else
      v64 = 0;
    v65 = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v66 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    callBacks.version = v65;
    callBacks.copyDescription = v66;
    callBacks.equal = 0;
    callBacks.hash = 0;
    v67 = -[NSMutableSet count](self->_unprocessedChanges, "count");
    changedObjects = (__CFSet *)self->_changedObjects;
    if (v67)
    {
      if (-[NSMutableSet count](self->_changedObjects, "count"))
      {
        changedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
        v159 = 0u;
        v160 = 0u;
        v157 = 0u;
        v158 = 0u;
        unprocessedChanges = self->_unprocessedChanges;
        v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:](unprocessedChanges, "countByEnumeratingWithState:objects:count:", &v157, v168, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v158;
          do
          {
            for (i = 0; i != v70; ++i)
            {
              if (*(_QWORD *)v158 != v71)
                objc_enumerationMutation(unprocessedChanges);
              CFSetAddValue(changedObjects, *(const void **)(*((_QWORD *)&v157 + 1) + 8 * i));
            }
            v70 = -[NSMutableSet countByEnumeratingWithState:objects:count:](unprocessedChanges, "countByEnumeratingWithState:objects:count:", &v157, v168, 16);
          }
          while (v70);
        }
        v155 = 0u;
        v156 = 0u;
        v153 = 0u;
        v154 = 0u;
        v73 = self->_changedObjects;
        v74 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
        if (v74)
        {
          v75 = *(_QWORD *)v154;
          do
          {
            for (j = 0; j != v74; ++j)
            {
              if (*(_QWORD *)v154 != v75)
                objc_enumerationMutation(v73);
              CFSetAddValue(changedObjects, *(const void **)(*((_QWORD *)&v153 + 1) + 8 * j));
            }
            v74 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v73, "countByEnumeratingWithState:objects:count:", &v153, v167, 16);
          }
          while (v74);
        }
        v123 = 1;
      }
      else
      {
        v123 = 0;
        changedObjects = (__CFSet *)self->_unprocessedChanges;
      }
    }
    else
    {
      v123 = 0;
    }
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    v77 = 0;
    v78 = -[__CFSet countByEnumeratingWithState:objects:count:](changedObjects, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
    if (v78)
    {
      v79 = *(_QWORD *)v150;
      do
      {
        for (k = 0; k != v78; ++k)
        {
          if (*(_QWORD *)v150 != v79)
            objc_enumerationMutation(changedObjects);
          v81 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * k);
          v82 = (void *)objc_msgSend(v81, "objectID");
          v83 = v82;
          if (!v64
            || -[NSArray indexOfObjectIdenticalTo:](v64, "indexOfObjectIdenticalTo:", objc_msgSend(v82, "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v84 = objc_msgSend(v81, "entity");
            if ((NSEntityDescription *)v84 == v132
              || v131 && -[NSEntityDescription _subentitiesIncludes:](v132, "_subentitiesIncludes:", v84))
            {
              if (!v77)
                v77 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v128);
              v85 = (void *)MEMORY[0x18D76B4E4]();
              v86 = objc_msgSend(v129, "evaluateWithObject:", v81);
              if (v130)
                v87 = v83;
              else
                v87 = v81;
              if (v86)
                objc_msgSend(v77, "addObject:", v87);
              else
                objc_msgSend(v77, "removeObject:", v87);
              objc_autoreleasePoolPop(v85);
            }
          }
        }
        v78 = -[__CFSet countByEnumeratingWithState:objects:count:](changedObjects, "countByEnumeratingWithState:objects:count:", &v149, v166, 16);
      }
      while (v78);
    }
    if (v123)
      CFRelease(changedObjects);
    v88 = -[NSMutableSet count](v127->_unprocessedInserts, "count");
    insertedObjects = (__CFSet *)v127->_insertedObjects;
    if (v88)
    {
      if (-[NSMutableSet count](v127->_insertedObjects, "count"))
      {
        insertedObjects = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
        v147 = 0u;
        v148 = 0u;
        v145 = 0u;
        v146 = 0u;
        unprocessedInserts = v127->_unprocessedInserts;
        v91 = -[NSMutableSet countByEnumeratingWithState:objects:count:](unprocessedInserts, "countByEnumeratingWithState:objects:count:", &v145, v165, 16);
        if (v91)
        {
          v92 = *(_QWORD *)v146;
          do
          {
            for (m = 0; m != v91; ++m)
            {
              if (*(_QWORD *)v146 != v92)
                objc_enumerationMutation(unprocessedInserts);
              CFSetAddValue(insertedObjects, *(const void **)(*((_QWORD *)&v145 + 1) + 8 * m));
            }
            v91 = -[NSMutableSet countByEnumeratingWithState:objects:count:](unprocessedInserts, "countByEnumeratingWithState:objects:count:", &v145, v165, 16);
          }
          while (v91);
        }
        v143 = 0u;
        v144 = 0u;
        v141 = 0u;
        v142 = 0u;
        v94 = v127->_insertedObjects;
        v95 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
        if (v95)
        {
          v96 = *(_QWORD *)v142;
          do
          {
            for (n = 0; n != v95; ++n)
            {
              if (*(_QWORD *)v142 != v96)
                objc_enumerationMutation(v94);
              CFSetAddValue(insertedObjects, *(const void **)(*((_QWORD *)&v141 + 1) + 8 * n));
            }
            v95 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
          }
          while (v95);
        }
        v124 = 1;
      }
      else
      {
        v124 = 0;
        insertedObjects = (__CFSet *)v127->_unprocessedInserts;
      }
    }
    else
    {
      v124 = 0;
    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v98 = -[__CFSet countByEnumeratingWithState:objects:count:](insertedObjects, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
    if (v98)
    {
      v99 = *(_QWORD *)v138;
      do
      {
        for (ii = 0; ii != v98; ++ii)
        {
          if (*(_QWORD *)v138 != v99)
            objc_enumerationMutation(insertedObjects);
          v101 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * ii);
          v102 = (void *)objc_msgSend(v101, "objectID");
          v103 = v102;
          if (v64)
          {
            v104 = objc_msgSend(v102, "persistentStore");
            if (!v104
              || -[NSArray indexOfObjectIdenticalTo:](v64, "indexOfObjectIdenticalTo:", v104) == 0x7FFFFFFFFFFFFFFFLL)
            {
              continue;
            }
          }
          v105 = objc_msgSend(v101, "entity");
          if ((NSEntityDescription *)v105 == v132
            || v131 && -[NSEntityDescription _subentitiesIncludes:](v132, "_subentitiesIncludes:", v105))
          {
            if (!v77)
              v77 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v128);
            v106 = (void *)MEMORY[0x18D76B4E4]();
            if (objc_msgSend(v129, "evaluateWithObject:", v101))
            {
              if (v130)
                v107 = v103;
              else
                v107 = v101;
              objc_msgSend(v77, "addObject:", v107);
            }
            objc_autoreleasePoolPop(v106);
          }
        }
        v98 = -[__CFSet countByEnumeratingWithState:objects:count:](insertedObjects, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
      }
      while (v98);
    }
    if (v124)
      CFRelease(insertedObjects);
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    deletedObjects = v127->_deletedObjects;
    v109 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedObjects, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
    if (v109)
    {
      v110 = *(_QWORD *)v134;
      do
      {
        for (jj = 0; jj != v109; ++jj)
        {
          if (*(_QWORD *)v134 != v110)
            objc_enumerationMutation(deletedObjects);
          v112 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * jj);
          if (!v64
            || -[NSArray indexOfObjectIdenticalTo:](v64, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v133 + 1) + 8 * jj), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v113 = objc_msgSend(v112, "entity");
            if ((NSEntityDescription *)v113 == v132
              || v131 && -[NSEntityDescription _subentitiesIncludes:](v132, "_subentitiesIncludes:", v113))
            {
              if (!v77)
                v77 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v128);
              if (v130)
                v112 = (void *)objc_msgSend(v112, "objectID", v113);
              objc_msgSend(v77, "removeObject:", v112);
            }
          }
        }
        v109 = -[NSMutableSet countByEnumeratingWithState:objects:count:](deletedObjects, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
      }
      while (v109);
    }
    if (v77)
    {
      v114 = (void *)objc_msgSend(v77, "allObjects");
      if (-[NSArray count](v121, "count"))
        v115 = v130 != 0;
      else
        v115 = 1;
      if (!v115 && ((v125 ^ 1) & 1) == 0)
        v114 = (void *)objc_msgSend(v114, "sortedArrayUsingDescriptors:", v121);

      v128 = v114;
    }

    objc_msgSend(v122, "drain");
  }
  v116 = -[NSFetchRequest fetchLimit](v126, "fetchLimit");
  if (v116 && objc_msgSend(v128, "count") > v116)
  {
    v117 = (id)objc_msgSend(v128, "subarrayWithRange:", 0, v116);

  }
  else
  {
    v117 = v128;
  }
  if (v127->_dispatchQueue && !-[NSFetchRequest resultType](v126, "resultType") && objc_msgSend(v117, "count"))
    -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)v127);
  return (NSArray *)v117;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  NSPersistentStoreCoordinator *result;

  result = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
    return (NSPersistentStoreCoordinator *)-[NSPersistentStoreCoordinator persistentStoreCoordinator](result, "persistentStoreCoordinator");
  return result;
}

- (void)_PFAutoreleasePoolReferenceQueueTrampoline
{
  BOOL v1;
  _QWORD v2[4];
  id v3;
  id location;

  if (val)
  {
    if (val[3])
      v1 = _MergedGlobals_75 == 0;
    else
      v1 = 1;
    if (!v1)
    {
      objc_initWeak(&location, val);
      v2[0] = MEMORY[0x1E0C809B0];
      v2[1] = 3221225472;
      v2[2] = __68__NSManagedObjectContext__PFAutoreleasePoolReferenceQueueTrampoline__block_invoke;
      v2[3] = &unk_1E1EDE1A0;
      objc_copyWeak(&v3, &location);
      +[_PFAutoreleasePoolThunk thunkWithBlock:]((uint64_t)_PFAutoreleasePoolThunk, v2);
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)hasChanges
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)performWithOptions:(unint64_t)a3 andBlock:(id)a4
{
  NSManagedObjectContext *v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;
  NSManagedObjectContext *v10;
  NSManagedObjectContext *v11;
  _QWORD *v12;
  CFTypeRef v13;
  NSManagedObjectContext *v14;
  NSManagedObjectContext *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id context;
  NSManagedObjectContext *v24;
  unint64_t v25;
  NSManagedObjectContext *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self
    || (*((_BYTE *)&self->_flags + 1) & 1) != 0
    || -[NSManagedObjectContext _isDeallocating](self, "_isDeallocating"))
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols", a3, a4);
    _NSCoreDataLog(1, (uint64_t)CFSTR("illegally invoked -performWithOptions* on dying NSManagedObjectContext at:\n\t%@"), v17, v18, v19, v20, v21, v22, v16);
    __break(1u);
  }
  if (self->_dispatchQueue)
  {
    if ((a3 & 1) != 0)
    {
      v12 = malloc_type_malloc(0x20uLL, 0x80040B8603338uLL);
      *v12 = _Block_copy(a4);
      if ((a3 & 0x1000) != 0)
        v13 = 0;
      else
        v13 = CFRetain(self);
      v12[1] = v13;
      v12[2] = a3 | 0x2001;
      v12[3] = 0;
      dispatch_async_f((dispatch_queue_t)self->_dispatchQueue, v12, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
      return;
    }
    v7 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
    if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    {
      if (_PFIsSerializedWithMainQueue())
      {
LABEL_28:
        if ((a3 & 0x1000) == 0)
          v14 = self;
        context = a4;
        v24 = self;
        v25 = a3;
        v26 = v7;
        developerSubmittedBlockToNSManagedObjectContextPerform(&context);
        return;
      }
    }
    else if (v7)
    {
      v8 = 0;
      __dmb(0xBu);
      v9 = v7;
      while (v9 != self && v9 != v8)
      {
        if (!v8)
          v8 = v9;
        v9 = (NSManagedObjectContext *)v9->_queueOwner;
        if (!v9)
        {
          v10 = 0;
          __dmb(0xBu);
          v11 = self;
          while (v11 != v7 && v11 != v10)
          {
            if (!v10)
              v10 = v11;
            v11 = (NSManagedObjectContext *)v11->_queueOwner;
            if (!v11)
              goto LABEL_31;
          }
          goto LABEL_28;
        }
      }
      goto LABEL_28;
    }
LABEL_31:
    if ((a3 & 0x1000) == 0)
      v15 = self;
    context = a4;
    v24 = self;
    v25 = a3 | 0x2000;
    v26 = v7;
    dispatch_sync_f((dispatch_queue_t)self->_dispatchQueue, &context, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
    return;
  }
  if ((a3 & 0x8000) != 0)
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
  else if ((a3 & 0x4000) == 0)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-performWithOptions:andBlock: was called on a MOC of NSConfinementConcurrencyType unexpectedly."), 0));
  }
}

- (void)_registerAsyncReferenceCallback
{
  unsigned int *v2;
  unsigned int v3;
  const void *v4;
  _PFWeakReference *v5;
  _PFWeakReference *v6;
  _QWORD v7[6];

  if (a1)
  {
    if (_PF_shouldAsyncProcessReferenceQueue)
    {
      if (*(_QWORD *)(a1 + 24))
      {
        if ((*(_BYTE *)(a1 + 41) & 1) == 0 && (objc_msgSend((id)a1, "_isDeallocating") & 1) == 0)
        {
          v2 = (unsigned int *)(a1 + 152);
          do
            v3 = __ldxr(v2);
          while (__stxr(v3 + 1, v2));
          if (!v3)
          {
            v4 = *(const void **)(a1 + 160);
            if (v4)
            {
              v5 = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a1);
              if (v5)
              {
                v6 = v5;
                CFRetain(v4);
                v7[0] = MEMORY[0x1E0C809B0];
                v7[1] = 3221225472;
                v7[2] = __90__NSManagedObjectContext__NSInternalNotificationHandling___registerAsyncReferenceCallback__block_invoke;
                v7[3] = &unk_1E1EDE568;
                v7[4] = v6;
                v7[5] = v4;
                objc_msgSend((id)a1, "performWithOptions:andBlock:", 24577, v7);

              }
            }
          }
        }
      }
    }
  }
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

- (uint64_t)_initWithParentObjectStore:(void *)a1
{
  _QWORD *v4;
  uint64_t v5;
  _DWORD *v6;
  CFStringRef (__cdecl *v7)(const void *);
  const __CFAllocator *v8;
  Class *v9;
  id v10;
  _PFManagedObjectReferenceQueue *v11;
  _QWORD *v12;
  _QWORD *v13;
  __CFRunLoop *Main;
  __CFRunLoopObserver *v15;
  uint64_t v16;
  malloc_zone_t *v18;
  pthread_t v19;
  void *v20;
  void *v21;
  NSObject *current_queue;
  NSObject *v23;
  CFSetCallBacks v24;
  objc_super v25;
  CFRunLoopObserverContext context;
  objc_super v27;

  objc_opt_self();
  v25.receiver = a1;
  v25.super_class = (Class)NSManagedObjectContext;
  v4 = objc_msgSendSuper2(&v25, sel_init);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v4[4] = 0;
    v4[23] = PF_CALLOC_OBJECT_ARRAY(21);
    v6 = -[_PFContextMapTable initWithWeaksReferences:]([_PFContextMapTable alloc], 1);
    *(_QWORD *)(v5 + 120) = v6;
    CFRetain(v6);

    v24.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v24.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
    v24.equal = 0;
    v24.hash = 0;
    v24.copyDescription = v7;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_QWORD *)(v5 + 72) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v24);
    *(_QWORD *)(v5 + 64) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 56) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 80) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 88) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 96) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 104) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 112) = CFSetCreateMutable(v8, 0, &v24);
    *(_QWORD *)(v5 + 40) = *(_QWORD *)(v5 + 40) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(a2 & 1) << 15);
    if ((_PF_USE_IOS_PLATFORM & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v5 + 184) + 40) = 0;
      *(_WORD *)(v5 + 48) = 0;
    }
    else
    {
      if (HIBYTE(dword_1ECD8DE18))
      {
        *(_QWORD *)(*(_QWORD *)(v5 + 184) + 40) = 0;
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(v5 + 184) + 40) = objc_alloc_init(MEMORY[0x1E0CB3A48]);
        if ((*(_BYTE *)(v5 + 41) & 0x80) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(v5 + 184) + 40), "setGroupsByEvent:", 0);
      }
      *(_WORD *)(v5 + 48) = 0;
      if (*(_QWORD *)(*(_QWORD *)(v5 + 184) + 40))
        -[NSManagedObjectContext _startObservingUndoManagerNotifications](v5);
    }
    if ((a2 & 2) == 0)
    {
      v9 = (Class *)0x1E0CB38E0;
      if (_PF_Threading_Debugging_level <= 0)
        v9 = (Class *)off_1E1EDAE60;
      v10 = objc_alloc_init(*v9);
      *(_QWORD *)(v5 + 136) = v10;
      CFRetain(v10);

    }
    *(_DWORD *)(v5 + 52) = 0;
    *(_DWORD *)(v5 + 20) = 0;
    v11 = [_PFManagedObjectReferenceQueue alloc];
    if (v11)
    {
      v27.receiver = v11;
      v27.super_class = (Class)_PFManagedObjectReferenceQueue;
      v12 = objc_msgSendSuper2(&v27, sel_init);
      v13 = v12;
      v12[2] = 0;
      v12[3] = v5;
      v12[4] = 0;
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88 && (*(_BYTE *)(v5 + 41) & 0x80) != 0)
      {
        Main = CFRunLoopGetMain();
        context.version = 0;
        memset(&context.retain, 0, 24);
        context.info = v13;
        v15 = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0, (CFRunLoopObserverCallBack)_performRunLoopAction, &context);
        CFRunLoopAddObserver(Main, v15, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        v13[5] = v15;
        CFRetain(v13);
      }
      else
      {
        v12[5] = 0;
      }
      CFRetain(v13);
    }
    else
    {
      v13 = 0;
    }
    *(_QWORD *)(v5 + 160) = v13;
    CFRetain(v13);

    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 144) = 0xBFF0000000000000;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 16) = 0;
    *(_WORD *)(v5 + 50) = 0;
    *(_QWORD *)(v5 + 152) = 0;
    v16 = 0x20000000;
    if (!byte_1ECD8DA23)
      v16 = 0;
    *(_QWORD *)(v5 + 40) = *(_QWORD *)(v5 + 40) & 0xFFFFFFFFDF4FC000 | v16 | 0x900002;
    *(_QWORD *)(v5 + 192) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 24) = NSErrorMergePolicy;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 96) = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 32) = 0;
    *(_QWORD *)(v5 + 40) &= ~0x4000uLL;
    **(_QWORD **)(v5 + 184) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 8) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 136) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 144) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 112) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 152) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) = 0;
    *(_QWORD *)(v5 + 128) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 48) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 80) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 120) = 0;
    *(_QWORD *)(*(_QWORD *)(v5 + 184) + 128) = 0;
    *(_QWORD *)(v5 + 40) = *(_QWORD *)(v5 + 40) & 0xFFFFFFFEBFFFFFFFLL | 0x100000000;
    if (_PF_Threading_Debugging_level)
    {
      v18 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v18 = malloc_default_zone();
      *(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) = malloc_type_zone_malloc(v18, 0x30uLL, 0x80040B8603338uLL);
      v19 = pthread_self();
      **(_QWORD **)(*(_QWORD *)(v5 + 184) + 56) = v19;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 8) = v19;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 16) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 32) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if ((*(_BYTE *)(v5 + 41) & 0x80) == 0)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
        if (objc_msgSend(v20, "maxConcurrentOperationCount") == 1)
          v21 = v20;
        else
          v21 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 16) = v21;
        current_queue = dispatch_get_current_queue();
        if (current_queue == dispatch_get_global_queue(0, 0))
          v23 = 0;
        else
          v23 = current_queue;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 184) + 56) + 24) = v23;
      }
    }
  }
  return v5;
}

- (BOOL)_attemptCoalesceChangesForFetch
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return !objc_msgSend(*(id *)(result + 64), "count")
        && (!objc_msgSend(*(id *)(v1 + 72), "count")
         || (objc_msgSend(*(id *)(v1 + 88), "intersectsSet:", *(_QWORD *)(v1 + 72)) & 1) == 0);
  }
  return result;
}

- (uint64_t)_setPersistentStoreCoordinator:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    *(_QWORD *)(result + 32) = cf;
    if (cf)
    {
      CFRetain(cf);
      -[_PFContextMapTable setForUseWithCoordinator:](*(_QWORD **)(v3 + 120), (uint64_t)cf);
      result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, (uint64_t)cf);
      v4 = *((_QWORD *)cf + 12);
      if (v4)
        v4 = *(_QWORD *)(v4 + 48);
    }
    else
    {
      -[_PFContextMapTable setForUseWithCoordinator:](*(_QWORD **)(result + 120), 0);
      result = -[NSManagedObjectContext _registerForNotificationsWithCoordinator:](v3, 0);
      v4 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(v3 + 184) + 80) = v4;
  }
  return result;
}

- (uint64_t)_registerForNotificationsWithCoordinator:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    if (a2)
    {
      v2 = result;
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", result, sel__storeConfigurationChanged_, CFSTR("_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification"), a2);
      if ((*(_BYTE *)(v2 + 43) & 4) != 0)
      {
        if (*(_QWORD *)(v2 + 24))
        {
          if (*(_QWORD *)(v2 + 32))
            return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__automaticallyMergeChangesFromContextDidSaveNotification_, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), *(_QWORD *)(v2 + 32));
        }
      }
    }
  }
  return result;
}

- (id)databaseStatistics
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (id)objc_msgSend(self->_additionalPrivateIvars[20], "copy");
}

- (id)_delegate
{
  return (id)*((_QWORD *)self->_additionalPrivateIvars + 2);
}

- (BOOL)_isSwiftBound
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (uint64_t)_implicitObservationInfoForEntity:(_QWORD *)a3 forResultingClass:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t ImplicitObservationInfo;
  uint64_t v16;

  if (result)
  {
    v5 = result;
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__implicitObservationInfoForEntity_forResultingClass_);
    if (*(__int16 *)(v5 + 50) <= 0)
    {
      v16 = 0;
      v6 = objc_msgSend((id)v5, "persistentStoreCoordinator");
      if (v6)
        v7 = *(_QWORD *)(v6 + 96);
      else
        v7 = 0;
      if (!*(_QWORD *)(v5 + 128))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(v5 + 184) + 80);
        if (!v8)
        {
          *(_QWORD *)(*(_QWORD *)(v5 + 184) + 80) = _PFModelMapTotalEntityCountForModel((void *)objc_msgSend(a2, "managedObjectModel"));
          v8 = *(_QWORD *)(*(_QWORD *)(v5 + 184) + 80);
        }
        *(_QWORD *)(v5 + 128) = PF_CALLOC_OBJECT_ARRAY(2 * v8);
      }
      v9 = _PFModelMapSlotForEntity(v7, a2);
      v10 = 2 * v9;
      v11 = *(_QWORD *)(v5 + 128);
      v12 = *(_QWORD *)(v11 + 16 * v9);
      if (v12)
      {
        v16 = *(_QWORD *)(v11 + ((16 * v9) | 8));
      }
      else
      {
        v13 = -[NSEntityDescription _new_implicitlyObservedKeys](a2);
        _PFFastEntityClass(a2);
        v14 = (void *)MEMORY[0x18D76B4E4]();
        ImplicitObservationInfo = _NSKeyValueCreateImplicitObservationInfo();
        objc_autoreleasePoolPop(v14);

        v12 = NSKeyValueCoding_NullValue;
        if (ImplicitObservationInfo)
          v12 = ImplicitObservationInfo;
        *(_QWORD *)(*(_QWORD *)(v5 + 128) + 8 * v10) = v12;
        *(_QWORD *)(*(_QWORD *)(v5 + 128) + ((8 * v10) | 8)) = 0;
      }
      if (v12 == NSKeyValueCoding_NullValue)
        result = 0;
      else
        result = v12;
      if (result)
        *a3 = v16;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  unint64_t *v11;
  unint64_t *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *Property;
  void *v18;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if ((void *)qword_1ECD8DA28 == context
    && (!self || self->_ignoreChangeNotification <= 0)
    && (*((_BYTE *)object + 17) & 0x20) == 0)
  {
    v11 = (unint64_t *)objc_msgSend(object, "entity");
    v12 = v11;
    if (v11)
      v13 = (void *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", keyPath);
    else
      v13 = 0;
    if (objc_msgSend(v13, "_propertyType") != 4)
      v13 = 0;
    if (v13)
      v14 = objc_msgSend(v13, "inverseRelationship");
    else
      v14 = 0;
    if (objc_msgSend(v13, "_isToManyRelationship")
      && (v15 = objc_msgSend(v13, "_entitysReferenceID"),
          v16 = _kvcPropertysPrimitiveGetters(v12),
          (Property = _PF_Handler_Public_GetProperty((id **)object, v15, (uint64_t)keyPath, *(_QWORD *)(v16 + 8 * v15))) != 0)
      && ((v18 = Property, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v18, "_shouldProcessKVOChange") & 1) == 0)
    {
      _PFFastMOCObjectWillChange((uint64_t)self, object);
    }
    else
    {
      objc_msgSend(object, "_didChangeValue:forRelationship:named:withInverse:", change, v13, keyPath, v14);
    }
  }
}

- (void)setTrackSQLiteDatabaseStatistics:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = 0x400000000;
  if (!v3)
    v5 = 0;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v5);
}

void __34__NSManagedObjectContext_setName___block_invoke_3(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

- (int64x2_t)_updateDatabaseStaticsWithCacheStats:(uint64_t)a1
{
  uint64_t v4;
  int64x2_t result;
  uint64_t v6;

  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__updateDatabaseStaticsWithCacheStats_);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 160);
    if (v4
      || (*(_QWORD *)(*(_QWORD *)(a1 + 184) + 160) = -[NSSQLiteDatabaseStatistics initWithPageSize:]([NSSQLiteDatabaseStatistics alloc], "initWithPageSize:", a2[1].i64[1]), (v4 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 160)) != 0))
    {
      v6 = a2[1].i64[0];
      result = vaddq_s64(*(int64x2_t *)(v4 + 8), (int64x2_t)vextq_s8(*a2, *a2, 8uLL));
      *(int64x2_t *)(v4 + 8) = result;
      *(_QWORD *)(v4 + 24) += v6;
    }
  }
  return result;
}

- (BOOL)trackSQLiteDatabaseStatistics
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (uint64_t)_processRecentChanges:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  CFMutableSetRef v7;
  CFMutableSetRef v8;
  CFMutableSetRef v9;
  CFMutableSetRef v10;
  CFMutableSetRef v11;
  CFMutableSetRef v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  __CFDictionary *v27;
  NSFetchRequest *v28;
  id v29;
  CFMutableSetRef v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t *v36;
  CFMutableSetRef v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t n;
  _QWORD *v48;
  _QWORD *v49;
  NSKnownKeysDictionary *v50;
  uint64_t v51;
  uint64_t *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  uint64_t v59;
  uint64_t v60;
  uint64_t jj;
  uint64_t v62;
  uint64_t v63;
  uint64_t kk;
  id v65;
  id v66;
  id v67;
  const __CFAllocator *v70;
  CFStringRef (__cdecl *v71)(const void *);
  void (__cdecl *v72)(CFAllocatorRef, const void *);
  const void *(__cdecl *v73)(CFAllocatorRef, const void *);
  CFIndex v74;
  id v75;
  char v76;
  void *v77;
  uint64_t v78;
  void *v79;
  CFMutableSetRef v80;
  CFMutableSetRef v81;
  CFMutableSetRef v82;
  CFMutableSetRef v83;
  CFMutableSetRef v84;
  char v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CFSetCallBacks callBacks;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CFSetCallBacks v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  CFSetCallBacks v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint8_t v123[128];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v4 = 0;
    return v4 & 1;
  }
  v2 = a1;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__processRecentChanges_);
  v3 = *(_QWORD *)(v2 + 40);
  if ((v3 & 8) != 0)
    goto LABEL_7;
  if ((v3 & 0x200) == 0)
  {
    -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
    -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
LABEL_7:
    v4 = 1;
    return v4 & 1;
  }
  v85 = 0;
  v75 = 0;
  *(_QWORD *)(v2 + 40) = v3 | 0x1008;
  v99 = 0;
  v73 = *(const void *(__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E0C9B3B0] + 8);
  v74 = *MEMORY[0x1E0C9B3B0];
  v71 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
  v72 = *(void (__cdecl **)(CFAllocatorRef, const void *))(MEMORY[0x1E0C9B3B0] + 16);
  v4 = 1;
  v70 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v78 = v2;
  while (1)
  {
    v5 = objc_msgSend(*(id *)(v2 + 56), "count");
    v6 = objc_msgSend(*(id *)(v2 + 72), "count");
    if (!(v6 + v5 + objc_msgSend(*(id *)(v2 + 64), "count")))
      break;
    if (!v75)
      v75 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    callBacks.version = v74;
    callBacks.retain = v73;
    callBacks.release = v72;
    callBacks.copyDescription = v71;
    callBacks.equal = 0;
    callBacks.hash = 0;
    v7 = CFSetCreateMutable(v70, 0, &callBacks);
    v8 = CFSetCreateMutable(v70, 0, &callBacks);
    v9 = CFSetCreateMutable(v70, 0, &callBacks);
    v10 = CFSetCreateMutable(v70, 0, &callBacks);
    v11 = CFSetCreateMutable(v70, 0, &callBacks);
    -[NSManagedObjectContext _registerClearStateWithUndoManager](v78);
    v83 = v11;
    v84 = v7;
    v81 = v9;
    v82 = v8;
    v80 = v10;
    v2 = v78;
    if ((*(_BYTE *)(v78 + 40) & 2) == 0)
    {
      v76 = 1;
LABEL_72:
      v37 = v83;
      goto LABEL_73;
    }
    if (objc_msgSend(*(id *)(v78 + 64), "count") || objc_msgSend(*(id *)(v78 + 88), "count"))
    {
      v112.version = v74;
      v112.retain = v73;
      v112.release = v72;
      v112.copyDescription = v71;
      v112.equal = 0;
      v112.hash = 0;
      v2 = v78;
      v12 = CFSetCreateMutable(v70, 0, &v112);
      if (objc_msgSend(*(id *)(v78 + 64), "count"))
      {
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v13 = *(void **)(v78 + 64);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v109 != v15)
                objc_enumerationMutation(v13);
              -[__CFSet addObject:](v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i));
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
          }
          while (v14);
        }
      }
      if (objc_msgSend(*(id *)(v78 + 56), "count"))
      {
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v17 = *(void **)(v78 + 56);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v105 != v19)
                objc_enumerationMutation(v17);
              v21 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j);
              if (v21 && (*(_BYTE *)(v21 + 16) & 0x20) != 0)
                -[__CFSet addObject:](v12, "addObject:");
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
          }
          while (v18);
        }
      }
      if (objc_msgSend(*(id *)(v78 + 112), "count"))
      {
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v22 = *(void **)(v78 + 112);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v101;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v101 != v24)
                objc_enumerationMutation(v22);
              v26 = objc_msgSend((id)v78, "objectRegisteredForID:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * k));
              if (v26 && (*(_BYTE *)(v26 + 16) & 0x20) != 0)
                -[__CFSet addObject:](v12, "addObject:", v26);
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
          }
          while (v23);
        }
      }
      if ((*(_BYTE *)(v78 + 42) & 8) == 0
        && objc_msgSend((id)v78, "persistentStoreCoordinator")
        && -[__CFSet count](v12, "count"))
      {
        v27 = +[_PFRoutines createDictionaryPartitioningObjectsByEntity:]((uint64_t)_PFRoutines, (uint64_t)v12);
        v28 = objc_alloc_init(NSFetchRequest);
        -[NSFetchRequest setResultType:](v28, "setResultType:", 0);
        -[NSFetchRequest setIncludesPendingChanges:](v28, "setIncludesPendingChanges:", 0);
        -[NSFetchRequest setIncludesSubentities:](v28, "setIncludesSubentities:", 0);
        v117.version = MEMORY[0x1E0C809B0];
        v117.retain = (CFSetRetainCallBack)3221225472;
        v117.release = (CFSetReleaseCallBack)__92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke;
        v117.copyDescription = (CFSetCopyDescriptionCallBack)&unk_1E1EDE2E0;
        v117.equal = (CFSetEqualCallBack)v28;
        v117.hash = (CFSetHashCallBack)v78;
        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", &v117);
        CFRelease(v27);

      }
      if (-[__CFSet count](v12, "count"))
      {
        v29 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        ++*(_WORD *)(v78 + 50);
        *(_QWORD *)(v78 + 40) |= 0x2000uLL;
        v117.version = v74;
        v117.retain = v73;
        v117.release = v72;
        v117.copyDescription = v71;
        v117.equal = 0;
        v117.hash = 0;
        v30 = CFSetCreateMutable(v70, 0, &v117);
        v31 = (void *)-[__CFSet mutableCopy](v12, "mutableCopy");
        v32 = 0;
        while (objc_msgSend(v31, "count"))
        {
          objc_msgSend(*(id *)(v78 + 64), "removeAllObjects");
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v114;
            do
            {
              for (m = 0; m != v33; ++m)
              {
                if (*(_QWORD *)v114 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(uint64_t **)(*((_QWORD *)&v113 + 1) + 8 * m);
                -[__CFSet addObject:](v30, "addObject:", v36);
                if (v36)
                  -[NSManagedObject _propagateDelete:](v36, 1);
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
            }
            while (v33);
          }
          if (v32 < 0x1E)
          {
            ++v32;
          }
          else
          {
            if ((objc_msgSend(*(id *)(v78 + 64), "isSubsetOfSet:", v30) & 1) != 0)
              break;
            v32 = 0;
          }

          v31 = (void *)objc_msgSend(*(id *)(v78 + 64), "mutableCopy");
        }

        *(_QWORD *)(v78 + 64) = v30;
        *(_QWORD *)(v78 + 40) &= ~0x2000uLL;
        --*(_WORD *)(v78 + 50);
        objc_msgSend(v29, "drain");
      }
      if (a2)
        v76 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)v78, *(void **)(v78 + 64), 2, (uint64_t *)&v99, (*(_QWORD *)(v78 + 40) >> 2) & 1, 0);
      else
        v76 = 1;

      goto LABEL_72;
    }
    v76 = 1;
    v37 = v11;
    v2 = v78;
LABEL_73:
    v38 = (void *)-[NSManagedObjectContext _processPendingDeletions:withInsertions:withUpdates:withNewlyForgottenList:withRemovedChangedObjects:](v2, v82, v80, v37);
    v39 = -[NSManagedObjectContext _processPendingInsertions:withDeletions:withUpdates:]((id *)v2, v84, v81);
    v40 = -[NSManagedObjectContext _processPendingUpdates:](v2, v81);
    if (v40)
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoUpdates_, v40, 0);
    if (v39)
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoInsertions_, v39, 0);
    if (v38)
    {
      v41 = objc_msgSend(v38, "count");
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      v42 = -[__CFSet count](v83, "count");
      if (v42)
        v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v41);
      else
        v79 = 0;
      v43 = objc_alloc(MEMORY[0x1E0C99D20]);
      if (v79)
        v44 = (uint64_t)v79;
      else
        v44 = NSKeyValueCoding_NullValue;
      v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, 0);

      objc_msgSend(v77, "addObject:", v45);
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v41);
      objc_msgSend(v77, "addObject:", v46);

      if (*(_QWORD *)(*(_QWORD *)(v2 + 184) + 40) && v41)
      {
        for (n = 0; n != v41; ++n)
        {
          v48 = (_QWORD *)objc_msgSend(v38, "objectAtIndex:", n);
          v49 = v48;
          if (v48
            && (v50 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](v48, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1)) != 0)
          {
            objc_msgSend(v46, "addObject:", v50);
          }
          else
          {
            objc_msgSend(v46, "addObject:", NSKeyValueCoding_NullValue);
            v50 = 0;
          }

          if (v42)
          {
            v51 = -[__CFSet member:](v83, "member:", v49);
            v52 = &NSKeyValueCoding_NullValue;
            if (v51)
              v52 = &NSArray_EmptyArray;
            objc_msgSend(v79, "addObject:", *v52);
          }
        }
      }
      -[NSManagedObjectContext _registerUndoForOperation:withObjects:withExtraArguments:](v2, (uint64_t)sel__undoDeletions_, v38, (uint64_t)v77);

    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(v2 + 184) + 40), "groupsByEvent") & 1) == 0)
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(v2 + 184) + 40), "isUndoing") & 1) == 0
        && (objc_msgSend(*(id *)(*(_QWORD *)(v2 + 184) + 40), "isRedoing") & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 184) + 40), "endUndoGrouping");
      }
      *(_QWORD *)(v2 + 40) &= ~0x20uLL;
    }
    objc_msgSend(*(id *)(v2 + 72), "removeAllObjects");
    objc_msgSend(*(id *)(v2 + 64), "removeAllObjects");
    objc_msgSend(*(id *)(v2 + 56), "removeAllObjects");
    v53 = (void *)objc_msgSend(*(id *)(v2 + 112), "copy");
    objc_msgSend(*(id *)(v2 + 112), "removeAllObjects");
    if ((v85 & 1) == 0)
      *(_QWORD *)(v2 + 40) &= 0xFFFFFFFFFFFFEDF6;
    v54 = *(_QWORD *)(v2 + 184);
    v55 = *(void **)(v54 + 88);
    if (v55)
    {
      *(_QWORD *)(v54 + 88) = 0;
      v54 = *(_QWORD *)(v2 + 184);
    }
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]((_QWORD *)v2, v84, v82, v81, v53, v55, *(_QWORD *)(v54 + 104) != 0);
    -[NSManagedObjectContext _processRecentlyForgottenObjects:]((void *)v2, v80);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v56 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v94, v120, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v95;
      do
      {
        for (ii = 0; ii != v56; ++ii)
        {
          if (*(_QWORD *)v95 != v57)
            objc_enumerationMutation(v40);
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * ii));
        }
        v56 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v94, v120, 16);
      }
      while (v56);
    }

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v59 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v119, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v91;
      do
      {
        for (jj = 0; jj != v59; ++jj)
        {
          if (*(_QWORD *)v91 != v60)
            objc_enumerationMutation(v39);
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * jj));
        }
        v59 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v119, 16);
      }
      while (v59);
    }

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v62 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v86, v118, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v87;
      do
      {
        for (kk = 0; kk != v62; ++kk)
        {
          if (*(_QWORD *)v87 != v63)
            objc_enumerationMutation(v38);
          -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * kk));
        }
        v62 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v86, v118, 16);
      }
      while (v62);
    }

    v85 = 1;
    v4 = v76;
  }
  if (objc_msgSend(*(id *)(v2 + 112), "count"))
  {
    if (!v75)
      v75 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[NSManagedObjectContext _postRefreshedObjectsNotificationAndClearList](v2);
  }
  if ((v85 & 1) == 0)
    *(_QWORD *)(v2 + 40) &= 0xFFFFFFFFFFFFEDF6;
  v65 = v99;
  objc_msgSend(v75, "drain");
  v66 = v99;
  if (a2 && v99)
    *a2 = v99;
  v67 = 0;
  -[NSManagedObjectContext _processReferenceQueue:](v2, 0);
  return v4 & 1;
}

- (void)_postRefreshedObjectsNotificationAndClearList
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 112), "count")
    || (v2 = *(_QWORD *)(a1 + 184), *(_QWORD *)(v2 + 88))
    || *(_QWORD *)(v2 + 104))
  {
    v3 = (void *)MEMORY[0x18D76B4E4]();
    if (objc_msgSend(*(id *)(a1 + 112), "count"))
      v4 = (void *)objc_msgSend(*(id *)(a1 + 112), "copy");
    else
      v4 = 0;
    v5 = *(void **)(*(_QWORD *)(a1 + 184) + 88);
    objc_msgSend(*(id *)(a1 + 112), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 88) = 0;
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:]((_QWORD *)a1, 0, 0, 0, v4, v5, *(_QWORD *)(*(_QWORD *)(a1 + 184) + 104) != 0);

    objc_autoreleasePoolPop(v3);
  }
}

- (uint64_t)_registerClearStateWithUndoManager
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 40) & 0x20) == 0)
    {
      v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(result + 48));
      result = *(_QWORD *)(*(_QWORD *)(v1 + 184) + 40);
      if (result)
      {
        if ((objc_msgSend((id)result, "groupsByEvent") & 1) == 0
          && (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "isUndoing") & 1) == 0
          && (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "isRedoing") & 1) == 0)
        {
          *(_QWORD *)(v1 + 40) |= 0x1000uLL;
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "beginUndoGrouping");
          *(_QWORD *)(v1 + 40) &= ~0x1000uLL;
        }
        v3 = (void *)objc_msgSend(*(id *)(v1 + 96), "copy");
        v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v2, v3, 0);

        result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "registerUndoWithTarget:selector:object:", v1, sel__clearChangedThisTransaction_, v4);
      }
      *(_QWORD *)(v1 + 40) |= 0x20uLL;
    }
  }
  return result;
}

- (void)_createAndPostChangeNotification:(void *)a3 deletions:(void *)a4 updates:(void *)a5 refreshes:(void *)a6 deferrals:(int)a7 wasMerge:
{
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSQueryGenerationToken *v41;
  uint64_t m;
  void *v43;
  id v44;
  void *v45;
  __CFString *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  NSQueryGenerationToken *v51;
  _BYTE v52[12];
  int v53;
  void *v54;
  id v55;
  _QWORD *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v56 = a1;
  if (!a1)
    return;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = v13;
  v53 = a7;
  v55 = a3;
  if (!objc_msgSend(a6, "count"))
  {
    v19 = 0;
    v14 = 0;
    goto LABEL_50;
  }
  v54 = a5;
  if (objc_msgSend(a3, "count"))
  {
    v14 = (void *)objc_msgSend(a6, "mutableCopy");
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v67 != v17)
            objc_enumerationMutation(a3);
          objc_msgSend(v14, "removeObject:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        }
        v16 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v16);
    }
    if (objc_msgSend(a2, "count"))
    {
      a5 = v54;
      if (v14)
        goto LABEL_17;
      goto LABEL_16;
    }
    a5 = v54;
  }
  else
  {
    if (objc_msgSend(a2, "count"))
    {
LABEL_16:
      v14 = (void *)objc_msgSend(a6, "mutableCopy");
LABEL_17:
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v20 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v63 != v22)
              objc_enumerationMutation(a2);
            objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
          }
          v21 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v21);
        a2 = v14;
        a5 = v54;
      }
      else
      {
        a2 = v14;
      }
      goto LABEL_31;
    }
    v14 = 0;
  }
  if (v14)
    a2 = v14;
  else
    a2 = a6;
LABEL_31:
  if (objc_msgSend(a4, "count"))
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v24 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v24)
    {
      v25 = v24;
      v19 = 0;
      v26 = *(_QWORD *)v59;
      if (v14)
        a6 = v14;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v59 != v26)
            objc_enumerationMutation(a4);
          v28 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
          if (objc_msgSend(a6, "containsObject:", v28))
          {
            if (!v19)
              v19 = (void *)objc_msgSend(a4, "mutableCopy");
            objc_msgSend(v19, "removeObject:", v28);
          }
        }
        v25 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v25);
    }
    else
    {
      v19 = 0;
    }
    if (v19)
      a4 = v19;
    v13 = v57;
    a5 = v54;
  }
  else
  {
    v19 = 0;
    v13 = v57;
  }
LABEL_50:
  if (objc_msgSend(a2, "count"))
    objc_msgSend(v13, "setObject:forKey:", a2, CFSTR("inserted"));
  if (objc_msgSend(v55, "count"))
    objc_msgSend(v13, "setObject:forKey:", v55, CFSTR("deleted"));
  v29 = v56;
  if (objc_msgSend(a4, "count"))
    objc_msgSend(v13, "setObject:forKey:", a4, CFSTR("updated"));
  if (!objc_msgSend(a5, "count"))
    goto LABEL_74;
  objc_msgSend(v13, "setObject:forKey:", a5, CFSTR("refreshed_objectIDs"));
  v30 = objc_msgSend(a5, "count");
  v31 = v30;
  if (v30 <= 1)
    v32 = 1;
  else
    v32 = v30;
  if (v30 >= 0x201)
    v33 = 1;
  else
    v33 = v32;
  v34 = &v52[-((8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (v30 >= 0x201)
  {
    v34 = (_BYTE *)NSAllocateScannedUncollectable();
    objc_msgSend(a5, "getObjects:", v34);
LABEL_67:
    v36 = 0;
    v35 = 0;
    do
    {
      v37 = objc_msgSend(v29, "objectRegisteredForID:", *(_QWORD *)&v34[8 * v36]);
      if (v37)
        *(_QWORD *)&v34[8 * v35++] = v37;
      ++v36;
    }
    while (v31 != v36);
    goto LABEL_71;
  }
  bzero(&v52[-((8 * v33 + 15) & 0xFFFFFFFFFFFFFFF0)], 8 * v32);
  objc_msgSend(a5, "getObjects:", v34);
  if (v31)
    goto LABEL_67;
  v35 = 0;
LABEL_71:
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v34, v35);
  if (v31 >= 0x201)
    NSZoneFree(0, v34);
  v13 = v57;
  objc_msgSend(v57, "setObject:forKey:", v38, CFSTR("refreshed"));

LABEL_74:
  if (objc_msgSend(v13, "count"))
  {
    if (byte_1ECD8DE1E)
      objc_msgSend(v13, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), CFSTR("managedObjectContext"));
    if (v53)
      objc_msgSend(v13, "setObject:forKey:", NSSet_EmptySet, CFSTR("NSObjectsChangedByMergeChangesKey"));
    -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)v29, v13);
  }
  if (*(_QWORD *)(v29[23] + 104))
  {
    v39 = (void *)objc_msgSend(v13, "mutableCopy");
    if (byte_1ECD8DE1E)
      objc_msgSend(v39, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), CFSTR("managedObjectContext"));
    objc_msgSend(v39, "removeObjectForKey:", CFSTR("NSObjectsChangedByMergeChangesKey"));
    objc_msgSend(v39, "addEntriesFromDictionary:", *(_QWORD *)(v29[23] + 104));
    if (objc_msgSend(v39, "count"))
    {
      v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (byte_1ECD8DE1E)
        objc_msgSend(v40, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)v29), CFSTR("managedObjectContext"));
      v41 = (NSQueryGenerationToken *)objc_msgSend(v39, "objectForKey:", CFSTR("newQueryGeneration"));
      if (v41
        || (v51 = (NSQueryGenerationToken *)objc_msgSend(v29, "_queryGenerationToken")) != 0
        && (v41 = v51,
            v51 != +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"))&& v41 != +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"))
      {
        objc_msgSend(v40, "setObject:forKey:", v41, CFSTR("newQueryGeneration"));
      }
      for (m = 0; m != 5; ++m)
      {
        v43 = (void *)objc_msgSend(v39, "objectForKey:", off_1E1EDE390[m]);
        if (objc_msgSend(v43, "count"))
          v44 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v43);
        else
          v44 = (id)NSSet_EmptySet;
        v45 = v44;
        v46 = off_1E1EDE3B8[m];
        v47 = (void *)objc_msgSend(v39, "objectForKey:", v46);
        if (objc_msgSend(v45, "count") || objc_msgSend(v47, "count"))
        {
          v48 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v45, v47);

          objc_msgSend(v40, "setObject:forKey:", v48, v46);
          v45 = v48;
        }
        else
        {
          objc_msgSend(v40, "removeObjectForKey:", v46);
        }

      }
      v49 = (id)objc_msgSend(v40, "copy");

      v50 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v29 = v56;
      objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("_NSManagedObjectContextDidMergeChangesObjectIDsPrivateNotification"), v56, v49);
      objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("NSManagedObjectContextDidMergeChangesObjectIDsNotification"), v29, v49);
      v13 = v57;
    }

    *(_QWORD *)(v29[23] + 104) = 0;
  }

}

- (uint64_t)_postObjectsDidChangeNotificationWithUserInfo:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(a2, "mutableCopy");
    if (byte_1ECD8DE1E)
      objc_msgSend(v4, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, v3), CFSTR("managedObjectContext"));
    for (i = 0; i != 4; ++i)
    {
      v6 = (void *)objc_msgSend(a2, "objectForKey:", off_1E1EDE300[i]);
      if (objc_msgSend(v6, "count"))
      {
        v7 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v6);
        objc_msgSend(v4, "setObject:forKey:", v7, off_1E1EDE320[i]);

      }
    }
    v8 = (id)objc_msgSend(v4, "copy");

    v9 = (void *)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("refreshed_objectIDs"));
    v10 = (id)objc_msgSend(v9, "copy");

    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("_NSObjectsChangedInManagingContextPrivateNotification"), v3, v8);
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("NSObjectsChangedInManagingContextNotification"), v3, v10);
    result = +[NSManagedObject instancesRespondToSelector:](NSManagedObject, "instancesRespondToSelector:", sel__willChange_Swift_Trampoline);
    if ((_DWORD)result)
    {
      for (j = 0; j != 4; ++j)
      {
        v13 = (void *)objc_msgSend(a2, "objectForKey:", off_1E1EDE300[j]);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          do
          {
            for (k = 0; k != v15; ++k)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * k);
              if (objc_msgSend(v18, "bindableObjectPublisher"))
                objc_msgSend(v18, "_willChange_Swift_Trampoline");
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v15);
        }
      }
      v19 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("refreshed"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      result = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (result)
      {
        v20 = result;
        v21 = *(_QWORD *)v25;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v19);
            v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v22);
            if (objc_msgSend(v23, "bindableObjectPublisher"))
              objc_msgSend(v23, "_willChange_Swift_Trampoline");
            ++v22;
          }
          while (v20 != v22);
          result = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          v20 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_postContextDidSaveNotificationWithUserInfo:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t result;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (byte_1ECD8DE1E)
  {
    v5 = objc_msgSend(a2, "objectForKey:", CFSTR("managedObjectContext"));
    if (v5)
    {
      v6 = (id)v5;
      v7 = v4;
    }
    else
    {
      v8 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, a1);
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("managedObjectContext"));
      if ((*(_BYTE *)(a1 + 44) & 2) == 0)
        goto LABEL_7;
      v7 = a2;
      v6 = v8;
    }
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("managedObjectContext"));
  }
LABEL_7:
  if ((*(_BYTE *)(a1 + 44) & 2) != 0)
  {
    v9 = objc_msgSend(a2, "objectForKey:", CFSTR("transactionAuthor"));
    if (v9)
    {
      v10 = v9;
      v11 = v4;
LABEL_12:
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("transactionAuthor"));
      goto LABEL_13;
    }
    v12 = objc_msgSend((id)a1, "transactionAuthor");
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("transactionAuthor"));
      v11 = a2;
      v10 = v13;
      goto LABEL_12;
    }
  }
LABEL_13:
  v14 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("newQueryGeneration"));
  if (v14
    || (v14 = (void *)objc_msgSend((id)a1, "_queryGenerationToken"), v15 = objc_msgSend(v14, "_isEnabled"), v14) && v15)
  {
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("newQueryGeneration"));
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = *(void **)(*(_QWORD *)(a1 + 184) + 136);
  v62 = v4;
  if (objc_msgSend(v17, "count"))
  {
    v18 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("inserted")), "mutableCopy");
    if (!v18)
      v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v72 != v21)
            objc_enumerationMutation(v17);
          v23 = objc_msgSend((id)a1, "objectWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "firstObject"));
          if (v23)
          {
            v24 = v23;
            objc_msgSend(v18, "addObject:", v23);
            objc_msgSend(v16, "addObject:", v24);
          }
        }
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v20);
    }
    objc_msgSend(a2, "setObject:forKey:", v18, CFSTR("inserted"));

    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 136) = 0;
    v4 = v62;
  }
  v25 = *(void **)(*(_QWORD *)(a1 + 184) + 144);
  if (objc_msgSend(v25, "count"))
  {
    v26 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("updated")), "mutableCopy");
    if (!v26)
      v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v68 != v29)
            objc_enumerationMutation(v25);
          v31 = objc_msgSend((id)a1, "objectWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "firstObject"));
          if (v31)
          {
            v32 = v31;
            objc_msgSend(v26, "addObject:", v31);
            objc_msgSend(v16, "addObject:", v32);
          }
        }
        v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v28);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 144) = 0;
    v4 = v62;
  }
  else
  {
    v26 = 0;
  }
  v33 = *(void **)(*(_QWORD *)(a1 + 184) + 112);
  if (objc_msgSend(v33, "count"))
  {
    if (!v26)
    {
      v26 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("updated")), "mutableCopy");
      if (!v26)
        v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v64 != v36)
            objc_enumerationMutation(v33);
          v38 = objc_msgSend((id)a1, "objectWithID:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
          if (v38)
          {
            v39 = v38;
            objc_msgSend(v26, "addObject:", v38);
            objc_msgSend(v16, "addObject:", v39);
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      }
      while (v35);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 112) = 0;
    v4 = v62;
  }
  if (v26)
    objc_msgSend(a2, "setObject:forKey:", v26, CFSTR("updated"));

  if (objc_msgSend(v16, "count"))
    objc_msgSend(a2, "setObject:forKey:", v16, CFSTR("_NSTriggerModifiedObjectsKey"));

  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("inserted")), "count"))
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("inserted"));
  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("deleted")), "count"))
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("deleted"));
  if (!objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("updated")), "count"))
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("updated"));
  for (m = 0; m != 5; ++m)
  {
    v41 = (void *)objc_msgSend(a2, "objectForKey:", off_1E1EDE340[m]);
    if (objc_msgSend(v41, "count"))
    {
      v42 = (void *)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v41);
      objc_msgSend(v4, "setObject:forKey:", v42, off_1E1EDE368[m]);

    }
  }
  v43 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("refreshed"));
  if (objc_msgSend(v43, "count"))
    v44 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v43);
  else
    v44 = (id)NSSet_EmptySet;
  v45 = v44;
  v46 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("refreshed_objectIDs"));
  if (!objc_msgSend(v45, "count") && !objc_msgSend(v46, "count"))
  {
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("refreshed"));
    objc_msgSend(a2, "removeObjectForKey:", CFSTR("refreshed_objectIDs"));
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("refreshed"));
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("refreshed_objectIDs"));
    goto LABEL_94;
  }
  v47 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v45, v46);

  objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("refreshed_objectIDs"));
  v48 = objc_msgSend(v47, "count");
  v49 = v48;
  if (v48 <= 1)
    v50 = 1;
  else
    v50 = v48;
  if (v48 >= 0x201)
    v51 = 1;
  else
    v51 = v50;
  v52 = (char *)&v61 - ((8 * v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v47;
  if (v48 >= 0x201)
  {
    v52 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(v47, "getObjects:", v52);
LABEL_87:
    v54 = 0;
    v53 = 0;
    do
    {
      v55 = objc_msgSend((id)a1, "objectRegisteredForID:", *(_QWORD *)&v52[8 * v54]);
      if (v55)
        *(_QWORD *)&v52[8 * v53++] = v55;
      ++v54;
    }
    while (v49 != v54);
    goto LABEL_91;
  }
  bzero((char *)&v61 - ((8 * v51 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v50);
  objc_msgSend(v47, "getObjects:", v52);
  if (v49)
    goto LABEL_87;
  v53 = 0;
LABEL_91:
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v52, v53);
  if (v49 >= 0x201)
    NSZoneFree(0, v52);
  objc_msgSend(a2, "setObject:forKey:", v56, CFSTR("refreshed"));

LABEL_94:
  v57 = (id)objc_msgSend(v4, "copy");

  v58 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v59 = v58;
  if ((*(_BYTE *)(a1 + 42) & 8) == 0)
  {
    objc_msgSend(v58, "postNotificationName:object:userInfo:", CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), *(_QWORD *)(a1 + 32), v57);
    objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("NSManagedObjectContextDidSaveObjectIDsNotification"), *(_QWORD *)(a1 + 32), v57);
  }
  objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), a1, v57);
  result = objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("NSManagedObjectContextDidSaveObjectIDsNotification"), a1, v57);
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
    return objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("NSManagingContextDidSaveChangesNotification"), a1, a2);
  return result;
}

- (uint64_t)_processPendingDeletions:(void *)a3 withInsertions:(void *)a4 withUpdates:withNewlyForgottenList:withRemovedChangedObjects:
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(*(id *)(a1 + 64), "count");
  if (!v8)
    return 0;
  v9 = v8;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v9 >= 0x201)
    v11 = 1;
  else
    v11 = v9;
  v12 = (8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (char *)v21 - v12;
  if (v9 > 0x200)
    v13 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v21 - v12, 8 * v9);
  objc_msgSend(*(id *)(a1 + 64), "getObjects:", v13);
  for (i = 0; i != v9; ++i)
  {
    v15 = *(_QWORD *)&v13[8 * i];
    if (v15)
    {
      *(_DWORD *)(v15 + 16) &= ~4u;
      if (!objc_msgSend(*(id *)(a1 + 72), "containsObject:", v15))
      {
        v18 = *(_DWORD *)(v15 + 16);
        if ((v18 & 0x10) != 0)
        {
          objc_msgSend(*(id *)(a1 + 80), "removeObject:", v15);
          *(_DWORD *)(v15 + 16) &= ~0x10u;
          v19 = a3;
        }
        else
        {
          if ((v18 & 8) != 0)
          {
            objc_msgSend(*(id *)(a1 + 96), "removeObject:", v15);
            objc_msgSend(a4, "addObject:", v15);
            v18 = *(_DWORD *)(v15 + 16) & 0xFFFFFFF7;
          }
          *(_DWORD *)(v15 + 16) = v18 | 0x20;
LABEL_19:
          v19 = *(void **)(a1 + 88);
        }
        objc_msgSend(v19, "addObject:", v15);
        v17 = (void *)v10;
LABEL_22:
        objc_msgSend(v17, "addObject:", v15);
        objc_msgSend(*(id *)(a1 + 56), "removeObject:", v15);
        if (v15)
          *(_DWORD *)(v15 + 16) &= ~1u;
        goto LABEL_24;
      }
    }
    else if ((objc_msgSend(*(id *)(a1 + 72), "containsObject:", 0) & 1) == 0)
    {
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(a1 + 64), "removeObject:", v15);
    objc_msgSend(*(id *)(a1 + 72), "removeObject:", v15);
    if (v15)
    {
      v16 = *(_DWORD *)(v15 + 16);
      *(_DWORD *)(v15 + 16) = v16 & 0xFFFFFFFD;
      v17 = a3;
      if ((v16 & 0x38) != 0)
        continue;
      goto LABEL_22;
    }
    objc_msgSend(a3, "addObject:", 0);
    objc_msgSend(*(id *)(a1 + 56), "removeObject:", 0);
LABEL_24:
    objc_msgSend(a2, "addObject:", v15);
  }
  if (v9 >= 0x201)
    NSZoneFree(0, v13);
  return v10;
}

- (void)_processPendingUpdates:(uint64_t)a1
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v5 >= 0x201)
    v7 = 1;
  else
    v7 = v5;
  v8 = (8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = (char *)v14 - v8;
  if (v5 > 0x200)
    v9 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v14 - v8, 8 * v5);
  objc_msgSend(*(id *)(a1 + 56), "getObjects:", v9);
  for (i = 0; i != v5; ++i)
  {
    v11 = *(_QWORD *)&v9[8 * i];
    if (v11)
    {
      v12 = *(_DWORD *)(v11 + 16);
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFFE;
      if ((v12 & 0x30) != 0)
        goto LABEL_14;
      *(_DWORD *)(v11 + 16) = v12 & 0xFFFFFFF6 | 8;
    }
    objc_msgSend(*(id *)(a1 + 96), "addObject:", v11);
LABEL_14:
    objc_msgSend(v6, "addObject:", v11);
    objc_msgSend(a2, "addObject:", v11);
  }
  if (v5 >= 0x201)
    NSZoneFree(0, v9);
  return v6;
}

- (void)_processPendingInsertions:(id *)a1 withDeletions:(void *)a2 withUpdates:(void *)a3
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1[9], "count");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  if (v7 >= 0x201)
    v9 = 1;
  else
    v9 = v7;
  v10 = (8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (char *)v17 - v10;
  if (v7 > 0x200)
    v11 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v17 - v10, 8 * v7);
  objc_msgSend(a1[9], "getObjects:", v11);
  for (i = 0; i != v7; ++i)
  {
    v13 = *(_QWORD *)&v11[8 * i];
    if (!v13)
    {
      objc_msgSend(a1[10], "addObject:", 0);
      goto LABEL_19;
    }
    v14 = *(_DWORD *)(v13 + 16);
    *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFFD;
    if ((v14 & 8) != 0)
    {
      v15 = a3;
LABEL_17:
      objc_msgSend(v15, "addObject:", v13);
      continue;
    }
    if ((v14 & 0x10) != 0)
    {
      v15 = a2;
      goto LABEL_17;
    }
    if ((v14 & 0x20) != 0)
    {
      *(_DWORD *)(v13 + 16) = v14 & 0xFFFFFFDD;
      objc_msgSend(a1[11], "removeObject:", v13);
    }
    else
    {
      objc_msgSend(a1[10], "addObject:", v13);
      *(_DWORD *)(v13 + 16) |= 0x10u;
    }
LABEL_19:
    objc_msgSend(v8, "addObject:", v13);
    objc_msgSend(a2, "addObject:", v13);
    objc_msgSend(a1[7], "removeObject:", v13);
    if (v13)
      *(_DWORD *)(v13 + 16) &= ~1u;
  }
  if (v7 >= 0x201)
    NSZoneFree(0, v11);
  return v8;
}

- (void)_processRecentlyForgottenObjects:(void *)a1
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "count");
  v5 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v12 - v7;
  if (v5 >= 0x201)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:", v8);
  }
  else
  {
    bzero((char *)v12 - v7, 8 * v6);
    objc_msgSend(a2, "getObjects:", v8);
    if (!v4)
      return;
  }
  v9 = 0;
  do
  {
    v10 = *(_QWORD *)&v8[8 * v9];
    if (v10)
      v11 = _insertion_fault_handler;
    else
      v11 = 0;
    -[NSFaultHandler turnObject:intoFaultWithContext:](v11, *(_QWORD *)&v8[8 * v9], (uint64_t)a1);
    objc_msgSend(a1, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v10, 0, 1);
    ++v9;
  }
  while (v4 != v9);
  if (v4 >= 0x201)
    NSZoneFree(0, v8);
}

- (void)deleteObject:(NSManagedObject *)object
{
  NSManagedObjectContext *cd_managedObjectContext;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  _managedObjectContextFlags flags;

  if (!_PF_Threading_Debugging_level)
  {
    if (object)
      goto LABEL_3;
LABEL_14:
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("-deleteObject: requires a non-nil argument");
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!object)
    goto LABEL_14;
LABEL_3:
  if ((object->_cd_stateFlags & 0x80) != 0)
  {
    if (self)
      return;
    goto LABEL_9;
  }
  cd_managedObjectContext = object->_cd_managedObjectContext;
  if (cd_managedObjectContext == self)
  {
LABEL_9:
    -[NSManagedObjectContext _registerClearStateWithUndoManager]((uint64_t)self);
    object->_cd_stateFlags |= 4u;
    -[NSManagedObjectContext _establishEventSnapshotsForObject:]((uint64_t)self, object);
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) != 0 && (*(_WORD *)&flags & 0x200) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      flags = self->_flags;
    }
    self->_flags = (_managedObjectContextFlags)(*(unint64_t *)&flags | 0x200);
    -[NSMutableSet addObject:](self->_unprocessedDeletes, "addObject:", object);
    -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
    if ((*((_BYTE *)&self->_flags + 1) & 8) == 0)
    {
      -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasChanges"));
      *(_QWORD *)&self->_flags |= 0x800uLL;
      -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasChanges"));
    }
    -[NSManagedObject prepareForDeletion](object, "prepareForDeletion");
    return;
  }
  if (cd_managedObjectContext)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("An NSManagedObjectContext cannot delete objects in other contexts.");
    goto LABEL_15;
  }
}

- (uint64_t)_enqueueEndOfEventNotification
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 40) & 9) == 0)
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(result + 184) + 40), "groupsByEvent");
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "registerUndoWithTarget:selector:object:", v1, sel__noop_, NSArray_EmptyArray);
      *(_QWORD *)(v1 + 40) |= 1uLL;
    }
  }
  return result;
}

- (NSManagedObject)objectWithID:(NSManagedObjectID *)objectID
{
  NSManagedObjectID *v3;
  NSManagedObject *Value;
  id parentObjectStore;
  id v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v3 = objectID;
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID)
      goto LABEL_3;
LABEL_16:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil is not a valid object ID"), 0));
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!v3)
    goto LABEL_16;
LABEL_3:
  if ((*((_BYTE *)&self->_flags + 2) & 8) == 0)
    return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0, 1);
  Value = -[NSManagedObjectContext objectRegisteredForID:](self, "objectRegisteredForID:", v3);
  if (!Value)
  {
    if (-[NSManagedObjectID isTemporaryID](v3, "isTemporaryID"))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3052000000;
      v15 = __Block_byref_object_copy__12;
      v16 = __Block_byref_object_dispose__12;
      v17 = 0;
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      parentObjectStore = self->_parentObjectStore;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __39__NSManagedObjectContext_objectWithID___block_invoke;
      v11[3] = &unk_1E1EDE1C8;
      v11[5] = v3;
      v11[6] = &v12;
      v11[4] = self;
      _perform((uint64_t)parentObjectStore, (uint64_t)v11);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      if (v13[5])
        v3 = (NSManagedObjectID *)v13[5];
      goto LABEL_12;
    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__12;
    v16 = __Block_byref_object_dispose__12;
    v17 = 0;
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    v7 = self->_parentObjectStore;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__NSManagedObjectContext_objectWithID___block_invoke_2;
    v10[3] = &unk_1E1EDE1C8;
    v10[5] = v3;
    v10[6] = &v12;
    v10[4] = self;
    _perform((uint64_t)v7, (uint64_t)v10);
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
    v8 = (void *)v13[5];
    if (!v8 || (Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v8)) == 0)
    {
LABEL_12:
      _Block_object_dispose(&v12, 8);
      return (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, v3, 0, 1);
    }
    _Block_object_dispose(&v12, 8);
  }
  return Value;
}

- (NSManagedObject)existingObjectWithID:(NSManagedObjectID *)objectID error:(NSError *)error
{
  void *v7;
  NSError *v8;
  NSManagedObject *v9;
  NSManagedObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSManagedObjectID **v14;
  const __CFString **v15;
  NSManagedObject *v16;
  NSManagedObject *v17;
  NSManagedObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSError *v28;
  const __CFString *v29;
  NSManagedObjectID *v30;
  uint8_t buf[4];
  NSManagedObjectID *v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (!_PF_Threading_Debugging_level)
  {
    if (objectID)
      goto LABEL_3;
LABEL_27:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil is not a valid object ID"), 0));
  }
  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!objectID)
    goto LABEL_27;
LABEL_3:
  v7 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      v8 = v7;
LABEL_16:
      v10 = 0;
      *error = v8;
      return v10;
    }
    return 0;
  }
  if (!-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID"))
  {
    v16 = (NSManagedObject *)_PFRetainedObjectIDCore((uint64_t)self, objectID, error, 0);
    if (v16)
    {
      v17 = v16;
      v28 = 0;
      v10 = (NSManagedObject *)-[NSFaultHandler fulfillFault:withContext:error:]((id)_insertion_fault_handler, v16, (uint64_t)self, (id *)&v28);
      if (v10 == v17)
        v18 = v17;
      else

      if (v28)
      {
        if (error)
        {
          v10 = 0;
          *error = v28;
          return v10;
        }
      }
      else
      {
        if (v10)
          return v10;
        v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "existingObjectWithID incorrectly returned nil without an error set for objectID %@");
        _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)objectID);
        v26 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = objectID;
          _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: existingObjectWithID incorrectly returned nil without an error set for objectID %@", buf, 0xCu);
        }
      }
      return 0;
    }
    if (!error)
      return 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB28A8];
    v29 = CFSTR("objectID");
    v30 = objectID;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v30;
    v15 = &v29;
LABEL_15:
    v8 = (NSError *)objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 133000, objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1));
    goto LABEL_16;
  }
  v9 = -[NSManagedObjectContext objectRegisteredForID:](self, "objectRegisteredForID:", objectID);
  v10 = v9;
  if (error && !v9)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB28A8];
    v33 = CFSTR("objectID");
    v34[0] = objectID;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (NSManagedObjectID **)v34;
    v15 = &v33;
    goto LABEL_15;
  }
  return v10;
}

- (uint64_t)_committedSnapshotForObject:(uint64_t)result
{
  uint64_t v3;
  NSKnownKeysDictionary *v4;

  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(result, sel__committedSnapshotForObject_);
      if (a2)
      {
LABEL_4:
        v3 = a2[6];
        if (v3 && *(_QWORD *)(v3 + 8))
          return *(_QWORD *)(v3 + 8);
        v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
        -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

        v3 = a2[6];
        if (v3)
          return *(_QWORD *)(v3 + 8);
      }
    }
    else if (a2)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

uint64_t __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(result + 48))
  {
    v1 = result;
    v2 = 0;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v2))
      {
        result = objc_msgSend(*(id *)(v1 + 32), "objectRegisteredForID:");
        if (result)
        {
          v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24);
          *(_BYTE *)(v3 + v2) |= 1u;
        }
      }
      ++v2;
    }
    while (v2 < *(_QWORD *)(v1 + 48));
  }
  return result;
}

- (void)_resetAllChanges
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = (uint64_t)result;
    -[NSManagedObjectContext _clearUnprocessedUpdates]((uint64_t)result);
    -[NSManagedObjectContext _clearUpdates](v1);
    -[NSManagedObjectContext _clearUnprocessedInsertions](v1);
    -[NSManagedObjectContext _clearInsertions](v1);
    -[NSManagedObjectContext _clearUnprocessedDeletions](v1);
    -[NSManagedObjectContext _clearDeletions](v1);
    objc_msgSend(*(id *)(v1 + 104), "removeAllObjects");
    objc_msgSend(*(id *)(v1 + 112), "removeAllObjects");
    result = *(void **)(*(_QWORD *)(v1 + 184) + 40);
    if (result)
    {
      result = (void *)objc_msgSend(result, "isUndoRegistrationEnabled");
      if ((_DWORD)result)
        result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "removeAllActions");
    }
    ++*(_WORD *)(v1 + 48);
    v2 = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v2 & 0xFFFFFFFFFFFFF9DFLL;
    if ((v2 & 0x800) != 0)
    {
      objc_msgSend((id)v1, "willChangeValueForKey:", CFSTR("hasChanges"));
      *(_QWORD *)(v1 + 40) &= ~0x800uLL;
      return (void *)objc_msgSend((id)v1, "didChangeValueForKey:", CFSTR("hasChanges"));
    }
  }
  return result;
}

- (void)_didSaveChanges
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  void *v35;
  uint64_t k;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  _DWORD *v50;
  _DWORD *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  _DWORD *v56;
  _DWORD *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  NSQueryGenerationToken *v62;
  uint64_t v63;
  id v64;
  uint64_t *v65;
  unint64_t v66;
  uint64_t *v67;
  unint64_t v68;
  uint64_t jj;
  _BYTE *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _BYTE v76[4];
  int v77;
  _BYTE *v78;
  int v79;
  id v80;
  void *v81;
  uint64_t *v82;
  uint64_t *v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  v2 = *(void **)(*(_QWORD *)(a1 + 184) + 136);
  if (objc_msgSend(v2, "count"))
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v102 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          v7 = (void *)objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v6, "firstObject"));
          v8 = v7;
          if (v7)
          {
            v9 = (void *)objc_msgSend(v7, "entity");
            v10 = objc_msgSend(v6, "objectAtIndex:", 1);
            if (v9)
            {
              if (objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v10))
              {
                objc_msgSend(v6, "lastObject");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v11 = 0;
                else
                  v11 = objc_msgSend(v6, "lastObject");
                objc_msgSend(v8, "setValue:forKey:", v11, objc_msgSend(v6, "objectAtIndex:", 1));
              }
            }
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v101, v109, 16);
      }
      while (v3);
    }
    *(_QWORD *)(a1 + 40) &= 0xFFFFFFFFFFFFF9FFLL;
  }
  v12 = *(void **)(*(_QWORD *)(a1 + 184) + 144);
  if (objc_msgSend(v12, "count"))
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v98;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v98 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
          v17 = (void *)objc_msgSend((id)a1, "objectRegisteredForID:", objc_msgSend(v16, "firstObject"));
          v18 = v17;
          if (v17)
          {
            v19 = (void *)objc_msgSend(v17, "entity");
            v20 = objc_msgSend(v16, "objectAtIndex:", 1);
            if (v19)
            {
              if (objc_msgSend((id)objc_msgSend(v19, "propertiesByName"), "objectForKey:", v20))
              {
                objc_msgSend(v16, "lastObject");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = 0;
                else
                  v21 = objc_msgSend(v16, "lastObject");
                objc_msgSend(v18, "setValue:forKey:", v21, objc_msgSend(v16, "objectAtIndex:", 1));
              }
            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
      }
      while (v13);
    }
    *(_QWORD *)(a1 + 40) &= 0xFFFFFFFFFFFFF9FFLL;
  }
  v22 = (void *)objc_msgSend(*(id *)(a1 + 80), "copy");
  v84 = objc_msgSend(v22, "count");
  v78 = v76;
  MEMORY[0x1E0C80A78](v84);
  v25 = (uint64_t *)&v76[-v24];
  if (v26 >= 0x201)
  {
    v83 = (uint64_t *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 80), "getObjects:", v83);
  }
  else
  {
    bzero(&v76[-v24], 8 * v23);
    v27 = *(void **)(a1 + 80);
    v83 = v25;
    objc_msgSend(v27, "getObjects:", v25);
    if (!v84)
    {
      v79 = 1;
      goto LABEL_41;
    }
  }
  v28 = 0;
  do
  {
    v29 = (_QWORD *)v83[v28];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v29);
    objc_msgSend(v29, "_setVersionReference__:", 1);
    ++v28;
  }
  while (v84 != v28);
  v79 = 0;
LABEL_41:
  objc_msgSend(v81, "setObject:forKey:", v22, CFSTR("inserted"));

  v30 = objc_msgSend(*(id *)(a1 + 96), "count");
  v31 = (void *)objc_msgSend(*(id *)(a1 + 96), "copy");
  MEMORY[0x1E0C80A78](v31);
  v34 = (uint64_t *)&v76[-v33];
  if (v30 >= 0x201)
  {
    v82 = (uint64_t *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 96), "getObjects:", v82);
  }
  else
  {
    bzero(&v76[-v33], 8 * v32);
    v35 = *(void **)(a1 + 96);
    v82 = v34;
    objc_msgSend(v35, "getObjects:", v34);
    if (!v30)
    {
      v77 = 1;
      goto LABEL_48;
    }
  }
  for (k = 0; k != v30; ++k)
  {
    v37 = (_QWORD *)v82[k];
    -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](v37);
    objc_msgSend(v37, "_setVersionReference__:", objc_msgSend(v37, "_versionReference") + 1);
  }
  v77 = 0;
LABEL_48:
  objc_msgSend(v81, "setObject:forKey:", v31, CFSTR("updated"));

  v38 = objc_msgSend(*(id *)(a1 + 88), "count");
  v39 = MEMORY[0x1E0C80A78](v38);
  v42 = &v76[-v41];
  if (v39 >= 0x201)
  {
    v42 = (_BYTE *)NSAllocateScannedUncollectable();
LABEL_52:
    v80 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v38);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 88), "allObjects"), "getObjects:range:", v42, 0, v38);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v42, v38);
    objc_msgSend(v81, "setObject:forKey:", v43, CFSTR("deleted"));

    v44 = 0;
    do
      -[NSManagedObjectContext _clearOriginalSnapshotAndInitializeRec:](*(_QWORD **)&v42[8 * v44++]);
    while (v38 != v44);
    goto LABEL_54;
  }
  bzero(&v76[-v41], 8 * v40);
  if (v38)
    goto LABEL_52;
  v80 = 0;
LABEL_54:
  -[NSManagedObjectContext _clearInsertions](a1);
  -[NSManagedObjectContext _clearUnprocessedInsertions](a1);
  -[NSManagedObjectContext _clearDeletions](a1);
  -[NSManagedObjectContext _clearUnprocessedDeletions](a1);
  -[NSManagedObjectContext _clearUpdates](a1);
  -[NSManagedObjectContext _clearUnprocessedUpdates](a1);
  v45 = *(_QWORD *)(a1 + 40);
  ++*(_WORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v45 & 0xFFFFFFFFFFFFFFDFLL;
  objc_msgSend(*(id *)(a1 + 104), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 112), "removeAllObjects");

  **(_QWORD **)(a1 + 184) = 0;
  if ((*(_BYTE *)(a1 + 41) & 8) != 0)
  {
    objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("hasChanges"));
    *(_QWORD *)(a1 + 40) &= ~0x800uLL;
    objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("hasChanges"));
  }
  v46 = (void *)objc_msgSend(v81, "objectForKey:", CFSTR("inserted"));
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v94;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v94 != v48)
          objc_enumerationMutation(v46);
        v50 = *(_DWORD **)(*((_QWORD *)&v93 + 1) + 8 * m);
        v51 = v50 + 4;
        v50[4] |= 0x10u;
        objc_msgSend(v50, "didSave");
        *v51 &= ~0x10u;
      }
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
    }
    while (v47);
  }
  v52 = (void *)objc_msgSend(v81, "objectForKey:", CFSTR("deleted"));
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v90;
    do
    {
      for (n = 0; n != v53; ++n)
      {
        if (*(_QWORD *)v90 != v54)
          objc_enumerationMutation(v52);
        v56 = *(_DWORD **)(*((_QWORD *)&v89 + 1) + 8 * n);
        v57 = v56 + 4;
        v56[4] |= 0x20u;
        objc_msgSend(v56, "didSave");
        *v57 &= ~0x20u;
      }
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v89, v106, 16);
    }
    while (v53);
  }
  v58 = (void *)objc_msgSend(v81, "objectForKey:", CFSTR("updated"));
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
  if (v59)
  {
    v60 = *(_QWORD *)v86;
    do
    {
      for (ii = 0; ii != v59; ++ii)
      {
        if (*(_QWORD *)v86 != v60)
          objc_enumerationMutation(v58);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * ii), "didSave");
      }
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v85, v105, 16);
    }
    while (v59);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 184) + 96), "_isEnabled"))
  {
    v62 = *(NSQueryGenerationToken **)(*(_QWORD *)(a1 + 184) + 96);
    if (v62 != +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"))objc_msgSend(v81, "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 184) + 96), CFSTR("newQueryGeneration"));
  }
  v63 = *(_QWORD *)(*(_QWORD *)(a1 + 184) + 120);
  if (v63)
    objc_msgSend(v81, "setValue:forKey:", v63, CFSTR("newChangeToken"));
  if (byte_1ECD8DE1E)
  {
    v64 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, a1);
    objc_msgSend(v81, "setValue:forKey:", v64, CFSTR("managedObjectContext"));
  }
  if ((*(_BYTE *)(a1 + 42) & 0x10) != 0)
    -[NSManagedObjectContext _postContextDidSaveNotificationWithUserInfo:](a1, v81);

  if ((v79 & 1) == 0)
  {
    v65 = v83;
    v66 = v84;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v65++);
      --v66;
    }
    while (v66);
  }
  if (v84 >= 0x201)
    NSZoneFree(0, v83);
  if ((v77 & 1) == 0)
  {
    v67 = v82;
    v68 = v30;
    do
    {
      -[NSManagedObject _nilOutReservedCurrentEventSnapshot__](*v67++);
      --v68;
    }
    while (v68);
  }
  if (v30 >= 0x201)
    NSZoneFree(0, v82);
  if (v38)
  {
    for (jj = 0; jj != v38; ++jj)
    {
      v70 = *(_BYTE **)&v42[8 * jj];
      v71 = (void *)objc_msgSend(v70, "objectID");
      if (v70)
      {
        if ((v70[17] & 2) != 0)
        {
          v72 = v71;
          if ((objc_msgSend(v71, "isTemporaryID") & 1) == 0)
            objc_msgSend(v80, "addObject:", v72);
        }
      }
      if (v70)
        v73 = _insertion_fault_handler;
      else
        v73 = 0;
      -[NSFaultHandler turnObject:intoFaultWithContext:](v73, (uint64_t)v70, a1);
      objc_msgSend((id)a1, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v70, 0, 1);
    }
    if (v38 >= 0x201)
      NSZoneFree(0, v42);
  }
  if (objc_msgSend(v80, "count"))
  {
    -[NSManagedObjectContext lockObjectStore](a1);
    v74 = *(void **)(a1 + 32);
    v75 = objc_msgSend((id)a1, "_queryGenerationToken");
    objc_msgSend(v74, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v80, v75);
    -[NSManagedObjectContext unlockObjectStore](a1);
  }

}

- (_QWORD)_clearOriginalSnapshotAndInitializeRec:(_QWORD *)result
{
  _QWORD *v1;

  if (result)
  {
    v1 = result;
    -[NSManagedObject _setOriginalSnapshot__:](result, 0);
    return -[NSManagedObject _setLastSnapshot__:](v1, 0);
  }
  return result;
}

- (uint64_t)_clearDeletions
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 88), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 88), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 88), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 88), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~0x20u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 88), "removeAllObjects");
}

- (uint64_t)_clearUpdates
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 96), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 96), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 96), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 96), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~8u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 96), "removeAllObjects");
}

- (uint64_t)_clearUnprocessedUpdates
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 56), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 56), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 56), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~1u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
}

- (uint64_t)_clearUnprocessedInsertions
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 72), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 72), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 72), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~2u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
}

- (uint64_t)_clearUnprocessedDeletions
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 64), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 64), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 64), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~4u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
}

- (uint64_t)_clearInsertions
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 80), "count");
  v3 = v2;
  if (v2 <= 1)
    v4 = 1;
  else
    v4 = v2;
  if (v2 >= 0x201)
    v5 = 1;
  else
    v5 = v4;
  v6 = (char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v2 >= 0x201)
  {
    v6 = (char *)NSAllocateScannedUncollectable();
    objc_msgSend(*(id *)(a1 + 80), "getObjects:", v6);
  }
  else
  {
    bzero((char *)v10 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    objc_msgSend(*(id *)(a1 + 80), "getObjects:", v6);
    if (!v3)
      return objc_msgSend(*(id *)(a1 + 80), "removeAllObjects");
  }
  v7 = 0;
  do
  {
    v8 = *(_QWORD *)&v6[8 * v7];
    if (v8)
      *(_DWORD *)(v8 + 16) &= ~0x10u;
    ++v7;
  }
  while (v3 != v7);
  if (v3 >= 0x201)
    NSZoneFree(0, v6);
  return objc_msgSend(*(id *)(a1 + 80), "removeAllObjects");
}

- (NSManagedObject)objectRegisteredForID:(NSManagedObjectID *)objectID
{
  NSManagedObject *Value;
  NSPersistentStore *v6;
  uint64_t v7;
  NSPersistentStoreCoordinator *v8;
  BOOL v9;
  void *v10;
  NSURL *v11;
  NSTemporaryObjectID *v12;
  NSTemporaryObjectID *v13;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, objectID);
  if (!Value)
  {
    v6 = -[NSManagedObjectID persistentStore](objectID, "persistentStore");
    v7 = -[NSPersistentStore _persistentStoreCoordinator](v6, "_persistentStoreCoordinator");
    v8 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    v9 = -[NSManagedObjectID _isPersistentStoreAlive](objectID, "_isPersistentStoreAlive");
    if (((NSPersistentStoreCoordinator *)v7 != v8 || !v9)
      && (v6 || !-[NSManagedObjectID isTemporaryID](objectID, "isTemporaryID")))
    {
      v10 = (void *)MEMORY[0x18D76B4E4]();
      v11 = -[NSManagedObjectID URIRepresentation](objectID, "URIRepresentation");
      if (-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]((uint64_t)v8, (uint64_t)-[NSManagedObjectID _storeIdentifier](objectID, "_storeIdentifier")))
      {
        v12 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v8, (CFURLRef)v11, 0);
        v13 = v12;
        if (v12)
        {
          Value = (NSManagedObject *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v12);
LABEL_14:

          objc_autoreleasePoolPop(v10);
          return Value;
        }
      }
      else
      {
        v12 = 0;
      }
      Value = 0;
      goto LABEL_14;
    }
    return 0;
  }
  return Value;
}

- (uint64_t)_registerUndoForOperation:(void *)a3 withObjects:(uint64_t)a4 withExtraArguments:
{
  uint64_t v8;
  uint64_t result;
  void *v10;
  uint64_t i;
  _QWORD *v12;
  NSKnownKeysDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 184) + 40))
  {
    v8 = objc_msgSend(a3, "count");
    result = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
    if (v8)
    {
      v10 = (void *)result;
      for (i = 0; i != v8; ++i)
      {
        v12 = (_QWORD *)objc_msgSend(a3, "objectAtIndex:", i);
        v13 = -[NSManagedObject _newSnapshotForUndo__](v12);
        if (-[NSKnownKeysDictionary count](v13, "count"))
          v14 = (uint64_t)v13;
        else
          v14 = NSKeyValueCoding_NullValue;
        objc_msgSend(v10, "addObject:", v14);

        -[NSManagedObject _setLastSnapshot__:](v12, 0);
      }
      if (a4)
        v15 = a4;
      else
        v15 = NSKeyValueCoding_NullValue;
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 184) + 40), "registerUndoWithTarget:selector:object:", a1, a2, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", a3, v10, v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(a1 + 48)), 0));
    }
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (result)
    {
      v16 = result;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(a3);
          -[NSManagedObject _setLastSnapshot__:](*(_QWORD **)(*((_QWORD *)&v19 + 1) + 8 * v18++), 0);
        }
        while (v16 != v18);
        result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v16 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_establishEventSnapshotsForObject:(uint64_t)a1
{
  uint64_t v3;
  NSKnownKeysDictionary *v4;
  uint64_t v5;
  NSKnownKeysDictionary *v6;
  NSKnownKeysDictionary *v7;

  if (!a1)
    return;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__establishEventSnapshotsForObject_);
    if (a2)
      goto LABEL_4;
LABEL_18:
    v4 = 0;
LABEL_9:
    -[NSManagedObject _setOriginalSnapshot__:](a2, v4);

    if (a2)
    {
      v5 = a2[6];
      if (v5 && *(_QWORD *)(v5 + 16))
        return;
      if (!v4)
      {
LABEL_15:
        v6 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
LABEL_16:
        v7 = v6;
        -[NSManagedObject _setLastSnapshot__:](a2, v6);

        return;
      }
    }
    else if (!v4)
    {
      v6 = 0;
      goto LABEL_16;
    }
    -[NSManagedObject _setLastSnapshot__:](a2, v4);
    return;
  }
  if (!a2)
    goto LABEL_18;
LABEL_4:
  v3 = a2[6];
  if (!v3 || !*(_QWORD *)(v3 + 8))
  {
    v4 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:](a2, __const__newAllPropertiesWithRelationshipFaultsIntact___simple, __const__newAllPropertiesWithRelationshipFaultsIntact___complex, 1);
    goto LABEL_9;
  }
  if (!*(_QWORD *)(v3 + 16))
    goto LABEL_15;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_1E1EDD790;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  _perform((uint64_t)self, (uint64_t)v4);
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]((uint64_t)v3, *(void **)(a1 + 40), 1, v4);
    else
      objc_msgSend(v3, "_mergeChangesFromDidSaveDictionary:usingObjectIDs:", *(_QWORD *)(a1 + 40), 1);
  }
  objc_msgSend(v2, "drain");
  -[NSManagedObjectContext _processReferenceQueue:](*(_QWORD *)(a1 + 32), 0);
}

- (void)mergeChangesFromContextDidSaveNotification:(NSNotification *)notification
{
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  NSManagedObjectContext **v10;
  NSPersistentStoreCoordinator *v11;
  id v12;
  NSManagedObjectContext *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = -[NSNotification object](notification, "object");
  if (v5 != self)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[NSString isEqualToString:](-[NSNotification name](notification, "name"), "isEqualToString:", CFSTR("com.apple.coredata.ubiquity.importer.didfinishimport")))
    {
      v7 = (void *)objc_opt_class();
      v8 = -[NSNotification userInfo](notification, "userInfo");
      v14[0] = self;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = (NSManagedObjectContext **)v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (v11 = -[NSManagedObjectContext persistentStoreCoordinator](v6, "persistentStoreCoordinator"),
            v11 == -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator")))
      {
        v12 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        -[NSManagedObjectContext _mergeChangesFromDidSaveDictionary:usingObjectIDs:](self, "_mergeChangesFromDidSaveDictionary:usingObjectIDs:", -[NSNotification userInfo](notification, "userInfo"), 0);
        objc_msgSend(v12, "drain");
        return;
      }
      v7 = (void *)objc_opt_class();
      v8 = -[NSNotification userInfo](notification, "userInfo");
      v13 = self;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v13;
    }
    objc_msgSend(v7, "_mergeChangesFromRemoteContextSave:intoContexts:", v8, objc_msgSend(v9, "arrayWithObjects:count:", v10, 1));
  }
}

- (void)_mergeChangesFromDidSaveDictionary:(id)a3 usingObjectIDs:(BOOL)a4
{
  -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]((uint64_t)self, a3, a4, 0);
}

+ (NSManagedObjectContext)alloc
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0);
}

- (NSManagedObjectContext)initWithConcurrencyType:(NSManagedObjectContextConcurrencyType)ct
{
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSObject *current_queue;
  char v8;
  NSObject *dispatchQueue;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  objc_super v15;

  objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)NSManagedObjectContext;
  v5 = -[NSManagedObjectContext init](&v15, sel_init);
  v6 = v5;
  if (!v5)
    return v6;
  if (ct == NSMainQueueConcurrencyType)
  {
    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 3);
    dispatchQueue = MEMORY[0x1E0C80D38];
    v6->_dispatchQueue = (void *)MEMORY[0x1E0C80D38];
    if (!dispatch_queue_get_specific(dispatchQueue, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
    {
      v10 = (void *)objc_opt_class();
      dispatch_queue_set_specific(MEMORY[0x1E0C80D38], "com.apple.CoreData.NSManagedObjectContext.mainQueue", v10, 0);
      dispatchQueue = v6->_dispatchQueue;
    }
    dispatch_retain(dispatchQueue);
    v11 = *(_QWORD *)&v6->_flags & 0xFFFFFFFFFFBFFFFFLL;
  }
  else
  {
    if (ct != NSPrivateQueueConcurrencyType)
    {
      if (ct)
      {
        v8 = 0;
      }
      else
      {
        v8 = (byte_1ECD8DA24 & 1) == 0
          && (current_queue = dispatch_get_current_queue(), pthread_main_np())
          && (current_queue == dispatch_get_global_queue(0, 0) || current_queue == MEMORY[0x1E0C80D38]);
        v5 = v6;
      }
      -[NSManagedObjectContext _initWithParentObjectStore:](v5, v8);
      goto LABEL_19;
    }
    -[NSManagedObjectContext _initWithParentObjectStore:](v5, 2);
    v6->_dispatchQueue = createQueueForMOC((id *)&v6->super.isa);
    v11 = *(_QWORD *)&v6->_flags | 0x400000;
  }
  v6->_flags = (_managedObjectContextFlags)v11;
LABEL_19:
  v6->_queueOwner = 0;
  v12 = +[NSSQLCore trackSQLiteDatabaseStatistics](NSSQLCore, "trackSQLiteDatabaseStatistics");
  v13 = 0x400000000;
  if (!v12)
    v13 = 0;
  v6->_flags = (_managedObjectContextFlags)(*(_QWORD *)&v6->_flags & 0xFFFFFFFBFFFFFFFFLL | v13);
  return v6;
}

- (void)_coreMergeChangesFromDidSaveDictionary:(int)a3 usingObjectIDs:(uint64_t)a4 withClientQueryGeneration:
{
  id v6;
  uint64_t v7;
  id Weak;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  size_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  NSKnownKeysDictionary *refreshed;
  id v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  void *v62;
  NSKnownKeysDictionary *v63;
  NSKnownKeysDictionary *v64;
  _QWORD *isa;
  unint64_t v66;
  char v67;
  id v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  void *v72;
  _BYTE *v73;
  _BYTE *v74;
  uint64_t *v75;
  unsigned __int8 *v76;
  void **v77;
  size_t v78;
  int v79;
  void *v80;
  NSKnownKeysDictionary *v81;
  int v82;
  unsigned __int8 v83;
  uint64_t v84;
  void **v85;
  unsigned __int8 *v86;
  uint64_t *v87;
  int v88;
  void *v89;
  NSKnownKeysDictionary *v90;
  int v91;
  unsigned __int8 v92;
  void **v93;
  char *v94;
  size_t v95;
  char v96;
  char v97;
  int v98;
  BOOL v99;
  uint64_t v100;
  char *v101;
  void **v102;
  char v103;
  char v104;
  int v105;
  BOOL v106;
  int v107;
  char v108;
  id v109;
  id *v110;
  size_t v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  uint64_t i;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  BOOL v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  uint64_t *v138;
  unint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  size_t v143;
  char *v144;
  unint64_t v145;
  char *v146;
  char *v147;
  unint64_t v148;
  unsigned __int8 *v149;
  id v150;
  char *v151;
  size_t v152;
  int v153;
  uint64_t v154;

  v153 = a3;
  v150 = a2;
  v154 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__coreMergeChangesFromDidSaveDictionary_usingObjectIDs_withClientQueryGeneration_);
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = objc_msgSend(v150, "objectForKey:", CFSTR("managedObjectContext"));
  if (!v7)
    goto LABEL_11;
  Weak = objc_loadWeak((id *)(v7 + 8));
  if (!Weak)
  {
    v9 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v9 = 0;
    Weak = 0;
    goto LABEL_12;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = Weak;
  do
  {
    objc_msgSend(v9, "addObject:", v10);
    v10 = (void *)objc_msgSend(v10, "parentContext");
  }
  while (v10);
LABEL_12:
  if (Weak == (id)a1 || v9 && objc_msgSend(v9, "containsObject:", a1))
  {
    objc_msgSend(v6, "drain");
    return;
  }
  v11 = (void *)objc_msgSend(v150, "objectForKey:", CFSTR("newQueryGeneration"));
  if (objc_msgSend(v11, "_isEnabled"))
    v12 = v11;
  else
    v12 = 0;
  v142 = (id)objc_msgSend((id)a1, "_queryGenerationToken");
  if (!a4 && objc_msgSend(v142, "_isEnabled"))
    objc_msgSend((id)a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
  v13 = (void *)objc_msgSend(v150, "objectForKey:", CFSTR("inserted"));
  v14 = (void *)objc_msgSend(v150, "objectForKey:", CFSTR("inserted_objectIDs"));
  v15 = objc_msgSend(v13, "count");
  v16 = v14;
  v17 = objc_msgSend(v14, "count");
  v138 = &v128;
  v135 = v17;
  v136 = v15;
  v18 = v17 + v15;
  if ((unint64_t)(v17 + v15) <= 1)
    v19 = 1;
  else
    v19 = v17 + v15;
  if (v18 >= 0x201)
    v20 = 1;
  else
    v20 = v19;
  v152 = v17 + v15;
  v140 = v6;
  if (v18 > 0x200)
  {
    v147 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v147 = (char *)&v128 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v147, 8 * v19);
  }
  v21 = v150;
  v22 = (void *)objc_msgSend(v150, "objectForKey:", CFSTR("updated"));
  v23 = (void *)objc_msgSend(v21, "objectForKey:", CFSTR("updated_objectIDs"));
  v24 = v22;
  v25 = objc_msgSend(v22, "count");
  v132 = v23;
  v26 = objc_msgSend(v23, "count");
  v134 = v25;
  v133 = v26;
  v27 = v26 + v25;
  if ((unint64_t)(v26 + v25) <= 1)
    v28 = 1;
  else
    v28 = v26 + v25;
  if (v27 >= 0x201)
    v29 = 1;
  else
    v29 = v28;
  v148 = v26 + v25;
  if (v27 > 0x200)
  {
    v146 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v146 = (char *)&v128 - ((8 * v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v146, 8 * v28);
  }
  v30 = v150;
  v31 = (void *)objc_msgSend(v150, "objectForKey:", CFSTR("deleted"));
  v32 = (void *)objc_msgSend(v30, "objectForKey:", CFSTR("deleted_objectIDs"));
  v33 = objc_msgSend(v31, "count");
  v131 = v32;
  v34 = objc_msgSend(v32, "count");
  v35 = v34 + v33;
  if ((unint64_t)(v34 + v33) <= 1)
    v36 = 1;
  else
    v36 = v34 + v33;
  if (v35 >= 0x201)
    v37 = 1;
  else
    v37 = v36;
  v145 = v34 + v33;
  v129 = v12;
  if (v35 > 0x200)
  {
    v144 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v144 = (char *)&v128 - ((8 * v37 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v144, 8 * v36);
  }
  v38 = v148;
  if (v145 > v148)
    v38 = v145;
  if (v38 <= v152)
    v39 = v152;
  else
    v39 = v38;
  if (v39 <= 1)
    v40 = 1;
  else
    v40 = v39;
  if (v39 >= 0x201)
    v41 = 1;
  else
    v41 = v40;
  v42 = (char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = v39;
  if (v39 > 0x200)
    v42 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v128 - ((8 * v41 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v40);
  v43 = v148 + v152;
  if (v148 + v152 <= 1)
    v44 = 1;
  else
    v44 = v148 + v152;
  if (v43 >= 0x201)
    v45 = 1;
  else
    v45 = v44;
  v143 = v148 + v152;
  if (v43 > 0x200)
  {
    v151 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    v151 = (char *)&v128 - ((8 * v45 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v151, 8 * v44);
  }
  v149 = (unsigned __int8 *)malloc_type_calloc(1uLL, v143, 0x100004077774924uLL);
  v141 = *(_QWORD *)(a1 + 40) & 0x200000;
  v128 = a4;
  v46 = (void *)objc_msgSend((id)a1, "persistentStoreCoordinator");
  *(_QWORD *)(a1 + 40) |= 0x202000uLL;
  v130 = v31;
  if (v152)
  {
    v47 = objc_msgSend(v13, "count");
    v48 = v13;
    v49 = v47;
    v50 = v24;
    objc_msgSend(v48, "getObjects:", v42);
    objc_msgSend(v16, "getObjects:", &v42[8 * v49]);
    v51 = 0;
    while (1)
    {
      v52 = *(void **)&v42[8 * v51];
      if ((v153 & 1) == 0 && v51 < v49)
        v52 = (void *)objc_msgSend(*(id *)&v42[8 * v51], "objectID");
      if ((objc_msgSend(v52, "_isPersistentStoreAlive") & 1) == 0
        && (objc_msgSend(v52, "isTemporaryID") & 1) == 0
        && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v52, "_storeIdentifier")))
      {
        break;
      }
      v53 = (id)objc_msgSend((id)a1, "objectWithID:", v52);
      v54 = (uint64_t)v53;
      *(_QWORD *)&v147[8 * v51] = v53;
      if (v53)
      {
        if ((objc_msgSend(v53, "hasChanges") & 1) != 0
          || (v55 = *(_QWORD **)(v54 + 48)) != 0 && (v55 = (_QWORD *)*v55) != 0)
        {
          if ((*(_BYTE *)(v54 + 16) & 0x24) != 0)
          {
            objc_msgSend(*(id *)(a1 + 64), "removeObject:", v54);
            objc_msgSend(*(id *)(a1 + 88), "removeObject:", v54);
            *(_DWORD *)(v54 + 16) &= 0xFFFFFFDB;
          }
          v56 = **(void ***)(a1 + 184);
          if (v56)
            objc_msgSend(v56, "removeObject:", objc_msgSend((id)v54, "objectID"));
          LOBYTE(v55) = 1;
        }
      }
      else
      {
        LOBYTE(v55) = 0;
      }
      v149[v51] = v55;
      if ((objc_msgSend((id)v54, "isFault") & 1) != 0)
        refreshed = 0;
      else
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](v54);
      if (!-[NSKnownKeysDictionary count](refreshed, "count"))
      {

        refreshed = 0;
      }
      *(_QWORD *)&v151[8 * v51++] = refreshed;
      if (v152 == v51)
      {
        v58 = objc_alloc(MEMORY[0x1E0C99E60]);
        v137 = (id)objc_msgSend(v58, "initWithObjects:count:", v147, v152);
        goto LABEL_98;
      }
    }
    v109 = 0;
  }
  else
  {
    v137 = 0;
    v50 = v24;
LABEL_98:
    if (v148)
    {
      v59 = objc_msgSend(v50, "count");
      objc_msgSend(v50, "getObjects:", v42);
      objc_msgSend(v132, "getObjects:", &v42[8 * v59]);
      v60 = 0;
      v61 = (char *)&v149[v152];
      while (1)
      {
        v62 = *(void **)&v42[8 * v60];
        if ((v153 & 1) == 0 && v60 < v59)
          v62 = (void *)objc_msgSend(*(id *)&v42[8 * v60], "objectID");
        if ((objc_msgSend(v62, "_isPersistentStoreAlive") & 1) == 0
          && (objc_msgSend(v62, "isTemporaryID") & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v62, "_storeIdentifier")))
        {
          break;
        }
        v63 = (NSKnownKeysDictionary *)(id)objc_msgSend((id)a1, "objectRegisteredForID:", v62);
        v64 = v63;
        if (v63)
        {
          if ((-[NSKnownKeysDictionary hasChanges](v63, "hasChanges") & 1) != 0)
          {
            LOBYTE(isa) = 1;
          }
          else
          {
            isa = v64[6].super.super.super.isa;
            if (isa)
              LOBYTE(isa) = *isa != 0;
          }
          *(_QWORD *)&v146[8 * v60] = v64;
          v61[v60] = (char)isa;
          v67 = -[NSKnownKeysDictionary isFault](v64, "isFault");
          v66 = v152 + v60;
          if ((v67 & 1) != 0)
            v64 = 0;
          else
            v64 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)v64);
        }
        else
        {
          *(_QWORD *)&v146[8 * v60] = 0;
          v66 = v60 + v152;
          v61[v60] = 0;
        }
        if (!-[NSKnownKeysDictionary count](v64, "count"))
        {

          v64 = 0;
        }
        *(_QWORD *)&v151[8 * v66] = v64;
        if (v148 == ++v60)
          goto LABEL_118;
      }
    }
    else
    {
LABEL_118:
      if (!v145)
      {
LABEL_134:
        if (v152)
        {
          v75 = (uint64_t *)v147;
          v76 = v149;
          v77 = (void **)v151;
          v78 = v152;
          do
          {
            v79 = *v76;
            v80 = *v77;
            if (*v75)
            {
              if (v80)
                v81 = (NSKnownKeysDictionary *)*v77;
              else
                v81 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              v82 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:](a1, *v75, v79 != 0, v81);
            }
            else
            {
              v82 = 0;
            }

            *v77++ = 0;
            v83 = v79 | 2;
            if (!v82)
              v83 = v79;
            *v76++ = v83;
            ++v75;
            --v78;
          }
          while (v78);
        }
        if (v152 < v143)
        {
          v84 = v133 + v134;
          v85 = (void **)&v151[8 * v152];
          v86 = &v149[v136 + v135];
          v87 = (uint64_t *)v146;
          do
          {
            v88 = *v86;
            v89 = *v85;
            if (*v87)
            {
              if (v89)
                v90 = (NSKnownKeysDictionary *)*v85;
              else
                v90 = (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
              v91 = -[NSManagedObjectContext _mergeRefreshObject:mergeChanges:withPersistentSnapshot:](a1, *v87, v88 != 0, v90);
            }
            else
            {
              v91 = 0;
            }

            *v85++ = 0;
            v92 = v88 | 2;
            if (!v91)
              v92 = v88;
            *v86++ = v92;
            ++v87;
            --v84;
          }
          while (v84);
        }
        if (v152)
        {
          v93 = (void **)v147;
          v94 = (char *)v149;
          v95 = v152;
          do
          {
            v97 = *v94++;
            v96 = v97;
            v98 = v97 & 2;
            if (*v93)
              v99 = v98 == 0;
            else
              v99 = 1;
            if (!v99)
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v93, v96 & 1);
            ++v93;
            --v95;
          }
          while (v95);
        }
        if (v152 < v143)
        {
          v100 = v133 + v134;
          v101 = (char *)&v149[v136 + v135];
          v102 = (void **)v146;
          do
          {
            v104 = *v101++;
            v103 = v104;
            v105 = v104 & 2;
            if (*v102)
              v106 = v105 == 0;
            else
              v106 = 1;
            if (!v106)
              -[NSManagedObjectContext _mergeRefreshEpilogueForObject:mergeChanges:](a1, *v102, v103 & 1);
            ++v102;
            --v100;
          }
          while (v100);
        }
        v107 = 1;
        v108 = 0;
        *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFDFDFFFLL | v141;
        goto LABEL_176;
      }
      v68 = v130;
      v69 = objc_msgSend(v130, "count");
      objc_msgSend(v68, "getObjects:", v42);
      objc_msgSend(v131, "getObjects:", &v42[8 * v69]);
      v70 = 0;
      while (1)
      {
        v71 = *(void **)&v42[8 * v70];
        if ((v153 & 1) == 0 && v70 < v69)
          v71 = (void *)objc_msgSend(*(id *)&v42[8 * v70], "objectID");
        if ((objc_msgSend(v71, "_isPersistentStoreAlive") & 1) == 0
          && (objc_msgSend(v71, "isTemporaryID") & 1) == 0
          && !objc_msgSend(v46, "persistentStoreForIdentifier:", objc_msgSend(v71, "_storeIdentifier")))
        {
          break;
        }
        if (v71)
        {
          v72 = **(void ***)(a1 + 184);
          if (!v72)
          {
            **(_QWORD **)(a1 + 184) = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v72 = **(void ***)(a1 + 184);
          }
          objc_msgSend(v72, "addObject:", v71);
        }
        v73 = (id)objc_msgSend((id)a1, "objectRegisteredForID:", v71);
        v74 = v73;
        if (v73 && (v73[16] & 0x20) == 0)
          objc_msgSend((id)a1, "deleteObject:", v73);
        *(_QWORD *)&v144[8 * v70++] = v74;
        if (v145 == v70)
          goto LABEL_134;
      }
    }
    v109 = v137;
  }
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFDFDFFFLL | v141;

  v107 = 0;
  v137 = 0;
  v108 = 1;
LABEL_176:
  if ((uint64_t)v143 >= 1)
  {
    v110 = (id *)v151;
    v111 = v143;
    do
    {
      if (*v110)

      ++v110;
      --v111;
    }
    while (v111);
  }
  v112 = v140;
  if (v143 >= 0x201)
    NSZoneFree(0, v151);
  if (v145 >= 0x201)
    NSZoneFree(0, v144);
  if (v152 >= 0x201)
    NSZoneFree(0, v147);
  if (v148 >= 0x201)
    NSZoneFree(0, v146);
  if (v139 >= 0x201)
    NSZoneFree(0, v42);
  if (v149)
    free(v149);
  if (v112)
    objc_msgSend(v112, "drain");
  if (v107)
  {
    if ((v108 & 1) == 0)
    {
      v113 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      if (v137)
      {
        v114 = *(id *)(*(_QWORD *)(a1 + 184) + 88);
        if (!v114)
        {
          v114 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          *(_QWORD *)(*(_QWORD *)(a1 + 184) + 88) = v114;
        }
        objc_msgSend(v114, "unionSet:", v137);
        v115 = v137;
      }
      v116 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v117 = v116;
      if (v129)
        objc_msgSend(v116, "setObject:forKey:", v129, CFSTR("newQueryGeneration"));
      for (i = 0; i != 40; i += 8)
      {
        v119 = (void *)objc_msgSend(v150, "objectForKey:", *(__CFString **)((char *)&off_1E1EDE260 + i));
        v120 = *(uint64_t *)((char *)&off_1E1EDE288 + i);
        v121 = (void *)objc_msgSend(v150, "objectForKey:", v120);
        if (objc_msgSend(v119, "count") || objc_msgSend(v121, "count"))
        {
          if (v119)
            v122 = v119;
          else
            v122 = (void *)NSSet_EmptySet;
          if (v121)
            v123 = v121;
          else
            v123 = (void *)NSSet_EmptySet;
          if (v153)
            v124 = v122;
          else
            v124 = (id)+[_PFRoutines newSetOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v122);
          v125 = v124;
          v126 = +[_PFRoutines newSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v124, v123);

          objc_msgSend(v117, "setObject:forKey:", v126, v120);
        }
      }
      v127 = v128 == 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 184) + 104) = objc_msgSend(v117, "copy");

      if (v127 && objc_msgSend(v142, "_isEnabled"))
        objc_msgSend((id)a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
      objc_msgSend((id)a1, "processPendingChanges");
      if (v113)
        objc_msgSend(v113, "drain");
      if (*(_QWORD *)(a1 + 24))
        -[NSManagedObjectContext _registerAsyncReferenceCallback](a1);
    }

  }
}

- (void)processPendingChanges
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
}

- (NSManagedObjectContext)parentContext
{
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
    return (NSManagedObjectContext *)self->_parentObjectStore;
  else
    return 0;
}

- (uint64_t)_retainedRegisteredObjects
{
  uint64_t v1;
  unint64_t Count;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  _QWORD v8[2];

  v1 = a1;
  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[NSManagedObjectContext _processReferenceQueue:](a1, 0);
    Count = _PFCMT_GetCount(*(_QWORD **)(v1 + 120));
    v3 = Count;
    if (Count <= 1)
      v4 = 1;
    else
      v4 = Count;
    if (Count >= 0x201)
      v5 = 1;
    else
      v5 = v4;
    v6 = (const void **)((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (Count > 0x200)
      v6 = (const void **)NSAllocateScannedUncollectable();
    else
      bzero((char *)v8 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v4);
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v6, -[_PFContextMapTable getAllObjects:](*(_QWORD *)(v1 + 120), v6));
    if (v3 >= 0x201)
      NSZoneFree(0, v6);
  }
  return v1;
}

- (void)reset
{
  unint64_t Count;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v19;
  id *additionalPrivateIvars;
  id *v21;
  id v22;
  _QWORD v23[2];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v24 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23[1] = v23;
  MEMORY[0x1E0C80A78](v5);
  v8 = (const void **)((char *)v23 - v7);
  if (Count >= 0x201)
    v8 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)v23 - v7, 8 * v6);
  v9 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v8);
  if (v9)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v12 = (uint64_t)v8[v10];
      v13 = (void *)objc_msgSend((id)v12, "objectID");
      v14 = (id)v12;
      v15 = objc_msgSend(v13, "isTemporaryID");
      if (v12 && ((*(_BYTE *)(v12 + 17) & 2) == 0 ? (v16 = 1) : (v16 = v15), (v16 & 1) == 0))
      {
        objc_msgSend(v4, "addObject:", v13);
        *(_DWORD *)(v12 + 16) &= ~0x200u;
      }
      else if (v15)
      {
        objc_msgSend(v5, "addObject:", v13);
      }
      if (v12)
        v17 = _insertion_fault_handler;
      else
        v17 = 0;
      -[NSFaultHandler turnObject:intoFaultWithContext:](v17, v12, (uint64_t)self);
      -[NSManagedObjectContext _forgetObject:propagateToObjectStore:removeFromRegistry:](self, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v12, 0, 0);

      v10 = v11;
    }
    while (v9 > v11++);
  }
  if (Count >= 0x201)
    NSZoneFree(0, v8);
  _PFCMT_RemoveAllValues(&self->_infoByGID->super.isa);
  -[NSManagedObjectContext _resetAllChanges](self);
  if (objc_msgSend(v4, "count"))
  {
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    objc_msgSend(self->_parentObjectStore, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v4, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "addObjectsFromArray:", v4);
  }
  else
  {

    v5 = v4;
  }
  if (byte_1ECD8DE1E)
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v5, CFSTR("invalidatedAll"), +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), CFSTR("managedObjectContext"), 0);
  else
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v5, CFSTR("invalidatedAll"), 0);
  -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v19);
  additionalPrivateIvars = self->_additionalPrivateIvars;
  v21 = (id *)additionalPrivateIvars[1];
  if (v21)
  {

    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars[1]);
    *((_QWORD *)self->_additionalPrivateIvars + 1) = 0;
    additionalPrivateIvars = self->_additionalPrivateIvars;
  }

  *self->_additionalPrivateIvars = 0;
  *((_QWORD *)self->_additionalPrivateIvars + 17) = 0;

  *((_QWORD *)self->_additionalPrivateIvars + 18) = 0;
  *((_QWORD *)self->_additionalPrivateIvars + 14) = 0;

  *((_QWORD *)self->_additionalPrivateIvars + 19) = 0;
  if (objc_msgSend((id)-[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"), "_isEnabled"))-[NSManagedObjectContext _setQueryGenerationFromToken:error:](self, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);

  objc_msgSend(v24, "drain");
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
  v22 = 0;
}

- (uint64_t)_prepareForPushChanges:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "discardEditing");
  v4 = *(_QWORD *)(a1 + 40);
  if ((v4 & 2) == 0)
    *(_QWORD *)(a1 + 40) = v4 | 2;
  v5 = v4 & 2;
  if ((-[NSManagedObjectContext _processRecentChanges:](a1, a2) & 1) == 0)
  {
    v14 = 0;
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFBF5 | v5;
    return v14;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 184) + 40), "disableUndoRegistration");
  v6 = 0;
  v7 = 1;
  while (!v6 || -[NSManagedObjectContext _processRecentChanges:](a1, a2))
  {
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v8 | 8;
    v9 = (v8 >> 2) & 1;
    v16 = 0;
    if (-[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, *(void **)(a1 + 88), 2, (uint64_t *)&v16, (v8 >> 2) & 1, 1))
    {
      v10 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, *(void **)(a1 + 80), 0, (uint64_t *)&v16, (v8 >> 2) & 1, 1);
      if ((v8 & 4) == 0)
        goto LABEL_12;
    }
    else
    {
      v10 = 0;
      if ((v8 & 4) == 0)
      {
LABEL_12:
        if (!v10)
          goto LABEL_20;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 96), "count"))
    {
      if (objc_msgSend(*(id *)(a1 + 88), "count") || objc_msgSend(*(id *)(a1 + 80), "count"))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 96));
        objc_msgSend(v11, "minusSet:", *(_QWORD *)(a1 + 88));
        objc_msgSend(v11, "minusSet:", *(_QWORD *)(a1 + 80));
      }
      else
      {
        v11 = *(void **)(a1 + 96);
        v13 = v11;
      }
      if (v10)
        v10 = -[NSManagedObjectContext _validateObjects:forOperation:error:exhaustive:forSave:]((char *)a1, v11, 1, (uint64_t *)&v16, v9, 1);

    }
LABEL_20:
    if (a2 && (v10 & 1) == 0)
      *a2 = v16;
    if (!v10)
      break;
    v12 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v12 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(v7 == 998) << 10);
    if (v7 == 1000)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to process pending changes before save.  The context is still dirty after 1000 attempts.  Typically this recursive dirtying is caused by a bad validation method, -willSave, or notification handler."), 0));
    *(_QWORD *)(a1 + 40) = v12 & 0xFFFFFFFFFFFFFBF7 | ((unint64_t)(v7 == 998) << 10);
    --v6;
    ++v7;
    if ((v12 & 0x200) == 0)
    {
      v14 = 1;
      goto LABEL_30;
    }
  }
  v14 = 0;
LABEL_30:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 184) + 40), "enableUndoRegistration");
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFBF5 | v5;
  return v14;
}

- (uint64_t)_validateObjects:(int)a3 forOperation:(uint64_t *)a4 error:(int)a5 exhaustive:(int)a6 forSave:
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  char v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  unint64_t v79;
  char v80;
  id v81;
  void *v82;
  uint64_t v83;
  BOOL v84;
  const __CFString *v86;
  int v87;
  const __CFString *v88;
  uint64_t *v89;
  id v90;
  uint64_t v91;
  int v92;
  int v93;
  int v94;
  id v95;
  id v96;
  int v97;
  int v98;
  id v99;
  _QWORD *v100;
  unint64_t v101;
  id v102;
  uint64_t *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __CFString *v108;
  _BYTE v109[48];
  uint64_t v110;

  v87 = a6;
  v93 = a5;
  v89 = a4;
  v103 = (uint64_t *)a1;
  v110 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a2, "count");
  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  if (v8 >= 0x201)
    v10 = 1;
  else
    v10 = v9;
  v11 = (char *)&v86 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = v8;
  v90 = a2;
  if (v8 >= 0x201)
  {
    v100 = (_QWORD *)NSAllocateScannedUncollectable();
    objc_msgSend(a2, "getObjects:");
    goto LABEL_12;
  }
  bzero(v11, 8 * v9);
  v100 = v11;
  objc_msgSend(a2, "getObjects:", v11);
  if (v101)
  {
LABEL_12:
    v95 = 0;
    v15 = 0;
    v13 = v103 + 5;
    v88 = CFSTR("NSValidationErrorKey");
    v91 = *MEMORY[0x1E0CB28A8];
    v86 = CFSTR("NSDetailedErrors");
    v94 = 1;
    v98 = a3;
    while (1)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v17 = (void *)v100[v15];
      v108 = 0;
      v102 = v16;
      if (a3 == 2)
        break;
      if (a3 == 1)
      {
        v19 = objc_msgSend(v17, "validateForUpdate:", &v108);
        goto LABEL_19;
      }
      if (a3)
        goto LABEL_20;
      v18 = objc_msgSend(v17, "validateForInsert:", &v108);
LABEL_21:
      v20 = v108;
      objc_msgSend(v102, "drain");
      v21 = v108;
      v22 = (__CFString *)0;
      a3 = v98;
      if ((v18 & 1) == 0)
      {
        if (!v95)
        {
          v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v95 = (id)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v90, "count"));
        }
        v22 = v108;
        if (v108)
        {
          v24 = (void *)-[__CFString domain](v108, "domain");
          if (objc_msgSend(v24, "isEqual:", v91) && -[__CFString code](v108, "code") == 1560)
          {
            v25 = (void *)-[__CFString userInfo](v108, "userInfo");
            v26 = objc_msgSend(v25, "objectForKey:", v86);
            v22 = (__CFString *)objc_msgSend(v95, "addObjectsFromArray:", v26);
          }
          else
          {
            v22 = (__CFString *)objc_msgSend(v95, "addObject:", v108, v86);
          }
        }
        if ((v93 & 1) == 0)
          goto LABEL_90;
        v94 = 0;
      }
      if (++v15 == v101)
      {
        if ((v94 & 1) != 0)
        {
          if ((v87 & 1) == 0)
            goto LABEL_89;
          v74 = 0;
          v12 = *v13;
          *v13 |= 8uLL;
          do
          {
            v75 = (void *)MEMORY[0x18D76B4E4](v22);
            objc_msgSend((id)v100[v74], "willSave");
            objc_autoreleasePoolPop(v75);
            ++v74;
          }
          while (v101 != v74);
          v14 = *v13;
          goto LABEL_88;
        }
LABEL_90:
        if (objc_msgSend(v95, "count", v86) == 1)
        {
          if (v89)
          {
            v77 = objc_msgSend(v95, "objectAtIndex:", 0);
            v76 = 0;
            *v89 = v77;
            goto LABEL_98;
          }
        }
        else
        {
          v78 = v89 != 0;
          v79 = objc_msgSend(v95, "count");
          v80 = !v78;
          if (v79 < 2)
            v80 = 1;
          if ((v80 & 1) == 0)
          {
            v81 = objc_alloc(MEMORY[0x1E0C99D80]);
            v82 = (void *)objc_msgSend(v81, "initWithObjectsAndKeys:", v95, v86, 0);
            v83 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v91, 1560, v82);
            *v89 = v83;

          }
        }
        v76 = 0;
LABEL_98:
        v84 = v101 < 0x201;

        if (!v84)
          NSZoneFree(0, v100);
        return v76;
      }
    }
    v19 = objc_msgSend(v17, "validateForDelete:", &v108);
LABEL_19:
    if ((v19 & 1) != 0)
    {
LABEL_20:
      v18 = 1;
      goto LABEL_21;
    }
    v92 = v19;
    v99 = v17;
    v27 = objc_msgSend((id)objc_msgSend(v103, "mergePolicy"), "mergeType");
    v18 = 0;
    if (v27 > 4 || ((1 << v27) & 0x16) == 0)
      goto LABEL_21;
    v28 = v99;
    if ((-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v103, (uint64_t)v99) & 1) == 0)
    {
      *v13 |= 0x2000uLL;
      if (v108)
        v51 = v108;
      else
        v51 = CFSTR("null");
      -[__CFString userInfo](v108, "userInfo", v86);
      objc_msgSend(v28, "objectID");
      _NSCoreDataLog(4, (uint64_t)CFSTR("repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it"), v52, v53, v54, v55, v56, v57, (uint64_t)v51);
      if (!objc_msgSend(v28, "managedObjectContext"))
        -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v103, v28);
      objc_msgSend(v103, "deleteObject:", v28);
      -[NSManagedObject _propagateDelete:]((uint64_t *)v28, 3);
      *v13 &= ~0x2000uLL;
      v108 = 0;
      v18 = 1;
      goto LABEL_21;
    }
    v29 = (void *)-[__CFString userInfo](v108, "userInfo");
    v30 = objc_msgSend(v29, "objectForKey:", CFSTR("NSValidationErrorShouldAttemptRecoveryKey"));
    v31 = v98;
    if (v30)
    {
      v32 = -[NSEntityDescription _relationshipNamed:]((_QWORD *)objc_msgSend(v28, "entity"), objc_msgSend(v29, "objectForKey:", v88));
      v33 = v32;
      if (v32 && (objc_msgSend(v32, "isToMany") & 1) == 0)
      {
        v58 = (void *)objc_msgSend(v28, "valueForKey:", objc_msgSend(v33, "name"));
        if (objc_msgSend(v58, "isFault")
          && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v103, (uint64_t)v58) & 1) == 0)
        {
          *v13 |= 0x2000uLL;
          if (v108)
            v59 = v108;
          else
            v59 = CFSTR("null");
          -[__CFString userInfo](v108, "userInfo", v86);
          objc_msgSend(v58, "objectID");
          _NSCoreDataLog(4, (uint64_t)CFSTR("repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it"), v60, v61, v62, v63, v64, v65, (uint64_t)v59);
          if (!objc_msgSend(v58, "managedObjectContext"))
            -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v103, v58);
          objc_msgSend(v103, "deleteObject:", v58);
          -[NSManagedObject _propagateDelete:]((uint64_t *)v58, 3);
          *v13 &= ~0x2000uLL;
          v31 = v98;
        }
      }
      else if (objc_msgSend(v33, "isToMany", v86))
      {
        v97 = objc_msgSend(v33, "isOrdered");
        v34 = (void *)objc_msgSend(v28, "valueForKey:", objc_msgSend(v33, "name"));
        if (objc_msgSend(v34, "count"))
        {
          v35 = (void *)objc_msgSend(v34, "copy");
          v96 = v33;
          v107 = 0u;
          v106 = 0u;
          v105 = 0u;
          v104 = 0u;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
          if (v36)
          {
            v37 = 0;
            v38 = *(_QWORD *)v105;
            do
            {
              for (i = 0; i != v36; ++i)
              {
                if (*(_QWORD *)v105 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
                if (objc_msgSend(v40, "isFault")
                  && (-[NSManagedObjectContext _checkObjectForExistenceAndCacheRow:]((uint64_t)v103, (uint64_t)v40) & 1) == 0)
                {
                  *v13 |= 0x2000uLL;
                  if (v108)
                    v41 = v108;
                  else
                    v41 = CFSTR("null");
                  -[__CFString userInfo](v108, "userInfo");
                  objc_msgSend(v40, "objectID");
                  _NSCoreDataLog(4, (uint64_t)CFSTR("repairing validation failure %@ (%@) by deleting %@ because it no longer exists and the merge policy allows it"), v42, v43, v44, v45, v46, v47, (uint64_t)v41);
                  if (!objc_msgSend(v40, "managedObjectContext"))
                    -[NSManagedObjectContext _forceRegisterLostFault:]((uint64_t)v103, v40);
                  objc_msgSend(v103, "deleteObject:", v40);
                  if (!v37)
                  {
                    if (v97)
                    {
                      v48 = objc_msgSend(v96, "name");
                      v49 = objc_msgSend(v99, "mutableOrderedSetValueForKey:", v48);
                    }
                    else
                    {
                      v50 = objc_msgSend(v96, "name");
                      v49 = objc_msgSend(v99, "mutableSetValueForKey:", v50);
                    }
                    v37 = (void *)v49;
                  }
                  objc_msgSend(v37, "removeObject:", v40);
                  -[NSManagedObject _propagateDelete:]((uint64_t *)v40, 3);
                  *v13 &= ~0x2000uLL;
                }
              }
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
            }
            while (v36);
          }
          v31 = v98;

          v28 = v99;
        }
      }
    }
    v108 = 0;
    if (v31 == 2)
    {
      v66 = objc_msgSend(v28, "validateForDelete:", &v108);
    }
    else
    {
      if (v31 != 1)
        goto LABEL_20;
      v66 = objc_msgSend(v28, "validateForUpdate:", &v108);
    }
    if ((v66 & 1) == 0)
    {
      v67 = (uint64_t)v108;
      -[__CFString userInfo](v108, "userInfo");
      _NSCoreDataLog(2, (uint64_t)CFSTR("validation recovery attempt FAILED with %@ and %@."), v68, v69, v70, v71, v72, v73, v67);
      v18 = 0;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if ((v87 & 1) != 0)
  {
    v95 = 0;
    v13 = v103 + 5;
    v12 = v103[5];
    v14 = v12 | 8;
    v103[5] = v12 | 8;
LABEL_88:
    *v13 = v14 & 0xFFFFFFFFFFFFFFF7 | (8 * ((v12 >> 3) & 1));
LABEL_89:
    v76 = 1;
    goto LABEL_98;
  }
  return 1;
}

- (void)discardEditing
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((_QWORD *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v3 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  }
  if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
  {
    if (-[NSManagedObjectContext isEditing](self, "isEditing"))
    {
      Count = CFArrayGetCount(v3);
      v5 = Count - 1;
      if (Count >= 1)
      {
        do
          objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5--), "discardEditing");
        while (v5 != -1);
      }
    }
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (void)_dealloc__
{
  Class *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t Count;
  _PFTask *v9;
  void **v10;
  void *v11;
  malloc_zone_t *v12;
  pthread_t v13;
  void *v14;
  void *v15;
  NSObject *current_queue;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (!a1)
    return;
  if (*(_QWORD *)(a1 + 184))
    goto LABEL_3;
  *(_QWORD *)(a1 + 184) = PF_CALLOC_OBJECT_ARRAY(21);
  if (!*(_QWORD *)(a1 + 136))
  {
    v2 = (Class *)0x1E0CB38E0;
    if (_PF_Threading_Debugging_level <= 0)
      v2 = (Class *)off_1E1EDAE60;
    *(_QWORD *)(a1 + 136) = objc_alloc_init(*v2);
  }
  if (_PF_Threading_Debugging_level)
  {
    v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v12 = malloc_default_zone();
    *(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) = malloc_type_zone_malloc(v12, 0x30uLL, 0x80040B8603338uLL);
    v13 = pthread_self();
    **(_QWORD **)(*(_QWORD *)(a1 + 184) + 56) = v13;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 8) = v13;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 16) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 32) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((*(_BYTE *)(a1 + 41) & 0x80) == 0)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
      if (objc_msgSend(v14, "maxConcurrentOperationCount") == 1)
        v15 = v14;
      else
        v15 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 16) = v15;
      current_queue = dispatch_get_current_queue();
      if (current_queue == dispatch_get_global_queue(0, 0))
        v17 = 0;
      else
        v17 = current_queue;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 24) = v17;
    }
LABEL_3:
    if (_PF_Threading_Debugging_level)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) + 8) = pthread_self();
      if (_PF_Threading_Debugging_level)
        _PFAssertSafeMultiThreadedAccess_impl(a1, sel__dealloc__);
    }
  }
  if (*(_QWORD *)(a1 + 192))
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    _NSCoreDataLog(1, (uint64_t)CFSTR("NSManagedObjectContext over-release triggered improper dealloc here:\n\t %@"), v19, v20, v21, v22, v23, v24, v18);
    __break(1u);
    return;
  }
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if ((v4 & 0x8000) == 0)
    {
      if ((v4 & 0x800) == 0)
        goto LABEL_15;
LABEL_29:
      objc_msgSend((id)a1, "willChangeValueForKey:", CFSTR("hasChanges"));
      *(_QWORD *)(a1 + 40) &= ~0x800uLL;
      objc_msgSend((id)a1, "didChangeValueForKey:", CFSTR("hasChanges"));
      v4 = *(_QWORD *)(a1 + 40);
      if ((v4 & 0x100) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](*(_QWORD *)(a1 + 160));
  v4 = *(_QWORD *)(a1 + 40);
  if ((v4 & 0x800) != 0)
    goto LABEL_29;
LABEL_15:
  if ((v4 & 0x100) == 0)
  {
LABEL_16:
    *(_QWORD *)(a1 + 40) = v4 | 0x100;
    if (*(_QWORD *)(a1 + 184))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      -[NSManagedObjectContext _stopObservingUndoManagerNotifications](a1);

      *(_QWORD *)(*(_QWORD *)(a1 + 184) + 40) = 0;
      v6 = objc_msgSend((id)a1, "persistentStoreCoordinator");
      if (v6)
        objc_msgSend(v5, "removeObserver:name:object:", a1, CFSTR("_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification"), v6);
      if ((*(_BYTE *)(a1 + 43) & 4) != 0 && *(_QWORD *)(a1 + 32))
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", a1, CFSTR("_NSManagedObjectContextDidSaveObjectIDsPrivateNotification"), *(_QWORD *)(a1 + 32));
    }
    v7 = *(void **)(*(_QWORD *)(a1 + 184) + 72);
    if (v7)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 184) + 72) = 0;
    }
    Count = _PFCMT_GetCount(*(_QWORD **)(a1 + 120));
    if (v3 || Count < 0x12C)
    {
      -[NSManagedObjectContext _dispose:](a1);
      if (!v3)
        _PFDeallocateObject((id)a1);
    }
    else
    {
      v9 = -[_PFTask initWithFunction:withArgument:andPriority:]([_PFTask alloc], "initWithFunction:withArgument:andPriority:", _deallocateContextBackgroundThread, a1, 0);
      if (v9)

    }
    return;
  }
LABEL_30:
  v10 = *(void ***)(a1 + 184);
  if (v10)
  {
    if (v10[7])
    {
      PF_FREE_OBJECT_ARRAY(v10[7]);
      *(_QWORD *)(*(_QWORD *)(a1 + 184) + 56) = 0;
      v10 = *(void ***)(a1 + 184);
    }
    PF_FREE_OBJECT_ARRAY(v10);
    *(_QWORD *)(a1 + 184) = 0;
  }
  v11 = *(void **)(a1 + 136);
  if (v11)
  {

    *(_QWORD *)(a1 + 136) = 0;
  }
}

- (uint64_t)_stopObservingUndoManagerNotifications
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 184) + 40))
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v2, "removeObserver:name:object:", v1, *MEMORY[0x1E0CB3398], *(_QWORD *)(*(_QWORD *)(v1 + 184) + 40));
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 184) + 40), "removeAllActionsWithTarget:", v1);
  }
  return result;
}

- (uint64_t)_dispose:(uint64_t)result
{
  uint64_t v1;
  const void *v2;
  BOOL v3;
  unint64_t Count;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  CFIndex v9;
  __CFArray *v10;
  id *v11;
  _DWORD *v12;
  void *v13;
  char v14;
  const void *v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  const void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  malloc_zone_t *v31;
  NSObject *v32;
  const void *v33;
  const void *v34;
  _QWORD v35[2];
  id v36;
  const void **v37;
  CFArrayCallBacks callBacks;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  objc_msgSend(*(id *)(result + 136), "lock");
  ++*(_DWORD *)(v1 + 52);
  *(_QWORD *)(v1 + 40) |= 0x100uLL;
  if (_PF_Threading_Debugging_level && *(_QWORD *)(*(_QWORD *)(v1 + 184) + 56))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 184) + 56) + 8) = pthread_self();
  v2 = *(const void **)(v1 + 32);
  if (v2)
    v3 = CFGetRetainCount(v2) == 1;
  else
    v3 = 0;
  ++*(_WORD *)(v1 + 50);
  -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](*(_QWORD *)(v1 + 160));
  Count = _PFCMT_GetCount(*(_QWORD **)(v1 + 120));
  v35[1] = v35;
  v5 = MEMORY[0x1E0C80A78](Count);
  v8 = (const void **)((char *)v35 - v7);
  if (v5 >= 0x201)
    v8 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)v35 - v7, 8 * v6);
  v9 = -[_PFContextMapTable getAllObjects:](*(_QWORD *)(v1 + 120), v8);
  -[NSManagedObjectContext lockObjectStore](v1);
  v36 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v37 = v8;
  *(_OWORD *)&callBacks.version = xmmword_1E1EDE2B0;
  *(_OWORD *)&callBacks.release = *(_OWORD *)&off_1E1EDE2C0;
  callBacks.equal = 0;
  if (!v3)
  {
    v10 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, &callBacks);
    if (!v9)
      goto LABEL_28;
LABEL_13:
    v11 = (id *)v37;
    do
    {
      v12 = *v11;
      v13 = (void *)objc_msgSend(*v11, "objectID");
      if (v12)
        v14 = v3;
      else
        v14 = 1;
      if ((v14 & 1) == 0 && (*((_BYTE *)v12 + 17) & 2) != 0)
      {
        v15 = v13;
        if ((objc_msgSend(v13, "isTemporaryID") & 1) == 0)
        {
          CFArrayAppendValue(v10, v15);
          v12[4] &= ~0x200u;
        }
      }
      v16 = v12[4];
      v17 = v16 & 0xFFFFFFC0;
      v12[4] = v16 & 0xFFFFFFC0;
      v18 = (v16 >> 15) & 7;
      if (v18 == 5 || v18 == 0)
      {
        -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)v12, 0);
        v17 = v12[4];
      }
      *((_QWORD *)v12 + 4) = 0;
      v12[4] = v17 | 0x80080;
      ++v11;
      --v9;
    }
    while (v9);
    goto LABEL_28;
  }
  v10 = 0;
  if (v9)
    goto LABEL_13;
LABEL_28:
  if (!v3 && CFArrayGetCount(v10) >= 1)
    objc_msgSend(*(id *)(v1 + 32), "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v10, objc_msgSend((id)v1, "_queryGenerationToken"));
  if (v10)
    CFRelease(v10);
  -[_PFManagedObjectReferenceQueue _processReferenceQueue:](*(_QWORD *)(v1 + 160), 1);
  if (Count >= 0x201)
    NSZoneFree(0, v37);
  v20 = *(_QWORD *)(v1 + 160);
  if (v20)
  {
    *(_DWORD *)(v20 + 20) = -1;
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(v20 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 12));
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers](v20);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](v20, 1);
    CFRelease((CFTypeRef)v20);
  }

  -[NSManagedObjectContext unlockObjectStore](v1);
  v21 = *(const void **)(v1 + 160);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(v1 + 160) = 0;
  }
  v22 = *(_QWORD *)(v1 + 40);
  v23 = *(const void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = 0;
  *(_QWORD *)(v1 + 40) = v22 & 0xFFFFFFFFFFFFF0BFLL | 0x140;
  __dmb(0xBu);
  if (v23)
    CFRelease(v23);

  *(_QWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 64) = 0;

  *(_QWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 80) = 0;

  *(_QWORD *)(v1 + 88) = 0;
  *(_QWORD *)(v1 + 96) = 0;

  *(_QWORD *)(v1 + 104) = 0;
  *(_QWORD *)(v1 + 112) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 96) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 120) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 128) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 88) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 104) = 0;
  v24 = *(void **)(v1 + 128);
  if (v24)
  {
    v25 = *(_QWORD *)(*(_QWORD *)(v1 + 184) + 80);
    if (v25)
    {
      v26 = 0;
      v27 = 2 * v25;
      do
      {

        v26 += 2;
      }
      while (v26 < v27);
      v24 = *(void **)(v1 + 128);
    }
    PF_FREE_OBJECT_ARRAY(v24);
  }
  *(_QWORD *)(v1 + 128) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 16) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 48) = 0;
  **(_QWORD **)(v1 + 184) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 136) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 144) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 112) = 0;
  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 152) = 0;

  *(_QWORD *)(*(_QWORD *)(v1 + 184) + 160) = 0;
  v28 = *(_QWORD *)(v1 + 184);
  v29 = *(id **)(v28 + 8);
  if (v29)
  {

    PF_FREE_OBJECT_ARRAY(*(void **)(*(_QWORD *)(v1 + 184) + 8));
    *(_QWORD *)(*(_QWORD *)(v1 + 184) + 8) = 0;
    v28 = *(_QWORD *)(v1 + 184);
  }
  v30 = *(_QWORD *)(v28 + 56);
  if (v30)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 184) + 56) + 32) = 85;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 184) + 56) + 40) = 85;
    v31 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
      v31 = malloc_default_zone();
    malloc_zone_free(v31, *(void **)(*(_QWORD *)(v1 + 184) + 56));
    *(_QWORD *)(*(_QWORD *)(v1 + 184) + 56) = 0;
  }

  *(_QWORD *)(v1 + 168) = CFSTR("deallocated NSManagedObjectContext");
  PF_FREE_OBJECT_ARRAY(*(void **)(v1 + 184));
  *(_QWORD *)(v1 + 184) = 0;
  objc_msgSend(*(id *)(v1 + 136), "unlock");
  v32 = *(NSObject **)(v1 + 24);
  if (v32)
    dispatch_release(v32);
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 8) = 0;
  v33 = *(const void **)(v1 + 136);
  if (v33)
    CFRelease(v33);
  *(_QWORD *)(v1 + 136) = 0;
  v34 = *(const void **)(v1 + 32);
  if (v34)
    CFRelease(v34);
  *(_QWORD *)(v1 + 32) = 0;
  return MEMORY[0x18D76C0C0]();
}

- (uint64_t)_mergeRefreshObject:(char)a3 mergeChanges:(NSKnownKeysDictionary *)a4 withPersistentSnapshot:
{
  unsigned int v8;
  int v9;
  void *v11;
  void *v12;
  NSKnownKeysDictionary *refreshed;
  NSKnownKeysDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  BOOL v23;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  const __CFAllocator *v28;
  CFArrayRef v29;
  unsigned int v30;
  uint64_t v32;
  void *values;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__mergeRefreshObject_mergeChanges_withPersistentSnapshot_);
    if (a2)
    {
LABEL_3:
      v8 = *(_DWORD *)(a2 + 16);
      if ((v8 & 0x80) != 0 || !*(_QWORD *)(a2 + 32))
        return 0;
      v9 = (v8 >> 15) & 7;
      if (v9 != 5 && v9 != 0)
        return 0;
      v11 = (void *)objc_msgSend((id)a2, "objectID");
      values = v11;
      if ((a3 & 1) == 0)
      {
        objc_msgSend((id)a2, "willRefresh:", 0);
        -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 1);
        return 1;
      }
      v12 = v11;
      objc_msgSend((id)a2, "willRefresh:", 1);
      refreshed = a4;
      if (!a4)
        refreshed = -[NSManagedObject _newChangedValuesForRefresh__](a2);
      v14 = -[NSManagedObject _changedTransientProperties__]((_QWORD *)a2);
      v15 = _insertion_fault_handler;
      v16 = objc_msgSend((id)a2, "entity");
      v17 = *(uint64_t **)(a2 + 48);
      v32 = v15;
      if (v17)
      {
        v18 = *v17;
        v19 = *(_DWORD *)(a2 + 16);
        v20 = 0;
        v21 = 1;
        if (v18)
        {
          if ((v19 & 0x2000) == 0)
          {
            if (v16)
            {
              v20 = *(_QWORD *)(*(_QWORD *)(v16 + 152) + 48);
              if (v20)
              {
                *(_DWORD *)(a2 + 16) = v19 | 0x1000;
                objc_msgSend((id)a2, "_willChangeValuesForKeys:", v20);
                v21 = 0;
                v19 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
              }
            }
          }
        }
      }
      else
      {
        v20 = 0;
        v19 = *(_DWORD *)(a2 + 16);
        v21 = 1;
      }
      *(_DWORD *)(a2 + 16) = v19 | 0x2000;
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)a1, a2, 0);
      v22 = *(_DWORD *)(a2 + 16) & 0x12;
      v23 = v22 != 0;
      if (objc_msgSend(v12, "isTemporaryID"))
        v23 = (*(_BYTE *)(a1 + 42) & 8) == 0 || v22 != 0;
      if (v23 || ((v21 ^ 1) & 1) != 0)
      {
        if (!v23)
          goto LABEL_31;
      }
      else if ((objc_msgSend((id)a2, "hasChanges") & 1) != 0)
      {
LABEL_31:
        -[NSManagedObjectContext lockObjectStore](a1);
        v25 = objc_msgSend(*(id *)(a1 + 32), "newValuesForObjectWithID:withContext:error:", v12, a1, 0);
        v26 = v25 != 0;
        if (v25)
        {
          v27 = (void *)v25;
          if ((*(_BYTE *)(a2 + 17) & 2) == 0 && (objc_msgSend(v12, "isTemporaryID") & 1) == 0)
          {
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
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
            v28 = _PFStackAllocatorCreate((unint64_t *)&v34, 1024);
            v29 = CFArrayCreate(v28, (const void **)&values, 1, 0);
            objc_msgSend(*(id *)(a1 + 32), "managedObjectContextDidRegisterObjectsWithIDs:generation:", v29, objc_msgSend((id)a1, "_queryGenerationToken"));
            if (*((_QWORD *)&v35 + 1) && v29)
              CFRelease(v29);
            *(_DWORD *)(a2 + 16) |= 0x200u;
          }
          _PFFaultHandlerFulfillFault(v32, a2, a1, v27, 0);

        }
        -[NSManagedObjectContext unlockObjectStore](a1);
        goto LABEL_42;
      }
      v26 = 0;
LABEL_42:
      if (-[NSKnownKeysDictionary count](refreshed, "count"))
        -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:]((_DWORD *)a2, refreshed, 0);
      if (!a4)

      if (-[NSKnownKeysDictionary count](v14, "count"))
        -[NSManagedObject _updateFromSnapshot:](a2, v14);
      v30 = *(_DWORD *)(a2 + 16);
      if (v26)
      {
        *(_DWORD *)(a2 + 16) = v30 | 0x1000;
        objc_msgSend((id)a2, "awakeFromFetch");
        v30 = *(_DWORD *)(a2 + 16) & 0xFFFFEFFF;
      }
      *(_DWORD *)(a2 + 16) = v30 & 0xFFFFDFFF;
      if ((v21 & 1) == 0)
        objc_msgSend((id)a2, "_didChangeValuesForKeys:", v20);
      return 1;
    }
  }
  else if (a2)
  {
    goto LABEL_3;
  }
  return 0;
}

+ (void)_mergeChangesFromRemoteContextSave:(id)a3 intoContexts:(id)a4
{
  +[NSManagedObjectContext _mergeChangesFromRemoteContextSave:intoContexts:withClientQueryGeneration:]((uint64_t)NSManagedObjectContext, a3, a4, 0);
}

+ (void)_mergeChangesFromRemoteContextSave:(void *)a3 intoContexts:(uint64_t)a4 withClientQueryGeneration:
{
  uint64_t v5;
  id Weak;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _PFWeakReference *v12;
  _PFWeakReference *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  size_t v27;
  uint64_t v28;
  const __CFURL *v29;
  void *v30;
  const __CFURL *v31;
  NSTemporaryObjectID *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  NSManagedObjectContext *v48;
  uint64_t v49;
  uint64_t j;
  _QWORD *v51;
  uint64_t k;
  _QWORD *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  _QWORD v82[7];
  _QWORD v83[7];
  _QWORD v84[7];
  _QWORD v85[8];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  void (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v67 = a4;
  v68 = a2;
  v107 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a3 && objc_msgSend(a3, "count"))
  {
    v61 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_msgSend(v68, "objectForKey:", CFSTR("managedObjectContext"));
    if (v5
      && (Weak = objc_loadWeak((id *)(v5 + 8))) != 0
      && (v7 = Weak, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      do
      {
        objc_msgSend(v8, "addObject:", v7);
        v7 = (void *)objc_msgSend(v7, "parentContext");
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
    if (v9)
    {
      v75 = 0;
      v10 = *(_QWORD *)v101;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v101 != v10)
            objc_enumerationMutation(a3);
          v12 = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v11));
          v13 = v12;
          if (v12)
          {
            WeakRetained = objc_loadWeakRetained(&v12->_object);
            if (WeakRetained && (!v8 || (objc_msgSend(v8, "containsObject:", WeakRetained) & 1) == 0))
            {
              objc_msgSend(v76, "addObject:", WeakRetained);
              if (!v75)
                v75 = (void *)objc_msgSend(WeakRetained, "persistentStoreCoordinator");
            }
          }
          else
          {
            WeakRetained = 0;
          }

          ++v11;
        }
        while (v9 != v11);
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
        v9 = v15;
      }
      while (v15);
    }
    else
    {
      v75 = 0;
    }
    v16 = objc_msgSend(v76, "count");
    while (v16 > 0)
    {
      if (v75 != (void *)objc_msgSend((id)objc_msgSend(v76, "objectAtIndex:", --v16), "persistentStoreCoordinator"))
      {

        objc_msgSend(v61, "drain");
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Mismatched PSCs in parameter contexts"), 0));
      }
    }
    if (v75 && objc_msgSend(v76, "count"))
    {
      v17 = (void *)objc_msgSend(v68, "objectForKey:", CFSTR("newQueryGeneration"));
      if (objc_msgSend(v17, "_isEnabled"))
        v18 = v17;
      else
        v18 = 0;
      v63 = v18;
      v66 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("inserted"), CFSTR("inserted_objectIDs"), CFSTR("deleted"), CFSTR("deleted_objectIDs"), CFSTR("updated"), CFSTR("updated_objectIDs"), CFSTR("refreshed"), CFSTR("refreshed_objectIDs"), CFSTR("invalidated"), CFSTR("invalidated_objectIDs"), CFSTR("invalidatedAll"), 0);
      v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v68, "count"));
      v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v71 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v96 = 0;
      v97 = &v96;
      v98 = 0x2020000000;
      v99 = 0;
      v90 = 0;
      v91 = &v90;
      v92 = 0x3052000000;
      v93 = __Block_byref_object_copy__12;
      v94 = __Block_byref_object_dispose__12;
      v95 = 0;
      v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = objc_msgSend(v75, "managedObjectModel");
      v19 = objc_msgSend(v66, "count");
      v20 = v19;
      if (v19)
      {
        v21 = 0;
        v62 = v19;
LABEL_38:
        v22 = objc_msgSend(v66, "objectAtIndex:", v21);
        v23 = (void *)objc_msgSend(v68, "objectForKey:", v22);
        v74 = objc_msgSend(v23, "count");
        if (!v23 || !v74)
          goto LABEL_95;
        v72 = v21;
        v64 = v22;
        v65 = &v59;
        if (v74 >= 0x201)
          v24 = 1;
        else
          v24 = v74;
        v25 = (8 * v24 + 15) & 0xFFFFFFFFFFFFFFF0;
        v26 = (char *)&v59 - v25;
        if (v74 > 0x200)
          v26 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v59 - v25, 8 * v74);
        objc_msgSend(v23, "getObjects:", v26);
        v27 = 0;
        v28 = 0;
        while (1)
        {
          v29 = *(const __CFURL **)&v26[8 * v28];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v29, 0);
              goto LABEL_53;
            }
            v29 = (const __CFURL *)-[__CFURL objectID](v29, "objectID");
          }
          v30 = (void *)objc_msgSend((id)-[__CFURL persistentStore](v29, "persistentStore"), "_persistentStoreCoordinator");
          if (v30 != v75)
          {
            v31 = (const __CFURL *)-[__CFURL URIRepresentation](v29, "URIRepresentation");
            v32 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](v75, v31, 0);
LABEL_53:
            v29 = (const __CFURL *)v32;
          }
          if (v29)
            *(_QWORD *)&v26[8 * v27++] = v29;
          if (v74 == ++v28)
          {
            if (v72 >= 4)
            {
              v33 = malloc_type_calloc(1uLL, v27, 0x100004077774924uLL);
              v97[3] = (uint64_t)v33;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v34 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
              if (v34)
              {
                v35 = *(_QWORD *)v87;
                do
                {
                  for (i = 0; i != v34; ++i)
                  {
                    if (*(_QWORD *)v87 != v35)
                      objc_enumerationMutation(v76);
                    v37 = *(_QWORD **)(*((_QWORD *)&v86 + 1) + 8 * i);
                    v85[0] = MEMORY[0x1E0C809B0];
                    v85[1] = 3221225472;
                    v85[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke;
                    v85[3] = &unk_1E1EDE410;
                    v85[6] = v27;
                    v85[7] = v26;
                    v85[4] = v37;
                    v85[5] = &v96;
                    if (v37[3])
                      objc_msgSend(v37, "performBlockAndWait:", v85);
                    else
                      __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke((uint64_t)v85);
                  }
                  v34 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
                }
                while (v34);
              }
            }
            if (v27)
            {
              v38 = 0;
              v73 = 0;
              while (1)
              {
                v39 = *(_QWORD *)&v26[8 * v38];
                if (v39)
                  break;
LABEL_84:
                if (++v38 == v27)
                  goto LABEL_88;
              }
              if (v72 >= 6)
              {
                if (!*(_BYTE *)(v97[3] + v38))
                {
LABEL_83:
                  objc_msgSend(v71, "addObject:", v39);
                  v44 = v73;
                  *(_QWORD *)&v26[8 * v73] = v39;
                  v73 = v44 + 1;
                  goto LABEL_84;
                }
              }
              else if (v72 == 1)
              {
                goto LABEL_83;
              }
              v40 = objc_msgSend(*(id *)&v26[8 * v38], "entity");
              if (v40)
              {
                if ((*(_BYTE *)(v40 + 120) & 4) != 0)
                {
                  v41 = *(void **)(v40 + 72);
                }
                else
                {
                  do
                  {
                    v41 = (void *)v40;
                    v40 = objc_msgSend((id)v40, "superentity");
                  }
                  while (v40);
                }
              }
              else
              {
                v41 = 0;
              }
              v42 = objc_msgSend(v41, "name");
              v43 = (id)objc_msgSend(v70, "objectForKey:", v42);
              if (!v43)
              {
                v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v70, "setObject:forKey:", v43, v42);

              }
              objc_msgSend(v43, "addObject:", v39);
              goto LABEL_83;
            }
            v73 = 0;
LABEL_88:
            v45 = (void *)v97[3];
            if (v45)
            {
              free(v45);
              v97[3] = 0;
            }
            v46 = objc_alloc(MEMORY[0x1E0C99D20]);
            v20 = v62;
            v21 = v72;
            v47 = (void *)objc_msgSend(v46, "initWithObjects:count:", v26, v73);
            if (objc_msgSend(v47, "count"))
            {
              objc_msgSend(v69, "setValue:forKey:", v47, v64);
              if (v63)
                objc_msgSend(v69, "setObject:forKey:", v63, CFSTR("newQueryGeneration"));
            }

            if (v74 >= 0x201)
              NSZoneFree(0, v26);
LABEL_95:
            if (++v21 == v20)
              break;
            goto LABEL_38;
          }
        }
      }
      if (objc_msgSend(v70, "count"))
      {
        v48 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 1);
        -[NSManagedObjectContext setPersistentStoreCoordinator:](v48, "setPersistentStoreCoordinator:", v75);
        -[NSManagedObjectContext setUndoManager:](v48, "setUndoManager:", 0);
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2;
        v84[3] = &unk_1E1EDE438;
        v84[4] = v60;
        v84[5] = v48;
        v84[6] = &v90;
        objc_msgSend(v70, "enumerateKeysAndObjectsUsingBlock:", v84);
      }
      else
      {
        v48 = 0;
      }
      v49 = objc_msgSend(v76, "count");
      if (v49)
      {
        for (j = 0; j != v49; ++j)
        {
          v51 = (_QWORD *)objc_msgSend(v76, "objectAtIndex:", j);
          if (!objc_msgSend(v51, "parentContext"))
          {
            v83[0] = MEMORY[0x1E0C809B0];
            v83[1] = 3221225472;
            v83[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4;
            v83[3] = &unk_1E1EDD790;
            v83[4] = v51;
            v83[5] = v69;
            v83[6] = v67;
            if (v51[3])
              objc_msgSend(v51, "performBlockAndWait:", v83);
            else
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_4((uint64_t)v83);
          }
        }
        for (k = 0; k != v49; ++k)
        {
          v53 = (_QWORD *)objc_msgSend(v76, "objectAtIndex:", k);
          if (objc_msgSend(v53, "parentContext"))
          {
            v82[0] = MEMORY[0x1E0C809B0];
            v82[1] = 3221225472;
            v82[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5;
            v82[3] = &unk_1E1EDD790;
            v82[4] = v53;
            v82[5] = v69;
            v82[6] = v67;
            if (v53[3])
              objc_msgSend(v53, "performBlockAndWait:", v82);
            else
              __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5((uint64_t)v82);
          }
        }
      }
      v54 = (void *)v97[3];
      if (v54)
      {
        free(v54);
        v97[3] = 0;
      }
      if (v48)
      {
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_6;
        v81[3] = &unk_1E1EDD520;
        v81[4] = v48;
        -[NSManagedObjectContext performBlockAndWait:](v48, "performBlockAndWait:", v81);
      }

      objc_msgSend(v61, "drain");
      v55 = 0;
      if (v48)

      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v56 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v77, v104, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v78;
        do
        {
          for (m = 0; m != v56; ++m)
          {
            if (*(_QWORD *)v78 != v57)
              objc_enumerationMutation(v76);
            -[NSManagedObjectContext _registerAsyncReferenceCallback](*(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * m));
          }
          v56 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v77, v104, 16);
        }
        while (v56);
      }

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v96, 8);
    }
    else
    {

      objc_msgSend(v61, "drain");
    }
  }
}

- (uint64_t)_mergeRefreshEpilogueForObject:(uint64_t)a3 mergeChanges:
{
  uint64_t result;

  objc_msgSend(a2, "awakeFromSnapshotEvents:", 256);
  objc_msgSend(a2, "didRefresh:", a3);
  -[NSManagedObjectContext _prepareUnprocessedDeletionAfterRefresh:]((_QWORD *)a1, a2);
  result = objc_msgSend(*(id *)(a1 + 112), "addObject:", objc_msgSend(a2, "objectID"));
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
    return -[NSManagedObjectContext _enqueueEndOfEventNotification](a1);
  return result;
}

- (uint64_t)_batchRetainedObjects:(uint64_t)a1 forCount:(uint64_t)a2 withIDs:(uint64_t)a3 optionalHandler:(id *)a4 withInlineStorage:(uint64_t)a5
{
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id Value;
  unint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD *v19;
  unsigned int v20;
  uint64_t v22;
  id v23;
  void *v24;
  unsigned int *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a5;
  result = 0;
  v33 = *MEMORY[0x1E0C80C00];
  if (a1 && (_DWORD)a3)
  {
    v10 = 0;
    v11 = 8 * a3;
    v12 = a3;
    do
    {
      Value = (id)_PFCMT_GetValue(*(_QWORD **)(a1 + 120), a4[v10 / 8]);
      if (Value)
      {
        Value = Value;
        v12 = (v12 - 1);
      }
      *(_QWORD *)(a2 + v10) = Value;
      v10 += 8;
    }
    while (v11 != v10);
    if ((_DWORD)v12)
    {
      v31 = (unint64_t *)objc_msgSend(*a4, "entity");
      v14 = _PFFastEntityClass(v31);
      v28 = (uint64_t)&v28;
      v30 = v12;
      MEMORY[0x1E0C80A78](v14);
      v16 = (char *)&v28 - v15;
      if (v12 > 0x200)
        v16 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v28 - v15, 8 * v12);
      v29 = a3;
      if (objc_msgSend(v14, "allocBatch:withEntity:count:", v16, v31, v12, v28) < v12)
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not allocate memory."), 0);
      v17 = 0;
      v18 = 0;
      do
      {
        v19 = *(_QWORD **)&v16[8 * v17];
        do
          v20 = v18;
        while (*(_QWORD *)(a2 + 8 * v18++));
        v22 = v20;
        v23 = a4[v20];
        _PFfastOidRetain(0, (unint64_t)v23);
        objc_msgSend(v19, "_initWithEntity:withID:withHandler:withContext:", v31, v23, v32, a1);
        v19[7] = *(_QWORD *)(a1 + 160);
        *(_QWORD *)(a2 + 8 * v22) = v19;
        _PFCMT_SetValue(*(_QWORD *)(a1 + 120), v23, v19);
        v24 = **(void ***)(a1 + 184);
        if (v24 && objc_msgSend(v24, "containsObject:", v23))
        {
          if (!objc_msgSend(v19, "managedObjectContext"))
            -[NSManagedObjectContext _forceRegisterLostFault:](a1, v19);
          objc_msgSend((id)a1, "deleteObject:", v19);
        }
        ++v17;
      }
      while (v17 != v30);
      v25 = (unsigned int *)(*(_QWORD *)(a1 + 160) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 + v12, v25));
      v27 = v29;
      if (v12 >= 0x201)
        NSZoneFree(0, v16);
      return v27;
    }
    else
    {
      return a3;
    }
  }
  return result;
}

- (void)setStalenessInterval:(NSTimeInterval)stalenessInterval
{
  _QWORD v5[6];

  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__NSManagedObjectContext_setStalenessInterval___block_invoke;
    v5[3] = &unk_1E1EDE568;
    v5[4] = self;
    *(NSTimeInterval *)&v5[5] = stalenessInterval;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    self->_fetchTimestamp = stalenessInterval;
  }
}

- (void)setParentContext:(NSManagedObjectContext *)parentContext
{
  NSManagedObjectContext *parentObjectStore;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  _QWORD v9[6];

  if (!parentContext)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("Parent NSManagedObjectContext must not be nil.");
    goto LABEL_15;
  }
  parentObjectStore = (NSManagedObjectContext *)self->_parentObjectStore;
  if (parentObjectStore == parentContext)
    return;
  if (parentObjectStore)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99768];
    v6 = CFSTR("Context already has a coordinator;  cannot replace.");
    goto LABEL_15;
  }
  if (!parentContext->_dispatchQueue)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = CFSTR("Parent NSManagedObjectContext must use either NSPrivateQueueConcurrencyType or NSMainQueueConcurrencyType.");
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
  }
  if (self->_dispatchQueue)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__NSManagedObjectContext_setParentContext___block_invoke;
    v9[3] = &unk_1E1EDD430;
    v9[4] = self;
    v9[5] = parentContext;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v9);
  }
  else if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    -[NSManagedObjectContext _setParentContext:](self, parentContext);
  }
  else
  {
    -[NSManagedObjectContext _setParentContext:](self, parentContext);
  }
}

- (void)setShouldDeleteInaccessibleFaults:(BOOL)shouldDeleteInaccessibleFaults
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = shouldDeleteInaccessibleFaults;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__NSManagedObjectContext_setShouldDeleteInaccessibleFaults___block_invoke;
    v6[3] = &unk_1E1EDE5B8;
    v6[4] = self;
    v7 = shouldDeleteInaccessibleFaults;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = 0x800000;
    if (!v3)
      v5 = 0;
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v5);
  }
}

- (void)_setAllowsExpandedUserInfoKeys:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__NSManagedObjectContext__NSCoreDataSPI___setAllowsExpandedUserInfoKeys___block_invoke;
    v6[3] = &unk_1E1EDE5B8;
    v6[4] = self;
    v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = 0x200000000;
    if (!v3)
      v5 = 0;
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v5);
  }
}

- (BOOL)_setQueryGenerationFromToken:(id)a3 error:(id *)a4
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_parentObjectStore && (*((_BYTE *)&self->_flags + 2) & 8) != 0)
    return 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__12;
  v22 = __Block_byref_object_dispose__12;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke;
  v17[3] = &unk_1E1EDD7B8;
  v17[4] = a3;
  v17[5] = self;
  v17[6] = &v24;
  v17[7] = &v18;
  if (self->_dispatchQueue)
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v17);
  else
    __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke((uint64_t)v17);
  if (*((_BYTE *)v25 + 24))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)v19[5];
    if (v6)
    {
      if (a4)
        *a4 = v6;
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        v30 = 1024;
        v31 = 4398;
        _os_log_fault_impl(&dword_18A253000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    v15 = (id)v19[5];
    v5 = *((_BYTE *)v25 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v5;
}

- (BOOL)setQueryGenerationFromToken:(NSQueryGenerationToken *)generation error:(NSError *)error
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (self->_parentObjectStore)
  {
    if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Child contexts inherit parent context generations and may not have their own"), 0));
    if (-[NSManagedObjectContext automaticallyMergesChangesFromParent](self, "automaticallyMergesChangesFromParent")
      && +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") != generation&& +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") != generation)
    {
      -[NSManagedObjectContext setAutomaticallyMergesChangesFromParent:](self, "setAutomaticallyMergesChangesFromParent:", 0);
    }
    return -[NSManagedObjectContext _setQueryGenerationFromToken:error:](self, "_setQueryGenerationFromToken:error:", generation, error);
  }
  else
  {
    if (error)
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A930);
    return 0;
  }
}

- (BOOL)automaticallyMergesChangesFromParent
{
  _BOOL4 v2;

  if (self->_dispatchQueue)
    return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
  else
    LOBYTE(v2) = 0;
  return v2;
}

- (void)setAutomaticallyMergesChangesFromParent:(BOOL)automaticallyMergesChangesFromParent
{
  _QWORD v3[5];
  BOOL v4;

  if (!self->_dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Automatic merging is not supported by contexts using NSConfinementConcurrencyType"), 0));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__NSManagedObjectContext__setAutomaticallyMergesChangesFromParent___block_invoke;
  v3[3] = &unk_1E1EDE5B8;
  v4 = automaticallyMergesChangesFromParent;
  v3[4] = self;
  -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v3);
}

- (NSManagedObjectContextConcurrencyType)concurrencyType
{
  if (!self->_dispatchQueue)
    return 0;
  if ((*((_BYTE *)&self->_flags + 2) & 0x40) != 0)
    return 1;
  return 2;
}

- (void)setTransactionAuthor:(NSString *)transactionAuthor
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__NSManagedObjectContext_setTransactionAuthor___block_invoke;
  v3[3] = &unk_1E1EDD430;
  v3[4] = transactionAuthor;
  v3[5] = self;
  if (self->_dispatchQueue)
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v3);
  else
    __47__NSManagedObjectContext_setTransactionAuthor___block_invoke((uint64_t)v3);
}

- (NSString)transactionAuthor
{
  uint64_t *v2;
  uint64_t v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  NSManagedObjectContext *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __43__NSManagedObjectContext_transactionAuthor__block_invoke;
  v9 = &unk_1E1EDD618;
  v10 = self;
  v11 = &v12;
  if (self->_dispatchQueue)
  {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", &v6);
    v2 = v13;
  }
  else
  {
    v3 = objc_msgSend(self->_additionalPrivateIvars[16], "copy", v6, v7, v8, v9, v10, v11, v12);
    v2 = v13;
    v13[5] = v3;
  }
  v4 = (NSString *)(id)v2[5];
  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)setUndoManager:(NSUndoManager *)undoManager
{
  _QWORD v5[6];

  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__NSManagedObjectContext_setUndoManager___block_invoke;
    v5[3] = &unk_1E1EDD430;
    v5[4] = self;
    v5[5] = undoManager;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    -[NSManagedObjectContext _setUndoManager:]((uint64_t)self, undoManager);
  }
}

- (void)setMergePolicy:(id)mergePolicy
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[6];

  if (self->_dispatchQueue)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__NSManagedObjectContext_setMergePolicy___block_invoke;
    v8[3] = &unk_1E1EDD430;
    v8[4] = mergePolicy;
    v8[5] = self;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v8);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = (id)*((_QWORD *)self->_additionalPrivateIvars + 3);
    if (v5 != mergePolicy)
    {

      v6 = NSErrorMergePolicy;
      if (mergePolicy)
        v6 = mergePolicy;
      *((_QWORD *)self->_additionalPrivateIvars + 3) = v6;
      v7 = self->_additionalPrivateIvars[3];
    }
  }
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
  NSPersistentStoreCoordinator *parentObjectStore;
  _QWORD v6[6];

  if (persistentStoreCoordinator)
  {
    parentObjectStore = (NSPersistentStoreCoordinator *)self->_parentObjectStore;
    if (parentObjectStore != persistentStoreCoordinator)
    {
      if (parentObjectStore)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Context already has a coordinator;  cannot replace."),
                                   0));
      if (self->_dispatchQueue)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __56__NSManagedObjectContext_setPersistentStoreCoordinator___block_invoke;
        v6[3] = &unk_1E1EDD430;
        v6[4] = self;
        v6[5] = persistentStoreCoordinator;
        -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
      }
      else if (_PF_Threading_Debugging_level)
      {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
        -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)self, persistentStoreCoordinator);
      }
      else
      {
        -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)self, persistentStoreCoordinator);
      }
    }
  }
}

- (void)performBlockAndWait:(void *)block
{
  NSManagedObjectContext *v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  NSManagedObjectContext *v8;
  uint64_t v9;
  _QWORD context[2];
  uint64_t v11;
  NSManagedObjectContext *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue."), 0));
  v4 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  context[0] = block;
  context[1] = self;
  v11 = 0;
  v12 = v4;
  if (byte_1ECD8DA22)
    v11 = 4;
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_20:
      developerSubmittedBlockToNSManagedObjectContextPerform(context);
      return;
    }
  }
  else if (v4)
  {
    v5 = 0;
    __dmb(0xBu);
    v6 = v4;
    while (v6 != self && v6 != v5)
    {
      if (!v5)
        v5 = v6;
      v6 = (NSManagedObjectContext *)v6->_queueOwner;
      if (!v6)
      {
        v7 = 0;
        __dmb(0xBu);
        v8 = self;
        while (v8 != v4 && v8 != v7)
        {
          if (!v7)
            v7 = v8;
          v8 = (NSManagedObjectContext *)v8->_queueOwner;
          if (!v8)
            goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  v9 = 8196;
  if (!byte_1ECD8DA22)
    v9 = 0x2000;
  v11 = v9;
  dispatch_sync_f((dispatch_queue_t)self->_dispatchQueue, context, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
}

- (void)setName:(NSString *)name
{
  uint64_t v5;
  NSString *v6;
  _QWORD v7[6];

  v5 = -[NSString copy](name, "copy");
  v6 = (NSString *)v5;
  if (self->_dispatchQueue)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__NSManagedObjectContext_setName___block_invoke;
    v7[3] = &unk_1E1EDD430;
    v7[4] = self;
    v7[5] = v5;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v7);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);

    self->_contextLabel = v6;
  }
}

- (void)_setDelegate:(id)a3
{
  *((_QWORD *)self->_additionalPrivateIvars + 2) = a3;
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  NSFetchRequest *v10;
  _QWORD v11[7];

  v3 = a1[4];
  if (v3)
  {
    v6 = objc_msgSend(*(id *)(v3 + 32), "objectForKey:", a2);
    if (v6)
    {
      v7 = v6;
      v10 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v10, "setEntity:", v7);
      -[NSFetchRequest setIncludesSubentities:](v10, "setIncludesSubentities:", 1);
      -[NSFetchRequest setIncludesPendingChanges:](v10, "setIncludesPendingChanges:", 0);
      -[NSFetchRequest setPredicate:](v10, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), a3));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3;
      v11[3] = &unk_1E1EDD138;
      v8 = (_QWORD *)a1[5];
      v9 = a1[6];
      v11[4] = v8;
      v11[5] = v10;
      v11[6] = v9;
      if (v8[3])
        objc_msgSend(v8, "performBlockAndWait:", v11);
      else
        __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_3((uint64_t)v11);

    }
  }
}

void __92__NSManagedObjectContext__NSInternalChangeProcessing___prefetchObjectsForDeletePropagation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "setEntity:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), a3));
  v8 = (void *)-[NSEntityDescription _keypathsToPrefetchForDeletePropagation](a2);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRelationshipKeyPathsForPrefetching:", v8);
    v15 = 0;
    if (!objc_msgSend(*(id *)(a1 + 40), "executeFetchRequest:error:", *(_QWORD *)(a1 + 32), &v15))
    {
      _NSCoreDataLog(2, (uint64_t)CFSTR("Delete propagation prefetching failed with error: %@"), v9, v10, v11, v12, v13, v14, v15);
      *a4 = 1;
    }
  }
}

- (NSPersistentStoreResult)executeRequest:(NSPersistentStoreRequest *)request error:(NSError *)error
{
  void *v7;
  NSError *v8;
  NSPersistentStoreResult *v9;
  NSPersistentStoreRequestType v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSAsynchronousFetchRequest *v17;
  NSPersistentStoreResult *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSUInteger v30;
  id v31;
  id v32;
  id v33;
  __objc2_class *v34;
  NSPersistentHistoryResult *v35;
  uint64_t v36;
  NSPersistentCloudKitContainerEventResult *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  id v65;
  int v66;
  int v67;
  char v68;
  id *v69;
  BOOL v70;
  void *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  NSSQLiteIndexStatisticsResult *v75;
  NSPersistentCloudKitContainerEventResult *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  const char *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id parentObjectStore;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  _QWORD v103[5];
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _QWORD v110[6];
  id v111[6];
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  _BYTE buf[24];
  void *v118;
  NSManagedObjectContext *v119;
  id *v120;
  NSPersistentStoreRequest *v121;
  void *v122;
  _QWORD *v123;
  id *v124;
  uint64_t *v125;
  uint64_t *v126;
  char v127;
  BOOL v128;
  char v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v7 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      v8 = v7;
LABEL_6:
      v9 = 0;
LABEL_7:
      *error = v8;
      return v9;
    }
    return 0;
  }
  v10 = -[NSPersistentStoreRequest requestType](request, "requestType");
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSPersistentStoreRequest _resolveEntityWithContext:](request, "_resolveEntityWithContext:", self);
  if (v10 == NSSaveRequestType)
  {
    if (error)
    {
      v8 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A908);
      goto LABEL_6;
    }
    return 0;
  }
  if (v10 != NSFetchRequestType)
    goto LABEL_29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (_PF_Threading_Debugging_level)
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__executeAsynchronousFetchRequest_);
      v28 = (void *)-[NSPersistentStoreRequest fetchRequest](request, "fetchRequest");
      v116 = 0;
      v112 = 0;
      v113 = &v112;
      v114 = 0x2020000000;
      v115 = &v116;
      objc_msgSend(v28, "_resolveEntityWithContext:", self);
      if (objc_msgSend(v28, "entity"))
      {
        if (self->_dispatchQueue)
        {
          v29 = objc_msgSend(v28, "resultType");
          if (v29 == 4)
          {
            v30 = -[NSManagedObjectContext countForFetchRequest:error:](self, "countForFetchRequest:error:", v28, v113[3]);
            if (v30 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v9 = 0;
            }
            else
            {
              v74 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
              v9 = (NSPersistentStoreResult *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v74);
            }
          }
          else
          {
            v65 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
            if (-[NSManagedObjectContext hasChanges](self, "hasChanges")
              && ((v66 = objc_msgSend(v28, "includesPendingChanges"), v29 != 2) ? (v67 = v66) : (v67 = 0), v67 == 1))
            {
              if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch]((_BOOL8)self))
                -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
              v68 = 1;
            }
            else
            {
              v68 = 0;
            }
            v69 = -[NSManagedObjectContext _createStoreFetchRequestForFetchRequest:]((id *)&self->super.isa, v28);
            v111[0] = 0;
            v111[1] = v111;
            v111[2] = (id)0x3052000000;
            v111[3] = __Block_byref_object_copy__12;
            v111[4] = __Block_byref_object_dispose__12;
            v111[5] = 0;
            v70 = objc_msgSend(v69, "resultType") == 0;
            v102 = objc_msgSend(v69, "includesPropertyValues");
            v110[0] = 0;
            v110[1] = v110;
            v110[2] = 0x3052000000;
            v110[3] = __Block_byref_object_copy__12;
            v110[4] = __Block_byref_object_dispose__12;
            v110[5] = 0;
            objc_msgSend(v65, "drain");
            v71 = (void *)objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
            if (v71
              && (v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", v71, 0)) != 0)
            {
              if (-[NSPersistentStoreRequest estimatedResultCount](request, "estimatedResultCount") < 1)
                v72 = -1;
              else
                v72 = -[NSPersistentStoreRequest estimatedResultCount](request, "estimatedResultCount");
              objc_msgSend(v71, "setTotalUnitCount:", v72);
              objc_msgSend(v71, "setKind:", CFSTR("managed objects"));
              v73 = 0;
            }
            else
            {
              v73 = 1;
            }
            v104 = 0;
            v105 = &v104;
            v106 = 0x3052000000;
            v107 = __Block_byref_object_copy__12;
            v108 = __Block_byref_object_dispose__12;
            v109 = 0;
            v109 = -[NSAsynchronousFetchResult initForFetchRequest:withContext:andProgress:completetionBlock:]([NSAsynchronousFetchResult alloc], "initForFetchRequest:withContext:andProgress:completetionBlock:", request, self, v71, -[NSPersistentStoreRequest completionBlock](request, "completionBlock"));
            objc_msgSend(v69, "_setAsyncResultHandle:", v105[5]);
            v95 = MEMORY[0x1E0C809B0];
            if ((v73 & 1) == 0)
            {
              v96 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, v105[5]);
              v103[0] = v95;
              v103[1] = 3221225472;
              v103[2] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke;
              v103[3] = &unk_1E1EDD520;
              v103[4] = v96;
              objc_msgSend(v71, "setCancellationHandler:", v103);

            }
            parentObjectStore = self->_parentObjectStore;
            *(_QWORD *)buf = v95;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2;
            v118 = &unk_1E1EDE240;
            v119 = self;
            v120 = v69;
            v123 = v110;
            v124 = v111;
            v125 = &v112;
            v126 = &v104;
            v127 = v68;
            v121 = request;
            v122 = v28;
            v128 = v70;
            v129 = v102;
            objc_msgSend(parentObjectStore, "performBlock:", buf);
            v9 = (NSPersistentStoreResult *)v105[5];
            _Block_object_dispose(&v104, 8);
            _Block_object_dispose(v110, 8);
            _Block_object_dispose(v111, 8);
          }
          _Block_object_dispose(&v112, 8);
          return v9;
        }
        v99 = (void *)MEMORY[0x1E0C99DA0];
        v100 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSConfinementConcurrencyType context %@ cannot support asynchronous fetch request %@."), self, request);
      }
      else
      {
        v99 = (void *)MEMORY[0x1E0C99DA0];
        v100 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ A fetch request must have an entity."), NSStringFromSelector(sel__executeAsynchronousFetchRequest_));
      }
      objc_exception_throw((id)objc_msgSend(v99, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v100, 0));
    }
LABEL_29:
    if (self->_parentObjectStore)
    {
      v31 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v111[0] = 0;
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      v32 = (id)objc_msgSend(self->_parentObjectStore, "executeRequest:withContext:error:", request, self, v111);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      if (v111[0])
      {
        v33 = v111[0];
        if (v111[0])
        {
          if (error)
            *error = (NSError *)v111[0];
        }
        else
        {
          v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
          v53 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2057;
            _os_log_fault_impl(&dword_18A253000, v53, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }
      objc_msgSend(v31, "drain");
      v54 = 0;
      v55 = v111[0];
      if (self->_dispatchQueue && v32)
        -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)self);
      if ((!v32 || v111[0]) && (!v111[0] || v32))
      {
        v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Either a non nil result OR an error OR an exception");
        _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, v101);
        v63 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error OR an exception", buf, 2u);
        }
      }
      return (NSPersistentStoreResult *)v32;
    }
    if (v10 - 5 <= 2)
    {
      if ((_BYTE)dword_1ECD8DE20)
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Context does not have a coordinator; cannot perform executeRequest:error:."),
                                   0));
      _NSCoreDataLog(2, (uint64_t)CFSTR("Context does not have a coordinator; cannot perform executeRequest:error:."),
        v11,
        v12,
        v13,
        v14,
        v15,
        v16,
        v101);
      switch(v10)
      {
        case NSBatchDeleteRequestType:
          v34 = NSBatchDeleteResult;
          goto LABEL_84;
        case NSBatchUpdateRequestType:
          v34 = NSBatchUpdateResult;
          goto LABEL_84;
        case NSBatchInsertRequestType:
          v34 = NSBatchInsertResult;
LABEL_84:
          v86 = [v34 alloc];
          v87 = -[NSPersistentStoreRequest resultType](request, "resultType");
          v37 = (NSPersistentCloudKitContainerEventResult *)objc_msgSend(v86, "initWithResultType:andObject:", v87, NSArray_EmptyArray);
          return (NSPersistentStoreResult *)v37;
      }
      v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown batch request - %@ - %lu");
      _NSCoreDataLog(17, v88, v89, v90, v91, v92, v93, v94, (uint64_t)request);
      v84 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_86:
        v37 = 0;
        return (NSPersistentStoreResult *)v37;
      }
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = request;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      v85 = "CoreData: Unknown batch request - %@ - %lu";
LABEL_97:
      _os_log_fault_impl(&dword_18A253000, v84, OS_LOG_TYPE_FAULT, v85, buf, 0x16u);
      goto LABEL_86;
    }
    switch(v10)
    {
      case 0xBuLL:
        v76 = [NSPersistentCloudKitContainerEventResult alloc];
        v37 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:](v76, "initWithResult:ofType:", NSArray_EmptyArray, -[NSPersistentStoreRequest resultType](request, "resultType"));
        break;
      case 0xAuLL:
        v75 = [NSSQLiteIndexStatisticsResult alloc];
        v37 = -[NSSQLiteIndexStatisticsResult initWithResult:](v75, "initWithResult:", NSArray_EmptyArray);
        break;
      case 8uLL:
        v35 = [NSPersistentHistoryResult alloc];
        v36 = -[NSPersistentStoreRequest resultType](request, "resultType");
        v37 = -[NSPersistentHistoryResult initWithResultType:andResult:](v35, "initWithResultType:andResult:", v36, NSArray_EmptyArray);
        break;
      default:
        v77 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown request - %@ - %lu");
        _NSCoreDataLog(17, v77, v78, v79, v80, v81, v82, v83, (uint64_t)request);
        v84 = __pflogFaultLog;
        if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          goto LABEL_86;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = request;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v10;
        v85 = "CoreData: Unknown request - %@ - %lu";
        goto LABEL_97;
    }
    return (NSPersistentStoreResult *)v37;
  }
  v17 = -[NSAsynchronousFetchRequest initWithFetchRequest:completionBlock:]([NSAsynchronousFetchRequest alloc], "initWithFetchRequest:completionBlock:", request, 0);
  v9 = -[NSAsynchronousFetchResult initForFetchRequest:withContext:andProgress:completetionBlock:]([NSAsynchronousFetchResult alloc], "initForFetchRequest:withContext:andProgress:completetionBlock:", v17, self, 0, 0);

  v18 = v9;
  v111[0] = 0;
  v19 = -[NSManagedObjectContext executeFetchRequest:error:](self, "executeFetchRequest:error:", request, v111);
  v8 = (NSError *)v111[0];
  if (v19)
  {
    if (v111[0])
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetching generated a result AND an error: %@");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)v111[0]);
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(id *)&buf[4] = v111[0];
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, "CoreData: Fetching generated a result AND an error: %@", buf, 0xCu);
      }
      -[NSPersistentStoreResult setOperationError:](v9, "setOperationError:", v111[0]);
    }
    -[NSAsynchronousFetchResult setFinalResult:]((uint64_t)v9, v19);
  }
  else
  {
    if (!v111[0])
    {
      v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Fetching returned nil AND failed to generate an error");
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, v101);
      v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v45, OS_LOG_TYPE_FAULT, "CoreData: Fetching returned nil AND failed to generate an error", buf, 2u);
      }
      v8 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A8E0);
    }
    v9 = 0;
    if (error)
      goto LABEL_7;
  }
  return v9;
}

- (void)_setAllowAncillaryEntities:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  _managedObjectContextFlags flags;
  _managedObjectContextFlags v5;
  unint64_t StatusReg;
  NSManagedObjectContext *v7;
  id *p_queueOwner;
  NSManagedObjectContext *queueOwner;
  unsigned int v10;
  unint64_t v11;
  NSManagedObjectContext *v12;
  id *v13;
  NSManagedObjectContext *v14;
  NSPersistentStoreCoordinator *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[5];
  _QWORD aBlock[7];
  unsigned int v26;

  if (self->_reserved1)
  {
    v17 = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    _NSCoreDataLog(1, (uint64_t)CFSTR("NSManagedObjectContext over-release triggered improper dealloc here:\n\t %@"), v18, v19, v20, v21, v22, v23, v17);
    __break(1u);
    return;
  }
  MEMORY[0x18D76C0B4]();
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
    -[NSManagedObjectContext _dealloc__]((uint64_t)self);
    return;
  }
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
      v5 = self->_flags;
      -[NSManagedObjectContext _dealloc__]((uint64_t)self);
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      v7 = *(NSManagedObjectContext **)(StatusReg + 712);
      if (v7 == self)
      {
        p_queueOwner = (id *)(StatusReg + 712);
      }
      else
      {
        if (!v7)
          goto LABEL_23;
        queueOwner = (NSManagedObjectContext *)v7->_queueOwner;
        p_queueOwner = &v7->_queueOwner;
        if (queueOwner != self)
          goto LABEL_23;
      }
      *p_queueOwner = 0;
LABEL_23:
      self->_queueOwner = 0;
      __dmb(0xBu);
      if ((*(_WORD *)&v5 & 0x100) == 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__NSManagedObjectContext_dealloc__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0l;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      return;
    }
    dispatchQueue = self->_dispatchQueue;
    flags = self->_flags;
  }
  v10 = (*(_DWORD *)&flags >> 8) & 1;
  dispatch_retain(dispatchQueue);
  MEMORY[0x18D76C0B4]();
  v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v12 = *(NSManagedObjectContext **)(v11 + 712);
  if (v12 == self)
  {
    v13 = (id *)(v11 + 712);
  }
  else
  {
    if (!v12)
      goto LABEL_17;
    v14 = (NSManagedObjectContext *)v12->_queueOwner;
    v13 = &v12->_queueOwner;
    if (v14 != self)
      goto LABEL_17;
  }
  *v13 = 0;
LABEL_17:
  v15 = 0;
  self->_queueOwner = 0;
  __dmb(0xBu);
  if (!v10)
    v15 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __internalBlockToDeallocNSManagedObjectContext_block_invoke;
  aBlock[3] = &unk_1E1EDE520;
  aBlock[5] = v15;
  aBlock[6] = self;
  aBlock[4] = dispatchQueue;
  v26 = v10;
  v16 = malloc_type_malloc(0x20uLL, 0x80040B8603338uLL);
  *v16 = _Block_copy(aBlock);
  v16[1] = self;
  v16[2] = 12289;
  v16[3] = 0;
  dispatch_async_f(dispatchQueue, v16, (dispatch_function_t)developerSubmittedBlockToNSManagedObjectContextPerform);
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *result;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  result = (NSMutableDictionary *)*((_QWORD *)self->_additionalPrivateIvars + 6);
  if (!result)
  {
    *((_QWORD *)self->_additionalPrivateIvars + 6) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    return (NSMutableDictionary *)*((_QWORD *)self->_additionalPrivateIvars + 6);
  }
  return result;
}

- (_QWORD)_changeIDsForManagedObjects:(void *)a3 toIDs:
{
  _QWORD *v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t i;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v3 = a1;
  v24[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = objc_msgSend(a2, "count");
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = v3[5];
      if ((v8 & 0x80000000) != 0)
      {
        v6 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = (void *)v6;
      }
      else
      {
        v9 = 0;
      }
      v22 = (uint64_t)&v22;
      MEMORY[0x1E0C80A78](v6);
      v11 = (char *)&v22 - v10;
      if (v7 > 0x200)
      {
        v11 = (char *)NSAllocateScannedUncollectable();
        v13 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v22 - v10, 8 * v7);
        MEMORY[0x1E0C80A78](v12);
        v13 = (char *)&v22 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v13, 8 * v7);
      }
      objc_msgSend(a2, "getObjects:range:", v11, 0, v7, v22);
      objc_msgSend(a3, "getObjects:range:", v13, 0, objc_msgSend(a3, "count"));
      for (i = 0; i != v7; ++i)
      {
        v15 = *(_QWORD **)&v11[8 * i];
        v16 = (id)objc_msgSend(v15, "objectID");
        v17 = *(id *)&v13[8 * i];
        if (v17 != v16)
        {
          objc_msgSend(v9, "setObject:forKey:", *(_QWORD *)&v13[8 * i], v16);
          _PFCMT_RemoveValue((_QWORD *)v3[15], v16);
          -[NSManagedObject _setObjectID__:](v15, v17);
          v18 = v15[3];
          if (v18)
            snapshot_set_objectID(v18, v17);
          _PFCMT_SetValue(v3[15], v17, v15);
          v19 = *(id **)(v3[23] + 8);
          if (v19)
          {
            objc_msgSend(*v19, "setObject:forKey:", v17, v16);
            objc_msgSend(*(id *)(*(_QWORD *)(v3[23] + 8) + 8), "setObject:forKey:", v16, v17);
          }
        }

      }
      if (v7 >= 0x201)
      {
        NSZoneFree(0, v11);
        NSZoneFree(0, v13);
      }
      if ((v8 & 0x80000000) != 0)
      {
        if (objc_msgSend(v9, "count"))
        {
          v20 = objc_alloc(MEMORY[0x1E0CB37C0]);
          v23 = CFSTR("_NSManagedObjectContextObjectIDMutationMappingKey");
          v24[0] = v9;
          v3 = (_QWORD *)objc_msgSend(v20, "initWithName:object:userInfo:", CFSTR("_NSManagedObjectContextPrivateDidMutateObjectIDsNotification"), v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
        }
        else
        {
          v3 = 0;
        }
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

- (void)refreshAllObjects
{
  id v3;
  NSSet *v4;
  uint64_t v5;
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
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = -[NSManagedObjectContext registeredObjects](self, "registeredObjects");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSManagedObjectContext refreshObject:mergeChanges:](self, "refreshObject:mergeChanges:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "hasChanges"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");
  objc_msgSend(v3, "drain");
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
}

- (NSSet)registeredObjects
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (NSSet *)(id)-[NSManagedObjectContext _retainedRegisteredObjects]((uint64_t)self);
}

uint64_t __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSManagedObjectContext lockObjectStore](a1[4]);
  v2 = a1[4];
  if (v2)
  {
    v4 = (void *)a1[5];
    v3 = a1[6];
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(v4);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if ((objc_msgSend(v10, "isTemporaryID") & 1) == 0)
              objc_msgSend(v5, "addObject:", v10);
          }
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      objc_msgSend(*(id *)(v2 + 32), "managedObjectContextDidRegisterObjectsWithIDs:generation:", v5, v3);

    }
  }
  return -[NSManagedObjectContext unlockObjectStore](a1[4]);
}

uint64_t __92__NSManagedObjectContext__NestedContextSupport__newValuesForObjectWithID_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  _DWORD *v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  NSKnownKeysDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  id v23;

  v2 = *(void **)(a1 + 32);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8))
  {
    v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8) = v3;
  }
  if (objc_msgSend(v2, "isTemporaryID"))
  {
    v4 = objc_msgSend(**(id **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8), "objectForKey:", v2);
    if (v4)
      v2 = (void *)v4;
  }
  result = objc_msgSend(*(id *)(a1 + 40), "objectRegisteredForID:", v2);
  if (result)
  {
    v6 = (_DWORD *)result;
    result = objc_msgSend((id)result, "isFault");
    if ((result & 1) == 0)
    {
      result = (uint64_t)-[NSFaultHandler fulfillFault:withContext:error:]((id)_insertion_fault_handler, v6, *(_QWORD *)(a1 + 40), 0);
      if (result)
      {
        v7 = (unint64_t *)objc_msgSend(v6, "entity");
        v8 = v7[13];
        v9 = (_QWORD *)v7[14];
        v10 = *(_QWORD *)(v8 + 40);
        v11 = _kvcPropertysPrimitiveGetters(v7);
        v12 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", v8);
        v17 = -[NSKnownKeysDictionary values](v12, "values");
        v18 = v9[6];
        v19 = v9[7];
        if (v18 < v19 + v18)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty((id **)v6, v18, *(_QWORD *)(v10 + 8 * v18), *(_QWORD *)(v11 + 8 * v18), v13, v14, v15, v16);
            *(_QWORD *)(v17 + 8 * v18++) = v20;
            --v19;
          }
          while (v19);
        }
        v21 = v9[12];
        v22 = v9[13];
        if (v21 < v22 + v21)
        {
          do
          {
            _PF_Handler_Primitive_GetProperty((id **)v6, v21, *(_QWORD *)(v10 + 8 * v21), *(_QWORD *)(v11 + 8 * v21), v13, v14, v15, v16);
            *(_QWORD *)(v17 + 8 * v21++) = (id)objc_msgSend(v23, "objectID");
            --v22;
          }
          while (v22);
        }
        result = -[_PFTempNestedSnapshot initWithOwnedKKsD:andVersion:]([_PFTempNestedSnapshot alloc], "initWithOwnedKKsD:andVersion:", v12, objc_msgSend(v6, "_versionReference"));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    -[NSManagedObjectContext lockObjectStore](*(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "newValuesForObjectWithID:withContext:error:", v2, *(_QWORD *)(a1 + 48), 0);
    return -[NSManagedObjectContext unlockObjectStore](*(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  id v3;
  _PFBatchFaultingArray *v4;
  _PFBatchFaultingArray *v5;
  id v7;
  _NSChildContextPredicateRemapper *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  _NSChildContextPredicateRemapper *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  void *v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _PFBatchFaultingArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _PFArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  _PFArray *v56;
  _PFBatchFaultingArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v1 = a1;
  v101 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) + 8))
  {
    v2 = PF_CALLOC_OBJECT_ARRAY(2);
    *v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 184) + 8) = v2;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v89 = 0;
  v4 = 0;
  switch(objc_msgSend(*(id *)(v1 + 40), "requestType"))
  {
    case 1:
      if (objc_msgSend(*(id *)(v1 + 40), "resultType") == 4)
        goto LABEL_8;
      v4 = *(_PFBatchFaultingArray **)(v1 + 32);
      if (!v4)
        goto LABEL_6;
      v79 = v3;
      v77 = v1;
      v11 = *(void **)(v1 + 40);
      v12 = *(void **)(v1 + 48);
      v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v14 = (void *)objc_msgSend(v11, "copy");
      v76 = v11;
      v15 = objc_msgSend(v11, "resultType");
      v98 = 0;
      if (objc_msgSend(v14, "predicate"))
      {
        v16 = -[_NSChildContextPredicateRemapper initWithContext:]([_NSChildContextPredicateRemapper alloc], "initWithContext:", v4);
        v17 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:](v16, "createPredicateForFetchFromPredicate:withContext:", objc_msgSend(v14, "predicate"), v4);
        objc_msgSend(v14, "setPredicate:", v17);

      }
      v80 = v14;
      v78 = v13;
      if (!objc_msgSend(v14, "fetchBatchSize"))
        goto LABEL_33;
      v85 = objc_msgSend(v14, "entity");
      v18 = (void *)objc_msgSend(v14, "affectedStores");
      if (!v18)
        v18 = (void *)objc_msgSend((id)-[_PFBatchFaultingArray persistentStoreCoordinator](v4, "persistentStoreCoordinator"), "persistentStores");
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
      if (!v19)
        goto LABEL_33;
      v20 = v19;
      v21 = *(_QWORD *)v95;
      v81 = v15;
      break;
    case 2:
      v5 = (_PFBatchFaultingArray *)-[NSManagedObjectContext _parentProcessSaveRequest:inContext:error:](*(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
      goto LABEL_5;
    case 3:
LABEL_8:
      v7 = (id)objc_msgSend(*(id *)(v1 + 40), "copy");
      if (objc_msgSend(v7, "predicate"))
      {
        v8 = -[_NSChildContextPredicateRemapper initWithContext:]([_NSChildContextPredicateRemapper alloc], "initWithContext:", *(_QWORD *)(v1 + 32));
        v9 = -[_NSChildContextPredicateRemapper createPredicateForFetchFromPredicate:withContext:](v8, "createPredicateForFetchFromPredicate:withContext:", objc_msgSend(v7, "predicate"), *(_QWORD *)(v1 + 32));
        objc_msgSend(v7, "setPredicate:", v9);

      }
      v10 = objc_msgSend(*(id *)(v1 + 32), "countForFetchRequest:error:", v7, &v89);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = 0;
      }
      else
      {
        v5 = (_PFBatchFaultingArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10));
LABEL_5:
        v4 = v5;
      }
LABEL_6:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40) = v89;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40) = v4;
      return objc_msgSend(v3, "drain");
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      v5 = (_PFBatchFaultingArray *)objc_msgSend(*(id *)(v1 + 32), "executeRequest:error:", *(_QWORD *)(v1 + 40), &v89);
      goto LABEL_5;
    default:
      goto LABEL_6;
  }
  do
  {
    v22 = v18;
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v95 != v21)
        objc_enumerationMutation(v22);
      v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
      v25 = objc_msgSend((id)objc_msgSend(v24, "type"), "isEqual:", CFSTR("SQLite"));
      v26 = objc_msgSend((id)objc_msgSend(v24, "type"), "isEqual:", CFSTR("NSXPCStore"));
      if ((v25 & 1) == 0 && (v26 & 1) == 0)
      {
        v27 = (void *)objc_msgSend(v24, "configurationName");
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME")) & 1) != 0
          || objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[_PFBatchFaultingArray persistentStoreCoordinator](v4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", v27), "indexOfObjectIdenticalTo:", v85) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v80, "setFetchBatchSize:", 0);
          v15 = v81;
          v13 = v78;
          goto LABEL_33;
        }
      }
    }
    v18 = v22;
    v20 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    v15 = v81;
    v13 = v78;
  }
  while (v20);
LABEL_33:
  v28 = v80;
  v29 = objc_msgSend(v80, "includesPropertyValues");
  if (v15)
  {
    if (v15 == 1 && -[_PFBatchFaultingArray hasChanges](v4, "hasChanges"))
    {
      v30 = 0;
LABEL_40:
      objc_msgSend(v80, "setResultType:", v30);
    }
  }
  else if (!objc_msgSend((id)objc_msgSend(v80, "propertiesToFetch"), "count")
         && (-[_PFBatchFaultingArray hasChanges](v4, "hasChanges") & 1) == 0)
  {
    v30 = 1;
    goto LABEL_40;
  }
  objc_msgSend(v80, "setIncludesPropertyValues:", v29);
  v31 = (void *)-[_PFBatchFaultingArray executeFetchRequest:error:](v4, "executeFetchRequest:error:", v80, &v98);
  v32 = objc_msgSend(v31, "count");
  v3 = v79;
  if (v32)
  {
    v33 = v32;
    if ((!v15 && (_BYTE)dword_1ECD8DE20 || BYTE1(dword_1ECD8DE20) && v15 == 2) && objc_msgSend(v80, "fetchBatchSize"))
    {
      v34 = objc_msgSend(v80, "resultType");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v31)
        {
          v31 = (void *)objc_msgSend(v31, "newArrayFromObjectIDs");
          v34 = 1;
          v72 = v31;
        }
        else
        {
          v72 = 0;
          v34 = 1;
        }
      }
      else
      {
        v72 = 0;
      }
      v74 = v33;
      v83 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v47 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      if (v47)
      {
        v48 = v47;
        v49 = 0;
        v50 = *(_QWORD *)v91;
        do
        {
          v51 = 0;
          v87 = v49;
          v52 = &v83[8 * v49];
          do
          {
            if (*(_QWORD *)v91 != v50)
              objc_enumerationMutation(v31);
            v53 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v51);
            if (v34 != 1)
              v53 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v51), "objectID", v72);
            v54 = -[objc_class objectForKey:](v4[2]._request->super.super._affectedStores[1].super.isa, "objectForKey:", v53, v72);
            if (v54)
            {
              v55 = (void *)v54;
              if (objc_msgSend(v12, "objectRegisteredForID:", v54))
                v53 = v55;
            }
            *(_QWORD *)&v52[8 * v51++] = v53;
          }
          while (v48 != v51);
          v48 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
          v49 = v87 + v51;
        }
        while (v48);
      }
      v56 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v83, v74, 10);
      v57 = -[_PFBatchFaultingArray initWithPFArray:andRequest:andContext:]([_PFBatchFaultingArray alloc], "initWithPFArray:andRequest:andContext:", v56, v76, v12);

      goto LABEL_98;
    }
    if (!v15)
    {
      v75 = v33;
      v84 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      v58 = objc_msgSend(v80, "resultType");
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v59 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      if (v59)
      {
        v60 = v59;
        v61 = 0;
        v62 = *(_QWORD *)v91;
        do
        {
          v63 = 0;
          v88 = v61;
          v64 = &v84[8 * v61];
          do
          {
            if (*(_QWORD *)v91 != v62)
              objc_enumerationMutation(v31);
            v65 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v63);
            if (v58 != 1)
              v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v63), "objectID");
            v66 = -[objc_class objectForKey:](v4[2]._request->super.super._affectedStores[1].super.isa, "objectForKey:", v65);
            if (v66)
            {
              v67 = (void *)v66;
              if (objc_msgSend(v12, "objectRegisteredForID:", v66))
                v65 = v67;
            }
            if (v12)
              v68 = _PFRetainedObjectIDCore((uint64_t)v12, v65, 0, 1);
            else
              v68 = 0;
            *(_QWORD *)&v64[8 * v63++] = v68;
          }
          while (v60 != v63);
          v69 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
          v60 = v69;
          v61 = v88 + v63;
        }
        while (v69);
      }
      v46 = -[_PFArray initWithObjects:count:andFlags:andContext:]([_PFArray alloc], "initWithObjects:count:andFlags:andContext:", v84, v75, 42, v12);
      goto LABEL_97;
    }
    if (v15 == 1)
    {
      v73 = v33;
      v82 = (char *)PF_ALLOCATE_OBJECT_ARRAY(v33);
      v36 = objc_msgSend(v80, "resultType");
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v37 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      if (v37)
      {
        v38 = v37;
        v39 = 0;
        v40 = *(_QWORD *)v91;
        do
        {
          v41 = 0;
          v86 = v39;
          v42 = &v82[8 * v39];
          do
          {
            if (*(_QWORD *)v91 != v40)
              objc_enumerationMutation(v31);
            v43 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v41);
            if (v36 != 1)
              v43 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v41), "objectID");
            v44 = -[objc_class objectForKey:](v4[2]._request->super.super._affectedStores[1].super.isa, "objectForKey:", v43);
            if (v44)
            {
              v45 = (void *)v44;
              if (objc_msgSend(v12, "objectRegisteredForID:", v44))
                v43 = v45;
            }
            *(_QWORD *)&v42[8 * v41++] = v43;
          }
          while (v38 != v41);
          v38 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
          v39 = v86 + v41;
        }
        while (v38);
      }
      v46 = -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", v82, v73, 10);
LABEL_97:
      v57 = (_PFBatchFaultingArray *)v46;
LABEL_98:
      v1 = v77;
      v13 = v78;
      v3 = v79;
      v28 = v80;
LABEL_101:
      v70 = v98;

      objc_msgSend(v13, "drain");
      -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)v4, 0);
      if (v98)
        v89 = v98;
      v71 = v98;
      v5 = v57;
      goto LABEL_5;
    }
    v35 = v31;
  }
  else
  {
    v35 = (_PFBatchFaultingArray *)MEMORY[0x1E0C9AA60];
  }
  v57 = v35;
  v1 = v77;
  goto LABEL_101;
}

- (NSUInteger)countForFetchRequest:(NSFetchRequest *)request error:(NSError *)error
{
  NSUInteger result;

  result = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)self, request, (id *)error);
  if (error)
  {
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      *error = 0;
  }
  return result;
}

- (uint64_t)_countForFetchRequest_:(id *)a3 error:
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __CFSet *v11;
  CFStringRef (__cdecl *v12)(const void *);
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  __CFSet *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  char v65;
  void *v67;
  __CFSet *cf;
  char v69;
  id v70;
  const __CFAllocator *allocator;
  int allocatora;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CFSetCallBacks callBacks;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _QWORD v97[2];
  _BYTE v98[128];
  _BYTE v99[128];
  int8x16_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = result;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(result, sel__countForFetchRequest__error_);
  v5 = *(void **)(*(_QWORD *)(v4 + 184) + 152);
  if (v5)
  {
    if (!a3)
      return 0;
    v6 = v5;
    result = 0;
    *a3 = v6;
    return result;
  }
  objc_msgSend(a2, "_resolveEntityWithContext:", v4);
  if (!objc_msgSend((id)v4, "hasChanges")
    || !objc_msgSend(a2, "includesPendingChanges")
    || objc_msgSend(a2, "resultType") == 2)
  {
    result = -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)v4, a2, a3);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
        return 0x7FFFFFFFFFFFFFFFLL;
      else
        return 0;
    }
    return result;
  }
  if (!-[NSManagedObjectContext _attemptCoalesceChangesForFetch](v4))
    -[NSManagedObjectContext _processRecentChanges:](v4, 0);
  v64 = v4;
  v7 = (void *)objc_msgSend(a2, "affectedStores");
  v8 = (void *)objc_msgSend(a2, "entity");
  v63 = a2;
  if (objc_msgSend((id)objc_msgSend(v8, "subentitiesByName"), "count"))
    v9 = objc_msgSend(a2, "includesSubentities");
  else
    v9 = 0;
  v10 = 0;
  v11 = 0;
  callBacks.version = *MEMORY[0x1E0C9B3B0];
  *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
  v12 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
  callBacks.equal = 0;
  callBacks.hash = 0;
  callBacks.copyDescription = v12;
  v13 = *(_QWORD *)(v64 + 56);
  v97[0] = *(_QWORD *)(v64 + 96);
  v97[1] = v13;
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = 1;
  do
  {
    v15 = (void *)v97[v10];
    v69 = v14;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v78 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          if (!v7
            || objc_msgSend(v7, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = objc_msgSend(v19, "entity");
            if ((void *)v20 == v8 || v9 && objc_msgSend(v8, "_subentitiesIncludes:", v20))
            {
              if (!v11)
                v11 = CFSetCreateMutable(allocator, 0, &callBacks);
              CFSetAddValue(v11, v19);
            }
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
      }
      while (v16);
    }
    v14 = 0;
    v10 = 1;
  }
  while ((v69 & 1) != 0);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v21 = *(void **)(v64 + 88);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
  if (v22)
  {
    cf = 0;
    v23 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v74 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "entity");
        if ((void *)v26 == v8 || v9 && objc_msgSend(v8, "_subentitiesIncludes:", v26))
        {
          v27 = cf;
          if (!cf)
            v27 = CFSetCreateMutable(allocator, 0, &callBacks);
          cf = v27;
          CFSetAddValue(v27, v25);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v95, 16);
    }
    while (v22);
  }
  else
  {
    cf = 0;
  }
  if (-[__CFSet count](v11, "count") || -[__CFSet count](cf, "count"))
  {
    v62 = objc_msgSend(v63, "fetchLimit");
    v94 = 0;
    if (!objc_msgSend(v63, "entity"))
    {
      v60 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ A fetch request must have an entity."), NSStringFromSelector(sel__countWithMergedChangesForRequest_possibleChanges_possibleDeletes_error_)), 0);
      objc_exception_throw(v60);
    }
    v28 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (objc_msgSend((id)v64, "hasChanges")
      && objc_msgSend(v63, "includesPendingChanges")
      && objc_msgSend(v63, "resultType") != 2
      && !-[NSManagedObjectContext _attemptCoalesceChangesForFetch](v64))
    {
      -[NSManagedObjectContext _processRecentChanges:](v64, 0);
    }
    v29 = (void *)objc_msgSend(v63, "copy");
    -[NSManagedObjectContext _unlimitRequest:](v29);
    objc_msgSend(v29, "setIncludesPropertyValues:", 0);
    objc_msgSend(v29, "setResultType:", 1);
    objc_msgSend(v29, "setSortDescriptors:", 0);
    -[NSManagedObjectContext lockObjectStore](v64);
    v30 = (void *)objc_msgSend(*(id *)(v64 + 32), "executeRequest:withContext:error:", v29, v64, &v94);
    v31 = v94;
    v32 = v30;

    objc_msgSend(v28, "drain");
    -[NSManagedObjectContext unlockObjectStore](v64);
    if (v94)
    {
      v33 = v94;
      if (a3)
        *a3 = v94;
    }
    else if (v30)
    {
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v30);

      v61 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      v36 = objc_msgSend(v63, "predicate");
      v37 = (void *)objc_msgSend(v63, "affectedStores");
      v38 = (void *)objc_msgSend(v63, "entity");
      if (objc_msgSend((id)objc_msgSend(v38, "subentitiesByName"), "count"))
        allocatora = objc_msgSend(v63, "includesSubentities");
      else
        allocatora = 0;
      if (v36)
      {
        v70 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v36, 0);
        v39 = v70;
      }
      else
      {
        v70 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      }
      if (objc_msgSend(v37, "count"))
        v40 = v37;
      else
        v40 = 0;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v41 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v91;
        do
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v91 != v42)
              objc_enumerationMutation(v11);
            v44 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
            v45 = objc_msgSend(v44, "objectID");
            if (objc_msgSend(v70, "evaluateWithObject:", v44))
              objc_msgSend(v67, "addObject:", v45);
            else
              objc_msgSend(v67, "removeObject:", v45);
          }
          v41 = -[__CFSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
        }
        while (v41);
      }
      v46 = 0;
      v100 = vextq_s8(*(int8x16_t *)(v64 + 72), *(int8x16_t *)(v64 + 72), 8uLL);
      v47 = 1;
      do
      {
        v48 = (void *)v100.i64[v46];
        v65 = v47;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v49)
        {
          v50 = *(_QWORD *)v87;
          do
          {
            for (m = 0; m != v49; ++m)
            {
              if (*(_QWORD *)v87 != v50)
                objc_enumerationMutation(v48);
              v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * m);
              v53 = (void *)objc_msgSend(v52, "objectID");
              v54 = v53;
              if (v40)
              {
                v55 = objc_msgSend(v53, "persistentStore");
                if (!v55 || objc_msgSend(v40, "indexOfObjectIdenticalTo:", v55) == 0x7FFFFFFFFFFFFFFFLL)
                  continue;
              }
              v56 = objc_msgSend(v52, "entity");
              if ((void *)v56 == v38 || allocatora && objc_msgSend(v38, "_subentitiesIncludes:", v56))
              {
                if (objc_msgSend(v70, "evaluateWithObject:", v52))
                  objc_msgSend(v67, "addObject:", v54);
              }
            }
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
          }
          while (v49);
        }
        v47 = 0;
        v46 = 1;
      }
      while ((v65 & 1) != 0);
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v57 = -[__CFSet countByEnumeratingWithState:objects:count:](cf, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      if (v57)
      {
        v58 = *(_QWORD *)v83;
        do
        {
          for (n = 0; n != v57; ++n)
          {
            if (*(_QWORD *)v83 != v58)
              objc_enumerationMutation(cf);
            objc_msgSend(v67, "removeObject:", objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * n), "objectID"));
          }
          v57 = -[__CFSet countByEnumeratingWithState:objects:count:](cf, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
        }
        while (v57);
      }
      objc_msgSend(v61, "drain");
      v34 = objc_msgSend(v67, "count");

      if (v62 - 1 < v34)
        v34 = v62;
      goto LABEL_68;
    }
    v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v34 = -[NSManagedObjectContext _countWithNoChangesForRequest:error:]((id *)v64, v63, a3);
  }
LABEL_68:
  if (v11)
    CFRelease(v11);
  if (cf)
    CFRelease(cf);
  if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
    v35 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v35 = 0;
  if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    return v35;
  else
    return v34;
}

- (uint64_t)_countWithNoChangesForRequest:(id *)a3 error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  CFStringRef (__cdecl *v19)(const void *);
  uint64_t v20;
  __CFSet *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  id v40;
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
  CFSetCallBacks callBacks;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "substitutionVariables"), "objectForKey:", CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION")))
  {
    v39 = 1;
  }
  else
  {
    v39 = objc_msgSend(a2, "fetchLimit");
  }
  v54 = 0;
  if (!objc_msgSend(a2, "entity"))
  {
    v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ A fetch request must have an entity."), NSStringFromSelector(sel__countWithNoChangesForRequest_error_)), 0);
    objc_exception_throw(v36);
  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(a2, "copy");
  if (v39 && objc_msgSend(a1, "hasChanges"))
    -[NSManagedObjectContext _unlimitRequest:](v7);
  objc_msgSend(v7, "setResultType:", 4);
  -[NSManagedObjectContext lockObjectStore]((uint64_t)a1);
  v8 = (void *)objc_msgSend(a1[4], "executeRequest:withContext:error:", v7, a1, &v54);
  v9 = v54;
  v10 = v8;

  objc_msgSend(v6, "drain");
  -[NSManagedObjectContext unlockObjectStore]((uint64_t)a1);
  if (v54)
  {
    v11 = v54;
    if (a3)
      *a3 = v54;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v8, "count"))
    v12 = objc_msgSend((id)objc_msgSend(v8, "lastObject"), "unsignedIntValue");
  else
    v12 = 0;

  if (objc_msgSend(a1, "hasChanges") && objc_msgSend(a2, "includesPendingChanges"))
  {
    v38 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v14 = objc_msgSend(a2, "predicate");
    v15 = (void *)objc_msgSend(a2, "affectedStores");
    v16 = (void *)objc_msgSend(a2, "entity");
    if (objc_msgSend((id)objc_msgSend(v16, "subentitiesByName"), "count"))
    {
      v17 = objc_msgSend(a2, "includesSubentities");
      if (v14)
      {
LABEL_22:
        v40 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v14, 0);
        v18 = v40;
LABEL_25:
        if (!objc_msgSend(v15, "count"))
          v15 = 0;
        callBacks.version = *MEMORY[0x1E0C9B3B0];
        *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
        v19 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
        callBacks.equal = 0;
        callBacks.hash = 0;
        callBacks.copyDescription = v19;
        v20 = objc_msgSend(a1[9], "count");
        v21 = (__CFSet *)a1[10];
        if (v20)
        {
          if (objc_msgSend(a1[10], "count"))
          {
            v21 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v22 = a1[9];
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v50 != v24)
                    objc_enumerationMutation(v22);
                  CFSetAddValue(v21, *(const void **)(*((_QWORD *)&v49 + 1) + 8 * i));
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v23);
            }
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v26 = a1[10];
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v46;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v46 != v28)
                    objc_enumerationMutation(v26);
                  CFSetAddValue(v21, *(const void **)(*((_QWORD *)&v45 + 1) + 8 * j));
                }
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
              }
              while (v27);
            }
            v37 = 1;
          }
          else
          {
            v37 = 0;
            v21 = (__CFSet *)a1[9];
          }
        }
        else
        {
          v37 = 0;
        }
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v30 = -[__CFSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v42;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v42 != v31)
                objc_enumerationMutation(v21);
              v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
              if (v15)
              {
                v34 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "objectID"), "persistentStore");
                if (!v34 || objc_msgSend(v15, "indexOfObjectIdenticalTo:", v34) == 0x7FFFFFFFFFFFFFFFLL)
                  continue;
              }
              v35 = objc_msgSend(v33, "entity");
              if ((void *)v35 == v16 || v17 && objc_msgSend(v16, "_subentitiesIncludes:", v35))
                v12 += objc_msgSend(v40, "evaluateWithObject:", v33);
            }
            v30 = -[__CFSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
          }
          while (v30);
        }
        if (v37)
          CFRelease(v21);
        objc_msgSend(v38, "drain");
        goto LABEL_63;
      }
    }
    else
    {
      v17 = 0;
      if (v14)
        goto LABEL_22;
    }
    v40 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    goto LABEL_25;
  }
LABEL_63:
  if (v39 - 1 >= v12)
    return v12;
  else
    return v39;
}

- (uint64_t)_parentProcessSaveRequest:(uint64_t)result inContext:(void *)a2 error:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t i;
  id v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _BYTE *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  id *v33;
  unint64_t v34;
  id *v35;
  unint64_t v36;
  id *v37;
  unint64_t v38;
  id *v39;
  unint64_t v40;
  id *v41;
  unint64_t v42;
  id *v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    v47 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    objc_msgSend(v3, "processPendingChanges");
    v4 = (void *)objc_msgSend(a2, "insertedObjects");
    v5 = (void *)objc_msgSend(a2, "updatedObjects");
    v6 = (void *)objc_msgSend(a2, "deletedObjects");
    v7 = objc_msgSend(v4, "count");
    v49 = objc_msgSend(v5, "count");
    v48 = objc_msgSend(v6, "count");
    v46 = (uint64_t)&v46;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    if (v7 >= 0x201)
      v9 = 1;
    else
      v9 = v8;
    v50 = v7;
    if (v7 > 0x200)
    {
      v53 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      v53 = (char *)&v46 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v53, 8 * v8);
    }
    if (v49 <= 1)
      v10 = 1;
    else
      v10 = v49;
    if (v49 >= 0x201)
      v11 = 1;
    else
      v11 = v10;
    if (v49 > 0x200)
    {
      v52 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      v52 = (char *)&v46 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v52, 8 * v10);
    }
    if (v48 <= 1)
      v12 = 1;
    else
      v12 = v48;
    if (v48 >= 0x201)
      v13 = 1;
    else
      v13 = v12;
    if (v48 > 0x200)
    {
      v51 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      v51 = (char *)&v46 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v51, 8 * v12);
    }
    if (v50)
    {
      v14 = v50 >= 0x201 ? 1 : v50;
      v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
      v16 = (char *)&v46 - v15;
      if (v50 > 0x200)
        v16 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v46 - v15, 8 * v50);
      objc_msgSend(v4, "getObjects:", v16, v46);
      for (i = 0; i != v8; ++i)
      {
        v18 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)objc_msgSend(*(id *)&v16[8 * i], "objectID"), (uint64_t)v3);
        *(_QWORD *)&v53[8 * i] = v18;
        objc_msgSend(v3, "insertObject:", v18);
      }
      for (j = 0; j != v8; ++j)
        -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]((uint64_t)v3, *(_BYTE **)&v16[8 * j], *(_QWORD **)&v53[8 * j]);
      if (v50 >= 0x201)
        NSZoneFree(0, v16);
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16, v46);
    if (v20)
    {
      v21 = 0;
      v22 = *(_QWORD *)v59;
      do
      {
        v23 = 0;
        v24 = &v52[8 * v21];
        do
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(v5);
          v25 = *(_BYTE **)(*((_QWORD *)&v58 + 1) + 8 * v23);
          v26 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)objc_msgSend(v25, "objectID"), (uint64_t)v3);
          *(_QWORD *)&v24[8 * v23] = v26;
          -[NSManagedObjectContext _copyChildObject:toParentObject:fromChildContext:]((uint64_t)v3, v25, v26);
          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        v21 += v23;
      }
      while (v20);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v27)
    {
      v28 = 0;
      v29 = *(_QWORD *)v55;
      do
      {
        v30 = 0;
        v31 = &v51[8 * v28];
        do
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v6);
          v32 = _PFRetainedObjectForMappedChildObjectIDInParentContext((void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v30), "objectID"), (uint64_t)v3);
          *(_QWORD *)&v31[8 * v30] = v32;
          objc_msgSend(v3, "deleteObject:", v32);
          ++v30;
        }
        while (v27 != v30);
        v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        v28 += v30;
      }
      while (v27);
    }
    if (v50)
    {
      v33 = (id *)v53;
      v34 = v50;
      do
      {
        objc_msgSend(*v33++, "awakeFromSnapshotEvents:", 128);
        --v34;
      }
      while (v34);
    }
    if (v49)
    {
      v35 = (id *)v52;
      v36 = v49;
      do
      {
        objc_msgSend(*v35++, "awakeFromSnapshotEvents:", 128);
        --v36;
      }
      while (v36);
    }
    if (v48)
    {
      v37 = (id *)v51;
      v38 = v48;
      do
      {
        objc_msgSend(*v37++, "awakeFromSnapshotEvents:", 128);
        --v38;
      }
      while (v38);
    }
    objc_msgSend(v3, "processPendingChanges");
    if (v50)
    {
      v39 = (id *)v53;
      v40 = v50;
      do
      {

        --v40;
      }
      while (v40);
    }
    if (v49)
    {
      v41 = (id *)v52;
      v42 = v49;
      do
      {

        --v42;
      }
      while (v42);
    }
    if (v48)
    {
      v43 = (id *)v51;
      v44 = v48;
      do
      {

        --v44;
      }
      while (v44);
    }
    if (v50 >= 0x201)
      NSZoneFree(0, v53);
    if (v49 >= 0x201)
      NSZoneFree(0, v52);
    if (v48 >= 0x201)
      NSZoneFree(0, v51);
    objc_msgSend(v47, "drain");
    v45 = 0;
    return NSArray_EmptyArray;
  }
  return result;
}

- (void)insertObject:(NSManagedObject *)object
{
  NSEntityDescription *v5;
  NSEntityDescription *v6;
  NSManagedObjectModel *v7;
  uint64_t v8;
  NSManagedObjectID *v9;
  NSTemporaryObjectID *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = -[NSManagedObject entity](object, "entity");
  if (!v5)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("An NSManagedObject must have a valid NSEntityDescription.");
    goto LABEL_14;
  }
  v6 = v5;
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    v7 = -[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"), "managedObjectModel");
    v8 = -[NSEntityDescription name](v6, "name");
    if ((!v7 || !-[NSMutableDictionary objectForKey:](v7->_entities, "objectForKey:", v8))
      && !-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (-[NSEntityDescription name](v6, "name"))
        v17 = -[NSEntityDescription name](v6, "name");
      else
        v17 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (const __CFString *)objc_msgSend(v16, "stringWithFormat:", CFSTR("Cannot insert '%@' in this managed object context because it is not found in the associated managed object model."), v17);
      v11 = v14;
      v12 = v15;
LABEL_14:
      objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
    }
  }
  v9 = -[NSManagedObject objectID](object, "objectID");
  if (v9)
  {
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)object, v9);
    if (object)
    {
LABEL_10:
      object->_cd_stateFlags |= 0x1000u;
      -[NSManagedObject awakeFromInsert](object, "awakeFromInsert");
      object->_cd_stateFlags &= ~0x1000u;
      return;
    }
  }
  else
  {
    v10 = -[NSTemporaryObjectID initWithEntity:]([NSTemporaryObjectID alloc], "initWithEntity:", -[NSManagedObject entity](object, "entity"));
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)object, v10);

    if (object)
      goto LABEL_10;
  }
  objc_msgSend(0, "awakeFromInsert");
}

- (void)_insertObjectWithGlobalID:(void *)a3 globalID:
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    if (!a2)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("attempt to insert a null object into this context"), 0));
    v5 = (uint64_t)result;
    -[NSManagedObjectContext _registerClearStateWithUndoManager]((uint64_t)result);
    v6 = *(_DWORD *)(a2 + 16);
    if ((v6 & 0x80) != 0)
      v7 = 0;
    else
      v7 = *(_QWORD *)(a2 + 32);
    if (v7 != v5)
    {
      -[NSManagedObjectContext _registerObject:withID:](v5, a2, a3);
      v6 = *(_DWORD *)(a2 + 16);
    }
    *(_DWORD *)(a2 + 16) = v6 | 2;
    _PFFaultHandlerFulfillFault(0, a2, v5, 0, 1);
    -[NSManagedObjectContext _establishEventSnapshotsForObject:](v5, (_QWORD *)a2);
    v8 = *(_QWORD *)(v5 + 40);
    if ((v8 & 0x400) != 0 && (v8 & 0x200) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      v8 = *(_QWORD *)(v5 + 40);
    }
    *(_QWORD *)(v5 + 40) = v8 | 0x200;
    objc_msgSend(*(id *)(v5 + 72), "addObject:", a2);
    -[NSManagedObjectContext _enqueueEndOfEventNotification](v5);
    if ((*(_BYTE *)(v5 + 41) & 8) == 0)
    {
      objc_msgSend((id)v5, "willChangeValueForKey:", CFSTR("hasChanges"));
      *(_QWORD *)(v5 + 40) |= 0x800uLL;
      objc_msgSend((id)v5, "didChangeValueForKey:", CFSTR("hasChanges"));
    }
    result = **(void ***)(v5 + 184);
    if (result)
      return (void *)objc_msgSend(result, "removeObject:", a3);
  }
  return result;
}

- (void)refreshObject:(NSManagedObject *)object mergeChanges:(BOOL)flag
{
  _BOOL8 v4;
  NSManagedObjectContext *cd_managedObjectContext;
  unsigned int v8;
  NSManagedObjectID *v10;
  NSManagedObjectID *v11;
  NSKnownKeysDictionary *refreshed;
  NSKnownKeysDictionary *v13;
  uint64_t v14;
  NSEntityDescription *v15;
  $1A22B458595D9B8B5E31AEBB12624A52 *cd_extras;
  void *var0;
  unsigned int cd_stateFlags;
  uint64_t v19;
  int v20;
  unsigned int v21;
  BOOL v22;
  id parentObjectStore;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  const __CFAllocator *v28;
  CFArrayRef v29;
  unsigned int v30;
  id v31;
  uint64_t v32;
  void *values;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v4 = flag;
  v66 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object)
      goto LABEL_6;
  }
  else if (!object)
  {
    goto LABEL_6;
  }
  if ((object->_cd_stateFlags & 0x80) == 0)
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    goto LABEL_7;
  }
LABEL_6:
  cd_managedObjectContext = 0;
LABEL_7:
  if (cd_managedObjectContext != self)
  {
    if (!cd_managedObjectContext)
      return;
    if (BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An NSManagedObjectContext cannot refresh objects in other contexts."), 0));
  }
  v8 = (object->_cd_stateFlags >> 15) & 7;
  if (v8 == 5 || v8 == 0)
  {
    v10 = -[NSManagedObject objectID](object, "objectID");
    values = v10;
    if (!v4)
    {
      -[NSManagedObject willRefresh:](object, "willRefresh:", 0);
      -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 1);
LABEL_60:
      -[NSManagedObject awakeFromSnapshotEvents:](object, "awakeFromSnapshotEvents:", 32);
      -[NSManagedObject didRefresh:](object, "didRefresh:", v4);
      -[NSManagedObjectContext _prepareUnprocessedDeletionAfterRefresh:](self, object);
      -[NSMutableSet addObject:](self->_refreshedObjects, "addObject:", -[NSManagedObject objectID](object, "objectID"));
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        -[NSManagedObjectContext _enqueueEndOfEventNotification]((uint64_t)self);
      return;
    }
    v11 = v10;
    -[NSManagedObject willRefresh:](object, "willRefresh:", 1);
    refreshed = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)object);
    v13 = -[NSManagedObject _changedTransientProperties__](object);
    if (object)
      v14 = _insertion_fault_handler;
    else
      v14 = 0;
    v15 = -[NSManagedObject entity](object, "entity");
    cd_extras = object->_cd_extras;
    v32 = v14;
    if (cd_extras)
    {
      var0 = cd_extras->var0;
      cd_stateFlags = object->_cd_stateFlags;
      v19 = 0;
      v20 = 1;
      if (var0)
      {
        if ((cd_stateFlags & 0x2000) == 0)
        {
          if (v15)
          {
            v19 = *((_QWORD *)v15->_kvcPropertyAccessors + 6);
            if (v19)
            {
              object->_cd_stateFlags = cd_stateFlags | 0x1000;
              -[NSManagedObject _willChangeValuesForKeys:](object, "_willChangeValuesForKeys:", v19);
              v20 = 0;
              cd_stateFlags = object->_cd_stateFlags & 0xFFFFEFFF;
            }
          }
        }
      }
    }
    else
    {
      v19 = 0;
      cd_stateFlags = object->_cd_stateFlags;
      v20 = 1;
    }
    object->_cd_stateFlags = cd_stateFlags | 0x2000;
    -[NSManagedObjectContext _refaultObject:globalID:BOOLean:]((id *)&self->super.isa, (uint64_t)object, 0);
    v21 = object->_cd_stateFlags & 0x12;
    v22 = v21 != 0;
    if (-[NSManagedObjectID isTemporaryID](v11, "isTemporaryID"))
      v22 = (*((_BYTE *)&self->_flags + 2) & 8) == 0 || v21 != 0;
    if (v22 || ((v20 ^ 1) & 1) != 0)
    {
      if (!v22)
        goto LABEL_37;
    }
    else if (-[NSManagedObject hasChanges](object, "hasChanges"))
    {
LABEL_37:
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      if (self)
        parentObjectStore = self->_parentObjectStore;
      else
        parentObjectStore = 0;
      v25 = objc_msgSend(parentObjectStore, "newValuesForObjectWithID:withContext:error:", v11, self, 0);
      v26 = v25 != 0;
      if (v25)
      {
        v27 = (void *)v25;
        if ((object->_cd_stateFlags & 0x200) == 0 && !-[NSManagedObjectID isTemporaryID](v11, "isTemporaryID"))
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
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
          v28 = _PFStackAllocatorCreate((unint64_t *)&v34, 1024);
          v29 = CFArrayCreate(v28, (const void **)&values, 1, 0);
          if (self)
            v31 = self->_parentObjectStore;
          else
            v31 = 0;
          objc_msgSend(v31, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v29, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));
          if (*((_QWORD *)&v35 + 1) && v29)
            CFRelease(v29);
          object->_cd_stateFlags |= 0x200u;
        }
        _PFFaultHandlerFulfillFault(v32, (uint64_t)object, (uint64_t)self, v27, 0);

      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      goto LABEL_52;
    }
    v26 = 0;
LABEL_52:
    if (-[NSKnownKeysDictionary count](refreshed, "count"))
      -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](object, refreshed, 0);

    if (-[NSKnownKeysDictionary count](v13, "count"))
      -[NSManagedObject _updateFromSnapshot:]((uint64_t)object, v13);
    v30 = object->_cd_stateFlags;
    if (v26)
    {
      object->_cd_stateFlags = v30 | 0x1000;
      -[NSManagedObject awakeFromFetch](object, "awakeFromFetch");
      v30 = object->_cd_stateFlags & 0xFFFFEFFF;
    }
    object->_cd_stateFlags = v30 & 0xFFFFDFFF;
    if ((v20 & 1) == 0)
      -[NSManagedObject _didChangeValuesForKeys:](object, "_didChangeValuesForKeys:", v19);
    goto LABEL_60;
  }
}

- (void)_refaultObject:(id *)a1 globalID:(uint64_t)a2 BOOLean:(int)a3
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;

  if (a1)
  {
    if ((a3 & 1) != 0 || (*(_BYTE *)(a2 + 16) & 0x3F) == 0)
    {
      v7 = 0;
      v11 = 0;
    }
    else
    {
      v6 = *(_QWORD **)(a2 + 48);
      if (v6)
        v6 = (_QWORD *)v6[1];
      v7 = v6;
      v8 = *(_QWORD **)(a2 + 48);
      if (v8)
        v8 = (_QWORD *)v8[2];
      v11 = v8;
    }
    if (a2)
      v9 = _insertion_fault_handler;
    else
      v9 = 0;
    -[NSFaultHandler turnObject:intoFaultWithContext:](v9, a2, (uint64_t)a1);
    if (a2 && a3)
    {
      v10 = *(_DWORD *)(a2 + 16);
      if ((v10 & 9) != 0)
      {
        objc_msgSend(a1[7], "removeObject:", a2);
        objc_msgSend(a1[12], "removeObject:", a2);
        v10 = *(_DWORD *)(a2 + 16);
      }
      if ((v10 & 0x12) != 0)
      {
        objc_msgSend(a1[9], "removeObject:", a2);
        objc_msgSend(a1[10], "removeObject:", a2);
        v10 = *(_DWORD *)(a2 + 16);
      }
      if ((v10 & 0x24) != 0)
      {
        objc_msgSend(a1[11], "removeObject:", a2);
        objc_msgSend(a1[8], "removeObject:", a2);
        v10 = *(_DWORD *)(a2 + 16);
      }
      *(_DWORD *)(a2 + 16) = v10 & 0xFFFFFFC0;
      -[NSManagedObject _setOriginalSnapshot__:]((_QWORD *)a2, 0);
      -[NSManagedObject _setLastSnapshot__:]((_QWORD *)a2, 0);
    }
    if (v7)
    {
      -[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)a1, (_QWORD *)a2);

    }
    if (v11)
    {
      -[NSManagedObject _setLastSnapshot__:]((_QWORD *)a2, v11);

    }
  }
}

- (void)_prepareUnprocessedDeletionAfterRefresh:(_QWORD *)a1
{
  uint64_t v3;

  if (a1 && objc_msgSend(a2, "isDeleted"))
  {
    v3 = a1[5];
    if ((v3 & 0x400) != 0 && (v3 & 0x200) == 0)
    {
      _PFFaultLogExcessivePrepareForPendingChangesAttempts();
      v3 = a1[5];
    }
    a1[5] = v3 | 0x200;
    if ((v3 & 0x800) == 0)
    {
      objc_msgSend(a1, "willChangeValueForKey:", CFSTR("hasChanges"));
      a1[5] |= 0x800uLL;
      objc_msgSend(a1, "didChangeValueForKey:", CFSTR("hasChanges"));
    }
  }
}

- (void)_copyChildObject:(uint64_t)a1 toParentObject:(_BYTE *)a2 fromChildContext:(_QWORD *)a3
{
  NSKnownKeysDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSKnownKeysDictionary *v30;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a1, sel__copyChildObject_toParentObject_fromChildContext_);
  v6 = -[NSManagedObject _newNestedSaveChangedValuesForParent:](a2, a3);
  if (v6)
  {
    v30 = v6;
    v7 = objc_msgSend(a3, "entity");
    v8 = *(_QWORD *)(v7 + 112);
    v9 = *(_QWORD *)(v8 + 136);
    if (!v9)
    {
      -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
LABEL_26:

      return;
    }
    v10 = v7;
    v11 = *(_QWORD *)(v8 + 128);
    if (_PF_Threading_Debugging_level)
    {
      _PFAssertSafeMultiThreadedAccess_impl(a1, sel__currentEventSnapshotForObject_);
      if (a3)
        goto LABEL_7;
    }
    else if (a3)
    {
LABEL_7:
      v12 = a3[6];
      if (!v12 || (v13 = *(void **)(v12 + 16)) == 0)
        v13 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:](a1, a3);
      goto LABEL_14;
    }
    v13 = 0;
LABEL_14:
    v14 = *(void **)(v10 + 104);
    v15 = objc_msgSend(v14, "keys");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "length"));
    v28 = v11;
    v29 = v9;
    v27 = v9 + v11;
    if (v11 < v9 + v11)
    {
      v17 = v9;
      v18 = (uint64_t *)(v15 + 8 * v11);
      do
      {
        v19 = *v18;
        v20 = (void *)objc_msgSend(a3, "valueForKey:", *v18);
        v21 = (void *)objc_msgSend(v13, "valueForKey:", v19);
        if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v21)
        {
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
        }
        else
        {
          v22 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, v20, v21);
          objc_msgSend(v16, "addObject:", v22);

          objc_msgSend((id)objc_msgSend(a3, "primitiveValueForKey:", v19), "removeObjectsInArray:", objc_msgSend(v22, "array"));
        }
        ++v18;
        --v17;
      }
      while (v17);
    }
    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v30, 1);
    v23 = objc_msgSend(v14, "keys");
    if (v28 < v27)
    {
      v24 = 0;
      v25 = v23 + 8 * v28;
      do
      {
        v26 = (void *)objc_msgSend(v16, "objectAtIndex:", v24);
        if ((void *)objc_msgSend(MEMORY[0x1E0C99E38], "null") != v26)
          objc_msgSend((id)objc_msgSend(a3, "primitiveValueForKey:", *(_QWORD *)(v25 + 8 * v24)), "addObjectsFromArray:", objc_msgSend(v26, "array"));
        ++v24;
      }
      while (v29 != v24);
    }

    goto LABEL_26;
  }
}

uint64_t __108__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke(uint64_t a1)
{
  -[NSManagedObjectContext lockObjectStore](*(_QWORD *)(a1 + 32));
  -[NSManagedObjectContext _informParentStoreNoLongerInterestedInObjectIDs:generation:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
  return -[NSManagedObjectContext unlockObjectStore](*(_QWORD *)(a1 + 32));
}

- (void)_informParentStoreNoLongerInterestedInObjectIDs:(uint64_t)a3 generation:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a2, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(a2);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isTemporaryID") & 1) == 0)
            objc_msgSend(v6, "addObject:", v11);
        }
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v6, a3);

  }
}

- (NSString)name
{
  void *v2;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __30__NSManagedObjectContext_name__block_invoke;
    v5[3] = &unk_1E1EDD618;
    v5[4] = self;
    v5[5] = &v6;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
    v2 = (void *)v7[5];
  }
  else
  {
    v2 = (void *)-[NSString copy](self->_contextLabel, "copy");
    v7[5] = (uint64_t)v2;
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)save:(NSError *)error
{
  uint64_t v5;
  NSError *v6;
  void *v7;
  BOOL v8;
  _managedObjectContextFlags flags;
  id v10;
  _managedObjectContextFlags v11;
  _managedObjectContextFlags v12;
  id *v13;
  uint64_t v14;
  char v15;
  id v16;
  NSPersistentStoreCoordinator *v17;
  _PFModelMap *modelMap;
  NSArray *models;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int hasEntityWithUniqueness;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id parentObjectStore;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t j;
  _DWORD *v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  int v41;
  int v42;
  id v43;
  id v44;
  _managedObjectContextFlags v45;
  id v46;
  id v47;
  id v48;
  NSQueryGenerationToken *v49;
  NSQueryGenerationToken *v50;
  char v52;
  void *v53;
  NSError **v54;
  NSSaveChangesRequest *v55;
  int v56;
  _QWORD v57[6];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _QWORD v64[2];
  _QWORD v65[5];

  v65[2] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if ((*(_DWORD *)&self->_flags & 0x20080) != 0)
  {
    if (error)
    {
      v64[0] = CFSTR("message");
      v64[1] = CFSTR("stack trace");
      v65[0] = CFSTR("attempt to recursively call -save: on the context aborted");
      v65[1] = objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
      v6 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 132001, v5);
LABEL_9:
      v8 = 0;
      *error = v6;
      return v8;
    }
    return 0;
  }
  v7 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 19);
  if (v7)
  {
    if (error)
    {
      v6 = v7;
      goto LABEL_9;
    }
    return 0;
  }
  -[NSManagedObjectContext _PFAutoreleasePoolReferenceQueueTrampoline](self);
  v62 = 0;
  flags = self->_flags;
  v10 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x80000) == 0)
  {
    objc_msgSend(self->_additionalPrivateIvars[12], "_isEnabled");
    v11 = self->_flags;
  }
  self->_flags = (_managedObjectContextFlags)(*(unint64_t *)&v11 | 0x20000);
  v53 = v10;
  v54 = error;
  v52 = (char)flags;
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
  v12 = self->_flags;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSManagingContextWillSaveChangesNotification"), self, 0);
    v12 = self->_flags;
  }
  if (error)
  {
    v12 = (_managedObjectContextFlags)(*(unint64_t *)&v12 | 4);
    self->_flags = v12;
    v13 = &v62;
  }
  else
  {
    v13 = 0;
  }
  self->_flags = (_managedObjectContextFlags)(*(unint64_t *)&v12 | 0x80);
  if (!-[NSManagedObjectContext _prepareForPushChanges:]((uint64_t)self, v13))
  {
    v41 = 0;
    v42 = 0;
    v55 = 0;
    v36 = 1;
    goto LABEL_70;
  }
  ++self->_ignoreChangeNotification;
  v55 = -[NSManagedObjectContext _newSaveRequestForCurrentState]((uint64_t)self);
  v56 = 0;
  v14 = 0;
  v15 = 1;
  while ((v15 & 1) != 0)
  {
    v62 = 0;
    if ((v56 & 1) == 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      v56 = 1;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    ++v14;
    if (-[NSManagedObjectContext _allowAncillaryEntities](self, "_allowAncillaryEntities"))
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v17 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
      if (v17 && (modelMap = v17->_modelMap) != 0)
        models = modelMap->_models;
      else
        models = 0;
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](models, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v59;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v59 != v21)
              objc_enumerationMutation(models);
            if ((-[NSManagedObjectModel _hasEntityWithUniquenessConstraints](*(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i)) & 1) != 0)
            {
              hasEntityWithUniqueness = 1;
              goto LABEL_39;
            }
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](models, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
          hasEntityWithUniqueness = 0;
          if (v20)
            continue;
          break;
        }
      }
      else
      {
        hasEntityWithUniqueness = 0;
      }
    }
    else
    {
      hasEntityWithUniqueness = -[NSManagedObjectModel _hasEntityWithUniquenessConstraints]((uint64_t)-[NSPersistentStoreCoordinator managedObjectModel](-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"), "managedObjectModel"));
    }
LABEL_39:
    if (-[NSMutableSet count](self->_insertedObjects, "count"))
    {
      if (hasEntityWithUniqueness)
        goto LABEL_46;
    }
    else
    {
      if (-[NSMutableSet count](self->_changedObjects, "count"))
        v24 = hasEntityWithUniqueness;
      else
        v24 = 0;
      if ((v24 & 1) != 0)
      {
LABEL_46:
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_insertedObjects);
        objc_msgSend(v25, "unionSet:", self->_changedObjects);
        v26 = (void *)objc_msgSend(v25, "allObjects");

        if ((*((_BYTE *)&self->_flags + 3) & 8) == 0)
        {
          v27 = (id)*((_QWORD *)self->_additionalPrivateIvars + 9);
          if (!v27)
          {
            v27 = -[NSConstraintValidator initWithManagedObjectContext:]([NSConstraintValidator alloc], self);
            *((_QWORD *)self->_additionalPrivateIvars + 9) = v27;
          }
          -[NSConstraintValidator registerObjects:]((uint64_t)v27, v26);
          v28 = (void *)-[NSConstraintValidator validateForSave]((uint64_t)v27);
          -[NSConstraintValidator reset]((uint64_t)v27);
          if (v28)
          {
            v40 = (void *)-[NSManagedObjectContext _generateOptLockExceptionForConstraintFailure:]((uint64_t)self, v28);
            objc_exception_throw(v40);
          }
        }
      }
    }
    v15 = 1;
    if (objc_msgSend(self->_parentObjectStore, "executeRequest:withContext:error:", v55, self, &v62))
    {
      parentObjectStore = self->_parentObjectStore;
      v30 = (void *)-[NSMutableSet allObjects](self->_insertedObjects, "allObjects");
      if (objc_msgSend(v30, "count"))
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v30, "count"));
        v32 = objc_msgSend(v30, "count");
        if (v32)
        {
          for (j = 0; j != v32; ++j)
          {
            v34 = (_DWORD *)objc_msgSend(v30, "objectAtIndex:", j);
            v35 = (void *)objc_msgSend(v34, "objectID");
            if ((objc_msgSend(v35, "isTemporaryID") & 1) == 0)
            {
              objc_msgSend(v31, "addObject:", v35);
              if (v34)
                v34[4] |= 0x200u;
            }
          }
        }
        objc_msgSend(parentObjectStore, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v31, -[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken"));

      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
      v56 = 0;
      v36 = 0;
      v15 = 0;
    }
    else
    {
      v36 = 1;
    }
    v37 = v62;
    objc_msgSend(v16, "drain");
    v38 = 0;
    v39 = v62;
    if ((v36 | 8) == 8)
      v36 = 0;
    if (v36)
      goto LABEL_69;
  }
  v36 = 0;
LABEL_69:
  v41 = v56;
  v42 = 1;
LABEL_70:
  v43 = v62;

  objc_msgSend(v53, "drain");
  if (v62)
  {
    v44 = v62;
    if (v54)
      *v54 = (NSError *)v62;
  }
  if (v41)
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);
  v45 = self->_flags;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&v45 & 0xFFFFFFFFEFFDFF77);
  if (v42)
    --self->_ignoreChangeNotification;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&v45 & 0xFFFFFFFFEFFDFF73 | v52 & 4);
  v8 = v36 == 0;
  if (!v36)
  {
    v46 = v62;
    v47 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[NSManagedObjectContext _didSaveChanges]((uint64_t)self);
    if ((*((_BYTE *)&self->_flags + 3) & 0x20) != 0)
      -[NSManagedObjectContext refreshAllObjects](self, "refreshAllObjects");
    objc_msgSend(v47, "drain");
    -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
    v48 = v62;
    v49 = (NSQueryGenerationToken *)*((_QWORD *)self->_additionalPrivateIvars + 12);
    if (-[NSQueryGenerationToken _isEnabled](v49, "_isEnabled")
      && v49 != +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"))
    {
      v50 = v49;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __31__NSManagedObjectContext_save___block_invoke;
      v57[3] = &unk_1E1EDD430;
      v57[4] = self;
      v57[5] = v49;
      +[_PFAutoreleasePoolThunk thunkWithBlock:]((uint64_t)_PFAutoreleasePoolThunk, v57);
    }
    if (self->_dispatchQueue)
      -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)self);
  }
  return v8;
}

- (BOOL)_allowAncillaryEntities
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (NSSaveChangesRequest)_newSaveRequestForCurrentState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSSaveChangesRequest *v7;
  NSSaveChangesRequest *v8;

  if (!a1)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
    v2 = *(_QWORD *)(a1 + 80);
  else
    v2 = 0;
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
    v3 = *(_QWORD *)(a1 + 96);
  else
    v3 = 0;
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
    v4 = *(_QWORD *)(a1 + 88);
  else
    v4 = 0;
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v5 = -[NSManagedObjectContext _newUnchangedLockedObjects](a1);
    if (objc_msgSend(v5, "count"))
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = -[NSSaveChangesRequest initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:]([NSSaveChangesRequest alloc], "initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:", v2, v3, v4, v6);
  v8 = v7;
  if ((*(_BYTE *)(a1 + 43) & 0x10) != 0)
    -[NSSaveChangesRequest _setSecureOperation:](v7, "_setSecureOperation:", 1);
  if (v5)

  return v8;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__NSManagedObjectContext__NestedContextSupport__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v4[3] = &unk_1E1EDD790;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  _perform((uint64_t)self, (uint64_t)v4);
}

- (id)executeRequest:(id)a3 withContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;

  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__12;
  v33 = __Block_byref_object_dispose__12;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__12;
  v27 = __Block_byref_object_dispose__12;
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__NSManagedObjectContext__NestedContextSupport__executeRequest_withContext_error___block_invoke;
  v22[3] = &unk_1E1EDD6B8;
  v22[4] = self;
  v22[5] = a3;
  v22[6] = a4;
  v22[7] = &v23;
  v22[8] = &v29;
  _perform((uint64_t)self, (uint64_t)v22);
  v7 = (id)v24[5];
  v8 = (id)v30[5];
  if (a5)
  {
    v9 = (void *)v24[5];
    if (v9)
      *a5 = v9;
  }
  if (objc_msgSend(a3, "requestType") != 4)
  {
    v10 = v24[5];
    if (v30[5])
    {
      if (!v10)
        goto LABEL_11;
    }
    else if (v10)
    {
      goto LABEL_11;
    }
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Either a non nil result OR an error in nexted context");
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, v21);
    v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error in nexted context", (uint8_t *)&v21, 2u);
    }
  }
LABEL_11:
  v19 = (void *)v30[5];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v19;
}

- (NSSet)insertedObjects
{
  void *v3;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedInserts, "count")+ -[NSMutableSet count](self->_insertedObjects, "count"));
  objc_msgSend(v3, "setSet:", self->_insertedObjects);
  objc_msgSend(v3, "unionSet:", self->_unprocessedInserts);
  return (NSSet *)v3;
}

- (NSSet)updatedObjects
{
  void *v3;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedChanges, "count")+ -[NSMutableSet count](self->_changedObjects, "count"));
  objc_msgSend(v3, "setSet:", self->_changedObjects);
  objc_msgSend(v3, "unionSet:", self->_unprocessedChanges);
  return (NSSet *)v3;
}

- (NSSet)deletedObjects
{
  void *v3;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableSet count](self->_unprocessedDeletes, "count")+ -[NSMutableSet count](self->_deletedObjects, "count"));
  objc_msgSend(v3, "setSet:", self->_deletedObjects);
  objc_msgSend(v3, "unionSet:", self->_unprocessedDeletes);
  return (NSSet *)v3;
}

- (id)mergePolicy
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (id)*((_QWORD *)self->_additionalPrivateIvars + 3);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  objc_opt_self();
  objc_opt_class();
  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    return;
  objc_opt_self();
  qword_1ECD8DA28 = (uint64_t)CFSTR("ImplicitObservation");
  objc_opt_class();
  _PF_Threading_Debugging_level = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.ConcurrencyDebug"));
  v3 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.Logging.oslog"));
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = -1;
  v5 = +[_PFRoutines stringValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.Logging.stderr"));
  if (!objc_msgSend(v5, "length"))
  {
    v6 = -1;
    if (v4 < 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v5, "intValue");
  if ((v4 & 0x80000000) == 0)
LABEL_8:
    _pflogging_enable_oslog = v4;
LABEL_9:
  if ((v6 & 0x80000000) == 0)
    _pflogging_enable_stderr = v6;
  byte_1ECD8DA22 = HIBYTE(dword_1ECD8DE18);
  _PF_shouldAsyncProcessReferenceQueue = BYTE2(dword_1ECD8DE18);
  _MergedGlobals_75 = dword_1ECD8DE20;
  byte_1ECD8DA21 = +[_PFRoutines insecureBoolValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.Toolchain.EnableToolchainBehaviors"));
  v7 = getprogname();
  if (v7)
  {
    v14 = v7;
    if (*v7)
    {
      if (!strncmp("CommCenter", v7, 0xAuLL))
        _PF_Threading_Debugging_level = 0;
      if (!strncmp("SpringBoard", v14, 0xBuLL))
        _PF_Threading_Debugging_level = 0;
      if (_PF_USE_IOS_PLATFORM == 1 && !strncmp("News", v14, 4uLL))
        byte_1ECD8DA23 = 1;
      if (!strncmp("assetsd", v14, 7uLL) || !strncmp("photolibraryd", v14, 0xDuLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_1ECD8DA24 = 1;
      }
      if (!strncmp("xctest", v14, 6uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 1;
        byte_1ECD8DA22 = 1;
      }
      if (!strncmp("accountsd", v14, 9uLL))
      {
        _PF_shouldAsyncProcessReferenceQueue = 0;
        byte_1ECD8DA24 = 1;
      }
      if (!strncmp("CalendarAgent", v14, 0xDuLL))
        byte_1ECD8DA24 = 1;
      if (!strncmp("soagent", v14, 7uLL))
        byte_1ECD8DA24 = 1;
      if (!strncmp("Music", v14, 5uLL))
      {
        byte_1ECD8DA22 = 0;
        _MergedGlobals_75 = 0;
      }
      if (!strncmp("Radio", v14, 5uLL))
      {
        byte_1ECD8DA22 = 0;
        _MergedGlobals_75 = 0;
      }
      if (!strncmp("Podcasts", v14, 8uLL))
        _MergedGlobals_75 = 0;
    }
  }
  if (!byte_1ECD8DA22)
    _MergedGlobals_75 = 0;
  if (_PF_Threading_Debugging_level >= 1)
    _NSCoreDataLog(4, (uint64_t)CFSTR("Core Data multi-threading assertions enabled."), v8, v9, v10, v11, v12, v13, v15);
}

- (uint64_t)_addObjectIDsUpdatedByTriggers:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v4 = *(void **)(*(_QWORD *)(v3 + 184) + 112);
      if (!v4)
      {
        *(_QWORD *)(*(_QWORD *)(v3 + 184) + 112) = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v4 = *(void **)(*(_QWORD *)(v3 + 184) + 112);
      }
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v9;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v9 != v6)
              objc_enumerationMutation(a2);
            objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
          }
          while (v5 != v7);
          result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_addObjectIDsUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v4 = *(void **)(*(_QWORD *)(v3 + 184) + 144);
      if (!v4)
      {
        *(_QWORD *)(*(_QWORD *)(v3 + 184) + 144) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v4 = *(void **)(*(_QWORD *)(v3 + 184) + 144);
      }
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v9;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v9 != v6)
              objc_enumerationMutation(a2);
            objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
          }
          while (v5 != v7);
          result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_addObjectIDsInsertUpdatedByDATriggers:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend(a2, "count");
    if (result)
    {
      v4 = *(void **)(*(_QWORD *)(v3 + 184) + 136);
      if (!v4)
      {
        *(_QWORD *)(*(_QWORD *)(v3 + 184) + 136) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v4 = *(void **)(*(_QWORD *)(v3 + 184) + 136);
      }
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v5 = result;
        v6 = *(_QWORD *)v9;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v9 != v6)
              objc_enumerationMutation(a2);
            objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
          }
          while (v5 != v7);
          result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v5 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (id)description
{
  id v3;
  objc_super v5;
  objc_super v6;

  v3 = (id)-[NSString copy](self->_contextLabel, "copy");
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSManagedObjectContext;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[NSManagedObjectContext description](&v6, sel_description), v3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSManagedObjectContext;
    return -[NSManagedObjectContext description](&v5, sel_description);
  }
}

- (void)_automaticallyMergeChangesFromContextDidSaveNotification:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__NSManagedObjectContext__automaticallyMergeChangesFromContextDidSaveNotification___block_invoke;
  v3[3] = &unk_1E1EDD430;
  v3[4] = self;
  v3[5] = a3;
  -[NSManagedObjectContext performBlock:](self, "performBlock:", v3);
}

- (void)performBlock:(void *)block
{
  if (!self->_dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only use -performBlock: on an NSManagedObjectContext that was created with a queue."), 0));
  -[NSManagedObjectContext performWithOptions:andBlock:](self, "performWithOptions:andBlock:", 8199, block);
}

- (BOOL)_performImmediate:(id)a3
{
  NSManagedObjectContext *v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *v6;
  NSManagedObjectContext *v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;
  _QWORD v11[2];
  uint64_t v12;
  NSManagedObjectContext *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only use -performBlockAndWait: on an NSManagedObjectContext that was created with a queue."), 0));
  v4 = self;
  v5 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  v6 = self;
  v11[0] = a3;
  v11[1] = v6;
  v12 = 0;
  v13 = v5;
  if (byte_1ECD8DA22)
    v12 = 4;
  if ((*((_BYTE *)&v4->_flags + 1) & 0x80) != 0)
  {
    if (_PFIsSerializedWithMainQueue())
    {
LABEL_20:
      developerSubmittedBlockToNSManagedObjectContextPerform(v11);
      return 1;
    }
  }
  else if (v5)
  {
    v7 = 0;
    __dmb(0xBu);
    v8 = v5;
    while (v8 != v4 && v8 != v7)
    {
      if (!v7)
        v7 = v8;
      v8 = (NSManagedObjectContext *)v8->_queueOwner;
      if (!v8)
      {
        v9 = 0;
        __dmb(0xBu);
        while (v4 != v5 && v4 != v9)
        {
          if (!v9)
            v9 = v4;
          v4 = (NSManagedObjectContext *)v4->_queueOwner;
          if (!v4)
            goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_20;
  }
LABEL_21:

  return 0;
}

void __61__NSManagedObjectContext__setQueryGenerationFromToken_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSQueryGenerationToken *v3;
  NSQueryGenerationToken *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSQueryGenerationToken *v9;
  id v10;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 96);
  if (*(void **)(a1 + 32) != v1)
  {
    v3 = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
    v4 = *(NSQueryGenerationToken **)(a1 + 32);
    if (v4)
      v5 = v3 == v4;
    else
      v5 = 1;
    if (v5
      || (v3 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), v3 == *(NSQueryGenerationToken **)(a1 + 32))|| (v3 = +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken"), v3 == *(NSQueryGenerationToken **)(a1 + 32)))
    {
      v9 = v3;
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
      v8 = *(id *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      if (v6)
      {
        if (v6 != *(_QWORD *)(v7 + 32))
        {
          v8 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
          v7 = *(_QWORD *)(a1 + 40);
        }
      }
      v10 = 0;
      if (!objc_msgSend(*(id *)(v7 + 32), "_validateQueryGeneration:error:", v8, &v10))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v10;
        goto LABEL_15;
      }
      v9 = (NSQueryGenerationToken *)v8;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 96) = v9;
LABEL_15:

  }
}

+ (NSManagedObjectContext)allocWithZone:(_NSZone *)a3
{
  return (NSManagedObjectContext *)_PFAllocateObject((Class)a1, 0);
}

- (BOOL)obtainPermanentIDsForObjects:(NSArray *)objects error:(NSError *)error
{
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  id v14;
  NSPersistentStoreCoordinator *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (!self->_parentObjectStore)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Context does not have a coordinator;  cannot obtain permenant ids without a coordinator."),
                               0));
  v7 = (void *)*((_QWORD *)self->_additionalPrivateIvars + 19);
  if (!v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(objects);
          v13 = *(id **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v13[5], "isTemporaryID")
            && (NSManagedObjectContext *)objc_msgSend(v13, "managedObjectContext") == self
            && (objc_msgSend(v13, "isDeleted") & 1) == 0)
          {
            objc_msgSend(v9, "addObject:", v13);
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](objects, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }
    if (!objc_msgSend(v9, "count"))
    {

      return 1;
    }
    v20 = 0;
    if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
      v8 = objc_msgSend(self->_parentObjectStore, "_parentObtainPermanentIDsForObjects:context:error:", v9, self, error);
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

      return v8;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v15 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
    -[NSManagedObjectContext lockObjectStore]((uint64_t)self);
    v16 = -[NSPersistentStoreCoordinator obtainPermanentIDsForObjects:error:](v15, "obtainPermanentIDsForObjects:error:", v9, &v20);
    -[NSManagedObjectContext unlockObjectStore]((uint64_t)self);

    v17 = v20;
    objc_msgSend(v14, "drain");
    if (!v20)
      return v16;
    v18 = v20;
    if (error)
      *error = (NSError *)v20;
    return 0;
  }
  if (!error)
    return 0;
  v8 = 0;
  *error = (NSError *)v7;
  return v8;
}

- (NSManagedObjectContext)init
{
  objc_opt_class();
  return -[NSManagedObjectContext initWithConcurrencyType:](self, "initWithConcurrencyType:", 0);
}

- (BOOL)tryLock
{
  NSManagedObjectContext *v3;
  NSManagedObjectContext *v4;
  NSManagedObjectContext *v5;
  int v6;
  NSManagedObjectContext *v7;
  NSManagedObjectContext *v8;
  BOOL v9;

  if (self->_dispatchQueue)
  {
    v3 = *(NSManagedObjectContext **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
    if (v3)
    {
      v4 = 0;
      __dmb(0xBu);
      v5 = v3;
      LOBYTE(v6) = 1;
      while (v5 != self && v5 != v4)
      {
        if (!v4)
          v4 = v5;
        v5 = (NSManagedObjectContext *)v5->_queueOwner;
        if (!v5)
        {
          v7 = 0;
          __dmb(0xBu);
          v8 = self;
          do
          {
            v9 = v8 == v3 || v8 == v7;
            LOBYTE(v6) = v9;
            if (v9)
              break;
            if (!v7)
              v7 = v8;
            v8 = (NSManagedObjectContext *)v8->_queueOwner;
          }
          while (v8);
          break;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
    if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
      LOBYTE(v6) = _PFIsSerializedWithMainQueue();
  }
  else
  {
    v6 = objc_msgSend(self->_lock, "tryLock");
    if (v6)
    {
      -[NSManagedObjectContext lock](self, "lock");
      objc_msgSend(self->_lock, "unlock");
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (void)_storeConfigurationChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSManagedObjectContext *v6;
  _BOOL4 v7;
  NSManagedObjectContext *v8;
  NSManagedObjectContext *v9;
  _QWORD v11[7];

  if (self
    && (*((_BYTE *)&self->_flags + 1) & 1) == 0
    && !-[NSManagedObjectContext _isDeallocating](self, "_isDeallocating"))
  {
    v4 = objc_msgSend(a3, "userInfo");
    if (v4)
      v5 = v4;
    else
      v5 = NSDictionary_EmptyDictionary;
    if (self->_dispatchQueue)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __95__NSManagedObjectContext__NSInternalNotificationHandling___sendOrEnqueueNotification_selector___block_invoke;
      v11[3] = &unk_1E1EDD8A8;
      v11[5] = v5;
      v11[6] = sel__processChangedStoreConfigurationNotification_;
      v11[4] = self;
      v6 = self;
      v7 = -[NSManagedObjectContext tryLock](self, "tryLock");
      v8 = self;
      if (v7)
      {
        -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v11);
        -[NSManagedObjectContext unlock](self, "unlock");
      }
      else
      {
        -[NSManagedObjectContext performBlock:](self, "performBlock:", v11);
      }

    }
    else
    {
      v9 = self;
      if (-[NSManagedObjectContext tryLock](self, "tryLock"))
      {
        if ((*((_BYTE *)&self->_flags + 1) & 1) == 0
          && !-[NSManagedObjectContext _isDeallocating](self, "_isDeallocating"))
        {
          -[NSManagedObjectContext performSelector:withObject:](self, "performSelector:withObject:", sel__processChangedStoreConfigurationNotification_, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5));
          -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);
        }
        -[NSManagedObjectContext unlock](self, "unlock");

      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D8], "defaultQueue"), "enqueueNotification:postingStyle:", a3, 2);

      }
    }
  }
}

- (void)unlock
{
  int lockCount;
  _QWORD *v3;
  BOOL v4;

  if (!self->_dispatchQueue)
  {
    lockCount = self->_lockCount;
    if (lockCount >= 1)
      self->_lockCount = --lockCount;
    if (_PF_Threading_Debugging_level)
    {
      v3 = (_QWORD *)*((_QWORD *)self->_additionalPrivateIvars + 7);
      if (v3)
        v4 = lockCount == 0;
      else
        v4 = 0;
      if (v4)
        v3[1] = *v3;
    }
    objc_msgSend(self->_lock, "unlock");
  }
}

- (void)lock
{
  if (!self->_dispatchQueue)
  {
    objc_msgSend(self->_lock, "lock");
    ++self->_lockCount;
    if (!self->_dispatchQueue && (*((_BYTE *)&self->_flags + 1) & 0x80) != 0 && !pthread_main_np())
    {
      -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self->_referenceQueue);
      *(_QWORD *)&self->_flags &= ~0x8000uLL;
    }
    if (_PF_Threading_Debugging_level)
    {
      if (*((_QWORD *)self->_additionalPrivateIvars + 7))
        *(_QWORD *)(*((_QWORD *)self->_additionalPrivateIvars + 7) + 8) = pthread_self();
    }
  }
}

- (void)_processChangedStoreConfigurationNotification:(id)a3
{
  void *v5;
  NSManagedObjectContext *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  const __CFAllocator *v19;
  CFArrayRef v20;
  CFArrayRef v21;
  _QWORD *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  size_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFIndex v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  _PFArray *v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  void *Value;
  _PFArray *v44;
  _PFArray *v45;
  _PFArray *v46;
  _PFArray *v47;
  _QWORD *v48;
  void *v49;
  const __CFAllocator *v50;
  const __CFDictionary *v51;
  NSSet *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  id **v57;
  int v58;
  CFIndex Count;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t k;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  uint64_t v77;
  void *v78;
  _PFArray *v79;
  uint64_t *v80;
  void *v81;
  id v82;
  _QWORD *v83;
  uint64_t *v84;
  _PFArray *v85;
  _QWORD *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  CFDictionaryValueCallBacks v95;
  void *v96;
  _BYTE v97[128];
  _BYTE v98[128];
  CFDictionaryKeyCallBacks v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = (void *)objc_msgSend(a3, "lastObject");
  v6 = self;
  v82 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("changedUUID"));
  if (v8)
  {
    v9 = v8;
    v81 = v5;
    v96 = 0;
    v10 = objc_msgSend(v8, "objectAtIndex:", 0);
    v11 = (_QWORD *)objc_msgSend(v9, "objectAtIndex:", 1);
    v85 = (_PFArray *)objc_msgSend(v9, "objectAtIndex:", 2);
    v12 = -[NSMutableSet count](self->_insertedObjects, "count");
    v13 = -[NSMutableSet count](self->_unprocessedInserts, "count");
    v14 = v13 + v12;
    if (v13 + v12)
    {
      v84 = &v77;
      MEMORY[0x1E0C80A78](v13);
      v16 = (char *)&v77 - v15;
      if (v14 > 0x200)
        v16 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v77 - v15, 8 * v14);
      -[NSMutableSet getObjects:](self->_insertedObjects, "getObjects:", v16);
      -[NSMutableSet getObjects:](self->_unprocessedInserts, "getObjects:", &v16[8 * -[NSMutableSet count](self->_insertedObjects, "count")]);
      v17 = 0;
      v86 = v11;
      do
      {
        v96 = *(void **)&v16[8 * v17];
        v18 = (void *)objc_msgSend(v96, "objectID");
        if (objc_msgSend(v18, "persistentStore") == v10)
        {
          if (objc_msgSend(v18, "isTemporaryID"))
          {
            objc_msgSend(v18, "_setPersistentStore:", v11);
          }
          else
          {
            v95.version = 0;
            v95.version = (CFIndex)-[NSTemporaryObjectID initWithEntity:]([NSTemporaryObjectID alloc], "initWithEntity:", objc_msgSend(v18, "entity"));
            objc_msgSend((id)v95.version, "_setPersistentStore:", v11);
            v127 = 0u;
            v128 = 0u;
            v125 = 0u;
            v126 = 0u;
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v100 = 0u;
            memset(&v99, 0, sizeof(v99));
            v19 = _PFStackAllocatorCreate((unint64_t *)&v99, 1024);
            v20 = CFArrayCreate(v19, (const void **)&v96, 1, 0);
            v21 = CFArrayCreate(v19, (const void **)&v95, 1, 0);
            v22 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](self, v20, v21);
            if (v22)
            {
              v23 = v22;
              objc_msgSend(v7, "addObject:", v22);

            }
            if (v99.copyDescription)
            {
              v11 = v86;
              if (v20)
                CFRelease(v20);
              if (v21)
                CFRelease(v21);
            }
            else
            {
              v99.retain = (CFDictionaryRetainCallBack)v99.version;
              v11 = v86;
            }

          }
        }
        ++v17;
      }
      while (v14 != v17);
      if (v14 >= 0x201)
        NSZoneFree(0, v16);
    }
    v24 = -[_PFArray count](v85, "count");
    v80 = &v77;
    v25 = MEMORY[0x1E0C80A78](v24);
    v28 = (char *)&v77 - v27;
    v29 = 8 * v26;
    if (v25 >= 0x402)
    {
      v28 = (char *)NSAllocateScannedUncollectable();
      v86 = (_QWORD *)NSAllocateScannedUncollectable();
      v84 = (uint64_t *)NSAllocateScannedUncollectable();
      v83 = (_QWORD *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v77 - v27, 8 * v26);
      MEMORY[0x1E0C80A78](v30);
      v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
      v86 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      MEMORY[0x1E0C80A78](v32);
      v84 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      MEMORY[0x1E0C80A78](v33);
      v83 = (uint64_t *)((char *)&v77 - v31);
      bzero((char *)&v77 - v31, v29);
      if (!v24)
      {
        v34 = 0;
        goto LABEL_35;
      }
    }
    v35 = 0;
    v36 = 0;
    v34 = 0;
    do
    {
      v37 = v24;
      v38 = v28;
      v39 = v85;
      v40 = -[_PFArray objectAtIndex:](v85, "objectAtIndex:", v35);
      v41 = v35 + 1;
      v42 = -[_PFArray objectAtIndex:](v39, "objectAtIndex:", v41);
      Value = (void *)_PFCMT_GetValue(&self->_infoByGID->super.isa, v40);
      v96 = Value;
      if (Value)
      {
        v84[v36] = (uint64_t)Value;
        v83[v36] = v42;
        objc_msgSend(v96, "_setVersionReference__:", 1);
        ++v36;
      }
      *(_QWORD *)&v38[8 * v34] = v40;
      v28 = v38;
      v86[v34++] = v42;
      v35 = v41 + 1;
      v24 = v37;
    }
    while (v35 < v37);
    if (v36)
    {
      v44 = [_PFArray alloc];
      v45 = -[_PFArray initWithObjects:count:andFlags:andContext:](v44, "initWithObjects:count:andFlags:andContext:", v84, v36, 48, self);
      v46 = [_PFArray alloc];
      v47 = -[_PFArray initWithObjects:count:andFlags:](v46, "initWithObjects:count:andFlags:", v83, v36, 0);
      v85 = v45;
      v79 = v47;
      v48 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](self, v45, v47);
      if (v48)
      {
        v49 = v48;
        objc_msgSend(v7, "addObject:", v48);

      }
      goto LABEL_36;
    }
LABEL_35:
    v79 = 0;
    v85 = 0;
LABEL_36:
    memset(&v99, 0, 24);
    *(_OWORD *)&v99.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
    v99.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
    memset(&v95, 0, 24);
    *(_OWORD *)&v95.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 24);
    v50 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v78 = v28;
    v51 = CFDictionaryCreate(v50, (const void **)v28, (const void **)v86, v34, &v99, &v95);
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v52 = -[NSManagedObjectContext registeredObjects](self, "registeredObjects");
    v53 = -[NSSet countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v92 != v55)
            objc_enumerationMutation(v52);
          v57 = *(id ***)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (v57)
            v58 = _insertion_fault_handler;
          else
            v58 = 0;
          _PFFaultHandlerFixRelationshipsPostMigration(v58, v57, (uint64_t)self, v51);
        }
        v54 = -[NSSet countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      }
      while (v54);
    }
    CFRelease(v51);

    if (v24 >= 0x402)
    {
      NSZoneFree(0, v78);
      NSZoneFree(0, v86);
      NSZoneFree(0, v84);
      NSZoneFree(0, v83);
    }
    v5 = v81;
  }
  Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  v60 = objc_msgSend(v5, "objectForKey:", CFSTR("removed"));
  if (v60)
  {
    v61 = (void *)v60;
    v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v63 = objc_msgSend(v61, "count");
    if (v63)
    {
      v64 = v63;
      for (j = 0; j != v64; ++j)
      {
        v66 = -[NSManagedObjectContext _retainedObjectsFromRemovedStore:](self, "_retainedObjectsFromRemovedStore:", objc_msgSend(v61, "objectAtIndex:", j));
        objc_msgSend(v62, "addObjectsFromArray:", v66);

      }
    }
    v67 = objc_msgSend(v62, "count");
    if (v67)
    {
      v68 = v67;
      if (v67 == Count)
        v69 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", NSArray_EmptyArray, CFSTR("invalidatedAll"), +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), CFSTR("managedObjectContext"), 0);
      else
        v69 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v62), CFSTR("invalidated"), +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), CFSTR("managedObjectContext"), 0);
      -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v69);
      for (k = 0; k != v68; ++k)
      {
        v71 = objc_msgSend(v62, "objectAtIndex:", k);
        if (v71)
          v72 = _insertion_fault_handler;
        else
          v72 = 0;
        -[NSFaultHandler turnObject:intoFaultWithContext:](v72, v71, (uint64_t)self);
        if (self)
          -[NSManagedObjectContext _forgetObject:propagateToObjectStore:removeFromRegistry:](self, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v71, 0, 1);
      }
    }

  }
  if (v7)
  {
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v73 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v88;
      do
      {
        for (m = 0; m != v74; ++m)
        {
          if (*(_QWORD *)v88 != v75)
            objc_enumerationMutation(v7);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * m));
        }
        v74 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v74);
    }
  }
  objc_msgSend(v82, "drain");
  -[NSManagedObjectContext _processReferenceQueue:]((uint64_t)self, 0);

}

void __31__NSManagedObjectContext_save___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3[23] + 96) == v2)
  {
    objc_msgSend(v3, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), 0);
    v2 = *(void **)(a1 + 40);
  }

}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)_setRetainsRegisteredObjects:(uint64_t)a1
{
  uint64_t v4;
  _QWORD *v5;

  if (a1)
  {
    if (_PFCMT_GetCount(*(_QWORD **)(a1 + 120)))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("An NSManagedObjectContext's retain policy cannot be changed while it has registered objects.  Trying using reset() first."), 0));
    if (((((*(_QWORD *)(a1 + 40) & 0x40) == 0) ^ a2) & 1) == 0)
    {
      v4 = 64;
      if (!a2)
        v4 = 0;
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 40) & 0xFFFFFFFFFFFFFFBFLL | v4;
      CFRelease(*(CFTypeRef *)(a1 + 120));
      v5 = -[_PFContextMapTable initWithWeaksReferences:]([_PFContextMapTable alloc], a2 ^ 1u);
      *(_QWORD *)(a1 + 120) = v5;
      -[_PFContextMapTable setForUseWithCoordinator:](v5, objc_msgSend((id)a1, "persistentStoreCoordinator"));
      CFRetain(*(CFTypeRef *)(a1 + 120));

    }
  }
}

- (void)setRetainsRegisteredObjects:(BOOL)retainsRegisteredObjects
{
  _BOOL4 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = retainsRegisteredObjects;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke;
    v5[3] = &unk_1E1EDE5B8;
    v5[4] = self;
    v6 = retainsRegisteredObjects;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    -[NSManagedObjectContext _setRetainsRegisteredObjects:]((uint64_t)self, v3);
  }
}

void __54__NSManagedObjectContext_setRetainsRegisteredObjects___block_invoke(uint64_t a1)
{
  -[NSManagedObjectContext _setRetainsRegisteredObjects:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)retainsRegisteredObjects
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)shouldDeleteInaccessibleFaults
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

void __33__NSManagedObjectContext_dealloc__block_invoke(uint64_t a1)
{
  _PFDeallocateObject(*(id *)(a1 + 32));
}

- (uint64_t)_startObservingUndoManagerNotifications
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 184) + 40))
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    return objc_msgSend(v2, "addObserver:selector:name:object:", v1, sel__undoManagerCheckpoint_, *MEMORY[0x1E0CB3398], *(_QWORD *)(*(_QWORD *)(v1 + 184) + 40));
  }
  return result;
}

- (NSUndoManager)undoManager
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (NSUndoManager *)*((_QWORD *)self->_additionalPrivateIvars + 5);
}

- (void)assignObject:(id)object toPersistentStore:(NSPersistentStore *)store
{
  void *v7;
  NSPersistentStoreCoordinator *v8;
  uint64_t modelMap;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (object)
    {
LABEL_3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(object, "objectID");
        if (objc_msgSend(v7, "isTemporaryID"))
        {
          v8 = -[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator");
          if (v8)
            modelMap = (uint64_t)v8->_modelMap;
          else
            modelMap = 0;
          if (objc_msgSend(-[_PFModelMap entitiesForContext:configuration:](modelMap, self, (uint64_t)-[NSPersistentStore configurationName](store, "configurationName")), "containsObject:", objc_msgSend(v7, "entity")))
          {
            objc_msgSend(v7, "_setPersistentStore:", store);
            return;
          }
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = *MEMORY[0x1E0C99778];
          v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSPersistentStore URL](store, "URL"), CFSTR("storeURL"), objc_msgSend((id)objc_msgSend(v7, "entity"), "name"), CFSTR("entityName"), v7, CFSTR("objectID"), 0);
          v12 = CFSTR("Can't assign an object to a store that does not contain the object's entity.");
        }
        else
        {
          v14 = (void *)MEMORY[0x1E0C99DA0];
          v15 = *MEMORY[0x1E0C99778];
          v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", -[NSPersistentStore URL](store, "URL"), CFSTR("newStoreURL"), objc_msgSend((id)objc_msgSend(v7, "persistentStore"), "URL"), CFSTR("originalStoreURL"), v7, CFSTR("objectID"), 0);
          v12 = CFSTR("Can't reassign an object to a different store once it has been saved.");
        }
        v10 = v14;
        v11 = v15;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        v12 = CFSTR("Parameter #1 to -assignObject:toPersistentStore: must be an NSManagedObject or subclass.");
        v13 = 0;
      }
      objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, v13));
    }
  }
  else if (object)
  {
    goto LABEL_3;
  }
}

- (BOOL)propagatesDeletesAtEndOfEvent
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setPropagatesDeletesAtEndOfEvent:(BOOL)propagatesDeletesAtEndOfEvent
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = propagatesDeletesAtEndOfEvent;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke;
    v6[3] = &unk_1E1EDE5B8;
    v6[4] = self;
    v7 = propagatesDeletesAtEndOfEvent;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = 2;
    if (!v3)
      v5 = 0;
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v5);
  }
}

uint64_t __59__NSManagedObjectContext_setPropagatesDeletesAtEndOfEvent___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) & 0xFFFFFFFFFFFFFFFDLL | (2 * *(unsigned __int8 *)(result + 40));
  return result;
}

- (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  if (a1)
    +[NSManagedObjectContext _handleError:withError:]((uint64_t)NSManagedObjectContext, a2, a3);
  return 0;
}

- (void)_thereIsNoSadnessLikeTheDeathOfOptimism
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  if (a1)
  {
    objc_opt_class();
    _NSCoreDataLog(1, (uint64_t)CFSTR("fatal: Unable to recover from optimistic locking failure.\n"), v1, v2, v3, v4, v5, v6, vars0);
    __break(1u);
  }
}

- (uint64_t)_generateOptLockExceptionForConstraintFailure:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  __objc2_class *v7;
  uint64_t v8;
  __objc2_class *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (objc_msgSend(a2, "code") == 1551)
    {
      v3 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("Conflicts"));
      v4 = *MEMORY[0x1E0C99768];
      v11 = CFSTR("conflictList");
      v12 = v3;
      v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v6 = CFSTR("constraint validation failure");
      v7 = _NSCoreDataOptimisticLockingException;
      v8 = v4;
    }
    else
    {
      v9 = (__objc2_class *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v13 = *MEMORY[0x1E0CB3388];
      v14[0] = a2;
      v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v6 = CFSTR("Attempting to generate a constraint exception for non constraint error.");
      v7 = v9;
      v8 = v10;
    }
    return -[__objc2_class exceptionWithName:reason:userInfo:](v7, "exceptionWithName:reason:userInfo:", v8, v6, v5);
  }
  return result;
}

- (void)_advanceQueryGenerationForSave
{
  uint64_t v2;
  char v3;
  void *v4;

  if (a1)
  {
    v2 = objc_msgSend(a1, "_retainedCurrentQueryGeneration:", a1[22]);
    if (v2)
    {
      objc_msgSend(a1, "_setQueryGenerationFromToken:error:", v2, 0);
      v3 = 1;
      v4 = (void *)v2;
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }

    if ((v3 & 1) == 0)
      objc_msgSend(a1, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
  }
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke(uint64_t result)
{
  id *v1;
  uint64_t v2;

  v1 = *(id **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 184) + 8);
  if (v1)
  {
    v2 = result;
    result = objc_msgSend(*v1, "objectForKey:", *(_QWORD *)(result + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

uint64_t __39__NSManagedObjectContext_objectWithID___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 32) + 184) + 8);
  if (v1)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 8), "objectForKey:", *(_QWORD *)(result + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 40) = result;
  }
  return result;
}

- (uint64_t)_checkObjectForExistenceAndCacheRow:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = (void *)objc_msgSend((id)a2, "objectID");
  v5 = *(_DWORD *)(a2 + 16);
  if (objc_msgSend(v4, "isTemporaryID") && (!*(_QWORD *)(a2 + 32) || (*(_BYTE *)(a1 + 42) & 8) == 0))
  {
    v11 = 0;
    objc_msgSend((id)a1, "stalenessInterval");
    return objc_msgSend((id)a2, "isFault");
  }
  v11 = 0;
  objc_msgSend((id)a1, "stalenessInterval");
  if ((v5 & 0x12) != 0)
    return objc_msgSend((id)a2, "isFault");
  v8 = v6;
  *(_QWORD *)(a1 + 144) = 0;
  -[NSManagedObjectContext lockObjectStore](a1);
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "newValuesForObjectWithID:withContext:error:", v4, a1, &v11);
  if (v9)
  {
    v7 = 1;

  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(a1 + 144) = v8;

  -[NSManagedObjectContext unlockObjectStore](a1);
  return v7;
}

_QWORD *__59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (v1)
  {
    result = objc_loadWeak((id *)(v1 + 8));
    if (result)
      return (_QWORD *)objc_msgSend(result, "_cancelProgress");
  }
  return result;
}

uint64_t __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[3];
  char v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[2];
  id v32;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v32 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "executeRequest:withContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &v32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  if (!v4)
  {
    *(_QWORD *)(v3 + 40) = 0;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  v5 = v4;
  v6 = v32;

  objc_msgSend(v2, "drain");
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v7)
    v8 = v7;
  if (v32)
  {
    v9 = v32;
    v10 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (v10)
      *v10 = v32;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = 0;
  }
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40))
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4;
    v20 = &unk_1E1EDE218;
    v24 = *(_BYTE *)(a1 + 96);
    v13 = *(_QWORD *)(a1 + 56);
    v25 = *(_WORD *)(a1 + 97);
    v14 = *(_QWORD *)(a1 + 88);
    v23[1] = v11;
    v23[2] = v14;
    v15 = v23;
    v21 = v13;
    v22 = v12;
  }
  else
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3;
    v29 = &unk_1E1EDE1F0;
    v31[1] = *(_QWORD *)(a1 + 88);
    v30 = v32;
    v15 = v31;
  }
  *v15 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v12, "performBlock:", v17, v18, v19, v20, v21, v22);
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  -[NSAsynchronousFetchResult setFinalResult:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setOperationError:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "completionBlock"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "completionBlock");
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

id __59__NSManagedObjectContext__executeAsynchronousFetchRequest___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  CFStringRef (__cdecl *v6)(const void *);
  uint64_t v7;
  __CFSet *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __CFSet *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
  void *v58;
  uint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v70;
  int v71;
  int v72;
  id v73;
  id v74;
  uint64_t v75;
  int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  CFSetCallBacks callBacks;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v1 = a1;
  v113 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)NSArray_EmptyArray;
  if (*(_BYTE *)(v1 + 72))
  {
    v73 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v2 = objc_msgSend(*(id *)(v1 + 32), "predicate");
    v70 = (void *)objc_msgSend(*(id *)(v1 + 32), "sortDescriptors");
    v3 = (void *)objc_msgSend(*(id *)(v1 + 32), "affectedStores");
    v4 = (void *)objc_msgSend(*(id *)(v1 + 32), "entity");
    if (objc_msgSend((id)objc_msgSend(v4, "subentitiesByName"), "count"))
    {
      v76 = objc_msgSend(*(id *)(v1 + 32), "includesSubentities");
      if (v2)
      {
LABEL_6:
        v74 = -[_NSMemoryStorePredicateRemapper createPredicateForFetchFromPredicate:withContext:](+[_NSMemoryStorePredicateRemapper defaultInstance](_NSMemoryStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:withContext:", v2, 0);
        v5 = v74;
LABEL_9:
        if (!objc_msgSend(v3, "count"))
          v3 = 0;
        callBacks.version = *MEMORY[0x1E0C9B3B0];
        *(_OWORD *)&callBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 8);
        v6 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B3B0] + 24);
        callBacks.hash = 0;
        callBacks.copyDescription = v6;
        callBacks.equal = 0;
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 56), "count");
        v8 = *(__CFSet **)(*(_QWORD *)(v1 + 40) + 96);
        v75 = v1;
        if (v7)
        {
          if (-[__CFSet count](v8, "count"))
          {
            v8 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v9 = *(void **)(*(_QWORD *)(v1 + 40) + 56);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v102;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v102 != v12)
                    objc_enumerationMutation(v9);
                  CFSetAddValue(v8, *(const void **)(*((_QWORD *)&v101 + 1) + 8 * i));
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
              }
              while (v11);
            }
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v14 = *(void **)(*(_QWORD *)(v75 + 40) + 96);
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v98;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v98 != v17)
                    objc_enumerationMutation(v14);
                  CFSetAddValue(v8, *(const void **)(*((_QWORD *)&v97 + 1) + 8 * j));
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
              }
              while (v16);
            }
            v71 = 1;
          }
          else
          {
            v71 = 0;
            v8 = *(__CFSet **)(*(_QWORD *)(v1 + 40) + 56);
          }
        }
        else
        {
          v71 = 0;
        }
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v19 = -[__CFSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v94;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v94 != v22)
                objc_enumerationMutation(v8);
              v24 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
              v25 = (void *)objc_msgSend(v24, "objectID");
              v26 = v25;
              if (!v3
                || objc_msgSend(v3, "indexOfObjectIdenticalTo:", objc_msgSend(v25, "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v27 = objc_msgSend(v24, "entity");
                if ((void *)v27 == v4 || v76 && objc_msgSend(v4, "_subentitiesIncludes:", v27))
                {
                  if (!v21)
                    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v75 + 56) + 8) + 40));
                  v28 = objc_msgSend(v74, "evaluateWithObject:", v24);
                  if (*(_BYTE *)(v75 + 73))
                    v29 = v24;
                  else
                    v29 = v26;
                  if (v28)
                    objc_msgSend(v21, "addObject:", v29);
                  else
                    objc_msgSend(v21, "removeObject:", v29);
                }
              }
            }
            v20 = -[__CFSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
          }
          while (v20);
        }
        else
        {
          v21 = 0;
        }
        if (v71)
          CFRelease(v8);
        v30 = objc_msgSend(*(id *)(*(_QWORD *)(v75 + 40) + 72), "count");
        v31 = *(_QWORD *)(v75 + 40);
        v32 = *(__CFSet **)(v31 + 80);
        if (v30)
        {
          if (objc_msgSend(*(id *)(v31 + 80), "count"))
          {
            v32 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &callBacks);
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v92 = 0u;
            v33 = *(void **)(*(_QWORD *)(v75 + 40) + 72);
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v90;
              do
              {
                for (m = 0; m != v35; ++m)
                {
                  if (*(_QWORD *)v90 != v36)
                    objc_enumerationMutation(v33);
                  CFSetAddValue(v32, *(const void **)(*((_QWORD *)&v89 + 1) + 8 * m));
                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
              }
              while (v35);
            }
            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            v38 = *(void **)(*(_QWORD *)(v75 + 40) + 80);
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v86;
              do
              {
                for (n = 0; n != v40; ++n)
                {
                  if (*(_QWORD *)v86 != v41)
                    objc_enumerationMutation(v38);
                  CFSetAddValue(v32, *(const void **)(*((_QWORD *)&v85 + 1) + 8 * n));
                }
                v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
              }
              while (v40);
            }
            v72 = 1;
          }
          else
          {
            v72 = 0;
            v32 = *(__CFSet **)(*(_QWORD *)(v75 + 40) + 72);
          }
        }
        else
        {
          v72 = 0;
        }
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v43 = -[__CFSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v82;
          do
          {
            for (ii = 0; ii != v44; ++ii)
            {
              if (*(_QWORD *)v82 != v45)
                objc_enumerationMutation(v32);
              v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * ii);
              v48 = (void *)objc_msgSend(v47, "objectID");
              v49 = v48;
              if (v3)
              {
                v50 = objc_msgSend(v48, "persistentStore");
                if (!v50 || objc_msgSend(v3, "indexOfObjectIdenticalTo:", v50) == 0x7FFFFFFFFFFFFFFFLL)
                  continue;
              }
              v51 = objc_msgSend(v47, "entity");
              if ((void *)v51 == v4 || v76 && objc_msgSend(v4, "_subentitiesIncludes:", v51))
              {
                if (objc_msgSend(v74, "evaluateWithObject:", v47))
                {
                  if (!v21)
                    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v75 + 56) + 8) + 40));
                  if (*(_BYTE *)(v75 + 73))
                    v52 = v47;
                  else
                    v52 = v49;
                  objc_msgSend(v21, "addObject:", v52);
                }
              }
            }
            v44 = -[__CFSet countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
          }
          while (v44);
        }
        if (v72)
          CFRelease(v32);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v1 = v75;
        v53 = *(void **)(*(_QWORD *)(v75 + 40) + 88);
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v78;
          do
          {
            for (jj = 0; jj != v55; ++jj)
            {
              if (*(_QWORD *)v78 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * jj);
              if (!v3
                || objc_msgSend(v3, "indexOfObjectIdenticalTo:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * jj), "objectID"), "persistentStore")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v59 = objc_msgSend(v58, "entity");
                if ((void *)v59 == v4 || v76 && objc_msgSend(v4, "_subentitiesIncludes:", v59))
                {
                  if (!v21)
                    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v75 + 56) + 8) + 40));
                  if (!*(_BYTE *)(v75 + 73))
                    v58 = (void *)objc_msgSend(v58, "objectID");
                  objc_msgSend(v21, "removeObject:", v58);
                }
              }
            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v106, 16);
          }
          while (v55);
        }
        if (v21)
        {
          v60 = (void *)objc_msgSend(v21, "allObjects");
          if (objc_msgSend(v70, "count") && *(_BYTE *)(v75 + 73) && *(_BYTE *)(v75 + 74))
            v60 = (void *)objc_msgSend(v60, "sortedArrayUsingDescriptors:", v70);

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v75 + 56) + 8) + 40) = v60;
        }
        objc_msgSend(v73, "drain");
        goto LABEL_119;
      }
    }
    else
    {
      v76 = 0;
      if (v2)
        goto LABEL_6;
    }
    v74 = (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    goto LABEL_9;
  }
LABEL_119:
  v61 = objc_msgSend(*(id *)(v1 + 32), "fetchLimit");
  if (v61)
  {
    v62 = v61;
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "count") > v61)
    {
      v63 = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "subarrayWithRange:", 0, v62);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40) = v63;
    }
  }
  v64 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "progress");
  if (v64)
  {
    v65 = (void *)v64;
    v66 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "count");
    v67 = objc_msgSend(v65, "completedUnitCount");
    objc_msgSend(v65, "setTotalUnitCount:", v66);
    if (v67 != v66)
      objc_msgSend(v65, "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40), "count"));
  }
  -[NSAsynchronousFetchResult setFinalResult:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40), "setOperationError:", 0);
  if (objc_msgSend(*(id *)(v1 + 48), "completionBlock"))
  {
    v68 = objc_msgSend(*(id *)(v1 + 48), "completionBlock");
    (*(void (**)(uint64_t, _QWORD))(v68 + 16))(v68, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40));
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 40);
}

- (void)rollback
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  v3 = -[NSManagedObjectContext propagatesDeletesAtEndOfEvent](self, "propagatesDeletesAtEndOfEvent");
  -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", 0);
  -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");

  *self->_additionalPrivateIvars = 0;
  if (-[NSMutableSet count](self->_changedObjects, "count")
    || -[NSMutableSet count](self->_insertedObjects, "count")
    || -[NSMutableSet count](self->_deletedObjects, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_changedObjects);
    objc_msgSend(v6, "unionSet:", self->_deletedObjects);
    v7 = objc_msgSend(v6, "count");
    v8 = v7;
    if (v7 <= 1)
      v9 = 1;
    else
      v9 = v7;
    if (v7 >= 0x201)
      v10 = 1;
    else
      v10 = v9;
    v11 = (char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v7 >= 0x201)
      v11 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v26 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v9);
    objc_msgSend(v6, "getObjects:", v11);
    if (v8)
    {
      for (i = 0; i != v8; ++i)
      {
        v13 = *(_QWORD **)&v11[8 * i];
        v14 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)self, v13);
        if (v14)
        {
          -[NSManagedObject _updateFromSnapshot:]((uint64_t)v13, v14);
          objc_msgSend(v13, "awakeFromSnapshotEvents:", 16);
        }
      }
      if (v8 >= 0x201)
        NSZoneFree(0, v11);
    }

    v15 = (void *)-[NSMutableSet allObjects](self->_changedObjects, "allObjects");
    v16 = (void *)-[NSMutableSet allObjects](self->_insertedObjects, "allObjects");
    v17 = objc_msgSend(v16, "count");
    if (v17)
    {
      for (j = 0; j != v17; ++j)
        -[NSManagedObjectContext deleteObject:](self, "deleteObject:", objc_msgSend(v16, "objectAtIndex:", j));
    }
    v19 = (void *)-[NSMutableSet allObjects](self->_deletedObjects, "allObjects");
    v20 = objc_msgSend(v19, "count");
    if (v20)
    {
      for (k = 0; k != v20; ++k)
        -[NSManagedObjectContext insertObject:](self, "insertObject:", objc_msgSend(v19, "objectAtIndex:", k));
    }
    if (objc_msgSend(v15, "count"))
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v15);
      objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("updated"));

    }
    if (objc_msgSend(v16, "count"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v16);
      objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("deleted"));

    }
    if (objc_msgSend(v19, "count"))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);
      objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("inserted"));

    }
    v25 = 0;
    if (objc_msgSend(v5, "count"))
    {
      if (byte_1ECD8DE1E)
        objc_msgSend(v5, "setObject:forKey:", +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)self), CFSTR("managedObjectContext"));
      -[NSManagedObjectContext _postObjectsDidChangeNotificationWithUserInfo:]((uint64_t)self, v5);
    }

    objc_msgSend(v4, "drain");
    -[NSManagedObjectContext processPendingChanges](self, "processPendingChanges");
    -[NSManagedObjectContext _resetAllChanges](self);
    -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", v3);
  }
  else
  {
    -[NSManagedObjectContext setPropagatesDeletesAtEndOfEvent:](self, "setPropagatesDeletesAtEndOfEvent:", v3);
  }
}

- (void)undo
{
  id v3;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  if (*((_QWORD *)self->_additionalPrivateIvars + 5))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    objc_msgSend(self->_additionalPrivateIvars[5], "undo");
    objc_msgSend(v3, "drain");
  }
}

- (void)redo
{
  id v3;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  -[NSManagedObjectContext discardEditing](self, "discardEditing");
  if (*((_QWORD *)self->_additionalPrivateIvars + 5))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    objc_msgSend(self->_additionalPrivateIvars[5], "redo");
    objc_msgSend(v3, "drain");
  }
}

- (NSManagedObjectContext)initWithCoder:(id)a3
{
  id v5;
  int v6;
  int v7;
  NSObject *current_queue;
  char v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  float v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  objc_super v21;

  objc_opt_class();
  v21.receiver = self;
  v21.super_class = (Class)NSManagedObjectContext;
  v5 = -[NSManagedObjectContext init](&v21, sel_init);
  if (!v5)
    return (NSManagedObjectContext *)v5;
  v6 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSConcurrencyType"));
  v7 = v6;
  if (v6 == 2)
  {
    v9 = 3;
  }
  else if (v6 == 1)
  {
    v9 = 2;
  }
  else
  {
    v9 = !v6
      && (byte_1ECD8DA24 & 1) == 0
      && (current_queue = dispatch_get_current_queue(), pthread_main_np())
      && (current_queue == dispatch_get_global_queue(0, 0) || current_queue == MEMORY[0x1E0C80D38]);
  }
  v10 = -[NSManagedObjectContext _initWithParentObjectStore:](v5, v9);
  if (v5 != (id)v10)
  {
    v11 = (void *)v10;

    v5 = v11;
    if (!v11)
      return (NSManagedObjectContext *)v5;
  }
  if (v7 == 2)
  {
    v13 = MEMORY[0x1E0C80D38];
    *((_QWORD *)v5 + 3) = MEMORY[0x1E0C80D38];
    if (!dispatch_queue_get_specific(v13, "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
    {
      v14 = (void *)objc_opt_class();
      dispatch_queue_set_specific(MEMORY[0x1E0C80D38], "com.apple.CoreData.NSManagedObjectContext.mainQueue", v14, 0);
      v13 = *((_QWORD *)v5 + 3);
    }
    dispatch_retain(v13);
    v12 = *((_QWORD *)v5 + 5) & 0xFFFFFFFFFFBFFFFFLL;
    goto LABEL_21;
  }
  if (v7 == 1)
  {
    *((_QWORD *)v5 + 3) = createQueueForMOC((id *)v5);
    v12 = *((_QWORD *)v5 + 5) | 0x400000;
LABEL_21:
    *((_QWORD *)v5 + 5) = v12;
  }
  *((_QWORD *)v5 + 1) = 0;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("NSFetchTimestamp"));
  *((double *)v5 + 18) = v15;
  v16 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSRetainsRegisteredObjects"));
  v17 = 64;
  if (!v16)
    v17 = 0;
  *((_QWORD *)v5 + 5) = *((_QWORD *)v5 + 5) & 0xFFFFFFFFFFFFFFBFLL | v17;
  v18 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSPropagatesDeleted"));
  v19 = 2;
  if (!v18)
    v19 = 0;
  *((_QWORD *)v5 + 5) = *((_QWORD *)v5 + 5) & 0xFFFFFFFFFFFFFFFDLL | v19;
  objc_msgSend(v5, "setMergePolicy:", objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSMergePolicy")));
  return (NSManagedObjectContext *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  double fetchTimestamp;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  fetchTimestamp = self->_fetchTimestamp;
  *(float *)&fetchTimestamp = fetchTimestamp;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSFetchTimestamp"), fetchTimestamp);
  objc_msgSend(a3, "encodeBool:forKey:", (*(_QWORD *)&self->_flags >> 6) & 1, CFSTR("NSRetainsRegisteredObjects"));
  objc_msgSend(a3, "encodeBool:forKey:", (*(_QWORD *)&self->_flags >> 1) & 1, CFSTR("NSPropagatesDeleted"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSManagedObjectContext mergePolicy](self, "mergePolicy"), CFSTR("NSMergePolicy"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSManagedObjectContext concurrencyType](self, "concurrencyType"), CFSTR("NSConcurrencyType"));
}

- (void)detectConflictsForObject:(NSManagedObject *)object
{
  NSManagedObjectContext *cd_managedObjectContext;

  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    if (!object)
      goto LABEL_6;
  }
  else if (!object)
  {
    goto LABEL_6;
  }
  if ((object->_cd_stateFlags & 0x80) == 0)
  {
    cd_managedObjectContext = object->_cd_managedObjectContext;
    goto LABEL_7;
  }
LABEL_6:
  cd_managedObjectContext = 0;
LABEL_7:
  if (cd_managedObjectContext == self)
  {
    if (-[NSManagedObject isFault](object, "isFault"))
      -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, object, (uint64_t)self);
    -[NSMutableSet addObject:](self->_lockedObjects, "addObject:", object);
  }
  else if (cd_managedObjectContext)
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An NSManagedObjectContext cannot detect conflicts for objects in other contexts."), 0));
  }
}

void __34__NSManagedObjectContext_setName___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  id parentObjectStore;

  parentObjectStore = self->_parentObjectStore;
  if (!parentObjectStore)
    return +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken", a3);
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
    return +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken", a3);
  return (id)objc_msgSend(parentObjectStore, "_retainedCurrentQueryGeneration:", a3);
}

- (id)_changeTrackingToken__
{
  return self->_additionalPrivateIvars[15];
}

- (NSQueryGenerationToken)queryGenerationToken
{
  uint64_t *v2;
  id v3;
  char v4;
  void *v5;
  NSQueryGenerationToken *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  NSManagedObjectContext *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __46__NSManagedObjectContext_queryGenerationToken__block_invoke;
  v11 = &unk_1E1EDD618;
  v12 = self;
  v13 = &v14;
  if (self->_dispatchQueue)
  {
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", &v8);
    v2 = v15;
  }
  else
  {
    v3 = (id)-[NSManagedObjectContext _queryGenerationToken](self, "_queryGenerationToken", v8, v9, v10, v11, v12, v13, v14);
    v2 = v15;
    v15[5] = (uint64_t)v3;
  }
  v4 = objc_msgSend((id)v2[5], "_isEnabled", v8, v9, v10, v11, v12, v13, v14);
  v5 = (void *)v15[5];
  if ((v4 & 1) == 0)
  {

    v5 = 0;
    v15[5] = 0;
  }
  v6 = v5;
  _Block_object_dispose(&v14, 8);
  return v6;
}

id __46__NSManagedObjectContext_queryGenerationToken__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_queryGenerationToken");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)objectDidBeginEditing:(id)a3
{
  const __CFArray *v5;
  CFRange v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((_QWORD *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v5 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  }
  v6.length = CFArrayGetCount(v5);
  v6.location = 0;
  if (CFArrayGetFirstIndexOfValue(v5, v6, a3) == -1)
  {
    CFArrayAppendValue(v5, a3);
    if ((*((_BYTE *)&self->_flags + 1) & 0x40) == 0 && CFArrayGetCount(v5) >= 1)
    {
      -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEditing"));
      *(_QWORD *)&self->_flags |= 0x4000uLL;
      -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEditing"));
    }
  }
}

- (void)objectDidEndEditing:(id)a3
{
  const __CFArray *v5;
  CFIndex FirstIndexOfValue;
  CFRange v7;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v5 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (!v5)
  {
    *((_QWORD *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v5 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  }
  v7.length = CFArrayGetCount(v5);
  v7.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v7, a3);
  if (FirstIndexOfValue != -1)
  {
    CFArrayRemoveValueAtIndex(v5, FirstIndexOfValue);
    if ((*((_BYTE *)&self->_flags + 1) & 0x40) != 0 && !CFArrayGetCount(v5))
    {
      -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isEditing"));
      *(_QWORD *)&self->_flags &= ~0x4000uLL;
      -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isEditing"));
    }
  }
}

- (BOOL)commitEditingAndReturnError:(id *)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[NSManagedObjectContext commitEditing](self, "commitEditing");
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
    if (v5)
    {
      if (a3)
        *a3 = v5;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
      v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
        v17 = 1024;
        v18 = 4609;
        _os_log_fault_impl(&dword_18A253000, v13, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v4;
}

- (BOOL)commitEditing
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  int v6;
  BOOL v8;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v3 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (!v3)
  {
    *((_QWORD *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v3 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  }
  if (-[NSManagedObjectContext isEditing](self, "isEditing")
    && (Count = CFArrayGetCount(v3), v5 = Count - 1, Count >= 1))
  {
    do
    {
      v6 = objc_msgSend((id)CFArrayGetValueAtIndex(v3, v5), "commitEditing");
      v8 = v5-- != 0;
    }
    while (v6 && v8);
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (uint64_t)_sendCommitEditingSelectorToTarget:(uint64_t)a3 sender:(uint64_t)a4 selector:(char)a5 flag:(uint64_t)a6 contextInfo:(int)a7 delayed:
{
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = a3;
  v12 = a5;
  v11 = a6;
  if (result)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", objc_msgSend(a2, "methodSignatureForSelector:", a4));
    objc_msgSend(v10, "setSelector:", a4);
    objc_msgSend(v10, "setArgument:atIndex:", &v13, 2);
    objc_msgSend(v10, "setArgument:atIndex:", &v12, 3);
    objc_msgSend(v10, "setArgument:atIndex:", &v11, 4);
    if (a7)
      return objc_msgSend(v10, "performSelector:withObject:afterDelay:inModes:", sel_invokeWithTarget_, a2, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C9B270]), 0.0);
    else
      return objc_msgSend(v10, "invokeWithTarget:", a2);
  }
  return result;
}

- (void)commitEditingWithDelegate:(id)a3 didCommitSelector:(SEL)a4 contextInfo:(void *)a5
{
  _QWORD *v9;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  v9 = PF_CALLOC_SCANNED_BYTES(0x18uLL);
  *v9 = a3;
  v9[1] = a4;
  v9[2] = a5;
  -[NSManagedObjectContext _sendCommitEditingSelectorToTarget:sender:selector:flag:contextInfo:delayed:]((uint64_t)self, self, 0, (uint64_t)sel__managedObjectContextEditor_didCommit_contextInfo_, 1, (uint64_t)v9, 1);
}

- (void)_managedObjectContextEditor:(id)a3 didCommit:(BOOL)a4 contextInfo:(id *)a5
{
  _BOOL4 v6;
  const __CFArray *v8;
  CFIndex Count;
  malloc_zone_t *v10;

  v6 = a4;
  v8 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
  if (v8)
  {
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    *((_QWORD *)self->_additionalPrivateIvars + 4) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
    v8 = (const __CFArray *)*((_QWORD *)self->_additionalPrivateIvars + 4);
    if (!v6)
      goto LABEL_8;
  }
  if (-[NSManagedObjectContext isEditing](self, "isEditing", a3))
  {
    Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      objc_msgSend((id)CFArrayGetValueAtIndex(v8, Count - 1), "commitEditingWithDelegate:didCommitSelector:contextInfo:", self, sel__managedObjectContextEditor_didCommit_contextInfo_, a5);
      return;
    }
  }
LABEL_8:
  -[NSManagedObjectContext _sendCommitEditingSelectorToTarget:sender:selector:flag:contextInfo:delayed:]((uint64_t)self, a5->var0, (uint64_t)self, (uint64_t)a5->var1, v6, (uint64_t)a5->var2, 0);
  v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v10 = malloc_default_zone();
  malloc_zone_free(v10, a5);
}

- (void)_forceMoveInsertToUpdatedList:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
      a2[4] &= 0xFFFFFFED;
    objc_msgSend(*(id *)(a1 + 72), "removeObject:", a2);
    objc_msgSend(*(id *)(a1 + 80), "removeObject:", a2);
    _PFFastMOCObjectWillChange(a1, a2);
  }
}

- (void)_newUnchangedLockedObjects
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  id *v7;
  uint64_t v8;
  _BYTE *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 104), "count");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v2);
  MEMORY[0x1E0C80A78](v3);
  v6 = (id *)((char *)v11 - v5);
  if ((unint64_t)v2 > 0x200)
    v6 = (id *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v11 - v5, 8 * v4);
  objc_msgSend(*(id *)(a1 + 104), "getObjects:", v6);
  if (v2 >= 1)
  {
    v7 = v6;
    v8 = v2;
    do
    {
      v9 = *v7;
      if ((objc_msgSend(*v7, "hasChanges") & 1) == 0)
      {
        objc_msgSend(v3, "addObject:", v9);
        if ((v9[17] & 0x80) != 0)
          -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, v9, a1);
      }
      ++v7;
      --v8;
    }
    while (v8);
  }
  if ((unint64_t)v2 >= 0x201)
    NSZoneFree(0, v6);
  return v3;
}

- (void)_unlimitRequest:(void *)a1
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend((id)objc_msgSend(a1, "substitutionVariables"), "mutableCopy");
    objc_msgSend(v2, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0), CFSTR("FETCH_REQUEST_LIMIT_SUBSTITUTION"));
    objc_msgSend(a1, "setSubstitutionVariables:", v2);

  }
  else
  {
    objc_msgSend(a1, "setFetchLimit:", 0);
  }
}

- (void)_forceRegisterLostFault:(uint64_t)a1
{
  void *v4;
  const void *Value;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    v4 = (void *)objc_msgSend(a2, "objectID");
    Value = _PFCMT_GetValue(*(_QWORD **)(a1 + 120), v4);
    if (Value)
      v6 = Value == a2;
    else
      v6 = 1;
    if (v6)
    {
      -[NSManagedObjectContext _registerObject:withID:](a1, (uint64_t)a2, v4);
    }
    else
    {
      objc_msgSend(a2, "managedObjectContext");
      _NSCoreDataLog(1, (uint64_t)CFSTR("fatal: Failed to re-registered lost fault. fault %p with oid %@ has a moc of %p but we expected %p\n"), v7, v8, v9, v10, v11, v12, (uint64_t)a2);
      __break(1u);
    }
  }
}

+ (uint64_t)_handleError:(uint64_t *)a3 withError:
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!a3)
    return 0;
  v5 = (void *)objc_msgSend(a2, "userInfo");
  v6 = objc_msgSend(v5, "objectForKey:", CFSTR("NSCoreDataPrimaryError"));
  if (v6)
  {
    *a3 = v6;
    return 0;
  }
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setObject:forKey:", a2, CFSTR("NSUnderlyingException"));
    if (a2)
      goto LABEL_6;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a2, CFSTR("NSUnderlyingException"), 0);
    if (a2)
    {
LABEL_6:
      if (a2[5])
        v9 = a2[5];
      else
        v9 = 134060;
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v9, v8);
  if (v10)
  {
    *a3 = v10;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m");
    v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSManagedObjectContext.m";
      v22 = 1024;
      v23 = 6278;
      _os_log_fault_impl(&dword_18A253000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }

  return 0;
}

- (id)_retainedObjectsFromRemovedStore:(id)a3
{
  unint64_t Count;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void **v9;
  unint64_t v10;
  void *v11;
  id *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  Count = _PFCMT_GetCount(&self->_infoByGID->super.isa);
  v6 = Count;
  if (Count <= 1)
    v7 = 1;
  else
    v7 = Count;
  if (Count >= 0x201)
    v8 = 1;
  else
    v8 = v7;
  v9 = (const void **)((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (Count > 0x200)
    v9 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v7);
  v10 = -[_PFContextMapTable getAllObjects:]((unint64_t)self->_infoByGID, v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  if (v10)
  {
    v12 = (id *)v9;
    do
    {
      v13 = *v12;
      if ((id)objc_msgSend((id)objc_msgSend(*v12, "objectID"), "persistentStore") == a3)
        objc_msgSend(v11, "addObject:", v13);
      ++v12;
      --v10;
    }
    while (v10);
  }
  if (v6 >= 0x201)
    NSZoneFree(0, v9);
  return v11;
}

- (void)_setDisableDiscardEditing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)_disableDiscardEditing
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (void)_persistentStoreDidUpdateAdditionalRows:(void *)a1
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  id v10;

  if (a1)
  {
    v4 = objc_msgSend(a2, "count");
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = objc_msgSend(a2, "objectAtIndex:", i);
        v7 = (_DWORD *)objc_msgSend(a1, "objectRegisteredForID:", v6);
        if (v7)
        {
          v8 = v7;
          if (objc_msgSend(v7, "hasChanges"))
            objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Objects should not be both modified and additional"), 0));
          v9 = v8[4];
          if ((v9 & 0x200) == 0)
            v8[4] = v9 | 0x200;
          objc_msgSend(a1, "refreshObject:mergeChanges:", v8, 0);
        }
        else
        {
          objc_msgSend(v10, "addObject:", v6);
        }
      }
    }
    if (objc_msgSend(v10, "count"))
      -[NSManagedObjectContext _informParentStoreNoLongerInterestedInObjectIDs:generation:]((uint64_t)a1, v10, objc_msgSend(a1, "queryGenerationToken"));

  }
}

- (void)_setFaultingError:(id)a3
{
  id v5;

  if (self->_additionalPrivateIvars[19] != a3)
  {
    v5 = a3;

    *((_QWORD *)self->_additionalPrivateIvars + 19) = a3;
  }
}

- (void)_undoInsertions:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSManagedObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self)
    ++self->_ignoreChangeNotification;
  v5 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = (NSManagedObject *)objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_msgSend(v6, "objectAtIndex:", i);
      if (!-[NSManagedObject managedObjectContext](v10, "managedObjectContext"))
        v10 = -[NSManagedObjectContext objectWithID:](self, "objectWithID:", -[NSManagedObject objectID](v10, "objectID"));
      if (v11 != (void *)NSKeyValueCoding_NullValue)
        -[NSManagedObject _updateFromUndoSnapshot:](v10, v11);
      -[NSManagedObjectContext deleteObject:](self, "deleteObject:", v10);
    }
  }
  if (self)
    --self->_ignoreChangeNotification;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "awakeFromSnapshotEvents:", 2);
      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }
}

- (void)_undoDeletionsMovedToUpdates:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      -[NSManagedObjectContext deleteObject:](self, "deleteObject:", v8);
      objc_msgSend(v8, "awakeFromSnapshotEvents:", 4);
    }
  }
}

- (void)_undoDeletions:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int undoTransactionID;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _DWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self)
    ++self->_ignoreChangeNotification;
  v5 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 0), "objectAtIndex:", 0);
  v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 2), "objectAtIndex:", 1);
  v8 = (void *)objc_msgSend(a3, "objectAtIndex:", 3);
  if (v7 == NSKeyValueCoding_NullValue)
    v9 = 0;
  else
    v9 = (void *)v7;
  undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  if (undoTransactionID == (unsigned __int16)objc_msgSend(v8, "shortValue"))
    v11 = v9;
  else
    v11 = 0;
  if (v11)
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v12 = 0;
  v13 = objc_msgSend(v5, "count");
  if (!v13)
    goto LABEL_30;
  v14 = v13;
  v24 = v12;
  for (i = 0; i != v14; ++i)
  {
    v16 = (_DWORD *)objc_msgSend(v5, "objectAtIndex:", i, v24);
    v17 = (void *)objc_msgSend(v6, "objectAtIndex:", i);
    if (v11)
      v18 = objc_msgSend(v11, "objectAtIndex:", i);
    else
      v18 = 0;
    -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)v16, (void *)objc_msgSend(v16, "objectID"));
    if (v17 != (void *)NSKeyValueCoding_NullValue)
    {
      -[NSManagedObject _updateFromUndoSnapshot:](v16, v17);
      v17 = (void *)objc_msgSend(v25, "objectAtIndex:", i);
      if ((void *)NSKeyValueCoding_NullValue != v17)
      {
        -[NSManagedObject _setLastSnapshot__:](v16, v17);
        v17 = (void *)NSKeyValueCoding_NullValue;
      }
    }
    if (v18 && (void *)v18 != v17 && (objc_msgSend((id)objc_msgSend(v16, "objectID"), "isTemporaryID") & 1) == 0)
    {
      if (v16)
      {
        v16[4] &= 0xFFFFFFDB;
        -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", v16);
        -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", v16);
        v16[4] &= 0xFFFFFFED;
      }
      else
      {
        -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", 0);
        -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", 0);
      }
      -[NSMutableSet removeObject:](self->_unprocessedInserts, "removeObject:", v16);
      _PFFastMOCObjectWillChange((uint64_t)self, v16);
      objc_msgSend(v24, "addObject:", v16);
    }
  }
  v12 = v24;
  if (self)
LABEL_30:
    --self->_ignoreChangeNotification;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "awakeFromSnapshotEvents:", 4);
      }
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(self->_additionalPrivateIvars[5], "registerUndoWithTarget:selector:object:", self, sel__undoDeletionsMovedToUpdates_, v12);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    -[NSManagedObjectContext _createAndPostChangeNotification:deletions:updates:refreshes:deferrals:wasMerge:](self, v23, 0, 0, 0, 0, 0);

  }
}

- (void)_undoUpdates:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSManagedObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self)
    ++self->_ignoreChangeNotification;
  v5 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  v6 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = (NSManagedObject *)objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_msgSend(v6, "objectAtIndex:", i);
      if (!-[NSManagedObject managedObjectContext](v10, "managedObjectContext"))
        v10 = -[NSManagedObjectContext objectWithID:](self, "objectWithID:", -[NSManagedObject objectID](v10, "objectID"));
      if (v11 != (void *)NSKeyValueCoding_NullValue)
      {
        _PFFastMOCObjectWillChange((uint64_t)self, v10);
        -[NSManagedObject _updateFromUndoSnapshot:](v10, v11);
      }
    }
  }
  if (self)
    --self->_ignoreChangeNotification;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "awakeFromSnapshotEvents:", 8);
      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }
}

- (void)_forceInsertionForObject:(id)a3
{
  int v5;
  void *v6;
  id v7;

  if (a3)
  {
    v5 = *((_DWORD *)a3 + 4);
    if ((v5 & 0x24) != 0)
    {
      -[NSMutableSet removeObject:](self->_unprocessedDeletes, "removeObject:", a3);
      -[NSMutableSet removeObject:](self->_deletedObjects, "removeObject:", a3);
      v5 = *((_DWORD *)a3 + 4);
    }
    if ((v5 & 9) != 0)
    {
      -[NSMutableSet removeObject:](self->_unprocessedChanges, "removeObject:", a3);
      -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", a3);
      v5 = *((_DWORD *)a3 + 4);
    }
    *((_DWORD *)a3 + 4) = v5 & 0xFFFFFFC0;
  }
  v6 = (void *)objc_msgSend(a3, "objectID");
  -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](self, (uint64_t)a3, v6);
  -[NSMutableSet addObject:](self->_insertedObjects, "addObject:", a3);
  if (a3)
    *((_DWORD *)a3 + 4) |= 0x10u;
  v7 = *self->_additionalPrivateIvars;
  if (v7)
    objc_msgSend(v7, "removeObject:", v6);
}

- (void)_clearChangedThisTransaction:(id)a3
{
  void *v5;
  int undoTransactionID;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t i;
  uint64_t v14;
  _BOOL4 v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[NSManagedObjectContext _processRecentChanges:]((uint64_t)self, 0);
  v5 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
  undoTransactionID = (unsigned __int16)self->_undoTransactionID;
  if (undoTransactionID == (unsigned __int16)objc_msgSend(v5, "shortValue"))
  {
    v7 = (void *)objc_msgSend(a3, "objectAtIndex:", 1);
    v8 = -[NSMutableSet count](self->_changedObjects, "count");
    if (v8)
    {
      v9 = v8;
      v10 = MEMORY[0x1E0C80A78](v8);
      v12 = (char *)v16 - v11;
      if (v10 > 0x200)
        v12 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)v16 - v11, 8 * v10);
      -[NSMutableSet getObjects:](self->_changedObjects, "getObjects:", v12);
      for (i = 0; i != v9; ++i)
      {
        v14 = *(_QWORD *)&v12[8 * i];
        if ((objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
        {
          if (v14)
            *(_DWORD *)(v14 + 16) &= ~8u;
          -[NSMutableSet removeObject:](self->_changedObjects, "removeObject:", v14);
        }
      }
      if (v9 >= 0x201)
        NSZoneFree(0, v12);
    }
  }
  *(_QWORD *)&self->_flags &= ~0x20uLL;
  v15 = -[NSMutableSet count](self->_insertedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedInserts, "count")
     || -[NSMutableSet count](self->_deletedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedDeletes, "count")
     || -[NSMutableSet count](self->_changedObjects, "count")
     || -[NSMutableSet count](self->_unprocessedChanges, "count") != 0;
  if (((*(_DWORD *)&self->_flags >> 11) & 1) != v15)
  {
    -[NSManagedObjectContext willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hasChanges"));
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)v15 << 11));
    -[NSManagedObjectContext didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hasChanges"));
  }
}

- (void)_undoManagerCheckpoint:(id)a3
{
  void *dispatchQueue;
  _BOOL4 v5;
  _QWORD v6[5];

  if ((*((_BYTE *)&self->_flags + 1) & 0x10) == 0)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, sel__processEndOfEventNotification_);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke;
    v6[3] = &unk_1E1EDD520;
    v6[4] = self;
    dispatchQueue = self->_dispatchQueue;
    v5 = -[NSManagedObjectContext tryLock](self, "tryLock", a3);
    if (!dispatchQueue)
    {
      if (!v5)
        return;
      __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke((uint64_t)v6);
      goto LABEL_9;
    }
    if (v5)
    {
      -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
LABEL_9:
      -[NSManagedObjectContext unlock](self, "unlock");
      return;
    }
    -[NSManagedObjectContext performBlock:](self, "performBlock:", v6);
  }
}

uint64_t __90__NSManagedObjectContext__NSInternalNotificationHandling___processEndOfEventNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  id v3;

  result = *(_QWORD *)(a1 + 32);
  if (result && (*(_BYTE *)(result + 41) & 1) == 0)
  {
    result = objc_msgSend((id)result, "_isDeallocating");
    if ((result & 1) == 0)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      objc_msgSend(*(id *)(a1 + 32), "processPendingChanges");
      objc_msgSend(v3, "drain");
      return (uint64_t)0;
    }
  }
  return result;
}

- (void)setShouldRefreshAfterSave:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke;
    v6[3] = &unk_1E1EDE5B8;
    v6[4] = self;
    v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = 0x20000000;
    if (!v3)
      v5 = 0;
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v5);
  }
}

uint64_t __68__NSManagedObjectContext__NSCoreDataSPI__setShouldRefreshAfterSave___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) & 0xFFFFFFFFDFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(result + 40) << 29);
  return result;
}

- (BOOL)shouldRefreshAfterSave
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (void)setShouldPerformSecureOperation:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke;
    v6[3] = &unk_1E1EDE5B8;
    v6[4] = self;
    v7 = a3;
    -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
    v5 = 0x10000000;
    if (!v3)
      v5 = 0;
    self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v5);
  }
}

uint64_t __74__NSManagedObjectContext__NSCoreDataSPI__setShouldPerformSecureOperation___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40) & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)*(unsigned __int8 *)(result + 40) << 28);
  return result;
}

- (BOOL)shouldPerformSecureOperation
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (id)performBlockWithResult:(id)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke;
  v5[3] = &unk_1E1EDE3E8;
  v5[4] = a3;
  v5[5] = &v6;
  -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __65__NSManagedObjectContext__NSCoreDataSPI__performBlockWithResult___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

- (id)_orderedSetWithResultsFromFetchRequest:(id)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  return -[_PFFetchedResultOrderedSetWrapper initWithArray:andContext:]([_PFFetchedResultOrderedSetWrapper alloc], "initWithArray:andContext:", a3, self);
}

- (void)_stopConflictDetectionForObject:(id)a3
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  -[NSMutableSet removeObject:](self->_lockedObjects, "removeObject:", a3);
}

- (void)_mergeChangesFromRemoteContextSave:(id)a3 presupposingQueryGeneration:(id)a4
{
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    v7[0] = self;
    +[NSManagedObjectContext _mergeChangesFromRemoteContextSave:intoContexts:withClientQueryGeneration:]((uint64_t)NSManagedObjectContext, a3, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), (uint64_t)a4);
  }
}

void __116__NSManagedObjectContext__NSCoreDataSPI___mergeChangesFromRemoteContextSave_intoContexts_withClientQueryGeneration___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      -[NSManagedObjectContext _coreMergeChangesFromDidSaveDictionary:usingObjectIDs:withClientQueryGeneration:]((uint64_t)v3, *(void **)(a1 + 40), 1, v4);
    else
      objc_msgSend(v3, "_mergeChangesFromDidSaveDictionary:usingObjectIDs:", *(_QWORD *)(a1 + 40), 1);
  }
  objc_msgSend(v2, "drain");
  -[NSManagedObjectContext _processReferenceQueue:](*(_QWORD *)(a1 + 32), 0);
}

- (void)_mergeChangesFromRemoteContextSave:(id)a3
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self, a2);
  if (-[NSManagedObjectContext persistentStoreCoordinator](self, "persistentStoreCoordinator"))
  {
    v5[0] = self;
    objc_msgSend((id)objc_opt_class(), "mergeChangesFromRemoteContextSave:intoContexts:", a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
  }
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  void *v6;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__12;
  v13 = __Block_byref_object_dispose__12;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke;
  v8[3] = &unk_1E1EDE460;
  v8[4] = a4;
  v8[5] = self;
  v8[7] = a5;
  v8[8] = &v9;
  v8[6] = a3;
  _perform((uint64_t)self, (uint64_t)v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __107__NSManagedObjectContext__NestedContextSupport__newValueForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  _QWORD v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8))
  {
    v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8) = v3;
  }
  if (objc_msgSend(v2, "isTemporaryID"))
  {
    v4 = objc_msgSend(**(id **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) + 8), "objectForKey:", v2);
    if (v4)
      v2 = (void *)v4;
  }
  v5 = (unsigned int *)objc_msgSend(*(id *)(a1 + 40), "objectRegisteredForID:", v2);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isFault") & 1) == 0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 48), "_entitysReferenceID");
      v8 = v7;
      v9 = v6[5];
      v10 = (_DWORD)v9 ? (char *)v6 + v9 : 0;
      if (((v10[(v7 >> 3) - (((unint64_t)v6[4] >> 22) & 0x3FC)] >> (v7 & 7)) & 1) != 0)
      {
        v11 = (unint64_t *)objc_msgSend(v6, "entity");
        v12 = _kvcPropertysPrimitiveGetters(v11);
        _PF_Handler_Primitive_GetProperty((id **)v6, v8, *(_QWORD *)(*(_QWORD *)(v11[13] + 40) + 8 * v8), *(_QWORD *)(v12 + 8 * v8), v13, v14, v15, v16);
        v18 = v17;
        v19 = objc_msgSend(v17, "count");
        v30[1] = v30;
        v20 = MEMORY[0x1E0C80A78](v19);
        v23 = (char *)v30 - v22;
        if (v20 > 0x200)
          v23 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)v30 - v22, 8 * v21);
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
        v31 = 0u;
        v24 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v24)
        {
          v25 = v24;
          v26 = 0;
          v27 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v32 != v27)
                objc_enumerationMutation(v18);
              *(_QWORD *)&v23[8 * v26 + 8 * i] = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i) + 40);
            }
            v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
            v26 += i;
          }
          while (v25);
        }
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v23, v19);
        if (v19 >= 0x201)
          NSZoneFree(0, v23);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v29;
      }
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    -[NSManagedObjectContext lockObjectStore](*(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "newValueForRelationship:forObjectWithID:withContext:error:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56), 0);
    -[NSManagedObjectContext unlockObjectStore](*(_QWORD *)(a1 + 40));
  }
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[10];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke;
  v12[3] = &unk_1E1EDE488;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  v12[7] = a5;
  v12[8] = &v19;
  v12[9] = &v13;
  _perform((uint64_t)self, (uint64_t)v12);
  v7 = v14;
  v8 = (void *)v14[5];
  if (v8)
  {
    if (a6)
    {
      *a6 = v8;
      v8 = (void *)v7[5];
    }
    v9 = v8;
  }
  v10 = (void *)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __133__NSManagedObjectContext__NestedContextSupport___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 184) + 8))
  {
    v3 = PF_CALLOC_OBJECT_ARRAY(2);
    *v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 184) + 8) = v3;
  }
  if (objc_msgSend(v2, "isTemporaryID"))
  {
    v4 = objc_msgSend(**(id **)(*(_QWORD *)(a1[5] + 184) + 8), "objectForKey:", v2);
    if (v4)
      v2 = (void *)v4;
  }
  -[NSManagedObjectContext lockObjectStore](a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = objc_msgSend(*(id *)(a1[5] + 32), "_newOrderedRelationshipInformationForRelationship:forObjectWithID:withContext:error:", a1[6], v2, a1[7], *(_QWORD *)(a1[9] + 8) + 40);
  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    v5 = *(id *)(*(_QWORD *)(a1[9] + 8) + 40);
  return -[NSManagedObjectContext unlockObjectStore](a1[5]);
}

- (BOOL)_parentObtainPermanentIDsForObjects:(id)a3 context:(id)a4 error:(id *)a5
{
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[13];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__12;
  v31 = __Block_byref_object_dispose__12;
  v32 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__12;
  v26[4] = __Block_byref_object_dispose__12;
  v26[5] = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke;
  v13[3] = &unk_1E1EDE4B0;
  v13[4] = self;
  v13[5] = a3;
  v13[8] = &v14;
  v13[9] = &v33;
  v13[10] = &v27;
  v13[11] = v26;
  v13[12] = a5;
  v13[6] = a4;
  v13[7] = &v20;
  _perform((uint64_t)self, (uint64_t)v13);
  if (objc_msgSend((id)v21[5], "count"))
  {
    v7 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](a4, (void *)v21[5], (void *)v15[5]);
    if (v7)
    {
      v8 = (void *)MEMORY[0x18D76B4E4]();
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v7);
      objc_autoreleasePoolPop(v8);

    }
  }

  v21[5] = 0;
  v15[5] = 0;
  v9 = (id)v28[5];
  if (a5)
  {
    v10 = (void *)v28[5];
    if (v10)
      *a5 = v10;
  }
  v11 = *((_BYTE *)v34 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v11;
}

void __99__NSManagedObjectContext__NestedContextSupport___parentObtainPermanentIDsForObjects_context_error___block_invoke(uint64_t *a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 184) + 8))
  {
    v2 = PF_CALLOC_OBJECT_ARRAY(2);
    *v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2[1] = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 184) + 8) = v2;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = (void *)a1[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(v8, "objectID");
        if (objc_msgSend(v9, "isTemporaryID"))
        {
          v10 = (void *)objc_msgSend(**(id **)(*(_QWORD *)(a1[4] + 184) + 8), "objectForKey:", v9);
          v11 = v10;
          if (v10 && (objc_msgSend(v10, "isTemporaryID") & 1) == 0)
          {
            if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
              *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
              *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v8);
            objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v11);
          }
          else
          {
            objc_msgSend(v3, "addObject:", v8);
            objc_msgSend(obj, "addObject:", v9);
          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v5);
  }
  if (objc_msgSend(v3, "count"))
  {
    v12 = (_BYTE *)a1[4];
    if ((v12[42] & 8) != 0)
    {
      -[NSManagedObjectContext lockObjectStore]((uint64_t)v12);
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 32), "_parentObtainPermanentIDsForObjects:context:error:", v3, a1[6], a1[12]);
      -[NSManagedObjectContext unlockObjectStore](a1[4]);
    }
    else
    {
      v13 = (void *)objc_msgSend(v12, "persistentStoreCoordinator");
      -[NSManagedObjectContext lockObjectStore](a1[4]);
      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v13, "obtainPermanentIDsForObjects:error:", v3, *(_QWORD *)(a1[10] + 8) + 40);
      -[NSManagedObjectContext unlockObjectStore](a1[4]);

      v14 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
      if (v14)
      {
        v15 = (_QWORD *)a1[12];
        if (v15)
          *v15 = v14;
        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
      }
      v16 = *(id *)(*(_QWORD *)(a1[11] + 8) + 40);
      obj = 0;
      v3 = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24))
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v19)
      {
        v20 = 0;
        v21 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
            v24 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v20 + j, v28), "objectID");
            if (v23 != v24)
            {
              v25 = objc_msgSend((id)a1[4], "objectRegisteredForID:", v23);
              if (v25)
              {
                objc_msgSend(v28, "addObject:", v25);
                objc_msgSend(v18, "addObject:", v24);
              }
              objc_msgSend(**(id **)(*(_QWORD *)(a1[4] + 184) + 8), "setObject:forKey:", v24, v23);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 184) + 8) + 8), "setObject:forKey:", v23, v24);
            }
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          v20 += j;
        }
        while (v19);
      }
      if (objc_msgSend(v28, "count", v28))
        v17 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:]((_QWORD *)a1[4], v29, v18);
      else
        v17 = 0;

    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }

  v26 = *(id *)(*(_QWORD *)(a1[10] + 8) + 40);
  if (v17)
  {
    v27 = (void *)MEMORY[0x18D76B4E4](v26);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v17);
    objc_autoreleasePoolPop(v27);

  }
}

- (id)_orderKeysForRelationshipWithName__:(id)a3 onObjectWithID:(id)a4
{
  return -[NSManagedObject _orderKeysForRelationshipWithName__:](-[NSManagedObjectContext objectWithID:](self, "objectWithID:", a4), "_orderKeysForRelationshipWithName__:", a3);
}

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 onObjectWithID:(id)a5 error:(id *)a6
{
  return -[NSManagedObject _updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:error:](-[NSManagedObjectContext objectWithID:](self, "objectWithID:", a5), "_updateLocationsOfObjectsToLocationByOrderKey:inRelationshipWithName:error:", a3, a4, a6);
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  const __CFString *v14;
  _QWORD v15[9];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  v9 = objc_msgSend(a4, "destinationEntity");
  if (-[NSManagedObjectContext hasChanges](self, "hasChanges"))
  {
    v10 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A958);
    goto LABEL_11;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "entity"), "isKindOfEntity:", v9))
  {
    v14 = CFSTR("Destination object is not kind of [relationship destinationEntity]");
    goto LABEL_15;
  }
  if (!objc_msgSend(a4, "isToMany"))
  {
    v14 = CFSTR("Relationship must be a to-many.");
    goto LABEL_15;
  }
  if ((objc_msgSend(a4, "isOrdered") & 1) == 0)
  {
    v14 = CFSTR("Can't find the order of objects in an unordered relationship");
LABEL_15:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke;
  v15[3] = &unk_1E1EDE4D8;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = &v22;
  v15[8] = &v16;
  -[NSManagedObjectContext performBlockAndWait:](self, "performBlockAndWait:", v15);
  v11 = (void *)v17[5];
  if (v11)
  {
    v12 = v11;
    if (a5)
      *a5 = (id)v17[5];
  }
  v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);
LABEL_11:
  _Block_object_dispose(&v22, 8);
  return v10;
}

id __105__NSManagedObjectContext__PhotosOrderKeyUpdateSupport___allOrderKeysForDestination_inRelationship_error___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 32), "_allOrderKeysForDestination:inRelationship:error:", a1[5], a1[6], *(_QWORD *)(a1[8] + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    return 0;
  return result;
}

- (void)set_isSwiftBound:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x880000000;
  if (!a3)
    v3 = 0;
  self->_flags = (_managedObjectContextFlags)(*(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v3);
}

+ (id)createFutureForFileAtURL:(id)a3
{
  _NSDataFileBackedFuture *v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  if (!a3 || (objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Illegal attempt to pass a non-file URL to a file backed NSData");
    goto LABEL_13;
  }
  v4 = [_NSDataFileBackedFuture alloc];
  if (v4)
  {
    if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    {

      return 0;
    }
    v14.receiver = v4;
    v14.super_class = (Class)_NSDataFileBackedFuture;
    v4 = objc_msgSendSuper2(&v14, sel_init);
    if (v4)
    {
      v13 = 0;
      v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "path"), &v13);
      if (v5)
      {
        v6 = v5;
        if (objc_msgSend(v5, "valueForKey:", CFSTR("NSFileSize")))
        {
          v4->_fileSize = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", CFSTR("NSFileSize")), "unsignedIntegerValue");
          v4->_originalFileURL = (NSURL *)a3;
          v4->_uuid = (NSUUID *)(id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          return v4;
        }
      }

      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No file exists at URL '%@'"), a3);
      v8 = v11;
      v9 = v12;
LABEL_13:
      objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
    }
  }
  return v4;
}

- (BOOL)evictFuture:(id)a3 withError:(id *)a4
{
  char v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  const __CFString *v32;
  uint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB28A8];
    v32 = CFSTR("message");
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    v33 = objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ does not support eviction."), NSStringFromClass(v12));
    v13 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 3328, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    if (v13)
    {
      if (a4)
      {
        v14 = (id)v13;
LABEL_15:
        LOBYTE(v7) = 0;
        *a4 = v14;
        return v7;
      }
LABEL_19:
      LOBYTE(v7) = 0;
      return v7;
    }
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m");
    v22 = __pflogFaultLog;
    v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v7)
      return v7;
    *(_DWORD *)buf = 136315394;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m";
    v36 = 1024;
    v37 = 28;
LABEL_18:
    _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_19;
  }
  if (!a3)
    goto LABEL_19;
  v31 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", *((_QWORD *)a3 + 1), &v31);
  LOBYTE(v7) = 1;
  if ((v6 & 1) == 0 && v31)
  {
    v8 = (void *)objc_msgSend(v31, "domain");
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB28A8]) && objc_msgSend(v31, "code") == 4)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    v14 = v31;
    if (v31)
    {
      if (a4)
        goto LABEL_15;
      goto LABEL_19;
    }
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m");
    v22 = __pflogFaultLog;
    v7 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v7)
      return v7;
    *(_DWORD *)buf = 136315394;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Persistence/source/NSFileBackedFuture.m";
    v36 = 1024;
    v37 = 338;
    goto LABEL_18;
  }
  return v7;
}

@end
