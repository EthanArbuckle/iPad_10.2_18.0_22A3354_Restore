@implementation HKTimeSinceStartOfDayNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_startOfDayTransform");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v10)[2](v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v14 = v13;

  objc_msgSend(v12, "dateByAddingTimeInterval:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v15, 23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
