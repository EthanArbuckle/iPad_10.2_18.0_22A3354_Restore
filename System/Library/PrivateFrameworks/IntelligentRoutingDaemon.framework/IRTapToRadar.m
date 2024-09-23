@implementation IRTapToRadar

+ (id)shared
{
  if (shared_onceToken_1 != -1)
    dispatch_once(&shared_onceToken_1, &__block_literal_global_24);
  return (id)shared_tapToRadar;
}

void __22__IRTapToRadar_shared__block_invoke()
{
  IRTapToRadar *v0;
  void *v1;

  v0 = objc_alloc_init(IRTapToRadar);
  v1 = (void *)shared_tapToRadar;
  shared_tapToRadar = (uint64_t)v0;

}

- (IRTapToRadar)init
{
  IRTapToRadar *v2;
  IRTapToRadar *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  IRTapToRadar *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IRTapToRadar;
  v2 = -[IRTapToRadar init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IRTapToRadar setPendingNotificationPresent:](v2, "setPendingNotificationPresent:", 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.intelligentrouting.alert", v4);
    -[IRTapToRadar setQueue:](v3, "setQueue:", v5);

    v6 = v3;
  }

  return v3;
}

- (void)promptForTapToRadarIfAllowed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRTapToRadar queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__IRTapToRadar_promptForTapToRadarIfAllowed___block_invoke;
  v7[3] = &unk_251045B30;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __45__IRTapToRadar_promptForTapToRadarIfAllowed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "_createErrorEventPromptIfAllowed:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(v4, "_createPeriodicPromptIfAllowed:", *(_QWORD *)(a1 + 32)),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v4, "_initiatePopupAndTTR:", v3);

  }
}

- (void)_initiatePopupAndTTR:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (+[IRPlatformInfo isInternalInstall](IRPlatformInfo, "isInternalInstall")
    && !-[IRTapToRadar pendingNotificationPresent](self, "pendingNotificationPresent"))
  {
    -[IRTapToRadar setPendingNotificationPresent:](self, "setPendingNotificationPresent:", 1);
    -[IRTapToRadar _triggerUserPrompts:](self, "_triggerUserPrompts:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v13, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "radarDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "query");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRadarDescription:", v8);

      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "query");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "build");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openURL:configuration:completionHandler:", v12, 0, &__block_literal_global_158_0);

      -[IRTapToRadar setPendingNotificationPresent:](self, "setPendingNotificationPresent:", 0);
    }

  }
}

void __37__IRTapToRadar__initiatePopupAndTTR___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (void *)*MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      __37__IRTapToRadar__initiatePopupAndTTR___block_invoke_cold_1(v6, v5);
  }

}

- (id)_errorEventQuestionaire:(id)a3
{
  id v3;
  IRTTRpopup *v4;
  IRTTRpopup *v5;
  IRTTRpopup *v6;
  IRTTRpopup *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  LOWORD(v10) = 257;
  v4 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, CFSTR("RadarPrompt"), CFSTR("\nIf you find this suggestion unreasonable, would you like to assist by answering 3 yes/no questions?"), CFSTR("Open radar"), CFSTR("Not now"), 0, v10);
  LOWORD(v11) = 0;
  v5 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, CFSTR("QuestionSameRoom"), CFSTR("\nQuestion 1/3:\nIs the suggested device located in the room you are currently in?"), CFSTR("I don't know"), CFSTR("No"), CFSTR("Yes"), v11, v4);
  v14[1] = v5;
  LOWORD(v12) = 0;
  v6 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, CFSTR("QuestionPreviouslyRouted"), CFSTR("\nQuestion 2/3:\nHave you previously routed to this device from this room? "), CFSTR("I don't know"), CFSTR("No"), CFSTR("Yes"), v12);
  v14[2] = v6;
  LOWORD(v13) = 0;
  v7 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", v3, CFSTR("QuestionAirplayIntent"), CFSTR("\nQuestion 3/3:\nWas your intention to route content to a different device?"), CFSTR("I don't know"), CFSTR("No"), CFSTR("Yes"), v13);

  v14[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_triggerUserPrompts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = (id)objc_opt_new();
  objc_msgSend(v4, "popups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __36__IRTapToRadar__triggerUserPrompts___block_invoke;
  v14[3] = &unk_251045B98;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  self->_pendingNotificationPresent = 0;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16[5], CFSTR("prompts"));
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
  v11 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_INFO, "#ttr, TTR prompt: %@", buf, 0xCu);
  }
  if (*((_BYTE *)v22 + 24))
    v12 = v10;
  else
    v12 = 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __36__IRTapToRadar__triggerUserPrompts___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFUserNotification *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CFOptionFlags responseFlags;

  v6 = a2;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "header");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDBD6D8]);

  objc_msgSend(v6, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDBD6E0]);

  objc_msgSend(v6, "otherButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDBD718]);

  objc_msgSend(v6, "defaultButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBD6F8]);

  objc_msgSend(v6, "alternateButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "alternateButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDBD6F0]);

  }
  v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, (CFDictionaryRef)v7);
  if (!v14)
  {
    v15 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      __36__IRTapToRadar__triggerUserPrompts___block_invoke_cold_1(v15);
    *a4 = 1;
  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(v6, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("message"));

  objc_msgSend(v6, "key");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("key"));

  responseFlags = 0;
  CFUserNotificationReceiveResponse(v14, 0.0, &responseFlags);
  CFUserNotificationCancel(v14);
  CFRelease(v14);
  if (responseFlags == 2)
  {
    *a4 = objc_msgSend(v6, "dismissWillStop");
    objc_msgSend(v6, "otherButton");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (responseFlags == 1)
  {
    objc_msgSend(v6, "alternateButton");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v19 = 0;
  if (!responseFlags)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v6, "ttrWillOpen");
    objc_msgSend(v6, "defaultButton");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v20;
  }
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("response"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);

}

- (id)_createErrorEventPromptIfAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[IRPreferences shared](IRPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveOnTtrDebugDataRequestsEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "liveOnEnable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      if (!+[IRPlatformInfo isRunningInUnitTesting](IRPlatformInfo, "isRunningInUnitTesting"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("IRTTRErrorEventsLastPopupDate"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v11;
            v13 = v12;
            if (v12)
            {
              objc_msgSend(v12, "timeIntervalSinceNow");
              v15 = -v14;
              +[IRPreferences shared](IRPreferences, "shared");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "ttrThrottleTimeSec");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "doubleValue");
              v19 = v18;

              if (v19 > v15)
              {
                v20 = *MEMORY[0x24BE5B270];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
                {
                  v29 = 134218498;
                  v30 = v15;
                  v31 = 2048;
                  v32 = v19;
                  v33 = 2112;
                  v34 = v13;
                  _os_log_debug_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEBUG, "#ttr, TTR Error Event throttled with interval: %0.1fsec, threshold:%0.1fsec, last popup at:%@", (uint8_t *)&v29, 0x20u);
                }
                v21 = 0;
LABEL_18:

                goto LABEL_13;
              }
            }
          }
          else
          {
            v13 = 0;
          }
          -[IRTapToRadar _createErrorEventsPromptsForMediaEvent:](self, "_createErrorEventsPromptsForMediaEvent:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("IRTTRErrorEventsLastPopupDate"));

            v25 = (void *)*MEMORY[0x24BE5B270];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
            {
              v26 = v25;
              objc_msgSend(v21, "query");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "title");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 138412290;
              v30 = *(double *)&v28;
              _os_log_impl(&dword_23FFBA000, v26, OS_LOG_TYPE_INFO, "#ttr, TTR Error Event prompt created: %@", (uint8_t *)&v29, 0xCu);

            }
          }
          goto LABEL_18;
        }
      }
    }
  }
  else
  {

  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (id)_createPeriodicPromptIfAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[IRPreferences shared](IRPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "liveOnTtrPeriodicDataRequestsEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    +[IRPreferences shared](IRPreferences, "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "liveOnEnable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("IRTTRPeriodicLastPopupDate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "timeIntervalSinceNow");
            v15 = -v14;
            +[IRPreferences shared](IRPreferences, "shared");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "ttrPeriodicThrottleTimeSec");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            if (v19 > v15)
            {
              v20 = *MEMORY[0x24BE5B270];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
              {
                v29 = 134218498;
                v30 = v15;
                v31 = 2048;
                v32 = v19;
                v33 = 2112;
                v34 = v13;
                _os_log_debug_impl(&dword_23FFBA000, v20, OS_LOG_TYPE_DEBUG, "#ttr, TTR periodic throttled with interval: %0.1fsec, threshold:%0.1fsec, last popup at:%@", (uint8_t *)&v29, 0x20u);
              }
              v21 = 0;
LABEL_17:

              goto LABEL_12;
            }
          }
        }
        else
        {
          v13 = 0;
        }
        -[IRTapToRadar _createPeriodicPromptsForMediaEvent:](self, "_createPeriodicPromptsForMediaEvent:", v4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("IRTTRPeriodicLastPopupDate"));

          v25 = (void *)*MEMORY[0x24BE5B270];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
          {
            v26 = v25;
            objc_msgSend(v21, "query");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "title");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138412290;
            v30 = *(double *)&v28;
            _os_log_impl(&dword_23FFBA000, v26, OS_LOG_TYPE_INFO, "#ttr, TTR Periodic prompt created: %@", (uint8_t *)&v29, 0xCu);

          }
        }
        goto LABEL_17;
      }
    }
  }
  else
  {

  }
  v21 = 0;
LABEL_12:

  return v21;
}

- (id)_createErrorEventsPromptsForMediaEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setQuery:", v6);

  objc_msgSend(v5, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExtensionIdentifiers:", &unk_25105EFA8);

  objc_msgSend(v5, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteDeviceSelections:", &unk_25105EFC0);

  objc_msgSend(v5, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRadarDescription:", CFSTR("Thank you in assisting in Coriander Live On.\nYou can add any relevant information here:\n\n Please do not change description beyond this point.\n#############################\n"));

  v10 = objc_msgSend(v4, "eventType");
  if (v10 == 2)
  {
    v11 = CFSTR("Coriander - Automatic Route Revoked");
  }
  else
  {
    if (v10 != 4)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v11 = CFSTR("Coriander - One-Tap Suggestion Rejected");
  }
  -[IRTapToRadar _errorEventQuestionaire:](self, "_errorEventQuestionaire:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPopups:", v12);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Coriander Live On Event Prompt] %@"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  v15 = v5;
LABEL_7:

  return v15;
}

- (id)_createPeriodicPromptsForMediaEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  IRTTRpopup *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setQuery:", v5);

  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtensionIdentifiers:", &unk_25105EFD8);

  objc_msgSend(v4, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteDeviceSelections:", &unk_25105EFF0);

  objc_msgSend(v4, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRadarDescription:", CFSTR("Thank you in assisting in Coriander Live On.\nYou can add any relevant information here:\n\n Please do not change description beyond this point.\n#############################\n"));

  v9 = objc_msgSend(v3, "eventType");
  if (v9 != 5 && v9)
  {
    v14 = 0;
  }
  else
  {
    LOWORD(v16) = 257;
    v10 = -[IRTTRpopup initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:]([IRTTRpopup alloc], "initWithHeader:key:message:defaultButton:otherButton:alternateButton:ttrWillOpen:dismissWillStop:", CFSTR("Coriander Live-On"), CFSTR("RadarPrompt"), CFSTR("Thank you for participating in the Coriander Live On. Would you help and file a radar?\n(You can always turn of this prompt in Internal Settings->Intelligent Routing)"), CFSTR("Open radar"), CFSTR("Not now"), 0, v16);
    v17[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPopups:", v11);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Coriander Live On Periodic Prompt] %@"), CFSTR("Coriander - Periodic data collection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    v14 = v4;
  }

  return v14;
}

- (NSDate)previousNotificationDate
{
  return self->_previousNotificationDate;
}

- (void)setPreviousNotificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousNotificationDate, a3);
}

- (BOOL)pendingNotificationPresent
{
  return self->_pendingNotificationPresent;
}

- (void)setPendingNotificationPresent:(BOOL)a3
{
  self->_pendingNotificationPresent = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousNotificationDate, 0);
}

void __37__IRTapToRadar__initiatePopupAndTTR___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_ERROR, "#ttr, [ErrorId - TTR popup post error] Unable to post notification: %@", (uint8_t *)&v5, 0xCu);

}

void __36__IRTapToRadar__triggerUserPrompts___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23FFBA000, log, OS_LOG_TYPE_ERROR, "#ttr, [ErrorId - TTR alert error] Could not create alert notification", v1, 2u);
}

@end
