@implementation ATXSuggestedPagesStackHeuristicsDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  switch(a3)
  {
    case 4:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForSleepMode](self, "_widgetsForSleepMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForDrivingMode](self, "_widgetsForDrivingMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForExerciseMode](self, "_widgetsForExerciseMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForWorkMode](self, "_widgetsForWorkMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 8:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForPersonalMode](self, "_widgetsForPersonalMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 9:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForReadingMode](self, "_widgetsForReadingMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 10:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForGamingMode](self, "_widgetsForGamingMode");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 11:
      -[ATXSuggestedPagesStackHeuristicsDataSource _widgetsForMindfulnessMode](self, "_widgetsForMindfulnessMode");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_widgetsForExerciseMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) == 0)
  {
    createHeuristicWidget(1, CFSTR("com.apple.Fitness"), CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness"), 0, 0.8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

    createHeuristicWidget(0, CFSTR("com.apple.Fitness"), CFSTR("com.apple.Fitness.FitnessWidget"), CFSTR("com.apple.Fitness"), 0, 0.8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  createHeuristicWidget(1, CFSTR("Music.RecentlyPlayedWidget"), CFSTR("com.apple.Music.MusicWidgets"), CFSTR("com.apple.Music"), 1, 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  createHeuristicWidget(0, CFSTR("Music.RecentlyPlayedWidget"), CFSTR("com.apple.Music.MusicWidgets"), CFSTR("com.apple.Music"), 1, 0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  createHeuristicWidget(1, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 1, 0.2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  createHeuristicWidget(0, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 1, 0.2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v9);

  return v2;
}

- (id)_widgetsForReadingMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  createHeuristicWidget(2, CFSTR("BooksWidget"), CFSTR("com.apple.iBooks.BooksWidget"), CFSTR("com.apple.iBooks"), 1, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  createHeuristicWidget(1, CFSTR("BooksWidget"), CFSTR("com.apple.iBooks.BooksWidget"), CFSTR("com.apple.iBooks"), 1, 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  createHeuristicWidget(0, CFSTR("BooksWidget"), CFSTR("com.apple.iBooks.BooksWidget"), CFSTR("com.apple.iBooks"), 1, 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  createHeuristicWidget(1, CFSTR("today"), CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), 0, 0.4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  createHeuristicWidget(0, CFSTR("today"), CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), 0, 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_widgetsForWorkMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"), 1, 0.8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  createHeuristicWidget(1, CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"), 1, 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  createHeuristicWidget(0, CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"), 1, 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    ATXSpecialWidgetKindFiles();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    createHeuristicWidget(2, v6, CFSTR("Files"), CFSTR("com.apple.DocumentsApp"), 1, 0.3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  ATXSpecialWidgetKindFiles();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  createHeuristicWidget(1, v8, CFSTR("Files"), CFSTR("com.apple.DocumentsApp"), 1, 0.3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v9);

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(0, CFSTR("com.apple.CalendarWidget.CalendarMonthWidget"), CFSTR("com.apple.mobilecal.CalendarWidgetExtension"), CFSTR("com.apple.mobilecal"), 0, 0.2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v10);

    createHeuristicWidget(0, CFSTR("com.apple.mobiletimer.datetime"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"), 0, 0.15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

  }
  return v2;
}

- (id)_widgetsForPersonalMode
{
  void *v3;
  void *v4;
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
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t v25[16];

  v3 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("today"), CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), 0, 0.75);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  createHeuristicWidget(1, CFSTR("today"), CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), 0, 0.75);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  createHeuristicWidget(0, CFSTR("today"), CFSTR("com.apple.news.widget"), CFSTR("com.apple.news"), 0, 0.75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("Music.RecentlyPlayedWidget"), CFSTR("com.apple.Music.MusicWidgets"), CFSTR("com.apple.Music"), 1, 0.6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  createHeuristicWidget(1, CFSTR("Music.RecentlyPlayedWidget"), CFSTR("com.apple.Music.MusicWidgets"), CFSTR("com.apple.Music"), 1, 0.6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  createHeuristicWidget(0, CFSTR("Music.RecentlyPlayedWidget"), CFSTR("com.apple.Music.MusicWidgets"), CFSTR("com.apple.Music"), 1, 0.6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  if (-[ATXSuggestedPagesStackHeuristicsDataSource _hasTVInterest](self, "_hasTVInterest"))
  {
    if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
    {
      createHeuristicWidget(2, CFSTR("com.apple.tv"), CFSTR("com.apple.tv.TVWidgetExtension"), CFSTR("com.apple.tv"), 1, 0.8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
    createHeuristicWidget(1, CFSTR("com.apple.tv"), CFSTR("com.apple.tv.TVWidgetExtension"), CFSTR("com.apple.tv"), 1, 0.8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    createHeuristicWidget(0, CFSTR("com.apple.tv"), CFSTR("com.apple.tv.TVWidgetExtension"), CFSTR("com.apple.tv"), 1, 0.8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  createHeuristicWidget(1, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v14);

  createHeuristicWidget(0, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  createHeuristicWidget(1, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  createHeuristicWidget(0, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)objc_opt_new();
  v20 = objc_msgSend(v19, "hasiCloudFamily");

  if (v20)
  {
    __atxlog_handle_modes();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "The user has iCloud Family, considering Contacts widget", v25, 2u);
    }

    createHeuristicWidget(1, CFSTR("MultipleContactWidget_iOS"), CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"), CFSTR("com.apple.PeopleViewService"), 0, 0.78);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

    createHeuristicWidget(0, CFSTR("SingleContactWidget_iOS"), CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"), CFSTR("com.apple.PeopleViewService"), 0, 0.78);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  return v3;
}

- (id)_widgetsForDrivingMode
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  createHeuristicWidget(2, CFSTR("com.apple.Maps"), CFSTR("com.apple.Maps.GeneralMapsWidget"), CFSTR("com.apple.Maps"), 1, 0.8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_widgetsForGamingMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("ContinuePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  createHeuristicWidget(1, CFSTR("ContinuePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  createHeuristicWidget(0, CFSTR("ContinuePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("FriendsArePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  createHeuristicWidget(1, CFSTR("FriendsArePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  createHeuristicWidget(0, CFSTR("FriendsArePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"), CFSTR("com.apple.gamecenter.widgets"), 0, 0.6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  return v2;
}

- (id)_widgetsForSleepMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isiPad") & 1) == 0)
  {
    createHeuristicWidget(0, CFSTR("com.apple.health.SleepWidget"), CFSTR("com.apple.Health.Sleep.SleepWidgetExtension"), CFSTR("com.apple.Health.Sleep"), 0, 0.8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  createHeuristicWidget(1, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  createHeuristicWidget(0, CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow"), 1, 0.7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  if (-[ATXSuggestedPagesStackHeuristicsDataSource _hasAlarmActivity](self, "_hasAlarmActivity"))
  {
    createHeuristicWidget(0, CFSTR("com.apple.mobiletimer.alarm"), CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"), 0, 0.6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  createHeuristicWidget(0, CFSTR("BatteriesAvocadoWidget"), CFSTR("com.apple.Batteries.BatteriesAvocadoWidgetExtension"), CFSTR("com.apple.Batteries"), 0, 0.3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  return v3;
}

- (id)_widgetsForMindfulnessMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    createHeuristicWidget(2, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  createHeuristicWidget(1, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  createHeuristicWidget(0, CFSTR("com.apple.weather"), CFSTR("com.apple.weather.widget"), CFSTR("com.apple.weather"), 0, 0.6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  return v2;
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

- (BOOL)_hasSignificantHomeAccessoryEvents
{
  void *v2;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HomeKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AccessoryControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "atx_publisherFromStartDate:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_103;
  v11[3] = &unk_1E82DBE68;
  v11[4] = &v12;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_231, v11);

  v9 = v13[3];
  LOBYTE(v9) = v9 > (int)objc_msgSend(v6, "stackHeuristicsSignificantHomeAccessoryEventCount");

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
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
      __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(v2, v4);

  }
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_103(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (BOOL)_hasAlarmActivity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "App");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "atx_publisherFromStartDate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithIsIncluded:", &__block_literal_global_106);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke_3;
  v9[3] = &unk_1E82EAA00;
  v9[4] = &v10;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:shouldContinue:", &__block_literal_global_108, v9);

  LOBYTE(v5) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

uint64_t __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke_3(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Could not fetch Home accessory events: %@", (uint8_t *)&v4, 0xCu);

}

@end
