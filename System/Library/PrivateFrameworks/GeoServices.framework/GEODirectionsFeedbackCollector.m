@implementation GEODirectionsFeedbackCollector

- (GEODirectionsFeedbackCollector)init
{
  GEODirectionsFeedbackCollector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsFeedbackCollector;
  result = -[GEODirectionsFeedbackCollector init](&v3, sel_init);
  if (result)
    result->_transportType = 4;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[GEODirectionsFeedbackCollector reset](self, "reset");
  v3.receiver = self;
  v3.super_class = (Class)GEODirectionsFeedbackCollector;
  -[GEODirectionsFeedbackCollector dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  NSNumber *stateOfChargeAtOrigin;
  NSNumber *stateOfChargeAtDestPredicted;
  NSNumber *stateOfChargeAtDestActual;
  NSArray *waypoints;
  NSString *evConsumptionModel;
  NSString *evChargingModel;
  GEODirectionsFeedbackLogMessage *currentFeedbackLogMessage;
  NSNumber *isVLFImprovementUsed;
  NSNumber *arWalkingUsedInRoutePlanning;
  NSNumber *arWalkingUsedInNavigation;
  NSNumber *isHandsFreeProfileUsed;

  *(_WORD *)&self->_isEVRoute = 0;
  self->_batteryDied = 0;
  stateOfChargeAtOrigin = self->_stateOfChargeAtOrigin;
  self->_stateOfChargeAtOrigin = 0;

  stateOfChargeAtDestPredicted = self->_stateOfChargeAtDestPredicted;
  self->_stateOfChargeAtDestPredicted = 0;

  stateOfChargeAtDestActual = self->_stateOfChargeAtDestActual;
  self->_stateOfChargeAtDestActual = 0;

  waypoints = self->_waypoints;
  self->_waypoints = 0;

  evConsumptionModel = self->_evConsumptionModel;
  self->_evConsumptionModel = 0;

  evChargingModel = self->_evChargingModel;
  self->_evChargingModel = 0;

  currentFeedbackLogMessage = self->_currentFeedbackLogMessage;
  self->_currentFeedbackLogMessage = 0;

  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  self->_isVLFImprovementUsed = 0;

  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  self->_arWalkingUsedInRoutePlanning = 0;

  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  self->_arWalkingUsedInNavigation = 0;

  self->_transportType = 4;
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  self->_isHandsFreeProfileUsed = 0;

  -[GEODirectionsFeedbackCollector setCurrentDirectionsFeedback:](self, "setCurrentDirectionsFeedback:", 0);
}

- (BOOL)hasActiveFeedbackSession
{
  void *v2;
  BOOL v3;

  -[GEODirectionsFeedbackCollector currentFeedbackLogMessage](self, "currentFeedbackLogMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updateFeedbackSessionWithResponseID:(id)a3
{
  id v4;
  GEODirectionsFeedback *v5;
  GEODirectionsFeedbackLogMessage *v6;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentFeedbackLogMessage](self, "currentFeedbackLogMessage");
  v6 = (GEODirectionsFeedbackLogMessage *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(GEODirectionsFeedbackLogMessage);
    -[GEODirectionsFeedbackCollector setCurrentFeedbackLogMessage:](self, "setCurrentFeedbackLogMessage:");
  }
  v5 = objc_alloc_init(GEODirectionsFeedback);
  -[GEODirectionsFeedback setDirectionResponseID:](v5, "setDirectionResponseID:", v4);

  -[GEODirectionsFeedback setIsCarplayConnected:](v5, "setIsCarplayConnected:", self->_wasEverConnectedToCarplay);
  -[GEODirectionsFeedbackCollector setCurrentDirectionsFeedback:](self, "setCurrentDirectionsFeedback:", v5);
  -[GEODirectionsFeedbackLogMessage addDirectionsFeedback:](v6, "addDirectionsFeedback:", v5);

}

- (void)startFeedbackSessionForResponseID:(id)a3 withNavigationType:(int)a4
{
  uint64_t v4;
  NSMutableArray *v6;
  NSMutableArray *navigationModes;
  GEODurationInNavigationMode *v8;

  v4 = *(_QWORD *)&a4;
  -[GEODirectionsFeedbackCollector _updateFeedbackSessionWithResponseID:](self, "_updateFeedbackSessionWithResponseID:", a3);
  self->_currentDirectionsModeStartTime = CFAbsoluteTimeGetCurrent();
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  navigationModes = self->_navigationModes;
  self->_navigationModes = v6;

  v8 = objc_alloc_init(GEODurationInNavigationMode);
  -[GEODurationInNavigationMode setType:](v8, "setType:", v4);
  -[NSMutableArray addObject:](self->_navigationModes, "addObject:", v8);

}

- (void)setOriginalExpectedTime:(double)a3
{
  self->_originalExpectedTime = a3;
}

- (void)setTripOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_tripOrigin, a3);
}

- (void)setWasEverConnectedToCarplay:(BOOL)a3
{
  self->_wasEverConnectedToCarplay = a3;
  -[GEODirectionsFeedback setIsCarplayConnected:](self->_currentDirectionsFeedback, "setIsCarplayConnected:");
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (void)addGuidanceEventFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGuidanceFeedback:", v4);

}

- (void)addStepFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addStepFeedback:", v4);

}

- (void)addRouteID:(id)a3 routeIndex:(unsigned int)a4 stepID:(unsigned int)a5 completeStep:(BOOL)a6
{
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;
  GEOStepFeedback *v12;

  if (a3)
  {
    v6 = *(_QWORD *)&a5;
    if (a5 != -1)
    {
      v7 = a6;
      v8 = *(_QWORD *)&a4;
      v10 = a3;
      v12 = objc_alloc_init(GEOStepFeedback);
      -[GEOStepFeedback setStepID:](v12, "setStepID:", v6);
      -[GEOStepFeedback setCompletionTimeStamp:](v12, "setCompletionTimeStamp:", CFAbsoluteTimeGetCurrent());
      -[GEOStepFeedback setCompletedStep:](v12, "setCompletedStep:", v7);
      -[GEOStepFeedback setRouteID:](v12, "setRouteID:", v10);

      -[GEOStepFeedback setRouteIndex:](v12, "setRouteIndex:", v8);
      -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addStepFeedback:", v12);

    }
  }
}

- (void)addTrafficRerouteFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTrafficRerouteFeedback:", v4);

}

- (void)setFinalLocation:(id)a3 asArrival:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[GEODirectionsFeedbackLogMessage arrivedAtDestination](self->_currentFeedbackLogMessage, "arrivedAtDestination");

    if (!v8)
    {
      -[GEODirectionsFeedbackLogMessage setFinalLocation:](self->_currentFeedbackLogMessage, "setFinalLocation:", v9);
      -[GEODirectionsFeedbackLogMessage setArrivedAtDestination:](self->_currentFeedbackLogMessage, "setArrivedAtDestination:", v4);
    }
  }

}

- (void)setHasEnteredPreArrivalMode:(BOOL)a3
{
  self->_hasEnteredPreArrivalMode = a3;
}

- (void)addAlightNotificationFeedback:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAlightNotificationFeedback:", v4);

}

- (void)setAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  void *v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];

  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v5)
    {
      v6 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
      v7 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
      v8[0] = v6;
      *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
      -[GEODirectionsFeedbackLogMessage setNavigationAudioFeedback:](self->_currentFeedbackLogMessage, "setNavigationAudioFeedback:", &v7);
    }
  }
}

- (void)setVoiceGuidanceLevel:(int)a3
{
  self->_voiceGuidanceLevel = a3;
}

- (void)setIsHandsFreeProfileUsed:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isHandsFreeProfileUsed;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  self->_isHandsFreeProfileUsed = v4;

}

- (void)setModalities:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GEODirectionsFeedbackCollector currentDirectionsFeedback](self, "currentDirectionsFeedback");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalitys:", v4);

}

- (void)setIsVLFImprovementUsed:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *isVLFImprovementUsed;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  self->_isVLFImprovementUsed = v4;

}

- (void)setARWalkingUsedInRoutePlanning:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *arWalkingUsedInRoutePlanning;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  self->_arWalkingUsedInRoutePlanning = v4;

}

- (void)setARWalkingUsedInNavigation:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *arWalkingUsedInNavigation;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  self->_arWalkingUsedInNavigation = v4;

}

- (void)setChargingStopAdded:(BOOL)a3
{
  self->_chargingStopAdded = a3;
}

- (void)changeNavigationType:(int)a3
{
  uint64_t v3;
  double currentDirectionsModeStartTime;
  double Current;
  double v7;
  GEODurationInNavigationMode *v8;
  id v9;

  v3 = *(_QWORD *)&a3;
  currentDirectionsModeStartTime = self->_currentDirectionsModeStartTime;
  Current = CFAbsoluteTimeGetCurrent();
  self->_currentDirectionsModeStartTime = Current;
  v7 = Current - currentDirectionsModeStartTime;
  -[NSMutableArray lastObject](self->_navigationModes, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDuration:", v7);
  v8 = objc_alloc_init(GEODurationInNavigationMode);
  -[GEODurationInNavigationMode setType:](v8, "setType:", v3);
  -[NSMutableArray addObject:](self->_navigationModes, "addObject:", v8);

}

- (void)setIsCoarseLocationUsed:(BOOL)a3
{
  self->_isCoarseLocationUsed = a3;
}

- (void)endFeedbackSessionWithTracePath:(id)a3
{
  id v4;
  void *v5;
  CFAbsoluteTime v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEODirectionsFeedbackLogMessage *currentFeedbackLogMessage;
  double v13;
  double v14;
  double v15;
  NSNumber *stateOfChargeAtDestActual;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  GEODirectionsFeedbackLogMessage *v22;
  void *v23;
  GEOLocation *parkingDetectionLocation;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t Integer;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSNumber *arWalkingUsedInNavigation;
  void *v42;
  void *v43;
  NSNumber *isHandsFreeProfileUsed;
  int voiceGuidanceLevel;
  int transportType;
  NSNumber *arWalkingUsedInRoutePlanning;
  NSString *evChargingModel;
  __int128 v49;
  NSNumber *v50;
  __int128 v51;
  BOOL v52;
  GEOLatLng *tripOrigin;
  uint64_t v54;
  NSNumber *isVLFImprovementUsed;
  NSMutableArray *navigationModes;
  _BOOL4 isEVRoute;
  GEOLocation *arrivalLocation;
  id GEOAPPortalClass;
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
  _OWORD v76[3];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_currentFeedbackLogMessage)
    goto LABEL_34;
  v61 = v4;
  v6 = CFAbsoluteTimeGetCurrent() - self->_currentDirectionsModeStartTime;
  -[NSMutableArray lastObject](self->_navigationModes, "lastObject");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDuration:", v6);
  -[GEODirectionsFeedbackLogMessage setDurationOfTrip:](self->_currentFeedbackLogMessage, "setDurationOfTrip:", 0.0);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v7 = self->_navigationModes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v78 != v10)
          objc_enumerationMutation(v7);
        currentFeedbackLogMessage = self->_currentFeedbackLogMessage;
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "duration");
        v14 = v13;
        -[GEODirectionsFeedbackLogMessage durationOfTrip](currentFeedbackLogMessage, "durationOfTrip");
        -[GEODirectionsFeedbackLogMessage setDurationOfTrip:](currentFeedbackLogMessage, "setDurationOfTrip:", v14 + v15);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
    }
    while (v9);
  }

  stateOfChargeAtDestActual = self->_stateOfChargeAtDestActual;
  if (stateOfChargeAtDestActual && self->_stateOfChargeAtDestPredicted)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[NSNumber doubleValue](stateOfChargeAtDestActual, "doubleValue");
    v19 = v18;
    -[NSNumber doubleValue](self->_stateOfChargeAtDestPredicted, "doubleValue");
    objc_msgSend(v17, "numberWithUnsignedInt:", vabdd_f64(v19, v20));
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  GEOAPPortalClass = getGEOAPPortalClass();
  -[GEODirectionsFeedbackLogMessage directionsFeedbacks](self->_currentFeedbackLogMessage, "directionsFeedbacks");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsFeedbackLogMessage finalLocation](self->_currentFeedbackLogMessage, "finalLocation");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  arrivalLocation = self->_arrivalLocation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEODirectionsFeedbackLogMessage arrivedAtDestination](self->_currentFeedbackLogMessage, "arrivedAtDestination"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_currentFeedbackLogMessage;
  if (v22)
  {
    -[GEODirectionsFeedbackLogMessage navigationAudioFeedback](v22, "navigationAudioFeedback");
    v22 = self->_currentFeedbackLogMessage;
  }
  else
  {
    memset(v76, 0, 44);
  }
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[GEODirectionsFeedbackLogMessage durationOfTrip](v22, "durationOfTrip");
  objc_msgSend(v23, "numberWithDouble:");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  navigationModes = self->_navigationModes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEnteredPreArrivalMode);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalExpectedTime);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  isVLFImprovementUsed = self->_isVLFImprovementUsed;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCoarseLocationUsed);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_batteryDied);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_chargingStopAdded);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  tripOrigin = self->_tripOrigin;
  isEVRoute = self->_isEVRoute;
  v75 = (void *)v21;
  if (self->_isEVRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBadEvExperience);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isEVRoute)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBadEvExperience);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isEVRoute)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GEODirectionsFeedbackCollector _canSampleBadEvTrip](self, "_canSampleBadEvTrip"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0;
        v52 = self->_isEVRoute;
      }
      else
      {
        v52 = 0;
        v54 = 0x100000000;
        v62 = 0;
      }
      goto LABEL_23;
    }
    v52 = 0;
    v63 = 0;
  }
  else
  {
    v52 = 0;
    v63 = 0;
    v64 = 0;
  }
  v62 = 0;
  v54 = 0x100000001;
LABEL_23:
  v51 = *(_OWORD *)&self->_stateOfChargeAtOrigin;
  v50 = self->_stateOfChargeAtDestActual;
  v49 = *(_OWORD *)&self->_waypoints;
  arWalkingUsedInRoutePlanning = self->_arWalkingUsedInRoutePlanning;
  evChargingModel = self->_evChargingModel;
  arWalkingUsedInNavigation = self->_arWalkingUsedInNavigation;
  transportType = self->_transportType;
  voiceGuidanceLevel = self->_voiceGuidanceLevel;
  isHandsFreeProfileUsed = self->_isHandsFreeProfileUsed;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endReason == 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endReason == 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endReason == 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_endReason == 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  parkingDetectionLocation = self->_parkingDetectionLocation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeBetweenParkedAndArrival);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_arrivedAtDestinationCount);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inParkingModeCount);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enteredParkingMode);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSuggestWalkingRoute);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userDidAcceptWalkingRoute);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSuggestFindMy);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userDidLaunchFindMy);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = voiceGuidanceLevel;
  HIDWORD(v36) = transportType;
  LOBYTE(v36) = v52;
  objc_msgSend(GEOAPPortalClass, "captureDirectionsWithDirectionsFeedbacks:finalLocation:arrivalLocation:arrivedAtDestination:navigationAudioFeedback:durationOfTrip:durationInNavigationModes:preArrival:originalEta:isVlfImprovementUsed:isCoarseLocationUsed:acceptedCyclingWorkout:batteryDied:chargingStopAdded:isSiriEngaged:tripOrigin:wasBadRouteExperience:isBadEvExperience:isEvSampleTrip:stateOfChargeAtOrigin:stateOfChargeAtDestPredicted:stateOfChargeAtDestActual:stateOfChargeDiffAtDest:waypoints:evConsumptionModel:evChargingMode:isEVRoute:activeNavMode:arWalkingUsedInRoutePlanning:arWalkingUsedInNavigation:voiceGuidanceLevel:hFPEnabled:isEndRouteTermination:isParkedCarTermination:isTransitionToWalkingTermination:isTransitionToFindmyTermination:parkingDetectionLocation:timeBetweenParkedAndArrival:arrivedAtDestinationCount:inParkingModeCount:isInParkingMode:isSuggestToWalkingTriggered:isTransitedToWalking:isSuggestToFindmyTriggered:isTransitedToFindmy:", v74, v73, arrivalLocation, v72, v76, v71, navigationModes, v70, v69, isVLFImprovementUsed,
    v68,
    0,
    v67,
    v66,
    0,
    tripOrigin,
    v64,
    v63,
    v62,
    v51,
    v50,
    v75,
    v49,
    evChargingModel,
    v36,
    arWalkingUsedInRoutePlanning,
    arWalkingUsedInNavigation,
    v37,
    isHandsFreeProfileUsed,
    v43,
    v42,
    v65,
    v39,
    parkingDetectionLocation,
    v25,
    v40,
    v38,
    v26,
    v27,
    v28,
    v29,
    v30);

  if ((v54 & 0x100000000) == 0)
  v5 = v61;
  if ((v54 & 1) == 0)

  if (isEVRoute)
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isInternalInstall");

  if (v32)
  {
    Integer = GEOConfigGetInteger(GeoServicesConfig_EnableFullNavTraceLogMessages, (uint64_t)off_1EDF4CBD8);
    if (objc_msgSend(v61, "length"))
    {
      if (Integer == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "contentsAtPath:", v61);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(getGEOAPPortalClass(), "captureNavTraceWithNavTraceData:", v35);
      }
    }
  }
  -[GEODirectionsFeedbackCollector reset](self, "reset");

LABEL_34:
}

- (BOOL)_canSampleBadEvTrip
{
  void *v2;
  int v3;
  void *v4;

  if (self->_isEVRoute)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("GEODirectionsFeedbackCollector_CanSampleBadEvTripKey"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3 ^ 1u, CFSTR("GEODirectionsFeedbackCollector_CanSampleBadEvTripKey"));

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)description
{
  return (id)-[GEODirectionsFeedbackLogMessage formattedText](self->_currentFeedbackLogMessage, "formattedText");
}

- (GEODirectionsFeedbackLogMessage)currentFeedbackLogMessage
{
  return self->_currentFeedbackLogMessage;
}

- (void)setCurrentFeedbackLogMessage:(id)a3
{
  objc_storeStrong((id *)&self->_currentFeedbackLogMessage, a3);
}

- (GEODirectionsFeedback)currentDirectionsFeedback
{
  return self->_currentDirectionsFeedback;
}

- (void)setCurrentDirectionsFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_currentDirectionsFeedback, a3);
}

- (BOOL)batteryDied
{
  return self->_batteryDied;
}

- (void)setBatteryDied:(BOOL)a3
{
  self->_batteryDied = a3;
}

- (BOOL)isEVRoute
{
  return self->_isEVRoute;
}

- (void)setIsEVRoute:(BOOL)a3
{
  self->_isEVRoute = a3;
}

- (BOOL)isBadEvExperience
{
  return self->_isBadEvExperience;
}

- (void)setIsBadEvExperience:(BOOL)a3
{
  self->_isBadEvExperience = a3;
}

- (NSNumber)stateOfChargeAtOrigin
{
  return self->_stateOfChargeAtOrigin;
}

- (void)setStateOfChargeAtOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfChargeAtOrigin, a3);
}

- (NSNumber)stateOfChargeAtDestPredicted
{
  return self->_stateOfChargeAtDestPredicted;
}

- (void)setStateOfChargeAtDestPredicted:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfChargeAtDestPredicted, a3);
}

- (NSNumber)stateOfChargeAtDestActual
{
  return self->_stateOfChargeAtDestActual;
}

- (void)setStateOfChargeAtDestActual:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfChargeAtDestActual, a3);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (NSString)evConsumptionModel
{
  return self->_evConsumptionModel;
}

- (void)setEvConsumptionModel:(id)a3
{
  objc_storeStrong((id *)&self->_evConsumptionModel, a3);
}

- (NSString)evChargingModel
{
  return self->_evChargingModel;
}

- (void)setEvChargingModel:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingModel, a3);
}

- (double)timeBetweenParkedAndArrival
{
  return self->_timeBetweenParkedAndArrival;
}

- (void)setTimeBetweenParkedAndArrival:(double)a3
{
  self->_timeBetweenParkedAndArrival = a3;
}

- (unint64_t)arrivedAtDestinationCount
{
  return self->_arrivedAtDestinationCount;
}

- (void)setArrivedAtDestinationCount:(unint64_t)a3
{
  self->_arrivedAtDestinationCount = a3;
}

- (unint64_t)inParkingModeCount
{
  return self->_inParkingModeCount;
}

- (void)setInParkingModeCount:(unint64_t)a3
{
  self->_inParkingModeCount = a3;
}

- (BOOL)enteredParkingMode
{
  return self->_enteredParkingMode;
}

- (void)setEnteredParkingMode:(BOOL)a3
{
  self->_enteredParkingMode = a3;
}

- (BOOL)didSuggestWalkingRoute
{
  return self->_didSuggestWalkingRoute;
}

- (void)setDidSuggestWalkingRoute:(BOOL)a3
{
  self->_didSuggestWalkingRoute = a3;
}

- (BOOL)userDidAcceptWalkingRoute
{
  return self->_userDidAcceptWalkingRoute;
}

- (void)setUserDidAcceptWalkingRoute:(BOOL)a3
{
  self->_userDidAcceptWalkingRoute = a3;
}

- (BOOL)didSuggestFindMy
{
  return self->_didSuggestFindMy;
}

- (void)setDidSuggestFindMy:(BOOL)a3
{
  self->_didSuggestFindMy = a3;
}

- (BOOL)userDidLaunchFindMy
{
  return self->_userDidLaunchFindMy;
}

- (void)setUserDidLaunchFindMy:(BOOL)a3
{
  self->_userDidLaunchFindMy = a3;
}

- (int64_t)endReason
{
  return self->_endReason;
}

- (void)setEndReason:(int64_t)a3
{
  self->_endReason = a3;
}

- (GEOLocation)parkingDetectionLocation
{
  return self->_parkingDetectionLocation;
}

- (void)setParkingDetectionLocation:(id)a3
{
  objc_storeStrong((id *)&self->_parkingDetectionLocation, a3);
}

- (GEOLocation)arrivalLocation
{
  return self->_arrivalLocation;
}

- (void)setArrivalLocation:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalLocation, 0);
  objc_storeStrong((id *)&self->_parkingDetectionLocation, 0);
  objc_storeStrong((id *)&self->_isHandsFreeProfileUsed, 0);
  objc_storeStrong((id *)&self->_evChargingModel, 0);
  objc_storeStrong((id *)&self->_evConsumptionModel, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtDestActual, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtDestPredicted, 0);
  objc_storeStrong((id *)&self->_stateOfChargeAtOrigin, 0);
  objc_storeStrong((id *)&self->_arWalkingUsedInNavigation, 0);
  objc_storeStrong((id *)&self->_arWalkingUsedInRoutePlanning, 0);
  objc_storeStrong((id *)&self->_isVLFImprovementUsed, 0);
  objc_storeStrong((id *)&self->_tripOrigin, 0);
  objc_storeStrong((id *)&self->_navigationModes, 0);
  objc_storeStrong((id *)&self->_currentFeedbackLogMessage, 0);
  objc_storeStrong((id *)&self->_currentDirectionsFeedback, 0);
}

@end
