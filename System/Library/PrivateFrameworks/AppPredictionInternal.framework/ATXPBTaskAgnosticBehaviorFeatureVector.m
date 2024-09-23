@implementation ATXPBTaskAgnosticBehaviorFeatureVector

- (void)setUnlockTime:(double)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 8);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 18) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 8) = v3;
  *((_BYTE *)&self->_has + 18) = v4;
  self->_unlockTime = a3;
}

- (void)setHasUnlockTime:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16)) & 0xFFFEFFFF;
  if (a3)
    v4 = 0x10000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8);
  *((_BYTE *)&self->_has + 18) = (v3 | v4) >> 16;
}

- (BOOL)hasUnlockTime
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 18) << 16) >> 16) & 1;
}

- (void)setLaunchTimePopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x10u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_launchTimePopularity = a3;
}

- (void)setHasLaunchTimePopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 16;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFEF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasLaunchTimePopularity
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 4) & 1;
}

- (void)setTimeOfDayBucket:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x100u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_timeOfDayBucket = a3;
}

- (void)setHasTimeOfDayBucket:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 256;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFEFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTimeOfDayBucket
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 8) & 1;
}

- (void)setTimeOfDayPopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x200u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_timeOfDayPopularity = a3;
}

- (void)setHasTimeOfDayPopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 512;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFDFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTimeOfDayPopularity
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 9) & 1;
}

- (void)setCoarseTimeOfDayPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000000000uLL;
  self->_coarseTimeOfDayPopularity = a3;
}

- (void)setHasCoarseTimeOfDayPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCoarseTimeOfDayPopularity
{
  return (*((_QWORD *)&self->_has + 1) >> 51) & 1;
}

- (void)setLaunchPopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 8u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_launchPopularity = a3;
}

- (void)setHasLaunchPopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 8;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFF7 | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasLaunchPopularity
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 3) & 1;
}

- (void)setLaunchDayOfWeekPopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 4u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_launchDayOfWeekPopularity = a3;
}

- (void)setHasLaunchDayOfWeekPopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFFB | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasLaunchDayOfWeekPopularity
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 2) & 1;
}

- (void)setDayOfWeekBucket:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000000000uLL;
  self->_dayOfWeekBucket = a3;
}

- (void)setHasDayOfWeekBucket:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDayOfWeekBucket
{
  return (*((_QWORD *)&self->_has + 1) >> 54) & 1;
}

- (void)setDayOfWeekPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000000000uLL;
  self->_dayOfWeekPopularity = a3;
}

- (void)setHasDayOfWeekPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDayOfWeekPopularity
{
  return (*((_QWORD *)&self->_has + 1) >> 55) & 1;
}

- (void)setEntropyLaunchPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000000000000uLL;
  self->_entropyLaunchPopularity = a3;
}

- (void)setHasEntropyLaunchPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropyLaunchPopularity
{
  return (*((_QWORD *)&self->_has + 1) >> 59) & 1;
}

- (void)setEntropyDayOfWeekPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000000000uLL;
  self->_entropyDayOfWeekPopularity = a3;
}

- (void)setHasEntropyDayOfWeekPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropyDayOfWeekPopularity
{
  return HIBYTE(*((_QWORD *)&self->_has + 1)) & 1;
}

- (void)setEntropyDayOfWeekPopularityByDay:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000000000uLL;
  self->_entropyDayOfWeekPopularityByDay = a3;
}

- (void)setHasEntropyDayOfWeekPopularityByDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropyDayOfWeekPopularityByDay
{
  return (*((_QWORD *)&self->_has + 1) >> 58) & 1;
}

- (void)setEntropyDayOfWeekPopularityByApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000000000uLL;
  self->_entropyDayOfWeekPopularityByApp = a3;
}

- (void)setHasEntropyDayOfWeekPopularityByApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropyDayOfWeekPopularityByApp
{
  return (*((_QWORD *)&self->_has + 1) >> 57) & 1;
}

- (void)setEntropyTrendingPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000000000000;
  self->_entropyTrendingPopularity = a3;
}

- (void)setHasEntropyTrendingPopularity:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = v3 & 0x8000000000000000 | *((_QWORD *)&self->_has + 1) & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasEntropyTrendingPopularity
{
  return *((_QWORD *)&self->_has + 1) >> 63;
}

- (void)setEntropySSIDPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000000000000uLL;
  self->_entropySSIDPopularity = a3;
}

- (void)setHasEntropySSIDPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropySSIDPopularity
{
  return (*((_QWORD *)&self->_has + 1) >> 60) & 1;
}

- (void)setEntropySSIDPopularityBySSID:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000000000000uLL;
  self->_entropySSIDPopularityBySSID = a3;
}

- (void)setHasEntropySSIDPopularityBySSID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropySSIDPopularityBySSID
{
  return (*((_QWORD *)&self->_has + 1) >> 62) & 1;
}

- (void)setEntropySSIDPopularityByApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000000000000uLL;
  self->_entropySSIDPopularityByApp = a3;
}

- (void)setHasEntropySSIDPopularityByApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEntropySSIDPopularityByApp
{
  return (*((_QWORD *)&self->_has + 1) >> 61) & 1;
}

- (void)setTotalNumberOfLaunches:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x1000u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_totalNumberOfLaunches = a3;
}

- (void)setHasTotalNumberOfLaunches:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 4096;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xEFFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTotalNumberOfLaunches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 12) & 1;
}

- (void)setAirplaneModePopularity:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_airplaneModePopularity = a3;
}

- (void)setHasAirplaneModePopularity:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAirplaneModePopularity
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTotalNumberOfAirplaneModeLaunches:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x400u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_totalNumberOfAirplaneModeLaunches = a3;
}

- (void)setHasTotalNumberOfAirplaneModeLaunches:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 1024;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFBFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTotalNumberOfAirplaneModeLaunches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 10) & 1;
}

- (void)setTrendingPopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x8000u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_trendingPopularity = a3;
}

- (void)setHasTrendingPopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 0x8000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0x7FFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTrendingPopularity
{
  return (unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 15;
}

- (void)setTotalNumberOfTrendingLaunches:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x4000u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_totalNumberOfTrendingLaunches = a3;
}

- (void)setHasTotalNumberOfTrendingLaunches:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 0x4000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xBFFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTotalNumberOfTrendingLaunches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 14) & 1;
}

- (void)setSSIDPopularity:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x80u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_sSIDPopularity = a3;
}

- (void)setHasSSIDPopularity:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 128;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFF7F | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasSSIDPopularity
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 7) & 1;
}

- (void)setTotalNumberOfSSIDLaunches:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x2000u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_totalNumberOfSSIDLaunches = a3;
}

- (void)setHasTotalNumberOfSSIDLaunches:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 0x2000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xDFFF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTotalNumberOfSSIDLaunches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 13) & 1;
}

- (void)setOnWifi:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x20u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_onWifi = a3;
}

- (void)setHasOnWifi:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 32;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFDF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasOnWifi
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 5) & 1;
}

- (void)setCoreMotionPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000000000uLL;
  self->_coreMotionPopularity = a3;
}

- (void)setHasCoreMotionPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCoreMotionPopularity
{
  return (*((_QWORD *)&self->_has + 1) >> 52) & 1;
}

- (void)setTotalNumberOfCoreMotionLaunches:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x800u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_totalNumberOfCoreMotionLaunches = a3;
}

- (void)setHasTotalNumberOfCoreMotionLaunches:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 2048;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xF7FF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasTotalNumberOfCoreMotionLaunches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 11) & 1;
}

- (void)setIsDateInWeekendOnDevice:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 1u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_isDateInWeekendOnDevice = a3;
}

- (void)setHasIsDateInWeekendOnDevice:(BOOL)a3
{
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFFE | a3;
}

- (BOOL)hasIsDateInWeekendOnDevice
{
  return *((_WORD *)&self->_has + 8) & 1;
}

- (void)setAmbientLightTypePopularity:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_ambientLightTypePopularity = a3;
}

- (void)setHasAmbientLightTypePopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAmbientLightTypePopularity
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setAmbientLightTypeLaunchPopularity:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_ambientLightTypeLaunchPopularity = a3;
}

- (void)setHasAmbientLightTypeLaunchPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAmbientLightTypeLaunchPopularity
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setAppTimeOfDayLaunches:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000000000uLL;
  self->_appTimeOfDayLaunches = a3;
}

- (void)setHasAppTimeOfDayLaunches:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppTimeOfDayLaunches
{
  return (*((_QWORD *)&self->_has + 1) >> 49) & 1;
}

- (void)setAppDayOfWeekLaunches:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_appDayOfWeekLaunches = a3;
}

- (void)setHasAppDayOfWeekLaunches:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAppDayOfWeekLaunches
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (void)setAppTimeAndDayOfWeekPopularity:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000000000uLL;
  self->_appTimeAndDayOfWeekPopularity = a3;
}

- (void)setHasAppTimeAndDayOfWeekPopularity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppTimeAndDayOfWeekPopularity
{
  return HIWORD(*((_QWORD *)&self->_has + 1)) & 1;
}

- (void)setAppPopularityGivenTimeAndDayOfWeek:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000000uLL;
  self->_appPopularityGivenTimeAndDayOfWeek = a3;
}

- (void)setHasAppPopularityGivenTimeAndDayOfWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppPopularityGivenTimeAndDayOfWeek
{
  return (*((_QWORD *)&self->_has + 1) >> 46) & 1;
}

- (void)setAppPopularityOfTimeAndDayOfWeekGivenApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000000000uLL;
  self->_appPopularityOfTimeAndDayOfWeekGivenApp = a3;
}

- (void)setHasAppPopularityOfTimeAndDayOfWeekGivenApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppPopularityOfTimeAndDayOfWeekGivenApp
{
  return (*((_QWORD *)&self->_has + 1) >> 47) & 1;
}

- (void)setAppTotalNumberOfTimeAndDayOfWeekLaunches:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000000000uLL;
  self->_appTotalNumberOfTimeAndDayOfWeekLaunches = a3;
}

- (void)setHasAppTotalNumberOfTimeAndDayOfWeekLaunches:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppTotalNumberOfTimeAndDayOfWeekLaunches
{
  return (*((_QWORD *)&self->_has + 1) >> 50) & 1;
}

- (void)setAppLaunchesCoarseTimePowLocationForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_appLaunchesCoarseTimePowLocationForAppInContext = a3;
}

- (void)setHasAppLaunchesCoarseTimePowLocationForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesCoarseTimePowLocationForAppInContext
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setAppLaunchesCoarseTimePowLocationInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_appLaunchesCoarseTimePowLocationInContext = a3;
}

- (void)setHasAppLaunchesCoarseTimePowLocationInContext:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasAppLaunchesCoarseTimePowLocationInContext
{
  return *(_QWORD *)&self->_has >> 63;
}

- (void)setAppLaunchesCoarseTimePowLocationForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_appLaunchesCoarseTimePowLocationForApp = a3;
}

- (void)setHasAppLaunchesCoarseTimePowLocationForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesCoarseTimePowLocationForApp
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (void)setAppLaunchesCoarseTimePowLocationForAllAppsAndContexts:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts = a3;
}

- (void)setHasAppLaunchesCoarseTimePowLocationForAllAppsAndContexts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesCoarseTimePowLocationForAllAppsAndContexts
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setAppLaunchesSpecificTimeDowLocationForAppInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000000uLL;
  self->_appLaunchesSpecificTimeDowLocationForAppInContext = a3;
}

- (void)setHasAppLaunchesSpecificTimeDowLocationForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesSpecificTimeDowLocationForAppInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 41) & 1;
}

- (void)setAppLaunchesSpecificTimeDowLocationInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000000uLL;
  self->_appLaunchesSpecificTimeDowLocationInContext = a3;
}

- (void)setHasAppLaunchesSpecificTimeDowLocationInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesSpecificTimeDowLocationInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 42) & 1;
}

- (void)setAppLaunchesSpecificTimeDowLocationForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000000uLL;
  self->_appLaunchesSpecificTimeDowLocationForApp = a3;
}

- (void)setHasAppLaunchesSpecificTimeDowLocationForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesSpecificTimeDowLocationForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 40) & 1;
}

- (void)setAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000000uLL;
  self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts = a3;
}

- (void)setHasAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts
{
  return (*((_QWORD *)&self->_has + 1) >> 39) & 1;
}

- (void)setAppLaunchesInTimeBucket0ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  self->_appLaunchesInTimeBucket0ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket0ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket0ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 4) & 1;
}

- (void)setAppLaunchesInTimeBucket1ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
  self->_appLaunchesInTimeBucket1ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket1ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket1ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 15) & 1;
}

- (void)setAppLaunchesInTimeBucket2ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  self->_appLaunchesInTimeBucket2ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket2ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket2ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 21) & 1;
}

- (void)setAppLaunchesInTimeBucket3ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  self->_appLaunchesInTimeBucket3ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket3ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket3ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 22) & 1;
}

- (void)setAppLaunchesInTimeBucket4ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  self->_appLaunchesInTimeBucket4ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket4ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket4ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 23) & 1;
}

- (void)setAppLaunchesInTimeBucket5ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  self->_appLaunchesInTimeBucket5ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket5ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket5ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 24) & 1;
}

- (void)setAppLaunchesInTimeBucket6ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  self->_appLaunchesInTimeBucket6ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket6ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket6ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 25) & 1;
}

- (void)setAppLaunchesInTimeBucket7ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
  self->_appLaunchesInTimeBucket7ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket7ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket7ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 26) & 1;
}

- (void)setAppLaunchesInTimeBucket8ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  self->_appLaunchesInTimeBucket8ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket8ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket8ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 27) & 1;
}

- (void)setAppLaunchesInTimeBucket9ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  self->_appLaunchesInTimeBucket9ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket9ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket9ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 28) & 1;
}

- (void)setAppLaunchesInTimeBucket10ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  self->_appLaunchesInTimeBucket10ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket10ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket10ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 5) & 1;
}

- (void)setAppLaunchesInTimeBucket11ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  self->_appLaunchesInTimeBucket11ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket11ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket11ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 6) & 1;
}

- (void)setAppLaunchesInTimeBucket12ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  self->_appLaunchesInTimeBucket12ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket12ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket12ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 7) & 1;
}

- (void)setAppLaunchesInTimeBucket13ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  self->_appLaunchesInTimeBucket13ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket13ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket13ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 8) & 1;
}

- (void)setAppLaunchesInTimeBucket14ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  self->_appLaunchesInTimeBucket14ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket14ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket14ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 9) & 1;
}

- (void)setAppLaunchesInTimeBucket15ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  self->_appLaunchesInTimeBucket15ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket15ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket15ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 10) & 1;
}

- (void)setAppLaunchesInTimeBucket16ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  self->_appLaunchesInTimeBucket16ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket16ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket16ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 11) & 1;
}

- (void)setAppLaunchesInTimeBucket17ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  self->_appLaunchesInTimeBucket17ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket17ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket17ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 12) & 1;
}

- (void)setAppLaunchesInTimeBucket18ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
  self->_appLaunchesInTimeBucket18ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket18ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket18ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 13) & 1;
}

- (void)setAppLaunchesInTimeBucket19ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  self->_appLaunchesInTimeBucket19ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket19ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket19ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 14) & 1;
}

- (void)setAppLaunchesInTimeBucket20ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  self->_appLaunchesInTimeBucket20ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket20ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket20ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 16) & 1;
}

- (void)setAppLaunchesInTimeBucket21ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  self->_appLaunchesInTimeBucket21ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket21ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket21ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 17) & 1;
}

- (void)setAppLaunchesInTimeBucket22ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  self->_appLaunchesInTimeBucket22ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket22ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket22ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 18) & 1;
}

- (void)setAppLaunchesInTimeBucket23ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  self->_appLaunchesInTimeBucket23ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket23ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket23ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 19) & 1;
}

- (void)setAppLaunchesInTimeBucket24ForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  self->_appLaunchesInTimeBucket24ForApp = a3;
}

- (void)setHasAppLaunchesInTimeBucket24ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTimeBucket24ForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 20) & 1;
}

- (void)setAppLaunchesOnDayOfWeekSundayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000000uLL;
  self->_appLaunchesOnDayOfWeekSundayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekSundayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekSundayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 35) & 1;
}

- (void)setAppLaunchesOnDayOfWeekMondayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  self->_appLaunchesOnDayOfWeekMondayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekMondayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekMondayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 33) & 1;
}

- (void)setAppLaunchesOnDayOfWeekTuesdayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000000uLL;
  self->_appLaunchesOnDayOfWeekTuesdayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekTuesdayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekTuesdayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 37) & 1;
}

- (void)setAppLaunchesOnDayOfWeekWednesdayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000000uLL;
  self->_appLaunchesOnDayOfWeekWednesdayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekWednesdayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekWednesdayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 38) & 1;
}

- (void)setAppLaunchesOnDayOfWeekThursdayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000000uLL;
  self->_appLaunchesOnDayOfWeekThursdayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekThursdayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekThursdayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 36) & 1;
}

- (void)setAppLaunchesOnDayOfWeekFridayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  self->_appLaunchesOnDayOfWeekFridayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekFridayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekFridayForApp
{
  return HIDWORD(*((_QWORD *)&self->_has + 1)) & 1;
}

- (void)setAppLaunchesOnDayOfWeekSaturdayForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  self->_appLaunchesOnDayOfWeekSaturdayForApp = a3;
}

- (void)setHasAppLaunchesOnDayOfWeekSaturdayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesOnDayOfWeekSaturdayForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 34) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash0ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_appLaunchesAtCoarseGeoHash0ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash0ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash0ForApp
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash1ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_appLaunchesAtCoarseGeoHash1ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash1ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash1ForApp
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash2ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_appLaunchesAtCoarseGeoHash2ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash2ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash2ForApp
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash3ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_appLaunchesAtCoarseGeoHash3ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash3ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash3ForApp
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash4ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_appLaunchesAtCoarseGeoHash4ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash4ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash4ForApp
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash5ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_appLaunchesAtCoarseGeoHash5ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash5ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash5ForApp
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash6ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_appLaunchesAtCoarseGeoHash6ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash6ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash6ForApp
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash7ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_appLaunchesAtCoarseGeoHash7ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash7ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash7ForApp
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash8ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_appLaunchesAtCoarseGeoHash8ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash8ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash8ForApp
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHash9ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_appLaunchesAtCoarseGeoHash9ForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHash9ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHash9ForApp
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash0ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_appLaunchesAtSpecificGeoHash0ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash0ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash0ForApp
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash1ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_appLaunchesAtSpecificGeoHash1ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash1ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash1ForApp
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash2ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_appLaunchesAtSpecificGeoHash2ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash2ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash2ForApp
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash3ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_appLaunchesAtSpecificGeoHash3ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash3ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash3ForApp
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash4ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_appLaunchesAtSpecificGeoHash4ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash4ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash4ForApp
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash5ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_appLaunchesAtSpecificGeoHash5ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash5ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash5ForApp
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash6ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_appLaunchesAtSpecificGeoHash6ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash6ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash6ForApp
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash7ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_appLaunchesAtSpecificGeoHash7ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash7ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash7ForApp
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash8ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_appLaunchesAtSpecificGeoHash8ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash8ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash8ForApp
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash9ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_appLaunchesAtSpecificGeoHash9ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash9ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash9ForApp
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash10ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_appLaunchesAtSpecificGeoHash10ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash10ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash10ForApp
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash11ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_appLaunchesAtSpecificGeoHash11ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash11ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash11ForApp
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash12ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_appLaunchesAtSpecificGeoHash12ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash12ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash12ForApp
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash13ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_appLaunchesAtSpecificGeoHash13ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash13ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash13ForApp
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHash14ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_appLaunchesAtSpecificGeoHash14ForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHash14ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHash14ForApp
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setAppNumberOfSpecificGeohashesForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000000uLL;
  self->_appNumberOfSpecificGeohashesForApp = a3;
}

- (void)setHasAppNumberOfSpecificGeohashesForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppNumberOfSpecificGeohashesForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 44) & 1;
}

- (void)setAppNumberOfCoarseGeohashesForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000000uLL;
  self->_appNumberOfCoarseGeohashesForApp = a3;
}

- (void)setHasAppNumberOfCoarseGeohashesForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasAppNumberOfCoarseGeohashesForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 43) & 1;
}

- (void)setAppEntropyForTimeBuckets:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_appEntropyForTimeBuckets = a3;
}

- (void)setHasAppEntropyForTimeBuckets:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAppEntropyForTimeBuckets
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setAppEntropyForSpecificGeoHash:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_appEntropyForSpecificGeoHash = a3;
}

- (void)setHasAppEntropyForSpecificGeoHash:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAppEntropyForSpecificGeoHash
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (void)setAppEntropyForCoarseGeoHash:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_appEntropyForCoarseGeoHash = a3;
}

- (void)setHasAppEntropyForCoarseGeoHash:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAppEntropyForCoarseGeoHash
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHashForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_appLaunchesAtSpecificGeoHashForAppInContext = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHashForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHashForAppInContext
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHashForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_appLaunchesAtCoarseGeoHashForAppInContext = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHashForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHashForAppInContext
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (void)setAppLaunchesAtDayOfWeekForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_appLaunchesAtDayOfWeekForApp = a3;
}

- (void)setHasAppLaunchesAtDayOfWeekForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtDayOfWeekForApp
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setAppLaunchesAtTimeAndDayForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_appLaunchesAtTimeAndDayForAppInContext = a3;
}

- (void)setHasAppLaunchesAtTimeAndDayForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtTimeAndDayForAppInContext
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setAppLaunchesAtTimeAndDayInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_appLaunchesAtTimeAndDayInContext = a3;
}

- (void)setHasAppLaunchesAtTimeAndDayInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtTimeAndDayInContext
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (void)setAppLaunchesAtTimeAndDayForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_appLaunchesAtTimeAndDayForApp = a3;
}

- (void)setHasAppLaunchesAtTimeAndDayForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtTimeAndDayForApp
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHashInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_appLaunchesAtCoarseGeoHashInContext = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHashInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHashInContext
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (void)setAppLaunchesAtCoarseGeoHashForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_appLaunchesAtCoarseGeoHashForApp = a3;
}

- (void)setHasAppLaunchesAtCoarseGeoHashForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtCoarseGeoHashForApp
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHashInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_appLaunchesAtSpecificGeoHashInContext = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHashInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHashInContext
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (void)setAppLaunchesAtSpecificGeoHashForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_appLaunchesAtSpecificGeoHashForApp = a3;
}

- (void)setHasAppLaunchesAtSpecificGeoHashForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSpecificGeoHashForApp
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate = a3;
}

- (void)setHasAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate:(BOOL)a3
{
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate
{
  return *((_DWORD *)&self->_has + 2) & 1;
}

- (void)setAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate = a3;
}

- (void)setHasAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate
{
  return (*((_QWORD *)&self->_has + 1) >> 1) & 1;
}

- (void)setIsLocationServicesDisabled:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 2u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_isLocationServicesDisabled = a3;
}

- (void)setHasIsLocationServicesDisabled:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFFD | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasIsLocationServicesDisabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 1) & 1;
}

- (void)setAppLaunchesInTwoHourTimeBucketForAppInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  self->_appLaunchesInTwoHourTimeBucketForAppInContext = a3;
}

- (void)setHasAppLaunchesInTwoHourTimeBucketForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTwoHourTimeBucketForAppInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 30) & 1;
}

- (void)setAppLaunchesInTwoHourTimeBucketInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  self->_appLaunchesInTwoHourTimeBucketInContext = a3;
}

- (void)setHasAppLaunchesInTwoHourTimeBucketInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTwoHourTimeBucketInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 31) & 1;
}

- (void)setAppLaunchesInTwoHourTimeBucketForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  self->_appLaunchesInTwoHourTimeBucketForApp = a3;
}

- (void)setHasAppLaunchesInTwoHourTimeBucketForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesInTwoHourTimeBucketForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 29) & 1;
}

- (void)setCurrentTimeBucketFromZeroToTwentyFour:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000000000uLL;
  self->_currentTimeBucketFromZeroToTwentyFour = a3;
}

- (void)setHasCurrentTimeBucketFromZeroToTwentyFour:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCurrentTimeBucketFromZeroToTwentyFour
{
  return (*((_QWORD *)&self->_has + 1) >> 53) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHashForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_appLaunchesAtZoom7GeoHashForAppInContext = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHashForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHashForAppInContext
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHashInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_appLaunchesAtZoom7GeoHashInContext = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHashInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHashInContext
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHashForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_appLaunchesAtZoom7GeoHashForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHashForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHashForApp
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash0ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_appLaunchesAtZoom7GeoHash0ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash0ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash0ForApp
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash1ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash1ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash1ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash1ForApp
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash2ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash2ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash2ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash2ForApp
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash3ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash3ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash3ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash3ForApp
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash4ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash4ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash4ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash4ForApp
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash5ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash5ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash5ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash5ForApp
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash6ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash6ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash6ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash6ForApp
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash7ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash7ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash7ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash7ForApp
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash8ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash8ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash8ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash8ForApp
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setAppLaunchesAtZoom7GeoHash9ForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_appLaunchesAtZoom7GeoHash9ForApp = a3;
}

- (void)setHasAppLaunchesAtZoom7GeoHash9ForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtZoom7GeoHash9ForApp
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setAppEntropyForZoom7GeoHash:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_appEntropyForZoom7GeoHash = a3;
}

- (void)setHasAppEntropyForZoom7GeoHash:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasAppEntropyForZoom7GeoHash
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setAppNumberOfZoom7GeohashesForApp:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000000uLL;
  self->_appNumberOfZoom7GeohashesForApp = a3;
}

- (void)setHasAppNumberOfZoom7GeohashesForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppNumberOfZoom7GeohashesForApp
{
  return (*((_QWORD *)&self->_has + 1) >> 45) & 1;
}

- (void)setAppLaunchesAtSSIDForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_appLaunchesAtSSIDForAppInContext = a3;
}

- (void)setHasAppLaunchesAtSSIDForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSSIDForAppInContext
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setAppLaunchesAtSSIDForApp:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_appLaunchesAtSSIDForApp = a3;
}

- (void)setHasAppLaunchesAtSSIDForApp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtSSIDForApp
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setAppLaunchesForCoreMotionForAppInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  self->_appLaunchesForCoreMotionForAppInContext = a3;
}

- (void)setHasAppLaunchesForCoreMotionForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAppLaunchesForCoreMotionForAppInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppLaunchesInAirplaneModeForAppInContext:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  self->_appLaunchesInAirplaneModeForAppInContext = a3;
}

- (void)setHasAppLaunchesInAirplaneModeForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAppLaunchesInAirplaneModeForAppInContext
{
  return (*((_QWORD *)&self->_has + 1) >> 3) & 1;
}

- (void)setPoiPopularityForAppInContext:(double)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x40u;
  *((_BYTE *)&self->_has + 18) = v3;
  self->_poiPopularityForAppInContext = a3;
}

- (void)setHasPoiPopularityForAppInContext:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 8) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if (a3)
    v4 = 64;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 8) = *((_WORD *)&self->_has + 8) & 0xFFBF | v4;
  *((_BYTE *)&self->_has + 18) = BYTE2(v3);
}

- (BOOL)hasPoiPopularityForAppInContext
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 8) >> 6) & 1;
}

- (void)setAppLaunchPopularityAtPOIForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_appLaunchPopularityAtPOIForAppInContext = a3;
}

- (void)setHasAppLaunchPopularityAtPOIForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasAppLaunchPopularityAtPOIForAppInContext
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setAppLaunchesAtPOIForAppInContext:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_appLaunchesAtPOIForAppInContext = a3;
}

- (void)setHasAppLaunchesAtPOIForAppInContext:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasAppLaunchesAtPOIForAppInContext
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBTaskAgnosticBehaviorFeatureVector;
  -[ATXPBTaskAgnosticBehaviorFeatureVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBTaskAgnosticBehaviorFeatureVector dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $7A5347D885FF313B503D4C0E33506E66 *p_has;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_has = &self->_has;
  v5 = *((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if ((v5 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_unlockTime);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("unlockTime"));

    LOWORD(v5) = *((_WORD *)&self->_has + 8);
  }
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_launchTimePopularity);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("launchTimePopularity"));

    LOWORD(v5) = *((_WORD *)&self->_has + 8);
    v7 = *(_QWORD *)p_has;
    v8 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_108;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeOfDayBucket);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("timeOfDayBucket"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_7;
    goto LABEL_109;
  }
LABEL_108:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeOfDayPopularity);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("timeOfDayPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_110;
  }
LABEL_109:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coarseTimeOfDayPopularity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("coarseTimeOfDayPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_launchPopularity);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("launchPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_10;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_launchDayOfWeekPopularity);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("launchDayOfWeekPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_11;
    goto LABEL_113;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dayOfWeekBucket);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("dayOfWeekBucket"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_12;
    goto LABEL_114;
  }
LABEL_113:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dayOfWeekPopularity);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("dayOfWeekPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000000) == 0)
  {
LABEL_12:
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_13;
    goto LABEL_115;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropyLaunchPopularity);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("entropyLaunchPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_14;
    goto LABEL_116;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropyDayOfWeekPopularity);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("entropyDayOfWeekPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_15;
    goto LABEL_117;
  }
LABEL_116:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropyDayOfWeekPopularityByDay);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("entropyDayOfWeekPopularityByDay"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_118;
  }
LABEL_117:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropyDayOfWeekPopularityByApp);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("entropyDayOfWeekPopularityByApp"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_119;
  }
LABEL_118:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropyTrendingPopularity);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("entropyTrendingPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropySSIDPopularity);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("entropySSIDPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_121;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropySSIDPopularityBySSID);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("entropySSIDPopularityBySSID"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_122;
  }
LABEL_121:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_entropySSIDPopularityByApp);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("entropySSIDPopularityByApp"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((v7 & 1) == 0)
      goto LABEL_21;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalNumberOfLaunches);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("totalNumberOfLaunches"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 1) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_airplaneModePopularity);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("airplaneModePopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_22:
    if ((v5 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalNumberOfAirplaneModeLaunches);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("totalNumberOfAirplaneModeLaunches"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_trendingPopularity);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("trendingPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalNumberOfTrendingLaunches);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("totalNumberOfTrendingLaunches"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sSIDPopularity);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("sSIDPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalNumberOfSSIDLaunches);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("totalNumberOfSSIDLaunches"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_28;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_onWifi);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("onWifi"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_coreMotionPopularity);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("coreMotionPopularity"));

  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalNumberOfCoreMotionLaunches);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("totalNumberOfCoreMotionLaunches"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*((_WORD *)&self->_has + 8) & 1) == 0)
  {
LABEL_30:
    if ((v7 & 4) == 0)
      goto LABEL_31;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_isDateInWeekendOnDevice);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("isDateInWeekendOnDevice"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 4) == 0)
  {
LABEL_31:
    if ((v7 & 2) == 0)
      goto LABEL_32;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ambientLightTypePopularity);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("ambientLightTypePopularity"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 2) == 0)
  {
LABEL_32:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_33;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ambientLightTypeLaunchPopularity);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("ambientLightTypeLaunchPopularity"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_33:
    if ((v7 & 8) == 0)
      goto LABEL_34;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appTimeOfDayLaunches);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("appTimeOfDayLaunches"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 8) == 0)
  {
LABEL_34:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_35;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appDayOfWeekLaunches);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("appDayOfWeekLaunches"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appTimeAndDayOfWeekPopularity);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("appTimeAndDayOfWeekPopularity"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_37;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appPopularityGivenTimeAndDayOfWeek);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("appPopularityGivenTimeAndDayOfWeek"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appPopularityOfTimeAndDayOfWeekGivenApp);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("appPopularityOfTimeAndDayOfWeekGivenApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appTotalNumberOfTimeAndDayOfWeekLaunches);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("appTotalNumberOfTimeAndDayOfWeekLaunches"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesCoarseTimePowLocationForAppInContext);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("appLaunchesCoarseTimePowLocationForAppInContext"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_41;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesCoarseTimePowLocationInContext);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("appLaunchesCoarseTimePowLocationInContext"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesCoarseTimePowLocationForApp);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("appLaunchesCoarseTimePowLocationForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("appLaunchesCoarseTimePowLocationForAllAppsAndContexts"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesSpecificTimeDowLocationForAppInContext);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("appLaunchesSpecificTimeDowLocationForAppInContext"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesSpecificTimeDowLocationInContext);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("appLaunchesSpecificTimeDowLocationInContext"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_46;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesSpecificTimeDowLocationForApp);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("appLaunchesSpecificTimeDowLocationForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("appLaunchesSpecificTimeDowLocationForAllAppsAndContexts"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10) == 0)
  {
LABEL_47:
    if ((v8 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket0ForApp);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("appLaunchesInTimeBucket0ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000) == 0)
  {
LABEL_48:
    if ((v8 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket1ForApp);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("appLaunchesInTimeBucket1ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000) == 0)
  {
LABEL_49:
    if ((v8 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket2ForApp);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("appLaunchesInTimeBucket2ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000) == 0)
  {
LABEL_50:
    if ((v8 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket3ForApp);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("appLaunchesInTimeBucket3ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket4ForApp);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("appLaunchesInTimeBucket4ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket5ForApp);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("appLaunchesInTimeBucket5ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x4000000) == 0)
      goto LABEL_54;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket6ForApp);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("appLaunchesInTimeBucket6ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket7ForApp);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("appLaunchesInTimeBucket7ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_55:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_56;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket8ForApp);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("appLaunchesInTimeBucket8ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_56:
    if ((v8 & 0x20) == 0)
      goto LABEL_57;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket9ForApp);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("appLaunchesInTimeBucket9ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20) == 0)
  {
LABEL_57:
    if ((v8 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket10ForApp);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("appLaunchesInTimeBucket10ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40) == 0)
  {
LABEL_58:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket11ForApp);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("appLaunchesInTimeBucket11ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80) == 0)
  {
LABEL_59:
    if ((v8 & 0x100) == 0)
      goto LABEL_60;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket12ForApp);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("appLaunchesInTimeBucket12ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100) == 0)
  {
LABEL_60:
    if ((v8 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket13ForApp);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("appLaunchesInTimeBucket13ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200) == 0)
  {
LABEL_61:
    if ((v8 & 0x400) == 0)
      goto LABEL_62;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket14ForApp);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("appLaunchesInTimeBucket14ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400) == 0)
  {
LABEL_62:
    if ((v8 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket15ForApp);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("appLaunchesInTimeBucket15ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800) == 0)
  {
LABEL_63:
    if ((v8 & 0x1000) == 0)
      goto LABEL_64;
    goto LABEL_166;
  }
LABEL_165:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket16ForApp);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("appLaunchesInTimeBucket16ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000) == 0)
  {
LABEL_64:
    if ((v8 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket17ForApp);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("appLaunchesInTimeBucket17ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000) == 0)
  {
LABEL_65:
    if ((v8 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket18ForApp);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("appLaunchesInTimeBucket18ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000) == 0)
  {
LABEL_66:
    if ((v8 & 0x10000) == 0)
      goto LABEL_67;
    goto LABEL_169;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket19ForApp);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("appLaunchesInTimeBucket19ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000) == 0)
  {
LABEL_67:
    if ((v8 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket20ForApp);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("appLaunchesInTimeBucket20ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000) == 0)
  {
LABEL_68:
    if ((v8 & 0x40000) == 0)
      goto LABEL_69;
    goto LABEL_171;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket21ForApp);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("appLaunchesInTimeBucket21ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000) == 0)
  {
LABEL_69:
    if ((v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_172;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket22ForApp);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("appLaunchesInTimeBucket22ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((v8 & 0x100000) == 0)
      goto LABEL_71;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket23ForApp);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("appLaunchesInTimeBucket23ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000) == 0)
  {
LABEL_71:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTimeBucket24ForApp);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("appLaunchesInTimeBucket24ForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekSundayForApp);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("appLaunchesOnDayOfWeekSundayForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_73:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_74;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekMondayForApp);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("appLaunchesOnDayOfWeekMondayForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_74:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_75;
    goto LABEL_177;
  }
LABEL_176:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekTuesdayForApp);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("appLaunchesOnDayOfWeekTuesdayForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_75:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_76;
    goto LABEL_178;
  }
LABEL_177:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekWednesdayForApp);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("appLaunchesOnDayOfWeekWednesdayForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_76:
    if ((v8 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekThursdayForApp);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("appLaunchesOnDayOfWeekThursdayForApp"));

  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekFridayForApp);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("appLaunchesOnDayOfWeekFridayForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x400000000) == 0)
  {
LABEL_78:
    if ((v7 & 0x200) == 0)
      goto LABEL_79;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesOnDayOfWeekSaturdayForApp);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("appLaunchesOnDayOfWeekSaturdayForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200) == 0)
  {
LABEL_79:
    if ((v7 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_182;
  }
LABEL_181:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash0ForApp);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("appLaunchesAtCoarseGeoHash0ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400) == 0)
  {
LABEL_80:
    if ((v7 & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash1ForApp);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("appLaunchesAtCoarseGeoHash1ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800) == 0)
  {
LABEL_81:
    if ((v7 & 0x1000) == 0)
      goto LABEL_82;
    goto LABEL_184;
  }
LABEL_183:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash2ForApp);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("appLaunchesAtCoarseGeoHash2ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000) == 0)
  {
LABEL_82:
    if ((v7 & 0x2000) == 0)
      goto LABEL_83;
    goto LABEL_185;
  }
LABEL_184:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash3ForApp);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("appLaunchesAtCoarseGeoHash3ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000) == 0)
  {
LABEL_83:
    if ((v7 & 0x4000) == 0)
      goto LABEL_84;
    goto LABEL_186;
  }
LABEL_185:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash4ForApp);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("appLaunchesAtCoarseGeoHash4ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000) == 0)
  {
LABEL_84:
    if ((v7 & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_187;
  }
LABEL_186:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash5ForApp);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("appLaunchesAtCoarseGeoHash5ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000) == 0)
  {
LABEL_85:
    if ((v7 & 0x10000) == 0)
      goto LABEL_86;
    goto LABEL_188;
  }
LABEL_187:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash6ForApp);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("appLaunchesAtCoarseGeoHash6ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000) == 0)
  {
LABEL_86:
    if ((v7 & 0x20000) == 0)
      goto LABEL_87;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash7ForApp);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("appLaunchesAtCoarseGeoHash7ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000) == 0)
  {
LABEL_87:
    if ((v7 & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash8ForApp);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("appLaunchesAtCoarseGeoHash8ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000) == 0)
  {
LABEL_88:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_89;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHash9ForApp);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("appLaunchesAtCoarseGeoHash9ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000) == 0)
  {
LABEL_89:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_90;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash0ForApp);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("appLaunchesAtSpecificGeoHash0ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_193;
  }
LABEL_192:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash1ForApp);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("appLaunchesAtSpecificGeoHash1ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_92;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash2ForApp);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("appLaunchesAtSpecificGeoHash2ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x800000000) == 0)
      goto LABEL_93;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash3ForApp);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("appLaunchesAtSpecificGeoHash3ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000) == 0)
  {
LABEL_93:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_196;
  }
LABEL_195:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash4ForApp);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("appLaunchesAtSpecificGeoHash4ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash5ForApp);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("appLaunchesAtSpecificGeoHash5ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_198;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash6ForApp);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("appLaunchesAtSpecificGeoHash6ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) == 0)
  {
LABEL_96:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_97;
    goto LABEL_199;
  }
LABEL_198:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash7ForApp);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("appLaunchesAtSpecificGeoHash7ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000) == 0)
  {
LABEL_97:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_98;
    goto LABEL_200;
  }
LABEL_199:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash8ForApp);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("appLaunchesAtSpecificGeoHash8ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000) == 0)
  {
LABEL_98:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_99;
    goto LABEL_201;
  }
LABEL_200:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash9ForApp);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v107, CFSTR("appLaunchesAtSpecificGeoHash9ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000) == 0)
  {
LABEL_99:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_100;
    goto LABEL_202;
  }
LABEL_201:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash10ForApp);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v108, CFSTR("appLaunchesAtSpecificGeoHash10ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_101;
    goto LABEL_203;
  }
LABEL_202:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash11ForApp);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("appLaunchesAtSpecificGeoHash11ForApp"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_203:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash12ForApp);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v110, CFSTR("appLaunchesAtSpecificGeoHash12ForApp"));

  if ((*(_QWORD *)p_has & 0x40000000) != 0)
  {
LABEL_102:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash13ForApp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("appLaunchesAtSpecificGeoHash13ForApp"));

  }
LABEL_103:
  v10 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHash14ForApp);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("appLaunchesAtSpecificGeoHash14ForApp"));

    v11 = *((_WORD *)&self->_has + 8);
    v10 = *(_QWORD *)p_has;
    v12 = *((_QWORD *)&self->_has + 1);
    if ((v12 & 0x100000000000) == 0)
      goto LABEL_207;
    goto LABEL_206;
  }
  v11 = *((_WORD *)&self->_has + 8);
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x100000000000) != 0)
  {
LABEL_206:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appNumberOfSpecificGeohashesForApp);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v112, CFSTR("appNumberOfSpecificGeohashesForApp"));

    v11 = *((_WORD *)&self->_has + 8);
    v10 = *(_QWORD *)p_has;
    v12 = *((_QWORD *)&self->_has + 1);
  }
LABEL_207:
  if ((v12 & 0x80000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appNumberOfCoarseGeohashesForApp);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("appNumberOfCoarseGeohashesForApp"));

    v11 = *((_WORD *)&self->_has + 8);
    v10 = *(_QWORD *)p_has;
    v12 = *((_QWORD *)&self->_has + 1);
    if ((*(_QWORD *)p_has & 0x40) == 0)
    {
LABEL_209:
      if ((v10 & 0x20) == 0)
        goto LABEL_210;
      goto LABEL_254;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_209;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appEntropyForTimeBuckets);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("appEntropyForTimeBuckets"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20) == 0)
  {
LABEL_210:
    if ((v10 & 0x10) == 0)
      goto LABEL_211;
    goto LABEL_255;
  }
LABEL_254:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appEntropyForSpecificGeoHash);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v118, CFSTR("appEntropyForSpecificGeoHash"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x10) == 0)
  {
LABEL_211:
    if ((v10 & 0x40000000000) == 0)
      goto LABEL_212;
    goto LABEL_256;
  }
LABEL_255:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appEntropyForCoarseGeoHash);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v119, CFSTR("appEntropyForCoarseGeoHash"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000) == 0)
  {
LABEL_212:
    if ((v10 & 0x100000) == 0)
      goto LABEL_213;
    goto LABEL_257;
  }
LABEL_256:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHashForAppInContext);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("appLaunchesAtSpecificGeoHashForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000) == 0)
  {
LABEL_213:
    if ((v10 & 0x400000) == 0)
      goto LABEL_214;
    goto LABEL_258;
  }
LABEL_257:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHashForAppInContext);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("appLaunchesAtCoarseGeoHashForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000) == 0)
  {
LABEL_214:
    if ((v10 & 0x200000000000) == 0)
      goto LABEL_215;
    goto LABEL_259;
  }
LABEL_258:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtDayOfWeekForApp);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("appLaunchesAtDayOfWeekForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000000000) == 0)
  {
LABEL_215:
    if ((v10 & 0x400000000000) == 0)
      goto LABEL_216;
    goto LABEL_260;
  }
LABEL_259:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtTimeAndDayForAppInContext);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("appLaunchesAtTimeAndDayForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000000000) == 0)
  {
LABEL_216:
    if ((v10 & 0x100000000000) == 0)
      goto LABEL_217;
    goto LABEL_261;
  }
LABEL_260:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtTimeAndDayInContext);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v124, CFSTR("appLaunchesAtTimeAndDayInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000000000) == 0)
  {
LABEL_217:
    if ((v10 & 0x200000) == 0)
      goto LABEL_218;
    goto LABEL_262;
  }
LABEL_261:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtTimeAndDayForApp);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v125, CFSTR("appLaunchesAtTimeAndDayForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000) == 0)
  {
LABEL_218:
    if ((v10 & 0x80000) == 0)
      goto LABEL_219;
    goto LABEL_263;
  }
LABEL_262:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHashInContext);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v126, CFSTR("appLaunchesAtCoarseGeoHashInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000) == 0)
  {
LABEL_219:
    if ((v10 & 0x80000000000) == 0)
      goto LABEL_220;
    goto LABEL_264;
  }
LABEL_263:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtCoarseGeoHashForApp);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("appLaunchesAtCoarseGeoHashForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000000000) == 0)
  {
LABEL_220:
    if ((v10 & 0x20000000000) == 0)
      goto LABEL_221;
    goto LABEL_265;
  }
LABEL_264:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHashInContext);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v128, CFSTR("appLaunchesAtSpecificGeoHashInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
LABEL_221:
    if ((v12 & 1) == 0)
      goto LABEL_222;
    goto LABEL_266;
  }
LABEL_265:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSpecificGeoHashForApp);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v129, CFSTR("appLaunchesAtSpecificGeoHashForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 1) == 0)
  {
LABEL_222:
    if ((v12 & 2) == 0)
      goto LABEL_223;
    goto LABEL_267;
  }
LABEL_266:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v130, CFSTR("appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 2) == 0)
  {
LABEL_223:
    if ((v11 & 2) == 0)
      goto LABEL_224;
    goto LABEL_268;
  }
LABEL_267:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v131, CFSTR("appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 2) == 0)
  {
LABEL_224:
    if ((v12 & 0x40000000) == 0)
      goto LABEL_225;
    goto LABEL_269;
  }
LABEL_268:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_isLocationServicesDisabled);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v132, CFSTR("isLocationServicesDisabled"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x40000000) == 0)
  {
LABEL_225:
    if ((v12 & 0x80000000) == 0)
      goto LABEL_226;
    goto LABEL_270;
  }
LABEL_269:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTwoHourTimeBucketForAppInContext);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v133, CFSTR("appLaunchesInTwoHourTimeBucketForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x80000000) == 0)
  {
LABEL_226:
    if ((v12 & 0x20000000) == 0)
      goto LABEL_227;
    goto LABEL_271;
  }
LABEL_270:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTwoHourTimeBucketInContext);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v134, CFSTR("appLaunchesInTwoHourTimeBucketInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x20000000) == 0)
  {
LABEL_227:
    if ((v12 & 0x20000000000000) == 0)
      goto LABEL_228;
    goto LABEL_272;
  }
LABEL_271:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInTwoHourTimeBucketForApp);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v135, CFSTR("appLaunchesInTwoHourTimeBucketForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x20000000000000) == 0)
  {
LABEL_228:
    if ((v10 & 0x400000000000000) == 0)
      goto LABEL_229;
    goto LABEL_273;
  }
LABEL_272:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentTimeBucketFromZeroToTwentyFour);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v136, CFSTR("currentTimeBucketFromZeroToTwentyFour"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000000000000) == 0)
  {
LABEL_229:
    if ((v10 & 0x800000000000000) == 0)
      goto LABEL_230;
    goto LABEL_274;
  }
LABEL_273:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHashForAppInContext);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v137, CFSTR("appLaunchesAtZoom7GeoHashForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000000) == 0)
  {
LABEL_230:
    if ((v10 & 0x200000000000000) == 0)
      goto LABEL_231;
    goto LABEL_275;
  }
LABEL_274:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHashInContext);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v138, CFSTR("appLaunchesAtZoom7GeoHashInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000000000000) == 0)
  {
LABEL_231:
    if ((v10 & 0x800000000000) == 0)
      goto LABEL_232;
    goto LABEL_276;
  }
LABEL_275:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHashForApp);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v139, CFSTR("appLaunchesAtZoom7GeoHashForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000) == 0)
  {
LABEL_232:
    if ((v10 & 0x1000000000000) == 0)
      goto LABEL_233;
    goto LABEL_277;
  }
LABEL_276:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash0ForApp);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v140, CFSTR("appLaunchesAtZoom7GeoHash0ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000) == 0)
  {
LABEL_233:
    if ((v10 & 0x2000000000000) == 0)
      goto LABEL_234;
    goto LABEL_278;
  }
LABEL_277:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash1ForApp);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v141, CFSTR("appLaunchesAtZoom7GeoHash1ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000) == 0)
  {
LABEL_234:
    if ((v10 & 0x4000000000000) == 0)
      goto LABEL_235;
    goto LABEL_279;
  }
LABEL_278:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash2ForApp);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v142, CFSTR("appLaunchesAtZoom7GeoHash2ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000) == 0)
  {
LABEL_235:
    if ((v10 & 0x8000000000000) == 0)
      goto LABEL_236;
    goto LABEL_280;
  }
LABEL_279:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash3ForApp);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v143, CFSTR("appLaunchesAtZoom7GeoHash3ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000) == 0)
  {
LABEL_236:
    if ((v10 & 0x10000000000000) == 0)
      goto LABEL_237;
    goto LABEL_281;
  }
LABEL_280:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash4ForApp);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v144, CFSTR("appLaunchesAtZoom7GeoHash4ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x10000000000000) == 0)
  {
LABEL_237:
    if ((v10 & 0x20000000000000) == 0)
      goto LABEL_238;
    goto LABEL_282;
  }
LABEL_281:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash5ForApp);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v145, CFSTR("appLaunchesAtZoom7GeoHash5ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20000000000000) == 0)
  {
LABEL_238:
    if ((v10 & 0x40000000000000) == 0)
      goto LABEL_239;
    goto LABEL_283;
  }
LABEL_282:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash6ForApp);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v146, CFSTR("appLaunchesAtZoom7GeoHash6ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000000) == 0)
  {
LABEL_239:
    if ((v10 & 0x80000000000000) == 0)
      goto LABEL_240;
    goto LABEL_284;
  }
LABEL_283:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash7ForApp);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v147, CFSTR("appLaunchesAtZoom7GeoHash7ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000000000000) == 0)
  {
LABEL_240:
    if ((v10 & 0x100000000000000) == 0)
      goto LABEL_241;
    goto LABEL_285;
  }
LABEL_284:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash8ForApp);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v148, CFSTR("appLaunchesAtZoom7GeoHash8ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000000000000) == 0)
  {
LABEL_241:
    if ((v10 & 0x80) == 0)
      goto LABEL_242;
    goto LABEL_286;
  }
LABEL_285:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtZoom7GeoHash9ForApp);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v149, CFSTR("appLaunchesAtZoom7GeoHash9ForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80) == 0)
  {
LABEL_242:
    if ((v12 & 0x200000000000) == 0)
      goto LABEL_243;
    goto LABEL_287;
  }
LABEL_286:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appEntropyForZoom7GeoHash);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v150, CFSTR("appEntropyForZoom7GeoHash"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 0x200000000000) == 0)
  {
LABEL_243:
    if ((v10 & 0x2000000) == 0)
      goto LABEL_244;
    goto LABEL_288;
  }
LABEL_287:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appNumberOfZoom7GeohashesForApp);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v151, CFSTR("appNumberOfZoom7GeohashesForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000) == 0)
  {
LABEL_244:
    if ((v10 & 0x1000000) == 0)
      goto LABEL_245;
    goto LABEL_289;
  }
LABEL_288:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSSIDForAppInContext);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v152, CFSTR("appLaunchesAtSSIDForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000) == 0)
  {
LABEL_245:
    if ((v12 & 4) == 0)
      goto LABEL_246;
    goto LABEL_290;
  }
LABEL_289:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtSSIDForApp);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v153, CFSTR("appLaunchesAtSSIDForApp"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  v12 = *((_QWORD *)&self->_has + 1);
  if ((v12 & 4) == 0)
  {
LABEL_246:
    if ((v12 & 8) == 0)
      goto LABEL_247;
    goto LABEL_291;
  }
LABEL_290:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesForCoreMotionForAppInContext);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v154, CFSTR("appLaunchesForCoreMotionForAppInContext"));

  v11 = *((_WORD *)&self->_has + 8);
  v10 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 8) == 0)
  {
LABEL_247:
    if ((v11 & 0x40) == 0)
      goto LABEL_248;
    goto LABEL_292;
  }
LABEL_291:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesInAirplaneModeForAppInContext);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v155, CFSTR("appLaunchesInAirplaneModeForAppInContext"));

  v10 = *(_QWORD *)p_has;
  if ((*((_WORD *)&self->_has + 8) & 0x40) == 0)
  {
LABEL_248:
    if ((v10 & 0x100) == 0)
      goto LABEL_249;
LABEL_293:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchPopularityAtPOIForAppInContext);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v157, CFSTR("appLaunchPopularityAtPOIForAppInContext"));

    if ((*(_QWORD *)p_has & 0x800000) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_292:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_poiPopularityForAppInContext);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v156, CFSTR("poiPopularityForAppInContext"));

  v10 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100) != 0)
    goto LABEL_293;
LABEL_249:
  if ((v10 & 0x800000) != 0)
  {
LABEL_250:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_appLaunchesAtPOIForAppInContext);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("appLaunchesAtPOIForAppInContext"));

  }
LABEL_251:
  v114 = v3;

  return v114;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBTaskAgnosticBehaviorFeatureVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $7A5347D885FF313B503D4C0E33506E66 *p_has;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  p_has = &self->_has;
  v6 = *((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16);
  v12 = v4;
  if ((v6 & 0x10000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v12;
    LOWORD(v6) = *((_WORD *)&self->_has + 8);
  }
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v12;
    LOWORD(v6) = *((_WORD *)&self->_has + 8);
    v7 = *(_QWORD *)p_has;
    v8 = *((_QWORD *)&self->_has + 1);
    if ((v6 & 0x100) == 0)
    {
LABEL_5:
      if ((v6 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_108;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x200) == 0)
  {
LABEL_6:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_7;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0)
      goto LABEL_8;
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 8) == 0)
  {
LABEL_8:
    if ((v6 & 4) == 0)
      goto LABEL_9;
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 4) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_10;
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_11;
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_12;
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000000) == 0)
  {
LABEL_12:
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_13;
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_14;
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_15;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((v6 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x1000) == 0)
  {
LABEL_20:
    if ((v7 & 1) == 0)
      goto LABEL_21;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 1) == 0)
  {
LABEL_21:
    if ((v6 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x400) == 0)
  {
LABEL_22:
    if ((v6 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x8000) == 0)
  {
LABEL_23:
    if ((v6 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x4000) == 0)
  {
LABEL_24:
    if ((v6 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x80) == 0)
  {
LABEL_25:
    if ((v6 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((v6 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x20) == 0)
  {
LABEL_27:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_28;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_28:
    if ((v6 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  LOWORD(v6) = *((_WORD *)&self->_has + 8);
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x800) == 0)
  {
LABEL_29:
    if ((v6 & 1) == 0)
      goto LABEL_30;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*((_WORD *)&self->_has + 8) & 1) == 0)
  {
LABEL_30:
    if ((v7 & 4) == 0)
      goto LABEL_31;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 4) == 0)
  {
LABEL_31:
    if ((v7 & 2) == 0)
      goto LABEL_32;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 2) == 0)
  {
LABEL_32:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_33;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_33:
    if ((v7 & 8) == 0)
      goto LABEL_34;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 8) == 0)
  {
LABEL_34:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_35;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_37;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_41;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_46;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10) == 0)
  {
LABEL_47:
    if ((v8 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000) == 0)
  {
LABEL_48:
    if ((v8 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000) == 0)
  {
LABEL_49:
    if ((v8 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000) == 0)
  {
LABEL_50:
    if ((v8 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x4000000) == 0)
      goto LABEL_54;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_55:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_56;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_56:
    if ((v8 & 0x20) == 0)
      goto LABEL_57;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20) == 0)
  {
LABEL_57:
    if ((v8 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40) == 0)
  {
LABEL_58:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80) == 0)
  {
LABEL_59:
    if ((v8 & 0x100) == 0)
      goto LABEL_60;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100) == 0)
  {
LABEL_60:
    if ((v8 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200) == 0)
  {
LABEL_61:
    if ((v8 & 0x400) == 0)
      goto LABEL_62;
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400) == 0)
  {
LABEL_62:
    if ((v8 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800) == 0)
  {
LABEL_63:
    if ((v8 & 0x1000) == 0)
      goto LABEL_64;
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000) == 0)
  {
LABEL_64:
    if ((v8 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000) == 0)
  {
LABEL_65:
    if ((v8 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000) == 0)
  {
LABEL_66:
    if ((v8 & 0x10000) == 0)
      goto LABEL_67;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000) == 0)
  {
LABEL_67:
    if ((v8 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000) == 0)
  {
LABEL_68:
    if ((v8 & 0x40000) == 0)
      goto LABEL_69;
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000) == 0)
  {
LABEL_69:
    if ((v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((v8 & 0x100000) == 0)
      goto LABEL_71;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000) == 0)
  {
LABEL_71:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_73:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_74;
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_74:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_75;
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_75:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_76;
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_76:
    if ((v8 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x400000000) == 0)
  {
LABEL_78:
    if ((v7 & 0x200) == 0)
      goto LABEL_79;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200) == 0)
  {
LABEL_79:
    if ((v7 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400) == 0)
  {
LABEL_80:
    if ((v7 & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800) == 0)
  {
LABEL_81:
    if ((v7 & 0x1000) == 0)
      goto LABEL_82;
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000) == 0)
  {
LABEL_82:
    if ((v7 & 0x2000) == 0)
      goto LABEL_83;
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000) == 0)
  {
LABEL_83:
    if ((v7 & 0x4000) == 0)
      goto LABEL_84;
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000) == 0)
  {
LABEL_84:
    if ((v7 & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000) == 0)
  {
LABEL_85:
    if ((v7 & 0x10000) == 0)
      goto LABEL_86;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000) == 0)
  {
LABEL_86:
    if ((v7 & 0x20000) == 0)
      goto LABEL_87;
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000) == 0)
  {
LABEL_87:
    if ((v7 & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000) == 0)
  {
LABEL_88:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_89;
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000) == 0)
  {
LABEL_89:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_90;
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_92;
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x800000000) == 0)
      goto LABEL_93;
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000) == 0)
  {
LABEL_93:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) == 0)
  {
LABEL_96:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_97;
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000) == 0)
  {
LABEL_97:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_98;
    goto LABEL_200;
  }
LABEL_199:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000) == 0)
  {
LABEL_98:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_99;
    goto LABEL_201;
  }
LABEL_200:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000) == 0)
  {
LABEL_99:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_100;
    goto LABEL_202;
  }
LABEL_201:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_101;
    goto LABEL_203;
  }
LABEL_202:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_203:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  if ((*(_QWORD *)p_has & 0x40000000) != 0)
  {
LABEL_102:
    PBDataWriterWriteDoubleField();
    v4 = v12;
  }
LABEL_103:
  v9 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v12;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = *(_QWORD *)p_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_207;
    goto LABEL_206;
  }
  v10 = *((_WORD *)&self->_has + 8);
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x100000000000) != 0)
  {
LABEL_206:
    PBDataWriterWriteDoubleField();
    v4 = v12;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = *(_QWORD *)p_has;
    v11 = *((_QWORD *)&self->_has + 1);
  }
LABEL_207:
  if ((v11 & 0x80000000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v12;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = *(_QWORD *)p_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((*(_QWORD *)p_has & 0x40) == 0)
    {
LABEL_209:
      if ((v9 & 0x20) == 0)
        goto LABEL_210;
      goto LABEL_254;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_209;
  }
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20) == 0)
  {
LABEL_210:
    if ((v9 & 0x10) == 0)
      goto LABEL_211;
    goto LABEL_255;
  }
LABEL_254:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x10) == 0)
  {
LABEL_211:
    if ((v9 & 0x40000000000) == 0)
      goto LABEL_212;
    goto LABEL_256;
  }
LABEL_255:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000) == 0)
  {
LABEL_212:
    if ((v9 & 0x100000) == 0)
      goto LABEL_213;
    goto LABEL_257;
  }
LABEL_256:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000) == 0)
  {
LABEL_213:
    if ((v9 & 0x400000) == 0)
      goto LABEL_214;
    goto LABEL_258;
  }
LABEL_257:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000) == 0)
  {
LABEL_214:
    if ((v9 & 0x200000000000) == 0)
      goto LABEL_215;
    goto LABEL_259;
  }
LABEL_258:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000000000) == 0)
  {
LABEL_215:
    if ((v9 & 0x400000000000) == 0)
      goto LABEL_216;
    goto LABEL_260;
  }
LABEL_259:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000000000) == 0)
  {
LABEL_216:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_217;
    goto LABEL_261;
  }
LABEL_260:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000000000) == 0)
  {
LABEL_217:
    if ((v9 & 0x200000) == 0)
      goto LABEL_218;
    goto LABEL_262;
  }
LABEL_261:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000) == 0)
  {
LABEL_218:
    if ((v9 & 0x80000) == 0)
      goto LABEL_219;
    goto LABEL_263;
  }
LABEL_262:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000) == 0)
  {
LABEL_219:
    if ((v9 & 0x80000000000) == 0)
      goto LABEL_220;
    goto LABEL_264;
  }
LABEL_263:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000000000) == 0)
  {
LABEL_220:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_221;
    goto LABEL_265;
  }
LABEL_264:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
LABEL_221:
    if ((v11 & 1) == 0)
      goto LABEL_222;
    goto LABEL_266;
  }
LABEL_265:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 1) == 0)
  {
LABEL_222:
    if ((v11 & 2) == 0)
      goto LABEL_223;
    goto LABEL_267;
  }
LABEL_266:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 2) == 0)
  {
LABEL_223:
    if ((v10 & 2) == 0)
      goto LABEL_224;
    goto LABEL_268;
  }
LABEL_267:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v10 & 2) == 0)
  {
LABEL_224:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_225;
    goto LABEL_269;
  }
LABEL_268:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_225:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_226;
    goto LABEL_270;
  }
LABEL_269:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_226:
    if ((v11 & 0x20000000) == 0)
      goto LABEL_227;
    goto LABEL_271;
  }
LABEL_270:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_227:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_228;
    goto LABEL_272;
  }
LABEL_271:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_228:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_229;
    goto LABEL_273;
  }
LABEL_272:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x400000000000000) == 0)
  {
LABEL_229:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_230;
    goto LABEL_274;
  }
LABEL_273:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000000) == 0)
  {
LABEL_230:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_231;
    goto LABEL_275;
  }
LABEL_274:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x200000000000000) == 0)
  {
LABEL_231:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_232;
    goto LABEL_276;
  }
LABEL_275:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000) == 0)
  {
LABEL_232:
    if ((v9 & 0x1000000000000) == 0)
      goto LABEL_233;
    goto LABEL_277;
  }
LABEL_276:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000) == 0)
  {
LABEL_233:
    if ((v9 & 0x2000000000000) == 0)
      goto LABEL_234;
    goto LABEL_278;
  }
LABEL_277:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000) == 0)
  {
LABEL_234:
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_235;
    goto LABEL_279;
  }
LABEL_278:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000) == 0)
  {
LABEL_235:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_236;
    goto LABEL_280;
  }
LABEL_279:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000) == 0)
  {
LABEL_236:
    if ((v9 & 0x10000000000000) == 0)
      goto LABEL_237;
    goto LABEL_281;
  }
LABEL_280:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x10000000000000) == 0)
  {
LABEL_237:
    if ((v9 & 0x20000000000000) == 0)
      goto LABEL_238;
    goto LABEL_282;
  }
LABEL_281:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x20000000000000) == 0)
  {
LABEL_238:
    if ((v9 & 0x40000000000000) == 0)
      goto LABEL_239;
    goto LABEL_283;
  }
LABEL_282:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000000) == 0)
  {
LABEL_239:
    if ((v9 & 0x80000000000000) == 0)
      goto LABEL_240;
    goto LABEL_284;
  }
LABEL_283:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80000000000000) == 0)
  {
LABEL_240:
    if ((v9 & 0x100000000000000) == 0)
      goto LABEL_241;
    goto LABEL_285;
  }
LABEL_284:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x100000000000000) == 0)
  {
LABEL_241:
    if ((v9 & 0x80) == 0)
      goto LABEL_242;
    goto LABEL_286;
  }
LABEL_285:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x80) == 0)
  {
LABEL_242:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_243;
    goto LABEL_287;
  }
LABEL_286:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_243:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_244;
    goto LABEL_288;
  }
LABEL_287:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000) == 0)
  {
LABEL_244:
    if ((v9 & 0x1000000) == 0)
      goto LABEL_245;
    goto LABEL_289;
  }
LABEL_288:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000) == 0)
  {
LABEL_245:
    if ((v11 & 4) == 0)
      goto LABEL_246;
    goto LABEL_290;
  }
LABEL_289:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 4) == 0)
  {
LABEL_246:
    if ((v11 & 8) == 0)
      goto LABEL_247;
    goto LABEL_291;
  }
LABEL_290:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 8) == 0)
  {
LABEL_247:
    if ((v10 & 0x40) == 0)
      goto LABEL_248;
    goto LABEL_292;
  }
LABEL_291:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v9 = *(_QWORD *)p_has;
  if ((*((_WORD *)&self->_has + 8) & 0x40) == 0)
  {
LABEL_248:
    if ((v9 & 0x100) == 0)
      goto LABEL_249;
LABEL_293:
    PBDataWriterWriteDoubleField();
    v4 = v12;
    if ((*(_QWORD *)p_has & 0x800000) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_292:
  PBDataWriterWriteDoubleField();
  v4 = v12;
  v9 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100) != 0)
    goto LABEL_293;
LABEL_249:
  if ((v9 & 0x800000) != 0)
  {
LABEL_250:
    PBDataWriterWriteDoubleField();
    v4 = v12;
  }
LABEL_251:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t has;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v4 = a3;
  v5 = *((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if ((v5 & 0x10000) != 0)
  {
    v4[145] = *(_QWORD *)&self->_unlockTime;
    v5 = *((unsigned __int16 *)v4 + 592);
    v6 = (v5 | (*((unsigned __int8 *)v4 + 1186) << 16) | 0x10000u) >> 16;
    *((_WORD *)v4 + 592) = v5;
    *((_BYTE *)v4 + 1186) = v6;
    LOWORD(v5) = *((_WORD *)&self->_has + 8);
  }
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) != 0)
  {
    v4[133] = *(_QWORD *)&self->_launchTimePopularity;
    v12 = *((_BYTE *)v4 + 1186);
    *((_WORD *)v4 + 592) |= 0x10u;
    *((_BYTE *)v4 + 1186) = v12;
    LOWORD(v5) = *((_WORD *)&self->_has + 8);
    has = (uint64_t)self->_has;
    v8 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_108;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_5;
  }
  v4[137] = *(_QWORD *)&self->_timeOfDayBucket;
  v13 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x100u;
  *((_BYTE *)v4 + 1186) = v13;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_7;
    goto LABEL_109;
  }
LABEL_108:
  v4[138] = *(_QWORD *)&self->_timeOfDayPopularity;
  v14 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x200u;
  *((_BYTE *)v4 + 1186) = v14;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_110;
  }
LABEL_109:
  v4[116] = *(_QWORD *)&self->_coarseTimeOfDayPopularity;
  v4[147] |= 0x8000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_111;
  }
LABEL_110:
  v4[132] = *(_QWORD *)&self->_launchPopularity;
  v15 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 8u;
  *((_BYTE *)v4 + 1186) = v15;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_10;
    goto LABEL_112;
  }
LABEL_111:
  v4[131] = *(_QWORD *)&self->_launchDayOfWeekPopularity;
  v16 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 4u;
  *((_BYTE *)v4 + 1186) = v16;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_11;
    goto LABEL_113;
  }
LABEL_112:
  v4[119] = *(_QWORD *)&self->_dayOfWeekBucket;
  v4[147] |= 0x40000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_12;
    goto LABEL_114;
  }
LABEL_113:
  v4[120] = *(_QWORD *)&self->_dayOfWeekPopularity;
  v4[147] |= 0x80000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000000) == 0)
  {
LABEL_12:
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_13;
    goto LABEL_115;
  }
LABEL_114:
  v4[124] = *(_QWORD *)&self->_entropyLaunchPopularity;
  v4[147] |= 0x800000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_14;
    goto LABEL_116;
  }
LABEL_115:
  v4[121] = *(_QWORD *)&self->_entropyDayOfWeekPopularity;
  v4[147] |= 0x100000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_15;
    goto LABEL_117;
  }
LABEL_116:
  v4[123] = *(_QWORD *)&self->_entropyDayOfWeekPopularityByDay;
  v4[147] |= 0x400000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_118;
  }
LABEL_117:
  v4[122] = *(_QWORD *)&self->_entropyDayOfWeekPopularityByApp;
  v4[147] |= 0x200000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_119;
  }
LABEL_118:
  v4[128] = *(_QWORD *)&self->_entropyTrendingPopularity;
  v4[147] |= 0x8000000000000000;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_120;
  }
LABEL_119:
  v4[125] = *(_QWORD *)&self->_entropySSIDPopularity;
  v4[147] |= 0x1000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_121;
  }
LABEL_120:
  v4[127] = *(_QWORD *)&self->_entropySSIDPopularityBySSID;
  v4[147] |= 0x4000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_122;
  }
LABEL_121:
  v4[126] = *(_QWORD *)&self->_entropySSIDPopularityByApp;
  v4[147] |= 0x2000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((has & 1) == 0)
      goto LABEL_21;
    goto LABEL_123;
  }
LABEL_122:
  v4[141] = *(_QWORD *)&self->_totalNumberOfLaunches;
  v17 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x1000u;
  *((_BYTE *)v4 + 1186) = v17;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_124;
  }
LABEL_123:
  v4[1] = *(_QWORD *)&self->_airplaneModePopularity;
  v4[146] |= 1uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_22:
    if ((v5 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_124:
  v4[139] = *(_QWORD *)&self->_totalNumberOfAirplaneModeLaunches;
  v18 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x400u;
  *((_BYTE *)v4 + 1186) = v18;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_126;
  }
LABEL_125:
  v4[144] = *(_QWORD *)&self->_trendingPopularity;
  v19 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x8000u;
  *((_BYTE *)v4 + 1186) = v19;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_127;
  }
LABEL_126:
  v4[143] = *(_QWORD *)&self->_totalNumberOfTrendingLaunches;
  v20 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x4000u;
  *((_BYTE *)v4 + 1186) = v20;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_128;
  }
LABEL_127:
  v4[136] = *(_QWORD *)&self->_sSIDPopularity;
  v21 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x80u;
  *((_BYTE *)v4 + 1186) = v21;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_129;
  }
LABEL_128:
  v4[142] = *(_QWORD *)&self->_totalNumberOfSSIDLaunches;
  v22 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x2000u;
  *((_BYTE *)v4 + 1186) = v22;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_28;
    goto LABEL_130;
  }
LABEL_129:
  v4[134] = *(_QWORD *)&self->_onWifi;
  v23 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x20u;
  *((_BYTE *)v4 + 1186) = v23;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_131;
  }
LABEL_130:
  v4[117] = *(_QWORD *)&self->_coreMotionPopularity;
  v4[147] |= 0x10000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_132;
  }
LABEL_131:
  v4[140] = *(_QWORD *)&self->_totalNumberOfCoreMotionLaunches;
  v24 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x800u;
  *((_BYTE *)v4 + 1186) = v24;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*((_WORD *)&self->_has + 8) & 1) == 0)
  {
LABEL_30:
    if ((has & 4) == 0)
      goto LABEL_31;
    goto LABEL_133;
  }
LABEL_132:
  v4[129] = *(_QWORD *)&self->_isDateInWeekendOnDevice;
  v25 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 1u;
  *((_BYTE *)v4 + 1186) = v25;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_31:
    if ((has & 2) == 0)
      goto LABEL_32;
    goto LABEL_134;
  }
LABEL_133:
  v4[3] = *(_QWORD *)&self->_ambientLightTypePopularity;
  v4[146] |= 4uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 2) == 0)
  {
LABEL_32:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_33;
    goto LABEL_135;
  }
LABEL_134:
  v4[2] = *(_QWORD *)&self->_ambientLightTypeLaunchPopularity;
  v4[146] |= 2uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_33:
    if ((has & 8) == 0)
      goto LABEL_34;
    goto LABEL_136;
  }
LABEL_135:
  v4[114] = *(_QWORD *)&self->_appTimeOfDayLaunches;
  v4[147] |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_34:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_35;
    goto LABEL_137;
  }
LABEL_136:
  v4[4] = *(_QWORD *)&self->_appDayOfWeekLaunches;
  v4[146] |= 8uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_138;
  }
LABEL_137:
  v4[113] = *(_QWORD *)&self->_appTimeAndDayOfWeekPopularity;
  v4[147] |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_37;
    goto LABEL_139;
  }
LABEL_138:
  v4[111] = *(_QWORD *)&self->_appPopularityGivenTimeAndDayOfWeek;
  v4[147] |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_140;
  }
LABEL_139:
  v4[112] = *(_QWORD *)&self->_appPopularityOfTimeAndDayOfWeekGivenApp;
  v4[147] |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_141;
  }
LABEL_140:
  v4[115] = *(_QWORD *)&self->_appTotalNumberOfTimeAndDayOfWeekLaunches;
  v4[147] |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_39:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_142;
  }
LABEL_141:
  v4[63] = *(_QWORD *)&self->_appLaunchesCoarseTimePowLocationForAppInContext;
  v4[146] |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_40:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_41;
    goto LABEL_143;
  }
LABEL_142:
  v4[64] = *(_QWORD *)&self->_appLaunchesCoarseTimePowLocationInContext;
  v4[146] |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_144;
  }
LABEL_143:
  v4[62] = *(_QWORD *)&self->_appLaunchesCoarseTimePowLocationForApp;
  v4[146] |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_145;
  }
LABEL_144:
  v4[61] = *(_QWORD *)&self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
  v4[146] |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_146;
  }
LABEL_145:
  v4[106] = *(_QWORD *)&self->_appLaunchesSpecificTimeDowLocationForAppInContext;
  v4[147] |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_147;
  }
LABEL_146:
  v4[107] = *(_QWORD *)&self->_appLaunchesSpecificTimeDowLocationInContext;
  v4[147] |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_46;
    goto LABEL_148;
  }
LABEL_147:
  v4[105] = *(_QWORD *)&self->_appLaunchesSpecificTimeDowLocationForApp;
  v4[147] |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_149;
  }
LABEL_148:
  v4[104] = *(_QWORD *)&self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
  v4[147] |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10) == 0)
  {
LABEL_47:
    if ((v8 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_150;
  }
LABEL_149:
  v4[69] = *(_QWORD *)&self->_appLaunchesInTimeBucket0ForApp;
  v4[147] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000) == 0)
  {
LABEL_48:
    if ((v8 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_151;
  }
LABEL_150:
  v4[80] = *(_QWORD *)&self->_appLaunchesInTimeBucket1ForApp;
  v4[147] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000) == 0)
  {
LABEL_49:
    if ((v8 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_152;
  }
LABEL_151:
  v4[86] = *(_QWORD *)&self->_appLaunchesInTimeBucket2ForApp;
  v4[147] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000) == 0)
  {
LABEL_50:
    if ((v8 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_153;
  }
LABEL_152:
  v4[87] = *(_QWORD *)&self->_appLaunchesInTimeBucket3ForApp;
  v4[147] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_154;
  }
LABEL_153:
  v4[88] = *(_QWORD *)&self->_appLaunchesInTimeBucket4ForApp;
  v4[147] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_155;
  }
LABEL_154:
  v4[89] = *(_QWORD *)&self->_appLaunchesInTimeBucket5ForApp;
  v4[147] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x4000000) == 0)
      goto LABEL_54;
    goto LABEL_156;
  }
LABEL_155:
  v4[90] = *(_QWORD *)&self->_appLaunchesInTimeBucket6ForApp;
  v4[147] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_157;
  }
LABEL_156:
  v4[91] = *(_QWORD *)&self->_appLaunchesInTimeBucket7ForApp;
  v4[147] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_55:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_56;
    goto LABEL_158;
  }
LABEL_157:
  v4[92] = *(_QWORD *)&self->_appLaunchesInTimeBucket8ForApp;
  v4[147] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_56:
    if ((v8 & 0x20) == 0)
      goto LABEL_57;
    goto LABEL_159;
  }
LABEL_158:
  v4[93] = *(_QWORD *)&self->_appLaunchesInTimeBucket9ForApp;
  v4[147] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20) == 0)
  {
LABEL_57:
    if ((v8 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_160;
  }
LABEL_159:
  v4[70] = *(_QWORD *)&self->_appLaunchesInTimeBucket10ForApp;
  v4[147] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40) == 0)
  {
LABEL_58:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_161;
  }
LABEL_160:
  v4[71] = *(_QWORD *)&self->_appLaunchesInTimeBucket11ForApp;
  v4[147] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80) == 0)
  {
LABEL_59:
    if ((v8 & 0x100) == 0)
      goto LABEL_60;
    goto LABEL_162;
  }
LABEL_161:
  v4[72] = *(_QWORD *)&self->_appLaunchesInTimeBucket12ForApp;
  v4[147] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100) == 0)
  {
LABEL_60:
    if ((v8 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_163;
  }
LABEL_162:
  v4[73] = *(_QWORD *)&self->_appLaunchesInTimeBucket13ForApp;
  v4[147] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200) == 0)
  {
LABEL_61:
    if ((v8 & 0x400) == 0)
      goto LABEL_62;
    goto LABEL_164;
  }
LABEL_163:
  v4[74] = *(_QWORD *)&self->_appLaunchesInTimeBucket14ForApp;
  v4[147] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400) == 0)
  {
LABEL_62:
    if ((v8 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_165;
  }
LABEL_164:
  v4[75] = *(_QWORD *)&self->_appLaunchesInTimeBucket15ForApp;
  v4[147] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800) == 0)
  {
LABEL_63:
    if ((v8 & 0x1000) == 0)
      goto LABEL_64;
    goto LABEL_166;
  }
LABEL_165:
  v4[76] = *(_QWORD *)&self->_appLaunchesInTimeBucket16ForApp;
  v4[147] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000) == 0)
  {
LABEL_64:
    if ((v8 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_167;
  }
LABEL_166:
  v4[77] = *(_QWORD *)&self->_appLaunchesInTimeBucket17ForApp;
  v4[147] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000) == 0)
  {
LABEL_65:
    if ((v8 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_168;
  }
LABEL_167:
  v4[78] = *(_QWORD *)&self->_appLaunchesInTimeBucket18ForApp;
  v4[147] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000) == 0)
  {
LABEL_66:
    if ((v8 & 0x10000) == 0)
      goto LABEL_67;
    goto LABEL_169;
  }
LABEL_168:
  v4[79] = *(_QWORD *)&self->_appLaunchesInTimeBucket19ForApp;
  v4[147] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000) == 0)
  {
LABEL_67:
    if ((v8 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_170;
  }
LABEL_169:
  v4[81] = *(_QWORD *)&self->_appLaunchesInTimeBucket20ForApp;
  v4[147] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000) == 0)
  {
LABEL_68:
    if ((v8 & 0x40000) == 0)
      goto LABEL_69;
    goto LABEL_171;
  }
LABEL_170:
  v4[82] = *(_QWORD *)&self->_appLaunchesInTimeBucket21ForApp;
  v4[147] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000) == 0)
  {
LABEL_69:
    if ((v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_172;
  }
LABEL_171:
  v4[83] = *(_QWORD *)&self->_appLaunchesInTimeBucket22ForApp;
  v4[147] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((v8 & 0x100000) == 0)
      goto LABEL_71;
    goto LABEL_173;
  }
LABEL_172:
  v4[84] = *(_QWORD *)&self->_appLaunchesInTimeBucket23ForApp;
  v4[147] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000) == 0)
  {
LABEL_71:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_174;
  }
LABEL_173:
  v4[85] = *(_QWORD *)&self->_appLaunchesInTimeBucket24ForApp;
  v4[147] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_175;
  }
LABEL_174:
  v4[100] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekSundayForApp;
  v4[147] |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_73:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_74;
    goto LABEL_176;
  }
LABEL_175:
  v4[98] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekMondayForApp;
  v4[147] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_74:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_75;
    goto LABEL_177;
  }
LABEL_176:
  v4[102] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekTuesdayForApp;
  v4[147] |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_75:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_76;
    goto LABEL_178;
  }
LABEL_177:
  v4[103] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekWednesdayForApp;
  v4[147] |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_76:
    if ((v8 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_179;
  }
LABEL_178:
  v4[101] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekThursdayForApp;
  v4[147] |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_180;
  }
LABEL_179:
  v4[97] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekFridayForApp;
  v4[147] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x400000000) == 0)
  {
LABEL_78:
    if ((has & 0x200) == 0)
      goto LABEL_79;
    goto LABEL_181;
  }
LABEL_180:
  v4[99] = *(_QWORD *)&self->_appLaunchesOnDayOfWeekSaturdayForApp;
  v4[147] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_79:
    if ((has & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_182;
  }
LABEL_181:
  v4[10] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash0ForApp;
  v4[146] |= 0x200uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_80:
    if ((has & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_183;
  }
LABEL_182:
  v4[11] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash1ForApp;
  v4[146] |= 0x400uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_81:
    if ((has & 0x1000) == 0)
      goto LABEL_82;
    goto LABEL_184;
  }
LABEL_183:
  v4[12] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash2ForApp;
  v4[146] |= 0x800uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_82:
    if ((has & 0x2000) == 0)
      goto LABEL_83;
    goto LABEL_185;
  }
LABEL_184:
  v4[13] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash3ForApp;
  v4[146] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_83:
    if ((has & 0x4000) == 0)
      goto LABEL_84;
    goto LABEL_186;
  }
LABEL_185:
  v4[14] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash4ForApp;
  v4[146] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_84:
    if ((has & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_187;
  }
LABEL_186:
  v4[15] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash5ForApp;
  v4[146] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_85:
    if ((has & 0x10000) == 0)
      goto LABEL_86;
    goto LABEL_188;
  }
LABEL_187:
  v4[16] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash6ForApp;
  v4[146] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_86:
    if ((has & 0x20000) == 0)
      goto LABEL_87;
    goto LABEL_189;
  }
LABEL_188:
  v4[17] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash7ForApp;
  v4[146] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_87:
    if ((has & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_190;
  }
LABEL_189:
  v4[18] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash8ForApp;
  v4[146] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000) == 0)
      goto LABEL_89;
    goto LABEL_191;
  }
LABEL_190:
  v4[19] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHash9ForApp;
  v4[146] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_89:
    if ((has & 0x100000000) == 0)
      goto LABEL_90;
    goto LABEL_192;
  }
LABEL_191:
  v4[27] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash0ForApp;
  v4[146] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_90:
    if ((has & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_193;
  }
LABEL_192:
  v4[33] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash1ForApp;
  v4[146] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_91:
    if ((has & 0x400000000) == 0)
      goto LABEL_92;
    goto LABEL_194;
  }
LABEL_193:
  v4[34] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash2ForApp;
  v4[146] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_92:
    if ((has & 0x800000000) == 0)
      goto LABEL_93;
    goto LABEL_195;
  }
LABEL_194:
  v4[35] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash3ForApp;
  v4[146] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_196;
  }
LABEL_195:
  v4[36] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash4ForApp;
  v4[146] |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_197;
  }
LABEL_196:
  v4[37] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash5ForApp;
  v4[146] |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_198;
  }
LABEL_197:
  v4[38] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash6ForApp;
  v4[146] |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_96:
    if ((has & 0x8000000000) == 0)
      goto LABEL_97;
    goto LABEL_199;
  }
LABEL_198:
  v4[39] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash7ForApp;
  v4[146] |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_97:
    if ((has & 0x10000000000) == 0)
      goto LABEL_98;
    goto LABEL_200;
  }
LABEL_199:
  v4[40] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash8ForApp;
  v4[146] |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000) == 0)
      goto LABEL_99;
    goto LABEL_201;
  }
LABEL_200:
  v4[41] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash9ForApp;
  v4[146] |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_99:
    if ((has & 0x10000000) == 0)
      goto LABEL_100;
    goto LABEL_202;
  }
LABEL_201:
  v4[28] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash10ForApp;
  v4[146] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_100:
    if ((has & 0x20000000) == 0)
      goto LABEL_101;
    goto LABEL_203;
  }
LABEL_202:
  v4[29] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash11ForApp;
  v4[146] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_101:
    if ((has & 0x40000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_203:
  v4[30] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash12ForApp;
  v4[146] |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_102:
    v4[31] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash13ForApp;
    v4[146] |= 0x40000000uLL;
  }
LABEL_103:
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x80000000) != 0)
  {
    v4[32] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHash14ForApp;
    v4[146] |= 0x80000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_207;
    goto LABEL_206;
  }
  v10 = *((_WORD *)&self->_has + 8);
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x100000000000) != 0)
  {
LABEL_206:
    v4[109] = *(_QWORD *)&self->_appNumberOfSpecificGeohashesForApp;
    v4[147] |= 0x100000000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
  }
LABEL_207:
  if ((v11 & 0x80000000000) != 0)
  {
    v4[108] = *(_QWORD *)&self->_appNumberOfCoarseGeohashesForApp;
    v4[147] |= 0x80000000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v9 & 0x40) == 0)
    {
LABEL_209:
      if ((v9 & 0x20) == 0)
        goto LABEL_210;
      goto LABEL_254;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_209;
  }
  v4[7] = *(_QWORD *)&self->_appEntropyForTimeBuckets;
  v4[146] |= 0x40uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20) == 0)
  {
LABEL_210:
    if ((v9 & 0x10) == 0)
      goto LABEL_211;
    goto LABEL_255;
  }
LABEL_254:
  v4[6] = *(_QWORD *)&self->_appEntropyForSpecificGeoHash;
  v4[146] |= 0x20uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x10) == 0)
  {
LABEL_211:
    if ((v9 & 0x40000000000) == 0)
      goto LABEL_212;
    goto LABEL_256;
  }
LABEL_255:
  v4[5] = *(_QWORD *)&self->_appEntropyForCoarseGeoHash;
  v4[146] |= 0x10uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x40000000000) == 0)
  {
LABEL_212:
    if ((v9 & 0x100000) == 0)
      goto LABEL_213;
    goto LABEL_257;
  }
LABEL_256:
  v4[43] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHashForAppInContext;
  v4[146] |= 0x40000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000) == 0)
  {
LABEL_213:
    if ((v9 & 0x400000) == 0)
      goto LABEL_214;
    goto LABEL_258;
  }
LABEL_257:
  v4[21] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHashForAppInContext;
  v4[146] |= 0x100000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000) == 0)
  {
LABEL_214:
    if ((v9 & 0x200000000000) == 0)
      goto LABEL_215;
    goto LABEL_259;
  }
LABEL_258:
  v4[23] = *(_QWORD *)&self->_appLaunchesAtDayOfWeekForApp;
  v4[146] |= 0x400000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_215:
    if ((v9 & 0x400000000000) == 0)
      goto LABEL_216;
    goto LABEL_260;
  }
LABEL_259:
  v4[46] = *(_QWORD *)&self->_appLaunchesAtTimeAndDayForAppInContext;
  v4[146] |= 0x200000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000000000) == 0)
  {
LABEL_216:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_217;
    goto LABEL_261;
  }
LABEL_260:
  v4[47] = *(_QWORD *)&self->_appLaunchesAtTimeAndDayInContext;
  v4[146] |= 0x400000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_217:
    if ((v9 & 0x200000) == 0)
      goto LABEL_218;
    goto LABEL_262;
  }
LABEL_261:
  v4[45] = *(_QWORD *)&self->_appLaunchesAtTimeAndDayForApp;
  v4[146] |= 0x100000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000) == 0)
  {
LABEL_218:
    if ((v9 & 0x80000) == 0)
      goto LABEL_219;
    goto LABEL_263;
  }
LABEL_262:
  v4[22] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHashInContext;
  v4[146] |= 0x200000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000) == 0)
  {
LABEL_219:
    if ((v9 & 0x80000000000) == 0)
      goto LABEL_220;
    goto LABEL_264;
  }
LABEL_263:
  v4[20] = *(_QWORD *)&self->_appLaunchesAtCoarseGeoHashForApp;
  v4[146] |= 0x80000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000000000) == 0)
  {
LABEL_220:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_221;
    goto LABEL_265;
  }
LABEL_264:
  v4[44] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHashInContext;
  v4[146] |= 0x80000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_221:
    if ((v11 & 1) == 0)
      goto LABEL_222;
    goto LABEL_266;
  }
LABEL_265:
  v4[42] = *(_QWORD *)&self->_appLaunchesAtSpecificGeoHashForApp;
  v4[146] |= 0x20000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 1) == 0)
  {
LABEL_222:
    if ((v11 & 2) == 0)
      goto LABEL_223;
    goto LABEL_267;
  }
LABEL_266:
  v4[65] = *(_QWORD *)&self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
  v4[147] |= 1uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 2) == 0)
  {
LABEL_223:
    if ((v10 & 2) == 0)
      goto LABEL_224;
    goto LABEL_268;
  }
LABEL_267:
  v4[66] = *(_QWORD *)&self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
  v4[147] |= 2uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v10 & 2) == 0)
  {
LABEL_224:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_225;
    goto LABEL_269;
  }
LABEL_268:
  v4[130] = *(_QWORD *)&self->_isLocationServicesDisabled;
  v26 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 2u;
  *((_BYTE *)v4 + 1186) = v26;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_225:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_226;
    goto LABEL_270;
  }
LABEL_269:
  v4[95] = *(_QWORD *)&self->_appLaunchesInTwoHourTimeBucketForAppInContext;
  v4[147] |= 0x40000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_226:
    if ((v11 & 0x20000000) == 0)
      goto LABEL_227;
    goto LABEL_271;
  }
LABEL_270:
  v4[96] = *(_QWORD *)&self->_appLaunchesInTwoHourTimeBucketInContext;
  v4[147] |= 0x80000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_227:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_228;
    goto LABEL_272;
  }
LABEL_271:
  v4[94] = *(_QWORD *)&self->_appLaunchesInTwoHourTimeBucketForApp;
  v4[147] |= 0x20000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_228:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_229;
    goto LABEL_273;
  }
LABEL_272:
  v4[118] = *(_QWORD *)&self->_currentTimeBucketFromZeroToTwentyFour;
  v4[147] |= 0x20000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000000000000) == 0)
  {
LABEL_229:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_230;
    goto LABEL_274;
  }
LABEL_273:
  v4[59] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHashForAppInContext;
  v4[146] |= 0x400000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_230:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_231;
    goto LABEL_275;
  }
LABEL_274:
  v4[60] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHashInContext;
  v4[146] |= 0x800000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000000000000) == 0)
  {
LABEL_231:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_232;
    goto LABEL_276;
  }
LABEL_275:
  v4[58] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHashForApp;
  v4[146] |= 0x200000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_232:
    if ((v9 & 0x1000000000000) == 0)
      goto LABEL_233;
    goto LABEL_277;
  }
LABEL_276:
  v4[48] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash0ForApp;
  v4[146] |= 0x800000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x1000000000000) == 0)
  {
LABEL_233:
    if ((v9 & 0x2000000000000) == 0)
      goto LABEL_234;
    goto LABEL_278;
  }
LABEL_277:
  v4[49] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash1ForApp;
  v4[146] |= 0x1000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x2000000000000) == 0)
  {
LABEL_234:
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_235;
    goto LABEL_279;
  }
LABEL_278:
  v4[50] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash2ForApp;
  v4[146] |= 0x2000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_235:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_236;
    goto LABEL_280;
  }
LABEL_279:
  v4[51] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash3ForApp;
  v4[146] |= 0x4000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_236:
    if ((v9 & 0x10000000000000) == 0)
      goto LABEL_237;
    goto LABEL_281;
  }
LABEL_280:
  v4[52] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash4ForApp;
  v4[146] |= 0x8000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x10000000000000) == 0)
  {
LABEL_237:
    if ((v9 & 0x20000000000000) == 0)
      goto LABEL_238;
    goto LABEL_282;
  }
LABEL_281:
  v4[53] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash5ForApp;
  v4[146] |= 0x10000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20000000000000) == 0)
  {
LABEL_238:
    if ((v9 & 0x40000000000000) == 0)
      goto LABEL_239;
    goto LABEL_283;
  }
LABEL_282:
  v4[54] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash6ForApp;
  v4[146] |= 0x20000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x40000000000000) == 0)
  {
LABEL_239:
    if ((v9 & 0x80000000000000) == 0)
      goto LABEL_240;
    goto LABEL_284;
  }
LABEL_283:
  v4[55] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash7ForApp;
  v4[146] |= 0x40000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_240:
    if ((v9 & 0x100000000000000) == 0)
      goto LABEL_241;
    goto LABEL_285;
  }
LABEL_284:
  v4[56] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash8ForApp;
  v4[146] |= 0x80000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_241:
    if ((v9 & 0x80) == 0)
      goto LABEL_242;
    goto LABEL_286;
  }
LABEL_285:
  v4[57] = *(_QWORD *)&self->_appLaunchesAtZoom7GeoHash9ForApp;
  v4[146] |= 0x100000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80) == 0)
  {
LABEL_242:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_243;
    goto LABEL_287;
  }
LABEL_286:
  v4[8] = *(_QWORD *)&self->_appEntropyForZoom7GeoHash;
  v4[146] |= 0x80uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_243:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_244;
    goto LABEL_288;
  }
LABEL_287:
  v4[110] = *(_QWORD *)&self->_appNumberOfZoom7GeohashesForApp;
  v4[147] |= 0x200000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_244:
    if ((v9 & 0x1000000) == 0)
      goto LABEL_245;
    goto LABEL_289;
  }
LABEL_288:
  v4[26] = *(_QWORD *)&self->_appLaunchesAtSSIDForAppInContext;
  v4[146] |= 0x2000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_245:
    if ((v11 & 4) == 0)
      goto LABEL_246;
    goto LABEL_290;
  }
LABEL_289:
  v4[25] = *(_QWORD *)&self->_appLaunchesAtSSIDForApp;
  v4[146] |= 0x1000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 4) == 0)
  {
LABEL_246:
    if ((v11 & 8) == 0)
      goto LABEL_247;
    goto LABEL_291;
  }
LABEL_290:
  v4[67] = *(_QWORD *)&self->_appLaunchesForCoreMotionForAppInContext;
  v4[147] |= 4uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 8) == 0)
  {
LABEL_247:
    if ((v10 & 0x40) == 0)
      goto LABEL_248;
    goto LABEL_292;
  }
LABEL_291:
  v4[68] = *(_QWORD *)&self->_appLaunchesInAirplaneModeForAppInContext;
  v4[147] |= 8uLL;
  v9 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 8) & 0x40) == 0)
  {
LABEL_248:
    if ((v9 & 0x100) == 0)
      goto LABEL_249;
LABEL_293:
    v4[9] = *(_QWORD *)&self->_appLaunchPopularityAtPOIForAppInContext;
    v4[146] |= 0x100uLL;
    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_292:
  v4[135] = *(_QWORD *)&self->_poiPopularityForAppInContext;
  v27 = *((_BYTE *)v4 + 1186);
  *((_WORD *)v4 + 592) |= 0x40u;
  *((_BYTE *)v4 + 1186) = v27;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x100) != 0)
    goto LABEL_293;
LABEL_249:
  if ((v9 & 0x800000) != 0)
  {
LABEL_250:
    v4[24] = *(_QWORD *)&self->_appLaunchesAtPOIForAppInContext;
    v4[146] |= 0x800000uLL;
  }
LABEL_251:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t has;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  id v26;
  char v28;
  char v29;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = *((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16);
  if ((v5 & 0x10000) != 0)
  {
    *(double *)(v4 + 1160) = self->_unlockTime;
    v5 = *(unsigned __int16 *)(v4 + 1184);
    v6 = (v5 | (*(unsigned __int8 *)(v4 + 1186) << 16) | 0x10000u) >> 16;
    *(_WORD *)(v4 + 1184) = v5;
    *(_BYTE *)(v4 + 1186) = v6;
    LOWORD(v5) = *((_WORD *)&self->_has + 8);
  }
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) != 0)
  {
    *(double *)(v4 + 1064) = self->_launchTimePopularity;
    v12 = *(_BYTE *)(v4 + 1186);
    *(_WORD *)(v4 + 1184) |= 0x10u;
    *(_BYTE *)(v4 + 1186) = v12;
    LOWORD(v5) = *((_WORD *)&self->_has + 8);
    has = (uint64_t)self->_has;
    v8 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_108;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v4 + 1096) = self->_timeOfDayBucket;
  v13 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x100u;
  *(_BYTE *)(v4 + 1186) = v13;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_7;
    goto LABEL_109;
  }
LABEL_108:
  *(double *)(v4 + 1104) = self->_timeOfDayPopularity;
  v14 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x200u;
  *(_BYTE *)(v4 + 1186) = v14;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_110;
  }
LABEL_109:
  *(double *)(v4 + 928) = self->_coarseTimeOfDayPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x8000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_111;
  }
LABEL_110:
  *(double *)(v4 + 1056) = self->_launchPopularity;
  v15 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 8u;
  *(_BYTE *)(v4 + 1186) = v15;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_10;
    goto LABEL_112;
  }
LABEL_111:
  *(double *)(v4 + 1048) = self->_launchDayOfWeekPopularity;
  v16 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 4u;
  *(_BYTE *)(v4 + 1186) = v16;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_11;
    goto LABEL_113;
  }
LABEL_112:
  *(double *)(v4 + 952) = self->_dayOfWeekBucket;
  *(_QWORD *)(v4 + 1176) |= 0x40000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_12;
    goto LABEL_114;
  }
LABEL_113:
  *(double *)(v4 + 960) = self->_dayOfWeekPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x80000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000000) == 0)
  {
LABEL_12:
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_13;
    goto LABEL_115;
  }
LABEL_114:
  *(double *)(v4 + 992) = self->_entropyLaunchPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x800000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_14;
    goto LABEL_116;
  }
LABEL_115:
  *(double *)(v4 + 968) = self->_entropyDayOfWeekPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x100000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_15;
    goto LABEL_117;
  }
LABEL_116:
  *(double *)(v4 + 984) = self->_entropyDayOfWeekPopularityByDay;
  *(_QWORD *)(v4 + 1176) |= 0x400000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_118;
  }
LABEL_117:
  *(double *)(v4 + 976) = self->_entropyDayOfWeekPopularityByApp;
  *(_QWORD *)(v4 + 1176) |= 0x200000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_119;
  }
LABEL_118:
  *(double *)(v4 + 1024) = self->_entropyTrendingPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x8000000000000000;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_120;
  }
LABEL_119:
  *(double *)(v4 + 1000) = self->_entropySSIDPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x1000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_121;
  }
LABEL_120:
  *(double *)(v4 + 1016) = self->_entropySSIDPopularityBySSID;
  *(_QWORD *)(v4 + 1176) |= 0x4000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_122;
  }
LABEL_121:
  *(double *)(v4 + 1008) = self->_entropySSIDPopularityByApp;
  *(_QWORD *)(v4 + 1176) |= 0x2000000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((has & 1) == 0)
      goto LABEL_21;
    goto LABEL_123;
  }
LABEL_122:
  *(double *)(v4 + 1128) = self->_totalNumberOfLaunches;
  v17 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x1000u;
  *(_BYTE *)(v4 + 1186) = v17;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_124;
  }
LABEL_123:
  *(double *)(v4 + 8) = self->_airplaneModePopularity;
  *(_QWORD *)(v4 + 1168) |= 1uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_22:
    if ((v5 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_124:
  *(double *)(v4 + 1112) = self->_totalNumberOfAirplaneModeLaunches;
  v18 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x400u;
  *(_BYTE *)(v4 + 1186) = v18;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_126;
  }
LABEL_125:
  *(double *)(v4 + 1152) = self->_trendingPopularity;
  v19 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x8000u;
  *(_BYTE *)(v4 + 1186) = v19;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_127;
  }
LABEL_126:
  *(double *)(v4 + 1144) = self->_totalNumberOfTrendingLaunches;
  v20 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x4000u;
  *(_BYTE *)(v4 + 1186) = v20;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_128;
  }
LABEL_127:
  *(double *)(v4 + 1088) = self->_sSIDPopularity;
  v21 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x80u;
  *(_BYTE *)(v4 + 1186) = v21;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_129;
  }
LABEL_128:
  *(double *)(v4 + 1136) = self->_totalNumberOfSSIDLaunches;
  v22 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x2000u;
  *(_BYTE *)(v4 + 1186) = v22;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_28;
    goto LABEL_130;
  }
LABEL_129:
  *(double *)(v4 + 1072) = self->_onWifi;
  v23 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x20u;
  *(_BYTE *)(v4 + 1186) = v23;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_131;
  }
LABEL_130:
  *(double *)(v4 + 936) = self->_coreMotionPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x10000000000000uLL;
  LOWORD(v5) = *((_WORD *)&self->_has + 8);
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_132;
  }
LABEL_131:
  *(double *)(v4 + 1120) = self->_totalNumberOfCoreMotionLaunches;
  v24 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x800u;
  *(_BYTE *)(v4 + 1186) = v24;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((*((_WORD *)&self->_has + 8) & 1) == 0)
  {
LABEL_30:
    if ((has & 4) == 0)
      goto LABEL_31;
    goto LABEL_133;
  }
LABEL_132:
  *(double *)(v4 + 1032) = self->_isDateInWeekendOnDevice;
  v25 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 1u;
  *(_BYTE *)(v4 + 1186) = v25;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_31:
    if ((has & 2) == 0)
      goto LABEL_32;
    goto LABEL_134;
  }
LABEL_133:
  *(double *)(v4 + 24) = self->_ambientLightTypePopularity;
  *(_QWORD *)(v4 + 1168) |= 4uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 2) == 0)
  {
LABEL_32:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_33;
    goto LABEL_135;
  }
LABEL_134:
  *(double *)(v4 + 16) = self->_ambientLightTypeLaunchPopularity;
  *(_QWORD *)(v4 + 1168) |= 2uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_33:
    if ((has & 8) == 0)
      goto LABEL_34;
    goto LABEL_136;
  }
LABEL_135:
  *(double *)(v4 + 912) = self->_appTimeOfDayLaunches;
  *(_QWORD *)(v4 + 1176) |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_34:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_35;
    goto LABEL_137;
  }
LABEL_136:
  *(double *)(v4 + 32) = self->_appDayOfWeekLaunches;
  *(_QWORD *)(v4 + 1168) |= 8uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_138;
  }
LABEL_137:
  *(double *)(v4 + 904) = self->_appTimeAndDayOfWeekPopularity;
  *(_QWORD *)(v4 + 1176) |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_37;
    goto LABEL_139;
  }
LABEL_138:
  *(double *)(v4 + 888) = self->_appPopularityGivenTimeAndDayOfWeek;
  *(_QWORD *)(v4 + 1176) |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_140;
  }
LABEL_139:
  *(double *)(v4 + 896) = self->_appPopularityOfTimeAndDayOfWeekGivenApp;
  *(_QWORD *)(v4 + 1176) |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_141;
  }
LABEL_140:
  *(double *)(v4 + 920) = self->_appTotalNumberOfTimeAndDayOfWeekLaunches;
  *(_QWORD *)(v4 + 1176) |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_39:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_142;
  }
LABEL_141:
  *(double *)(v4 + 504) = self->_appLaunchesCoarseTimePowLocationForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_40:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_41;
    goto LABEL_143;
  }
LABEL_142:
  *(double *)(v4 + 512) = self->_appLaunchesCoarseTimePowLocationInContext;
  *(_QWORD *)(v4 + 1168) |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_41:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_144;
  }
LABEL_143:
  *(double *)(v4 + 496) = self->_appLaunchesCoarseTimePowLocationForApp;
  *(_QWORD *)(v4 + 1168) |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_145;
  }
LABEL_144:
  *(double *)(v4 + 488) = self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
  *(_QWORD *)(v4 + 1168) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_146;
  }
LABEL_145:
  *(double *)(v4 + 848) = self->_appLaunchesSpecificTimeDowLocationForAppInContext;
  *(_QWORD *)(v4 + 1176) |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_147;
  }
LABEL_146:
  *(double *)(v4 + 856) = self->_appLaunchesSpecificTimeDowLocationInContext;
  *(_QWORD *)(v4 + 1176) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_46;
    goto LABEL_148;
  }
LABEL_147:
  *(double *)(v4 + 840) = self->_appLaunchesSpecificTimeDowLocationForApp;
  *(_QWORD *)(v4 + 1176) |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_149;
  }
LABEL_148:
  *(double *)(v4 + 832) = self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
  *(_QWORD *)(v4 + 1176) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10) == 0)
  {
LABEL_47:
    if ((v8 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_150;
  }
LABEL_149:
  *(double *)(v4 + 552) = self->_appLaunchesInTimeBucket0ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x10uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000) == 0)
  {
LABEL_48:
    if ((v8 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_151;
  }
LABEL_150:
  *(double *)(v4 + 640) = self->_appLaunchesInTimeBucket1ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000) == 0)
  {
LABEL_49:
    if ((v8 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_152;
  }
LABEL_151:
  *(double *)(v4 + 688) = self->_appLaunchesInTimeBucket2ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000) == 0)
  {
LABEL_50:
    if ((v8 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_153;
  }
LABEL_152:
  *(double *)(v4 + 696) = self->_appLaunchesInTimeBucket3ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_154;
  }
LABEL_153:
  *(double *)(v4 + 704) = self->_appLaunchesInTimeBucket4ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_155;
  }
LABEL_154:
  *(double *)(v4 + 712) = self->_appLaunchesInTimeBucket5ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x4000000) == 0)
      goto LABEL_54;
    goto LABEL_156;
  }
LABEL_155:
  *(double *)(v4 + 720) = self->_appLaunchesInTimeBucket6ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_157;
  }
LABEL_156:
  *(double *)(v4 + 728) = self->_appLaunchesInTimeBucket7ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_55:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_56;
    goto LABEL_158;
  }
LABEL_157:
  *(double *)(v4 + 736) = self->_appLaunchesInTimeBucket8ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_56:
    if ((v8 & 0x20) == 0)
      goto LABEL_57;
    goto LABEL_159;
  }
LABEL_158:
  *(double *)(v4 + 744) = self->_appLaunchesInTimeBucket9ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20) == 0)
  {
LABEL_57:
    if ((v8 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_160;
  }
LABEL_159:
  *(double *)(v4 + 560) = self->_appLaunchesInTimeBucket10ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x20uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40) == 0)
  {
LABEL_58:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_161;
  }
LABEL_160:
  *(double *)(v4 + 568) = self->_appLaunchesInTimeBucket11ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x40uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80) == 0)
  {
LABEL_59:
    if ((v8 & 0x100) == 0)
      goto LABEL_60;
    goto LABEL_162;
  }
LABEL_161:
  *(double *)(v4 + 576) = self->_appLaunchesInTimeBucket12ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x80uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100) == 0)
  {
LABEL_60:
    if ((v8 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_163;
  }
LABEL_162:
  *(double *)(v4 + 584) = self->_appLaunchesInTimeBucket13ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x100uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200) == 0)
  {
LABEL_61:
    if ((v8 & 0x400) == 0)
      goto LABEL_62;
    goto LABEL_164;
  }
LABEL_163:
  *(double *)(v4 + 592) = self->_appLaunchesInTimeBucket14ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x200uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400) == 0)
  {
LABEL_62:
    if ((v8 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_165;
  }
LABEL_164:
  *(double *)(v4 + 600) = self->_appLaunchesInTimeBucket15ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x400uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800) == 0)
  {
LABEL_63:
    if ((v8 & 0x1000) == 0)
      goto LABEL_64;
    goto LABEL_166;
  }
LABEL_165:
  *(double *)(v4 + 608) = self->_appLaunchesInTimeBucket16ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x800uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000) == 0)
  {
LABEL_64:
    if ((v8 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_167;
  }
LABEL_166:
  *(double *)(v4 + 616) = self->_appLaunchesInTimeBucket17ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000) == 0)
  {
LABEL_65:
    if ((v8 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_168;
  }
LABEL_167:
  *(double *)(v4 + 624) = self->_appLaunchesInTimeBucket18ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x2000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000) == 0)
  {
LABEL_66:
    if ((v8 & 0x10000) == 0)
      goto LABEL_67;
    goto LABEL_169;
  }
LABEL_168:
  *(double *)(v4 + 632) = self->_appLaunchesInTimeBucket19ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000) == 0)
  {
LABEL_67:
    if ((v8 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_170;
  }
LABEL_169:
  *(double *)(v4 + 648) = self->_appLaunchesInTimeBucket20ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000) == 0)
  {
LABEL_68:
    if ((v8 & 0x40000) == 0)
      goto LABEL_69;
    goto LABEL_171;
  }
LABEL_170:
  *(double *)(v4 + 656) = self->_appLaunchesInTimeBucket21ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x40000) == 0)
  {
LABEL_69:
    if ((v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_172;
  }
LABEL_171:
  *(double *)(v4 + 664) = self->_appLaunchesInTimeBucket22ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((v8 & 0x100000) == 0)
      goto LABEL_71;
    goto LABEL_173;
  }
LABEL_172:
  *(double *)(v4 + 672) = self->_appLaunchesInTimeBucket23ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000) == 0)
  {
LABEL_71:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_174;
  }
LABEL_173:
  *(double *)(v4 + 680) = self->_appLaunchesInTimeBucket24ForApp;
  *(_QWORD *)(v4 + 1176) |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_175;
  }
LABEL_174:
  *(double *)(v4 + 800) = self->_appLaunchesOnDayOfWeekSundayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_73:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_74;
    goto LABEL_176;
  }
LABEL_175:
  *(double *)(v4 + 784) = self->_appLaunchesOnDayOfWeekMondayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_74:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_75;
    goto LABEL_177;
  }
LABEL_176:
  *(double *)(v4 + 816) = self->_appLaunchesOnDayOfWeekTuesdayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_75:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_76;
    goto LABEL_178;
  }
LABEL_177:
  *(double *)(v4 + 824) = self->_appLaunchesOnDayOfWeekWednesdayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_76:
    if ((v8 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_179;
  }
LABEL_178:
  *(double *)(v4 + 808) = self->_appLaunchesOnDayOfWeekThursdayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_180;
  }
LABEL_179:
  *(double *)(v4 + 776) = self->_appLaunchesOnDayOfWeekFridayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x400000000) == 0)
  {
LABEL_78:
    if ((has & 0x200) == 0)
      goto LABEL_79;
    goto LABEL_181;
  }
LABEL_180:
  *(double *)(v4 + 792) = self->_appLaunchesOnDayOfWeekSaturdayForApp;
  *(_QWORD *)(v4 + 1176) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_79:
    if ((has & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_182;
  }
LABEL_181:
  *(double *)(v4 + 80) = self->_appLaunchesAtCoarseGeoHash0ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x200uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_80:
    if ((has & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_183;
  }
LABEL_182:
  *(double *)(v4 + 88) = self->_appLaunchesAtCoarseGeoHash1ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x400uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_81:
    if ((has & 0x1000) == 0)
      goto LABEL_82;
    goto LABEL_184;
  }
LABEL_183:
  *(double *)(v4 + 96) = self->_appLaunchesAtCoarseGeoHash2ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x800uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_82:
    if ((has & 0x2000) == 0)
      goto LABEL_83;
    goto LABEL_185;
  }
LABEL_184:
  *(double *)(v4 + 104) = self->_appLaunchesAtCoarseGeoHash3ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_83:
    if ((has & 0x4000) == 0)
      goto LABEL_84;
    goto LABEL_186;
  }
LABEL_185:
  *(double *)(v4 + 112) = self->_appLaunchesAtCoarseGeoHash4ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x2000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_84:
    if ((has & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_187;
  }
LABEL_186:
  *(double *)(v4 + 120) = self->_appLaunchesAtCoarseGeoHash5ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_85:
    if ((has & 0x10000) == 0)
      goto LABEL_86;
    goto LABEL_188;
  }
LABEL_187:
  *(double *)(v4 + 128) = self->_appLaunchesAtCoarseGeoHash6ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_86:
    if ((has & 0x20000) == 0)
      goto LABEL_87;
    goto LABEL_189;
  }
LABEL_188:
  *(double *)(v4 + 136) = self->_appLaunchesAtCoarseGeoHash7ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_87:
    if ((has & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_190;
  }
LABEL_189:
  *(double *)(v4 + 144) = self->_appLaunchesAtCoarseGeoHash8ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000) == 0)
      goto LABEL_89;
    goto LABEL_191;
  }
LABEL_190:
  *(double *)(v4 + 152) = self->_appLaunchesAtCoarseGeoHash9ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_89:
    if ((has & 0x100000000) == 0)
      goto LABEL_90;
    goto LABEL_192;
  }
LABEL_191:
  *(double *)(v4 + 216) = self->_appLaunchesAtSpecificGeoHash0ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_90:
    if ((has & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_193;
  }
LABEL_192:
  *(double *)(v4 + 264) = self->_appLaunchesAtSpecificGeoHash1ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_91:
    if ((has & 0x400000000) == 0)
      goto LABEL_92;
    goto LABEL_194;
  }
LABEL_193:
  *(double *)(v4 + 272) = self->_appLaunchesAtSpecificGeoHash2ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_92:
    if ((has & 0x800000000) == 0)
      goto LABEL_93;
    goto LABEL_195;
  }
LABEL_194:
  *(double *)(v4 + 280) = self->_appLaunchesAtSpecificGeoHash3ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_196;
  }
LABEL_195:
  *(double *)(v4 + 288) = self->_appLaunchesAtSpecificGeoHash4ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_197;
  }
LABEL_196:
  *(double *)(v4 + 296) = self->_appLaunchesAtSpecificGeoHash5ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_198;
  }
LABEL_197:
  *(double *)(v4 + 304) = self->_appLaunchesAtSpecificGeoHash6ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_96:
    if ((has & 0x8000000000) == 0)
      goto LABEL_97;
    goto LABEL_199;
  }
LABEL_198:
  *(double *)(v4 + 312) = self->_appLaunchesAtSpecificGeoHash7ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_97:
    if ((has & 0x10000000000) == 0)
      goto LABEL_98;
    goto LABEL_200;
  }
LABEL_199:
  *(double *)(v4 + 320) = self->_appLaunchesAtSpecificGeoHash8ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000) == 0)
      goto LABEL_99;
    goto LABEL_201;
  }
LABEL_200:
  *(double *)(v4 + 328) = self->_appLaunchesAtSpecificGeoHash9ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_99:
    if ((has & 0x10000000) == 0)
      goto LABEL_100;
    goto LABEL_202;
  }
LABEL_201:
  *(double *)(v4 + 224) = self->_appLaunchesAtSpecificGeoHash10ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_100:
    if ((has & 0x20000000) == 0)
      goto LABEL_101;
    goto LABEL_203;
  }
LABEL_202:
  *(double *)(v4 + 232) = self->_appLaunchesAtSpecificGeoHash11ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_101:
    if ((has & 0x40000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_203:
  *(double *)(v4 + 240) = self->_appLaunchesAtSpecificGeoHash12ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x20000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_102:
    *(double *)(v4 + 248) = self->_appLaunchesAtSpecificGeoHash13ForApp;
    *(_QWORD *)(v4 + 1168) |= 0x40000000uLL;
  }
LABEL_103:
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x80000000) != 0)
  {
    *(double *)(v4 + 256) = self->_appLaunchesAtSpecificGeoHash14ForApp;
    *(_QWORD *)(v4 + 1168) |= 0x80000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_207;
    goto LABEL_206;
  }
  v10 = *((_WORD *)&self->_has + 8);
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x100000000000) != 0)
  {
LABEL_206:
    *(double *)(v4 + 872) = self->_appNumberOfSpecificGeohashesForApp;
    *(_QWORD *)(v4 + 1176) |= 0x100000000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
  }
LABEL_207:
  if ((v11 & 0x80000000000) != 0)
  {
    *(double *)(v4 + 864) = self->_appNumberOfCoarseGeohashesForApp;
    *(_QWORD *)(v4 + 1176) |= 0x80000000000uLL;
    v10 = *((_WORD *)&self->_has + 8);
    v9 = (uint64_t)self->_has;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v9 & 0x40) == 0)
    {
LABEL_209:
      if ((v9 & 0x20) == 0)
        goto LABEL_210;
      goto LABEL_254;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_209;
  }
  *(double *)(v4 + 56) = self->_appEntropyForTimeBuckets;
  *(_QWORD *)(v4 + 1168) |= 0x40uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20) == 0)
  {
LABEL_210:
    if ((v9 & 0x10) == 0)
      goto LABEL_211;
    goto LABEL_255;
  }
LABEL_254:
  *(double *)(v4 + 48) = self->_appEntropyForSpecificGeoHash;
  *(_QWORD *)(v4 + 1168) |= 0x20uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x10) == 0)
  {
LABEL_211:
    if ((v9 & 0x40000000000) == 0)
      goto LABEL_212;
    goto LABEL_256;
  }
LABEL_255:
  *(double *)(v4 + 40) = self->_appEntropyForCoarseGeoHash;
  *(_QWORD *)(v4 + 1168) |= 0x10uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x40000000000) == 0)
  {
LABEL_212:
    if ((v9 & 0x100000) == 0)
      goto LABEL_213;
    goto LABEL_257;
  }
LABEL_256:
  *(double *)(v4 + 344) = self->_appLaunchesAtSpecificGeoHashForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x40000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000) == 0)
  {
LABEL_213:
    if ((v9 & 0x400000) == 0)
      goto LABEL_214;
    goto LABEL_258;
  }
LABEL_257:
  *(double *)(v4 + 168) = self->_appLaunchesAtCoarseGeoHashForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x100000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000) == 0)
  {
LABEL_214:
    if ((v9 & 0x200000000000) == 0)
      goto LABEL_215;
    goto LABEL_259;
  }
LABEL_258:
  *(double *)(v4 + 184) = self->_appLaunchesAtDayOfWeekForApp;
  *(_QWORD *)(v4 + 1168) |= 0x400000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_215:
    if ((v9 & 0x400000000000) == 0)
      goto LABEL_216;
    goto LABEL_260;
  }
LABEL_259:
  *(double *)(v4 + 368) = self->_appLaunchesAtTimeAndDayForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x200000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000000000) == 0)
  {
LABEL_216:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_217;
    goto LABEL_261;
  }
LABEL_260:
  *(double *)(v4 + 376) = self->_appLaunchesAtTimeAndDayInContext;
  *(_QWORD *)(v4 + 1168) |= 0x400000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_217:
    if ((v9 & 0x200000) == 0)
      goto LABEL_218;
    goto LABEL_262;
  }
LABEL_261:
  *(double *)(v4 + 360) = self->_appLaunchesAtTimeAndDayForApp;
  *(_QWORD *)(v4 + 1168) |= 0x100000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000) == 0)
  {
LABEL_218:
    if ((v9 & 0x80000) == 0)
      goto LABEL_219;
    goto LABEL_263;
  }
LABEL_262:
  *(double *)(v4 + 176) = self->_appLaunchesAtCoarseGeoHashInContext;
  *(_QWORD *)(v4 + 1168) |= 0x200000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000) == 0)
  {
LABEL_219:
    if ((v9 & 0x80000000000) == 0)
      goto LABEL_220;
    goto LABEL_264;
  }
LABEL_263:
  *(double *)(v4 + 160) = self->_appLaunchesAtCoarseGeoHashForApp;
  *(_QWORD *)(v4 + 1168) |= 0x80000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000000000) == 0)
  {
LABEL_220:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_221;
    goto LABEL_265;
  }
LABEL_264:
  *(double *)(v4 + 352) = self->_appLaunchesAtSpecificGeoHashInContext;
  *(_QWORD *)(v4 + 1168) |= 0x80000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_221:
    if ((v11 & 1) == 0)
      goto LABEL_222;
    goto LABEL_266;
  }
LABEL_265:
  *(double *)(v4 + 336) = self->_appLaunchesAtSpecificGeoHashForApp;
  *(_QWORD *)(v4 + 1168) |= 0x20000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 1) == 0)
  {
LABEL_222:
    if ((v11 & 2) == 0)
      goto LABEL_223;
    goto LABEL_267;
  }
LABEL_266:
  *(double *)(v4 + 520) = self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
  *(_QWORD *)(v4 + 1176) |= 1uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 2) == 0)
  {
LABEL_223:
    if ((v10 & 2) == 0)
      goto LABEL_224;
    goto LABEL_268;
  }
LABEL_267:
  *(double *)(v4 + 528) = self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
  *(_QWORD *)(v4 + 1176) |= 2uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v10 & 2) == 0)
  {
LABEL_224:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_225;
    goto LABEL_269;
  }
LABEL_268:
  *(double *)(v4 + 1040) = self->_isLocationServicesDisabled;
  v28 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 2u;
  *(_BYTE *)(v4 + 1186) = v28;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_225:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_226;
    goto LABEL_270;
  }
LABEL_269:
  *(double *)(v4 + 760) = self->_appLaunchesInTwoHourTimeBucketForAppInContext;
  *(_QWORD *)(v4 + 1176) |= 0x40000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_226:
    if ((v11 & 0x20000000) == 0)
      goto LABEL_227;
    goto LABEL_271;
  }
LABEL_270:
  *(double *)(v4 + 768) = self->_appLaunchesInTwoHourTimeBucketInContext;
  *(_QWORD *)(v4 + 1176) |= 0x80000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_227:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_228;
    goto LABEL_272;
  }
LABEL_271:
  *(double *)(v4 + 752) = self->_appLaunchesInTwoHourTimeBucketForApp;
  *(_QWORD *)(v4 + 1176) |= 0x20000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_228:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_229;
    goto LABEL_273;
  }
LABEL_272:
  *(double *)(v4 + 944) = self->_currentTimeBucketFromZeroToTwentyFour;
  *(_QWORD *)(v4 + 1176) |= 0x20000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x400000000000000) == 0)
  {
LABEL_229:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_230;
    goto LABEL_274;
  }
LABEL_273:
  *(double *)(v4 + 472) = self->_appLaunchesAtZoom7GeoHashForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x400000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_230:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_231;
    goto LABEL_275;
  }
LABEL_274:
  *(double *)(v4 + 480) = self->_appLaunchesAtZoom7GeoHashInContext;
  *(_QWORD *)(v4 + 1168) |= 0x800000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x200000000000000) == 0)
  {
LABEL_231:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_232;
    goto LABEL_276;
  }
LABEL_275:
  *(double *)(v4 + 464) = self->_appLaunchesAtZoom7GeoHashForApp;
  *(_QWORD *)(v4 + 1168) |= 0x200000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_232:
    if ((v9 & 0x1000000000000) == 0)
      goto LABEL_233;
    goto LABEL_277;
  }
LABEL_276:
  *(double *)(v4 + 384) = self->_appLaunchesAtZoom7GeoHash0ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x800000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x1000000000000) == 0)
  {
LABEL_233:
    if ((v9 & 0x2000000000000) == 0)
      goto LABEL_234;
    goto LABEL_278;
  }
LABEL_277:
  *(double *)(v4 + 392) = self->_appLaunchesAtZoom7GeoHash1ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x1000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x2000000000000) == 0)
  {
LABEL_234:
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_235;
    goto LABEL_279;
  }
LABEL_278:
  *(double *)(v4 + 400) = self->_appLaunchesAtZoom7GeoHash2ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x2000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_235:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_236;
    goto LABEL_280;
  }
LABEL_279:
  *(double *)(v4 + 408) = self->_appLaunchesAtZoom7GeoHash3ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x4000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_236:
    if ((v9 & 0x10000000000000) == 0)
      goto LABEL_237;
    goto LABEL_281;
  }
LABEL_280:
  *(double *)(v4 + 416) = self->_appLaunchesAtZoom7GeoHash4ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x8000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x10000000000000) == 0)
  {
LABEL_237:
    if ((v9 & 0x20000000000000) == 0)
      goto LABEL_238;
    goto LABEL_282;
  }
LABEL_281:
  *(double *)(v4 + 424) = self->_appLaunchesAtZoom7GeoHash5ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x10000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x20000000000000) == 0)
  {
LABEL_238:
    if ((v9 & 0x40000000000000) == 0)
      goto LABEL_239;
    goto LABEL_283;
  }
LABEL_282:
  *(double *)(v4 + 432) = self->_appLaunchesAtZoom7GeoHash6ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x20000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x40000000000000) == 0)
  {
LABEL_239:
    if ((v9 & 0x80000000000000) == 0)
      goto LABEL_240;
    goto LABEL_284;
  }
LABEL_283:
  *(double *)(v4 + 440) = self->_appLaunchesAtZoom7GeoHash7ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x40000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_240:
    if ((v9 & 0x100000000000000) == 0)
      goto LABEL_241;
    goto LABEL_285;
  }
LABEL_284:
  *(double *)(v4 + 448) = self->_appLaunchesAtZoom7GeoHash8ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x80000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_241:
    if ((v9 & 0x80) == 0)
      goto LABEL_242;
    goto LABEL_286;
  }
LABEL_285:
  *(double *)(v4 + 456) = self->_appLaunchesAtZoom7GeoHash9ForApp;
  *(_QWORD *)(v4 + 1168) |= 0x100000000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x80) == 0)
  {
LABEL_242:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_243;
    goto LABEL_287;
  }
LABEL_286:
  *(double *)(v4 + 64) = self->_appEntropyForZoom7GeoHash;
  *(_QWORD *)(v4 + 1168) |= 0x80uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_243:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_244;
    goto LABEL_288;
  }
LABEL_287:
  *(double *)(v4 + 880) = self->_appNumberOfZoom7GeohashesForApp;
  *(_QWORD *)(v4 + 1176) |= 0x200000000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_244:
    if ((v9 & 0x1000000) == 0)
      goto LABEL_245;
    goto LABEL_289;
  }
LABEL_288:
  *(double *)(v4 + 208) = self->_appLaunchesAtSSIDForAppInContext;
  *(_QWORD *)(v4 + 1168) |= 0x2000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_245:
    if ((v11 & 4) == 0)
      goto LABEL_246;
    goto LABEL_290;
  }
LABEL_289:
  *(double *)(v4 + 200) = self->_appLaunchesAtSSIDForApp;
  *(_QWORD *)(v4 + 1168) |= 0x1000000uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 4) == 0)
  {
LABEL_246:
    if ((v11 & 8) == 0)
      goto LABEL_247;
    goto LABEL_291;
  }
LABEL_290:
  *(double *)(v4 + 536) = self->_appLaunchesForCoreMotionForAppInContext;
  *(_QWORD *)(v4 + 1176) |= 4uLL;
  v10 = *((_WORD *)&self->_has + 8);
  v9 = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 8) == 0)
  {
LABEL_247:
    if ((v10 & 0x40) == 0)
      goto LABEL_248;
    goto LABEL_292;
  }
LABEL_291:
  *(double *)(v4 + 544) = self->_appLaunchesInAirplaneModeForAppInContext;
  *(_QWORD *)(v4 + 1176) |= 8uLL;
  v9 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 8) & 0x40) == 0)
  {
LABEL_248:
    if ((v9 & 0x100) == 0)
      goto LABEL_249;
LABEL_293:
    *(double *)(v4 + 72) = self->_appLaunchPopularityAtPOIForAppInContext;
    *(_QWORD *)(v4 + 1168) |= 0x100uLL;
    if ((*(_QWORD *)&self->_has & 0x800000) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_292:
  *(double *)(v4 + 1080) = self->_poiPopularityForAppInContext;
  v29 = *(_BYTE *)(v4 + 1186);
  *(_WORD *)(v4 + 1184) |= 0x40u;
  *(_BYTE *)(v4 + 1186) = v29;
  v9 = (uint64_t)self->_has;
  if ((v9 & 0x100) != 0)
    goto LABEL_293;
LABEL_249:
  if ((v9 & 0x800000) != 0)
  {
LABEL_250:
    *(double *)(v4 + 192) = self->_appLaunchesAtPOIForAppInContext;
    *(_QWORD *)(v4 + 1168) |= 0x800000uLL;
  }
LABEL_251:
  v26 = (id)v4;

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  uint64_t has;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_727;
  has = (uint64_t)self->_has;
  v6 = *((_QWORD *)&self->_has + 1);
  v7 = v4[592] | (*((unsigned __int8 *)v4 + 1186) << 16);
  v9 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if (((*((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16)) & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_unlockTime != *((double *)v4 + 145))
      goto LABEL_727;
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x10) != 0)
  {
    if ((v4[592] & 0x10) == 0 || self->_launchTimePopularity != *((double *)v4 + 133))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x10) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x100) != 0)
  {
    if ((v4[592] & 0x100) == 0 || self->_timeOfDayBucket != *((double *)v4 + 137))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x100) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x200) != 0)
  {
    if ((v4[592] & 0x200) == 0 || self->_timeOfDayPopularity != *((double *)v4 + 138))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x200) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x8000000000000) != 0)
  {
    if ((v8 & 0x8000000000000) == 0 || self->_coarseTimeOfDayPopularity != *((double *)v4 + 116))
      goto LABEL_727;
  }
  else if ((v8 & 0x8000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 8) != 0)
  {
    if ((v4[592] & 8) == 0 || self->_launchPopularity != *((double *)v4 + 132))
      goto LABEL_727;
  }
  else if ((v4[592] & 8) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 4) != 0)
  {
    if ((v4[592] & 4) == 0 || self->_launchDayOfWeekPopularity != *((double *)v4 + 131))
      goto LABEL_727;
  }
  else if ((v4[592] & 4) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x40000000000000) != 0)
  {
    if ((v8 & 0x40000000000000) == 0 || self->_dayOfWeekBucket != *((double *)v4 + 119))
      goto LABEL_727;
  }
  else if ((v8 & 0x40000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x80000000000000) != 0)
  {
    if ((v8 & 0x80000000000000) == 0 || self->_dayOfWeekPopularity != *((double *)v4 + 120))
      goto LABEL_727;
  }
  else if ((v8 & 0x80000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x800000000000000) != 0)
  {
    if ((v8 & 0x800000000000000) == 0 || self->_entropyLaunchPopularity != *((double *)v4 + 124))
      goto LABEL_727;
  }
  else if ((v8 & 0x800000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x100000000000000) != 0)
  {
    if ((v8 & 0x100000000000000) == 0 || self->_entropyDayOfWeekPopularity != *((double *)v4 + 121))
      goto LABEL_727;
  }
  else if ((v8 & 0x100000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x400000000000000) != 0)
  {
    if ((v8 & 0x400000000000000) == 0 || self->_entropyDayOfWeekPopularityByDay != *((double *)v4 + 123))
      goto LABEL_727;
  }
  else if ((v8 & 0x400000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x200000000000000) != 0)
  {
    if ((v8 & 0x200000000000000) == 0 || self->_entropyDayOfWeekPopularityByApp != *((double *)v4 + 122))
      goto LABEL_727;
  }
  else if ((v8 & 0x200000000000000) != 0)
  {
    goto LABEL_727;
  }
  if (v6 < 0)
  {
    if ((v8 & 0x8000000000000000) == 0 || self->_entropyTrendingPopularity != *((double *)v4 + 128))
      goto LABEL_727;
  }
  else if (v8 < 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    if ((v8 & 0x1000000000000000) == 0 || self->_entropySSIDPopularity != *((double *)v4 + 125))
      goto LABEL_727;
  }
  else if ((v8 & 0x1000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x4000000000000000) != 0)
  {
    if ((v8 & 0x4000000000000000) == 0 || self->_entropySSIDPopularityBySSID != *((double *)v4 + 127))
      goto LABEL_727;
  }
  else if ((v8 & 0x4000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x2000000000000000) != 0)
  {
    if ((v8 & 0x2000000000000000) == 0 || self->_entropySSIDPopularityByApp != *((double *)v4 + 126))
      goto LABEL_727;
  }
  else if ((v8 & 0x2000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x1000) != 0)
  {
    if ((v4[592] & 0x1000) == 0 || self->_totalNumberOfLaunches != *((double *)v4 + 141))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x1000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_airplaneModePopularity != *((double *)v4 + 1))
      goto LABEL_727;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x400) != 0)
  {
    if ((v4[592] & 0x400) == 0 || self->_totalNumberOfAirplaneModeLaunches != *((double *)v4 + 139))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x400) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x8000) != 0)
  {
    if ((v4[592] & 0x8000) == 0 || self->_trendingPopularity != *((double *)v4 + 144))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x8000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x4000) != 0)
  {
    if ((v4[592] & 0x4000) == 0 || self->_totalNumberOfTrendingLaunches != *((double *)v4 + 143))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x4000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x80) != 0)
  {
    if ((v4[592] & 0x80) == 0 || self->_sSIDPopularity != *((double *)v4 + 136))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x80) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x2000) != 0)
  {
    if ((v4[592] & 0x2000) == 0 || self->_totalNumberOfSSIDLaunches != *((double *)v4 + 142))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x2000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x20) != 0)
  {
    if ((v4[592] & 0x20) == 0 || self->_onWifi != *((double *)v4 + 134))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x20) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x10000000000000) != 0)
  {
    if ((v8 & 0x10000000000000) == 0 || self->_coreMotionPopularity != *((double *)v4 + 117))
      goto LABEL_727;
  }
  else if ((v8 & 0x10000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x800) != 0)
  {
    if ((v4[592] & 0x800) == 0 || self->_totalNumberOfCoreMotionLaunches != *((double *)v4 + 140))
      goto LABEL_727;
  }
  else if ((v4[592] & 0x800) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 1) != 0)
  {
    if ((v4[592] & 1) == 0 || self->_isDateInWeekendOnDevice != *((double *)v4 + 129))
      goto LABEL_727;
  }
  else if ((v4[592] & 1) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_ambientLightTypePopularity != *((double *)v4 + 3))
      goto LABEL_727;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_ambientLightTypeLaunchPopularity != *((double *)v4 + 2))
      goto LABEL_727;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x2000000000000) != 0)
  {
    if ((v8 & 0x2000000000000) == 0 || self->_appTimeOfDayLaunches != *((double *)v4 + 114))
      goto LABEL_727;
  }
  else if ((v8 & 0x2000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_appDayOfWeekLaunches != *((double *)v4 + 4))
      goto LABEL_727;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x1000000000000) != 0)
  {
    if ((v8 & 0x1000000000000) == 0 || self->_appTimeAndDayOfWeekPopularity != *((double *)v4 + 113))
      goto LABEL_727;
  }
  else if ((v8 & 0x1000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x400000000000) != 0)
  {
    if ((v8 & 0x400000000000) == 0 || self->_appPopularityGivenTimeAndDayOfWeek != *((double *)v4 + 111))
      goto LABEL_727;
  }
  else if ((v8 & 0x400000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x800000000000) != 0)
  {
    if ((v8 & 0x800000000000) == 0 || self->_appPopularityOfTimeAndDayOfWeekGivenApp != *((double *)v4 + 112))
      goto LABEL_727;
  }
  else if ((v8 & 0x800000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x4000000000000) != 0)
  {
    if ((v8 & 0x4000000000000) == 0 || self->_appTotalNumberOfTimeAndDayOfWeekLaunches != *((double *)v4 + 115))
      goto LABEL_727;
  }
  else if ((v8 & 0x4000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v9 & 0x4000000000000000) == 0
      || self->_appLaunchesCoarseTimePowLocationForAppInContext != *((double *)v4 + 63))
    {
      goto LABEL_727;
    }
  }
  else if ((v9 & 0x4000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if (has < 0)
  {
    if ((v9 & 0x8000000000000000) == 0 || self->_appLaunchesCoarseTimePowLocationInContext != *((double *)v4 + 64))
      goto LABEL_727;
  }
  else if (v9 < 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v9 & 0x2000000000000000) == 0 || self->_appLaunchesCoarseTimePowLocationForApp != *((double *)v4 + 62))
      goto LABEL_727;
  }
  else if ((v9 & 0x2000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v9 & 0x1000000000000000) == 0
      || self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts != *((double *)v4 + 61))
    {
      goto LABEL_727;
    }
  }
  else if ((v9 & 0x1000000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x20000000000) != 0)
  {
    if ((v8 & 0x20000000000) == 0
      || self->_appLaunchesSpecificTimeDowLocationForAppInContext != *((double *)v4 + 106))
    {
      goto LABEL_727;
    }
  }
  else if ((v8 & 0x20000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x40000000000) != 0)
  {
    if ((v8 & 0x40000000000) == 0 || self->_appLaunchesSpecificTimeDowLocationInContext != *((double *)v4 + 107))
      goto LABEL_727;
  }
  else if ((v8 & 0x40000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x10000000000) != 0)
  {
    if ((v8 & 0x10000000000) == 0 || self->_appLaunchesSpecificTimeDowLocationForApp != *((double *)v4 + 105))
      goto LABEL_727;
  }
  else if ((v8 & 0x10000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0
      || self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts != *((double *)v4 + 104))
    {
      goto LABEL_727;
    }
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_appLaunchesInTimeBucket0ForApp != *((double *)v4 + 69))
      goto LABEL_727;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_appLaunchesInTimeBucket1ForApp != *((double *)v4 + 80))
      goto LABEL_727;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_appLaunchesInTimeBucket2ForApp != *((double *)v4 + 86))
      goto LABEL_727;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_appLaunchesInTimeBucket3ForApp != *((double *)v4 + 87))
      goto LABEL_727;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_appLaunchesInTimeBucket4ForApp != *((double *)v4 + 88))
      goto LABEL_727;
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_appLaunchesInTimeBucket5ForApp != *((double *)v4 + 89))
      goto LABEL_727;
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_appLaunchesInTimeBucket6ForApp != *((double *)v4 + 90))
      goto LABEL_727;
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_727;
  }
  v11 = *((_QWORD *)v4 + 146);
  v10 = *((_QWORD *)v4 + 147);
  if ((v6 & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_appLaunchesInTimeBucket7ForApp != *((double *)v4 + 91))
      goto LABEL_727;
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_appLaunchesInTimeBucket8ForApp != *((double *)v4 + 92))
      goto LABEL_727;
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_appLaunchesInTimeBucket9ForApp != *((double *)v4 + 93))
      goto LABEL_727;
  }
  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_appLaunchesInTimeBucket10ForApp != *((double *)v4 + 70))
      goto LABEL_727;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_appLaunchesInTimeBucket11ForApp != *((double *)v4 + 71))
      goto LABEL_727;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_appLaunchesInTimeBucket12ForApp != *((double *)v4 + 72))
      goto LABEL_727;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_appLaunchesInTimeBucket13ForApp != *((double *)v4 + 73))
      goto LABEL_727;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_appLaunchesInTimeBucket14ForApp != *((double *)v4 + 74))
      goto LABEL_727;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_appLaunchesInTimeBucket15ForApp != *((double *)v4 + 75))
      goto LABEL_727;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_appLaunchesInTimeBucket16ForApp != *((double *)v4 + 76))
      goto LABEL_727;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_appLaunchesInTimeBucket17ForApp != *((double *)v4 + 77))
      goto LABEL_727;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_appLaunchesInTimeBucket18ForApp != *((double *)v4 + 78))
      goto LABEL_727;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_appLaunchesInTimeBucket19ForApp != *((double *)v4 + 79))
      goto LABEL_727;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_appLaunchesInTimeBucket20ForApp != *((double *)v4 + 81))
      goto LABEL_727;
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_appLaunchesInTimeBucket21ForApp != *((double *)v4 + 82))
      goto LABEL_727;
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_appLaunchesInTimeBucket22ForApp != *((double *)v4 + 83))
      goto LABEL_727;
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_appLaunchesInTimeBucket23ForApp != *((double *)v4 + 84))
      goto LABEL_727;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_appLaunchesInTimeBucket24ForApp != *((double *)v4 + 85))
      goto LABEL_727;
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_appLaunchesOnDayOfWeekSundayForApp != *((double *)v4 + 100))
      goto LABEL_727;
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_appLaunchesOnDayOfWeekMondayForApp != *((double *)v4 + 98))
      goto LABEL_727;
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_appLaunchesOnDayOfWeekTuesdayForApp != *((double *)v4 + 102))
      goto LABEL_727;
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0 || self->_appLaunchesOnDayOfWeekWednesdayForApp != *((double *)v4 + 103))
      goto LABEL_727;
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_appLaunchesOnDayOfWeekThursdayForApp != *((double *)v4 + 101))
      goto LABEL_727;
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_appLaunchesOnDayOfWeekFridayForApp != *((double *)v4 + 97))
      goto LABEL_727;
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_appLaunchesOnDayOfWeekSaturdayForApp != *((double *)v4 + 99))
      goto LABEL_727;
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_appLaunchesAtCoarseGeoHash0ForApp != *((double *)v4 + 10))
      goto LABEL_727;
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_appLaunchesAtCoarseGeoHash1ForApp != *((double *)v4 + 11))
      goto LABEL_727;
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_appLaunchesAtCoarseGeoHash2ForApp != *((double *)v4 + 12))
      goto LABEL_727;
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0 || self->_appLaunchesAtCoarseGeoHash3ForApp != *((double *)v4 + 13))
      goto LABEL_727;
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_appLaunchesAtCoarseGeoHash4ForApp != *((double *)v4 + 14))
      goto LABEL_727;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v11 & 0x4000) == 0 || self->_appLaunchesAtCoarseGeoHash5ForApp != *((double *)v4 + 15))
      goto LABEL_727;
  }
  else if ((v11 & 0x4000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_appLaunchesAtCoarseGeoHash6ForApp != *((double *)v4 + 16))
      goto LABEL_727;
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_appLaunchesAtCoarseGeoHash7ForApp != *((double *)v4 + 17))
      goto LABEL_727;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_appLaunchesAtCoarseGeoHash8ForApp != *((double *)v4 + 18))
      goto LABEL_727;
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_appLaunchesAtCoarseGeoHash9ForApp != *((double *)v4 + 19))
      goto LABEL_727;
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0 || self->_appLaunchesAtSpecificGeoHash0ForApp != *((double *)v4 + 27))
      goto LABEL_727;
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0 || self->_appLaunchesAtSpecificGeoHash1ForApp != *((double *)v4 + 33))
      goto LABEL_727;
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v11 & 0x200000000) == 0 || self->_appLaunchesAtSpecificGeoHash2ForApp != *((double *)v4 + 34))
      goto LABEL_727;
  }
  else if ((v11 & 0x200000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v11 & 0x400000000) == 0 || self->_appLaunchesAtSpecificGeoHash3ForApp != *((double *)v4 + 35))
      goto LABEL_727;
  }
  else if ((v11 & 0x400000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v11 & 0x800000000) == 0 || self->_appLaunchesAtSpecificGeoHash4ForApp != *((double *)v4 + 36))
      goto LABEL_727;
  }
  else if ((v11 & 0x800000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v11 & 0x1000000000) == 0 || self->_appLaunchesAtSpecificGeoHash5ForApp != *((double *)v4 + 37))
      goto LABEL_727;
  }
  else if ((v11 & 0x1000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v11 & 0x2000000000) == 0 || self->_appLaunchesAtSpecificGeoHash6ForApp != *((double *)v4 + 38))
      goto LABEL_727;
  }
  else if ((v11 & 0x2000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v11 & 0x4000000000) == 0 || self->_appLaunchesAtSpecificGeoHash7ForApp != *((double *)v4 + 39))
      goto LABEL_727;
  }
  else if ((v11 & 0x4000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v11 & 0x8000000000) == 0 || self->_appLaunchesAtSpecificGeoHash8ForApp != *((double *)v4 + 40))
      goto LABEL_727;
  }
  else if ((v11 & 0x8000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v11 & 0x10000000000) == 0 || self->_appLaunchesAtSpecificGeoHash9ForApp != *((double *)v4 + 41))
      goto LABEL_727;
  }
  else if ((v11 & 0x10000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v11 & 0x8000000) == 0 || self->_appLaunchesAtSpecificGeoHash10ForApp != *((double *)v4 + 28))
      goto LABEL_727;
  }
  else if ((v11 & 0x8000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v11 & 0x10000000) == 0 || self->_appLaunchesAtSpecificGeoHash11ForApp != *((double *)v4 + 29))
      goto LABEL_727;
  }
  else if ((v11 & 0x10000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v11 & 0x20000000) == 0 || self->_appLaunchesAtSpecificGeoHash12ForApp != *((double *)v4 + 30))
      goto LABEL_727;
  }
  else if ((v11 & 0x20000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v11 & 0x40000000) == 0 || self->_appLaunchesAtSpecificGeoHash13ForApp != *((double *)v4 + 31))
      goto LABEL_727;
  }
  else if ((v11 & 0x40000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) == 0 || self->_appLaunchesAtSpecificGeoHash14ForApp != *((double *)v4 + 32))
      goto LABEL_727;
  }
  else if ((v11 & 0x80000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x100000000000) != 0)
  {
    if ((v10 & 0x100000000000) == 0 || self->_appNumberOfSpecificGeohashesForApp != *((double *)v4 + 109))
      goto LABEL_727;
  }
  else if ((v10 & 0x100000000000) != 0)
  {
    goto LABEL_727;
  }
  v12 = v4[592];
  v13 = *((_QWORD *)v4 + 146);
  v14 = *((_QWORD *)v4 + 147);
  if ((v6 & 0x80000000000) != 0)
  {
    if ((v14 & 0x80000000000) == 0 || self->_appNumberOfCoarseGeohashesForApp != *((double *)v4 + 108))
      goto LABEL_727;
  }
  else if ((v14 & 0x80000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_appEntropyForTimeBuckets != *((double *)v4 + 7))
      goto LABEL_727;
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_appEntropyForSpecificGeoHash != *((double *)v4 + 6))
      goto LABEL_727;
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_appEntropyForCoarseGeoHash != *((double *)v4 + 5))
      goto LABEL_727;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v13 & 0x40000000000) == 0 || self->_appLaunchesAtSpecificGeoHashForAppInContext != *((double *)v4 + 43))
      goto LABEL_727;
  }
  else if ((v13 & 0x40000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0 || self->_appLaunchesAtCoarseGeoHashForAppInContext != *((double *)v4 + 21))
      goto LABEL_727;
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v13 & 0x400000) == 0 || self->_appLaunchesAtDayOfWeekForApp != *((double *)v4 + 23))
      goto LABEL_727;
  }
  else if ((v13 & 0x400000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v13 & 0x200000000000) == 0 || self->_appLaunchesAtTimeAndDayForAppInContext != *((double *)v4 + 46))
      goto LABEL_727;
  }
  else if ((v13 & 0x200000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v13 & 0x400000000000) == 0 || self->_appLaunchesAtTimeAndDayInContext != *((double *)v4 + 47))
      goto LABEL_727;
  }
  else if ((v13 & 0x400000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v13 & 0x100000000000) == 0 || self->_appLaunchesAtTimeAndDayForApp != *((double *)v4 + 45))
      goto LABEL_727;
  }
  else if ((v13 & 0x100000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v13 & 0x200000) == 0 || self->_appLaunchesAtCoarseGeoHashInContext != *((double *)v4 + 22))
      goto LABEL_727;
  }
  else if ((v13 & 0x200000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v13 & 0x80000) == 0 || self->_appLaunchesAtCoarseGeoHashForApp != *((double *)v4 + 20))
      goto LABEL_727;
  }
  else if ((v13 & 0x80000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v13 & 0x80000000000) == 0 || self->_appLaunchesAtSpecificGeoHashInContext != *((double *)v4 + 44))
      goto LABEL_727;
  }
  else if ((v13 & 0x80000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v13 & 0x20000000000) == 0 || self->_appLaunchesAtSpecificGeoHashForApp != *((double *)v4 + 42))
      goto LABEL_727;
  }
  else if ((v13 & 0x20000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate != *((double *)v4 + 65))
      goto LABEL_727;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate != *((double *)v4 + 66))
      goto LABEL_727;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_isLocationServicesDisabled != *((double *)v4 + 130))
      goto LABEL_727;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x40000000) != 0)
  {
    if ((v14 & 0x40000000) == 0 || self->_appLaunchesInTwoHourTimeBucketForAppInContext != *((double *)v4 + 95))
      goto LABEL_727;
  }
  else if ((v14 & 0x40000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x80000000) != 0)
  {
    if ((v14 & 0x80000000) == 0 || self->_appLaunchesInTwoHourTimeBucketInContext != *((double *)v4 + 96))
      goto LABEL_727;
  }
  else if ((v14 & 0x80000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x20000000) != 0)
  {
    if ((v14 & 0x20000000) == 0 || self->_appLaunchesInTwoHourTimeBucketForApp != *((double *)v4 + 94))
      goto LABEL_727;
  }
  else if ((v14 & 0x20000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x20000000000000) != 0)
  {
    if ((v14 & 0x20000000000000) == 0 || self->_currentTimeBucketFromZeroToTwentyFour != *((double *)v4 + 118))
      goto LABEL_727;
  }
  else if ((v14 & 0x20000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v13 & 0x400000000000000) == 0 || self->_appLaunchesAtZoom7GeoHashForAppInContext != *((double *)v4 + 59))
      goto LABEL_727;
  }
  else if ((v13 & 0x400000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v13 & 0x800000000000000) == 0 || self->_appLaunchesAtZoom7GeoHashInContext != *((double *)v4 + 60))
      goto LABEL_727;
  }
  else if ((v13 & 0x800000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v13 & 0x200000000000000) == 0 || self->_appLaunchesAtZoom7GeoHashForApp != *((double *)v4 + 58))
      goto LABEL_727;
  }
  else if ((v13 & 0x200000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v13 & 0x800000000000) == 0 || self->_appLaunchesAtZoom7GeoHash0ForApp != *((double *)v4 + 48))
      goto LABEL_727;
  }
  else if ((v13 & 0x800000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v13 & 0x1000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash1ForApp != *((double *)v4 + 49))
      goto LABEL_727;
  }
  else if ((v13 & 0x1000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v13 & 0x2000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash2ForApp != *((double *)v4 + 50))
      goto LABEL_727;
  }
  else if ((v13 & 0x2000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v13 & 0x4000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash3ForApp != *((double *)v4 + 51))
      goto LABEL_727;
  }
  else if ((v13 & 0x4000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v13 & 0x8000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash4ForApp != *((double *)v4 + 52))
      goto LABEL_727;
  }
  else if ((v13 & 0x8000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v13 & 0x10000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash5ForApp != *((double *)v4 + 53))
      goto LABEL_727;
  }
  else if ((v13 & 0x10000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v13 & 0x20000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash6ForApp != *((double *)v4 + 54))
      goto LABEL_727;
  }
  else if ((v13 & 0x20000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v13 & 0x40000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash7ForApp != *((double *)v4 + 55))
      goto LABEL_727;
  }
  else if ((v13 & 0x40000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v13 & 0x80000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash8ForApp != *((double *)v4 + 56))
      goto LABEL_727;
  }
  else if ((v13 & 0x80000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v13 & 0x100000000000000) == 0 || self->_appLaunchesAtZoom7GeoHash9ForApp != *((double *)v4 + 57))
      goto LABEL_727;
  }
  else if ((v13 & 0x100000000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_appEntropyForZoom7GeoHash != *((double *)v4 + 8))
      goto LABEL_727;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 0x200000000000) != 0)
  {
    if ((v14 & 0x200000000000) == 0 || self->_appNumberOfZoom7GeohashesForApp != *((double *)v4 + 110))
      goto LABEL_727;
  }
  else if ((v14 & 0x200000000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v13 & 0x2000000) == 0 || self->_appLaunchesAtSSIDForAppInContext != *((double *)v4 + 26))
      goto LABEL_727;
  }
  else if ((v13 & 0x2000000) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v13 & 0x1000000) == 0 || self->_appLaunchesAtSSIDForApp != *((double *)v4 + 25))
      goto LABEL_727;
  }
  else if ((v13 & 0x1000000) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_appLaunchesForCoreMotionForAppInContext != *((double *)v4 + 67))
      goto LABEL_727;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_727;
  }
  if ((v6 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_appLaunchesInAirplaneModeForAppInContext != *((double *)v4 + 68))
      goto LABEL_727;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_727;
  }
  if ((*((_WORD *)&self->_has + 8) & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_poiPopularityForAppInContext != *((double *)v4 + 135))
      goto LABEL_727;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_727;
  }
  if ((has & 0x100) == 0)
  {
    if ((v13 & 0x100) == 0)
      goto LABEL_722;
LABEL_727:
    v15 = 0;
    goto LABEL_728;
  }
  if ((v13 & 0x100) == 0 || self->_appLaunchPopularityAtPOIForAppInContext != *((double *)v4 + 9))
    goto LABEL_727;
LABEL_722:
  if ((has & 0x800000) != 0)
  {
    if ((v13 & 0x800000) == 0 || self->_appLaunchesAtPOIForAppInContext != *((double *)v4 + 24))
      goto LABEL_727;
    v15 = 1;
  }
  else
  {
    v15 = (v13 & 0x800000) == 0;
  }
LABEL_728:

  return v15;
}

- (unint64_t)hash
{
  int v3;
  uint64_t has;
  uint64_t v5;
  unint64_t v6;
  double unlockTime;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double launchTimePopularity;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double timeOfDayBucket;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double timeOfDayPopularity;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  double coarseTimeOfDayPopularity;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  double launchPopularity;
  double v33;
  long double v34;
  double v35;
  unint64_t v36;
  double launchDayOfWeekPopularity;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  double dayOfWeekBucket;
  double v43;
  long double v44;
  double v45;
  unint64_t v46;
  double dayOfWeekPopularity;
  double v48;
  long double v49;
  double v50;
  unint64_t v51;
  double entropyLaunchPopularity;
  double v53;
  long double v54;
  double v55;
  unint64_t v56;
  double entropyDayOfWeekPopularity;
  double v58;
  long double v59;
  double v60;
  unint64_t v61;
  double entropyDayOfWeekPopularityByDay;
  double v63;
  long double v64;
  double v65;
  unint64_t v66;
  double entropyDayOfWeekPopularityByApp;
  double v68;
  long double v69;
  double v70;
  unint64_t v71;
  double entropyTrendingPopularity;
  double v73;
  long double v74;
  double v75;
  unint64_t v76;
  double entropySSIDPopularity;
  double v78;
  long double v79;
  double v80;
  unint64_t v81;
  double entropySSIDPopularityBySSID;
  double v83;
  long double v84;
  double v85;
  unint64_t v86;
  double entropySSIDPopularityByApp;
  double v88;
  long double v89;
  double v90;
  unint64_t v91;
  double totalNumberOfLaunches;
  double v93;
  long double v94;
  double v95;
  unint64_t v96;
  double airplaneModePopularity;
  double v98;
  long double v99;
  double v100;
  unint64_t v101;
  double totalNumberOfAirplaneModeLaunches;
  double v103;
  long double v104;
  double v105;
  unint64_t v106;
  double trendingPopularity;
  double v108;
  long double v109;
  double v110;
  unint64_t v111;
  double totalNumberOfTrendingLaunches;
  double v113;
  long double v114;
  double v115;
  unint64_t v116;
  double sSIDPopularity;
  double v118;
  long double v119;
  double v120;
  unint64_t v121;
  double totalNumberOfSSIDLaunches;
  double v123;
  long double v124;
  double v125;
  unint64_t v126;
  double onWifi;
  double v128;
  long double v129;
  double v130;
  unint64_t v131;
  double coreMotionPopularity;
  double v133;
  long double v134;
  double v135;
  unint64_t v136;
  double totalNumberOfCoreMotionLaunches;
  double v138;
  long double v139;
  double v140;
  unint64_t v141;
  double isDateInWeekendOnDevice;
  double v143;
  long double v144;
  double v145;
  unint64_t v146;
  double ambientLightTypePopularity;
  double v148;
  long double v149;
  double v150;
  unint64_t v151;
  double ambientLightTypeLaunchPopularity;
  double v153;
  long double v154;
  double v155;
  unint64_t v156;
  double appTimeOfDayLaunches;
  double v158;
  long double v159;
  double v160;
  unint64_t v161;
  double appDayOfWeekLaunches;
  double v163;
  long double v164;
  double v165;
  unint64_t v166;
  double appTimeAndDayOfWeekPopularity;
  double v168;
  long double v169;
  double v170;
  unint64_t v171;
  double appPopularityGivenTimeAndDayOfWeek;
  double v173;
  long double v174;
  double v175;
  unint64_t v176;
  double appPopularityOfTimeAndDayOfWeekGivenApp;
  double v178;
  long double v179;
  double v180;
  unint64_t v181;
  double appTotalNumberOfTimeAndDayOfWeekLaunches;
  double v183;
  long double v184;
  double v185;
  unint64_t v186;
  double appLaunchesCoarseTimePowLocationForAppInContext;
  double v188;
  long double v189;
  double v190;
  unint64_t v191;
  double appLaunchesCoarseTimePowLocationInContext;
  double v193;
  long double v194;
  double v195;
  unint64_t v196;
  double appLaunchesCoarseTimePowLocationForApp;
  double v198;
  long double v199;
  double v200;
  unint64_t v201;
  double appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
  double v203;
  long double v204;
  double v205;
  unint64_t v206;
  double appLaunchesSpecificTimeDowLocationForAppInContext;
  double v208;
  long double v209;
  double v210;
  unint64_t v211;
  double appLaunchesSpecificTimeDowLocationInContext;
  double v213;
  long double v214;
  double v215;
  unint64_t v216;
  double appLaunchesSpecificTimeDowLocationForApp;
  double v218;
  long double v219;
  double v220;
  unint64_t v221;
  double appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
  double v223;
  long double v224;
  double v225;
  unint64_t v226;
  double appLaunchesInTimeBucket0ForApp;
  double v228;
  long double v229;
  double v230;
  unint64_t v231;
  double appLaunchesInTimeBucket1ForApp;
  double v233;
  long double v234;
  double v235;
  unint64_t v236;
  double appLaunchesInTimeBucket2ForApp;
  double v238;
  long double v239;
  double v240;
  unint64_t v241;
  double appLaunchesInTimeBucket3ForApp;
  double v243;
  long double v244;
  double v245;
  unint64_t v246;
  double appLaunchesInTimeBucket4ForApp;
  double v248;
  long double v249;
  double v250;
  unint64_t v251;
  double appLaunchesInTimeBucket5ForApp;
  double v253;
  long double v254;
  double v255;
  unint64_t v256;
  double appLaunchesInTimeBucket6ForApp;
  double v258;
  long double v259;
  double v260;
  unint64_t v261;
  double appLaunchesInTimeBucket7ForApp;
  double v263;
  long double v264;
  double v265;
  unint64_t v266;
  double appLaunchesInTimeBucket8ForApp;
  double v268;
  long double v269;
  double v270;
  unint64_t v271;
  double appLaunchesInTimeBucket9ForApp;
  double v273;
  long double v274;
  double v275;
  unint64_t v276;
  double appLaunchesInTimeBucket10ForApp;
  double v278;
  long double v279;
  double v280;
  unint64_t v281;
  double appLaunchesInTimeBucket11ForApp;
  double v283;
  long double v284;
  double v285;
  unint64_t v286;
  double appLaunchesInTimeBucket12ForApp;
  double v288;
  long double v289;
  double v290;
  unint64_t v291;
  double appLaunchesInTimeBucket13ForApp;
  double v293;
  long double v294;
  double v295;
  unint64_t v296;
  double appLaunchesInTimeBucket14ForApp;
  double v298;
  long double v299;
  double v300;
  unint64_t v301;
  double appLaunchesInTimeBucket15ForApp;
  double v303;
  long double v304;
  double v305;
  unint64_t v306;
  double appLaunchesInTimeBucket16ForApp;
  double v308;
  long double v309;
  double v310;
  unint64_t v311;
  double appLaunchesInTimeBucket17ForApp;
  double v313;
  long double v314;
  double v315;
  unint64_t v316;
  double appLaunchesInTimeBucket18ForApp;
  double v318;
  long double v319;
  double v320;
  unint64_t v321;
  double appLaunchesInTimeBucket19ForApp;
  double v323;
  long double v324;
  double v325;
  unint64_t v326;
  double appLaunchesInTimeBucket20ForApp;
  double v328;
  long double v329;
  double v330;
  unint64_t v331;
  double appLaunchesInTimeBucket21ForApp;
  double v333;
  long double v334;
  double v335;
  unint64_t v336;
  double appLaunchesInTimeBucket22ForApp;
  double v338;
  long double v339;
  double v340;
  unint64_t v341;
  double appLaunchesInTimeBucket23ForApp;
  double v343;
  long double v344;
  double v345;
  unint64_t v346;
  double appLaunchesInTimeBucket24ForApp;
  double v348;
  long double v349;
  double v350;
  unint64_t v351;
  double appLaunchesOnDayOfWeekSundayForApp;
  double v353;
  long double v354;
  double v355;
  unint64_t v356;
  double appLaunchesOnDayOfWeekMondayForApp;
  double v358;
  long double v359;
  double v360;
  unint64_t v361;
  double appLaunchesOnDayOfWeekTuesdayForApp;
  double v363;
  long double v364;
  double v365;
  unint64_t v366;
  double appLaunchesOnDayOfWeekWednesdayForApp;
  double v368;
  long double v369;
  double v370;
  unint64_t v371;
  double appLaunchesOnDayOfWeekThursdayForApp;
  double v373;
  long double v374;
  double v375;
  unint64_t v376;
  double appLaunchesOnDayOfWeekFridayForApp;
  double v378;
  long double v379;
  double v380;
  unint64_t v381;
  double appLaunchesOnDayOfWeekSaturdayForApp;
  double v383;
  long double v384;
  double v385;
  unint64_t v386;
  double appLaunchesAtCoarseGeoHash0ForApp;
  double v388;
  long double v389;
  double v390;
  unint64_t v391;
  double appLaunchesAtCoarseGeoHash1ForApp;
  double v393;
  long double v394;
  double v395;
  unint64_t v396;
  double appLaunchesAtCoarseGeoHash2ForApp;
  double v398;
  long double v399;
  double v400;
  unint64_t v401;
  double appLaunchesAtCoarseGeoHash3ForApp;
  double v403;
  long double v404;
  double v405;
  unint64_t v406;
  double appLaunchesAtCoarseGeoHash4ForApp;
  double v408;
  long double v409;
  double v410;
  unint64_t v411;
  double appLaunchesAtCoarseGeoHash5ForApp;
  double v413;
  long double v414;
  double v415;
  unint64_t v416;
  double appLaunchesAtCoarseGeoHash6ForApp;
  double v418;
  long double v419;
  double v420;
  unint64_t v421;
  double appLaunchesAtCoarseGeoHash7ForApp;
  double v423;
  long double v424;
  double v425;
  unint64_t v426;
  double appLaunchesAtCoarseGeoHash8ForApp;
  double v428;
  long double v429;
  double v430;
  unint64_t v431;
  double appLaunchesAtCoarseGeoHash9ForApp;
  double v433;
  long double v434;
  double v435;
  unint64_t v436;
  double appLaunchesAtSpecificGeoHash0ForApp;
  double v438;
  long double v439;
  double v440;
  unint64_t v441;
  double appLaunchesAtSpecificGeoHash1ForApp;
  double v443;
  long double v444;
  double v445;
  unint64_t v446;
  double appLaunchesAtSpecificGeoHash2ForApp;
  double v448;
  long double v449;
  double v450;
  unint64_t v451;
  double appLaunchesAtSpecificGeoHash3ForApp;
  double v453;
  long double v454;
  double v455;
  unint64_t v456;
  double appLaunchesAtSpecificGeoHash4ForApp;
  double v458;
  long double v459;
  double v460;
  unint64_t v461;
  double appLaunchesAtSpecificGeoHash5ForApp;
  double v463;
  long double v464;
  double v465;
  unint64_t v466;
  double appLaunchesAtSpecificGeoHash6ForApp;
  double v468;
  long double v469;
  double v470;
  unint64_t v471;
  double appLaunchesAtSpecificGeoHash7ForApp;
  double v473;
  long double v474;
  double v475;
  unint64_t v476;
  double appLaunchesAtSpecificGeoHash8ForApp;
  double v478;
  long double v479;
  double v480;
  unint64_t v481;
  double appLaunchesAtSpecificGeoHash9ForApp;
  double v483;
  long double v484;
  double v485;
  unint64_t v486;
  double appLaunchesAtSpecificGeoHash10ForApp;
  double v488;
  long double v489;
  double v490;
  unint64_t v491;
  double appLaunchesAtSpecificGeoHash11ForApp;
  double v493;
  long double v494;
  double v495;
  unint64_t v496;
  double appLaunchesAtSpecificGeoHash12ForApp;
  double v498;
  long double v499;
  double v500;
  unint64_t v501;
  double appLaunchesAtSpecificGeoHash13ForApp;
  double v503;
  long double v504;
  double v505;
  unint64_t v506;
  double appLaunchesAtSpecificGeoHash14ForApp;
  double v508;
  long double v509;
  double v510;
  unint64_t v511;
  double appNumberOfSpecificGeohashesForApp;
  double v513;
  long double v514;
  double v515;
  unint64_t v516;
  double appNumberOfCoarseGeohashesForApp;
  double v518;
  long double v519;
  double v520;
  unint64_t v521;
  double appEntropyForTimeBuckets;
  double v523;
  long double v524;
  double v525;
  unint64_t v526;
  double appEntropyForSpecificGeoHash;
  double v528;
  long double v529;
  double v530;
  unint64_t v531;
  double appEntropyForCoarseGeoHash;
  double v533;
  long double v534;
  double v535;
  unint64_t v536;
  double appLaunchesAtSpecificGeoHashForAppInContext;
  double v538;
  long double v539;
  double v540;
  unint64_t v541;
  double appLaunchesAtCoarseGeoHashForAppInContext;
  double v543;
  long double v544;
  double v545;
  unint64_t v546;
  double appLaunchesAtDayOfWeekForApp;
  double v548;
  long double v549;
  double v550;
  unint64_t v551;
  double appLaunchesAtTimeAndDayForAppInContext;
  double v553;
  long double v554;
  double v555;
  unint64_t v556;
  double appLaunchesAtTimeAndDayInContext;
  double v558;
  long double v559;
  double v560;
  unint64_t v561;
  double appLaunchesAtTimeAndDayForApp;
  double v563;
  long double v564;
  double v565;
  unint64_t v566;
  double appLaunchesAtCoarseGeoHashInContext;
  double v568;
  long double v569;
  double v570;
  unint64_t v571;
  double appLaunchesAtCoarseGeoHashForApp;
  double v573;
  long double v574;
  double v575;
  unint64_t v576;
  double appLaunchesAtSpecificGeoHashInContext;
  double v578;
  long double v579;
  double v580;
  unint64_t v581;
  double appLaunchesAtSpecificGeoHashForApp;
  double v583;
  long double v584;
  double v585;
  unint64_t v586;
  double appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
  double v588;
  long double v589;
  double v590;
  unint64_t v591;
  double appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
  double v593;
  long double v594;
  double v595;
  unint64_t v596;
  double isLocationServicesDisabled;
  double v598;
  long double v599;
  double v600;
  unint64_t v601;
  double appLaunchesInTwoHourTimeBucketForAppInContext;
  double v603;
  long double v604;
  double v605;
  unint64_t v606;
  double appLaunchesInTwoHourTimeBucketInContext;
  double v608;
  long double v609;
  double v610;
  unint64_t v611;
  double appLaunchesInTwoHourTimeBucketForApp;
  double v613;
  long double v614;
  double v615;
  unint64_t v616;
  double currentTimeBucketFromZeroToTwentyFour;
  double v618;
  long double v619;
  double v620;
  unint64_t v621;
  double appLaunchesAtZoom7GeoHashForAppInContext;
  double v623;
  long double v624;
  double v625;
  unint64_t v626;
  double appLaunchesAtZoom7GeoHashInContext;
  double v628;
  long double v629;
  double v630;
  unint64_t v631;
  double appLaunchesAtZoom7GeoHashForApp;
  double v633;
  long double v634;
  double v635;
  unint64_t v636;
  double appLaunchesAtZoom7GeoHash0ForApp;
  double v638;
  long double v639;
  double v640;
  unint64_t v641;
  double appLaunchesAtZoom7GeoHash1ForApp;
  double v643;
  long double v644;
  double v645;
  unint64_t v646;
  double appLaunchesAtZoom7GeoHash2ForApp;
  double v648;
  long double v649;
  double v650;
  unint64_t v651;
  double appLaunchesAtZoom7GeoHash3ForApp;
  double v653;
  long double v654;
  double v655;
  unint64_t v656;
  double appLaunchesAtZoom7GeoHash4ForApp;
  double v658;
  long double v659;
  double v660;
  unint64_t v661;
  double appLaunchesAtZoom7GeoHash5ForApp;
  double v663;
  long double v664;
  double v665;
  unint64_t v666;
  double appLaunchesAtZoom7GeoHash6ForApp;
  double v668;
  long double v669;
  double v670;
  unint64_t v671;
  double appLaunchesAtZoom7GeoHash7ForApp;
  double v673;
  long double v674;
  double v675;
  unint64_t v676;
  double appLaunchesAtZoom7GeoHash8ForApp;
  double v678;
  long double v679;
  double v680;
  unint64_t v681;
  double appLaunchesAtZoom7GeoHash9ForApp;
  double v683;
  long double v684;
  double v685;
  unint64_t v686;
  double appEntropyForZoom7GeoHash;
  double v688;
  long double v689;
  double v690;
  unint64_t v691;
  double appNumberOfZoom7GeohashesForApp;
  double v693;
  long double v694;
  double v695;
  unint64_t v696;
  double appLaunchesAtSSIDForAppInContext;
  double v698;
  long double v699;
  double v700;
  unint64_t v701;
  double appLaunchesAtSSIDForApp;
  double v703;
  long double v704;
  double v705;
  unint64_t v706;
  double appLaunchesForCoreMotionForAppInContext;
  double v708;
  long double v709;
  double v710;
  unint64_t v711;
  double appLaunchesInAirplaneModeForAppInContext;
  double v713;
  long double v714;
  double v715;
  unint64_t v716;
  double poiPopularityForAppInContext;
  double v718;
  long double v719;
  double v720;
  unint64_t v721;
  double appLaunchPopularityAtPOIForAppInContext;
  double v723;
  long double v724;
  double v725;
  unint64_t v726;
  double appLaunchesAtPOIForAppInContext;
  double v728;
  long double v729;
  double v730;
  unint64_t v731;
  unint64_t v733;
  unint64_t v734;
  unint64_t v735;
  unint64_t v736;
  unint64_t v737;
  unint64_t v738;
  unint64_t v739;
  unint64_t v740;
  unint64_t v741;
  unint64_t v742;
  unint64_t v743;
  unint64_t v744;
  unint64_t v745;
  unint64_t v746;
  unint64_t v747;
  unint64_t v748;
  unint64_t v749;
  unint64_t v750;
  unint64_t v751;
  unint64_t v752;
  unint64_t v753;
  unint64_t v754;
  unint64_t v755;
  unint64_t v756;
  unint64_t v757;
  unint64_t v758;
  unint64_t v759;
  unint64_t v760;
  unint64_t v761;
  unint64_t v762;
  unint64_t v763;
  unint64_t v764;
  unint64_t v765;
  unint64_t v766;
  unint64_t v767;
  unint64_t v768;
  unint64_t v769;
  unint64_t v770;
  unint64_t v771;
  unint64_t v772;
  unint64_t v773;
  unint64_t v774;
  unint64_t v775;
  unint64_t v776;
  unint64_t v777;
  unint64_t v778;
  unint64_t v779;
  unint64_t v780;
  unint64_t v781;
  unint64_t v782;
  unint64_t v783;
  unint64_t v784;
  unint64_t v785;
  unint64_t v786;
  unint64_t v787;
  unint64_t v788;
  unint64_t v789;
  unint64_t v790;
  unint64_t v791;
  unint64_t v792;
  unint64_t v793;
  unint64_t v794;
  unint64_t v795;
  unint64_t v796;
  unint64_t v797;
  unint64_t v798;
  unint64_t v799;
  unint64_t v800;
  unint64_t v801;
  unint64_t v802;
  unint64_t v803;
  unint64_t v804;
  unint64_t v805;
  unint64_t v806;
  unint64_t v807;
  unint64_t v808;
  unint64_t v809;
  unint64_t v810;
  unint64_t v811;
  unint64_t v812;
  unint64_t v813;
  unint64_t v814;
  unint64_t v815;
  unint64_t v816;
  unint64_t v817;
  unint64_t v818;
  unint64_t v819;
  unint64_t v820;
  unint64_t v821;
  unint64_t v822;
  unint64_t v823;
  unint64_t v824;
  unint64_t v825;
  unint64_t v826;
  unint64_t v827;
  unint64_t v828;
  unint64_t v829;
  unint64_t v830;
  unint64_t v831;
  unint64_t v832;
  unint64_t v833;
  unint64_t v834;
  unint64_t v835;
  unint64_t v836;
  unint64_t v837;
  unint64_t v838;
  unint64_t v839;
  unint64_t v840;
  unint64_t v841;
  unint64_t v842;
  unint64_t v843;
  unint64_t v844;
  unint64_t v845;
  unint64_t v846;
  unint64_t v847;
  unint64_t v848;
  unint64_t v849;
  unint64_t v850;
  unint64_t v851;
  unint64_t v852;
  unint64_t v853;
  unint64_t v854;
  unint64_t v855;
  unint64_t v856;
  unint64_t v857;
  unint64_t v858;
  unint64_t v859;
  unint64_t v860;
  unint64_t v861;
  unint64_t v862;
  unint64_t v863;
  unint64_t v864;
  unint64_t v865;
  unint64_t v866;
  unint64_t v867;
  unint64_t v868;
  unint64_t v869;

  v3 = *((unsigned __int16 *)&self->_has + 8) | (*((unsigned __int8 *)&self->_has + 18) << 16);
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v3 & 0x10000) != 0)
  {
    unlockTime = self->_unlockTime;
    v8 = -unlockTime;
    if (unlockTime >= 0.0)
      v8 = self->_unlockTime;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((v3 & 0x10) != 0)
  {
    launchTimePopularity = self->_launchTimePopularity;
    v13 = -launchTimePopularity;
    if (launchTimePopularity >= 0.0)
      v13 = self->_launchTimePopularity;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((v3 & 0x100) != 0)
  {
    timeOfDayBucket = self->_timeOfDayBucket;
    v18 = -timeOfDayBucket;
    if (timeOfDayBucket >= 0.0)
      v18 = self->_timeOfDayBucket;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((v3 & 0x200) != 0)
  {
    timeOfDayPopularity = self->_timeOfDayPopularity;
    v23 = -timeOfDayPopularity;
    if (timeOfDayPopularity >= 0.0)
      v23 = self->_timeOfDayPopularity;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((v5 & 0x8000000000000) != 0)
  {
    coarseTimeOfDayPopularity = self->_coarseTimeOfDayPopularity;
    v28 = -coarseTimeOfDayPopularity;
    if (coarseTimeOfDayPopularity >= 0.0)
      v28 = self->_coarseTimeOfDayPopularity;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((v3 & 8) != 0)
  {
    launchPopularity = self->_launchPopularity;
    v33 = -launchPopularity;
    if (launchPopularity >= 0.0)
      v33 = self->_launchPopularity;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  v867 = v31;
  if ((v3 & 4) != 0)
  {
    launchDayOfWeekPopularity = self->_launchDayOfWeekPopularity;
    v38 = -launchDayOfWeekPopularity;
    if (launchDayOfWeekPopularity >= 0.0)
      v38 = self->_launchDayOfWeekPopularity;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v36 += (unint64_t)v40;
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    v36 = 0;
  }
  v866 = v36;
  if ((v5 & 0x40000000000000) != 0)
  {
    dayOfWeekBucket = self->_dayOfWeekBucket;
    v43 = -dayOfWeekBucket;
    if (dayOfWeekBucket >= 0.0)
      v43 = self->_dayOfWeekBucket;
    v44 = floor(v43 + 0.5);
    v45 = (v43 - v44) * 1.84467441e19;
    v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v41 += (unint64_t)v45;
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    v41 = 0;
  }
  v865 = v41;
  if ((v5 & 0x80000000000000) != 0)
  {
    dayOfWeekPopularity = self->_dayOfWeekPopularity;
    v48 = -dayOfWeekPopularity;
    if (dayOfWeekPopularity >= 0.0)
      v48 = self->_dayOfWeekPopularity;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  v864 = v46;
  if ((v5 & 0x800000000000000) != 0)
  {
    entropyLaunchPopularity = self->_entropyLaunchPopularity;
    v53 = -entropyLaunchPopularity;
    if (entropyLaunchPopularity >= 0.0)
      v53 = self->_entropyLaunchPopularity;
    v54 = floor(v53 + 0.5);
    v55 = (v53 - v54) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0)
        v51 += (unint64_t)v55;
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    v51 = 0;
  }
  v863 = v51;
  if ((v5 & 0x100000000000000) != 0)
  {
    entropyDayOfWeekPopularity = self->_entropyDayOfWeekPopularity;
    v58 = -entropyDayOfWeekPopularity;
    if (entropyDayOfWeekPopularity >= 0.0)
      v58 = self->_entropyDayOfWeekPopularity;
    v59 = floor(v58 + 0.5);
    v60 = (v58 - v59) * 1.84467441e19;
    v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0)
        v56 += (unint64_t)v60;
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    v56 = 0;
  }
  v862 = v56;
  if ((v5 & 0x400000000000000) != 0)
  {
    entropyDayOfWeekPopularityByDay = self->_entropyDayOfWeekPopularityByDay;
    v63 = -entropyDayOfWeekPopularityByDay;
    if (entropyDayOfWeekPopularityByDay >= 0.0)
      v63 = self->_entropyDayOfWeekPopularityByDay;
    v64 = floor(v63 + 0.5);
    v65 = (v63 - v64) * 1.84467441e19;
    v61 = 2654435761u * (unint64_t)fmod(v64, 1.84467441e19);
    if (v65 >= 0.0)
    {
      if (v65 > 0.0)
        v61 += (unint64_t)v65;
    }
    else
    {
      v61 -= (unint64_t)fabs(v65);
    }
  }
  else
  {
    v61 = 0;
  }
  v861 = v61;
  if ((v5 & 0x200000000000000) != 0)
  {
    entropyDayOfWeekPopularityByApp = self->_entropyDayOfWeekPopularityByApp;
    v68 = -entropyDayOfWeekPopularityByApp;
    if (entropyDayOfWeekPopularityByApp >= 0.0)
      v68 = self->_entropyDayOfWeekPopularityByApp;
    v69 = floor(v68 + 0.5);
    v70 = (v68 - v69) * 1.84467441e19;
    v66 = 2654435761u * (unint64_t)fmod(v69, 1.84467441e19);
    if (v70 >= 0.0)
    {
      if (v70 > 0.0)
        v66 += (unint64_t)v70;
    }
    else
    {
      v66 -= (unint64_t)fabs(v70);
    }
  }
  else
  {
    v66 = 0;
  }
  v860 = v66;
  if (v5 < 0)
  {
    entropyTrendingPopularity = self->_entropyTrendingPopularity;
    v73 = -entropyTrendingPopularity;
    if (entropyTrendingPopularity >= 0.0)
      v73 = self->_entropyTrendingPopularity;
    v74 = floor(v73 + 0.5);
    v75 = (v73 - v74) * 1.84467441e19;
    v71 = 2654435761u * (unint64_t)fmod(v74, 1.84467441e19);
    if (v75 >= 0.0)
    {
      if (v75 > 0.0)
        v71 += (unint64_t)v75;
    }
    else
    {
      v71 -= (unint64_t)fabs(v75);
    }
  }
  else
  {
    v71 = 0;
  }
  v859 = v71;
  if ((v5 & 0x1000000000000000) != 0)
  {
    entropySSIDPopularity = self->_entropySSIDPopularity;
    v78 = -entropySSIDPopularity;
    if (entropySSIDPopularity >= 0.0)
      v78 = self->_entropySSIDPopularity;
    v79 = floor(v78 + 0.5);
    v80 = (v78 - v79) * 1.84467441e19;
    v76 = 2654435761u * (unint64_t)fmod(v79, 1.84467441e19);
    if (v80 >= 0.0)
    {
      if (v80 > 0.0)
        v76 += (unint64_t)v80;
    }
    else
    {
      v76 -= (unint64_t)fabs(v80);
    }
  }
  else
  {
    v76 = 0;
  }
  v858 = v76;
  if ((v5 & 0x4000000000000000) != 0)
  {
    entropySSIDPopularityBySSID = self->_entropySSIDPopularityBySSID;
    v83 = -entropySSIDPopularityBySSID;
    if (entropySSIDPopularityBySSID >= 0.0)
      v83 = self->_entropySSIDPopularityBySSID;
    v84 = floor(v83 + 0.5);
    v85 = (v83 - v84) * 1.84467441e19;
    v81 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
    if (v85 >= 0.0)
    {
      if (v85 > 0.0)
        v81 += (unint64_t)v85;
    }
    else
    {
      v81 -= (unint64_t)fabs(v85);
    }
  }
  else
  {
    v81 = 0;
  }
  v857 = v81;
  if ((v5 & 0x2000000000000000) != 0)
  {
    entropySSIDPopularityByApp = self->_entropySSIDPopularityByApp;
    v88 = -entropySSIDPopularityByApp;
    if (entropySSIDPopularityByApp >= 0.0)
      v88 = self->_entropySSIDPopularityByApp;
    v89 = floor(v88 + 0.5);
    v90 = (v88 - v89) * 1.84467441e19;
    v86 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    if (v90 >= 0.0)
    {
      if (v90 > 0.0)
        v86 += (unint64_t)v90;
    }
    else
    {
      v86 -= (unint64_t)fabs(v90);
    }
  }
  else
  {
    v86 = 0;
  }
  v856 = v86;
  if ((v3 & 0x1000) != 0)
  {
    totalNumberOfLaunches = self->_totalNumberOfLaunches;
    v93 = -totalNumberOfLaunches;
    if (totalNumberOfLaunches >= 0.0)
      v93 = self->_totalNumberOfLaunches;
    v94 = floor(v93 + 0.5);
    v95 = (v93 - v94) * 1.84467441e19;
    v91 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
    if (v95 >= 0.0)
    {
      if (v95 > 0.0)
        v91 += (unint64_t)v95;
    }
    else
    {
      v91 -= (unint64_t)fabs(v95);
    }
  }
  else
  {
    v91 = 0;
  }
  v855 = v91;
  if ((has & 1) != 0)
  {
    airplaneModePopularity = self->_airplaneModePopularity;
    v98 = -airplaneModePopularity;
    if (airplaneModePopularity >= 0.0)
      v98 = self->_airplaneModePopularity;
    v99 = floor(v98 + 0.5);
    v100 = (v98 - v99) * 1.84467441e19;
    v96 = 2654435761u * (unint64_t)fmod(v99, 1.84467441e19);
    if (v100 >= 0.0)
    {
      if (v100 > 0.0)
        v96 += (unint64_t)v100;
    }
    else
    {
      v96 -= (unint64_t)fabs(v100);
    }
  }
  else
  {
    v96 = 0;
  }
  v854 = v96;
  if ((v3 & 0x400) != 0)
  {
    totalNumberOfAirplaneModeLaunches = self->_totalNumberOfAirplaneModeLaunches;
    v103 = -totalNumberOfAirplaneModeLaunches;
    if (totalNumberOfAirplaneModeLaunches >= 0.0)
      v103 = self->_totalNumberOfAirplaneModeLaunches;
    v104 = floor(v103 + 0.5);
    v105 = (v103 - v104) * 1.84467441e19;
    v101 = 2654435761u * (unint64_t)fmod(v104, 1.84467441e19);
    if (v105 >= 0.0)
    {
      if (v105 > 0.0)
        v101 += (unint64_t)v105;
    }
    else
    {
      v101 -= (unint64_t)fabs(v105);
    }
  }
  else
  {
    v101 = 0;
  }
  v853 = v101;
  if ((v3 & 0x8000) != 0)
  {
    trendingPopularity = self->_trendingPopularity;
    v108 = -trendingPopularity;
    if (trendingPopularity >= 0.0)
      v108 = self->_trendingPopularity;
    v109 = floor(v108 + 0.5);
    v110 = (v108 - v109) * 1.84467441e19;
    v106 = 2654435761u * (unint64_t)fmod(v109, 1.84467441e19);
    if (v110 >= 0.0)
    {
      if (v110 > 0.0)
        v106 += (unint64_t)v110;
    }
    else
    {
      v106 -= (unint64_t)fabs(v110);
    }
  }
  else
  {
    v106 = 0;
  }
  v852 = v106;
  if ((v3 & 0x4000) != 0)
  {
    totalNumberOfTrendingLaunches = self->_totalNumberOfTrendingLaunches;
    v113 = -totalNumberOfTrendingLaunches;
    if (totalNumberOfTrendingLaunches >= 0.0)
      v113 = self->_totalNumberOfTrendingLaunches;
    v114 = floor(v113 + 0.5);
    v115 = (v113 - v114) * 1.84467441e19;
    v111 = 2654435761u * (unint64_t)fmod(v114, 1.84467441e19);
    if (v115 >= 0.0)
    {
      if (v115 > 0.0)
        v111 += (unint64_t)v115;
    }
    else
    {
      v111 -= (unint64_t)fabs(v115);
    }
  }
  else
  {
    v111 = 0;
  }
  v851 = v111;
  if ((v3 & 0x80) != 0)
  {
    sSIDPopularity = self->_sSIDPopularity;
    v118 = -sSIDPopularity;
    if (sSIDPopularity >= 0.0)
      v118 = self->_sSIDPopularity;
    v119 = floor(v118 + 0.5);
    v120 = (v118 - v119) * 1.84467441e19;
    v116 = 2654435761u * (unint64_t)fmod(v119, 1.84467441e19);
    if (v120 >= 0.0)
    {
      if (v120 > 0.0)
        v116 += (unint64_t)v120;
    }
    else
    {
      v116 -= (unint64_t)fabs(v120);
    }
  }
  else
  {
    v116 = 0;
  }
  v850 = v116;
  if ((v3 & 0x2000) != 0)
  {
    totalNumberOfSSIDLaunches = self->_totalNumberOfSSIDLaunches;
    v123 = -totalNumberOfSSIDLaunches;
    if (totalNumberOfSSIDLaunches >= 0.0)
      v123 = self->_totalNumberOfSSIDLaunches;
    v124 = floor(v123 + 0.5);
    v125 = (v123 - v124) * 1.84467441e19;
    v121 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
    if (v125 >= 0.0)
    {
      if (v125 > 0.0)
        v121 += (unint64_t)v125;
    }
    else
    {
      v121 -= (unint64_t)fabs(v125);
    }
  }
  else
  {
    v121 = 0;
  }
  v849 = v121;
  if ((v3 & 0x20) != 0)
  {
    onWifi = self->_onWifi;
    v128 = -onWifi;
    if (onWifi >= 0.0)
      v128 = self->_onWifi;
    v129 = floor(v128 + 0.5);
    v130 = (v128 - v129) * 1.84467441e19;
    v126 = 2654435761u * (unint64_t)fmod(v129, 1.84467441e19);
    if (v130 >= 0.0)
    {
      if (v130 > 0.0)
        v126 += (unint64_t)v130;
    }
    else
    {
      v126 -= (unint64_t)fabs(v130);
    }
  }
  else
  {
    v126 = 0;
  }
  v848 = v126;
  if ((v5 & 0x10000000000000) != 0)
  {
    coreMotionPopularity = self->_coreMotionPopularity;
    v133 = -coreMotionPopularity;
    if (coreMotionPopularity >= 0.0)
      v133 = self->_coreMotionPopularity;
    v134 = floor(v133 + 0.5);
    v135 = (v133 - v134) * 1.84467441e19;
    v131 = 2654435761u * (unint64_t)fmod(v134, 1.84467441e19);
    if (v135 >= 0.0)
    {
      if (v135 > 0.0)
        v131 += (unint64_t)v135;
    }
    else
    {
      v131 -= (unint64_t)fabs(v135);
    }
  }
  else
  {
    v131 = 0;
  }
  v847 = v131;
  if ((v3 & 0x800) != 0)
  {
    totalNumberOfCoreMotionLaunches = self->_totalNumberOfCoreMotionLaunches;
    v138 = -totalNumberOfCoreMotionLaunches;
    if (totalNumberOfCoreMotionLaunches >= 0.0)
      v138 = self->_totalNumberOfCoreMotionLaunches;
    v139 = floor(v138 + 0.5);
    v140 = (v138 - v139) * 1.84467441e19;
    v136 = 2654435761u * (unint64_t)fmod(v139, 1.84467441e19);
    if (v140 >= 0.0)
    {
      if (v140 > 0.0)
        v136 += (unint64_t)v140;
    }
    else
    {
      v136 -= (unint64_t)fabs(v140);
    }
  }
  else
  {
    v136 = 0;
  }
  v846 = v136;
  if ((v3 & 1) != 0)
  {
    isDateInWeekendOnDevice = self->_isDateInWeekendOnDevice;
    v143 = -isDateInWeekendOnDevice;
    if (isDateInWeekendOnDevice >= 0.0)
      v143 = self->_isDateInWeekendOnDevice;
    v144 = floor(v143 + 0.5);
    v145 = (v143 - v144) * 1.84467441e19;
    v141 = 2654435761u * (unint64_t)fmod(v144, 1.84467441e19);
    if (v145 >= 0.0)
    {
      if (v145 > 0.0)
        v141 += (unint64_t)v145;
    }
    else
    {
      v141 -= (unint64_t)fabs(v145);
    }
  }
  else
  {
    v141 = 0;
  }
  v845 = v141;
  if ((has & 4) != 0)
  {
    ambientLightTypePopularity = self->_ambientLightTypePopularity;
    v148 = -ambientLightTypePopularity;
    if (ambientLightTypePopularity >= 0.0)
      v148 = self->_ambientLightTypePopularity;
    v149 = floor(v148 + 0.5);
    v150 = (v148 - v149) * 1.84467441e19;
    v146 = 2654435761u * (unint64_t)fmod(v149, 1.84467441e19);
    if (v150 >= 0.0)
    {
      if (v150 > 0.0)
        v146 += (unint64_t)v150;
    }
    else
    {
      v146 -= (unint64_t)fabs(v150);
    }
  }
  else
  {
    v146 = 0;
  }
  v844 = v146;
  if ((has & 2) != 0)
  {
    ambientLightTypeLaunchPopularity = self->_ambientLightTypeLaunchPopularity;
    v153 = -ambientLightTypeLaunchPopularity;
    if (ambientLightTypeLaunchPopularity >= 0.0)
      v153 = self->_ambientLightTypeLaunchPopularity;
    v154 = floor(v153 + 0.5);
    v155 = (v153 - v154) * 1.84467441e19;
    v151 = 2654435761u * (unint64_t)fmod(v154, 1.84467441e19);
    if (v155 >= 0.0)
    {
      if (v155 > 0.0)
        v151 += (unint64_t)v155;
    }
    else
    {
      v151 -= (unint64_t)fabs(v155);
    }
  }
  else
  {
    v151 = 0;
  }
  v843 = v151;
  if ((v5 & 0x2000000000000) != 0)
  {
    appTimeOfDayLaunches = self->_appTimeOfDayLaunches;
    v158 = -appTimeOfDayLaunches;
    if (appTimeOfDayLaunches >= 0.0)
      v158 = self->_appTimeOfDayLaunches;
    v159 = floor(v158 + 0.5);
    v160 = (v158 - v159) * 1.84467441e19;
    v156 = 2654435761u * (unint64_t)fmod(v159, 1.84467441e19);
    if (v160 >= 0.0)
    {
      if (v160 > 0.0)
        v156 += (unint64_t)v160;
    }
    else
    {
      v156 -= (unint64_t)fabs(v160);
    }
  }
  else
  {
    v156 = 0;
  }
  v842 = v156;
  if ((has & 8) != 0)
  {
    appDayOfWeekLaunches = self->_appDayOfWeekLaunches;
    v163 = -appDayOfWeekLaunches;
    if (appDayOfWeekLaunches >= 0.0)
      v163 = self->_appDayOfWeekLaunches;
    v164 = floor(v163 + 0.5);
    v165 = (v163 - v164) * 1.84467441e19;
    v161 = 2654435761u * (unint64_t)fmod(v164, 1.84467441e19);
    if (v165 >= 0.0)
    {
      if (v165 > 0.0)
        v161 += (unint64_t)v165;
    }
    else
    {
      v161 -= (unint64_t)fabs(v165);
    }
  }
  else
  {
    v161 = 0;
  }
  v841 = v161;
  if ((v5 & 0x1000000000000) != 0)
  {
    appTimeAndDayOfWeekPopularity = self->_appTimeAndDayOfWeekPopularity;
    v168 = -appTimeAndDayOfWeekPopularity;
    if (appTimeAndDayOfWeekPopularity >= 0.0)
      v168 = self->_appTimeAndDayOfWeekPopularity;
    v169 = floor(v168 + 0.5);
    v170 = (v168 - v169) * 1.84467441e19;
    v166 = 2654435761u * (unint64_t)fmod(v169, 1.84467441e19);
    if (v170 >= 0.0)
    {
      if (v170 > 0.0)
        v166 += (unint64_t)v170;
    }
    else
    {
      v166 -= (unint64_t)fabs(v170);
    }
  }
  else
  {
    v166 = 0;
  }
  v840 = v166;
  if ((v5 & 0x400000000000) != 0)
  {
    appPopularityGivenTimeAndDayOfWeek = self->_appPopularityGivenTimeAndDayOfWeek;
    v173 = -appPopularityGivenTimeAndDayOfWeek;
    if (appPopularityGivenTimeAndDayOfWeek >= 0.0)
      v173 = self->_appPopularityGivenTimeAndDayOfWeek;
    v174 = floor(v173 + 0.5);
    v175 = (v173 - v174) * 1.84467441e19;
    v171 = 2654435761u * (unint64_t)fmod(v174, 1.84467441e19);
    if (v175 >= 0.0)
    {
      if (v175 > 0.0)
        v171 += (unint64_t)v175;
    }
    else
    {
      v171 -= (unint64_t)fabs(v175);
    }
  }
  else
  {
    v171 = 0;
  }
  v839 = v171;
  if ((v5 & 0x800000000000) != 0)
  {
    appPopularityOfTimeAndDayOfWeekGivenApp = self->_appPopularityOfTimeAndDayOfWeekGivenApp;
    v178 = -appPopularityOfTimeAndDayOfWeekGivenApp;
    if (appPopularityOfTimeAndDayOfWeekGivenApp >= 0.0)
      v178 = self->_appPopularityOfTimeAndDayOfWeekGivenApp;
    v179 = floor(v178 + 0.5);
    v180 = (v178 - v179) * 1.84467441e19;
    v176 = 2654435761u * (unint64_t)fmod(v179, 1.84467441e19);
    if (v180 >= 0.0)
    {
      if (v180 > 0.0)
        v176 += (unint64_t)v180;
    }
    else
    {
      v176 -= (unint64_t)fabs(v180);
    }
  }
  else
  {
    v176 = 0;
  }
  v838 = v176;
  if ((v5 & 0x4000000000000) != 0)
  {
    appTotalNumberOfTimeAndDayOfWeekLaunches = self->_appTotalNumberOfTimeAndDayOfWeekLaunches;
    v183 = -appTotalNumberOfTimeAndDayOfWeekLaunches;
    if (appTotalNumberOfTimeAndDayOfWeekLaunches >= 0.0)
      v183 = self->_appTotalNumberOfTimeAndDayOfWeekLaunches;
    v184 = floor(v183 + 0.5);
    v185 = (v183 - v184) * 1.84467441e19;
    v181 = 2654435761u * (unint64_t)fmod(v184, 1.84467441e19);
    if (v185 >= 0.0)
    {
      if (v185 > 0.0)
        v181 += (unint64_t)v185;
    }
    else
    {
      v181 -= (unint64_t)fabs(v185);
    }
  }
  else
  {
    v181 = 0;
  }
  v837 = v181;
  if ((has & 0x4000000000000000) != 0)
  {
    appLaunchesCoarseTimePowLocationForAppInContext = self->_appLaunchesCoarseTimePowLocationForAppInContext;
    v188 = -appLaunchesCoarseTimePowLocationForAppInContext;
    if (appLaunchesCoarseTimePowLocationForAppInContext >= 0.0)
      v188 = self->_appLaunchesCoarseTimePowLocationForAppInContext;
    v189 = floor(v188 + 0.5);
    v190 = (v188 - v189) * 1.84467441e19;
    v186 = 2654435761u * (unint64_t)fmod(v189, 1.84467441e19);
    if (v190 >= 0.0)
    {
      if (v190 > 0.0)
        v186 += (unint64_t)v190;
    }
    else
    {
      v186 -= (unint64_t)fabs(v190);
    }
  }
  else
  {
    v186 = 0;
  }
  v836 = v186;
  if (has < 0)
  {
    appLaunchesCoarseTimePowLocationInContext = self->_appLaunchesCoarseTimePowLocationInContext;
    v193 = -appLaunchesCoarseTimePowLocationInContext;
    if (appLaunchesCoarseTimePowLocationInContext >= 0.0)
      v193 = self->_appLaunchesCoarseTimePowLocationInContext;
    v194 = floor(v193 + 0.5);
    v195 = (v193 - v194) * 1.84467441e19;
    v191 = 2654435761u * (unint64_t)fmod(v194, 1.84467441e19);
    if (v195 >= 0.0)
    {
      if (v195 > 0.0)
        v191 += (unint64_t)v195;
    }
    else
    {
      v191 -= (unint64_t)fabs(v195);
    }
  }
  else
  {
    v191 = 0;
  }
  v835 = v191;
  if ((has & 0x2000000000000000) != 0)
  {
    appLaunchesCoarseTimePowLocationForApp = self->_appLaunchesCoarseTimePowLocationForApp;
    v198 = -appLaunchesCoarseTimePowLocationForApp;
    if (appLaunchesCoarseTimePowLocationForApp >= 0.0)
      v198 = self->_appLaunchesCoarseTimePowLocationForApp;
    v199 = floor(v198 + 0.5);
    v200 = (v198 - v199) * 1.84467441e19;
    v196 = 2654435761u * (unint64_t)fmod(v199, 1.84467441e19);
    if (v200 >= 0.0)
    {
      if (v200 > 0.0)
        v196 += (unint64_t)v200;
    }
    else
    {
      v196 -= (unint64_t)fabs(v200);
    }
  }
  else
  {
    v196 = 0;
  }
  v834 = v196;
  if ((has & 0x1000000000000000) != 0)
  {
    appLaunchesCoarseTimePowLocationForAllAppsAndContexts = self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
    v203 = -appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
    if (appLaunchesCoarseTimePowLocationForAllAppsAndContexts >= 0.0)
      v203 = self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
    v204 = floor(v203 + 0.5);
    v205 = (v203 - v204) * 1.84467441e19;
    v201 = 2654435761u * (unint64_t)fmod(v204, 1.84467441e19);
    if (v205 >= 0.0)
    {
      if (v205 > 0.0)
        v201 += (unint64_t)v205;
    }
    else
    {
      v201 -= (unint64_t)fabs(v205);
    }
  }
  else
  {
    v201 = 0;
  }
  v833 = v201;
  if ((v5 & 0x20000000000) != 0)
  {
    appLaunchesSpecificTimeDowLocationForAppInContext = self->_appLaunchesSpecificTimeDowLocationForAppInContext;
    v208 = -appLaunchesSpecificTimeDowLocationForAppInContext;
    if (appLaunchesSpecificTimeDowLocationForAppInContext >= 0.0)
      v208 = self->_appLaunchesSpecificTimeDowLocationForAppInContext;
    v209 = floor(v208 + 0.5);
    v210 = (v208 - v209) * 1.84467441e19;
    v206 = 2654435761u * (unint64_t)fmod(v209, 1.84467441e19);
    if (v210 >= 0.0)
    {
      if (v210 > 0.0)
        v206 += (unint64_t)v210;
    }
    else
    {
      v206 -= (unint64_t)fabs(v210);
    }
  }
  else
  {
    v206 = 0;
  }
  v832 = v206;
  if ((v5 & 0x40000000000) != 0)
  {
    appLaunchesSpecificTimeDowLocationInContext = self->_appLaunchesSpecificTimeDowLocationInContext;
    v213 = -appLaunchesSpecificTimeDowLocationInContext;
    if (appLaunchesSpecificTimeDowLocationInContext >= 0.0)
      v213 = self->_appLaunchesSpecificTimeDowLocationInContext;
    v214 = floor(v213 + 0.5);
    v215 = (v213 - v214) * 1.84467441e19;
    v211 = 2654435761u * (unint64_t)fmod(v214, 1.84467441e19);
    if (v215 >= 0.0)
    {
      if (v215 > 0.0)
        v211 += (unint64_t)v215;
    }
    else
    {
      v211 -= (unint64_t)fabs(v215);
    }
  }
  else
  {
    v211 = 0;
  }
  v831 = v211;
  if ((v5 & 0x10000000000) != 0)
  {
    appLaunchesSpecificTimeDowLocationForApp = self->_appLaunchesSpecificTimeDowLocationForApp;
    v218 = -appLaunchesSpecificTimeDowLocationForApp;
    if (appLaunchesSpecificTimeDowLocationForApp >= 0.0)
      v218 = self->_appLaunchesSpecificTimeDowLocationForApp;
    v219 = floor(v218 + 0.5);
    v220 = (v218 - v219) * 1.84467441e19;
    v216 = 2654435761u * (unint64_t)fmod(v219, 1.84467441e19);
    if (v220 >= 0.0)
    {
      if (v220 > 0.0)
        v216 += (unint64_t)v220;
    }
    else
    {
      v216 -= (unint64_t)fabs(v220);
    }
  }
  else
  {
    v216 = 0;
  }
  v830 = v216;
  if ((v5 & 0x8000000000) != 0)
  {
    appLaunchesSpecificTimeDowLocationForAllAppsAndContexts = self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
    v223 = -appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
    if (appLaunchesSpecificTimeDowLocationForAllAppsAndContexts >= 0.0)
      v223 = self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
    v224 = floor(v223 + 0.5);
    v225 = (v223 - v224) * 1.84467441e19;
    v221 = 2654435761u * (unint64_t)fmod(v224, 1.84467441e19);
    if (v225 >= 0.0)
    {
      if (v225 > 0.0)
        v221 += (unint64_t)v225;
    }
    else
    {
      v221 -= (unint64_t)fabs(v225);
    }
  }
  else
  {
    v221 = 0;
  }
  v829 = v221;
  if ((v5 & 0x10) != 0)
  {
    appLaunchesInTimeBucket0ForApp = self->_appLaunchesInTimeBucket0ForApp;
    v228 = -appLaunchesInTimeBucket0ForApp;
    if (appLaunchesInTimeBucket0ForApp >= 0.0)
      v228 = self->_appLaunchesInTimeBucket0ForApp;
    v229 = floor(v228 + 0.5);
    v230 = (v228 - v229) * 1.84467441e19;
    v226 = 2654435761u * (unint64_t)fmod(v229, 1.84467441e19);
    if (v230 >= 0.0)
    {
      if (v230 > 0.0)
        v226 += (unint64_t)v230;
    }
    else
    {
      v226 -= (unint64_t)fabs(v230);
    }
  }
  else
  {
    v226 = 0;
  }
  v828 = v226;
  if ((v5 & 0x8000) != 0)
  {
    appLaunchesInTimeBucket1ForApp = self->_appLaunchesInTimeBucket1ForApp;
    v233 = -appLaunchesInTimeBucket1ForApp;
    if (appLaunchesInTimeBucket1ForApp >= 0.0)
      v233 = self->_appLaunchesInTimeBucket1ForApp;
    v234 = floor(v233 + 0.5);
    v235 = (v233 - v234) * 1.84467441e19;
    v231 = 2654435761u * (unint64_t)fmod(v234, 1.84467441e19);
    if (v235 >= 0.0)
    {
      if (v235 > 0.0)
        v231 += (unint64_t)v235;
    }
    else
    {
      v231 -= (unint64_t)fabs(v235);
    }
  }
  else
  {
    v231 = 0;
  }
  v827 = v231;
  if ((v5 & 0x200000) != 0)
  {
    appLaunchesInTimeBucket2ForApp = self->_appLaunchesInTimeBucket2ForApp;
    v238 = -appLaunchesInTimeBucket2ForApp;
    if (appLaunchesInTimeBucket2ForApp >= 0.0)
      v238 = self->_appLaunchesInTimeBucket2ForApp;
    v239 = floor(v238 + 0.5);
    v240 = (v238 - v239) * 1.84467441e19;
    v236 = 2654435761u * (unint64_t)fmod(v239, 1.84467441e19);
    if (v240 >= 0.0)
    {
      if (v240 > 0.0)
        v236 += (unint64_t)v240;
    }
    else
    {
      v236 -= (unint64_t)fabs(v240);
    }
  }
  else
  {
    v236 = 0;
  }
  v826 = v236;
  if ((v5 & 0x400000) != 0)
  {
    appLaunchesInTimeBucket3ForApp = self->_appLaunchesInTimeBucket3ForApp;
    v243 = -appLaunchesInTimeBucket3ForApp;
    if (appLaunchesInTimeBucket3ForApp >= 0.0)
      v243 = self->_appLaunchesInTimeBucket3ForApp;
    v244 = floor(v243 + 0.5);
    v245 = (v243 - v244) * 1.84467441e19;
    v241 = 2654435761u * (unint64_t)fmod(v244, 1.84467441e19);
    if (v245 >= 0.0)
    {
      if (v245 > 0.0)
        v241 += (unint64_t)v245;
    }
    else
    {
      v241 -= (unint64_t)fabs(v245);
    }
  }
  else
  {
    v241 = 0;
  }
  v825 = v241;
  if ((v5 & 0x800000) != 0)
  {
    appLaunchesInTimeBucket4ForApp = self->_appLaunchesInTimeBucket4ForApp;
    v248 = -appLaunchesInTimeBucket4ForApp;
    if (appLaunchesInTimeBucket4ForApp >= 0.0)
      v248 = self->_appLaunchesInTimeBucket4ForApp;
    v249 = floor(v248 + 0.5);
    v250 = (v248 - v249) * 1.84467441e19;
    v246 = 2654435761u * (unint64_t)fmod(v249, 1.84467441e19);
    if (v250 >= 0.0)
    {
      if (v250 > 0.0)
        v246 += (unint64_t)v250;
    }
    else
    {
      v246 -= (unint64_t)fabs(v250);
    }
  }
  else
  {
    v246 = 0;
  }
  v824 = v246;
  if ((v5 & 0x1000000) != 0)
  {
    appLaunchesInTimeBucket5ForApp = self->_appLaunchesInTimeBucket5ForApp;
    v253 = -appLaunchesInTimeBucket5ForApp;
    if (appLaunchesInTimeBucket5ForApp >= 0.0)
      v253 = self->_appLaunchesInTimeBucket5ForApp;
    v254 = floor(v253 + 0.5);
    v255 = (v253 - v254) * 1.84467441e19;
    v251 = 2654435761u * (unint64_t)fmod(v254, 1.84467441e19);
    if (v255 >= 0.0)
    {
      if (v255 > 0.0)
        v251 += (unint64_t)v255;
    }
    else
    {
      v251 -= (unint64_t)fabs(v255);
    }
  }
  else
  {
    v251 = 0;
  }
  v823 = v251;
  if ((v5 & 0x2000000) != 0)
  {
    appLaunchesInTimeBucket6ForApp = self->_appLaunchesInTimeBucket6ForApp;
    v258 = -appLaunchesInTimeBucket6ForApp;
    if (appLaunchesInTimeBucket6ForApp >= 0.0)
      v258 = self->_appLaunchesInTimeBucket6ForApp;
    v259 = floor(v258 + 0.5);
    v260 = (v258 - v259) * 1.84467441e19;
    v256 = 2654435761u * (unint64_t)fmod(v259, 1.84467441e19);
    if (v260 >= 0.0)
    {
      if (v260 > 0.0)
        v256 += (unint64_t)v260;
    }
    else
    {
      v256 -= (unint64_t)fabs(v260);
    }
  }
  else
  {
    v256 = 0;
  }
  v822 = v256;
  if ((v5 & 0x4000000) != 0)
  {
    appLaunchesInTimeBucket7ForApp = self->_appLaunchesInTimeBucket7ForApp;
    v263 = -appLaunchesInTimeBucket7ForApp;
    if (appLaunchesInTimeBucket7ForApp >= 0.0)
      v263 = self->_appLaunchesInTimeBucket7ForApp;
    v264 = floor(v263 + 0.5);
    v265 = (v263 - v264) * 1.84467441e19;
    v261 = 2654435761u * (unint64_t)fmod(v264, 1.84467441e19);
    if (v265 >= 0.0)
    {
      if (v265 > 0.0)
        v261 += (unint64_t)v265;
    }
    else
    {
      v261 -= (unint64_t)fabs(v265);
    }
  }
  else
  {
    v261 = 0;
  }
  v821 = v261;
  if ((v5 & 0x8000000) != 0)
  {
    appLaunchesInTimeBucket8ForApp = self->_appLaunchesInTimeBucket8ForApp;
    v268 = -appLaunchesInTimeBucket8ForApp;
    if (appLaunchesInTimeBucket8ForApp >= 0.0)
      v268 = self->_appLaunchesInTimeBucket8ForApp;
    v269 = floor(v268 + 0.5);
    v270 = (v268 - v269) * 1.84467441e19;
    v266 = 2654435761u * (unint64_t)fmod(v269, 1.84467441e19);
    if (v270 >= 0.0)
    {
      if (v270 > 0.0)
        v266 += (unint64_t)v270;
    }
    else
    {
      v266 -= (unint64_t)fabs(v270);
    }
  }
  else
  {
    v266 = 0;
  }
  v820 = v266;
  if ((v5 & 0x10000000) != 0)
  {
    appLaunchesInTimeBucket9ForApp = self->_appLaunchesInTimeBucket9ForApp;
    v273 = -appLaunchesInTimeBucket9ForApp;
    if (appLaunchesInTimeBucket9ForApp >= 0.0)
      v273 = self->_appLaunchesInTimeBucket9ForApp;
    v274 = floor(v273 + 0.5);
    v275 = (v273 - v274) * 1.84467441e19;
    v271 = 2654435761u * (unint64_t)fmod(v274, 1.84467441e19);
    if (v275 >= 0.0)
    {
      if (v275 > 0.0)
        v271 += (unint64_t)v275;
    }
    else
    {
      v271 -= (unint64_t)fabs(v275);
    }
  }
  else
  {
    v271 = 0;
  }
  v819 = v271;
  if ((v5 & 0x20) != 0)
  {
    appLaunchesInTimeBucket10ForApp = self->_appLaunchesInTimeBucket10ForApp;
    v278 = -appLaunchesInTimeBucket10ForApp;
    if (appLaunchesInTimeBucket10ForApp >= 0.0)
      v278 = self->_appLaunchesInTimeBucket10ForApp;
    v279 = floor(v278 + 0.5);
    v280 = (v278 - v279) * 1.84467441e19;
    v276 = 2654435761u * (unint64_t)fmod(v279, 1.84467441e19);
    if (v280 >= 0.0)
    {
      if (v280 > 0.0)
        v276 += (unint64_t)v280;
    }
    else
    {
      v276 -= (unint64_t)fabs(v280);
    }
  }
  else
  {
    v276 = 0;
  }
  v818 = v276;
  if ((v5 & 0x40) != 0)
  {
    appLaunchesInTimeBucket11ForApp = self->_appLaunchesInTimeBucket11ForApp;
    v283 = -appLaunchesInTimeBucket11ForApp;
    if (appLaunchesInTimeBucket11ForApp >= 0.0)
      v283 = self->_appLaunchesInTimeBucket11ForApp;
    v284 = floor(v283 + 0.5);
    v285 = (v283 - v284) * 1.84467441e19;
    v281 = 2654435761u * (unint64_t)fmod(v284, 1.84467441e19);
    if (v285 >= 0.0)
    {
      if (v285 > 0.0)
        v281 += (unint64_t)v285;
    }
    else
    {
      v281 -= (unint64_t)fabs(v285);
    }
  }
  else
  {
    v281 = 0;
  }
  v817 = v281;
  if ((v5 & 0x80) != 0)
  {
    appLaunchesInTimeBucket12ForApp = self->_appLaunchesInTimeBucket12ForApp;
    v288 = -appLaunchesInTimeBucket12ForApp;
    if (appLaunchesInTimeBucket12ForApp >= 0.0)
      v288 = self->_appLaunchesInTimeBucket12ForApp;
    v289 = floor(v288 + 0.5);
    v290 = (v288 - v289) * 1.84467441e19;
    v286 = 2654435761u * (unint64_t)fmod(v289, 1.84467441e19);
    if (v290 >= 0.0)
    {
      if (v290 > 0.0)
        v286 += (unint64_t)v290;
    }
    else
    {
      v286 -= (unint64_t)fabs(v290);
    }
  }
  else
  {
    v286 = 0;
  }
  v816 = v286;
  if ((v5 & 0x100) != 0)
  {
    appLaunchesInTimeBucket13ForApp = self->_appLaunchesInTimeBucket13ForApp;
    v293 = -appLaunchesInTimeBucket13ForApp;
    if (appLaunchesInTimeBucket13ForApp >= 0.0)
      v293 = self->_appLaunchesInTimeBucket13ForApp;
    v294 = floor(v293 + 0.5);
    v295 = (v293 - v294) * 1.84467441e19;
    v291 = 2654435761u * (unint64_t)fmod(v294, 1.84467441e19);
    if (v295 >= 0.0)
    {
      if (v295 > 0.0)
        v291 += (unint64_t)v295;
    }
    else
    {
      v291 -= (unint64_t)fabs(v295);
    }
  }
  else
  {
    v291 = 0;
  }
  v815 = v291;
  if ((v5 & 0x200) != 0)
  {
    appLaunchesInTimeBucket14ForApp = self->_appLaunchesInTimeBucket14ForApp;
    v298 = -appLaunchesInTimeBucket14ForApp;
    if (appLaunchesInTimeBucket14ForApp >= 0.0)
      v298 = self->_appLaunchesInTimeBucket14ForApp;
    v299 = floor(v298 + 0.5);
    v300 = (v298 - v299) * 1.84467441e19;
    v296 = 2654435761u * (unint64_t)fmod(v299, 1.84467441e19);
    if (v300 >= 0.0)
    {
      if (v300 > 0.0)
        v296 += (unint64_t)v300;
    }
    else
    {
      v296 -= (unint64_t)fabs(v300);
    }
  }
  else
  {
    v296 = 0;
  }
  v814 = v296;
  if ((v5 & 0x400) != 0)
  {
    appLaunchesInTimeBucket15ForApp = self->_appLaunchesInTimeBucket15ForApp;
    v303 = -appLaunchesInTimeBucket15ForApp;
    if (appLaunchesInTimeBucket15ForApp >= 0.0)
      v303 = self->_appLaunchesInTimeBucket15ForApp;
    v304 = floor(v303 + 0.5);
    v305 = (v303 - v304) * 1.84467441e19;
    v301 = 2654435761u * (unint64_t)fmod(v304, 1.84467441e19);
    if (v305 >= 0.0)
    {
      if (v305 > 0.0)
        v301 += (unint64_t)v305;
    }
    else
    {
      v301 -= (unint64_t)fabs(v305);
    }
  }
  else
  {
    v301 = 0;
  }
  v813 = v301;
  if ((v5 & 0x800) != 0)
  {
    appLaunchesInTimeBucket16ForApp = self->_appLaunchesInTimeBucket16ForApp;
    v308 = -appLaunchesInTimeBucket16ForApp;
    if (appLaunchesInTimeBucket16ForApp >= 0.0)
      v308 = self->_appLaunchesInTimeBucket16ForApp;
    v309 = floor(v308 + 0.5);
    v310 = (v308 - v309) * 1.84467441e19;
    v306 = 2654435761u * (unint64_t)fmod(v309, 1.84467441e19);
    if (v310 >= 0.0)
    {
      if (v310 > 0.0)
        v306 += (unint64_t)v310;
    }
    else
    {
      v306 -= (unint64_t)fabs(v310);
    }
  }
  else
  {
    v306 = 0;
  }
  v812 = v306;
  if ((v5 & 0x1000) != 0)
  {
    appLaunchesInTimeBucket17ForApp = self->_appLaunchesInTimeBucket17ForApp;
    v313 = -appLaunchesInTimeBucket17ForApp;
    if (appLaunchesInTimeBucket17ForApp >= 0.0)
      v313 = self->_appLaunchesInTimeBucket17ForApp;
    v314 = floor(v313 + 0.5);
    v315 = (v313 - v314) * 1.84467441e19;
    v311 = 2654435761u * (unint64_t)fmod(v314, 1.84467441e19);
    if (v315 >= 0.0)
    {
      if (v315 > 0.0)
        v311 += (unint64_t)v315;
    }
    else
    {
      v311 -= (unint64_t)fabs(v315);
    }
  }
  else
  {
    v311 = 0;
  }
  v811 = v311;
  if ((v5 & 0x2000) != 0)
  {
    appLaunchesInTimeBucket18ForApp = self->_appLaunchesInTimeBucket18ForApp;
    v318 = -appLaunchesInTimeBucket18ForApp;
    if (appLaunchesInTimeBucket18ForApp >= 0.0)
      v318 = self->_appLaunchesInTimeBucket18ForApp;
    v319 = floor(v318 + 0.5);
    v320 = (v318 - v319) * 1.84467441e19;
    v316 = 2654435761u * (unint64_t)fmod(v319, 1.84467441e19);
    if (v320 >= 0.0)
    {
      if (v320 > 0.0)
        v316 += (unint64_t)v320;
    }
    else
    {
      v316 -= (unint64_t)fabs(v320);
    }
  }
  else
  {
    v316 = 0;
  }
  v810 = v316;
  if ((v5 & 0x4000) != 0)
  {
    appLaunchesInTimeBucket19ForApp = self->_appLaunchesInTimeBucket19ForApp;
    v323 = -appLaunchesInTimeBucket19ForApp;
    if (appLaunchesInTimeBucket19ForApp >= 0.0)
      v323 = self->_appLaunchesInTimeBucket19ForApp;
    v324 = floor(v323 + 0.5);
    v325 = (v323 - v324) * 1.84467441e19;
    v321 = 2654435761u * (unint64_t)fmod(v324, 1.84467441e19);
    if (v325 >= 0.0)
    {
      if (v325 > 0.0)
        v321 += (unint64_t)v325;
    }
    else
    {
      v321 -= (unint64_t)fabs(v325);
    }
  }
  else
  {
    v321 = 0;
  }
  v809 = v321;
  if ((v5 & 0x10000) != 0)
  {
    appLaunchesInTimeBucket20ForApp = self->_appLaunchesInTimeBucket20ForApp;
    v328 = -appLaunchesInTimeBucket20ForApp;
    if (appLaunchesInTimeBucket20ForApp >= 0.0)
      v328 = self->_appLaunchesInTimeBucket20ForApp;
    v329 = floor(v328 + 0.5);
    v330 = (v328 - v329) * 1.84467441e19;
    v326 = 2654435761u * (unint64_t)fmod(v329, 1.84467441e19);
    if (v330 >= 0.0)
    {
      if (v330 > 0.0)
        v326 += (unint64_t)v330;
    }
    else
    {
      v326 -= (unint64_t)fabs(v330);
    }
  }
  else
  {
    v326 = 0;
  }
  v808 = v326;
  if ((v5 & 0x20000) != 0)
  {
    appLaunchesInTimeBucket21ForApp = self->_appLaunchesInTimeBucket21ForApp;
    v333 = -appLaunchesInTimeBucket21ForApp;
    if (appLaunchesInTimeBucket21ForApp >= 0.0)
      v333 = self->_appLaunchesInTimeBucket21ForApp;
    v334 = floor(v333 + 0.5);
    v335 = (v333 - v334) * 1.84467441e19;
    v331 = 2654435761u * (unint64_t)fmod(v334, 1.84467441e19);
    if (v335 >= 0.0)
    {
      if (v335 > 0.0)
        v331 += (unint64_t)v335;
    }
    else
    {
      v331 -= (unint64_t)fabs(v335);
    }
  }
  else
  {
    v331 = 0;
  }
  v807 = v331;
  if ((v5 & 0x40000) != 0)
  {
    appLaunchesInTimeBucket22ForApp = self->_appLaunchesInTimeBucket22ForApp;
    v338 = -appLaunchesInTimeBucket22ForApp;
    if (appLaunchesInTimeBucket22ForApp >= 0.0)
      v338 = self->_appLaunchesInTimeBucket22ForApp;
    v339 = floor(v338 + 0.5);
    v340 = (v338 - v339) * 1.84467441e19;
    v336 = 2654435761u * (unint64_t)fmod(v339, 1.84467441e19);
    if (v340 >= 0.0)
    {
      if (v340 > 0.0)
        v336 += (unint64_t)v340;
    }
    else
    {
      v336 -= (unint64_t)fabs(v340);
    }
  }
  else
  {
    v336 = 0;
  }
  v806 = v336;
  if ((v5 & 0x80000) != 0)
  {
    appLaunchesInTimeBucket23ForApp = self->_appLaunchesInTimeBucket23ForApp;
    v343 = -appLaunchesInTimeBucket23ForApp;
    if (appLaunchesInTimeBucket23ForApp >= 0.0)
      v343 = self->_appLaunchesInTimeBucket23ForApp;
    v344 = floor(v343 + 0.5);
    v345 = (v343 - v344) * 1.84467441e19;
    v341 = 2654435761u * (unint64_t)fmod(v344, 1.84467441e19);
    if (v345 >= 0.0)
    {
      if (v345 > 0.0)
        v341 += (unint64_t)v345;
    }
    else
    {
      v341 -= (unint64_t)fabs(v345);
    }
  }
  else
  {
    v341 = 0;
  }
  v805 = v341;
  if ((v5 & 0x100000) != 0)
  {
    appLaunchesInTimeBucket24ForApp = self->_appLaunchesInTimeBucket24ForApp;
    v348 = -appLaunchesInTimeBucket24ForApp;
    if (appLaunchesInTimeBucket24ForApp >= 0.0)
      v348 = self->_appLaunchesInTimeBucket24ForApp;
    v349 = floor(v348 + 0.5);
    v350 = (v348 - v349) * 1.84467441e19;
    v346 = 2654435761u * (unint64_t)fmod(v349, 1.84467441e19);
    if (v350 >= 0.0)
    {
      if (v350 > 0.0)
        v346 += (unint64_t)v350;
    }
    else
    {
      v346 -= (unint64_t)fabs(v350);
    }
  }
  else
  {
    v346 = 0;
  }
  v804 = v346;
  if ((v5 & 0x800000000) != 0)
  {
    appLaunchesOnDayOfWeekSundayForApp = self->_appLaunchesOnDayOfWeekSundayForApp;
    v353 = -appLaunchesOnDayOfWeekSundayForApp;
    if (appLaunchesOnDayOfWeekSundayForApp >= 0.0)
      v353 = self->_appLaunchesOnDayOfWeekSundayForApp;
    v354 = floor(v353 + 0.5);
    v355 = (v353 - v354) * 1.84467441e19;
    v351 = 2654435761u * (unint64_t)fmod(v354, 1.84467441e19);
    if (v355 >= 0.0)
    {
      if (v355 > 0.0)
        v351 += (unint64_t)v355;
    }
    else
    {
      v351 -= (unint64_t)fabs(v355);
    }
  }
  else
  {
    v351 = 0;
  }
  v803 = v351;
  if ((v5 & 0x200000000) != 0)
  {
    appLaunchesOnDayOfWeekMondayForApp = self->_appLaunchesOnDayOfWeekMondayForApp;
    v358 = -appLaunchesOnDayOfWeekMondayForApp;
    if (appLaunchesOnDayOfWeekMondayForApp >= 0.0)
      v358 = self->_appLaunchesOnDayOfWeekMondayForApp;
    v359 = floor(v358 + 0.5);
    v360 = (v358 - v359) * 1.84467441e19;
    v356 = 2654435761u * (unint64_t)fmod(v359, 1.84467441e19);
    if (v360 >= 0.0)
    {
      if (v360 > 0.0)
        v356 += (unint64_t)v360;
    }
    else
    {
      v356 -= (unint64_t)fabs(v360);
    }
  }
  else
  {
    v356 = 0;
  }
  v802 = v356;
  if ((v5 & 0x2000000000) != 0)
  {
    appLaunchesOnDayOfWeekTuesdayForApp = self->_appLaunchesOnDayOfWeekTuesdayForApp;
    v363 = -appLaunchesOnDayOfWeekTuesdayForApp;
    if (appLaunchesOnDayOfWeekTuesdayForApp >= 0.0)
      v363 = self->_appLaunchesOnDayOfWeekTuesdayForApp;
    v364 = floor(v363 + 0.5);
    v365 = (v363 - v364) * 1.84467441e19;
    v361 = 2654435761u * (unint64_t)fmod(v364, 1.84467441e19);
    if (v365 >= 0.0)
    {
      if (v365 > 0.0)
        v361 += (unint64_t)v365;
    }
    else
    {
      v361 -= (unint64_t)fabs(v365);
    }
  }
  else
  {
    v361 = 0;
  }
  v801 = v361;
  if ((v5 & 0x4000000000) != 0)
  {
    appLaunchesOnDayOfWeekWednesdayForApp = self->_appLaunchesOnDayOfWeekWednesdayForApp;
    v368 = -appLaunchesOnDayOfWeekWednesdayForApp;
    if (appLaunchesOnDayOfWeekWednesdayForApp >= 0.0)
      v368 = self->_appLaunchesOnDayOfWeekWednesdayForApp;
    v369 = floor(v368 + 0.5);
    v370 = (v368 - v369) * 1.84467441e19;
    v366 = 2654435761u * (unint64_t)fmod(v369, 1.84467441e19);
    if (v370 >= 0.0)
    {
      if (v370 > 0.0)
        v366 += (unint64_t)v370;
    }
    else
    {
      v366 -= (unint64_t)fabs(v370);
    }
  }
  else
  {
    v366 = 0;
  }
  v800 = v366;
  if ((v5 & 0x1000000000) != 0)
  {
    appLaunchesOnDayOfWeekThursdayForApp = self->_appLaunchesOnDayOfWeekThursdayForApp;
    v373 = -appLaunchesOnDayOfWeekThursdayForApp;
    if (appLaunchesOnDayOfWeekThursdayForApp >= 0.0)
      v373 = self->_appLaunchesOnDayOfWeekThursdayForApp;
    v374 = floor(v373 + 0.5);
    v375 = (v373 - v374) * 1.84467441e19;
    v371 = 2654435761u * (unint64_t)fmod(v374, 1.84467441e19);
    if (v375 >= 0.0)
    {
      if (v375 > 0.0)
        v371 += (unint64_t)v375;
    }
    else
    {
      v371 -= (unint64_t)fabs(v375);
    }
  }
  else
  {
    v371 = 0;
  }
  v799 = v371;
  if ((v5 & 0x100000000) != 0)
  {
    appLaunchesOnDayOfWeekFridayForApp = self->_appLaunchesOnDayOfWeekFridayForApp;
    v378 = -appLaunchesOnDayOfWeekFridayForApp;
    if (appLaunchesOnDayOfWeekFridayForApp >= 0.0)
      v378 = self->_appLaunchesOnDayOfWeekFridayForApp;
    v379 = floor(v378 + 0.5);
    v380 = (v378 - v379) * 1.84467441e19;
    v376 = 2654435761u * (unint64_t)fmod(v379, 1.84467441e19);
    if (v380 >= 0.0)
    {
      if (v380 > 0.0)
        v376 += (unint64_t)v380;
    }
    else
    {
      v376 -= (unint64_t)fabs(v380);
    }
  }
  else
  {
    v376 = 0;
  }
  v798 = v376;
  if ((v5 & 0x400000000) != 0)
  {
    appLaunchesOnDayOfWeekSaturdayForApp = self->_appLaunchesOnDayOfWeekSaturdayForApp;
    v383 = -appLaunchesOnDayOfWeekSaturdayForApp;
    if (appLaunchesOnDayOfWeekSaturdayForApp >= 0.0)
      v383 = self->_appLaunchesOnDayOfWeekSaturdayForApp;
    v384 = floor(v383 + 0.5);
    v385 = (v383 - v384) * 1.84467441e19;
    v381 = 2654435761u * (unint64_t)fmod(v384, 1.84467441e19);
    if (v385 >= 0.0)
    {
      if (v385 > 0.0)
        v381 += (unint64_t)v385;
    }
    else
    {
      v381 -= (unint64_t)fabs(v385);
    }
  }
  else
  {
    v381 = 0;
  }
  v797 = v381;
  if ((has & 0x200) != 0)
  {
    appLaunchesAtCoarseGeoHash0ForApp = self->_appLaunchesAtCoarseGeoHash0ForApp;
    v388 = -appLaunchesAtCoarseGeoHash0ForApp;
    if (appLaunchesAtCoarseGeoHash0ForApp >= 0.0)
      v388 = self->_appLaunchesAtCoarseGeoHash0ForApp;
    v389 = floor(v388 + 0.5);
    v390 = (v388 - v389) * 1.84467441e19;
    v386 = 2654435761u * (unint64_t)fmod(v389, 1.84467441e19);
    if (v390 >= 0.0)
    {
      if (v390 > 0.0)
        v386 += (unint64_t)v390;
    }
    else
    {
      v386 -= (unint64_t)fabs(v390);
    }
  }
  else
  {
    v386 = 0;
  }
  v796 = v386;
  if ((has & 0x400) != 0)
  {
    appLaunchesAtCoarseGeoHash1ForApp = self->_appLaunchesAtCoarseGeoHash1ForApp;
    v393 = -appLaunchesAtCoarseGeoHash1ForApp;
    if (appLaunchesAtCoarseGeoHash1ForApp >= 0.0)
      v393 = self->_appLaunchesAtCoarseGeoHash1ForApp;
    v394 = floor(v393 + 0.5);
    v395 = (v393 - v394) * 1.84467441e19;
    v391 = 2654435761u * (unint64_t)fmod(v394, 1.84467441e19);
    if (v395 >= 0.0)
    {
      if (v395 > 0.0)
        v391 += (unint64_t)v395;
    }
    else
    {
      v391 -= (unint64_t)fabs(v395);
    }
  }
  else
  {
    v391 = 0;
  }
  v795 = v391;
  if ((has & 0x800) != 0)
  {
    appLaunchesAtCoarseGeoHash2ForApp = self->_appLaunchesAtCoarseGeoHash2ForApp;
    v398 = -appLaunchesAtCoarseGeoHash2ForApp;
    if (appLaunchesAtCoarseGeoHash2ForApp >= 0.0)
      v398 = self->_appLaunchesAtCoarseGeoHash2ForApp;
    v399 = floor(v398 + 0.5);
    v400 = (v398 - v399) * 1.84467441e19;
    v396 = 2654435761u * (unint64_t)fmod(v399, 1.84467441e19);
    if (v400 >= 0.0)
    {
      if (v400 > 0.0)
        v396 += (unint64_t)v400;
    }
    else
    {
      v396 -= (unint64_t)fabs(v400);
    }
  }
  else
  {
    v396 = 0;
  }
  v794 = v396;
  if ((has & 0x1000) != 0)
  {
    appLaunchesAtCoarseGeoHash3ForApp = self->_appLaunchesAtCoarseGeoHash3ForApp;
    v403 = -appLaunchesAtCoarseGeoHash3ForApp;
    if (appLaunchesAtCoarseGeoHash3ForApp >= 0.0)
      v403 = self->_appLaunchesAtCoarseGeoHash3ForApp;
    v404 = floor(v403 + 0.5);
    v405 = (v403 - v404) * 1.84467441e19;
    v401 = 2654435761u * (unint64_t)fmod(v404, 1.84467441e19);
    if (v405 >= 0.0)
    {
      if (v405 > 0.0)
        v401 += (unint64_t)v405;
    }
    else
    {
      v401 -= (unint64_t)fabs(v405);
    }
  }
  else
  {
    v401 = 0;
  }
  v793 = v401;
  if ((has & 0x2000) != 0)
  {
    appLaunchesAtCoarseGeoHash4ForApp = self->_appLaunchesAtCoarseGeoHash4ForApp;
    v408 = -appLaunchesAtCoarseGeoHash4ForApp;
    if (appLaunchesAtCoarseGeoHash4ForApp >= 0.0)
      v408 = self->_appLaunchesAtCoarseGeoHash4ForApp;
    v409 = floor(v408 + 0.5);
    v410 = (v408 - v409) * 1.84467441e19;
    v406 = 2654435761u * (unint64_t)fmod(v409, 1.84467441e19);
    if (v410 >= 0.0)
    {
      if (v410 > 0.0)
        v406 += (unint64_t)v410;
    }
    else
    {
      v406 -= (unint64_t)fabs(v410);
    }
  }
  else
  {
    v406 = 0;
  }
  v792 = v406;
  if ((has & 0x4000) != 0)
  {
    appLaunchesAtCoarseGeoHash5ForApp = self->_appLaunchesAtCoarseGeoHash5ForApp;
    v413 = -appLaunchesAtCoarseGeoHash5ForApp;
    if (appLaunchesAtCoarseGeoHash5ForApp >= 0.0)
      v413 = self->_appLaunchesAtCoarseGeoHash5ForApp;
    v414 = floor(v413 + 0.5);
    v415 = (v413 - v414) * 1.84467441e19;
    v411 = 2654435761u * (unint64_t)fmod(v414, 1.84467441e19);
    if (v415 >= 0.0)
    {
      if (v415 > 0.0)
        v411 += (unint64_t)v415;
    }
    else
    {
      v411 -= (unint64_t)fabs(v415);
    }
  }
  else
  {
    v411 = 0;
  }
  v791 = v411;
  if ((has & 0x8000) != 0)
  {
    appLaunchesAtCoarseGeoHash6ForApp = self->_appLaunchesAtCoarseGeoHash6ForApp;
    v418 = -appLaunchesAtCoarseGeoHash6ForApp;
    if (appLaunchesAtCoarseGeoHash6ForApp >= 0.0)
      v418 = self->_appLaunchesAtCoarseGeoHash6ForApp;
    v419 = floor(v418 + 0.5);
    v420 = (v418 - v419) * 1.84467441e19;
    v416 = 2654435761u * (unint64_t)fmod(v419, 1.84467441e19);
    if (v420 >= 0.0)
    {
      if (v420 > 0.0)
        v416 += (unint64_t)v420;
    }
    else
    {
      v416 -= (unint64_t)fabs(v420);
    }
  }
  else
  {
    v416 = 0;
  }
  v790 = v416;
  if ((has & 0x10000) != 0)
  {
    appLaunchesAtCoarseGeoHash7ForApp = self->_appLaunchesAtCoarseGeoHash7ForApp;
    v423 = -appLaunchesAtCoarseGeoHash7ForApp;
    if (appLaunchesAtCoarseGeoHash7ForApp >= 0.0)
      v423 = self->_appLaunchesAtCoarseGeoHash7ForApp;
    v424 = floor(v423 + 0.5);
    v425 = (v423 - v424) * 1.84467441e19;
    v421 = 2654435761u * (unint64_t)fmod(v424, 1.84467441e19);
    if (v425 >= 0.0)
    {
      if (v425 > 0.0)
        v421 += (unint64_t)v425;
    }
    else
    {
      v421 -= (unint64_t)fabs(v425);
    }
  }
  else
  {
    v421 = 0;
  }
  v789 = v421;
  if ((has & 0x20000) != 0)
  {
    appLaunchesAtCoarseGeoHash8ForApp = self->_appLaunchesAtCoarseGeoHash8ForApp;
    v428 = -appLaunchesAtCoarseGeoHash8ForApp;
    if (appLaunchesAtCoarseGeoHash8ForApp >= 0.0)
      v428 = self->_appLaunchesAtCoarseGeoHash8ForApp;
    v429 = floor(v428 + 0.5);
    v430 = (v428 - v429) * 1.84467441e19;
    v426 = 2654435761u * (unint64_t)fmod(v429, 1.84467441e19);
    if (v430 >= 0.0)
    {
      if (v430 > 0.0)
        v426 += (unint64_t)v430;
    }
    else
    {
      v426 -= (unint64_t)fabs(v430);
    }
  }
  else
  {
    v426 = 0;
  }
  v788 = v426;
  if ((has & 0x40000) != 0)
  {
    appLaunchesAtCoarseGeoHash9ForApp = self->_appLaunchesAtCoarseGeoHash9ForApp;
    v433 = -appLaunchesAtCoarseGeoHash9ForApp;
    if (appLaunchesAtCoarseGeoHash9ForApp >= 0.0)
      v433 = self->_appLaunchesAtCoarseGeoHash9ForApp;
    v434 = floor(v433 + 0.5);
    v435 = (v433 - v434) * 1.84467441e19;
    v431 = 2654435761u * (unint64_t)fmod(v434, 1.84467441e19);
    if (v435 >= 0.0)
    {
      if (v435 > 0.0)
        v431 += (unint64_t)v435;
    }
    else
    {
      v431 -= (unint64_t)fabs(v435);
    }
  }
  else
  {
    v431 = 0;
  }
  v787 = v431;
  if ((has & 0x4000000) != 0)
  {
    appLaunchesAtSpecificGeoHash0ForApp = self->_appLaunchesAtSpecificGeoHash0ForApp;
    v438 = -appLaunchesAtSpecificGeoHash0ForApp;
    if (appLaunchesAtSpecificGeoHash0ForApp >= 0.0)
      v438 = self->_appLaunchesAtSpecificGeoHash0ForApp;
    v439 = floor(v438 + 0.5);
    v440 = (v438 - v439) * 1.84467441e19;
    v436 = 2654435761u * (unint64_t)fmod(v439, 1.84467441e19);
    if (v440 >= 0.0)
    {
      if (v440 > 0.0)
        v436 += (unint64_t)v440;
    }
    else
    {
      v436 -= (unint64_t)fabs(v440);
    }
  }
  else
  {
    v436 = 0;
  }
  v786 = v436;
  if ((has & 0x100000000) != 0)
  {
    appLaunchesAtSpecificGeoHash1ForApp = self->_appLaunchesAtSpecificGeoHash1ForApp;
    v443 = -appLaunchesAtSpecificGeoHash1ForApp;
    if (appLaunchesAtSpecificGeoHash1ForApp >= 0.0)
      v443 = self->_appLaunchesAtSpecificGeoHash1ForApp;
    v444 = floor(v443 + 0.5);
    v445 = (v443 - v444) * 1.84467441e19;
    v441 = 2654435761u * (unint64_t)fmod(v444, 1.84467441e19);
    if (v445 >= 0.0)
    {
      if (v445 > 0.0)
        v441 += (unint64_t)v445;
    }
    else
    {
      v441 -= (unint64_t)fabs(v445);
    }
  }
  else
  {
    v441 = 0;
  }
  v785 = v441;
  if ((has & 0x200000000) != 0)
  {
    appLaunchesAtSpecificGeoHash2ForApp = self->_appLaunchesAtSpecificGeoHash2ForApp;
    v448 = -appLaunchesAtSpecificGeoHash2ForApp;
    if (appLaunchesAtSpecificGeoHash2ForApp >= 0.0)
      v448 = self->_appLaunchesAtSpecificGeoHash2ForApp;
    v449 = floor(v448 + 0.5);
    v450 = (v448 - v449) * 1.84467441e19;
    v446 = 2654435761u * (unint64_t)fmod(v449, 1.84467441e19);
    if (v450 >= 0.0)
    {
      if (v450 > 0.0)
        v446 += (unint64_t)v450;
    }
    else
    {
      v446 -= (unint64_t)fabs(v450);
    }
  }
  else
  {
    v446 = 0;
  }
  v784 = v446;
  if ((has & 0x400000000) != 0)
  {
    appLaunchesAtSpecificGeoHash3ForApp = self->_appLaunchesAtSpecificGeoHash3ForApp;
    v453 = -appLaunchesAtSpecificGeoHash3ForApp;
    if (appLaunchesAtSpecificGeoHash3ForApp >= 0.0)
      v453 = self->_appLaunchesAtSpecificGeoHash3ForApp;
    v454 = floor(v453 + 0.5);
    v455 = (v453 - v454) * 1.84467441e19;
    v451 = 2654435761u * (unint64_t)fmod(v454, 1.84467441e19);
    if (v455 >= 0.0)
    {
      if (v455 > 0.0)
        v451 += (unint64_t)v455;
    }
    else
    {
      v451 -= (unint64_t)fabs(v455);
    }
  }
  else
  {
    v451 = 0;
  }
  v783 = v451;
  if ((has & 0x800000000) != 0)
  {
    appLaunchesAtSpecificGeoHash4ForApp = self->_appLaunchesAtSpecificGeoHash4ForApp;
    v458 = -appLaunchesAtSpecificGeoHash4ForApp;
    if (appLaunchesAtSpecificGeoHash4ForApp >= 0.0)
      v458 = self->_appLaunchesAtSpecificGeoHash4ForApp;
    v459 = floor(v458 + 0.5);
    v460 = (v458 - v459) * 1.84467441e19;
    v456 = 2654435761u * (unint64_t)fmod(v459, 1.84467441e19);
    if (v460 >= 0.0)
    {
      if (v460 > 0.0)
        v456 += (unint64_t)v460;
    }
    else
    {
      v456 -= (unint64_t)fabs(v460);
    }
  }
  else
  {
    v456 = 0;
  }
  v782 = v456;
  if ((has & 0x1000000000) != 0)
  {
    appLaunchesAtSpecificGeoHash5ForApp = self->_appLaunchesAtSpecificGeoHash5ForApp;
    v463 = -appLaunchesAtSpecificGeoHash5ForApp;
    if (appLaunchesAtSpecificGeoHash5ForApp >= 0.0)
      v463 = self->_appLaunchesAtSpecificGeoHash5ForApp;
    v464 = floor(v463 + 0.5);
    v465 = (v463 - v464) * 1.84467441e19;
    v461 = 2654435761u * (unint64_t)fmod(v464, 1.84467441e19);
    if (v465 >= 0.0)
    {
      if (v465 > 0.0)
        v461 += (unint64_t)v465;
    }
    else
    {
      v461 -= (unint64_t)fabs(v465);
    }
  }
  else
  {
    v461 = 0;
  }
  v781 = v461;
  if ((has & 0x2000000000) != 0)
  {
    appLaunchesAtSpecificGeoHash6ForApp = self->_appLaunchesAtSpecificGeoHash6ForApp;
    v468 = -appLaunchesAtSpecificGeoHash6ForApp;
    if (appLaunchesAtSpecificGeoHash6ForApp >= 0.0)
      v468 = self->_appLaunchesAtSpecificGeoHash6ForApp;
    v469 = floor(v468 + 0.5);
    v470 = (v468 - v469) * 1.84467441e19;
    v466 = 2654435761u * (unint64_t)fmod(v469, 1.84467441e19);
    if (v470 >= 0.0)
    {
      if (v470 > 0.0)
        v466 += (unint64_t)v470;
    }
    else
    {
      v466 -= (unint64_t)fabs(v470);
    }
  }
  else
  {
    v466 = 0;
  }
  v780 = v466;
  if ((has & 0x4000000000) != 0)
  {
    appLaunchesAtSpecificGeoHash7ForApp = self->_appLaunchesAtSpecificGeoHash7ForApp;
    v473 = -appLaunchesAtSpecificGeoHash7ForApp;
    if (appLaunchesAtSpecificGeoHash7ForApp >= 0.0)
      v473 = self->_appLaunchesAtSpecificGeoHash7ForApp;
    v474 = floor(v473 + 0.5);
    v475 = (v473 - v474) * 1.84467441e19;
    v471 = 2654435761u * (unint64_t)fmod(v474, 1.84467441e19);
    if (v475 >= 0.0)
    {
      if (v475 > 0.0)
        v471 += (unint64_t)v475;
    }
    else
    {
      v471 -= (unint64_t)fabs(v475);
    }
  }
  else
  {
    v471 = 0;
  }
  v779 = v471;
  if ((has & 0x8000000000) != 0)
  {
    appLaunchesAtSpecificGeoHash8ForApp = self->_appLaunchesAtSpecificGeoHash8ForApp;
    v478 = -appLaunchesAtSpecificGeoHash8ForApp;
    if (appLaunchesAtSpecificGeoHash8ForApp >= 0.0)
      v478 = self->_appLaunchesAtSpecificGeoHash8ForApp;
    v479 = floor(v478 + 0.5);
    v480 = (v478 - v479) * 1.84467441e19;
    v476 = 2654435761u * (unint64_t)fmod(v479, 1.84467441e19);
    if (v480 >= 0.0)
    {
      if (v480 > 0.0)
        v476 += (unint64_t)v480;
    }
    else
    {
      v476 -= (unint64_t)fabs(v480);
    }
  }
  else
  {
    v476 = 0;
  }
  v778 = v476;
  if ((has & 0x10000000000) != 0)
  {
    appLaunchesAtSpecificGeoHash9ForApp = self->_appLaunchesAtSpecificGeoHash9ForApp;
    v483 = -appLaunchesAtSpecificGeoHash9ForApp;
    if (appLaunchesAtSpecificGeoHash9ForApp >= 0.0)
      v483 = self->_appLaunchesAtSpecificGeoHash9ForApp;
    v484 = floor(v483 + 0.5);
    v485 = (v483 - v484) * 1.84467441e19;
    v481 = 2654435761u * (unint64_t)fmod(v484, 1.84467441e19);
    if (v485 >= 0.0)
    {
      if (v485 > 0.0)
        v481 += (unint64_t)v485;
    }
    else
    {
      v481 -= (unint64_t)fabs(v485);
    }
  }
  else
  {
    v481 = 0;
  }
  v777 = v481;
  if ((has & 0x8000000) != 0)
  {
    appLaunchesAtSpecificGeoHash10ForApp = self->_appLaunchesAtSpecificGeoHash10ForApp;
    v488 = -appLaunchesAtSpecificGeoHash10ForApp;
    if (appLaunchesAtSpecificGeoHash10ForApp >= 0.0)
      v488 = self->_appLaunchesAtSpecificGeoHash10ForApp;
    v489 = floor(v488 + 0.5);
    v490 = (v488 - v489) * 1.84467441e19;
    v486 = 2654435761u * (unint64_t)fmod(v489, 1.84467441e19);
    if (v490 >= 0.0)
    {
      if (v490 > 0.0)
        v486 += (unint64_t)v490;
    }
    else
    {
      v486 -= (unint64_t)fabs(v490);
    }
  }
  else
  {
    v486 = 0;
  }
  v776 = v486;
  if ((has & 0x10000000) != 0)
  {
    appLaunchesAtSpecificGeoHash11ForApp = self->_appLaunchesAtSpecificGeoHash11ForApp;
    v493 = -appLaunchesAtSpecificGeoHash11ForApp;
    if (appLaunchesAtSpecificGeoHash11ForApp >= 0.0)
      v493 = self->_appLaunchesAtSpecificGeoHash11ForApp;
    v494 = floor(v493 + 0.5);
    v495 = (v493 - v494) * 1.84467441e19;
    v491 = 2654435761u * (unint64_t)fmod(v494, 1.84467441e19);
    if (v495 >= 0.0)
    {
      if (v495 > 0.0)
        v491 += (unint64_t)v495;
    }
    else
    {
      v491 -= (unint64_t)fabs(v495);
    }
  }
  else
  {
    v491 = 0;
  }
  v775 = v491;
  if ((has & 0x20000000) != 0)
  {
    appLaunchesAtSpecificGeoHash12ForApp = self->_appLaunchesAtSpecificGeoHash12ForApp;
    v498 = -appLaunchesAtSpecificGeoHash12ForApp;
    if (appLaunchesAtSpecificGeoHash12ForApp >= 0.0)
      v498 = self->_appLaunchesAtSpecificGeoHash12ForApp;
    v499 = floor(v498 + 0.5);
    v500 = (v498 - v499) * 1.84467441e19;
    v496 = 2654435761u * (unint64_t)fmod(v499, 1.84467441e19);
    if (v500 >= 0.0)
    {
      if (v500 > 0.0)
        v496 += (unint64_t)v500;
    }
    else
    {
      v496 -= (unint64_t)fabs(v500);
    }
  }
  else
  {
    v496 = 0;
  }
  v774 = v496;
  if ((has & 0x40000000) != 0)
  {
    appLaunchesAtSpecificGeoHash13ForApp = self->_appLaunchesAtSpecificGeoHash13ForApp;
    v503 = -appLaunchesAtSpecificGeoHash13ForApp;
    if (appLaunchesAtSpecificGeoHash13ForApp >= 0.0)
      v503 = self->_appLaunchesAtSpecificGeoHash13ForApp;
    v504 = floor(v503 + 0.5);
    v505 = (v503 - v504) * 1.84467441e19;
    v501 = 2654435761u * (unint64_t)fmod(v504, 1.84467441e19);
    if (v505 >= 0.0)
    {
      if (v505 > 0.0)
        v501 += (unint64_t)v505;
    }
    else
    {
      v501 -= (unint64_t)fabs(v505);
    }
  }
  else
  {
    v501 = 0;
  }
  v773 = v501;
  if ((has & 0x80000000) != 0)
  {
    appLaunchesAtSpecificGeoHash14ForApp = self->_appLaunchesAtSpecificGeoHash14ForApp;
    v508 = -appLaunchesAtSpecificGeoHash14ForApp;
    if (appLaunchesAtSpecificGeoHash14ForApp >= 0.0)
      v508 = self->_appLaunchesAtSpecificGeoHash14ForApp;
    v509 = floor(v508 + 0.5);
    v510 = (v508 - v509) * 1.84467441e19;
    v506 = 2654435761u * (unint64_t)fmod(v509, 1.84467441e19);
    if (v510 >= 0.0)
    {
      if (v510 > 0.0)
        v506 += (unint64_t)v510;
    }
    else
    {
      v506 -= (unint64_t)fabs(v510);
    }
  }
  else
  {
    v506 = 0;
  }
  v772 = v506;
  if ((v5 & 0x100000000000) != 0)
  {
    appNumberOfSpecificGeohashesForApp = self->_appNumberOfSpecificGeohashesForApp;
    v513 = -appNumberOfSpecificGeohashesForApp;
    if (appNumberOfSpecificGeohashesForApp >= 0.0)
      v513 = self->_appNumberOfSpecificGeohashesForApp;
    v514 = floor(v513 + 0.5);
    v515 = (v513 - v514) * 1.84467441e19;
    v511 = 2654435761u * (unint64_t)fmod(v514, 1.84467441e19);
    if (v515 >= 0.0)
    {
      if (v515 > 0.0)
        v511 += (unint64_t)v515;
    }
    else
    {
      v511 -= (unint64_t)fabs(v515);
    }
  }
  else
  {
    v511 = 0;
  }
  v771 = v511;
  if ((v5 & 0x80000000000) != 0)
  {
    appNumberOfCoarseGeohashesForApp = self->_appNumberOfCoarseGeohashesForApp;
    v518 = -appNumberOfCoarseGeohashesForApp;
    if (appNumberOfCoarseGeohashesForApp >= 0.0)
      v518 = self->_appNumberOfCoarseGeohashesForApp;
    v519 = floor(v518 + 0.5);
    v520 = (v518 - v519) * 1.84467441e19;
    v516 = 2654435761u * (unint64_t)fmod(v519, 1.84467441e19);
    if (v520 >= 0.0)
    {
      if (v520 > 0.0)
        v516 += (unint64_t)v520;
    }
    else
    {
      v516 -= (unint64_t)fabs(v520);
    }
  }
  else
  {
    v516 = 0;
  }
  v770 = v516;
  if ((has & 0x40) != 0)
  {
    appEntropyForTimeBuckets = self->_appEntropyForTimeBuckets;
    v523 = -appEntropyForTimeBuckets;
    if (appEntropyForTimeBuckets >= 0.0)
      v523 = self->_appEntropyForTimeBuckets;
    v524 = floor(v523 + 0.5);
    v525 = (v523 - v524) * 1.84467441e19;
    v521 = 2654435761u * (unint64_t)fmod(v524, 1.84467441e19);
    if (v525 >= 0.0)
    {
      if (v525 > 0.0)
        v521 += (unint64_t)v525;
    }
    else
    {
      v521 -= (unint64_t)fabs(v525);
    }
  }
  else
  {
    v521 = 0;
  }
  v769 = v521;
  if ((has & 0x20) != 0)
  {
    appEntropyForSpecificGeoHash = self->_appEntropyForSpecificGeoHash;
    v528 = -appEntropyForSpecificGeoHash;
    if (appEntropyForSpecificGeoHash >= 0.0)
      v528 = self->_appEntropyForSpecificGeoHash;
    v529 = floor(v528 + 0.5);
    v530 = (v528 - v529) * 1.84467441e19;
    v526 = 2654435761u * (unint64_t)fmod(v529, 1.84467441e19);
    if (v530 >= 0.0)
    {
      if (v530 > 0.0)
        v526 += (unint64_t)v530;
    }
    else
    {
      v526 -= (unint64_t)fabs(v530);
    }
  }
  else
  {
    v526 = 0;
  }
  v768 = v526;
  if ((has & 0x10) != 0)
  {
    appEntropyForCoarseGeoHash = self->_appEntropyForCoarseGeoHash;
    v533 = -appEntropyForCoarseGeoHash;
    if (appEntropyForCoarseGeoHash >= 0.0)
      v533 = self->_appEntropyForCoarseGeoHash;
    v534 = floor(v533 + 0.5);
    v535 = (v533 - v534) * 1.84467441e19;
    v531 = 2654435761u * (unint64_t)fmod(v534, 1.84467441e19);
    if (v535 >= 0.0)
    {
      if (v535 > 0.0)
        v531 += (unint64_t)v535;
    }
    else
    {
      v531 -= (unint64_t)fabs(v535);
    }
  }
  else
  {
    v531 = 0;
  }
  v767 = v531;
  if ((has & 0x40000000000) != 0)
  {
    appLaunchesAtSpecificGeoHashForAppInContext = self->_appLaunchesAtSpecificGeoHashForAppInContext;
    v538 = -appLaunchesAtSpecificGeoHashForAppInContext;
    if (appLaunchesAtSpecificGeoHashForAppInContext >= 0.0)
      v538 = self->_appLaunchesAtSpecificGeoHashForAppInContext;
    v539 = floor(v538 + 0.5);
    v540 = (v538 - v539) * 1.84467441e19;
    v536 = 2654435761u * (unint64_t)fmod(v539, 1.84467441e19);
    if (v540 >= 0.0)
    {
      if (v540 > 0.0)
        v536 += (unint64_t)v540;
    }
    else
    {
      v536 -= (unint64_t)fabs(v540);
    }
  }
  else
  {
    v536 = 0;
  }
  v766 = v536;
  if ((has & 0x100000) != 0)
  {
    appLaunchesAtCoarseGeoHashForAppInContext = self->_appLaunchesAtCoarseGeoHashForAppInContext;
    v543 = -appLaunchesAtCoarseGeoHashForAppInContext;
    if (appLaunchesAtCoarseGeoHashForAppInContext >= 0.0)
      v543 = self->_appLaunchesAtCoarseGeoHashForAppInContext;
    v544 = floor(v543 + 0.5);
    v545 = (v543 - v544) * 1.84467441e19;
    v541 = 2654435761u * (unint64_t)fmod(v544, 1.84467441e19);
    if (v545 >= 0.0)
    {
      if (v545 > 0.0)
        v541 += (unint64_t)v545;
    }
    else
    {
      v541 -= (unint64_t)fabs(v545);
    }
  }
  else
  {
    v541 = 0;
  }
  v765 = v541;
  if ((has & 0x400000) != 0)
  {
    appLaunchesAtDayOfWeekForApp = self->_appLaunchesAtDayOfWeekForApp;
    v548 = -appLaunchesAtDayOfWeekForApp;
    if (appLaunchesAtDayOfWeekForApp >= 0.0)
      v548 = self->_appLaunchesAtDayOfWeekForApp;
    v549 = floor(v548 + 0.5);
    v550 = (v548 - v549) * 1.84467441e19;
    v546 = 2654435761u * (unint64_t)fmod(v549, 1.84467441e19);
    if (v550 >= 0.0)
    {
      if (v550 > 0.0)
        v546 += (unint64_t)v550;
    }
    else
    {
      v546 -= (unint64_t)fabs(v550);
    }
  }
  else
  {
    v546 = 0;
  }
  v764 = v546;
  if ((has & 0x200000000000) != 0)
  {
    appLaunchesAtTimeAndDayForAppInContext = self->_appLaunchesAtTimeAndDayForAppInContext;
    v553 = -appLaunchesAtTimeAndDayForAppInContext;
    if (appLaunchesAtTimeAndDayForAppInContext >= 0.0)
      v553 = self->_appLaunchesAtTimeAndDayForAppInContext;
    v554 = floor(v553 + 0.5);
    v555 = (v553 - v554) * 1.84467441e19;
    v551 = 2654435761u * (unint64_t)fmod(v554, 1.84467441e19);
    if (v555 >= 0.0)
    {
      if (v555 > 0.0)
        v551 += (unint64_t)v555;
    }
    else
    {
      v551 -= (unint64_t)fabs(v555);
    }
  }
  else
  {
    v551 = 0;
  }
  v763 = v551;
  if ((has & 0x400000000000) != 0)
  {
    appLaunchesAtTimeAndDayInContext = self->_appLaunchesAtTimeAndDayInContext;
    v558 = -appLaunchesAtTimeAndDayInContext;
    if (appLaunchesAtTimeAndDayInContext >= 0.0)
      v558 = self->_appLaunchesAtTimeAndDayInContext;
    v559 = floor(v558 + 0.5);
    v560 = (v558 - v559) * 1.84467441e19;
    v556 = 2654435761u * (unint64_t)fmod(v559, 1.84467441e19);
    if (v560 >= 0.0)
    {
      if (v560 > 0.0)
        v556 += (unint64_t)v560;
    }
    else
    {
      v556 -= (unint64_t)fabs(v560);
    }
  }
  else
  {
    v556 = 0;
  }
  v762 = v556;
  if ((has & 0x100000000000) != 0)
  {
    appLaunchesAtTimeAndDayForApp = self->_appLaunchesAtTimeAndDayForApp;
    v563 = -appLaunchesAtTimeAndDayForApp;
    if (appLaunchesAtTimeAndDayForApp >= 0.0)
      v563 = self->_appLaunchesAtTimeAndDayForApp;
    v564 = floor(v563 + 0.5);
    v565 = (v563 - v564) * 1.84467441e19;
    v561 = 2654435761u * (unint64_t)fmod(v564, 1.84467441e19);
    if (v565 >= 0.0)
    {
      if (v565 > 0.0)
        v561 += (unint64_t)v565;
    }
    else
    {
      v561 -= (unint64_t)fabs(v565);
    }
  }
  else
  {
    v561 = 0;
  }
  v761 = v561;
  if ((has & 0x200000) != 0)
  {
    appLaunchesAtCoarseGeoHashInContext = self->_appLaunchesAtCoarseGeoHashInContext;
    v568 = -appLaunchesAtCoarseGeoHashInContext;
    if (appLaunchesAtCoarseGeoHashInContext >= 0.0)
      v568 = self->_appLaunchesAtCoarseGeoHashInContext;
    v569 = floor(v568 + 0.5);
    v570 = (v568 - v569) * 1.84467441e19;
    v566 = 2654435761u * (unint64_t)fmod(v569, 1.84467441e19);
    if (v570 >= 0.0)
    {
      if (v570 > 0.0)
        v566 += (unint64_t)v570;
    }
    else
    {
      v566 -= (unint64_t)fabs(v570);
    }
  }
  else
  {
    v566 = 0;
  }
  v760 = v566;
  if ((has & 0x80000) != 0)
  {
    appLaunchesAtCoarseGeoHashForApp = self->_appLaunchesAtCoarseGeoHashForApp;
    v573 = -appLaunchesAtCoarseGeoHashForApp;
    if (appLaunchesAtCoarseGeoHashForApp >= 0.0)
      v573 = self->_appLaunchesAtCoarseGeoHashForApp;
    v574 = floor(v573 + 0.5);
    v575 = (v573 - v574) * 1.84467441e19;
    v571 = 2654435761u * (unint64_t)fmod(v574, 1.84467441e19);
    if (v575 >= 0.0)
    {
      if (v575 > 0.0)
        v571 += (unint64_t)v575;
    }
    else
    {
      v571 -= (unint64_t)fabs(v575);
    }
  }
  else
  {
    v571 = 0;
  }
  v759 = v571;
  if ((has & 0x80000000000) != 0)
  {
    appLaunchesAtSpecificGeoHashInContext = self->_appLaunchesAtSpecificGeoHashInContext;
    v578 = -appLaunchesAtSpecificGeoHashInContext;
    if (appLaunchesAtSpecificGeoHashInContext >= 0.0)
      v578 = self->_appLaunchesAtSpecificGeoHashInContext;
    v579 = floor(v578 + 0.5);
    v580 = (v578 - v579) * 1.84467441e19;
    v576 = 2654435761u * (unint64_t)fmod(v579, 1.84467441e19);
    if (v580 >= 0.0)
    {
      if (v580 > 0.0)
        v576 += (unint64_t)v580;
    }
    else
    {
      v576 -= (unint64_t)fabs(v580);
    }
  }
  else
  {
    v576 = 0;
  }
  v758 = v576;
  if ((has & 0x20000000000) != 0)
  {
    appLaunchesAtSpecificGeoHashForApp = self->_appLaunchesAtSpecificGeoHashForApp;
    v583 = -appLaunchesAtSpecificGeoHashForApp;
    if (appLaunchesAtSpecificGeoHashForApp >= 0.0)
      v583 = self->_appLaunchesAtSpecificGeoHashForApp;
    v584 = floor(v583 + 0.5);
    v585 = (v583 - v584) * 1.84467441e19;
    v581 = 2654435761u * (unint64_t)fmod(v584, 1.84467441e19);
    if (v585 >= 0.0)
    {
      if (v585 > 0.0)
        v581 += (unint64_t)v585;
    }
    else
    {
      v581 -= (unint64_t)fabs(v585);
    }
  }
  else
  {
    v581 = 0;
  }
  v757 = v581;
  if ((v5 & 1) != 0)
  {
    appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate = self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
    v588 = -appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
    if (appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate >= 0.0)
      v588 = self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
    v589 = floor(v588 + 0.5);
    v590 = (v588 - v589) * 1.84467441e19;
    v586 = 2654435761u * (unint64_t)fmod(v589, 1.84467441e19);
    if (v590 >= 0.0)
    {
      if (v590 > 0.0)
        v586 += (unint64_t)v590;
    }
    else
    {
      v586 -= (unint64_t)fabs(v590);
    }
  }
  else
  {
    v586 = 0;
  }
  v756 = v586;
  if ((v5 & 2) != 0)
  {
    appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate = self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
    v593 = -appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
    if (appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate >= 0.0)
      v593 = self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
    v594 = floor(v593 + 0.5);
    v595 = (v593 - v594) * 1.84467441e19;
    v591 = 2654435761u * (unint64_t)fmod(v594, 1.84467441e19);
    if (v595 >= 0.0)
    {
      if (v595 > 0.0)
        v591 += (unint64_t)v595;
    }
    else
    {
      v591 -= (unint64_t)fabs(v595);
    }
  }
  else
  {
    v591 = 0;
  }
  v755 = v591;
  if ((v3 & 2) != 0)
  {
    isLocationServicesDisabled = self->_isLocationServicesDisabled;
    v598 = -isLocationServicesDisabled;
    if (isLocationServicesDisabled >= 0.0)
      v598 = self->_isLocationServicesDisabled;
    v599 = floor(v598 + 0.5);
    v600 = (v598 - v599) * 1.84467441e19;
    v596 = 2654435761u * (unint64_t)fmod(v599, 1.84467441e19);
    if (v600 >= 0.0)
    {
      if (v600 > 0.0)
        v596 += (unint64_t)v600;
    }
    else
    {
      v596 -= (unint64_t)fabs(v600);
    }
  }
  else
  {
    v596 = 0;
  }
  v754 = v596;
  if ((v5 & 0x40000000) != 0)
  {
    appLaunchesInTwoHourTimeBucketForAppInContext = self->_appLaunchesInTwoHourTimeBucketForAppInContext;
    v603 = -appLaunchesInTwoHourTimeBucketForAppInContext;
    if (appLaunchesInTwoHourTimeBucketForAppInContext >= 0.0)
      v603 = self->_appLaunchesInTwoHourTimeBucketForAppInContext;
    v604 = floor(v603 + 0.5);
    v605 = (v603 - v604) * 1.84467441e19;
    v601 = 2654435761u * (unint64_t)fmod(v604, 1.84467441e19);
    if (v605 >= 0.0)
    {
      if (v605 > 0.0)
        v601 += (unint64_t)v605;
    }
    else
    {
      v601 -= (unint64_t)fabs(v605);
    }
  }
  else
  {
    v601 = 0;
  }
  v753 = v601;
  if ((v5 & 0x80000000) != 0)
  {
    appLaunchesInTwoHourTimeBucketInContext = self->_appLaunchesInTwoHourTimeBucketInContext;
    v608 = -appLaunchesInTwoHourTimeBucketInContext;
    if (appLaunchesInTwoHourTimeBucketInContext >= 0.0)
      v608 = self->_appLaunchesInTwoHourTimeBucketInContext;
    v609 = floor(v608 + 0.5);
    v610 = (v608 - v609) * 1.84467441e19;
    v606 = 2654435761u * (unint64_t)fmod(v609, 1.84467441e19);
    if (v610 >= 0.0)
    {
      if (v610 > 0.0)
        v606 += (unint64_t)v610;
    }
    else
    {
      v606 -= (unint64_t)fabs(v610);
    }
  }
  else
  {
    v606 = 0;
  }
  v752 = v606;
  if ((v5 & 0x20000000) != 0)
  {
    appLaunchesInTwoHourTimeBucketForApp = self->_appLaunchesInTwoHourTimeBucketForApp;
    v613 = -appLaunchesInTwoHourTimeBucketForApp;
    if (appLaunchesInTwoHourTimeBucketForApp >= 0.0)
      v613 = self->_appLaunchesInTwoHourTimeBucketForApp;
    v614 = floor(v613 + 0.5);
    v615 = (v613 - v614) * 1.84467441e19;
    v611 = 2654435761u * (unint64_t)fmod(v614, 1.84467441e19);
    if (v615 >= 0.0)
    {
      if (v615 > 0.0)
        v611 += (unint64_t)v615;
    }
    else
    {
      v611 -= (unint64_t)fabs(v615);
    }
  }
  else
  {
    v611 = 0;
  }
  v751 = v611;
  if ((v5 & 0x20000000000000) != 0)
  {
    currentTimeBucketFromZeroToTwentyFour = self->_currentTimeBucketFromZeroToTwentyFour;
    v618 = -currentTimeBucketFromZeroToTwentyFour;
    if (currentTimeBucketFromZeroToTwentyFour >= 0.0)
      v618 = self->_currentTimeBucketFromZeroToTwentyFour;
    v619 = floor(v618 + 0.5);
    v620 = (v618 - v619) * 1.84467441e19;
    v616 = 2654435761u * (unint64_t)fmod(v619, 1.84467441e19);
    if (v620 >= 0.0)
    {
      if (v620 > 0.0)
        v616 += (unint64_t)v620;
    }
    else
    {
      v616 -= (unint64_t)fabs(v620);
    }
  }
  else
  {
    v616 = 0;
  }
  v750 = v616;
  if ((has & 0x400000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHashForAppInContext = self->_appLaunchesAtZoom7GeoHashForAppInContext;
    v623 = -appLaunchesAtZoom7GeoHashForAppInContext;
    if (appLaunchesAtZoom7GeoHashForAppInContext >= 0.0)
      v623 = self->_appLaunchesAtZoom7GeoHashForAppInContext;
    v624 = floor(v623 + 0.5);
    v625 = (v623 - v624) * 1.84467441e19;
    v621 = 2654435761u * (unint64_t)fmod(v624, 1.84467441e19);
    if (v625 >= 0.0)
    {
      if (v625 > 0.0)
        v621 += (unint64_t)v625;
    }
    else
    {
      v621 -= (unint64_t)fabs(v625);
    }
  }
  else
  {
    v621 = 0;
  }
  v749 = v621;
  if ((has & 0x800000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHashInContext = self->_appLaunchesAtZoom7GeoHashInContext;
    v628 = -appLaunchesAtZoom7GeoHashInContext;
    if (appLaunchesAtZoom7GeoHashInContext >= 0.0)
      v628 = self->_appLaunchesAtZoom7GeoHashInContext;
    v629 = floor(v628 + 0.5);
    v630 = (v628 - v629) * 1.84467441e19;
    v626 = 2654435761u * (unint64_t)fmod(v629, 1.84467441e19);
    if (v630 >= 0.0)
    {
      if (v630 > 0.0)
        v626 += (unint64_t)v630;
    }
    else
    {
      v626 -= (unint64_t)fabs(v630);
    }
  }
  else
  {
    v626 = 0;
  }
  v748 = v626;
  if ((has & 0x200000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHashForApp = self->_appLaunchesAtZoom7GeoHashForApp;
    v633 = -appLaunchesAtZoom7GeoHashForApp;
    if (appLaunchesAtZoom7GeoHashForApp >= 0.0)
      v633 = self->_appLaunchesAtZoom7GeoHashForApp;
    v634 = floor(v633 + 0.5);
    v635 = (v633 - v634) * 1.84467441e19;
    v631 = 2654435761u * (unint64_t)fmod(v634, 1.84467441e19);
    if (v635 >= 0.0)
    {
      if (v635 > 0.0)
        v631 += (unint64_t)v635;
    }
    else
    {
      v631 -= (unint64_t)fabs(v635);
    }
  }
  else
  {
    v631 = 0;
  }
  v747 = v631;
  if ((has & 0x800000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash0ForApp = self->_appLaunchesAtZoom7GeoHash0ForApp;
    v638 = -appLaunchesAtZoom7GeoHash0ForApp;
    if (appLaunchesAtZoom7GeoHash0ForApp >= 0.0)
      v638 = self->_appLaunchesAtZoom7GeoHash0ForApp;
    v639 = floor(v638 + 0.5);
    v640 = (v638 - v639) * 1.84467441e19;
    v636 = 2654435761u * (unint64_t)fmod(v639, 1.84467441e19);
    if (v640 >= 0.0)
    {
      if (v640 > 0.0)
        v636 += (unint64_t)v640;
    }
    else
    {
      v636 -= (unint64_t)fabs(v640);
    }
  }
  else
  {
    v636 = 0;
  }
  v746 = v636;
  if ((has & 0x1000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash1ForApp = self->_appLaunchesAtZoom7GeoHash1ForApp;
    v643 = -appLaunchesAtZoom7GeoHash1ForApp;
    if (appLaunchesAtZoom7GeoHash1ForApp >= 0.0)
      v643 = self->_appLaunchesAtZoom7GeoHash1ForApp;
    v644 = floor(v643 + 0.5);
    v645 = (v643 - v644) * 1.84467441e19;
    v641 = 2654435761u * (unint64_t)fmod(v644, 1.84467441e19);
    if (v645 >= 0.0)
    {
      if (v645 > 0.0)
        v641 += (unint64_t)v645;
    }
    else
    {
      v641 -= (unint64_t)fabs(v645);
    }
  }
  else
  {
    v641 = 0;
  }
  v745 = v641;
  if ((has & 0x2000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash2ForApp = self->_appLaunchesAtZoom7GeoHash2ForApp;
    v648 = -appLaunchesAtZoom7GeoHash2ForApp;
    if (appLaunchesAtZoom7GeoHash2ForApp >= 0.0)
      v648 = self->_appLaunchesAtZoom7GeoHash2ForApp;
    v649 = floor(v648 + 0.5);
    v650 = (v648 - v649) * 1.84467441e19;
    v646 = 2654435761u * (unint64_t)fmod(v649, 1.84467441e19);
    if (v650 >= 0.0)
    {
      if (v650 > 0.0)
        v646 += (unint64_t)v650;
    }
    else
    {
      v646 -= (unint64_t)fabs(v650);
    }
  }
  else
  {
    v646 = 0;
  }
  v744 = v646;
  if ((has & 0x4000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash3ForApp = self->_appLaunchesAtZoom7GeoHash3ForApp;
    v653 = -appLaunchesAtZoom7GeoHash3ForApp;
    if (appLaunchesAtZoom7GeoHash3ForApp >= 0.0)
      v653 = self->_appLaunchesAtZoom7GeoHash3ForApp;
    v654 = floor(v653 + 0.5);
    v655 = (v653 - v654) * 1.84467441e19;
    v651 = 2654435761u * (unint64_t)fmod(v654, 1.84467441e19);
    if (v655 >= 0.0)
    {
      if (v655 > 0.0)
        v651 += (unint64_t)v655;
    }
    else
    {
      v651 -= (unint64_t)fabs(v655);
    }
  }
  else
  {
    v651 = 0;
  }
  v743 = v651;
  if ((has & 0x8000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash4ForApp = self->_appLaunchesAtZoom7GeoHash4ForApp;
    v658 = -appLaunchesAtZoom7GeoHash4ForApp;
    if (appLaunchesAtZoom7GeoHash4ForApp >= 0.0)
      v658 = self->_appLaunchesAtZoom7GeoHash4ForApp;
    v659 = floor(v658 + 0.5);
    v660 = (v658 - v659) * 1.84467441e19;
    v656 = 2654435761u * (unint64_t)fmod(v659, 1.84467441e19);
    if (v660 >= 0.0)
    {
      if (v660 > 0.0)
        v656 += (unint64_t)v660;
    }
    else
    {
      v656 -= (unint64_t)fabs(v660);
    }
  }
  else
  {
    v656 = 0;
  }
  v742 = v656;
  if ((has & 0x10000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash5ForApp = self->_appLaunchesAtZoom7GeoHash5ForApp;
    v663 = -appLaunchesAtZoom7GeoHash5ForApp;
    if (appLaunchesAtZoom7GeoHash5ForApp >= 0.0)
      v663 = self->_appLaunchesAtZoom7GeoHash5ForApp;
    v664 = floor(v663 + 0.5);
    v665 = (v663 - v664) * 1.84467441e19;
    v661 = 2654435761u * (unint64_t)fmod(v664, 1.84467441e19);
    if (v665 >= 0.0)
    {
      if (v665 > 0.0)
        v661 += (unint64_t)v665;
    }
    else
    {
      v661 -= (unint64_t)fabs(v665);
    }
  }
  else
  {
    v661 = 0;
  }
  v741 = v661;
  if ((has & 0x20000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash6ForApp = self->_appLaunchesAtZoom7GeoHash6ForApp;
    v668 = -appLaunchesAtZoom7GeoHash6ForApp;
    if (appLaunchesAtZoom7GeoHash6ForApp >= 0.0)
      v668 = self->_appLaunchesAtZoom7GeoHash6ForApp;
    v669 = floor(v668 + 0.5);
    v670 = (v668 - v669) * 1.84467441e19;
    v666 = 2654435761u * (unint64_t)fmod(v669, 1.84467441e19);
    if (v670 >= 0.0)
    {
      if (v670 > 0.0)
        v666 += (unint64_t)v670;
    }
    else
    {
      v666 -= (unint64_t)fabs(v670);
    }
  }
  else
  {
    v666 = 0;
  }
  v740 = v666;
  if ((has & 0x40000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash7ForApp = self->_appLaunchesAtZoom7GeoHash7ForApp;
    v673 = -appLaunchesAtZoom7GeoHash7ForApp;
    if (appLaunchesAtZoom7GeoHash7ForApp >= 0.0)
      v673 = self->_appLaunchesAtZoom7GeoHash7ForApp;
    v674 = floor(v673 + 0.5);
    v675 = (v673 - v674) * 1.84467441e19;
    v671 = 2654435761u * (unint64_t)fmod(v674, 1.84467441e19);
    if (v675 >= 0.0)
    {
      if (v675 > 0.0)
        v671 += (unint64_t)v675;
    }
    else
    {
      v671 -= (unint64_t)fabs(v675);
    }
  }
  else
  {
    v671 = 0;
  }
  v739 = v671;
  if ((has & 0x80000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash8ForApp = self->_appLaunchesAtZoom7GeoHash8ForApp;
    v678 = -appLaunchesAtZoom7GeoHash8ForApp;
    if (appLaunchesAtZoom7GeoHash8ForApp >= 0.0)
      v678 = self->_appLaunchesAtZoom7GeoHash8ForApp;
    v679 = floor(v678 + 0.5);
    v680 = (v678 - v679) * 1.84467441e19;
    v676 = 2654435761u * (unint64_t)fmod(v679, 1.84467441e19);
    if (v680 >= 0.0)
    {
      if (v680 > 0.0)
        v676 += (unint64_t)v680;
    }
    else
    {
      v676 -= (unint64_t)fabs(v680);
    }
  }
  else
  {
    v676 = 0;
  }
  v738 = v676;
  if ((has & 0x100000000000000) != 0)
  {
    appLaunchesAtZoom7GeoHash9ForApp = self->_appLaunchesAtZoom7GeoHash9ForApp;
    v683 = -appLaunchesAtZoom7GeoHash9ForApp;
    if (appLaunchesAtZoom7GeoHash9ForApp >= 0.0)
      v683 = self->_appLaunchesAtZoom7GeoHash9ForApp;
    v684 = floor(v683 + 0.5);
    v685 = (v683 - v684) * 1.84467441e19;
    v681 = 2654435761u * (unint64_t)fmod(v684, 1.84467441e19);
    if (v685 >= 0.0)
    {
      if (v685 > 0.0)
        v681 += (unint64_t)v685;
    }
    else
    {
      v681 -= (unint64_t)fabs(v685);
    }
  }
  else
  {
    v681 = 0;
  }
  v737 = v681;
  if ((has & 0x80) != 0)
  {
    appEntropyForZoom7GeoHash = self->_appEntropyForZoom7GeoHash;
    v688 = -appEntropyForZoom7GeoHash;
    if (appEntropyForZoom7GeoHash >= 0.0)
      v688 = self->_appEntropyForZoom7GeoHash;
    v689 = floor(v688 + 0.5);
    v690 = (v688 - v689) * 1.84467441e19;
    v686 = 2654435761u * (unint64_t)fmod(v689, 1.84467441e19);
    if (v690 >= 0.0)
    {
      if (v690 > 0.0)
        v686 += (unint64_t)v690;
    }
    else
    {
      v686 -= (unint64_t)fabs(v690);
    }
  }
  else
  {
    v686 = 0;
  }
  v736 = v686;
  if ((v5 & 0x200000000000) != 0)
  {
    appNumberOfZoom7GeohashesForApp = self->_appNumberOfZoom7GeohashesForApp;
    v693 = -appNumberOfZoom7GeohashesForApp;
    if (appNumberOfZoom7GeohashesForApp >= 0.0)
      v693 = self->_appNumberOfZoom7GeohashesForApp;
    v694 = floor(v693 + 0.5);
    v695 = (v693 - v694) * 1.84467441e19;
    v691 = 2654435761u * (unint64_t)fmod(v694, 1.84467441e19);
    if (v695 >= 0.0)
    {
      if (v695 > 0.0)
        v691 += (unint64_t)v695;
    }
    else
    {
      v691 -= (unint64_t)fabs(v695);
    }
  }
  else
  {
    v691 = 0;
  }
  v735 = v691;
  v869 = v11;
  if ((has & 0x2000000) != 0)
  {
    appLaunchesAtSSIDForAppInContext = self->_appLaunchesAtSSIDForAppInContext;
    v698 = -appLaunchesAtSSIDForAppInContext;
    if (appLaunchesAtSSIDForAppInContext >= 0.0)
      v698 = self->_appLaunchesAtSSIDForAppInContext;
    v699 = floor(v698 + 0.5);
    v700 = (v698 - v699) * 1.84467441e19;
    v696 = 2654435761u * (unint64_t)fmod(v699, 1.84467441e19);
    if (v700 >= 0.0)
    {
      if (v700 > 0.0)
        v696 += (unint64_t)v700;
    }
    else
    {
      v696 -= (unint64_t)fabs(v700);
    }
  }
  else
  {
    v696 = 0;
  }
  v868 = v16;
  if ((has & 0x1000000) != 0)
  {
    appLaunchesAtSSIDForApp = self->_appLaunchesAtSSIDForApp;
    v703 = -appLaunchesAtSSIDForApp;
    if (appLaunchesAtSSIDForApp >= 0.0)
      v703 = self->_appLaunchesAtSSIDForApp;
    v704 = floor(v703 + 0.5);
    v705 = (v703 - v704) * 1.84467441e19;
    v701 = 2654435761u * (unint64_t)fmod(v704, 1.84467441e19);
    if (v705 >= 0.0)
    {
      if (v705 > 0.0)
        v701 += (unint64_t)v705;
    }
    else
    {
      v701 -= (unint64_t)fabs(v705);
    }
  }
  else
  {
    v701 = 0;
  }
  v734 = v696;
  if ((v5 & 4) != 0)
  {
    appLaunchesForCoreMotionForAppInContext = self->_appLaunchesForCoreMotionForAppInContext;
    v708 = -appLaunchesForCoreMotionForAppInContext;
    if (appLaunchesForCoreMotionForAppInContext >= 0.0)
      v708 = self->_appLaunchesForCoreMotionForAppInContext;
    v709 = floor(v708 + 0.5);
    v710 = (v708 - v709) * 1.84467441e19;
    v706 = 2654435761u * (unint64_t)fmod(v709, 1.84467441e19);
    if (v710 >= 0.0)
    {
      if (v710 > 0.0)
        v706 += (unint64_t)v710;
    }
    else
    {
      v706 -= (unint64_t)fabs(v710);
    }
  }
  else
  {
    v706 = 0;
  }
  if ((v5 & 8) != 0)
  {
    appLaunchesInAirplaneModeForAppInContext = self->_appLaunchesInAirplaneModeForAppInContext;
    v713 = -appLaunchesInAirplaneModeForAppInContext;
    if (appLaunchesInAirplaneModeForAppInContext >= 0.0)
      v713 = self->_appLaunchesInAirplaneModeForAppInContext;
    v714 = floor(v713 + 0.5);
    v715 = (v713 - v714) * 1.84467441e19;
    v711 = 2654435761u * (unint64_t)fmod(v714, 1.84467441e19);
    if (v715 >= 0.0)
    {
      if (v715 > 0.0)
        v711 += (unint64_t)v715;
    }
    else
    {
      v711 -= (unint64_t)fabs(v715);
    }
  }
  else
  {
    v711 = 0;
  }
  v733 = v701;
  if ((v3 & 0x40) != 0)
  {
    poiPopularityForAppInContext = self->_poiPopularityForAppInContext;
    v718 = -poiPopularityForAppInContext;
    if (poiPopularityForAppInContext >= 0.0)
      v718 = self->_poiPopularityForAppInContext;
    v719 = floor(v718 + 0.5);
    v720 = (v718 - v719) * 1.84467441e19;
    v716 = 2654435761u * (unint64_t)fmod(v719, 1.84467441e19);
    if (v720 >= 0.0)
    {
      if (v720 > 0.0)
        v716 += (unint64_t)v720;
    }
    else
    {
      v716 -= (unint64_t)fabs(v720);
    }
  }
  else
  {
    v716 = 0;
  }
  if ((has & 0x100) != 0)
  {
    appLaunchPopularityAtPOIForAppInContext = self->_appLaunchPopularityAtPOIForAppInContext;
    v723 = -appLaunchPopularityAtPOIForAppInContext;
    if (appLaunchPopularityAtPOIForAppInContext >= 0.0)
      v723 = self->_appLaunchPopularityAtPOIForAppInContext;
    v724 = floor(v723 + 0.5);
    v725 = (v723 - v724) * 1.84467441e19;
    v721 = 2654435761u * (unint64_t)fmod(v724, 1.84467441e19);
    if (v725 >= 0.0)
    {
      if (v725 > 0.0)
        v721 += (unint64_t)v725;
    }
    else
    {
      v721 -= (unint64_t)fabs(v725);
    }
  }
  else
  {
    v721 = 0;
  }
  if ((has & 0x800000) != 0)
  {
    appLaunchesAtPOIForAppInContext = self->_appLaunchesAtPOIForAppInContext;
    v728 = -appLaunchesAtPOIForAppInContext;
    if (appLaunchesAtPOIForAppInContext >= 0.0)
      v728 = self->_appLaunchesAtPOIForAppInContext;
    v729 = floor(v728 + 0.5);
    v730 = (v728 - v729) * 1.84467441e19;
    v726 = 2654435761u * (unint64_t)fmod(v729, 1.84467441e19);
    if (v730 >= 0.0)
    {
      if (v730 > 0.0)
        v726 += (unint64_t)v730;
    }
    else
    {
      v726 -= (unint64_t)fabs(v730);
    }
  }
  else
  {
    v726 = 0;
  }
  v731 = v869 ^ v6 ^ v868 ^ v21 ^ v26 ^ v867 ^ v866 ^ v865 ^ v864 ^ v863 ^ v862 ^ v861 ^ v860 ^ v859 ^ v858 ^ v857 ^ v856 ^ v855 ^ v854 ^ v853 ^ v852 ^ v851 ^ v850 ^ v849 ^ v848 ^ v847 ^ v846 ^ v845 ^ v844 ^ v843 ^ v842 ^ v841 ^ v840 ^ v839 ^ v838 ^ v837 ^ v836 ^ v835 ^ v834 ^ v833 ^ v832 ^ v831 ^ v830 ^ v829 ^ v828 ^ v827 ^ v826 ^ v825 ^ v824 ^ v823 ^ v822 ^ v821 ^ v820 ^ v819 ^ v818 ^ v817 ^ v816 ^ v815 ^ v814 ^ v813 ^ v812 ^ v811 ^ v810 ^ v809 ^ v808 ^ v807 ^ v806 ^ v805 ^ v804 ^ v803 ^ v802 ^ v801 ^ v800 ^ v799 ^ v798 ^ v797 ^ v796 ^ v795 ^ v794;
  return v731 ^ v793 ^ v792 ^ v791 ^ v790 ^ v789 ^ v788 ^ v787 ^ v786 ^ v785 ^ v784 ^ v783 ^ v782 ^ v781 ^ v780 ^ v779 ^ v778 ^ v777 ^ v776 ^ v775 ^ v774 ^ v773 ^ v772 ^ v771 ^ v770 ^ v769 ^ v768 ^ v767 ^ v766 ^ v765 ^ v764 ^ v763 ^ v762 ^ v761 ^ v760 ^ v759 ^ v758 ^ v757 ^ v756 ^ v755 ^ v754 ^ v753 ^ v752 ^ v751 ^ v750 ^ v749 ^ v748 ^ v747 ^ v746 ^ v745 ^ v744 ^ v743 ^ v742 ^ v741 ^ v740 ^ v739 ^ v738 ^ v737 ^ v736 ^ v735 ^ v734 ^ v733 ^ v706 ^ v711 ^ v716 ^ v721 ^ v726;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;

  v4 = (double *)a3;
  v5 = *((unsigned __int16 *)v4 + 592) | (*((unsigned __int8 *)v4 + 1186) << 16);
  if ((v5 & 0x10000) != 0)
  {
    self->_unlockTime = v4[145];
    v5 = *((unsigned __int16 *)&self->_has + 8);
    v6 = (v5 | (*((unsigned __int8 *)&self->_has + 18) << 16) | 0x10000u) >> 16;
    *((_WORD *)&self->_has + 8) = v5;
    *((_BYTE *)&self->_has + 18) = v6;
    LOWORD(v5) = *((_WORD *)v4 + 592);
  }
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x10) != 0)
  {
    self->_launchTimePopularity = v4[133];
    v12 = *((_BYTE *)&self->_has + 18);
    *((_WORD *)&self->_has + 8) |= 0x10u;
    *((_BYTE *)&self->_has + 18) = v12;
    LOWORD(v5) = *((_WORD *)v4 + 592);
    v7 = *((_QWORD *)v4 + 146);
    v8 = *((_QWORD *)v4 + 147);
    if ((v5 & 0x100) == 0)
    {
LABEL_5:
      if ((v5 & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_108;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_5;
  }
  self->_timeOfDayBucket = v4[137];
  v13 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x100u;
  *((_BYTE *)&self->_has + 18) = v13;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x200) == 0)
  {
LABEL_6:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_7;
    goto LABEL_109;
  }
LABEL_108:
  self->_timeOfDayPopularity = v4[138];
  v14 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x200u;
  *((_BYTE *)&self->_has + 18) = v14;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_110;
  }
LABEL_109:
  self->_coarseTimeOfDayPopularity = v4[116];
  *((_QWORD *)&self->_has + 1) |= 0x8000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
    goto LABEL_111;
  }
LABEL_110:
  self->_launchPopularity = v4[132];
  v15 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 8u;
  *((_BYTE *)&self->_has + 18) = v15;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v8 & 0x40000000000000) == 0)
      goto LABEL_10;
    goto LABEL_112;
  }
LABEL_111:
  self->_launchDayOfWeekPopularity = v4[131];
  v16 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 4u;
  *((_BYTE *)&self->_has + 18) = v16;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_10:
    if ((v8 & 0x80000000000000) == 0)
      goto LABEL_11;
    goto LABEL_113;
  }
LABEL_112:
  self->_dayOfWeekBucket = v4[119];
  *((_QWORD *)&self->_has + 1) |= 0x40000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x80000000000000) == 0)
  {
LABEL_11:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_12;
    goto LABEL_114;
  }
LABEL_113:
  self->_dayOfWeekPopularity = v4[120];
  *((_QWORD *)&self->_has + 1) |= 0x80000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x800000000000000) == 0)
  {
LABEL_12:
    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_13;
    goto LABEL_115;
  }
LABEL_114:
  self->_entropyLaunchPopularity = v4[124];
  *((_QWORD *)&self->_has + 1) |= 0x800000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x100000000000000) == 0)
  {
LABEL_13:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_14;
    goto LABEL_116;
  }
LABEL_115:
  self->_entropyDayOfWeekPopularity = v4[121];
  *((_QWORD *)&self->_has + 1) |= 0x100000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_15;
    goto LABEL_117;
  }
LABEL_116:
  self->_entropyDayOfWeekPopularityByDay = v4[123];
  *((_QWORD *)&self->_has + 1) |= 0x400000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_118;
  }
LABEL_117:
  self->_entropyDayOfWeekPopularityByApp = v4[122];
  *((_QWORD *)&self->_has + 1) |= 0x200000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_119;
  }
LABEL_118:
  self->_entropyTrendingPopularity = v4[128];
  *((_QWORD *)&self->_has + 1) |= 0x8000000000000000;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_17:
    if ((v8 & 0x4000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_120;
  }
LABEL_119:
  self->_entropySSIDPopularity = v4[125];
  *((_QWORD *)&self->_has + 1) |= 0x1000000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_19;
    goto LABEL_121;
  }
LABEL_120:
  self->_entropySSIDPopularityBySSID = v4[127];
  *((_QWORD *)&self->_has + 1) |= 0x4000000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_122;
  }
LABEL_121:
  self->_entropySSIDPopularityByApp = v4[126];
  *((_QWORD *)&self->_has + 1) |= 0x2000000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x1000) == 0)
  {
LABEL_20:
    if ((v7 & 1) == 0)
      goto LABEL_21;
    goto LABEL_123;
  }
LABEL_122:
  self->_totalNumberOfLaunches = v4[141];
  v17 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x1000u;
  *((_BYTE *)&self->_has + 18) = v17;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 1) == 0)
  {
LABEL_21:
    if ((v5 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_124;
  }
LABEL_123:
  self->_airplaneModePopularity = v4[1];
  *(_QWORD *)&self->_has |= 1uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x400) == 0)
  {
LABEL_22:
    if ((v5 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_125;
  }
LABEL_124:
  self->_totalNumberOfAirplaneModeLaunches = v4[139];
  v18 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x400u;
  *((_BYTE *)&self->_has + 18) = v18;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x8000) == 0)
  {
LABEL_23:
    if ((v5 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_126;
  }
LABEL_125:
  self->_trendingPopularity = v4[144];
  v19 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x8000u;
  *((_BYTE *)&self->_has + 18) = v19;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x4000) == 0)
  {
LABEL_24:
    if ((v5 & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_127;
  }
LABEL_126:
  self->_totalNumberOfTrendingLaunches = v4[143];
  v20 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x4000u;
  *((_BYTE *)&self->_has + 18) = v20;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x80) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_128;
  }
LABEL_127:
  self->_sSIDPopularity = v4[136];
  v21 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x80u;
  *((_BYTE *)&self->_has + 18) = v21;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_129;
  }
LABEL_128:
  self->_totalNumberOfSSIDLaunches = v4[142];
  v22 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x2000u;
  *((_BYTE *)&self->_has + 18) = v22;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x20) == 0)
  {
LABEL_27:
    if ((v8 & 0x10000000000000) == 0)
      goto LABEL_28;
    goto LABEL_130;
  }
LABEL_129:
  self->_onWifi = v4[134];
  v23 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x20u;
  *((_BYTE *)&self->_has + 18) = v23;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x10000000000000) == 0)
  {
LABEL_28:
    if ((v5 & 0x800) == 0)
      goto LABEL_29;
    goto LABEL_131;
  }
LABEL_130:
  self->_coreMotionPopularity = v4[117];
  *((_QWORD *)&self->_has + 1) |= 0x10000000000000uLL;
  LOWORD(v5) = *((_WORD *)v4 + 592);
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v5 & 0x800) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_132;
  }
LABEL_131:
  self->_totalNumberOfCoreMotionLaunches = v4[140];
  v24 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x800u;
  *((_BYTE *)&self->_has + 18) = v24;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if (((_WORD)v4[148] & 1) == 0)
  {
LABEL_30:
    if ((v7 & 4) == 0)
      goto LABEL_31;
    goto LABEL_133;
  }
LABEL_132:
  self->_isDateInWeekendOnDevice = v4[129];
  v25 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 1u;
  *((_BYTE *)&self->_has + 18) = v25;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 4) == 0)
  {
LABEL_31:
    if ((v7 & 2) == 0)
      goto LABEL_32;
    goto LABEL_134;
  }
LABEL_133:
  self->_ambientLightTypePopularity = v4[3];
  *(_QWORD *)&self->_has |= 4uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 2) == 0)
  {
LABEL_32:
    if ((v8 & 0x2000000000000) == 0)
      goto LABEL_33;
    goto LABEL_135;
  }
LABEL_134:
  self->_ambientLightTypeLaunchPopularity = v4[2];
  *(_QWORD *)&self->_has |= 2uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x2000000000000) == 0)
  {
LABEL_33:
    if ((v7 & 8) == 0)
      goto LABEL_34;
    goto LABEL_136;
  }
LABEL_135:
  self->_appTimeOfDayLaunches = v4[114];
  *((_QWORD *)&self->_has + 1) |= 0x2000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 8) == 0)
  {
LABEL_34:
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_35;
    goto LABEL_137;
  }
LABEL_136:
  self->_appDayOfWeekLaunches = v4[4];
  *(_QWORD *)&self->_has |= 8uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x1000000000000) == 0)
  {
LABEL_35:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_138;
  }
LABEL_137:
  self->_appTimeAndDayOfWeekPopularity = v4[113];
  *((_QWORD *)&self->_has + 1) |= 0x1000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_36:
    if ((v8 & 0x800000000000) == 0)
      goto LABEL_37;
    goto LABEL_139;
  }
LABEL_138:
  self->_appPopularityGivenTimeAndDayOfWeek = v4[111];
  *((_QWORD *)&self->_has + 1) |= 0x400000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x800000000000) == 0)
  {
LABEL_37:
    if ((v8 & 0x4000000000000) == 0)
      goto LABEL_38;
    goto LABEL_140;
  }
LABEL_139:
  self->_appPopularityOfTimeAndDayOfWeekGivenApp = v4[112];
  *((_QWORD *)&self->_has + 1) |= 0x800000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x4000000000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_39;
    goto LABEL_141;
  }
LABEL_140:
  self->_appTotalNumberOfTimeAndDayOfWeekLaunches = v4[115];
  *((_QWORD *)&self->_has + 1) |= 0x4000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 0x4000000000000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_40;
    goto LABEL_142;
  }
LABEL_141:
  self->_appLaunchesCoarseTimePowLocationForAppInContext = v4[63];
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 0x8000000000000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_41;
    goto LABEL_143;
  }
LABEL_142:
  self->_appLaunchesCoarseTimePowLocationInContext = v4[64];
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_42;
    goto LABEL_144;
  }
LABEL_143:
  self->_appLaunchesCoarseTimePowLocationForApp = v4[62];
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v7 & 0x1000000000000000) == 0)
  {
LABEL_42:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_43;
    goto LABEL_145;
  }
LABEL_144:
  self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts = v4[61];
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40000000000) == 0)
      goto LABEL_44;
    goto LABEL_146;
  }
LABEL_145:
  self->_appLaunchesSpecificTimeDowLocationForAppInContext = v4[106];
  *((_QWORD *)&self->_has + 1) |= 0x20000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_45;
    goto LABEL_147;
  }
LABEL_146:
  self->_appLaunchesSpecificTimeDowLocationInContext = v4[107];
  *((_QWORD *)&self->_has + 1) |= 0x40000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v8 & 0x8000000000) == 0)
      goto LABEL_46;
    goto LABEL_148;
  }
LABEL_147:
  self->_appLaunchesSpecificTimeDowLocationForApp = v4[105];
  *((_QWORD *)&self->_has + 1) |= 0x10000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x8000000000) == 0)
  {
LABEL_46:
    if ((v8 & 0x10) == 0)
      goto LABEL_47;
    goto LABEL_149;
  }
LABEL_148:
  self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts = v4[104];
  *((_QWORD *)&self->_has + 1) |= 0x8000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x10) == 0)
  {
LABEL_47:
    if ((v8 & 0x8000) == 0)
      goto LABEL_48;
    goto LABEL_150;
  }
LABEL_149:
  self->_appLaunchesInTimeBucket0ForApp = v4[69];
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x8000) == 0)
  {
LABEL_48:
    if ((v8 & 0x200000) == 0)
      goto LABEL_49;
    goto LABEL_151;
  }
LABEL_150:
  self->_appLaunchesInTimeBucket1ForApp = v4[80];
  *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x200000) == 0)
  {
LABEL_49:
    if ((v8 & 0x400000) == 0)
      goto LABEL_50;
    goto LABEL_152;
  }
LABEL_151:
  self->_appLaunchesInTimeBucket2ForApp = v4[86];
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x400000) == 0)
  {
LABEL_50:
    if ((v8 & 0x800000) == 0)
      goto LABEL_51;
    goto LABEL_153;
  }
LABEL_152:
  self->_appLaunchesInTimeBucket3ForApp = v4[87];
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x800000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_154;
  }
LABEL_153:
  self->_appLaunchesInTimeBucket4ForApp = v4[88];
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x2000000) == 0)
      goto LABEL_53;
    goto LABEL_155;
  }
LABEL_154:
  self->_appLaunchesInTimeBucket5ForApp = v4[89];
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x2000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x4000000) == 0)
      goto LABEL_54;
    goto LABEL_156;
  }
LABEL_155:
  self->_appLaunchesInTimeBucket6ForApp = v4[90];
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_54:
    if ((v8 & 0x8000000) == 0)
      goto LABEL_55;
    goto LABEL_157;
  }
LABEL_156:
  self->_appLaunchesInTimeBucket7ForApp = v4[91];
  *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_55:
    if ((v8 & 0x10000000) == 0)
      goto LABEL_56;
    goto LABEL_158;
  }
LABEL_157:
  self->_appLaunchesInTimeBucket8ForApp = v4[92];
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_56:
    if ((v8 & 0x20) == 0)
      goto LABEL_57;
    goto LABEL_159;
  }
LABEL_158:
  self->_appLaunchesInTimeBucket9ForApp = v4[93];
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x20) == 0)
  {
LABEL_57:
    if ((v8 & 0x40) == 0)
      goto LABEL_58;
    goto LABEL_160;
  }
LABEL_159:
  self->_appLaunchesInTimeBucket10ForApp = v4[70];
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x40) == 0)
  {
LABEL_58:
    if ((v8 & 0x80) == 0)
      goto LABEL_59;
    goto LABEL_161;
  }
LABEL_160:
  self->_appLaunchesInTimeBucket11ForApp = v4[71];
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x80) == 0)
  {
LABEL_59:
    if ((v8 & 0x100) == 0)
      goto LABEL_60;
    goto LABEL_162;
  }
LABEL_161:
  self->_appLaunchesInTimeBucket12ForApp = v4[72];
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x100) == 0)
  {
LABEL_60:
    if ((v8 & 0x200) == 0)
      goto LABEL_61;
    goto LABEL_163;
  }
LABEL_162:
  self->_appLaunchesInTimeBucket13ForApp = v4[73];
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x200) == 0)
  {
LABEL_61:
    if ((v8 & 0x400) == 0)
      goto LABEL_62;
    goto LABEL_164;
  }
LABEL_163:
  self->_appLaunchesInTimeBucket14ForApp = v4[74];
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x400) == 0)
  {
LABEL_62:
    if ((v8 & 0x800) == 0)
      goto LABEL_63;
    goto LABEL_165;
  }
LABEL_164:
  self->_appLaunchesInTimeBucket15ForApp = v4[75];
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x800) == 0)
  {
LABEL_63:
    if ((v8 & 0x1000) == 0)
      goto LABEL_64;
    goto LABEL_166;
  }
LABEL_165:
  self->_appLaunchesInTimeBucket16ForApp = v4[76];
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x1000) == 0)
  {
LABEL_64:
    if ((v8 & 0x2000) == 0)
      goto LABEL_65;
    goto LABEL_167;
  }
LABEL_166:
  self->_appLaunchesInTimeBucket17ForApp = v4[77];
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x2000) == 0)
  {
LABEL_65:
    if ((v8 & 0x4000) == 0)
      goto LABEL_66;
    goto LABEL_168;
  }
LABEL_167:
  self->_appLaunchesInTimeBucket18ForApp = v4[78];
  *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x4000) == 0)
  {
LABEL_66:
    if ((v8 & 0x10000) == 0)
      goto LABEL_67;
    goto LABEL_169;
  }
LABEL_168:
  self->_appLaunchesInTimeBucket19ForApp = v4[79];
  *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x10000) == 0)
  {
LABEL_67:
    if ((v8 & 0x20000) == 0)
      goto LABEL_68;
    goto LABEL_170;
  }
LABEL_169:
  self->_appLaunchesInTimeBucket20ForApp = v4[81];
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x20000) == 0)
  {
LABEL_68:
    if ((v8 & 0x40000) == 0)
      goto LABEL_69;
    goto LABEL_171;
  }
LABEL_170:
  self->_appLaunchesInTimeBucket21ForApp = v4[82];
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x40000) == 0)
  {
LABEL_69:
    if ((v8 & 0x80000) == 0)
      goto LABEL_70;
    goto LABEL_172;
  }
LABEL_171:
  self->_appLaunchesInTimeBucket22ForApp = v4[83];
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x80000) == 0)
  {
LABEL_70:
    if ((v8 & 0x100000) == 0)
      goto LABEL_71;
    goto LABEL_173;
  }
LABEL_172:
  self->_appLaunchesInTimeBucket23ForApp = v4[84];
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x100000) == 0)
  {
LABEL_71:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_72;
    goto LABEL_174;
  }
LABEL_173:
  self->_appLaunchesInTimeBucket24ForApp = v4[85];
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_72:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_73;
    goto LABEL_175;
  }
LABEL_174:
  self->_appLaunchesOnDayOfWeekSundayForApp = v4[100];
  *((_QWORD *)&self->_has + 1) |= 0x800000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_73:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_74;
    goto LABEL_176;
  }
LABEL_175:
  self->_appLaunchesOnDayOfWeekMondayForApp = v4[98];
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_74:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_75;
    goto LABEL_177;
  }
LABEL_176:
  self->_appLaunchesOnDayOfWeekTuesdayForApp = v4[102];
  *((_QWORD *)&self->_has + 1) |= 0x2000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_75:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_76;
    goto LABEL_178;
  }
LABEL_177:
  self->_appLaunchesOnDayOfWeekWednesdayForApp = v4[103];
  *((_QWORD *)&self->_has + 1) |= 0x4000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_76:
    if ((v8 & 0x100000000) == 0)
      goto LABEL_77;
    goto LABEL_179;
  }
LABEL_178:
  self->_appLaunchesOnDayOfWeekThursdayForApp = v4[101];
  *((_QWORD *)&self->_has + 1) |= 0x1000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  v8 = *((_QWORD *)v4 + 147);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_78;
    goto LABEL_180;
  }
LABEL_179:
  self->_appLaunchesOnDayOfWeekFridayForApp = v4[97];
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if (((_QWORD)v4[147] & 0x400000000) == 0)
  {
LABEL_78:
    if ((v7 & 0x200) == 0)
      goto LABEL_79;
    goto LABEL_181;
  }
LABEL_180:
  self->_appLaunchesOnDayOfWeekSaturdayForApp = v4[99];
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x200) == 0)
  {
LABEL_79:
    if ((v7 & 0x400) == 0)
      goto LABEL_80;
    goto LABEL_182;
  }
LABEL_181:
  self->_appLaunchesAtCoarseGeoHash0ForApp = v4[10];
  *(_QWORD *)&self->_has |= 0x200uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x400) == 0)
  {
LABEL_80:
    if ((v7 & 0x800) == 0)
      goto LABEL_81;
    goto LABEL_183;
  }
LABEL_182:
  self->_appLaunchesAtCoarseGeoHash1ForApp = v4[11];
  *(_QWORD *)&self->_has |= 0x400uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x800) == 0)
  {
LABEL_81:
    if ((v7 & 0x1000) == 0)
      goto LABEL_82;
    goto LABEL_184;
  }
LABEL_183:
  self->_appLaunchesAtCoarseGeoHash2ForApp = v4[12];
  *(_QWORD *)&self->_has |= 0x800uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x1000) == 0)
  {
LABEL_82:
    if ((v7 & 0x2000) == 0)
      goto LABEL_83;
    goto LABEL_185;
  }
LABEL_184:
  self->_appLaunchesAtCoarseGeoHash3ForApp = v4[13];
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x2000) == 0)
  {
LABEL_83:
    if ((v7 & 0x4000) == 0)
      goto LABEL_84;
    goto LABEL_186;
  }
LABEL_185:
  self->_appLaunchesAtCoarseGeoHash4ForApp = v4[14];
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x4000) == 0)
  {
LABEL_84:
    if ((v7 & 0x8000) == 0)
      goto LABEL_85;
    goto LABEL_187;
  }
LABEL_186:
  self->_appLaunchesAtCoarseGeoHash5ForApp = v4[15];
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x8000) == 0)
  {
LABEL_85:
    if ((v7 & 0x10000) == 0)
      goto LABEL_86;
    goto LABEL_188;
  }
LABEL_187:
  self->_appLaunchesAtCoarseGeoHash6ForApp = v4[16];
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x10000) == 0)
  {
LABEL_86:
    if ((v7 & 0x20000) == 0)
      goto LABEL_87;
    goto LABEL_189;
  }
LABEL_188:
  self->_appLaunchesAtCoarseGeoHash7ForApp = v4[17];
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x20000) == 0)
  {
LABEL_87:
    if ((v7 & 0x40000) == 0)
      goto LABEL_88;
    goto LABEL_190;
  }
LABEL_189:
  self->_appLaunchesAtCoarseGeoHash8ForApp = v4[18];
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x40000) == 0)
  {
LABEL_88:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_89;
    goto LABEL_191;
  }
LABEL_190:
  self->_appLaunchesAtCoarseGeoHash9ForApp = v4[19];
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_89:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_90;
    goto LABEL_192;
  }
LABEL_191:
  self->_appLaunchesAtSpecificGeoHash0ForApp = v4[27];
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_91;
    goto LABEL_193;
  }
LABEL_192:
  self->_appLaunchesAtSpecificGeoHash1ForApp = v4[33];
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_92;
    goto LABEL_194;
  }
LABEL_193:
  self->_appLaunchesAtSpecificGeoHash2ForApp = v4[34];
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x800000000) == 0)
      goto LABEL_93;
    goto LABEL_195;
  }
LABEL_194:
  self->_appLaunchesAtSpecificGeoHash3ForApp = v4[35];
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x800000000) == 0)
  {
LABEL_93:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_94;
    goto LABEL_196;
  }
LABEL_195:
  self->_appLaunchesAtSpecificGeoHash4ForApp = v4[36];
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_94:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_95;
    goto LABEL_197;
  }
LABEL_196:
  self->_appLaunchesAtSpecificGeoHash5ForApp = v4[37];
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_95:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_96;
    goto LABEL_198;
  }
LABEL_197:
  self->_appLaunchesAtSpecificGeoHash6ForApp = v4[38];
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x4000000000) == 0)
  {
LABEL_96:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_97;
    goto LABEL_199;
  }
LABEL_198:
  self->_appLaunchesAtSpecificGeoHash7ForApp = v4[39];
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x8000000000) == 0)
  {
LABEL_97:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_98;
    goto LABEL_200;
  }
LABEL_199:
  self->_appLaunchesAtSpecificGeoHash8ForApp = v4[40];
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_98:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_99;
    goto LABEL_201;
  }
LABEL_200:
  self->_appLaunchesAtSpecificGeoHash9ForApp = v4[41];
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_99:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_100;
    goto LABEL_202;
  }
LABEL_201:
  self->_appLaunchesAtSpecificGeoHash10ForApp = v4[28];
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_101;
    goto LABEL_203;
  }
LABEL_202:
  self->_appLaunchesAtSpecificGeoHash11ForApp = v4[29];
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v7 = *((_QWORD *)v4 + 146);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_203:
  self->_appLaunchesAtSpecificGeoHash12ForApp = v4[30];
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  if (((_QWORD)v4[146] & 0x40000000) != 0)
  {
LABEL_102:
    self->_appLaunchesAtSpecificGeoHash13ForApp = v4[31];
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_103:
  v9 = *((_QWORD *)v4 + 146);
  if ((v9 & 0x80000000) != 0)
  {
    self->_appLaunchesAtSpecificGeoHash14ForApp = v4[32];
    *(_QWORD *)&self->_has |= 0x80000000uLL;
    v10 = *((_WORD *)v4 + 592);
    v9 = *((_QWORD *)v4 + 146);
    v11 = *((_QWORD *)v4 + 147);
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_207;
    goto LABEL_206;
  }
  v10 = *((_WORD *)v4 + 592);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x100000000000) != 0)
  {
LABEL_206:
    self->_appNumberOfSpecificGeohashesForApp = v4[109];
    *((_QWORD *)&self->_has + 1) |= 0x100000000000uLL;
    v10 = *((_WORD *)v4 + 592);
    v9 = *((_QWORD *)v4 + 146);
    v11 = *((_QWORD *)v4 + 147);
  }
LABEL_207:
  if ((v11 & 0x80000000000) != 0)
  {
    self->_appNumberOfCoarseGeohashesForApp = v4[108];
    *((_QWORD *)&self->_has + 1) |= 0x80000000000uLL;
    v10 = *((_WORD *)v4 + 592);
    v9 = *((_QWORD *)v4 + 146);
    v11 = *((_QWORD *)v4 + 147);
    if ((v9 & 0x40) == 0)
    {
LABEL_209:
      if ((v9 & 0x20) == 0)
        goto LABEL_210;
      goto LABEL_254;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_209;
  }
  self->_appEntropyForTimeBuckets = v4[7];
  *(_QWORD *)&self->_has |= 0x40uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x20) == 0)
  {
LABEL_210:
    if ((v9 & 0x10) == 0)
      goto LABEL_211;
    goto LABEL_255;
  }
LABEL_254:
  self->_appEntropyForSpecificGeoHash = v4[6];
  *(_QWORD *)&self->_has |= 0x20uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x10) == 0)
  {
LABEL_211:
    if ((v9 & 0x40000000000) == 0)
      goto LABEL_212;
    goto LABEL_256;
  }
LABEL_255:
  self->_appEntropyForCoarseGeoHash = v4[5];
  *(_QWORD *)&self->_has |= 0x10uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x40000000000) == 0)
  {
LABEL_212:
    if ((v9 & 0x100000) == 0)
      goto LABEL_213;
    goto LABEL_257;
  }
LABEL_256:
  self->_appLaunchesAtSpecificGeoHashForAppInContext = v4[43];
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x100000) == 0)
  {
LABEL_213:
    if ((v9 & 0x400000) == 0)
      goto LABEL_214;
    goto LABEL_258;
  }
LABEL_257:
  self->_appLaunchesAtCoarseGeoHashForAppInContext = v4[21];
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x400000) == 0)
  {
LABEL_214:
    if ((v9 & 0x200000000000) == 0)
      goto LABEL_215;
    goto LABEL_259;
  }
LABEL_258:
  self->_appLaunchesAtDayOfWeekForApp = v4[23];
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x200000000000) == 0)
  {
LABEL_215:
    if ((v9 & 0x400000000000) == 0)
      goto LABEL_216;
    goto LABEL_260;
  }
LABEL_259:
  self->_appLaunchesAtTimeAndDayForAppInContext = v4[46];
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x400000000000) == 0)
  {
LABEL_216:
    if ((v9 & 0x100000000000) == 0)
      goto LABEL_217;
    goto LABEL_261;
  }
LABEL_260:
  self->_appLaunchesAtTimeAndDayInContext = v4[47];
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x100000000000) == 0)
  {
LABEL_217:
    if ((v9 & 0x200000) == 0)
      goto LABEL_218;
    goto LABEL_262;
  }
LABEL_261:
  self->_appLaunchesAtTimeAndDayForApp = v4[45];
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x200000) == 0)
  {
LABEL_218:
    if ((v9 & 0x80000) == 0)
      goto LABEL_219;
    goto LABEL_263;
  }
LABEL_262:
  self->_appLaunchesAtCoarseGeoHashInContext = v4[22];
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x80000) == 0)
  {
LABEL_219:
    if ((v9 & 0x80000000000) == 0)
      goto LABEL_220;
    goto LABEL_264;
  }
LABEL_263:
  self->_appLaunchesAtCoarseGeoHashForApp = v4[20];
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x80000000000) == 0)
  {
LABEL_220:
    if ((v9 & 0x20000000000) == 0)
      goto LABEL_221;
    goto LABEL_265;
  }
LABEL_264:
  self->_appLaunchesAtSpecificGeoHashInContext = v4[44];
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x20000000000) == 0)
  {
LABEL_221:
    if ((v11 & 1) == 0)
      goto LABEL_222;
    goto LABEL_266;
  }
LABEL_265:
  self->_appLaunchesAtSpecificGeoHashForApp = v4[42];
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 1) == 0)
  {
LABEL_222:
    if ((v11 & 2) == 0)
      goto LABEL_223;
    goto LABEL_267;
  }
LABEL_266:
  self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate = v4[65];
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 2) == 0)
  {
LABEL_223:
    if ((v10 & 2) == 0)
      goto LABEL_224;
    goto LABEL_268;
  }
LABEL_267:
  self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate = v4[66];
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v10 & 2) == 0)
  {
LABEL_224:
    if ((v11 & 0x40000000) == 0)
      goto LABEL_225;
    goto LABEL_269;
  }
LABEL_268:
  self->_isLocationServicesDisabled = v4[130];
  v26 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 2u;
  *((_BYTE *)&self->_has + 18) = v26;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_225:
    if ((v11 & 0x80000000) == 0)
      goto LABEL_226;
    goto LABEL_270;
  }
LABEL_269:
  self->_appLaunchesInTwoHourTimeBucketForAppInContext = v4[95];
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_226:
    if ((v11 & 0x20000000) == 0)
      goto LABEL_227;
    goto LABEL_271;
  }
LABEL_270:
  self->_appLaunchesInTwoHourTimeBucketInContext = v4[96];
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x20000000) == 0)
  {
LABEL_227:
    if ((v11 & 0x20000000000000) == 0)
      goto LABEL_228;
    goto LABEL_272;
  }
LABEL_271:
  self->_appLaunchesInTwoHourTimeBucketForApp = v4[94];
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_228:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_229;
    goto LABEL_273;
  }
LABEL_272:
  self->_currentTimeBucketFromZeroToTwentyFour = v4[118];
  *((_QWORD *)&self->_has + 1) |= 0x20000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x400000000000000) == 0)
  {
LABEL_229:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_230;
    goto LABEL_274;
  }
LABEL_273:
  self->_appLaunchesAtZoom7GeoHashForAppInContext = v4[59];
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x800000000000000) == 0)
  {
LABEL_230:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_231;
    goto LABEL_275;
  }
LABEL_274:
  self->_appLaunchesAtZoom7GeoHashInContext = v4[60];
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x200000000000000) == 0)
  {
LABEL_231:
    if ((v9 & 0x800000000000) == 0)
      goto LABEL_232;
    goto LABEL_276;
  }
LABEL_275:
  self->_appLaunchesAtZoom7GeoHashForApp = v4[58];
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x800000000000) == 0)
  {
LABEL_232:
    if ((v9 & 0x1000000000000) == 0)
      goto LABEL_233;
    goto LABEL_277;
  }
LABEL_276:
  self->_appLaunchesAtZoom7GeoHash0ForApp = v4[48];
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x1000000000000) == 0)
  {
LABEL_233:
    if ((v9 & 0x2000000000000) == 0)
      goto LABEL_234;
    goto LABEL_278;
  }
LABEL_277:
  self->_appLaunchesAtZoom7GeoHash1ForApp = v4[49];
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x2000000000000) == 0)
  {
LABEL_234:
    if ((v9 & 0x4000000000000) == 0)
      goto LABEL_235;
    goto LABEL_279;
  }
LABEL_278:
  self->_appLaunchesAtZoom7GeoHash2ForApp = v4[50];
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x4000000000000) == 0)
  {
LABEL_235:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_236;
    goto LABEL_280;
  }
LABEL_279:
  self->_appLaunchesAtZoom7GeoHash3ForApp = v4[51];
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x8000000000000) == 0)
  {
LABEL_236:
    if ((v9 & 0x10000000000000) == 0)
      goto LABEL_237;
    goto LABEL_281;
  }
LABEL_280:
  self->_appLaunchesAtZoom7GeoHash4ForApp = v4[52];
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x10000000000000) == 0)
  {
LABEL_237:
    if ((v9 & 0x20000000000000) == 0)
      goto LABEL_238;
    goto LABEL_282;
  }
LABEL_281:
  self->_appLaunchesAtZoom7GeoHash5ForApp = v4[53];
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x20000000000000) == 0)
  {
LABEL_238:
    if ((v9 & 0x40000000000000) == 0)
      goto LABEL_239;
    goto LABEL_283;
  }
LABEL_282:
  self->_appLaunchesAtZoom7GeoHash6ForApp = v4[54];
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x40000000000000) == 0)
  {
LABEL_239:
    if ((v9 & 0x80000000000000) == 0)
      goto LABEL_240;
    goto LABEL_284;
  }
LABEL_283:
  self->_appLaunchesAtZoom7GeoHash7ForApp = v4[55];
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_240:
    if ((v9 & 0x100000000000000) == 0)
      goto LABEL_241;
    goto LABEL_285;
  }
LABEL_284:
  self->_appLaunchesAtZoom7GeoHash8ForApp = v4[56];
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x100000000000000) == 0)
  {
LABEL_241:
    if ((v9 & 0x80) == 0)
      goto LABEL_242;
    goto LABEL_286;
  }
LABEL_285:
  self->_appLaunchesAtZoom7GeoHash9ForApp = v4[57];
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x80) == 0)
  {
LABEL_242:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_243;
    goto LABEL_287;
  }
LABEL_286:
  self->_appEntropyForZoom7GeoHash = v4[8];
  *(_QWORD *)&self->_has |= 0x80uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_243:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_244;
    goto LABEL_288;
  }
LABEL_287:
  self->_appNumberOfZoom7GeohashesForApp = v4[110];
  *((_QWORD *)&self->_has + 1) |= 0x200000000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_244:
    if ((v9 & 0x1000000) == 0)
      goto LABEL_245;
    goto LABEL_289;
  }
LABEL_288:
  self->_appLaunchesAtSSIDForAppInContext = v4[26];
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_245:
    if ((v11 & 4) == 0)
      goto LABEL_246;
    goto LABEL_290;
  }
LABEL_289:
  self->_appLaunchesAtSSIDForApp = v4[25];
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  v11 = *((_QWORD *)v4 + 147);
  if ((v11 & 4) == 0)
  {
LABEL_246:
    if ((v11 & 8) == 0)
      goto LABEL_247;
    goto LABEL_291;
  }
LABEL_290:
  self->_appLaunchesForCoreMotionForAppInContext = v4[67];
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  v10 = *((_WORD *)v4 + 592);
  v9 = *((_QWORD *)v4 + 146);
  if (((_QWORD)v4[147] & 8) == 0)
  {
LABEL_247:
    if ((v10 & 0x40) == 0)
      goto LABEL_248;
    goto LABEL_292;
  }
LABEL_291:
  self->_appLaunchesInAirplaneModeForAppInContext = v4[68];
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  v9 = *((_QWORD *)v4 + 146);
  if (((_WORD)v4[148] & 0x40) == 0)
  {
LABEL_248:
    if ((v9 & 0x100) == 0)
      goto LABEL_249;
LABEL_293:
    self->_appLaunchPopularityAtPOIForAppInContext = v4[9];
    *(_QWORD *)&self->_has |= 0x100uLL;
    if (((_QWORD)v4[146] & 0x800000) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_292:
  self->_poiPopularityForAppInContext = v4[135];
  v27 = *((_BYTE *)&self->_has + 18);
  *((_WORD *)&self->_has + 8) |= 0x40u;
  *((_BYTE *)&self->_has + 18) = v27;
  v9 = *((_QWORD *)v4 + 146);
  if ((v9 & 0x100) != 0)
    goto LABEL_293;
LABEL_249:
  if ((v9 & 0x800000) != 0)
  {
LABEL_250:
    self->_appLaunchesAtPOIForAppInContext = v4[24];
    *(_QWORD *)&self->_has |= 0x800000uLL;
  }
LABEL_251:

}

- (double)unlockTime
{
  return self->_unlockTime;
}

- (double)launchTimePopularity
{
  return self->_launchTimePopularity;
}

- (double)timeOfDayBucket
{
  return self->_timeOfDayBucket;
}

- (double)timeOfDayPopularity
{
  return self->_timeOfDayPopularity;
}

- (double)coarseTimeOfDayPopularity
{
  return self->_coarseTimeOfDayPopularity;
}

- (double)launchPopularity
{
  return self->_launchPopularity;
}

- (double)launchDayOfWeekPopularity
{
  return self->_launchDayOfWeekPopularity;
}

- (double)dayOfWeekBucket
{
  return self->_dayOfWeekBucket;
}

- (double)dayOfWeekPopularity
{
  return self->_dayOfWeekPopularity;
}

- (double)entropyLaunchPopularity
{
  return self->_entropyLaunchPopularity;
}

- (double)entropyDayOfWeekPopularity
{
  return self->_entropyDayOfWeekPopularity;
}

- (double)entropyDayOfWeekPopularityByDay
{
  return self->_entropyDayOfWeekPopularityByDay;
}

- (double)entropyDayOfWeekPopularityByApp
{
  return self->_entropyDayOfWeekPopularityByApp;
}

- (double)entropyTrendingPopularity
{
  return self->_entropyTrendingPopularity;
}

- (double)entropySSIDPopularity
{
  return self->_entropySSIDPopularity;
}

- (double)entropySSIDPopularityBySSID
{
  return self->_entropySSIDPopularityBySSID;
}

- (double)entropySSIDPopularityByApp
{
  return self->_entropySSIDPopularityByApp;
}

- (double)totalNumberOfLaunches
{
  return self->_totalNumberOfLaunches;
}

- (double)airplaneModePopularity
{
  return self->_airplaneModePopularity;
}

- (double)totalNumberOfAirplaneModeLaunches
{
  return self->_totalNumberOfAirplaneModeLaunches;
}

- (double)trendingPopularity
{
  return self->_trendingPopularity;
}

- (double)totalNumberOfTrendingLaunches
{
  return self->_totalNumberOfTrendingLaunches;
}

- (double)sSIDPopularity
{
  return self->_sSIDPopularity;
}

- (double)totalNumberOfSSIDLaunches
{
  return self->_totalNumberOfSSIDLaunches;
}

- (double)onWifi
{
  return self->_onWifi;
}

- (double)coreMotionPopularity
{
  return self->_coreMotionPopularity;
}

- (double)totalNumberOfCoreMotionLaunches
{
  return self->_totalNumberOfCoreMotionLaunches;
}

- (double)isDateInWeekendOnDevice
{
  return self->_isDateInWeekendOnDevice;
}

- (double)ambientLightTypePopularity
{
  return self->_ambientLightTypePopularity;
}

- (double)ambientLightTypeLaunchPopularity
{
  return self->_ambientLightTypeLaunchPopularity;
}

- (double)appTimeOfDayLaunches
{
  return self->_appTimeOfDayLaunches;
}

- (double)appDayOfWeekLaunches
{
  return self->_appDayOfWeekLaunches;
}

- (double)appTimeAndDayOfWeekPopularity
{
  return self->_appTimeAndDayOfWeekPopularity;
}

- (double)appPopularityGivenTimeAndDayOfWeek
{
  return self->_appPopularityGivenTimeAndDayOfWeek;
}

- (double)appPopularityOfTimeAndDayOfWeekGivenApp
{
  return self->_appPopularityOfTimeAndDayOfWeekGivenApp;
}

- (double)appTotalNumberOfTimeAndDayOfWeekLaunches
{
  return self->_appTotalNumberOfTimeAndDayOfWeekLaunches;
}

- (double)appLaunchesCoarseTimePowLocationForAppInContext
{
  return self->_appLaunchesCoarseTimePowLocationForAppInContext;
}

- (double)appLaunchesCoarseTimePowLocationInContext
{
  return self->_appLaunchesCoarseTimePowLocationInContext;
}

- (double)appLaunchesCoarseTimePowLocationForApp
{
  return self->_appLaunchesCoarseTimePowLocationForApp;
}

- (double)appLaunchesCoarseTimePowLocationForAllAppsAndContexts
{
  return self->_appLaunchesCoarseTimePowLocationForAllAppsAndContexts;
}

- (double)appLaunchesSpecificTimeDowLocationForAppInContext
{
  return self->_appLaunchesSpecificTimeDowLocationForAppInContext;
}

- (double)appLaunchesSpecificTimeDowLocationInContext
{
  return self->_appLaunchesSpecificTimeDowLocationInContext;
}

- (double)appLaunchesSpecificTimeDowLocationForApp
{
  return self->_appLaunchesSpecificTimeDowLocationForApp;
}

- (double)appLaunchesSpecificTimeDowLocationForAllAppsAndContexts
{
  return self->_appLaunchesSpecificTimeDowLocationForAllAppsAndContexts;
}

- (double)appLaunchesInTimeBucket0ForApp
{
  return self->_appLaunchesInTimeBucket0ForApp;
}

- (double)appLaunchesInTimeBucket1ForApp
{
  return self->_appLaunchesInTimeBucket1ForApp;
}

- (double)appLaunchesInTimeBucket2ForApp
{
  return self->_appLaunchesInTimeBucket2ForApp;
}

- (double)appLaunchesInTimeBucket3ForApp
{
  return self->_appLaunchesInTimeBucket3ForApp;
}

- (double)appLaunchesInTimeBucket4ForApp
{
  return self->_appLaunchesInTimeBucket4ForApp;
}

- (double)appLaunchesInTimeBucket5ForApp
{
  return self->_appLaunchesInTimeBucket5ForApp;
}

- (double)appLaunchesInTimeBucket6ForApp
{
  return self->_appLaunchesInTimeBucket6ForApp;
}

- (double)appLaunchesInTimeBucket7ForApp
{
  return self->_appLaunchesInTimeBucket7ForApp;
}

- (double)appLaunchesInTimeBucket8ForApp
{
  return self->_appLaunchesInTimeBucket8ForApp;
}

- (double)appLaunchesInTimeBucket9ForApp
{
  return self->_appLaunchesInTimeBucket9ForApp;
}

- (double)appLaunchesInTimeBucket10ForApp
{
  return self->_appLaunchesInTimeBucket10ForApp;
}

- (double)appLaunchesInTimeBucket11ForApp
{
  return self->_appLaunchesInTimeBucket11ForApp;
}

- (double)appLaunchesInTimeBucket12ForApp
{
  return self->_appLaunchesInTimeBucket12ForApp;
}

- (double)appLaunchesInTimeBucket13ForApp
{
  return self->_appLaunchesInTimeBucket13ForApp;
}

- (double)appLaunchesInTimeBucket14ForApp
{
  return self->_appLaunchesInTimeBucket14ForApp;
}

- (double)appLaunchesInTimeBucket15ForApp
{
  return self->_appLaunchesInTimeBucket15ForApp;
}

- (double)appLaunchesInTimeBucket16ForApp
{
  return self->_appLaunchesInTimeBucket16ForApp;
}

- (double)appLaunchesInTimeBucket17ForApp
{
  return self->_appLaunchesInTimeBucket17ForApp;
}

- (double)appLaunchesInTimeBucket18ForApp
{
  return self->_appLaunchesInTimeBucket18ForApp;
}

- (double)appLaunchesInTimeBucket19ForApp
{
  return self->_appLaunchesInTimeBucket19ForApp;
}

- (double)appLaunchesInTimeBucket20ForApp
{
  return self->_appLaunchesInTimeBucket20ForApp;
}

- (double)appLaunchesInTimeBucket21ForApp
{
  return self->_appLaunchesInTimeBucket21ForApp;
}

- (double)appLaunchesInTimeBucket22ForApp
{
  return self->_appLaunchesInTimeBucket22ForApp;
}

- (double)appLaunchesInTimeBucket23ForApp
{
  return self->_appLaunchesInTimeBucket23ForApp;
}

- (double)appLaunchesInTimeBucket24ForApp
{
  return self->_appLaunchesInTimeBucket24ForApp;
}

- (double)appLaunchesOnDayOfWeekSundayForApp
{
  return self->_appLaunchesOnDayOfWeekSundayForApp;
}

- (double)appLaunchesOnDayOfWeekMondayForApp
{
  return self->_appLaunchesOnDayOfWeekMondayForApp;
}

- (double)appLaunchesOnDayOfWeekTuesdayForApp
{
  return self->_appLaunchesOnDayOfWeekTuesdayForApp;
}

- (double)appLaunchesOnDayOfWeekWednesdayForApp
{
  return self->_appLaunchesOnDayOfWeekWednesdayForApp;
}

- (double)appLaunchesOnDayOfWeekThursdayForApp
{
  return self->_appLaunchesOnDayOfWeekThursdayForApp;
}

- (double)appLaunchesOnDayOfWeekFridayForApp
{
  return self->_appLaunchesOnDayOfWeekFridayForApp;
}

- (double)appLaunchesOnDayOfWeekSaturdayForApp
{
  return self->_appLaunchesOnDayOfWeekSaturdayForApp;
}

- (double)appLaunchesAtCoarseGeoHash0ForApp
{
  return self->_appLaunchesAtCoarseGeoHash0ForApp;
}

- (double)appLaunchesAtCoarseGeoHash1ForApp
{
  return self->_appLaunchesAtCoarseGeoHash1ForApp;
}

- (double)appLaunchesAtCoarseGeoHash2ForApp
{
  return self->_appLaunchesAtCoarseGeoHash2ForApp;
}

- (double)appLaunchesAtCoarseGeoHash3ForApp
{
  return self->_appLaunchesAtCoarseGeoHash3ForApp;
}

- (double)appLaunchesAtCoarseGeoHash4ForApp
{
  return self->_appLaunchesAtCoarseGeoHash4ForApp;
}

- (double)appLaunchesAtCoarseGeoHash5ForApp
{
  return self->_appLaunchesAtCoarseGeoHash5ForApp;
}

- (double)appLaunchesAtCoarseGeoHash6ForApp
{
  return self->_appLaunchesAtCoarseGeoHash6ForApp;
}

- (double)appLaunchesAtCoarseGeoHash7ForApp
{
  return self->_appLaunchesAtCoarseGeoHash7ForApp;
}

- (double)appLaunchesAtCoarseGeoHash8ForApp
{
  return self->_appLaunchesAtCoarseGeoHash8ForApp;
}

- (double)appLaunchesAtCoarseGeoHash9ForApp
{
  return self->_appLaunchesAtCoarseGeoHash9ForApp;
}

- (double)appLaunchesAtSpecificGeoHash0ForApp
{
  return self->_appLaunchesAtSpecificGeoHash0ForApp;
}

- (double)appLaunchesAtSpecificGeoHash1ForApp
{
  return self->_appLaunchesAtSpecificGeoHash1ForApp;
}

- (double)appLaunchesAtSpecificGeoHash2ForApp
{
  return self->_appLaunchesAtSpecificGeoHash2ForApp;
}

- (double)appLaunchesAtSpecificGeoHash3ForApp
{
  return self->_appLaunchesAtSpecificGeoHash3ForApp;
}

- (double)appLaunchesAtSpecificGeoHash4ForApp
{
  return self->_appLaunchesAtSpecificGeoHash4ForApp;
}

- (double)appLaunchesAtSpecificGeoHash5ForApp
{
  return self->_appLaunchesAtSpecificGeoHash5ForApp;
}

- (double)appLaunchesAtSpecificGeoHash6ForApp
{
  return self->_appLaunchesAtSpecificGeoHash6ForApp;
}

- (double)appLaunchesAtSpecificGeoHash7ForApp
{
  return self->_appLaunchesAtSpecificGeoHash7ForApp;
}

- (double)appLaunchesAtSpecificGeoHash8ForApp
{
  return self->_appLaunchesAtSpecificGeoHash8ForApp;
}

- (double)appLaunchesAtSpecificGeoHash9ForApp
{
  return self->_appLaunchesAtSpecificGeoHash9ForApp;
}

- (double)appLaunchesAtSpecificGeoHash10ForApp
{
  return self->_appLaunchesAtSpecificGeoHash10ForApp;
}

- (double)appLaunchesAtSpecificGeoHash11ForApp
{
  return self->_appLaunchesAtSpecificGeoHash11ForApp;
}

- (double)appLaunchesAtSpecificGeoHash12ForApp
{
  return self->_appLaunchesAtSpecificGeoHash12ForApp;
}

- (double)appLaunchesAtSpecificGeoHash13ForApp
{
  return self->_appLaunchesAtSpecificGeoHash13ForApp;
}

- (double)appLaunchesAtSpecificGeoHash14ForApp
{
  return self->_appLaunchesAtSpecificGeoHash14ForApp;
}

- (double)appNumberOfSpecificGeohashesForApp
{
  return self->_appNumberOfSpecificGeohashesForApp;
}

- (double)appNumberOfCoarseGeohashesForApp
{
  return self->_appNumberOfCoarseGeohashesForApp;
}

- (double)appEntropyForTimeBuckets
{
  return self->_appEntropyForTimeBuckets;
}

- (double)appEntropyForSpecificGeoHash
{
  return self->_appEntropyForSpecificGeoHash;
}

- (double)appEntropyForCoarseGeoHash
{
  return self->_appEntropyForCoarseGeoHash;
}

- (double)appLaunchesAtSpecificGeoHashForAppInContext
{
  return self->_appLaunchesAtSpecificGeoHashForAppInContext;
}

- (double)appLaunchesAtCoarseGeoHashForAppInContext
{
  return self->_appLaunchesAtCoarseGeoHashForAppInContext;
}

- (double)appLaunchesAtDayOfWeekForApp
{
  return self->_appLaunchesAtDayOfWeekForApp;
}

- (double)appLaunchesAtTimeAndDayForAppInContext
{
  return self->_appLaunchesAtTimeAndDayForAppInContext;
}

- (double)appLaunchesAtTimeAndDayInContext
{
  return self->_appLaunchesAtTimeAndDayInContext;
}

- (double)appLaunchesAtTimeAndDayForApp
{
  return self->_appLaunchesAtTimeAndDayForApp;
}

- (double)appLaunchesAtCoarseGeoHashInContext
{
  return self->_appLaunchesAtCoarseGeoHashInContext;
}

- (double)appLaunchesAtCoarseGeoHashForApp
{
  return self->_appLaunchesAtCoarseGeoHashForApp;
}

- (double)appLaunchesAtSpecificGeoHashInContext
{
  return self->_appLaunchesAtSpecificGeoHashInContext;
}

- (double)appLaunchesAtSpecificGeoHashForApp
{
  return self->_appLaunchesAtSpecificGeoHashForApp;
}

- (double)appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate
{
  return self->_appLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate;
}

- (double)appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate
{
  return self->_appLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate;
}

- (double)isLocationServicesDisabled
{
  return self->_isLocationServicesDisabled;
}

- (double)appLaunchesInTwoHourTimeBucketForAppInContext
{
  return self->_appLaunchesInTwoHourTimeBucketForAppInContext;
}

- (double)appLaunchesInTwoHourTimeBucketInContext
{
  return self->_appLaunchesInTwoHourTimeBucketInContext;
}

- (double)appLaunchesInTwoHourTimeBucketForApp
{
  return self->_appLaunchesInTwoHourTimeBucketForApp;
}

- (double)currentTimeBucketFromZeroToTwentyFour
{
  return self->_currentTimeBucketFromZeroToTwentyFour;
}

- (double)appLaunchesAtZoom7GeoHashForAppInContext
{
  return self->_appLaunchesAtZoom7GeoHashForAppInContext;
}

- (double)appLaunchesAtZoom7GeoHashInContext
{
  return self->_appLaunchesAtZoom7GeoHashInContext;
}

- (double)appLaunchesAtZoom7GeoHashForApp
{
  return self->_appLaunchesAtZoom7GeoHashForApp;
}

- (double)appLaunchesAtZoom7GeoHash0ForApp
{
  return self->_appLaunchesAtZoom7GeoHash0ForApp;
}

- (double)appLaunchesAtZoom7GeoHash1ForApp
{
  return self->_appLaunchesAtZoom7GeoHash1ForApp;
}

- (double)appLaunchesAtZoom7GeoHash2ForApp
{
  return self->_appLaunchesAtZoom7GeoHash2ForApp;
}

- (double)appLaunchesAtZoom7GeoHash3ForApp
{
  return self->_appLaunchesAtZoom7GeoHash3ForApp;
}

- (double)appLaunchesAtZoom7GeoHash4ForApp
{
  return self->_appLaunchesAtZoom7GeoHash4ForApp;
}

- (double)appLaunchesAtZoom7GeoHash5ForApp
{
  return self->_appLaunchesAtZoom7GeoHash5ForApp;
}

- (double)appLaunchesAtZoom7GeoHash6ForApp
{
  return self->_appLaunchesAtZoom7GeoHash6ForApp;
}

- (double)appLaunchesAtZoom7GeoHash7ForApp
{
  return self->_appLaunchesAtZoom7GeoHash7ForApp;
}

- (double)appLaunchesAtZoom7GeoHash8ForApp
{
  return self->_appLaunchesAtZoom7GeoHash8ForApp;
}

- (double)appLaunchesAtZoom7GeoHash9ForApp
{
  return self->_appLaunchesAtZoom7GeoHash9ForApp;
}

- (double)appEntropyForZoom7GeoHash
{
  return self->_appEntropyForZoom7GeoHash;
}

- (double)appNumberOfZoom7GeohashesForApp
{
  return self->_appNumberOfZoom7GeohashesForApp;
}

- (double)appLaunchesAtSSIDForAppInContext
{
  return self->_appLaunchesAtSSIDForAppInContext;
}

- (double)appLaunchesAtSSIDForApp
{
  return self->_appLaunchesAtSSIDForApp;
}

- (double)appLaunchesForCoreMotionForAppInContext
{
  return self->_appLaunchesForCoreMotionForAppInContext;
}

- (double)appLaunchesInAirplaneModeForAppInContext
{
  return self->_appLaunchesInAirplaneModeForAppInContext;
}

- (double)poiPopularityForAppInContext
{
  return self->_poiPopularityForAppInContext;
}

- (double)appLaunchPopularityAtPOIForAppInContext
{
  return self->_appLaunchPopularityAtPOIForAppInContext;
}

- (double)appLaunchesAtPOIForAppInContext
{
  return self->_appLaunchesAtPOIForAppInContext;
}

@end
