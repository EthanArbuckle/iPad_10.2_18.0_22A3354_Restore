@implementation GEOLogMsgEventPredExTrainingData

- (GEOLogMsgEventPredExTrainingData)init
{
  GEOLogMsgEventPredExTrainingData *v2;
  GEOLogMsgEventPredExTrainingData *v3;
  GEOLogMsgEventPredExTrainingData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  v2 = -[GEOLogMsgEventPredExTrainingData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPredExTrainingData)initWithData:(id)a3
{
  GEOLogMsgEventPredExTrainingData *v3;
  GEOLogMsgEventPredExTrainingData *v4;
  GEOLogMsgEventPredExTrainingData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  v3 = -[GEOLogMsgEventPredExTrainingData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)entryType
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x80000) != 0)
    return self->_entryType;
  else
    return 0;
}

- (void)setEntryType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100080000uLL;
  self->_entryType = a3;
}

- (void)setHasEntryType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100080000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEntryType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (id)entryTypeAsString:(int)a3
{
  if (a3 < 0x13)
    return off_1E1C22620[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALENDAR_EVENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREQUENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECENT_HISTORY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_PLACE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARKED_CAR")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTAURANT_RESERVATION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARING")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_LOW_ENERGY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CONNECTION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOTEL")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_RENTAL")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAVEL_FLIGHT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TICKETED_EVENT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PLACE")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)durationUntilEventStart
{
  return self->_durationUntilEventStart;
}

- (void)setDurationUntilEventStart:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000020uLL;
  self->_durationUntilEventStart = a3;
}

- (void)setHasDurationUntilEventStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000020;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDurationUntilEventStart
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (double)durationUntilEventEnd
{
  return self->_durationUntilEventEnd;
}

- (void)setDurationUntilEventEnd:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000010uLL;
  self->_durationUntilEventEnd = a3;
}

- (void)setHasDurationUntilEventEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000010;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDurationUntilEventEnd
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000100uLL;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000100;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasStartTime
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000040uLL;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000040;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasEndTime
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000200uLL;
  self->_temperature = a3;
}

- (void)setHasTemperature:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000200;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTemperature
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)chanceOfPrecipitation
{
  return self->_chanceOfPrecipitation;
}

- (void)setChanceOfPrecipitation:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000001uLL;
  self->_chanceOfPrecipitation = a3;
}

- (void)setHasChanceOfPrecipitation:(BOOL)a3
{
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFELL | a3 | 0x100000000);
}

- (BOOL)hasChanceOfPrecipitation
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)chanceOfRain
{
  return self->_chanceOfRain;
}

- (void)setChanceOfRain:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000002uLL;
  self->_chanceOfRain = a3;
}

- (void)setHasChanceOfRain:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000002;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasChanceOfRain
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)chanceOfSnow
{
  return self->_chanceOfSnow;
}

- (void)setChanceOfSnow:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000004uLL;
  self->_chanceOfSnow = a3;
}

- (void)setHasChanceOfSnow:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000004;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasChanceOfSnow
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000400uLL;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000400;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasTimeOfDay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000008uLL;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000008;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000080uLL;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000080;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIsTourist
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)preferredTransportMode
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x400000) != 0)
    return self->_preferredTransportMode;
  else
    return 0;
}

- (void)setPreferredTransportMode:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100400000uLL;
  self->_preferredTransportMode = a3;
}

- (void)setHasPreferredTransportMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100400000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPreferredTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (id)preferredTransportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING_MODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapType
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x100000) != 0)
    return self->_mapType;
  else
    return 0;
}

- (void)setMapType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100100000uLL;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100100000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMapType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22CC0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isTransitPossible
{
  return self->_isTransitPossible;
}

- (void)setIsTransitPossible:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x108000000uLL;
  self->_isTransitPossible = a3;
}

- (void)setHasIsTransitPossible:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x108000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsTransitPossible
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (BOOL)isInBasemode
{
  return self->_isInBasemode;
}

- (void)setIsInBasemode:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x104000000uLL;
  self->_isInBasemode = a3;
}

- (void)setHasIsInBasemode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x104000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsInBasemode
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (double)timeSinceBackgrounded
{
  return self->_timeSinceBackgrounded;
}

- (void)setTimeSinceBackgrounded:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x100000800uLL;
  self->_timeSinceBackgrounded = a3;
}

- (void)setHasTimeSinceBackgrounded:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000800;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasTimeSinceBackgrounded
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)routePlanningScreenPresented
{
  return self->_routePlanningScreenPresented;
}

- (void)setRoutePlanningScreenPresented:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x120000000uLL;
  self->_routePlanningScreenPresented = a3;
}

- (void)setHasRoutePlanningScreenPresented:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x120000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRoutePlanningScreenPresented
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (int)predictedTransportMode
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x200000) != 0)
    return self->_predictedTransportMode;
  else
    return 0;
}

- (void)setPredictedTransportMode:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100200000uLL;
  self->_predictedTransportMode = a3;
}

- (void)setHasPredictedTransportMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100200000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPredictedTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)predictedTransportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPredictedTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING_MODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)actualTransportMode
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0)
    return self->_actualTransportMode;
  else
    return 0;
}

- (void)setActualTransportMode:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100001000uLL;
  self->_actualTransportMode = a3;
}

- (void)setHasActualTransportMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100001000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasActualTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)actualTransportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActualTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING_MODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromHere
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x20000) != 0)
    return self->_distanceFromHere;
  else
    return 0;
}

- (void)setDistanceFromHere:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100020000uLL;
  self->_distanceFromHere = a3;
}

- (void)setHasDistanceFromHere:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100020000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasDistanceFromHere
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (id)distanceFromHereAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromHere:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToOrigin
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x4000) != 0)
    return self->_distanceFromHereToOrigin;
  else
    return 0;
}

- (void)setDistanceFromHereToOrigin:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100004000uLL;
  self->_distanceFromHereToOrigin = a3;
}

- (void)setHasDistanceFromHereToOrigin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100004000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToOrigin
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)distanceFromHereToOriginAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromHereToOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromOriginToDestination
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x40000) != 0)
    return self->_distanceFromOriginToDestination;
  else
    return 0;
}

- (void)setDistanceFromOriginToDestination:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100040000uLL;
  self->_distanceFromOriginToDestination = a3;
}

- (void)setHasDistanceFromOriginToDestination:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100040000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDistanceFromOriginToDestination
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (id)distanceFromOriginToDestinationAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromOriginToDestination:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToHome
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x2000) != 0)
    return self->_distanceFromHereToHome;
  else
    return 0;
}

- (void)setDistanceFromHereToHome:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100002000uLL;
  self->_distanceFromHereToHome = a3;
}

- (void)setHasDistanceFromHereToHome:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100002000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToHome
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)distanceFromHereToHomeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromHereToHome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToWork
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x10000) != 0)
    return self->_distanceFromHereToWork;
  else
    return 0;
}

- (void)setDistanceFromHereToWork:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100010000uLL;
  self->_distanceFromHereToWork = a3;
}

- (void)setHasDistanceFromHereToWork:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100010000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToWork
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (id)distanceFromHereToWorkAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromHereToWork:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToParkedCar
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x8000) != 0)
    return self->_distanceFromHereToParkedCar;
  else
    return 0;
}

- (void)setDistanceFromHereToParkedCar:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100008000uLL;
  self->_distanceFromHereToParkedCar = a3;
}

- (void)setHasDistanceFromHereToParkedCar:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100008000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasDistanceFromHereToParkedCar
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (id)distanceFromHereToParkedCarAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C226B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDistanceFromHereToParkedCar:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAR")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readUserLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 203) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPredExTrainingDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocation_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasUserLocation
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocation]((uint64_t)self);
  return self->_userLocation != 0;
}

- (GEOLatLng)userLocation
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocation]((uint64_t)self);
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x180000000uLL;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readUserLocationGeohash4
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 203) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPredExTrainingDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserLocationGeohash4_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasUserLocationGeohash4
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocationGeohash4]((uint64_t)self);
  return self->_userLocationGeohash4 != 0;
}

- (NSString)userLocationGeohash4
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocationGeohash4]((uint64_t)self);
  return self->_userLocationGeohash4;
}

- (void)setUserLocationGeohash4:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x140000000uLL;
  objc_storeStrong((id *)&self->_userLocationGeohash4, a3);
}

- (BOOL)isCarplayConnected
{
  return self->_isCarplayConnected;
}

- (void)setIsCarplayConnected:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x102000000uLL;
  self->_isCarplayConnected = a3;
}

- (void)setHasIsCarplayConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x102000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsCarplayConnected
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (int)weatherType
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
    return self->_weatherType;
  else
    return 0;
}

- (void)setWeatherType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x101000000uLL;
  self->_weatherType = a3;
}

- (void)setHasWeatherType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x101000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasWeatherType
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (id)weatherTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x2E && ((0x3FFAAFFFFFFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C226D8[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsWeatherType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_TORNADO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_TROPICAL_STORM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HURRICANE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SEVERE_THUNDERSTORMS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_THUNDERSTORMS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SNOW")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SLEET")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_SNOW_AND_SLEET")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FREEZING_DRIZZLE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_DRIZZLE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FREEZING_RAIN")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SHOWERS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_RAIN")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SNOW_FLURRIES")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_LIGHT_SNOW_SHOWERS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLOWING_SNOW")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SNOW")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HAIL")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SLEET")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_DUST")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FOGGY")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HAZE")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SMOKY")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLUSTERY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_WINDY")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_COLD")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_CLOUDY")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLOUDY")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_PARTLY_CLOUDY")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_CLEAR")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLEAR")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_HAIL")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HOT")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSTORMS")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_THUNDERSTORMS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_SHOWERS")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HEAVY_RAIN")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_SNOW_SHOWERS")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HEAVY_SNOW")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLIZZARD")) & 1) != 0)
  {
    v4 = 44;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSHOWERS")))
  {
    v4 = 45;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)weatherAqi
{
  return self->_weatherAqi;
}

- (void)setWeatherAqi:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x100800000uLL;
  self->_weatherAqi = a3;
}

- (void)setHasWeatherAqi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100800000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWeatherAqi
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)isVehicleBluetoothConnected
{
  return self->_isVehicleBluetoothConnected;
}

- (void)setIsVehicleBluetoothConnected:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x110000000uLL;
  self->_isVehicleBluetoothConnected = a3;
}

- (void)setHasIsVehicleBluetoothConnected:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x110000000;
  self->_flags = ($A2888D52E07BB247939D0F55CC592477)(*(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsVehicleBluetoothConnected
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
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
  v8.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  -[GEOLogMsgEventPredExTrainingData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventPredExTrainingData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPredExTrainingData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  __CFString *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  __CFString *v48;
  const __CFString *v49;
  uint64_t v50;
  __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  __CFString *v54;
  const __CFString *v55;
  uint64_t v56;
  __CFString *v57;
  const __CFString *v58;
  uint64_t v59;
  __CFString *v60;
  const __CFString *v61;
  uint64_t v62;
  __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  __CFString *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  id v72;
  void *v73;
  const __CFString *v74;
  uint64_t v75;
  void *v76;
  const __CFString *v77;
  id v78;
  void *v80;
  const __CFString *v81;
  unsigned int v82;
  __CFString *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;

  if (!a1)
  {
    v78 = 0;
    return v78;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x80000) != 0)
  {
    v6 = *(int *)(a1 + 168);
    if (v6 >= 0x13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 168));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C22620[v6];
    }
    if (a2)
      v8 = CFSTR("entryType");
    else
      v8 = CFSTR("entry_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_QWORD *)(a1 + 200);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("durationUntilEventStart");
    else
      v10 = CFSTR("duration_until_event_start");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_QWORD *)(a1 + 200);
    if ((v5 & 0x10) == 0)
    {
LABEL_12:
      if ((v5 & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_44;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("durationUntilEventEnd");
  else
    v12 = CFSTR("duration_until_event_end");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("startTime");
  else
    v14 = CFSTR("start_time");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x40) == 0)
  {
LABEL_14:
    if ((v5 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_52;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("endTime");
  else
    v16 = CFSTR("end_time");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x200) == 0)
  {
LABEL_15:
    if ((v5 & 1) == 0)
      goto LABEL_16;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("temperature"));

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 1) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0)
      goto LABEL_17;
    goto LABEL_57;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("chanceOfPrecipitation");
  else
    v19 = CFSTR("chance_of_precipitation");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_61;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("chanceOfRain");
  else
    v21 = CFSTR("chance_of_rain");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_65;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("chanceOfSnow");
  else
    v23 = CFSTR("chance_of_snow");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x400) == 0)
  {
LABEL_19:
    if ((v5 & 8) == 0)
      goto LABEL_20;
    goto LABEL_69;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 96));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("timeOfDay");
  else
    v25 = CFSTR("time_of_day");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 8) == 0)
  {
LABEL_20:
    if ((v5 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_73;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("dayOfWeek");
  else
    v27 = CFSTR("day_of_week");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x80) == 0)
  {
LABEL_21:
    if ((v5 & 0x400000) == 0)
      goto LABEL_22;
    goto LABEL_77;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("isTourist");
  else
    v29 = CFSTR("is_tourist");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x400000) == 0)
  {
LABEL_22:
    if ((v5 & 0x100000) == 0)
      goto LABEL_23;
    goto LABEL_84;
  }
LABEL_77:
  v30 = *(int *)(a1 + 180);
  if (v30 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 180));
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_1E1C23268[v30];
  }
  if (a2)
    v32 = CFSTR("preferredTransportMode");
  else
    v32 = CFSTR("preferred_transport_mode");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x100000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_91;
  }
LABEL_84:
  v33 = *(int *)(a1 + 172);
  if (v33 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 172));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E1C22CC0[v33];
  }
  if (a2)
    v35 = CFSTR("mapType");
  else
    v35 = CFSTR("map_type");
  objc_msgSend(v4, "setObject:forKey:", v34, v35);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_25;
    goto LABEL_95;
  }
LABEL_91:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 194));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v37 = CFSTR("isTransitPossible");
  else
    v37 = CFSTR("is_transit_possible");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_99;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 193));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v39 = CFSTR("isInBasemode");
  else
    v39 = CFSTR("is_in_basemode");
  objc_msgSend(v4, "setObject:forKey:", v38, v39);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x800) == 0)
  {
LABEL_26:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_27;
    goto LABEL_103;
  }
LABEL_99:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v41 = CFSTR("timeSinceBackgrounded");
  else
    v41 = CFSTR("time_since_backgrounded");
  objc_msgSend(v4, "setObject:forKey:", v40, v41);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0)
      goto LABEL_28;
    goto LABEL_107;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 196));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v43 = CFSTR("routePlanningScreenPresented");
  else
    v43 = CFSTR("route_planning_screen_presented");
  objc_msgSend(v4, "setObject:forKey:", v42, v43);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x1000) == 0)
      goto LABEL_29;
    goto LABEL_114;
  }
LABEL_107:
  v44 = *(int *)(a1 + 176);
  if (v44 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 176));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_1E1C23268[v44];
  }
  if (a2)
    v46 = CFSTR("predictedTransportMode");
  else
    v46 = CFSTR("predicted_transport_mode");
  objc_msgSend(v4, "setObject:forKey:", v45, v46);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x1000) == 0)
  {
LABEL_29:
    if ((v5 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_121;
  }
LABEL_114:
  v47 = *(int *)(a1 + 140);
  if (v47 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 140));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_1E1C23268[v47];
  }
  if (a2)
    v49 = CFSTR("actualTransportMode");
  else
    v49 = CFSTR("actual_transport_mode");
  objc_msgSend(v4, "setObject:forKey:", v48, v49);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x20000) == 0)
  {
LABEL_30:
    if ((v5 & 0x4000) == 0)
      goto LABEL_31;
    goto LABEL_128;
  }
LABEL_121:
  v50 = *(int *)(a1 + 160);
  if (v50 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 160));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v51 = off_1E1C226B8[v50];
  }
  if (a2)
    v52 = CFSTR("distanceFromHere");
  else
    v52 = CFSTR("distance_from_here");
  objc_msgSend(v4, "setObject:forKey:", v51, v52);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x4000) == 0)
  {
LABEL_31:
    if ((v5 & 0x40000) == 0)
      goto LABEL_32;
    goto LABEL_135;
  }
LABEL_128:
  v53 = *(int *)(a1 + 148);
  if (v53 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 148));
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = off_1E1C226B8[v53];
  }
  if (a2)
    v55 = CFSTR("distanceFromHereToOrigin");
  else
    v55 = CFSTR("distance_from_here_to_origin");
  objc_msgSend(v4, "setObject:forKey:", v54, v55);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x40000) == 0)
  {
LABEL_32:
    if ((v5 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_142;
  }
LABEL_135:
  v56 = *(int *)(a1 + 164);
  if (v56 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 164));
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = off_1E1C226B8[v56];
  }
  if (a2)
    v58 = CFSTR("distanceFromOriginToDestination");
  else
    v58 = CFSTR("distance_from_origin_to_destination");
  objc_msgSend(v4, "setObject:forKey:", v57, v58);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x2000) == 0)
  {
LABEL_33:
    if ((v5 & 0x10000) == 0)
      goto LABEL_34;
    goto LABEL_149;
  }
LABEL_142:
  v59 = *(int *)(a1 + 144);
  if (v59 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 144));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = off_1E1C226B8[v59];
  }
  if (a2)
    v61 = CFSTR("distanceFromHereToHome");
  else
    v61 = CFSTR("distance_from_here_to_home");
  objc_msgSend(v4, "setObject:forKey:", v60, v61);

  v5 = *(_QWORD *)(a1 + 200);
  if ((v5 & 0x10000) == 0)
  {
LABEL_34:
    if ((v5 & 0x8000) == 0)
      goto LABEL_163;
    goto LABEL_156;
  }
LABEL_149:
  v62 = *(int *)(a1 + 156);
  if (v62 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 156));
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = off_1E1C226B8[v62];
  }
  if (a2)
    v64 = CFSTR("distanceFromHereToWork");
  else
    v64 = CFSTR("distance_from_here_to_work");
  objc_msgSend(v4, "setObject:forKey:", v63, v64);

  if ((*(_QWORD *)(a1 + 200) & 0x8000) != 0)
  {
LABEL_156:
    v65 = *(int *)(a1 + 152);
    if (v65 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 152));
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E1C226B8[v65];
    }
    if (a2)
      v67 = CFSTR("distanceFromHereToParkedCar");
    else
      v67 = CFSTR("distance_from_here_to_parked_car");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);

  }
LABEL_163:
  objc_msgSend((id)a1, "userLocation");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v68;
  if (v68)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v68, "jsonRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("userLocation");
    }
    else
    {
      objc_msgSend(v68, "dictionaryRepresentation");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = CFSTR("user_location");
    }
    v72 = v70;

    objc_msgSend(v4, "setObject:forKey:", v72, v71);
  }

  objc_msgSend((id)a1, "userLocationGeohash4");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    if (a2)
      v74 = CFSTR("userLocationGeohash4");
    else
      v74 = CFSTR("user_location_geohash4");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);
  }

  v75 = *(_QWORD *)(a1 + 200);
  if ((v75 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 192));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v81 = CFSTR("isCarplayConnected");
    else
      v81 = CFSTR("is_carplay_connected");
    objc_msgSend(v4, "setObject:forKey:", v80, v81);

    v75 = *(_QWORD *)(a1 + 200);
    if ((v75 & 0x1000000) == 0)
    {
LABEL_175:
      if ((v75 & 0x800000) == 0)
        goto LABEL_176;
LABEL_195:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 184));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v86 = CFSTR("weatherAqi");
      else
        v86 = CFSTR("weather_aqi");
      objc_msgSend(v4, "setObject:forKey:", v85, v86);

      if ((*(_QWORD *)(a1 + 200) & 0x10000000) == 0)
        goto LABEL_181;
      goto LABEL_177;
    }
  }
  else if ((v75 & 0x1000000) == 0)
  {
    goto LABEL_175;
  }
  v82 = *(_DWORD *)(a1 + 188);
  if (v82 < 0x2E && ((0x3FFAAFFFFFFFuLL >> v82) & 1) != 0)
  {
    v83 = off_1E1C226D8[v82];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 188));
    v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
    v84 = CFSTR("weatherType");
  else
    v84 = CFSTR("weather_type");
  objc_msgSend(v4, "setObject:forKey:", v83, v84);

  v75 = *(_QWORD *)(a1 + 200);
  if ((v75 & 0x800000) != 0)
    goto LABEL_195;
LABEL_176:
  if ((v75 & 0x10000000) != 0)
  {
LABEL_177:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 195));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v77 = CFSTR("isVehicleBluetoothConnected");
    else
      v77 = CFSTR("is_vehicle_bluetooth_connected");
    objc_msgSend(v4, "setObject:forKey:", v76, v77);

  }
LABEL_181:
  v78 = v4;

  return v78;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPredExTrainingData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPredExTrainingData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPredExTrainingData *)-[GEOLogMsgEventPredExTrainingData _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  const __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  void *v68;
  id v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  void *v76;
  id v77;
  uint64_t v78;
  const __CFString *v79;
  void *v80;
  GEOLatLng *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  id v91;
  uint64_t v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  void *v96;

  v5 = a2;
  if (!a1)
    goto LABEL_428;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_428;
  if (a3)
    v6 = CFSTR("entryType");
  else
    v6 = CFSTR("entry_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WORK")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CALENDAR_EVENT")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FREQUENT_LOCATION")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RECENT_HISTORY")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAVORITE_PLACE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PARKED_CAR")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESTAURANT_RESERVATION")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RIDESHARING")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CARPLAY_LOW_ENERGY")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RESUME_ROUTE")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("APP_CONNECTION")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("HOTEL")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CAR_RENTAL")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRAVEL_FLIGHT")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TICKETED_EVENT")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PORTRAIT")) & 1) != 0)
    {
      v9 = 17;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("USER_PLACE")))
    {
      v9 = 18;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_50;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setEntryType:", v9);
LABEL_50:

  if (a3)
    v10 = CFSTR("durationUntilEventStart");
  else
    v10 = CFSTR("duration_until_event_start");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setDurationUntilEventStart:");
  }

  if (a3)
    v12 = CFSTR("durationUntilEventEnd");
  else
    v12 = CFSTR("duration_until_event_end");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(a1, "setDurationUntilEventEnd:");
  }

  if (a3)
    v14 = CFSTR("startTime");
  else
    v14 = CFSTR("start_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(a1, "setStartTime:");
  }

  if (a3)
    v16 = CFSTR("endTime");
  else
    v16 = CFSTR("end_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "doubleValue");
    objc_msgSend(a1, "setEndTime:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("temperature"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(a1, "setTemperature:");
  }

  if (a3)
    v19 = CFSTR("chanceOfPrecipitation");
  else
    v19 = CFSTR("chance_of_precipitation");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(a1, "setChanceOfPrecipitation:");
  }

  if (a3)
    v21 = CFSTR("chanceOfRain");
  else
    v21 = CFSTR("chance_of_rain");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(a1, "setChanceOfRain:");
  }

  if (a3)
    v23 = CFSTR("chanceOfSnow");
  else
    v23 = CFSTR("chance_of_snow");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(a1, "setChanceOfSnow:");
  }

  if (a3)
    v25 = CFSTR("timeOfDay");
  else
    v25 = CFSTR("time_of_day");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(a1, "setTimeOfDay:");
  }

  if (a3)
    v27 = CFSTR("dayOfWeek");
  else
    v27 = CFSTR("day_of_week");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(a1, "setDayOfWeek:");
  }

  if (a3)
    v29 = CFSTR("isTourist");
  else
    v29 = CFSTR("is_tourist");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "doubleValue");
    objc_msgSend(a1, "setIsTourist:");
  }

  if (a3)
    v31 = CFSTR("preferredTransportMode");
  else
    v31 = CFSTR("preferred_transport_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v32;
    if ((objc_msgSend(v33, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
    {
      v34 = 0;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
    {
      v34 = 1;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
    {
      v34 = 2;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
    {
      v34 = 3;
    }
    else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
    {
      v34 = 4;
    }
    else if (objc_msgSend(v33, "isEqualToString:", CFSTR("CYCLING_MODE")))
    {
      v34 = 5;
    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_123;
    v34 = objc_msgSend(v32, "intValue");
  }
  objc_msgSend(a1, "setPreferredTransportMode:", v34);
LABEL_123:

  if (a3)
    v35 = CFSTR("mapType");
  else
    v35 = CFSTR("map_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = v36;
    if ((objc_msgSend(v37, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v38 = 0;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v38 = 1;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v38 = 2;
    }
    else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v38 = 3;
    }
    else if (objc_msgSend(v37, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
    {
      v38 = 4;
    }
    else
    {
      v38 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_142;
    v38 = objc_msgSend(v36, "intValue");
  }
  objc_msgSend(a1, "setMapType:", v38);
LABEL_142:

  if (a3)
    v39 = CFSTR("isTransitPossible");
  else
    v39 = CFSTR("is_transit_possible");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsTransitPossible:", objc_msgSend(v40, "BOOLValue"));

  if (a3)
    v41 = CFSTR("isInBasemode");
  else
    v41 = CFSTR("is_in_basemode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsInBasemode:", objc_msgSend(v42, "BOOLValue"));

  if (a3)
    v43 = CFSTR("timeSinceBackgrounded");
  else
    v43 = CFSTR("time_since_backgrounded");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v44, "doubleValue");
    objc_msgSend(a1, "setTimeSinceBackgrounded:");
  }

  if (a3)
    v45 = CFSTR("routePlanningScreenPresented");
  else
    v45 = CFSTR("route_planning_screen_presented");
  objc_msgSend(v5, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRoutePlanningScreenPresented:", objc_msgSend(v46, "BOOLValue"));

  if (a3)
    v47 = CFSTR("predictedTransportMode");
  else
    v47 = CFSTR("predicted_transport_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v48;
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
    {
      v50 = 0;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
    {
      v50 = 1;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
    {
      v50 = 2;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
    {
      v50 = 3;
    }
    else if ((objc_msgSend(v49, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
    {
      v50 = 4;
    }
    else if (objc_msgSend(v49, "isEqualToString:", CFSTR("CYCLING_MODE")))
    {
      v50 = 5;
    }
    else
    {
      v50 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_183;
    v50 = objc_msgSend(v48, "intValue");
  }
  objc_msgSend(a1, "setPredictedTransportMode:", v50);
LABEL_183:

  if (a3)
    v51 = CFSTR("actualTransportMode");
  else
    v51 = CFSTR("actual_transport_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = v52;
    if ((objc_msgSend(v53, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
    {
      v54 = 0;
    }
    else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
    {
      v54 = 1;
    }
    else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
    {
      v54 = 2;
    }
    else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
    {
      v54 = 3;
    }
    else if ((objc_msgSend(v53, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
    {
      v54 = 4;
    }
    else if (objc_msgSend(v53, "isEqualToString:", CFSTR("CYCLING_MODE")))
    {
      v54 = 5;
    }
    else
    {
      v54 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_204;
    v54 = objc_msgSend(v52, "intValue");
  }
  objc_msgSend(a1, "setActualTransportMode:", v54);
LABEL_204:

  if (a3)
    v55 = CFSTR("distanceFromHere");
  else
    v55 = CFSTR("distance_from_here");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = v56;
    if ((objc_msgSend(v57, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v58 = 0;
    }
    else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v58 = 1;
    }
    else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v58 = 2;
    }
    else if (objc_msgSend(v57, "isEqualToString:", CFSTR("FAR")))
    {
      v58 = 3;
    }
    else
    {
      v58 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_221;
    v58 = objc_msgSend(v56, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromHere:", v58);
LABEL_221:

  if (a3)
    v59 = CFSTR("distanceFromHereToOrigin");
  else
    v59 = CFSTR("distance_from_here_to_origin");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = v60;
    if ((objc_msgSend(v61, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v62 = 0;
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v62 = 1;
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v62 = 2;
    }
    else if (objc_msgSend(v61, "isEqualToString:", CFSTR("FAR")))
    {
      v62 = 3;
    }
    else
    {
      v62 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_238;
    v62 = objc_msgSend(v60, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromHereToOrigin:", v62);
LABEL_238:

  if (a3)
    v63 = CFSTR("distanceFromOriginToDestination");
  else
    v63 = CFSTR("distance_from_origin_to_destination");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = v64;
    if ((objc_msgSend(v65, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v66 = 0;
    }
    else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v66 = 1;
    }
    else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v66 = 2;
    }
    else if (objc_msgSend(v65, "isEqualToString:", CFSTR("FAR")))
    {
      v66 = 3;
    }
    else
    {
      v66 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_255;
    v66 = objc_msgSend(v64, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromOriginToDestination:", v66);
LABEL_255:

  if (a3)
    v67 = CFSTR("distanceFromHereToHome");
  else
    v67 = CFSTR("distance_from_here_to_home");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = v68;
    if ((objc_msgSend(v69, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v70 = 0;
    }
    else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v70 = 1;
    }
    else if ((objc_msgSend(v69, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v70 = 2;
    }
    else if (objc_msgSend(v69, "isEqualToString:", CFSTR("FAR")))
    {
      v70 = 3;
    }
    else
    {
      v70 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_272;
    v70 = objc_msgSend(v68, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromHereToHome:", v70);
LABEL_272:

  if (a3)
    v71 = CFSTR("distanceFromHereToWork");
  else
    v71 = CFSTR("distance_from_here_to_work");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = v72;
    if ((objc_msgSend(v73, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v74 = 0;
    }
    else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v74 = 1;
    }
    else if ((objc_msgSend(v73, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v74 = 2;
    }
    else if (objc_msgSend(v73, "isEqualToString:", CFSTR("FAR")))
    {
      v74 = 3;
    }
    else
    {
      v74 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_289;
    v74 = objc_msgSend(v72, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromHereToWork:", v74);
LABEL_289:

  if (a3)
    v75 = CFSTR("distanceFromHereToParkedCar");
  else
    v75 = CFSTR("distance_from_here_to_parked_car");
  objc_msgSend(v5, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = v76;
    if ((objc_msgSend(v77, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v78 = 0;
    }
    else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("VERY_NEAR")) & 1) != 0)
    {
      v78 = 1;
    }
    else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("WALKING_DISTANCE")) & 1) != 0)
    {
      v78 = 2;
    }
    else if (objc_msgSend(v77, "isEqualToString:", CFSTR("FAR")))
    {
      v78 = 3;
    }
    else
    {
      v78 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_306;
    v78 = objc_msgSend(v76, "intValue");
  }
  objc_msgSend(a1, "setDistanceFromHereToParkedCar:", v78);
LABEL_306:

  if (a3)
    v79 = CFSTR("userLocation");
  else
    v79 = CFSTR("user_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v82 = -[GEOLatLng initWithJSON:](v81, "initWithJSON:", v80);
    else
      v82 = -[GEOLatLng initWithDictionary:](v81, "initWithDictionary:", v80);
    v83 = (void *)v82;
    objc_msgSend(a1, "setUserLocation:", v82);

  }
  if (a3)
    v84 = CFSTR("userLocationGeohash4");
  else
    v84 = CFSTR("user_location_geohash4");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = (void *)objc_msgSend(v85, "copy");
    objc_msgSend(a1, "setUserLocationGeohash4:", v86);

  }
  if (a3)
    v87 = CFSTR("isCarplayConnected");
  else
    v87 = CFSTR("is_carplay_connected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCarplayConnected:", objc_msgSend(v88, "BOOLValue"));

  if (a3)
    v89 = CFSTR("weatherType");
  else
    v89 = CFSTR("weather_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = v90;
    if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_NOT_AVAILABLE")) & 1) != 0)
    {
      v92 = 0;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_TORNADO")) & 1) != 0)
    {
      v92 = 1;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_TROPICAL_STORM")) & 1) != 0)
    {
      v92 = 2;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HURRICANE")) & 1) != 0)
    {
      v92 = 3;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SEVERE_THUNDERSTORMS")) & 1) != 0)
    {
      v92 = 4;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_THUNDERSTORMS")) & 1) != 0)
    {
      v92 = 5;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SNOW")) & 1) != 0)
    {
      v92 = 6;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SLEET")) & 1) != 0)
    {
      v92 = 7;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_SNOW_AND_SLEET")) & 1) != 0)
    {
      v92 = 8;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FREEZING_DRIZZLE")) & 1) != 0)
    {
      v92 = 9;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_DRIZZLE")) & 1) != 0)
    {
      v92 = 10;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FREEZING_RAIN")) & 1) != 0)
    {
      v92 = 11;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SHOWERS")) & 1) != 0)
    {
      v92 = 12;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_RAIN")) & 1) != 0)
    {
      v92 = 13;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SNOW_FLURRIES")) & 1) != 0)
    {
      v92 = 14;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_LIGHT_SNOW_SHOWERS")) & 1) != 0)
    {
      v92 = 15;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLOWING_SNOW")) & 1) != 0)
    {
      v92 = 16;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SNOW")) & 1) != 0)
    {
      v92 = 17;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HAIL")) & 1) != 0)
    {
      v92 = 18;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SLEET")) & 1) != 0)
    {
      v92 = 19;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_DUST")) & 1) != 0)
    {
      v92 = 20;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_FOGGY")) & 1) != 0)
    {
      v92 = 21;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HAZE")) & 1) != 0)
    {
      v92 = 22;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SMOKY")) & 1) != 0)
    {
      v92 = 23;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLUSTERY")) & 1) != 0)
    {
      v92 = 24;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_WINDY")) & 1) != 0)
    {
      v92 = 25;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_COLD")) & 1) != 0)
    {
      v92 = 26;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_CLOUDY")) & 1) != 0)
    {
      v92 = 27;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLOUDY")) & 1) != 0)
    {
      v92 = 29;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_PARTLY_CLOUDY")) & 1) != 0)
    {
      v92 = 31;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_CLEAR")) & 1) != 0)
    {
      v92 = 33;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLEAR")) & 1) != 0)
    {
      v92 = 35;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_HAIL")) & 1) != 0)
    {
      v92 = 36;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HOT")) & 1) != 0)
    {
      v92 = 37;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSTORMS")) & 1) != 0)
    {
      v92 = 38;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_THUNDERSTORMS")) & 1) != 0)
    {
      v92 = 39;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_SHOWERS")) & 1) != 0)
    {
      v92 = 40;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HEAVY_RAIN")) & 1) != 0)
    {
      v92 = 41;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_SCATTERED_SNOW_SHOWERS")) & 1) != 0)
    {
      v92 = 42;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_HEAVY_SNOW")) & 1) != 0)
    {
      v92 = 43;
    }
    else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_BLIZZARD")) & 1) != 0)
    {
      v92 = 44;
    }
    else if (objc_msgSend(v91, "isEqualToString:", CFSTR("MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSHOWERS")))
    {
      v92 = 45;
    }
    else
    {
      v92 = 0;
    }

    goto LABEL_416;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = objc_msgSend(v90, "intValue");
LABEL_416:
    objc_msgSend(a1, "setWeatherType:", v92);
  }

  if (a3)
    v93 = CFSTR("weatherAqi");
  else
    v93 = CFSTR("weather_aqi");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWeatherAqi:", objc_msgSend(v94, "unsignedIntValue"));

  if (a3)
    v95 = CFSTR("isVehicleBluetoothConnected");
  else
    v95 = CFSTR("is_vehicle_bluetooth_connected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsVehicleBluetoothConnected:", objc_msgSend(v96, "BOOLValue"));

  a1 = a1;
LABEL_428:

  return a1;
}

- (GEOLogMsgEventPredExTrainingData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPredExTrainingData *)-[GEOLogMsgEventPredExTrainingData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_3733;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3734;
    GEOLogMsgEventPredExTrainingDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOLatLng readAll:](self->_userLocation, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPredExTrainingDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPredExTrainingDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $A2888D52E07BB247939D0F55CC592477 flags;
  $A2888D52E07BB247939D0F55CC592477 v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_QWORD *)&self->_flags & 0x1C0000000) == 0)
    {
      v7 = self->_reader;
      objc_sync_enter(v7);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "writeData:", v8);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_70;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventPredExTrainingData readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_41;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_16;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_17;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&flags & 0x8000000) == 0)
      goto LABEL_18;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x8000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x4000000) == 0)
      goto LABEL_19;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&flags & 0x20000000) == 0)
      goto LABEL_21;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_26;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
LABEL_29:
    PBDataWriterWriteInt32Field();
LABEL_30:
  if (self->_userLocation)
    PBDataWriterWriteSubmessage();
  if (self->_userLocationGeohash4)
    PBDataWriterWriteStringField();
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v6 & 0x800000) == 0)
        goto LABEL_37;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_70;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  if ((*(_QWORD *)&self->_flags & 0x10000000) != 0)
LABEL_68:
    PBDataWriterWriteBOOLField();
LABEL_70:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgEventPredExTrainingData _readUserLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_userLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  $A2888D52E07BB247939D0F55CC592477 flags;
  $A2888D52E07BB247939D0F55CC592477 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOLogMsgEventPredExTrainingData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 32) = self->_readerMarkPos;
  *((_DWORD *)v7 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    *((_DWORD *)v7 + 42) = self->_entryType;
    v7[25] = (id)((unint64_t)v7[25] | 0x80000);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v7[7] = *(id *)&self->_durationUntilEventStart;
  v7[25] = (id)((unint64_t)v7[25] | 0x20);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  v7[6] = *(id *)&self->_durationUntilEventEnd;
  v7[25] = (id)((unint64_t)v7[25] | 0x10);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  v7[10] = *(id *)&self->_startTime;
  v7[25] = (id)((unint64_t)v7[25] | 0x100);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  v7[8] = *(id *)&self->_endTime;
  v7[25] = (id)((unint64_t)v7[25] | 0x40);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  v7[11] = *(id *)&self->_temperature;
  v7[25] = (id)((unint64_t)v7[25] | 0x200);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  v7[2] = *(id *)&self->_chanceOfPrecipitation;
  v7[25] = (id)((unint64_t)v7[25] | 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  v7[3] = *(id *)&self->_chanceOfRain;
  v7[25] = (id)((unint64_t)v7[25] | 2);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  v7[4] = *(id *)&self->_chanceOfSnow;
  v7[25] = (id)((unint64_t)v7[25] | 4);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  v7[12] = *(id *)&self->_timeOfDay;
  v7[25] = (id)((unint64_t)v7[25] | 0x400);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  v7[5] = *(id *)&self->_dayOfWeek;
  v7[25] = (id)((unint64_t)v7[25] | 8);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  v7[9] = *(id *)&self->_isTourist;
  v7[25] = (id)((unint64_t)v7[25] | 0x80);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v7 + 45) = self->_preferredTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x400000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v7 + 43) = self->_mapType;
  v7[25] = (id)((unint64_t)v7[25] | 0x100000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&flags & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  *((_BYTE *)v7 + 194) = self->_isTransitPossible;
  v7[25] = (id)((unint64_t)v7[25] | 0x8000000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)v7 + 193) = self->_isInBasemode;
  v7[25] = (id)((unint64_t)v7[25] | 0x4000000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000000) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  v7[13] = *(id *)&self->_timeSinceBackgrounded;
  v7[25] = (id)((unint64_t)v7[25] | 0x800);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v7 + 196) = self->_routePlanningScreenPresented;
  v7[25] = (id)((unint64_t)v7[25] | 0x20000000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&flags & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v7 + 44) = self->_predictedTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x200000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v7 + 35) = self->_actualTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x1000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&flags & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v7 + 40) = self->_distanceFromHere;
  v7[25] = (id)((unint64_t)v7[25] | 0x20000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v7 + 37) = self->_distanceFromHereToOrigin;
  v7[25] = (id)((unint64_t)v7[25] | 0x4000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&flags & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v7 + 41) = self->_distanceFromOriginToDestination;
  v7[25] = (id)((unint64_t)v7[25] | 0x40000);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v7 + 36) = self->_distanceFromHereToHome;
  v7[25] = (id)((unint64_t)v7[25] | 0x2000);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&flags & 0x8000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_62:
  *((_DWORD *)v7 + 39) = self->_distanceFromHereToWork;
  v7[25] = (id)((unint64_t)v7[25] | 0x10000);
  if ((*(_QWORD *)&self->_flags & 0x8000) != 0)
  {
LABEL_27:
    *((_DWORD *)v7 + 38) = self->_distanceFromHereToParkedCar;
    v7[25] = (id)((unint64_t)v7[25] | 0x8000);
  }
LABEL_28:
  if (self->_userLocation)
  {
    objc_msgSend(v7, "setUserLocation:");
    v4 = v7;
  }
  if (self->_userLocationGeohash4)
  {
    objc_msgSend(v7, "setUserLocationGeohash4:");
    v4 = v7;
  }
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((_BYTE *)v4 + 192) = self->_isCarplayConnected;
    v4[25] = (id)((unint64_t)v4[25] | 0x2000000);
    v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v6 & 0x800000) == 0)
        goto LABEL_35;
LABEL_66:
      *((_DWORD *)v4 + 46) = self->_weatherAqi;
      v4[25] = (id)((unint64_t)v4[25] | 0x800000);
      if ((*(_QWORD *)&self->_flags & 0x10000000) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_34;
  }
  *((_DWORD *)v4 + 47) = self->_weatherType;
  v4[25] = (id)((unint64_t)v4[25] | 0x1000000);
  v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
    goto LABEL_66;
LABEL_35:
  if ((*(_DWORD *)&v6 & 0x10000000) != 0)
  {
LABEL_36:
    *((_BYTE *)v4 + 195) = self->_isVehicleBluetoothConnected;
    v4[25] = (id)((unint64_t)v4[25] | 0x10000000);
  }
LABEL_37:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $A2888D52E07BB247939D0F55CC592477 flags;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $A2888D52E07BB247939D0F55CC592477 v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventPredExTrainingData readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x80000) != 0)
    {
      *(_DWORD *)(v5 + 168) = self->_entryType;
      *(_QWORD *)(v5 + 200) |= 0x80000uLL;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x20) == 0)
      {
LABEL_7:
        if ((*(_BYTE *)&flags & 0x10) == 0)
          goto LABEL_8;
        goto LABEL_40;
      }
    }
    else if ((*(_BYTE *)&flags & 0x20) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 56) = self->_durationUntilEventStart;
    *(_QWORD *)(v5 + 200) |= 0x20uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_9;
      goto LABEL_41;
    }
LABEL_40:
    *(double *)(v5 + 48) = self->_durationUntilEventEnd;
    *(_QWORD *)(v5 + 200) |= 0x10uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_42;
    }
LABEL_41:
    *(double *)(v5 + 80) = self->_startTime;
    *(_QWORD *)(v5 + 200) |= 0x100uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_11;
      goto LABEL_43;
    }
LABEL_42:
    *(double *)(v5 + 64) = self->_endTime;
    *(_QWORD *)(v5 + 200) |= 0x40uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_12;
      goto LABEL_44;
    }
LABEL_43:
    *(double *)(v5 + 88) = self->_temperature;
    *(_QWORD *)(v5 + 200) |= 0x200uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&flags & 2) == 0)
        goto LABEL_13;
      goto LABEL_45;
    }
LABEL_44:
    *(double *)(v5 + 16) = self->_chanceOfPrecipitation;
    *(_QWORD *)(v5 + 200) |= 1uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_14;
      goto LABEL_46;
    }
LABEL_45:
    *(double *)(v5 + 24) = self->_chanceOfRain;
    *(_QWORD *)(v5 + 200) |= 2uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&flags & 0x400) == 0)
        goto LABEL_15;
      goto LABEL_47;
    }
LABEL_46:
    *(double *)(v5 + 32) = self->_chanceOfSnow;
    *(_QWORD *)(v5 + 200) |= 4uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_16;
      goto LABEL_48;
    }
LABEL_47:
    *(double *)(v5 + 96) = self->_timeOfDay;
    *(_QWORD *)(v5 + 200) |= 0x400uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_17;
      goto LABEL_49;
    }
LABEL_48:
    *(double *)(v5 + 40) = self->_dayOfWeek;
    *(_QWORD *)(v5 + 200) |= 8uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&flags & 0x400000) == 0)
        goto LABEL_18;
      goto LABEL_50;
    }
LABEL_49:
    *(double *)(v5 + 72) = self->_isTourist;
    *(_QWORD *)(v5 + 200) |= 0x80uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x400000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&flags & 0x100000) == 0)
        goto LABEL_19;
      goto LABEL_51;
    }
LABEL_50:
    *(_DWORD *)(v5 + 180) = self->_preferredTransportMode;
    *(_QWORD *)(v5 + 200) |= 0x400000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x100000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&flags & 0x8000000) == 0)
        goto LABEL_20;
      goto LABEL_52;
    }
LABEL_51:
    *(_DWORD *)(v5 + 172) = self->_mapType;
    *(_QWORD *)(v5 + 200) |= 0x100000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x8000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&flags & 0x4000000) == 0)
        goto LABEL_21;
      goto LABEL_53;
    }
LABEL_52:
    *(_BYTE *)(v5 + 194) = self->_isTransitPossible;
    *(_QWORD *)(v5 + 200) |= 0x8000000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x4000000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&flags & 0x800) == 0)
        goto LABEL_22;
      goto LABEL_54;
    }
LABEL_53:
    *(_BYTE *)(v5 + 193) = self->_isInBasemode;
    *(_QWORD *)(v5 + 200) |= 0x4000000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&flags & 0x20000000) == 0)
        goto LABEL_23;
      goto LABEL_55;
    }
LABEL_54:
    *(double *)(v5 + 104) = self->_timeSinceBackgrounded;
    *(_QWORD *)(v5 + 200) |= 0x800uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&flags & 0x200000) == 0)
        goto LABEL_24;
      goto LABEL_56;
    }
LABEL_55:
    *(_BYTE *)(v5 + 196) = self->_routePlanningScreenPresented;
    *(_QWORD *)(v5 + 200) |= 0x20000000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x200000) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&flags & 0x1000) == 0)
        goto LABEL_25;
      goto LABEL_57;
    }
LABEL_56:
    *(_DWORD *)(v5 + 176) = self->_predictedTransportMode;
    *(_QWORD *)(v5 + 200) |= 0x200000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&flags & 0x20000) == 0)
        goto LABEL_26;
      goto LABEL_58;
    }
LABEL_57:
    *(_DWORD *)(v5 + 140) = self->_actualTransportMode;
    *(_QWORD *)(v5 + 200) |= 0x1000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&flags & 0x4000) == 0)
        goto LABEL_27;
      goto LABEL_59;
    }
LABEL_58:
    *(_DWORD *)(v5 + 160) = self->_distanceFromHere;
    *(_QWORD *)(v5 + 200) |= 0x20000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&flags & 0x40000) == 0)
        goto LABEL_28;
      goto LABEL_60;
    }
LABEL_59:
    *(_DWORD *)(v5 + 148) = self->_distanceFromHereToOrigin;
    *(_QWORD *)(v5 + 200) |= 0x4000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&flags & 0x2000) == 0)
        goto LABEL_29;
      goto LABEL_61;
    }
LABEL_60:
    *(_DWORD *)(v5 + 164) = self->_distanceFromOriginToDestination;
    *(_QWORD *)(v5 + 200) |= 0x40000uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x2000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&flags & 0x10000) == 0)
        goto LABEL_30;
      goto LABEL_62;
    }
LABEL_61:
    *(_DWORD *)(v5 + 144) = self->_distanceFromHereToHome;
    *(_QWORD *)(v5 + 200) |= 0x2000uLL;
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x10000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&flags & 0x8000) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
LABEL_62:
    *(_DWORD *)(v5 + 156) = self->_distanceFromHereToWork;
    *(_QWORD *)(v5 + 200) |= 0x10000uLL;
    if ((*(_QWORD *)&self->_flags & 0x8000) == 0)
    {
LABEL_32:
      v10 = -[GEOLatLng copyWithZone:](self->_userLocation, "copyWithZone:", a3);
      v11 = *(void **)(v5 + 120);
      *(_QWORD *)(v5 + 120) = v10;

      v12 = -[NSString copyWithZone:](self->_userLocationGeohash4, "copyWithZone:", a3);
      v13 = *(void **)(v5 + 112);
      *(_QWORD *)(v5 + 112) = v12;

      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x2000000) != 0)
      {
        *(_BYTE *)(v5 + 192) = self->_isCarplayConnected;
        *(_QWORD *)(v5 + 200) |= 0x2000000uLL;
        v14 = self->_flags;
        if ((*(_DWORD *)&v14 & 0x1000000) == 0)
        {
LABEL_34:
          if ((*(_DWORD *)&v14 & 0x800000) == 0)
            goto LABEL_35;
          goto LABEL_66;
        }
      }
      else if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      {
        goto LABEL_34;
      }
      *(_DWORD *)(v5 + 188) = self->_weatherType;
      *(_QWORD *)(v5 + 200) |= 0x1000000uLL;
      v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x800000) == 0)
      {
LABEL_35:
        if ((*(_DWORD *)&v14 & 0x10000000) == 0)
          return (id)v5;
LABEL_36:
        *(_BYTE *)(v5 + 195) = self->_isVehicleBluetoothConnected;
        *(_QWORD *)(v5 + 200) |= 0x10000000uLL;
        return (id)v5;
      }
LABEL_66:
      *(_DWORD *)(v5 + 184) = self->_weatherAqi;
      *(_QWORD *)(v5 + 200) |= 0x800000uLL;
      if ((*(_QWORD *)&self->_flags & 0x10000000) == 0)
        return (id)v5;
      goto LABEL_36;
    }
LABEL_31:
    *(_DWORD *)(v5 + 152) = self->_distanceFromHereToParkedCar;
    *(_QWORD *)(v5 + 200) |= 0x8000uLL;
    goto LABEL_32;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 4) & 1) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventPredExTrainingDataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $A2888D52E07BB247939D0F55CC592477 flags;
  uint64_t v6;
  GEOLatLng *userLocation;
  NSString *userLocationGeohash4;
  $A2888D52E07BB247939D0F55CC592477 v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_166;
  -[GEOLogMsgEventPredExTrainingData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_QWORD *)v4 + 25);
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_entryType != *((_DWORD *)v4 + 42))
      goto LABEL_166;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durationUntilEventStart != *((double *)v4 + 7))
      goto LABEL_166;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_durationUntilEventEnd != *((double *)v4 + 6))
      goto LABEL_166;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_startTime != *((double *)v4 + 10))
      goto LABEL_166;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_endTime != *((double *)v4 + 8))
      goto LABEL_166;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_temperature != *((double *)v4 + 11))
      goto LABEL_166;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_chanceOfPrecipitation != *((double *)v4 + 2))
      goto LABEL_166;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_chanceOfRain != *((double *)v4 + 3))
      goto LABEL_166;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_chanceOfSnow != *((double *)v4 + 4))
      goto LABEL_166;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_timeOfDay != *((double *)v4 + 12))
      goto LABEL_166;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dayOfWeek != *((double *)v4 + 5))
      goto LABEL_166;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_isTourist != *((double *)v4 + 9))
      goto LABEL_166;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_preferredTransportMode != *((_DWORD *)v4 + 45))
      goto LABEL_166;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_mapType != *((_DWORD *)v4 + 43))
      goto LABEL_166;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0)
      goto LABEL_166;
    if (self->_isTransitPossible)
    {
      if (!*((_BYTE *)v4 + 194))
        goto LABEL_166;
    }
    else if (*((_BYTE *)v4 + 194))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0)
      goto LABEL_166;
    if (self->_isInBasemode)
    {
      if (!*((_BYTE *)v4 + 193))
        goto LABEL_166;
    }
    else if (*((_BYTE *)v4 + 193))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_timeSinceBackgrounded != *((double *)v4 + 13))
      goto LABEL_166;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0)
      goto LABEL_166;
    if (self->_routePlanningScreenPresented)
    {
      if (!*((_BYTE *)v4 + 196))
        goto LABEL_166;
    }
    else if (*((_BYTE *)v4 + 196))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_predictedTransportMode != *((_DWORD *)v4 + 44))
      goto LABEL_166;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_actualTransportMode != *((_DWORD *)v4 + 35))
      goto LABEL_166;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_distanceFromHere != *((_DWORD *)v4 + 40))
      goto LABEL_166;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_distanceFromHereToOrigin != *((_DWORD *)v4 + 37))
      goto LABEL_166;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_distanceFromOriginToDestination != *((_DWORD *)v4 + 41))
      goto LABEL_166;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_distanceFromHereToHome != *((_DWORD *)v4 + 36))
      goto LABEL_166;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_distanceFromHereToWork != *((_DWORD *)v4 + 39))
      goto LABEL_166;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_distanceFromHereToParkedCar != *((_DWORD *)v4 + 38))
      goto LABEL_166;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_166;
  }
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((_QWORD *)v4 + 15) && !-[GEOLatLng isEqual:](userLocation, "isEqual:"))
    goto LABEL_166;
  userLocationGeohash4 = self->_userLocationGeohash4;
  if ((unint64_t)userLocationGeohash4 | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](userLocationGeohash4, "isEqual:"))
      goto LABEL_166;
  }
  v9 = self->_flags;
  v10 = *((_QWORD *)v4 + 25);
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0)
      goto LABEL_166;
    if (self->_isCarplayConnected)
    {
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_166;
    }
    else if (*((_BYTE *)v4 + 192))
    {
      goto LABEL_166;
    }
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_weatherType != *((_DWORD *)v4 + 47))
      goto LABEL_166;
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_weatherAqi != *((_DWORD *)v4 + 46))
      goto LABEL_166;
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) != 0)
    {
      if (self->_isVehicleBluetoothConnected)
      {
        if (!*((_BYTE *)v4 + 195))
          goto LABEL_166;
      }
      else if (*((_BYTE *)v4 + 195))
      {
        goto LABEL_166;
      }
      v11 = 1;
      goto LABEL_167;
    }
LABEL_166:
    v11 = 0;
    goto LABEL_167;
  }
  v11 = (*((_QWORD *)v4 + 25) & 0x10000000) == 0;
LABEL_167:

  return v11;
}

- (unint64_t)hash
{
  $A2888D52E07BB247939D0F55CC592477 flags;
  double durationUntilEventStart;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double durationUntilEventEnd;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double startTime;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double endTime;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double temperature;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double chanceOfPrecipitation;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double chanceOfRain;
  double v36;
  long double v37;
  double v38;
  double chanceOfSnow;
  double v40;
  long double v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  double timeOfDay;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  unint64_t v50;
  double dayOfWeek;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  double isTourist;
  double v59;
  long double v60;
  double v61;
  double timeSinceBackgrounded;
  double v63;
  long double v64;
  double v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  NSUInteger v69;
  $A2888D52E07BB247939D0F55CC592477 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;

  -[GEOLogMsgEventPredExTrainingData readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    v92 = 2654435761 * self->_entryType;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v92 = 0;
  if ((*(_BYTE *)&flags & 0x20) == 0)
    goto LABEL_8;
LABEL_3:
  durationUntilEventStart = self->_durationUntilEventStart;
  v5 = -durationUntilEventStart;
  if (durationUntilEventStart >= 0.0)
    v5 = self->_durationUntilEventStart;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    durationUntilEventEnd = self->_durationUntilEventEnd;
    v11 = -durationUntilEventEnd;
    if (durationUntilEventEnd >= 0.0)
      v11 = self->_durationUntilEventEnd;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    startTime = self->_startTime;
    v16 = -startTime;
    if (startTime >= 0.0)
      v16 = self->_startTime;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    endTime = self->_endTime;
    v21 = -endTime;
    if (endTime >= 0.0)
      v21 = self->_endTime;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    temperature = self->_temperature;
    v26 = -temperature;
    if (temperature >= 0.0)
      v26 = self->_temperature;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    chanceOfPrecipitation = self->_chanceOfPrecipitation;
    v31 = -chanceOfPrecipitation;
    if (chanceOfPrecipitation >= 0.0)
      v31 = self->_chanceOfPrecipitation;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  v85 = v9;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    chanceOfRain = self->_chanceOfRain;
    v36 = -chanceOfRain;
    if (chanceOfRain >= 0.0)
      v36 = self->_chanceOfRain;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((*(_BYTE *)&flags & 4) == 0)
  {
    v95 = 0;
    goto LABEL_68;
  }
  chanceOfSnow = self->_chanceOfSnow;
  v40 = -chanceOfSnow;
  if (chanceOfSnow >= 0.0)
    v40 = self->_chanceOfSnow;
  v41 = floor(v40 + 0.5);
  v42 = (v40 - v41) * 1.84467441e19;
  v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    v95 = v43;
    if (v42 <= 0.0)
      goto LABEL_68;
    v44 = v43 + (unint64_t)v42;
  }
  else
  {
    v44 = v43 - (unint64_t)fabs(v42);
  }
  v95 = v44;
LABEL_68:
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
    v94 = 0;
    goto LABEL_77;
  }
  timeOfDay = self->_timeOfDay;
  v46 = -timeOfDay;
  if (timeOfDay >= 0.0)
    v46 = self->_timeOfDay;
  v47 = floor(v46 + 0.5);
  v48 = (v46 - v47) * 1.84467441e19;
  v49 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    v94 = v49;
    if (v48 <= 0.0)
      goto LABEL_77;
    v50 = v49 + (unint64_t)v48;
  }
  else
  {
    v50 = v49 - (unint64_t)fabs(v48);
  }
  v94 = v50;
LABEL_77:
  if ((*(_BYTE *)&flags & 8) == 0)
  {
    v93 = 0;
    goto LABEL_86;
  }
  dayOfWeek = self->_dayOfWeek;
  v52 = -dayOfWeek;
  if (dayOfWeek >= 0.0)
    v52 = self->_dayOfWeek;
  v53 = floor(v52 + 0.5);
  v54 = (v52 - v53) * 1.84467441e19;
  v55 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
  if (v54 >= 0.0)
  {
    v93 = v55;
    if (v54 <= 0.0)
      goto LABEL_86;
    v56 = v55 + (unint64_t)v54;
  }
  else
  {
    v56 = v55 - (unint64_t)fabs(v54);
  }
  v93 = v56;
LABEL_86:
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    isTourist = self->_isTourist;
    v59 = -isTourist;
    if (isTourist >= 0.0)
      v59 = self->_isTourist;
    v60 = floor(v59 + 0.5);
    v61 = (v59 - v60) * 1.84467441e19;
    v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  v91 = v57;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    v90 = 2654435761 * self->_preferredTransportMode;
    if ((*(_DWORD *)&flags & 0x100000) != 0)
    {
LABEL_96:
      v89 = 2654435761 * self->_mapType;
      if ((*(_DWORD *)&flags & 0x8000000) != 0)
        goto LABEL_97;
      goto LABEL_105;
    }
  }
  else
  {
    v90 = 0;
    if ((*(_DWORD *)&flags & 0x100000) != 0)
      goto LABEL_96;
  }
  v89 = 0;
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
LABEL_97:
    v88 = 2654435761 * self->_isTransitPossible;
    if ((*(_DWORD *)&flags & 0x4000000) != 0)
      goto LABEL_98;
LABEL_106:
    v87 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_99;
LABEL_107:
    v66 = 0;
    goto LABEL_110;
  }
LABEL_105:
  v88 = 0;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
    goto LABEL_106;
LABEL_98:
  v87 = 2654435761 * self->_isInBasemode;
  if ((*(_WORD *)&flags & 0x800) == 0)
    goto LABEL_107;
LABEL_99:
  timeSinceBackgrounded = self->_timeSinceBackgrounded;
  v63 = -timeSinceBackgrounded;
  if (timeSinceBackgrounded >= 0.0)
    v63 = self->_timeSinceBackgrounded;
  v64 = floor(v63 + 0.5);
  v65 = (v63 - v64) * 1.84467441e19;
  v66 = 2654435761u * (unint64_t)fmod(v64, 1.84467441e19);
  if (v65 >= 0.0)
  {
    if (v65 > 0.0)
      v66 += (unint64_t)v65;
  }
  else
  {
    v66 -= (unint64_t)fabs(v65);
  }
LABEL_110:
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    v84 = 2654435761 * self->_routePlanningScreenPresented;
    if ((*(_DWORD *)&flags & 0x200000) != 0)
    {
LABEL_112:
      v83 = 2654435761 * self->_predictedTransportMode;
      if ((*(_WORD *)&flags & 0x1000) != 0)
        goto LABEL_113;
      goto LABEL_119;
    }
  }
  else
  {
    v84 = 0;
    if ((*(_DWORD *)&flags & 0x200000) != 0)
      goto LABEL_112;
  }
  v83 = 0;
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
LABEL_113:
    v82 = 2654435761 * self->_actualTransportMode;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
      goto LABEL_114;
    goto LABEL_120;
  }
LABEL_119:
  v82 = 0;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_114:
    v81 = 2654435761 * self->_distanceFromHere;
    if ((*(_WORD *)&flags & 0x4000) != 0)
      goto LABEL_115;
LABEL_121:
    v80 = 0;
    if ((*(_DWORD *)&flags & 0x40000) != 0)
      goto LABEL_116;
    goto LABEL_122;
  }
LABEL_120:
  v81 = 0;
  if ((*(_WORD *)&flags & 0x4000) == 0)
    goto LABEL_121;
LABEL_115:
  v80 = 2654435761 * self->_distanceFromHereToOrigin;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
LABEL_116:
    v79 = 2654435761 * self->_distanceFromOriginToDestination;
    goto LABEL_123;
  }
LABEL_122:
  v79 = 0;
LABEL_123:
  if ((*(_WORD *)&flags & 0x2000) != 0)
    v78 = 2654435761 * self->_distanceFromHereToHome;
  else
    v78 = 0;
  v86 = v29;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
    v76 = 2654435761 * self->_distanceFromHereToWork;
  else
    v76 = 0;
  if ((*(_WORD *)&flags & 0x8000) != 0)
    v67 = 2654435761 * self->_distanceFromHereToParkedCar;
  else
    v67 = 0;
  v68 = -[GEOLatLng hash](self->_userLocation, "hash", v76);
  v69 = -[NSString hash](self->_userLocationGeohash4, "hash");
  v70 = self->_flags;
  if ((*(_DWORD *)&v70 & 0x2000000) != 0)
    v71 = 2654435761 * self->_isCarplayConnected;
  else
    v71 = 0;
  if ((*(_DWORD *)&v70 & 0x1000000) == 0)
  {
    v72 = 0;
    if ((*(_DWORD *)&v70 & 0x800000) != 0)
      goto LABEL_137;
LABEL_140:
    v73 = 0;
    if ((*(_DWORD *)&v70 & 0x10000000) != 0)
      goto LABEL_138;
LABEL_141:
    v74 = 0;
    return v8 ^ v92 ^ v85 ^ v14 ^ v19 ^ v24 ^ v86 ^ v34 ^ v95 ^ v94 ^ v93 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v66 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v67 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74;
  }
  v72 = 2654435761 * self->_weatherType;
  if ((*(_DWORD *)&v70 & 0x800000) == 0)
    goto LABEL_140;
LABEL_137:
  v73 = 2654435761 * self->_weatherAqi;
  if ((*(_DWORD *)&v70 & 0x10000000) == 0)
    goto LABEL_141;
LABEL_138:
  v74 = 2654435761 * self->_isVehicleBluetoothConnected;
  return v8 ^ v92 ^ v85 ^ v14 ^ v19 ^ v24 ^ v86 ^ v34 ^ v95 ^ v94 ^ v93 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v66 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v67 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  GEOLatLng *userLocation;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x80000) != 0)
  {
    self->_entryType = *((_DWORD *)v9 + 42);
    *(_QWORD *)&self->_flags |= 0x80000uLL;
    v5 = *((_QWORD *)v9 + 25);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_durationUntilEventStart = *((double *)v9 + 7);
  *(_QWORD *)&self->_flags |= 0x20uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  self->_durationUntilEventEnd = *((double *)v9 + 6);
  *(_QWORD *)&self->_flags |= 0x10uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  self->_startTime = *((double *)v9 + 10);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  self->_endTime = *((double *)v9 + 8);
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  self->_temperature = *((double *)v9 + 11);
  *(_QWORD *)&self->_flags |= 0x200uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  self->_chanceOfPrecipitation = *((double *)v9 + 2);
  *(_QWORD *)&self->_flags |= 1uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  self->_chanceOfRain = *((double *)v9 + 3);
  *(_QWORD *)&self->_flags |= 2uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  self->_chanceOfSnow = *((double *)v9 + 4);
  *(_QWORD *)&self->_flags |= 4uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  self->_timeOfDay = *((double *)v9 + 12);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  self->_dayOfWeek = *((double *)v9 + 5);
  *(_QWORD *)&self->_flags |= 8uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  self->_isTourist = *((double *)v9 + 9);
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x400000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  self->_preferredTransportMode = *((_DWORD *)v9 + 45);
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x100000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_mapType = *((_DWORD *)v9 + 43);
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000000) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_isTransitPossible = *((_BYTE *)v9 + 194);
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x800) == 0)
      goto LABEL_18;
    goto LABEL_47;
  }
LABEL_46:
  self->_isInBasemode = *((_BYTE *)v9 + 193);
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x800) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000000) == 0)
      goto LABEL_19;
    goto LABEL_48;
  }
LABEL_47:
  self->_timeSinceBackgrounded = *((double *)v9 + 13);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x200000) == 0)
      goto LABEL_20;
    goto LABEL_49;
  }
LABEL_48:
  self->_routePlanningScreenPresented = *((_BYTE *)v9 + 196);
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x200000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000) == 0)
      goto LABEL_21;
    goto LABEL_50;
  }
LABEL_49:
  self->_predictedTransportMode = *((_DWORD *)v9 + 44);
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((v5 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_51;
  }
LABEL_50:
  self->_actualTransportMode = *((_DWORD *)v9 + 35);
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x20000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000) == 0)
      goto LABEL_23;
    goto LABEL_52;
  }
LABEL_51:
  self->_distanceFromHere = *((_DWORD *)v9 + 40);
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((v5 & 0x40000) == 0)
      goto LABEL_24;
    goto LABEL_53;
  }
LABEL_52:
  self->_distanceFromHereToOrigin = *((_DWORD *)v9 + 37);
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x40000) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000) == 0)
      goto LABEL_25;
    goto LABEL_54;
  }
LABEL_53:
  self->_distanceFromOriginToDestination = *((_DWORD *)v9 + 41);
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x2000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_55;
  }
LABEL_54:
  self->_distanceFromHereToHome = *((_DWORD *)v9 + 36);
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  v5 = *((_QWORD *)v9 + 25);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_55:
  self->_distanceFromHereToWork = *((_DWORD *)v9 + 39);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  if ((*((_QWORD *)v9 + 25) & 0x8000) != 0)
  {
LABEL_27:
    self->_distanceFromHereToParkedCar = *((_DWORD *)v9 + 38);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }
LABEL_28:
  userLocation = self->_userLocation;
  v7 = *((_QWORD *)v9 + 15);
  if (userLocation)
  {
    if (!v7)
      goto LABEL_60;
    -[GEOLatLng mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_60;
    -[GEOLogMsgEventPredExTrainingData setUserLocation:](self, "setUserLocation:");
  }
  v4 = v9;
LABEL_60:
  if (*((_QWORD *)v4 + 14))
  {
    -[GEOLogMsgEventPredExTrainingData setUserLocationGeohash4:](self, "setUserLocationGeohash4:");
    v4 = v9;
  }
  v8 = *((_QWORD *)v4 + 25);
  if ((v8 & 0x2000000) != 0)
  {
    self->_isCarplayConnected = *((_BYTE *)v4 + 192);
    *(_QWORD *)&self->_flags |= 0x2000000uLL;
    v8 = *((_QWORD *)v4 + 25);
    if ((v8 & 0x1000000) == 0)
    {
LABEL_64:
      if ((v8 & 0x800000) == 0)
        goto LABEL_65;
LABEL_70:
      self->_weatherAqi = *((_DWORD *)v4 + 46);
      *(_QWORD *)&self->_flags |= 0x800000uLL;
      if ((*((_QWORD *)v4 + 25) & 0x10000000) == 0)
        goto LABEL_67;
      goto LABEL_66;
    }
  }
  else if ((v8 & 0x1000000) == 0)
  {
    goto LABEL_64;
  }
  self->_weatherType = *((_DWORD *)v4 + 47);
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  v8 = *((_QWORD *)v4 + 25);
  if ((v8 & 0x800000) != 0)
    goto LABEL_70;
LABEL_65:
  if ((v8 & 0x10000000) != 0)
  {
LABEL_66:
    self->_isVehicleBluetoothConnected = *((_BYTE *)v4 + 195);
    *(_QWORD *)&self->_flags |= 0x10000000uLL;
  }
LABEL_67:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_userLocationGeohash4, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
