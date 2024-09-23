@implementation _HDCorrelationSampleEntityEncoder

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableCorrelation *v10;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableCorrelation);
    -[HDCodableCorrelation setSample:](v10, "setSample:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6518]), "_init");
  if (-[_HDCorrelationSampleEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5)&& (objc_msgSend(v9, "objects"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "count"), v10, v11))
  {
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50[2];

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((_DWORD)a5)
  {
    -[HDEntityEncoder profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDAssociationEntity objectIDsForAssociationEntityWithPersistentID:profile:error:](HDAssociationEntity, "objectIDsForAssociationEntityWithPersistentID:profile:error:", a4, v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
    {
      -[HDEntityEncoder profile](self, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v13;
      v17 = v15;
      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v17;
      +[HDDataEntity entityEnumeratorWithProfile:](HDQuantitySampleSeriesEntity, "entityEnumeratorWithProfile:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForRowIDs((uint64_t)v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPredicate:", v22);

      v50[0] = 0;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke;
      v47[3] = &unk_1E6CF4E18;
      v23 = v19;
      v24 = v16;
      v25 = v23;
      v48 = v23;
      v26 = v18;
      v49 = v26;
      objc_msgSend(v21, "enumerateWithError:handler:", v50, v47);
      v27 = v50[0];
      v28 = objc_msgSend(v26, "count");
      if (v28 == objc_msgSend(v24, "count"))
      {
        v29 = v26;
        v30 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v24);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "minusSet:", v25);
        v42 = v20;
        +[HDDataEntity entityEnumeratorWithProfile:](HDCategorySampleEntity, "entityEnumeratorWithProfile:", v20);
        v43 = v24;
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HDDataEntityPredicateForRowIDs((uint64_t)v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPredicate:", v33);

        v46 = v27;
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke_2;
        v44[3] = &unk_1E6CF89B8;
        v34 = v26;
        v45 = v34;
        objc_msgSend(v31, "enumerateWithError:handler:", &v46, v44);
        v35 = v46;

        v36 = v34;
        v21 = v31;
        v30 = v42;
        v24 = v43;
        v27 = v35;
      }
      v14 = 1;

      -[HDEntityEncoder authorizationFilter](self, "authorizationFilter");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
      {
        (*(void (**)(uint64_t, id))(v37 + 16))(v37, v26);
        v39 = objc_claimAutoreleasedReturnValue();

        v26 = (id)v39;
      }
      objc_msgSend(v10, "_addCorrelatedObjects:", v26);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
