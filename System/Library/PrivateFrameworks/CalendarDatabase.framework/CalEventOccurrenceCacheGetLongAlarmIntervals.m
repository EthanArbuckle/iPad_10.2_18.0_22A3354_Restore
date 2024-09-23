@implementation CalEventOccurrenceCacheGetLongAlarmIntervals

double __CalEventOccurrenceCacheGetLongAlarmIntervals_block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  +[CDBPreferences shared](CDBPreferences, "shared", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CalEventOccurrenceCacheGetIdealRangeInfo(v0, (uint64_t)&v4);

  objc_msgSend((id)v5, "timeIntervalSinceDate:", (_QWORD)v6);
  CalEventOccurrenceCacheGetLongAlarmIntervals_longNegativeInterval = v1;
  objc_msgSend(*((id *)&v5 + 1), "timeIntervalSinceDate:", *((_QWORD *)&v4 + 1));
  *(double *)&CalEventOccurrenceCacheGetLongAlarmIntervals_longNegativeInterval = *(double *)&CalEventOccurrenceCacheGetLongAlarmIntervals_longNegativeInterval
                                                                                + -3600.0;
  *(double *)&CalEventOccurrenceCacheGetLongAlarmIntervals_longPositiveInterval = v2 + -3600.0;
  __destructor_8_s0_s8_s16_s24_s32((id *)&v4);
  return result;
}

@end
