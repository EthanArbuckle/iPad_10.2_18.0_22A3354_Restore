@implementation HKMedicationScheduleIncompatibilityResult

- (HKMedicationScheduleIncompatibilityResult)init
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

- (HKMedicationScheduleIncompatibilityResult)initWithSchedule:(id)a3 incompatibleDevices:(id)a4
{
  id v7;
  id v8;
  HKMedicationScheduleIncompatibilityResult *v9;
  HKMedicationScheduleIncompatibilityResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationScheduleIncompatibilityResult;
  v9 = -[HKMedicationScheduleIncompatibilityResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_schedule, a3);
    objc_storeStrong((id *)&v10->_incompatibleDevices, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationScheduleIncompatibilityResult *v4;
  HKMedicationScheduleIncompatibilityResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  char v13;
  NSArray *incompatibleDevices;
  NSArray *v15;

  v4 = (HKMedicationScheduleIncompatibilityResult *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKMedicationSchedule medicationIdentifier](self->_schedule, "medicationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationSchedule medicationIdentifier](v5->_schedule, "medicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        incompatibleDevices = self->_incompatibleDevices;
        v15 = v5->_incompatibleDevices;
        v13 = incompatibleDevices == v15;
        if (incompatibleDevices != v15 && v15)
          v13 = -[NSArray isEqualToArray:](incompatibleDevices, "isEqualToArray:");
      }
      else
      {
        -[HKMedicationSchedule medicationIdentifier](v5->_schedule, "medicationIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[HKMedicationSchedule medicationIdentifier](self->_schedule, "medicationIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicationSchedule medicationIdentifier](v5->_schedule, "medicationIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
          {
            v11 = self->_incompatibleDevices;
            v12 = v5->_incompatibleDevices;
            v13 = v11 == v12;
            if (v11 != v12 && v12)
              v13 = -[NSArray isEqualToArray:](v11, "isEqualToArray:");
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKMedicationSchedule hash](self->_schedule, "hash");
  return -[NSArray hash](self->_incompatibleDevices, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicationSchedule *schedule;
  id v5;

  schedule = self->_schedule;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", schedule, CFSTR("Schedule"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incompatibleDevices, CFSTR("IncompatibleDevices"));

}

- (HKMedicationScheduleIncompatibilityResult)initWithCoder:(id)a3
{
  id v4;
  HKMedicationScheduleIncompatibilityResult *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationScheduleIncompatibilityResult;
  v5 = -[HKMedicationScheduleIncompatibilityResult init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Schedule"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationScheduleIncompatibilityResult setSchedule:](v5, "setSchedule:", v6);

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("IncompatibleDevices"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationScheduleIncompatibilityResult setIncompatibleDevices:](v5, "setIncompatibleDevices:", v8);

  }
  return v5;
}

- (HKMedicationSchedule)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
  objc_storeStrong((id *)&self->_schedule, a3);
}

- (NSArray)incompatibleDevices
{
  return self->_incompatibleDevices;
}

- (void)setIncompatibleDevices:(id)a3
{
  objc_storeStrong((id *)&self->_incompatibleDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incompatibleDevices, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
}

@end
