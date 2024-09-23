@implementation SAIntentGroupLaunchAppWithIntent(INSExtensionService)

- (void)ins_launchAppWithConnection:()INSExtensionService delegate:completionHandler:
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SAIntentGroupLaunchAppWithIntent(INSExtensionService) ins_launchAppWithConnection:delegate:completionHandler:]";
    v46 = 2112;
    v47 = v8;
    _os_log_impl(&dword_20BAA8000, v11, OS_LOG_TYPE_INFO, "%s ins_launchAppWithConnection: %@", buf, 0x16u);
  }
  objc_msgSend(v8, "_transaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentUserActivity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(a1, "ins_aceIntentResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "userActivity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x24BDC1598]);
      if (v16)
      {
        objc_msgSend(v15, "userActivity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "activityType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v17, "initWithActivityType:", v19);

      }
      else
      {
        objc_msgSend(v8, "intent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v17, "_initWithIntent:", v18);
      }

      v20 = objc_alloc(MEMORY[0x24BDD9DF0]);
      objc_msgSend(v8, "intent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithIntent:response:", v21, v15);

      objc_msgSend(v22, "setIntentHandlingStatus:", 3);
      objc_msgSend(v13, "_setInteraction:donate:", v22, 0);
      objc_msgSend(v8, "_transaction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x24BE5B908]);
      objc_msgSend(v8, "intent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithType:intent:intentResponse:userActivities:", 5, v25, v15, 0);
      objc_msgSend(v23, "setState:", v26);

    }
    else
    {
      v13 = 0;
    }

  }
  v27 = (void *)MEMORY[0x24BE5B8F8];
  objc_msgSend(v8, "intent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "interaction");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "intentResponse");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v27, "shouldLaunchAppInBackgroundWithIntent:intentResponse:", v28, v30);

  v38 = MEMORY[0x24BDAC760];
  v39 = 3221225472;
  v40 = __112__SAIntentGroupLaunchAppWithIntent_INSExtensionService__ins_launchAppWithConnection_delegate_completionHandler___block_invoke;
  v41 = &unk_24C4B95D0;
  v42 = a1;
  v32 = v10;
  v43 = v32;
  objc_msgSend(v9, "completionHandlerForAppLaunchCommand:withCompletion:", a1, &v38);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)*MEMORY[0x24BDD9A30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD9A30], OS_LOG_TYPE_INFO))
  {
    v35 = v34;
    v36 = objc_msgSend(a1, "doNotDismissSiri", v38, v39, v40, v41, v42);
    *(_DWORD *)buf = 136315394;
    v45 = "-[SAIntentGroupLaunchAppWithIntent(INSExtensionService) ins_launchAppWithConnection:delegate:completionHandler:]";
    v46 = 1024;
    LODWORD(v47) = v36;
    _os_log_impl(&dword_20BAA8000, v35, OS_LOG_TYPE_INFO, "%s donotdismiss: %d", buf, 0x12u);

  }
  objc_msgSend(v8, "appProxy", v38, v39, v40, v41, v42);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:retainsSiri:completionHandler:", v31, 1, 0, objc_msgSend(a1, "doNotDismissSiri"), v33);

}

- (uint64_t)ins_analyticsBeginEventType
{
  return 620;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 621;
}

@end
