@implementation HDMedicationScheduleInsertOperation

- (HDMedicationScheduleInsertOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDMedicationScheduleInsertOperation)initWithMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5
{
  id v9;
  HDMedicationScheduleInsertOperation *v10;
  HDMedicationScheduleInsertOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMedicationScheduleInsertOperation;
  v10 = -[HDMedicationScheduleInsertOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_schedules, a3);
    v11->_syncProvenance = a4;
    v11->_syncIdentity = a5;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "healthMedicationsProfileExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "medicationScheduleManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[HDMedicationScheduleManager _insertMedicationSchedules:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v10, self->_schedules, self->_syncProvenance, self->_syncIdentity, v8, (uint64_t)a5);

  return (char)a5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *schedules;
  id v5;

  schedules = self->_schedules;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", schedules, CFSTR("schedules"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncIdentity, CFSTR("sync_identity"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncProvenance, CFSTR("sync_provenance"));

}

- (HDMedicationScheduleInsertOperation)initWithCoder:(id)a3
{
  id v4;
  HDMedicationScheduleInsertOperation *v5;
  void *v6;
  uint64_t v7;
  NSArray *schedules;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationScheduleInsertOperation;
  v5 = -[HDMedicationScheduleInsertOperation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("schedules"));
    v7 = objc_claimAutoreleasedReturnValue();
    schedules = v5->_schedules;
    v5->_schedules = (NSArray *)v7;

    v5->_syncProvenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_provenance"));
    v5->_syncIdentity = -1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sync_identity")))
      v5->_syncIdentity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_identity"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);
}

@end
