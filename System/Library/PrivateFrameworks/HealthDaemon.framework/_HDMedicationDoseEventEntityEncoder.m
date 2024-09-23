@implementation _HDMedicationDoseEventEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("log_origin");
  v8[1] = CFSTR("schedule_item_identifier");
  v8[2] = CFSTR("medication_uuid");
  v8[3] = CFSTR("medication_identifier");
  v8[4] = CFSTR("scheduled_dose_quantity");
  v8[5] = CFSTR("dose_quantity");
  v8[6] = CFSTR("scheduled_date");
  v8[7] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableMedicationDoseEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableMedicationDoseEvent);
    -[HDCodableMedicationDoseEvent setSample:](v10, "setSample:", v9);
    -[HDCodableMedicationDoseEvent setLogOrigin:](v10, "setLogOrigin:", HDSQLiteColumnWithNameAsInt64());
    -[HDCodableMedicationDoseEvent setStatus:](v10, "setStatus:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableMedicationDoseEvent setScheduleItemIdentifier:](v10, "setScheduleItemIdentifier:", v11);

    }
    HDSQLiteColumnWithNameAsUUID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_dataForUUIDBytes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationDoseEvent setMedicationUuid:](v10, "setMedicationUuid:", v13);

    HDSQLiteColumnWithNameAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationDoseEvent setMedicationIdentifier:](v10, "setMedicationIdentifier:", v14);

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setScheduledDoseQuantity:](v10, "setScheduledDoseQuantity:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setDoseQuantity:](v10, "setDoseQuantity:");
    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDouble();
      -[HDCodableMedicationDoseEvent setScheduledDate:](v10, "setScheduledDate:");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB68A8]), "_init");
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
  void *v17;
  void *v18;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    objc_msgSend(v10, "_setLogOrigin:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(v10, "_setStatus:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setScheduleItemIdentifier:", v13);

    }
    HDSQLiteColumnWithNameAsUUID();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setMedicationUUID:", v14);

    HDSQLiteColumnWithNameAsString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setMedicationIdentifier:", v15);

    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsNumber();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setScheduledDoseQuantity:", v16);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsNumber();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setDoseQuantity:", v17);

    }
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      HDSQLiteColumnWithNameAsDate();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setScheduledDate:", v18);

    }
  }

  return v12;
}

@end
