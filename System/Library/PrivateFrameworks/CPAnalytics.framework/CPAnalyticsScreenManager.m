@implementation CPAnalyticsScreenManager

- (CPAnalyticsScreenManager)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v6;
  id v7;
  CPAnalyticsScreenManager *v8;
  NSSet *v9;
  NSSet *namesOfViewsToTrack;
  NSSet *v11;
  NSSet *namesOfViewsToIgnore;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CPAnalyticsScreenManager;
  v8 = -[CPAnalyticsScreenManager init](&v15, sel_init);
  if (v8)
  {
    v9 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    namesOfViewsToTrack = v8->_namesOfViewsToTrack;
    v8->_namesOfViewsToTrack = v9;

    v11 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    namesOfViewsToIgnore = v8->_namesOfViewsToIgnore;
    v8->_namesOfViewsToIgnore = v11;

    objc_msgSend(v7, "systemProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager registerSystemProperties:](v8, "registerSystemProperties:", v13);

    -[CPAnalyticsScreenManager _initializeScreenViewTrackers:](v8, "_initializeScreenViewTrackers:", v6);
    -[CPAnalyticsScreenManager setCpAnalyticsInstance:](v8, "setCpAnalyticsInstance:", v7);
    -[CPAnalyticsScreenManager setCurrentTabIdentifierDescription:](v8, "setCurrentTabIdentifierDescription:", CFSTR("NoScreenName"));
  }

  return v8;
}

- (void)updateWithConfig:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSSet *namesOfViewsToTrack;
  void *v17;
  NSSet *v18;
  NSSet *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  NSSet *namesOfViewsToIgnore;
  NSSet *v31;
  NSObject *p_super;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackViews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager namesOfViewsToIgnore](self, "namesOfViewsToIgnore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsObject:", v15))
          {
            CPAnalyticsLog();
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v15;
              _os_log_error_impl(&dword_20AB22000, p_super, OS_LOG_TYPE_ERROR, "View %@ is in ignore list. It cannot be tracked.", buf, 0xCu);
            }
            v24 = v10;
            goto LABEL_27;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        if (v12)
          continue;
        break;
      }
    }

    namesOfViewsToTrack = self->_namesOfViewsToTrack;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackViews"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet setByAddingObjectsFromArray:](namesOfViewsToTrack, "setByAddingObjectsFromArray:", v17);
    v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v19 = self->_namesOfViewsToTrack;
    self->_namesOfViewsToTrack = v18;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignoreViews"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignoreViews"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager namesOfViewsToTrack](self, "namesOfViewsToTrack");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v23, "copy");

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          if (objc_msgSend(v9, "containsObject:", v29, (_QWORD)v33))
          {
            CPAnalyticsLog();
            p_super = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v29;
              _os_log_error_impl(&dword_20AB22000, p_super, OS_LOG_TYPE_ERROR, "View %@ is in track list. It cannot be ignored.", buf, 0xCu);
            }
            v10 = v24;
            goto LABEL_27;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v26)
          continue;
        break;
      }
    }

    namesOfViewsToIgnore = self->_namesOfViewsToIgnore;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ignoreViews"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSSet setByAddingObjectsFromArray:](namesOfViewsToIgnore, "setByAddingObjectsFromArray:", v10);
    v31 = (NSSet *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_namesOfViewsToIgnore->super;
    self->_namesOfViewsToIgnore = v31;
LABEL_27:

  }
}

- (void)processEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[CPAnalyticsScreenManager _updateAppLifeCycle:](self, "_updateAppLifeCycle:", v4);
  -[CPAnalyticsScreenManager _updateScreenTracking:](self, "_updateScreenTracking:", v4);
  -[CPAnalyticsScreenManager _updateTabTracking:](self, "_updateTabTracking:", v4);

}

- (id)currentScreenViewName
{
  return -[CPAnalyticsScreenManager screenViewNameAt:](self, "screenViewNameAt:", 0);
}

- (id)lastScreenName
{
  return -[CPAnalyticsScreenManager screenViewNameAt:](self, "screenViewNameAt:", 1);
}

- (void)_updateAppLifeCycle:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.appDidBecomeActive"));

  if (v5)
  {
    -[CPAnalyticsScreenManager cpAnalyticsInstance](self, "cpAnalyticsInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager setAppVisiblePeriodSignpostID:](self, "setAppVisiblePeriodSignpostID:", objc_msgSend(v6, "startSignpost"));

    objc_msgSend(v14, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager _resetSessionWithTime:](self, "_resetSessionWithTime:", v7);

    -[CPAnalyticsScreenManager setForegroundEventCount:](self, "setForegroundEventCount:", -[CPAnalyticsScreenManager foregroundEventCount](self, "foregroundEventCount") + 1);
  }
  else
  {
    objc_msgSend(v14, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.appWillResignActive"));

    if (v9)
    {
      -[CPAnalyticsScreenManager cpAnalyticsInstance](self, "cpAnalyticsInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CPAnalyticsScreenManager appVisiblePeriodSignpostID](self, "appVisiblePeriodSignpostID");
      v12 = (void *)objc_msgSend(v14, "copyRawPayload");
      objc_msgSend(v10, "endSignpost:forEventName:withPayload:", v11, CFSTR("com.apple.photos.CPAnalytics.signpost.appVisiblePeriod"), v12);

      -[CPAnalyticsScreenManager setAppVisiblePeriodSignpostID:](self, "setAppVisiblePeriodSignpostID:", 0);
      objc_msgSend(v14, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPAnalyticsScreenManager _sendCPAnalyticsScreenViewEventWithEndTime:](self, "_sendCPAnalyticsScreenViewEventWithEndTime:", v13);

      -[CPAnalyticsScreenManager setCurrentScreenStartTime:](self, "setCurrentScreenStartTime:", 0);
    }
  }

}

- (void)_updateScreenTracking:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (+[CPAnalyticsScreenManager isValidScreenViewEvent:](CPAnalyticsScreenManager, "isValidScreenViewEvent:"))
  {
    objc_msgSend(v10, "propertyForKey:", CFSTR("className"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", CFSTR("viewID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager namesOfViewsToTrack](self, "namesOfViewsToTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if (v7)
    {
      objc_msgSend(v10, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPAnalyticsScreenManager _trackView:withEventName:viewID:eventTime:](self, "_trackView:withEventName:viewID:eventTime:", v4, v8, v5, v9);

    }
    else
    {
      -[CPAnalyticsScreenManager _handleUnknownViewIfNeeded:](self, "_handleUnknownViewIfNeeded:", v10);
    }

  }
}

- (void)_updateTabTracking:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[CPAnalyticsScreenManager _isValidTabIdentifierChangedEvent:](CPAnalyticsScreenManager, "_isValidTabIdentifierChangedEvent:"))
  {
    objc_msgSend(v5, "propertyForKey:", CFSTR("tabIdentifierDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager setPendingTabIdentifierDescription:](self, "setPendingTabIdentifierDescription:", v4);

  }
}

- (void)_updateCurrentTabIdentifier:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.viewDidAppear"), "isEqualToString:", a3))
  {
    -[CPAnalyticsScreenManager pendingTabIdentifierDescription](self, "pendingTabIdentifierDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CPAnalyticsScreenManager pendingTabIdentifierDescription](self, "pendingTabIdentifierDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPAnalyticsScreenManager setCurrentTabIdentifierDescription:](self, "setCurrentTabIdentifierDescription:", v5);

      -[CPAnalyticsScreenManager setPendingTabIdentifierDescription:](self, "setPendingTabIdentifierDescription:", 0);
    }
  }
}

- (void)_handleUnknownViewIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("className"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsScreenManager namesOfViewsToIgnore](self, "namesOfViewsToIgnore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v5))
    goto LABEL_8;
  -[CPAnalyticsScreenManager namesOfViewsToTrack](self, "namesOfViewsToTrack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v5))
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v8 = objc_msgSend((id)objc_opt_class(), "isDebugScreenForViewName:", v5);

  if ((v8 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v4, "copyRawPayload");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
    -[CPAnalyticsScreenManager cpAnalyticsInstance](self, "cpAnalyticsInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:forEventName:payloadForSystemPropertyExtraction:", CFSTR("cpa_common_processName"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("cpa_common_processName"));

    CPAnalyticsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_debug_impl(&dword_20AB22000, v13, OS_LOG_TYPE_DEBUG, "Unknown view: %@. Add this view to 'appState' destination in CP Analytics config.", (uint8_t *)&v15, 0xCu);
    }

    -[CPAnalyticsScreenManager cpAnalyticsInstance](self, "cpAnalyticsInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.ScreenManager.unknownView"), v7);

    goto LABEL_7;
  }
LABEL_9:

}

- (id)screenViewNameAt:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;

  -[CPAnalyticsScreenManager priorViews](self, "priorViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v8 = CFSTR("NoScreenName");
  }
  else
  {
    -[CPAnalyticsScreenManager priorViews](self, "priorViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_initializeScreenViewTrackers:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CPAnalyticsScreenManager updateWithConfig:](self, "updateWithConfig:", v11);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CPAnalyticsScreenManager setCurrentlyOpenViews:](self, "setCurrentlyOpenViews:", v4);

  self->_priorViewsMaxIndex = 10;
  objc_msgSend(v11, "objectForKey:", CFSTR("maxPriorViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("maxPriorViews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    if (v9 >= 0x3E8)
      v9 = 1000;
    self->_priorViewsMaxIndex = v9;
  }
  -[CPAnalyticsScreenManager setScreensViewCount:](self, "setScreensViewCount:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_priorViewsMaxIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsScreenManager setPriorViews:](self, "setPriorViews:", v10);

  -[CPAnalyticsScreenManager setCurrentTabIdentifierDescription:](self, "setCurrentTabIdentifierDescription:", CFSTR("NoScreenName"));
  -[CPAnalyticsScreenManager setForegroundEventCount:](self, "setForegroundEventCount:", 0);

}

- (void)_resetSessionWithTime:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CPAnalyticsScreenManager foregroundEventCount](self, "foregroundEventCount"))
  {
    -[CPAnalyticsScreenManager currentScreenViewName](self, "currentScreenViewName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager setScreensViewCount:](self, "setScreensViewCount:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[CPAnalyticsScreenManager priorViewsMaxIndex](self, "priorViewsMaxIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPAnalyticsScreenManager setPriorViews:](self, "setPriorViews:", v5);

    if (v4)
      -[CPAnalyticsScreenManager _updateCurrentScreenToViewName:withEventTime:](self, "_updateCurrentScreenToViewName:withEventTime:", v4, v6);

  }
}

- (void)_trackView:(id)a3 withEventName:(id)a4 viewID:(id)a5 eventTime:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v10 = a4;
  v11 = a6;
  +[CPAnalyticsScreenManager combinedViewName:withID:](CPAnalyticsScreenManager, "combinedViewName:withID:", v25, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.viewDidDisappear"), "isEqualToString:", v10))
  {
    -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v15)
    {
      objc_msgSend(v16, "removeObject:", v12);
      goto LABEL_10;
    }
    v18 = objc_msgSend(v16, "count");

    if (v18 == 1)
    {
      -[CPAnalyticsScreenManager _sendCPAnalyticsScreenViewEventWithEndTime:](self, "_sendCPAnalyticsScreenViewEventWithEndTime:", v11);
      -[CPAnalyticsScreenManager setCurrentScreenStartTime:](self, "setCurrentScreenStartTime:", 0);
    }
    -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v12);

    -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPAnalyticsScreenManager viewNameFromCombined:](CPAnalyticsScreenManager, "viewNameFromCombined:", v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[CPAnalyticsScreenManager _updateCurrentScreenToViewName:withEventTime:](self, "_updateCurrentScreenToViewName:withEventTime:", v17, v11);
LABEL_10:

    }
  }
  else if (objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.viewDidAppear"), "isEqualToString:", v10))
  {
    -[CPAnalyticsScreenManager currentlyOpenViews](self, "currentlyOpenViews");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v12);

    -[CPAnalyticsScreenManager _updateCurrentScreenToViewName:withEventTime:](self, "_updateCurrentScreenToViewName:withEventTime:", v25, v11);
    -[CPAnalyticsScreenManager _updateCurrentTabIdentifier:](self, "_updateCurrentTabIdentifier:", v10);
  }

}

- (void)_updateCurrentScreenToViewName:(id)a3 withEventTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[CPAnalyticsScreenManager _sendCPAnalyticsScreenViewEventWithEndTime:](self, "_sendCPAnalyticsScreenViewEventWithEndTime:", v6);
  -[CPAnalyticsScreenManager setCurrentScreenStartTime:](self, "setCurrentScreenStartTime:", v6);

  -[CPAnalyticsScreenManager priorViews](self, "priorViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v7, 0);

  -[CPAnalyticsScreenManager priorViews](self, "priorViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = -[CPAnalyticsScreenManager priorViewsMaxIndex](self, "priorViewsMaxIndex");

  if (v10 > v11)
  {
    -[CPAnalyticsScreenManager priorViews](self, "priorViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeLastObject");

  }
  -[CPAnalyticsScreenManager setScreensViewCount:](self, "setScreensViewCount:", -[CPAnalyticsScreenManager screensViewCount](self, "screensViewCount") + 1);
}

- (void)_sendCPAnalyticsScreenViewEventWithEndTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  -[CPAnalyticsScreenManager priorViews](self, "priorViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
LABEL_7:

    goto LABEL_8;
  }
  -[CPAnalyticsScreenManager currentScreenStartTime](self, "currentScreenStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CPAnalyticsScreenManager currentScreenStartTime](self, "currentScreenStartTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceDate:", v6);
    v8 = v7;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", round(v8 * 100.0) / 100.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[CPAnalyticsScreenManager priorViewsMaxIndex](self, "priorViewsMaxIndex") + 2);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CPAnalyticsScreenManager screensViewCount](self, "screensViewCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("cpa_common_numScreensViewed"));

    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("cpa_ui_timeOnScreen"));
    -[CPAnalyticsScreenManager currentScreenViewName](self, "currentScreenViewName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("cpa_common_currentScreen"));

    -[CPAnalyticsScreenManager screenViewNameAt:](self, "screenViewNameAt:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("cpa_common_priorScreen"));

    -[CPAnalyticsScreenManager currentTabIdentifierDescription](self, "currentTabIdentifierDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("cpa_common_appSection"));

    -[CPAnalyticsScreenManager priorViews](self, "priorViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 >= 2)
    {
      v16 = 1;
      do
      {
        -[CPAnalyticsScreenManager screenViewNameAt:](self, "screenViewNameAt:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("cpa_ui_priorScreen"), v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v17, v18);

        ++v16;
        -[CPAnalyticsScreenManager priorViews](self, "priorViews");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

      }
      while (v16 < v20);
    }
    -[CPAnalyticsScreenManager cpAnalyticsInstance](self, "cpAnalyticsInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.screenView"), v9);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)registerSystemProperties:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_common_appSection"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_common_currentScreen"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_common_priorScreen"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen1"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen2"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen3"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen4"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen5"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen6"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen7"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen8"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_ui_priorScreen9"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_common_numScreensViewed"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_isTrackedScreenView"), self);

}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  CPAnalyticsScreenManager *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_common_appSection")))
  {
    -[CPAnalyticsScreenManager currentTabIdentifierDescription](self, "currentTabIdentifierDescription");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = (void *)v9;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_common_currentScreen")))
  {
    -[CPAnalyticsScreenManager currentScreenViewName](self, "currentScreenViewName");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen1")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_common_priorScreen")))
  {
    v10 = self;
    v11 = 1;
LABEL_8:
    -[CPAnalyticsScreenManager screenViewNameAt:](v10, "screenViewNameAt:", v11);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen2")))
  {
    v10 = self;
    v11 = 2;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen3")))
  {
    v10 = self;
    v11 = 3;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen4")))
  {
    v10 = self;
    v11 = 4;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen5")))
  {
    v10 = self;
    v11 = 5;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen6")))
  {
    v10 = self;
    v11 = 6;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen7")))
  {
    v10 = self;
    v11 = 7;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen8")))
  {
    v10 = self;
    v11 = 8;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_ui_priorScreen9")))
  {
    v10 = self;
    v11 = 9;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_common_numScreensViewed")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CPAnalyticsScreenManager screensViewCount](self, "screensViewCount"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("cpa_isTrackedScreenView"))
    && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("className")),
        (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = (void *)v14;
    v16 = (void *)MEMORY[0x24BDD16E0];
    -[CPAnalyticsScreenManager namesOfViewsToTrack](self, "namesOfViewsToTrack");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "containsObject:", v15));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (int64_t)screensViewCount
{
  return self->_screensViewCount;
}

- (void)setScreensViewCount:(int64_t)a3
{
  self->_screensViewCount = a3;
}

- (NSSet)namesOfViewsToTrack
{
  return self->_namesOfViewsToTrack;
}

- (void)setNamesOfViewsToTrack:(id)a3
{
  objc_storeStrong((id *)&self->_namesOfViewsToTrack, a3);
}

- (CPAnalytics)cpAnalyticsInstance
{
  return (CPAnalytics *)objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
}

- (void)setCpAnalyticsInstance:(id)a3
{
  objc_storeWeak((id *)&self->_cpAnalyticsInstance, a3);
}

- (int64_t)appVisiblePeriodSignpostID
{
  return self->_appVisiblePeriodSignpostID;
}

- (void)setAppVisiblePeriodSignpostID:(int64_t)a3
{
  self->_appVisiblePeriodSignpostID = a3;
}

- (NSDate)currentScreenStartTime
{
  return self->_currentScreenStartTime;
}

- (void)setCurrentScreenStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentScreenStartTime, a3);
}

- (int64_t)foregroundEventCount
{
  return self->_foregroundEventCount;
}

- (void)setForegroundEventCount:(int64_t)a3
{
  self->_foregroundEventCount = a3;
}

- (NSSet)namesOfViewsToIgnore
{
  return self->_namesOfViewsToIgnore;
}

- (void)setNamesOfViewsToIgnore:(id)a3
{
  objc_storeStrong((id *)&self->_namesOfViewsToIgnore, a3);
}

- (NSMutableArray)currentlyOpenViews
{
  return self->_currentlyOpenViews;
}

- (void)setCurrentlyOpenViews:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyOpenViews, a3);
}

- (NSMutableArray)priorViews
{
  return self->_priorViews;
}

- (void)setPriorViews:(id)a3
{
  objc_storeStrong((id *)&self->_priorViews, a3);
}

- (NSString)currentTabIdentifierDescription
{
  return self->_currentTabIdentifierDescription;
}

- (void)setCurrentTabIdentifierDescription:(id)a3
{
  objc_storeStrong((id *)&self->_currentTabIdentifierDescription, a3);
}

- (NSString)pendingTabIdentifierDescription
{
  return self->_pendingTabIdentifierDescription;
}

- (void)setPendingTabIdentifierDescription:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTabIdentifierDescription, a3);
}

- (unint64_t)priorViewsMaxIndex
{
  return self->_priorViewsMaxIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTabIdentifierDescription, 0);
  objc_storeStrong((id *)&self->_currentTabIdentifierDescription, 0);
  objc_storeStrong((id *)&self->_priorViews, 0);
  objc_storeStrong((id *)&self->_currentlyOpenViews, 0);
  objc_storeStrong((id *)&self->_namesOfViewsToIgnore, 0);
  objc_storeStrong((id *)&self->_currentScreenStartTime, 0);
  objc_destroyWeak((id *)&self->_cpAnalyticsInstance);
  objc_storeStrong((id *)&self->_namesOfViewsToTrack, 0);
}

+ (BOOL)isDebugScreenForViewName:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = 1;
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("debug"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("PXSettings"));

  return v4;
}

+ (BOOL)isValidScreenViewEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v11;
  int v12;
  NSObject *v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.viewDidAppear"), "isEqualToString:", v4))
  {

    goto LABEL_4;
  }
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.viewDidDisappear"), "isEqualToString:", v5);

  if (v6)
  {
LABEL_4:
    objc_msgSend(v3, "propertyForKey:", CFSTR("className"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "propertyForKey:", CFSTR("viewID"));
      v8 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LOBYTE(v6) = 1;
LABEL_13:

        goto LABEL_14;
      }
      CPAnalyticsLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v8;
        v14 = 2112;
        v15 = v11;
        _os_log_debug_impl(&dword_20AB22000, v9, OS_LOG_TYPE_DEBUG, "View ID '%@' is not a number for event %@.", (uint8_t *)&v12, 0x16u);

      }
    }
    else
    {
      CPAnalyticsLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:
        LOBYTE(v6) = 0;
        goto LABEL_13;
      }
      objc_msgSend(v3, "name");
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v9;
      _os_log_debug_impl(&dword_20AB22000, v8, OS_LOG_TYPE_DEBUG, "Class name '%@' is not a string for event %@.", (uint8_t *)&v12, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_14:

  return v6;
}

+ (id)combinedViewName:(id)a3 withID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), a3, CFSTR("//"), a4);
}

+ (id)viewNameFromCombined:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("//"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_isValidTabIdentifierChangedEvent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.photos.CPAnalytics.tabIdentifierChanged"), "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(v3, "propertyForKey:", CFSTR("tabIdentifierDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      CPAnalyticsLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v3, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v6;
        v13 = 2112;
        v14 = v10;
        _os_log_debug_impl(&dword_20AB22000, v8, OS_LOG_TYPE_DEBUG, "Tab identifier description '%@' is not a string for event %@.", (uint8_t *)&v11, 0x16u);

      }
    }

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
