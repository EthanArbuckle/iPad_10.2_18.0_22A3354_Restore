@implementation EventKitTCCUIFactory

- (EventKitTCCUIFactory)initWithBundleIdentifier:(id)a3
{
  id v4;
  EventKitTCCUIFactory *v5;
  uint64_t v6;
  EKEventStore *eventStore;
  uint64_t v8;
  NSArray *allCalendars;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _TtC13EventKitTCCUI19EventPreviewWrapper *v29;
  _TtC13EventKitTCCUI19EventPreviewWrapper *previewWrapper;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)EventKitTCCUIFactory;
  v5 = -[EventKitTCCUIFactory init](&v32, sel_init);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDC74E8]), "initWithEKOptions:", 132);
  eventStore = v5->_eventStore;
  v5->_eventStore = (EKEventStore *)v6;

  if (v4)
    -[EKEventStore setSourceAccountManagement:withBundleID:](v5->_eventStore, "setSourceAccountManagement:withBundleID:", 0, v4);
  -[EKEventStore calendarsForEntityType:](v5->_eventStore, "calendarsForEntityType:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  allCalendars = v5->_allCalendars;
  v5->_allCalendars = (NSArray *)v8;

  -[EKEventStore nextEventsWithCalendars:limit:exclusionOptions:](v5->_eventStore, "nextEventsWithCalendars:limit:exclusionOptions:", 0, 1, 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    logHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[EventKitTCCUIFactory initWithBundleIdentifier:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);

    -[EKEventStore nextEventsWithCalendars:limit:exclusionOptions:](v5->_eventStore, "nextEventsWithCalendars:limit:exclusionOptions:", 0, 1, 12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      logHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[EventKitTCCUIFactory initWithBundleIdentifier:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

      v11 = 0;
    }
  }
  v29 = -[EventPreviewWrapper initWithEvent:]([_TtC13EventKitTCCUI19EventPreviewWrapper alloc], "initWithEvent:", v11);
  previewWrapper = v5->_previewWrapper;
  v5->_previewWrapper = v29;

  return v5;
}

- (id)previewViewController
{
  return -[EventPreviewWrapper getPreviewControllerForPrompt:](self->_previewWrapper, "getPreviewControllerForPrompt:", 1);
}

- (id)settingsPreviewViewController
{
  return -[EventPreviewWrapper getPreviewControllerForPrompt:](self->_previewWrapper, "getPreviewControllerForPrompt:", 0);
}

- (int)countEventsInTheNextYear
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "CalDateForBeginningOfToday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingYears:inCalendar:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[EKEventStore countOfEventsFromStartDate:toEndDate:](self->_eventStore, "countOfEventsFromStartDate:toEndDate:", v3, v5);
  return (int)self;
}

- (id)settingsViewSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("x_calendars_x_events"), &stru_250BBA130, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, -[NSArray count](self->_allCalendars, "count"), -[EventKitTCCUIFactory countEventsInTheNextYear](self, "countEventsInTheNextYear"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewTableView
{
  void *v2;
  void *v3;

  -[EventKitTCCUIFactory settingsPreviewViewController](self, "settingsPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewWrapper, 0);
  objc_storeStrong((id *)&self->_allCalendars, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A94B000, a1, a3, "Couldn't find any event in the next year to show in the preview.", a5, a6, a7, a8, 0);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A94B000, a1, a3, "Couldn't find a timed event. Looking for all-day event instead.", a5, a6, a7, a8, 0);
}

@end
