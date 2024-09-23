@implementation HKAudioExposureUtilities(HeadphoneSevenDayDose)

+ (id)hk_sevenDayDoseWithExposureLevel:()HeadphoneSevenDayDose exposureDuration:error:
{
  double v7;
  void *v8;
  NSObject *v9;

  objc_msgSend(MEMORY[0x24BDD3938], "maximumDurationInSecondsForLEQ:days:", 7);
  if (v7 <= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("compute 7-day headphone dose failed"));
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[HKAudioExposureUtilities(HeadphoneSevenDayDose) hk_sevenDayDoseWithExposureLevel:exposureDuration:error:].cold.1(v9);
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2 / v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (id)_sevenDayDoseWithExposureAverageQuantity:()HeadphoneSevenDayDose duration:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isCompatibleWithUnit:", v10) & 1) == 0)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v8, "_unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_assignError:code:format:", a5, 3, CFSTR("averageQuantity (%@) incompatable with dBASPL unit"), v11);
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isCompatibleWithUnit:", v11) & 1) == 0)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v9, "_unit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, CFSTR("duration (%@) incompatible with second unit"), v18);

    goto LABEL_6;
  }
  objc_msgSend(v8, "doubleValueForUnit:", v10);
  v13 = v12;
  objc_msgSend(v9, "doubleValueForUnit:", v11);
  objc_msgSend(a1, "hk_sevenDayDoseWithExposureLevel:exposureDuration:error:", a5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v15;
}

+ (void)hk_sevenDayDoseWithExposureLevel:()HeadphoneSevenDayDose exposureDuration:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2175BF000, log, OS_LOG_TYPE_FAULT, "compute 7-day headphone dose failed", v1, 2u);
}

@end
