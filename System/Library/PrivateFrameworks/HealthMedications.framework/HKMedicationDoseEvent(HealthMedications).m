@implementation HKMedicationDoseEvent(HealthMedications)

+ (id)syncVersionForStatus:()HealthMedications
{
  void *v3;

  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = *(&off_1E6CD4ED0 + a3 - 1);
  }
  return v3;
}

+ (id)syncIdentifierForScheduleItemIdentifier:()HealthMedications medicationIdentifier:
{
  void *v4;
  void *v5;

  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a4, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
