@implementation JFXAnalyticsManager

- (JFXAnalyticsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXAnalyticsManager;
  return -[JFXAnalyticsManager init](&v3, sel_init);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_44);
  return (id)sharedInstance_analyticsManager_0;
}

void __37__JFXAnalyticsManager_sharedInstance__block_invoke()
{
  JFXAnalyticsManager *v0;
  void *v1;

  v0 = objc_alloc_init(JFXAnalyticsManager);
  v1 = (void *)sharedInstance_analyticsManager_0;
  sharedInstance_analyticsManager_0 = (uint64_t)v0;

}

- (id)dictionaryWithEventName:(id)a3 value:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = a3;
  v11[0] = CFSTR("AnalyticsEventNameKey");
  v11[1] = CFSTR("AnalyticsEventCountOrDurationValueKey");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("AnalyticsEventTimeStampKey");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)checkIfEventExistsWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[JFXAnalyticsKeys allEventNames](JFXAnalyticsKeys, "allEventNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)trackEventWithName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[JFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:"))
  {
    -[JFXAnalyticsManager fullKeyFromEvent:](self, "fullKeyFromEvent:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXAnalyticsManager trackKey:withCount:](self, "trackKey:withCount:", v4, 1);

  }
}

+ (id)bundleForAnalytics
{
  if (bundleForAnalytics_onceToken != -1)
    dispatch_once(&bundleForAnalytics_onceToken, &__block_literal_global_8);
  return (id)bundleForAnalytics_bundle;
}

void __41__JFXAnalyticsManager_bundleForAnalytics__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)bundleForAnalytics_bundle;
  bundleForAnalytics_bundle = v3;

}

- (id)fullKeyFromEvent:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.cameraeffectskit."), a3);
}

- (void)trackKey:(id)a3 withPayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bundleForAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("hostApp"));

    v15 = v8;
    v10 = v8;
    v11 = AnalyticsSendEventLazy();
    JFXLog_DebugAnalytics();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v11)
        v13 = CFSTR("succeeded");
      else
        v13 = CFSTR("failed");
      objc_msgSend(v7, "descriptionInStringsFileFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_2269A9000, v12, OS_LOG_TYPE_DEBUG, "Tracking key (%@) %@ : %@", buf, 0x20u);

    }
  }

}

id __44__JFXAnalyticsManager_trackKey_withPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)trackKey:(id)a3 withCount:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("itemCount");
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXAnalyticsManager trackKey:withPayload:](self, "trackKey:withPayload:", v7, v9);
}

- (BOOL)isIncrementScalar:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[JFXAnalyticsKeys allIncrementScalarEffectEvents](JFXAnalyticsKeys, "allIncrementScalarEffectEvents", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  +[JFXAnalyticsKeys allIncrementScalarEvents](JFXAnalyticsKeys, "allIncrementScalarEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "containsObject:", v3);
LABEL_11:

  return v9;
}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken_0 != -1)
    dispatch_once(&allIncrementScalarEvents_onceToken_0, &__block_literal_global_23_1);
  return (id)allIncrementScalarEvents_allIncrementScalarEvents_0;
}

void __47__JFXAnalyticsManager_allIncrementScalarEvents__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("thermalnominaltolight");
  v2[1] = CFSTR("thermallighttomoderate");
  v2[2] = CFSTR("thermalmoderatetoheavy");
  v2[3] = CFSTR("thermalheavytotrapping");
  v2[4] = CFSTR("thermaltrappingtosleeping");
  v2[5] = CFSTR("thermalsleepingtotrapping");
  v2[6] = CFSTR("thermaltrappingtoheavy");
  v2[7] = CFSTR("thermalheavytomoderate");
  v2[8] = CFSTR("thermalmoderatetolight");
  v2[9] = CFSTR("thermallighttonominal");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_0;
  allIncrementScalarEvents_allIncrementScalarEvents_0 = v0;

}

@end
