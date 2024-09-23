@implementation AWDProactiveAppPredictionActionTimeEstimateContainer

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveAppPredictionActionTimeEstimateContainer;
  -[AWDProactiveAppPredictionActionTimeEstimateContainer dealloc](&v3, sel_dealloc);
}

- (int)actionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E82DBBA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeIntent")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeNSUserActivity")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeOFA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeMax")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeUnknown")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXActionTypeUAUserActivityProxy")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearParameters
{
  -[NSMutableArray removeAllObjects](self->_parameters, "removeAllObjects");
}

- (void)addParameter:(id)a3
{
  id v4;
  NSMutableArray *parameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameters = self->_parameters;
  v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_parameters;
    self->_parameters = v6;

    v4 = v8;
    parameters = self->_parameters;
  }
  -[NSMutableArray addObject:](parameters, "addObject:", v4);

}

- (unint64_t)parametersCount
{
  return -[NSMutableArray count](self->_parameters, "count");
}

- (id)parameterAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_parameters, "objectAtIndex:", a3);
}

+ (Class)parameterType
{
  return (Class)objc_opt_class();
}

- (unint64_t)timeEstimatesCount
{
  return self->_timeEstimates.count;
}

- (int)timeEstimates
{
  return self->_timeEstimates.list;
}

- (void)clearTimeEstimates
{
  PBRepeatedInt32Clear();
}

- (void)addTimeEstimate:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)timeEstimateAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_timeEstimates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_timeEstimates = &self->_timeEstimates;
  count = self->_timeEstimates.count;
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
  return p_timeEstimates->list[a3];
}

- (void)setTimeEstimates:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)sessionLengthsCount
{
  return self->_sessionLengths.count;
}

- (int)sessionLengths
{
  return self->_sessionLengths.list;
}

- (void)clearSessionLengths
{
  PBRepeatedInt32Clear();
}

- (void)addSessionLength:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)sessionLengthAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_sessionLengths;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_sessionLengths = &self->_sessionLengths;
  count = self->_sessionLengths.count;
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
  return p_sessionLengths->list[a3];
}

- (void)setSessionLengths:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)sessionIndexsCount
{
  return self->_sessionIndexs.count;
}

- (int)sessionIndexs
{
  return self->_sessionIndexs.list;
}

- (void)clearSessionIndexs
{
  PBRepeatedInt32Clear();
}

- (void)addSessionIndex:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)sessionIndexAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_sessionIndexs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_sessionIndexs = &self->_sessionIndexs;
  count = self->_sessionIndexs.count;
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
  return p_sessionIndexs->list[a3];
}

- (void)setSessionIndexs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setNoMatchCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_noMatchCount = a3;
}

- (void)setHasNoMatchCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNoMatchCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)launchReasonsCount
{
  return self->_launchReasons.count;
}

- (int)launchReasons
{
  return self->_launchReasons.list;
}

- (void)clearLaunchReasons
{
  PBRepeatedInt32Clear();
}

- (void)addLaunchReason:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)launchReasonAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_launchReasons;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_launchReasons = &self->_launchReasons;
  count = self->_launchReasons.count;
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
  return p_launchReasons->list[a3];
}

- (void)setLaunchReasons:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)launchReasonsAsString:(int)a3
{
  if (a3 < 0x35)
    return off_1E82DBBD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaunchReasons:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonPrefix")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonHomeScreen")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonSpotlight")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonAppSwitcher")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonSideAppSwitcher")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonNotificationCenter")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonControlCenter")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonNotification")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonLockScreen")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonSiri")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonCarPlay")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonSystemGesture")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonExternalRequest")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBreadcrumb")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonCommandTab")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonAccessibility")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonWidget")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonFloatingDock")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonFloatingDockRecents")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonFloatingApplication")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonFloatingDockAppSuggestion")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightPrefix")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightProgrammatic")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightHomeButton")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightLockButton")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightVolumeButton")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightOtherButton")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightKeyboard")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightSmartCover")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightIdleTimer")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightTouch")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightPlugin")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightCar")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightNotification")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightProx")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightSiri")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightBoot")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightPocketState")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightExternalRequest")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightExternalAppRequest")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightSpringBoardRequest")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightLiftToWake")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightLogout")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightNotificationCenter")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightACPowerChange")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightChargingAccessoryChange")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightRestoring")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightAlert")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightLanguageChange")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightUnknownUserEvent")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightCoverSheet")) & 1) != 0)
  {
    v4 = 51;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATXLaunchReasonBacklightSOSDismiss")))
  {
    v4 = 52;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)AWDProactiveAppPredictionActionTimeEstimateContainer;
  -[AWDProactiveAppPredictionActionTimeEstimateContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppPredictionActionTimeEstimateContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *actionKey;
  uint64_t actionType;
  __CFString *v7;
  NSMutableArray *parameters;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_launchReasons;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  actionKey = self->_actionKey;
  if (actionKey)
    objc_msgSend(v3, "setObject:forKey:", actionKey, CFSTR("actionKey"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionType = self->_actionType;
    if (actionType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E82DBBA0[actionType];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actionType"));

  }
  parameters = self->_parameters;
  if (parameters)
    objc_msgSend(v4, "setObject:forKey:", parameters, CFSTR("parameter"));
  PBRepeatedInt32NSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("timeEstimate"));

  PBRepeatedInt32NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sessionLength"));

  PBRepeatedInt32NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("sessionIndex"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_noMatchCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("noMatchCount"));

  }
  p_launchReasons = &self->_launchReasons;
  if (self->_launchReasons.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (p_launchReasons->count)
    {
      v15 = 0;
      do
      {
        v16 = p_launchReasons->list[v15];
        if (v16 >= 0x35)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_launchReasons->list[v15]);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = off_1E82DBBD0[v16];
        }
        objc_msgSend(v14, "addObject:", v17);

        ++v15;
      }
      while (v15 < p_launchReasons->count);
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("launchReason"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionActionTimeEstimateContainerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_launchReasons;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_actionKey)
    -[AWDProactiveAppPredictionActionTimeEstimateContainer writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_parameters;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (self->_timeEstimates.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_timeEstimates.count);
  }
  if (self->_sessionLengths.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_sessionLengths.count);
  }
  if (self->_sessionIndexs.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < self->_sessionIndexs.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  p_launchReasons = &self->_launchReasons;
  if (p_launchReasons->count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v15;
    }
    while (v15 < p_launchReasons->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "setActionKey:", self->_actionKey);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v20 + 28) = self->_actionType;
    *((_BYTE *)v20 + 128) |= 1u;
  }
  if (-[AWDProactiveAppPredictionActionTimeEstimateContainer parametersCount](self, "parametersCount"))
  {
    objc_msgSend(v20, "clearParameters");
    v4 = -[AWDProactiveAppPredictionActionTimeEstimateContainer parametersCount](self, "parametersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[AWDProactiveAppPredictionActionTimeEstimateContainer parameterAtIndex:](self, "parameterAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addParameter:", v7);

      }
    }
  }
  if (-[AWDProactiveAppPredictionActionTimeEstimateContainer timeEstimatesCount](self, "timeEstimatesCount"))
  {
    objc_msgSend(v20, "clearTimeEstimates");
    v8 = -[AWDProactiveAppPredictionActionTimeEstimateContainer timeEstimatesCount](self, "timeEstimatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v20, "addTimeEstimate:", -[AWDProactiveAppPredictionActionTimeEstimateContainer timeEstimateAtIndex:](self, "timeEstimateAtIndex:", j));
    }
  }
  if (-[AWDProactiveAppPredictionActionTimeEstimateContainer sessionLengthsCount](self, "sessionLengthsCount"))
  {
    objc_msgSend(v20, "clearSessionLengths");
    v11 = -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionLengthsCount](self, "sessionLengthsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v20, "addSessionLength:", -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionLengthAtIndex:](self, "sessionLengthAtIndex:", k));
    }
  }
  if (-[AWDProactiveAppPredictionActionTimeEstimateContainer sessionIndexsCount](self, "sessionIndexsCount"))
  {
    objc_msgSend(v20, "clearSessionIndexs");
    v14 = -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionIndexsCount](self, "sessionIndexsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(v20, "addSessionIndex:", -[AWDProactiveAppPredictionActionTimeEstimateContainer sessionIndexAtIndex:](self, "sessionIndexAtIndex:", m));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v20 + 29) = self->_noMatchCount;
    *((_BYTE *)v20 + 128) |= 2u;
  }
  if (-[AWDProactiveAppPredictionActionTimeEstimateContainer launchReasonsCount](self, "launchReasonsCount"))
  {
    objc_msgSend(v20, "clearLaunchReasons");
    v17 = -[AWDProactiveAppPredictionActionTimeEstimateContainer launchReasonsCount](self, "launchReasonsCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(v20, "addLaunchReason:", -[AWDProactiveAppPredictionActionTimeEstimateContainer launchReasonAtIndex:](self, "launchReasonAtIndex:", n));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_actionKey, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_actionType;
    *(_BYTE *)(v5 + 128) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_parameters;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addParameter:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_noMatchCount;
    *(_BYTE *)(v5 + 128) |= 2u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *actionKey;
  NSMutableArray *parameters;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  actionKey = self->_actionKey;
  if ((unint64_t)actionKey | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](actionKey, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 28))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 128) & 1) != 0)
  {
LABEL_20:
    IsEqual = 0;
    goto LABEL_21;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((_QWORD *)v4 + 15)
    && !-[NSMutableArray isEqual:](parameters, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 128) & 2) == 0 || self->_noMatchCount != *((_DWORD *)v4 + 29))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
    goto LABEL_20;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_21:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_actionKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_actionType;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_parameters, "hash");
  v6 = PBRepeatedInt32Hash();
  v7 = PBRepeatedInt32Hash();
  v8 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_noMatchCount;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  uint64_t v16;
  uint64_t v17;
  uint64_t m;
  uint64_t v19;
  uint64_t v20;
  uint64_t n;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 13))
    -[AWDProactiveAppPredictionActionTimeEstimateContainer setActionKey:](self, "setActionKey:");
  if ((*((_BYTE *)v4 + 128) & 1) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 28);
    *(_BYTE *)&self->_has |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 15);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[AWDProactiveAppPredictionActionTimeEstimateContainer addParameter:](self, "addParameter:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v10 = objc_msgSend(v4, "timeEstimatesCount");
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addTimeEstimate:](self, "addTimeEstimate:", objc_msgSend(v4, "timeEstimateAtIndex:", j, (_QWORD)v22));
  }
  v13 = objc_msgSend(v4, "sessionLengthsCount", (_QWORD)v22);
  if (v13)
  {
    v14 = v13;
    for (k = 0; k != v14; ++k)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionLength:](self, "addSessionLength:", objc_msgSend(v4, "sessionLengthAtIndex:", k));
  }
  v16 = objc_msgSend(v4, "sessionIndexsCount");
  if (v16)
  {
    v17 = v16;
    for (m = 0; m != v17; ++m)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addSessionIndex:](self, "addSessionIndex:", objc_msgSend(v4, "sessionIndexAtIndex:", m));
  }
  if ((*((_BYTE *)v4 + 128) & 2) != 0)
  {
    self->_noMatchCount = *((_DWORD *)v4 + 29);
    *(_BYTE *)&self->_has |= 2u;
  }
  v19 = objc_msgSend(v4, "launchReasonsCount");
  if (v19)
  {
    v20 = v19;
    for (n = 0; n != v20; ++n)
      -[AWDProactiveAppPredictionActionTimeEstimateContainer addLaunchReason:](self, "addLaunchReason:", objc_msgSend(v4, "launchReasonAtIndex:", n));
  }

}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void)setActionKey:(id)a3
{
  objc_storeStrong((id *)&self->_actionKey, a3);
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (int)noMatchCount
{
  return self->_noMatchCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[AWDProactiveAppPredictionActionTimeEstimateContainer writeTo:]", "AWDProactiveAppPredictionActionTimeEstimateContainer.m", 402, "nil != self->_actionKey");
}

@end
