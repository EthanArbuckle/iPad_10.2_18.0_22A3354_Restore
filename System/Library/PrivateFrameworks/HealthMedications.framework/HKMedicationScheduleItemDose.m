@implementation HKMedicationScheduleItemDose

- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5 isLastScheduledDose:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HKMedicationScheduleItemDose *v14;
  HKMedicationScheduleItemDose *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKMedicationScheduleItemDose;
  v14 = -[HKMedicationScheduleItemDose init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scheduleUUID, a3);
    objc_storeStrong((id *)&v15->_dose, a4);
    objc_storeStrong((id *)&v15->_medicationIdentifier, a5);
    v15->_isLastScheduledDose = a6;
  }

  return v15;
}

- (HKMedicationScheduleItemDose)initWithScheduleUUID:(id)a3 dose:(id)a4 medicationIdentifier:(id)a5
{
  return -[HKMedicationScheduleItemDose initWithScheduleUUID:dose:medicationIdentifier:isLastScheduledDose:](self, "initWithScheduleUUID:dose:medicationIdentifier:isLastScheduledDose:", a3, a4, a5, 0);
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationScheduleItemDose *v4;
  HKMedicationScheduleItemDose *v5;
  BOOL v6;

  v4 = (HKMedicationScheduleItemDose *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NSUUID isEqual:](v5->_scheduleUUID, "isEqual:", self->_scheduleUUID)
        && -[NSString isEqual:](v5->_medicationIdentifier, "isEqual:", self->_medicationIdentifier)
        && -[NSNumber isEqualToNumber:](v5->_dose, "isEqualToNumber:", self->_dose)
        && v5->_isLastScheduledDose == self->_isLastScheduledDose;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSUUID hash](self->_scheduleUUID, "hash");
  v4 = -[NSString hash](self->_medicationIdentifier, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_dose, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *dose;
  id v5;

  dose = self->_dose;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dose, CFSTR("dose"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduleUUID, CFSTR("scheduleUuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicationIdentifier, CFSTR("medicationIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLastScheduledDose, CFSTR("isLastScheduledDose"));

}

- (HKMedicationScheduleItemDose)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleItemDose *v5;
  uint64_t v6;
  NSNumber *dose;
  uint64_t v8;
  NSUUID *scheduleUUID;
  uint64_t v10;
  NSString *medicationIdentifier;
  HKMedicationScheduleItemDose *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicationScheduleItemDose;
  v5 = -[HKMedicationScheduleItemDose init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dose"));
    v6 = objc_claimAutoreleasedReturnValue();
    dose = v5->_dose;
    v5->_dose = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleUuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    scheduleUUID = v5->_scheduleUUID;
    v5->_scheduleUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("medicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v12 = 0;
      goto LABEL_6;
    }
    medicationIdentifier = v5->_medicationIdentifier;
    v5->_medicationIdentifier = (NSString *)v10;

    v5->_isLastScheduledDose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLastScheduledDose"));
  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicationScheduleItemDose scheduleUUID](self, "scheduleUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationScheduleItemDose dose](self, "dose");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>: scheduleUUID: %@ dose: %@ isLastScheduledDose: %d"), v4, self, v5, v6, -[HKMedicationScheduleItemDose isLastScheduledDose](self, "isLastScheduledDose"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)scheduleUUID
{
  return self->_scheduleUUID;
}

- (NSString)medicationIdentifier
{
  return self->_medicationIdentifier;
}

- (NSNumber)dose
{
  return self->_dose;
}

- (BOOL)isLastScheduledDose
{
  return self->_isLastScheduledDose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dose, 0);
  objc_storeStrong((id *)&self->_medicationIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleUUID, 0);
}

@end
