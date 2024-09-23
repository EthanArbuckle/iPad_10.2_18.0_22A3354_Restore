@implementation NSSQLitePrefetchRequestCache

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSKnownKeysDictionary *v11;
  NSCachingFetchRequest *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSCachingFetchRequest *v16;

  Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak)
    return 0;
  v8 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(*(id *)(v8 + 40), "objectForKey:", a3);
    v9 = *(unsigned int *)(v9 + 184);
  }
  else
  {
    v10 = 0;
  }
  v11 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v11)
  {
    v11 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v11;
  }
  v12 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v11, "objectForKey:", a3);
  if (!v12)
  {
    v12 = objc_alloc_init(NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v12, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:](v12, "setEntity:", objc_msgSend((id)objc_msgSend(v10, "destinationEntity"), "entityDescription"));
    v13 = _SELF_Expression;
    v14 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("mtmObjects"));
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v13, v14, 0, 10, 0);
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v15);

    v16 = v12;
  }
  return v12;
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSCachingFetchRequest *v11;
  void *v13;
  NSKnownKeysDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSCachingFetchRequest *v18;

  Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak)
    return 0;
  v8 = Weak;
  v9 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  v10 = objc_msgSend((id)v9, "model");
  if (v10 != objc_msgSend(v8, "model"))
    return 0;
  if (v9)
  {
    v13 = (void *)objc_msgSend(*(id *)(v9 + 40), "objectForKey:", a3);
    v9 = *(unsigned int *)(v9 + 184);
  }
  else
  {
    v13 = 0;
  }
  v14 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v14)
  {
    v14 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v14;
  }
  v11 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v14, "objectForKey:", a3);
  if (!v11)
  {
    v11 = objc_alloc_init(NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v11, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:](v11, "setEntity:", objc_msgSend((id)objc_msgSend(v13, "destinationEntity"), "entityDescription"));
    v15 = _SELF_Expression;
    v16 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("objects"));
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v15, v16, 0, 10, 0);
    -[NSFetchRequest setPredicate:](v11, "setPredicate:", v17);

    v18 = v11;
  }
  return v11;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSCachingFetchRequest *v12;
  _QWORD *v14;
  int v15;
  int v16;
  _QWORD *v17;
  NSKnownKeysDictionary *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSCachingFetchRequest *v28;

  Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak)
    return 0;
  v8 = Weak;
  v9 = -[NSEntityDescription _relationshipNamed:](a4, (uint64_t)a3);
  v10 = _sqlCoreLookupSQLEntityForEntityDescription(v8, a4);
  v11 = objc_msgSend((id)v10, "model");
  if (v11 != objc_msgSend(v8, "model"))
    return 0;
  if (v10)
    v14 = (_QWORD *)objc_msgSend(*(id *)(v10 + 40), "objectForKey:", a3);
  else
    v14 = 0;
  v15 = objc_msgSend(v14, "isToMany");
  v16 = objc_msgSend(v9, "isOrdered");
  if (!v14)
  {
    v17 = 0;
    if (!v10)
      goto LABEL_10;
    goto LABEL_9;
  }
  v17 = (_QWORD *)v14[7];
  if (v10)
LABEL_9:
    v10 = *(unsigned int *)(v10 + 184);
LABEL_10:
  v18 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v10];
  if (!v18)
  {
    v18 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v10] = v18;
  }
  v12 = (NSCachingFetchRequest *)-[NSKnownKeysDictionary objectForKey:](v18, "objectForKey:", a3);
  if (!v12)
  {
    v12 = objc_alloc_init(NSCachingFetchRequest);
    -[NSCachingFetchRequest _disableSQLStatementCaching](v12, "_disableSQLStatementCaching");
    -[NSFetchRequest setEntity:](v12, "setEntity:", objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription"));
    v19 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("destinations"));
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F0]), "initWithObject:", objc_msgSend(v17, "name"));
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36E8]), "initWithKeyPath:", v20);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3518]), "initWithLeftExpression:rightExpression:modifier:type:options:", v21, v19, 0, 10, 0);
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v22);

    if (v15)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", objc_msgSend((id)objc_msgSend(v17, "foreignKey"), "name"), 1);
      if (v16)
      {
        v24 = objc_alloc(MEMORY[0x1E0CB3928]);
        if (v17)
          v25 = (void *)v17[10];
        else
          v25 = 0;
        v26 = (void *)objc_msgSend(v24, "initWithKey:ascending:", objc_msgSend(v25, "name"), 1);
      }
      else
      {
        v26 = 0;
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v23, v26, 0);

      -[NSFetchRequest setSortDescriptors:](v12, "setSortDescriptors:", v27);
    }
    v28 = v12;
  }
  return v12;
}

- (NSSQLitePrefetchRequestCache)initWithSQLCore:(id)a3
{
  NSSQLitePrefetchRequestCache *v4;
  NSSQLitePrefetchRequestCache *v5;
  _QWORD *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSSQLitePrefetchRequestCache;
  v4 = -[NSSQLitePrefetchRequestCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_sqlCore, a3);
    v6 = (_QWORD *)objc_msgSend(a3, "model");
    if (v6)
      v6 = (_QWORD *)v6[5];
    v7 = objc_msgSend(v6, "count");
    v5->_length = v7;
    v5->_prefetchRequestsByEntity = (id *)PF_CALLOC_OBJECT_ARRAY(v7 + 1);
  }
  return v5;
}

- (void)dealloc
{
  unint64_t length;
  unint64_t i;
  id v5;
  objc_super v6;

  length = self->_length;
  if (length)
  {
    for (i = 1; i <= length; ++i)
    {
      v5 = self->_prefetchRequestsByEntity[i];
      if (v5)

    }
  }
  PF_FREE_OBJECT_ARRAY(self->_prefetchRequestsByEntity);
  self->_prefetchRequestsByEntity = 0;
  objc_storeWeak((id *)&self->_sqlCore, 0);
  v6.receiver = self;
  v6.super_class = (Class)NSSQLitePrefetchRequestCache;
  -[NSSQLitePrefetchRequestCache dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sqlCore);
}

@end
