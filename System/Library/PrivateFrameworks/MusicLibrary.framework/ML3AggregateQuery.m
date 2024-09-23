@implementation ML3AggregateQuery

- (unint64_t)countOfEntities
{
  void *v4;
  unint64_t v5;

  if (self->super._propertyToCount)
    return -[ML3Query countOfDistinctRowsForColumn:](self, "countOfDistinctRowsForColumn:");
  -[ML3AggregateQuery persistentIDProperty](self, "persistentIDProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ML3Query countOfDistinctRowsForColumn:](self, "countOfDistinctRowsForColumn:", v4);

  return v5;
}

- (ML3AggregateQuery)initWithUnitQuery:(id)a3 aggregateEntityClass:(Class)a4 foreignPersistentIDProperty:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  ML3AggregateQuery *v16;
  uint64_t v17;
  NSString *foreignPersistentIDProperty;
  objc_super v20;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "entityClass");
  objc_msgSend(v9, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderingTerms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "usingSections");
  v15 = objc_msgSend(v9, "options");

  v20.receiver = self;
  v20.super_class = (Class)ML3AggregateQuery;
  v16 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](&v20, sel_initWithLibrary_entityClass_predicate_orderingTerms_usingSections_nonDirectAggregateQuery_propertyToCount_options_, v10, v11, v12, v13, v14, 0, 0, v15);

  if (v16)
  {
    v16->_aggregateEntityClass = a4;
    v17 = objc_msgSend(v8, "copy");
    foreignPersistentIDProperty = v16->_foreignPersistentIDProperty;
    v16->_foreignPersistentIDProperty = (NSString *)v17;

  }
  return v16;
}

- (id)persistentIDProperty
{
  return self->_foreignPersistentIDProperty;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[objc_class foreignPropertyForProperty:entityClass:](self->_aggregateEntityClass, "foreignPropertyForProperty:entityClass:", v11, self->super._entityClass);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v12)
          v13 = v12;
        else
          v13 = v11;
        objc_msgSend(v8, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)ML3AggregateQuery;
  -[ML3Query selectPersistentIDsSQLAndProperties:ordered:distinct:](&v17, sel_selectPersistentIDsSQLAndProperties_ordered_distinct_, v8, v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignPersistentIDProperty, 0);
}

- (void)dealloc
{
  NSString *foreignPersistentIDProperty;
  objc_super v4;

  foreignPersistentIDProperty = self->_foreignPersistentIDProperty;
  self->_foreignPersistentIDProperty = 0;

  v4.receiver = self;
  v4.super_class = (Class)ML3AggregateQuery;
  -[ML3AggregateQuery dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3AggregateQuery;
  v4 = -[ML3Query copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 11) = self->_aggregateEntityClass;
  objc_storeStrong((id *)v4 + 12, self->_foreignPersistentIDProperty);
  return v4;
}

- (ML3AggregateQuery)initWithCoder:(id)a3
{
  id v4;
  ML3AggregateQuery *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  NSString *foreignPersistentIDProperty;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3AggregateQuery;
  v5 = -[ML3Query initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aggregateEntityClass"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_aggregateEntityClass = NSClassFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreignPersistentIDProperty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    foreignPersistentIDProperty = v5->_foreignPersistentIDProperty;
    v5->_foreignPersistentIDProperty = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ML3AggregateQuery;
  v4 = a3;
  -[ML3Query encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  NSStringFromClass(-[ML3AggregateQuery aggregateEntityClass](self, "aggregateEntityClass", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("aggregateEntityClass"));

  -[ML3AggregateQuery foreignPersistentIDProperty](self, "foreignPersistentIDProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("foreignPersistentIDProperty"));

}

- (Class)entityClass
{
  return self->_aggregateEntityClass;
}

- (BOOL)hasEntities
{
  return -[ML3Query hasRowForColumn:](self, "hasRowForColumn:", self->super._propertyToCount);
}

- (BOOL)sectionsPersistentIDColumnIsDistinct
{
  return 1;
}

- (Class)aggregateEntityClass
{
  return self->_aggregateEntityClass;
}

- (NSString)foreignPersistentIDProperty
{
  return self->_foreignPersistentIDProperty;
}

- (BOOL)isFastCountable
{
  return self->_isFastCountable;
}

- (void)setIsFastCountable:(BOOL)a3
{
  self->_isFastCountable = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
