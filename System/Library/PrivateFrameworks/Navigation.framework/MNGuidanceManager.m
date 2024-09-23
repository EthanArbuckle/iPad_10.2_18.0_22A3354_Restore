@implementation MNGuidanceManager

- (MNGuidanceManager)initWithNavigationSessionState:(id)a3 audioManager:(id)a4 isReconnecting:(BOOL)a5 announcementsToIgnore:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  MNGuidanceManager *v14;
  MNAnnouncementEngine *v15;
  MNAnnouncementEngine *announcementEngine;
  NSMutableDictionary *v17;
  NSMutableDictionary *announcementsSpoken;
  NSMutableSet *v19;
  NSMutableSet *exclusiveSetAnnouncementsSpoken;
  NSMutableDictionary *v21;
  NSMutableDictionary *hapticsTriggered;
  NSMutableDictionary *v23;
  NSMutableDictionary *feedback;
  GEOComposedGuidanceEvent *currentLaneGuidanceEvent;
  MNGuidanceSignInfo *signInfo;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSMutableDictionary *v41;
  void *v42;
  MNGuidanceManager *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  uint8_t buf[4];
  NSMutableDictionary *v52;
  _BYTE v53[128];
  uint64_t v54;

  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10
    && (objc_msgSend(v10, "currentRouteInfo"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13)
    && (v50.receiver = self,
        v50.super_class = (Class)MNGuidanceManager,
        v14 = -[MNGuidanceManager init](&v50, sel_init),
        (self = v14) != 0))
  {
    objc_storeStrong((id *)&v14->_audioManager, a4);
    v15 = objc_alloc_init(MNAnnouncementEngine);
    announcementEngine = self->_announcementEngine;
    self->_announcementEngine = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    announcementsSpoken = self->_announcementsSpoken;
    self->_announcementsSpoken = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
    self->_exclusiveSetAnnouncementsSpoken = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hapticsTriggered = self->_hapticsTriggered;
    self->_hapticsTriggered = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    feedback = self->_feedback;
    self->_feedback = v23;

    -[MNGuidanceManager _resetLastAnnouncementTime](self, "_resetLastAnnouncementTime");
    *(_WORD *)&self->_hasBeenOnRouteOnce = 256;
    self->_isInPreArrivalState = 0;
    currentLaneGuidanceEvent = self->_currentLaneGuidanceEvent;
    self->_currentLaneGuidanceEvent = 0;

    signInfo = self->_signInfo;
    self->_signInfo = 0;

    -[MNGuidanceManager setNavigationSessionState:](self, "setNavigationSessionState:", v10);
    -[MNGuidanceManager route](self, "route");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _initSpecialGuidanceEventsForRoute:](self, "_initSpecialGuidanceEventsForRoute:", v27);

    if (v7)
    {
      v45 = v11;
      -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 1, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v29);

      -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 2, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v31);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_specialSignEvents, "objectForKeyedSubscript:", &unk_1E620F170);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, &unk_1E620F188);

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v33 = v12;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v47;
        do
        {
          v37 = 0;
          do
          {
            if (*(_QWORD *)v47 != v36)
              objc_enumerationMutation(v33);
            v38 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v37);
            +[MNTimeManager currentDate](MNTimeManager, "currentDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_announcementsSpoken, "setObject:forKeyedSubscript:", v39, v38);

            ++v37;
          }
          while (v35 != v37);
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v35);
      }

      MNGetMNGuidanceManagerLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_announcementsSpoken;
        *(_DWORD *)buf = 138412290;
        v52 = v41;
        _os_log_impl(&dword_1B0AD7000, v40, OS_LOG_TYPE_INFO, "ⓖ Restarting guidance after a navd reconnection. Ignoring announcements: %@", buf, 0xCu);
      }

      v11 = v45;
    }
    +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "registerObserver:", self);

    self = self;
    v43 = self;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (void)_initSpecialGuidanceEventsForRoute:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *specialSpokenEvents;
  NSMutableDictionary *v7;
  NSMutableDictionary *specialSignEvents;
  NSMutableDictionary *v9;
  NSMutableDictionary *specialNavTrayEvents;
  NSMutableDictionary *v11;
  NSMutableDictionary *specialAREvents;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  id *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSMutableDictionary **p_specialAREvents;
  NSMutableDictionary **p_specialNavTrayEvents;
  NSMutableDictionary **p_specialSignEvents;
  NSMutableDictionary **p_specialSpokenEvents;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    specialSpokenEvents = self->_specialSpokenEvents;
    p_specialSpokenEvents = &self->_specialSpokenEvents;
    self->_specialSpokenEvents = v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    specialSignEvents = self->_specialSignEvents;
    p_specialSignEvents = &self->_specialSignEvents;
    self->_specialSignEvents = v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    specialNavTrayEvents = self->_specialNavTrayEvents;
    p_specialNavTrayEvents = &self->_specialNavTrayEvents;
    self->_specialNavTrayEvents = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    specialAREvents = self->_specialAREvents;
    p_specialAREvents = &self->_specialAREvents;
    self->_specialAREvents = v11;

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v32 = v4;
    objc_msgSend(v4, "composedGuidanceEvents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (!v13)
      goto LABEL_22;
    v14 = v13;
    v15 = *(_QWORD *)v39;
    v16 = 0x1E0CB3000uLL;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v18, "isSpecial"))
        {
          v19 = objc_msgSend(v18, "hasSpokenGuidance");
          v20 = (id *)p_specialSpokenEvents;
          if ((v19 & 1) == 0)
          {
            v21 = objc_msgSend(v18, "hasSignGuidance");
            v20 = (id *)p_specialSignEvents;
            if ((v21 & 1) == 0)
            {
              objc_msgSend(v18, "navTrayTitleString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {

                v20 = (id *)p_specialNavTrayEvents;
              }
              else
              {
                objc_msgSend(v18, "navTrayDetailString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                v20 = (id *)p_specialNavTrayEvents;
                if (!v23)
                {
                  v24 = objc_msgSend(v18, "hasArGuidance");
                  v20 = (id *)p_specialAREvents;
                  if (!v24)
                    continue;
                }
              }
            }
          }
          v25 = *v20;
          if (v25)
          {
            v26 = v25;
            objc_msgSend(*(id *)(v16 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v18, "legIndex"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28)
            {
              v28 = (void *)objc_opt_new();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v27);
            }
            v29 = v16;
            objc_msgSend(*(id *)(v16 + 2024), "numberWithInt:", objc_msgSend(v18, "composedGuidanceEventType"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKeyedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              v31 = (void *)objc_opt_new();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, v30);
            }
            objc_msgSend(v31, "addObject:", v18);

            v16 = v29;
          }
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v14)
      {
LABEL_22:

        v4 = v32;
        break;
      }
    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MNTimeManager sharedManager](MNTimeManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MNGuidanceManager;
  -[MNGuidanceManager dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  MNJunctionViewImageLoader *junctionViewImageLoader;
  NSMutableArray *events;
  NSDictionary *eventIndexes;
  GEOComposedGuidanceEvent *nextEvent;
  MNGuidanceSignInfo *signInfo;
  MNAnnouncementPlanEvent *lastAnnouncementEvent;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  junctionViewImageLoader = self->_junctionViewImageLoader;
  self->_junctionViewImageLoader = 0;

  events = self->_events;
  self->_events = 0;

  eventIndexes = self->_eventIndexes;
  self->_eventIndexes = 0;

  nextEvent = self->_nextEvent;
  self->_nextEvent = 0;

  signInfo = self->_signInfo;
  self->_signInfo = 0;

  lastAnnouncementEvent = self->_lastAnnouncementEvent;
  self->_lastAnnouncementEvent = 0;

  self->_canSpeakReturnToRouteAnnouncement = 1;
  -[MNGuidanceManager _resetLastAnnouncementTime](self, "_resetLastAnnouncementTime");
  -[NSMutableDictionary removeAllObjects](self->_feedback, "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 6; ++i)
  {
    v11 = dword_1B0BF315C[i];
    -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", v11, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v13))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);

    }
  }
  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex"))
  {
    -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v16))
      objc_msgSend(v9, "addObject:", &unk_1E620F188);

  }
  -[NSMutableDictionary removeAllObjects](self->_announcementsSpoken, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_exclusiveSetAnnouncementsSpoken, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_hapticsTriggered, "removeAllObjects");
  -[MNGuidanceManager route](self, "route");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _initSpecialGuidanceEventsForRoute:](self, "_initSpecialGuidanceEventsForRoute:", v17);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "unsignedIntegerValue", (_QWORD)v25), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v24);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

}

- (void)_resetLastAnnouncementTime
{
  double v3;

  +[MNTimeManager currentTime](MNTimeManager, "currentTime");
  self->_timeLastAnnouncementStarted = v3;
  self->_timeLastAnnouncementEnded = v3;
}

- (NSArray)events
{
  NSMutableArray *events;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  events = self->_events;
  if (!events)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[MNGuidanceManager route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composedGuidanceEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v6);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[MNGuidanceManager route](self, "route", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enrouteNotices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "guidanceEvents");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    -[NSMutableArray sortUsingSelector:](v7, "sortUsingSelector:", sel_compare_);
    v15 = self->_events;
    self->_events = v7;

    events = self->_events;
  }
  return (NSArray *)events;
}

- (GEOComposedRoute)route
{
  void *v2;
  void *v3;
  void *v4;

  -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRouteInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedRoute *)v4;
}

- (unint64_t)currentLegIndex
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MNLocation *location;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[MNGuidanceManager navigationSessionState](self, "navigationSessionState"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "targetLegIndex"),
        v5,
        v4,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "targetLegIndex");
  }
  else
  {
    location = self->_location;
    if (!location)
      return 0x7FFFFFFFFFFFFFFFLL;
    -[MNLocation routeMatch](location, "routeMatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "legIndex");
  }
  v10 = v9;

  return v10;
}

- (void)stop
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  MNGetMNGuidanceManagerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[MNGuidanceManager stop]";
    _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEBUG, "ⓖ %s", (uint8_t *)&v3, 0xCu);
  }

}

- (BOOL)repeatLastGuidanceAnnouncement:(id)a3
{
  NSObject *v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MNGuidanceManager *v19;
  void *v20;
  uint64_t v21;
  MNAnnouncementPlanEvent *lastAnnouncementEvent;
  BOOL v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  MNGetMNGuidanceManagerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[MNGuidanceManager repeatLastGuidanceAnnouncement:]";
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEBUG, "ⓖ %s", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_location, a3);
  -[MNGuidanceManager _adjustedVehicleSpeed](self, "_adjustedVehicleSpeed");
  self->_speed = v6;
  +[MNPhoneCallObserver sharedPhoneCallObserver](MNPhoneCallObserver, "sharedPhoneCallObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasActiveCalls") ^ 1;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_validEvents;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "announcements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "sortUsingSelector:", sel_comparePriority_);
    objc_msgSend(v9, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = v18;
    v21 = 0;
  }
  else
  {
    lastAnnouncementEvent = self->_lastAnnouncementEvent;
    if (!lastAnnouncementEvent)
    {
      v23 = 0;
      goto LABEL_17;
    }
    -[MNAnnouncementPlanEvent event](lastAnnouncementEvent, "event");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    v20 = v18;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](v19, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v20, 0, v21, v8);

  v23 = 1;
LABEL_17:

  return v23;
}

- (void)updateDestination:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MNGetMNGuidanceManagerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[MNGuidanceManager updateDestination:]";
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEBUG, "ⓖ %s", (uint8_t *)&v4, 0xCu);
  }

}

- (void)updateSessionStateForReroute:(id)a3 reason:(unint64_t)a4 location:(id)a5
{
  id v8;
  id v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = 0;
  v11 = 1;
  switch(a4)
  {
    case 5uLL:
      v10 = 0;
      self->_isInPreArrivalState = 0;
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xBuLL:
      v10 = 1;
      break;
    case 0xFuLL:
      v11 = 0;
      v10 = 0;
      break;
    default:
      break;
  }
  -[MNGuidanceManager setNavigationSessionState:](self, "setNavigationSessionState:", v8);
  -[MNGuidanceManager reset](self, "reset");
  if (v9)
    objc_storeStrong((id *)&self->_location, a5);
  if (v10)
  {
    -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNGuidanceManager route](self, "route");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v13, objc_msgSend(v15, "waypointCategory"), 0x7FFFFFFFFFFFFFFFLL, 0);

  }
  if (v9)
    v16 = v11;
  else
    v16 = 1;
  if ((v16 & 1) == 0 && objc_msgSend(v9, "state") == 1)
  {
    objc_msgSend(v9, "routeMatch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "routeCoordinate");

    MNGetMNGuidanceManagerLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      GEOPolylineCoordinateAsFullString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_1B0AD7000, v18, OS_LOG_TYPE_DEFAULT, "Updating guidance manager for new route. New location is on route, so suppressing guidance events up to [%@].", buf, 0xCu);

    }
    v20 = objc_msgSend(v9, "stepIndex");
    if (v20 <= 1)
      v21 = 1;
    else
      v21 = v20;
    v32 = v8;
    objc_msgSend(v8, "currentRouteInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "route");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = v23;
    objc_msgSend(v23, "composedGuidanceEvents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v29, "hasSpokenGuidance"))
          {
            if ((objc_msgSend(v29, "isSpecial") & 1) == 0 && objc_msgSend(v29, "stepIndex") <= v21)
            {
              if (objc_msgSend(v29, "stepIndex") != v21
                || (objc_msgSend(v29, "startValidRouteCoordinate"), GEOPolylineCoordinateIsABeforeB()))
              {
                MNGetMNGuidanceManagerLog();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v39 = v29;
                  _os_log_impl(&dword_1B0AD7000, v30, OS_LOG_TYPE_INFO, "Suppressing guidance event: \"%@\", buf, 0xCu);
                }

                -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v29);
              }
            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v26);
    }

    v8 = v32;
  }

}

- (void)updateGuidanceForLocation:(id)a3 navigatorState:(int)a4
{
  id v6;
  double v7;
  NSObject *v8;
  MNJunctionViewImageLoader *junctionViewImageLoader;
  MNJunctionViewImageLoader *v10;
  MNJunctionViewImageLoader *v11;
  MNJunctionViewImageLoader *v12;
  void *v13;
  id WeakRetained;
  id v15;
  uint8_t v16[16];

  v6 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  -[MNGuidanceManager _adjustedVehicleSpeed](self, "_adjustedVehicleSpeed");
  self->_speed = v7;
  -[MNGuidanceManager _filterValidEvents](self, "_filterValidEvents");
  if (!-[NSMutableArray count](self->_validEvents, "count"))
  {
    MNGetMNGuidanceManagerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEBUG, "ⓖ No valid guidance events found.", v16, 2u);
    }

  }
  junctionViewImageLoader = self->_junctionViewImageLoader;
  if (!junctionViewImageLoader)
  {
    v10 = objc_alloc_init(MNJunctionViewImageLoader);
    v11 = self->_junctionViewImageLoader;
    self->_junctionViewImageLoader = v10;

    v12 = self->_junctionViewImageLoader;
    -[MNGuidanceManager _junctionViewEvents](self, "_junctionViewEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNJunctionViewImageLoader setJunctionViewEvents:](v12, "setJunctionViewEvents:", v13);

    junctionViewImageLoader = self->_junctionViewImageLoader;
  }
  -[MNGuidanceManager _distanceToEndOfRoute](self, "_distanceToEndOfRoute");
  -[MNJunctionViewImageLoader updateForLocation:remainingDistanceOnRoute:](junctionViewImageLoader, "updateForLocation:remainingDistanceOnRoute:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "guidanceManagerBeginGuidanceUpdate:", self);

  -[MNGuidanceManager _considerAnnouncements](self, "_considerAnnouncements");
  -[MNGuidanceManager _considerHaptics](self, "_considerHaptics");
  -[MNGuidanceManager _considerLaneGuidance](self, "_considerLaneGuidance");
  -[MNGuidanceManager _considerSignGuidance](self, "_considerSignGuidance");
  -[MNGuidanceManager _considerNavTrayGuidance](self, "_considerNavTrayGuidance");
  -[MNGuidanceManager _considerPersistence](self, "_considerPersistence");
  -[MNGuidanceManager _considerJunctionViewGuidance](self, "_considerJunctionViewGuidance");
  -[MNGuidanceManager _considerARGuidance](self, "_considerARGuidance");
  v15 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v15, "guidanceManagerEndGuidanceUpdate:", self);

}

- (void)_filterValidEvents
{
  NSMutableArray *v3;
  NSMutableArray *validEvents;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  validEvents = self->_validEvents;
  self->_validEvents = v3;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MNGuidanceManager events](self, "events", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[MNGuidanceManager _isValidEvent:](self, "_isValidEvent:", v10))
          -[NSMutableArray addObject:](self->_validEvents, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_specialNavTrayEvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v4;
  NSMutableDictionary *specialNavTrayEvents;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  specialNavTrayEvents = self->_specialNavTrayEvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](specialNavTrayEvents, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_considerAnnouncements
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  -[MNGuidanceManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentlySpeaking");

  if ((v4 & 1) == 0)
  {
    -[MNGuidanceManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "guidanceManagerIsRerouting");

    if ((v6 & 1) == 0)
    {
      -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "arrivalState") == 5)
      {
        -[MNGuidanceManager location](self, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "routeMatch");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "step");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "transportType");
        -[MNGuidanceManager route](self, "route");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "transportType");

        if (v11 != v13)
          return;
      }
      else
      {

      }
      if (!-[MNGuidanceManager _considerStartingAnnouncements](self, "_considerStartingAnnouncements")
        && !-[MNGuidanceManager _considerGetOnRouteAnnouncements](self, "_considerGetOnRouteAnnouncements")
        && !-[MNGuidanceManager _considerChargingAnnouncements](self, "_considerChargingAnnouncements")
        && !-[MNGuidanceManager _considerArrivalAnnouncements](self, "_considerArrivalAnnouncements")
        && !-[MNGuidanceManager _considerOtherSpecialAnnouncements](self, "_considerOtherSpecialAnnouncements"))
      {
        -[MNGuidanceManager _planAnnouncements](self, "_planAnnouncements");
      }
    }
  }
}

- (BOOL)_considerStartingAnnouncements
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 1, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v5))
  {
    -[MNGuidanceManager route](self, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v5, objc_msgSend(v7, "waypointCategory"), 0x7FFFFFFFFFFFFFFFLL, 0);

    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_considerGetOnRouteAnnouncements
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  void *v9;
  int v10;

  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 2, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || -[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v5))
  {
    v3 = 0;
  }
  else
  {
    -[MNGuidanceManager timeSinceLastAnnouncement](self, "timeSinceLastAnnouncement");
    v7 = v6;
    v8 = -[MNAudioManager voiceGuidanceEnabled](self->_audioManager, "voiceGuidanceEnabled");
    if (v7 > 0.5 || !v8)
    {
      -[MNGuidanceManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "navigationState");

      if (v10 == 1)
        -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v5, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
      else
        -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v5);
    }
    v3 = 1;
  }

  return v3;
}

- (BOOL)_considerChargingAnnouncements
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MNGuidanceManager route](self, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEVRoute");

    if (v4)
    {
      if (self->_shouldShowChargingInfo
        || (-[MNGuidanceManager delegate](self, "delegate"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "navigationState"),
            v5,
            v6 == 7))
      {
        -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 14, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v8))
        {
          if (self->_shouldShowChargingInfo)
          {
            if (v8)
            {
              -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v8, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
              goto LABEL_9;
            }
          }
          else
          {
            -[MNGuidanceManager delegate](self, "delegate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "navigationState");

            if (v11 != 7)
            {
              -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 13, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "firstObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13 && !-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v13))
              {
                -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v13, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

                goto LABEL_9;
              }

            }
          }
          v9 = 0;
          goto LABEL_16;
        }
LABEL_9:
        v9 = 1;
LABEL_16:

        return v9;
      }
    }
  }
  return 0;
}

- (BOOL)_considerArrivalAnnouncements
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v3) = 0;
  }
  else if (self->_isInPreArrivalState || (v3 = -[MNGuidanceManager _isInArrivalState](self, "_isInArrivalState")))
  {
    if (-[MNGuidanceManager _isInArrivalState](self, "_isInArrivalState"))
      v4 = 11;
    else
      v4 = 12;
    -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", v4, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && !-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v6))
    {
      -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentWaypoint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v6, objc_msgSend(v8, "waypointCategory"), 0x7FFFFFFFFFFFFFFFLL, 0);
    }

    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_considerOtherSpecialAnnouncements
{
  BOOL result;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  if (-[MNGuidanceManager currentLegIndex](self, "currentLegIndex") == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[MNGuidanceManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "navigationState");

  if (v5 > 8)
    return 0;
  result = 1;
  if (((1 << v5) & 0x161) != 0)
    return result;
  if (((1 << v5) & 0x1A) == 0)
  {
    *(_WORD *)&self->_hasBeenOnRouteOnce = 257;
    return 0;
  }
  -[MNGuidanceManager _specialSpokenEvents:forLegIndex:](self, "_specialSpokenEvents:forLegIndex:", 3, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && self->_hasBeenOnRouteOnce && self->_canSpeakReturnToRouteAnnouncement)
  {
    -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v7, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    self->_canSpeakReturnToRouteAnnouncement = 0;
  }

  return 1;
}

- (void)_planAnnouncements
{
  void *v3;
  double v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  NSMutableDictionary *announcementsSpoken;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSMutableDictionary *v20;
  MNGuidanceManager *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  double Current;
  MNAnnouncementEngine *announcementEngine;
  double v39;
  double v40;
  double speed;
  MNAnnouncementPlanEvent *lastAnnouncementEvent;
  double v43;
  double v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  GEOComposedGuidanceEvent *nextEvent;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  BOOL v69;
  GEOComposedGuidanceEvent *v70;
  GEOComposedGuidanceEvent *v71;
  double v72;
  void *v73;
  double v74;
  NSMutableArray *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  double v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  +[MNTimeManager currentDate](MNTimeManager, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x1E0C99DE8]));
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v5 = self->_validEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v90;
    v75 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v90 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v10, "announcements");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v10, "repetitionInterval");
          if (v13 > 0.0 && -[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v10))
          {
            announcementsSpoken = self->_announcementsSpoken;
            objc_msgSend(v10, "uniqueID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](announcementsSpoken, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "timeIntervalSinceDate:", v16);
            v18 = v17;
            objc_msgSend(v10, "repetitionInterval");
            if (v18 >= v19)
            {
              v20 = self->_announcementsSpoken;
              objc_msgSend(v10, "uniqueID");
              v21 = self;
              v22 = v4;
              v23 = v3;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v24);

              v3 = v23;
              v4 = v22;
              self = v21;
              v5 = v75;
            }

          }
          if (!-[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v10))
            objc_msgSend(*(id *)&v4, "addObject:", v10);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    }
    while (v7);
  }

  -[MNGuidanceManager _spokenEventsRemainingInStep](self, "_spokenEventsRemainingInStep");
  v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  if (objc_msgSend(*(id *)&v4, "count")
    || objc_msgSend(*(id *)&v25, "count")
    && (-[MNGuidanceManager timeUntilNextAnnouncement](self, "timeUntilNextAnnouncement"), v72 == 1.79769313e308))
  {
    MNGetMNGuidanceManagerLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v96 = v4;
      _os_log_impl(&dword_1B0AD7000, v26, OS_LOG_TYPE_DEBUG, "ⓖ Valid spoken events : %{private}@", buf, 0xCu);
    }
    v76 = v3;

    MNGetMNGuidanceManagerLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v96 = v25;
      _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_DEBUG, "ⓖ Remaining events : %{private}@", buf, 0xCu);
    }

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)&v25, "count"));
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v74 = v25;
    v29 = *(id *)&v25;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v86 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
          -[MNGuidanceManager _durationsForEvent:](self, "_durationsForEvent:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "uniqueID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v35, v36);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
      }
      while (v31);
    }

    Current = CFAbsoluteTimeGetCurrent();
    announcementEngine = self->_announcementEngine;
    -[MNGuidanceManager _distanceToEndOfRoute](self, "_distanceToEndOfRoute");
    v40 = v39;
    speed = self->_speed;
    lastAnnouncementEvent = self->_lastAnnouncementEvent;
    -[MNGuidanceManager timeSinceLastAnnouncement](self, "timeSinceLastAnnouncement");
    -[MNAnnouncementEngine planForEvents:distance:speed:previousEvent:timeSinceLastEvent:durations:](announcementEngine, "planForEvents:distance:speed:previousEvent:timeSinceLastEvent:durations:", v29, lastAnnouncementEvent, v28, v40, speed, v43);
    v44 = CFAbsoluteTimeGetCurrent();
    MNGetMNGuidanceManagerLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      -[MNAnnouncementEngine plan](self->_announcementEngine, "plan");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218243;
      v96 = (v44 - Current) * 1000.0;
      v97 = 2113;
      v98 = v46;
      _os_log_impl(&dword_1B0AD7000, v45, OS_LOG_TYPE_DEBUG, "ⓖ Planned announcements in %.2fms : %{private}@", buf, 0x16u);

    }
    -[MNAnnouncementEngine nextEvent](self->_announcementEngine, "nextEvent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      objc_msgSend(v47, "event");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(*(id *)&v4, "containsObject:", v49);

      if (v50)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        -[MNAnnouncementEngine plan](self->_announcementEngine, "plan");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "plannedEvents");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v82;
LABEL_34:
          v56 = 0;
          while (1)
          {
            if (*(_QWORD *)v82 != v55)
              objc_enumerationMutation(v52);
            v57 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v56);
            if (v57 == v48)
              break;
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v56), "includeInPlan") & 1) == 0)
            {
              objc_msgSend(v57, "event");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v58);

            }
            if (v54 == ++v56)
            {
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
              if (v54)
                goto LABEL_34;
              break;
            }
          }
        }

        objc_msgSend(v48, "event");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager _notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:](self, "_notifySpeechEvent:waypointCategory:startingVariantIndex:ignorePromptStyle:", v59, 0, objc_msgSend(v48, "variantIndex"), 0);

      }
    }
    v73 = v48;
    nextEvent = self->_nextEvent;
    self->_nextEvent = 0;

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[MNAnnouncementEngine plan](self->_announcementEngine, "plan");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "plannedEvents");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v78;
      while (2)
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v78 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          if (objc_msgSend(v67, "includeInPlan"))
          {
            objc_msgSend(v67, "event");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = -[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v68);

            if (!v69)
            {
              objc_msgSend(v67, "event");
              v70 = (GEOComposedGuidanceEvent *)objc_claimAutoreleasedReturnValue();
              v71 = self->_nextEvent;
              self->_nextEvent = v70;

              goto LABEL_54;
            }
          }
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        if (v64)
          continue;
        break;
      }
    }
LABEL_54:

    v25 = v74;
    v3 = v76;
  }

}

- (id)_spokenEventsRemainingInStep
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endRouteCoordinate");

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MNGuidanceManager events](self, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "announcements");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
          v12 = -[MNGuidanceManager _eventWasSpoken:](self, "_eventWasSpoken:", v10);
        else
          v12 = 1;

        -[MNLocation routeMatch](self->_location, "routeMatch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "routeCoordinate");
        objc_msgSend(v10, "endValidRouteCoordinate");
        v14 = GEOPolylineCoordinateCompare();

        objc_msgSend(v10, "startValidRouteCoordinate");
        v15 = GEOPolylineCoordinateCompare();
        if (!v12 && v14 == -1 && v15 == -1 && (objc_msgSend(v10, "isSpecial") & 1) == 0)
        {
          -[MNLocation speed](self->_location, "speed");
          if (objc_msgSend(v10, "isValidForSpeed:"))
            objc_msgSend(v18, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__MNGuidanceManager__spokenEventsRemainingInStep__block_invoke;
  v19[3] = &unk_1E61D32D8;
  v19[4] = self;
  objc_msgSend(v18, "sortUsingComparator:", v19);
  return v18;
}

uint64_t __49__MNGuidanceManager__spokenEventsRemainingInStep__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareFactoringInSpeed:speed:", *(double *)(*(_QWORD *)(a1 + 32) + 224));
}

- (void)_notifySpeechEvent:(id)a3 waypointCategory:(int)a4 startingVariantIndex:(unint64_t)a5 ignorePromptStyle:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  double v11;
  MNAnnouncementPlanEvent *v12;
  double v13;
  double v14;
  double speed;
  void *v16;
  MNAnnouncementPlanEvent *v17;
  MNAnnouncementPlanEvent *lastAnnouncementEvent;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  MNAnnouncementPlanEvent *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  _BYTE v39[18];
  __int16 v40;
  void *v41;
  uint64_t v42;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MNGuidanceManager _markEventSpoken:](self, "_markEventSpoken:", v10);
  +[MNTimeManager currentTime](MNTimeManager, "currentTime");
  self->_timeLastAnnouncementStarted = v11;
  v12 = [MNAnnouncementPlanEvent alloc];
  -[MNGuidanceManager _distanceToEndOfRoute](self, "_distanceToEndOfRoute");
  v14 = v13;
  speed = self->_speed;
  -[MNGuidanceManager _durationsForEvent:](self, "_durationsForEvent:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MNAnnouncementPlanEvent initWithEvent:distance:speed:durations:](v12, "initWithEvent:distance:speed:durations:", v10, v16, v14, speed);
  lastAnnouncementEvent = self->_lastAnnouncementEvent;
  self->_lastAnnouncementEvent = v17;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[MNGuidanceManager _spokenStringForEvent:waypointCategory:](self, "_spokenStringForEvent:waypointCategory:", v10, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MNGetMNGuidanceManagerLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v10, "composedGuidanceEventType");
      if (v21 >= 0xF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_1E61D34E8[(int)v21];
      }
      v26 = v22;
      if (v8 >= 0xE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = off_1E61D3430[(int)v8];
      }
      *(_DWORD *)buf = 138412803;
      *(_QWORD *)v39 = v26;
      *(_WORD *)&v39[8] = 2112;
      *(_QWORD *)&v39[10] = v27;
      v40 = 2113;
      v41 = v19;
      _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_DEFAULT, "ⓖ Requesting announcement with event type (%@) and waypoint category (%@): %{private}@", buf, 0x20u);

    }
    objc_msgSend(v10, "spokenStrings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "count");

    v25 = self->_lastAnnouncementEvent;
    v24 = 0;
  }
  else
  {
    -[MNGuidanceManager _timeRemainingForEvent:](self, "_timeRemainingForEvent:", v10);
    v36 = 0;
    -[MNGuidanceManager _selectAnnouncementForEvent:withTimeRemaining:selectedVariantIndex:](self, "_selectAnnouncementForEvent:withTimeRemaining:selectedVariantIndex:", v10, &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MNGetMNGuidanceManagerLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)v39 = v36;
      *(_WORD *)&v39[4] = 2113;
      *(_QWORD *)&v39[6] = v19;
      _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_DEFAULT, "ⓖ Requesting announcement with variant index (%d): %{private}@", buf, 0x12u);
    }

    v24 = v36;
    v25 = self->_lastAnnouncementEvent;
  }
  -[MNAnnouncementPlanEvent setVariantIndex:](v25, "setVariantIndex:", v24);
  v37 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v29, 0);

  -[MNGuidanceManager delegate](self, "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "guidanceManager:willProcessSpeechEvent:", self, v10);

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __96__MNGuidanceManager__notifySpeechEvent_waypointCategory_startingVariantIndex_ignorePromptStyle___block_invoke;
  v34[3] = &unk_1E61D3300;
  v34[4] = self;
  v35 = v10;
  v31 = v10;
  v32 = (void *)MEMORY[0x1B5E0E364](v34);
  -[MNGuidanceManager delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "guidanceManager:announce:isImportant:shortPromptType:ignorePromptStyle:stage:completionBlock:", self, v19, objc_msgSend(v31, "isImportant"), MNInstructionsShortPromptTypeForManeuver(objc_msgSend(v31, "maneuverType"), objc_msgSend(v31, "drivingSide")), v6, -[MNGuidanceManager _announcementStageForEvent:](self, "_announcementStageForEvent:", v31), v32);

}

void __96__MNGuidanceManager__notifySpeechEvent_waypointCategory_startingVariantIndex_ignorePromptStyle___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  NSObject *v7;
  const char *v8;
  double *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[MNTimeManager currentTime](MNTimeManager, "currentTime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v4;
  if (a2 < 9)
  {
    MNGetMNGuidanceManagerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = off_1E61D34A0[a2];
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "⒢ Announcement not spoken, MNAudioCompletionStatus code=%@", buf, 0xCu);

    }
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_15;
    objc_msgSend(v16, "startTime");
    objc_msgSend(v16, "setEndTime:");
LABEL_14:
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "guidanceManager:updatedGuidanceEventFeedback:", *(_QWORD *)(a1 + 32), v16);

LABEL_15:
    goto LABEL_16;
  }
  if (a2 - 9 < 2)
  {
    MNGetMNGuidanceManagerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (a2 == 10)
        v8 = "sound effect";
      else
        v8 = "speech";
      v9 = *(double **)(a1 + 32);
      v10 = v9[14] - v9[13];
      objc_msgSend(v9, "route");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "routeMatch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stepDistanceFromPoint:toPoint:", objc_msgSend(v12, "routeCoordinate"), objc_msgSend(*(id *)(a1 + 40), "endValidRouteCoordinate"));
      *(_DWORD *)buf = 136315650;
      v22 = (void *)v8;
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = v13;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓖ Finished %s announcement in %.2f seconds, with %.2f meters to go", buf, 0x20u);

    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 240);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_15;
    objc_msgSend(v16, "setEndTime:", CFAbsoluteTimeGetCurrent());
    objc_msgSend(*(id *)(a1 + 32), "_distanceToManeuverStart");
    objc_msgSend(v16, "setEndDistance:");
    goto LABEL_14;
  }
LABEL_16:
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "guidanceManager:didProcessSpeechEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)_announcementStageForEvent:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasSpokenGuidance"))
  {
    v4 = objc_msgSend(v3, "composedGuidanceEventType") - 4;
    if (v4 <= 4)
      v5 = v4 + 1;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_spokenStringForEvent:(id)a3 waypointCategory:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  __CFString *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "spokenStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "count");
    if ((_DWORD)v4 && v9 >= 2)
    {
      MNGetMNGuidanceManagerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(v6, "composedGuidanceEventType");
        if (v11 >= 0xF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = off_1E61D34E8[(int)v11];
        }
        v13 = v12;
        if (v4 >= 0xE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_1E61D3560[(int)v4 - 1];
        }
        *(_DWORD *)buf = 138412546;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Requested announcement from event (%@) with a waypoint category of (%@), but there are multiple spoken variants. This probably means Routing is still sending the old style variant lists for this event.", buf, 0x16u);

      }
      if (objc_msgSend(v7, "count") <= (unint64_t)(int)v4)
        v15 = 0;
      else
        v15 = (int)v4;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = (__CFString *)v16;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__MNGuidanceManager__spokenStringForEvent_waypointCategory___block_invoke;
    v23[3] = &unk_1E61D3328;
    v23[4] = self;
    v24 = v6;
    -[__CFString optionsWithArgumentHandler:](v8, "optionsWithArgumentHandler:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringResultWithOptions:](v8, "stringResultWithOptions:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "success") & 1) == 0)
    {
      MNGetMNGuidanceManagerLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v18, "string");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_FAULT, "ⓖ Error building spoken string, probably because some arguments were not handled.\nResult: %@\nOriginal string: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v18, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __60__MNGuidanceManager__spokenStringForEvent_waypointCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpokenStringArgument:event:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_selectAnnouncementForEvent:(id)a3 withTimeRemaining:(double)a4 selectedVariantIndex:(unint64_t *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  NSObject *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  _BYTE v42[24];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "spokenStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    v11 = 0;
    if (a4 == 1.79769313e308)
      v12 = -1.0;
    else
      v12 = a4;
    do
    {
      objc_msgSend(v7, "spokenStrings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __88__MNGuidanceManager__selectAnnouncementForEvent_withTimeRemaining_selectedVariantIndex___block_invoke;
      v39[3] = &unk_1E61D3328;
      v39[4] = self;
      v15 = v7;
      v40 = v15;
      objc_msgSend(v14, "optionsWithArgumentHandler:", v39);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringResultWithOptions:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "success"))
      {
        objc_msgSend(v17, "string");
        v18 = objc_claimAutoreleasedReturnValue();

        -[MNAudioManager durationOf:](self->_audioManager, "durationOf:", v18);
        v20 = v19;
        MNGetMNGuidanceManagerLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)v42 = v11;
          *(_WORD *)&v42[4] = 2048;
          *(double *)&v42[6] = v20;
          *(_WORD *)&v42[14] = 2048;
          *(double *)&v42[16] = v12;
          _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_DEBUG, "ⓖ Considering announcement %d with duration %.1f, time remaining %.1f", buf, 0x1Cu);
        }

        v22 = v20 <= a4;
        v10 = (void *)v18;
      }
      else
      {
        MNGetMNGuidanceManagerLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v17, "string");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v42 = v24;
          *(_WORD *)&v42[8] = 2112;
          *(_QWORD *)&v42[10] = v14;
          _os_log_impl(&dword_1B0AD7000, v23, OS_LOG_TYPE_FAULT, "ⓖ Error building spoken string, probably because some arguments were not handled.\nResult: %@\nOriginal string: %@", buf, 0x16u);

        }
        v22 = 0;
      }

      if (v22)
        break;
      ++v11;
      objc_msgSend(v15, "spokenStrings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

    }
    while (v11 < v26);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  objc_msgSend(v7, "spokenStrings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v11 >= v28)
  {
    objc_msgSend(v7, "spokenStrings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v32, "count") - 1;

    MNGetMNGuidanceManagerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v42 = v11;
      _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEBUG, "ⓖ Selected announcement %d (not short enough)", buf, 8u);
    }
  }
  else
  {
    MNGetMNGuidanceManagerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "announcements");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v42 = v11;
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)&v42[6] = v31;
      _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_DEBUG, "ⓖ Selected announcement %d (%d variant(s))", buf, 0xEu);

    }
  }

  *a5 = v11;
  objc_msgSend(v7, "spokenStrings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isPrivate");

  if (v35)
  {
    objc_msgSend(v10, "_navigation_stringByMarkingAsPrivateText");
    v36 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v36;
  }

  return v10;
}

uint64_t __88__MNGuidanceManager__selectAnnouncementForEvent_withTimeRemaining_selectedVariantIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpokenStringArgument:event:", a2, *(_QWORD *)(a1 + 40));
}

- (BOOL)_updateSpokenStringArgument:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  int v8;
  BOOL v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  float v34;
  double v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _QWORD v43[4];
  id v44;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  v9 = 0;
  if (v8 > 9)
  {
    switch(v8)
    {
      case 10:
        -[MNGuidanceManager route](self, "route");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "legs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "destination");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "token");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend(v27, "isEqualToString:", CFSTR("{Name}"));

        if ((_DWORD)v25)
        {
          objc_msgSend(v14, "navAnnouncementName");
          v28 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "token");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("{Address}"));

          if (!v37)
          {
LABEL_22:

            goto LABEL_27;
          }
          objc_msgSend(v14, "navAnnouncementAddress");
          v28 = objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v28;
        objc_msgSend(v6, "stringFormat");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setOverrideValue:", v17);

LABEL_21:
        goto LABEL_22;
      case 13:
        objc_msgSend(v6, "token");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("{ChargePercentage}"));

        if (v30)
        {
          -[MNGuidanceManager route](self, "route");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "mutableData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "batteryPercentageAfterCharging");
          v34 = v33;
          objc_msgSend(v6, "percentageFormat");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v35 = v34;
          objc_msgSend(v17, "setOverrideValue:", v35);
          goto LABEL_21;
        }
        goto LABEL_27;
      case 18:
        objc_msgSend(v6, "substitutionFormat");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager route](self, "route");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "waypoints");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v18, "waypointIndex");
        if (v21 >= objc_msgSend(v20, "count"))
          objc_msgSend(v20, "lastObject");
        else
          objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v18, "waypointIndex"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "waypointCategory");
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __55__MNGuidanceManager__updateSpokenStringArgument_event___block_invoke;
        v43[3] = &unk_1E61D3350;
        v44 = v39;
        v41 = v39;
        objc_msgSend(v18, "setSubstitutionForWaypointCategory:handler:", v40, v43);

        goto LABEL_25;
    }
  }
  else
  {
    if ((v8 - 3) < 2)
    {
      objc_msgSend(v6, "token");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("{ChargeDuration}"));

      if (v11)
      {
        -[MNGuidanceManager route](self, "route");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mutableData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "chargingTime");
        v16 = v15;
        objc_msgSend(v6, "durationFormat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setOverrideValue:", v16);
        goto LABEL_21;
      }
LABEL_27:
      v9 = 1;
      goto LABEL_28;
    }
    if (v8 == 1)
    {
      objc_msgSend(v6, "distanceFormat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFormatOptions:", 28);
      if ((objc_msgSend(v7, "isSpecial") & 1) != 0)
        goto LABEL_26;
      objc_msgSend(v6, "token");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("{distance}"));

      if (!v23)
        goto LABEL_26;
      -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v7, "coordinateForDistanceStrings"));
      objc_msgSend(MEMORY[0x1E0CB3758], "_geo_distanceMeasurementForMeters:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setOverrideValue:", v20);
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
  }
LABEL_28:

  return v9;
}

id __55__MNGuidanceManager__updateSpokenStringArgument_event___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "bestSpokenName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "bestSpokenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverrideValue:", v8);

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (id)_serverStringDictionaryForEvent:(id)a3 distance:(double)a4 validDistance:(double)a5 spoken:(BOOL)a6 waypoints:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  if (-[MNGuidanceManager _isEVChargingEvent:](self, "_isEVChargingEvent:", v12))
  {
    -[MNGuidanceManager _serverStringDictionaryForChargingEvent:](self, "_serverStringDictionaryForChargingEvent:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C99D80];
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentWaypoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_navigation_serverStringDictionaryForDistance:validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:", v13, v17, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"), v8, objc_msgSend(v12, "hasArGuidance"), a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_serverStringDictionaryForChargingEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[MNGuidanceManager route](self, "route", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chargingStationInfoForLegIndex:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chargingTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("{ChargeDuration}"));

  objc_msgSend(v6, "batteryPercentageAfterCharging");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("{ChargePercentage}"));

  v12 = CFSTR("{fromOrigin}");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_durationsForEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "spokenStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__MNGuidanceManager__durationsForEvent___block_invoke;
  v9[3] = &unk_1E61D3378;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_geo_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__MNGuidanceManager__durationsForEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__MNGuidanceManager__durationsForEvent___block_invoke_2;
  v13 = &unk_1E61D3328;
  v4 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v5 = a2;
  objc_msgSend(v5, "optionsWithArgumentHandler:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithOptions:", v6, v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "durationOf:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __40__MNGuidanceManager__durationsForEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSpokenStringArgument:event:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_considerHaptics
{
  void *v3;
  NSMutableDictionary *hapticsTriggered;
  void *v5;
  void *v6;
  void *v7;
  GEOComposedGuidanceEvent *v8;
  double v9;
  double v10;
  uint64_t v11;
  id WeakRetained;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v20;
  int v21;
  GEOComposedGuidanceEvent *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MNAnnouncementPlanEvent event](self->_lastAnnouncementEvent, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasHaptics") & 1) != 0)
  {
    hapticsTriggered = self->_hapticsTriggered;
    -[MNAnnouncementPlanEvent event](self->_lastAnnouncementEvent, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](hapticsTriggered, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[MNAnnouncementPlanEvent event](self->_lastAnnouncementEvent, "event");
      v8 = (GEOComposedGuidanceEvent *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

  }
  v8 = 0;
LABEL_6:
  if (self->_nextEvent)
  {
    -[MNGuidanceManager timeUntilNextAnnouncement](self, "timeUntilNextAnnouncement");
    v10 = v9;
    if (!v8 && -[GEOComposedGuidanceEvent hasHaptics](self->_nextEvent, "hasHaptics") && v10 <= 2.0)
      v8 = self->_nextEvent;
    if (-[GEOComposedGuidanceEvent hasHaptics](self->_nextEvent, "hasHaptics"))
      v11 = 5;
    else
      v11 = 3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "guidanceManager:willAnnounce:inSeconds:", self, v11, v10);

  }
  if (v8)
  {
    v13 = self->_hapticsTriggered;
    -[GEOComposedGuidanceEvent uniqueID](v8, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      MNGetMNGuidanceManagerLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v8;
        _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_INFO, "ⓖ Triggering haptics: %@", (uint8_t *)&v21, 0xCu);
      }

      +[MNTimeManager currentDate](MNTimeManager, "currentDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_hapticsTriggered;
      -[GEOComposedGuidanceEvent uniqueID](v8, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v20, "guidanceManager:triggerHaptics:", self, -[GEOComposedGuidanceEvent maneuverType](v8, "maneuverType"));

    }
  }

}

- (void)_considerLaneGuidance
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MNGuidanceLaneInfo *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MNGuidanceLaneInfo *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  GEOComposedGuidanceEvent *currentLaneGuidanceEvent;
  id v29;
  void *v30;
  GEOComposedGuidanceEvent *v31;
  void *v32;
  id WeakRetained;
  void *v34;
  GEOComposedGuidanceEvent *v35;
  uint64_t v36;
  void *v37;
  GEOComposedGuidanceEvent *previousLaneGuidanceEvent;
  void *v39;
  uint8_t buf[4];
  GEOComposedGuidanceEvent *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  -[MNGuidanceManager _nextLaneGuidanceEvent](self, "_nextLaneGuidanceEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v3, "coordinateForDistanceStrings"));
    v6 = v5;
    -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v4, "endValidRouteCoordinate"));
    v8 = v7;
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentWaypoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:](self, "_serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:", v4, 0, v11, v6, v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[MNGuidanceManager _indexForEventUUID:](self, "_indexForEventUUID:", v12);

    v13 = [MNGuidanceLaneInfo alloc];
    objc_msgSend(v4, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "isLaneGuidanceForManeuver");
    objc_msgSend(v4, "lanes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laneTitles");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "laneInstructions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("{fromOrigin}"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = (_DWORD)v11;
    v20 = -[MNGuidanceLaneInfo initWithID:isForManeuver:lanes:titles:instructions:variableOverrides:distanceDetailLevel:composedGuidanceEventIndex:](v13, "initWithID:isForManeuver:lanes:titles:instructions:variableOverrides:distanceDetailLevel:composedGuidanceEventIndex:", v14, v15, v16, v17, v18, v19, 0, v36);

    objc_msgSend(v4, "primaryLaneStrings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](self, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v4, v21, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceLaneInfo setPrimaryStrings:](v20, "setPrimaryStrings:", v22);

    objc_msgSend(v4, "secondaryLaneStrings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](self, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v4, v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceLaneInfo setSecondaryStrings:](v20, "setSecondaryStrings:", v24);

    if (self->_currentLaneGuidanceEvent)
    {
      if (!self->_isInPreArrivalState)
      {
        MNGetMNGuidanceManagerLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = (GEOComposedGuidanceEvent *)v4;
          v26 = "ⓖ Replacing lane guidance with: %@";
LABEL_14:
          _os_log_impl(&dword_1B0AD7000, v25, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (!self->_isInPreArrivalState)
    {
      MNGetMNGuidanceManagerLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (GEOComposedGuidanceEvent *)v4;
        v26 = "ⓖ Adding lane guidance: %@";
        goto LABEL_14;
      }
LABEL_15:

      objc_storeStrong((id *)&self->_currentLaneGuidanceEvent, v4);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "guidanceManager:showLaneDirections:", self, v20);

    }
    v39 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (self->_currentLaneGuidanceEvent)
  {
    MNGetMNGuidanceManagerLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      currentLaneGuidanceEvent = self->_currentLaneGuidanceEvent;
      *(_DWORD *)buf = 138412290;
      v41 = currentLaneGuidanceEvent;
      _os_log_impl(&dword_1B0AD7000, v27, OS_LOG_TYPE_INFO, "ⓖ Removing lane guidance: %@", buf, 0xCu);
    }

    v29 = objc_loadWeakRetained((id *)&self->_delegate);
    -[GEOComposedGuidanceEvent uniqueID](self->_currentLaneGuidanceEvent, "uniqueID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "guidanceManager:hideLaneDirectionsForId:", self, v30);

    v31 = self->_currentLaneGuidanceEvent;
    self->_currentLaneGuidanceEvent = 0;

  }
  v20 = 0;
  v32 = 0;
LABEL_17:
  if (!self->_previousLaneGuidanceEvent)
  {
    -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v32, 0);
    if (!v4)
      goto LABEL_20;
    goto LABEL_19;
  }
  previousLaneGuidanceEvent = self->_previousLaneGuidanceEvent;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &previousLaneGuidanceEvent, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v32, v34);

  if (v4)
LABEL_19:

LABEL_20:
  v35 = self->_previousLaneGuidanceEvent;
  self->_previousLaneGuidanceEvent = (GEOComposedGuidanceEvent *)v4;

}

- (id)_nextLaneGuidanceEvent
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_validEvents;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "lanes", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_considerSignGuidance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MNGuidanceSignInfo *v14;
  MNGuidanceSignInfo *v15;
  MNGuidanceSignInfo *signInfo;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  MNGuidanceSignInfo *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  double v27;
  double v28;
  unsigned __int8 v29;
  uint8_t buf[4];
  MNGuidanceSignInfo *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  -[MNGuidanceManager _validEventsForSignGuidance:](self, "_validEventsForSignGuidance:", &v29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[MNGuidanceManager _sortedSignEventsFromValidSignEvents:](self, "_sortedSignEventsFromValidSignEvents:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
LABEL_16:

      goto LABEL_17;
    }
    v25 = v3;
    -[MNGuidanceSignInfo primarySign](self->_signInfo, "primarySign");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v6 = objc_claimAutoreleasedReturnValue();

    -[MNGuidanceSignInfo secondarySign](self->_signInfo, "secondarySign");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0.0;
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "stepIndex");
      -[MNGuidanceManager _signForGuidanceEvent:isPrimary:shouldOverridePrimaryDistances:distance:](self, "_signForGuidanceEvent:isPrimary:shouldOverridePrimaryDistances:distance:", v8, 1, v29, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v27 = 0.0;
    v11 = 0;
    v12 = (void *)v6;
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager _signForGuidanceEvent:isPrimary:shouldOverridePrimaryDistances:distance:](self, "_signForGuidanceEvent:isPrimary:shouldOverridePrimaryDistances:distance:", v13, 0, v29, &v27);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = [MNGuidanceSignInfo alloc];
    v15 = -[MNGuidanceSignInfo initWithPrimarySign:secondarySign:stepIndex:primaryDistance:secondaryDistance:timeUntilPrimarySign:timeUntilSecondarySign:](v14, "initWithPrimarySign:secondarySign:stepIndex:primaryDistance:secondaryDistance:timeUntilPrimarySign:timeUntilSecondarySign:", v10, v11, v9, v28, v27, v28 / self->_speed, v27 / self->_speed);
    signInfo = self->_signInfo;
    self->_signInfo = v15;

    -[MNGuidanceSignInfo primarySign](self->_signInfo, "primarySign");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v6, v18))
    {
      -[MNGuidanceSignInfo secondarySign](self->_signInfo, "secondarySign");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v26, v20);

      v12 = (void *)v6;
      v3 = v25;
      if (v21)
      {
LABEL_15:
        -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v4, self->_previousSignEvents);
        objc_storeStrong((id *)&self->_previousSignEvents, v4);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "guidanceManager:updateSignsWithInfo:", self, self->_signInfo);

        goto LABEL_16;
      }
    }
    else
    {

      v3 = v25;
    }
    MNGetMNGuidanceManagerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = self->_signInfo;
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_INFO, "ⓖ New sign guidance: %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
LABEL_17:

}

- (id)_validEventsForSignGuidance:(BOOL *)a3
{
  NSMutableArray *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  _BOOL4 isInPreArrivalState;
  NSMutableArray *v28;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    *a3 = 0;
    -[MNGuidanceManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "navigationState");

    switch(v7)
    {
      case 1:
      case 8:
        if (!self->_isInPreArrivalState)
        {
          -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", 1, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (!self->_hasBeenOnRouteOnce && objc_msgSend(v8, "count"))
          {
            -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);
            goto LABEL_16;
          }
          -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", 3, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            -[NSMutableArray addObject:](v5, "addObject:", v11);
            *a3 = 1;
          }

          goto LABEL_17;
        }
        break;
      case 2:
        if (!self->_isInPreArrivalState && !self->_shouldShowChargingInfo)
        {
          self->_hasBeenOnRouteOnce = 1;
          v9 = v5;
          v5 = self->_validEvents;
          goto LABEL_17;
        }
        break;
      case 3:
        if (!self->_isInPreArrivalState)
        {
          -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", 3, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[NSMutableArray addObject:](v5, "addObject:", v9);
LABEL_16:
            *a3 = 1;
          }
LABEL_17:

        }
        break;
      default:
        break;
    }
    if (self->_shouldShowChargingInfo)
    {
      v13 = 14;
    }
    else
    {
      -[MNGuidanceManager delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "navigationState");

      if (v15 != 7)
        goto LABEL_27;
      if (self->_shouldShowChargingInfo)
        v13 = 14;
      else
        v13 = 13;
    }
    -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", v13, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[NSMutableArray addObject:](v5, "addObject:", v17);

LABEL_27:
    -[MNGuidanceManager delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "navigationState") != 6)
    {
      -[MNGuidanceManager delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "navigationState") != 7)
      {
        isInPreArrivalState = self->_isInPreArrivalState;

        if (!isInPreArrivalState)
          goto LABEL_45;
LABEL_31:
        -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", 12, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[MNGuidanceManager _specialSignEvents:forLeg:](self, "_specialSignEvents:forLeg:", 11, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v24 = -[NSArray containsObject:](self->_previousSignEvents, "containsObject:", v21);
          v25 = v21;
          if (v24)
            goto LABEL_43;
          if (v23)
          {
            v26 = -[NSArray containsObject:](self->_previousSignEvents, "containsObject:", v23);
            v25 = v23;
            if (!v26)
            {
              if (self->_isInPreArrivalState)
                v25 = v21;
              else
                v25 = v23;
            }
            goto LABEL_43;
          }
          v25 = v21;
          if (self->_isInPreArrivalState)
LABEL_43:
            -[NSMutableArray addObject:](v5, "addObject:", v25);
        }
        else if (v23)
        {
          -[NSArray containsObject:](self->_previousSignEvents, "containsObject:", v23);
          v25 = v23;
          goto LABEL_43;
        }

        goto LABEL_45;
      }

    }
    goto LABEL_31;
  }
LABEL_45:
  v28 = v5;

  return v28;
}

- (id)_specialSignEvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v5;
  NSMutableDictionary *specialSignEvents;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(_QWORD *)&a3;
  specialSignEvents = self->_specialSignEvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](specialSignEvents, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (a4 && !v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_specialSignEvents, "objectForKeyedSubscript:", &unk_1E620F170);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  return v11;
}

- (id)_sortedSignEventsFromValidSignEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasSignGuidance", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_19);
  return v4;
}

uint64_t __58__MNGuidanceManager__sortedSignEventsFromValidSignEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "stackRanking");
  if (v6 >= objc_msgSend(v5, "stackRanking"))
  {
    v8 = objc_msgSend(v4, "stackRanking");
    v7 = v8 > objc_msgSend(v5, "stackRanking");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)_signForGuidanceEvent:(id)a3 isPrimary:(BOOL)a4 shouldOverridePrimaryDistances:(BOOL)a5 distance:(double *)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void **v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  _BOOL4 v31;
  MNGuidanceSignDescription *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  MNGuidanceSignDescription *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  _QWORD v56[7];
  uint64_t v57;
  double *v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  _QWORD v63[3];

  v7 = a5;
  v53 = a4;
  v63[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "signDetails");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shieldInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "shieldInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shield");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "shieldInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shieldType");

    objc_msgSend(v8, "shieldInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = 0;
    v51 = 0;
    v12 = 0;
  }
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v8, "coordinateForDistanceStrings"));
  v15 = fmax(v14, 0.0);
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v8, "endValidRouteCoordinate"));
  v17 = fmax(v16, 0.0);
  if (!v53)
    goto LABEL_15;
  if (objc_msgSend(v8, "composedGuidanceEventType") == 11
    || objc_msgSend(v8, "composedGuidanceEventType") == 12)
  {
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentWaypoint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "waypointCategory");
    if (objc_msgSend(v54, "count") <= (unint64_t)v20)
    {
      if (!objc_msgSend(v54, "count"))
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v54, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v21;
      v22 = &v62;
    }
    else
    {
      objc_msgSend(v54, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v21;
      v22 = (void **)v63;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v23 = objc_claimAutoreleasedReturnValue();

    v54 = (void *)v23;
    goto LABEL_12;
  }
LABEL_13:
  if (v7)
  {
    -[MNLocation routeMatch](self->_location, "routeMatch");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "distanceFromRoute");
    v17 = v25;

    v15 = v17;
  }
LABEL_15:
  *a6 = v15;
  -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentWaypoint");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:](self, "_serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:", v8, 0, v28, v15, v17);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "signTitles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {

  }
  else
  {
    v30 = objc_msgSend(v54, "count") == 0;

    if (v30)
    {
      v39 = 0;
      goto LABEL_24;
    }
  }
  v52 = 0;
  v31 = objc_msgSend(v8, "transportType") == 2;
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0xBFF0000000000000;
  if (v53)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __93__MNGuidanceManager__signForGuidanceEvent_isPrimary_shouldOverridePrimaryDistances_distance___block_invoke;
    v56[3] = &unk_1E61D33C0;
    v56[4] = &v57;
    *(double *)&v56[5] = v17;
    *(double *)&v56[6] = v15;
    v52 = (void *)MEMORY[0x1B5E0E364](v56);
  }
  v32 = [MNGuidanceSignDescription alloc];
  objc_msgSend(v8, "uniqueID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signTitles");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("{fromOrigin}"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maneuverJunction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkOverride");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v48) = -[MNGuidanceManager _indexForEventUUID:](self, "_indexForEventUUID:", v38);
  LODWORD(v47) = v12;
  v39 = -[MNGuidanceSignDescription initWithID:titles:details:variableOverrides:distanceDetailLevel:junction:artworkOverride:shieldText:shieldID:shieldStringID:composedGuidanceEventIndex:](v32, "initWithID:titles:details:variableOverrides:distanceDetailLevel:junction:artworkOverride:shieldText:shieldID:shieldStringID:composedGuidanceEventIndex:", v33, v34, v54, v35, (2 * v31), v36, v37, v51, v47, v50, v48);

  objc_msgSend(v8, "primarySignStrings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](self, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v8, v40, 1, v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceSignDescription setPrimaryStrings:](v39, "setPrimaryStrings:", v41);

  objc_msgSend(v8, "secondarySignStrings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](self, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v8, v42, 1, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceSignDescription setSecondaryStrings:](v39, "setSecondaryStrings:", v43);

  -[MNGuidanceSignDescription setIsStaticText:](v39, "setIsStaticText:", v58[3] < 0.0);
  if (v53 && v58[3] >= 0.0)
  {
    -[MNGuidanceSignDescription setRemainingDistance:](v39, "setRemainingDistance:");
    objc_msgSend(MEMORY[0x1E0CB3758], "_geo_distanceMeasurementForMeters:", v58[3]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    GEORoundedDistanceMeasurement();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceSignDescription setDisplayRemainingDistance:](v39, "setDisplayRemainingDistance:", v45);

  }
  _Block_object_dispose(&v57, 8);
LABEL_24:

  return v39;
}

void __93__MNGuidanceManager__signForGuidanceEvent_isPrimary_shouldOverridePrimaryDistances_distance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "type") == 1)
  {
    objc_msgSend(v6, "token");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("{valid_distance}"));

    v5 = 48;
    if (v4)
      v5 = 40;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + v5);
  }

}

- (id)_evaluatedStringsForEvent:(id)a3 signStrings:(id)a4 shouldUpdateFormatStrings:(BOOL)a5 argumentHandler:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  id obj;
  id v24;
  _BOOL4 v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v25 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v9 = a4;
  v10 = a6;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v15, "defaultOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "arguments");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __101__MNGuidanceManager__evaluatedStringsForEvent_signStrings_shouldUpdateFormatStrings_argumentHandler___block_invoke;
          v27[3] = &unk_1E61D33E8;
          v27[4] = self;
          v28 = v26;
          v29 = v10;
          objc_msgSend(v17, "_geo_compactMap:", v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "setArguments:", v18);
          objc_msgSend(v16, "setShouldUpdateFormatStrings:", v25);
          objc_msgSend(v15, "composedStringWithOptions:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v24, "addObject:", v19);
          }
          else
          {
            MNGetMNGuidanceManagerLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v15;
              _os_log_impl(&dword_1B0AD7000, v20, OS_LOG_TYPE_FAULT, "ⓖ Error evaluating string: %@", buf, 0xCu);
            }

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v12);
    }

    v9 = v22;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

id __101__MNGuidanceManager__evaluatedStringsForEvent_signStrings_shouldUpdateFormatStrings_argumentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_updateDisplayStringArgument:event:", v3, *(_QWORD *)(a1 + 40)))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = v3;
    if (v4)
    {
      (*(void (**)(_QWORD, id))(v4 + 16))(*(_QWORD *)(a1 + 48), v3);
      v5 = v3;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (BOOL)_updateDisplayStringArgument:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v8 > 10)
  {
    v15 = 0;
    if (v8 == 11 || v8 == 15)
      goto LABEL_22;
  }
  else
  {
    if (v8 == 1)
    {
      objc_msgSend(v6, "distanceFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFormatOptions:", 1);
      -[MNGuidanceManager route](self, "route");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "transportType");

      if (v19 == 2)
        objc_msgSend(v17, "setFormatOptions:", objc_msgSend(v17, "formatOptions") | 2);
      objc_msgSend(v6, "token");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("{valid_distance}"));

      if (v21)
        v22 = objc_msgSend(v7, "endValidRouteCoordinate");
      else
        v22 = objc_msgSend(v7, "coordinateForDistanceStrings");
      -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", v22);
      objc_msgSend(MEMORY[0x1E0CB3758], "_geo_distanceMeasurementForMeters:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setOverrideValue:", v27);

      goto LABEL_21;
    }
    if (v8 == 10)
    {
      -[MNGuidanceManager route](self, "route");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "legs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "destination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "token");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v13, "isEqualToString:", CFSTR("{Name}"));

      if ((_DWORD)v10)
      {
        objc_msgSend(v12, "navDisplayName");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "token");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("{Address}"));

        if (!v24)
        {
LABEL_18:

LABEL_21:
          v15 = 1;
          goto LABEL_22;
        }
        objc_msgSend(v12, "navDisplayAddress");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v25 = (void *)v14;
      objc_msgSend(v6, "stringFormat");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setOverrideValue:", v25);

      goto LABEL_18;
    }
  }
  MNGetMNGuidanceManagerLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    v29 = 138412290;
    v30 = v6;
    _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_FAULT, "ⓖ Unhandled argument for display string: %@", (uint8_t *)&v29, 0xCu);
  }

  v15 = 0;
LABEL_22:

  return v15;
}

- (void)_considerARGuidance
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MNGuidanceManager _validEventsForARGuidance](self, "_validEventsForARGuidance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
          -[MNGuidanceManager route](self, "route", (_QWORD)v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stepAtIndex:", objc_msgSend(v10, "stepIndex"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[MNGuidanceManager _createArGuidanceInfosForEvent:forStep:](self, "_createArGuidanceInfosForEvent:forStep:", v10, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v13);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v7);
    }

    if (!+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v4, self->_arEvents))
    {
      MNGetMNGuidanceManagerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "valueForKey:", CFSTR("debugDescription"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1B0AD7000, v14, OS_LOG_TYPE_INFO, "ⓖ New ar guidance events: %@", buf, 0xCu);

      }
    }
    if (objc_msgSend(v4, "count", (_QWORD)v17))
    {
      objc_storeStrong((id *)&self->_arEvents, v4);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "guidanceManager:updateSignsWithARInfo:", self, self->_arEvents);

    }
  }

}

- (id)_createArGuidanceInfosForEvent:(id)a3 forStep:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  MNGuidanceARInfo *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  unsigned int v31;
  char IsInvalid;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  unsigned int v66;
  unsigned int v67;
  unint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  MNGuidanceARInfo *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  MNGuidanceARInfo *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  MNGuidanceARInfo *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id obj;
  id obja;
  uint64_t v132;
  MNGuidanceARInfo *v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  MNGuidanceARInfo *v140;
  MNGuidanceARInfo *v141;
  MNGuidanceManager *v142;
  unint64_t v143;
  unint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  void *v149;
  void *v150;
  void *v151;
  _BYTE v152[128];
  _QWORD v153[3];

  v153[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 1);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v6, "coordinateForDistanceStrings"));
  v9 = fmax(v8, 0.0);
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v6, "endValidRouteCoordinate"));
  v11 = fmax(v10, 0.0);
  -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentWaypoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:](self, "_serverStringDictionaryForEvent:distance:validDistance:spoken:waypoints:", v6, 0, v14, v9, v11);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "arType") == 1)
  {
    v15 = (MNGuidanceARInfo *)objc_opt_new();
    -[MNGuidanceManager route](self, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "legIndexForStepIndex:", objc_msgSend(v7, "stepIndex"));

    -[MNGuidanceManager route](self, "route");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "legs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v20, "startRouteCoordinate");

    objc_msgSend(v6, "gapRanges");
    v21 = objc_claimAutoreleasedReturnValue();
    v127 = v7;
    v140 = v15;
    v142 = self;
    if (v21
      && (v22 = (void *)v21,
          objc_msgSend(v6, "gapRanges"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "count"),
          v23,
          v22,
          v24))
    {
      v25 = objc_msgSend(v7, "startRouteCoordinate");
      v145 = 0u;
      v146 = 0u;
      v147 = 0u;
      v148 = 0u;
      v125 = v6;
      objc_msgSend(v6, "gapRanges");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v152, 16);
      if (v137)
      {
        v132 = *(_QWORD *)v146;
        v26 = *MEMORY[0x1E0D26A38];
        v27 = (unint64_t)*(unsigned int *)(MEMORY[0x1E0D26A38] + 4) << 32;
        do
        {
          for (i = 0; i != v137; ++i)
          {
            if (*(_QWORD *)v146 != v132)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
            -[MNGuidanceManager route](self, "route");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v29, "startValidDistanceOffsetCm") * 0.01);
            v31 = GEOPolylineCoordinateNearestIndex();

            v143 = 0;
            v144 = 0;
            IsInvalid = GEOPolylineCoordinateIsInvalid();
            LODWORD(v33) = vcvtms_u32_f32(*((float *)&v25 + 1)) + v25;
            v34 = (unint64_t)COERCE_UNSIGNED_INT(*((float *)&v25 + 1) - floorf(*((float *)&v25 + 1))) << 32;
            if ((IsInvalid & 1) != 0)
            {
              v34 = v27;
              v33 = v26;
            }
            else
            {
              v33 = v33;
            }
            v35 = v34 | v33;
            v36 = GEOPolylineCoordinateIsInvalid();
            if (v36)
              v37 = v26;
            else
              v37 = v31;
            if (v36)
              v38 = v27;
            else
              v38 = 0;
            v143 = v35;
            v144 = v38 | v37;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v143, "{GEOPolylineCoordinateRange={?=If}{?=If}}");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v140;
            -[MNGuidanceARInfo addObject:](v140, "addObject:", v39);

            -[MNGuidanceManager route](self, "route");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v40, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v29, "endValidDistanceOffsetCm") * 0.01);

          }
          v137 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v152, 16);
        }
        while (v137);
      }

      v6 = v125;
    }
    else
    {
      v61 = objc_msgSend(v7, "startRouteCoordinate");
      objc_msgSend(v7, "endRouteCoordinate");
      v62 = GEOPolylineCoordinateNearestIndex();
      if (GEOPolylineCoordinateIsInvalid())
      {
        v64 = *MEMORY[0x1E0D26A38];
        v63 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
        v65 = v63;
        v66 = *MEMORY[0x1E0D26A38];
      }
      else
      {
        *(float *)&v67 = *((float *)&v61 + 1) - floorf(*((float *)&v61 + 1));
        v66 = vcvtms_u32_f32(*((float *)&v61 + 1)) + v61;
        v64 = *MEMORY[0x1E0D26A38];
        v65 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
        v63 = v67;
      }
      v68 = v66 | (unint64_t)(v63 << 32);
      v69 = GEOPolylineCoordinateIsInvalid();
      v70 = v65 << 32;
      if (v69)
        v71 = v64;
      else
        v71 = v62;
      if (!v69)
        v70 = 0;
      v143 = v68;
      v144 = v70 | v71;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v143, "{GEOPolylineCoordinateRange={?=If}{?=If}}");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceARInfo addObject:](v15, "addObject:", v72);

    }
    if (-[MNGuidanceARInfo count](v15, "count"))
    {
      v73 = 0;
      v74 = 0;
      do
      {
        -[MNGuidanceARInfo objectAtIndex:](v15, "objectAtIndex:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = 0;
        v144 = 0;
        v138 = v75;
        objc_msgSend(v75, "getValue:", &v143);
        v133 = [MNGuidanceARInfo alloc];
        objc_msgSend(v6, "uniqueID");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v6, "arType");
        v77 = -[MNGuidanceManager _maneuverTypeForAREvent:](self, "_maneuverTypeForAREvent:", v6);
        objc_msgSend(v6, "arInstruction");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("{fromOrigin}"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "arArrowLabel");
        v80 = v73;
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "maneuverRoadName");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v127, "stepIndex");
        v84 = v77;
        v15 = v140;
        v85 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:](v133, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:", obja, v76, v84, v78, v79, v81, v143, v144, v82, v83);

        v86 = v80;
        self = v142;

        -[MNGuidanceARInfo setPriority:](v85, "setPriority:", -[MNGuidanceARInfo count](v140, "count") + v80);
        objc_msgSend(v6, "arInstructionString");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (v87)
        {
          objc_msgSend(v6, "arInstructionString");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = v88;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](v142, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v6, v89, 0, 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "firstObject");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceARInfo setInstructionString:](v85, "setInstructionString:", v91);

        }
        objc_msgSend(v129, "addObject:", v85);

        ++v74;
        v73 = v86 - 1;
      }
      while (v74 < -[MNGuidanceARInfo count](v140, "count"));
    }
    objc_msgSend(v6, "gapRanges");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "lastObject");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v127;
    if (v93)
    {
      -[MNGuidanceManager route](self, "route");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "routeCoordinateForDistance:afterRouteCoordinate:", v135, (float)objc_msgSend(v93, "startValidDistanceOffsetCm") * 0.01);

      LODWORD(v94) = objc_msgSend(v6, "endValidRouteCoordinate");
      if (GEOPolylineCoordinateNearestIndex() == v94)
      {
        v96 = HIDWORD(v95);
        v126 = v6;
        if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
        {
          LODWORD(v143) = 0;
          if (modff(*((float *)&v95 + 1), (float *)&v143) > 0.0)
          {
            LODWORD(v96) = v143;
            LODWORD(v95) = v95 + 1;
          }
        }
        -[MNGuidanceManager _closestContinueAREventToRouteCoordinate:](self, "_closestContinueAREventToRouteCoordinate:", v95 | ((unint64_t)v96 << 32));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager route](self, "route");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stepAtIndex:", objc_msgSend(v97, "stepIndex"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v99, "startRouteCoordinate");
        -[MNGuidanceManager route](self, "route");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = v97;
        objc_msgSend(v101, "stepAtIndex:", objc_msgSend(v97, "stepIndex"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "endRouteCoordinate");
        v103 = GEOPolylineCoordinateNearestIndex();
        if (GEOPolylineCoordinateIsInvalid())
        {
          LODWORD(v100) = *MEMORY[0x1E0D26A38];
          v104 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
          v105 = v104;
          v106 = *MEMORY[0x1E0D26A38];
        }
        else
        {
          v106 = vcvtms_u32_f32(*((float *)&v100 + 1)) + v100;
          LODWORD(v100) = *MEMORY[0x1E0D26A38];
          v105 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
          v104 = COERCE_UNSIGNED_INT(*((float *)&v100 + 1) - floorf(*((float *)&v100 + 1)));
        }
        v136 = v106 | (unint64_t)(v104 << 32);
        v107 = GEOPolylineCoordinateIsInvalid();
        v108 = v105 << 32;
        if (v107)
          v109 = v100;
        else
          v109 = v103;
        if (!v107)
          v108 = 0;
        v134 = v108 | v109;

        v110 = [MNGuidanceARInfo alloc];
        objc_msgSend(v126, "uniqueID");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v97, "arType");
        v113 = -[MNGuidanceManager _maneuverTypeForAREvent:](self, "_maneuverTypeForAREvent:", v126);
        objc_msgSend(v126, "arInstruction");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "arArrowLabel");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "maneuverRoadName");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:](v110, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinateRange:maneuverRoadName:stepIndex:", v111, v112, v113, v114, v128, v115, v136, v134, v116, objc_msgSend(v127, "stepIndex"));

        v6 = v126;
        -[MNGuidanceARInfo setPriority:](v117, "setPriority:", 0);
        objc_msgSend(v126, "arInstructionString");
        v118 = (void *)objc_claimAutoreleasedReturnValue();

        if (v118)
        {
          objc_msgSend(v126, "arInstructionString");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = v119;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](v142, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v126, v120, 0, 0);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "firstObject");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceARInfo setInstructionString:](v117, "setInstructionString:", v122);

        }
        objc_msgSend(v129, "addObject:", v117);

        v7 = v127;
        v15 = v140;
      }
    }

LABEL_56:
    goto LABEL_57;
  }
  if (objc_msgSend(v6, "arType") == 2)
  {
    v141 = [MNGuidanceARInfo alloc];
    objc_msgSend(v6, "uniqueID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v6, "arType");
    v43 = -[MNGuidanceManager _maneuverTypeForAREvent:](self, "_maneuverTypeForAREvent:", v6);
    objc_msgSend(v6, "arInstruction");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arArrowLabel");
    v45 = v6;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager route](self, "route");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endRouteCoordinate");
    objc_msgSend(v47, "pointAt:", GEOPolylineCoordinateNearestIndex());
    v49 = v48;
    v51 = v50;
    v53 = v52;
    objc_msgSend(v7, "maneuverRoadName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _headingForArEvent:](self, "_headingForArEvent:", v45);
    v15 = -[MNGuidanceARInfo initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:](v141, "initWithEventID:type:maneuverType:instruction:variableOverrides:arrowLabel:locationCoordinate:maneuverRoadName:heading:stepIndex:", v41, v42, v43, v44, v128, v46, v49, v51, v53, v55, v54, objc_msgSend(v7, "stepIndex"));

    v6 = v45;
    objc_msgSend(v45, "arInstructionString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v45, "arInstructionString");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v149, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager _evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:](self, "_evaluatedStringsForEvent:signStrings:shouldUpdateFormatStrings:argumentHandler:", v45, v58, 0, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "firstObject");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceARInfo setInstructionString:](v15, "setInstructionString:", v60);

    }
    objc_msgSend(v129, "addObject:", v15);
    goto LABEL_56;
  }
LABEL_57:
  objc_msgSend(v129, "array");
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  return v123;
}

- (id)_validEventsForARGuidance
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t UInteger;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[NSMutableArray count](self->_validEvents, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stepIndex");

  UInteger = GEOConfigGetUInteger();
  -[MNGuidanceManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "navigationState");

  if (v8 <= 8)
  {
    if (((1 << v8) & 0x11A) != 0)
    {
      if (v5 > 1 || self->_hasBeenOnRouteOnce)
      {
        v9 = UInteger + v5;
        -[MNGuidanceManager route](self, "route");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "stepsCount") - 1;

        if (v9 >= v11)
        {
          -[MNGuidanceManager _arrivalARGuidanceEventsForLeg:](self, "_arrivalARGuidanceEventsForLeg:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
        -[MNLocation routeMatch](self->_location, "routeMatch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager _closestContinueAREventToRouteCoordinate:](self, "_closestContinueAREventToRouteCoordinate:", objc_msgSend(v13, "routeCoordinate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v3, "addObject:", v14);
        goto LABEL_23;
      }
      -[MNGuidanceManager _specialAREvents:forLeg:](self, "_specialAREvents:forLeg:", 1, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNGuidanceManager route](self, "route");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v27, "stepsCount") <= 1)
      {

      }
      else
      {
        -[MNLocation routeMatch](self->_location, "routeMatch");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "distanceFromRoute");
        v30 = v29;
        GEOConfigGetDouble();
        v32 = v31;

        if (v30 < v32)
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v33 = v26;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v59;
            while (2)
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v59 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                if (objc_msgSend(v38, "arType") == 1)
                {
                  objc_msgSend(v3, "addObject:", v38);
                  goto LABEL_48;
                }
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
              if (v35)
                continue;
              break;
            }
          }
LABEL_48:

          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v39 = self->_events;
          v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v46; ++j)
              {
                if (*(_QWORD *)v55 != v47)
                  objc_enumerationMutation(v39);
                v49 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
                if (objc_msgSend(v49, "stepIndex") == 1
                  && objc_msgSend(v49, "hasArGuidance")
                  && objc_msgSend(v49, "arType") == 2)
                {
                  objc_msgSend(v3, "addObject:", v49);
                }
              }
              v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
            }
            while (v46);
          }
LABEL_59:

          goto LABEL_24;
        }
      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v39 = v26;
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v51;
        while (2)
        {
          for (k = 0; k != v41; ++k)
          {
            if (*(_QWORD *)v51 != v42)
              objc_enumerationMutation(v39);
            v44 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
            if (objc_msgSend(v44, "arType", (_QWORD)v50) == 2)
            {
              objc_msgSend(v3, "addObject:", v44);
              goto LABEL_59;
            }
          }
          v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
          if (v41)
            continue;
          break;
        }
      }
      goto LABEL_59;
    }
    if (v8 != 2)
    {
      if (v8 != 6)
        goto LABEL_24;
      goto LABEL_22;
    }
    self->_hasBeenOnRouteOnce = 1;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v15 = self->_validEvents;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v63;
      do
      {
        for (m = 0; m != v17; ++m)
        {
          if (*(_QWORD *)v63 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
          if (objc_msgSend(v20, "hasArGuidance"))
            objc_msgSend(v3, "addObject:", v20);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v17);
    }

    v21 = UInteger + v5;
    -[MNGuidanceManager route](self, "route");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "stepsCount") - 1;

    if (v21 >= v23)
    {
LABEL_22:
      -[MNGuidanceManager _arrivalARGuidanceEventsForLeg:](self, "_arrivalARGuidanceEventsForLeg:", -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v14);
LABEL_23:

    }
  }
LABEL_24:
  objc_msgSend(v3, "array", (_QWORD)v50);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_closestContinueAREventToRouteCoordinate:(id)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_events;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "startValidRouteCoordinate", (_QWORD)v11);
        if (GEOPolylineCoordinateIsABeforeOrEqualToB())
        {
          objc_msgSend(v8, "endValidRouteCoordinate");
          if (GEOPolylineCoordinateIsABeforeB())
          {
            if (objc_msgSend(v8, "arType") == 1)
            {
              v9 = v8;
              goto LABEL_13;
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)_arrivalARGuidanceEventsForLeg:(unint64_t)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E620F1A0, &unk_1E620F1B8, &unk_1E620F1D0, &unk_1E620F1E8, &unk_1E620F200, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_events;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "legIndex") == a3)
        {
          if (objc_msgSend(v11, "hasArGuidance"))
          {
            if (objc_msgSend(v11, "arType") == 2)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MNGuidanceManager _maneuverTypeForAREvent:](self, "_maneuverTypeForAREvent:", v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v5, "containsObject:", v12);

              if (v13)
                objc_msgSend(v15, "addObject:", v11);
            }
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v15;
}

- (id)_specialAREvents:(int)a3 forLeg:(unint64_t)a4
{
  uint64_t v4;
  NSMutableDictionary *specialAREvents;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  specialAREvents = self->_specialAREvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](specialAREvents, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)_maneuverTypeForAREvent:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasArGuidance"))
  {
    if (objc_msgSend(v3, "composedGuidanceEventType") == 1)
    {
      v4 = 17;
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v3, "arInstruction", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formatTokens");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (objc_msgSend(v11, "type") == 15)
            {
              objc_msgSend(v11, "maneuverValue");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = objc_msgSend(v12, "maneuverType");

              goto LABEL_15;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }

      v4 = objc_msgSend(v3, "maneuverType");
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_15:

  return v4;
}

- (double)_headingForArEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;

  v4 = a3;
  -[MNGuidanceManager route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stepAtIndex:", objc_msgSend(v4, "stepIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -1.0;
  if (objc_msgSend(v4, "hasArGuidance") && v6)
  {
    v8 = objc_msgSend(v6, "startRouteCoordinate");
    v9 = objc_msgSend(v6, "endRouteCoordinate");
    if (objc_msgSend(v4, "arType") == 2)
    {
      objc_msgSend(v6, "getNextStep");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v6, "endRouteCoordinate");
        v8 = GEOPolylineCoordinateNearestIndex();
        objc_msgSend(v6, "getNextStep");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "endRouteCoordinate");
        v9 = GEOPolylineCoordinateNearestIndex();

      }
      else
      {
        v8 = v9 - 1;
      }
    }
    GEOConfigGetDouble();
    v13 = v12;
    GEOConfigGetDouble();
    v15 = v14;
    -[MNGuidanceManager route](self, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "courseAtRouteCoordinateIndex:", v8);
    v7 = v17;

    v18 = (v8 + 1);
    if (v18 < v9)
    {
      v19 = v9 - 2;
      do
      {
        -[MNGuidanceManager route](self, "route");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "courseAtRouteCoordinateIndex:", v8);
        v7 = v21;

        -[MNGuidanceManager route](self, "route");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "distanceBetweenIndex:andIndex:", v8, v18);
        v24 = v23;

        if (v24 > v15)
          break;
        -[MNGuidanceManager route](self, "route");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "courseAtRouteCoordinateIndex:", (v8 + 1));
        GEOAngleDifferenceDegrees();
        v27 = v26;

        v28 = -v27;
        if (v27 >= 0.0)
          v28 = v27;
        ++v18;
        v29 = v28 < v13 || v19 == (_DWORD)v8;
        v8 = (v8 + 1);
      }
      while (!v29);
    }
  }

  return v7;
}

- (void)_considerNavTrayGuidance
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  char v14;
  MNNavTrayGuidanceEvent *v15;
  id WeakRetained;
  int v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "navigationState");

  if (v4 == 7)
  {
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager _specialNavTrayEvents:forLeg:](self, "_specialNavTrayEvents:forLeg:", 14, objc_msgSend(v5, "targetLegIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      MNGetMNGuidanceManagerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = CFSTR("CHARGING_AT_STATION");
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Found multiple nav tray guidance events for guidance event type '%@'. This is a Routing error. Using the first one found.", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedGuidanceEvent uniqueID](self->_activeNavTrayGuidanceEvent, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    if (v11 | v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend((id)v11, "isEqual:", v12);

      if ((v14 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, v8);
        if (v8)
          v15 = -[MNNavTrayGuidanceEvent initWithGuidanceEvent:]([MNNavTrayGuidanceEvent alloc], "initWithGuidanceEvent:", v8);
        else
          v15 = 0;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "guidanceManager:didUpdateNavTrayGuidance:", self, v15);

      }
    }

  }
}

- (void)_considerPersistence
{
  _BOOL4 v3;
  id WeakRetained;

  v3 = -[MNGuidanceManager _hasPersistentEvents](self, "_hasPersistentEvents");
  if (self->_hasPersistentEvents != v3)
  {
    self->_hasPersistentEvents = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "guidanceManager:usePersistentDisplay:", self, self->_hasPersistentEvents);

  }
}

- (BOOL)_hasPersistentEvents
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_validEvents;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isSticky", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_considerJunctionViewGuidance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  MNJunctionViewImageLoader *junctionViewImageLoader;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  GEOComposedGuidanceEvent *v21;
  NSObject *v22;
  void *v23;
  GEOComposedGuidanceEvent *pendingJunctionViewGuidanceEvent;
  _QWORD v25[4];
  id v26;
  GEOComposedGuidanceEvent *currentJunctionViewGuidanceEvent;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MNGuidanceManager _nextJunctionViewGuidanceEvent](self, "_nextJunctionViewGuidanceEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedGuidanceEvent uniqueID](self->_currentJunctionViewGuidanceEvent, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {

    }
    else
    {
      objc_msgSend(v4, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0)
      {
        MNGetMNGuidanceManagerLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[GEOComposedGuidanceEvent uniqueID](self->_currentJunctionViewGuidanceEvent, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v4;
          v30 = 2112;
          v31 = v14;
          v32 = 2112;
          v33 = v15;
          _os_log_impl(&dword_1B0AD7000, v13, OS_LOG_TYPE_INFO, "ⓖ Requesting new junction view: %@ | previous: %@ | pending: %@", buf, 0x20u);

        }
        objc_storeStrong((id *)&self->_pendingJunctionViewGuidanceEvent, v4);
        objc_initWeak((id *)buf, self);
        junctionViewImageLoader = self->_junctionViewImageLoader;
        objc_msgSend(v4, "junctionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __50__MNGuidanceManager__considerJunctionViewGuidance__block_invoke;
        v25[3] = &unk_1E61D3410;
        objc_copyWeak(&v26, (id *)buf);
        -[MNJunctionViewImageLoader imagesForJunctionView:eventID:handler:](junctionViewImageLoader, "imagesForJunctionView:eventID:handler:", v17, v18, v25);

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (self->_currentJunctionViewGuidanceEvent)
    {
      MNGetMNGuidanceManagerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[GEOComposedGuidanceEvent uniqueID](self->_currentJunctionViewGuidanceEvent, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_INFO, "ⓖ Removing displayed junction view: %@", buf, 0xCu);

      }
      if (self->_currentJunctionViewGuidanceEvent)
      {
        currentJunctionViewGuidanceEvent = self->_currentJunctionViewGuidanceEvent;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &currentJunctionViewGuidanceEvent, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", 0, v9);

      }
      else
      {
        -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", 0, 0);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[GEOComposedGuidanceEvent uniqueID](self->_currentJunctionViewGuidanceEvent, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "guidanceManager:hideJunctionViewForId:", self, v20);

      v21 = self->_currentJunctionViewGuidanceEvent;
      self->_currentJunctionViewGuidanceEvent = 0;

    }
    if (self->_pendingJunctionViewGuidanceEvent)
    {
      MNGetMNGuidanceManagerLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v23;
        _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_INFO, "ⓖ Removing pending junction view: %@", buf, 0xCu);

      }
      pendingJunctionViewGuidanceEvent = self->_pendingJunctionViewGuidanceEvent;
      self->_pendingJunctionViewGuidanceEvent = 0;

    }
  }

}

void __50__MNGuidanceManager__considerJunctionViewGuidance__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleJunctionViewInfo:", v3);

}

- (id)_nextJunctionViewGuidanceEvent
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_validEvents;
  v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "junctionView", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_handleJunctionViewInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  GEOComposedGuidanceEvent *pendingJunctionViewGuidanceEvent;
  GEOComposedGuidanceEvent *currentJunctionViewGuidanceEvent;
  void *v14;
  void *v15;
  void *WeakRetained;
  void *v17;
  NSObject *v18;
  GEOComposedGuidanceEvent *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  MNGetMNGuidanceManagerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOComposedGuidanceEvent uniqueID](self->_currentJunctionViewGuidanceEvent, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓖ Showing junction view: %@ | previous: %@", buf, 0x16u);

    }
    v8 = self->_currentJunctionViewGuidanceEvent;
    objc_storeStrong((id *)&self->_currentJunctionViewGuidanceEvent, self->_pendingJunctionViewGuidanceEvent);
    pendingJunctionViewGuidanceEvent = self->_pendingJunctionViewGuidanceEvent;
    self->_pendingJunctionViewGuidanceEvent = 0;

    currentJunctionViewGuidanceEvent = self->_currentJunctionViewGuidanceEvent;
    if (currentJunctionViewGuidanceEvent)
    {
      v19 = self->_currentJunctionViewGuidanceEvent;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_6;
    }
    else
    {
      v14 = 0;
      if (v8)
      {
LABEL_6:
        v18 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v14, v15);

        if (!currentJunctionViewGuidanceEvent)
        {
LABEL_8:
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "guidanceManager:showJunctionView:", self, v4);
LABEL_11:

          goto LABEL_12;
        }
LABEL_7:

        goto LABEL_8;
      }
    }
    -[MNGuidanceManager _notifyAnalyticsForNewEvents:previousEvents:](self, "_notifyAnalyticsForNewEvents:previousEvents:", v14, 0);
    if (!currentJunctionViewGuidanceEvent)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v9)
  {
    objc_msgSend(v4, "uniqueID");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedGuidanceEvent uniqueID](self->_pendingJunctionViewGuidanceEvent, "uniqueID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = WeakRetained;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_INFO, "ⓖ Junction view info was received for request %@, but a newer junction view info was requested: %@", buf, 0x16u);

    goto LABEL_11;
  }
LABEL_12:

}

- (id)_junctionViewEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MNGuidanceManager events](self, "events", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasJunctionView"))
        {
          objc_msgSend(v9, "startValidRouteCoordinate");
          if (GEOPolylineCoordinateIsValid())
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  -[MNJunctionViewImageLoader setJunctionViewImageWidth:height:](self->_junctionViewImageLoader, "setJunctionViewImageWidth:height:", a3, a4);
}

- (BOOL)_isInArrivalState
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MNGuidanceManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "navigationState") == 7)
  {
    v4 = 1;
  }
  else
  {
    -[MNGuidanceManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "navigationState") == 6;

  }
  return v4;
}

- (id)_specialSpokenEvents:(int)a3 forLegIndex:(unint64_t)a4
{
  uint64_t v5;
  NSMutableDictionary *specialSpokenEvents;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(_QWORD *)&a3;
  specialSpokenEvents = self->_specialSpokenEvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](specialSpokenEvents, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  if (a4 && !v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_specialSpokenEvents, "objectForKeyedSubscript:", &unk_1E620F170);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  return v11;
}

- (BOOL)_eventWasSpoken:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *announcementsSpoken;
  void *v7;
  void *v8;
  char v9;
  NSMutableSet *exclusiveSetAnnouncementsSpoken;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    announcementsSpoken = self->_announcementsSpoken;
    objc_msgSend(v4, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](announcementsSpoken, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = 1;
    }
    else
    {
      exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
      objc_msgSend(v5, "exclusiveSetIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSMutableSet containsObject:](exclusiveSetAnnouncementsSpoken, "containsObject:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_markEventSpoken:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *exclusiveSetAnnouncementsSpoken;
  void *v7;
  void *v8;
  NSMutableDictionary *announcementsSpoken;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "exclusiveSetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      exclusiveSetAnnouncementsSpoken = self->_exclusiveSetAnnouncementsSpoken;
      objc_msgSend(v11, "exclusiveSetIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](exclusiveSetAnnouncementsSpoken, "addObject:", v7);

    }
    +[MNTimeManager currentDate](MNTimeManager, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    announcementsSpoken = self->_announcementsSpoken;
    objc_msgSend(v11, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](announcementsSpoken, "setObject:forKeyedSubscript:", v8, v10);

    v4 = v11;
  }

}

- (double)_adjustedVehicleSpeed
{
  double v3;
  double v4;
  double v5;

  -[CLLocation _navigation_speedAccuracy](self->_location, "_navigation_speedAccuracy");
  if (v3 < 0.0)
    v3 = 0.2;
  if (v3 <= 5.0)
    v4 = v3;
  else
    v4 = 5.0;
  -[MNLocation speed](self->_location, "speed");
  return fmax(v5 + v4, 6.94444444);
}

- (BOOL)_isValidEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  char IsABeforeB;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  if ((objc_msgSend(v4, "isSpecial") & 1) != 0)
    goto LABEL_10;
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGoodMatch");

  if (!v6)
    goto LABEL_10;
  -[MNGuidanceManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "navigationState");

  if (v8 != 2)
    goto LABEL_10;
  -[MNLocation speed](self->_location, "speed");
  if (v9 >= 0.0)
  {
    -[MNLocation speed](self->_location, "speed");
    if (!objc_msgSend(v4, "isValidForSpeed:"))
      goto LABEL_10;
  }
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "routeCoordinate");

  if (!objc_msgSend(v4, "hasArGuidance"))
  {
    -[MNLocation routeMatch](self->_location, "routeMatch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "step");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = objc_msgSend(v16, "stepIndex");
      if (v17 != objc_msgSend(v4, "stepIndex"))
      {
        IsABeforeB = 0;
        goto LABEL_15;
      }
      objc_msgSend(v16, "routeCoordinateRange");
      GEOPolylineCoordinateIsABeforeB();
      GEOPolylineCoordinateIsABeforeB();
      GEOPolylineCoordinateIsABeforeB();
    }
    objc_msgSend(v4, "startValidRouteCoordinate");
    objc_msgSend(v4, "endValidRouteCoordinate");
    IsABeforeB = GEOPolylineCoordinateWithinRange();
LABEL_15:

    goto LABEL_16;
  }
  -[MNGuidanceManager route](self, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GEOConfigGetDouble();
  objc_msgSend(v11, "routeCoordinateForDistance:beforeRouteCoordinate:", objc_msgSend(v4, "startValidRouteCoordinate"), v12);

  v13 = objc_msgSend(v4, "legIndex");
  if (v13 != -[MNGuidanceManager currentLegIndex](self, "currentLegIndex")
    || !GEOPolylineCoordinateIsABeforeOrEqualToB())
  {
LABEL_10:
    IsABeforeB = 0;
    goto LABEL_16;
  }
  objc_msgSend(v4, "endValidRouteCoordinate");
  IsABeforeB = GEOPolylineCoordinateIsABeforeB();
LABEL_16:

  return IsABeforeB;
}

- (BOOL)_isEVChargingEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "composedGuidanceEventType") - 13 > 1)
  {
    v9 = 0;
  }
  else
  {
    -[MNGuidanceManager route](self, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "legs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "legIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "chargingStationInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  return v9;
}

- (int)_indexForEventUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *eventIndexes;

  v4 = a3;
  v5 = v4;
  if (!self->_eventIndexes)
  {
    v8 = (NSDictionary *)objc_opt_new();
    -[MNGuidanceManager route](self, "route");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composedGuidanceEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, v14);

        ++v11;
      }
      while (v11 < objc_msgSend(v10, "count"));
    }
    eventIndexes = self->_eventIndexes;
    self->_eventIndexes = v8;

    if (v5)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if (!v4)
    goto LABEL_8;
LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_eventIndexes, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

LABEL_9:
  return v7;
}

- (double)_timeRemainingForEvent:(id)a3
{
  id v4;
  unsigned int v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "composedGuidanceEventType");
  if (v5 > 0xB || ((1 << v5) & 0x80E) == 0)
  {
    objc_msgSend(v4, "endDistanceForSpeed:", self->_speed);
    v9 = v8;
    -[MNGuidanceManager _distanceToEndOfRoute](self, "_distanceToEndOfRoute");
    v7 = fmax(v10 - v9, 0.0) / self->_speed;
  }
  else
  {
    v7 = 1.79769313e308;
  }

  return v7;
}

- (double)timeSinceLastAnnouncement
{
  double v3;

  +[MNTimeManager currentTime](MNTimeManager, "currentTime");
  return v3 - self->_timeLastAnnouncementEnded;
}

- (double)timeUntilNextAnnouncement
{
  double v2;

  if (!self->_nextEvent)
    return 1.79769313e308;
  -[MNGuidanceManager _timeUntilEventTrigger:](self, "_timeUntilEventTrigger:");
  return fmax(v2, 0.0);
}

- (double)_timeUntilEventTrigger:(id)a3
{
  id v4;
  double speed;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  MNGuidanceManager *v16;
  id v17;

  v4 = a3;
  speed = self->_speed;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __44__MNGuidanceManager__timeUntilEventTrigger___block_invoke;
  v15 = &unk_1E61D1C90;
  v16 = self;
  v17 = v4;
  v6 = v4;
  objc_msgSend(v6, "triggerDistanceForSpeed:andDuration:", &v12, speed);
  v8 = v7;
  -[MNGuidanceManager _distanceToEndOfRoute](self, "_distanceToEndOfRoute", v12, v13, v14, v15, v16);
  v10 = (v9 - v8) / self->_speed;

  return v10;
}

uint64_t __44__MNGuidanceManager__timeUntilEventTrigger___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "_distanceToEndOfRoute");
  return objc_msgSend(v1, "durationOfEvent:announcementIndex:distance:", v2, 0);
}

- (double)_distanceToRouteCoordinate:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;

  -[MNGuidanceManager route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNLocation routeMatch](self->_location, "routeMatch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distanceBetweenRouteCoordinate:andRouteCoordinate:", objc_msgSend(v6, "routeCoordinate"), a3);
  v8 = v7;

  result = 0.0;
  if (v8 >= 0.0)
    return v8;
  return result;
}

- (double)_distanceToManeuverStart
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[MNLocation routeMatch](self->_location, "routeMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "step");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v4, "maneuverStartRouteCoordinate"));
  v6 = v5;

  return v6;
}

- (double)_distanceToEndOfRoute
{
  void *v3;
  double v4;
  double v5;

  -[MNGuidanceManager route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNGuidanceManager _distanceToRouteCoordinate:](self, "_distanceToRouteCoordinate:", objc_msgSend(v3, "endRouteCoordinate"));
  v5 = v4;

  return v5;
}

- (double)durationOfEvent:(id)a3 announcementIndex:(unint64_t)a4 distance:(double)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  double v26;
  double v27;
  char v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "announcements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v8, "distanceForStrings");
    v13 = fmax(a5 - v12, 0.0);
    objc_msgSend(v8, "endValidDistance");
    v15 = fmax(a5 - v14, 0.0);
    -[MNGuidanceManager route](self, "route");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNGuidanceManager navigationSessionState](self, "navigationSessionState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentWaypoint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_navigation_serverStringDictionaryForDistance:validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:", v18, v20, -[MNGuidanceManager currentLegIndex](self, "currentLegIndex"), 1, 0, v13, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 1;
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "announcements");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", v24, 0, 1, 1, v21, &v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[MNAudioManager durationOf:](self->_audioManager, "durationOf:", v25);
      v27 = v26;
    }
    else
    {
      v27 = 978307200.0;
    }

  }
  else
  {
    v27 = 978307200.0;
  }

  return v27;
}

- (void)_notifyAnalyticsForNewEvents:(id)a3 previousEvents:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *feedback;
  void *v13;
  void *v14;
  MNGuidanceEventFeedback *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v55;
    v49 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        feedback = self->_feedback;
        objc_msgSend(v11, "uniqueID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](feedback, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = -[MNGuidanceEventFeedback initWithEvent:]([MNGuidanceEventFeedback alloc], "initWithEvent:", v11);
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          -[MNGuidanceEventFeedback setStartTime:](v15, "setStartTime:");
          v16 = objc_msgSend(v11, "stepID");
          -[MNLocation routeMatch](self->_location, "routeMatch");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "step");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "stepID");

          if (v16 == v19)
          {
            -[MNGuidanceManager _distanceToManeuverStart](self, "_distanceToManeuverStart");
            -[MNGuidanceEventFeedback setStartDistance:](v15, "setStartDistance:");
          }
          -[MNLocation speed](self->_location, "speed");
          -[MNGuidanceEventFeedback setVehicleSpeed:](v15, "setVehicleSpeed:");
          -[MNGuidanceManager route](self, "route");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNLocation routeMatch](self->_location, "routeMatch");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MNGuidanceEventFeedback setTrafficColor:](v15, "setTrafficColor:", -[MNGuidanceManager _trafficColorForRoute:routeCoordinate:](self, "_trafficColorForRoute:routeCoordinate:", v20, objc_msgSend(v21, "routeCoordinate")));

          if (objc_msgSend(v11, "hasSpokenGuidance"))
            -[MNGuidanceEventFeedback setSelectedPrimaryStringIndex:](v15, "setSelectedPrimaryStringIndex:", -[MNAnnouncementPlanEvent variantIndex](self->_lastAnnouncementEvent, "variantIndex"));
          if (objc_msgSend(v11, "hasJunctionView"))
          {
            objc_msgSend(v11, "junctionView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "imageIds");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v23, "copy");
            -[MNGuidanceEventFeedback setJunctionViewImageIDs:](v15, "setJunctionViewImageIDs:", v24);

          }
          if (objc_msgSend(v11, "source") == 3)
          {
            v25 = objc_msgSend(v11, "enrouteNoticeIndex");
            -[MNGuidanceManager route](self, "route");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "enrouteNotices");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "count");

            if (v25 < v28)
            {
              -[MNGuidanceManager route](self, "route");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "enrouteNotices");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectAtIndexedSubscript:", objc_msgSend(v11, "enrouteNoticeIndex"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "trafficCamera");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v32)
              {
                objc_msgSend(v32, "identifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[MNGuidanceEventFeedback setEnrouteNoticeIdentifier:](v15, "setEnrouteNoticeIdentifier:", v34);

                -[MNGuidanceEventFeedback setTrafficCameraType:](v15, "setTrafficCameraType:", objc_msgSend(v33, "type"));
              }

            }
          }
          v35 = self->_feedback;
          objc_msgSend(v11, "uniqueID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v15, v36);

          -[MNGuidanceManager delegate](self, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "guidanceManager:newGuidanceEventFeedback:", self, v15);

          v9 = v49;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v8);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v38 = v48;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        if ((objc_msgSend(v6, "containsObject:", v43) & 1) == 0)
        {
          v44 = self->_feedback;
          objc_msgSend(v43, "uniqueID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v44, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            objc_msgSend(v46, "setEndTime:");
            -[MNGuidanceManager _distanceToManeuverStart](self, "_distanceToManeuverStart");
            objc_msgSend(v46, "setEndDistance:");
            -[MNGuidanceManager delegate](self, "delegate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "guidanceManager:updatedGuidanceEventFeedback:", self, v46);

          }
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v40);
  }

}

- (unint64_t)_trafficColorForRoute:(id)a3 routeCoordinate:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "traffic", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeTrafficColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 4;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      objc_msgSend(v11, "routeCoordinate");
      if ((GEOPolylineCoordinateIsABeforeB() & 1) != 0)
        break;
      v9 = objc_msgSend(v11, "color");
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 4;
  }

  return v9;
}

- (MNGuidanceManagerDelegate)delegate
{
  return (MNGuidanceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInPreArrivalState
{
  return self->_isInPreArrivalState;
}

- (void)setIsInPreArrivalState:(BOOL)a3
{
  self->_isInPreArrivalState = a3;
}

- (BOOL)shouldShowChargingInfo
{
  return self->_shouldShowChargingInfo;
}

- (void)setShouldShowChargingInfo:(BOOL)a3
{
  self->_shouldShowChargingInfo = a3;
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void)setNavigationSessionState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_validEvents, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_currentJunctionViewGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_pendingJunctionViewGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_junctionViewImageLoader, 0);
  objc_storeStrong((id *)&self->_previousLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_currentLaneGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_activeNavTrayGuidanceEvent, 0);
  objc_storeStrong((id *)&self->_previousSignEvents, 0);
  objc_storeStrong((id *)&self->_arEvents, 0);
  objc_storeStrong((id *)&self->_signInfo, 0);
  objc_storeStrong((id *)&self->_hapticsTriggered, 0);
  objc_storeStrong((id *)&self->_lastAnnouncementEvent, 0);
  objc_storeStrong((id *)&self->_nextEvent, 0);
  objc_storeStrong((id *)&self->_eventIndexes, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_specialAREvents, 0);
  objc_storeStrong((id *)&self->_specialNavTrayEvents, 0);
  objc_storeStrong((id *)&self->_specialSignEvents, 0);
  objc_storeStrong((id *)&self->_specialSpokenEvents, 0);
  objc_storeStrong((id *)&self->_exclusiveSetAnnouncementsSpoken, 0);
  objc_storeStrong((id *)&self->_announcementsSpoken, 0);
  objc_storeStrong((id *)&self->_announcementEngine, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
}

@end
