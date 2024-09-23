@implementation AMSSQLiteMemoryEntity

- (AMSSQLiteMemoryEntity)init
{
  AMSSQLiteMemoryEntity *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *propertyValues;
  NSMutableDictionary *v5;
  NSMutableDictionary *externalPropertyValues;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSSQLiteMemoryEntity;
  v2 = -[AMSSQLiteMemoryEntity init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    propertyValues = v2->_propertyValues;
    v2->_propertyValues = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalPropertyValues = v2->_externalPropertyValues;
    v2->_externalPropertyValues = v5;

  }
  return v2;
}

- (AMSSQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  AMSSQLiteMemoryEntity *v8;
  AMSSQLiteMemoryEntity *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[AMSSQLiteMemoryEntity init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[AMSSQLiteMemoryEntity reloadFromDatabaseEntity:properties:](v8, "reloadFromDatabaseEntity:properties:", v6, v7);
    v9->_databaseID = objc_msgSend(v6, "persistentID");
  }

  return v9;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return 0;
}

- (void)setExternalValuesWithDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_externalPropertyValues, "addEntriesFromDictionary:", a3);
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v7;
  -[AMSSQLiteMemoryEntity setValues:forProperties:count:](self, "setValues:forProperties:count:", &v7, &v8, 1);
  v6 = v7;

}

- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5
{
  int64_t v5;
  NSMutableDictionary *propertyValues;

  if (a5 >= 1)
  {
    v5 = a5;
    do
    {
      propertyValues = self->_propertyValues;
      if (*a3)
        -[NSMutableDictionary setObject:forKey:](propertyValues, "setObject:forKey:", *a3, *a4);
      else
        -[NSMutableDictionary removeObjectForKey:](propertyValues, "removeObjectForKey:", *a4);
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (void)setValuesWithDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_propertyValues, "addEntriesFromDictionary:", a3);
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v7;
  -[AMSSQLiteMemoryEntity setValues:forExternalProperties:count:](self, "setValues:forExternalProperties:count:", &v7, &v8, 1);
  v6 = v7;

}

- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5
{
  int64_t v5;
  NSMutableDictionary *externalPropertyValues;

  if (a5 >= 1)
  {
    v5 = a5;
    do
    {
      externalPropertyValues = self->_externalPropertyValues;
      if (*a3)
        -[NSMutableDictionary setObject:forKey:](externalPropertyValues, "setObject:forKey:", *a3, *a4);
      else
        -[NSMutableDictionary removeObjectForKey:](externalPropertyValues, "removeObjectForKey:", *a4);
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_propertyValues, "objectForKeyedSubscript:", a3);
}

- (id)valueForExternalProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_externalPropertyValues, "objectForKeyedSubscript:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AMSSQLiteMemoryEntity;
  -[AMSSQLiteMemoryEntity description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %lld"), v4, self->_databaseID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_propertyValues, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (v6 = -[AMSSQLiteMemoryEntity databaseID](self, "databaseID"), v6 == objc_msgSend(v4, "databaseID")))
  {
    -[AMSSQLiteMemoryEntity propertyValues](self, "propertyValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDictionary:", v8))
    {
      -[AMSSQLiteMemoryEntity externalPropertyValues](self, "externalPropertyValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "externalPropertyValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_databaseID;
  objc_msgSend(*(id *)(v4 + 16), "addEntriesFromDictionary:", self->_propertyValues);
  objc_msgSend(*(id *)(v4 + 24), "addEntriesFromDictionary:", self->_externalPropertyValues);
  return (id)v4;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSDictionary)propertyValues
{
  return &self->_propertyValues->super;
}

- (NSDictionary)externalPropertyValues
{
  return &self->_externalPropertyValues->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPropertyValues, 0);
  objc_storeStrong((id *)&self->_propertyValues, 0);
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__63;
  v16 = __Block_byref_object_dispose__63;
  v17 = 0;
  objc_msgSend(a1, "queryOnConnection:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__AMSSQLiteMemoryEntity_AMSSQLiteQuery__anyOnConnection_predicate___block_invoke;
  v11[3] = &unk_1E2545D80;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateMemoryEntitiesUsingBlock:", v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __67__AMSSQLiteMemoryEntity_AMSSQLiteQuery__anyOnConnection_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)objc_msgSend(a1, "queryOnConnection:predicate:orderingProperties:", a3, a4, 0);
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSSQLiteQueryDescriptor *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  -[AMSSQLiteQueryDescriptor setEntityClass:](v11, "setEntityClass:", objc_msgSend(a1, "databaseEntityClass"));
  -[AMSSQLiteQueryDescriptor setMemoryEntityClass:](v11, "setMemoryEntityClass:", a1);
  -[AMSSQLiteQueryDescriptor setOrderingProperties:](v11, "setOrderingProperties:", v8);

  -[AMSSQLiteQueryDescriptor setPredicate:](v11, "setPredicate:", v9);
  v12 = -[AMSSQLiteQuery initOnConnection:descriptor:]([AMSSQLiteQuery alloc], "initOnConnection:descriptor:", v10, v11);

  return v12;
}

@end
