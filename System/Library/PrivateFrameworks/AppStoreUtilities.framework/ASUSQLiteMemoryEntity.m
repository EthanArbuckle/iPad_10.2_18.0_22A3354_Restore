@implementation ASUSQLiteMemoryEntity

- (ASUSQLiteMemoryEntity)init
{
  return -[ASUSQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:](self, "initWithDatabaseID:propertyValues:externalPropertyValues:", 0, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8]);
}

- (ASUSQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  id v8;
  id v9;
  ASUSQLiteMemoryEntity *v10;
  ASUSQLiteMemoryEntity *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *propertyValues;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *externalPropertyValues;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASUSQLiteMemoryEntity;
  v10 = -[ASUSQLiteMemoryEntity init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    v12 = (void *)MEMORY[0x24BDBD1B8];
    if (v8)
      v13 = v8;
    else
      v13 = (void *)MEMORY[0x24BDBD1B8];
    v14 = objc_msgSend(v13, "mutableCopy");
    propertyValues = v11->_propertyValues;
    v11->_propertyValues = (NSMutableDictionary *)v14;

    if (v9)
      v16 = v9;
    else
      v16 = v12;
    v17 = objc_msgSend(v16, "mutableCopy");
    externalPropertyValues = v11->_externalPropertyValues;
    v11->_externalPropertyValues = (NSMutableDictionary *)v17;

  }
  return v11;
}

- (ASUSQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  ASUSQLiteMemoryEntity *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "persistentID");
  v9 = -[ASUSQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:](self, "initWithDatabaseID:propertyValues:externalPropertyValues:", v8, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8]);
  if (v9 && objc_msgSend(v7, "count"))
    -[ASUSQLiteMemoryEntity reloadFromDatabaseEntity:properties:](v9, "reloadFromDatabaseEntity:properties:", v6, v7);

  return v9;
}

- (ASUSQLiteMemoryEntity)initWithPropertyValues:(id)a3
{
  return -[ASUSQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:](self, "initWithDatabaseID:propertyValues:externalPropertyValues:", 0, a3, MEMORY[0x24BDBD1B8]);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(a3, "getValuesForProperties:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__ASUSQLiteMemoryEntity_reloadFromDatabaseEntity_properties___block_invoke;
  v6[3] = &unk_2507A91C0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

uint64_t __61__ASUSQLiteMemoryEntity_reloadFromDatabaseEntity_properties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (a3)
    return objc_msgSend(v3, "setObject:forKey:", a3, a2);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a2);
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
  -[ASUSQLiteMemoryEntity setValues:forProperties:count:](self, "setValues:forProperties:count:", &v7, &v8, 1);
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
  -[ASUSQLiteMemoryEntity setValues:forExternalProperties:count:](self, "setValues:forExternalProperties:count:", &v7, &v8, 1);
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)ASUSQLiteMemoryEntity;
  -[ASUSQLiteMemoryEntity description](&v7, sel_description);
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
    && (v6 = -[ASUSQLiteMemoryEntity databaseID](self, "databaseID"), v6 == objc_msgSend(v4, "databaseID")))
  {
    -[ASUSQLiteMemoryEntity propertyValues](self, "propertyValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDictionary:", v8))
    {
      -[ASUSQLiteMemoryEntity externalPropertyValues](self, "externalPropertyValues");
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
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDatabaseID:propertyValues:externalPropertyValues:", self->_databaseID, self->_propertyValues, self->_externalPropertyValues);
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

- (BOOL)BOOLValueForProperty:(id)a3
{
  void *v3;
  char v4;

  -[ASUSQLiteMemoryEntity numberValueForProperty:](self, "numberValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)dateValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (int64_t)integerValueForProperty:(id)a3
{
  void *v3;
  int64_t v4;

  -[ASUSQLiteMemoryEntity numberValueForProperty:](self, "numberValueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)numberValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)stringValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)uuidValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)urlValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)arrayValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)dictValueForProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[ASUSQLiteMemoryEntity valueForProperty:](self, "valueForProperty:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  objc_msgSend(a1, "queryOnConnection:predicate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__ASUSQLiteMemoryEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke;
  v11[3] = &unk_2507A97F8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateMemoryEntitiesUsingBlock:", v11);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __67__ASUSQLiteMemoryEntity_ASUSQLiteQuery__anyOnConnection_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
  ASUSQLiteQueryDescriptor *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ASUSQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]([ASUSQLiteQueryDescriptor alloc], "initWithEntityClass:memoryEntityClass:", objc_msgSend(a1, "databaseEntityClass"), a1);
  -[ASUSQLiteQueryDescriptor setOrderingProperties:](v11, "setOrderingProperties:", v8);

  -[ASUSQLiteQueryDescriptor setPredicate:](v11, "setPredicate:", v9);
  v12 = -[ASUSQLiteQuery initOnConnection:descriptor:]([ASUSQLiteQuery alloc], "initOnConnection:descriptor:", v10, v11);

  return v12;
}

@end
