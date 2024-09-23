@implementation HDMedicationScheduleEntityEncoder

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;

  -[HDEntityEncoder profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder transaction](self, "transaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationScheduleEntity _codableRepresentationForMedicationScheduleID:row:profile:transaction:error:]((uint64_t)HDMedicationScheduleEntity, a3, (uint64_t)a4, v9, v10, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  -[HDEntityEncoder transaction](self, "transaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationScheduleEntity _medicationScheduleFromRow:persistentID:transaction:error:]((uint64_t)HDMedicationScheduleEntity, (uint64_t)a4, a3, v8, (NSObject **)a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
