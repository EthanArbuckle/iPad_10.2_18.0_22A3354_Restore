@implementation HDCorrelationSampleEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  return 0;
}

+ (BOOL)isBackedByTable
{
  return 0;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 1;
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)createTableSQL
{
  return 0;
}

+ (BOOL)acceptsObject:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleEntity;
  if (objc_msgSendSuper2(&v7, sel_acceptsObject_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(v4, "_containsObjects");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleEntity;
  v3 = a3;
  objc_msgSendSuper2(&v8, sel_deleteStatementsForRelatedEntitiesWithTransaction_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAssociationEntity deleteStatementForParentIDWithTransaction:](HDAssociationEntity, "deleteStatementForParentIDWithTransaction:", v3, v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a2;
    objc_msgSend(v6, "numberWithLongLong:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  return 1;
}

uint64_t __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "correlations");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addCorrelations:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDCorrelationSampleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDCorrelationSampleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end
