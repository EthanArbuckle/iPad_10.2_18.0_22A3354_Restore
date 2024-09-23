@implementation AFSUPFunctionProvider

- (AFSUPFunctionProvider)init
{
  void *v3;
  AFSUPFunctionProvider *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AFSUPFunctionProvider initWithLocale:](self, "initWithLocale:", v3);

  return v4;
}

- (AFSUPFunctionProvider)initWithLocale:(id)a3
{
  id v4;
  AFSUPFunctionProvider *v5;
  NSDateFormatter *v6;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v8;
  NSDateFormatter *timeFormatter;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSUPFunctionProvider;
  v5 = -[AFSpeakableUtteranceParser initWithLocale:](&v11, sel_initWithLocale_, v4);
  if (v5)
  {
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v6;

    -[NSDateFormatter setLocale:](v5->_dateFormatter, "setLocale:", v4);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    timeFormatter = v5->_timeFormatter;
    v5->_timeFormatter = v8;

    -[NSDateFormatter setLocale:](v5->_timeFormatter, "setLocale:", v4);
  }

  return v5;
}

- (id)_dateFormattedWithFormatter:(id)a3 arguments:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v14);

LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocale:", v12);
    goto LABEL_8;
  }
  v8 = v7;
  objc_msgSend(v6, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "setTimeZone:", v10);

  if (v8 < 2)
    goto LABEL_7;
  v11 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(v6, "objectAtIndex:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendarWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  objc_msgSend(v5, "setCalendar:", v13);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_currentTime:(id)a3
{
  NSDateFormatter *timeFormatter;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  timeFormatter = self->_timeFormatter;
  v5 = a3;
  -[NSDateFormatter setDateStyle:](timeFormatter, "setDateStyle:", 0);
  -[NSDateFormatter setTimeStyle:](self->_timeFormatter, "setTimeStyle:", 1);
  v6 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", CFSTR("jjmma"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("Hk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v9);

  v11 = (void *)MEMORY[0x1E0CB3578];
  -[NSDateFormatter locale](self->_timeFormatter, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFormatFromTemplate:options:locale:", CFSTR("hhmma"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3578];
  -[NSDateFormatter locale](self->_timeFormatter, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFormatFromTemplate:options:locale:", CFSTR("HHmm"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = v13;
  else
    v17 = v16;
  -[NSDateFormatter setDateFormat:](self->_timeFormatter, "setDateFormat:", v17);
  -[AFSUPFunctionProvider _dateFormattedWithFormatter:arguments:](self, "_dateFormattedWithFormatter:arguments:", self->_timeFormatter, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_currentLongDate:(id)a3
{
  NSDateFormatter *dateFormatter;
  id v5;
  void *v6;

  dateFormatter = self->_dateFormatter;
  v5 = a3;
  -[NSDateFormatter setDateStyle:](dateFormatter, "setDateStyle:", 3);
  -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
  -[AFSUPFunctionProvider _dateFormattedWithFormatter:arguments:](self, "_dateFormattedWithFormatter:arguments:", self->_dateFormatter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_currentShortDate:(id)a3
{
  NSDateFormatter *dateFormatter;
  id v5;
  void *v6;

  dateFormatter = self->_dateFormatter;
  v5 = a3;
  -[NSDateFormatter setDateStyle:](dateFormatter, "setDateStyle:", 1);
  -[NSDateFormatter setTimeStyle:](self->_dateFormatter, "setTimeStyle:", 0);
  -[AFSUPFunctionProvider _dateFormattedWithFormatter:arguments:](self, "_dateFormattedWithFormatter:arguments:", self->_dateFormatter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_currentWeekday:(id)a3
{
  NSDateFormatter *dateFormatter;
  id v5;
  void *v6;

  dateFormatter = self->_dateFormatter;
  v5 = a3;
  -[NSDateFormatter setDateFormat:](dateFormatter, "setDateFormat:", CFSTR("eeee"));
  -[AFSUPFunctionProvider _dateFormattedWithFormatter:arguments:](self, "_dateFormattedWithFormatter:arguments:", self->_dateFormatter, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_tempInWeatherUnits:(id)a3
{
  id v3;
  int AppBooleanValue;
  id v5;
  void *v6;
  void *v7;
  float v8;
  char **__ptr32 *v9;
  float v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CFPreferencesAppSynchronize(CFSTR("com.apple.weather"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("Celsius"), CFSTR("com.apple.weather"), 0);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = v5;
    if (!AppBooleanValue)
    {
      objc_msgSend(v5, "floatValue");
      v9 = &off_19B0EC000;
      v10 = v8 * 1.8;
      LODWORD(v9) = llroundf(v10 + 32.0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[AFSUPFunctionProvider _tempInWeatherUnits:]";
      _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s No argument for weather units.", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_lowercaseString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("en-US");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v9);
    objc_msgSend(v4, "lowercaseStringWithLocale:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[AFSUPFunctionProvider _lowercaseString:]";
      _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s No argument for initLowercase", (uint8_t *)&v14, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_deviceModel
{
  return (id)MGCopyAnswer();
}

- (id)_meCard
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  AFSettingsConnection *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11678;
  v25 = __Block_byref_object_dispose__11679;
  v26 = objc_alloc_init(AFSettingsConnection);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11678;
  v19 = __Block_byref_object_dispose__11679;
  v20 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (void *)v22[5];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__AFSUPFunctionProvider__meCard__block_invoke;
  v11[3] = &unk_1E3A2FB78;
  v13 = &v15;
  v4 = v2;
  v12 = v4;
  v14 = &v21;
  objc_msgSend(v3, "getMeCard:", v11);
  v5 = dispatch_time(0, 2000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  v7 = AFSiriLogContextConnection;
  if (v6 && os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[AFSUPFunctionProvider _meCard]";
    v29 = 2048;
    v30 = 0x4000000000000000;
    _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Timed out fetching meCard  after waiting %0.1g seconds", buf, 0x16u);
    v7 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v16[5])
      v8 = CFSTR("a meCard");
    else
      v8 = CFSTR("(null)");
    *(_DWORD *)buf = 136315394;
    v28 = "-[AFSUPFunctionProvider _meCard]";
    v29 = 2112;
    v30 = (uint64_t)v8;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s Got %@", buf, 0x16u);
  }
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)_userFullName:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_userFirstName:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_userMiddleName:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "middleName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_userLastName:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_userNickName:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nickName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_meCardIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[AFSUPFunctionProvider _meCard](self, "_meCard", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_siriUsageDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AFLocalizedValueForInfoPlistKey(v4, CFSTR("NSSiriUsageDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[AFSUPFunctionProvider _siriUsageDescription:]";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s ERROR: No argument for siriUsageDescription", (uint8_t *)&v8, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_speechRecognitionUsageDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AFLocalizedValueForInfoPlistKey(v4, CFSTR("NSSpeechRecognitionUsageDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[AFSUPFunctionProvider _speechRecognitionUsageDescription:]";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s No argument for speechRecognitionUsageDescription", (uint8_t *)&v8, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_contextRoomName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSUPFunctionProvider _peerInfoForContextIdentifier:](self, "_peerInfoForContextIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "roomName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[AFSUPFunctionProvider _contextRoomName:]";
      v13 = 2112;
      v14 = v7;
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Computed value: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[AFSUPFunctionProvider _contextRoomName:]";
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Missing argument for contextRoomName", (uint8_t *)&v11, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_contextDeviceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSUPFunctionProvider _peerInfoForContextIdentifier:](self, "_peerInfoForContextIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[AFSUPFunctionProvider _contextDeviceName:]";
      v13 = 2112;
      v14 = v7;
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s Computed value: %@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[AFSUPFunctionProvider _contextDeviceName:]";
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Missing argument for contextDeviceName", (uint8_t *)&v11, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)_peerInfoForContextIdentifier:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  AFSettingsConnection *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11678;
  v26 = __Block_byref_object_dispose__11679;
  v27 = objc_alloc_init(AFSettingsConnection);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11678;
  v20 = __Block_byref_object_dispose__11679;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)v23[5];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__AFSUPFunctionProvider__peerInfoForContextIdentifier___block_invoke;
  v12[3] = &unk_1E3A2FBA0;
  v14 = &v16;
  v7 = v5;
  v13 = v7;
  v15 = &v22;
  objc_msgSend(v6, "getOriginDeviceInfoForContextIdentifier:completion:", v4, v12);
  v8 = dispatch_time(0, 250000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[AFSUPFunctionProvider _peerInfoForContextIdentifier:]";
      v30 = 2048;
      v31 = 0x406F400000000000;
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s Timed out fetching peerInfo after waiting %0.1g milliseconds", buf, 0x16u);
    }
  }
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (id)_callFunction:(id)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("currentTime")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("currentTimeIn")))
  {
    -[AFSUPFunctionProvider _currentTime:](self, "_currentTime:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v9 = (void *)v8;
    goto LABEL_5;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("currentDateShort")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("currentDateShortIn")))
  {
    -[AFSUPFunctionProvider _currentShortDate:](self, "_currentShortDate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("currentDateLong")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("currentDateLongIn")))
  {
    -[AFSUPFunctionProvider _currentLongDate:](self, "_currentLongDate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("currentDayOfWeek")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("currentDayOfWeekIn")))
  {
    -[AFSUPFunctionProvider _currentWeekday:](self, "_currentWeekday:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("tempInWeatherUnits")))
  {
    -[AFSUPFunctionProvider _tempInWeatherUnits:](self, "_tempInWeatherUnits:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("deviceModel")))
  {
    -[AFSUPFunctionProvider _deviceModel](self, "_deviceModel");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("lowercase")))
  {
    -[AFSUPFunctionProvider _lowercaseString:](self, "_lowercaseString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("siriUsageDescription")))
  {
    -[AFSUPFunctionProvider _siriUsageDescription:](self, "_siriUsageDescription:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("speechRecognitionUsageDescription")))
  {
    -[AFSUPFunctionProvider _speechRecognitionUsageDescription:](self, "_speechRecognitionUsageDescription:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("contextRoomName")))
  {
    -[AFSUPFunctionProvider _contextRoomName:](self, "_contextRoomName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("contextDeviceName")))
  {
    -[AFSUPFunctionProvider _contextDeviceName:](self, "_contextDeviceName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("fullName")))
  {
    -[AFSUPFunctionProvider _userFullName:](self, "_userFullName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("firstName")))
  {
    -[AFSUPFunctionProvider _userFirstName:](self, "_userFirstName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("middleName")))
  {
    -[AFSUPFunctionProvider _userMiddleName:](self, "_userMiddleName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("lastName")))
  {
    -[AFSUPFunctionProvider _userLastName:](self, "_userLastName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("nickName")))
  {
    -[AFSUPFunctionProvider _userNickName:](self, "_userNickName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("internalGUID")))
  {
    -[AFSUPFunctionProvider _meCardIdentifier:](self, "_meCardIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v12 = 136315394;
    v13 = "-[AFSUPFunctionProvider _callFunction:withArguments:]";
    v14 = 2112;
    v15 = v6;
    _os_log_error_impl(&dword_19AF50000, v11, OS_LOG_TYPE_ERROR, "%s Unhandled functor %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = 0;
LABEL_5:

  return v9;
}

- (id)stringForExpression:(id)a3
{
  return -[AFSUPFunctionProvider stringForExpression:containsPrivacySensitiveContents:](self, "stringForExpression:containsPrivacySensitiveContents:", a3, 0);
}

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v14;
  char v15;
  int v16;
  unsigned int v17;
  int64_t v18;
  UniChar *v19;
  uint64_t v20;
  UniChar v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  int64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  __CFString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  UniChar buffer[8];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CFStringRef theString;
  UniChar *v51;
  const char *v52;
  uint64_t v53;
  int64_t v54;
  int64_t v55;
  int64_t v56;
  _BYTE v57[128];
  uint64_t v58;
  CFRange v59;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = v6;
  if (a4)
    *a4 = 0;
  v8 = -[__CFString length](v6, "length");
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (v8)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    *(_OWORD *)buffer = 0u;
    v43 = 0u;
    theString = v7;
    v53 = 0;
    v54 = v8;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    v51 = (UniChar *)CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    v37 = v7;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v55 = 0;
    v56 = 0;
    v17 = 1;
    v52 = CStringPtr;
    while (1)
    {
      v18 = v54;
      if (v54 <= v14)
      {
        v22 = 0;
        v21 = 0;
        goto LABEL_17;
      }
      v19 = v51;
      if (v51)
      {
        v20 = v53 + v14;
      }
      else
      {
        if (v52)
        {
          v21 = v52[v53 + v14];
          goto LABEL_14;
        }
        v25 = v55;
        v26 = v56 > v14 && v55 <= v14;
        if (!v26)
        {
          if (v17 - 1 >= 4)
            v27 = v14 - 4;
          else
            v27 = 0;
          if (v27 + 64 < v54)
            v18 = v27 + 64;
          v55 = v27;
          v56 = v18;
          v59.location = v53 + v27;
          v59.length = v18 - v27;
          CFStringGetCharacters(theString, v59, buffer);
          v25 = v55;
        }
        v20 = v14 - v25;
        v19 = buffer;
      }
      v21 = v19[v20];
LABEL_14:
      v22 = v21;
      if (v21 == 125)
      {
        --v16;
        v22 = 125;
        goto LABEL_23;
      }
      if (v21 == 123)
      {
        ++v16;
        v22 = 123;
LABEL_23:
        if ((v15 & 1) != 0)
          v24 = v11;
        else
          v24 = v9;
        objc_msgSend(v24, "appendFormat:", CFSTR("%C"), v22);
        goto LABEL_27;
      }
LABEL_17:
      if (v16)
        goto LABEL_23;
      if (v21 == 35)
      {
        v15 = 1;
      }
      else
      {
        if (v21 != 58)
          goto LABEL_23;
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v10, "addObject:", v11);
          v23 = objc_alloc_init(MEMORY[0x1E0CB37A0]);

          v16 = 0;
          v11 = v23;
        }
        else
        {
          v16 = 0;
        }
      }
LABEL_27:
      v14 = v17;
      v26 = v8 > v17++;
      if (!v26)
      {
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v10, "addObject:", v11);
        v7 = v37;
        break;
      }
    }
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v29 = v10;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(v29);
        -[AFSpeakableUtteranceParser parseStringWithFormat:error:](self, "parseStringWithFormat:error:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend(v28, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
    }
    while (v31);
  }

  -[AFSUPFunctionProvider _callFunction:withArguments:](self, "_callFunction:withArguments:", v9, v28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

void __55__AFSUPFunctionProvider__peerInfoForContextIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __32__AFSUPFunctionProvider__meCard__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[AFSUPFunctionProvider _meCard]_block_invoke";
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Error fetching meCard %@", (uint8_t *)&v13, 0x16u);
    }
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

+ (BOOL)_shouldAutomaticallyProvideFunctions
{
  return 0;
}

@end
