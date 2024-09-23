@implementation ATXUpdatePredictionsLogger

- (ATXUpdatePredictionsLogger)init
{
  id v3;
  void *v4;
  void *v5;
  ATXUpdatePredictionsLogger *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v5 = (void *)objc_opt_new();
  v6 = -[ATXUpdatePredictionsLogger initWithUserDefaults:petLogger:](self, "initWithUserDefaults:petLogger:", v4, v5);

  return v6;
}

- (ATXUpdatePredictionsLogger)initWithUserDefaults:(id)a3 petLogger:(id)a4
{
  id v7;
  id v8;
  ATXUpdatePredictionsLogger *v9;
  ATXUpdatePredictionsLogger *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXUpdatePredictionsLogger;
  v9 = -[ATXUpdatePredictionsLogger init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userDefaults, a3);
    objc_storeStrong((id *)&v10->_petLogger, a4);
  }

  return v10;
}

- (void)countPredictionUpdateWithReason:(unint64_t)a3 client:(unint64_t)a4
{
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  if (a3 != 22 && (v7 & 1) == 0)
  {
    pthread_mutex_lock(&lock_1);
    -[ATXUpdatePredictionsLogger _countDictionaryForClient:](self, "_countDictionaryForClient:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUpdatePredictionsLogger _incrementCountInDictionary:forTriggerType:](self, "_incrementCountInDictionary:forTriggerType:", v8, -[ATXUpdatePredictionsLogger _triggerTypeForUpdatePredictionsReason:](self, "_triggerTypeForUpdatePredictionsReason:", a3));
    -[ATXUpdatePredictionsLogger _incrementCountInDictionary:forTriggerType:](self, "_incrementCountInDictionary:forTriggerType:", v8, 7);
    -[ATXUpdatePredictionsLogger _setCountDictionary:forClient:](self, "_setCountDictionary:forClient:", v8, a4);
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[ATXUpdatePredictionsLogger _stringForATXUpdatePredictionsClient:](self, "_stringForATXUpdatePredictionsClient:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](ATXUpdatePredictionsReasons, "stringForUpdatePredictionsReason:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v8;
      _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "ATXUpdatePredictionsLogger: update for client %@ with reason %@ and countDictionary %@", (uint8_t *)&v12, 0x20u);

    }
    pthread_mutex_unlock(&lock_1);

  }
}

- (void)flushCountedPredictionUpdatesToLogger
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "ATXUpdatePredictionsLogger: resetting count dictionary and lastLogDate because finished logging", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_logPredictionUpdatesForClient:(unint64_t)a3 lastLogDate:(id)a4 now:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[ATXUpdatePredictionsLogger _countDictionaryForClient:](self, "_countDictionaryForClient:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  *(_QWORD *)&v12 = 138412802;
  v20 = v12;
  do
  {
    -[ATXUpdatePredictionsLogger _protobufForTriggerType:client:](self, "_protobufForTriggerType:client:", v11, a3, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", off_1E82E9BA8[v11]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUpdatePredictionsLogger _normalizeCountPer24HoursWithStartDate:endDate:count:](self, "_normalizeCountPer24HoursWithStartDate:endDate:count:", v8, v9, objc_msgSend(v14, "unsignedIntegerValue"));
    v16 = v15;
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[ATXUpdatePredictionsLogger _stringForATXUpdatePredictionsClient:](self, "_stringForATXUpdatePredictionsClient:", a3);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = off_1E82E9BA8[v11];
      *(_DWORD *)buf = v20;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2048;
      v26 = v16;
      _os_log_debug_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEBUG, "ATXUpdatePredictionsLogger: logging for client %@ trigger type %@ count %f", buf, 0x20u);

    }
    -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_petLogger, "trackDistributionForMessage:value:", v13, v16);

    ++v11;
  }
  while ((_DWORD)v11 != 8);

}

- (id)_countDictionaryDefaultsKeyForClient:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[ATXUpdatePredictionsLogger _stringForATXUpdatePredictionsClient:](self, "_stringForATXUpdatePredictionsClient:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), CFSTR("ATXUpdatePredictionsLoggerCountsDictionary"), v3);

  return v4;
}

- (id)_countDictionaryForClient:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ATXUpdatePredictionsLogger _countDictionaryDefaultsKeyForClient:](self, "_countDictionaryDefaultsKeyForClient:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  return v6;
}

- (void)_incrementCountInDictionary:(id)a3 forTriggerType:(int)a4
{
  uint64_t v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v9 = v5;
  if (v4 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
  }
  else
  {
    v6 = off_1E82E9BA8[(int)v4];
  }
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
  objc_msgSend(v9, "setObject:forKey:", v8, v6);

}

- (void)_setCountDictionary:(id)a3 forClient:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ATXUpdatePredictionsLogger _countDictionaryDefaultsKeyForClient:](self, "_countDictionaryDefaultsKeyForClient:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v6, v7);

}

- (void)_resetCountDictionariesForAllClients
{
  uint64_t v3;

  v3 = MEMORY[0x1E0C9AA70];
  -[ATXUpdatePredictionsLogger _setCountDictionary:forClient:](self, "_setCountDictionary:forClient:", MEMORY[0x1E0C9AA70], 0);
  -[ATXUpdatePredictionsLogger _setCountDictionary:forClient:](self, "_setCountDictionary:forClient:", v3, 1);
}

- (double)_normalizeCountPer24HoursWithStartDate:(id)a3 endDate:(id)a4 count:(unint64_t)a5
{
  double v6;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  return (double)a5 / (v6 / 86400.0);
}

- (id)_lastLogDate
{
  return -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("ATXUpdatePredictionsLoggerLastLogDate"));
}

- (void)_setLastLogDate:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3, CFSTR("ATXUpdatePredictionsLoggerLastLogDate"));
}

- (id)_protobufForTriggerType:(int)a3 client:(unint64_t)a4
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTriggerType:", v5);
  objc_msgSend(v7, "setClientType:", -[ATXUpdatePredictionsLogger _clientTypeForUpdatePredictionsClient:](self, "_clientTypeForUpdatePredictionsClient:", a4));
  return v7;
}

- (int)_triggerTypeForUpdatePredictionsReason:(unint64_t)a3
{
  int result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = 0;
  switch(a3)
  {
    case 0uLL:
    case 0x16uLL:
    case 0x17uLL:
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ATXUpdatePredictionsLogger _triggerTypeForUpdatePredictionsReason:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForConsumerType called with invalid ATXEngagementType value of %lu"), a3);
      goto LABEL_2;
    case 1uLL:
      result = 1;
      break;
    case 2uLL:
      result = 2;
      break;
    case 3uLL:
      result = 3;
      break;
    case 5uLL:
      result = 4;
      break;
    case 6uLL:
      result = 5;
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
LABEL_2:
      result = 6;
      break;
    default:
      return result;
  }
  return result;
}

- (int)_clientTypeForUpdatePredictionsClient:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3 == 1)
    return 1;
  if (!a3)
    return 0;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ATXUpdatePredictionsLogger _clientTypeForUpdatePredictionsClient:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("_clientTypeForUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu"), a3);
  return 0x7FFFFFFF;
}

- (id)_stringForATXUpdatePredictionsClient:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3)
    return CFSTR("AppPredictions");
  if (a3 == 1)
    return CFSTR("ActionPredictions");
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ATXUpdatePredictionsLogger _stringForATXUpdatePredictionsClient:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("stringForATXUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu"), a3);
  return CFSTR("Error");
}

- (NSDate)now
{
  NSDate *now;

  now = self->_now;
  if (now)
    return now;
  else
    return (NSDate *)(id)objc_opt_new();
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_petLogger, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_triggerTypeForUpdatePredictionsReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "stringForConsumerType called with invalid ATXEngagementType value of %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_clientTypeForUpdatePredictionsClient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "_clientTypeForUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stringForATXUpdatePredictionsClient:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "stringForATXUpdatePredictionsClient called with invalid ATXUpdatePredictionsClient value of %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
