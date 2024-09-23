@implementation _NSPersistentHistoryPredicateRemapper

- (_NSPersistentHistoryPredicateRemapper)initWithStoreIdentifier:(id)a3
{
  _NSPersistentHistoryPredicateRemapper *v4;

  v4 = -[_NSPersistentHistoryPredicateRemapper init](self, "init");
  if (v4)
    v4->_storeID = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryPredicateRemapper;
  -[_NSPersistentHistoryPredicateRemapper dealloc](&v3, sel_dealloc);
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  void *v6;

  if (a3)
  {
    v6 = (void *)objc_msgSend(a3, "copy", a3, a4);
    objc_msgSend(v6, "acceptVisitor:flags:", self, 1);
    if (self->_storeID)
      return v6;

  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", a3 == 0, a4);
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  return -[_NSPersistentHistoryPredicateRemapper createPredicateForFetchFromPredicate:withContext:](self, "createPredicateForFetchFromPredicate:withContext:", a3, 0);
}

- (void)visitPredicateExpression:(id)a3
{
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  void *v8;
  const char *v9;
  id v10;
  id v11;
  void *v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_previousKeyPathExpressionWasToken = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return;
      v10 = (id)objc_msgSend(a3, "constantValue");
      if (v10 || self->_previousKeyPathExpressionWasToken)
      {
        v11 = -[_NSPersistentHistoryPredicateRemapper replacementValueForValue:]((uint64_t)self, v10);
        v8 = v11;
        if (v11 && v11 != v10)
        {
          v9 = "constantValue";
          goto LABEL_8;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  v5 = (_BYTE *)objc_msgSend(a3, "keyPath");
  if (v5)
  {
    v6 = v5;
    v7 = -[_NSPersistentHistoryPredicateRemapper replacementValueForKeyPath:](self, v5);
    v8 = v7;
    if (v7 && v7 != v6)
    {
      v9 = "_value";
LABEL_8:
      v12 = v8;
      object_setInstanceVariableWithStrongDefault(a3, v9, v8);

      return;
    }
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
LABEL_16:

}

- (_BYTE)replacementValueForKeyPath:(_BYTE *)result
{
  _BYTE *v2;
  uint64_t v3;
  id v4;
  __CFString **v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (!objc_msgSend(a2, "isNSString"))
      return a2;
    v7[0] = CFSTR("author");
    v7[1] = CFSTR("bundleID");
    v8[0] = CFSTR("AUTHORTS");
    v8[1] = CFSTR("BUNDLEIDTS");
    v7[2] = CFSTR("contextName");
    v7[3] = CFSTR("processID");
    v8[2] = CFSTR("CONTEXTNAMETS");
    v8[3] = CFSTR("PROCESSIDTS");
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4), "objectForKey:", a2);
    if (v3)
      return (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v3, CFSTR("NAME"));
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("transactionNumber"))
      || (objc_msgSend(a2, "isEqualToString:", CFSTR("changeID")) & 1) != 0
      || objc_msgSend(a2, "isEqualToString:", CFSTR("token")))
    {
      if (objc_msgSend(a2, "isEqualToString:", CFSTR("token")))
        v2[16] = 1;
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = NSSQLPrimaryKeyPropertyName;
    }
    else if (objc_msgSend(a2, "isEqualToString:", CFSTR("timestamp")))
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = PFPersistentHistoryTransactionTimestamp;
    }
    else if (objc_msgSend(a2, "isEqualToString:", CFSTR("changeType")))
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = PFPersistentHistoryChangeType;
    }
    else
    {
      if (!objc_msgSend(a2, "isEqualToString:", CFSTR("changedEntity")))
        return (_BYTE *)objc_msgSend(a2, "copy");
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = PFPersistentHistoryChangeEntity;
    }
    return (_BYTE *)objc_msgSend(v4, "initWithString:", *v5);
  }
  return result;
}

- (id)replacementValueForValue:(uint64_t)a1
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  id obj;
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
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!a2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      *(_BYTE *)(a1 + 16) = 0;
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
    }
    return 0;
  }
  obj = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(obj, "objectID");
LABEL_10:
    obj = (id)v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = objc_msgSend(obj, "_backingObjectID");
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    obj = (id)objc_msgSend((id)objc_msgSend(obj, "storeTokens"), "valueForKey:", *(_QWORD *)(a1 + 8));
    if (!obj)
    {
      v5 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      return v5;
    }
  }
LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return obj;
  if (objc_msgSend(obj, "isNSArray"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }
    return v5;
  }
  if (objc_msgSend(obj, "isNSSet"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(obj);
          v15 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
          objc_msgSend(v5, "addObject:", v15);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v12);
    }
    return v5;
  }
  if (objc_msgSend(obj, "isNSOrderedSet"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(obj);
          v20 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
          objc_msgSend(v5, "addObject:", v20);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v17);
    }
    return v5;
  }
  if (!objc_msgSend(obj, "isNSString"))
    return obj;
  return (id)objc_msgSend(obj, "copy");
}

+ (id)defaultInstance
{
  id result;

  result = (id)defaultInstance_di_34;
  if (!defaultInstance_di_34)
  {
    result = objc_alloc_init(_NSPersistentHistoryPredicateRemapper);
    defaultInstance_di_34 = (uint64_t)result;
  }
  return result;
}

@end
