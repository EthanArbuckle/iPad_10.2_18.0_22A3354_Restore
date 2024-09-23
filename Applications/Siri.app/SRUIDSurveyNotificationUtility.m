@implementation SRUIDSurveyNotificationUtility

+ (id)notificationCenter
{
  return +[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter");
}

+ (void)setupUserNotificationCenterDelegateIfNeeded:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (AFIsInternalInstall(v6, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "notificationCenter"));
    objc_msgSend(v5, "setDelegate:", v6);

  }
}

+ (id)notificationRequestWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 120.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_createNotificationRequest:body:footer:identifier:categoryIdentifier:suppressDefaultAction:expirationDate:userInfo:", CFSTR("Did you mean to activate Siri?"), CFSTR("(Internal-Only) Select an option below to provide input about activating Siri."), CFSTR("Tap here to provide feedback."), CFSTR("com.apple.siri.notification.uid-internal-survey"), CFSTR("SiriUIDSurveyCategory"), 1, v6, v4));
  return v7;
}

+ (id)_createNotificationRequest:(id)a3 body:(id)a4 footer:(id)a5 identifier:(id)a6 categoryIdentifier:(id)a7 suppressDefaultAction:(BOOL)a8 expirationDate:(id)a9 userInfo:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v10 = a8;
  v16 = a10;
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v23, "setTitle:", v22);

  objc_msgSend(v23, "setBody:", v21);
  objc_msgSend(v23, "setShouldSuppressDefaultAction:", v10);
  objc_msgSend(v23, "setCategoryIdentifier:", v18);

  objc_msgSend(v23, "setUserInfo:", v16);
  objc_msgSend(v23, "setExpirationDate:", v17);

  objc_msgSend(v23, "setFooter:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v19, v23, 0));

  return v24;
}

+ (void)postSiriInternalUIDSurveyNotification:(unint64_t)a3 activationHistory:(id)a4 requestSource:(int64_t)a5 dismissalReason:(int64_t)a6
{
  id v10;
  NSObject *v11;
  uint64_t Name;
  void *v13;
  void *v14;
  NSNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[6];
  uint8_t buf[4];
  const char *v40;

  v10 = a4;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "+[SRUIDSurveyNotificationUtility postSiriInternalUIDSurveyNotification:activationHistory:requestSource:dismissalReason:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Request is eligible for survey notification", buf, 0xCu);
  }
  v37[0] = CFSTR("dismissalReason");
  Name = SASDismissalReasonGetName(a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(Name);
  v38[0] = v13;
  v37[1] = CFSTR("requestSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v38[1] = v14;
  v37[2] = CFSTR("deviceHasSideButton");
  v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", SiriUIDeviceHasSideButton());
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v38[2] = v16;
  v37[3] = CFSTR("countOfTotalEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "countOfTotalActivations")));
  v38[3] = v17;
  v37[4] = CFSTR("countOfUnintendedEvents");
  v33 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "countOfUnintendedActivations")));
  v38[4] = v18;
  v37[5] = CFSTR("countOfUnintendedEventsSinceLastIntendedEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "countOfUnintendedActivationsSinceLastIntendedActivation")));
  v38[5] = v19;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 6));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "notificationCenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "notificationRequestWithUserInfo:", v32));
  objc_msgSend(v21, "setDestinations:", a3);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000A018;
  v34[3] = &unk_100122598;
  v35 = v21;
  v31 = v21;
  objc_msgSend(v20, "addNotificationRequest:withCompletionHandler:", v31, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("intendedButton"), CFSTR("Yes, I meant to activate Siri"), 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("intendedFileARadarButton"), CFSTR("Yes + File a Radar with Feedback"), 4));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("unintendedButton"), CFSTR("No, I didn't mean to activate Siri"), 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("unintendedFileARadarButton"), CFSTR("No + File a Radar with Feedback"), 4));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("turnOffNotification"), CFSTR("Turn off this notification"), 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("notNow"), CFSTR("Dismiss"), 0));
  v36[0] = v22;
  v36[1] = v23;
  v36[2] = v24;
  v36[3] = v25;
  v36[4] = v26;
  v36[5] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 6));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("SiriUIDSurveyCategory"), v28, &__NSArray0__struct, 0));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v29));
  objc_msgSend(v20, "setNotificationCategories:", v30);

}

@end
