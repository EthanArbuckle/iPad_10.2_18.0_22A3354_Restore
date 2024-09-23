@implementation SGEventSuggestionBase

- (SGEventSuggestionBase)initWithRealtimeEvent:(id)a3
{
  id v5;
  SGEventSuggestionBase *v6;
  SGEventSuggestionBase *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SGEventSuggestionBase;
  v6 = -[SGEventSuggestionBase init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_realtimeEvent, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_eventKitStoreChangedNotification_, *MEMORY[0x1E0CA9F88], 0);

  }
  -[SGEventSuggestionBase preloadPrimaryActionViewController](v7, "preloadPrimaryActionViewController");

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SGEventSuggestionBase;
  -[SGEventSuggestionBase dealloc](&v4, sel_dealloc);
}

- (id)realtimeSuggestion
{
  return self->_realtimeEvent;
}

- (id)suggestionsEvent
{
  return (id)-[SGRealtimeEvent event](self->_realtimeEvent, "event");
}

- (void)eventKitStoreChangedNotification:(id)a3
{
  id v4;

  -[SGEventSuggestionBase suggestionDelegate](self, "suggestionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionWasUpdated:", self);

}

- (id)eventKitEvent
{
  EKEvent *eventKitEvent;
  void *v4;
  NSObject *v5;
  EKEvent *v6;
  NSObject *v7;
  void *v8;
  EKEvent *v9;
  EKEvent *v10;
  EKEvent *v11;
  void *v12;
  void *v13;
  int v14;
  EKEvent *v15;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  eventKitEvent = self->_eventKitEvent;
  if (!eventKitEvent || !-[EKEvent refresh](eventKitEvent, "refresh"))
  {
    objc_msgSend((id)objc_opt_class(), "_eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    switch(-[SGRealtimeEvent state](self->_realtimeEvent, "state"))
    {
      case 1u:
        -[SGRealtimeEvent event](self->_realtimeEvent, "event");
        v7 = objc_claimAutoreleasedReturnValue();
        v5 = v7;
        goto LABEL_10;
      case 2u:
        -[SGRealtimeEvent eventIdentifier](self->_realtimeEvent, "eventIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "eventWithIdentifier:", v8);
        v9 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        v10 = self->_eventKitEvent;
        self->_eventKitEvent = v9;

        v11 = self->_eventKitEvent;
        -[SGRealtimeEvent event](self->_realtimeEvent, "event");
        v7 = objc_claimAutoreleasedReturnValue();
        v5 = v7;
        if (v11)
        {
          -[NSObject mergeIntoEKEvent:withStore:](v7, "mergeIntoEKEvent:withStore:", self->_eventKitEvent, v4);
        }
        else
        {
LABEL_10:
          -[NSObject toEKEventWithStore:](v7, "toEKEventWithStore:", v4);
          v6 = (EKEvent *)objc_claimAutoreleasedReturnValue();
LABEL_11:
          v15 = self->_eventKitEvent;
          self->_eventKitEvent = v6;

        }
LABEL_12:

LABEL_13:
        break;
      case 3u:
      case 4u:
      case 5u:
        -[SGRealtimeEvent eventIdentifier](self->_realtimeEvent, "eventIdentifier");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "eventWithIdentifier:", v5);
        v6 = (EKEvent *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 6u:
        sgEventsLogHandle();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          -[SGRealtimeEvent event](self->_realtimeEvent, "event");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "loggingIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[SGRealtimeEvent state](self->_realtimeEvent, "state");
          v17 = 138543618;
          v18 = v13;
          v19 = 1026;
          v20 = v14;
          _os_log_debug_impl(&dword_1B1170000, v5, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - [SGEvent %{public}@] in unsupported state %{public}d", (uint8_t *)&v17, 0x12u);

        }
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  return self->_eventKitEvent;
}

- (id)suggestionTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  int v8;
  void *v9;

  if (_currentContext)
  {
    -[SGEventSuggestionBase suggestionsEvent](self, "suggestionsEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SGRealtimeEvent state](self->_realtimeEvent, "state") == 2)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6;
      v7 = CFSTR("SuggestionsBannerUpdatedEventTitle");
    }
    else
    {
      v8 = -[SGRealtimeEvent state](self->_realtimeEvent, "state");
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6;
      if (v8 == 3)
        v7 = CFSTR("SuggestionsBannerCanceledEventTitle");
      else
        v7 = CFSTR("SuggestionsBannerFoundEventsTitle");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E62D74E0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)suggestionSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;

  -[SGEventSuggestionBase suggestionsEvent](self, "suggestionsEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGEventSuggestionBase eventKitEvent](self, "eventKitEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    timeStringForDate(v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    dateStringForDate(v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E62D74E0;
    v7 = &stru_1E62D74E0;
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "appendString:", v8);
  if (-[__CFString length](v7, "length"))
  {
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
    objc_msgSend(v9, "appendString:", v7);
  }
  if (objc_msgSend(v9, "length"))
  {
    if (_currentContext || !objc_msgSend(v4, "length"))
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("\n"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringByAppendingString:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v4 = v11;
    }
  }
  else
  {
    v10 = v4;
    v4 = v10;
  }

  return v10;
}

- (id)primaryActionTitle
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = _currentContext;
  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[SGRealtimeEvent event](self->_realtimeEvent, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SGRealtimeEvent state](self->_realtimeEvent, "state");
    v16 = 138543618;
    v17 = v14;
    v18 = 1026;
    v19 = v15;
    _os_log_debug_impl(&dword_1B1170000, v4, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - [SGEvent %{public}@] in State %{public}d", (uint8_t *)&v16, 0x12u);

  }
  v5 = -[SGRealtimeEvent state](self->_realtimeEvent, "state");
  switch(v5)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SuggestionsListButtonAddToCalendar");
      v9 = CFSTR("SuggestionsBannerButtonAdd");
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SuggestionsNewListButtonEventUpdate");
      v9 = CFSTR("SuggestionsBannerButtonUpdate");
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SuggestionsNewListButtonEventDelete");
      v9 = CFSTR("SuggestionsBannerButtonDelete");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("SuggestionsListButtonEventShow");
      v9 = CFSTR("SuggestionsBannerButtonShow");
      break;
  }
  if (v3)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_1E62D74E0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)suggestionDismissAction
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (-[SGRealtimeEvent state](self->_realtimeEvent, "state") == 4
    || -[SGRealtimeEvent state](self->_realtimeEvent, "state") == 5)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SuggestionsListButtonIgnoreEvent"), &stru_1E62D74E0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGEventSuggestionBase_suggestionDismissAction__block_invoke;
  v7[3] = &unk_1E62D6C90;
  v7[4] = self;
  +[SGSuggestionAction actionWithTitle:handler:](SGSuggestionAction, "actionWithTitle:handler:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)suggestionActionButtonType
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 6;

  return 4 * v3;
}

- (id)suggestionCategoryId
{
  __CFString *v2;

  v2 = CFSTR("com.apple.suggestions.SGEventSuggestion");
  return CFSTR("com.apple.suggestions.SGEventSuggestion");
}

- (id)suggestionCategoryImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "calendarImage");
}

- (id)suggestionCategoryTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SuggestionsListSectionEvents"), &stru_1E62D74E0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)suggestionCategoryActionButtonType
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 6;

  return 4 * v3;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  void *v3;
  __CFString *v4;

  if (objc_msgSend(a3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMultipleSuggestionsTitleFormat"), &stru_1E62D74E0, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1E62D74E0;
  }
  return v4;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    if (v4 == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "suggestionTitle");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMixedSubtitleEvents"), &stru_1E62D74E0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = &stru_1E62D74E0;
  }

  return v7;
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.CoreSuggestionsUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SuggestionsBannerMixedSubtitleEvents"), &stru_1E62D74E0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "count");

  objc_msgSend(v3, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)suggestionComparator
{
  return _Block_copy((const void *)SGSuggestionEventTrailingComparator);
}

- (id)suggestionImage
{
  UIImage *calendarImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;

  calendarImage = self->_calendarImage;
  if (!calendarImage)
  {
    -[SGRealtimeEvent event](self->_realtimeEvent, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGRealtimeEvent event](self->_realtimeEvent, "event");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SGBannerUtility dateForUTCDate:](SGBannerUtility, "dateForUTCDate:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[SGUIIconSupport iconForCalendarDate:drawBorder:](SGUIIconSupport, "iconForCalendarDate:drawBorder:", v7, 1);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v10 = self->_calendarImage;
    self->_calendarImage = v9;

    calendarImage = self->_calendarImage;
  }
  return calendarImage;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  return (SGSuggestionDelegate *)objc_loadWeakRetained((id *)&self->_suggestionDelegate);
}

- (void)setSuggestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_storeStrong((id *)&self->_calendarImage, 0);
  objc_storeStrong((id *)&self->_eventKitEvent, 0);
  objc_storeStrong((id *)&self->_realtimeEvent, 0);
}

void __48__SGEventSuggestionBase_suggestionDismissAction__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sgEventsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loggingIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1B1170000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing suggested event (%{public}@) view controller", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "confirm:event:completion:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "suggestion:actionFinished:", *(_QWORD *)(a1 + 32), 1);

}

+ (id)calendarImage
{
  return +[SGUIIconSupport spotlightIconImageWithBundleIdentifier:drawBorder:](SGUIIconSupport, "spotlightIconImageWithBundleIdentifier:drawBorder:", *MEMORY[0x1E0D19A08], 1);
}

+ (void)confirm:(BOOL)a3 event:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id *v14;
  id *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!confirm_event_completion__service)
  {
    objc_msgSend(MEMORY[0x1E0D19970], "serviceForEvents");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)confirm_event_completion__service;
    confirm_event_completion__service = v9;

  }
  sgEventsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v12)
    {
      objc_msgSend(v7, "event");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v20;
      _os_log_debug_impl(&dword_1B1170000, v11, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - Confirming Event %{public}@", buf, 0xCu);

    }
    v13 = (void *)confirm_event_completion__service;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __50__SGEventSuggestionBase_confirm_event_completion___block_invoke;
    v26[3] = &unk_1E62D6CF8;
    v14 = &v27;
    v15 = &v28;
    v27 = v7;
    v28 = v8;
    v16 = v8;
    objc_msgSend(v13, "confirmEvent:withCompletion:", v7, v26);
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v7, "event");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loggingIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_debug_impl(&dword_1B1170000, v11, OS_LOG_TYPE_DEBUG, "SGEventSuggestionBase - Rejecting Event %{public}@", buf, 0xCu);

    }
    v17 = (void *)confirm_event_completion__service;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__SGEventSuggestionBase_confirm_event_completion___block_invoke_57;
    v23[3] = &unk_1E62D6CF8;
    v14 = &v24;
    v15 = &v25;
    v24 = v7;
    v25 = v8;
    v18 = v8;
    objc_msgSend(v17, "rejectEvent:withCompletion:", v7, v23);
  }

}

+ (id)_eventStore
{
  if (_eventStore_predicate != -1)
    dispatch_once(&_eventStore_predicate, &__block_literal_global_59);
  return (id)_eventStore_eventStore;
}

void __36__SGEventSuggestionBase__eventStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_eventStore_eventStore;
  _eventStore_eventStore = v0;

}

void __50__SGEventSuggestionBase_confirm_event_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1B1170000, v4, OS_LOG_TYPE_ERROR, "SGEventSuggestionBase: Unable to confirm event %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __50__SGEventSuggestionBase_confirm_event_completion___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1B1170000, v4, OS_LOG_TYPE_ERROR, "SGEventSuggestionBase: Unable to reject event %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

@end
