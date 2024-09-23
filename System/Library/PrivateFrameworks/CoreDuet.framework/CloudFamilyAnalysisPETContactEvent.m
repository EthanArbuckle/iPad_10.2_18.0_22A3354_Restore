@implementation CloudFamilyAnalysisPETContactEvent

- (void)setFirstPartyMsgTotal:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
  self->_firstPartyMsgTotal = a3;
}

- (void)setHasFirstPartyMsgTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgTotal
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 5) & 1;
}

- (void)setFirstPartyMsgDayRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_firstPartyMsgDayRatio = a3;
}

- (void)setHasFirstPartyMsgDayRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgDayRatio
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setFirstPartyMsgOutgoingRatio:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  self->_firstPartyMsgOutgoingRatio = a3;
}

- (void)setHasFirstPartyMsgOutgoingRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasFirstPartyMsgOutgoingRatio
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 3) & 1;
}

- (void)setFirstPartyMsgMorningWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  self->_firstPartyMsgMorningWeekday = a3;
}

- (void)setHasFirstPartyMsgMorningWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setFirstPartyMsgMorningFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_firstPartyMsgMorningFri = a3;
}

- (void)setHasFirstPartyMsgMorningFri:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasFirstPartyMsgMorningFri
{
  return *((unsigned __int8 *)&self->_has + 7) >> 7;
}

- (void)setFirstPartyMsgMorningSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  self->_firstPartyMsgMorningSat = a3;
}

- (void)setHasFirstPartyMsgMorningSat:(BOOL)a3
{
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasFirstPartyMsgMorningSat
{
  return *((_BYTE *)&self->_has + 8) & 1;
}

- (void)setFirstPartyMsgMorningSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  self->_firstPartyMsgMorningSun = a3;
}

- (void)setHasFirstPartyMsgMorningSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setFirstPartyMsgNoonWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  self->_firstPartyMsgNoonWeekday = a3;
}

- (void)setHasFirstPartyMsgNoonWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 2) & 1;
}

- (void)setFirstPartyMsgNoonFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  self->_firstPartyMsgNoonFri = a3;
}

- (void)setHasFirstPartyMsgNoonFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonFri
{
  return *((unsigned __int8 *)&self->_has + 8) >> 7;
}

- (void)setFirstPartyMsgNoonSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  self->_firstPartyMsgNoonSat = a3;
}

- (void)setHasFirstPartyMsgNoonSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonSat
{
  return *((_BYTE *)&self->_has + 9) & 1;
}

- (void)setFirstPartyMsgNoonSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  self->_firstPartyMsgNoonSun = a3;
}

- (void)setHasFirstPartyMsgNoonSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 1) & 1;
}

- (void)setFirstPartyMsgEveWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_firstPartyMsgEveWeekday = a3;
}

- (void)setHasFirstPartyMsgEveWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (void)setFirstPartyMsgEveFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_firstPartyMsgEveFri = a3;
}

- (void)setHasFirstPartyMsgEveFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveFri
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setFirstPartyMsgEveSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_firstPartyMsgEveSat = a3;
}

- (void)setHasFirstPartyMsgEveSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveSat
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setFirstPartyMsgEveSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_firstPartyMsgEveSun = a3;
}

- (void)setHasFirstPartyMsgEveSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveSun
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setFirstPartyMsgNightWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  self->_firstPartyMsgNightWeekday = a3;
}

- (void)setHasFirstPartyMsgNightWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasFirstPartyMsgNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setFirstPartyMsgNightFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  self->_firstPartyMsgNightFri = a3;
}

- (void)setHasFirstPartyMsgNightFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasFirstPartyMsgNightFri
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setFirstPartyMsgNightSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  self->_firstPartyMsgNightSat = a3;
}

- (void)setHasFirstPartyMsgNightSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasFirstPartyMsgNightSat
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setFirstPartyMsgNightSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  self->_firstPartyMsgNightSun = a3;
}

- (void)setHasFirstPartyMsgNightSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasFirstPartyMsgNightSun
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setFirstPartyMsgTwoWeeks:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  self->_firstPartyMsgTwoWeeks = a3;
}

- (void)setHasFirstPartyMsgTwoWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgTwoWeeks
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 6) & 1;
}

- (void)setFirstPartyMsgSixWeeks:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  self->_firstPartyMsgSixWeeks = a3;
}

- (void)setHasFirstPartyMsgSixWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgSixWeeks
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 4) & 1;
}

- (void)setThirdPartyMsgTotal:(unint64_t)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  self->_thirdPartyMsgTotal = a3;
}

- (void)setHasThirdPartyMsgTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgTotal
{
  return *((_BYTE *)&self->_has + 12) & 1;
}

- (void)setThirdPartyMsgDayRatio:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
  self->_thirdPartyMsgDayRatio = a3;
}

- (void)setHasThirdPartyMsgDayRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasThirdPartyMsgDayRatio
{
  return *((unsigned __int8 *)&self->_has + 9) >> 7;
}

- (void)setThirdPartyMsgMorningWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  self->_thirdPartyMsgMorningWeekday = a3;
}

- (void)setHasThirdPartyMsgMorningWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningWeekday
{
  return *((unsigned __int8 *)&self->_has + 10) >> 7;
}

- (void)setThirdPartyMsgMorningFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  self->_thirdPartyMsgMorningFri = a3;
}

- (void)setHasThirdPartyMsgMorningFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningFri
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 4) & 1;
}

- (void)setThirdPartyMsgMorningSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  self->_thirdPartyMsgMorningSat = a3;
}

- (void)setHasThirdPartyMsgMorningSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 5) & 1;
}

- (void)setThirdPartyMsgMorningSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  self->_thirdPartyMsgMorningSun = a3;
}

- (void)setHasThirdPartyMsgMorningSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 6) & 1;
}

- (void)setThirdPartyMsgNoonWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  self->_thirdPartyMsgNoonWeekday = a3;
}

- (void)setHasThirdPartyMsgNoonWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonWeekday
{
  return *((unsigned __int8 *)&self->_has + 11) >> 7;
}

- (void)setThirdPartyMsgNoonFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  self->_thirdPartyMsgNoonFri = a3;
}

- (void)setHasThirdPartyMsgNoonFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 4) & 1;
}

- (void)setThirdPartyMsgNoonSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  self->_thirdPartyMsgNoonSat = a3;
}

- (void)setHasThirdPartyMsgNoonSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 5) & 1;
}

- (void)setThirdPartyMsgNoonSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  self->_thirdPartyMsgNoonSun = a3;
}

- (void)setHasThirdPartyMsgNoonSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 6) & 1;
}

- (void)setThirdPartyMsgEveWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  self->_thirdPartyMsgEveWeekday = a3;
}

- (void)setHasThirdPartyMsgEveWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 3) & 1;
}

- (void)setThirdPartyMsgEveFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  self->_thirdPartyMsgEveFri = a3;
}

- (void)setHasThirdPartyMsgEveFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveFri
{
  return *((_BYTE *)&self->_has + 10) & 1;
}

- (void)setThirdPartyMsgEveSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  self->_thirdPartyMsgEveSat = a3;
}

- (void)setHasThirdPartyMsgEveSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveSat
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 1) & 1;
}

- (void)setThirdPartyMsgEveSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  self->_thirdPartyMsgEveSun = a3;
}

- (void)setHasThirdPartyMsgEveSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveSun
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
}

- (void)setThirdPartyMsgNightWeekday:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  self->_thirdPartyMsgNightWeekday = a3;
}

- (void)setHasThirdPartyMsgNightWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 3) & 1;
}

- (void)setThirdPartyMsgNightFri:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  self->_thirdPartyMsgNightFri = a3;
}

- (void)setHasThirdPartyMsgNightFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightFri
{
  return *((_BYTE *)&self->_has + 11) & 1;
}

- (void)setThirdPartyMsgNightSat:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  self->_thirdPartyMsgNightSat = a3;
}

- (void)setHasThirdPartyMsgNightSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightSat
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 1) & 1;
}

- (void)setThirdPartyMsgNightSun:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
  self->_thirdPartyMsgNightSun = a3;
}

- (void)setHasThirdPartyMsgNightSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightSun
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 2) & 1;
}

- (void)setThirdPartyMsgTwoWeeks:(double)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  self->_thirdPartyMsgTwoWeeks = a3;
}

- (void)setHasThirdPartyMsgTwoWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgTwoWeeks
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 1) & 1;
}

- (void)setCallTotal:(unint64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_callTotal = a3;
}

- (void)setHasCallTotal:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTotal
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setCallBirthday:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  self->_callBirthday = a3;
}

- (void)setHasCallBirthday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasCallBirthday
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 2) & 1;
}

- (void)setContactFavorite:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x8000000000uLL;
  self->_contactFavorite = a3;
}

- (void)setHasContactFavorite:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasContactFavorite
{
  return *((unsigned __int8 *)&self->_has + 12) >> 7;
}

- (void)setCallTotalDur:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_callTotalDur = a3;
}

- (void)setHasCallTotalDur:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTotalDur
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setCallDayRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_callDayRatio = a3;
}

- (void)setHasCallDayRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasCallDayRatio
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCallLongRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_callLongRatio = a3;
}

- (void)setHasCallLongRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongRatio
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCallOutgoingRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_callOutgoingRatio = a3;
}

- (void)setHasCallOutgoingRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallOutgoingRatio
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setCallAvgDur:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_callAvgDur = a3;
}

- (void)setHasCallAvgDur:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasCallAvgDur
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCallMaxDur:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_callMaxDur = a3;
}

- (void)setHasCallMaxDur:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasCallMaxDur
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCallMorningWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_callMorningWeekday = a3;
}

- (void)setHasCallMorningWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setCallMorningFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_callMorningFri = a3;
}

- (void)setHasCallMorningFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningFri
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setCallMorningSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_callMorningSat = a3;
}

- (void)setHasCallMorningSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCallMorningSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_callMorningSun = a3;
}

- (void)setHasCallMorningSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCallNoonWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_callNoonWeekday = a3;
}

- (void)setHasCallNoonWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setCallNoonFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_callNoonFri = a3;
}

- (void)setHasCallNoonFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonFri
{
  return *((_BYTE *)&self->_has + 6) & 1;
}

- (void)setCallNoonSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_callNoonSat = a3;
}

- (void)setHasCallNoonSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setCallNoonSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_callNoonSun = a3;
}

- (void)setHasCallNoonSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setCallEveWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_callEveWeekday = a3;
}

- (void)setHasCallEveWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasCallEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCallEveFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_callEveFri = a3;
}

- (void)setHasCallEveFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasCallEveFri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCallEveSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_callEveSat = a3;
}

- (void)setHasCallEveSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasCallEveSat
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCallEveSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_callEveSun = a3;
}

- (void)setHasCallEveSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasCallEveSun
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCallNightWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_callNightWeekday = a3;
}

- (void)setHasCallNightWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightWeekday
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setCallNightFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_callNightFri = a3;
}

- (void)setHasCallNightFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightFri
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setCallNightSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_callNightSat = a3;
}

- (void)setHasCallNightSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightSat
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setCallNightSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_callNightSun = a3;
}

- (void)setHasCallNightSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightSun
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCallDurMorningWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_callDurMorningWeekday = a3;
}

- (void)setHasCallDurMorningWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCallDurMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCallDurMorningFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_callDurMorningFri = a3;
}

- (void)setHasCallDurMorningFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasCallDurMorningFri
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCallDurMorningSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_callDurMorningSat = a3;
}

- (void)setHasCallDurMorningSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasCallDurMorningSat
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCallDurMorningSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_callDurMorningSun = a3;
}

- (void)setHasCallDurMorningSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCallDurMorningSun
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setCallDurNoonWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_callDurNoonWeekday = a3;
}

- (void)setHasCallDurNoonWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasCallDurNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCallDurNoonFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_callDurNoonFri = a3;
}

- (void)setHasCallDurNoonFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasCallDurNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCallDurNoonSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_callDurNoonSat = a3;
}

- (void)setHasCallDurNoonSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasCallDurNoonSat
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCallDurNoonSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_callDurNoonSun = a3;
}

- (void)setHasCallDurNoonSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasCallDurNoonSun
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setCallDurEveWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_callDurEveWeekday = a3;
}

- (void)setHasCallDurEveWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasCallDurEveWeekday
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCallDurEveFri:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_callDurEveFri = a3;
}

- (void)setHasCallDurEveFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasCallDurEveFri
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCallDurEveSat:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_callDurEveSat = a3;
}

- (void)setHasCallDurEveSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasCallDurEveSat
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCallDurEveSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_callDurEveSun = a3;
}

- (void)setHasCallDurEveSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasCallDurEveSun
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCallDurNightWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_callDurNightWeekday = a3;
}

- (void)setHasCallDurNightWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasCallDurNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCallDurNightFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_callDurNightFri = a3;
}

- (void)setHasCallDurNightFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCallDurNightFri
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCallDurNightSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_callDurNightSat = a3;
}

- (void)setHasCallDurNightSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasCallDurNightSat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCallDurNightSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_callDurNightSun = a3;
}

- (void)setHasCallDurNightSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasCallDurNightSun
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCallLongMorningWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_callLongMorningWeekday = a3;
}

- (void)setHasCallLongMorningWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setCallLongMorningFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_callLongMorningFri = a3;
}

- (void)setHasCallLongMorningFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningFri
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCallLongMorningSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_callLongMorningSat = a3;
}

- (void)setHasCallLongMorningSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setCallLongMorningSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_callLongMorningSun = a3;
}

- (void)setHasCallLongMorningSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCallLongNoonWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_callLongNoonWeekday = a3;
}

- (void)setHasCallLongNoonWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCallLongNoonFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_callLongNoonFri = a3;
}

- (void)setHasCallLongNoonFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setCallLongNoonSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_callLongNoonSat = a3;
}

- (void)setHasCallLongNoonSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCallLongNoonSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_callLongNoonSun = a3;
}

- (void)setHasCallLongNoonSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCallLongEveWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_callLongEveWeekday = a3;
}

- (void)setHasCallLongEveWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasCallLongEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCallLongEveFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_callLongEveFri = a3;
}

- (void)setHasCallLongEveFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasCallLongEveFri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCallLongEveSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_callLongEveSat = a3;
}

- (void)setHasCallLongEveSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasCallLongEveSat
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setCallLongEveSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_callLongEveSun = a3;
}

- (void)setHasCallLongEveSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasCallLongEveSun
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setCallLongNightWeekday:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_callLongNightWeekday = a3;
}

- (void)setHasCallLongNightWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setCallLongNightFri:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_callLongNightFri = a3;
}

- (void)setHasCallLongNightFri:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightFri
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCallLongNightSat:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_callLongNightSat = a3;
}

- (void)setHasCallLongNightSat:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightSat
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setCallLongNightSun:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_callLongNightSun = a3;
}

- (void)setHasCallLongNightSun:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightSun
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setCallTwoWeeks:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_callTwoWeeks = a3;
}

- (void)setHasCallTwoWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTwoWeeks
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setCallSixWeeks:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_callSixWeeks = a3;
}

- (void)setHasCallSixWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallSixWeeks
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setCallTwelveWeeks:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_callTwelveWeeks = a3;
}

- (void)setHasCallTwelveWeeks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTwelveWeeks
{
  return *((_BYTE *)&self->_has + 7) & 1;
}

- (void)setContactFamilyRelation:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x4000000000uLL;
  self->_contactFamilyRelation = a3;
}

- (void)setHasContactFamilyRelation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasContactFamilyRelation
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 6) & 1;
}

- (BOOL)hasContactRelation
{
  return self->_contactRelation != 0;
}

- (void)setContactFamilyName:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x2000000000uLL;
  self->_contactFamilyName = a3;
}

- (void)setHasContactFamilyName:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasContactFamilyName
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 5) & 1;
}

- (void)setContactParent:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000000000uLL;
  self->_contactParent = a3;
}

- (void)setHasContactParent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactParent
{
  return *((unsigned __int8 *)&self->_has + 13) >> 7;
}

- (void)setContactEmergency:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x800000000uLL;
  self->_contactEmergency = a3;
}

- (void)setHasContactEmergency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasContactEmergency
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 3) & 1;
}

- (void)setContactEmergencyFamily:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x1000000000uLL;
  self->_contactEmergencyFamily = a3;
}

- (void)setHasContactEmergencyFamily:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasContactEmergencyFamily
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 4) & 1;
}

- (void)setContactInHome:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x200000000000uLL;
  self->_contactInHome = a3;
}

- (void)setHasContactInHome:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInHome
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 5) & 1;
}

- (void)setContactInPhotos:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x400000000000uLL;
  self->_contactInPhotos = a3;
}

- (void)setHasContactInPhotos:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInPhotos
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 6) & 1;
}

- (void)setContactInAirDrop:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x10000000000uLL;
  self->_contactInAirDrop = a3;
}

- (void)setHasContactInAirDrop:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInAirDrop
{
  return *((_BYTE *)&self->_has + 13) & 1;
}

- (void)setContactInAirDropAtHome:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x20000000000uLL;
  self->_contactInAirDropAtHome = a3;
}

- (void)setHasContactInAirDropAtHome:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInAirDropAtHome
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 1) & 1;
}

- (void)setContactInFMFFollowingMe:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x80000000000uLL;
  self->_contactInFMFFollowingMe = a3;
}

- (void)setHasContactInFMFFollowingMe:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFFollowingMe
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 3) & 1;
}

- (void)setContactInFMFSharingWithMe:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x100000000000uLL;
  self->_contactInFMFSharingWithMe = a3;
}

- (void)setHasContactInFMFSharingWithMe:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFSharingWithMe
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 4) & 1;
}

- (void)setContactInFMFFavorite:(unsigned int)a3
{
  *((_QWORD *)&self->_has + 1) |= 0x40000000000uLL;
  self->_contactInFMFFavorite = a3;
}

- (void)setHasContactInFMFFavorite:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_has + 1) = *((_QWORD *)&self->_has + 1) & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFFavorite
{
  return (*((unsigned __int8 *)&self->_has + 13) >> 2) & 1;
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
  v8.super_class = (Class)CloudFamilyAnalysisPETContactEvent;
  -[CloudFamilyAnalysisPETContactEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudFamilyAnalysisPETContactEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $79EA2B8A9DF6EECEF7DE6D363C0E81E6 *p_has;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *contactRelation;
  uint64_t v11;
  void *v12;
  id v13;
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
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_has = &self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_firstPartyMsgTotal);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("firstPartyMsgTotal"));

    v5 = *((_QWORD *)&self->_has + 1);
  }
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgDayRatio);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("firstPartyMsgDayRatio"));

    v7 = *(_QWORD *)p_has;
    v5 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x800) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_122;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgOutgoingRatio);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("firstPartyMsgOutgoingRatio"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_123;
  }
LABEL_122:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgMorningWeekday);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("firstPartyMsgMorningWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_124;
  }
LABEL_123:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgMorningFri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("firstPartyMsgMorningFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_125;
  }
LABEL_124:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgMorningSat);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("firstPartyMsgMorningSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_126;
  }
LABEL_125:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgMorningSun);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("firstPartyMsgMorningSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_127;
  }
LABEL_126:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNoonWeekday);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("firstPartyMsgNoonWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_128;
  }
LABEL_127:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNoonFri);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("firstPartyMsgNoonFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_129;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNoonSat);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("firstPartyMsgNoonSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_14;
    goto LABEL_130;
  }
LABEL_129:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNoonSun);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("firstPartyMsgNoonSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_15;
    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgEveWeekday);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("firstPartyMsgEveWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000000) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_132;
  }
LABEL_131:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgEveFri);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("firstPartyMsgEveFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_133;
  }
LABEL_132:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgEveSat);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("firstPartyMsgEveSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_134;
  }
LABEL_133:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgEveSun);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("firstPartyMsgEveSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0)
      goto LABEL_19;
    goto LABEL_135;
  }
LABEL_134:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNightWeekday);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("firstPartyMsgNightWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_136;
  }
LABEL_135:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNightFri);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("firstPartyMsgNightFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNightSat);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("firstPartyMsgNightSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_138;
  }
LABEL_137:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgNightSun);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("firstPartyMsgNightSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgTwoWeeks);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("firstPartyMsgTwoWeeks"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_24;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstPartyMsgSixWeeks);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("firstPartyMsgSixWeeks"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_thirdPartyMsgTotal);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("thirdPartyMsgTotal"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgDayRatio);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("thirdPartyMsgDayRatio"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_143;
  }
LABEL_142:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgMorningWeekday);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("thirdPartyMsgMorningWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_144;
  }
LABEL_143:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgMorningFri);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("thirdPartyMsgMorningFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_145;
  }
LABEL_144:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgMorningSat);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("thirdPartyMsgMorningSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgMorningSun);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("thirdPartyMsgMorningSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_147;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNoonWeekday);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("thirdPartyMsgNoonWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_148;
  }
LABEL_147:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNoonFri);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("thirdPartyMsgNoonFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_149;
  }
LABEL_148:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNoonSat);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("thirdPartyMsgNoonSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNoonSun);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("thirdPartyMsgNoonSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgEveWeekday);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("thirdPartyMsgEveWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgEveFri);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("thirdPartyMsgEveFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgEveSat);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("thirdPartyMsgEveSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgEveSun);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("thirdPartyMsgEveSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNightWeekday);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("thirdPartyMsgNightWeekday"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_156;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNightFri);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("thirdPartyMsgNightFri"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_157;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNightSat);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("thirdPartyMsgNightSat"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgNightSun);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("thirdPartyMsgNightSun"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x40000000000000) == 0)
      goto LABEL_43;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thirdPartyMsgTwoWeeks);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("thirdPartyMsgTwoWeeks"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_callTotal);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("callTotal"));

  v7 = *(_QWORD *)p_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_callBirthday);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("callBirthday"));

  v7 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x8000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x80000000000000) == 0)
      goto LABEL_46;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactFavorite);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("contactFavorite"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000000000) == 0)
  {
LABEL_46:
    if ((v7 & 2) == 0)
      goto LABEL_47;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callTotalDur);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("callTotalDur"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 2) == 0)
  {
LABEL_47:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDayRatio);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("callDayRatio"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x10000000000000) == 0)
      goto LABEL_49;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongRatio);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("callLongRatio"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000000) == 0)
  {
LABEL_49:
    if ((v7 & 1) == 0)
      goto LABEL_50;
    goto LABEL_166;
  }
LABEL_165:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callOutgoingRatio);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("callOutgoingRatio"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 1) == 0)
  {
LABEL_50:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_51;
    goto LABEL_167;
  }
LABEL_166:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callAvgDur);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("callAvgDur"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_52;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callMaxDur);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("callMaxDur"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_169;
  }
LABEL_168:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callMorningWeekday);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("callMorningWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_54;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callMorningFri);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("callMorningFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
LABEL_54:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_55;
    goto LABEL_171;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callMorningSat);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("callMorningSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000000000) == 0)
  {
LABEL_55:
    if ((v7 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_172;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callMorningSun);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("callMorningSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x1000000000000) == 0)
      goto LABEL_57;
    goto LABEL_173;
  }
LABEL_172:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNoonWeekday);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("callNoonWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000000) == 0)
  {
LABEL_57:
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_58;
    goto LABEL_174;
  }
LABEL_173:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNoonFri);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("callNoonFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000000) == 0)
  {
LABEL_58:
    if ((v7 & 0x4000000000000) == 0)
      goto LABEL_59;
    goto LABEL_175;
  }
LABEL_174:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNoonSat);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("callNoonSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000000) == 0)
  {
LABEL_59:
    if ((v7 & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNoonSun);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("callNoonSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000) == 0)
  {
LABEL_60:
    if ((v7 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_177;
  }
LABEL_176:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callEveWeekday);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("callEveWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000) == 0)
  {
LABEL_61:
    if ((v7 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_178;
  }
LABEL_177:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callEveFri);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("callEveFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000) == 0)
  {
LABEL_62:
    if ((v7 & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callEveSat);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("callEveSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000) == 0)
  {
LABEL_63:
    if ((v7 & 0x800000000000) == 0)
      goto LABEL_64;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callEveSun);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("callEveSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000000) == 0)
  {
LABEL_64:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_65;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNightWeekday);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("callNightWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000000) == 0)
  {
LABEL_65:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_66;
    goto LABEL_182;
  }
LABEL_181:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNightFri);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("callNightFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000000) == 0)
  {
LABEL_66:
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_67;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNightSat);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("callNightSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000000) == 0)
  {
LABEL_67:
    if ((v7 & 0x200) == 0)
      goto LABEL_68;
    goto LABEL_184;
  }
LABEL_183:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callNightSun);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("callNightSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200) == 0)
  {
LABEL_68:
    if ((v7 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_185;
  }
LABEL_184:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurMorningWeekday);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("callDurMorningWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40) == 0)
  {
LABEL_69:
    if ((v7 & 0x80) == 0)
      goto LABEL_70;
    goto LABEL_186;
  }
LABEL_185:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurMorningFri);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("callDurMorningFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80) == 0)
  {
LABEL_70:
    if ((v7 & 0x100) == 0)
      goto LABEL_71;
    goto LABEL_187;
  }
LABEL_186:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurMorningSat);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("callDurMorningSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100) == 0)
  {
LABEL_71:
    if ((v7 & 0x20000) == 0)
      goto LABEL_72;
    goto LABEL_188;
  }
LABEL_187:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurMorningSun);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("callDurMorningSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000) == 0)
  {
LABEL_72:
    if ((v7 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNoonWeekday);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("callDurNoonWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000) == 0)
  {
LABEL_73:
    if ((v7 & 0x8000) == 0)
      goto LABEL_74;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNoonFri);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("callDurNoonFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000) == 0)
  {
LABEL_74:
    if ((v7 & 0x10000) == 0)
      goto LABEL_75;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNoonSat);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("callDurNoonSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000) == 0)
  {
LABEL_75:
    if ((v7 & 0x20) == 0)
      goto LABEL_76;
    goto LABEL_192;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNoonSun);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("callDurNoonSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20) == 0)
  {
LABEL_76:
    if ((v7 & 4) == 0)
      goto LABEL_77;
    goto LABEL_193;
  }
LABEL_192:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurEveWeekday);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v87, CFSTR("callDurEveWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 4) == 0)
  {
LABEL_77:
    if ((v7 & 8) == 0)
      goto LABEL_78;
    goto LABEL_194;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurEveFri);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("callDurEveFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 8) == 0)
  {
LABEL_78:
    if ((v7 & 0x10) == 0)
      goto LABEL_79;
    goto LABEL_195;
  }
LABEL_194:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurEveSat);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("callDurEveSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10) == 0)
  {
LABEL_79:
    if ((v7 & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_196;
  }
LABEL_195:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurEveSun);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("callDurEveSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000) == 0)
  {
LABEL_80:
    if ((v7 & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_197;
  }
LABEL_196:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNightWeekday);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("callDurNightWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400) == 0)
  {
LABEL_81:
    if ((v7 & 0x800) == 0)
      goto LABEL_82;
    goto LABEL_198;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNightFri);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("callDurNightFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800) == 0)
  {
LABEL_82:
    if ((v7 & 0x1000) == 0)
      goto LABEL_83;
    goto LABEL_199;
  }
LABEL_198:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNightSat);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("callDurNightSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000) == 0)
  {
LABEL_83:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_84;
    goto LABEL_200;
  }
LABEL_199:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callDurNightSun);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("callDurNightSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000) == 0)
  {
LABEL_84:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_85;
    goto LABEL_201;
  }
LABEL_200:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongMorningWeekday);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("callLongMorningWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000) == 0)
  {
LABEL_85:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_202;
  }
LABEL_201:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongMorningFri);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("callLongMorningFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000) == 0)
  {
LABEL_86:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_203;
  }
LABEL_202:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongMorningSat);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v97, CFSTR("callLongMorningSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000) == 0)
  {
LABEL_87:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_88;
    goto LABEL_204;
  }
LABEL_203:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongMorningSun);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("callLongMorningSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000) == 0)
  {
LABEL_88:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_89;
    goto LABEL_205;
  }
LABEL_204:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNoonWeekday);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("callLongNoonWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000) == 0)
  {
LABEL_89:
    if ((v7 & 0x800000000) == 0)
      goto LABEL_90;
    goto LABEL_206;
  }
LABEL_205:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNoonFri);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("callLongNoonFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_207;
  }
LABEL_206:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNoonSat);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v101, CFSTR("callLongNoonSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_208;
  }
LABEL_207:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNoonSun);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("callLongNoonSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x400000) == 0)
      goto LABEL_93;
    goto LABEL_209;
  }
LABEL_208:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongEveWeekday);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v103, CFSTR("callLongEveWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000) == 0)
  {
LABEL_93:
    if ((v7 & 0x800000) == 0)
      goto LABEL_94;
    goto LABEL_210;
  }
LABEL_209:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongEveFri);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("callLongEveFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000) == 0)
  {
LABEL_94:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_95;
    goto LABEL_211;
  }
LABEL_210:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongEveSat);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v105, CFSTR("callLongEveSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000) == 0)
  {
LABEL_95:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_96;
    goto LABEL_212;
  }
LABEL_211:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongEveSun);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("callLongEveSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000) == 0)
  {
LABEL_96:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_97;
    goto LABEL_213;
  }
LABEL_212:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNightWeekday);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v107, CFSTR("callLongNightWeekday"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000000) == 0)
  {
LABEL_97:
    if ((v7 & 0x80000000) == 0)
      goto LABEL_98;
    goto LABEL_214;
  }
LABEL_213:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNightFri);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v108, CFSTR("callLongNightFri"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000) == 0)
  {
LABEL_98:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_99;
    goto LABEL_215;
  }
LABEL_214:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNightSat);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("callLongNightSat"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000) == 0)
  {
LABEL_99:
    if ((v7 & 0x200000000000000) == 0)
      goto LABEL_100;
    goto LABEL_216;
  }
LABEL_215:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callLongNightSun);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v110, CFSTR("callLongNightSun"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_217;
  }
LABEL_216:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callTwoWeeks);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("callTwoWeeks"));

  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_217:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callSixWeeks);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v112, CFSTR("callSixWeeks"));

  if ((*(_QWORD *)p_has & 0x100000000000000) != 0)
  {
LABEL_102:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_callTwelveWeeks);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("callTwelveWeeks"));

  }
LABEL_103:
  if ((*((_BYTE *)&self->_has + 12) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactFamilyRelation);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("contactFamilyRelation"));

  }
  contactRelation = self->_contactRelation;
  if (contactRelation)
    objc_msgSend(v3, "setObject:forKey:", contactRelation, CFSTR("contactRelation"));
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x2000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactFamilyName);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v113, CFSTR("contactFamilyName"));

    v11 = *((_QWORD *)&self->_has + 1);
    if ((v11 & 0x800000000000) == 0)
    {
LABEL_109:
      if ((v11 & 0x800000000) == 0)
        goto LABEL_110;
      goto LABEL_221;
    }
  }
  else if ((v11 & 0x800000000000) == 0)
  {
    goto LABEL_109;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactParent);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v114, CFSTR("contactParent"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x800000000) == 0)
  {
LABEL_110:
    if ((v11 & 0x1000000000) == 0)
      goto LABEL_111;
    goto LABEL_222;
  }
LABEL_221:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactEmergency);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v115, CFSTR("contactEmergency"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x1000000000) == 0)
  {
LABEL_111:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_112;
    goto LABEL_223;
  }
LABEL_222:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactEmergencyFamily);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("contactEmergencyFamily"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_112:
    if ((v11 & 0x400000000000) == 0)
      goto LABEL_113;
    goto LABEL_224;
  }
LABEL_223:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInHome);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("contactInHome"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x400000000000) == 0)
  {
LABEL_113:
    if ((v11 & 0x10000000000) == 0)
      goto LABEL_114;
    goto LABEL_225;
  }
LABEL_224:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInPhotos);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v118, CFSTR("contactInPhotos"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_114:
    if ((v11 & 0x20000000000) == 0)
      goto LABEL_115;
    goto LABEL_226;
  }
LABEL_225:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInAirDrop);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v119, CFSTR("contactInAirDrop"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000000) == 0)
  {
LABEL_115:
    if ((v11 & 0x80000000000) == 0)
      goto LABEL_116;
    goto LABEL_227;
  }
LABEL_226:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInAirDropAtHome);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("contactInAirDropAtHome"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_116:
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_117;
LABEL_228:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInFMFSharingWithMe);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("contactInFMFSharingWithMe"));

    if ((*((_QWORD *)&self->_has + 1) & 0x40000000000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_227:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInFMFFollowingMe);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("contactInFMFFollowingMe"));

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x100000000000) != 0)
    goto LABEL_228;
LABEL_117:
  if ((v11 & 0x40000000000) != 0)
  {
LABEL_118:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_contactInFMFFavorite);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("contactInFMFFavorite"));

  }
LABEL_119:
  v13 = v3;

  return v13;
}

- (BOOL)readFrom:(id)a3
{
  return CloudFamilyAnalysisPETContactEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $79EA2B8A9DF6EECEF7DE6D363C0E81E6 *p_has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  p_has = &self->_has;
  v6 = *((_QWORD *)&self->_has + 1);
  v9 = v4;
  if ((v6 & 0x2000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
    v6 = *((_QWORD *)&self->_has + 1);
  }
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v9;
    v7 = *(_QWORD *)p_has;
    v6 = *((_QWORD *)&self->_has + 1);
    if ((v6 & 0x800) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0)
        goto LABEL_6;
      goto LABEL_122;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x8000000000000000) == 0)
  {
LABEL_7:
    if ((v6 & 1) == 0)
      goto LABEL_8;
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 1) == 0)
  {
LABEL_8:
    if ((v6 & 2) == 0)
      goto LABEL_9;
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 2) == 0)
  {
LABEL_9:
    if ((v6 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x400) == 0)
  {
LABEL_10:
    if ((v6 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x80) == 0)
  {
LABEL_11:
    if ((v6 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x200) == 0)
  {
LABEL_13:
    if ((v7 & 0x4000000000000000) == 0)
      goto LABEL_14;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x4000000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x800000000000000) == 0)
      goto LABEL_15;
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x800000000000000) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x1000000000000000) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x2000000000000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 8) == 0)
      goto LABEL_19;
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 8) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x10) == 0)
  {
LABEL_20:
    if ((v6 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x20) == 0)
  {
LABEL_21:
    if ((v6 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x4000) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x100000000) == 0)
      goto LABEL_24;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x8000) == 0)
  {
LABEL_25:
    if ((v6 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x800000) == 0)
  {
LABEL_26:
    if ((v6 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x100000) == 0)
  {
LABEL_27:
    if ((v6 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x200000) == 0)
  {
LABEL_28:
    if ((v6 & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x400000) == 0)
  {
LABEL_29:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_32:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v6 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x80000) == 0)
  {
LABEL_34:
    if ((v6 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x10000) == 0)
  {
LABEL_35:
    if ((v6 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((v6 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x40000) == 0)
  {
LABEL_37:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x40000000000000) == 0)
      goto LABEL_43;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((*(_QWORD *)p_has & 0x40000000000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint64Field();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  v6 = *((_QWORD *)&self->_has + 1);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x8000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x80000000000000) == 0)
      goto LABEL_46;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000000000) == 0)
  {
LABEL_46:
    if ((v7 & 2) == 0)
      goto LABEL_47;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 2) == 0)
  {
LABEL_47:
    if ((v7 & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x10000000000000) == 0)
      goto LABEL_49;
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000000) == 0)
  {
LABEL_49:
    if ((v7 & 1) == 0)
      goto LABEL_50;
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 1) == 0)
  {
LABEL_50:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_51;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_52;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_54;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
LABEL_54:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_55;
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000000000) == 0)
  {
LABEL_55:
    if ((v7 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v7 & 0x1000000000000) == 0)
      goto LABEL_57;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000000) == 0)
  {
LABEL_57:
    if ((v7 & 0x2000000000000) == 0)
      goto LABEL_58;
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000000) == 0)
  {
LABEL_58:
    if ((v7 & 0x4000000000000) == 0)
      goto LABEL_59;
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000000) == 0)
  {
LABEL_59:
    if ((v7 & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000) == 0)
  {
LABEL_60:
    if ((v7 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000) == 0)
  {
LABEL_61:
    if ((v7 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000) == 0)
  {
LABEL_62:
    if ((v7 & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000) == 0)
  {
LABEL_63:
    if ((v7 & 0x800000000000) == 0)
      goto LABEL_64;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000000) == 0)
  {
LABEL_64:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_65;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000000) == 0)
  {
LABEL_65:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_66;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000000) == 0)
  {
LABEL_66:
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_67;
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000000) == 0)
  {
LABEL_67:
    if ((v7 & 0x200) == 0)
      goto LABEL_68;
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200) == 0)
  {
LABEL_68:
    if ((v7 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40) == 0)
  {
LABEL_69:
    if ((v7 & 0x80) == 0)
      goto LABEL_70;
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80) == 0)
  {
LABEL_70:
    if ((v7 & 0x100) == 0)
      goto LABEL_71;
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100) == 0)
  {
LABEL_71:
    if ((v7 & 0x20000) == 0)
      goto LABEL_72;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000) == 0)
  {
LABEL_72:
    if ((v7 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000) == 0)
  {
LABEL_73:
    if ((v7 & 0x8000) == 0)
      goto LABEL_74;
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000) == 0)
  {
LABEL_74:
    if ((v7 & 0x10000) == 0)
      goto LABEL_75;
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000) == 0)
  {
LABEL_75:
    if ((v7 & 0x20) == 0)
      goto LABEL_76;
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20) == 0)
  {
LABEL_76:
    if ((v7 & 4) == 0)
      goto LABEL_77;
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 4) == 0)
  {
LABEL_77:
    if ((v7 & 8) == 0)
      goto LABEL_78;
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 8) == 0)
  {
LABEL_78:
    if ((v7 & 0x10) == 0)
      goto LABEL_79;
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10) == 0)
  {
LABEL_79:
    if ((v7 & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000) == 0)
  {
LABEL_80:
    if ((v7 & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400) == 0)
  {
LABEL_81:
    if ((v7 & 0x800) == 0)
      goto LABEL_82;
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800) == 0)
  {
LABEL_82:
    if ((v7 & 0x1000) == 0)
      goto LABEL_83;
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000) == 0)
  {
LABEL_83:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_84;
    goto LABEL_200;
  }
LABEL_199:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000) == 0)
  {
LABEL_84:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_85;
    goto LABEL_201;
  }
LABEL_200:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000) == 0)
  {
LABEL_85:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_202;
  }
LABEL_201:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x8000000) == 0)
  {
LABEL_86:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_203;
  }
LABEL_202:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x10000000) == 0)
  {
LABEL_87:
    if ((v7 & 0x2000000000) == 0)
      goto LABEL_88;
    goto LABEL_204;
  }
LABEL_203:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000000) == 0)
  {
LABEL_88:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_89;
    goto LABEL_205;
  }
LABEL_204:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000000) == 0)
  {
LABEL_89:
    if ((v7 & 0x800000000) == 0)
      goto LABEL_90;
    goto LABEL_206;
  }
LABEL_205:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_207;
  }
LABEL_206:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_208;
  }
LABEL_207:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x2000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x400000) == 0)
      goto LABEL_93;
    goto LABEL_209;
  }
LABEL_208:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x400000) == 0)
  {
LABEL_93:
    if ((v7 & 0x800000) == 0)
      goto LABEL_94;
    goto LABEL_210;
  }
LABEL_209:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x800000) == 0)
  {
LABEL_94:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_95;
    goto LABEL_211;
  }
LABEL_210:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x1000000) == 0)
  {
LABEL_95:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_96;
    goto LABEL_212;
  }
LABEL_211:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000) == 0)
  {
LABEL_96:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_97;
    goto LABEL_213;
  }
LABEL_212:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x40000000) == 0)
  {
LABEL_97:
    if ((v7 & 0x80000000) == 0)
      goto LABEL_98;
    goto LABEL_214;
  }
LABEL_213:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x80000000) == 0)
  {
LABEL_98:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_99;
    goto LABEL_215;
  }
LABEL_214:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x100000000) == 0)
  {
LABEL_99:
    if ((v7 & 0x200000000000000) == 0)
      goto LABEL_100;
    goto LABEL_216;
  }
LABEL_215:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_217;
  }
LABEL_216:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  v7 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x100000000000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_217:
  PBDataWriterWriteDoubleField();
  v4 = v9;
  if ((*(_QWORD *)p_has & 0x100000000000000) != 0)
  {
LABEL_102:
    PBDataWriterWriteDoubleField();
    v4 = v9;
  }
LABEL_103:
  if ((*((_BYTE *)&self->_has + 12) & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
  }
  if (self->_contactRelation)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x2000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v9;
    v8 = *((_QWORD *)&self->_has + 1);
    if ((v8 & 0x800000000000) == 0)
    {
LABEL_109:
      if ((v8 & 0x800000000) == 0)
        goto LABEL_110;
      goto LABEL_221;
    }
  }
  else if ((v8 & 0x800000000000) == 0)
  {
    goto LABEL_109;
  }
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_110:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_111;
    goto LABEL_222;
  }
LABEL_221:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_111:
    if ((v8 & 0x200000000000) == 0)
      goto LABEL_112;
    goto LABEL_223;
  }
LABEL_222:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x200000000000) == 0)
  {
LABEL_112:
    if ((v8 & 0x400000000000) == 0)
      goto LABEL_113;
    goto LABEL_224;
  }
LABEL_223:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x400000000000) == 0)
  {
LABEL_113:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_114;
    goto LABEL_225;
  }
LABEL_224:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_114:
    if ((v8 & 0x20000000000) == 0)
      goto LABEL_115;
    goto LABEL_226;
  }
LABEL_225:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x20000000000) == 0)
  {
LABEL_115:
    if ((v8 & 0x80000000000) == 0)
      goto LABEL_116;
    goto LABEL_227;
  }
LABEL_226:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x80000000000) == 0)
  {
LABEL_116:
    if ((v8 & 0x100000000000) == 0)
      goto LABEL_117;
LABEL_228:
    PBDataWriterWriteUint32Field();
    v4 = v9;
    if ((*((_QWORD *)&self->_has + 1) & 0x40000000000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_227:
  PBDataWriterWriteUint32Field();
  v4 = v9;
  v8 = *((_QWORD *)&self->_has + 1);
  if ((v8 & 0x100000000000) != 0)
    goto LABEL_228;
LABEL_117:
  if ((v8 & 0x40000000000) != 0)
  {
LABEL_118:
    PBDataWriterWriteUint32Field();
    v4 = v9;
  }
LABEL_119:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t has;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000) != 0)
  {
    v4[78] = self->_firstPartyMsgTotal;
    v4[108] |= 0x2000uLL;
    v5 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((has & 0x400000000000000) != 0)
  {
    v4[59] = *(_QWORD *)&self->_firstPartyMsgDayRatio;
    v4[107] |= 0x400000000000000uLL;
    has = (uint64_t)self->_has;
    v5 = *((_QWORD *)&self->_has + 1);
    if ((v5 & 0x800) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_122;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_5;
  }
  v4[76] = *(_QWORD *)&self->_firstPartyMsgOutgoingRatio;
  v4[108] |= 0x800uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_123;
  }
LABEL_122:
  v4[67] = *(_QWORD *)&self->_firstPartyMsgMorningWeekday;
  v4[108] |= 4uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_124;
  }
LABEL_123:
  v4[64] = *(_QWORD *)&self->_firstPartyMsgMorningFri;
  v4[107] |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_125;
  }
LABEL_124:
  v4[65] = *(_QWORD *)&self->_firstPartyMsgMorningSat;
  v4[108] |= 1uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_126;
  }
LABEL_125:
  v4[66] = *(_QWORD *)&self->_firstPartyMsgMorningSun;
  v4[108] |= 2uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_127;
  }
LABEL_126:
  v4[75] = *(_QWORD *)&self->_firstPartyMsgNoonWeekday;
  v4[108] |= 0x400uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_128;
  }
LABEL_127:
  v4[72] = *(_QWORD *)&self->_firstPartyMsgNoonFri;
  v4[108] |= 0x80uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_129;
  }
LABEL_128:
  v4[73] = *(_QWORD *)&self->_firstPartyMsgNoonSat;
  v4[108] |= 0x100uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_14;
    goto LABEL_130;
  }
LABEL_129:
  v4[74] = *(_QWORD *)&self->_firstPartyMsgNoonSun;
  v4[108] |= 0x200uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_15;
    goto LABEL_131;
  }
LABEL_130:
  v4[63] = *(_QWORD *)&self->_firstPartyMsgEveWeekday;
  v4[107] |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_132;
  }
LABEL_131:
  v4[60] = *(_QWORD *)&self->_firstPartyMsgEveFri;
  v4[107] |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_133;
  }
LABEL_132:
  v4[61] = *(_QWORD *)&self->_firstPartyMsgEveSat;
  v4[107] |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_134;
  }
LABEL_133:
  v4[62] = *(_QWORD *)&self->_firstPartyMsgEveSun;
  v4[107] |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0)
      goto LABEL_19;
    goto LABEL_135;
  }
LABEL_134:
  v4[71] = *(_QWORD *)&self->_firstPartyMsgNightWeekday;
  v4[108] |= 0x40uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_136;
  }
LABEL_135:
  v4[68] = *(_QWORD *)&self->_firstPartyMsgNightFri;
  v4[108] |= 8uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_137;
  }
LABEL_136:
  v4[69] = *(_QWORD *)&self->_firstPartyMsgNightSat;
  v4[108] |= 0x10uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_138;
  }
LABEL_137:
  v4[70] = *(_QWORD *)&self->_firstPartyMsgNightSun;
  v4[108] |= 0x20uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_139;
  }
LABEL_138:
  v4[79] = *(_QWORD *)&self->_firstPartyMsgTwoWeeks;
  v4[108] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_24;
    goto LABEL_140;
  }
LABEL_139:
  v4[77] = *(_QWORD *)&self->_firstPartyMsgSixWeeks;
  v4[108] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_141;
  }
LABEL_140:
  v4[97] = self->_thirdPartyMsgTotal;
  v4[108] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_142;
  }
LABEL_141:
  v4[80] = *(_QWORD *)&self->_thirdPartyMsgDayRatio;
  v4[108] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_143;
  }
LABEL_142:
  v4[88] = *(_QWORD *)&self->_thirdPartyMsgMorningWeekday;
  v4[108] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_144;
  }
LABEL_143:
  v4[85] = *(_QWORD *)&self->_thirdPartyMsgMorningFri;
  v4[108] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_145;
  }
LABEL_144:
  v4[86] = *(_QWORD *)&self->_thirdPartyMsgMorningSat;
  v4[108] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_146;
  }
LABEL_145:
  v4[87] = *(_QWORD *)&self->_thirdPartyMsgMorningSun;
  v4[108] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_147;
  }
LABEL_146:
  v4[96] = *(_QWORD *)&self->_thirdPartyMsgNoonWeekday;
  v4[108] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_148;
  }
LABEL_147:
  v4[93] = *(_QWORD *)&self->_thirdPartyMsgNoonFri;
  v4[108] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_149;
  }
LABEL_148:
  v4[94] = *(_QWORD *)&self->_thirdPartyMsgNoonSat;
  v4[108] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_150;
  }
LABEL_149:
  v4[95] = *(_QWORD *)&self->_thirdPartyMsgNoonSun;
  v4[108] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_151;
  }
LABEL_150:
  v4[84] = *(_QWORD *)&self->_thirdPartyMsgEveWeekday;
  v4[108] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_152;
  }
LABEL_151:
  v4[81] = *(_QWORD *)&self->_thirdPartyMsgEveFri;
  v4[108] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_153;
  }
LABEL_152:
  v4[82] = *(_QWORD *)&self->_thirdPartyMsgEveSat;
  v4[108] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_154;
  }
LABEL_153:
  v4[83] = *(_QWORD *)&self->_thirdPartyMsgEveSun;
  v4[108] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_155;
  }
LABEL_154:
  v4[92] = *(_QWORD *)&self->_thirdPartyMsgNightWeekday;
  v4[108] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_156;
  }
LABEL_155:
  v4[89] = *(_QWORD *)&self->_thirdPartyMsgNightFri;
  v4[108] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_157;
  }
LABEL_156:
  v4[90] = *(_QWORD *)&self->_thirdPartyMsgNightSat;
  v4[108] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_158;
  }
LABEL_157:
  v4[91] = *(_QWORD *)&self->_thirdPartyMsgNightSun;
  v4[108] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_42:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_43;
    goto LABEL_159;
  }
LABEL_158:
  v4[98] = *(_QWORD *)&self->_thirdPartyMsgTwoWeeks;
  v4[108] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_160;
  }
LABEL_159:
  v4[55] = self->_callTotal;
  v4[107] |= 0x40000000000000uLL;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_161;
  }
LABEL_160:
  *((_DWORD *)v4 + 198) = self->_callBirthday;
  v4[108] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x8000000000) == 0)
  {
LABEL_45:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_46;
    goto LABEL_162;
  }
LABEL_161:
  *((_DWORD *)v4 + 203) = self->_contactFavorite;
  v4[108] |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000000000) == 0)
  {
LABEL_46:
    if ((has & 2) == 0)
      goto LABEL_47;
    goto LABEL_163;
  }
LABEL_162:
  v4[56] = *(_QWORD *)&self->_callTotalDur;
  v4[107] |= 0x80000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 2) == 0)
  {
LABEL_47:
    if ((has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_164;
  }
LABEL_163:
  v4[2] = *(_QWORD *)&self->_callDayRatio;
  v4[107] |= 2uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_49;
    goto LABEL_165;
  }
LABEL_164:
  v4[39] = *(_QWORD *)&self->_callLongRatio;
  v4[107] |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) == 0)
  {
LABEL_49:
    if ((has & 1) == 0)
      goto LABEL_50;
    goto LABEL_166;
  }
LABEL_165:
  v4[53] = *(_QWORD *)&self->_callOutgoingRatio;
  v4[107] |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000) == 0)
      goto LABEL_51;
    goto LABEL_167;
  }
LABEL_166:
  v4[1] = *(_QWORD *)&self->_callAvgDur;
  v4[107] |= 1uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_51:
    if ((has & 0x80000000000) == 0)
      goto LABEL_52;
    goto LABEL_168;
  }
LABEL_167:
  v4[40] = *(_QWORD *)&self->_callMaxDur;
  v4[107] |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000000) == 0)
  {
LABEL_52:
    if ((has & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_169;
  }
LABEL_168:
  v4[44] = *(_QWORD *)&self->_callMorningWeekday;
  v4[107] |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_53:
    if ((has & 0x20000000000) == 0)
      goto LABEL_54;
    goto LABEL_170;
  }
LABEL_169:
  v4[41] = *(_QWORD *)&self->_callMorningFri;
  v4[107] |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000) == 0)
      goto LABEL_55;
    goto LABEL_171;
  }
LABEL_170:
  v4[42] = *(_QWORD *)&self->_callMorningSat;
  v4[107] |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_55:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_172;
  }
LABEL_171:
  v4[43] = *(_QWORD *)&self->_callMorningSun;
  v4[107] |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_57;
    goto LABEL_173;
  }
LABEL_172:
  v4[52] = *(_QWORD *)&self->_callNoonWeekday;
  v4[107] |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_58;
    goto LABEL_174;
  }
LABEL_173:
  v4[49] = *(_QWORD *)&self->_callNoonFri;
  v4[107] |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000000) == 0)
  {
LABEL_58:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_59;
    goto LABEL_175;
  }
LABEL_174:
  v4[50] = *(_QWORD *)&self->_callNoonSat;
  v4[107] |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_176;
  }
LABEL_175:
  v4[51] = *(_QWORD *)&self->_callNoonSun;
  v4[107] |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_60:
    if ((has & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_177;
  }
LABEL_176:
  v4[22] = *(_QWORD *)&self->_callEveWeekday;
  v4[107] |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_178;
  }
LABEL_177:
  v4[19] = *(_QWORD *)&self->_callEveFri;
  v4[107] |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_179;
  }
LABEL_178:
  v4[20] = *(_QWORD *)&self->_callEveSat;
  v4[107] |= 0x80000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x800000000000) == 0)
      goto LABEL_64;
    goto LABEL_180;
  }
LABEL_179:
  v4[21] = *(_QWORD *)&self->_callEveSun;
  v4[107] |= 0x100000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000) == 0)
  {
LABEL_64:
    if ((has & 0x100000000000) == 0)
      goto LABEL_65;
    goto LABEL_181;
  }
LABEL_180:
  v4[48] = *(_QWORD *)&self->_callNightWeekday;
  v4[107] |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) == 0)
  {
LABEL_65:
    if ((has & 0x200000000000) == 0)
      goto LABEL_66;
    goto LABEL_182;
  }
LABEL_181:
  v4[45] = *(_QWORD *)&self->_callNightFri;
  v4[107] |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_66:
    if ((has & 0x400000000000) == 0)
      goto LABEL_67;
    goto LABEL_183;
  }
LABEL_182:
  v4[46] = *(_QWORD *)&self->_callNightSat;
  v4[107] |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000000) == 0)
  {
LABEL_67:
    if ((has & 0x200) == 0)
      goto LABEL_68;
    goto LABEL_184;
  }
LABEL_183:
  v4[47] = *(_QWORD *)&self->_callNightSun;
  v4[107] |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_68:
    if ((has & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_185;
  }
LABEL_184:
  v4[10] = *(_QWORD *)&self->_callDurMorningWeekday;
  v4[107] |= 0x200uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_69:
    if ((has & 0x80) == 0)
      goto LABEL_70;
    goto LABEL_186;
  }
LABEL_185:
  v4[7] = *(_QWORD *)&self->_callDurMorningFri;
  v4[107] |= 0x40uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_70:
    if ((has & 0x100) == 0)
      goto LABEL_71;
    goto LABEL_187;
  }
LABEL_186:
  v4[8] = *(_QWORD *)&self->_callDurMorningSat;
  v4[107] |= 0x80uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_71:
    if ((has & 0x20000) == 0)
      goto LABEL_72;
    goto LABEL_188;
  }
LABEL_187:
  v4[9] = *(_QWORD *)&self->_callDurMorningSun;
  v4[107] |= 0x100uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_72:
    if ((has & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_189;
  }
LABEL_188:
  v4[18] = *(_QWORD *)&self->_callDurNoonWeekday;
  v4[107] |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_73:
    if ((has & 0x8000) == 0)
      goto LABEL_74;
    goto LABEL_190;
  }
LABEL_189:
  v4[15] = *(_QWORD *)&self->_callDurNoonFri;
  v4[107] |= 0x4000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_74:
    if ((has & 0x10000) == 0)
      goto LABEL_75;
    goto LABEL_191;
  }
LABEL_190:
  v4[16] = *(_QWORD *)&self->_callDurNoonSat;
  v4[107] |= 0x8000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_75:
    if ((has & 0x20) == 0)
      goto LABEL_76;
    goto LABEL_192;
  }
LABEL_191:
  v4[17] = *(_QWORD *)&self->_callDurNoonSun;
  v4[107] |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_76:
    if ((has & 4) == 0)
      goto LABEL_77;
    goto LABEL_193;
  }
LABEL_192:
  v4[6] = *(_QWORD *)&self->_callDurEveWeekday;
  v4[107] |= 0x20uLL;
  has = (uint64_t)self->_has;
  if ((has & 4) == 0)
  {
LABEL_77:
    if ((has & 8) == 0)
      goto LABEL_78;
    goto LABEL_194;
  }
LABEL_193:
  v4[3] = *(_QWORD *)&self->_callDurEveFri;
  v4[107] |= 4uLL;
  has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_78:
    if ((has & 0x10) == 0)
      goto LABEL_79;
    goto LABEL_195;
  }
LABEL_194:
  v4[4] = *(_QWORD *)&self->_callDurEveSat;
  v4[107] |= 8uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_79:
    if ((has & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_196;
  }
LABEL_195:
  v4[5] = *(_QWORD *)&self->_callDurEveSun;
  v4[107] |= 0x10uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_80:
    if ((has & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_197;
  }
LABEL_196:
  v4[14] = *(_QWORD *)&self->_callDurNightWeekday;
  v4[107] |= 0x2000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_81:
    if ((has & 0x800) == 0)
      goto LABEL_82;
    goto LABEL_198;
  }
LABEL_197:
  v4[11] = *(_QWORD *)&self->_callDurNightFri;
  v4[107] |= 0x400uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_82:
    if ((has & 0x1000) == 0)
      goto LABEL_83;
    goto LABEL_199;
  }
LABEL_198:
  v4[12] = *(_QWORD *)&self->_callDurNightSat;
  v4[107] |= 0x800uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_83:
    if ((has & 0x20000000) == 0)
      goto LABEL_84;
    goto LABEL_200;
  }
LABEL_199:
  v4[13] = *(_QWORD *)&self->_callDurNightSun;
  v4[107] |= 0x1000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_84:
    if ((has & 0x4000000) == 0)
      goto LABEL_85;
    goto LABEL_201;
  }
LABEL_200:
  v4[30] = *(_QWORD *)&self->_callLongMorningWeekday;
  v4[107] |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_85:
    if ((has & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_202;
  }
LABEL_201:
  v4[27] = *(_QWORD *)&self->_callLongMorningFri;
  v4[107] |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_86:
    if ((has & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_203;
  }
LABEL_202:
  v4[28] = *(_QWORD *)&self->_callLongMorningSat;
  v4[107] |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_87:
    if ((has & 0x2000000000) == 0)
      goto LABEL_88;
    goto LABEL_204;
  }
LABEL_203:
  v4[29] = *(_QWORD *)&self->_callLongMorningSun;
  v4[107] |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_88:
    if ((has & 0x400000000) == 0)
      goto LABEL_89;
    goto LABEL_205;
  }
LABEL_204:
  v4[38] = *(_QWORD *)&self->_callLongNoonWeekday;
  v4[107] |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_89:
    if ((has & 0x800000000) == 0)
      goto LABEL_90;
    goto LABEL_206;
  }
LABEL_205:
  v4[35] = *(_QWORD *)&self->_callLongNoonFri;
  v4[107] |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_90:
    if ((has & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_207;
  }
LABEL_206:
  v4[36] = *(_QWORD *)&self->_callLongNoonSat;
  v4[107] |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_91:
    if ((has & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_208;
  }
LABEL_207:
  v4[37] = *(_QWORD *)&self->_callLongNoonSun;
  v4[107] |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) == 0)
  {
LABEL_92:
    if ((has & 0x400000) == 0)
      goto LABEL_93;
    goto LABEL_209;
  }
LABEL_208:
  v4[26] = *(_QWORD *)&self->_callLongEveWeekday;
  v4[107] |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_93:
    if ((has & 0x800000) == 0)
      goto LABEL_94;
    goto LABEL_210;
  }
LABEL_209:
  v4[23] = *(_QWORD *)&self->_callLongEveFri;
  v4[107] |= 0x400000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000) == 0)
  {
LABEL_94:
    if ((has & 0x1000000) == 0)
      goto LABEL_95;
    goto LABEL_211;
  }
LABEL_210:
  v4[24] = *(_QWORD *)&self->_callLongEveSat;
  v4[107] |= 0x800000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000) == 0)
  {
LABEL_95:
    if ((has & 0x200000000) == 0)
      goto LABEL_96;
    goto LABEL_212;
  }
LABEL_211:
  v4[25] = *(_QWORD *)&self->_callLongEveSun;
  v4[107] |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_96:
    if ((has & 0x40000000) == 0)
      goto LABEL_97;
    goto LABEL_213;
  }
LABEL_212:
  v4[34] = *(_QWORD *)&self->_callLongNightWeekday;
  v4[107] |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000) == 0)
  {
LABEL_97:
    if ((has & 0x80000000) == 0)
      goto LABEL_98;
    goto LABEL_214;
  }
LABEL_213:
  v4[31] = *(_QWORD *)&self->_callLongNightFri;
  v4[107] |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000) == 0)
  {
LABEL_98:
    if ((has & 0x100000000) == 0)
      goto LABEL_99;
    goto LABEL_215;
  }
LABEL_214:
  v4[32] = *(_QWORD *)&self->_callLongNightSat;
  v4[107] |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_99:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_100;
    goto LABEL_216;
  }
LABEL_215:
  v4[33] = *(_QWORD *)&self->_callLongNightSun;
  v4[107] |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_217;
  }
LABEL_216:
  v4[58] = *(_QWORD *)&self->_callTwoWeeks;
  v4[107] |= 0x200000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_217:
  v4[54] = *(_QWORD *)&self->_callSixWeeks;
  v4[107] |= 0x20000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000000000) != 0)
  {
LABEL_102:
    v4[57] = *(_QWORD *)&self->_callTwelveWeeks;
    v4[107] |= 0x100000000000000uLL;
  }
LABEL_103:
  if ((*((_BYTE *)&self->_has + 12) & 0x40) != 0)
  {
    *((_DWORD *)v4 + 202) = self->_contactFamilyRelation;
    v4[108] |= 0x4000000000uLL;
  }
  if (self->_contactRelation)
  {
    v8 = v4;
    objc_msgSend(v4, "setContactRelation:");
    v4 = v8;
  }
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x2000000000) != 0)
  {
    *((_DWORD *)v4 + 201) = self->_contactFamilyName;
    v4[108] |= 0x2000000000uLL;
    v7 = *((_QWORD *)&self->_has + 1);
    if ((v7 & 0x800000000000) == 0)
    {
LABEL_109:
      if ((v7 & 0x800000000) == 0)
        goto LABEL_110;
      goto LABEL_221;
    }
  }
  else if ((v7 & 0x800000000000) == 0)
  {
    goto LABEL_109;
  }
  *((_DWORD *)v4 + 211) = self->_contactParent;
  v4[108] |= 0x800000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x800000000) == 0)
  {
LABEL_110:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_111;
    goto LABEL_222;
  }
LABEL_221:
  *((_DWORD *)v4 + 199) = self->_contactEmergency;
  v4[108] |= 0x800000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_111:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_112;
    goto LABEL_223;
  }
LABEL_222:
  *((_DWORD *)v4 + 200) = self->_contactEmergencyFamily;
  v4[108] |= 0x1000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_112:
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_113;
    goto LABEL_224;
  }
LABEL_223:
  *((_DWORD *)v4 + 209) = self->_contactInHome;
  v4[108] |= 0x200000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_113:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_114;
    goto LABEL_225;
  }
LABEL_224:
  *((_DWORD *)v4 + 210) = self->_contactInPhotos;
  v4[108] |= 0x400000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_114:
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_115;
    goto LABEL_226;
  }
LABEL_225:
  *((_DWORD *)v4 + 204) = self->_contactInAirDrop;
  v4[108] |= 0x10000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_115:
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_116;
    goto LABEL_227;
  }
LABEL_226:
  *((_DWORD *)v4 + 205) = self->_contactInAirDropAtHome;
  v4[108] |= 0x20000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x80000000000) == 0)
  {
LABEL_116:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_117;
LABEL_228:
    *((_DWORD *)v4 + 208) = self->_contactInFMFSharingWithMe;
    v4[108] |= 0x100000000000uLL;
    if ((*((_QWORD *)&self->_has + 1) & 0x40000000000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_227:
  *((_DWORD *)v4 + 207) = self->_contactInFMFFollowingMe;
  v4[108] |= 0x80000000000uLL;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x100000000000) != 0)
    goto LABEL_228;
LABEL_117:
  if ((v7 & 0x40000000000) != 0)
  {
LABEL_118:
    *((_DWORD *)v4 + 206) = self->_contactInFMFFavorite;
    v4[108] |= 0x40000000000uLL;
  }
LABEL_119:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x2000) != 0)
  {
    *(_QWORD *)(v5 + 624) = self->_firstPartyMsgTotal;
    *(_QWORD *)(v5 + 864) |= 0x2000uLL;
    v7 = *((_QWORD *)&self->_has + 1);
  }
  has = (uint64_t)self->_has;
  if ((has & 0x400000000000000) != 0)
  {
    *(double *)(v5 + 472) = self->_firstPartyMsgDayRatio;
    *(_QWORD *)(v5 + 856) |= 0x400000000000000uLL;
    has = (uint64_t)self->_has;
    v7 = *((_QWORD *)&self->_has + 1);
    if ((v7 & 0x800) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0)
        goto LABEL_6;
      goto LABEL_120;
    }
  }
  else if ((v7 & 0x800) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 608) = self->_firstPartyMsgOutgoingRatio;
  *(_QWORD *)(v5 + 864) |= 0x800uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((has & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_121;
  }
LABEL_120:
  *(double *)(v5 + 536) = self->_firstPartyMsgMorningWeekday;
  *(_QWORD *)(v5 + 864) |= 4uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_7:
    if ((v7 & 1) == 0)
      goto LABEL_8;
    goto LABEL_122;
  }
LABEL_121:
  *(double *)(v5 + 512) = self->_firstPartyMsgMorningFri;
  *(_QWORD *)(v5 + 856) |= 0x8000000000000000;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 1) == 0)
  {
LABEL_8:
    if ((v7 & 2) == 0)
      goto LABEL_9;
    goto LABEL_123;
  }
LABEL_122:
  *(double *)(v5 + 520) = self->_firstPartyMsgMorningSat;
  *(_QWORD *)(v5 + 864) |= 1uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 2) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_124;
  }
LABEL_123:
  *(double *)(v5 + 528) = self->_firstPartyMsgMorningSun;
  *(_QWORD *)(v5 + 864) |= 2uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_10:
    if ((v7 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_125;
  }
LABEL_124:
  *(double *)(v5 + 600) = self->_firstPartyMsgNoonWeekday;
  *(_QWORD *)(v5 + 864) |= 0x400uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_11:
    if ((v7 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_126;
  }
LABEL_125:
  *(double *)(v5 + 576) = self->_firstPartyMsgNoonFri;
  *(_QWORD *)(v5 + 864) |= 0x80uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_127;
  }
LABEL_126:
  *(double *)(v5 + 584) = self->_firstPartyMsgNoonSat;
  *(_QWORD *)(v5 + 864) |= 0x100uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x4000000000000000) == 0)
      goto LABEL_14;
    goto LABEL_128;
  }
LABEL_127:
  *(double *)(v5 + 592) = self->_firstPartyMsgNoonSun;
  *(_QWORD *)(v5 + 864) |= 0x200uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x800000000000000) == 0)
      goto LABEL_15;
    goto LABEL_129;
  }
LABEL_128:
  *(double *)(v5 + 504) = self->_firstPartyMsgEveWeekday;
  *(_QWORD *)(v5 + 856) |= 0x4000000000000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x1000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_130;
  }
LABEL_129:
  *(double *)(v5 + 480) = self->_firstPartyMsgEveFri;
  *(_QWORD *)(v5 + 856) |= 0x800000000000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_131;
  }
LABEL_130:
  *(double *)(v5 + 488) = self->_firstPartyMsgEveSat;
  *(_QWORD *)(v5 + 856) |= 0x1000000000000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_17:
    if ((v7 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_132;
  }
LABEL_131:
  *(double *)(v5 + 496) = self->_firstPartyMsgEveSun;
  *(_QWORD *)(v5 + 856) |= 0x2000000000000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_18:
    if ((v7 & 8) == 0)
      goto LABEL_19;
    goto LABEL_133;
  }
LABEL_132:
  *(double *)(v5 + 568) = self->_firstPartyMsgNightWeekday;
  *(_QWORD *)(v5 + 864) |= 0x40uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 8) == 0)
  {
LABEL_19:
    if ((v7 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_134;
  }
LABEL_133:
  *(double *)(v5 + 544) = self->_firstPartyMsgNightFri;
  *(_QWORD *)(v5 + 864) |= 8uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_20:
    if ((v7 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_135;
  }
LABEL_134:
  *(double *)(v5 + 552) = self->_firstPartyMsgNightSat;
  *(_QWORD *)(v5 + 864) |= 0x10uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_21:
    if ((v7 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_136;
  }
LABEL_135:
  *(double *)(v5 + 560) = self->_firstPartyMsgNightSun;
  *(_QWORD *)(v5 + 864) |= 0x20uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x4000) == 0)
  {
LABEL_22:
    if ((v7 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_137;
  }
LABEL_136:
  *(double *)(v5 + 632) = self->_firstPartyMsgTwoWeeks;
  *(_QWORD *)(v5 + 864) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x1000) == 0)
  {
LABEL_23:
    if ((v7 & 0x100000000) == 0)
      goto LABEL_24;
    goto LABEL_138;
  }
LABEL_137:
  *(double *)(v5 + 616) = self->_firstPartyMsgSixWeeks;
  *(_QWORD *)(v5 + 864) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_24:
    if ((v7 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_139;
  }
LABEL_138:
  *(_QWORD *)(v5 + 776) = self->_thirdPartyMsgTotal;
  *(_QWORD *)(v5 + 864) |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x8000) == 0)
  {
LABEL_25:
    if ((v7 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_140;
  }
LABEL_139:
  *(double *)(v5 + 640) = self->_thirdPartyMsgDayRatio;
  *(_QWORD *)(v5 + 864) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x800000) == 0)
  {
LABEL_26:
    if ((v7 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_141;
  }
LABEL_140:
  *(double *)(v5 + 704) = self->_thirdPartyMsgMorningWeekday;
  *(_QWORD *)(v5 + 864) |= 0x800000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x100000) == 0)
  {
LABEL_27:
    if ((v7 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_142;
  }
LABEL_141:
  *(double *)(v5 + 680) = self->_thirdPartyMsgMorningFri;
  *(_QWORD *)(v5 + 864) |= 0x100000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x200000) == 0)
  {
LABEL_28:
    if ((v7 & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_143;
  }
LABEL_142:
  *(double *)(v5 + 688) = self->_thirdPartyMsgMorningSat;
  *(_QWORD *)(v5 + 864) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x400000) == 0)
  {
LABEL_29:
    if ((v7 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_144;
  }
LABEL_143:
  *(double *)(v5 + 696) = self->_thirdPartyMsgMorningSun;
  *(_QWORD *)(v5 + 864) |= 0x400000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v7 & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_145;
  }
LABEL_144:
  *(double *)(v5 + 768) = self->_thirdPartyMsgNoonWeekday;
  *(_QWORD *)(v5 + 864) |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v7 & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_146;
  }
LABEL_145:
  *(double *)(v5 + 744) = self->_thirdPartyMsgNoonFri;
  *(_QWORD *)(v5 + 864) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x20000000) == 0)
  {
LABEL_32:
    if ((v7 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_147;
  }
LABEL_146:
  *(double *)(v5 + 752) = self->_thirdPartyMsgNoonSat;
  *(_QWORD *)(v5 + 864) |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v7 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_148;
  }
LABEL_147:
  *(double *)(v5 + 760) = self->_thirdPartyMsgNoonSun;
  *(_QWORD *)(v5 + 864) |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x80000) == 0)
  {
LABEL_34:
    if ((v7 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_149;
  }
LABEL_148:
  *(double *)(v5 + 672) = self->_thirdPartyMsgEveWeekday;
  *(_QWORD *)(v5 + 864) |= 0x80000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x10000) == 0)
  {
LABEL_35:
    if ((v7 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_150;
  }
LABEL_149:
  *(double *)(v5 + 648) = self->_thirdPartyMsgEveFri;
  *(_QWORD *)(v5 + 864) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x20000) == 0)
  {
LABEL_36:
    if ((v7 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_151;
  }
LABEL_150:
  *(double *)(v5 + 656) = self->_thirdPartyMsgEveSat;
  *(_QWORD *)(v5 + 864) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x40000) == 0)
  {
LABEL_37:
    if ((v7 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_152;
  }
LABEL_151:
  *(double *)(v5 + 664) = self->_thirdPartyMsgEveSun;
  *(_QWORD *)(v5 + 864) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_153;
  }
LABEL_152:
  *(double *)(v5 + 736) = self->_thirdPartyMsgNightWeekday;
  *(_QWORD *)(v5 + 864) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_154;
  }
LABEL_153:
  *(double *)(v5 + 712) = self->_thirdPartyMsgNightFri;
  *(_QWORD *)(v5 + 864) |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_155;
  }
LABEL_154:
  *(double *)(v5 + 720) = self->_thirdPartyMsgNightSat;
  *(_QWORD *)(v5 + 864) |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_156;
  }
LABEL_155:
  *(double *)(v5 + 728) = self->_thirdPartyMsgNightSun;
  *(_QWORD *)(v5 + 864) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_42:
    if ((has & 0x40000000000000) == 0)
      goto LABEL_43;
    goto LABEL_157;
  }
LABEL_156:
  *(double *)(v5 + 784) = self->_thirdPartyMsgTwoWeeks;
  *(_QWORD *)(v5 + 864) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_158;
  }
LABEL_157:
  *(_QWORD *)(v5 + 440) = self->_callTotal;
  *(_QWORD *)(v5 + 856) |= 0x40000000000000uLL;
  has = (uint64_t)self->_has;
  v7 = *((_QWORD *)&self->_has + 1);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_159;
  }
LABEL_158:
  *(_DWORD *)(v5 + 792) = self->_callBirthday;
  *(_QWORD *)(v5 + 864) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((*((_QWORD *)&self->_has + 1) & 0x8000000000) == 0)
  {
LABEL_45:
    if ((has & 0x80000000000000) == 0)
      goto LABEL_46;
    goto LABEL_160;
  }
LABEL_159:
  *(_DWORD *)(v5 + 812) = self->_contactFavorite;
  *(_QWORD *)(v5 + 864) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000000000) == 0)
  {
LABEL_46:
    if ((has & 2) == 0)
      goto LABEL_47;
    goto LABEL_161;
  }
LABEL_160:
  *(double *)(v5 + 448) = self->_callTotalDur;
  *(_QWORD *)(v5 + 856) |= 0x80000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 2) == 0)
  {
LABEL_47:
    if ((has & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_162;
  }
LABEL_161:
  *(double *)(v5 + 16) = self->_callDayRatio;
  *(_QWORD *)(v5 + 856) |= 2uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000) == 0)
  {
LABEL_48:
    if ((has & 0x10000000000000) == 0)
      goto LABEL_49;
    goto LABEL_163;
  }
LABEL_162:
  *(double *)(v5 + 312) = self->_callLongRatio;
  *(_QWORD *)(v5 + 856) |= 0x4000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) == 0)
  {
LABEL_49:
    if ((has & 1) == 0)
      goto LABEL_50;
    goto LABEL_164;
  }
LABEL_163:
  *(double *)(v5 + 424) = self->_callOutgoingRatio;
  *(_QWORD *)(v5 + 856) |= 0x10000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000) == 0)
      goto LABEL_51;
    goto LABEL_165;
  }
LABEL_164:
  *(double *)(v5 + 8) = self->_callAvgDur;
  *(_QWORD *)(v5 + 856) |= 1uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000) == 0)
  {
LABEL_51:
    if ((has & 0x80000000000) == 0)
      goto LABEL_52;
    goto LABEL_166;
  }
LABEL_165:
  *(double *)(v5 + 320) = self->_callMaxDur;
  *(_QWORD *)(v5 + 856) |= 0x8000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000000) == 0)
  {
LABEL_52:
    if ((has & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_167;
  }
LABEL_166:
  *(double *)(v5 + 352) = self->_callMorningWeekday;
  *(_QWORD *)(v5 + 856) |= 0x80000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000) == 0)
  {
LABEL_53:
    if ((has & 0x20000000000) == 0)
      goto LABEL_54;
    goto LABEL_168;
  }
LABEL_167:
  *(double *)(v5 + 328) = self->_callMorningFri;
  *(_QWORD *)(v5 + 856) |= 0x10000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000) == 0)
      goto LABEL_55;
    goto LABEL_169;
  }
LABEL_168:
  *(double *)(v5 + 336) = self->_callMorningSat;
  *(_QWORD *)(v5 + 856) |= 0x20000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_55:
    if ((has & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_170;
  }
LABEL_169:
  *(double *)(v5 + 344) = self->_callMorningSun;
  *(_QWORD *)(v5 + 856) |= 0x40000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((has & 0x1000000000000) == 0)
      goto LABEL_57;
    goto LABEL_171;
  }
LABEL_170:
  *(double *)(v5 + 416) = self->_callNoonWeekday;
  *(_QWORD *)(v5 + 856) |= 0x8000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000000) == 0)
  {
LABEL_57:
    if ((has & 0x2000000000000) == 0)
      goto LABEL_58;
    goto LABEL_172;
  }
LABEL_171:
  *(double *)(v5 + 392) = self->_callNoonFri;
  *(_QWORD *)(v5 + 856) |= 0x1000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000000) == 0)
  {
LABEL_58:
    if ((has & 0x4000000000000) == 0)
      goto LABEL_59;
    goto LABEL_173;
  }
LABEL_172:
  *(double *)(v5 + 400) = self->_callNoonSat;
  *(_QWORD *)(v5 + 856) |= 0x2000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000000000) == 0)
  {
LABEL_59:
    if ((has & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_174;
  }
LABEL_173:
  *(double *)(v5 + 408) = self->_callNoonSun;
  *(_QWORD *)(v5 + 856) |= 0x4000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000) == 0)
  {
LABEL_60:
    if ((has & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_175;
  }
LABEL_174:
  *(double *)(v5 + 176) = self->_callEveWeekday;
  *(_QWORD *)(v5 + 856) |= 0x200000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_176;
  }
LABEL_175:
  *(double *)(v5 + 152) = self->_callEveFri;
  *(_QWORD *)(v5 + 856) |= 0x40000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000) == 0)
  {
LABEL_62:
    if ((has & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_177;
  }
LABEL_176:
  *(double *)(v5 + 160) = self->_callEveSat;
  *(_QWORD *)(v5 + 856) |= 0x80000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000) == 0)
  {
LABEL_63:
    if ((has & 0x800000000000) == 0)
      goto LABEL_64;
    goto LABEL_178;
  }
LABEL_177:
  *(double *)(v5 + 168) = self->_callEveSun;
  *(_QWORD *)(v5 + 856) |= 0x100000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000000) == 0)
  {
LABEL_64:
    if ((has & 0x100000000000) == 0)
      goto LABEL_65;
    goto LABEL_179;
  }
LABEL_178:
  *(double *)(v5 + 384) = self->_callNightWeekday;
  *(_QWORD *)(v5 + 856) |= 0x800000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) == 0)
  {
LABEL_65:
    if ((has & 0x200000000000) == 0)
      goto LABEL_66;
    goto LABEL_180;
  }
LABEL_179:
  *(double *)(v5 + 360) = self->_callNightFri;
  *(_QWORD *)(v5 + 856) |= 0x100000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_66:
    if ((has & 0x400000000000) == 0)
      goto LABEL_67;
    goto LABEL_181;
  }
LABEL_180:
  *(double *)(v5 + 368) = self->_callNightSat;
  *(_QWORD *)(v5 + 856) |= 0x200000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000000) == 0)
  {
LABEL_67:
    if ((has & 0x200) == 0)
      goto LABEL_68;
    goto LABEL_182;
  }
LABEL_181:
  *(double *)(v5 + 376) = self->_callNightSun;
  *(_QWORD *)(v5 + 856) |= 0x400000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_68:
    if ((has & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_183;
  }
LABEL_182:
  *(double *)(v5 + 80) = self->_callDurMorningWeekday;
  *(_QWORD *)(v5 + 856) |= 0x200uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_69:
    if ((has & 0x80) == 0)
      goto LABEL_70;
    goto LABEL_184;
  }
LABEL_183:
  *(double *)(v5 + 56) = self->_callDurMorningFri;
  *(_QWORD *)(v5 + 856) |= 0x40uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_70:
    if ((has & 0x100) == 0)
      goto LABEL_71;
    goto LABEL_185;
  }
LABEL_184:
  *(double *)(v5 + 64) = self->_callDurMorningSat;
  *(_QWORD *)(v5 + 856) |= 0x80uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_71:
    if ((has & 0x20000) == 0)
      goto LABEL_72;
    goto LABEL_186;
  }
LABEL_185:
  *(double *)(v5 + 72) = self->_callDurMorningSun;
  *(_QWORD *)(v5 + 856) |= 0x100uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000) == 0)
  {
LABEL_72:
    if ((has & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_187;
  }
LABEL_186:
  *(double *)(v5 + 144) = self->_callDurNoonWeekday;
  *(_QWORD *)(v5 + 856) |= 0x20000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_73:
    if ((has & 0x8000) == 0)
      goto LABEL_74;
    goto LABEL_188;
  }
LABEL_187:
  *(double *)(v5 + 120) = self->_callDurNoonFri;
  *(_QWORD *)(v5 + 856) |= 0x4000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_74:
    if ((has & 0x10000) == 0)
      goto LABEL_75;
    goto LABEL_189;
  }
LABEL_188:
  *(double *)(v5 + 128) = self->_callDurNoonSat;
  *(_QWORD *)(v5 + 856) |= 0x8000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_75:
    if ((has & 0x20) == 0)
      goto LABEL_76;
    goto LABEL_190;
  }
LABEL_189:
  *(double *)(v5 + 136) = self->_callDurNoonSun;
  *(_QWORD *)(v5 + 856) |= 0x10000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_76:
    if ((has & 4) == 0)
      goto LABEL_77;
    goto LABEL_191;
  }
LABEL_190:
  *(double *)(v5 + 48) = self->_callDurEveWeekday;
  *(_QWORD *)(v5 + 856) |= 0x20uLL;
  has = (uint64_t)self->_has;
  if ((has & 4) == 0)
  {
LABEL_77:
    if ((has & 8) == 0)
      goto LABEL_78;
    goto LABEL_192;
  }
LABEL_191:
  *(double *)(v5 + 24) = self->_callDurEveFri;
  *(_QWORD *)(v5 + 856) |= 4uLL;
  has = (uint64_t)self->_has;
  if ((has & 8) == 0)
  {
LABEL_78:
    if ((has & 0x10) == 0)
      goto LABEL_79;
    goto LABEL_193;
  }
LABEL_192:
  *(double *)(v5 + 32) = self->_callDurEveSat;
  *(_QWORD *)(v5 + 856) |= 8uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_79:
    if ((has & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_194;
  }
LABEL_193:
  *(double *)(v5 + 40) = self->_callDurEveSun;
  *(_QWORD *)(v5 + 856) |= 0x10uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_80:
    if ((has & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_195;
  }
LABEL_194:
  *(double *)(v5 + 112) = self->_callDurNightWeekday;
  *(_QWORD *)(v5 + 856) |= 0x2000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_81:
    if ((has & 0x800) == 0)
      goto LABEL_82;
    goto LABEL_196;
  }
LABEL_195:
  *(double *)(v5 + 88) = self->_callDurNightFri;
  *(_QWORD *)(v5 + 856) |= 0x400uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_82:
    if ((has & 0x1000) == 0)
      goto LABEL_83;
    goto LABEL_197;
  }
LABEL_196:
  *(double *)(v5 + 96) = self->_callDurNightSat;
  *(_QWORD *)(v5 + 856) |= 0x800uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_83:
    if ((has & 0x20000000) == 0)
      goto LABEL_84;
    goto LABEL_198;
  }
LABEL_197:
  *(double *)(v5 + 104) = self->_callDurNightSun;
  *(_QWORD *)(v5 + 856) |= 0x1000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000) == 0)
  {
LABEL_84:
    if ((has & 0x4000000) == 0)
      goto LABEL_85;
    goto LABEL_199;
  }
LABEL_198:
  *(double *)(v5 + 240) = self->_callLongMorningWeekday;
  *(_QWORD *)(v5 + 856) |= 0x20000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x4000000) == 0)
  {
LABEL_85:
    if ((has & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_200;
  }
LABEL_199:
  *(double *)(v5 + 216) = self->_callLongMorningFri;
  *(_QWORD *)(v5 + 856) |= 0x4000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x8000000) == 0)
  {
LABEL_86:
    if ((has & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_201;
  }
LABEL_200:
  *(double *)(v5 + 224) = self->_callLongMorningSat;
  *(_QWORD *)(v5 + 856) |= 0x8000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000000) == 0)
  {
LABEL_87:
    if ((has & 0x2000000000) == 0)
      goto LABEL_88;
    goto LABEL_202;
  }
LABEL_201:
  *(double *)(v5 + 232) = self->_callLongMorningSun;
  *(_QWORD *)(v5 + 856) |= 0x10000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000000) == 0)
  {
LABEL_88:
    if ((has & 0x400000000) == 0)
      goto LABEL_89;
    goto LABEL_203;
  }
LABEL_202:
  *(double *)(v5 + 304) = self->_callLongNoonWeekday;
  *(_QWORD *)(v5 + 856) |= 0x2000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000000) == 0)
  {
LABEL_89:
    if ((has & 0x800000000) == 0)
      goto LABEL_90;
    goto LABEL_204;
  }
LABEL_203:
  *(double *)(v5 + 280) = self->_callLongNoonFri;
  *(_QWORD *)(v5 + 856) |= 0x400000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000000) == 0)
  {
LABEL_90:
    if ((has & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_205;
  }
LABEL_204:
  *(double *)(v5 + 288) = self->_callLongNoonSat;
  *(_QWORD *)(v5 + 856) |= 0x800000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000000) == 0)
  {
LABEL_91:
    if ((has & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_206;
  }
LABEL_205:
  *(double *)(v5 + 296) = self->_callLongNoonSun;
  *(_QWORD *)(v5 + 856) |= 0x1000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x2000000) == 0)
  {
LABEL_92:
    if ((has & 0x400000) == 0)
      goto LABEL_93;
    goto LABEL_207;
  }
LABEL_206:
  *(double *)(v5 + 208) = self->_callLongEveWeekday;
  *(_QWORD *)(v5 + 856) |= 0x2000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x400000) == 0)
  {
LABEL_93:
    if ((has & 0x800000) == 0)
      goto LABEL_94;
    goto LABEL_208;
  }
LABEL_207:
  *(double *)(v5 + 184) = self->_callLongEveFri;
  *(_QWORD *)(v5 + 856) |= 0x400000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x800000) == 0)
  {
LABEL_94:
    if ((has & 0x1000000) == 0)
      goto LABEL_95;
    goto LABEL_209;
  }
LABEL_208:
  *(double *)(v5 + 192) = self->_callLongEveSat;
  *(_QWORD *)(v5 + 856) |= 0x800000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x1000000) == 0)
  {
LABEL_95:
    if ((has & 0x200000000) == 0)
      goto LABEL_96;
    goto LABEL_210;
  }
LABEL_209:
  *(double *)(v5 + 200) = self->_callLongEveSun;
  *(_QWORD *)(v5 + 856) |= 0x1000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000) == 0)
  {
LABEL_96:
    if ((has & 0x40000000) == 0)
      goto LABEL_97;
    goto LABEL_211;
  }
LABEL_210:
  *(double *)(v5 + 272) = self->_callLongNightWeekday;
  *(_QWORD *)(v5 + 856) |= 0x200000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x40000000) == 0)
  {
LABEL_97:
    if ((has & 0x80000000) == 0)
      goto LABEL_98;
    goto LABEL_212;
  }
LABEL_211:
  *(double *)(v5 + 248) = self->_callLongNightFri;
  *(_QWORD *)(v5 + 856) |= 0x40000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x80000000) == 0)
  {
LABEL_98:
    if ((has & 0x100000000) == 0)
      goto LABEL_99;
    goto LABEL_213;
  }
LABEL_212:
  *(double *)(v5 + 256) = self->_callLongNightSat;
  *(_QWORD *)(v5 + 856) |= 0x80000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x100000000) == 0)
  {
LABEL_99:
    if ((has & 0x200000000000000) == 0)
      goto LABEL_100;
    goto LABEL_214;
  }
LABEL_213:
  *(double *)(v5 + 264) = self->_callLongNightSun;
  *(_QWORD *)(v5 + 856) |= 0x100000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((has & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_215;
  }
LABEL_214:
  *(double *)(v5 + 464) = self->_callTwoWeeks;
  *(_QWORD *)(v5 + 856) |= 0x200000000000000uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((has & 0x100000000000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_215:
  *(double *)(v5 + 432) = self->_callSixWeeks;
  *(_QWORD *)(v5 + 856) |= 0x20000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000000000) != 0)
  {
LABEL_102:
    *(double *)(v5 + 456) = self->_callTwelveWeeks;
    *(_QWORD *)(v5 + 856) |= 0x100000000000000uLL;
  }
LABEL_103:
  if ((*((_BYTE *)&self->_has + 12) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 808) = self->_contactFamilyRelation;
    *(_QWORD *)(v5 + 864) |= 0x4000000000uLL;
  }
  v9 = -[NSString copyWithZone:](self->_contactRelation, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 848);
  *(_QWORD *)(v6 + 848) = v9;

  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x2000000000) != 0)
  {
    *(_DWORD *)(v6 + 804) = self->_contactFamilyName;
    *(_QWORD *)(v6 + 864) |= 0x2000000000uLL;
    v11 = *((_QWORD *)&self->_has + 1);
    if ((v11 & 0x800000000000) == 0)
    {
LABEL_107:
      if ((v11 & 0x800000000) == 0)
        goto LABEL_108;
      goto LABEL_219;
    }
  }
  else if ((v11 & 0x800000000000) == 0)
  {
    goto LABEL_107;
  }
  *(_DWORD *)(v6 + 844) = self->_contactParent;
  *(_QWORD *)(v6 + 864) |= 0x800000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x800000000) == 0)
  {
LABEL_108:
    if ((v11 & 0x1000000000) == 0)
      goto LABEL_109;
    goto LABEL_220;
  }
LABEL_219:
  *(_DWORD *)(v6 + 796) = self->_contactEmergency;
  *(_QWORD *)(v6 + 864) |= 0x800000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x1000000000) == 0)
  {
LABEL_109:
    if ((v11 & 0x200000000000) == 0)
      goto LABEL_110;
    goto LABEL_221;
  }
LABEL_220:
  *(_DWORD *)(v6 + 800) = self->_contactEmergencyFamily;
  *(_QWORD *)(v6 + 864) |= 0x1000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x200000000000) == 0)
  {
LABEL_110:
    if ((v11 & 0x400000000000) == 0)
      goto LABEL_111;
    goto LABEL_222;
  }
LABEL_221:
  *(_DWORD *)(v6 + 836) = self->_contactInHome;
  *(_QWORD *)(v6 + 864) |= 0x200000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x400000000000) == 0)
  {
LABEL_111:
    if ((v11 & 0x10000000000) == 0)
      goto LABEL_112;
    goto LABEL_223;
  }
LABEL_222:
  *(_DWORD *)(v6 + 840) = self->_contactInPhotos;
  *(_QWORD *)(v6 + 864) |= 0x400000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x10000000000) == 0)
  {
LABEL_112:
    if ((v11 & 0x20000000000) == 0)
      goto LABEL_113;
    goto LABEL_224;
  }
LABEL_223:
  *(_DWORD *)(v6 + 816) = self->_contactInAirDrop;
  *(_QWORD *)(v6 + 864) |= 0x10000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x20000000000) == 0)
  {
LABEL_113:
    if ((v11 & 0x80000000000) == 0)
      goto LABEL_114;
    goto LABEL_225;
  }
LABEL_224:
  *(_DWORD *)(v6 + 820) = self->_contactInAirDropAtHome;
  *(_QWORD *)(v6 + 864) |= 0x20000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_114:
    if ((v11 & 0x100000000000) == 0)
      goto LABEL_115;
LABEL_226:
    *(_DWORD *)(v6 + 832) = self->_contactInFMFSharingWithMe;
    *(_QWORD *)(v6 + 864) |= 0x100000000000uLL;
    if ((*((_QWORD *)&self->_has + 1) & 0x40000000000) == 0)
      goto LABEL_117;
    goto LABEL_116;
  }
LABEL_225:
  *(_DWORD *)(v6 + 828) = self->_contactInFMFFollowingMe;
  *(_QWORD *)(v6 + 864) |= 0x80000000000uLL;
  v11 = *((_QWORD *)&self->_has + 1);
  if ((v11 & 0x100000000000) != 0)
    goto LABEL_226;
LABEL_115:
  if ((v11 & 0x40000000000) != 0)
  {
LABEL_116:
    *(_DWORD *)(v6 + 824) = self->_contactInFMFFavorite;
    *(_QWORD *)(v6 + 864) |= 0x40000000000uLL;
  }
LABEL_117:
  v12 = (id)v6;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *contactRelation;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_564;
  has = (uint64_t)self->_has;
  v5 = *((_QWORD *)&self->_has + 1);
  v7 = *((_QWORD *)v4 + 107);
  v8 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_firstPartyMsgTotal != *((_QWORD *)v4 + 78))
      goto LABEL_564;
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v7 & 0x400000000000000) == 0 || self->_firstPartyMsgDayRatio != *((double *)v4 + 59))
      goto LABEL_564;
  }
  else if ((v7 & 0x400000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_firstPartyMsgOutgoingRatio != *((double *)v4 + 76))
      goto LABEL_564;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_firstPartyMsgMorningWeekday != *((double *)v4 + 67))
      goto LABEL_564;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_564;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0 || self->_firstPartyMsgMorningFri != *((double *)v4 + 64))
      goto LABEL_564;
  }
  else if (v7 < 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_firstPartyMsgMorningSat != *((double *)v4 + 65))
      goto LABEL_564;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_firstPartyMsgMorningSun != *((double *)v4 + 66))
      goto LABEL_564;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_firstPartyMsgNoonWeekday != *((double *)v4 + 75))
      goto LABEL_564;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_firstPartyMsgNoonFri != *((double *)v4 + 72))
      goto LABEL_564;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_firstPartyMsgNoonSat != *((double *)v4 + 73))
      goto LABEL_564;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_firstPartyMsgNoonSun != *((double *)v4 + 74))
      goto LABEL_564;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0 || self->_firstPartyMsgEveWeekday != *((double *)v4 + 63))
      goto LABEL_564;
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0 || self->_firstPartyMsgEveFri != *((double *)v4 + 60))
      goto LABEL_564;
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0 || self->_firstPartyMsgEveSat != *((double *)v4 + 61))
      goto LABEL_564;
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) == 0 || self->_firstPartyMsgEveSun != *((double *)v4 + 62))
      goto LABEL_564;
  }
  else if ((v7 & 0x2000000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_firstPartyMsgNightWeekday != *((double *)v4 + 71))
      goto LABEL_564;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_firstPartyMsgNightFri != *((double *)v4 + 68))
      goto LABEL_564;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_firstPartyMsgNightSat != *((double *)v4 + 69))
      goto LABEL_564;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_firstPartyMsgNightSun != *((double *)v4 + 70))
      goto LABEL_564;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_firstPartyMsgTwoWeeks != *((double *)v4 + 79))
      goto LABEL_564;
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_firstPartyMsgSixWeeks != *((double *)v4 + 77))
      goto LABEL_564;
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x100000000) != 0)
  {
    if ((v8 & 0x100000000) == 0 || self->_thirdPartyMsgTotal != *((_QWORD *)v4 + 97))
      goto LABEL_564;
  }
  else if ((v8 & 0x100000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_thirdPartyMsgDayRatio != *((double *)v4 + 80))
      goto LABEL_564;
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_thirdPartyMsgMorningWeekday != *((double *)v4 + 88))
      goto LABEL_564;
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_thirdPartyMsgMorningFri != *((double *)v4 + 85))
      goto LABEL_564;
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_thirdPartyMsgMorningSat != *((double *)v4 + 86))
      goto LABEL_564;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_thirdPartyMsgMorningSun != *((double *)v4 + 87))
      goto LABEL_564;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_thirdPartyMsgNoonWeekday != *((double *)v4 + 96))
      goto LABEL_564;
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_thirdPartyMsgNoonFri != *((double *)v4 + 93))
      goto LABEL_564;
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_thirdPartyMsgNoonSat != *((double *)v4 + 94))
      goto LABEL_564;
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_thirdPartyMsgNoonSun != *((double *)v4 + 95))
      goto LABEL_564;
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_thirdPartyMsgEveWeekday != *((double *)v4 + 84))
      goto LABEL_564;
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_thirdPartyMsgEveFri != *((double *)v4 + 81))
      goto LABEL_564;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_thirdPartyMsgEveSat != *((double *)v4 + 82))
      goto LABEL_564;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_thirdPartyMsgEveSun != *((double *)v4 + 83))
      goto LABEL_564;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_thirdPartyMsgNightWeekday != *((double *)v4 + 92))
      goto LABEL_564;
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_thirdPartyMsgNightFri != *((double *)v4 + 89))
      goto LABEL_564;
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_thirdPartyMsgNightSat != *((double *)v4 + 90))
      goto LABEL_564;
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_thirdPartyMsgNightSun != *((double *)v4 + 91))
      goto LABEL_564;
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x200000000) != 0)
  {
    if ((v8 & 0x200000000) == 0 || self->_thirdPartyMsgTwoWeeks != *((double *)v4 + 98))
      goto LABEL_564;
  }
  else if ((v8 & 0x200000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v7 & 0x40000000000000) == 0 || self->_callTotal != *((_QWORD *)v4 + 55))
      goto LABEL_564;
  }
  else if ((v7 & 0x40000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x400000000) != 0)
  {
    if ((v8 & 0x400000000) == 0 || self->_callBirthday != *((_DWORD *)v4 + 198))
      goto LABEL_564;
  }
  else if ((v8 & 0x400000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x8000000000) != 0)
  {
    if ((v8 & 0x8000000000) == 0 || self->_contactFavorite != *((_DWORD *)v4 + 203))
      goto LABEL_564;
  }
  else if ((v8 & 0x8000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v7 & 0x80000000000000) == 0 || self->_callTotalDur != *((double *)v4 + 56))
      goto LABEL_564;
  }
  else if ((v7 & 0x80000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_callDayRatio != *((double *)v4 + 2))
      goto LABEL_564;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_callLongRatio != *((double *)v4 + 39))
      goto LABEL_564;
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v7 & 0x10000000000000) == 0 || self->_callOutgoingRatio != *((double *)v4 + 53))
      goto LABEL_564;
  }
  else if ((v7 & 0x10000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_callAvgDur != *((double *)v4 + 1))
      goto LABEL_564;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_callMaxDur != *((double *)v4 + 40))
      goto LABEL_564;
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_callMorningWeekday != *((double *)v4 + 44))
      goto LABEL_564;
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_callMorningFri != *((double *)v4 + 41))
      goto LABEL_564;
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_564;
  }
  v10 = *((_QWORD *)v4 + 107);
  v9 = *((_QWORD *)v4 + 108);
  if ((has & 0x20000000000) != 0)
  {
    if ((v10 & 0x20000000000) == 0 || self->_callMorningSat != *((double *)v4 + 42))
      goto LABEL_564;
  }
  else if ((v10 & 0x20000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v10 & 0x40000000000) == 0 || self->_callMorningSun != *((double *)v4 + 43))
      goto LABEL_564;
  }
  else if ((v10 & 0x40000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v10 & 0x8000000000000) == 0 || self->_callNoonWeekday != *((double *)v4 + 52))
      goto LABEL_564;
  }
  else if ((v10 & 0x8000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v10 & 0x1000000000000) == 0 || self->_callNoonFri != *((double *)v4 + 49))
      goto LABEL_564;
  }
  else if ((v10 & 0x1000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v10 & 0x2000000000000) == 0 || self->_callNoonSat != *((double *)v4 + 50))
      goto LABEL_564;
  }
  else if ((v10 & 0x2000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v10 & 0x4000000000000) == 0 || self->_callNoonSun != *((double *)v4 + 51))
      goto LABEL_564;
  }
  else if ((v10 & 0x4000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_callEveWeekday != *((double *)v4 + 22))
      goto LABEL_564;
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_callEveFri != *((double *)v4 + 19))
      goto LABEL_564;
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_callEveSat != *((double *)v4 + 20))
      goto LABEL_564;
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_callEveSun != *((double *)v4 + 21))
      goto LABEL_564;
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v10 & 0x800000000000) == 0 || self->_callNightWeekday != *((double *)v4 + 48))
      goto LABEL_564;
  }
  else if ((v10 & 0x800000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v10 & 0x100000000000) == 0 || self->_callNightFri != *((double *)v4 + 45))
      goto LABEL_564;
  }
  else if ((v10 & 0x100000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v10 & 0x200000000000) == 0 || self->_callNightSat != *((double *)v4 + 46))
      goto LABEL_564;
  }
  else if ((v10 & 0x200000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v10 & 0x400000000000) == 0 || self->_callNightSun != *((double *)v4 + 47))
      goto LABEL_564;
  }
  else if ((v10 & 0x400000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_callDurMorningWeekday != *((double *)v4 + 10))
      goto LABEL_564;
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_callDurMorningFri != *((double *)v4 + 7))
      goto LABEL_564;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_callDurMorningSat != *((double *)v4 + 8))
      goto LABEL_564;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_callDurMorningSun != *((double *)v4 + 9))
      goto LABEL_564;
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_callDurNoonWeekday != *((double *)v4 + 18))
      goto LABEL_564;
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_callDurNoonFri != *((double *)v4 + 15))
      goto LABEL_564;
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_callDurNoonSat != *((double *)v4 + 16))
      goto LABEL_564;
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_callDurNoonSun != *((double *)v4 + 17))
      goto LABEL_564;
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_callDurEveWeekday != *((double *)v4 + 6))
      goto LABEL_564;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_callDurEveFri != *((double *)v4 + 3))
      goto LABEL_564;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_callDurEveSat != *((double *)v4 + 4))
      goto LABEL_564;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_callDurEveSun != *((double *)v4 + 5))
      goto LABEL_564;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_callDurNightWeekday != *((double *)v4 + 14))
      goto LABEL_564;
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_callDurNightFri != *((double *)v4 + 11))
      goto LABEL_564;
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_callDurNightSat != *((double *)v4 + 12))
      goto LABEL_564;
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_callDurNightSun != *((double *)v4 + 13))
      goto LABEL_564;
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_callLongMorningWeekday != *((double *)v4 + 30))
      goto LABEL_564;
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_callLongMorningFri != *((double *)v4 + 27))
      goto LABEL_564;
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_callLongMorningSat != *((double *)v4 + 28))
      goto LABEL_564;
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_callLongMorningSun != *((double *)v4 + 29))
      goto LABEL_564;
  }
  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_callLongNoonWeekday != *((double *)v4 + 38))
      goto LABEL_564;
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_callLongNoonFri != *((double *)v4 + 35))
      goto LABEL_564;
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_callLongNoonSat != *((double *)v4 + 36))
      goto LABEL_564;
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_callLongNoonSun != *((double *)v4 + 37))
      goto LABEL_564;
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0 || self->_callLongEveWeekday != *((double *)v4 + 26))
      goto LABEL_564;
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_callLongEveFri != *((double *)v4 + 23))
      goto LABEL_564;
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_callLongEveSat != *((double *)v4 + 24))
      goto LABEL_564;
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_callLongEveSun != *((double *)v4 + 25))
      goto LABEL_564;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_callLongNightWeekday != *((double *)v4 + 34))
      goto LABEL_564;
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_callLongNightFri != *((double *)v4 + 31))
      goto LABEL_564;
  }
  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_callLongNightSat != *((double *)v4 + 32))
      goto LABEL_564;
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_callLongNightSun != *((double *)v4 + 33))
      goto LABEL_564;
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v10 & 0x200000000000000) == 0 || self->_callTwoWeeks != *((double *)v4 + 58))
      goto LABEL_564;
  }
  else if ((v10 & 0x200000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v10 & 0x20000000000000) == 0 || self->_callSixWeeks != *((double *)v4 + 54))
      goto LABEL_564;
  }
  else if ((v10 & 0x20000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v10 & 0x100000000000000) == 0 || self->_callTwelveWeeks != *((double *)v4 + 57))
      goto LABEL_564;
  }
  else if ((v10 & 0x100000000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v5 & 0x4000000000) != 0)
  {
    if ((v9 & 0x4000000000) == 0 || self->_contactFamilyRelation != *((_DWORD *)v4 + 202))
      goto LABEL_564;
  }
  else if ((v9 & 0x4000000000) != 0)
  {
    goto LABEL_564;
  }
  contactRelation = self->_contactRelation;
  if ((unint64_t)contactRelation | *((_QWORD *)v4 + 106)
    && !-[NSString isEqual:](contactRelation, "isEqual:"))
  {
    goto LABEL_564;
  }
  v12 = *((_QWORD *)&self->_has + 1);
  v13 = *((_QWORD *)v4 + 108);
  if ((v12 & 0x2000000000) != 0)
  {
    if ((v13 & 0x2000000000) == 0 || self->_contactFamilyName != *((_DWORD *)v4 + 201))
      goto LABEL_564;
  }
  else if ((v13 & 0x2000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x800000000000) != 0)
  {
    if ((v13 & 0x800000000000) == 0 || self->_contactParent != *((_DWORD *)v4 + 211))
      goto LABEL_564;
  }
  else if ((v13 & 0x800000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x800000000) != 0)
  {
    if ((v13 & 0x800000000) == 0 || self->_contactEmergency != *((_DWORD *)v4 + 199))
      goto LABEL_564;
  }
  else if ((v13 & 0x800000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x1000000000) != 0)
  {
    if ((v13 & 0x1000000000) == 0 || self->_contactEmergencyFamily != *((_DWORD *)v4 + 200))
      goto LABEL_564;
  }
  else if ((v13 & 0x1000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x200000000000) != 0)
  {
    if ((v13 & 0x200000000000) == 0 || self->_contactInHome != *((_DWORD *)v4 + 209))
      goto LABEL_564;
  }
  else if ((v13 & 0x200000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x400000000000) != 0)
  {
    if ((v13 & 0x400000000000) == 0 || self->_contactInPhotos != *((_DWORD *)v4 + 210))
      goto LABEL_564;
  }
  else if ((v13 & 0x400000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x10000000000) != 0)
  {
    if ((v13 & 0x10000000000) == 0 || self->_contactInAirDrop != *((_DWORD *)v4 + 204))
      goto LABEL_564;
  }
  else if ((v13 & 0x10000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x20000000000) != 0)
  {
    if ((v13 & 0x20000000000) == 0 || self->_contactInAirDropAtHome != *((_DWORD *)v4 + 205))
      goto LABEL_564;
  }
  else if ((v13 & 0x20000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x80000000000) != 0)
  {
    if ((v13 & 0x80000000000) == 0 || self->_contactInFMFFollowingMe != *((_DWORD *)v4 + 207))
      goto LABEL_564;
  }
  else if ((v13 & 0x80000000000) != 0)
  {
    goto LABEL_564;
  }
  if ((v12 & 0x100000000000) == 0)
  {
    if ((v13 & 0x100000000000) == 0)
      goto LABEL_559;
LABEL_564:
    v14 = 0;
    goto LABEL_565;
  }
  if ((v13 & 0x100000000000) == 0 || self->_contactInFMFSharingWithMe != *((_DWORD *)v4 + 208))
    goto LABEL_564;
LABEL_559:
  if ((v12 & 0x40000000000) != 0)
  {
    if ((v13 & 0x40000000000) == 0 || self->_contactInFMFFavorite != *((_DWORD *)v4 + 206))
      goto LABEL_564;
    v14 = 1;
  }
  else
  {
    v14 = (v13 & 0x40000000000) == 0;
  }
LABEL_565:

  return v14;
}

- (unint64_t)hash
{
  uint64_t has;
  uint64_t v4;
  double firstPartyMsgDayRatio;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double firstPartyMsgOutgoingRatio;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double firstPartyMsgMorningWeekday;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double firstPartyMsgMorningFri;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double firstPartyMsgMorningSat;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  double firstPartyMsgMorningSun;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  double firstPartyMsgNoonWeekday;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double firstPartyMsgNoonFri;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  double firstPartyMsgNoonSat;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  double firstPartyMsgNoonSun;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  double firstPartyMsgEveWeekday;
  double v57;
  long double v58;
  double v59;
  unint64_t v60;
  double firstPartyMsgEveFri;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  double firstPartyMsgEveSat;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  double firstPartyMsgEveSun;
  double v72;
  long double v73;
  double v74;
  unint64_t v75;
  double firstPartyMsgNightWeekday;
  double v77;
  long double v78;
  double v79;
  unint64_t v80;
  double firstPartyMsgNightFri;
  double v82;
  long double v83;
  double v84;
  unint64_t v85;
  double firstPartyMsgNightSat;
  double v87;
  long double v88;
  double v89;
  unint64_t v90;
  double firstPartyMsgNightSun;
  double v92;
  long double v93;
  double v94;
  unint64_t v95;
  double firstPartyMsgTwoWeeks;
  double v97;
  long double v98;
  double v99;
  unint64_t v100;
  double firstPartyMsgSixWeeks;
  double v102;
  long double v103;
  double v104;
  double thirdPartyMsgDayRatio;
  double v106;
  long double v107;
  double v108;
  unint64_t v109;
  unint64_t v110;
  double thirdPartyMsgMorningWeekday;
  double v112;
  long double v113;
  double v114;
  unint64_t v115;
  double thirdPartyMsgMorningFri;
  double v117;
  long double v118;
  double v119;
  unint64_t v120;
  double thirdPartyMsgMorningSat;
  double v122;
  long double v123;
  double v124;
  unint64_t v125;
  double thirdPartyMsgMorningSun;
  double v127;
  long double v128;
  double v129;
  unint64_t v130;
  double thirdPartyMsgNoonWeekday;
  double v132;
  long double v133;
  double v134;
  unint64_t v135;
  double thirdPartyMsgNoonFri;
  double v137;
  long double v138;
  double v139;
  unint64_t v140;
  double thirdPartyMsgNoonSat;
  double v142;
  long double v143;
  double v144;
  unint64_t v145;
  double thirdPartyMsgNoonSun;
  double v147;
  long double v148;
  double v149;
  unint64_t v150;
  double thirdPartyMsgEveWeekday;
  double v152;
  long double v153;
  double v154;
  unint64_t v155;
  double thirdPartyMsgEveFri;
  double v157;
  long double v158;
  double v159;
  unint64_t v160;
  double thirdPartyMsgEveSat;
  double v162;
  long double v163;
  double v164;
  unint64_t v165;
  double thirdPartyMsgEveSun;
  double v167;
  long double v168;
  double v169;
  unint64_t v170;
  double thirdPartyMsgNightWeekday;
  double v172;
  long double v173;
  double v174;
  unint64_t v175;
  double thirdPartyMsgNightFri;
  double v177;
  long double v178;
  double v179;
  unint64_t v180;
  double thirdPartyMsgNightSat;
  double v182;
  long double v183;
  double v184;
  unint64_t v185;
  double thirdPartyMsgNightSun;
  double v187;
  long double v188;
  double v189;
  unint64_t v190;
  double thirdPartyMsgTwoWeeks;
  double v192;
  long double v193;
  double v194;
  double callTotalDur;
  double v196;
  long double v197;
  double v198;
  unint64_t v199;
  unint64_t v200;
  double callDayRatio;
  double v202;
  long double v203;
  double v204;
  unint64_t v205;
  double callLongRatio;
  double v207;
  long double v208;
  double v209;
  unint64_t v210;
  double callOutgoingRatio;
  double v212;
  long double v213;
  double v214;
  unint64_t v215;
  double callAvgDur;
  double v217;
  long double v218;
  double v219;
  unint64_t v220;
  double callMaxDur;
  double v222;
  long double v223;
  double v224;
  unint64_t v225;
  double callMorningWeekday;
  double v227;
  long double v228;
  double v229;
  unint64_t v230;
  double callMorningFri;
  double v232;
  long double v233;
  double v234;
  unint64_t v235;
  double callMorningSat;
  double v237;
  long double v238;
  double v239;
  unint64_t v240;
  double callMorningSun;
  double v242;
  long double v243;
  double v244;
  unint64_t v245;
  double callNoonWeekday;
  double v247;
  long double v248;
  double v249;
  unint64_t v250;
  double callNoonFri;
  double v252;
  long double v253;
  double v254;
  unint64_t v255;
  double callNoonSat;
  double v257;
  long double v258;
  double v259;
  unint64_t v260;
  double callNoonSun;
  double v262;
  long double v263;
  double v264;
  unint64_t v265;
  double callEveWeekday;
  double v267;
  long double v268;
  double v269;
  unint64_t v270;
  double callEveFri;
  double v272;
  long double v273;
  double v274;
  unint64_t v275;
  double callEveSat;
  double v277;
  long double v278;
  double v279;
  unint64_t v280;
  double callEveSun;
  double v282;
  long double v283;
  double v284;
  unint64_t v285;
  double callNightWeekday;
  double v287;
  long double v288;
  double v289;
  unint64_t v290;
  double callNightFri;
  double v292;
  long double v293;
  double v294;
  unint64_t v295;
  double callNightSat;
  double v297;
  long double v298;
  double v299;
  unint64_t v300;
  double callNightSun;
  double v302;
  long double v303;
  double v304;
  unint64_t v305;
  double callDurMorningWeekday;
  double v307;
  long double v308;
  double v309;
  unint64_t v310;
  double callDurMorningFri;
  double v312;
  long double v313;
  double v314;
  unint64_t v315;
  double callDurMorningSat;
  double v317;
  long double v318;
  double v319;
  unint64_t v320;
  double callDurMorningSun;
  double v322;
  long double v323;
  double v324;
  unint64_t v325;
  double callDurNoonWeekday;
  double v327;
  long double v328;
  double v329;
  unint64_t v330;
  double callDurNoonFri;
  double v332;
  long double v333;
  double v334;
  unint64_t v335;
  double callDurNoonSat;
  double v337;
  long double v338;
  double v339;
  unint64_t v340;
  double callDurNoonSun;
  double v342;
  long double v343;
  double v344;
  unint64_t v345;
  double callDurEveWeekday;
  double v347;
  long double v348;
  double v349;
  unint64_t v350;
  double callDurEveFri;
  double v352;
  long double v353;
  double v354;
  unint64_t v355;
  double callDurEveSat;
  double v357;
  long double v358;
  double v359;
  unint64_t v360;
  double callDurEveSun;
  double v362;
  long double v363;
  double v364;
  unint64_t v365;
  double callDurNightWeekday;
  double v367;
  long double v368;
  double v369;
  unint64_t v370;
  double callDurNightFri;
  double v372;
  long double v373;
  double v374;
  unint64_t v375;
  double callDurNightSat;
  double v377;
  long double v378;
  double v379;
  unint64_t v380;
  double callDurNightSun;
  double v382;
  long double v383;
  double v384;
  unint64_t v385;
  double callLongMorningWeekday;
  double v387;
  long double v388;
  double v389;
  unint64_t v390;
  double callLongMorningFri;
  double v392;
  long double v393;
  double v394;
  unint64_t v395;
  double callLongMorningSat;
  double v397;
  long double v398;
  double v399;
  unint64_t v400;
  double callLongMorningSun;
  double v402;
  long double v403;
  double v404;
  unint64_t v405;
  double callLongNoonWeekday;
  double v407;
  long double v408;
  double v409;
  unint64_t v410;
  double callLongNoonFri;
  double v412;
  long double v413;
  double v414;
  unint64_t v415;
  double callLongNoonSat;
  double v417;
  long double v418;
  double v419;
  unint64_t v420;
  double callLongNoonSun;
  double v422;
  long double v423;
  double v424;
  unint64_t v425;
  double callLongEveWeekday;
  double v427;
  long double v428;
  double v429;
  unint64_t v430;
  double callLongEveFri;
  double v432;
  long double v433;
  double v434;
  unint64_t v435;
  double callLongEveSat;
  double v437;
  long double v438;
  double v439;
  unint64_t v440;
  double callLongEveSun;
  double v442;
  long double v443;
  double v444;
  unint64_t v445;
  double callLongNightWeekday;
  double v447;
  long double v448;
  double v449;
  unint64_t v450;
  double callLongNightFri;
  double v452;
  long double v453;
  double v454;
  unint64_t v455;
  double callLongNightSat;
  double v457;
  long double v458;
  double v459;
  unint64_t v460;
  double callLongNightSun;
  double v462;
  long double v463;
  double v464;
  unint64_t v465;
  unint64_t v466;
  unint64_t v467;
  double callTwoWeeks;
  double v469;
  long double v470;
  double v471;
  unint64_t v472;
  unint64_t v473;
  double callSixWeeks;
  double v475;
  long double v476;
  double v477;
  unint64_t v478;
  double callTwelveWeeks;
  double v480;
  long double v481;
  double v482;
  uint64_t v483;
  NSUInteger v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  unint64_t v498;
  unint64_t v499;
  unint64_t v500;
  unint64_t v501;
  unint64_t v502;
  unint64_t v503;
  unint64_t v504;
  unint64_t v505;
  unint64_t v506;
  unint64_t v507;
  unint64_t v508;
  unint64_t v509;
  unint64_t v510;
  unint64_t v511;
  unint64_t v512;
  unint64_t v513;
  unint64_t v514;
  unint64_t v515;
  unint64_t v516;
  unint64_t v517;
  unint64_t v518;
  unint64_t v519;
  unint64_t v520;
  unint64_t v521;
  unint64_t v522;
  unint64_t v523;
  unint64_t v524;
  unint64_t v525;
  unint64_t v526;
  unint64_t v527;
  unint64_t v528;
  unint64_t v529;
  unint64_t v530;
  unint64_t v531;
  unint64_t v532;
  unint64_t v533;
  unint64_t v534;
  unint64_t v535;
  unint64_t v536;
  unint64_t v537;
  unint64_t v538;
  unint64_t v539;
  unint64_t v540;
  unint64_t v541;
  unint64_t v542;
  unint64_t v543;
  unint64_t v544;
  unint64_t v545;
  unint64_t v546;
  unint64_t v547;
  unint64_t v548;
  unint64_t v549;
  unint64_t v550;
  uint64_t v551;
  uint64_t v552;
  unint64_t v553;
  unint64_t v554;
  unint64_t v555;
  unint64_t v556;
  unint64_t v557;
  unint64_t v558;
  unint64_t v559;
  unint64_t v560;
  unint64_t v561;
  unint64_t v562;
  unint64_t v563;
  unint64_t v564;
  unint64_t v565;
  unint64_t v566;
  unint64_t v567;
  unint64_t v568;
  unint64_t v569;
  unint64_t v570;
  unint64_t v571;
  unint64_t v572;
  unint64_t v573;
  unint64_t v574;
  unint64_t v575;
  unint64_t v576;
  unint64_t v577;
  unint64_t v578;
  unint64_t v579;
  unint64_t v580;
  unint64_t v581;
  unint64_t v582;
  unint64_t v583;
  unint64_t v584;
  unint64_t v585;
  unint64_t v586;
  unint64_t v587;
  unint64_t v588;
  unint64_t v589;
  unint64_t v590;

  has = (uint64_t)self->_has;
  v4 = *((_QWORD *)&self->_has + 1);
  if ((v4 & 0x2000) != 0)
  {
    v590 = 2654435761u * self->_firstPartyMsgTotal;
    if ((has & 0x400000000000000) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v590 = 0;
  if ((has & 0x400000000000000) == 0)
    goto LABEL_8;
LABEL_3:
  firstPartyMsgDayRatio = self->_firstPartyMsgDayRatio;
  v6 = -firstPartyMsgDayRatio;
  if (firstPartyMsgDayRatio >= 0.0)
    v6 = self->_firstPartyMsgDayRatio;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((v4 & 0x800) != 0)
  {
    firstPartyMsgOutgoingRatio = self->_firstPartyMsgOutgoingRatio;
    v12 = -firstPartyMsgOutgoingRatio;
    if (firstPartyMsgOutgoingRatio >= 0.0)
      v12 = self->_firstPartyMsgOutgoingRatio;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((v4 & 4) != 0)
  {
    firstPartyMsgMorningWeekday = self->_firstPartyMsgMorningWeekday;
    v17 = -firstPartyMsgMorningWeekday;
    if (firstPartyMsgMorningWeekday >= 0.0)
      v17 = self->_firstPartyMsgMorningWeekday;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if (has < 0)
  {
    firstPartyMsgMorningFri = self->_firstPartyMsgMorningFri;
    v22 = -firstPartyMsgMorningFri;
    if (firstPartyMsgMorningFri >= 0.0)
      v22 = self->_firstPartyMsgMorningFri;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((v4 & 1) != 0)
  {
    firstPartyMsgMorningSat = self->_firstPartyMsgMorningSat;
    v27 = -firstPartyMsgMorningSat;
    if (firstPartyMsgMorningSat >= 0.0)
      v27 = self->_firstPartyMsgMorningSat;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((v4 & 2) != 0)
  {
    firstPartyMsgMorningSun = self->_firstPartyMsgMorningSun;
    v32 = -firstPartyMsgMorningSun;
    if (firstPartyMsgMorningSun >= 0.0)
      v32 = self->_firstPartyMsgMorningSun;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((v4 & 0x400) != 0)
  {
    firstPartyMsgNoonWeekday = self->_firstPartyMsgNoonWeekday;
    v37 = -firstPartyMsgNoonWeekday;
    if (firstPartyMsgNoonWeekday >= 0.0)
      v37 = self->_firstPartyMsgNoonWeekday;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  v586 = v35;
  if ((v4 & 0x80) != 0)
  {
    firstPartyMsgNoonFri = self->_firstPartyMsgNoonFri;
    v42 = -firstPartyMsgNoonFri;
    if (firstPartyMsgNoonFri >= 0.0)
      v42 = self->_firstPartyMsgNoonFri;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  v585 = v40;
  if ((v4 & 0x100) != 0)
  {
    firstPartyMsgNoonSat = self->_firstPartyMsgNoonSat;
    v47 = -firstPartyMsgNoonSat;
    if (firstPartyMsgNoonSat >= 0.0)
      v47 = self->_firstPartyMsgNoonSat;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  v584 = v45;
  if ((v4 & 0x200) != 0)
  {
    firstPartyMsgNoonSun = self->_firstPartyMsgNoonSun;
    v52 = -firstPartyMsgNoonSun;
    if (firstPartyMsgNoonSun >= 0.0)
      v52 = self->_firstPartyMsgNoonSun;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  v583 = v50;
  if ((has & 0x4000000000000000) != 0)
  {
    firstPartyMsgEveWeekday = self->_firstPartyMsgEveWeekday;
    v57 = -firstPartyMsgEveWeekday;
    if (firstPartyMsgEveWeekday >= 0.0)
      v57 = self->_firstPartyMsgEveWeekday;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  v582 = v55;
  if ((has & 0x800000000000000) != 0)
  {
    firstPartyMsgEveFri = self->_firstPartyMsgEveFri;
    v62 = -firstPartyMsgEveFri;
    if (firstPartyMsgEveFri >= 0.0)
      v62 = self->_firstPartyMsgEveFri;
    v63 = floor(v62 + 0.5);
    v64 = (v62 - v63) * 1.84467441e19;
    v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0)
        v60 += (unint64_t)v64;
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    v60 = 0;
  }
  v581 = v60;
  if ((has & 0x1000000000000000) != 0)
  {
    firstPartyMsgEveSat = self->_firstPartyMsgEveSat;
    v67 = -firstPartyMsgEveSat;
    if (firstPartyMsgEveSat >= 0.0)
      v67 = self->_firstPartyMsgEveSat;
    v68 = floor(v67 + 0.5);
    v69 = (v67 - v68) * 1.84467441e19;
    v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0)
        v65 += (unint64_t)v69;
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    v65 = 0;
  }
  v580 = v65;
  if ((has & 0x2000000000000000) != 0)
  {
    firstPartyMsgEveSun = self->_firstPartyMsgEveSun;
    v72 = -firstPartyMsgEveSun;
    if (firstPartyMsgEveSun >= 0.0)
      v72 = self->_firstPartyMsgEveSun;
    v73 = floor(v72 + 0.5);
    v74 = (v72 - v73) * 1.84467441e19;
    v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0)
        v70 += (unint64_t)v74;
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    v70 = 0;
  }
  v579 = v70;
  if ((v4 & 0x40) != 0)
  {
    firstPartyMsgNightWeekday = self->_firstPartyMsgNightWeekday;
    v77 = -firstPartyMsgNightWeekday;
    if (firstPartyMsgNightWeekday >= 0.0)
      v77 = self->_firstPartyMsgNightWeekday;
    v78 = floor(v77 + 0.5);
    v79 = (v77 - v78) * 1.84467441e19;
    v75 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
    if (v79 >= 0.0)
    {
      if (v79 > 0.0)
        v75 += (unint64_t)v79;
    }
    else
    {
      v75 -= (unint64_t)fabs(v79);
    }
  }
  else
  {
    v75 = 0;
  }
  v578 = v75;
  if ((v4 & 8) != 0)
  {
    firstPartyMsgNightFri = self->_firstPartyMsgNightFri;
    v82 = -firstPartyMsgNightFri;
    if (firstPartyMsgNightFri >= 0.0)
      v82 = self->_firstPartyMsgNightFri;
    v83 = floor(v82 + 0.5);
    v84 = (v82 - v83) * 1.84467441e19;
    v80 = 2654435761u * (unint64_t)fmod(v83, 1.84467441e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0)
        v80 += (unint64_t)v84;
    }
    else
    {
      v80 -= (unint64_t)fabs(v84);
    }
  }
  else
  {
    v80 = 0;
  }
  v577 = v80;
  if ((v4 & 0x10) != 0)
  {
    firstPartyMsgNightSat = self->_firstPartyMsgNightSat;
    v87 = -firstPartyMsgNightSat;
    if (firstPartyMsgNightSat >= 0.0)
      v87 = self->_firstPartyMsgNightSat;
    v88 = floor(v87 + 0.5);
    v89 = (v87 - v88) * 1.84467441e19;
    v85 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
    if (v89 >= 0.0)
    {
      if (v89 > 0.0)
        v85 += (unint64_t)v89;
    }
    else
    {
      v85 -= (unint64_t)fabs(v89);
    }
  }
  else
  {
    v85 = 0;
  }
  v576 = v85;
  if ((v4 & 0x20) != 0)
  {
    firstPartyMsgNightSun = self->_firstPartyMsgNightSun;
    v92 = -firstPartyMsgNightSun;
    if (firstPartyMsgNightSun >= 0.0)
      v92 = self->_firstPartyMsgNightSun;
    v93 = floor(v92 + 0.5);
    v94 = (v92 - v93) * 1.84467441e19;
    v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    if (v94 >= 0.0)
    {
      if (v94 > 0.0)
        v90 += (unint64_t)v94;
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    v90 = 0;
  }
  v575 = v90;
  if ((v4 & 0x4000) != 0)
  {
    firstPartyMsgTwoWeeks = self->_firstPartyMsgTwoWeeks;
    v97 = -firstPartyMsgTwoWeeks;
    if (firstPartyMsgTwoWeeks >= 0.0)
      v97 = self->_firstPartyMsgTwoWeeks;
    v98 = floor(v97 + 0.5);
    v99 = (v97 - v98) * 1.84467441e19;
    v95 = 2654435761u * (unint64_t)fmod(v98, 1.84467441e19);
    if (v99 >= 0.0)
    {
      if (v99 > 0.0)
        v95 += (unint64_t)v99;
    }
    else
    {
      v95 -= (unint64_t)fabs(v99);
    }
  }
  else
  {
    v95 = 0;
  }
  v574 = v95;
  if ((v4 & 0x1000) != 0)
  {
    firstPartyMsgSixWeeks = self->_firstPartyMsgSixWeeks;
    v102 = -firstPartyMsgSixWeeks;
    if (firstPartyMsgSixWeeks >= 0.0)
      v102 = self->_firstPartyMsgSixWeeks;
    v103 = floor(v102 + 0.5);
    v104 = (v102 - v103) * 1.84467441e19;
    v100 = 2654435761u * (unint64_t)fmod(v103, 1.84467441e19);
    if (v104 >= 0.0)
    {
      if (v104 > 0.0)
        v100 += (unint64_t)v104;
    }
    else
    {
      v100 -= (unint64_t)fabs(v104);
    }
  }
  else
  {
    v100 = 0;
  }
  v573 = v100;
  if ((v4 & 0x100000000) != 0)
  {
    v572 = 2654435761u * self->_thirdPartyMsgTotal;
    if ((v4 & 0x8000) != 0)
      goto LABEL_165;
LABEL_170:
    v109 = 0;
    goto LABEL_173;
  }
  v572 = 0;
  if ((v4 & 0x8000) == 0)
    goto LABEL_170;
LABEL_165:
  thirdPartyMsgDayRatio = self->_thirdPartyMsgDayRatio;
  v106 = -thirdPartyMsgDayRatio;
  if (thirdPartyMsgDayRatio >= 0.0)
    v106 = self->_thirdPartyMsgDayRatio;
  v107 = floor(v106 + 0.5);
  v108 = (v106 - v107) * 1.84467441e19;
  v109 = 2654435761u * (unint64_t)fmod(v107, 1.84467441e19);
  if (v108 >= 0.0)
  {
    if (v108 > 0.0)
      v109 += (unint64_t)v108;
  }
  else
  {
    v109 -= (unint64_t)fabs(v108);
  }
LABEL_173:
  v571 = v109;
  if ((v4 & 0x800000) != 0)
  {
    thirdPartyMsgMorningWeekday = self->_thirdPartyMsgMorningWeekday;
    v112 = -thirdPartyMsgMorningWeekday;
    if (thirdPartyMsgMorningWeekday >= 0.0)
      v112 = self->_thirdPartyMsgMorningWeekday;
    v113 = floor(v112 + 0.5);
    v114 = (v112 - v113) * 1.84467441e19;
    v110 = 2654435761u * (unint64_t)fmod(v113, 1.84467441e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0)
        v110 += (unint64_t)v114;
    }
    else
    {
      v110 -= (unint64_t)fabs(v114);
    }
  }
  else
  {
    v110 = 0;
  }
  v570 = v110;
  if ((v4 & 0x100000) != 0)
  {
    thirdPartyMsgMorningFri = self->_thirdPartyMsgMorningFri;
    v117 = -thirdPartyMsgMorningFri;
    if (thirdPartyMsgMorningFri >= 0.0)
      v117 = self->_thirdPartyMsgMorningFri;
    v118 = floor(v117 + 0.5);
    v119 = (v117 - v118) * 1.84467441e19;
    v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0)
        v115 += (unint64_t)v119;
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    v115 = 0;
  }
  v569 = v115;
  if ((v4 & 0x200000) != 0)
  {
    thirdPartyMsgMorningSat = self->_thirdPartyMsgMorningSat;
    v122 = -thirdPartyMsgMorningSat;
    if (thirdPartyMsgMorningSat >= 0.0)
      v122 = self->_thirdPartyMsgMorningSat;
    v123 = floor(v122 + 0.5);
    v124 = (v122 - v123) * 1.84467441e19;
    v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0)
        v120 += (unint64_t)v124;
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    v120 = 0;
  }
  v568 = v120;
  if ((v4 & 0x400000) != 0)
  {
    thirdPartyMsgMorningSun = self->_thirdPartyMsgMorningSun;
    v127 = -thirdPartyMsgMorningSun;
    if (thirdPartyMsgMorningSun >= 0.0)
      v127 = self->_thirdPartyMsgMorningSun;
    v128 = floor(v127 + 0.5);
    v129 = (v127 - v128) * 1.84467441e19;
    v125 = 2654435761u * (unint64_t)fmod(v128, 1.84467441e19);
    if (v129 >= 0.0)
    {
      if (v129 > 0.0)
        v125 += (unint64_t)v129;
    }
    else
    {
      v125 -= (unint64_t)fabs(v129);
    }
  }
  else
  {
    v125 = 0;
  }
  v567 = v125;
  if ((v4 & 0x80000000) != 0)
  {
    thirdPartyMsgNoonWeekday = self->_thirdPartyMsgNoonWeekday;
    v132 = -thirdPartyMsgNoonWeekday;
    if (thirdPartyMsgNoonWeekday >= 0.0)
      v132 = self->_thirdPartyMsgNoonWeekday;
    v133 = floor(v132 + 0.5);
    v134 = (v132 - v133) * 1.84467441e19;
    v130 = 2654435761u * (unint64_t)fmod(v133, 1.84467441e19);
    if (v134 >= 0.0)
    {
      if (v134 > 0.0)
        v130 += (unint64_t)v134;
    }
    else
    {
      v130 -= (unint64_t)fabs(v134);
    }
  }
  else
  {
    v130 = 0;
  }
  v566 = v130;
  if ((v4 & 0x10000000) != 0)
  {
    thirdPartyMsgNoonFri = self->_thirdPartyMsgNoonFri;
    v137 = -thirdPartyMsgNoonFri;
    if (thirdPartyMsgNoonFri >= 0.0)
      v137 = self->_thirdPartyMsgNoonFri;
    v138 = floor(v137 + 0.5);
    v139 = (v137 - v138) * 1.84467441e19;
    v135 = 2654435761u * (unint64_t)fmod(v138, 1.84467441e19);
    if (v139 >= 0.0)
    {
      if (v139 > 0.0)
        v135 += (unint64_t)v139;
    }
    else
    {
      v135 -= (unint64_t)fabs(v139);
    }
  }
  else
  {
    v135 = 0;
  }
  v565 = v135;
  if ((v4 & 0x20000000) != 0)
  {
    thirdPartyMsgNoonSat = self->_thirdPartyMsgNoonSat;
    v142 = -thirdPartyMsgNoonSat;
    if (thirdPartyMsgNoonSat >= 0.0)
      v142 = self->_thirdPartyMsgNoonSat;
    v143 = floor(v142 + 0.5);
    v144 = (v142 - v143) * 1.84467441e19;
    v140 = 2654435761u * (unint64_t)fmod(v143, 1.84467441e19);
    if (v144 >= 0.0)
    {
      if (v144 > 0.0)
        v140 += (unint64_t)v144;
    }
    else
    {
      v140 -= (unint64_t)fabs(v144);
    }
  }
  else
  {
    v140 = 0;
  }
  v564 = v140;
  if ((v4 & 0x40000000) != 0)
  {
    thirdPartyMsgNoonSun = self->_thirdPartyMsgNoonSun;
    v147 = -thirdPartyMsgNoonSun;
    if (thirdPartyMsgNoonSun >= 0.0)
      v147 = self->_thirdPartyMsgNoonSun;
    v148 = floor(v147 + 0.5);
    v149 = (v147 - v148) * 1.84467441e19;
    v145 = 2654435761u * (unint64_t)fmod(v148, 1.84467441e19);
    if (v149 >= 0.0)
    {
      if (v149 > 0.0)
        v145 += (unint64_t)v149;
    }
    else
    {
      v145 -= (unint64_t)fabs(v149);
    }
  }
  else
  {
    v145 = 0;
  }
  v563 = v145;
  if ((v4 & 0x80000) != 0)
  {
    thirdPartyMsgEveWeekday = self->_thirdPartyMsgEveWeekday;
    v152 = -thirdPartyMsgEveWeekday;
    if (thirdPartyMsgEveWeekday >= 0.0)
      v152 = self->_thirdPartyMsgEveWeekday;
    v153 = floor(v152 + 0.5);
    v154 = (v152 - v153) * 1.84467441e19;
    v150 = 2654435761u * (unint64_t)fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      if (v154 > 0.0)
        v150 += (unint64_t)v154;
    }
    else
    {
      v150 -= (unint64_t)fabs(v154);
    }
  }
  else
  {
    v150 = 0;
  }
  v562 = v150;
  if ((v4 & 0x10000) != 0)
  {
    thirdPartyMsgEveFri = self->_thirdPartyMsgEveFri;
    v157 = -thirdPartyMsgEveFri;
    if (thirdPartyMsgEveFri >= 0.0)
      v157 = self->_thirdPartyMsgEveFri;
    v158 = floor(v157 + 0.5);
    v159 = (v157 - v158) * 1.84467441e19;
    v155 = 2654435761u * (unint64_t)fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      if (v159 > 0.0)
        v155 += (unint64_t)v159;
    }
    else
    {
      v155 -= (unint64_t)fabs(v159);
    }
  }
  else
  {
    v155 = 0;
  }
  v561 = v155;
  if ((v4 & 0x20000) != 0)
  {
    thirdPartyMsgEveSat = self->_thirdPartyMsgEveSat;
    v162 = -thirdPartyMsgEveSat;
    if (thirdPartyMsgEveSat >= 0.0)
      v162 = self->_thirdPartyMsgEveSat;
    v163 = floor(v162 + 0.5);
    v164 = (v162 - v163) * 1.84467441e19;
    v160 = 2654435761u * (unint64_t)fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      if (v164 > 0.0)
        v160 += (unint64_t)v164;
    }
    else
    {
      v160 -= (unint64_t)fabs(v164);
    }
  }
  else
  {
    v160 = 0;
  }
  v560 = v160;
  if ((v4 & 0x40000) != 0)
  {
    thirdPartyMsgEveSun = self->_thirdPartyMsgEveSun;
    v167 = -thirdPartyMsgEveSun;
    if (thirdPartyMsgEveSun >= 0.0)
      v167 = self->_thirdPartyMsgEveSun;
    v168 = floor(v167 + 0.5);
    v169 = (v167 - v168) * 1.84467441e19;
    v165 = 2654435761u * (unint64_t)fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      if (v169 > 0.0)
        v165 += (unint64_t)v169;
    }
    else
    {
      v165 -= (unint64_t)fabs(v169);
    }
  }
  else
  {
    v165 = 0;
  }
  v559 = v165;
  if ((v4 & 0x8000000) != 0)
  {
    thirdPartyMsgNightWeekday = self->_thirdPartyMsgNightWeekday;
    v172 = -thirdPartyMsgNightWeekday;
    if (thirdPartyMsgNightWeekday >= 0.0)
      v172 = self->_thirdPartyMsgNightWeekday;
    v173 = floor(v172 + 0.5);
    v174 = (v172 - v173) * 1.84467441e19;
    v170 = 2654435761u * (unint64_t)fmod(v173, 1.84467441e19);
    if (v174 >= 0.0)
    {
      if (v174 > 0.0)
        v170 += (unint64_t)v174;
    }
    else
    {
      v170 -= (unint64_t)fabs(v174);
    }
  }
  else
  {
    v170 = 0;
  }
  v558 = v170;
  if ((v4 & 0x1000000) != 0)
  {
    thirdPartyMsgNightFri = self->_thirdPartyMsgNightFri;
    v177 = -thirdPartyMsgNightFri;
    if (thirdPartyMsgNightFri >= 0.0)
      v177 = self->_thirdPartyMsgNightFri;
    v178 = floor(v177 + 0.5);
    v179 = (v177 - v178) * 1.84467441e19;
    v175 = 2654435761u * (unint64_t)fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      if (v179 > 0.0)
        v175 += (unint64_t)v179;
    }
    else
    {
      v175 -= (unint64_t)fabs(v179);
    }
  }
  else
  {
    v175 = 0;
  }
  v557 = v175;
  if ((v4 & 0x2000000) != 0)
  {
    thirdPartyMsgNightSat = self->_thirdPartyMsgNightSat;
    v182 = -thirdPartyMsgNightSat;
    if (thirdPartyMsgNightSat >= 0.0)
      v182 = self->_thirdPartyMsgNightSat;
    v183 = floor(v182 + 0.5);
    v184 = (v182 - v183) * 1.84467441e19;
    v180 = 2654435761u * (unint64_t)fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      if (v184 > 0.0)
        v180 += (unint64_t)v184;
    }
    else
    {
      v180 -= (unint64_t)fabs(v184);
    }
  }
  else
  {
    v180 = 0;
  }
  v556 = v180;
  if ((v4 & 0x4000000) != 0)
  {
    thirdPartyMsgNightSun = self->_thirdPartyMsgNightSun;
    v187 = -thirdPartyMsgNightSun;
    if (thirdPartyMsgNightSun >= 0.0)
      v187 = self->_thirdPartyMsgNightSun;
    v188 = floor(v187 + 0.5);
    v189 = (v187 - v188) * 1.84467441e19;
    v185 = 2654435761u * (unint64_t)fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      if (v189 > 0.0)
        v185 += (unint64_t)v189;
    }
    else
    {
      v185 -= (unint64_t)fabs(v189);
    }
  }
  else
  {
    v185 = 0;
  }
  v555 = v185;
  if ((v4 & 0x200000000) != 0)
  {
    thirdPartyMsgTwoWeeks = self->_thirdPartyMsgTwoWeeks;
    v192 = -thirdPartyMsgTwoWeeks;
    if (thirdPartyMsgTwoWeeks >= 0.0)
      v192 = self->_thirdPartyMsgTwoWeeks;
    v193 = floor(v192 + 0.5);
    v194 = (v192 - v193) * 1.84467441e19;
    v190 = 2654435761u * (unint64_t)fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      if (v194 > 0.0)
        v190 += (unint64_t)v194;
    }
    else
    {
      v190 -= (unint64_t)fabs(v194);
    }
  }
  else
  {
    v190 = 0;
  }
  v554 = v190;
  if ((has & 0x40000000000000) != 0)
  {
    v553 = 2654435761u * self->_callTotal;
    if ((v4 & 0x400000000) != 0)
    {
LABEL_311:
      v552 = 2654435761 * self->_callBirthday;
      if ((v4 & 0x8000000000) != 0)
        goto LABEL_312;
LABEL_319:
      v551 = 0;
      if ((has & 0x80000000000000) != 0)
        goto LABEL_313;
LABEL_320:
      v199 = 0;
      goto LABEL_323;
    }
  }
  else
  {
    v553 = 0;
    if ((v4 & 0x400000000) != 0)
      goto LABEL_311;
  }
  v552 = 0;
  if ((v4 & 0x8000000000) == 0)
    goto LABEL_319;
LABEL_312:
  v551 = 2654435761 * self->_contactFavorite;
  if ((has & 0x80000000000000) == 0)
    goto LABEL_320;
LABEL_313:
  callTotalDur = self->_callTotalDur;
  v196 = -callTotalDur;
  if (callTotalDur >= 0.0)
    v196 = self->_callTotalDur;
  v197 = floor(v196 + 0.5);
  v198 = (v196 - v197) * 1.84467441e19;
  v199 = 2654435761u * (unint64_t)fmod(v197, 1.84467441e19);
  if (v198 >= 0.0)
  {
    if (v198 > 0.0)
      v199 += (unint64_t)v198;
  }
  else
  {
    v199 -= (unint64_t)fabs(v198);
  }
LABEL_323:
  v550 = v199;
  if ((has & 2) != 0)
  {
    callDayRatio = self->_callDayRatio;
    v202 = -callDayRatio;
    if (callDayRatio >= 0.0)
      v202 = self->_callDayRatio;
    v203 = floor(v202 + 0.5);
    v204 = (v202 - v203) * 1.84467441e19;
    v200 = 2654435761u * (unint64_t)fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      if (v204 > 0.0)
        v200 += (unint64_t)v204;
    }
    else
    {
      v200 -= (unint64_t)fabs(v204);
    }
  }
  else
  {
    v200 = 0;
  }
  v549 = v200;
  if ((has & 0x4000000000) != 0)
  {
    callLongRatio = self->_callLongRatio;
    v207 = -callLongRatio;
    if (callLongRatio >= 0.0)
      v207 = self->_callLongRatio;
    v208 = floor(v207 + 0.5);
    v209 = (v207 - v208) * 1.84467441e19;
    v205 = 2654435761u * (unint64_t)fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      if (v209 > 0.0)
        v205 += (unint64_t)v209;
    }
    else
    {
      v205 -= (unint64_t)fabs(v209);
    }
  }
  else
  {
    v205 = 0;
  }
  v548 = v205;
  if ((has & 0x10000000000000) != 0)
  {
    callOutgoingRatio = self->_callOutgoingRatio;
    v212 = -callOutgoingRatio;
    if (callOutgoingRatio >= 0.0)
      v212 = self->_callOutgoingRatio;
    v213 = floor(v212 + 0.5);
    v214 = (v212 - v213) * 1.84467441e19;
    v210 = 2654435761u * (unint64_t)fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      if (v214 > 0.0)
        v210 += (unint64_t)v214;
    }
    else
    {
      v210 -= (unint64_t)fabs(v214);
    }
  }
  else
  {
    v210 = 0;
  }
  v547 = v210;
  if ((has & 1) != 0)
  {
    callAvgDur = self->_callAvgDur;
    v217 = -callAvgDur;
    if (callAvgDur >= 0.0)
      v217 = self->_callAvgDur;
    v218 = floor(v217 + 0.5);
    v219 = (v217 - v218) * 1.84467441e19;
    v215 = 2654435761u * (unint64_t)fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      if (v219 > 0.0)
        v215 += (unint64_t)v219;
    }
    else
    {
      v215 -= (unint64_t)fabs(v219);
    }
  }
  else
  {
    v215 = 0;
  }
  v546 = v215;
  if ((has & 0x8000000000) != 0)
  {
    callMaxDur = self->_callMaxDur;
    v222 = -callMaxDur;
    if (callMaxDur >= 0.0)
      v222 = self->_callMaxDur;
    v223 = floor(v222 + 0.5);
    v224 = (v222 - v223) * 1.84467441e19;
    v220 = 2654435761u * (unint64_t)fmod(v223, 1.84467441e19);
    if (v224 >= 0.0)
    {
      if (v224 > 0.0)
        v220 += (unint64_t)v224;
    }
    else
    {
      v220 -= (unint64_t)fabs(v224);
    }
  }
  else
  {
    v220 = 0;
  }
  v545 = v220;
  if ((has & 0x80000000000) != 0)
  {
    callMorningWeekday = self->_callMorningWeekday;
    v227 = -callMorningWeekday;
    if (callMorningWeekday >= 0.0)
      v227 = self->_callMorningWeekday;
    v228 = floor(v227 + 0.5);
    v229 = (v227 - v228) * 1.84467441e19;
    v225 = 2654435761u * (unint64_t)fmod(v228, 1.84467441e19);
    if (v229 >= 0.0)
    {
      if (v229 > 0.0)
        v225 += (unint64_t)v229;
    }
    else
    {
      v225 -= (unint64_t)fabs(v229);
    }
  }
  else
  {
    v225 = 0;
  }
  v544 = v225;
  if ((has & 0x10000000000) != 0)
  {
    callMorningFri = self->_callMorningFri;
    v232 = -callMorningFri;
    if (callMorningFri >= 0.0)
      v232 = self->_callMorningFri;
    v233 = floor(v232 + 0.5);
    v234 = (v232 - v233) * 1.84467441e19;
    v230 = 2654435761u * (unint64_t)fmod(v233, 1.84467441e19);
    if (v234 >= 0.0)
    {
      if (v234 > 0.0)
        v230 += (unint64_t)v234;
    }
    else
    {
      v230 -= (unint64_t)fabs(v234);
    }
  }
  else
  {
    v230 = 0;
  }
  v543 = v230;
  if ((has & 0x20000000000) != 0)
  {
    callMorningSat = self->_callMorningSat;
    v237 = -callMorningSat;
    if (callMorningSat >= 0.0)
      v237 = self->_callMorningSat;
    v238 = floor(v237 + 0.5);
    v239 = (v237 - v238) * 1.84467441e19;
    v235 = 2654435761u * (unint64_t)fmod(v238, 1.84467441e19);
    if (v239 >= 0.0)
    {
      if (v239 > 0.0)
        v235 += (unint64_t)v239;
    }
    else
    {
      v235 -= (unint64_t)fabs(v239);
    }
  }
  else
  {
    v235 = 0;
  }
  v542 = v235;
  if ((has & 0x40000000000) != 0)
  {
    callMorningSun = self->_callMorningSun;
    v242 = -callMorningSun;
    if (callMorningSun >= 0.0)
      v242 = self->_callMorningSun;
    v243 = floor(v242 + 0.5);
    v244 = (v242 - v243) * 1.84467441e19;
    v240 = 2654435761u * (unint64_t)fmod(v243, 1.84467441e19);
    if (v244 >= 0.0)
    {
      if (v244 > 0.0)
        v240 += (unint64_t)v244;
    }
    else
    {
      v240 -= (unint64_t)fabs(v244);
    }
  }
  else
  {
    v240 = 0;
  }
  v541 = v240;
  if ((has & 0x8000000000000) != 0)
  {
    callNoonWeekday = self->_callNoonWeekday;
    v247 = -callNoonWeekday;
    if (callNoonWeekday >= 0.0)
      v247 = self->_callNoonWeekday;
    v248 = floor(v247 + 0.5);
    v249 = (v247 - v248) * 1.84467441e19;
    v245 = 2654435761u * (unint64_t)fmod(v248, 1.84467441e19);
    if (v249 >= 0.0)
    {
      if (v249 > 0.0)
        v245 += (unint64_t)v249;
    }
    else
    {
      v245 -= (unint64_t)fabs(v249);
    }
  }
  else
  {
    v245 = 0;
  }
  v540 = v245;
  if ((has & 0x1000000000000) != 0)
  {
    callNoonFri = self->_callNoonFri;
    v252 = -callNoonFri;
    if (callNoonFri >= 0.0)
      v252 = self->_callNoonFri;
    v253 = floor(v252 + 0.5);
    v254 = (v252 - v253) * 1.84467441e19;
    v250 = 2654435761u * (unint64_t)fmod(v253, 1.84467441e19);
    if (v254 >= 0.0)
    {
      if (v254 > 0.0)
        v250 += (unint64_t)v254;
    }
    else
    {
      v250 -= (unint64_t)fabs(v254);
    }
  }
  else
  {
    v250 = 0;
  }
  v539 = v250;
  if ((has & 0x2000000000000) != 0)
  {
    callNoonSat = self->_callNoonSat;
    v257 = -callNoonSat;
    if (callNoonSat >= 0.0)
      v257 = self->_callNoonSat;
    v258 = floor(v257 + 0.5);
    v259 = (v257 - v258) * 1.84467441e19;
    v255 = 2654435761u * (unint64_t)fmod(v258, 1.84467441e19);
    if (v259 >= 0.0)
    {
      if (v259 > 0.0)
        v255 += (unint64_t)v259;
    }
    else
    {
      v255 -= (unint64_t)fabs(v259);
    }
  }
  else
  {
    v255 = 0;
  }
  v538 = v255;
  if ((has & 0x4000000000000) != 0)
  {
    callNoonSun = self->_callNoonSun;
    v262 = -callNoonSun;
    if (callNoonSun >= 0.0)
      v262 = self->_callNoonSun;
    v263 = floor(v262 + 0.5);
    v264 = (v262 - v263) * 1.84467441e19;
    v260 = 2654435761u * (unint64_t)fmod(v263, 1.84467441e19);
    if (v264 >= 0.0)
    {
      if (v264 > 0.0)
        v260 += (unint64_t)v264;
    }
    else
    {
      v260 -= (unint64_t)fabs(v264);
    }
  }
  else
  {
    v260 = 0;
  }
  v537 = v260;
  if ((has & 0x200000) != 0)
  {
    callEveWeekday = self->_callEveWeekday;
    v267 = -callEveWeekday;
    if (callEveWeekday >= 0.0)
      v267 = self->_callEveWeekday;
    v268 = floor(v267 + 0.5);
    v269 = (v267 - v268) * 1.84467441e19;
    v265 = 2654435761u * (unint64_t)fmod(v268, 1.84467441e19);
    if (v269 >= 0.0)
    {
      if (v269 > 0.0)
        v265 += (unint64_t)v269;
    }
    else
    {
      v265 -= (unint64_t)fabs(v269);
    }
  }
  else
  {
    v265 = 0;
  }
  v536 = v265;
  if ((has & 0x40000) != 0)
  {
    callEveFri = self->_callEveFri;
    v272 = -callEveFri;
    if (callEveFri >= 0.0)
      v272 = self->_callEveFri;
    v273 = floor(v272 + 0.5);
    v274 = (v272 - v273) * 1.84467441e19;
    v270 = 2654435761u * (unint64_t)fmod(v273, 1.84467441e19);
    if (v274 >= 0.0)
    {
      if (v274 > 0.0)
        v270 += (unint64_t)v274;
    }
    else
    {
      v270 -= (unint64_t)fabs(v274);
    }
  }
  else
  {
    v270 = 0;
  }
  v535 = v270;
  if ((has & 0x80000) != 0)
  {
    callEveSat = self->_callEveSat;
    v277 = -callEveSat;
    if (callEveSat >= 0.0)
      v277 = self->_callEveSat;
    v278 = floor(v277 + 0.5);
    v279 = (v277 - v278) * 1.84467441e19;
    v275 = 2654435761u * (unint64_t)fmod(v278, 1.84467441e19);
    if (v279 >= 0.0)
    {
      if (v279 > 0.0)
        v275 += (unint64_t)v279;
    }
    else
    {
      v275 -= (unint64_t)fabs(v279);
    }
  }
  else
  {
    v275 = 0;
  }
  v534 = v275;
  if ((has & 0x100000) != 0)
  {
    callEveSun = self->_callEveSun;
    v282 = -callEveSun;
    if (callEveSun >= 0.0)
      v282 = self->_callEveSun;
    v283 = floor(v282 + 0.5);
    v284 = (v282 - v283) * 1.84467441e19;
    v280 = 2654435761u * (unint64_t)fmod(v283, 1.84467441e19);
    if (v284 >= 0.0)
    {
      if (v284 > 0.0)
        v280 += (unint64_t)v284;
    }
    else
    {
      v280 -= (unint64_t)fabs(v284);
    }
  }
  else
  {
    v280 = 0;
  }
  v533 = v280;
  if ((has & 0x800000000000) != 0)
  {
    callNightWeekday = self->_callNightWeekday;
    v287 = -callNightWeekday;
    if (callNightWeekday >= 0.0)
      v287 = self->_callNightWeekday;
    v288 = floor(v287 + 0.5);
    v289 = (v287 - v288) * 1.84467441e19;
    v285 = 2654435761u * (unint64_t)fmod(v288, 1.84467441e19);
    if (v289 >= 0.0)
    {
      if (v289 > 0.0)
        v285 += (unint64_t)v289;
    }
    else
    {
      v285 -= (unint64_t)fabs(v289);
    }
  }
  else
  {
    v285 = 0;
  }
  v532 = v285;
  if ((has & 0x100000000000) != 0)
  {
    callNightFri = self->_callNightFri;
    v292 = -callNightFri;
    if (callNightFri >= 0.0)
      v292 = self->_callNightFri;
    v293 = floor(v292 + 0.5);
    v294 = (v292 - v293) * 1.84467441e19;
    v290 = 2654435761u * (unint64_t)fmod(v293, 1.84467441e19);
    if (v294 >= 0.0)
    {
      if (v294 > 0.0)
        v290 += (unint64_t)v294;
    }
    else
    {
      v290 -= (unint64_t)fabs(v294);
    }
  }
  else
  {
    v290 = 0;
  }
  v531 = v290;
  if ((has & 0x200000000000) != 0)
  {
    callNightSat = self->_callNightSat;
    v297 = -callNightSat;
    if (callNightSat >= 0.0)
      v297 = self->_callNightSat;
    v298 = floor(v297 + 0.5);
    v299 = (v297 - v298) * 1.84467441e19;
    v295 = 2654435761u * (unint64_t)fmod(v298, 1.84467441e19);
    if (v299 >= 0.0)
    {
      if (v299 > 0.0)
        v295 += (unint64_t)v299;
    }
    else
    {
      v295 -= (unint64_t)fabs(v299);
    }
  }
  else
  {
    v295 = 0;
  }
  v530 = v295;
  if ((has & 0x400000000000) != 0)
  {
    callNightSun = self->_callNightSun;
    v302 = -callNightSun;
    if (callNightSun >= 0.0)
      v302 = self->_callNightSun;
    v303 = floor(v302 + 0.5);
    v304 = (v302 - v303) * 1.84467441e19;
    v300 = 2654435761u * (unint64_t)fmod(v303, 1.84467441e19);
    if (v304 >= 0.0)
    {
      if (v304 > 0.0)
        v300 += (unint64_t)v304;
    }
    else
    {
      v300 -= (unint64_t)fabs(v304);
    }
  }
  else
  {
    v300 = 0;
  }
  v529 = v300;
  if ((has & 0x200) != 0)
  {
    callDurMorningWeekday = self->_callDurMorningWeekday;
    v307 = -callDurMorningWeekday;
    if (callDurMorningWeekday >= 0.0)
      v307 = self->_callDurMorningWeekday;
    v308 = floor(v307 + 0.5);
    v309 = (v307 - v308) * 1.84467441e19;
    v305 = 2654435761u * (unint64_t)fmod(v308, 1.84467441e19);
    if (v309 >= 0.0)
    {
      if (v309 > 0.0)
        v305 += (unint64_t)v309;
    }
    else
    {
      v305 -= (unint64_t)fabs(v309);
    }
  }
  else
  {
    v305 = 0;
  }
  v528 = v305;
  if ((has & 0x40) != 0)
  {
    callDurMorningFri = self->_callDurMorningFri;
    v312 = -callDurMorningFri;
    if (callDurMorningFri >= 0.0)
      v312 = self->_callDurMorningFri;
    v313 = floor(v312 + 0.5);
    v314 = (v312 - v313) * 1.84467441e19;
    v310 = 2654435761u * (unint64_t)fmod(v313, 1.84467441e19);
    if (v314 >= 0.0)
    {
      if (v314 > 0.0)
        v310 += (unint64_t)v314;
    }
    else
    {
      v310 -= (unint64_t)fabs(v314);
    }
  }
  else
  {
    v310 = 0;
  }
  v527 = v310;
  if ((has & 0x80) != 0)
  {
    callDurMorningSat = self->_callDurMorningSat;
    v317 = -callDurMorningSat;
    if (callDurMorningSat >= 0.0)
      v317 = self->_callDurMorningSat;
    v318 = floor(v317 + 0.5);
    v319 = (v317 - v318) * 1.84467441e19;
    v315 = 2654435761u * (unint64_t)fmod(v318, 1.84467441e19);
    if (v319 >= 0.0)
    {
      if (v319 > 0.0)
        v315 += (unint64_t)v319;
    }
    else
    {
      v315 -= (unint64_t)fabs(v319);
    }
  }
  else
  {
    v315 = 0;
  }
  v526 = v315;
  if ((has & 0x100) != 0)
  {
    callDurMorningSun = self->_callDurMorningSun;
    v322 = -callDurMorningSun;
    if (callDurMorningSun >= 0.0)
      v322 = self->_callDurMorningSun;
    v323 = floor(v322 + 0.5);
    v324 = (v322 - v323) * 1.84467441e19;
    v320 = 2654435761u * (unint64_t)fmod(v323, 1.84467441e19);
    if (v324 >= 0.0)
    {
      if (v324 > 0.0)
        v320 += (unint64_t)v324;
    }
    else
    {
      v320 -= (unint64_t)fabs(v324);
    }
  }
  else
  {
    v320 = 0;
  }
  v525 = v320;
  if ((has & 0x20000) != 0)
  {
    callDurNoonWeekday = self->_callDurNoonWeekday;
    v327 = -callDurNoonWeekday;
    if (callDurNoonWeekday >= 0.0)
      v327 = self->_callDurNoonWeekday;
    v328 = floor(v327 + 0.5);
    v329 = (v327 - v328) * 1.84467441e19;
    v325 = 2654435761u * (unint64_t)fmod(v328, 1.84467441e19);
    if (v329 >= 0.0)
    {
      if (v329 > 0.0)
        v325 += (unint64_t)v329;
    }
    else
    {
      v325 -= (unint64_t)fabs(v329);
    }
  }
  else
  {
    v325 = 0;
  }
  v524 = v325;
  if ((has & 0x4000) != 0)
  {
    callDurNoonFri = self->_callDurNoonFri;
    v332 = -callDurNoonFri;
    if (callDurNoonFri >= 0.0)
      v332 = self->_callDurNoonFri;
    v333 = floor(v332 + 0.5);
    v334 = (v332 - v333) * 1.84467441e19;
    v330 = 2654435761u * (unint64_t)fmod(v333, 1.84467441e19);
    if (v334 >= 0.0)
    {
      if (v334 > 0.0)
        v330 += (unint64_t)v334;
    }
    else
    {
      v330 -= (unint64_t)fabs(v334);
    }
  }
  else
  {
    v330 = 0;
  }
  v523 = v330;
  if ((has & 0x8000) != 0)
  {
    callDurNoonSat = self->_callDurNoonSat;
    v337 = -callDurNoonSat;
    if (callDurNoonSat >= 0.0)
      v337 = self->_callDurNoonSat;
    v338 = floor(v337 + 0.5);
    v339 = (v337 - v338) * 1.84467441e19;
    v335 = 2654435761u * (unint64_t)fmod(v338, 1.84467441e19);
    if (v339 >= 0.0)
    {
      if (v339 > 0.0)
        v335 += (unint64_t)v339;
    }
    else
    {
      v335 -= (unint64_t)fabs(v339);
    }
  }
  else
  {
    v335 = 0;
  }
  v522 = v335;
  if ((has & 0x10000) != 0)
  {
    callDurNoonSun = self->_callDurNoonSun;
    v342 = -callDurNoonSun;
    if (callDurNoonSun >= 0.0)
      v342 = self->_callDurNoonSun;
    v343 = floor(v342 + 0.5);
    v344 = (v342 - v343) * 1.84467441e19;
    v340 = 2654435761u * (unint64_t)fmod(v343, 1.84467441e19);
    if (v344 >= 0.0)
    {
      if (v344 > 0.0)
        v340 += (unint64_t)v344;
    }
    else
    {
      v340 -= (unint64_t)fabs(v344);
    }
  }
  else
  {
    v340 = 0;
  }
  v521 = v340;
  if ((has & 0x20) != 0)
  {
    callDurEveWeekday = self->_callDurEveWeekday;
    v347 = -callDurEveWeekday;
    if (callDurEveWeekday >= 0.0)
      v347 = self->_callDurEveWeekday;
    v348 = floor(v347 + 0.5);
    v349 = (v347 - v348) * 1.84467441e19;
    v345 = 2654435761u * (unint64_t)fmod(v348, 1.84467441e19);
    if (v349 >= 0.0)
    {
      if (v349 > 0.0)
        v345 += (unint64_t)v349;
    }
    else
    {
      v345 -= (unint64_t)fabs(v349);
    }
  }
  else
  {
    v345 = 0;
  }
  v520 = v345;
  if ((has & 4) != 0)
  {
    callDurEveFri = self->_callDurEveFri;
    v352 = -callDurEveFri;
    if (callDurEveFri >= 0.0)
      v352 = self->_callDurEveFri;
    v353 = floor(v352 + 0.5);
    v354 = (v352 - v353) * 1.84467441e19;
    v350 = 2654435761u * (unint64_t)fmod(v353, 1.84467441e19);
    if (v354 >= 0.0)
    {
      if (v354 > 0.0)
        v350 += (unint64_t)v354;
    }
    else
    {
      v350 -= (unint64_t)fabs(v354);
    }
  }
  else
  {
    v350 = 0;
  }
  v519 = v350;
  if ((has & 8) != 0)
  {
    callDurEveSat = self->_callDurEveSat;
    v357 = -callDurEveSat;
    if (callDurEveSat >= 0.0)
      v357 = self->_callDurEveSat;
    v358 = floor(v357 + 0.5);
    v359 = (v357 - v358) * 1.84467441e19;
    v355 = 2654435761u * (unint64_t)fmod(v358, 1.84467441e19);
    if (v359 >= 0.0)
    {
      if (v359 > 0.0)
        v355 += (unint64_t)v359;
    }
    else
    {
      v355 -= (unint64_t)fabs(v359);
    }
  }
  else
  {
    v355 = 0;
  }
  v518 = v355;
  if ((has & 0x10) != 0)
  {
    callDurEveSun = self->_callDurEveSun;
    v362 = -callDurEveSun;
    if (callDurEveSun >= 0.0)
      v362 = self->_callDurEveSun;
    v363 = floor(v362 + 0.5);
    v364 = (v362 - v363) * 1.84467441e19;
    v360 = 2654435761u * (unint64_t)fmod(v363, 1.84467441e19);
    if (v364 >= 0.0)
    {
      if (v364 > 0.0)
        v360 += (unint64_t)v364;
    }
    else
    {
      v360 -= (unint64_t)fabs(v364);
    }
  }
  else
  {
    v360 = 0;
  }
  v517 = v360;
  if ((has & 0x2000) != 0)
  {
    callDurNightWeekday = self->_callDurNightWeekday;
    v367 = -callDurNightWeekday;
    if (callDurNightWeekday >= 0.0)
      v367 = self->_callDurNightWeekday;
    v368 = floor(v367 + 0.5);
    v369 = (v367 - v368) * 1.84467441e19;
    v365 = 2654435761u * (unint64_t)fmod(v368, 1.84467441e19);
    if (v369 >= 0.0)
    {
      if (v369 > 0.0)
        v365 += (unint64_t)v369;
    }
    else
    {
      v365 -= (unint64_t)fabs(v369);
    }
  }
  else
  {
    v365 = 0;
  }
  v516 = v365;
  if ((has & 0x400) != 0)
  {
    callDurNightFri = self->_callDurNightFri;
    v372 = -callDurNightFri;
    if (callDurNightFri >= 0.0)
      v372 = self->_callDurNightFri;
    v373 = floor(v372 + 0.5);
    v374 = (v372 - v373) * 1.84467441e19;
    v370 = 2654435761u * (unint64_t)fmod(v373, 1.84467441e19);
    if (v374 >= 0.0)
    {
      if (v374 > 0.0)
        v370 += (unint64_t)v374;
    }
    else
    {
      v370 -= (unint64_t)fabs(v374);
    }
  }
  else
  {
    v370 = 0;
  }
  v515 = v370;
  if ((has & 0x800) != 0)
  {
    callDurNightSat = self->_callDurNightSat;
    v377 = -callDurNightSat;
    if (callDurNightSat >= 0.0)
      v377 = self->_callDurNightSat;
    v378 = floor(v377 + 0.5);
    v379 = (v377 - v378) * 1.84467441e19;
    v375 = 2654435761u * (unint64_t)fmod(v378, 1.84467441e19);
    if (v379 >= 0.0)
    {
      if (v379 > 0.0)
        v375 += (unint64_t)v379;
    }
    else
    {
      v375 -= (unint64_t)fabs(v379);
    }
  }
  else
  {
    v375 = 0;
  }
  v514 = v375;
  if ((has & 0x1000) != 0)
  {
    callDurNightSun = self->_callDurNightSun;
    v382 = -callDurNightSun;
    if (callDurNightSun >= 0.0)
      v382 = self->_callDurNightSun;
    v383 = floor(v382 + 0.5);
    v384 = (v382 - v383) * 1.84467441e19;
    v380 = 2654435761u * (unint64_t)fmod(v383, 1.84467441e19);
    if (v384 >= 0.0)
    {
      if (v384 > 0.0)
        v380 += (unint64_t)v384;
    }
    else
    {
      v380 -= (unint64_t)fabs(v384);
    }
  }
  else
  {
    v380 = 0;
  }
  v513 = v380;
  if ((has & 0x20000000) != 0)
  {
    callLongMorningWeekday = self->_callLongMorningWeekday;
    v387 = -callLongMorningWeekday;
    if (callLongMorningWeekday >= 0.0)
      v387 = self->_callLongMorningWeekday;
    v388 = floor(v387 + 0.5);
    v389 = (v387 - v388) * 1.84467441e19;
    v385 = 2654435761u * (unint64_t)fmod(v388, 1.84467441e19);
    if (v389 >= 0.0)
    {
      if (v389 > 0.0)
        v385 += (unint64_t)v389;
    }
    else
    {
      v385 -= (unint64_t)fabs(v389);
    }
  }
  else
  {
    v385 = 0;
  }
  v512 = v385;
  if ((has & 0x4000000) != 0)
  {
    callLongMorningFri = self->_callLongMorningFri;
    v392 = -callLongMorningFri;
    if (callLongMorningFri >= 0.0)
      v392 = self->_callLongMorningFri;
    v393 = floor(v392 + 0.5);
    v394 = (v392 - v393) * 1.84467441e19;
    v390 = 2654435761u * (unint64_t)fmod(v393, 1.84467441e19);
    if (v394 >= 0.0)
    {
      if (v394 > 0.0)
        v390 += (unint64_t)v394;
    }
    else
    {
      v390 -= (unint64_t)fabs(v394);
    }
  }
  else
  {
    v390 = 0;
  }
  v511 = v390;
  if ((has & 0x8000000) != 0)
  {
    callLongMorningSat = self->_callLongMorningSat;
    v397 = -callLongMorningSat;
    if (callLongMorningSat >= 0.0)
      v397 = self->_callLongMorningSat;
    v398 = floor(v397 + 0.5);
    v399 = (v397 - v398) * 1.84467441e19;
    v395 = 2654435761u * (unint64_t)fmod(v398, 1.84467441e19);
    if (v399 >= 0.0)
    {
      if (v399 > 0.0)
        v395 += (unint64_t)v399;
    }
    else
    {
      v395 -= (unint64_t)fabs(v399);
    }
  }
  else
  {
    v395 = 0;
  }
  v510 = v395;
  if ((has & 0x10000000) != 0)
  {
    callLongMorningSun = self->_callLongMorningSun;
    v402 = -callLongMorningSun;
    if (callLongMorningSun >= 0.0)
      v402 = self->_callLongMorningSun;
    v403 = floor(v402 + 0.5);
    v404 = (v402 - v403) * 1.84467441e19;
    v400 = 2654435761u * (unint64_t)fmod(v403, 1.84467441e19);
    if (v404 >= 0.0)
    {
      if (v404 > 0.0)
        v400 += (unint64_t)v404;
    }
    else
    {
      v400 -= (unint64_t)fabs(v404);
    }
  }
  else
  {
    v400 = 0;
  }
  v509 = v400;
  if ((has & 0x2000000000) != 0)
  {
    callLongNoonWeekday = self->_callLongNoonWeekday;
    v407 = -callLongNoonWeekday;
    if (callLongNoonWeekday >= 0.0)
      v407 = self->_callLongNoonWeekday;
    v408 = floor(v407 + 0.5);
    v409 = (v407 - v408) * 1.84467441e19;
    v405 = 2654435761u * (unint64_t)fmod(v408, 1.84467441e19);
    if (v409 >= 0.0)
    {
      if (v409 > 0.0)
        v405 += (unint64_t)v409;
    }
    else
    {
      v405 -= (unint64_t)fabs(v409);
    }
  }
  else
  {
    v405 = 0;
  }
  v508 = v405;
  if ((has & 0x400000000) != 0)
  {
    callLongNoonFri = self->_callLongNoonFri;
    v412 = -callLongNoonFri;
    if (callLongNoonFri >= 0.0)
      v412 = self->_callLongNoonFri;
    v413 = floor(v412 + 0.5);
    v414 = (v412 - v413) * 1.84467441e19;
    v410 = 2654435761u * (unint64_t)fmod(v413, 1.84467441e19);
    if (v414 >= 0.0)
    {
      if (v414 > 0.0)
        v410 += (unint64_t)v414;
    }
    else
    {
      v410 -= (unint64_t)fabs(v414);
    }
  }
  else
  {
    v410 = 0;
  }
  v507 = v410;
  if ((has & 0x800000000) != 0)
  {
    callLongNoonSat = self->_callLongNoonSat;
    v417 = -callLongNoonSat;
    if (callLongNoonSat >= 0.0)
      v417 = self->_callLongNoonSat;
    v418 = floor(v417 + 0.5);
    v419 = (v417 - v418) * 1.84467441e19;
    v415 = 2654435761u * (unint64_t)fmod(v418, 1.84467441e19);
    if (v419 >= 0.0)
    {
      if (v419 > 0.0)
        v415 += (unint64_t)v419;
    }
    else
    {
      v415 -= (unint64_t)fabs(v419);
    }
  }
  else
  {
    v415 = 0;
  }
  v506 = v415;
  if ((has & 0x1000000000) != 0)
  {
    callLongNoonSun = self->_callLongNoonSun;
    v422 = -callLongNoonSun;
    if (callLongNoonSun >= 0.0)
      v422 = self->_callLongNoonSun;
    v423 = floor(v422 + 0.5);
    v424 = (v422 - v423) * 1.84467441e19;
    v420 = 2654435761u * (unint64_t)fmod(v423, 1.84467441e19);
    if (v424 >= 0.0)
    {
      if (v424 > 0.0)
        v420 += (unint64_t)v424;
    }
    else
    {
      v420 -= (unint64_t)fabs(v424);
    }
  }
  else
  {
    v420 = 0;
  }
  v505 = v420;
  if ((has & 0x2000000) != 0)
  {
    callLongEveWeekday = self->_callLongEveWeekday;
    v427 = -callLongEveWeekday;
    if (callLongEveWeekday >= 0.0)
      v427 = self->_callLongEveWeekday;
    v428 = floor(v427 + 0.5);
    v429 = (v427 - v428) * 1.84467441e19;
    v425 = 2654435761u * (unint64_t)fmod(v428, 1.84467441e19);
    if (v429 >= 0.0)
    {
      if (v429 > 0.0)
        v425 += (unint64_t)v429;
    }
    else
    {
      v425 -= (unint64_t)fabs(v429);
    }
  }
  else
  {
    v425 = 0;
  }
  v504 = v425;
  if ((has & 0x400000) != 0)
  {
    callLongEveFri = self->_callLongEveFri;
    v432 = -callLongEveFri;
    if (callLongEveFri >= 0.0)
      v432 = self->_callLongEveFri;
    v433 = floor(v432 + 0.5);
    v434 = (v432 - v433) * 1.84467441e19;
    v430 = 2654435761u * (unint64_t)fmod(v433, 1.84467441e19);
    if (v434 >= 0.0)
    {
      if (v434 > 0.0)
        v430 += (unint64_t)v434;
    }
    else
    {
      v430 -= (unint64_t)fabs(v434);
    }
  }
  else
  {
    v430 = 0;
  }
  v503 = v430;
  if ((has & 0x800000) != 0)
  {
    callLongEveSat = self->_callLongEveSat;
    v437 = -callLongEveSat;
    if (callLongEveSat >= 0.0)
      v437 = self->_callLongEveSat;
    v438 = floor(v437 + 0.5);
    v439 = (v437 - v438) * 1.84467441e19;
    v435 = 2654435761u * (unint64_t)fmod(v438, 1.84467441e19);
    if (v439 >= 0.0)
    {
      if (v439 > 0.0)
        v435 += (unint64_t)v439;
    }
    else
    {
      v435 -= (unint64_t)fabs(v439);
    }
  }
  else
  {
    v435 = 0;
  }
  v502 = v435;
  if ((has & 0x1000000) != 0)
  {
    callLongEveSun = self->_callLongEveSun;
    v442 = -callLongEveSun;
    if (callLongEveSun >= 0.0)
      v442 = self->_callLongEveSun;
    v443 = floor(v442 + 0.5);
    v444 = (v442 - v443) * 1.84467441e19;
    v440 = 2654435761u * (unint64_t)fmod(v443, 1.84467441e19);
    if (v444 >= 0.0)
    {
      if (v444 > 0.0)
        v440 += (unint64_t)v444;
    }
    else
    {
      v440 -= (unint64_t)fabs(v444);
    }
  }
  else
  {
    v440 = 0;
  }
  v501 = v440;
  if ((has & 0x200000000) != 0)
  {
    callLongNightWeekday = self->_callLongNightWeekday;
    v447 = -callLongNightWeekday;
    if (callLongNightWeekday >= 0.0)
      v447 = self->_callLongNightWeekday;
    v448 = floor(v447 + 0.5);
    v449 = (v447 - v448) * 1.84467441e19;
    v445 = 2654435761u * (unint64_t)fmod(v448, 1.84467441e19);
    if (v449 >= 0.0)
    {
      if (v449 > 0.0)
        v445 += (unint64_t)v449;
    }
    else
    {
      v445 -= (unint64_t)fabs(v449);
    }
  }
  else
  {
    v445 = 0;
  }
  v500 = v445;
  if ((has & 0x40000000) != 0)
  {
    callLongNightFri = self->_callLongNightFri;
    v452 = -callLongNightFri;
    if (callLongNightFri >= 0.0)
      v452 = self->_callLongNightFri;
    v453 = floor(v452 + 0.5);
    v454 = (v452 - v453) * 1.84467441e19;
    v450 = 2654435761u * (unint64_t)fmod(v453, 1.84467441e19);
    if (v454 >= 0.0)
    {
      if (v454 > 0.0)
        v450 += (unint64_t)v454;
    }
    else
    {
      v450 -= (unint64_t)fabs(v454);
    }
  }
  else
  {
    v450 = 0;
  }
  v499 = v450;
  v589 = v15;
  if ((has & 0x80000000) != 0)
  {
    callLongNightSat = self->_callLongNightSat;
    v457 = -callLongNightSat;
    if (callLongNightSat >= 0.0)
      v457 = self->_callLongNightSat;
    v458 = floor(v457 + 0.5);
    v459 = (v457 - v458) * 1.84467441e19;
    v455 = 2654435761u * (unint64_t)fmod(v458, 1.84467441e19);
    if (v459 >= 0.0)
    {
      if (v459 > 0.0)
        v455 += (unint64_t)v459;
    }
    else
    {
      v455 -= (unint64_t)fabs(v459);
    }
  }
  else
  {
    v455 = 0;
  }
  v588 = v20;
  if ((has & 0x100000000) != 0)
  {
    callLongNightSun = self->_callLongNightSun;
    v462 = -callLongNightSun;
    if (callLongNightSun >= 0.0)
      v462 = self->_callLongNightSun;
    v463 = floor(v462 + 0.5);
    v464 = (v462 - v463) * 1.84467441e19;
    v460 = 2654435761u * (unint64_t)fmod(v463, 1.84467441e19);
    if (v464 >= 0.0)
    {
      if (v464 > 0.0)
        v460 += (unint64_t)v464;
    }
    else
    {
      v460 -= (unint64_t)fabs(v464);
    }
  }
  else
  {
    v460 = 0;
  }
  v498 = v455;
  v587 = v30;
  v465 = v25;
  if ((has & 0x200000000000000) != 0)
  {
    callTwoWeeks = self->_callTwoWeeks;
    v469 = -callTwoWeeks;
    if (callTwoWeeks >= 0.0)
      v469 = self->_callTwoWeeks;
    v470 = floor(v469 + 0.5);
    v471 = (v469 - v470) * 1.84467441e19;
    v467 = 2654435761u * (unint64_t)fmod(v470, 1.84467441e19);
    v466 = v10;
    if (v471 >= 0.0)
    {
      if (v471 > 0.0)
        v467 += (unint64_t)v471;
    }
    else
    {
      v467 -= (unint64_t)fabs(v471);
    }
  }
  else
  {
    v466 = v10;
    v467 = 0;
  }
  v472 = v9;
  if ((has & 0x20000000000000) != 0)
  {
    callSixWeeks = self->_callSixWeeks;
    v475 = -callSixWeeks;
    if (callSixWeeks >= 0.0)
      v475 = self->_callSixWeeks;
    v476 = floor(v475 + 0.5);
    v477 = (v475 - v476) * 1.84467441e19;
    v473 = 2654435761u * (unint64_t)fmod(v476, 1.84467441e19);
    if (v477 >= 0.0)
    {
      if (v477 > 0.0)
        v473 += (unint64_t)v477;
    }
    else
    {
      v473 -= (unint64_t)fabs(v477);
    }
  }
  else
  {
    v473 = 0;
  }
  if ((has & 0x100000000000000) != 0)
  {
    callTwelveWeeks = self->_callTwelveWeeks;
    v480 = -callTwelveWeeks;
    if (callTwelveWeeks >= 0.0)
      v480 = self->_callTwelveWeeks;
    v481 = floor(v480 + 0.5);
    v482 = (v480 - v481) * 1.84467441e19;
    v478 = 2654435761u * (unint64_t)fmod(v481, 1.84467441e19);
    if (v482 >= 0.0)
    {
      if (v482 > 0.0)
        v478 += (unint64_t)v482;
    }
    else
    {
      v478 -= (unint64_t)fabs(v482);
    }
  }
  else
  {
    v478 = 0;
  }
  if ((v4 & 0x4000000000) != 0)
    v483 = 2654435761 * self->_contactFamilyRelation;
  else
    v483 = 0;
  v484 = -[NSString hash](self->_contactRelation, "hash");
  v485 = *((_QWORD *)&self->_has + 1);
  if ((v485 & 0x2000000000) != 0)
  {
    v486 = 2654435761 * self->_contactFamilyName;
    if ((v485 & 0x800000000000) != 0)
    {
LABEL_776:
      v487 = 2654435761 * self->_contactParent;
      if ((v485 & 0x800000000) != 0)
        goto LABEL_777;
      goto LABEL_788;
    }
  }
  else
  {
    v486 = 0;
    if ((v485 & 0x800000000000) != 0)
      goto LABEL_776;
  }
  v487 = 0;
  if ((v485 & 0x800000000) != 0)
  {
LABEL_777:
    v488 = 2654435761 * self->_contactEmergency;
    if ((v485 & 0x1000000000) != 0)
      goto LABEL_778;
    goto LABEL_789;
  }
LABEL_788:
  v488 = 0;
  if ((v485 & 0x1000000000) != 0)
  {
LABEL_778:
    v489 = 2654435761 * self->_contactEmergencyFamily;
    if ((v485 & 0x200000000000) != 0)
      goto LABEL_779;
    goto LABEL_790;
  }
LABEL_789:
  v489 = 0;
  if ((v485 & 0x200000000000) != 0)
  {
LABEL_779:
    v490 = 2654435761 * self->_contactInHome;
    if ((v485 & 0x400000000000) != 0)
      goto LABEL_780;
    goto LABEL_791;
  }
LABEL_790:
  v490 = 0;
  if ((v485 & 0x400000000000) != 0)
  {
LABEL_780:
    v491 = 2654435761 * self->_contactInPhotos;
    if ((v485 & 0x10000000000) != 0)
      goto LABEL_781;
    goto LABEL_792;
  }
LABEL_791:
  v491 = 0;
  if ((v485 & 0x10000000000) != 0)
  {
LABEL_781:
    v492 = 2654435761 * self->_contactInAirDrop;
    if ((v485 & 0x20000000000) != 0)
      goto LABEL_782;
    goto LABEL_793;
  }
LABEL_792:
  v492 = 0;
  if ((v485 & 0x20000000000) != 0)
  {
LABEL_782:
    v493 = 2654435761 * self->_contactInAirDropAtHome;
    if ((v485 & 0x80000000000) != 0)
      goto LABEL_783;
    goto LABEL_794;
  }
LABEL_793:
  v493 = 0;
  if ((v485 & 0x80000000000) != 0)
  {
LABEL_783:
    v494 = 2654435761 * self->_contactInFMFFollowingMe;
    if ((v485 & 0x100000000000) != 0)
      goto LABEL_784;
LABEL_795:
    v495 = 0;
    if ((v485 & 0x40000000000) != 0)
      goto LABEL_785;
LABEL_796:
    v496 = 0;
    return v472 ^ v590 ^ v466 ^ v589 ^ v588 ^ v465 ^ v587 ^ v586 ^ v585 ^ v584 ^ v583 ^ v582 ^ v581 ^ v580 ^ v579 ^ v578 ^ v577 ^ v576 ^ v575 ^ v574 ^ v573 ^ v572 ^ v571 ^ v570 ^ v569 ^ v568 ^ v567 ^ v566 ^ v565 ^ v564 ^ v563 ^ v562 ^ v561 ^ v560 ^ v559 ^ v558 ^ v557 ^ v556 ^ v555 ^ v554 ^ v553 ^ v552 ^ v551 ^ v550 ^ v549 ^ v548 ^ v547 ^ v546 ^ v545 ^ v544 ^ v543 ^ v542 ^ v541 ^ v540 ^ v539 ^ v538 ^ v537 ^ v536 ^ v535 ^ v534 ^ v533 ^ v532 ^ v531 ^ v530 ^ v529 ^ v528 ^ v527 ^ v526 ^ v525 ^ v524 ^ v523 ^ v522 ^ v521 ^ v520 ^ v519 ^ v518 ^ v517 ^ v516 ^ v515 ^ v514 ^ v513 ^ v512 ^ v511 ^ v510 ^ v509 ^ v508 ^ v507 ^ v506 ^ v505 ^ v504 ^ v503 ^ v502 ^ v501 ^ v500 ^ v499 ^ v498 ^ v460 ^ v467 ^ v473 ^ v478 ^ v483 ^ v484 ^ v486 ^ v487 ^ v488 ^ v489 ^ v490 ^ v491 ^ v492 ^ v493 ^ v494 ^ v495 ^ v496;
  }
LABEL_794:
  v494 = 0;
  if ((v485 & 0x100000000000) == 0)
    goto LABEL_795;
LABEL_784:
  v495 = 2654435761 * self->_contactInFMFSharingWithMe;
  if ((v485 & 0x40000000000) == 0)
    goto LABEL_796;
LABEL_785:
  v496 = 2654435761 * self->_contactInFMFFavorite;
  return v472 ^ v590 ^ v466 ^ v589 ^ v588 ^ v465 ^ v587 ^ v586 ^ v585 ^ v584 ^ v583 ^ v582 ^ v581 ^ v580 ^ v579 ^ v578 ^ v577 ^ v576 ^ v575 ^ v574 ^ v573 ^ v572 ^ v571 ^ v570 ^ v569 ^ v568 ^ v567 ^ v566 ^ v565 ^ v564 ^ v563 ^ v562 ^ v561 ^ v560 ^ v559 ^ v558 ^ v557 ^ v556 ^ v555 ^ v554 ^ v553 ^ v552 ^ v551 ^ v550 ^ v549 ^ v548 ^ v547 ^ v546 ^ v545 ^ v544 ^ v543 ^ v542 ^ v541 ^ v540 ^ v539 ^ v538 ^ v537 ^ v536 ^ v535 ^ v534 ^ v533 ^ v532 ^ v531 ^ v530 ^ v529 ^ v528 ^ v527 ^ v526 ^ v525 ^ v524 ^ v523 ^ v522 ^ v521 ^ v520 ^ v519 ^ v518 ^ v517 ^ v516 ^ v515 ^ v514 ^ v513 ^ v512 ^ v511 ^ v510 ^ v509 ^ v508 ^ v507 ^ v506 ^ v505 ^ v504 ^ v503 ^ v502 ^ v501 ^ v500 ^ v499 ^ v498 ^ v460 ^ v467 ^ v473 ^ v478 ^ v483 ^ v484 ^ v486 ^ v487 ^ v488 ^ v489 ^ v490 ^ v491 ^ v492 ^ v493 ^ v494 ^ v495 ^ v496;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x2000) != 0)
  {
    self->_firstPartyMsgTotal = *((_QWORD *)v4 + 78);
    *((_QWORD *)&self->_has + 1) |= 0x2000uLL;
    v5 = *((_QWORD *)v4 + 108);
  }
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x400000000000000) != 0)
  {
    self->_firstPartyMsgDayRatio = *((double *)v4 + 59);
    *(_QWORD *)&self->_has |= 0x400000000000000uLL;
    v6 = *((_QWORD *)v4 + 107);
    v5 = *((_QWORD *)v4 + 108);
    if ((v5 & 0x800) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_122;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_5;
  }
  self->_firstPartyMsgOutgoingRatio = *((double *)v4 + 76);
  *((_QWORD *)&self->_has + 1) |= 0x800uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_7;
    goto LABEL_123;
  }
LABEL_122:
  self->_firstPartyMsgMorningWeekday = *((double *)v4 + 67);
  *((_QWORD *)&self->_has + 1) |= 4uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x8000000000000000) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_124;
  }
LABEL_123:
  self->_firstPartyMsgMorningFri = *((double *)v4 + 64);
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_125;
  }
LABEL_124:
  self->_firstPartyMsgMorningSat = *((double *)v4 + 65);
  *((_QWORD *)&self->_has + 1) |= 1uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_126;
  }
LABEL_125:
  self->_firstPartyMsgMorningSun = *((double *)v4 + 66);
  *((_QWORD *)&self->_has + 1) |= 2uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_127;
  }
LABEL_126:
  self->_firstPartyMsgNoonWeekday = *((double *)v4 + 75);
  *((_QWORD *)&self->_has + 1) |= 0x400uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_128;
  }
LABEL_127:
  self->_firstPartyMsgNoonFri = *((double *)v4 + 72);
  *((_QWORD *)&self->_has + 1) |= 0x80uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_129;
  }
LABEL_128:
  self->_firstPartyMsgNoonSat = *((double *)v4 + 73);
  *((_QWORD *)&self->_has + 1) |= 0x100uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v6 & 0x4000000000000000) == 0)
      goto LABEL_14;
    goto LABEL_130;
  }
LABEL_129:
  self->_firstPartyMsgNoonSun = *((double *)v4 + 74);
  *((_QWORD *)&self->_has + 1) |= 0x200uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x4000000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x800000000000000) == 0)
      goto LABEL_15;
    goto LABEL_131;
  }
LABEL_130:
  self->_firstPartyMsgEveWeekday = *((double *)v4 + 63);
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_15:
    if ((v6 & 0x1000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_132;
  }
LABEL_131:
  self->_firstPartyMsgEveFri = *((double *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_16:
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_17;
    goto LABEL_133;
  }
LABEL_132:
  self->_firstPartyMsgEveSat = *((double *)v4 + 61);
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_134;
  }
LABEL_133:
  self->_firstPartyMsgEveSun = *((double *)v4 + 62);
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 8) == 0)
      goto LABEL_19;
    goto LABEL_135;
  }
LABEL_134:
  self->_firstPartyMsgNightWeekday = *((double *)v4 + 71);
  *((_QWORD *)&self->_has + 1) |= 0x40uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 8) == 0)
  {
LABEL_19:
    if ((v5 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_136;
  }
LABEL_135:
  self->_firstPartyMsgNightFri = *((double *)v4 + 68);
  *((_QWORD *)&self->_has + 1) |= 8uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x10) == 0)
  {
LABEL_20:
    if ((v5 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_137;
  }
LABEL_136:
  self->_firstPartyMsgNightSat = *((double *)v4 + 69);
  *((_QWORD *)&self->_has + 1) |= 0x10uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x20) == 0)
  {
LABEL_21:
    if ((v5 & 0x4000) == 0)
      goto LABEL_22;
    goto LABEL_138;
  }
LABEL_137:
  self->_firstPartyMsgNightSun = *((double *)v4 + 70);
  *((_QWORD *)&self->_has + 1) |= 0x20uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x4000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_139;
  }
LABEL_138:
  self->_firstPartyMsgTwoWeeks = *((double *)v4 + 79);
  *((_QWORD *)&self->_has + 1) |= 0x4000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x100000000) == 0)
      goto LABEL_24;
    goto LABEL_140;
  }
LABEL_139:
  self->_firstPartyMsgSixWeeks = *((double *)v4 + 77);
  *((_QWORD *)&self->_has + 1) |= 0x1000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x8000) == 0)
      goto LABEL_25;
    goto LABEL_141;
  }
LABEL_140:
  self->_thirdPartyMsgTotal = *((_QWORD *)v4 + 97);
  *((_QWORD *)&self->_has + 1) |= 0x100000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x8000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0)
      goto LABEL_26;
    goto LABEL_142;
  }
LABEL_141:
  self->_thirdPartyMsgDayRatio = *((double *)v4 + 80);
  *((_QWORD *)&self->_has + 1) |= 0x8000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0)
      goto LABEL_27;
    goto LABEL_143;
  }
LABEL_142:
  self->_thirdPartyMsgMorningWeekday = *((double *)v4 + 88);
  *((_QWORD *)&self->_has + 1) |= 0x800000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_144;
  }
LABEL_143:
  self->_thirdPartyMsgMorningFri = *((double *)v4 + 85);
  *((_QWORD *)&self->_has + 1) |= 0x100000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0)
      goto LABEL_29;
    goto LABEL_145;
  }
LABEL_144:
  self->_thirdPartyMsgMorningSat = *((double *)v4 + 86);
  *((_QWORD *)&self->_has + 1) |= 0x200000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_146;
  }
LABEL_145:
  self->_thirdPartyMsgMorningSun = *((double *)v4 + 87);
  *((_QWORD *)&self->_has + 1) |= 0x400000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v5 & 0x10000000) == 0)
      goto LABEL_31;
    goto LABEL_147;
  }
LABEL_146:
  self->_thirdPartyMsgNoonWeekday = *((double *)v4 + 96);
  *((_QWORD *)&self->_has + 1) |= 0x80000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_31:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_32;
    goto LABEL_148;
  }
LABEL_147:
  self->_thirdPartyMsgNoonFri = *((double *)v4 + 93);
  *((_QWORD *)&self->_has + 1) |= 0x10000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_32:
    if ((v5 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_149;
  }
LABEL_148:
  self->_thirdPartyMsgNoonSat = *((double *)v4 + 94);
  *((_QWORD *)&self->_has + 1) |= 0x20000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_150;
  }
LABEL_149:
  self->_thirdPartyMsgNoonSun = *((double *)v4 + 95);
  *((_QWORD *)&self->_has + 1) |= 0x40000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0)
      goto LABEL_35;
    goto LABEL_151;
  }
LABEL_150:
  self->_thirdPartyMsgEveWeekday = *((double *)v4 + 84);
  *((_QWORD *)&self->_has + 1) |= 0x80000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0)
      goto LABEL_36;
    goto LABEL_152;
  }
LABEL_151:
  self->_thirdPartyMsgEveFri = *((double *)v4 + 81);
  *((_QWORD *)&self->_has + 1) |= 0x10000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0)
      goto LABEL_37;
    goto LABEL_153;
  }
LABEL_152:
  self->_thirdPartyMsgEveSat = *((double *)v4 + 82);
  *((_QWORD *)&self->_has + 1) |= 0x20000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_38;
    goto LABEL_154;
  }
LABEL_153:
  self->_thirdPartyMsgEveSun = *((double *)v4 + 83);
  *((_QWORD *)&self->_has + 1) |= 0x40000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_39;
    goto LABEL_155;
  }
LABEL_154:
  self->_thirdPartyMsgNightWeekday = *((double *)v4 + 92);
  *((_QWORD *)&self->_has + 1) |= 0x8000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_156;
  }
LABEL_155:
  self->_thirdPartyMsgNightFri = *((double *)v4 + 89);
  *((_QWORD *)&self->_has + 1) |= 0x1000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_40:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_41;
    goto LABEL_157;
  }
LABEL_156:
  self->_thirdPartyMsgNightSat = *((double *)v4 + 90);
  *((_QWORD *)&self->_has + 1) |= 0x2000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v5 & 0x200000000) == 0)
      goto LABEL_42;
    goto LABEL_158;
  }
LABEL_157:
  self->_thirdPartyMsgNightSun = *((double *)v4 + 91);
  *((_QWORD *)&self->_has + 1) |= 0x4000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x40000000000000) == 0)
      goto LABEL_43;
    goto LABEL_159;
  }
LABEL_158:
  self->_thirdPartyMsgTwoWeeks = *((double *)v4 + 98);
  *((_QWORD *)&self->_has + 1) |= 0x200000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_43:
    if ((v5 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_160;
  }
LABEL_159:
  self->_callTotal = *((_QWORD *)v4 + 55);
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  v5 = *((_QWORD *)v4 + 108);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v5 & 0x8000000000) == 0)
      goto LABEL_45;
    goto LABEL_161;
  }
LABEL_160:
  self->_callBirthday = *((_DWORD *)v4 + 198);
  *((_QWORD *)&self->_has + 1) |= 0x400000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((*((_QWORD *)v4 + 108) & 0x8000000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x80000000000000) == 0)
      goto LABEL_46;
    goto LABEL_162;
  }
LABEL_161:
  self->_contactFavorite = *((_DWORD *)v4 + 203);
  *((_QWORD *)&self->_has + 1) |= 0x8000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x80000000000000) == 0)
  {
LABEL_46:
    if ((v6 & 2) == 0)
      goto LABEL_47;
    goto LABEL_163;
  }
LABEL_162:
  self->_callTotalDur = *((double *)v4 + 56);
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 2) == 0)
  {
LABEL_47:
    if ((v6 & 0x4000000000) == 0)
      goto LABEL_48;
    goto LABEL_164;
  }
LABEL_163:
  self->_callDayRatio = *((double *)v4 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x10000000000000) == 0)
      goto LABEL_49;
    goto LABEL_165;
  }
LABEL_164:
  self->_callLongRatio = *((double *)v4 + 39);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x10000000000000) == 0)
  {
LABEL_49:
    if ((v6 & 1) == 0)
      goto LABEL_50;
    goto LABEL_166;
  }
LABEL_165:
  self->_callOutgoingRatio = *((double *)v4 + 53);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 1) == 0)
  {
LABEL_50:
    if ((v6 & 0x8000000000) == 0)
      goto LABEL_51;
    goto LABEL_167;
  }
LABEL_166:
  self->_callAvgDur = *((double *)v4 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x8000000000) == 0)
  {
LABEL_51:
    if ((v6 & 0x80000000000) == 0)
      goto LABEL_52;
    goto LABEL_168;
  }
LABEL_167:
  self->_callMaxDur = *((double *)v4 + 40);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_52:
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_169;
  }
LABEL_168:
  self->_callMorningWeekday = *((double *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_53:
    if ((v6 & 0x20000000000) == 0)
      goto LABEL_54;
    goto LABEL_170;
  }
LABEL_169:
  self->_callMorningFri = *((double *)v4 + 41);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_54:
    if ((v6 & 0x40000000000) == 0)
      goto LABEL_55;
    goto LABEL_171;
  }
LABEL_170:
  self->_callMorningSat = *((double *)v4 + 42);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_55:
    if ((v6 & 0x8000000000000) == 0)
      goto LABEL_56;
    goto LABEL_172;
  }
LABEL_171:
  self->_callMorningSun = *((double *)v4 + 43);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v6 & 0x1000000000000) == 0)
      goto LABEL_57;
    goto LABEL_173;
  }
LABEL_172:
  self->_callNoonWeekday = *((double *)v4 + 52);
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_57:
    if ((v6 & 0x2000000000000) == 0)
      goto LABEL_58;
    goto LABEL_174;
  }
LABEL_173:
  self->_callNoonFri = *((double *)v4 + 49);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_58:
    if ((v6 & 0x4000000000000) == 0)
      goto LABEL_59;
    goto LABEL_175;
  }
LABEL_174:
  self->_callNoonSat = *((double *)v4 + 50);
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_59:
    if ((v6 & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_176;
  }
LABEL_175:
  self->_callNoonSun = *((double *)v4 + 51);
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x200000) == 0)
  {
LABEL_60:
    if ((v6 & 0x40000) == 0)
      goto LABEL_61;
    goto LABEL_177;
  }
LABEL_176:
  self->_callEveWeekday = *((double *)v4 + 22);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x40000) == 0)
  {
LABEL_61:
    if ((v6 & 0x80000) == 0)
      goto LABEL_62;
    goto LABEL_178;
  }
LABEL_177:
  self->_callEveFri = *((double *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x40000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x80000) == 0)
  {
LABEL_62:
    if ((v6 & 0x100000) == 0)
      goto LABEL_63;
    goto LABEL_179;
  }
LABEL_178:
  self->_callEveSat = *((double *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x100000) == 0)
  {
LABEL_63:
    if ((v6 & 0x800000000000) == 0)
      goto LABEL_64;
    goto LABEL_180;
  }
LABEL_179:
  self->_callEveSun = *((double *)v4 + 21);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x800000000000) == 0)
  {
LABEL_64:
    if ((v6 & 0x100000000000) == 0)
      goto LABEL_65;
    goto LABEL_181;
  }
LABEL_180:
  self->_callNightWeekday = *((double *)v4 + 48);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_65:
    if ((v6 & 0x200000000000) == 0)
      goto LABEL_66;
    goto LABEL_182;
  }
LABEL_181:
  self->_callNightFri = *((double *)v4 + 45);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x200000000000) == 0)
  {
LABEL_66:
    if ((v6 & 0x400000000000) == 0)
      goto LABEL_67;
    goto LABEL_183;
  }
LABEL_182:
  self->_callNightSat = *((double *)v4 + 46);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x400000000000) == 0)
  {
LABEL_67:
    if ((v6 & 0x200) == 0)
      goto LABEL_68;
    goto LABEL_184;
  }
LABEL_183:
  self->_callNightSun = *((double *)v4 + 47);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x200) == 0)
  {
LABEL_68:
    if ((v6 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_185;
  }
LABEL_184:
  self->_callDurMorningWeekday = *((double *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x40) == 0)
  {
LABEL_69:
    if ((v6 & 0x80) == 0)
      goto LABEL_70;
    goto LABEL_186;
  }
LABEL_185:
  self->_callDurMorningFri = *((double *)v4 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x80) == 0)
  {
LABEL_70:
    if ((v6 & 0x100) == 0)
      goto LABEL_71;
    goto LABEL_187;
  }
LABEL_186:
  self->_callDurMorningSat = *((double *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x100) == 0)
  {
LABEL_71:
    if ((v6 & 0x20000) == 0)
      goto LABEL_72;
    goto LABEL_188;
  }
LABEL_187:
  self->_callDurMorningSun = *((double *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x20000) == 0)
  {
LABEL_72:
    if ((v6 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_189;
  }
LABEL_188:
  self->_callDurNoonWeekday = *((double *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x4000) == 0)
  {
LABEL_73:
    if ((v6 & 0x8000) == 0)
      goto LABEL_74;
    goto LABEL_190;
  }
LABEL_189:
  self->_callDurNoonFri = *((double *)v4 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x8000) == 0)
  {
LABEL_74:
    if ((v6 & 0x10000) == 0)
      goto LABEL_75;
    goto LABEL_191;
  }
LABEL_190:
  self->_callDurNoonSat = *((double *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x10000) == 0)
  {
LABEL_75:
    if ((v6 & 0x20) == 0)
      goto LABEL_76;
    goto LABEL_192;
  }
LABEL_191:
  self->_callDurNoonSun = *((double *)v4 + 17);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x20) == 0)
  {
LABEL_76:
    if ((v6 & 4) == 0)
      goto LABEL_77;
    goto LABEL_193;
  }
LABEL_192:
  self->_callDurEveWeekday = *((double *)v4 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 4) == 0)
  {
LABEL_77:
    if ((v6 & 8) == 0)
      goto LABEL_78;
    goto LABEL_194;
  }
LABEL_193:
  self->_callDurEveFri = *((double *)v4 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 8) == 0)
  {
LABEL_78:
    if ((v6 & 0x10) == 0)
      goto LABEL_79;
    goto LABEL_195;
  }
LABEL_194:
  self->_callDurEveSat = *((double *)v4 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x10) == 0)
  {
LABEL_79:
    if ((v6 & 0x2000) == 0)
      goto LABEL_80;
    goto LABEL_196;
  }
LABEL_195:
  self->_callDurEveSun = *((double *)v4 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x2000) == 0)
  {
LABEL_80:
    if ((v6 & 0x400) == 0)
      goto LABEL_81;
    goto LABEL_197;
  }
LABEL_196:
  self->_callDurNightWeekday = *((double *)v4 + 14);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x400) == 0)
  {
LABEL_81:
    if ((v6 & 0x800) == 0)
      goto LABEL_82;
    goto LABEL_198;
  }
LABEL_197:
  self->_callDurNightFri = *((double *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x400uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x800) == 0)
  {
LABEL_82:
    if ((v6 & 0x1000) == 0)
      goto LABEL_83;
    goto LABEL_199;
  }
LABEL_198:
  self->_callDurNightSat = *((double *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x1000) == 0)
  {
LABEL_83:
    if ((v6 & 0x20000000) == 0)
      goto LABEL_84;
    goto LABEL_200;
  }
LABEL_199:
  self->_callDurNightSun = *((double *)v4 + 13);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_84:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_85;
    goto LABEL_201;
  }
LABEL_200:
  self->_callLongMorningWeekday = *((double *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_85:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_86;
    goto LABEL_202;
  }
LABEL_201:
  self->_callLongMorningFri = *((double *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_86:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_87;
    goto LABEL_203;
  }
LABEL_202:
  self->_callLongMorningSat = *((double *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_87:
    if ((v6 & 0x2000000000) == 0)
      goto LABEL_88;
    goto LABEL_204;
  }
LABEL_203:
  self->_callLongMorningSun = *((double *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_88:
    if ((v6 & 0x400000000) == 0)
      goto LABEL_89;
    goto LABEL_205;
  }
LABEL_204:
  self->_callLongNoonWeekday = *((double *)v4 + 38);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_89:
    if ((v6 & 0x800000000) == 0)
      goto LABEL_90;
    goto LABEL_206;
  }
LABEL_205:
  self->_callLongNoonFri = *((double *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_90:
    if ((v6 & 0x1000000000) == 0)
      goto LABEL_91;
    goto LABEL_207;
  }
LABEL_206:
  self->_callLongNoonSat = *((double *)v4 + 36);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_91:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_92;
    goto LABEL_208;
  }
LABEL_207:
  self->_callLongNoonSun = *((double *)v4 + 37);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_92:
    if ((v6 & 0x400000) == 0)
      goto LABEL_93;
    goto LABEL_209;
  }
LABEL_208:
  self->_callLongEveWeekday = *((double *)v4 + 26);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x400000) == 0)
  {
LABEL_93:
    if ((v6 & 0x800000) == 0)
      goto LABEL_94;
    goto LABEL_210;
  }
LABEL_209:
  self->_callLongEveFri = *((double *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x800000) == 0)
  {
LABEL_94:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_95;
    goto LABEL_211;
  }
LABEL_210:
  self->_callLongEveSat = *((double *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_95:
    if ((v6 & 0x200000000) == 0)
      goto LABEL_96;
    goto LABEL_212;
  }
LABEL_211:
  self->_callLongEveSun = *((double *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_96:
    if ((v6 & 0x40000000) == 0)
      goto LABEL_97;
    goto LABEL_213;
  }
LABEL_212:
  self->_callLongNightWeekday = *((double *)v4 + 34);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_97:
    if ((v6 & 0x80000000) == 0)
      goto LABEL_98;
    goto LABEL_214;
  }
LABEL_213:
  self->_callLongNightFri = *((double *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_98:
    if ((v6 & 0x100000000) == 0)
      goto LABEL_99;
    goto LABEL_215;
  }
LABEL_214:
  self->_callLongNightSat = *((double *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_99:
    if ((v6 & 0x200000000000000) == 0)
      goto LABEL_100;
    goto LABEL_216;
  }
LABEL_215:
  self->_callLongNightSun = *((double *)v4 + 33);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((v6 & 0x20000000000000) == 0)
      goto LABEL_101;
    goto LABEL_217;
  }
LABEL_216:
  self->_callTwoWeeks = *((double *)v4 + 58);
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v6 = *((_QWORD *)v4 + 107);
  if ((v6 & 0x20000000000000) == 0)
  {
LABEL_101:
    if ((v6 & 0x100000000000000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
LABEL_217:
  self->_callSixWeeks = *((double *)v4 + 54);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  if ((*((_QWORD *)v4 + 107) & 0x100000000000000) != 0)
  {
LABEL_102:
    self->_callTwelveWeeks = *((double *)v4 + 57);
    *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  }
LABEL_103:
  if ((*((_BYTE *)v4 + 868) & 0x40) != 0)
  {
    self->_contactFamilyRelation = *((_DWORD *)v4 + 202);
    *((_QWORD *)&self->_has + 1) |= 0x4000000000uLL;
  }
  if (*((_QWORD *)v4 + 106))
  {
    v8 = v4;
    -[CloudFamilyAnalysisPETContactEvent setContactRelation:](self, "setContactRelation:");
    v4 = v8;
  }
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x2000000000) != 0)
  {
    self->_contactFamilyName = *((_DWORD *)v4 + 201);
    *((_QWORD *)&self->_has + 1) |= 0x2000000000uLL;
    v7 = *((_QWORD *)v4 + 108);
    if ((v7 & 0x800000000000) == 0)
    {
LABEL_109:
      if ((v7 & 0x800000000) == 0)
        goto LABEL_110;
      goto LABEL_221;
    }
  }
  else if ((v7 & 0x800000000000) == 0)
  {
    goto LABEL_109;
  }
  self->_contactParent = *((_DWORD *)v4 + 211);
  *((_QWORD *)&self->_has + 1) |= 0x800000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x800000000) == 0)
  {
LABEL_110:
    if ((v7 & 0x1000000000) == 0)
      goto LABEL_111;
    goto LABEL_222;
  }
LABEL_221:
  self->_contactEmergency = *((_DWORD *)v4 + 199);
  *((_QWORD *)&self->_has + 1) |= 0x800000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_111:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_112;
    goto LABEL_223;
  }
LABEL_222:
  self->_contactEmergencyFamily = *((_DWORD *)v4 + 200);
  *((_QWORD *)&self->_has + 1) |= 0x1000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x200000000000) == 0)
  {
LABEL_112:
    if ((v7 & 0x400000000000) == 0)
      goto LABEL_113;
    goto LABEL_224;
  }
LABEL_223:
  self->_contactInHome = *((_DWORD *)v4 + 209);
  *((_QWORD *)&self->_has + 1) |= 0x200000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x400000000000) == 0)
  {
LABEL_113:
    if ((v7 & 0x10000000000) == 0)
      goto LABEL_114;
    goto LABEL_225;
  }
LABEL_224:
  self->_contactInPhotos = *((_DWORD *)v4 + 210);
  *((_QWORD *)&self->_has + 1) |= 0x400000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_114:
    if ((v7 & 0x20000000000) == 0)
      goto LABEL_115;
    goto LABEL_226;
  }
LABEL_225:
  self->_contactInAirDrop = *((_DWORD *)v4 + 204);
  *((_QWORD *)&self->_has + 1) |= 0x10000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_115:
    if ((v7 & 0x80000000000) == 0)
      goto LABEL_116;
    goto LABEL_227;
  }
LABEL_226:
  self->_contactInAirDropAtHome = *((_DWORD *)v4 + 205);
  *((_QWORD *)&self->_has + 1) |= 0x20000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x80000000000) == 0)
  {
LABEL_116:
    if ((v7 & 0x100000000000) == 0)
      goto LABEL_117;
LABEL_228:
    self->_contactInFMFSharingWithMe = *((_DWORD *)v4 + 208);
    *((_QWORD *)&self->_has + 1) |= 0x100000000000uLL;
    if ((*((_QWORD *)v4 + 108) & 0x40000000000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_227:
  self->_contactInFMFFollowingMe = *((_DWORD *)v4 + 207);
  *((_QWORD *)&self->_has + 1) |= 0x80000000000uLL;
  v7 = *((_QWORD *)v4 + 108);
  if ((v7 & 0x100000000000) != 0)
    goto LABEL_228;
LABEL_117:
  if ((v7 & 0x40000000000) != 0)
  {
LABEL_118:
    self->_contactInFMFFavorite = *((_DWORD *)v4 + 206);
    *((_QWORD *)&self->_has + 1) |= 0x40000000000uLL;
  }
LABEL_119:

}

- (unint64_t)firstPartyMsgTotal
{
  return self->_firstPartyMsgTotal;
}

- (double)firstPartyMsgDayRatio
{
  return self->_firstPartyMsgDayRatio;
}

- (double)firstPartyMsgOutgoingRatio
{
  return self->_firstPartyMsgOutgoingRatio;
}

- (double)firstPartyMsgMorningWeekday
{
  return self->_firstPartyMsgMorningWeekday;
}

- (double)firstPartyMsgMorningFri
{
  return self->_firstPartyMsgMorningFri;
}

- (double)firstPartyMsgMorningSat
{
  return self->_firstPartyMsgMorningSat;
}

- (double)firstPartyMsgMorningSun
{
  return self->_firstPartyMsgMorningSun;
}

- (double)firstPartyMsgNoonWeekday
{
  return self->_firstPartyMsgNoonWeekday;
}

- (double)firstPartyMsgNoonFri
{
  return self->_firstPartyMsgNoonFri;
}

- (double)firstPartyMsgNoonSat
{
  return self->_firstPartyMsgNoonSat;
}

- (double)firstPartyMsgNoonSun
{
  return self->_firstPartyMsgNoonSun;
}

- (double)firstPartyMsgEveWeekday
{
  return self->_firstPartyMsgEveWeekday;
}

- (double)firstPartyMsgEveFri
{
  return self->_firstPartyMsgEveFri;
}

- (double)firstPartyMsgEveSat
{
  return self->_firstPartyMsgEveSat;
}

- (double)firstPartyMsgEveSun
{
  return self->_firstPartyMsgEveSun;
}

- (double)firstPartyMsgNightWeekday
{
  return self->_firstPartyMsgNightWeekday;
}

- (double)firstPartyMsgNightFri
{
  return self->_firstPartyMsgNightFri;
}

- (double)firstPartyMsgNightSat
{
  return self->_firstPartyMsgNightSat;
}

- (double)firstPartyMsgNightSun
{
  return self->_firstPartyMsgNightSun;
}

- (double)firstPartyMsgTwoWeeks
{
  return self->_firstPartyMsgTwoWeeks;
}

- (double)firstPartyMsgSixWeeks
{
  return self->_firstPartyMsgSixWeeks;
}

- (unint64_t)thirdPartyMsgTotal
{
  return self->_thirdPartyMsgTotal;
}

- (double)thirdPartyMsgDayRatio
{
  return self->_thirdPartyMsgDayRatio;
}

- (double)thirdPartyMsgMorningWeekday
{
  return self->_thirdPartyMsgMorningWeekday;
}

- (double)thirdPartyMsgMorningFri
{
  return self->_thirdPartyMsgMorningFri;
}

- (double)thirdPartyMsgMorningSat
{
  return self->_thirdPartyMsgMorningSat;
}

- (double)thirdPartyMsgMorningSun
{
  return self->_thirdPartyMsgMorningSun;
}

- (double)thirdPartyMsgNoonWeekday
{
  return self->_thirdPartyMsgNoonWeekday;
}

- (double)thirdPartyMsgNoonFri
{
  return self->_thirdPartyMsgNoonFri;
}

- (double)thirdPartyMsgNoonSat
{
  return self->_thirdPartyMsgNoonSat;
}

- (double)thirdPartyMsgNoonSun
{
  return self->_thirdPartyMsgNoonSun;
}

- (double)thirdPartyMsgEveWeekday
{
  return self->_thirdPartyMsgEveWeekday;
}

- (double)thirdPartyMsgEveFri
{
  return self->_thirdPartyMsgEveFri;
}

- (double)thirdPartyMsgEveSat
{
  return self->_thirdPartyMsgEveSat;
}

- (double)thirdPartyMsgEveSun
{
  return self->_thirdPartyMsgEveSun;
}

- (double)thirdPartyMsgNightWeekday
{
  return self->_thirdPartyMsgNightWeekday;
}

- (double)thirdPartyMsgNightFri
{
  return self->_thirdPartyMsgNightFri;
}

- (double)thirdPartyMsgNightSat
{
  return self->_thirdPartyMsgNightSat;
}

- (double)thirdPartyMsgNightSun
{
  return self->_thirdPartyMsgNightSun;
}

- (double)thirdPartyMsgTwoWeeks
{
  return self->_thirdPartyMsgTwoWeeks;
}

- (unint64_t)callTotal
{
  return self->_callTotal;
}

- (unsigned)callBirthday
{
  return self->_callBirthday;
}

- (unsigned)contactFavorite
{
  return self->_contactFavorite;
}

- (double)callTotalDur
{
  return self->_callTotalDur;
}

- (double)callDayRatio
{
  return self->_callDayRatio;
}

- (double)callLongRatio
{
  return self->_callLongRatio;
}

- (double)callOutgoingRatio
{
  return self->_callOutgoingRatio;
}

- (double)callAvgDur
{
  return self->_callAvgDur;
}

- (double)callMaxDur
{
  return self->_callMaxDur;
}

- (double)callMorningWeekday
{
  return self->_callMorningWeekday;
}

- (double)callMorningFri
{
  return self->_callMorningFri;
}

- (double)callMorningSat
{
  return self->_callMorningSat;
}

- (double)callMorningSun
{
  return self->_callMorningSun;
}

- (double)callNoonWeekday
{
  return self->_callNoonWeekday;
}

- (double)callNoonFri
{
  return self->_callNoonFri;
}

- (double)callNoonSat
{
  return self->_callNoonSat;
}

- (double)callNoonSun
{
  return self->_callNoonSun;
}

- (double)callEveWeekday
{
  return self->_callEveWeekday;
}

- (double)callEveFri
{
  return self->_callEveFri;
}

- (double)callEveSat
{
  return self->_callEveSat;
}

- (double)callEveSun
{
  return self->_callEveSun;
}

- (double)callNightWeekday
{
  return self->_callNightWeekday;
}

- (double)callNightFri
{
  return self->_callNightFri;
}

- (double)callNightSat
{
  return self->_callNightSat;
}

- (double)callNightSun
{
  return self->_callNightSun;
}

- (double)callDurMorningWeekday
{
  return self->_callDurMorningWeekday;
}

- (double)callDurMorningFri
{
  return self->_callDurMorningFri;
}

- (double)callDurMorningSat
{
  return self->_callDurMorningSat;
}

- (double)callDurMorningSun
{
  return self->_callDurMorningSun;
}

- (double)callDurNoonWeekday
{
  return self->_callDurNoonWeekday;
}

- (double)callDurNoonFri
{
  return self->_callDurNoonFri;
}

- (double)callDurNoonSat
{
  return self->_callDurNoonSat;
}

- (double)callDurNoonSun
{
  return self->_callDurNoonSun;
}

- (double)callDurEveWeekday
{
  return self->_callDurEveWeekday;
}

- (double)callDurEveFri
{
  return self->_callDurEveFri;
}

- (double)callDurEveSat
{
  return self->_callDurEveSat;
}

- (double)callDurEveSun
{
  return self->_callDurEveSun;
}

- (double)callDurNightWeekday
{
  return self->_callDurNightWeekday;
}

- (double)callDurNightFri
{
  return self->_callDurNightFri;
}

- (double)callDurNightSat
{
  return self->_callDurNightSat;
}

- (double)callDurNightSun
{
  return self->_callDurNightSun;
}

- (double)callLongMorningWeekday
{
  return self->_callLongMorningWeekday;
}

- (double)callLongMorningFri
{
  return self->_callLongMorningFri;
}

- (double)callLongMorningSat
{
  return self->_callLongMorningSat;
}

- (double)callLongMorningSun
{
  return self->_callLongMorningSun;
}

- (double)callLongNoonWeekday
{
  return self->_callLongNoonWeekday;
}

- (double)callLongNoonFri
{
  return self->_callLongNoonFri;
}

- (double)callLongNoonSat
{
  return self->_callLongNoonSat;
}

- (double)callLongNoonSun
{
  return self->_callLongNoonSun;
}

- (double)callLongEveWeekday
{
  return self->_callLongEveWeekday;
}

- (double)callLongEveFri
{
  return self->_callLongEveFri;
}

- (double)callLongEveSat
{
  return self->_callLongEveSat;
}

- (double)callLongEveSun
{
  return self->_callLongEveSun;
}

- (double)callLongNightWeekday
{
  return self->_callLongNightWeekday;
}

- (double)callLongNightFri
{
  return self->_callLongNightFri;
}

- (double)callLongNightSat
{
  return self->_callLongNightSat;
}

- (double)callLongNightSun
{
  return self->_callLongNightSun;
}

- (double)callTwoWeeks
{
  return self->_callTwoWeeks;
}

- (double)callSixWeeks
{
  return self->_callSixWeeks;
}

- (double)callTwelveWeeks
{
  return self->_callTwelveWeeks;
}

- (unsigned)contactFamilyRelation
{
  return self->_contactFamilyRelation;
}

- (NSString)contactRelation
{
  return self->_contactRelation;
}

- (void)setContactRelation:(id)a3
{
  objc_storeStrong((id *)&self->_contactRelation, a3);
}

- (unsigned)contactFamilyName
{
  return self->_contactFamilyName;
}

- (unsigned)contactParent
{
  return self->_contactParent;
}

- (unsigned)contactEmergency
{
  return self->_contactEmergency;
}

- (unsigned)contactEmergencyFamily
{
  return self->_contactEmergencyFamily;
}

- (unsigned)contactInHome
{
  return self->_contactInHome;
}

- (unsigned)contactInPhotos
{
  return self->_contactInPhotos;
}

- (unsigned)contactInAirDrop
{
  return self->_contactInAirDrop;
}

- (unsigned)contactInAirDropAtHome
{
  return self->_contactInAirDropAtHome;
}

- (unsigned)contactInFMFFollowingMe
{
  return self->_contactInFMFFollowingMe;
}

- (unsigned)contactInFMFSharingWithMe
{
  return self->_contactInFMFSharingWithMe;
}

- (unsigned)contactInFMFFavorite
{
  return self->_contactInFMFFavorite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRelation, 0);
}

@end
