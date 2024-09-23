@implementation CALNTriggeredEventNotificationSourceClientIdentifierUtilities

+ (id)_characterSetForEncodingIdentifierComponents
{
  if (_characterSetForEncodingIdentifierComponents_onceToken != -1)
    dispatch_once(&_characterSetForEncodingIdentifierComponents_onceToken, &__block_literal_global_18);
  return (id)_characterSetForEncodingIdentifierComponents_characterSet;
}

void __109__CALNTriggeredEventNotificationSourceClientIdentifierUtilities__characterSetForEncodingIdentifierComponents__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(CFSTR(";"), "stringByAppendingString:", CFSTR("%"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "invertedSet");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_characterSetForEncodingIdentifierComponents_characterSet;
  _characterSetForEncodingIdentifierComponents_characterSet = v1;

}

+ (id)sourceClientIdentifierForEventID:(id)a3 alarmID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_characterSetForEncodingIdentifierComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_24D4856D0;
  v11 = v10;

  if (v6)
  {
    objc_msgSend(a1, "_characterSetForEncodingIdentifierComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_24D4856D0;
    v16 = v15;

    v20[0] = v11;
    v20[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(";"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v11;
  }

  return v18;
}

+ (id)alarmIDForSourceClientIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;

  v4 = a3;
  v11 = 0;
  v12 = 0;
  objc_msgSend(a1, "eventID:andAlarmID:fromSourceClientIdentifier:", &v12, &v11, v4);
  v5 = v12;
  v6 = v11;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities alarmIDForSourceClientIdentifier:].cold.1((uint64_t)v4, v9);

  }
  return v7;
}

+ (id)eventIDForSourceClientIdentifier:(id)a3
{
  id v3;
  id v5;
  id v6;

  v5 = 0;
  v6 = 0;
  objc_msgSend(a1, "eventID:andAlarmID:fromSourceClientIdentifier:", &v6, &v5, a3);
  v3 = v6;

  return v3;
}

+ (void)eventID:(id *)a3 andAlarmID:(id *)a4 fromSourceClientIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;

  v7 = a5;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(";"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = 0;
  *a4 = 0;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingPercentEncoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2
      && (objc_msgSend(v8, "objectAtIndexedSubscript:", 1), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = v11;
      objc_msgSend(v11, "stringByRemovingPercentEncoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = objc_retainAutorelease(v10);
      if (v13)
      {
        v14 = objc_retainAutorelease(v13);
        *a4 = v14;

      }
    }
    else
    {
      v12 = 0;
      *a3 = objc_retainAutorelease(v10);
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[CALNTriggeredEventNotificationSourceClientIdentifierUtilities eventID:andAlarmID:fromSourceClientIdentifier:].cold.1((uint64_t)v7, v15);

  }
}

+ (void)alarmIDForSourceClientIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_215D9B000, a2, OS_LOG_TYPE_DEBUG, "Could not get alarm ID for source client identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)eventID:(uint64_t)a1 andAlarmID:(NSObject *)a2 fromSourceClientIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Invalid sourceClientIdentifier (%{public}@). Could not find at least one component.", (uint8_t *)&v2, 0xCu);
}

@end
