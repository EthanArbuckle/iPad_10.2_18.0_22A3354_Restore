@implementation HKStatistics(HeadphoneSevenDayDose)

- (id)hk_hearingSevenDayDosePercentageWithError:()HeadphoneSevenDayDose
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD3938];
  objc_msgSend(a1, "averageQuantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sevenDayDoseWithExposureAverageQuantity:duration:error:", v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:()HeadphoneSevenDayDose error:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);

  if (v8 == 1)
    goto LABEL_3;
  v9 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(a1, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v6);

  v12 = objc_alloc(MEMORY[0x24BDD1508]);
  objc_msgSend(a1, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);

  objc_msgSend(v15, "intersectionWithDateInterval:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_hearingSevenDayDoseDateIntervalClampedToMaxDuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to truncate date interval %@ to maxEndDate %@"), a1, v6);
    v17 = 0;
  }

  return v17;
}

- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:()HeadphoneSevenDayDose includesPrunableData:error:
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD4048], "decibelAWeightedSoundPressureLevelUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "averageQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCompatibleWithUnit:", v9);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "duration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCompatibleWithUnit:", v12);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(a1, "hk_hearingSevenDayDoseDateIntervalEndingBeforeDate:error:", v8, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)MEMORY[0x24BDD3988];
        HKHeadphoneAudioExposureEventType();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = *MEMORY[0x24BDD3150];
        objc_msgSend(a1, "averageQuantity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v31;
        v32[1] = *MEMORY[0x24BDD3140];
        objc_msgSend(a1, "duration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33[1] = v28;
        v32[2] = *MEMORY[0x24BDD43D0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "categorySampleWithType:value:startDate:endDate:device:metadata:", v17, 1, v30, v29, 0, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(a1, "duration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_unit");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hk_assignError:code:format:", a5, 3, CFSTR("duration (%@) incompatible with second unit"), v26);

      v20 = 0;
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(a1, "averageQuantity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_unit");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hk_assignError:code:format:", a5, 3, CFSTR("averageQuantity (%@) incompatable with dBASPL unit"), v23);

    v20 = 0;
  }

  return v20;
}

@end
