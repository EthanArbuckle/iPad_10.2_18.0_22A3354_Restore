@implementation AFUISiriSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AFUISiriSession");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("cancelSpeechRequest"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("_connection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("_stateHandler"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriSession"), CFSTR("assistantConnection:receivedCommand:completion:"), "v", "@", "@", "@?", 0);

}

- (void)cancelSpeechRequest
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[AFUISiriSessionAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("VoiceOverCancelRequestInProgress"));
  -[AFUISiriSessionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_connection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXIsInternalInstall())
  {
    AXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_232430000, v5, OS_LOG_TYPE_DEFAULT, "Transferring voice cancel request in progress %@ to connection %@", buf, 0x16u);

    }
  }
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", v3, CFSTR("VoiceOverCancelRequestInProgress"));
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSessionAccessibility;
  -[AFUISiriSessionAccessibility cancelSpeechRequest](&v7, sel_cancelSpeechRequest);
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("VoiceOverCancelRequestInProgress"));

}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  AFUISiriSessionAccessibility *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = objc_msgSend(v11, "isClarityBoardEnabled");

  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && !-[AFUISiriSessionAccessibility _axIsAddViewsCommandAllowed:](self, "_axIsAddViewsCommandAllowed:", v9))
  {
    AXLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_232430000, v13, OS_LOG_TYPE_DEFAULT, "Command %@ is unallowed in custom accessibility mode", buf, 0xCu);
    }

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __79__AFUISiriSessionAccessibility_assistantConnection_receivedCommand_completion___block_invoke;
    v18 = &unk_25017D148;
    v19 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AFUISiriSessionAccessibility;
    -[AFUISiriSessionAccessibility assistantConnection:receivedCommand:completion:](&v14, sel_assistantConnection_receivedCommand_completion_, v8, v9, v10);
  }

}

void __79__AFUISiriSessionAccessibility_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_stateHandler"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "performTransitionForEvent:", 7);
}

- (BOOL)_axIsAddViewsCommandAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  __CFString *v25;
  char v26;
  const __CFString *v27;
  AFUISiriSessionAccessibility *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", CFSTR("UnallowedSiriCommands"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("SAUIAddViewsUnallowedSiriCommands"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "views");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v29 = self;
    v30 = v4;
    v13 = 0x24BE81000uLL;
    v14 = CFSTR("StartCall");
    v33 = *(_QWORD *)v35;
    v31 = v8;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          __UIAccessibilityCastAsClass();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dialogIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = i;
          v18 = v12;
          v19 = v10;
          v20 = v14;
          v21 = v9;
          v22 = v13;
          objc_opt_class();
          __UIAccessibilityCastAsClass();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sash");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "applicationBundleIdentifier");
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v13 = v22;
          v9 = v21;
          v14 = v20;
          v10 = v19;
          v12 = v18;
          i = v32;
        }
        else
        {
          v25 = 0;
        }
        if ((objc_msgSend(v17, "containsString:", v14, v29) & 1) != 0)
        {
          v27 = CFSTR("com.apple.mobilephone");
          goto LABEL_33;
        }
        if ((objc_msgSend(v17, "containsString:", CFSTR("ReadMail")) & 1) != 0
          || (objc_msgSend(v17, "containsString:", CFSTR("SendMail")) & 1) != 0)
        {
          v27 = CFSTR("com.apple.mobilemail");
          goto LABEL_33;
        }
        if ((objc_msgSend(v17, "containsString:", CFSTR("FindEvents")) & 1) != 0
          || (objc_msgSend(v17, "containsString:", CFSTR("CreateEvent")) & 1) != 0)
        {
          v27 = CFSTR("com.apple.mobilecal");
          goto LABEL_33;
        }
        if ((objc_msgSend(v17, "containsString:", CFSTR("WEBINDEX")) & 1) != 0)
        {
          v27 = CFSTR("com.apple.mobilesafari");
          goto LABEL_33;
        }
        if ((objc_msgSend(v17, "containsString:", CFSTR("STOCKS")) & 1) != 0)
        {
          v27 = CFSTR("com.apple.stocks");
          goto LABEL_33;
        }
        if ((objc_msgSend(v9, "containsObject:", v17) & 1) != 0)
        {
          v26 = 0;
          goto LABEL_34;
        }
        if (v25 && (-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("com.apple.weather")) & 1) == 0)
        {
          v27 = v25;
LABEL_33:
          v26 = -[AFUISiriSessionAccessibility _axIsAppInClarity:](v29, "_axIsAppInClarity:", v27);
LABEL_34:
          v4 = v30;

          v8 = v31;
          goto LABEL_35;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v26 = 1;
      v4 = v30;
      v8 = v31;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v26 = 1;
  }
LABEL_35:

  return v26;
}

- (BOOL)_axIsAppInClarity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE16E00], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri"));

  return v6;
}

@end
