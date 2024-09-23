@implementation _HDECGSampleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("private_classification");
  v8[1] = CFSTR("average_heart_rate");
  v8[2] = CFSTR("voltage_payload");
  v8[3] = CFSTR("symptoms_status");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
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
  HDCodableECGSample *v10;
  void *v11;
  uint64_t v12;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableECGSample);
    -[HDCodableECGSample setSample:](v10, "setSample:", v9);
    -[HDCodableECGSample setPrivateClassification:](v10, "setPrivateClassification:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableECGSample setVoltagePayload:](v10, "setVoltagePayload:", v11);

    -[HDCodableECGSample setSymptomsStatus:](v10, "setSymptomsStatus:", HDSQLiteColumnWithNameAsInt64());
    v12 = (int)HDSQLiteColumnWithName();
    if ((MEMORY[0x1BCCAB204](a4, v12) & 1) == 0)
    {
      MEMORY[0x1BCCAB1A4](a4, v12);
      -[HDCodableECGSample setAverageHeartRateInBPM:](v10, "setAverageHeartRateInBPM:");
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
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6650]), "_init");
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
    objc_msgSend(v10, "_setPrivateClassification:", HDSQLiteColumnWithNameAsInt64());
    HDSQLiteColumnWithNameAsData();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPayload:", v13);

    objc_msgSend(v10, "_setSymptomsStatus:", HDSQLiteColumnWithNameAsInt64());
    if ((HDSQLiteColumnWithNameIsNull() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HDSQLiteColumnWithNameAsDouble();
      objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setAverageHeartRate:", v16);

    }
  }

  return v12;
}

@end
