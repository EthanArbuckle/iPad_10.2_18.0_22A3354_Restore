@implementation HKMedicationRecord(Localization)

- (id)sortDateTitle
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  objc_msgSend(a1, "sortDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB53A8]);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_MODIFIED_DATE");
  }
  else
  {
    objc_msgSend(a1, "sortDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB5438]);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_ASSERTION_DATE");
    }
    else
    {
      objc_msgSend(a1, "sortDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB5448]);

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_EFFECTIVE_END_DATE");
      }
      else
      {
        objc_msgSend(a1, "sortDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB5450]);

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_EFFECTIVE_START_DATE");
        }
        else
        {
          objc_msgSend(a1, "sortDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "keyPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB5440]);

          if (!v19)
          {
            v20 = 0;
            return v20;
          }
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v5;
          v7 = CFSTR("MEDICATION_RECORD_SORT_DATE_TITLE_EARLIEST_DOSAGE_DATE");
        }
      }
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
