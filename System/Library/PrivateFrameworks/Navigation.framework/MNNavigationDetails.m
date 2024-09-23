@implementation MNNavigationDetails

- (id)initForServer:(BOOL)a3
{
  MNNavigationDetails *v4;
  int64x2_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64x2_t *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNNavigationDetails;
  v4 = -[MNNavigationDetails init](&v12, sel_init);
  v5 = (int64x2_t *)v4;
  if (v4)
  {
    v4->_isServer = a3;
    v4->_navigationType = 0;
    v4->_desiredNavigationType = 0;
    v4->_state = 0;
    v4->_desiredTransportType = 4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[7].i64[1];
    v5[7].i64[1] = v6;

    v8 = geo_isolater_create();
    v9 = (void *)v5[9].i64[0];
    v5[9].i64[0] = v8;

    v5[13].i64[1] = *MEMORY[0x1E0D26A38];
    v5[6].i64[0] = 0x7FFFFFFFFFFFFFFFLL;
    v5[14] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v5[24].i64[0] = 0;
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNNavigationDetails)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  MNNavigationDetails *v9;
  double v10;
  uint64_t v11;
  NSString *displayString;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  NSString *currentVoiceLanguage;
  uint64_t v19;
  MNActiveRouteInfo *currentRoute;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *alternateRoutes;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *previewRoutes;
  id v31;
  const void *v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  MNGuidanceLaneInfo *activeLaneInfo;
  uint64_t v38;
  MNNavTrayGuidanceEvent *activeNavTrayGuidanceEvent;
  uint64_t v40;
  MNArrivalInfo *arrivalInfo;
  uint64_t v42;
  MNActiveRouteInfo *backgroundWalkingRouteInfo;
  uint64_t v44;
  MNVehicleParkingInfo *vehicleParkingInfo;
  uint64_t v46;
  GEOResumeRouteHandle *resumeRouteHandle;
  uint64_t v48;
  NSString *tracePath;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *traceBookmarks;
  double v55;
  double v56;
  NSObject *v57;
  NSObject *v58;
  uint8_t buf[16];
  objc_super v61;

  v4 = a3;
  MNGetMNNavigationDetailsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NavigationDetailsDecoding", ", buf, 2u);
  }

  v61.receiver = self;
  v61.super_class = (Class)MNNavigationDetails;
  v9 = -[MNNavigationDetails init](&v61, sel_init);
  if (v9)
  {
    v9->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
    v9->_desiredNavigationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_desiredNavigationType"));
    v9->_navigationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_navigationType"));
    v9->_desiredTransportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_desiredTransportType"));
    v9->_initialRouteSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_initialRouteSource"));
    v9->_guidancePromptsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("GuidancePromptsEnabled"));
    v9->_navigationState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("NavigationState"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ProceedToRouteDistance"));
    v9->_proceedToRouteDistance = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayString"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayString = v9->_displayString;
    v9->_displayString = (NSString *)v11;

    v9->_closestStepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ClosestStepIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DistanceUntilSign"));
    v9->_distanceUntilSign = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TimeUntilSign"));
    v9->_timeUntilSign = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("DistanceUntilManeuver"));
    v9->_distanceUntilManeuver = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TimeUntilManeuver"));
    v9->_timeUntilManeuver = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentVoiceLanguage"));
    v17 = objc_claimAutoreleasedReturnValue();
    currentVoiceLanguage = v9->_currentVoiceLanguage;
    v9->_currentVoiceLanguage = (NSString *)v17;

    v9->_voiceGuidanceLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_voiceGuidanceLevel"));
    v9->_routeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RouteIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentRoute"));
    v19 = objc_claimAutoreleasedReturnValue();
    currentRoute = v9->_currentRoute;
    v9->_currentRoute = (MNActiveRouteInfo *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("AlternateRoutes"));
    v24 = objc_claimAutoreleasedReturnValue();
    alternateRoutes = v9->_alternateRoutes;
    v9->_alternateRoutes = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("AlternateRoutes"));
    v29 = objc_claimAutoreleasedReturnValue();
    previewRoutes = v9->_previewRoutes;
    v9->_previewRoutes = (NSArray *)v29;

    v9->_selectedPreviewRouteIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SelectePreviewRouteIndex"));
    *(_QWORD *)buf = 0;
    v31 = objc_retainAutorelease(v4);
    v32 = (const void *)objc_msgSend(v31, "decodeBytesForKey:returnedLength:", CFSTR("_lastOriginalRouteCoordinate"), buf);
    if (*(_QWORD *)buf && v32)
    {
      if (*(_QWORD *)buf >= 8uLL)
        v33 = 8;
      else
        v33 = *(_QWORD *)buf;
      memcpy(&v9->_lastOriginalRouteCoordinate, v32, v33);
    }
    v9->_targetLegIndex = objc_msgSend(v31, "decodeIntegerForKey:", CFSTR("_targetLegIndex"));
    v9->_upcomingAnchorPointIndex = objc_msgSend(v31, "decodeIntegerForKey:", CFSTR("_upcomingAnchorPointIndex"));
    v34 = objc_msgSend(v31, "decodeIntegerForKey:", CFSTR("DisplayedStepIndex"));
    v35 = 0x7FFFFFFFFFFFFFFFLL;
    if (v34 >= 0)
      v35 = v34;
    v9->_displayedStepIndex = v35;
    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activeLaneInfo"));
    v36 = objc_claimAutoreleasedReturnValue();
    activeLaneInfo = v9->_activeLaneInfo;
    v9->_activeLaneInfo = (MNGuidanceLaneInfo *)v36;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activeNavTrayGuidanceEvent"));
    v38 = objc_claimAutoreleasedReturnValue();
    activeNavTrayGuidanceEvent = v9->_activeNavTrayGuidanceEvent;
    v9->_activeNavTrayGuidanceEvent = (MNNavTrayGuidanceEvent *)v38;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_arrivalInfo"));
    v40 = objc_claimAutoreleasedReturnValue();
    arrivalInfo = v9->_arrivalInfo;
    v9->_arrivalInfo = (MNArrivalInfo *)v40;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backgroundWalkingRouteInfo"));
    v42 = objc_claimAutoreleasedReturnValue();
    backgroundWalkingRouteInfo = v9->_backgroundWalkingRouteInfo;
    v9->_backgroundWalkingRouteInfo = (MNActiveRouteInfo *)v42;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vehicleParkingInfo"));
    v44 = objc_claimAutoreleasedReturnValue();
    vehicleParkingInfo = v9->_vehicleParkingInfo;
    v9->_vehicleParkingInfo = (MNVehicleParkingInfo *)v44;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resumeRouteHandle"));
    v46 = objc_claimAutoreleasedReturnValue();
    resumeRouteHandle = v9->_resumeRouteHandle;
    v9->_resumeRouteHandle = (GEOResumeRouteHandle *)v46;

    objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tracePath"));
    v48 = objc_claimAutoreleasedReturnValue();
    tracePath = v9->_tracePath;
    v9->_tracePath = (NSString *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "decodeObjectOfClasses:forKey:", v52, CFSTR("_traceBookmarks"));
    v53 = objc_claimAutoreleasedReturnValue();
    traceBookmarks = v9->_traceBookmarks;
    v9->_traceBookmarks = (NSArray *)v53;

    objc_msgSend(v31, "decodeDoubleForKey:", CFSTR("_traceDuration"));
    v9->_traceDuration = v55;
    objc_msgSend(v31, "decodeDoubleForKey:", CFSTR("_tracePosition"));
    v9->_tracePosition = v56;
    v9->_traceIsPlaying = objc_msgSend(v31, "decodeBoolForKey:", CFSTR("_traceIsPlaying"));
    v9->_simulationType = objc_msgSend(v31, "decodeIntegerForKey:", CFSTR("_simulationType"));
    v9->_isResumingMultipointRoute = objc_msgSend(v31, "decodeBoolForKey:", CFSTR("_isResumingMultipointRoute"));
    v9->_isApproachingWaypoint = objc_msgSend(v31, "decodeBoolForKey:", CFSTR("_isApproachingWaypoint"));
  }
  v57 = v8;
  v58 = v57;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v58, OS_SIGNPOST_INTERVAL_END, v6, "NavigationDetailsDecoding", ", buf, 2u);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MNActiveRouteInfo *currentRoute;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  MNGetMNNavigationDetailsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "NavigationDetailsEncoding", ", buf, 2u);
  }

  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails state](self, "state"), CFSTR("State"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_desiredNavigationType, CFSTR("_desiredNavigationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_navigationType, CFSTR("_navigationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_desiredTransportType, CFSTR("_desiredTransportType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_initialRouteSource, CFSTR("_initialRouteSource"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MNNavigationDetails guidancePromptsEnabled](self, "guidancePromptsEnabled"), CFSTR("GuidancePromptsEnabled"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[MNNavigationDetails navigationState](self, "navigationState"), CFSTR("NavigationState"));
  -[MNNavigationDetails proceedToRouteDistance](self, "proceedToRouteDistance");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ProceedToRouteDistance"));
  -[MNNavigationDetails displayString](self, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MNNavigationDetails displayString](self, "displayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("DisplayString"));

  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails closestStepIndex](self, "closestStepIndex"), CFSTR("ClosestStepIndex"));
  -[MNNavigationDetails distanceUntilSign](self, "distanceUntilSign");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("DistanceUntilSign"));
  -[MNNavigationDetails timeUntilSign](self, "timeUntilSign");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TimeUntilSign"));
  -[MNNavigationDetails distanceUntilManeuver](self, "distanceUntilManeuver");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("DistanceUntilManeuver"));
  -[MNNavigationDetails timeUntilManeuver](self, "timeUntilManeuver");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TimeUntilManeuver"));
  -[MNNavigationDetails currentVoiceLanguage](self, "currentVoiceLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MNNavigationDetails currentVoiceLanguage](self, "currentVoiceLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("CurrentVoiceLanguage"));

  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_voiceGuidanceLevel, CFSTR("_voiceGuidanceLevel"));
  currentRoute = self->_currentRoute;
  if (currentRoute)
    objc_msgSend(v4, "encodeObject:forKey:", currentRoute, CFSTR("CurrentRoute"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails routeIndex](self, "routeIndex"), CFSTR("RouteIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternateRoutes, CFSTR("AlternateRoutes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previewRoutes, CFSTR("PreviewRoutes"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MNNavigationDetails selectedPreviewRouteIndex](self, "selectedPreviewRouteIndex"), CFSTR("SelectePreviewRouteIndex"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_lastOriginalRouteCoordinate, 8, CFSTR("_lastOriginalRouteCoordinate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_targetLegIndex, CFSTR("_targetLegIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_upcomingAnchorPointIndex, CFSTR("_upcomingAnchorPointIndex"));
  if (-[MNNavigationDetails displayedStepIndex](self, "displayedStepIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v14 = -1;
  else
    v14 = -[MNNavigationDetails displayedStepIndex](self, "displayedStepIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", v14, CFSTR("DisplayedStepIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activeLaneInfo, CFSTR("_activeLaneInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activeNavTrayGuidanceEvent, CFSTR("_activeNavTrayGuidanceEvent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalInfo, CFSTR("_arrivalInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundWalkingRouteInfo, CFSTR("_backgroundWalkingRouteInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleParkingInfo, CFSTR("_vehicleParkingInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_resumeRouteHandle, CFSTR("_resumeRouteHandle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tracePath, CFSTR("_tracePath"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_traceBookmarks, CFSTR("_traceBookmarks"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_traceDuration"), self->_traceDuration);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_tracePosition"), self->_tracePosition);
  objc_msgSend(v4, "encodeBool:forKey:", self->_traceIsPlaying, CFSTR("_traceIsPlaying"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_simulationType, CFSTR("_simulationType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isResumingMultipointRoute, CFSTR("_isResumingMultipointRoute"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isApproachingWaypoint, CFSTR("_isApproachingWaypoint"));
  v15 = v8;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v16, OS_SIGNPOST_INTERVAL_END, v6, "NavigationDetailsEncoding", ", v17, 2u);
  }

}

- (void)copySerializableValuesFrom:(id)a3
{
  id v4;
  id v5;
  double v6;
  NSString *v7;
  NSString *displayString;
  double v9;
  double v10;
  double v11;
  double v12;
  NSString *v13;
  NSString *currentVoiceLanguage;
  uint64_t v15;
  MNActiveRouteInfo *currentRoute;
  NSArray *alternateRoutes;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    self->_state = objc_msgSend(v4, "state");
    self->_navigationType = objc_msgSend(v5, "navigationType");
    self->_desiredNavigationType = objc_msgSend(v5, "desiredNavigationType");
    self->_desiredTransportType = objc_msgSend(v5, "desiredTransportType");
    self->_initialRouteSource = objc_msgSend(v5, "initialRouteSource");
    self->_guidancePromptsEnabled = objc_msgSend(v5, "guidancePromptsEnabled");
    self->_navigationState = objc_msgSend(v5, "navigationState");
    objc_msgSend(v5, "proceedToRouteDistance");
    self->_proceedToRouteDistance = v6;
    objc_msgSend(v5, "displayString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayString = self->_displayString;
    self->_displayString = v7;

    self->_closestStepIndex = objc_msgSend(v5, "closestStepIndex");
    objc_msgSend(v5, "distanceUntilSign");
    self->_distanceUntilSign = v9;
    objc_msgSend(v5, "timeUntilSign");
    self->_timeUntilSign = v10;
    objc_msgSend(v5, "distanceUntilManeuver");
    self->_distanceUntilManeuver = v11;
    objc_msgSend(v5, "timeUntilManeuver");
    self->_timeUntilManeuver = v12;
    objc_msgSend(v5, "currentVoiceLanguage");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentVoiceLanguage = self->_currentVoiceLanguage;
    self->_currentVoiceLanguage = v13;

    self->_voiceGuidanceLevel = *((_QWORD *)v5 + 38);
    self->_routeIndex = objc_msgSend(v5, "routeIndex");
    self->_selectedPreviewRouteIndex = objc_msgSend(v5, "selectedPreviewRouteIndex");
    objc_storeStrong((id *)&self->_previewRoutes, *((id *)v5 + 10));
    self->_lastOriginalRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)*((_QWORD *)v5 + 27);
    self->_targetLegIndex = *((_QWORD *)v5 + 12);
    self->_upcomingAnchorPointIndex = *((_QWORD *)v5 + 28);
    self->_displayedStepIndex = *((_QWORD *)v5 + 29);
    self->_isResumingMultipointRoute = *((_BYTE *)v5 + 153);
    self->_isApproachingWaypoint = *((_BYTE *)v5 + 154);
    objc_storeStrong((id *)&self->_activeLaneInfo, *((id *)v5 + 39));
    objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, *((id *)v5 + 40));
    objc_storeStrong((id *)&self->_arrivalInfo, *((id *)v5 + 41));
    objc_storeStrong((id *)&self->_backgroundWalkingRouteInfo, *((id *)v5 + 42));
    objc_storeStrong((id *)&self->_vehicleParkingInfo, *((id *)v5 + 43));
    objc_storeStrong((id *)&self->_resumeRouteHandle, *((id *)v5 + 13));
    v15 = *((_QWORD *)v5 + 9);
    if (v15)
    {
      -[MNNavigationDetails setCurrentRoute:withAlternateRoutes:](self, "setCurrentRoute:withAlternateRoutes:", v15, *((_QWORD *)v5 + 11));
    }
    else
    {
      currentRoute = self->_currentRoute;
      self->_currentRoute = 0;

      alternateRoutes = self->_alternateRoutes;
      self->_alternateRoutes = 0;

      -[NSMapTable removeAllObjects](self->_routeIDLookup, "removeAllObjects");
    }
    objc_storeStrong((id *)&self->_tracePath, *((id *)v5 + 44));
    objc_storeStrong((id *)&self->_traceBookmarks, *((id *)v5 + 47));
    self->_traceDuration = *((double *)v5 + 45);
    self->_tracePosition = *((double *)v5 + 46);
    self->_traceIsPlaying = *((_BYTE *)v5 + 157);
    self->_simulationType = *((_QWORD *)v5 + 48);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempting to copy nil navigation details"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = 136316162;
      v21 = "-[MNNavigationDetails copySerializableValuesFrom:]";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v24 = 1024;
      v25 = 237;
      v26 = 2080;
      v27 = "other";
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v20, 0x30u);
    }

  }
}

- (void)updateWithNavigationServiceCallbackParameters:(id)a3
{
  id v4;
  MNNavTrayGuidanceEvent *v5;
  void *activeNavTrayGuidanceEvent;
  GEOResumeRouteHandle *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  GEODirectionsRequest *v13;
  GEODirectionsRequest *directionsRequest;
  void *v15;
  GEODirectionsResponse *v16;
  GEODirectionsResponse *directionsResponse;
  void *v18;
  NSString *v19;
  NSString *currentVoiceLanguage;
  id v21;

  v21 = a3;
  switch(objc_msgSend(v21, "type"))
  {
    case 1:
      self->_voiceGuidanceLevel = objc_msgSend(v21, "voiceGuidanceLevel");
      break;
    case 7:
      objc_msgSend(v21, "location");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setLocation:](self, "setLocation:", v4);
      goto LABEL_12;
    case 8:
      objc_msgSend(v21, "navTrayGuidanceEvent");
      v5 = (MNNavTrayGuidanceEvent *)objc_claimAutoreleasedReturnValue();
      activeNavTrayGuidanceEvent = self->_activeNavTrayGuidanceEvent;
      self->_activeNavTrayGuidanceEvent = v5;
      goto LABEL_6;
    case 9:
      objc_msgSend(v21, "resumeRouteHandle");
      v7 = (GEOResumeRouteHandle *)objc_claimAutoreleasedReturnValue();
      activeNavTrayGuidanceEvent = self->_resumeRouteHandle;
      self->_resumeRouteHandle = v7;
LABEL_6:

      break;
    case 11:
      v8 = v21;
      self->_targetLegIndex = objc_msgSend(v8, "targetLegIndex");
      v9 = objc_msgSend(v8, "targetLegIndex");

      -[MNArrivalInfo setLegIndex:](self->_arrivalInfo, "setLegIndex:", v9);
      break;
    case 12:
      self->_upcomingAnchorPointIndex = objc_msgSend(v21, "anchorPointIndex");
      break;
    case 15:
      v4 = v21;
      objc_msgSend(v4, "routeInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails setCurrentRoute:withAlternateRoutes:](self, "setCurrentRoute:withAlternateRoutes:", v10, 0);
      self->_desiredNavigationType = objc_msgSend(v4, "navigationType");
      self->_navigationType = objc_msgSend(v4, "navigationType");
      self->_simulationType = objc_msgSend(v4, "simulationType");
      self->_initialRouteSource = objc_msgSend(v4, "initialRouteSource");
      objc_msgSend(v11, "routeInitializerData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "directionsRequest");
      v13 = (GEODirectionsRequest *)objc_claimAutoreleasedReturnValue();
      directionsRequest = self->_directionsRequest;
      self->_directionsRequest = v13;

      objc_msgSend(v11, "routeInitializerData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "directionsResponse");
      v16 = (GEODirectionsResponse *)objc_claimAutoreleasedReturnValue();
      directionsResponse = self->_directionsResponse;
      self->_directionsResponse = v16;

      if (!self->_isServer)
        objc_storeStrong((id *)&self->_originalRoute, v11);
      objc_msgSend(v4, "voiceLanguage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (NSString *)objc_msgSend(v18, "copy");
      currentVoiceLanguage = self->_currentVoiceLanguage;
      self->_currentVoiceLanguage = v19;

      self->_isResumingMultipointRoute = objc_msgSend(v4, "isResumingMultiStopRoute");
LABEL_12:

      break;
    default:
      break;
  }

}

- (void)setLocation:(id)a3
{
  MNLocation *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MNLocation *location;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (MNLocation *)a3;
  -[MNLocation routeID](v4, "routeID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[MNLocation routeMatch](v4, "routeMatch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MNLocation routeID](v4, "routeID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNNavigationDetails routeInfoForID:](self, "routeInfoForID:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9
        || (objc_msgSend(v9, "route"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error finding route for matched location"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = "-[MNNavigationDetails setLocation:]";
          v21 = 2080;
          v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
          v23 = 1024;
          v24 = 372;
          v25 = 2080;
          v26 = "routeInfo != nil && routeInfo.route != nil";
          v27 = 2112;
          v28 = v11;
          _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
        }

      }
      objc_msgSend(v9, "route");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNLocation routeMatch](v4, "routeMatch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRoute:", v13);

      -[MNLocation routeID](v4, "routeID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedRoute uniqueRouteID](self->_originalRoute, "uniqueRouteID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqual:", v16))
      {
        v17 = -[MNLocation state](v4, "state");

        if (v17 != 1)
        {
LABEL_13:

          goto LABEL_14;
        }
        -[MNLocation routeMatch](v4, "routeMatch");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        self->_lastOriginalRouteCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)objc_msgSend(v15, "routeCoordinate");
      }
      else
      {

      }
      goto LABEL_13;
    }
  }
LABEL_14:
  location = self->_location;
  self->_location = v4;

}

- (GEOComposedRoute)currentRoute
{
  return -[MNActiveRouteInfo route](self->_currentRoute, "route");
}

- (MNDisplayETAInfo)displayETAInfo
{
  return -[MNActiveRouteInfo displayETAInfo](self->_currentRoute, "displayETAInfo");
}

- (MNRouteDistanceInfo)remainingDistanceInfo
{
  return -[MNActiveRouteInfo remainingDistanceInfo](self->_currentRoute, "remainingDistanceInfo");
}

- (MNBatteryChargeInfo)batteryChargeInfo
{
  return -[MNActiveRouteInfo batteryChargeInfo](self->_currentRoute, "batteryChargeInfo");
}

- (NSArray)previewRoutes
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_previewRoutes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_previewRoutes, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_previewRoutes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0x1E0CB3000uLL;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 136316162;
    v20 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v11, "route", v20, (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v15 = v8;
          objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("No route in preview route info."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = "-[MNNavigationDetails previewRoutes]";
            v27 = 2080;
            v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            v29 = 1024;
            v30 = 407;
            v31 = 2080;
            v32 = "previewRouteInfo.route != nil";
            v33 = 2112;
            v34 = v16;
            _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          v8 = v15;
        }
        objc_msgSend(v11, "route");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "route");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
        ++v10;
      }
      while (v7 != v10);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
      v7 = v18;
    }
    while (v18);
  }

  return (NSArray *)v3;
}

- (NSArray)alternateRoutes
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_alternateRoutes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_alternateRoutes, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_alternateRoutes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0x1E0CB3000uLL;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 136316162;
    v20 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v11, "route", v20, (_QWORD)v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v15 = v8;
          objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("No route in alternate route info."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = "-[MNNavigationDetails alternateRoutes]";
            v27 = 2080;
            v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            v29 = 1024;
            v30 = 419;
            v31 = 2080;
            v32 = "alternateRouteInfo.route != nil";
            v33 = 2112;
            v34 = v16;
            _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

          v8 = v15;
        }
        objc_msgSend(v11, "route");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "route");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
        ++v10;
      }
      while (v7 != v10);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
      v7 = v18;
    }
    while (v18);
  }

  return (NSArray *)v3;
}

- (unint64_t)stepIndex
{
  return -[MNLocation stepIndex](self->_location, "stepIndex");
}

- (unint64_t)segmentIndex
{
  unint64_t v3;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[MNNavigationDetails stepIndex](self, "stepIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v3;
  -[MNActiveRouteInfo route](self->_currentRoute, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "segmentIndexForStepIndex:", v5);

  return v7;
}

- (void)setPreviewRoutes:(id)a3 withSelectedRouteIndex:(unint64_t)a4
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t spid;
  NSArray **p_previewRoutes;
  id v31;
  id v32;
  NSObject *v33;
  MNNavigationDetails *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v32 = a3;
  MNGetMNNavigationDetailsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetPreviewRoutes", ", buf, 2u);
  }
  spid = v6;
  v33 = v8;

  self->_navigationType = 1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v34 = self;
  p_previewRoutes = &self->_previewRoutes;
  v10 = self->_previewRoutes;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "routeID", spid, p_previewRoutes, v31, v32, v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Route ID of existing preview route is missing."));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v46 = "-[MNNavigationDetails setPreviewRoutes:withSelectedRouteIndex:]";
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            v49 = 1024;
            v50 = 454;
            v51 = 2080;
            v52 = "routeID";
            v53 = 2112;
            v54 = v16;
            _os_log_impl(&dword_1B0AD7000, v17, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v32;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "routeID", spid);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v18, "addObject:", v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Route ID of new preview route is missing."));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v46 = "-[MNNavigationDetails setPreviewRoutes:withSelectedRouteIndex:]";
            v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            v49 = 1024;
            v50 = 464;
            v51 = 2080;
            v52 = "routeID";
            v53 = 2112;
            v54 = v25;
            _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v21);
  }

  if ((objc_msgSend(v9, "isEqualToSet:", v18) & 1) == 0)
    objc_storeStrong((id *)p_previewRoutes, v31);
  v34->_selectedPreviewRouteIndex = a4;
  v27 = v33;
  v28 = v27;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "SetPreviewRoutes", ", buf, 2u);
  }

}

- (void)setCurrentRoute:(id)a3 withAlternateRoutes:(id)a4
{
  MNActiveRouteInfo *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  MNActiveRouteInfo *v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  MNActiveRouteInfo *v28;
  id v29;
  uint64_t v30;
  MNNavigationDetails *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id *p_currentRoute;
  NSMutableArray *spokenAnnouncements;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  GEODirectionsResponse *directionsResponse;
  NSObject *v73;
  NSObject *v74;
  os_signpost_id_t spid;
  MNActiveRouteInfo *v76;
  NSObject *v77;
  unint64_t v78;
  id v79;
  id *v80;
  MNActiveRouteInfo *v81;
  MNNavigationDetails *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t);
  void *v90;
  MNNavigationDetails *v91;
  MNActiveRouteInfo *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t);
  void *v96;
  MNNavigationDetails *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint8_t v102[128];
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  int v108;
  __int16 v109;
  const char *v110;
  __int16 v111;
  void *v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v6 = (MNActiveRouteInfo *)a3;
  v79 = a4;
  MNGetMNNavigationDetailsLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v78 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SetCurrentRoute", ", buf, 2u);
  }
  spid = v8;
  v77 = v10;

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v82 = self;
  v11 = self->_alternateRoutes;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v99;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v99 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v15);
        objc_msgSend(v16, "routeID", spid);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alternate route ID is nil"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
            v105 = 2080;
            v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
            v107 = 1024;
            v108 = 485;
            v109 = 2080;
            v110 = "alternateRoute.routeID";
            v111 = 2112;
            v112 = v22;
            _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
          }

        }
        objc_msgSend(v16, "routeID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v6;
        -[MNActiveRouteInfo routeID](v6, "routeID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if ((v21 & 1) != 0)
        {
          v25 = v16;

          v6 = v19;
          if (!v25)
            goto LABEL_28;
          -[MNActiveRouteInfo displayETAInfo](v19, "displayETAInfo");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDisplayETAInfo:", v26);

          -[MNActiveRouteInfo remainingDistanceInfo](v19, "remainingDistanceInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setRemainingDistanceInfo:", v27);

          v28 = (MNActiveRouteInfo *)v25;
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          v29 = v79;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
          v31 = v82;
          v76 = v28;
          if (v30)
          {
            v32 = v30;
            v33 = *(_QWORD *)v84;
            while (2)
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v84 != v33)
                  objc_enumerationMutation(v29);
                v35 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                -[MNActiveRouteInfo routeID](v82->_currentRoute, "routeID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "routeID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v36, "isEqual:", v37);

                if ((v38 & 1) != 0)
                {

                  goto LABEL_42;
                }
              }
              v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
              if (v32)
                continue;
              break;
            }
          }

          geo_isolate_sync();
LABEL_42:
          v6 = v28;
          goto LABEL_43;
        }
        ++v15;
        v6 = v19;
      }
      while (v13 != v15);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v98, v113, 16);
      v13 = v24;
      if (v24)
        continue;
      break;
    }
  }

LABEL_28:
  v31 = v82;
  -[MNActiveRouteInfo routeID](v82->_currentRoute, "routeID", spid);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v93 = MEMORY[0x1E0C809B0];
    v94 = 3221225472;
    v95 = __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke;
    v96 = &unk_1E61D23C8;
    v97 = v82;
    geo_isolate_sync();
  }
  if (!v6
    || (-[MNActiveRouteInfo routeID](v6, "routeID"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        v40,
        !v40))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New route is nil or new route ID is nil! Try re-installing navd."));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
      v105 = 2080;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v107 = 1024;
      v108 = 500;
      v109 = 2080;
      v110 = "currentRoute != nil && currentRoute.routeID != nil";
      v111 = 2112;
      v112 = v41;
      _os_log_impl(&dword_1B0AD7000, v42, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    v31 = v82;
    if (!v6)
      goto LABEL_37;
  }
  -[MNActiveRouteInfo routeID](v6, "routeID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v87 = MEMORY[0x1E0C809B0];
    v88 = 3221225472;
    v89 = __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_127;
    v90 = &unk_1E61D1D10;
    v91 = v31;
    v6 = v6;
    v92 = v6;
    geo_isolate_sync();

  }
  else
  {
LABEL_37:
    GEOFindOrCreateLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v104 = "-[MNNavigationDetails setCurrentRoute:withAlternateRoutes:]";
      v105 = 2080;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v107 = 1024;
      v108 = 506;
      _os_log_impl(&dword_1B0AD7000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }

  }
  v76 = 0;
LABEL_43:
  p_currentRoute = (id *)&v31->_currentRoute;
  if (v31->_currentRoute != v6)
  {
    spokenAnnouncements = v31->_spokenAnnouncements;
    v31->_spokenAnnouncements = 0;

    -[MNActiveRouteInfo route](v31->_currentRoute, "route");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "waypoints");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");
    -[MNActiveRouteInfo route](v6, "route");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "waypoints");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (v49 == v52)
    {
      objc_msgSend(*p_currentRoute, "route");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "waypoints");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");

      if (v55 >= 2)
      {
        v56 = 1;
        v80 = (id *)&v31->_currentRoute;
        v81 = v6;
        do
        {
          objc_msgSend(*p_currentRoute, "route");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "waypoints");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", v56);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "uniqueWaypointID");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNActiveRouteInfo route](v6, "route");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "waypoints");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", v56);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "uniqueWaypointID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v60, "isEqualToData:", v64);

          v31 = v82;
          if ((v65 & 1) == 0)
            v82->_isApproachingWaypoint = 0;
          ++v56;
          p_currentRoute = v80;
          objc_msgSend(*v80, "route");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "waypoints");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "count");

          v6 = v81;
        }
        while (v56 < v68);
      }
    }
  }
  objc_storeStrong(p_currentRoute, v6);
  -[MNActiveRouteInfo route](v6, "route");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "routeInitializerData");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "directionsResponse");
  v71 = objc_claimAutoreleasedReturnValue();
  directionsResponse = v31->_directionsResponse;
  v31->_directionsResponse = (GEODirectionsResponse *)v71;

  -[MNNavigationDetails _updateRouteIDLookup](v31, "_updateRouteIDLookup");
  -[MNNavigationDetails setAlternateRoutes:](v31, "setAlternateRoutes:", v79);
  v73 = v77;
  v74 = v73;
  if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v74, OS_SIGNPOST_INTERVAL_END, spid, "SetCurrentRoute", ", buf, 2u);
  }

}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "routeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_127(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "routeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

void __59__MNNavigationDetails_setCurrentRoute_withAlternateRoutes___block_invoke_128(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "routeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (void)setAlternateRoutes:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSObject *v38;
  NSObject *v39;
  __int128 v40;
  os_signpost_id_t spid;
  NSObject *v42;
  unint64_t v43;
  id obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  MNNavigationDetails *v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void *v59;
  MNNavigationDetails *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  void *v65;
  MNNavigationDetails *v66;
  void *v67;
  _BYTE *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  void *v76;
  MNNavigationDetails *v77;
  uint8_t *v78;
  uint8_t buf[8];
  uint8_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t v85[128];
  uint8_t v86[4];
  const char *v87;
  __int16 v88;
  const char *v89;
  __int16 v90;
  int v91;
  _BYTE v92[24];
  __int128 v93;
  id v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationDetailsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  spid = v6;
  v43 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetAlternateRoute", ", buf, 2u);
  }
  v42 = v8;

  *(_QWORD *)buf = 0;
  v80 = buf;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__15;
  v83 = __Block_byref_object_dispose__15;
  v84 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v73 = MEMORY[0x1E0C809B0];
  v74 = 3221225472;
  v75 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke;
  v76 = &unk_1E61D22E0;
  v77 = self;
  v78 = buf;
  geo_isolate_sync();
  -[MNActiveRouteInfo routeID](self->_currentRoute, "routeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)*((_QWORD *)v80 + 5);
    -[MNActiveRouteInfo routeID](self->_currentRoute, "routeID");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v92 = 136315650;
      *(_QWORD *)&v92[4] = "-[MNNavigationDetails setAlternateRoutes:]";
      *(_WORD *)&v92[12] = 2080;
      *(_QWORD *)&v92[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      *(_WORD *)&v92[22] = 1024;
      LODWORD(v93) = 568;
      _os_log_impl(&dword_1B0AD7000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", v92, 0x1Cu);
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v4;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
  if (v14)
  {
    v16 = *(_QWORD *)v70;
    *(_QWORD *)&v15 = 136316162;
    v40 = v15;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v70 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v17);
        objc_msgSend(v18, "routeID", v40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
        {
          objc_msgSend(v18, "routeID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alternate route ID is nil"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            GEOFindOrCreateLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v92 = v40;
              *(_QWORD *)&v92[4] = "-[MNNavigationDetails setAlternateRoutes:]";
              *(_WORD *)&v92[12] = 2080;
              *(_QWORD *)&v92[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
              *(_WORD *)&v92[22] = 1024;
              LODWORD(v93) = 575;
              WORD2(v93) = 2080;
              *(_QWORD *)((char *)&v93 + 6) = "alternateRoute.routeID";
              HIWORD(v93) = 2112;
              v94 = v31;
              _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v92, 0x30u);
            }

          }
          GEOFindOrCreateLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v92 = 0;
            _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_ERROR, "Alternate route ID is nil. This probably means a route failed to load from disk.", v92, 2u);
          }

        }
        else
        {
          objc_msgSend(v18, "routeID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v21);

          *(_QWORD *)v92 = 0;
          *(_QWORD *)&v92[8] = v92;
          *(_QWORD *)&v92[16] = 0x3032000000;
          *(_QWORD *)&v93 = __Block_byref_object_copy__15;
          *((_QWORD *)&v93 + 1) = __Block_byref_object_dispose__15;
          v94 = 0;
          v62 = v9;
          v63 = 3221225472;
          v64 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_129;
          v65 = &unk_1E61D3738;
          v67 = v18;
          v68 = v92;
          v66 = self;
          geo_isolate_sync();
          if (*(_QWORD *)(*(_QWORD *)&v92[8] + 40))
          {
            objc_msgSend(v18, "etaRoute");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "setEtaRoute:", v22);

            objc_msgSend(v18, "etaResponse");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "setEtaResponse:", v23);

            objc_msgSend(v18, "displayETAInfo");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "setDisplayETAInfo:", v24);

            objc_msgSend(v18, "remainingDistanceInfo");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "setRemainingDistanceInfo:", v25);

            v26 = objc_msgSend(v18, "alternateRouteIndex");
            objc_msgSend(*(id *)(*(_QWORD *)&v92[8] + 40), "setAlternateRouteIndex:", v26);
          }
          else
          {
            objc_storeStrong((id *)(*(_QWORD *)&v92[8] + 40), v18);
            if (v18)
            {
              v56 = v9;
              v57 = 3221225472;
              v58 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2;
              v59 = &unk_1E61D1D10;
              v60 = self;
              v61 = v18;
              geo_isolate_sync();
            }
            else
            {
              GEOFindOrCreateLog();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v86 = 136315650;
                v87 = "-[MNNavigationDetails setAlternateRoutes:]";
                v88 = 2080;
                v89 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
                v90 = 1024;
                v91 = 599;
                _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", v86, 0x1Cu);
              }

            }
          }
          objc_msgSend(v13, "addObject:", *(_QWORD *)(*(_QWORD *)&v92[8] + 40));
          _Block_object_dispose(v92, 8);

        }
        ++v17;
      }
      while (v14 != v17);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
      v14 = v33;
    }
    while (v33);
  }

  objc_msgSend(*((id *)v80 + 5), "minusSet:", v45);
  v50 = v9;
  v51 = 3221225472;
  v52 = __42__MNNavigationDetails_setAlternateRoutes___block_invoke_130;
  v53 = &unk_1E61D1B10;
  v54 = self;
  v55 = buf;
  geo_isolate_sync();
  objc_storeStrong((id *)&self->_alternateRoutes, v13);
  v49 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  v34 = self->_alternateRoutes;
  v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v85, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(v34);
        geo_isolate_sync();
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v85, 16);
    }
    while (v35);
  }

  geo_isolate_sync();
  -[MNNavigationDetails _updateRouteIDLookup](self, "_updateRouteIDLookup");
  v38 = v42;
  v39 = v38;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)v92 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v39, OS_SIGNPOST_INTERVAL_END, spid, "SetAlternateRoute", ", v92, 2u);
  }

  _Block_object_dispose(buf, 8);
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_129(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "routeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "routeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_130(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", v2);

}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_2_131(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "routeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected alternate route in lookup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = "-[MNNavigationDetails setAlternateRoutes:]_block_invoke_2";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v12 = 1024;
      v13 = 615;
      v14 = 2080;
      v15 = "self.routeLookup[alternateRoute.routeID] == alternateRoute";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v8, 0x30u);
    }

  }
}

void __42__MNNavigationDetails_setAlternateRoutes___block_invoke_135(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count") + 1;

  if (v3 != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected number of routes in lookup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "-[MNNavigationDetails setAlternateRoutes:]_block_invoke";
      v9 = 2080;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v11 = 1024;
      v12 = 620;
      v13 = 2080;
      v14 = "self.routeLookup.count == (_alternateRoutes.count + 1)";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1B0AD7000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v7, 0x30u);
    }

  }
}

- (void)setNavigationType:(int64_t)a3
{
  self->_navigationType = a3;
  self->_desiredNavigationType = a3;
}

- (void)updateETATrafficForRoute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "routeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationDetails routeInfoForID:](self, "routeInfoForID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "etaResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtaResponse:", v7);

    objc_msgSend(v4, "etaRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEtaRoute:", v8);

    objc_msgSend(v4, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mutableData");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMutableData:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected an existing route but did not find it"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136316162;
      v13 = "-[MNNavigationDetails updateETATrafficForRoute:]";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v16 = 1024;
      v17 = 637;
      v18 = 2080;
      v19 = "existingRoute != nil";
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v12, 0x30u);
    }
  }

}

- (id)routeInfoForID:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  v5 = a3;
  geo_isolate_sync();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__MNNavigationDetails_routeInfoForID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)routeInfoForRoute:(id)a3
{
  void *v4;
  void *v5;

  -[NSMapTable objectForKey:](self->_routeIDLookup, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationDetails routeInfoForID:](self, "routeInfoForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)routeLookupIDs
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15;
  v8 = __Block_byref_object_dispose__15;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __37__MNNavigationDetails_routeLookupIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isFollowingOriginalRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MNNavigationDetails originalRoute](self, "originalRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueRouteID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNNavigationDetails currentRoute](self, "currentRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueRouteID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (void)markAnnouncementSpoken:(id)a3
{
  id v4;
  NSMutableArray *spokenAnnouncements;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    spokenAnnouncements = self->_spokenAnnouncements;
    v8 = v4;
    if (!spokenAnnouncements)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_spokenAnnouncements;
      self->_spokenAnnouncements = v6;

      spokenAnnouncements = self->_spokenAnnouncements;
    }
    -[NSMutableArray addObject:](spokenAnnouncements, "addObject:", v8);
    v4 = v8;
  }

}

- (id)updateWithTrafficIncidentAlert:(id)a3
{
  id v4;
  NSMutableDictionary *trafficIncidentAlerts;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  uint8_t v17[16];

  v4 = a3;
  trafficIncidentAlerts = self->_trafficIncidentAlerts;
  if (!trafficIncidentAlerts)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trafficIncidentAlerts;
    self->_trafficIncidentAlerts = v6;

    trafficIncidentAlerts = self->_trafficIncidentAlerts;
  }
  objc_msgSend(v4, "alertID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trafficIncidentAlerts, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Attempting to update a traffic incident alert that does not exist. Creating a new alert.", v17, 2u);
    }

  }
  v11 = self->_trafficIncidentAlerts;
  objc_msgSend(v4, "alertID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v4, v12);

  v13 = self->_trafficIncidentAlerts;
  objc_msgSend(v4, "alertID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)removeTrafficIncidentAlert:(id)a3
{
  id v4;
  NSMutableDictionary *trafficIncidentAlerts;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  trafficIncidentAlerts = self->_trafficIncidentAlerts;
  objc_msgSend(v4, "alertID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trafficIncidentAlerts, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_trafficIncidentAlerts;
    objc_msgSend(v4, "alertID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    v10 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't find traffic incident alert to invalidate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136316162;
      v15 = "-[MNNavigationDetails removeTrafficIncidentAlert:]";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v18 = 1024;
      v19 = 702;
      v20 = 2080;
      v21 = "(existingAlert != nil)";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v14, 0x30u);
    }

  }
  return v7;
}

- (void)_updateRouteIDLookup
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  MNNavigationDetails *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  -[MNNavigationDetails routeIDLookup](self, "routeIDLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __43__MNNavigationDetails__updateRouteIDLookup__block_invoke;
  v12 = &unk_1E61D22E0;
  v13 = self;
  v14 = &v15;
  geo_isolate_sync();
  v5 = (void *)v16[5];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __43__MNNavigationDetails__updateRouteIDLookup__block_invoke_2;
  v7[3] = &unk_1E61D7B80;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  _Block_object_dispose(&v15, 8);
}

void __43__MNNavigationDetails__updateRouteIDLookup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "routeLookup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__MNNavigationDetails__updateRouteIDLookup__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5 && a3)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(a3, "route");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315650;
      v9 = "-[MNNavigationDetails _updateRouteIDLookup]_block_invoke_2";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNNavigationDetails.m";
      v12 = 1024;
      v13 = 723;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v8, 0x1Cu);
    }
  }

}

- (NSMapTable)routeIDLookup
{
  NSMapTable *routeIDLookup;
  NSMapTable *v4;
  NSMapTable *v5;

  routeIDLookup = self->_routeIDLookup;
  if (!routeIDLookup)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_routeIDLookup;
    self->_routeIDLookup = v4;

    routeIDLookup = self->_routeIDLookup;
  }
  return routeIDLookup;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  unint64_t v17;
  void *v18;
  objc_super v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)MNNavigationDetails;
  -[MNNavigationDetails description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MNNavigationDetails state](self, "state");
  v4 = -[MNNavigationDetails desiredNavigationType](self, "desiredNavigationType");
  if ((unint64_t)(v4 - 1) > 3)
    v5 = CFSTR("None");
  else
    v5 = *(&off_1E61D7BA0 + v4 - 1);
  v16 = v5;
  v6 = -[MNNavigationDetails navigationType](self, "navigationType") - 1;
  if (v6 > 3)
    v7 = CFSTR("None");
  else
    v7 = *(&off_1E61D7BA0 + v6);
  -[MNNavigationDetails location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MNNavigationDetails guidancePromptsEnabled](self, "guidancePromptsEnabled");
  v10 = -[MNNavigationDetails isDetour](self, "isDetour");
  v11 = -[MNNavigationDetails navigationState](self, "navigationState");
  if (v11 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = *(&off_1E61D7BC0 + (int)v11);
  }
  -[MNNavigationDetails guidanceState](self, "guidanceState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ [state=%lu,\n             desiredNavigationType:%@,\n             navigationType=%@,\n             location=%@,\n             guidancePromptsEnabled=%d,\n             isDetour=%d,\n             navigationState=%@,\n             guidanceState=%@,\n             reconnectionRouteIndex=%lu,\n             stepIndex=%lu,\n             segmentIndex=%lu]"), v3, v17, v16, v7, v8, v9, v10, v12, v13, -[MNNavigationDetails reconnectionRouteIndex](self, "reconnectionRouteIndex"), -[MNNavigationDetails stepIndex](self, "stepIndex"), -[MNNavigationDetails segmentIndex](self, "segmentIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (int64_t)navigationType
{
  return self->_navigationType;
}

- (int64_t)desiredNavigationType
{
  return self->_desiredNavigationType;
}

- (void)setDesiredNavigationType:(int64_t)a3
{
  self->_desiredNavigationType = a3;
}

- (int)desiredTransportType
{
  return self->_desiredTransportType;
}

- (void)setDesiredTransportType:(int)a3
{
  self->_desiredTransportType = a3;
}

- (unint64_t)initialRouteSource
{
  return self->_initialRouteSource;
}

- (void)setInitialRouteSource:(unint64_t)a3
{
  self->_initialRouteSource = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (BOOL)isApproachingWaypoint
{
  return self->_isApproachingWaypoint;
}

- (void)setIsApproachingWaypoint:(BOOL)a3
{
  self->_isApproachingWaypoint = a3;
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (void)setDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequest, a3);
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (void)setDirectionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_directionsResponse, a3);
}

- (MNLocation)location
{
  return self->_location;
}

- (BOOL)guidancePromptsEnabled
{
  return self->_guidancePromptsEnabled;
}

- (void)setGuidancePromptsEnabled:(BOOL)a3
{
  self->_guidancePromptsEnabled = a3;
}

- (BOOL)isDetour
{
  return self->_isDetour;
}

- (void)setIsDetour:(BOOL)a3
{
  self->_isDetour = a3;
}

- (int)headingOrientation
{
  return self->_headingOrientation;
}

- (void)setHeadingOrientation:(int)a3
{
  self->_headingOrientation = a3;
}

- (int)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(int)a3
{
  self->_navigationState = a3;
}

- (GEONavigationGuidanceState)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceState, a3);
}

- (BOOL)isInPreArrivalState
{
  return self->_isInPreArrivalState;
}

- (void)setIsInPreArrivalState:(BOOL)a3
{
  self->_isInPreArrivalState = a3;
}

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (unint64_t)reconnectionRouteIndex
{
  return self->_reconnectionRouteIndex;
}

- (unint64_t)selectedPreviewRouteIndex
{
  return self->_selectedPreviewRouteIndex;
}

- (GEOComposedRoute)originalRoute
{
  return self->_originalRoute;
}

- ($212C09783140BCCD23384160D545CE0D)lastOriginalRouteCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_lastOriginalRouteCoordinate;
}

- (unint64_t)targetLegIndex
{
  return self->_targetLegIndex;
}

- (void)setTargetLegIndex:(unint64_t)a3
{
  self->_targetLegIndex = a3;
}

- (int64_t)upcomingAnchorPointIndex
{
  return self->_upcomingAnchorPointIndex;
}

- (unint64_t)displayedStepIndex
{
  return self->_displayedStepIndex;
}

- (void)setDisplayedStepIndex:(unint64_t)a3
{
  self->_displayedStepIndex = a3;
}

- (double)proceedToRouteDistance
{
  return self->_proceedToRouteDistance;
}

- (void)setProceedToRouteDistance:(double)a3
{
  self->_proceedToRouteDistance = a3;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (unint64_t)closestStepIndex
{
  return self->_closestStepIndex;
}

- (void)setClosestStepIndex:(unint64_t)a3
{
  self->_closestStepIndex = a3;
}

- (double)distanceUntilSign
{
  return self->_distanceUntilSign;
}

- (void)setDistanceUntilSign:(double)a3
{
  self->_distanceUntilSign = a3;
}

- (double)timeUntilSign
{
  return self->_timeUntilSign;
}

- (void)setTimeUntilSign:(double)a3
{
  self->_timeUntilSign = a3;
}

- (double)distanceUntilManeuver
{
  return self->_distanceUntilManeuver;
}

- (void)setDistanceUntilManeuver:(double)a3
{
  self->_distanceUntilManeuver = a3;
}

- (double)timeUntilManeuver
{
  return self->_timeUntilManeuver;
}

- (void)setTimeUntilManeuver:(double)a3
{
  self->_timeUntilManeuver = a3;
}

- (NSString)currentVoiceLanguage
{
  return self->_currentVoiceLanguage;
}

- (void)setCurrentVoiceLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (unint64_t)voiceGuidanceLevel
{
  return self->_voiceGuidanceLevel;
}

- (void)setVoiceGuidanceLevel:(unint64_t)a3
{
  self->_voiceGuidanceLevel = a3;
}

- (MNGuidanceLaneInfo)activeLaneInfo
{
  return self->_activeLaneInfo;
}

- (void)setActiveLaneInfo:(id)a3
{
  objc_storeStrong((id *)&self->_activeLaneInfo, a3);
}

- (NSArray)spokenAnnouncements
{
  return &self->_spokenAnnouncements->super;
}

- (void)setSpokenAnnouncements:(id)a3
{
  objc_storeStrong((id *)&self->_spokenAnnouncements, a3);
}

- (MNNavTrayGuidanceEvent)activeNavTrayGuidanceEvent
{
  return self->_activeNavTrayGuidanceEvent;
}

- (void)setActiveNavTrayGuidanceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, a3);
}

- (MNArrivalInfo)arrivalInfo
{
  return self->_arrivalInfo;
}

- (void)setArrivalInfo:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalInfo, a3);
}

- (MNActiveRouteInfo)backgroundWalkingRouteInfo
{
  return self->_backgroundWalkingRouteInfo;
}

- (void)setBackgroundWalkingRouteInfo:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundWalkingRouteInfo, a3);
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void)setVehicleParkingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, a3);
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (BOOL)traceIsPlaying
{
  return self->_traceIsPlaying;
}

- (void)setTraceIsPlaying:(BOOL)a3
{
  self->_traceIsPlaying = a3;
}

- (double)traceDuration
{
  return self->_traceDuration;
}

- (void)setTraceDuration:(double)a3
{
  self->_traceDuration = a3;
}

- (double)tracePosition
{
  return self->_tracePosition;
}

- (void)setTracePosition:(double)a3
{
  self->_tracePosition = a3;
}

- (NSArray)traceBookmarks
{
  return self->_traceBookmarks;
}

- (void)setTraceBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_traceBookmarks, a3);
}

- (int64_t)simulationType
{
  return self->_simulationType;
}

- (void)setSimulationType:(int64_t)a3
{
  self->_simulationType = a3;
}

- (NSMutableDictionary)routeLookup
{
  return self->_routeLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceBookmarks, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_vehicleParkingInfo, 0);
  objc_storeStrong((id *)&self->_backgroundWalkingRouteInfo, 0);
  objc_storeStrong((id *)&self->_arrivalInfo, 0);
  objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_activeLaneInfo, 0);
  objc_storeStrong((id *)&self->_currentVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_routeLookupLock, 0);
  objc_storeStrong((id *)&self->_spokenAnnouncements, 0);
  objc_storeStrong((id *)&self->_trafficIncidentAlerts, 0);
  objc_storeStrong((id *)&self->_routeLookup, 0);
  objc_storeStrong((id *)&self->_routeIDLookup, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_alternateRoutes, 0);
  objc_storeStrong((id *)&self->_previewRoutes, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_guidanceState, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
