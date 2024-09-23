@implementation HDDemoDataAudiogramSampleGenerator

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a4;
  v21 = a5;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if ((v8 & 1) == 0)
  {
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("HealthDemoDataAudiogramSampleInterval"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "integerValue") >= 1)
        v11 = objc_msgSend(v10, "integerValue");
      else
        v11 = 60;

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)v12;
    objc_msgSend(v13, "components:fromDate:", 30, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHour:", 10);
    objc_msgSend(v14, "setMinute:", 30);
    objc_msgSend(v13, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    while (1)
    {
      objc_msgSend(v13, "hk_dateBySubtractingDays:fromDate:", v16, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hk_isBeforeDate:", v22))
        break;
      v18 = -[HDDemoDataAudiogramSampleGenerator _hearingLevelClassificationForEar:]((uint64_t)self, CFSTR("HealthDemoDataAudiogramLeftEarHearingLevelClassificationOverride"));
      objc_msgSend(MEMORY[0x1E0CB6308], "randomAudiogramSampleWithLeftEarClassification:rightEarClassification:startDate:endDate:device:metadata:", v18, -[HDDemoDataAudiogramSampleGenerator _hearingLevelClassificationForEar:]((uint64_t)self, CFSTR("HealthDemoDataAudiogramRightEarHearingLevelClassificationOverride")), v17, v17, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectFromPhone:", v19);
      v16 += v11;

      if (v16 >= 3650)
        goto LABEL_13;
    }

LABEL_13:
  }

}

- (uint64_t)_hearingLevelClassificationForEar:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0C99EA0];
  v3 = a2;
  objc_msgSend(v2, "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "integerValue");
    v7 = 5;
    if (v6 < 5)
      v7 = v6;
    if (v6)
      v8 = v7;
    else
      v8 = 1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

@end
