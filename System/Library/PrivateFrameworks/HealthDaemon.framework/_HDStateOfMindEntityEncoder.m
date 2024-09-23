@implementation _HDStateOfMindEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("reflective_interval");
  v8[1] = CFSTR("valence");
  v8[2] = CFSTR("context");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C48]), "_init");
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDCodableStateOfMind *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HDEntityEncoder transaction](self, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDStateOfMindLabelEntity labelsForObjectID:transaction:error:](HDStateOfMindLabelEntity, "labelsForObjectID:transaction:error:", a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HDEntityEncoder transaction](self, "transaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDStateOfMindDomainEntity domainsForObjectID:transaction:error:](HDStateOfMindDomainEntity, "domainsForObjectID:transaction:error:", a3, v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc_init(HDCodableStateOfMind);
        -[HDCodableStateOfMind setSample:](v15, "setSample:", v14);
        -[HDCodableStateOfMind setReflectiveInterval:](v15, "setReflectiveInterval:", HDSQLiteColumnWithNameAsInt64());
        HDSQLiteColumnWithNameAsDouble();
        -[HDCodableStateOfMind setValence:](v15, "setValence:");
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v16 = v10;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v33;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(v16);
              -[HDCodableStateOfMind addLabels:](v15, "addLabels:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v20++), "longLongValue"));
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          }
          while (v18);
        }

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v21 = v12;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v29;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v29 != v24)
                objc_enumerationMutation(v21);
              -[HDCodableStateOfMind addDomains:](v15, "addDomains:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v25++), "longLongValue", (_QWORD)v28));
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v23);
        }

        HDSQLiteColumnWithNameAsString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          -[HDCodableStateOfMind setContext:](v15, "setContext:", v26);

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    -[HDEntityEncoder transaction](self, "transaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDStateOfMindLabelEntity labelsForObjectID:transaction:error:](HDStateOfMindLabelEntity, "labelsForObjectID:transaction:error:", a4, v13, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HDEntityEncoder transaction](self, "transaction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDStateOfMindDomainEntity domainsForObjectID:transaction:error:](HDStateOfMindDomainEntity, "domainsForObjectID:transaction:error:", a4, v15, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16 != 0;
      if (v16)
      {
        HDSQLiteColumnWithNameAsInt64();
        objc_msgSend(v10, "_setKind:", HKStateOfMindKindFromReflectiveInterval());
        HDSQLiteColumnWithNameAsDouble();
        objc_msgSend(v10, "_setValence:");
        HDSQLiteColumnWithNameAsString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setContext:", v18);

        objc_msgSend(v10, "_setLabels:", v14);
        objc_msgSend(v16, "hk_map:", &__block_literal_global_206);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setAssociations:", v19);

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
