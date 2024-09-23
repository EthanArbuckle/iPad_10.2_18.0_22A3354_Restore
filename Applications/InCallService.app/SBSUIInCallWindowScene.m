@implementation SBSUIInCallWindowScene

- (void)ics_requestTransitionToPresentationMode:(int64_t)a3
{
  -[SBSUIInCallWindowScene ics_requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:completion:](self, "ics_requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:completion:", a3, 0, 0, 0);
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4
{
  -[SBSUIInCallWindowScene requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:](self, "requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:", a3, a4, 0);
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5
{
  -[SBSUIInCallWindowScene ics_requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:completion:](self, "ics_requestTransitionToPresentationMode:shouldDismissCMASAlerts:analyticsSource:completion:", a3, a4, a5, 0);
}

- (void)ics_requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v12 = sub_1000C5588();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = SBSInCallPresentationModeDescription(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v21 = 138412802;
    v22 = v15;
    v23 = 1024;
    v24 = v7;
    v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Requesting scene transition, presentationMode=%@ isUserInitiated=%d analyticsSource=%@", (uint8_t *)&v21, 0x1Cu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[SBSUIInCallWindowScene ics_sceneType](self, "ics_sceneType")));
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("ICSSceneManagerDidRequesFullScreenTransitionNotification"), v17);

  -[SBSUIInCallWindowScene requestTransitionToPresentationMode:isUserInitiated:analyticsSource:](self, "requestTransitionToPresentationMode:isUserInitiated:analyticsSource:", a3, v7, v10);
  if (v11)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sceneManager"));
    objc_msgSend(v20, "waitForPresentationMode:forSceneOfType:completion:", a3, -[SBSUIInCallWindowScene ics_sceneType](self, "ics_sceneType"), v11);

  }
}

- (unint64_t)ics_sceneType
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((-[SBSUIInCallWindowScene isScreenSharingPresentation](self, "isScreenSharingPresentation") & 1) != 0)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sceneManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SBSUIInCallWindowScene requestedPresentationConfigurationIdentifier](self, "requestedPresentationConfigurationIdentifier"));
  v8 = objc_msgSend(v6, "sceneTypeForConfigurationIdentifier:", v7);

  return (unint64_t)v8;
}

@end
