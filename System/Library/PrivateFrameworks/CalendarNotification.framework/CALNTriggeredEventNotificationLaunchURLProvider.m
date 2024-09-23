@implementation CALNTriggeredEventNotificationLaunchURLProvider

+ (id)launchURLForOptionalEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v7 = a3;
  v8 = a4;
  *a5 = 0;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "_launchURLForEventID:hypothesis:isTravelLaunchURL:", v9, v8, a5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CALNTriggeredEventNotificationLaunchURLProvider launchURLForOptionalEventID:hypothesis:isTravelLaunchURL:].cold.1((uint64_t)v7, v11);

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)launchURLForOptionalEventOccurrenceID:(id)a3
{
  return 0;
}

+ (id)_launchURLForEventID:(id)a3 hypothesis:(id)a4 isTravelLaunchURL:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v8 = a3;
  v9 = a4;
  if (v9
    && (objc_msgSend(a1, "_travelLaunchURLForEventID:hypothesis:", v8, v9),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    *a5 = 1;
    v12 = v11;
  }
  else
  {
    v12 = v8;
    v11 = 0;
  }

  return v12;
}

+ (id)_travelLaunchURLForEventID:(id)a3 hypothesis:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("?travel=true"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)launchURLForOptionalEventID:(uint64_t)a1 hypothesis:(NSObject *)a2 isTravelLaunchURL:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not get launch URL because unable to get event ID url for event ID = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
