@implementation HKCategorySample(HeadphoneSevenDayDose)

- (BOOL)hk_isHearingSevenDayDoseNotification
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code") == 199 && objc_msgSend(a1, "value") == 1;

  return v3;
}

- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");

  if (v6 != 199)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(a1, "categoryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a3, 3, CFSTR("Unexpected data type code: %ld"), objc_msgSend(v13, "code"));

LABEL_8:
    v11 = 0;
    return v11;
  }
  if (objc_msgSend(a1, "value") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 3, CFSTR("Unexpected value: %ld"), objc_msgSend(a1, "value"));
    goto LABEL_8;
  }
  objc_msgSend(a1, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", *MEMORY[0x24BDD3150], objc_opt_class(), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", *MEMORY[0x24BDD3140], objc_opt_class(), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD3938], "_sevenDayDoseWithExposureAverageQuantity:duration:error:", v8, v10, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
