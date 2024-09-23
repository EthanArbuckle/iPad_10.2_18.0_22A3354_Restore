@implementation _HDQuantitySampleEntityEncoder

- (id)orderedProperties
{
  void *v2;
  int64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = -[HDEntityEncoder purpose](self, "purpose");
  if (v4 == 1)
  {
    v11[0] = CFSTR("quantity");
    v11[1] = CFSTR("original_quantity");
    v11[2] = CFSTR("unit_strings.unit_string");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v11;
    goto LABEL_5;
  }
  if (!v4)
  {
    v12[0] = CFSTR("quantity");
    v12[1] = CFSTR("original_quantity");
    v12[2] = CFSTR("unit_strings.unit_string");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v12;
LABEL_5:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "orderedProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableQuantitySample *v10;
  void *v11;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableQuantitySample);
    -[HDCodableQuantitySample setSample:](v10, "setSample:", v9);
    if ((HDSQLiteColumnWithNameIsNull() & 1) != 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableQuantitySample setValueInCanonicalUnit:](v10, "setValueInCanonicalUnit:");
    }
    else
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableQuantitySample setValueInOriginalUnit:](v10, "setValueInOriginalUnit:");
      HDSQLiteColumnWithNameAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableQuantitySample setOriginalUnitString:](v10, "setOriginalUnitString:", v11);

    }
    -[HDCodableQuantitySample setFrozen:](v10, "setFrozen:", 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A40]), "_init");
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

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    if ((HDSQLiteColumnWithNameIsNull() & 1) != 0)
    {
      v13 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v10, "quantityType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "canonicalUnit");
    }
    else
    {
      HDSQLiteColumnWithNameAsString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v14);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsDouble();
    objc_msgSend(v13, "quantityWithUnit:doubleValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_setQuantity:", v16);
  }

  return v12;
}

@end
