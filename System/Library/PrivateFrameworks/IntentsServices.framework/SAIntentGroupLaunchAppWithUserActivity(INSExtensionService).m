@implementation SAIntentGroupLaunchAppWithUserActivity(INSExtensionService)

- (void)ins_launchAppWithConnection:()INSExtensionService userActivityIdentifier:delegate:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  uint64_t v28;
  id v29;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "_transaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userActivityWithIdentifier:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BE5B8F8];
  objc_msgSend(v13, "intent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interaction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "intentResponse");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "shouldLaunchAppInBackgroundWithIntent:intentResponse:", v17, v19);

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __141__SAIntentGroupLaunchAppWithUserActivity_INSExtensionService__ins_launchAppWithConnection_userActivityIdentifier_delegate_completionHandler___block_invoke;
  v27 = &unk_24C4B95D0;
  v28 = a1;
  v29 = v10;
  v21 = v10;
  objc_msgSend(v11, "completionHandlerForAppLaunchCommand:withCompletion:", a1, &v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "appProxy", v24, v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "launchAppInBackground:restrictAppsToCarPlay:userActivityIdentifier:completionHandler:", v20, 1, v12, v22);
}

- (uint64_t)ins_analyticsBeginEventType
{
  return 622;
}

- (uint64_t)ins_analyticsEndEventType
{
  return 623;
}

- (uint64_t)ins_shouldUseExtendedFlowTimeout
{
  return 1;
}

@end
