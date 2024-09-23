@implementation SRErrorUtility

+ (id)userStringForError:(id)a3 reflectionDialogWasPlayed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v8 = objc_msgSend(v7, "isEqualToString:", kAFAssistantErrorDomain);

  if (v8)
  {
    v9 = objc_msgSend(v6, "code");
    v10 = CFSTR("ASSISTANT_TRY_AGAIN");
    v11 = CFSTR("clientGenerated#TryAgain");
    switch((unint64_t)v9)
    {
      case 0uLL:
      case 3uLL:
      case 7uLL:
        goto LABEL_22;
      case 1uLL:
      case 2uLL:
      case 4uLL:
        goto LABEL_7;
      case 5uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        goto LABEL_18;
      case 6uLL:
        v10 = 0;
        v11 = CFSTR("clientGenerated#NotReady");
        goto LABEL_22;
      case 0xEuLL:
        v10 = CFSTR("ASSISTANT_CONNECTION_FAILED_3");
        v11 = CFSTR("clientGenerated#ConnectionFailed3");
        goto LABEL_22;
      default:
        if (v9 == (id)300)
          goto LABEL_22;
        if (v9 == (id)2001)
        {
LABEL_7:
          if (v4 && objc_msgSend(v6, "code") == (id)4)
          {
            v10 = CFSTR("ASSISTANT_TIMEOUT_ERROR_AFTER_DELAY_INTERSTITIAL");
            v11 = CFSTR("clientGenerated#TimeoutAfterDelayInterstitials");
          }
          else
          {
            v13 = objc_msgSend(a1, "_getUpdatedErrorCount");
            v14 = CFSTR("ASSISTANT_CONNECTION_FAILED_2");
            v15 = CFSTR("clientGenerated#ConnectionFailed2");
            if (v13 == (id)1)
            {
              v15 = CFSTR("clientGenerated#ConnectionFailed1");
              v14 = CFSTR("ASSISTANT_CONNECTION_FAILED_1");
            }
            if (v13)
              v11 = v15;
            else
              v11 = CFSTR("clientGenerated#ConnectionFailed0");
            if (v13)
              v10 = v14;
            else
              v10 = CFSTR("ASSISTANT_CONNECTION_FAILED_0");
          }
LABEL_22:
          objc_msgSend(a1, "_logDummyAssistantUtteranceViewWithDialogIdentifier:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](SRUIFInstrumentationManager, "sharedManager"));
          objc_msgSend(v17, "storeClientGeneratedDUC:", v11);

        }
        else
        {
LABEL_18:
          v16 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            sub_10009D4CC((uint64_t)v6, v16);
          v10 = 0;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_localizedErrorString:", v10));
        break;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (void)resetErrorState
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SiriUIPreferences sharedPreferences](SiriUIPreferences, "sharedPreferences"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  objc_msgSend(v3, "setPreviousSiriRequestErrorTimestamp:", v2);

}

+ (int64_t)_getUpdatedErrorCount
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  int64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIPreferences sharedPreferences](SiriUIPreferences, "sharedPreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "previousSiriRequestErrorTimestamp"));
  v4 = objc_msgSend(v2, "siriRequestErrorCount");
  objc_msgSend(v3, "timeIntervalSinceNow");
  if (v5 < 0.0)
    v5 = -v5;
  if (v5 <= 480.0)
    v6 = (int64_t)v4 + 1;
  else
    v6 = 0;
  objc_msgSend(v2, "setSiriRequestErrorCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v2, "setPreviousSiriRequestErrorTimestamp:", v7);

  return v6;
}

+ (id)_localizedErrorString:(id)a3
{
  id v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assistantUILocalizedStringForKey:table:", v4, 0));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (void)_logDummyAssistantUtteranceViewWithDialogIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"));
  v9 = CFSTR("dialogIdentifier");
  v10 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v4, "logEventWithType:context:", 1429, v5);

  v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  objc_msgSend(v6, "setAceId:", v8);

  objc_msgSend(v6, "setDialogIdentifier:", v3);
  objc_msgSend(v4, "logClientFeedbackPresented:", v6);

}

@end
