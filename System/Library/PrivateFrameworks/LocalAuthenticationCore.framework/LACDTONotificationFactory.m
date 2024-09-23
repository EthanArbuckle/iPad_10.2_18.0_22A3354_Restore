@implementation LACDTONotificationFactory

- (id)newSecurityDelayRequiredNotification
{
  LACUNMutableNotification *v2;

  v2 = objc_alloc_init(LACUNMutableNotification);
  -[LACUNMutableNotification setIdentifier:](v2, "setIdentifier:", CFSTR("com.apple.coreauthd.notifications.newSecurityDelayRequired"));
  -[LACUNMutableNotification setCategoryIdentifier:](v2, "setCategoryIdentifier:", CFSTR("com.apple.coreauthd.notifications.category.securityDelay.required"));
  -[LACUNMutableNotification setShouldDisplayActionsInline:](v2, "setShouldDisplayActionsInline:", 1);
  -[LACUNMutableNotification setTitle:](v2, "setTitle:", CFSTR("NEW_SECURITY_DELAY_REQUIRED_TITLE"));
  -[LACUNMutableNotification setIsTitleLocalized:](v2, "setIsTitleLocalized:", 0);
  -[LACUNMutableNotification setBody:](v2, "setBody:", CFSTR("NEW_SECURITY_DELAY_REQUIRED_BODY"));
  -[LACUNMutableNotification setIsBodyLocalized:](v2, "setIsBodyLocalized:", 0);
  -[LACUNMutableNotification setIsTimeSensitive:](v2, "setIsTimeSensitive:", 1);
  -[LACUNMutableNotification setSystemIconName:](v2, "setSystemIconName:", CFSTR("lock.fill"));
  return v2;
}

- (id)securityDelayEndedNotificationForPendingEvaluation:(id)a3 after:(double)a4 validity:(double)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  objc_msgSend(v8, "callbackReason");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_2510C57B8;
  +[LACLocalization dtoSecurityDelayEndedText:duration:](LACLocalization, "dtoSecurityDelayEndedText:duration:", v11, a5 - a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callbackURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[LACDTONotificationFactory _securityDelayEndedNotificationWithIdentifier:body:callbackURL:after:maxAge:](self, "_securityDelayEndedNotificationWithIdentifier:body:callbackURL:after:maxAge:", v13, v12, v14, a4, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_securityDelayEndedNotificationWithIdentifier:(id)a3 body:(id)a4 callbackURL:(id)a5 after:(double)a6 maxAge:(double)a7
{
  id v11;
  id v12;
  id v13;
  LACUNMutableNotification *v14;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(LACUNMutableNotification);
  -[LACUNMutableNotification setIdentifier:](v14, "setIdentifier:", v13);

  -[LACUNMutableNotification setCategoryIdentifier:](v14, "setCategoryIdentifier:", CFSTR("com.apple.coreauthd.notifications.category.securityDelay.ended"));
  -[LACUNMutableNotification setTitle:](v14, "setTitle:", CFSTR("SECURITY_DELAY_ENDED"));
  -[LACUNMutableNotification setIsTitleLocalized:](v14, "setIsTitleLocalized:", 0);
  -[LACUNMutableNotification setBody:](v14, "setBody:", v12);

  -[LACUNMutableNotification setIsBodyLocalized:](v14, "setIsBodyLocalized:", 1);
  -[LACUNMutableNotification setDefaultActionURL:](v14, "setDefaultActionURL:", v11);

  -[LACUNMutableNotification setIsTimeSensitive:](v14, "setIsTimeSensitive:", 1);
  -[LACUNMutableNotification setSystemIconName:](v14, "setSystemIconName:", CFSTR("lock.open.fill"));
  -[LACUNMutableNotification setTriggerInterval:](v14, "setTriggerInterval:", a6);
  if (a7 > 0.0 && a7 != -1.0)
    -[LACUNMutableNotification setWithdrawInterval:](v14, "setWithdrawInterval:", fmax(a7, 60.0));
  return v14;
}

@end
