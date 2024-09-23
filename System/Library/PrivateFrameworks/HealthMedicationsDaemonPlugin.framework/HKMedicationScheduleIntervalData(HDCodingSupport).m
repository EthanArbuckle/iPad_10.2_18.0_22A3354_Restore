@implementation HKMedicationScheduleIntervalData(HDCodingSupport)

- (HDCodableMedicationScheduleIntervalData)hd_codableFromIntervalData
{
  HDCodableMedicationScheduleIntervalData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(HDCodableMedicationScheduleIntervalData);
  -[HDCodableMedicationScheduleIntervalData setDayOfWeek:](v2, "setDayOfWeek:", objc_msgSend(a1, "daysOfWeek"));
  objc_msgSend(a1, "startTimeComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_codableDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleIntervalData setStartTimeComponents:](v2, "setStartTimeComponents:", v4);

  objc_msgSend(a1, "cycleIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "cycleIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationScheduleIntervalData setCycleIndex:](v2, "setCycleIndex:", (int)objc_msgSend(v6, "intValue"));

  }
  objc_msgSend(a1, "cycleIntervalDays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "cycleIntervalDays");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableMedicationScheduleIntervalData setCycleIntervalDays:](v2, "setCycleIntervalDays:", (int)objc_msgSend(v8, "intValue"));

  }
  objc_msgSend(a1, "dose");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "dose");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[HDCodableMedicationScheduleIntervalData setDose:](v2, "setDose:");

  }
  return v2;
}

+ (id)hd_medicationScheduleIntervalDataFromCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D2C4A0]);
  v5 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(v3, "startTimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateComponentsWithCodableDateComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "dayOfWeek");
  v9 = objc_msgSend(v3, "hasCycleIndex");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "cycleIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v3, "hasCycleIntervalDays");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "cycleIntervalDays"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if ((objc_msgSend(v3, "hasDose") & 1) == 0)
  {
    v15 = (void *)objc_msgSend(v4, "initWithStartTimeComponent:daysOfWeek:cycleIndex:cycleIntervalDays:dose:", v7, v8, v10, v12, 0);
    if (!v11)
      goto LABEL_12;
    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "dose");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v4, "initWithStartTimeComponent:daysOfWeek:cycleIndex:cycleIntervalDays:dose:", v7, v8, v10, v12, v14);

  if (v11)
LABEL_11:

LABEL_12:
  if (v9)

  return v15;
}

@end
