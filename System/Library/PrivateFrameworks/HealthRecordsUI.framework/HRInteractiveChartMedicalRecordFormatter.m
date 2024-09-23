@implementation HRInteractiveChartMedicalRecordFormatter

- (HRInteractiveChartMedicalRecordFormatter)init
{
  HRInteractiveChartMedicalRecordFormatter *v2;
  HRInteractiveChartMedicalRecordFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRInteractiveChartMedicalRecordFormatter;
  v2 = -[HRInteractiveChartMedicalRecordFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](v2, "setOverrideStatFormatterItemOptions:", &unk_1E75130C8);
  return v3;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_7;
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayNameForUnit:value:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length") && (objc_msgSend(v6, "isNull") & 1) == 0)
  {
    objc_msgSend(v6, "unitString");
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB6CC8], "sharedConverter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synonymForUCUMUnitString:", v9);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v12 = 0;
  }
  if (v12)
    v13 = v12;
  else
    v13 = &stru_1E74EA150;
  v14 = v13;

  return v14;
}

@end
