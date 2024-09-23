@implementation AWDProactiveAppPredictionSession

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCoreMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_coreMotionLaunches = a3;
}

- (void)setHasCoreMotionLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCoreMotionLaunches
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTotalAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalAirplaneModeLaunches = a3;
}

- (void)setHasTotalAirplaneModeLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalAirplaneModeLaunches
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_inAirplaneMode = a3;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasInAirplaneMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_coreMotionCurrentMotionLaunches = a3;
}

- (void)setHasCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCoreMotionCurrentMotionLaunches
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTotalSpotlightLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_totalSpotlightLaunches = a3;
}

- (void)setHasTotalSpotlightLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTotalSpotlightLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTotalLaunchSequences:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalLaunchSequences = a3;
}

- (void)setHasTotalLaunchSequences:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalLaunchSequences
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTotalCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalCurrentDayOfWeekLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalCurrentDayOfWeekLaunches
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTotalWifiLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_totalWifiLaunches = a3;
}

- (void)setHasTotalWifiLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTotalWifiLaunches
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTimeOfDayInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timeOfDayInterval = a3;
}

- (void)setHasTimeOfDayInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimeOfDayInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)consumerSubType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_consumerSubType;
  else
    return 0;
}

- (void)setConsumerSubType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_consumerSubType = a3;
}

- (void)setHasConsumerSubType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConsumerSubType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)consumerSubTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_1E82DDD10[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConsumerSubType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeWidgetUnknown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeWidgetToday")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeWidgetLockScreen")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightPullDownHomeScreen")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightNotificationCenterOverApp")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightNotificationCenterHomeScreen")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightTodayLockScreen")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightTodayHomeScreen")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSpotlightUnknown")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypePreferenceSiriKit")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypePreferenceShadowLog")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypePreferenceUnknown")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeAppConnectionExpertSpringBoard")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSuperGreen")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeShadowLogging")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionUnknown")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionShadowLog")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionSpotlightPullDownHomeScreen")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionSpotlightTodayLockScreen")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionSpotlightTodayHomeScreen")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionSpotlightUnknown")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionLockScreen")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionVoiceShortcuts")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSlotResolution")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSlotResolutionShadowLog")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionValuation")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionValuationShadowLog")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionValuationLockscreen")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeDock")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeMax")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionCarPlayDashboard")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeShortcutsGallery")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSuggestionHomeScreen")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeAppDirectory")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeAppSuggestionHomeScreen")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeActionSuggestionHomeScreen")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSuggestionsWidgetHomeScreen")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeSuggestionsWidgetTodayHomeScreen")) & 1) != 0)
  {
    v4 = 38;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXConsumerSubTypeAppSuggestionTodayHomeScreen")))
  {
    v4 = 39;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)currentLOIType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_currentLOIType;
  else
    return 0;
}

- (void)setCurrentLOIType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_currentLOIType = a3;
}

- (void)setHasCurrentLOIType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentLOIType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)currentLOITypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E82DDE50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrentLOIType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLOITypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLOITypeWork")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLOITypeHome")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ProactiveAppPredictionLOITypeGym")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTotalLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_totalLaunches = a3;
}

- (void)setHasTotalLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTotalLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)outcome
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_outcome;
  else
    return 0;
}

- (void)setOutcome:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_outcome = a3;
}

- (void)setHasOutcome:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasOutcome
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)outcomeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E82DDE70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeConversionAppExpert")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeConversionUnknown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomePseudoconversion")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeDiversion")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeSearchAbandonment")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeAbandonment")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeError")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeMax")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXPredictionOutcomeDeduplicated")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEngagedApp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_engagedApp = a3;
}

- (void)setHasEngagedApp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEngagedApp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTotalTrendingLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_totalTrendingLaunches = a3;
}

- (void)setHasTotalTrendingLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTotalTrendingLaunches
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setTotalTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalTimeOfDayLaunches = a3;
}

- (void)setHasTotalTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalTimeOfDayLaunches
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTotalSSIDLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalSSIDLaunches = a3;
}

- (void)setHasTotalSSIDLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalSSIDLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLocationDistanceFromHome:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_locationDistanceFromHome = a3;
}

- (void)setHasLocationDistanceFromHome:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocationDistanceFromHome
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLocationDistanceFromWork:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_locationDistanceFromWork = a3;
}

- (void)setHasLocationDistanceFromWork:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLocationDistanceFromWork
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLocationDistanceFromSchool:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_locationDistanceFromSchool = a3;
}

- (void)setHasLocationDistanceFromSchool:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocationDistanceFromSchool
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLocationDistanceFromGym:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_locationDistanceFromGym = a3;
}

- (void)setHasLocationDistanceFromGym:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLocationDistanceFromGym
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsInternalBuild
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setPredictionCacheAge:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_predictionCacheAge = a3;
}

- (void)setHasPredictionCacheAge:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPredictionCacheAge
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSessionLogVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_sessionLogVersion = a3;
}

- (void)setHasSessionLogVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSessionLogVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTotalSpotlightTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_totalSpotlightTimeOfDayLaunches = a3;
}

- (void)setHasTotalSpotlightTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasTotalSpotlightTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setDayOfWeek:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTotalDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalDayOfWeekLaunches = a3;
}

- (void)setHasTotalDayOfWeekLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($90EB1F1D4E1646A95ACA41F0AF266E7E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalDayOfWeekLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)clearAppSequences
{
  -[NSMutableArray removeAllObjects](self->_appSequences, "removeAllObjects");
}

- (void)addAppSequence:(id)a3
{
  id v4;
  NSMutableArray *appSequences;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  appSequences = self->_appSequences;
  v8 = v4;
  if (!appSequences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_appSequences;
    self->_appSequences = v6;

    v4 = v8;
    appSequences = self->_appSequences;
  }
  -[NSMutableArray addObject:](appSequences, "addObject:", v4);

}

- (unint64_t)appSequencesCount
{
  return -[NSMutableArray count](self->_appSequences, "count");
}

- (id)appSequenceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_appSequences, "objectAtIndex:", a3);
}

+ (Class)appSequenceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAPRFeedbackSource
{
  return self->_aPRFeedbackSource != 0;
}

- (BOOL)hasAPREngagementType
{
  return self->_aPREngagementType != 0;
}

- (BOOL)hasAPRSiriExperience
{
  return self->_aPRSiriExperience != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasConsumerType
{
  return self->_consumerType != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasABGroup
{
  return self->_aBGroup != 0;
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
  v8.super_class = (Class)AWDProactiveAppPredictionSession;
  -[AWDProactiveAppPredictionSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppPredictionSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  void *v5;
  NSMutableArray *appSequences;
  NSString *aPRFeedbackSource;
  NSString *aPREngagementType;
  NSString *aPRSiriExperience;
  NSString *intentType;
  NSString *consumerType;
  NSString *sessionId;
  NSString *aBGroup;
  id v14;
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
  uint64_t consumerSubType;
  __CFString *v27;
  uint64_t currentLOIType;
  __CFString *v29;
  void *v30;
  uint64_t outcome;
  __CFString *v32;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_coreMotionLaunches);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("CoreMotionLaunches"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_5;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAirplaneModeLaunches);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("TotalAirplaneModeLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inAirplaneMode);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("InAirplaneMode"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_coreMotionCurrentMotionLaunches);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("CoreMotionCurrentMotionLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalSpotlightLaunches);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("TotalSpotlightLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalLaunchSequences);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("TotalLaunchSequences"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalCurrentDayOfWeekLaunches);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("TotalCurrentDayOfWeekLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalWifiLaunches);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("TotalWifiLaunches"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeOfDayInterval);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("TimeOfDayInterval"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_61;
  }
LABEL_57:
  consumerSubType = self->_consumerSubType;
  if (consumerSubType >= 0x28)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_consumerSubType);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E82DDD10[consumerSubType];
  }
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("ConsumerSubType"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_65;
  }
LABEL_61:
  currentLOIType = self->_currentLOIType;
  if (currentLOIType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentLOIType);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E82DDE50[currentLOIType];
  }
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("CurrentLOIType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_66;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalLaunches);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("TotalLaunches"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_70;
  }
LABEL_66:
  outcome = self->_outcome;
  if (outcome >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_outcome);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = off_1E82DDE70[outcome];
  }
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("Outcome"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_engagedApp);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("EngagedApp"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalTrendingLaunches);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("TotalTrendingLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalTimeOfDayLaunches);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("TotalTimeOfDayLaunches"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalSSIDLaunches);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("TotalSSIDLaunches"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromHome);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("LocationDistanceFromHome"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromWork);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("LocationDistanceFromWork"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_77;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromSchool);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("LocationDistanceFromSchool"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_78;
  }
LABEL_77:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromGym);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("LocationDistanceFromGym"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternalBuild);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("IsInternalBuild"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_predictionCacheAge);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("PredictionCacheAge"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionLogVersion);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("session_log_version"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalSpotlightTimeOfDayLaunches);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("TotalSpotlightTimeOfDayLaunches"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dayOfWeek);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("DayOfWeek"));

  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalDayOfWeekLaunches);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("TotalDayOfWeekLaunches"));

  }
LABEL_30:
  appSequences = self->_appSequences;
  if (appSequences)
    objc_msgSend(v3, "setObject:forKey:", appSequences, CFSTR("AppSequence"));
  aPRFeedbackSource = self->_aPRFeedbackSource;
  if (aPRFeedbackSource)
    objc_msgSend(v3, "setObject:forKey:", aPRFeedbackSource, CFSTR("APRFeedbackSource"));
  aPREngagementType = self->_aPREngagementType;
  if (aPREngagementType)
    objc_msgSend(v3, "setObject:forKey:", aPREngagementType, CFSTR("APREngagementType"));
  aPRSiriExperience = self->_aPRSiriExperience;
  if (aPRSiriExperience)
    objc_msgSend(v3, "setObject:forKey:", aPRSiriExperience, CFSTR("APRSiriExperience"));
  intentType = self->_intentType;
  if (intentType)
    objc_msgSend(v3, "setObject:forKey:", intentType, CFSTR("IntentType"));
  consumerType = self->_consumerType;
  if (consumerType)
    objc_msgSend(v3, "setObject:forKey:", consumerType, CFSTR("ConsumerType"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("SessionId"));
  aBGroup = self->_aBGroup;
  if (aBGroup)
    objc_msgSend(v3, "setObject:forKey:", aBGroup, CFSTR("ABGroup"));
  v14 = v3;

  return v14;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
LABEL_29:
    PBDataWriterWriteInt32Field();
LABEL_30:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_appSequences;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_aPRFeedbackSource)
    PBDataWriterWriteStringField();
  if (self->_aPREngagementType)
    PBDataWriterWriteStringField();
  if (self->_aPRSiriExperience)
    PBDataWriterWriteStringField();
  if (self->_intentType)
    PBDataWriterWriteStringField();
  if (self->_consumerType)
    PBDataWriterWriteStringField();
  if (self->_sessionId)
    PBDataWriterWriteStringField();
  if (self->_aBGroup)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 48) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_51;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 19) = self->_coreMotionLaunches;
  *((_DWORD *)v4 + 48) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_5;
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 36) = self->_totalAirplaneModeLaunches;
  *((_DWORD *)v4 + 48) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_53;
  }
LABEL_52:
  *((_BYTE *)v4 + 188) = self->_inAirplaneMode;
  *((_DWORD *)v4 + 48) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 18) = self->_coreMotionCurrentMotionLaunches;
  *((_DWORD *)v4 + 48) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 42) = self->_totalSpotlightLaunches;
  *((_DWORD *)v4 + 48) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 39) = self->_totalLaunchSequences;
  *((_DWORD *)v4 + 48) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 37) = self->_totalCurrentDayOfWeekLaunches;
  *((_DWORD *)v4 + 48) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 46) = self->_totalWifiLaunches;
  *((_DWORD *)v4 + 48) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 35) = self->_timeOfDayInterval;
  *((_DWORD *)v4 + 48) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 14) = self->_consumerSubType;
  *((_DWORD *)v4 + 48) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 20) = self->_currentLOIType;
  *((_DWORD *)v4 + 48) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v4 + 40) = self->_totalLaunches;
  *((_DWORD *)v4 + 48) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v4 + 30) = self->_outcome;
  *((_DWORD *)v4 + 48) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v4 + 22) = self->_engagedApp;
  *((_DWORD *)v4 + 48) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)v4 + 45) = self->_totalTrendingLaunches;
  *((_DWORD *)v4 + 48) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)v4 + 44) = self->_totalTimeOfDayLaunches;
  *((_DWORD *)v4 + 48) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)v4 + 41) = self->_totalSSIDLaunches;
  *((_DWORD *)v4 + 48) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)v4 + 27) = self->_locationDistanceFromHome;
  *((_DWORD *)v4 + 48) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)v4 + 29) = self->_locationDistanceFromWork;
  *((_DWORD *)v4 + 48) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)v4 + 28) = self->_locationDistanceFromSchool;
  *((_DWORD *)v4 + 48) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v4 + 26) = self->_locationDistanceFromGym;
  *((_DWORD *)v4 + 48) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  *((_BYTE *)v4 + 189) = self->_isInternalBuild;
  *((_DWORD *)v4 + 48) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 31) = self->_predictionCacheAge;
  *((_DWORD *)v4 + 48) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)v4 + 34) = self->_sessionLogVersion;
  *((_DWORD *)v4 + 48) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
LABEL_75:
    *((_DWORD *)v4 + 21) = self->_dayOfWeek;
    *((_DWORD *)v4 + 48) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_74:
  *((_DWORD *)v4 + 43) = self->_totalSpotlightTimeOfDayLaunches;
  *((_DWORD *)v4 + 48) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) != 0)
    goto LABEL_75;
LABEL_28:
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 38) = self->_totalDayOfWeekLaunches;
    *((_DWORD *)v4 + 48) |= 0x20000u;
  }
LABEL_30:
  v11 = v4;
  if (-[AWDProactiveAppPredictionSession appSequencesCount](self, "appSequencesCount"))
  {
    objc_msgSend(v11, "clearAppSequences");
    v6 = -[AWDProactiveAppPredictionSession appSequencesCount](self, "appSequencesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDProactiveAppPredictionSession appSequenceAtIndex:](self, "appSequenceAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAppSequence:", v9);

      }
    }
  }
  if (self->_aPRFeedbackSource)
    objc_msgSend(v11, "setAPRFeedbackSource:");
  v10 = v11;
  if (self->_aPREngagementType)
  {
    objc_msgSend(v11, "setAPREngagementType:");
    v10 = v11;
  }
  if (self->_aPRSiriExperience)
  {
    objc_msgSend(v11, "setAPRSiriExperience:");
    v10 = v11;
  }
  if (self->_intentType)
  {
    objc_msgSend(v11, "setIntentType:");
    v10 = v11;
  }
  if (self->_consumerType)
  {
    objc_msgSend(v11, "setConsumerType:");
    v10 = v11;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v11, "setSessionId:");
    v10 = v11;
  }
  if (self->_aBGroup)
  {
    objc_msgSend(v11, "setABGroup:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 192) |= 1u;
    has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 76) = self->_coreMotionLaunches;
  *(_DWORD *)(v5 + 192) |= 8u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x4000000) == 0)
      goto LABEL_5;
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 144) = self->_totalAirplaneModeLaunches;
  *(_DWORD *)(v5 + 192) |= 0x8000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 188) = self->_inAirplaneMode;
  *(_DWORD *)(v5 + 192) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 72) = self->_coreMotionCurrentMotionLaunches;
  *(_DWORD *)(v5 + 192) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 168) = self->_totalSpotlightLaunches;
  *(_DWORD *)(v5 + 192) |= 0x200000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 156) = self->_totalLaunchSequences;
  *(_DWORD *)(v5 + 192) |= 0x40000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 148) = self->_totalCurrentDayOfWeekLaunches;
  *(_DWORD *)(v5 + 192) |= 0x10000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 184) = self->_totalWifiLaunches;
  *(_DWORD *)(v5 + 192) |= 0x2000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_12;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 140) = self->_timeOfDayInterval;
  *(_DWORD *)(v5 + 192) |= 0x4000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 56) = self->_consumerSubType;
  *(_DWORD *)(v5 + 192) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 80) = self->_currentLOIType;
  *(_DWORD *)(v5 + 192) |= 0x10u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 160) = self->_totalLaunches;
  *(_DWORD *)(v5 + 192) |= 0x80000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 120) = self->_outcome;
  *(_DWORD *)(v5 + 192) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v5 + 88) = self->_engagedApp;
  *(_DWORD *)(v5 + 192) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 180) = self->_totalTrendingLaunches;
  *(_DWORD *)(v5 + 192) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 176) = self->_totalTimeOfDayLaunches;
  *(_DWORD *)(v5 + 192) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v5 + 164) = self->_totalSSIDLaunches;
  *(_DWORD *)(v5 + 192) |= 0x100000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v5 + 108) = self->_locationDistanceFromHome;
  *(_DWORD *)(v5 + 192) |= 0x100u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 116) = self->_locationDistanceFromWork;
  *(_DWORD *)(v5 + 192) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 112) = self->_locationDistanceFromSchool;
  *(_DWORD *)(v5 + 192) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 104) = self->_locationDistanceFromGym;
  *(_DWORD *)(v5 + 192) |= 0x80u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_61;
  }
LABEL_60:
  *(_BYTE *)(v5 + 189) = self->_isInternalBuild;
  *(_DWORD *)(v5 + 192) |= 0x8000000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 124) = self->_predictionCacheAge;
  *(_DWORD *)(v5 + 192) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 136) = self->_sessionLogVersion;
  *(_DWORD *)(v5 + 192) |= 0x2000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 172) = self->_totalSpotlightTimeOfDayLaunches;
  *(_DWORD *)(v5 + 192) |= 0x400000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_64:
  *(_DWORD *)(v5 + 84) = self->_dayOfWeek;
  *(_DWORD *)(v5 + 192) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_29:
    *(_DWORD *)(v5 + 152) = self->_totalDayOfWeekLaunches;
    *(_DWORD *)(v5 + 192) |= 0x20000u;
  }
LABEL_30:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_appSequences;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend(v6, "addAppSequence:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_aPRFeedbackSource, "copyWithZone:", a3);
  v15 = (void *)v6[4];
  v6[4] = v14;

  v16 = -[NSString copyWithZone:](self->_aPREngagementType, "copyWithZone:", a3);
  v17 = (void *)v6[3];
  v6[3] = v16;

  v18 = -[NSString copyWithZone:](self->_aPRSiriExperience, "copyWithZone:", a3);
  v19 = (void *)v6[5];
  v6[5] = v18;

  v20 = -[NSString copyWithZone:](self->_intentType, "copyWithZone:", a3);
  v21 = (void *)v6[12];
  v6[12] = v20;

  v22 = -[NSString copyWithZone:](self->_consumerType, "copyWithZone:", a3);
  v23 = (void *)v6[8];
  v6[8] = v22;

  v24 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v25 = (void *)v6[16];
  v6[16] = v24;

  v26 = -[NSString copyWithZone:](self->_aBGroup, "copyWithZone:", a3);
  v27 = (void *)v6[2];
  v6[2] = v26;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  int v6;
  NSMutableArray *appSequences;
  NSString *aPRFeedbackSource;
  NSString *aPREngagementType;
  NSString *aPRSiriExperience;
  NSString *intentType;
  NSString *consumerType;
  NSString *sessionId;
  NSString *aBGroup;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_164;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 48);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_164;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_coreMotionLaunches != *((_DWORD *)v4 + 19))
      goto LABEL_164;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_totalAirplaneModeLaunches != *((_DWORD *)v4 + 36))
      goto LABEL_164;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0)
      goto LABEL_164;
    if (self->_inAirplaneMode)
    {
      if (!*((_BYTE *)v4 + 188))
        goto LABEL_164;
    }
    else if (*((_BYTE *)v4 + 188))
    {
      goto LABEL_164;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_coreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 18))
      goto LABEL_164;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_totalSpotlightLaunches != *((_DWORD *)v4 + 42))
      goto LABEL_164;
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_totalLaunchSequences != *((_DWORD *)v4 + 39))
      goto LABEL_164;
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_totalCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 37))
      goto LABEL_164;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_totalWifiLaunches != *((_DWORD *)v4 + 46))
      goto LABEL_164;
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_timeOfDayInterval != *((_DWORD *)v4 + 35))
      goto LABEL_164;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_consumerSubType != *((_DWORD *)v4 + 14))
      goto LABEL_164;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 20))
      goto LABEL_164;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_totalLaunches != *((_DWORD *)v4 + 40))
      goto LABEL_164;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_outcome != *((_DWORD *)v4 + 30))
      goto LABEL_164;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_engagedApp != *((_DWORD *)v4 + 22))
      goto LABEL_164;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_totalTrendingLaunches != *((_DWORD *)v4 + 45))
      goto LABEL_164;
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_totalTimeOfDayLaunches != *((_DWORD *)v4 + 44))
      goto LABEL_164;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_totalSSIDLaunches != *((_DWORD *)v4 + 41))
      goto LABEL_164;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_locationDistanceFromHome != *((_DWORD *)v4 + 27))
      goto LABEL_164;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_locationDistanceFromWork != *((_DWORD *)v4 + 29))
      goto LABEL_164;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_locationDistanceFromSchool != *((_DWORD *)v4 + 28))
      goto LABEL_164;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_locationDistanceFromGym != *((_DWORD *)v4 + 26))
      goto LABEL_164;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) != 0)
    {
      if (self->_isInternalBuild)
      {
        if (!*((_BYTE *)v4 + 189))
          goto LABEL_164;
        goto LABEL_123;
      }
      if (!*((_BYTE *)v4 + 189))
        goto LABEL_123;
    }
LABEL_164:
    v15 = 0;
    goto LABEL_165;
  }
  if ((v6 & 0x8000000) != 0)
    goto LABEL_164;
LABEL_123:
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_predictionCacheAge != *((_DWORD *)v4 + 31))
      goto LABEL_164;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_sessionLogVersion != *((_DWORD *)v4 + 34))
      goto LABEL_164;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_totalSpotlightTimeOfDayLaunches != *((_DWORD *)v4 + 43))
      goto LABEL_164;
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 21))
      goto LABEL_164;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_164;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_totalDayOfWeekLaunches != *((_DWORD *)v4 + 38))
      goto LABEL_164;
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_164;
  }
  appSequences = self->_appSequences;
  if ((unint64_t)appSequences | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](appSequences, "isEqual:"))
  {
    goto LABEL_164;
  }
  aPRFeedbackSource = self->_aPRFeedbackSource;
  if ((unint64_t)aPRFeedbackSource | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](aPRFeedbackSource, "isEqual:"))
      goto LABEL_164;
  }
  aPREngagementType = self->_aPREngagementType;
  if ((unint64_t)aPREngagementType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](aPREngagementType, "isEqual:"))
      goto LABEL_164;
  }
  aPRSiriExperience = self->_aPRSiriExperience;
  if ((unint64_t)aPRSiriExperience | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](aPRSiriExperience, "isEqual:"))
      goto LABEL_164;
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:"))
      goto LABEL_164;
  }
  consumerType = self->_consumerType;
  if ((unint64_t)consumerType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](consumerType, "isEqual:"))
      goto LABEL_164;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_164;
  }
  aBGroup = self->_aBGroup;
  if ((unint64_t)aBGroup | *((_QWORD *)v4 + 2))
    v15 = -[NSString isEqual:](aBGroup, "isEqual:");
  else
    v15 = 1;
LABEL_165:

  return v15;
}

- (unint64_t)hash
{
  $90EB1F1D4E1646A95ACA41F0AF266E7E has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  unint64_t v39;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v39 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_coreMotionLaunches;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_4;
      goto LABEL_32;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_totalAirplaneModeLaunches;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_5;
    goto LABEL_33;
  }
LABEL_32:
  v5 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_inAirplaneMode;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_6;
    goto LABEL_34;
  }
LABEL_33:
  v6 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_coreMotionCurrentMotionLaunches;
    if ((*(_DWORD *)&has & 0x200000) != 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_34:
  v7 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_totalSpotlightLaunches;
    if ((*(_DWORD *)&has & 0x40000) != 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  v8 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_totalLaunchSequences;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  v9 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_totalCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  v10 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_totalWifiLaunches;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  v11 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_timeOfDayInterval;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  v12 = 0;
  if ((*(_BYTE *)&has & 2) != 0)
  {
LABEL_12:
    v13 = 2654435761 * self->_consumerSubType;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  v13 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_13:
    v14 = 2654435761 * self->_currentLOIType;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    v15 = 2654435761 * self->_totalLaunches;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  v15 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_15:
    v16 = 2654435761 * self->_outcome;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  v16 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_16:
    v17 = 2654435761 * self->_engagedApp;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  v17 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_17:
    v18 = 2654435761 * self->_totalTrendingLaunches;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  v18 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_totalTimeOfDayLaunches;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  v19 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_19:
    v20 = 2654435761 * self->_totalSSIDLaunches;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  v20 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_20:
    v21 = 2654435761 * self->_locationDistanceFromHome;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_locationDistanceFromWork;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  v22 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    v23 = 2654435761 * self->_locationDistanceFromSchool;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  v23 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_23:
    v24 = 2654435761 * self->_locationDistanceFromGym;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  v24 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_24:
    v25 = 2654435761 * self->_isInternalBuild;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  v25 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_25:
    v26 = 2654435761 * self->_predictionCacheAge;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_26;
    goto LABEL_54;
  }
LABEL_53:
  v26 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    v27 = 2654435761 * self->_sessionLogVersion;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_27;
    goto LABEL_55;
  }
LABEL_54:
  v27 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_27:
    v28 = 2654435761 * self->_totalSpotlightTimeOfDayLaunches;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_28;
LABEL_56:
    v29 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_29;
LABEL_57:
    v30 = 0;
    goto LABEL_58;
  }
LABEL_55:
  v28 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_56;
LABEL_28:
  v29 = 2654435761 * self->_dayOfWeek;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_57;
LABEL_29:
  v30 = 2654435761 * self->_totalDayOfWeekLaunches;
LABEL_58:
  v31 = v4 ^ v39 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ -[NSMutableArray hash](self->_appSequences, "hash");
  v32 = -[NSString hash](self->_aPRFeedbackSource, "hash");
  v33 = v31 ^ v32 ^ -[NSString hash](self->_aPREngagementType, "hash");
  v34 = -[NSString hash](self->_aPRSiriExperience, "hash");
  v35 = v34 ^ -[NSString hash](self->_intentType, "hash");
  v36 = v33 ^ v35 ^ -[NSString hash](self->_consumerType, "hash");
  v37 = -[NSString hash](self->_sessionId, "hash");
  return v36 ^ v37 ^ -[NSString hash](self->_aBGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v6 = *((_DWORD *)v4 + 48);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_54;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_coreMotionLaunches = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 8u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x8000) == 0)
  {
LABEL_4:
    if ((v6 & 0x4000000) == 0)
      goto LABEL_5;
    goto LABEL_55;
  }
LABEL_54:
  self->_totalAirplaneModeLaunches = *((_DWORD *)v4 + 36);
  *(_DWORD *)&self->_has |= 0x8000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_56;
  }
LABEL_55:
  self->_inAirplaneMode = *((_BYTE *)v4 + 188);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x200000) == 0)
      goto LABEL_7;
    goto LABEL_57;
  }
LABEL_56:
  self->_coreMotionCurrentMotionLaunches = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x200000) == 0)
  {
LABEL_7:
    if ((v6 & 0x40000) == 0)
      goto LABEL_8;
    goto LABEL_58;
  }
LABEL_57:
  self->_totalSpotlightLaunches = *((_DWORD *)v4 + 42);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x40000) == 0)
  {
LABEL_8:
    if ((v6 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  self->_totalLaunchSequences = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x10000) == 0)
  {
LABEL_9:
    if ((v6 & 0x2000000) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  self->_totalCurrentDayOfWeekLaunches = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_has |= 0x10000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_10:
    if ((v6 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  self->_totalWifiLaunches = *((_DWORD *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x4000) == 0)
  {
LABEL_11:
    if ((v6 & 2) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  self->_timeOfDayInterval = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_has |= 0x4000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_12:
    if ((v6 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  self->_consumerSubType = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 2u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x10) == 0)
  {
LABEL_13:
    if ((v6 & 0x80000) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  self->_currentLOIType = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x10u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x80000) == 0)
  {
LABEL_14:
    if ((v6 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  self->_totalLaunches = *((_DWORD *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x80000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x800) == 0)
  {
LABEL_15:
    if ((v6 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  self->_outcome = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x800u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x40) == 0)
  {
LABEL_16:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_67;
  }
LABEL_66:
  self->_engagedApp = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x40u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_17:
    if ((v6 & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_68;
  }
LABEL_67:
  self->_totalTrendingLaunches = *((_DWORD *)v4 + 45);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x800000) == 0)
  {
LABEL_18:
    if ((v6 & 0x100000) == 0)
      goto LABEL_19;
    goto LABEL_69;
  }
LABEL_68:
  self->_totalTimeOfDayLaunches = *((_DWORD *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x800000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x100000) == 0)
  {
LABEL_19:
    if ((v6 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_70;
  }
LABEL_69:
  self->_totalSSIDLaunches = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x100000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x100) == 0)
  {
LABEL_20:
    if ((v6 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_71;
  }
LABEL_70:
  self->_locationDistanceFromHome = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x400) == 0)
  {
LABEL_21:
    if ((v6 & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_72;
  }
LABEL_71:
  self->_locationDistanceFromWork = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x200) == 0)
  {
LABEL_22:
    if ((v6 & 0x80) == 0)
      goto LABEL_23;
    goto LABEL_73;
  }
LABEL_72:
  self->_locationDistanceFromSchool = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x80) == 0)
  {
LABEL_23:
    if ((v6 & 0x8000000) == 0)
      goto LABEL_24;
    goto LABEL_74;
  }
LABEL_73:
  self->_locationDistanceFromGym = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x80u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0)
      goto LABEL_25;
    goto LABEL_75;
  }
LABEL_74:
  self->_isInternalBuild = *((_BYTE *)v4 + 189);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x1000) == 0)
  {
LABEL_25:
    if ((v6 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_76;
  }
LABEL_75:
  self->_predictionCacheAge = *((_DWORD *)v4 + 31);
  *(_DWORD *)&self->_has |= 0x1000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((v6 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_77;
  }
LABEL_76:
  self->_sessionLogVersion = *((_DWORD *)v4 + 34);
  *(_DWORD *)&self->_has |= 0x2000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x400000) == 0)
  {
LABEL_27:
    if ((v6 & 0x20) == 0)
      goto LABEL_28;
    goto LABEL_78;
  }
LABEL_77:
  self->_totalSpotlightTimeOfDayLaunches = *((_DWORD *)v4 + 43);
  *(_DWORD *)&self->_has |= 0x400000u;
  v6 = *((_DWORD *)v4 + 48);
  if ((v6 & 0x20) == 0)
  {
LABEL_28:
    if ((v6 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_78:
  self->_dayOfWeek = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 48) & 0x20000) != 0)
  {
LABEL_29:
    self->_totalDayOfWeekLaunches = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_30:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[AWDProactiveAppPredictionSession addAppSequence:](self, "addAppSequence:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (v5[4])
    -[AWDProactiveAppPredictionSession setAPRFeedbackSource:](self, "setAPRFeedbackSource:");
  if (v5[3])
    -[AWDProactiveAppPredictionSession setAPREngagementType:](self, "setAPREngagementType:");
  if (v5[5])
    -[AWDProactiveAppPredictionSession setAPRSiriExperience:](self, "setAPRSiriExperience:");
  if (v5[12])
    -[AWDProactiveAppPredictionSession setIntentType:](self, "setIntentType:");
  if (v5[8])
    -[AWDProactiveAppPredictionSession setConsumerType:](self, "setConsumerType:");
  if (v5[16])
    -[AWDProactiveAppPredictionSession setSessionId:](self, "setSessionId:");
  if (v5[2])
    -[AWDProactiveAppPredictionSession setABGroup:](self, "setABGroup:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)coreMotionLaunches
{
  return self->_coreMotionLaunches;
}

- (int)totalAirplaneModeLaunches
{
  return self->_totalAirplaneModeLaunches;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (int)coreMotionCurrentMotionLaunches
{
  return self->_coreMotionCurrentMotionLaunches;
}

- (int)totalSpotlightLaunches
{
  return self->_totalSpotlightLaunches;
}

- (int)totalLaunchSequences
{
  return self->_totalLaunchSequences;
}

- (int)totalCurrentDayOfWeekLaunches
{
  return self->_totalCurrentDayOfWeekLaunches;
}

- (int)totalWifiLaunches
{
  return self->_totalWifiLaunches;
}

- (int)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (int)totalLaunches
{
  return self->_totalLaunches;
}

- (int)engagedApp
{
  return self->_engagedApp;
}

- (int)totalTrendingLaunches
{
  return self->_totalTrendingLaunches;
}

- (int)totalTimeOfDayLaunches
{
  return self->_totalTimeOfDayLaunches;
}

- (int)totalSSIDLaunches
{
  return self->_totalSSIDLaunches;
}

- (int)locationDistanceFromHome
{
  return self->_locationDistanceFromHome;
}

- (int)locationDistanceFromWork
{
  return self->_locationDistanceFromWork;
}

- (int)locationDistanceFromSchool
{
  return self->_locationDistanceFromSchool;
}

- (int)locationDistanceFromGym
{
  return self->_locationDistanceFromGym;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (int)predictionCacheAge
{
  return self->_predictionCacheAge;
}

- (int)sessionLogVersion
{
  return self->_sessionLogVersion;
}

- (int)totalSpotlightTimeOfDayLaunches
{
  return self->_totalSpotlightTimeOfDayLaunches;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)totalDayOfWeekLaunches
{
  return self->_totalDayOfWeekLaunches;
}

- (NSMutableArray)appSequences
{
  return self->_appSequences;
}

- (void)setAppSequences:(id)a3
{
  objc_storeStrong((id *)&self->_appSequences, a3);
}

- (NSString)aPRFeedbackSource
{
  return self->_aPRFeedbackSource;
}

- (void)setAPRFeedbackSource:(id)a3
{
  objc_storeStrong((id *)&self->_aPRFeedbackSource, a3);
}

- (NSString)aPREngagementType
{
  return self->_aPREngagementType;
}

- (void)setAPREngagementType:(id)a3
{
  objc_storeStrong((id *)&self->_aPREngagementType, a3);
}

- (NSString)aPRSiriExperience
{
  return self->_aPRSiriExperience;
}

- (void)setAPRSiriExperience:(id)a3
{
  objc_storeStrong((id *)&self->_aPRSiriExperience, a3);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_storeStrong((id *)&self->_intentType, a3);
}

- (NSString)consumerType
{
  return self->_consumerType;
}

- (void)setConsumerType:(id)a3
{
  objc_storeStrong((id *)&self->_consumerType, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)aBGroup
{
  return self->_aBGroup;
}

- (void)setABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_aBGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_consumerType, 0);
  objc_storeStrong((id *)&self->_appSequences, 0);
  objc_storeStrong((id *)&self->_aPRSiriExperience, 0);
  objc_storeStrong((id *)&self->_aPRFeedbackSource, 0);
  objc_storeStrong((id *)&self->_aPREngagementType, 0);
  objc_storeStrong((id *)&self->_aBGroup, 0);
}

@end
