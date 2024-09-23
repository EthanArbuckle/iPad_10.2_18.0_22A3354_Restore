@implementation _NSChildContextPredicateRemapper

- (void)visitPredicateExpression:(id)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(a3, "constantValue");
    if (v5)
    {
      v6 = v5;
      v7 = -[_NSChildContextPredicateRemapper replacementValueForValue:]((uint64_t)self, v5);
      v8 = v7;
      if (v7)
      {
        if (v7 != v6)
        {
          v9 = v7;
          object_setInstanceVariableWithStrongDefault(a3, "constantValue", v7);
          v8 = v9;
        }
      }
    }
    else
    {
      v8 = 0;
    }

  }
}

- (id)replacementValueForValue:(uint64_t)a1
{
  id v2;
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  id obj;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v2 = 0;
  v40 = *MEMORY[0x1E0C80C00];
  if (!a1 || !a2)
    return v2;
  obj = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    obj = (id)objc_msgSend(obj, "objectID");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(obj, "isNSArray"))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(obj);
            v12 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
            objc_msgSend(v2, "addObject:", v12);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v9);
      }
    }
    else if (objc_msgSend(obj, "isNSSet"))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(obj);
            v17 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
            objc_msgSend(v2, "addObject:", v17);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v14);
      }
    }
    else
    {
      if (!objc_msgSend(obj, "isNSOrderedSet"))
      {
        if (objc_msgSend(obj, "isNSString"))
          return (id)objc_msgSend(obj, "copy");
        else
          return obj;
      }
      v2 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          for (k = 0; k != v20; ++k)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(obj);
            v23 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
            objc_msgSend(v2, "addObject:", v23);

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        }
        while (v20);
      }
    }
    return v2;
  }
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v5 = *(id **)(*(_QWORD *)(v4 + 184) + 8);
    v6 = obj;
    if (v5)
    {
      v7 = objc_msgSend(*v5, "objectForKey:", obj);
      v6 = obj;
      if (v7)
        v6 = (void *)v7;
    }
  }
  else
  {
    v6 = obj;
  }
  return v6;
}

- (_NSChildContextPredicateRemapper)initWithContext:(id)a3
{
  _NSChildContextPredicateRemapper *v4;

  v4 = -[_NSChildContextPredicateRemapper init](self, "init");
  if (v4)
    v4->_context = (NSManagedObjectContext *)a3;
  return v4;
}

- (_NSChildContextPredicateRemapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSChildContextPredicateRemapper;
  return -[_NSChildContextPredicateRemapper init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSChildContextPredicateRemapper;
  -[_NSChildContextPredicateRemapper dealloc](&v3, sel_dealloc);
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  void *v5;

  if (!a3 || !a4)
    return (id)objc_msgSend(a3, "copy");
  v5 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v5, "acceptVisitor:flags:", self, 1);
  return v5;
}

@end
