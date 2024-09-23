@implementation AKAutoBugCapture

+ (void)triggerAutoBugCaptureWithSubType:(id)a3 andBundleID:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (triggerAutoBugCaptureWithSubType_andBundleID_userInfo__onceToken != -1)
    dispatch_once(&triggerAutoBugCaptureWithSubType_andBundleID_userInfo__onceToken, &__block_literal_global_52);
  objc_msgSend((id)triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("Application"), CFSTR("Functional"), v7, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v17 = CFSTR("userInfo");
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend((id)triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter, "snapshotWithSignature:duration:event:payload:reply:", v10, 0, v11, &__block_literal_global_18, 15.0);
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEFAULT, "Diagnostic Reporter sent snapshot for signature %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    +[AKAutoBugCapture triggerAutoBugCaptureWithSubType:andBundleID:userInfo:].cold.1((uint64_t)v10, v14);
  }

}

void __74__AKAutoBugCapture_triggerAutoBugCaptureWithSubType_andBundleID_userInfo___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  v1 = (void *)triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter;
  triggerAutoBugCaptureWithSubType_andBundleID_userInfo__diagnosticReporter = (uint64_t)v0;

}

void __74__AKAutoBugCapture_triggerAutoBugCaptureWithSubType_andBundleID_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19202F000, v3, OS_LOG_TYPE_DEFAULT, "Received response from Diagnostic Reporter - %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (BOOL)shouldCapturePromptBugForContext:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "_capabilityForUIDisplay") == 1)
  {
    objc_msgSend(v3, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = objc_msgSend(v3, "isUsernameEditable") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)userInfoFromContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "serviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("serviceType"));

  objc_msgSend(v3, "_proxiedAppBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "_proxiedAppBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("proxiedAppBundleID"));

  }
  return v4;
}

+ (id)userInfoFromAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21[0] = CFSTR("altDSID");
  v4 = (void *)0x1E2E5C000;
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "altDSIDForAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("(******)");
  if (v5)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "altDSIDForAccount:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      v7 = CFSTR("(******)");
    else
      v7 = CFSTR("(empty)");
  }
  else
  {
    v7 = CFSTR("(null)");
  }
  v22[0] = v7;
  v21[1] = CFSTR("DSID");
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDSIDForAccount:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "altDSIDForAccount:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
      v10 = CFSTR("(******)");
    else
      v10 = CFSTR("(empty)");
  }
  else
  {
    v10 = CFSTR("(null)");
  }
  v22[1] = v10;
  v21[2] = CFSTR("username");
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "altDSIDForAccount:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "altDSIDForAccount:", v3);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v6, "length"))
      v13 = CFSTR("(******)");
    else
      v13 = CFSTR("(empty)");
  }
  else
  {
    v13 = CFSTR("(null)");
  }
  v22[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  if (v9)
  {

  }
  if (v5)
  {

  }
  return v14;
}

+ (void)triggerAutoBugCaptureWithSubType:(uint64_t)a1 andBundleID:(NSObject *)a2 userInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19202F000, a2, OS_LOG_TYPE_ERROR, "Diagnostic Reporter failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

@end
