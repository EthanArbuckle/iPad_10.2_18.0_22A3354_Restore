@implementation NSFaultHandler

- (id)initWithPersistenceStore:(id)result
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)NSFaultHandler;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (id)fulfillFault:(uint64_t)a3 withContext:
{
  if (result)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_fulfillFault_withContext_);
    return _PFFaultHandlerLookupRow(a2, a3, 0, 1, 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (void)turnObject:(uint64_t)a3 intoFaultWithContext:
{
  int v5;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void **v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL v24;

  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_turnObject_intoFaultWithContext_);
    v5 = (*(_DWORD *)(a2 + 16) >> 15) & 7;
    if (v5 == 5 || v5 == 0)
    {
      v7 = (void *)MEMORY[0x18D76B4E4]();
      objc_msgSend((id)a2, "willTurnIntoFault");
      v8 = _PFEntityForManagedObject((id)a2);
      v9 = (uint64_t)v8;
      v10 = *(uint64_t **)(a2 + 48);
      if (v10)
      {
        v11 = *v10;
        v12 = *(_DWORD *)(a2 + 16);
        if (v11)
          v13 = (*(_DWORD *)(a2 + 16) & 0x2000) == 0;
        else
          v13 = 0;
        if (v13)
        {
          if (v8)
          {
            v14 = *(_QWORD *)(v8[19] + 48);
            v24 = v14 == 0;
            if (v14)
            {
              if (a3)
                ++*(_WORD *)(a3 + 50);
              *(_DWORD *)(a2 + 16) = v12 | 0x1000;
              objc_msgSend((id)a2, "_willChangeValuesForKeys:", v14);
              v12 = *(_DWORD *)(a2 + 16);
            }
            v23 = v14;
            v15 = v7;
            *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
            goto LABEL_25;
          }
          *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
LABEL_37:
          objc_msgSend((id)a2, "didTurnIntoFault", v23);
          *(_DWORD *)(a2 + 16) = *(_DWORD *)(a2 + 16) & 0xFFFC7FFF | 0x8000;
          objc_autoreleasePoolPop(v7);
          return;
        }
      }
      else
      {
        v12 = *(_DWORD *)(a2 + 16);
      }
      *(_DWORD *)(a2 + 16) = v12 & 0xFFFC7FFF | 0x10000;
      if (v8)
      {
        v15 = v7;
        v23 = 0;
        v24 = 1;
LABEL_25:
        v16 = *(unint64_t **)(v9 + 112);
        v18 = *v16;
        v17 = v16[1];
        v19 = _kvcPropertysPrimitiveSetters(v9);
        if (v18 < v17 + v18)
        {
          v20 = (void **)(v19 + 8 * v18);
          v21 = v17;
          do
          {
            if (*v20)
            {
              if (isScalarTypeForKVCSetter(*v20))
                v22 = (void *)_CD_ScalarNull;
              else
                v22 = 0;
              _PF_CopyOnWrite_Snapshot((id)a2);
              _NSSetUsingKeyValueSetter();

            }
            ++v20;
            --v21;
          }
          while (v21);
        }
        -[NSManagedObject _clearRawPropertiesWithHint:](a2, v18, v17);
        v7 = v15;
        if (!v24)
        {
          objc_msgSend((id)a2, "_didChangeValuesForKeys:", v23);
          *(_DWORD *)(a2 + 16) &= ~0x1000u;
          if (a3)
            --*(_WORD *)(a3 + 50);
        }
        goto LABEL_37;
      }
      goto LABEL_37;
    }
  }
}

- (id)fulfillFault:(id)a3 withContext:(id)a4 forIndex:(unint64_t)a5
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a4, a2);
  return _PFFaultHandlerLookupRow(a3, (uint64_t)a4, 0, 1, a5);
}

- (id)retainedFulfillAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  if (a1)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a4, sel_retainedFulfillAggregateFaultForObject_andRelationship_withContext_);
    v7 = objc_msgSend(a3, "_propertyType");
    if (!a4)
      return (id)NSArray_EmptyArray;
    if (v7 == 3)
    {
      v28 = 0;
      v8 = (void *)objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "copy");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a2, CFSTR("FETCH_SOURCE"), a3, CFSTR("FETCHED_PROPERTY"), 0);
      objc_msgSend(v8, "setPredicate:", objc_msgSend((id)objc_msgSend(v8, "predicate"), "predicateWithSubstitutionVariables:", v9));
      v10 = (void *)objc_msgSend((id)a4, "executeFetchRequest:error:", v8, &v28);

      if (v28)
      {
        v18 = *MEMORY[0x1E0CB2FA8];
        v19 = objc_msgSend(v28, "code");
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData could not fulfill a fetched property because '%@'"), objc_msgSend(v28, "localizedDescription"));
        v21 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v18, v19, v20, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v28, *MEMORY[0x1E0CB3388], objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a2), CFSTR("NSAffectedObjectsErrorKey"), a3, CFSTR("Fetched Property"), 0));
        objc_msgSend(v28, "code");
        objc_msgSend(v21, "userInfo");
        _NSCoreDataLog(2, (uint64_t)CFSTR("CoreData Debug Logging: Exception = %@ with error code = %ld and userInfo = %@"), v22, v23, v24, v25, v26, v27, (uint64_t)v21);
        objc_exception_throw(v21);
      }
      return v10;
    }
    v28 = 0;
    v13 = (void *)objc_msgSend(a2, "objectID");
    v14 = v13;
    if ((*(_BYTE *)(a4 + 42) & 8) != 0)
    {
      v15 = (void *)MEMORY[0x18D76B4E4]();
      v11 = objc_msgSend(*(id *)(a4 + 32), "newValueForRelationship:forObjectWithID:withContext:error:", a3, v14, a4, &v28);
      v16 = v28;
      objc_autoreleasePoolPop(v15);
      v17 = v28;
      return (id)v11;
    }
    if (objc_msgSend(v13, "persistentStore")
      && (objc_msgSend(a2, "isInserted") & 1) == 0
      && (objc_msgSend(a3, "isTransient") & 1) == 0)
    {
      -[NSManagedObjectContext lockObjectStore](a4);
      v11 = objc_msgSend(*(id *)(a4 + 32), "newValueForRelationship:forObjectWithID:withContext:error:", a3, v14, a4, &v28);
      -[NSManagedObjectContext unlockObjectStore](a4);
      return (id)v11;
    }
  }
  return 0;
}

- (id)fulfillFault:(uint64_t)a3 withContext:(id *)a4 error:
{
  if (result)
  {
    if (_PF_Threading_Debugging_level)
      _PFAssertSafeMultiThreadedAccess_impl(a3, sel_fulfillFault_withContext_error_);
    return _PFFaultHandlerLookupRow(a2, a3, a4, 0, 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

+ (void)initialize
{
  NSFaultHandler *v2;
  uint64_t valuePtr;
  objc_super v4;

  if (!_CD_ScalarNull)
  {
    objc_opt_self();
    _NSKeyValueIvarSetterClass = (uint64_t)NSClassFromString((NSString *)CFSTR("NSKeyValueIvarSetter"));
    _NSKeyValueMethodSetterClass = (uint64_t)NSClassFromString((NSString *)CFSTR("NSKeyValueMethodSetter"));
    _NSKeyValueIvarGetterClass = (uint64_t)NSClassFromString((NSString *)CFSTR("NSKeyValueIvarGetter"));
    _NSKeyValueMethodGetterClass = (uint64_t)NSClassFromString((NSString *)CFSTR("NSKeyValueMethodGetter"));
    valuePtr = 0;
    _CD_ScalarNull = (uint64_t)CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (!_insertion_fault_handler)
    {
      v2 = [NSFaultHandler alloc];
      if (v2)
      {
        v4.receiver = v2;
        v4.super_class = (Class)NSFaultHandler;
        v2 = objc_msgSendSuper2(&v4, sel_init);
      }
      _insertion_fault_handler = (uint64_t)v2;
    }
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (uint64_t)retainedOrderedFaultInformationForAggregateFaultForObject:(void *)a3 andRelationship:(uint64_t)a4 withContext:(id *)a5 error:
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl(a4, sel_retainedOrderedFaultInformationForAggregateFaultForObject_andRelationship_withContext_error_);
  v9 = objc_msgSend(a3, "_propertyType");
  if (a4)
  {
    if (v9 == 4 && objc_msgSend(a3, "isOrdered"))
    {
      v10 = (void *)objc_msgSend(a2, "objectID");
      v11 = v10;
      if ((*(_BYTE *)(a4 + 42) & 8) != 0)
      {
        v20 = 0;
        v17 = (void *)MEMORY[0x18D76B4E4]();
        v16 = objc_msgSend(*(id *)(a4 + 32), "_newOrderedRelationshipInformationForRelationship:forObjectWithID:withContext:error:", a3, v11, a4, &v20);
        v18 = v20;
        objc_autoreleasePoolPop(v17);
        v19 = v20;
        if (a5 && v20)
          *a5 = v20;
        return v16;
      }
      if (objc_msgSend(v10, "persistentStore")
        && (objc_msgSend(a2, "isInserted") & 1) == 0
        && (objc_msgSend(a3, "isTransient") & 1) == 0)
      {
        -[NSManagedObjectContext lockObjectStore](a4);
        v12 = objc_msgSend(*(id *)(a4 + 32), "_newOrderedRelationshipInformationForRelationship:forObjectWithID:withContext:error:", a3, v11, a4, a5);
        -[NSManagedObjectContext unlockObjectStore](a4);
        return v12;
      }
    }
    return 0;
  }
  if (!a5)
    return 0;
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v15 = *MEMORY[0x1E0CB28A8];
  v21 = CFSTR("message");
  v22[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to retrieve ordering information from fault for object %@ and relationship %@ due to nil NSManagedObjectContext"), objc_msgSend(a2, "objectID"), objc_msgSend(a3, "name"));
  v16 = 0;
  *a5 = (id)objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
  return v16;
}

- (void)_fireFirstAndSecondLevelFaultsForObject:(uint64_t)a1 withContext:(void *)a2
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  if (a1)
  {
    objc_msgSend(a2, "willAccessValueForKey:", 0);
    v3 = (unint64_t *)objc_msgSend(a2, "entity");
    v4 = v3[14];
    v5 = *(_QWORD *)(v3[13] + 40);
    v10 = _kvcPropertysPrimitiveGetters(v3);
    for (i = 0; i != 4; ++i)
    {
      v12 = (unint64_t *)(v4 + 16
                                    * __const__fireFirstAndSecondLevelFaultsForObject_withContext__rangeIndices[i]);
      v13 = *v12;
      v14 = v12[1];
      if (*v12 < v14 + *v12)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a2, v13, *(_QWORD *)(v5 + 8 * v13), *(_QWORD *)(v10 + 8 * v13), v6, v7, v8, v9);
          if (i >= 2)
            objc_msgSend(v15, "willRead");
          ++v13;
          --v14;
        }
        while (v14);
      }
    }
  }
}

@end
