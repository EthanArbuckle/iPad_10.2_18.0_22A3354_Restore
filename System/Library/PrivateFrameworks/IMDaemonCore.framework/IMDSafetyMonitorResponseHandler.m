@implementation IMDSafetyMonitorResponseHandler

- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CKBBContextKeyBalloonBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "categoryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D37500]) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    IMBalloonExtensionIDWithSuffix();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v15) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend(v4, "actionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      IMSMWorkoutAlwaysPromptActionIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", v17) & 1) != 0)
        v14 = 1;
      else
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.SafetyMonitor.Suggestions.WorkoutAlwaysPrompt"));

    }
  }

  return v14;
}

- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a5;
  v7 = a3;
  objc_msgSend(v7, "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "notification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D38D28]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionIdentifier");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "content");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "categoryIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", *MEMORY[0x1E0CEC818])
      && objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.SafetyMonitor.Suggestions.WorkoutAlwaysPrompt")))
    {

      v16 = CFSTR("SMWorkoutAlwaysPromptDismissActionIdentifier");
    }
    objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1D1482E2C;
    v23[3] = &unk_1E9229E80;
    v25 = v6;
    v24 = v15;
    objc_msgSend(v21, "respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:completion:", v14, v24, v16, v23);

  }
  else
  {
    IMLogHandleForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1D1667A10(v22);

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

@end
