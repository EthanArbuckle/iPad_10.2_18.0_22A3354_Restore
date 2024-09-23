@implementation HKMedicationExposableDoseEvent

+ (id)asNeededExposableDoseEventForMedication:(id)a3 doseQuantity:(id)a4
{
  id v5;
  id v6;
  HKMedicationExposableDoseEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = [HKMedicationExposableDoseEvent alloc];
  objc_msgSend(v6, "medication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKMedicationExposableDoseEvent _initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:](v7, "_initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:", 1, 0, 0, v9, 0, v5, 0, v10, 2, 0);

  return v11;
}

- (HKMedicationExposableDoseEvent)initWithDoseEvent:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HKMedicationExposableDoseEvent *v16;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationExposableDoseEvent.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("doseEvent"));

  }
  v6 = objc_alloc(MEMORY[0x1E0CB68B8]);
  objc_msgSend(v5, "medicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v6, "initWithSemanticIdentifierString:", v7);

  v19 = objc_msgSend(v5, "logOrigin");
  objc_msgSend(v5, "scheduleItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduledDoseQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doseQuantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduledDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "status");
  objc_msgSend(v5, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKMedicationExposableDoseEvent _initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:](self, "_initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:", v19, v8, v9, v20, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (id)_initWithLogOrigin:(int64_t)a3 scheduleItemIdentifier:(id)a4 semanticIdentifier:(id)a5 medicationIdentifier:(id)a6 scheduledDoseQuantity:(id)a7 doseQuantity:(id)a8 scheduledDate:(id)a9 startDate:(id)a10 status:(int64_t)a11 persistedUUID:(id)a12
{
  NSNumber *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HKMedicationExposableDoseEvent *v25;
  uint64_t v26;
  NSString *scheduleItemIdentifier;
  uint64_t v28;
  NSString *semanticIdentifier;
  uint64_t v30;
  HKMedicationIdentifier *medicationIdentifier;
  NSNumber *scheduledDoseQuantity;
  NSNumber *v33;
  uint64_t v34;
  NSNumber *doseQuantity;
  uint64_t v36;
  NSDate *scheduledDate;
  uint64_t v38;
  NSDate *startDate;
  uint64_t v40;
  NSUUID *persistedUUID;
  id v43;
  objc_super v44;

  v18 = (NSNumber *)a7;
  v44.receiver = self;
  v44.super_class = (Class)HKMedicationExposableDoseEvent;
  v43 = a12;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = -[HKMedicationExposableDoseEvent init](&v44, sel_init);
  v25->_logOrigin = a3;
  v26 = objc_msgSend(v24, "copy");

  scheduleItemIdentifier = v25->_scheduleItemIdentifier;
  v25->_scheduleItemIdentifier = (NSString *)v26;

  v28 = objc_msgSend(v23, "copy");
  semanticIdentifier = v25->_semanticIdentifier;
  v25->_semanticIdentifier = (NSString *)v28;

  v30 = objc_msgSend(v22, "copy");
  medicationIdentifier = v25->_medicationIdentifier;
  v25->_medicationIdentifier = (HKMedicationIdentifier *)v30;

  scheduledDoseQuantity = v25->_scheduledDoseQuantity;
  v25->_scheduledDoseQuantity = v18;
  v33 = v18;

  v34 = objc_msgSend(v21, "copy");
  doseQuantity = v25->_doseQuantity;
  v25->_doseQuantity = (NSNumber *)v34;

  v36 = objc_msgSend(v20, "copy");
  scheduledDate = v25->_scheduledDate;
  v25->_scheduledDate = (NSDate *)v36;

  v38 = objc_msgSend(v19, "copy");
  startDate = v25->_startDate;
  v25->_startDate = (NSDate *)v38;

  v25->_status = a11;
  v40 = objc_msgSend(v43, "copy");

  persistedUUID = v25->_persistedUUID;
  v25->_persistedUUID = (NSUUID *)v40;

  return v25;
}

- (id)updateForNewStatus:(int64_t)a3
{
  return -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, a3, 0, 0, 0);
}

- (id)_updateForNewStatus:(void *)a3 doseQuantity:(void *)a4 startDate:(void *)a5 semanticIdentifier:
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  if (a1)
  {
    v10 = a3;
    if (!a3)
      v10 = (void *)a1[5];
    v11 = a4;
    if (!a4)
      v11 = (void *)a1[7];
    v12 = a5;
    if (!a5)
      v12 = (void *)a1[10];
    v13 = v12;
    v14 = v11;
    v15 = v10;
    v16 = a5;
    v17 = a4;
    v18 = a3;
    v19 = -[HKMedicationExposableDoseEvent _initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:]([HKMedicationExposableDoseEvent alloc], "_initWithLogOrigin:scheduleItemIdentifier:semanticIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:persistedUUID:", a1[1], a1[2], v13, a1[3], a1[4], v15, a1[6], v14, a2, a1[9]);

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)updateForNewDoseQuantity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, -[HKMedicationExposableDoseEvent status](self, "status"), v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateForNewStartDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, -[HKMedicationExposableDoseEvent status](self, "status"), 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)updateForSemanticIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKMedicationExposableDoseEvent _updateForNewStatus:doseQuantity:startDate:semanticIdentifier:](self, -[HKMedicationExposableDoseEvent status](self, "status"), 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationExposableDoseEvent *v4;
  HKMedicationExposableDoseEvent *v5;
  HKMedicationIdentifier *medicationIdentifier;
  HKMedicationIdentifier *v7;
  NSString *semanticIdentifier;
  NSString *v9;
  NSNumber *scheduledDoseQuantity;
  NSNumber *v11;
  NSNumber *doseQuantity;
  NSNumber *v13;
  NSString *scheduleItemIdentifier;
  NSString *v15;
  NSDate *scheduledDate;
  NSDate *v17;
  NSDate *startDate;
  NSDate *v19;
  NSUUID *persistedUUID;
  NSUUID *v21;
  BOOL v22;

  v4 = (HKMedicationExposableDoseEvent *)a3;
  if (self == v4)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      medicationIdentifier = v5->_medicationIdentifier;
      v7 = self->_medicationIdentifier;
      if (medicationIdentifier != v7
        && (!v7 || !-[HKMedicationIdentifier isEqual:](medicationIdentifier, "isEqual:")))
      {
        goto LABEL_32;
      }
      semanticIdentifier = v5->_semanticIdentifier;
      v9 = self->_semanticIdentifier;
      if (semanticIdentifier != v9 && (!v9 || !-[NSString isEqual:](semanticIdentifier, "isEqual:")))
        goto LABEL_32;
      scheduledDoseQuantity = v5->_scheduledDoseQuantity;
      v11 = self->_scheduledDoseQuantity;
      if (scheduledDoseQuantity != v11
        && (!v11 || !-[NSNumber isEqual:](scheduledDoseQuantity, "isEqual:")))
      {
        goto LABEL_32;
      }
      doseQuantity = v5->_doseQuantity;
      v13 = self->_doseQuantity;
      if (doseQuantity != v13 && (!v13 || !-[NSNumber isEqual:](doseQuantity, "isEqual:")))
        goto LABEL_32;
      scheduleItemIdentifier = v5->_scheduleItemIdentifier;
      v15 = self->_scheduleItemIdentifier;
      if (scheduleItemIdentifier != v15
        && (!v15 || !-[NSString isEqual:](scheduleItemIdentifier, "isEqual:")))
      {
        goto LABEL_32;
      }
      if (((scheduledDate = v5->_scheduledDate, v17 = self->_scheduledDate, scheduledDate == v17)
         || v17 && -[NSDate isEqual:](scheduledDate, "isEqual:"))
        && ((startDate = v5->_startDate, v19 = self->_startDate, startDate == v19)
         || v19 && -[NSDate isEqual:](startDate, "isEqual:"))
        && v5->_status == self->_status
        && v5->_logOrigin == self->_logOrigin
        && ((persistedUUID = v5->_persistedUUID, v21 = self->_persistedUUID, persistedUUID == v21)
         || v21 && -[NSUUID isEqual:](persistedUUID, "isEqual:")))
      {
        v22 = 1;
      }
      else
      {
LABEL_32:
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t logOrigin;
  id v5;

  logOrigin = self->_logOrigin;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", logOrigin, CFSTR("LogOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduleItemIdentifier, CFSTR("ScheduleItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_semanticIdentifier, CFSTR("SemanticIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicationIdentifier, CFSTR("MedicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduledDoseQuantity, CFSTR("ScheduledDoseQuantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_doseQuantity, CFSTR("DoseQuantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduledDate, CFSTR("ScheduledDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("StartDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistedUUID, CFSTR("PersistedUUID"));

}

- (HKMedicationExposableDoseEvent)initWithCoder:(id)a3
{
  id v4;
  HKMedicationExposableDoseEvent *v5;
  uint64_t v6;
  NSString *scheduleItemIdentifier;
  uint64_t v8;
  NSString *semanticIdentifier;
  uint64_t v10;
  HKMedicationIdentifier *medicationIdentifier;
  uint64_t v12;
  NSNumber *scheduledDoseQuantity;
  uint64_t v14;
  NSNumber *doseQuantity;
  uint64_t v16;
  NSDate *scheduledDate;
  uint64_t v18;
  NSDate *startDate;
  uint64_t v20;
  NSUUID *persistedUUID;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMedicationExposableDoseEvent;
  v5 = -[HKMedicationExposableDoseEvent init](&v23, sel_init);
  if (v5)
  {
    v5->_logOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LogOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduleItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    scheduleItemIdentifier = v5->_scheduleItemIdentifier;
    v5->_scheduleItemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SemanticIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    semanticIdentifier = v5->_semanticIdentifier;
    v5->_semanticIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (HKMedicationIdentifier *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduledDoseQuantity"));
    v12 = objc_claimAutoreleasedReturnValue();
    scheduledDoseQuantity = v5->_scheduledDoseQuantity;
    v5->_scheduledDoseQuantity = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoseQuantity"));
    v14 = objc_claimAutoreleasedReturnValue();
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ScheduledDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    scheduledDate = v5->_scheduledDate;
    v5->_scheduledDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StartDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v18;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersistedUUID"));
    v20 = objc_claimAutoreleasedReturnValue();
    persistedUUID = v5->_persistedUUID;
    v5->_persistedUUID = (NSUUID *)v20;

  }
  return v5;
}

- (int64_t)logOrigin
{
  return self->_logOrigin;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (HKMedicationIdentifier)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (NSNumber)scheduledDoseQuantity
{
  return self->_scheduledDoseQuantity;
}

- (NSNumber)doseQuantity
{
  return self->_doseQuantity;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)status
{
  return self->_status;
}

- (NSUUID)persistedUUID
{
  return self->_persistedUUID;
}

- (NSString)semanticIdentifier
{
  return self->_semanticIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticIdentifier, 0);
  objc_storeStrong((id *)&self->_persistedUUID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_scheduledDoseQuantity, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
}

@end
