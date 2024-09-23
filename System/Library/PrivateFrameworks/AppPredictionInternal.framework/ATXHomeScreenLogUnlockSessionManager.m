@implementation ATXHomeScreenLogUnlockSessionManager

- (ATXHomeScreenLogUnlockSessionManager)init
{
  void *v3;
  ATXHomeScreenLogUnlockSessionManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXHomeScreenLogUnlockSessionManager initWithIsInSession:currentSession:completedSessions:](self, "initWithIsInSession:currentSession:completedSessions:", 0, 0, v3);

  return v4;
}

- (ATXHomeScreenLogUnlockSessionManager)initWithIsInSession:(BOOL)a3 currentSession:(id)a4 completedSessions:(id)a5
{
  id v9;
  id v10;
  ATXHomeScreenLogUnlockSessionManager *v11;
  ATXHomeScreenLogUnlockSessionManager *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenLogUnlockSessionManager;
  v11 = -[ATXHomeScreenLogUnlockSessionManager init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isInSession = a3;
    objc_storeStrong((id *)&v11->_currentSession, a4);
    objc_storeStrong((id *)&v12->_completedSessions, a5);
  }

  return v12;
}

- (int64_t)_eventStatusWithUIEvent:(id)a3
{
  void *v4;
  id v5;
  int64_t v6;

  objc_msgSend(a3, "homeScreenEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTypeString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackChanged")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetTapped")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
    {

      self->_isInSession = 0;
      v6 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
    {

      v6 = 1;
      self->_isInSession = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackShown")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackDisappeared")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackCreated")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
    {
      objc_msgSend(v5, "isEqualToString:", CFSTR("AppRemoved"));
    }
  }

  if (self->_isInSession)
    v6 = 3;
  else
    v6 = 4;
LABEL_12:

  return v6;
}

- (void)_updateCurrentSessionWithUIEvent:(id)a3 eventStatus:(int64_t)a4
{
  void *v6;
  void *v7;
  ATXScreenLogUnlockSession *v8;
  void *v9;
  ATXScreenLogUnlockSession *v10;
  ATXScreenLogUnlockSession *currentSession;
  ATXScreenLogUnlockSession *v12;
  void *v13;
  ATXScreenLogUnlockSession *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "homeScreenEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0:
    case 4:
      goto LABEL_5;
    case 1:
      v8 = [ATXScreenLogUnlockSession alloc];
      objc_msgSend(v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[ATXScreenLogUnlockSession initWithSessionStartDate:](v8, "initWithSessionStartDate:", v9);
      currentSession = self->_currentSession;
      self->_currentSession = v10;

      -[ATXScreenLogUnlockSession setSpotlightEnabled:](self->_currentSession, "setSpotlightEnabled:", objc_msgSend(v7, "spotlightEnabled"));
      -[ATXScreenLogUnlockSession setHasSuggestionsWidget:](self->_currentSession, "setHasSuggestionsWidget:", objc_msgSend(v7, "hasSuggestionsWidget"));
      -[ATXScreenLogUnlockSession setHasSuggestionsWidgetInTodayPage:](self->_currentSession, "setHasSuggestionsWidgetInTodayPage:", objc_msgSend(v7, "hasSuggestionsWidgetToday"));
      -[ATXScreenLogUnlockSession setHasAppPredictionPanel:](self->_currentSession, "setHasAppPredictionPanel:", objc_msgSend(v7, "hasAppPredictionPanel"));
      -[ATXScreenLogUnlockSession setHasAppPredictionPanelInTodayPage:](self->_currentSession, "setHasAppPredictionPanelInTodayPage:", objc_msgSend(v7, "hasAppPredictionPanelToday"));
      -[ATXScreenLogUnlockSession setAppLibraryEnabled:](self->_currentSession, "setAppLibraryEnabled:", objc_msgSend(v7, "appLibraryEnabled"));
      break;
    case 2:
      v12 = self->_currentSession;
      if (v12)
      {
        objc_msgSend(v6, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXScreenLogUnlockSession finalizeWithSessionEndDate:](v12, "finalizeWithSessionEndDate:", v13);

        -[NSMutableArray addObject:](self->_completedSessions, "addObject:", self->_currentSession);
LABEL_5:
        v14 = self->_currentSession;
        self->_currentSession = 0;

      }
      break;
    case 3:
      -[ATXScreenLogUnlockSession updateWithUIEventIfPossible:](self->_currentSession, "updateWithUIEventIfPossible:", v15);
      break;
    default:
      break;
  }

}

- (int64_t)updateSessionStateWithUIEvent:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[ATXHomeScreenLogUnlockSessionManager _eventStatusWithUIEvent:](self, "_eventStatusWithUIEvent:", v4);
  -[ATXHomeScreenLogUnlockSessionManager _updateCurrentSessionWithUIEvent:eventStatus:](self, "_updateCurrentSessionWithUIEvent:eventStatus:", v4, v5);

  return v5;
}

- (id)removeCompletedSessions
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *completedSessions;
  void *v6;

  v3 = self->_completedSessions;
  v4 = (NSMutableArray *)objc_opt_new();
  completedSessions = self->_completedSessions;
  self->_completedSessions = v4;

  v6 = (void *)-[NSMutableArray copy](v3, "copy");
  return v6;
}

- (id)summarizeCompletedSessions
{
  ATXHomeScreenLogUnlockSessionManager *v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ATXHomeScreenLogUnlockSessionManager *v26;
  NSMutableArray *obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[7];
  _QWORD v34[7];
  _BYTE v35[128];
  uint64_t v36;

  v2 = self;
  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_completedSessions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v26 = v2;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v28 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "sessionEndDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sessionStartDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v10 = (unint64_t)(v15 + (double)v10);

        if (objc_msgSend(v12, "numEngagementsInAppLibrary"))
          ++v6;
        if (objc_msgSend(v12, "numEngagementsInAppPredictionPanel"))
          ++v7;
        if (objc_msgSend(v12, "numEngagementsInAppPredictionPanelTodayPage"))
          ++v7;
        if (objc_msgSend(v12, "numEngagementsInSpotlightApps"))
          ++v9;
        if (objc_msgSend(v12, "numEngagementsInSpotlightActions"))
          ++v8;
        objc_msgSend(v12, "numEngagementsInSuggestionsWidget");
        objc_msgSend(v12, "numEngagementsInSuggestionsWidgetTodayPage");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
    v16 = (double)v10;
    v2 = v26;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v16 = 0.0;
  }

  if (-[NSMutableArray count](v2->_completedSessions, "count"))
    v4 = v16 / (double)(unint64_t)-[NSMutableArray count](v2->_completedSessions, "count");
  v33[0] = CFSTR("NumberOfLockUnlockSessions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](v2->_completedSessions, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v17;
  v33[1] = CFSTR("AverageSessionLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v18;
  v33[2] = CFSTR("NumSessionsWithAppLibraryPredictionEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v19;
  v33[3] = CFSTR("NumSessionsWithAppPanelEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v20;
  v33[4] = CFSTR("NumSessionsWithSpotlightActionEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v21;
  v33[5] = CFSTR("NumSessionsWithSpotlightAppEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v22;
  v33[6] = CFSTR("NumSessionsWithSuggestionWidgetEngagement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)_currentSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledDomains"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("DOMAIN_ZKWS")) ^ 1;

  objc_msgSend(v2, "setSpotlightEnabled:", v4);
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 1;

  objc_msgSend(v2, "setAppLibraryEnabled:", v7);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "loadHomeScreenAndTodayPageConfigurationsWithError:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v13 = *MEMORY[0x1E0CF9338];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "pageIndex");
        v17 = objc_msgSend(MEMORY[0x1E0CF8E58], "appPredictionPanelExistsInPage:", v15);
        if (v16 == v13)
        {
          if (v17)
            objc_msgSend(v2, "setHasAppPredictionPanelToday:", 1);
          if (objc_msgSend(MEMORY[0x1E0CF8E58], "suggestionsWidgetExistsInPage:", v15))
            objc_msgSend(v2, "setHasSuggestionsWidgetToday:", 1);
        }
        else
        {
          if (v17)
            objc_msgSend(v2, "setHasAppPredictionPanel:", 1);
          if (objc_msgSend(MEMORY[0x1E0CF8E58], "suggestionsWidgetExistsInPage:", v15))
            objc_msgSend(v2, "setHasSuggestionsWidget:", 1);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v2;
}

+ (id)currentSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ATXHomeScreenLogUnlockSessionManager_currentSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentSettings__pasOnceToken6 != -1)
    dispatch_once(&currentSettings__pasOnceToken6, block);
  return (id)currentSettings__pasExprOnceResult;
}

void __55__ATXHomeScreenLogUnlockSessionManager_currentSettings__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(*(id *)(a1 + 32), "_currentSettings");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)currentSettings__pasExprOnceResult;
  currentSettings__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isInSession;
  id v5;

  isInSession = self->_isInSession;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isInSession, CFSTR("isInSession"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentSession, CFSTR("currentSession"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedSessions, CFSTR("completedSessions"));

}

- (ATXHomeScreenLogUnlockSessionManager)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXHomeScreenLogUnlockSessionManager *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInSession"));
  v6 = (void *)MEMORY[0x1E0D81610];
  v7 = objc_opt_class();
  __atxlog_handle_metrics();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("currentSession"), v4, 0, CFSTR("com.apple.duetexpertd.ATXHomeScreenLogUnlockSessionManager"), -1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1CAA48B6C]();
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v10);
  v14 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_metrics();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v13, CFSTR("completedSessions"), v4, 1, CFSTR("com.apple.duetexpertd.ATXHomeScreenLogUnlockSessionManager"), -1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    self = -[ATXHomeScreenLogUnlockSessionManager initWithIsInSession:currentSession:completedSessions:](self, "initWithIsInSession:currentSession:completedSessions:", v5, v9, v16);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenLogUnlockSessionManager *v4;
  ATXHomeScreenLogUnlockSessionManager *v5;
  BOOL v6;

  v4 = (ATXHomeScreenLogUnlockSessionManager *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenLogUnlockSessionManager isEqualToATXHomeScreenLogUnlockSessionManager:](self, "isEqualToATXHomeScreenLogUnlockSessionManager:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenLogUnlockSessionManager:(id)a3
{
  unsigned __int8 *v4;
  _QWORD *v5;
  ATXScreenLogUnlockSession *currentSession;
  ATXScreenLogUnlockSession *v7;
  ATXScreenLogUnlockSession *v8;
  ATXScreenLogUnlockSession *v9;
  BOOL v10;
  char v11;
  NSMutableArray *v12;
  NSMutableArray *v13;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (self->_isInSession != v4[8])
    goto LABEL_4;
  currentSession = self->_currentSession;
  v7 = (ATXScreenLogUnlockSession *)*((id *)v4 + 2);
  if (currentSession == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = currentSession;
    v10 = -[ATXScreenLogUnlockSession isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_completedSessions;
  v13 = v12;
  if (v12 == (NSMutableArray *)v5[3])
    v11 = 1;
  else
    v11 = -[NSMutableArray isEqual:](v12, "isEqual:");

LABEL_10:
  return v11;
}

- (BOOL)isInSession
{
  return self->_isInSession;
}

- (void)setIsInSession:(BOOL)a3
{
  self->_isInSession = a3;
}

- (ATXScreenLogUnlockSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (void)setCompletedSessions:(id)a3
{
  objc_storeStrong((id *)&self->_completedSessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

@end
