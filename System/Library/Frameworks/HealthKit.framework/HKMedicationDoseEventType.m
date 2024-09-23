@implementation HKMedicationDoseEventType

+ (id)allTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "medicationDoseEventTypeForIdentifier:", CFSTR("HKMedicationDoseEventTypeIdentifierMedicationDoseEvent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)medicationDoseEventType
{
  return (id)objc_msgSend(a1, "medicationDoseEventTypeForIdentifier:", CFSTR("HKMedicationDoseEventTypeIdentifierMedicationDoseEvent"));
}

- (id)underlyingSampleType
{
  return +[HKMedicationDoseEventType medicationDoseEventType](HKMedicationDoseEventType, "medicationDoseEventType");
}

- (int64_t)aggregationStyleForStatistics
{
  return 0;
}

- (id)canonicalUnitForStatistics
{
  return +[HKUnit countUnit](HKUnit, "countUnit");
}

- (BOOL)supportsStatisticOptions:(unint64_t)a3
{
  BOOL result;
  unint64_t v5;
  unint64_t v6;

  if ((a3 & 0xE) != 0)
    return 0;
  v5 = _HKStatisticsOptionPercentile() & a3;
  result = 0;
  if (v5 != _HKStatisticsOptionPercentile())
  {
    if ((a3 & 0x40) == 0)
      return 1;
    v6 = _HKStatisticOptionsAverageSampleDuration() & a3;
    if (v6 != _HKStatisticOptionsAverageSampleDuration())
      return 1;
  }
  return result;
}

- (void)validateUnitForStatistic:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HKMedicationDoseEventType canonicalUnitForStatistics](self, "canonicalUnitForStatistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_opt_class();
    -[HKMedicationDoseEventType canonicalUnitForStatistics](self, "canonicalUnitForStatistics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ %@ requires unit of type %@. Incompatible unit: %@"), v8, self, v9, v10);

  }
}

@end
