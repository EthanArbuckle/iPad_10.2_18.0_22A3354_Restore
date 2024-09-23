@implementation AWDProactiveAppPredictionIntentPredictionSession

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveAppPredictionIntentPredictionSession;
  -[AWDProactiveAppPredictionIntentPredictionSession dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)clearActionDatas
{
  -[NSMutableArray removeAllObjects](self->_actionDatas, "removeAllObjects");
}

- (void)addActionData:(id)a3
{
  id v4;
  NSMutableArray *actionDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actionDatas = self->_actionDatas;
  v8 = v4;
  if (!actionDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_actionDatas;
    self->_actionDatas = v6;

    v4 = v8;
    actionDatas = self->_actionDatas;
  }
  -[NSMutableArray addObject:](actionDatas, "addObject:", v4);

}

- (unint64_t)actionDatasCount
{
  return -[NSMutableArray count](self->_actionDatas, "count");
}

- (id)actionDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_actionDatas, "objectAtIndex:", a3);
}

+ (Class)actionDataType
{
  return (Class)objc_opt_class();
}

- (void)setAppActionCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appActionCoreMotionCurrentMotionLaunches = a3;
}

- (void)setHasAppActionCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppActionCoreMotionCurrentMotionLaunches
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAppSequence
{
  return self->_appSequence != 0;
}

- (int)consumerSubType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_consumerSubType;
  else
    return 0;
}

- (void)setConsumerSubType:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_consumerSubType = a3;
}

- (void)setHasConsumerSubType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConsumerSubType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)consumerSubTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_1E82EBE98[a3];
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCurrentLOIType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)currentLOITypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E82EBFD8[a3];
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (unint64_t)engagedActionCacheIndicesCount
{
  return self->_engagedActionCacheIndices.count;
}

- (int)engagedActionCacheIndices
{
  return self->_engagedActionCacheIndices.list;
}

- (void)clearEngagedActionCacheIndices
{
  PBRepeatedInt32Clear();
}

- (void)addEngagedActionCacheIndices:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)engagedActionCacheIndicesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_engagedActionCacheIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_engagedActionCacheIndices = &self->_engagedActionCacheIndices;
  count = self->_engagedActionCacheIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_engagedActionCacheIndices->list[a3];
}

- (void)setEngagedActionCacheIndices:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)engagementType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_engagementType;
  else
    return 0;
}

- (void)setEngagementType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEngagementType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E82EBFF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeEngagedInitial")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeEngagedFinalComplete")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeEngagedFinalPartial")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeEngagedDirectComplete")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeAbandonedDirect")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeAbandonedFinal")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeFoundComplete")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeFoundPartial")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeFoundNone")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionEngagementTypeMax")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_inAirplaneMode = a3;
}

- (void)setHasInAirplaneMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasInAirplaneMode
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIntentDonationDelay:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_intentDonationDelay = a3;
}

- (void)setHasIntentDonationDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIntentDonationDelay
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isInternalBuild = a3;
}

- (void)setHasIsInternalBuild:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsInternalBuild
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setLogType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_logType = a3;
}

- (void)setHasLogType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLogType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPredictionAge:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_predictionAge = a3;
}

- (void)setHasPredictionAge:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPredictionAge
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTimeOfDayInterval:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timeOfDayInterval = a3;
}

- (void)setHasTimeOfDayInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimeOfDayInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTotalAppActionAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_totalAppActionAirplaneModeLaunches = a3;
}

- (void)setHasTotalAppActionAirplaneModeLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTotalAppActionAirplaneModeLaunches
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTotalAppActionCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_totalAppActionCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalAppActionCurrentDayOfWeekLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTotalAppActionCurrentDayOfWeekLaunches
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTotalAppForAllActionsAirplaneModeLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_totalAppForAllActionsAirplaneModeLaunches = a3;
}

- (void)setHasTotalAppForAllActionsAirplaneModeLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsAirplaneModeLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTotalAppForAllActionsCurrentDayOfWeekLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_totalAppForAllActionsCurrentDayOfWeekLaunches = a3;
}

- (void)setHasTotalAppForAllActionsCurrentDayOfWeekLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsCurrentDayOfWeekLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setUiFeedbackDelay:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_uiFeedbackDelay = a3;
}

- (void)setHasUiFeedbackDelay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUiFeedbackDelay
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSessionLogVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_sessionLogVersion = a3;
}

- (void)setHasSessionLogVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSessionLogVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (void)setAppForAllActionsCoreMotionCurrentMotionLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_appForAllActionsCoreMotionCurrentMotionLaunches = a3;
}

- (void)setHasAppForAllActionsCoreMotionCurrentMotionLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAppForAllActionsCoreMotionCurrentMotionLaunches
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocationDistanceFromHome
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setLocationDistanceFromWork:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_locationDistanceFromWork = a3;
}

- (void)setHasLocationDistanceFromWork:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocationDistanceFromWork
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTotalAppActionTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_totalAppActionTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppActionTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTotalAppActionTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTotalAppForAllActionTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_totalAppForAllActionTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppForAllActionTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTotalAppActionCoarseTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_totalAppActionCoarseTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppActionCoarseTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTotalAppActionCoarseTimeOfDayLaunches
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTotalAppForAllActionsCoarseTimeOfDayLaunches:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_totalAppForAllActionsCoarseTimeOfDayLaunches = a3;
}

- (void)setHasTotalAppForAllActionsCoarseTimeOfDayLaunches:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($5CAA899F79A00F8F7A1746E0416806BD)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTotalAppForAllActionsCoarseTimeOfDayLaunches
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasAppActionSequence
{
  return self->_appActionSequence != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
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
  v8.super_class = (Class)AWDProactiveAppPredictionIntentPredictionSession;
  -[AWDProactiveAppPredictionIntentPredictionSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppPredictionIntentPredictionSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  AWDProactiveAppPredictionAppLaunchSequence *appSequence;
  void *v14;
  $5CAA899F79A00F8F7A1746E0416806BD has;
  void *v16;
  void *v17;
  $5CAA899F79A00F8F7A1746E0416806BD v18;
  void *v19;
  NSString *abGroup;
  $5CAA899F79A00F8F7A1746E0416806BD v21;
  void *v22;
  AWDProactiveAppPredictionAppActionSequence *appActionSequence;
  void *v24;
  NSString *sessionId;
  id v26;
  uint64_t consumerSubType;
  __CFString *v29;
  uint64_t engagementType;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t currentLOIType;
  __CFString *v39;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_actionDatas, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_actionDatas, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v6 = self->_actionDatas;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("actionData"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_appActionCoreMotionCurrentMotionLaunches);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("appActionCoreMotionCurrentMotionLaunches"));

  }
  appSequence = self->_appSequence;
  if (appSequence)
  {
    -[AWDProactiveAppPredictionAppLaunchSequence dictionaryRepresentation](appSequence, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("appSequence"));

  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    consumerSubType = self->_consumerSubType;
    if (consumerSubType >= 0x28)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_consumerSubType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E82EBE98[consumerSubType];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("consumerSubType"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_18:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_18;
  }
  currentLOIType = self->_currentLOIType;
  if (currentLOIType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentLOIType);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_1E82EBFD8[currentLOIType];
  }
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("currentLOIType"));

  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_dayOfWeek);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("dayOfWeek"));

  }
LABEL_20:
  PBRepeatedInt32NSArray();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("engagedActionCacheIndices"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x40) != 0)
  {
    engagementType = self->_engagementType;
    if (engagementType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_engagementType);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E82EBFF8[engagementType];
    }
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("engagementType"));

    v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x800000) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v18 & 0x80) == 0)
        goto LABEL_23;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inAirplaneMode);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("inAirplaneMode"));

  v18 = self->_has;
  if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0)
      goto LABEL_24;
    goto LABEL_68;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_intentDonationDelay);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("intentDonationDelay"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v18 & 0x400) == 0)
      goto LABEL_25;
    goto LABEL_69;
  }
LABEL_68:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternalBuild);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("isInternalBuild"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x400) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v18 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_logType);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("logType"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v18 & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_predictionAge);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("predictionAge"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v18 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeOfDayInterval);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("timeOfDayInterval"));

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v18 & 0x10000) == 0)
      goto LABEL_29;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppActionAirplaneModeLaunches);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("totalAppActionAirplaneModeLaunches"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v18 & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppActionCurrentDayOfWeekLaunches);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("totalAppActionCurrentDayOfWeekLaunches"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v18 & 0x200000) == 0)
      goto LABEL_31;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppForAllActionsAirplaneModeLaunches);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("totalAppForAllActionsAirplaneModeLaunches"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v18 & 0x400000) == 0)
      goto LABEL_32;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppForAllActionsCurrentDayOfWeekLaunches);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("totalAppForAllActionsCurrentDayOfWeekLaunches"));

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v18 & 0x1000) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_uiFeedbackDelay);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("uiFeedbackDelay"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionLogVersion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("session_log_version"));

  }
LABEL_34:
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_appForAllActionsCoreMotionCurrentMotionLaunches);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("appForAllActionsCoreMotionCurrentMotionLaunches"));

    v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x100) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v21 & 0x200) == 0)
        goto LABEL_39;
      goto LABEL_55;
    }
  }
  else if ((*(_WORD *)&v21 & 0x100) == 0)
  {
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromHome);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("locationDistanceFromHome"));

  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v21 & 0x20000) == 0)
      goto LABEL_40;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationDistanceFromWork);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("locationDistanceFromWork"));

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x20000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v21 & 0x40000) == 0)
      goto LABEL_41;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppActionTimeOfDayLaunches);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("totalAppActionTimeOfDayLaunches"));

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&v21 & 0x8000) == 0)
      goto LABEL_42;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppForAllActionTimeOfDayLaunches);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("totalAppForAllActionTimeOfDayLaunches"));

  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v21 & 0x100000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppActionCoarseTimeOfDayLaunches);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("totalAppActionCoarseTimeOfDayLaunches"));

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_totalAppForAllActionsCoarseTimeOfDayLaunches);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("totalAppForAllActionsCoarseTimeOfDayLaunches"));

  }
LABEL_44:
  appActionSequence = self->_appActionSequence;
  if (appActionSequence)
  {
    -[AWDProactiveAppPredictionAppActionSequence dictionaryRepresentation](appActionSequence, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("appActionSequence"));

  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  v26 = v3;

  return v26;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionIntentPredictionSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $5CAA899F79A00F8F7A1746E0416806BD has;
  unint64_t v11;
  $5CAA899F79A00F8F7A1746E0416806BD v12;
  $5CAA899F79A00F8F7A1746E0416806BD v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_actionDatas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_appSequence)
    PBDataWriterWriteSubmessage();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:
  if (self->_engagedActionCacheIndices.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_engagedActionCacheIndices.count);
  }
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x800000) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v12 & 0x80) == 0)
        goto LABEL_24;
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v12 & 0x1000000) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v12 & 0x400) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v12 & 0x800) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v12 & 0x2000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v12 & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v12 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
      goto LABEL_32;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v12 & 0x400000) == 0)
      goto LABEL_33;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x400000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v12 & 0x1000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_34:
    PBDataWriterWriteInt32Field();
LABEL_35:
  if (self->_abGroup)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x100) == 0)
    {
LABEL_39:
      if ((*(_WORD *)&v13 & 0x200) == 0)
        goto LABEL_40;
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v13 & 0x100) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
      goto LABEL_41;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x40000) == 0)
      goto LABEL_42;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_43;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v13 & 0x100000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_44:
    PBDataWriterWriteInt32Field();
LABEL_45:
  if (self->_appActionSequence)
    PBDataWriterWriteSubmessage();
  if (self->_sessionId)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;
  $5CAA899F79A00F8F7A1746E0416806BD has;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  $5CAA899F79A00F8F7A1746E0416806BD v14;
  _DWORD *v15;
  $5CAA899F79A00F8F7A1746E0416806BD v16;
  id v17;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_timestamp;
    *((_DWORD *)v4 + 46) |= 1u;
  }
  v17 = v4;
  if (-[AWDProactiveAppPredictionIntentPredictionSession actionDatasCount](self, "actionDatasCount"))
  {
    objc_msgSend(v17, "clearActionDatas");
    v5 = -[AWDProactiveAppPredictionIntentPredictionSession actionDatasCount](self, "actionDatasCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[AWDProactiveAppPredictionIntentPredictionSession actionDataAtIndex:](self, "actionDataAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addActionData:", v8);

      }
    }
  }
  v9 = v17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 14) = self->_appActionCoreMotionCurrentMotionLaunches;
    *((_DWORD *)v17 + 46) |= 2u;
  }
  if (self->_appSequence)
  {
    objc_msgSend(v17, "setAppSequence:");
    v9 = v17;
  }
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
LABEL_49:
    v9[23] = self->_currentLOIType;
    v9[46] |= 0x10u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v9[22] = self->_consumerSubType;
  v9[46] |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
    goto LABEL_49;
LABEL_13:
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_14:
    v9[24] = self->_dayOfWeek;
    v9[46] |= 0x20u;
  }
LABEL_15:
  if (-[AWDProactiveAppPredictionIntentPredictionSession engagedActionCacheIndicesCount](self, "engagedActionCacheIndicesCount"))
  {
    objc_msgSend(v17, "clearEngagedActionCacheIndices");
    v11 = -[AWDProactiveAppPredictionIntentPredictionSession engagedActionCacheIndicesCount](self, "engagedActionCacheIndicesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
        objc_msgSend(v17, "addEngagedActionCacheIndices:", -[AWDProactiveAppPredictionIntentPredictionSession engagedActionCacheIndicesAtIndex:](self, "engagedActionCacheIndicesAtIndex:", j));
    }
  }
  v14 = self->_has;
  v15 = v17;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    *((_DWORD *)v17 + 25) = self->_engagementType;
    *((_DWORD *)v17 + 46) |= 0x40u;
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v14 & 0x80) == 0)
        goto LABEL_22;
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
    goto LABEL_21;
  }
  *((_BYTE *)v17 + 180) = self->_inAirplaneMode;
  *((_DWORD *)v17 + 46) |= 0x800000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_23;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v17 + 26) = self->_intentDonationDelay;
  *((_DWORD *)v17 + 46) |= 0x80u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v14 & 0x400) == 0)
      goto LABEL_24;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v17 + 181) = self->_isInternalBuild;
  *((_DWORD *)v17 + 46) |= 0x1000000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v14 & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v17 + 29) = self->_logType;
  *((_DWORD *)v17 + 46) |= 0x400u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v17 + 30) = self->_predictionAge;
  *((_DWORD *)v17 + 46) |= 0x800u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_27;
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v17 + 35) = self->_timeOfDayInterval;
  *((_DWORD *)v17 + 46) |= 0x2000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_28;
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v17 + 36) = self->_totalAppActionAirplaneModeLaunches;
  *((_DWORD *)v17 + 46) |= 0x4000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x80000) == 0)
      goto LABEL_29;
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v17 + 38) = self->_totalAppActionCurrentDayOfWeekLaunches;
  *((_DWORD *)v17 + 46) |= 0x10000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v17 + 41) = self->_totalAppForAllActionsAirplaneModeLaunches;
  *((_DWORD *)v17 + 46) |= 0x80000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
      goto LABEL_31;
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v17 + 43) = self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
  *((_DWORD *)v17 + 46) |= 0x200000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_62:
  *((_DWORD *)v17 + 44) = self->_uiFeedbackDelay;
  *((_DWORD *)v17 + 46) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_32:
    *((_DWORD *)v17 + 34) = self->_sessionLogVersion;
    *((_DWORD *)v17 + 46) |= 0x1000u;
  }
LABEL_33:
  if (self->_abGroup)
  {
    objc_msgSend(v17, "setAbGroup:");
    v15 = v17;
  }
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 4) != 0)
  {
    v15[18] = self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    v15[46] |= 4u;
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x100) == 0)
    {
LABEL_37:
      if ((*(_WORD *)&v16 & 0x200) == 0)
        goto LABEL_38;
      goto LABEL_66;
    }
  }
  else if ((*(_WORD *)&v16 & 0x100) == 0)
  {
    goto LABEL_37;
  }
  v15[27] = self->_locationDistanceFromHome;
  v15[46] |= 0x100u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v16 & 0x20000) == 0)
      goto LABEL_39;
    goto LABEL_67;
  }
LABEL_66:
  v15[28] = self->_locationDistanceFromWork;
  v15[46] |= 0x200u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v16 & 0x40000) == 0)
      goto LABEL_40;
    goto LABEL_68;
  }
LABEL_67:
  v15[39] = self->_totalAppActionTimeOfDayLaunches;
  v15[46] |= 0x20000u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v16 & 0x8000) == 0)
      goto LABEL_41;
    goto LABEL_69;
  }
LABEL_68:
  v15[40] = self->_totalAppForAllActionTimeOfDayLaunches;
  v15[46] |= 0x40000u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v16 & 0x100000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_69:
  v15[37] = self->_totalAppActionCoarseTimeOfDayLaunches;
  v15[46] |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_42:
    v15[42] = self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
    v15[46] |= 0x100000u;
  }
LABEL_43:
  if (self->_appActionSequence)
  {
    objc_msgSend(v17, "setAppActionSequence:");
    v15 = v17;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v17, "setSessionId:");
    v15 = v17;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  $5CAA899F79A00F8F7A1746E0416806BD has;
  $5CAA899F79A00F8F7A1746E0416806BD v16;
  uint64_t v17;
  void *v18;
  $5CAA899F79A00F8F7A1746E0416806BD v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_timestamp;
    *(_DWORD *)(v5 + 184) |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = self->_actionDatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v6, "addActionData:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_appActionCoreMotionCurrentMotionLaunches;
    *(_DWORD *)(v6 + 184) |= 2u;
  }
  v13 = -[AWDProactiveAppPredictionAppLaunchSequence copyWithZone:](self->_appSequence, "copyWithZone:", a3, (_QWORD)v25);
  v14 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v13;

  has = self->_has;
  if ((*(_BYTE *)&has & 8) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_consumerSubType;
    *(_DWORD *)(v6 + 184) |= 8u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_14:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 92) = self->_currentLOIType;
  *(_DWORD *)(v6 + 184) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 96) = self->_dayOfWeek;
    *(_DWORD *)(v6 + 184) |= 0x20u;
  }
LABEL_16:
  PBRepeatedInt32Copy();
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_engagementType;
    *(_DWORD *)(v6 + 184) |= 0x40u;
    v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x800000) == 0)
    {
LABEL_18:
      if ((*(_BYTE *)&v16 & 0x80) == 0)
        goto LABEL_19;
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v6 + 180) = self->_inAirplaneMode;
  *(_DWORD *)(v6 + 184) |= 0x800000u;
  v16 = self->_has;
  if ((*(_BYTE *)&v16 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v16 & 0x1000000) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 104) = self->_intentDonationDelay;
  *(_DWORD *)(v6 + 184) |= 0x80u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v16 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v6 + 181) = self->_isInternalBuild;
  *(_DWORD *)(v6 + 184) |= 0x1000000u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x400) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v16 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v6 + 116) = self->_logType;
  *(_DWORD *)(v6 + 184) |= 0x400u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v16 & 0x2000) == 0)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v6 + 120) = self->_predictionAge;
  *(_DWORD *)(v6 + 184) |= 0x800u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v16 & 0x4000) == 0)
      goto LABEL_24;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 140) = self->_timeOfDayInterval;
  *(_DWORD *)(v6 + 184) |= 0x2000u;
  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v16 & 0x10000) == 0)
      goto LABEL_25;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v6 + 144) = self->_totalAppActionAirplaneModeLaunches;
  *(_DWORD *)(v6 + 184) |= 0x4000u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v16 & 0x80000) == 0)
      goto LABEL_26;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v6 + 152) = self->_totalAppActionCurrentDayOfWeekLaunches;
  *(_DWORD *)(v6 + 184) |= 0x10000u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x80000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 164) = self->_totalAppForAllActionsAirplaneModeLaunches;
  *(_DWORD *)(v6 + 184) |= 0x80000u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_28;
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 172) = self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
  *(_DWORD *)(v6 + 184) |= 0x200000u;
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v16 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_53:
  *(_DWORD *)(v6 + 176) = self->_uiFeedbackDelay;
  *(_DWORD *)(v6 + 184) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_29:
    *(_DWORD *)(v6 + 136) = self->_sessionLogVersion;
    *(_DWORD *)(v6 + 184) |= 0x1000u;
  }
LABEL_30:
  v17 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    *(_DWORD *)(v6 + 184) |= 4u;
    v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x100) == 0)
    {
LABEL_32:
      if ((*(_WORD *)&v19 & 0x200) == 0)
        goto LABEL_33;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v19 & 0x100) == 0)
  {
    goto LABEL_32;
  }
  *(_DWORD *)(v6 + 108) = self->_locationDistanceFromHome;
  *(_DWORD *)(v6 + 184) |= 0x100u;
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v19 & 0x20000) == 0)
      goto LABEL_34;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 112) = self->_locationDistanceFromWork;
  *(_DWORD *)(v6 + 184) |= 0x200u;
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x20000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v19 & 0x40000) == 0)
      goto LABEL_35;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 156) = self->_totalAppActionTimeOfDayLaunches;
  *(_DWORD *)(v6 + 184) |= 0x20000u;
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v19 & 0x8000) == 0)
      goto LABEL_36;
LABEL_60:
    *(_DWORD *)(v6 + 148) = self->_totalAppActionCoarseTimeOfDayLaunches;
    *(_DWORD *)(v6 + 184) |= 0x8000u;
    if ((*(_DWORD *)&self->_has & 0x100000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_59:
  *(_DWORD *)(v6 + 160) = self->_totalAppForAllActionTimeOfDayLaunches;
  *(_DWORD *)(v6 + 184) |= 0x40000u;
  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x8000) != 0)
    goto LABEL_60;
LABEL_36:
  if ((*(_DWORD *)&v19 & 0x100000) != 0)
  {
LABEL_37:
    *(_DWORD *)(v6 + 168) = self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
    *(_DWORD *)(v6 + 184) |= 0x100000u;
  }
LABEL_38:
  v20 = -[AWDProactiveAppPredictionAppActionSequence copyWithZone:](self->_appActionSequence, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v20;

  v22 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $5CAA899F79A00F8F7A1746E0416806BD has;
  int v6;
  NSMutableArray *actionDatas;
  int v8;
  AWDProactiveAppPredictionAppLaunchSequence *appSequence;
  int v10;
  $5CAA899F79A00F8F7A1746E0416806BD v11;
  int v12;
  NSString *abGroup;
  int v14;
  AWDProactiveAppPredictionAppActionSequence *appActionSequence;
  NSString *sessionId;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_147;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_147;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_147;
  }
  actionDatas = self->_actionDatas;
  if ((unint64_t)actionDatas | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](actionDatas, "isEqual:"))
      goto LABEL_147;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_appActionCoreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 14))
      goto LABEL_147;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_147;
  }
  appSequence = self->_appSequence;
  if ((unint64_t)appSequence | *((_QWORD *)v4 + 10))
  {
    if (!-[AWDProactiveAppPredictionAppLaunchSequence isEqual:](appSequence, "isEqual:"))
      goto LABEL_147;
    has = self->_has;
  }
  v10 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_consumerSubType != *((_DWORD *)v4 + 22))
      goto LABEL_147;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 23))
      goto LABEL_147;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 24))
      goto LABEL_147;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_147;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_147:
    v17 = 0;
    goto LABEL_148;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_engagementType != *((_DWORD *)v4 + 25))
      goto LABEL_147;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x800000) != 0)
  {
    if ((v12 & 0x800000) == 0)
      goto LABEL_147;
    if (self->_inAirplaneMode)
    {
      if (!*((_BYTE *)v4 + 180))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 180))
    {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x800000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_intentDonationDelay != *((_DWORD *)v4 + 26))
      goto LABEL_147;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0)
      goto LABEL_147;
    if (self->_isInternalBuild)
    {
      if (!*((_BYTE *)v4 + 181))
        goto LABEL_147;
    }
    else if (*((_BYTE *)v4 + 181))
    {
      goto LABEL_147;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x400) != 0)
  {
    if ((v12 & 0x400) == 0 || self->_logType != *((_DWORD *)v4 + 29))
      goto LABEL_147;
  }
  else if ((v12 & 0x400) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_predictionAge != *((_DWORD *)v4 + 30))
      goto LABEL_147;
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_timeOfDayInterval != *((_DWORD *)v4 + 35))
      goto LABEL_147;
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v12 & 0x4000) == 0 || self->_totalAppActionAirplaneModeLaunches != *((_DWORD *)v4 + 36))
      goto LABEL_147;
  }
  else if ((v12 & 0x4000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x10000) != 0)
  {
    if ((v12 & 0x10000) == 0 || self->_totalAppActionCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 38))
      goto LABEL_147;
  }
  else if ((v12 & 0x10000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    if ((v12 & 0x80000) == 0 || self->_totalAppForAllActionsAirplaneModeLaunches != *((_DWORD *)v4 + 41))
      goto LABEL_147;
  }
  else if ((v12 & 0x80000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v12 & 0x200000) == 0 || self->_totalAppForAllActionsCurrentDayOfWeekLaunches != *((_DWORD *)v4 + 43))
      goto LABEL_147;
  }
  else if ((v12 & 0x200000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_uiFeedbackDelay != *((_DWORD *)v4 + 44))
      goto LABEL_147;
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_sessionLogVersion != *((_DWORD *)v4 + 34))
      goto LABEL_147;
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_147;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 5))
  {
    if (-[NSString isEqual:](abGroup, "isEqual:"))
    {
      v11 = self->_has;
      goto LABEL_108;
    }
    goto LABEL_147;
  }
LABEL_108:
  v14 = *((_DWORD *)v4 + 46);
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_appForAllActionsCoreMotionCurrentMotionLaunches != *((_DWORD *)v4 + 18))
      goto LABEL_147;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v14 & 0x100) == 0 || self->_locationDistanceFromHome != *((_DWORD *)v4 + 27))
      goto LABEL_147;
  }
  else if ((v14 & 0x100) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v14 & 0x200) == 0 || self->_locationDistanceFromWork != *((_DWORD *)v4 + 28))
      goto LABEL_147;
  }
  else if ((v14 & 0x200) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v14 & 0x20000) == 0 || self->_totalAppActionTimeOfDayLaunches != *((_DWORD *)v4 + 39))
      goto LABEL_147;
  }
  else if ((v14 & 0x20000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    if ((v14 & 0x40000) == 0 || self->_totalAppForAllActionTimeOfDayLaunches != *((_DWORD *)v4 + 40))
      goto LABEL_147;
  }
  else if ((v14 & 0x40000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v14 & 0x8000) == 0 || self->_totalAppActionCoarseTimeOfDayLaunches != *((_DWORD *)v4 + 37))
      goto LABEL_147;
  }
  else if ((v14 & 0x8000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_totalAppForAllActionsCoarseTimeOfDayLaunches != *((_DWORD *)v4 + 42))
      goto LABEL_147;
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_147;
  }
  appActionSequence = self->_appActionSequence;
  if ((unint64_t)appActionSequence | *((_QWORD *)v4 + 8)
    && !-[AWDProactiveAppPredictionAppActionSequence isEqual:](appActionSequence, "isEqual:"))
  {
    goto LABEL_147;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 16))
    v17 = -[NSString isEqual:](sessionId, "isEqual:");
  else
    v17 = 1;
LABEL_148:

  return v17;
}

- (unint64_t)hash
{
  $5CAA899F79A00F8F7A1746E0416806BD has;
  $5CAA899F79A00F8F7A1746E0416806BD v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  $5CAA899F79A00F8F7A1746E0416806BD v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v38 = 2654435761u * self->_timestamp;
  else
    v38 = 0;
  v37 = -[NSMutableArray hash](self->_actionDatas, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v36 = 2654435761 * self->_appActionCoreMotionCurrentMotionLaunches;
  else
    v36 = 0;
  v35 = -[AWDProactiveAppPredictionAppLaunchSequence hash](self->_appSequence, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
    v34 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_9;
LABEL_12:
    v33 = 0;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v34 = 2654435761 * self->_consumerSubType;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_12;
LABEL_9:
  v33 = 2654435761 * self->_currentLOIType;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_10:
    v32 = 2654435761 * self->_dayOfWeek;
    goto LABEL_14;
  }
LABEL_13:
  v32 = 0;
LABEL_14:
  v31 = PBRepeatedInt32Hash();
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
    v30 = 2654435761 * self->_engagementType;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
    {
LABEL_16:
      v29 = 2654435761 * self->_inAirplaneMode;
      if ((*(_BYTE *)&v4 & 0x80) != 0)
        goto LABEL_17;
      goto LABEL_30;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_DWORD *)&v4 & 0x800000) != 0)
      goto LABEL_16;
  }
  v29 = 0;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
LABEL_17:
    v28 = 2654435761 * self->_intentDonationDelay;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0)
      goto LABEL_18;
    goto LABEL_31;
  }
LABEL_30:
  v28 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_18:
    v27 = 2654435761 * self->_isInternalBuild;
    if ((*(_WORD *)&v4 & 0x400) != 0)
      goto LABEL_19;
    goto LABEL_32;
  }
LABEL_31:
  v27 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_19:
    v26 = 2654435761 * self->_logType;
    if ((*(_WORD *)&v4 & 0x800) != 0)
      goto LABEL_20;
    goto LABEL_33;
  }
LABEL_32:
  v26 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_20:
    v24 = 2654435761 * self->_predictionAge;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_21;
    goto LABEL_34;
  }
LABEL_33:
  v24 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_21:
    v5 = 2654435761 * self->_timeOfDayInterval;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_22;
    goto LABEL_35;
  }
LABEL_34:
  v5 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_22:
    v6 = 2654435761 * self->_totalAppActionAirplaneModeLaunches;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_23;
    goto LABEL_36;
  }
LABEL_35:
  v6 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_23:
    v7 = 2654435761 * self->_totalAppActionCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_24;
    goto LABEL_37;
  }
LABEL_36:
  v7 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_24:
    v8 = 2654435761 * self->_totalAppForAllActionsAirplaneModeLaunches;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
      goto LABEL_25;
    goto LABEL_38;
  }
LABEL_37:
  v8 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_25:
    v9 = 2654435761 * self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
    if ((*(_DWORD *)&v4 & 0x400000) != 0)
      goto LABEL_26;
LABEL_39:
    v10 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_27;
    goto LABEL_40;
  }
LABEL_38:
  v9 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0)
    goto LABEL_39;
LABEL_26:
  v10 = 2654435761 * self->_uiFeedbackDelay;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_27:
    v11 = 2654435761 * self->_sessionLogVersion;
    goto LABEL_41;
  }
LABEL_40:
  v11 = 0;
LABEL_41:
  v12 = -[NSString hash](self->_abGroup, "hash", v24);
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 4) != 0)
  {
    v14 = 2654435761 * self->_appForAllActionsCoreMotionCurrentMotionLaunches;
    if ((*(_WORD *)&v13 & 0x100) != 0)
    {
LABEL_43:
      v15 = 2654435761 * self->_locationDistanceFromHome;
      if ((*(_WORD *)&v13 & 0x200) != 0)
        goto LABEL_44;
      goto LABEL_51;
    }
  }
  else
  {
    v14 = 0;
    if ((*(_WORD *)&v13 & 0x100) != 0)
      goto LABEL_43;
  }
  v15 = 0;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
LABEL_44:
    v16 = 2654435761 * self->_locationDistanceFromWork;
    if ((*(_DWORD *)&v13 & 0x20000) != 0)
      goto LABEL_45;
    goto LABEL_52;
  }
LABEL_51:
  v16 = 0;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
LABEL_45:
    v17 = 2654435761 * self->_totalAppActionTimeOfDayLaunches;
    if ((*(_DWORD *)&v13 & 0x40000) != 0)
      goto LABEL_46;
    goto LABEL_53;
  }
LABEL_52:
  v17 = 0;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
LABEL_46:
    v18 = 2654435761 * self->_totalAppForAllActionTimeOfDayLaunches;
    if ((*(_WORD *)&v13 & 0x8000) != 0)
      goto LABEL_47;
LABEL_54:
    v19 = 0;
    if ((*(_DWORD *)&v13 & 0x100000) != 0)
      goto LABEL_48;
LABEL_55:
    v20 = 0;
    goto LABEL_56;
  }
LABEL_53:
  v18 = 0;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
    goto LABEL_54;
LABEL_47:
  v19 = 2654435761 * self->_totalAppActionCoarseTimeOfDayLaunches;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
    goto LABEL_55;
LABEL_48:
  v20 = 2654435761 * self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
LABEL_56:
  v21 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  v22 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[AWDProactiveAppPredictionAppActionSequence hash](self->_appActionSequence, "hash");
  return v21 ^ v22 ^ -[NSString hash](self->_sessionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  AWDProactiveAppPredictionAppLaunchSequence *appSequence;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  int v17;
  int v18;
  AWDProactiveAppPredictionAppActionSequence *appActionSequence;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 184) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[AWDProactiveAppPredictionIntentPredictionSession addActionData:](self, "addActionData:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if ((*((_BYTE *)v5 + 184) & 2) != 0)
  {
    self->_appActionCoreMotionCurrentMotionLaunches = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 2u;
  }
  appSequence = self->_appSequence;
  v12 = *((_QWORD *)v5 + 10);
  if (appSequence)
  {
    if (v12)
      -[AWDProactiveAppPredictionAppLaunchSequence mergeFrom:](appSequence, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDProactiveAppPredictionIntentPredictionSession setAppSequence:](self, "setAppSequence:");
  }
  v13 = *((_DWORD *)v5 + 46);
  if ((v13 & 8) != 0)
  {
    self->_consumerSubType = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 8u;
    v13 = *((_DWORD *)v5 + 46);
    if ((v13 & 0x10) == 0)
    {
LABEL_19:
      if ((v13 & 0x20) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_currentLOIType = *((_DWORD *)v5 + 23);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v5 + 46) & 0x20) != 0)
  {
LABEL_20:
    self->_dayOfWeek = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_21:
  v14 = objc_msgSend(v5, "engagedActionCacheIndicesCount", (_QWORD)v21);
  if (v14)
  {
    v15 = v14;
    for (j = 0; j != v15; ++j)
      -[AWDProactiveAppPredictionIntentPredictionSession addEngagedActionCacheIndices:](self, "addEngagedActionCacheIndices:", objc_msgSend(v5, "engagedActionCacheIndicesAtIndex:", j));
  }
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x40) != 0)
  {
    self->_engagementType = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x40u;
    v17 = *((_DWORD *)v5 + 46);
    if ((v17 & 0x800000) == 0)
    {
LABEL_26:
      if ((v17 & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_56;
    }
  }
  else if ((v17 & 0x800000) == 0)
  {
    goto LABEL_26;
  }
  self->_inAirplaneMode = *((_BYTE *)v5 + 180);
  *(_DWORD *)&self->_has |= 0x800000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x80) == 0)
  {
LABEL_27:
    if ((v17 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_57;
  }
LABEL_56:
  self->_intentDonationDelay = *((_DWORD *)v5 + 26);
  *(_DWORD *)&self->_has |= 0x80u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v17 & 0x400) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_57:
  self->_isInternalBuild = *((_BYTE *)v5 + 181);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x400) == 0)
  {
LABEL_29:
    if ((v17 & 0x800) == 0)
      goto LABEL_30;
    goto LABEL_59;
  }
LABEL_58:
  self->_logType = *((_DWORD *)v5 + 29);
  *(_DWORD *)&self->_has |= 0x400u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x800) == 0)
  {
LABEL_30:
    if ((v17 & 0x2000) == 0)
      goto LABEL_31;
    goto LABEL_60;
  }
LABEL_59:
  self->_predictionAge = *((_DWORD *)v5 + 30);
  *(_DWORD *)&self->_has |= 0x800u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x2000) == 0)
  {
LABEL_31:
    if ((v17 & 0x4000) == 0)
      goto LABEL_32;
    goto LABEL_61;
  }
LABEL_60:
  self->_timeOfDayInterval = *((_DWORD *)v5 + 35);
  *(_DWORD *)&self->_has |= 0x2000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x4000) == 0)
  {
LABEL_32:
    if ((v17 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  self->_totalAppActionAirplaneModeLaunches = *((_DWORD *)v5 + 36);
  *(_DWORD *)&self->_has |= 0x4000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x10000) == 0)
  {
LABEL_33:
    if ((v17 & 0x80000) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  self->_totalAppActionCurrentDayOfWeekLaunches = *((_DWORD *)v5 + 38);
  *(_DWORD *)&self->_has |= 0x10000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x80000) == 0)
  {
LABEL_34:
    if ((v17 & 0x200000) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  self->_totalAppForAllActionsAirplaneModeLaunches = *((_DWORD *)v5 + 41);
  *(_DWORD *)&self->_has |= 0x80000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x200000) == 0)
  {
LABEL_35:
    if ((v17 & 0x400000) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  self->_totalAppForAllActionsCurrentDayOfWeekLaunches = *((_DWORD *)v5 + 43);
  *(_DWORD *)&self->_has |= 0x200000u;
  v17 = *((_DWORD *)v5 + 46);
  if ((v17 & 0x400000) == 0)
  {
LABEL_36:
    if ((v17 & 0x1000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_65:
  self->_uiFeedbackDelay = *((_DWORD *)v5 + 44);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v5 + 46) & 0x1000) != 0)
  {
LABEL_37:
    self->_sessionLogVersion = *((_DWORD *)v5 + 34);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_38:
  if (*((_QWORD *)v5 + 5))
    -[AWDProactiveAppPredictionIntentPredictionSession setAbGroup:](self, "setAbGroup:");
  v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 4) != 0)
  {
    self->_appForAllActionsCoreMotionCurrentMotionLaunches = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 4u;
    v18 = *((_DWORD *)v5 + 46);
    if ((v18 & 0x100) == 0)
    {
LABEL_42:
      if ((v18 & 0x200) == 0)
        goto LABEL_43;
      goto LABEL_69;
    }
  }
  else if ((v18 & 0x100) == 0)
  {
    goto LABEL_42;
  }
  self->_locationDistanceFromHome = *((_DWORD *)v5 + 27);
  *(_DWORD *)&self->_has |= 0x100u;
  v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x200) == 0)
  {
LABEL_43:
    if ((v18 & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_70;
  }
LABEL_69:
  self->_locationDistanceFromWork = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_has |= 0x200u;
  v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x20000) == 0)
  {
LABEL_44:
    if ((v18 & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_71;
  }
LABEL_70:
  self->_totalAppActionTimeOfDayLaunches = *((_DWORD *)v5 + 39);
  *(_DWORD *)&self->_has |= 0x20000u;
  v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x40000) == 0)
  {
LABEL_45:
    if ((v18 & 0x8000) == 0)
      goto LABEL_46;
    goto LABEL_72;
  }
LABEL_71:
  self->_totalAppForAllActionTimeOfDayLaunches = *((_DWORD *)v5 + 40);
  *(_DWORD *)&self->_has |= 0x40000u;
  v18 = *((_DWORD *)v5 + 46);
  if ((v18 & 0x8000) == 0)
  {
LABEL_46:
    if ((v18 & 0x100000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_72:
  self->_totalAppActionCoarseTimeOfDayLaunches = *((_DWORD *)v5 + 37);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 46) & 0x100000) != 0)
  {
LABEL_47:
    self->_totalAppForAllActionsCoarseTimeOfDayLaunches = *((_DWORD *)v5 + 42);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_48:
  appActionSequence = self->_appActionSequence;
  v20 = *((_QWORD *)v5 + 8);
  if (appActionSequence)
  {
    if (v20)
      -[AWDProactiveAppPredictionAppActionSequence mergeFrom:](appActionSequence, "mergeFrom:");
  }
  else if (v20)
  {
    -[AWDProactiveAppPredictionIntentPredictionSession setAppActionSequence:](self, "setAppActionSequence:");
  }
  if (*((_QWORD *)v5 + 16))
    -[AWDProactiveAppPredictionIntentPredictionSession setSessionId:](self, "setSessionId:");

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)actionDatas
{
  return self->_actionDatas;
}

- (void)setActionDatas:(id)a3
{
  objc_storeStrong((id *)&self->_actionDatas, a3);
}

- (int)appActionCoreMotionCurrentMotionLaunches
{
  return self->_appActionCoreMotionCurrentMotionLaunches;
}

- (AWDProactiveAppPredictionAppLaunchSequence)appSequence
{
  return self->_appSequence;
}

- (void)setAppSequence:(id)a3
{
  objc_storeStrong((id *)&self->_appSequence, a3);
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (int)intentDonationDelay
{
  return self->_intentDonationDelay;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (int)logType
{
  return self->_logType;
}

- (int)predictionAge
{
  return self->_predictionAge;
}

- (int)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (int)totalAppActionAirplaneModeLaunches
{
  return self->_totalAppActionAirplaneModeLaunches;
}

- (int)totalAppActionCurrentDayOfWeekLaunches
{
  return self->_totalAppActionCurrentDayOfWeekLaunches;
}

- (int)totalAppForAllActionsAirplaneModeLaunches
{
  return self->_totalAppForAllActionsAirplaneModeLaunches;
}

- (int)totalAppForAllActionsCurrentDayOfWeekLaunches
{
  return self->_totalAppForAllActionsCurrentDayOfWeekLaunches;
}

- (int)uiFeedbackDelay
{
  return self->_uiFeedbackDelay;
}

- (int)sessionLogVersion
{
  return self->_sessionLogVersion;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (int)appForAllActionsCoreMotionCurrentMotionLaunches
{
  return self->_appForAllActionsCoreMotionCurrentMotionLaunches;
}

- (int)locationDistanceFromHome
{
  return self->_locationDistanceFromHome;
}

- (int)locationDistanceFromWork
{
  return self->_locationDistanceFromWork;
}

- (int)totalAppActionTimeOfDayLaunches
{
  return self->_totalAppActionTimeOfDayLaunches;
}

- (int)totalAppForAllActionTimeOfDayLaunches
{
  return self->_totalAppForAllActionTimeOfDayLaunches;
}

- (int)totalAppActionCoarseTimeOfDayLaunches
{
  return self->_totalAppActionCoarseTimeOfDayLaunches;
}

- (int)totalAppForAllActionsCoarseTimeOfDayLaunches
{
  return self->_totalAppForAllActionsCoarseTimeOfDayLaunches;
}

- (AWDProactiveAppPredictionAppActionSequence)appActionSequence
{
  return self->_appActionSequence;
}

- (void)setAppActionSequence:(id)a3
{
  objc_storeStrong((id *)&self->_appActionSequence, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_appSequence, 0);
  objc_storeStrong((id *)&self->_appActionSequence, 0);
  objc_storeStrong((id *)&self->_actionDatas, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
