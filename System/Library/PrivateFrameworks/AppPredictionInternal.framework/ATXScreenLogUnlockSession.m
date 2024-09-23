@implementation ATXScreenLogUnlockSession

- (ATXScreenLogUnlockSession)initWithSessionStartDate:(id)a3
{
  id v5;
  ATXScreenLogUnlockSession *v6;
  ATXScreenLogUnlockSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScreenLogUnlockSession;
  v6 = -[ATXScreenLogUnlockSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionStartDate, a3);

  return v7;
}

- (void)updateWithUIEventIfPossible:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "homeScreenEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXScreenLogUnlockSession _updateWithHomeScreenEvent:](self, "_updateWithHomeScreenEvent:", v4);
  }
  else
  {
    objc_msgSend(v7, "spotlightEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[ATXScreenLogUnlockSession _updateWithSpotlightEvent:](self, "_updateWithSpotlightEvent:", v5);
    }
    else
    {
      objc_msgSend(v7, "appDirectoryEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[ATXScreenLogUnlockSession _updateWithAppDirectoryEvent:](self, "_updateWithAppDirectoryEvent:", v6);

    }
  }

}

- (void)_updateWithSpotlightEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  unint64_t numViewsInSpotlightApps;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    if (objc_msgSend(v4, "eventType") == 4)
    {
      objc_msgSend(v13, "appSuggestionIds");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_numEngagementsInSpotlightApps += objc_msgSend(v5, "count");

      objc_msgSend(v13, "actionSuggestionIds");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      v8 = 40;
    }
    else
    {
      v9 = objc_msgSend(v13, "eventType") == 3;
      v4 = v13;
      if (!v9)
        goto LABEL_10;
      objc_msgSend(v13, "appSuggestionIds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      numViewsInSpotlightApps = self->_numViewsInSpotlightApps;
      if (v11)
        ++numViewsInSpotlightApps;
      self->_numViewsInSpotlightApps = numViewsInSpotlightApps;

      objc_msgSend(v13, "actionSuggestionIds");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") != 0;
      v8 = 96;
    }
    *(Class *)((char *)&self->super.isa + v8) = (Class)(*(char **)((char *)&self->super.isa + v8) + v7);

    v4 = v13;
  }
LABEL_10:

}

- (BOOL)_widgetBundleIdIsSuggestionsWidget:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF9480]);
  if ((v5 & 1) == 0 && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF89A8]) & 1) == 0)
  {
    __atxlog_handle_metrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[ATXScreenLogUnlockSession _widgetBundleIdIsSuggestionsWidget:].cold.1((uint64_t)self, (uint64_t)v4, v6);

  }
  return v5;
}

- (void)_updateWithHomeScreenEvent:(id)a3
{
  id v4;
  void *v5;
  int IsTodayPage;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = v4;
    objc_msgSend(v4, "widgetBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v19, "stackLocation");
      IsTodayPage = ATXStackLocationIsTodayPage();
      objc_msgSend(v19, "eventTypeString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Tapped"));

      if (v8)
      {
        v9 = -[ATXScreenLogUnlockSession _widgetBundleIdIsSuggestionsWidget:](self, "_widgetBundleIdIsSuggestionsWidget:", v5);
        objc_msgSend(v19, "suggestionIds");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        v12 = 64;
        if (v9)
          v12 = 48;
        v13 = !v9;
        v14 = 72;
        v15 = 56;
LABEL_11:
        if (!v13)
          v14 = v15;
        if (IsTodayPage)
          v12 = v14;
        *(Class *)((char *)&self->super.isa + v12) = (Class)(*(char **)((char *)&self->super.isa + v12) + v11);

        goto LABEL_16;
      }
      objc_msgSend(v19, "eventTypeString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SuggestionsAppeared"));

      if (v17)
      {
        v18 = -[ATXScreenLogUnlockSession _widgetBundleIdIsSuggestionsWidget:](self, "_widgetBundleIdIsSuggestionsWidget:", v5);
        objc_msgSend(v19, "suggestionIds");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count") != 0;
        v12 = 120;
        if (v18)
          v12 = 104;
        v13 = !v18;
        v14 = 128;
        v15 = 112;
        goto LABEL_11;
      }
    }
LABEL_16:

    v4 = v19;
  }

}

- (void)_updateWithAppDirectoryEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    v5 = objc_msgSend(v4, "eventType");
    v6 = objc_msgSend(v13, "eventType");
    objc_msgSend(v13, "categoryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v13, "categoryID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToNumber:", &unk_1E83CD5B8);

      v10 = v9 ^ 1;
    }
    else
    {
      v10 = 1;
    }

    if (!v5)
    {
      v12 = 136;
      v4 = v13;
      goto LABEL_12;
    }
    if (v6 == 4)
      v11 = v10;
    else
      v11 = 1;
    v4 = v13;
    if ((v11 & 1) == 0)
    {
      v12 = 80;
LABEL_12:
      ++*(Class *)((char *)&self->super.isa + v12);
    }
  }

}

- (void)finalizeWithSessionEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEndDate, a3);
}

- (BOOL)complete
{
  return self->_sessionStartDate && self->_sessionEndDate != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *sessionStartDate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  sessionStartDate = self->_sessionStartDate;
  v19 = a3;
  objc_msgSend(v19, "encodeObject:forKey:", sessionStartDate, CFSTR("sessionStartDate"));
  objc_msgSend(v19, "encodeObject:forKey:", self->_sessionEndDate, CFSTR("sessionEndDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInSpotlightApps);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v5, CFSTR("engagementsSpotlightApps"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInSpotlightActions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v6, CFSTR("engagementsSpotlightActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInSuggestionsWidget);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v7, CFSTR("engagementsSuggestionsWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInSuggestionsWidgetTodayPage);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v8, CFSTR("engagementsSuggestionsWidgetToday"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInAppPredictionPanel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v9, CFSTR("engagementsAppPanel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInAppPredictionPanelTodayPage);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v10, CFSTR("engagementsAppPanelToday"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numEngagementsInAppLibrary);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v11, CFSTR("engagementsAppLibrary"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInSpotlightApps);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v12, CFSTR("viewsSpotlightApps"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInSpotlightActions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v13, CFSTR("viewsSpotlightActions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInSuggestionsWidget);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v14, CFSTR("viewsSuggestionsWidget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInSuggestionsWidgetTodayPage);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v15, CFSTR("viewsSuggestionsWidgetToday"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInAppPredictionPanel);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v16, CFSTR("viewsAppPanel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInAppPredictionPanelTodayPage);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v17, CFSTR("viewsAppPanelToday"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numViewsInAppLibrary);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v18, CFSTR("viewsAppLibrary"));

  objc_msgSend(v19, "encodeBool:forKey:", self->_spotlightEnabled, CFSTR("spotlightEnabled"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_hasSuggestionsWidget, CFSTR("hasSuggestionsWidget"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_hasSuggestionsWidgetInTodayPage, CFSTR("hasSuggestionsWidgetToday"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_hasAppPredictionPanel, CFSTR("hasAppPredictionPanel"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_hasAppPredictionPanelInTodayPage, CFSTR("hasAppPredictionPanelToday"));
  objc_msgSend(v19, "encodeBool:forKey:", self->_appLibraryEnabled, CFSTR("appLibraryEnabled"));

}

- (ATXScreenLogUnlockSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  ATXScreenLogUnlockSession *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  ATXScreenLogUnlockSession *v64;
  uint64_t v65;
  uint64_t v66;
  ATXScreenLogUnlockSession *v67;
  ATXScreenLogUnlockSession *v68;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  ATXScreenLogUnlockSession *v73;
  ATXScreenLogUnlockSession *v74;
  ATXScreenLogUnlockSession *v75;
  ATXScreenLogUnlockSession *v76;
  ATXScreenLogUnlockSession *v77;
  ATXScreenLogUnlockSession *v78;
  ATXScreenLogUnlockSession *v79;
  ATXScreenLogUnlockSession *v80;
  ATXScreenLogUnlockSession *v81;
  ATXScreenLogUnlockSession *v82;
  ATXScreenLogUnlockSession *v83;
  void *v84;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("sessionStartDate"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D81610];
    v10 = objc_opt_class();
    __atxlog_handle_metrics();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("sessionEndDate"), v4, 0, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D81610];
    v14 = objc_opt_class();
    __atxlog_handle_metrics();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v14, CFSTR("engagementsSpotlightApps"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0D81610];
      v18 = objc_opt_class();
      __atxlog_handle_metrics();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("engagementsSpotlightActions"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v84 = v12;
        v21 = (void *)MEMORY[0x1E0D81610];
        v22 = objc_opt_class();
        __atxlog_handle_metrics();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("engagementsSuggestionsWidget"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v83 = self;
          v25 = (void *)MEMORY[0x1E0D81610];
          v26 = objc_opt_class();
          __atxlog_handle_metrics();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v26, CFSTR("engagementsSuggestionsWidgetToday"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v27);
          v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

          v82 = v28;
          if (v28)
          {
            v29 = (void *)MEMORY[0x1E0D81610];
            v30 = objc_opt_class();
            __atxlog_handle_metrics();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v30, CFSTR("engagementsAppPanel"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v31);
            v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

            v81 = v28;
            if (v28)
            {
              v32 = (void *)MEMORY[0x1E0D81610];
              v33 = objc_opt_class();
              __atxlog_handle_metrics();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v33, CFSTR("engagementsAppPanelToday"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v34);
              v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

              v80 = v28;
              if (v28)
              {
                v35 = (void *)MEMORY[0x1E0D81610];
                v36 = objc_opt_class();
                __atxlog_handle_metrics();
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v36, CFSTR("engagementsAppLibrary"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v37);
                v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                v79 = v28;
                if (v28)
                {
                  v38 = (void *)MEMORY[0x1E0D81610];
                  v39 = objc_opt_class();
                  __atxlog_handle_metrics();
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v39, CFSTR("viewsSpotlightApps"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v40);
                  v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                  v78 = v28;
                  if (v28)
                  {
                    v41 = (void *)MEMORY[0x1E0D81610];
                    v42 = objc_opt_class();
                    __atxlog_handle_metrics();
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v42, CFSTR("viewsSpotlightActions"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v43);
                    v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                    v77 = v28;
                    if (v28)
                    {
                      v44 = (void *)MEMORY[0x1E0D81610];
                      v45 = objc_opt_class();
                      __atxlog_handle_metrics();
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v45, CFSTR("viewsSuggestionsWidget"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v46);
                      v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                      v76 = v28;
                      if (v28)
                      {
                        v47 = (void *)MEMORY[0x1E0D81610];
                        v48 = objc_opt_class();
                        __atxlog_handle_metrics();
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v47, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v48, CFSTR("viewsSuggestionsWidgetToday"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v49);
                        v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                        v75 = v28;
                        if (v28)
                        {
                          v50 = (void *)MEMORY[0x1E0D81610];
                          v51 = objc_opt_class();
                          __atxlog_handle_metrics();
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v51, CFSTR("viewsAppPanel"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v52);
                          v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                          v74 = v28;
                          if (v28)
                          {
                            v53 = (void *)MEMORY[0x1E0D81610];
                            v54 = objc_opt_class();
                            __atxlog_handle_metrics();
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v53, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v54, CFSTR("viewsAppPanelToday"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v55);
                            v28 = (ATXScreenLogUnlockSession *)objc_claimAutoreleasedReturnValue();

                            v73 = v28;
                            if (v28)
                            {
                              v56 = (void *)MEMORY[0x1E0D81610];
                              v57 = objc_opt_class();
                              __atxlog_handle_metrics();
                              v58 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v56, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v57, CFSTR("viewsAppLibrary"), v4, 1, CFSTR("com.apple.duetexpertd.ATXScreenLogUnlockSession"), -1, v58);
                              v59 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v59)
                              {
                                v72 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spotlightEnabled"));
                                v60 = v59;
                                v71 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSuggestionsWidget"));
                                v70 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSuggestionsWidget"));
                                v61 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAppPredictionPanel"));
                                v62 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAppPredictionPanel"));
                                v63 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appLibraryEnabled"));
                                v64 = -[ATXScreenLogUnlockSession initWithSessionStartDate:](v83, "initWithSessionStartDate:", v8);
                                -[ATXScreenLogUnlockSession setSessionEndDate:](v64, "setSessionEndDate:", v84);
                                -[ATXScreenLogUnlockSession setSpotlightEnabled:](v64, "setSpotlightEnabled:", v72);
                                -[ATXScreenLogUnlockSession setHasSuggestionsWidget:](v64, "setHasSuggestionsWidget:", v71);
                                -[ATXScreenLogUnlockSession setHasSuggestionsWidgetInTodayPage:](v64, "setHasSuggestionsWidgetInTodayPage:", v70);
                                v65 = v61;
                                self = v64;
                                -[ATXScreenLogUnlockSession setHasAppPredictionPanel:](v64, "setHasAppPredictionPanel:", v65);
                                -[ATXScreenLogUnlockSession setHasAppPredictionPanelInTodayPage:](v64, "setHasAppPredictionPanelInTodayPage:", v62);
                                v66 = v63;
                                v59 = v60;
                                -[ATXScreenLogUnlockSession setAppLibraryEnabled:](v64, "setAppLibraryEnabled:", v66);
                                -[ATXScreenLogUnlockSession setNumEngagementsInSpotlightApps:](v64, "setNumEngagementsInSpotlightApps:", objc_msgSend(v16, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumEngagementsInSpotlightActions:](v64, "setNumEngagementsInSpotlightActions:", objc_msgSend(v20, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumEngagementsInSuggestionsWidget:](v64, "setNumEngagementsInSuggestionsWidget:", objc_msgSend(v24, "unsignedIntegerValue"));
                                v67 = v82;
                                -[ATXScreenLogUnlockSession setNumEngagementsInSuggestionsWidgetTodayPage:](self, "setNumEngagementsInSuggestionsWidgetTodayPage:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v82, "unsignedIntegerValue"));
                                v68 = v81;
                                -[ATXScreenLogUnlockSession setNumEngagementsInAppPredictionPanel:](self, "setNumEngagementsInAppPredictionPanel:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v81, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumEngagementsInAppPredictionPanelTodayPage:](self, "setNumEngagementsInAppPredictionPanelTodayPage:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v80, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumEngagementsInAppLibrary:](self, "setNumEngagementsInAppLibrary:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v79, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInSpotlightApps:](self, "setNumViewsInSpotlightApps:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v78, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInSpotlightActions:](self, "setNumViewsInSpotlightActions:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v77, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInSuggestionsWidget:](self, "setNumViewsInSuggestionsWidget:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v76, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInSuggestionsWidgetTodayPage:](self, "setNumViewsInSuggestionsWidgetTodayPage:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v75, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInAppPredictionPanel:](self, "setNumViewsInAppPredictionPanel:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v74, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInAppPredictionPanelTodayPage:](self, "setNumViewsInAppPredictionPanelTodayPage:", -[ATXScreenLogUnlockSession unsignedIntegerValue](v73, "unsignedIntegerValue"));
                                -[ATXScreenLogUnlockSession setNumViewsInAppLibrary:](self, "setNumViewsInAppLibrary:", objc_msgSend(v59, "unsignedIntegerValue"));
                                v28 = self;
                              }
                              else
                              {
                                v28 = 0;
                                self = v83;
                                v68 = v81;
                                v67 = v82;
                              }

                              v12 = v84;
                            }
                            else
                            {
                              self = v83;
                              v12 = v84;
                              v68 = v81;
                              v67 = v82;
                            }

                          }
                          else
                          {
                            self = v83;
                            v12 = v84;
                            v68 = v81;
                            v67 = v82;
                          }

                        }
                        else
                        {
                          self = v83;
                          v12 = v84;
                          v68 = v81;
                          v67 = v82;
                        }

                      }
                      else
                      {
                        self = v83;
                        v12 = v84;
                        v68 = v81;
                        v67 = v82;
                      }

                    }
                    else
                    {
                      self = v83;
                      v12 = v84;
                      v68 = v81;
                      v67 = v82;
                    }

                  }
                  else
                  {
                    self = v83;
                    v12 = v84;
                    v68 = v81;
                    v67 = v82;
                  }

                }
                else
                {
                  self = v83;
                  v12 = v84;
                  v68 = v81;
                  v67 = v82;
                }

              }
              else
              {
                self = v83;
                v12 = v84;
                v68 = v81;
                v67 = v82;
              }

            }
            else
            {
              self = v83;
              v12 = v84;
              v68 = 0;
              v67 = v82;
            }

          }
          else
          {
            self = v83;
            v12 = v84;
            v67 = 0;
          }

        }
        else
        {
          v28 = 0;
          v12 = v84;
        }

      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = -[NSDate hash](self->_sessionStartDate, "hash");
  v4 = -[NSDate hash](self->_sessionEndDate, "hash");
  v5 = self->_numEngagementsInSpotlightApps - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = self->_numEngagementsInSpotlightActions - v5 + 32 * v5;
  v7 = self->_numEngagementsInSuggestionsWidget - v6 + 32 * v6;
  v8 = self->_numEngagementsInSuggestionsWidgetTodayPage - v7 + 32 * v7;
  v9 = self->_numEngagementsInAppPredictionPanel - v8 + 32 * v8;
  v10 = self->_numEngagementsInAppPredictionPanelTodayPage - v9 + 32 * v9;
  v11 = self->_numEngagementsInAppLibrary - v10 + 32 * v10;
  v12 = self->_numViewsInSpotlightApps - v11 + 32 * v11;
  v13 = self->_numViewsInSpotlightActions - v12 + 32 * v12;
  v14 = self->_numViewsInSuggestionsWidget - v13 + 32 * v13;
  v15 = self->_numViewsInSuggestionsWidgetTodayPage - v14 + 32 * v14;
  v16 = self->_numViewsInAppPredictionPanel - v15 + 32 * v15;
  v17 = self->_numViewsInAppPredictionPanelTodayPage - v16 + 32 * v16;
  v18 = self->_spotlightEnabled
      - (self->_numViewsInAppLibrary
       - v17
       + 32 * v17)
      + 32 * (self->_numViewsInAppLibrary - v17 + 32 * v17);
  v19 = self->_hasSuggestionsWidget - v18 + 32 * v18;
  v20 = self->_hasSuggestionsWidgetInTodayPage - v19 + 32 * v19;
  v21 = self->_hasAppPredictionPanel - v20 + 32 * v20;
  v22 = self->_hasAppPredictionPanelInTodayPage - v21 + 32 * v21;
  return self->_appLibraryEnabled - v22 + 32 * v22;
}

- (BOOL)isEqual:(id)a3
{
  ATXScreenLogUnlockSession *v4;
  ATXScreenLogUnlockSession *v5;
  BOOL v6;

  v4 = (ATXScreenLogUnlockSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXScreenLogUnlockSession isEqualToATXScreenLogUnlockSession:](self, "isEqualToATXScreenLogUnlockSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXScreenLogUnlockSession:(id)a3
{
  id *v4;
  NSDate *sessionStartDate;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  char v9;
  NSDate *sessionEndDate;
  NSDate *v11;
  NSDate *v12;
  NSDate *v13;
  char v14;
  BOOL v15;

  v4 = (id *)a3;
  sessionStartDate = self->_sessionStartDate;
  v6 = (NSDate *)v4[2];
  if (sessionStartDate == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sessionStartDate;
    v9 = -[NSDate isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_29:
      v15 = 0;
      goto LABEL_30;
    }
  }
  sessionEndDate = self->_sessionEndDate;
  v11 = (NSDate *)v4[3];
  if (sessionEndDate == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = sessionEndDate;
    v14 = -[NSDate isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_29;
  }
  if ((id)self->_numEngagementsInSpotlightApps != v4[4]
    || (id)self->_numEngagementsInSpotlightActions != v4[5]
    || (id)self->_numEngagementsInSuggestionsWidget != v4[6]
    || (id)self->_numEngagementsInSuggestionsWidgetTodayPage != v4[7]
    || (id)self->_numEngagementsInAppPredictionPanel != v4[8]
    || (id)self->_numEngagementsInAppPredictionPanelTodayPage != v4[9]
    || (id)self->_numEngagementsInAppLibrary != v4[10]
    || (id)self->_numViewsInSpotlightApps != v4[11]
    || (id)self->_numViewsInSpotlightActions != v4[12]
    || (id)self->_numViewsInSuggestionsWidget != v4[13]
    || (id)self->_numViewsInSuggestionsWidgetTodayPage != v4[14]
    || (id)self->_numViewsInAppPredictionPanel != v4[15]
    || (id)self->_numViewsInAppPredictionPanelTodayPage != v4[16]
    || (id)self->_numViewsInAppLibrary != v4[17]
    || self->_spotlightEnabled != *((unsigned __int8 *)v4 + 8)
    || self->_hasSuggestionsWidget != *((unsigned __int8 *)v4 + 9)
    || self->_hasSuggestionsWidgetInTodayPage != *((unsigned __int8 *)v4 + 10)
    || self->_hasAppPredictionPanel != *((unsigned __int8 *)v4 + 11)
    || self->_hasAppPredictionPanelInTodayPage != *((unsigned __int8 *)v4 + 12))
  {
    goto LABEL_29;
  }
  v15 = self->_appLibraryEnabled == *((unsigned __int8 *)v4 + 13);
LABEL_30:

  return v15;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartDate, a3);
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (void)setSessionEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEndDate, a3);
}

- (unint64_t)numEngagementsInSpotlightApps
{
  return self->_numEngagementsInSpotlightApps;
}

- (void)setNumEngagementsInSpotlightApps:(unint64_t)a3
{
  self->_numEngagementsInSpotlightApps = a3;
}

- (unint64_t)numEngagementsInSpotlightActions
{
  return self->_numEngagementsInSpotlightActions;
}

- (void)setNumEngagementsInSpotlightActions:(unint64_t)a3
{
  self->_numEngagementsInSpotlightActions = a3;
}

- (unint64_t)numEngagementsInSuggestionsWidget
{
  return self->_numEngagementsInSuggestionsWidget;
}

- (void)setNumEngagementsInSuggestionsWidget:(unint64_t)a3
{
  self->_numEngagementsInSuggestionsWidget = a3;
}

- (unint64_t)numEngagementsInSuggestionsWidgetTodayPage
{
  return self->_numEngagementsInSuggestionsWidgetTodayPage;
}

- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unint64_t)a3
{
  self->_numEngagementsInSuggestionsWidgetTodayPage = a3;
}

- (unint64_t)numEngagementsInAppPredictionPanel
{
  return self->_numEngagementsInAppPredictionPanel;
}

- (void)setNumEngagementsInAppPredictionPanel:(unint64_t)a3
{
  self->_numEngagementsInAppPredictionPanel = a3;
}

- (unint64_t)numEngagementsInAppPredictionPanelTodayPage
{
  return self->_numEngagementsInAppPredictionPanelTodayPage;
}

- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unint64_t)a3
{
  self->_numEngagementsInAppPredictionPanelTodayPage = a3;
}

- (unint64_t)numEngagementsInAppLibrary
{
  return self->_numEngagementsInAppLibrary;
}

- (void)setNumEngagementsInAppLibrary:(unint64_t)a3
{
  self->_numEngagementsInAppLibrary = a3;
}

- (unint64_t)numViewsInSpotlightApps
{
  return self->_numViewsInSpotlightApps;
}

- (void)setNumViewsInSpotlightApps:(unint64_t)a3
{
  self->_numViewsInSpotlightApps = a3;
}

- (unint64_t)numViewsInSpotlightActions
{
  return self->_numViewsInSpotlightActions;
}

- (void)setNumViewsInSpotlightActions:(unint64_t)a3
{
  self->_numViewsInSpotlightActions = a3;
}

- (unint64_t)numViewsInSuggestionsWidget
{
  return self->_numViewsInSuggestionsWidget;
}

- (void)setNumViewsInSuggestionsWidget:(unint64_t)a3
{
  self->_numViewsInSuggestionsWidget = a3;
}

- (unint64_t)numViewsInSuggestionsWidgetTodayPage
{
  return self->_numViewsInSuggestionsWidgetTodayPage;
}

- (void)setNumViewsInSuggestionsWidgetTodayPage:(unint64_t)a3
{
  self->_numViewsInSuggestionsWidgetTodayPage = a3;
}

- (unint64_t)numViewsInAppPredictionPanel
{
  return self->_numViewsInAppPredictionPanel;
}

- (void)setNumViewsInAppPredictionPanel:(unint64_t)a3
{
  self->_numViewsInAppPredictionPanel = a3;
}

- (unint64_t)numViewsInAppPredictionPanelTodayPage
{
  return self->_numViewsInAppPredictionPanelTodayPage;
}

- (void)setNumViewsInAppPredictionPanelTodayPage:(unint64_t)a3
{
  self->_numViewsInAppPredictionPanelTodayPage = a3;
}

- (unint64_t)numViewsInAppLibrary
{
  return self->_numViewsInAppLibrary;
}

- (void)setNumViewsInAppLibrary:(unint64_t)a3
{
  self->_numViewsInAppLibrary = a3;
}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  self->_spotlightEnabled = a3;
}

- (BOOL)hasSuggestionsWidget
{
  return self->_hasSuggestionsWidget;
}

- (void)setHasSuggestionsWidget:(BOOL)a3
{
  self->_hasSuggestionsWidget = a3;
}

- (BOOL)hasSuggestionsWidgetInTodayPage
{
  return self->_hasSuggestionsWidgetInTodayPage;
}

- (void)setHasSuggestionsWidgetInTodayPage:(BOOL)a3
{
  self->_hasSuggestionsWidgetInTodayPage = a3;
}

- (BOOL)hasAppPredictionPanel
{
  return self->_hasAppPredictionPanel;
}

- (void)setHasAppPredictionPanel:(BOOL)a3
{
  self->_hasAppPredictionPanel = a3;
}

- (BOOL)hasAppPredictionPanelInTodayPage
{
  return self->_hasAppPredictionPanelInTodayPage;
}

- (void)setHasAppPredictionPanelInTodayPage:(BOOL)a3
{
  self->_hasAppPredictionPanelInTodayPage = a3;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  self->_appLibraryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

- (void)_widgetBundleIdIsSuggestionsWidget:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "%@ - received non-proactive widgetBundleId of %@", (uint8_t *)&v7, 0x16u);

}

@end
