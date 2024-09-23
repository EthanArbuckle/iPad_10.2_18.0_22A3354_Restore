@implementation HKMedicationDosage(HealthRecordsUI)

- (id)hr_dosageTimePeriodString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "timingPeriod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "timingPeriod");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hr_dateWithoutTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "timingPeriod");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hr_dateWithoutTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v5)
      {
        if (objc_msgSend(v5, "isEqualToString:", v8))
        {
          v9 = v5;
LABEL_12:

          return v9;
        }
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE %@ %@"), &stru_1E74EA150, CFSTR("HealthUI-Localizable"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v14, v5, v8);
        v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
        goto LABEL_12;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      HRLocalizedString(CFSTR("MEDICAL_RECORD_ENDED_ON_DATE%1$@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v11, v8);
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      HRLocalizedString(CFSTR("MEDICAL_RECORD_STARTED_ON_DATE%1$@"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v5);
    }
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  HRLocalizedString(CFSTR("MEDICAL_RECORD_DETAIL_TEXT_NO_DATE"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  return v9;
}

@end
