@implementation AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AX_SBSecureMainScreenActiveInterfaceOrientationWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIAlertControllerActionView"), CFSTR("action"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerActionView"), CFSTR("_highlighted"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("sendEvent:"), "v", "@", 0);

}

- (id)_accessibilityTripleClickElementHitTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", self);
  while (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
    objc_msgSend(v4, "locationInView:", v6);
    if (objc_msgSend(v6, "pointInside:withEvent:", 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      NSClassFromString(CFSTR("_UIAlertControllerActionView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      objc_msgSend(v6, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v7);

    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (void)_tripleClickSpeakMenuProcessTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("TripleClickTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityTripleClickElementHitTest:](self, "_accessibilityTripleClickElementHitTest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("_UIAlertControllerActionView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    buf[0] = 0;
    objc_opt_class();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("_highlighted")))
    {
      SBAXLocalizedString(CFSTR("selected"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }

    if (!v9)
      goto LABEL_15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v6, "text"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_15:
      objc_msgSend(MEMORY[0x24BEAFEA0], "sharedInstance", v29, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "notifySpeakServicesToStopSpeaking");

      objc_msgSend(MEMORY[0x24BDFE4E0], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "ignoreLogging");

      if ((v23 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4E0], "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v25 = objc_claimAutoreleasedReturnValue();

        v26 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v25, v26))
        {
          AXColorizeFormatLog();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          _AXStringForArgs();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, v26))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v28;
            _os_log_impl(&dword_21AC77000, v25, v26, "%{public}@", buf, 0xCu);
          }

        }
      }
      -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("TripleClickTitle"));
      v9 = 0;
      goto LABEL_22;
    }
  }
  if ((objc_msgSend(v5, "isEqualToString:", v9, v29, v30) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEAFEA0], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    _AXSVoiceOverTouchVolume();
    v13 = v12;
    _AXSVoiceOverTouchSpeakingRate();
    objc_msgSend((id)v11, "notifySpeakServicesForSpeechOutput:volume:speakingRate:", v9, v13, v14);

    -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("TripleClickTitle"));
    objc_msgSend(MEMORY[0x24BDFE4E0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v15, "ignoreLogging");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4E0], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v17, v18))
      {
        AXColorizeFormatLog();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138543362;
          v32 = v20;
          _os_log_impl(&dword_21AC77000, v17, v18, "%{public}@", buf, 0xCu);
        }

      }
    }
  }
LABEL_22:

}

- (void)_processEventForVOSpeakage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXDispatchTimer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v5 = (void *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXDispatchTimer"));
  }
  if (-[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("TripleClickSpeakWaited")))
  {
    -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _tripleClickSpeakMenuProcessTouch:](self, "_tripleClickSpeakMenuProcessTouch:", v4);
  }
  else if (!objc_msgSend(v5, "isPending") || objc_msgSend(v5, "isCancelled"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __95__AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride__processEventForVOSpeakage___block_invoke;
    v7[3] = &unk_24DDE5830;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "afterDelay:processBlock:", v7, 0.300000012);

  }
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("TripleClickAskWindow"));

  if (v6 && !objc_msgSend(v4, "type"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = v4;
    objc_msgSend(v4, "allTouches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v8)
      goto LABEL_18;
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v12, "phase") || objc_msgSend(v12, "phase") == 1)
        {
          v13 = (void *)_AXSTripleClickCopyOptions();
          if (objc_msgSend(v13, "containsObject:", &unk_24DDF5138))
            -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _processEventForVOSpeakage:](self, "_processEventForVOSpeakage:", v12);
          goto LABEL_15;
        }
        if (objc_msgSend(v12, "phase") == 3 || objc_msgSend(v12, "phase") == 4)
        {
          -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXDispatchTimer"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cancel");
          -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("TripleClickSpeakWaited"));
          -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("TripleClickTitle"));
LABEL_15:

          continue;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v9)
      {
LABEL_18:

        v4 = v14;
        break;
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride;
  -[AX_AX_SBSecureMainScreenActiveInterfaceOrientationWindowOverride sendEvent:](&v15, sel_sendEvent_, v4);

}

@end
