@implementation NSDateInterval(HeadphoneSevenDayDose)

- (id)hk_hearingSevenDayDoseDateIntervalClampedToMaxDuration
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  HKHeadphoneAudioExposureEventType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumAllowedDuration");
  v4 = v3;

  objc_msgSend(a1, "duration");
  if (v5 <= v4)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(a1, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v7, v4);
  }
  return v8;
}

@end
