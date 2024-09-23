@implementation _HDMedicalUserDomainConceptEntityEncoder

- (id)orderedProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6DF9E30, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6870]), "_initBareObject");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    HDSQLiteColumnWithNameAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setCountryCode:", v13);
    -[HDEntityEncoder transaction](self, "transaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[HDUserDomainConceptEntity retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:](HDMedicalUserDomainConceptEntity, "retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:", v10, a4, v14, a6);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  HDCodableMedicalUserDomainConcept *v5;
  void *v6;

  v5 = objc_alloc_init(HDCodableMedicalUserDomainConcept);
  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalUserDomainConcept setCountryCode:](v5, "setCountryCode:", v6);

  return v5;
}

@end
