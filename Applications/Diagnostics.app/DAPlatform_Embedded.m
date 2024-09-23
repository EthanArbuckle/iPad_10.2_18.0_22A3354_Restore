@implementation DAPlatform_Embedded

+ (id)sharedInstance
{
  return 0;
}

- (BOOL)isCheckerBoardActive
{
  return 0;
}

- (void)activateSimpleAlertWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  -[DAPlatform_Embedded _activateCFUserNotificationWithTitle:message:defaultButtonName:cancelButtonName:handler:](self, "_activateCFUserNotificationWithTitle:message:defaultButtonName:cancelButtonName:handler:", a3, a4, a5, a6, a7);
}

- (BOOL)didSetProxyServerInformation
{
  return 0;
}

- (BOOL)isInBoxUpdateModeActive
{
  return 0;
}

- (void)_activateCFUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonName:(id)a5 cancelButtonName:(id)a6 handler:(id)a7
{
  void (**v12)(_QWORD);
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __CFUserNotification *v18;
  __CFUserNotification *v19;
  uint64_t v20;
  NSObject *v21;
  CFOptionFlags responseFlags;

  v12 = (void (**)(_QWORD))a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, kCFUserNotificationAlertHeaderKey);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, kCFUserNotificationAlertMessageKey);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, kCFUserNotificationDefaultButtonTitleKey);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, kCFUserNotificationAlternateButtonTitleKey);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kCFUserNotificationAlertTopMostKey);
  -[DAPlatform_Embedded _addPlatformCFUserNotificationOptions:](self, "_addPlatformCFUserNotificationOptions:", v17);
  v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v17);
  if (v18)
  {
    v19 = v18;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v18, 0.0, &responseFlags);
    CFRelease(v19);
    if (v12 && responseFlags == 1)
      v12[2](v12);
  }
  else
  {
    v20 = DiagnosticLogHandleForCategory(5);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000EB2A0(v21);

  }
}

@end
