@implementation ATXModeFaceComplicationHeuristicDataSource

- (ATXModeFaceComplicationHeuristicDataSource)init
{
  ATXModeFaceComplicationHeuristicDataSource *v2;
  void *v3;
  uint64_t v4;
  NSSet *allComplicationDescriptors;
  void *v6;
  uint64_t v7;
  NSSet *allWidgetDescriptors;
  uint64_t v9;
  ATXSuggestedPagesTunableConstants *suggestedPagesTunableConstants;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXModeFaceComplicationHeuristicDataSource;
  v2 = -[ATXModeFaceComplicationHeuristicDataSource init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "complicationWidgetDescriptors");
    v4 = objc_claimAutoreleasedReturnValue();
    allComplicationDescriptors = v2->_allComplicationDescriptors;
    v2->_allComplicationDescriptors = (NSSet *)v4;

    objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeScreenDescriptors");
    v7 = objc_claimAutoreleasedReturnValue();
    allWidgetDescriptors = v2->_allWidgetDescriptors;
    v2->_allWidgetDescriptors = (NSSet *)v7;

    v9 = objc_opt_new();
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v9;

    if (!-[NSSet count](v2->_allComplicationDescriptors, "count"))
    {
      __atxlog_handle_lock_screen();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[ATXModeFaceComplicationHeuristicDataSource init].cold.1(v11);

    }
  }
  return v2;
}

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      break;
    case 3:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForSleepMode](self, "_complicationsForSleepMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForDrivingMode](self, "_complicationsForDrivingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForExerciseMode](self, "_complicationsForExerciseMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForWorkMode](self, "_complicationsForWorkMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForPersonalMode](self, "_complicationsForPersonalMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 8:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForReadingMode](self, "_complicationsForReadingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForGamingMode](self, "_complicationsForGamingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 10:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForMindfulnessMode](self, "_complicationsForMindfulnessMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 11:
      -[ATXModeFaceComplicationHeuristicDataSource _complicationsForReduceInterruptions](self, "_complicationsForReduceInterruptions");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v7 = (void *)v8;
      break;
    default:
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXModeFaceComplicationHeuristicDataSource provideComplicationsForSuggestedFaceType:environment:].cold.1();

      v7 = 0;
      break;
  }

  return v7;
}

- (id)_complicationsForSleepMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_complicationsForDrivingMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_complicationsForExerciseMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness.Complication"), CFSTR("com.apple.Fitness"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness.Complication"), CFSTR("com.apple.Fitness"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 12, CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness.Complication"), CFSTR("com.apple.Fitness"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"), CFSTR("com.apple.weather"), v3, 0.6);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.temperature"), CFSTR("com.apple.weather"), v3, 0.6);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  return v3;
}

- (id)_complicationsForWorkMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 12, CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.CalendarWidget.CalendarNextEventComplication"), CFSTR("com.apple.mobilecal"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.CalendarWidget.CalendarNextEventComplication"), CFSTR("com.apple.mobilecal"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.CalendarWidget.CalendarNextEventComplication"), CFSTR("com.apple.mobilecal"), v3, 0.8);
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantRemindersEvents](self, "_hasSignificantRemindersEvents"))
  {
    -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 12, CFSTR("com.apple.reminders.WidgetExtension"), CFSTR("com.apple.reminders.widget.today"), CFSTR("com.apple.reminders"), v3, 0.8);
    -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.reminders.WidgetExtension"), CFSTR("com.apple.reminders.widget"), CFSTR("com.apple.reminders"), v3, 0.8);
  }
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantStocksEvents](self, "_hasSignificantStocksEvents"))
    -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.stocks.widget"), CFSTR("overview"), CFSTR("com.apple.stocks"), v3, 0.6);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"), CFSTR("com.apple.weather"), v3, 0.5);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.temperature"), CFSTR("com.apple.weather"), v3, 0.5);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  return v3;
}

- (id)_complicationsForPersonalMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantHomeAccessoryEvents](self, "_hasSignificantHomeAccessoryEvents"))
  {
    -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.summary.category"), CFSTR("com.apple.Home"), v3, 0.8);
  }
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 12, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"), CFSTR("com.apple.weather"), v3, 0.4);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"), CFSTR("com.apple.weather"), v3, 0.4);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 10, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.temperature"), CFSTR("com.apple.weather"), v3, 0.4);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.news.widget"), CFSTR("today"), CFSTR("com.apple.news"), v3, 0.6);
  return v3;
}

- (id)_complicationsForReadingMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_complicationsForGamingMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_complicationsForMindfulnessMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_complicationsForReduceInterruptions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_addComplicationWithFamily:(int64_t)a3 extension:(id)a4 kind:(id)a5 container:(id)a6 score:(double)a7 to:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSSet *allComplicationDescriptors;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD *, void *);
  void *v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  allComplicationDescriptors = self->_allComplicationDescriptors;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __107__ATXModeFaceComplicationHeuristicDataSource__addComplicationWithFamily_extension_kind_container_score_to___block_invoke;
  v29 = &unk_1E82EAEA8;
  v19 = v14;
  v30 = v19;
  v20 = v15;
  v31 = v20;
  v33 = a3;
  v21 = v16;
  v32 = v21;
  -[NSSet objectsPassingTest:](allComplicationDescriptors, "objectsPassingTest:", &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count", v26, v27, v28, v29))
  {
    v23 = objc_alloc(MEMORY[0x1E0CF8D38]);
    objc_msgSend(v22, "anyObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithWidgetDescriptor:widgetFamily:intent:source:", v24, a3, 0, 4);

    -[NSObject setScore:](v25, "setScore:", a7);
    -[NSObject setPredictionSource:](v25, "setPredictionSource:", CFSTR("Heuristic"));
    objc_msgSend(v17, "addObject:", v25);
  }
  else if (objc_msgSend(v21, "length")
         && objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledAndNotRestrictedForBundle:", v21))
  {
    __atxlog_handle_lock_screen();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:].cold.2();
  }
  else
  {
    __atxlog_handle_lock_screen();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:].cold.1();
  }

}

uint64_t __107__ATXModeFaceComplicationHeuristicDataSource__addComplicationWithFamily_extension_kind_container_score_to___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  if (v5
    && (objc_msgSend(v3, "kind"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", a1[5]),
        v6,
        v7)
    && (objc_msgSend(v3, "supportedFamilies"), CHSWidgetFamilyMaskContainsFamily()))
  {
    objc_msgSend(v3, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)a1[6])
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v3, "extensionIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", a1[6]);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      break;
    case 3:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForSleepMode](self, "_landscapeComplicationsForSleepMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForDrivingMode](self, "_landscapeComplicationsForDrivingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 5:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForExerciseMode](self, "_landscapeComplicationsForExerciseMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 6:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForWorkMode](self, "_landscapeComplicationsForWorkMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 7:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForPersonalMode](self, "_landscapeComplicationsForPersonalMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 8:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForReadingMode](self, "_landscapeComplicationsForReadingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 9:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForGamingMode](self, "_landscapeComplicationsForGamingMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 10:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForMindfulnessMode](self, "_landscapeComplicationsForMindfulnessMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 11:
      -[ATXModeFaceComplicationHeuristicDataSource _landscapeComplicationsForReduceInterruptions](self, "_landscapeComplicationsForReduceInterruptions");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v7 = (void *)v8;
      break;
    default:
      __atxlog_handle_lock_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXModeFaceComplicationHeuristicDataSource provideComplicationsForSuggestedFaceType:environment:].cold.1();

      v7 = 0;
      break;
  }

  return v7;
}

- (id)_landscapeComplicationsForSleepMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_landscapeComplicationsForDrivingMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_landscapeComplicationsForExerciseMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness"), CFSTR("com.apple.Fitness"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), CFSTR("com.apple.weather"), v3, 0.8);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  return v3;
}

- (id)_landscapeComplicationsForWorkMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget"), CFSTR("com.apple.mobilecal"), v3, 0.8);
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantRemindersEvents](self, "_hasSignificantRemindersEvents"))
  {
    -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.reminders.WidgetExtension"), CFSTR("com.apple.reminders.widget"), CFSTR("com.apple.reminders"), v3, 0.8);
  }
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantStocksEvents](self, "_hasSignificantStocksEvents"))
    -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.stocks.widget"), CFSTR("overview"), CFSTR("com.apple.stocks"), v3, 0.6);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather.complication.conditions"), CFSTR("com.apple.weather"), v3, 0.5);
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Batteries.BatteriesWidget"), CFSTR("com.apple.Batteries.complication"), CFSTR("com.apple.Batteries"), v3, 0.4);
  return v3;
}

- (id)_landscapeComplicationsForPersonalMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), CFSTR("com.apple.weather"), v3, 0.8);
  if (-[ATXModeFaceComplicationHeuristicDataSource _hasSignificantHomeAccessoryEvents](self, "_hasSignificantHomeAccessoryEvents"))
  {
    -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.Home.HomeWidget"), CFSTR("com.apple.Home.widget.summary.category"), CFSTR("com.apple.Home"), v3, 0.7);
  }
  -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:](self, "_addComplicationWithFamily:extension:kind:container:score:to:", 11, CFSTR("com.apple.news.widget"), CFSTR("today"), CFSTR("com.apple.news"), v3, 0.6);
  return v3;
}

- (id)_landscapeComplicationsForReadingMode
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[ATXModeFaceComplicationHeuristicDataSource _addSystemSmallWidgetWithExtension:kind:container:score:to:](self, "_addSystemSmallWidgetWithExtension:kind:container:score:to:", CFSTR("com.apple.news.widget"), CFSTR("today"), CFSTR("com.apple.news"), v3, 0.8);
  return v3;
}

- (id)_landscapeComplicationsForGamingMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_landscapeComplicationsForMindfulnessMode
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_landscapeComplicationsForReduceInterruptions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_addSystemSmallWidgetWithExtension:(id)a3 kind:(id)a4 container:(id)a5 score:(double)a6 to:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSSet *allWidgetDescriptors;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  allWidgetDescriptors = self->_allWidgetDescriptors;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __105__ATXModeFaceComplicationHeuristicDataSource__addSystemSmallWidgetWithExtension_kind_container_score_to___block_invoke;
  v24[3] = &unk_1E82EAED0;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  -[NSSet objectsPassingTest:](allWidgetDescriptors, "objectsPassingTest:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "count"))
  {
    v21 = objc_alloc(MEMORY[0x1E0CF8D38]);
    objc_msgSend(v20, "anyObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithWidgetDescriptor:widgetFamily:intent:source:", v22, 1, 0, 4);

    -[NSObject setScore:](v23, "setScore:", a6);
    -[NSObject setPredictionSource:](v23, "setPredictionSource:", CFSTR("Heuristic"));
    objc_msgSend(v15, "addObject:", v23);
  }
  else if (objc_msgSend(v19, "length")
         && objc_msgSend(MEMORY[0x1E0CF8CE8], "isInstalledAndNotRestrictedForBundle:", v19))
  {
    __atxlog_handle_lock_screen();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:].cold.2();
  }
  else
  {
    __atxlog_handle_lock_screen();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ATXModeFaceComplicationHeuristicDataSource _addComplicationWithFamily:extension:kind:container:score:to:].cold.1();
  }

}

uint64_t __105__ATXModeFaceComplicationHeuristicDataSource__addSystemSmallWidgetWithExtension_kind_container_score_to___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

  if (v5
    && (objc_msgSend(v3, "kind"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", a1[5]),
        v6,
        v7)
    && (objc_msgSend(v3, "supportedFamilies"), CHSWidgetFamilyMaskContainsFamily()))
  {
    objc_msgSend(v3, "extensionIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)a1[6])
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v3, "extensionIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", a1[6]);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_hasTVInterest
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9170], "getUpcomingMediaForBundle:isInternalApplication:", CFSTR("com.apple.tv"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedUpcomingMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");

  objc_msgSend(MEMORY[0x1E0CF8C20], "getActionKeyForBundleId:actionType:", CFSTR("com.apple.tv"), CFSTR("INPlayMediaIntent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "histogramForLaunchType:", 17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "totalLaunchesForBundleIds:", v8);
  v10 = v9;

  return v10 + v4 > 0.0;
}

- (BOOL)_hasSignificantRemindersEvents
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXComplicationSuggestionHeuristics numberOfRemindersSinceDate:](ATXComplicationSuggestionHeuristics, "numberOfRemindersSinceDate:", v3);
  LOBYTE(self) = v4 >= -[ATXSuggestedPagesTunableConstants faceComplicationsSignificantRemindersEventCount](self->_suggestedPagesTunableConstants, "faceComplicationsSignificantRemindersEventCount");

  return (char)self;
}

- (BOOL)_hasSignificantHomeAccessoryEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "HomeKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AccessoryControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "atx_publisherFromStartDate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_81;
  v11[3] = &unk_1E82DBE68;
  v11[4] = &v12;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_238, v11);

  v9 = v13[3];
  LOBYTE(self) = v9 > -[ATXSuggestedPagesTunableConstants faceComplicationsSignificantHomeAccessoryEventCount](self->_suggestedPagesTunableConstants, "faceComplicationsSignificantHomeAccessoryEventCount");

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(v2, v4);

  }
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_81(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (BOOL)_hasSignificantStocksEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "App");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "atx_publisherFromStartDate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_84;
  v10[3] = &unk_1E82DBE68;
  v10[4] = &v11;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_83_0, v10);

  v8 = v12[3];
  LOBYTE(self) = v8 > -[ATXSuggestedPagesTunableConstants faceComplicationsSignificantStocksEventCount](self->_suggestedPagesTunableConstants, "faceComplicationsSignificantStocksEventCount");

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_lock_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_cold_1(v2, v4);

  }
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_84(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.stocks"));

  if (v5)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
  objc_storeStrong((id *)&self->_allWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_allComplicationDescriptors, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXModeFaceComplicationHeuristicDataSource: no complication descriptors found", v1, 2u);
}

- (void)provideComplicationsForSuggestedFaceType:environment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: unhandled face type: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addComplicationWithFamily:extension:kind:container:score:to:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: could not find descriptor for: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addComplicationWithFamily:extension:kind:container:score:to:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "ATXModeFaceComplicationHeuristicDataSource: could not find descriptor for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __80__ATXModeFaceComplicationHeuristicDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Could not fetch Home accessory events: %@", v5);

  OUTLINED_FUNCTION_1();
}

void __73__ATXModeFaceComplicationHeuristicDataSource__hasSignificantStocksEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Could not fetch Stocks events: %@", v5);

  OUTLINED_FUNCTION_1();
}

@end
