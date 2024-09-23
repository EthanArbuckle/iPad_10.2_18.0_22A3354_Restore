@implementation HKDiagnosticTestReport(Localization)

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

  objc_msgSend(a1, "sortDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB4C90]);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("DIAGNOSTIC_TEST_REPORT_SORT_DATE_TITLE_ISSUE_DATE");
  }
  else
  {
    objc_msgSend(a1, "sortDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB4C80]);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("DIAGNOSTIC_TEST_REPORT_SORT_DATE_TITLE_EFFECTIVE_END_DATE");
    }
    else
    {
      objc_msgSend(a1, "sortDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB4C88]);

      if (!v13)
      {
        v14 = 0;
        return v14;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("DIAGNOSTIC_TEST_REPORT_SORT_DATE_TITLE_EFFECTIVE_START_DATE");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
