@implementation _HDSourceEncoder

- (id)orderedProperties
{
  void *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[8];
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v2 = -[HDEntityEncoder purpose](self, "purpose");
  if (v2 == (void *)1)
  {
    v7[0] = CFSTR("name");
    v7[1] = CFSTR("source_options");
    v7[2] = CFSTR("local_device");
    v7[3] = CFSTR("product_type");
    v7[4] = CFSTR("mod_date");
    v7[5] = CFSTR("logical_source_id");
    v7[6] = CFSTR("logical_sources.bundle_id");
    v7[7] = CFSTR("logical_sources.owner_bundle_id");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v7;
    v5 = 8;
    goto LABEL_5;
  }
  if (!v2)
  {
    v8[0] = CFSTR("uuid");
    v8[1] = CFSTR("name");
    v8[2] = CFSTR("source_options");
    v8[3] = CFSTR("product_type");
    v8[4] = CFSTR("deleted");
    v8[5] = CFSTR("mod_date");
    v8[6] = CFSTR("logical_source_id");
    v8[7] = CFSTR("sync_identity");
    v8[8] = CFSTR("logical_sources.bundle_id");
    v8[9] = CFSTR("logical_sources.owner_bundle_id");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v8;
    v5 = 10;
LABEL_5:
    objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  HDCodableSource *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HDCodableSource *v13;

  v6 = objc_alloc_init(HDCodableSource);
  HDSQLiteColumnWithNameAsData();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setUuid:](v6, "setUuid:", v7);

  HDSQLiteColumnWithNameAsString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setName:](v6, "setName:", v8);

  HDSQLiteColumnWithNameAsString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setProductType:](v6, "setProductType:", v9);

  -[HDCodableSource setDeleted:](v6, "setDeleted:", HDSQLiteColumnWithNameAsBoolean());
  v10 = HDSQLiteColumnWithNameAsInt64();
  if (v10)
    -[HDCodableSource setOptions:](v6, "setOptions:", v10);
  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableSource setModificationDate:](v6, "setModificationDate:");
  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HDCodableSource setBundleIdentifier:](v6, "setBundleIdentifier:", v11);
    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[HDCodableSource setOwningAppBundleIdentifier:](v6, "setOwningAppBundleIdentifier:", v12);
    v13 = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 1401, CFSTR("Bundle identifier not present in Source codable"));
    v13 = 0;
  }

  return v13;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C18]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v9 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSourceEntity.m"), 855, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self superclassEncoder] == nil"));

  }
  HDSQLiteColumnWithNameAsString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setName:", v11);

  objc_msgSend(v9, "_setOptions:", HDSQLiteColumnWithNameAsInt64());
  objc_msgSend(v9, "_setLocalDevice:", HDSQLiteColumnWithNameAsBoolean());
  HDSQLiteColumnWithNameAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setProductType:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setSourceID:", v13);

  HDSQLiteColumnWithNameAsString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setBundleIdentifier:", v14);

  HDSQLiteColumnWithNameAsString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setOwningAppBundleIdentifier:", v15);

  HDSQLiteColumnWithNameAsDate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setModificationDate:", v16);

  return 1;
}

@end
