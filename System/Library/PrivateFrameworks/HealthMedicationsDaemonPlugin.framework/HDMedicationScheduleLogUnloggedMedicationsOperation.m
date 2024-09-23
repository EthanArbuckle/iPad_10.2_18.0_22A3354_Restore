@implementation HDMedicationScheduleLogUnloggedMedicationsOperation

- (HDMedicationScheduleLogUnloggedMedicationsOperation)init
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

- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5
{
  id v8;
  id v9;
  HDMedicationScheduleLogUnloggedMedicationsOperation *v10;
  uint64_t v11;
  NSString *scheduledItemIdentifier;
  uint64_t v13;
  NSDate *logDate;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDMedicationScheduleLogUnloggedMedicationsOperation;
  v10 = -[HDMedicationScheduleLogUnloggedMedicationsOperation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    scheduledItemIdentifier = v10->_scheduledItemIdentifier;
    v10->_scheduledItemIdentifier = (NSString *)v11;

    v10->_status = a4;
    v13 = objc_msgSend(v9, "copy");
    logDate = v10->_logDate;
    v10->_logDate = (NSDate *)v13;

  }
  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDMedicationScheduleManager _crossReferenceScheduledItemsAndDoseEventsAndLogUnloggedWithScheduledItemIdentifier:status:logDate:profile:transaction:error:]((uint64_t)HDMedicationScheduleManager, self->_scheduledItemIdentifier, self->_status, self->_logDate, a3, a4, (uint64_t)a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *scheduledItemIdentifier;
  id v5;

  scheduledItemIdentifier = self->_scheduledItemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scheduledItemIdentifier, CFSTR("ScheduledItemIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logDate, CFSTR("LogDate"));

}

- (HDMedicationScheduleLogUnloggedMedicationsOperation)initWithCoder:(id)a3
{
  id v4;
  HDMedicationScheduleLogUnloggedMedicationsOperation *v5;
  uint64_t v6;
  NSString *scheduledItemIdentifier;
  uint64_t v8;
  NSDate *logDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationScheduleLogUnloggedMedicationsOperation;
  v5 = -[HDMedicationScheduleLogUnloggedMedicationsOperation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduledItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduledItemIdentifier = v5->_scheduledItemIdentifier;
    v5->_scheduledItemIdentifier = (NSString *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LogDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    logDate = v5->_logDate;
    v5->_logDate = (NSDate *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDate, 0);
  objc_storeStrong((id *)&self->_scheduledItemIdentifier, 0);
}

@end
