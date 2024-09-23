@implementation _HDMedicationUserDomainConceptEntityEncoder

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4D8]), "_initBareObject");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  BOOL v13;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((_DWORD)a5)
  {
    -[HDEntityEncoder transaction](self, "transaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[HDUserDomainConceptEntity retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:](HDMedicationUserDomainConceptEntity, "retrievePrivateDataEntitiesForUserDomainConcept:persistentID:transaction:error:", v10, a4, v12, a6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)orderedProperties
{
  void *v2;
  void *v3;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
