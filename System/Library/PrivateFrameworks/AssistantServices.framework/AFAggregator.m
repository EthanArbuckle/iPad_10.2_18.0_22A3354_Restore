@implementation AFAggregator

+ (void)logRequestCompletedWithDuration:(double)a3
{
  unsigned int v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 > 10.0)
    a3 = 10.0;
  v3 = a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "+[AFAggregator logRequestCompletedWithDuration:]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %d", (uint8_t *)&v5, 0x12u);
  }
  _AFAggregatorClientAddValueForScalarKey(*((_QWORD *)&off_1E3A342E0 + v3), 1);
}

+ (void)missedAppContextForRequest
{
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.context.missed.app"), 1);
}

+ (void)missedAlertContextForRequest
{
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.context.missed.alert"), 1);
}

+ (void)logRequestCancelAfterSeconds:(double)a3
{
  const __CFString *v3;

  if (a3 >= 0.0)
  {
    if (a3 >= 1.0)
    {
      if (a3 >= 2.0)
      {
        if (a3 >= 3.0)
        {
          if (a3 >= 4.0)
          {
            if (a3 >= 5.0)
            {
              if (a3 >= 6.0)
              {
                if (a3 >= 7.0)
                {
                  if (a3 >= 8.0)
                  {
                    if (a3 >= 9.0)
                    {
                      if (a3 >= 10.0)
                      {
                        if (a3 >= 11.0)
                        {
                          if (a3 >= 12.0)
                          {
                            if (a3 >= 13.0)
                            {
                              if (a3 >= 14.0)
                              {
                                if (a3 >= 15.0)
                                {
                                  if (a3 >= 20.0)
                                  {
                                    if (a3 >= 25.0)
                                    {
                                      if (a3 >= 30.0)
                                      {
                                        if (a3 >= 35.0)
                                        {
                                          if (a3 >= 40.0)
                                            v3 = CFSTR("com.apple.siri.RequestCancel.40SecondsOrMore");
                                          else
                                            v3 = CFSTR("com.apple.siri.RequestCancel.40Seconds");
                                        }
                                        else
                                        {
                                          v3 = CFSTR("com.apple.siri.RequestCancel.35Seconds");
                                        }
                                      }
                                      else
                                      {
                                        v3 = CFSTR("com.apple.siri.RequestCancel.30Seconds");
                                      }
                                    }
                                    else
                                    {
                                      v3 = CFSTR("com.apple.siri.RequestCancel.25Seconds");
                                    }
                                  }
                                  else
                                  {
                                    v3 = CFSTR("com.apple.siri.RequestCancel.20Seconds");
                                  }
                                }
                                else
                                {
                                  v3 = CFSTR("com.apple.siri.RequestCancel.15Seconds");
                                }
                              }
                              else
                              {
                                v3 = CFSTR("com.apple.siri.RequestCancel.14Seconds");
                              }
                            }
                            else
                            {
                              v3 = CFSTR("com.apple.siri.RequestCancel.13Seconds");
                            }
                          }
                          else
                          {
                            v3 = CFSTR("com.apple.siri.RequestCancel.12Seconds");
                          }
                        }
                        else
                        {
                          v3 = CFSTR("com.apple.siri.RequestCancel.11Seconds");
                        }
                      }
                      else
                      {
                        v3 = CFSTR("com.apple.siri.RequestCancel.10Seconds");
                      }
                    }
                    else
                    {
                      v3 = CFSTR("com.apple.siri.RequestCancel.9Seconds");
                    }
                  }
                  else
                  {
                    v3 = CFSTR("com.apple.siri.RequestCancel.8Seconds");
                  }
                }
                else
                {
                  v3 = CFSTR("com.apple.siri.RequestCancel.7Seconds");
                }
              }
              else
              {
                v3 = CFSTR("com.apple.siri.RequestCancel.6Seconds");
              }
            }
            else
            {
              v3 = CFSTR("com.apple.siri.RequestCancel.5Seconds");
            }
          }
          else
          {
            v3 = CFSTR("com.apple.siri.RequestCancel.4Seconds");
          }
        }
        else
        {
          v3 = CFSTR("com.apple.siri.RequestCancel.3Seconds");
        }
      }
      else
      {
        v3 = CFSTR("com.apple.siri.RequestCancel.2Seconds");
      }
    }
    else
    {
      v3 = CFSTR("com.apple.siri.RequestCancel.LessThan1");
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);
  }
}

+ (void)logSiriInvokedVia:(int64_t)a3
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v3 = CFSTR("hardware_button");
  }
  else
  {
    if (a3 != 8)
      return;
    v3 = CFSTR("voice_trigger");
  }
  ADClientAddValueForScalarKey();
  v5 = CFSTR("via");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)logSiriQuickStopAction:(unint64_t)a3
{
  char v3;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    ADClientAddValueForScalarKey();
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  ADClientAddValueForScalarKey();
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      return;
LABEL_9:
    ADClientAddValueForScalarKey();
    return;
  }
LABEL_8:
  ADClientAddValueForScalarKey();
  if ((v3 & 8) != 0)
    goto LABEL_9;
}

+ (void)logSiriMediaVolumeAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 2)
    ADClientAddValueForScalarKey();
}

+ (void)logSiriPausedMedia
{
  ADClientAddValueForScalarKey();
}

+ (id)_fullAggDKeyWithPrefix:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "code");
  objc_msgSend(v6, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("kAFAssistantErrorDomain"));

  if (!v13)
    goto LABEL_10;
  if (v9 == 1 && v11)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%@.%ld."), v8, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v14 = v7;
  if (!v11)
  {
LABEL_10:
    v14 = v7;
    if (v8)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("Other"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_6:
  v15 = v11;

  objc_msgSend(v15, "domain");
  v16 = objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v15, "code");
  v6 = v15;
  v8 = (void *)v16;
  if (!v16)
    goto LABEL_11;
LABEL_7:
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x1F)
  {
    objc_msgSend(v8, "substringToIndex:", 30);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("%@.%ld"), v8, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v8;
LABEL_12:

  return v18;
}

+ (void)logRequestLaunchedApp
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logRequestLaunchedApp]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriSucceeded"), 1);
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriCancelled"), -1);
}

+ (void)logSiriSpeechRequestStarted
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logSiriSpeechRequestStarted]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriStarted.Speech"), 1);
}

+ (void)logSiriOtherRequestStarted
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logSiriOtherRequestStarted]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriStarted.Other"), 1);
}

+ (void)logSiriRequestFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logSiriRequestFailedWithError:]";
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(a1, "_fullAggDKeyWithPrefix:error:", CFSTR("com.apple.siri.SiriFailed."), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logSiriRequestSucceeded
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logSiriRequestSucceeded]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriSucceeded"), 1);
}

+ (void)logSiriRequestCancelled
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logSiriRequestCancelled]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.SiriCancelled"), 1);
}

+ (void)logDictationStarted
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logDictationStarted]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.DictationStarted"), 1);
}

+ (void)logDictationFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logDictationFailedWithError:]";
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(a1, "_fullAggDKeyWithPrefix:error:", CFSTR("com.apple.siri.DictationFailed."), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logDictationSucceeded
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logDictationSucceeded]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.DictationSucceeded"), 1);
}

+ (void)logDictationCancelled
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logDictationCancelled]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.DictationCancelled"), 1);
}

+ (void)logDictationFollowedByContinueOccurredForLanguage:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logDictationFollowedByContinueOccurredForLanguage:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.siri.DictationFollowedByContinue."), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logDictationFollowedByKeyboardInputOccurredForLanguage:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logDictationFollowedByKeyboardInputOccurredForLanguage:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.siri.DictationFollowedByKeyboardEntry."), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logDictationFollowedByKeyboardDeleteOccurredForLanguage:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logDictationFollowedByKeyboardDeleteOccurredForLanguage:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.siri.DictationFollowedByKeyboardDelete."), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logKeyboardInputFollowedByContinueOccurredForLanguage:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "+[AFAggregator logKeyboardInputFollowedByContinueOccurredForLanguage:]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v3)
    v5 = v3;
  else
    v5 = CFSTR("unknown");
  objc_msgSend(CFSTR("com.apple.siri.KeyboardEntryFollowedByContinue."), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

}

+ (void)logUILockCanceledVTActivation
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "+[AFAggregator logUILockCanceledVTActivation]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.VTActivationCancel.UILocked"), 1);
}

+ (void)logCreateAssistant
{
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.CreateAssistant"), 1);
  AnalyticsSendEvent();
}

+ (void)logLoadAssistant
{
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.LoadAssistant"), 1);
  AnalyticsSendEvent();
}

+ (void)logPingTimeout
{
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.PingTimeout"), 1);
}

+ (void)logEnabledState:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "+[AFAggregator logEnabledState:]";
    v12 = 2048;
    v13 = a3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %tu", buf, 0x16u);
  }
  if ((a3 & 2) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v8[0] = CFSTR("com.apple.message.siri.enabled");
  v8[1] = CFSTR("com.apple.message.dictation.enabled");
  if ((a3 & 4) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v9[0] = v5;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

+ (void)logLocalRecognitionAssetEvictedForLanguage:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "+[AFAggregator logLocalRecognitionAssetEvictedForLanguage:]";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(CFSTR("com.apple.siri.LocalRecognitionAssetEvicted."), "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);

}

+ (void)logLocalSpeechStartedWithDuration:(double)a3
{
  _AFAggregatorClientPushValueForDistributionKey((uint64_t)CFSTR("com.apple.siri.LocalRecognitionStarted"), a3);
}

+ (void)logLocalFinalSpeechRecognitionWithDuration:(double)a3
{
  _AFAggregatorClientPushValueForDistributionKey((uint64_t)CFSTR("com.apple.siri.LocalRecognitionSucceeded"), a3);
}

+ (void)logLocalRecognitionLoadedForLanguage:(id)a3 duration:(double)a4
{
  id v5;

  if (a3)
  {
    objc_msgSend(CFSTR("com.apple.siri.LocalRecognitionLoaded."), "stringByAppendingString:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientPushValueForDistributionKey((uint64_t)v5, a4);

  }
}

+ (void)logLocalRecognitionWonForLanguage:(id)a3
{
  id v3;

  if (a3)
  {
    objc_msgSend(CFSTR("com.apple.siri.LocalRecognitionWon."), "stringByAppendingString:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);

  }
}

+ (void)logLocalRecognitionLostForLanguage:(id)a3
{
  id v3;

  if (a3)
  {
    objc_msgSend(CFSTR("com.apple.siri.LocalRecognitionLost."), "stringByAppendingString:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v3, 1);

  }
}

+ (void)logDESRecordingForLanguage:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  if (a3)
  {
    v8 = v5;
    objc_msgSend(CFSTR("com.apple.siri.DESRecording."), "stringByAppendingString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%ld"), objc_msgSend(v8, "code"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

    v5 = v8;
  }

}

+ (void)logDESEvaluationForLanguage:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  if (a3)
  {
    v8 = v5;
    objc_msgSend(CFSTR("com.apple.siri.DESEvaluation."), "stringByAppendingString:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%ld"), objc_msgSend(v8, "code"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    _AFAggregatorClientAddValueForScalarKey((uint64_t)v6, 1);

    v5 = v8;
  }

}

+ (void)logCDMAssetEvictedForAssetType:(id)a3 language:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "+[AFAggregator logCDMAssetEvictedForAssetType:language:]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  objc_msgSend(CFSTR("com.apple.siri.CDMAssetEvicted."), "stringByAppendingFormat:", CFSTR("%@-%@"), v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v8, 1);

}

- (void)recordSuccessForConnectionType:(unint64_t)a3 isWarm:(BOOL)a4 forTimeInterval:(double)a5
{
  _BOOL4 v6;
  __CFString *Mutable;
  const char *v9;
  const char *v10;
  double v11;

  v6 = a4;
  Mutable = CFStringCreateMutable(0, 52);
  CFStringAppendCString(Mutable, "com.apple.siri.", 0x600u);
  if (v6)
    v9 = "";
  else
    v9 = "Cold.";
  CFStringAppendCString(Mutable, v9, 0x600u);
  if (a3 - 1 > 8)
    v10 = "Unknown.";
  else
    v10 = off_1E3A34398[a3 - 1];
  CFStringAppendCString(Mutable, v10, 0x600u);
  v11 = 0.0;
  if (a5 >= 0.0)
    v11 = a5;
  if (v11 > 10.0)
    v11 = 10.0;
  CFStringAppendCString(Mutable, off_1E3A34340[v11], 0x600u);
  _AFAggregatorClientAddValueForScalarKey((uint64_t)Mutable, 1);
  CFRelease(Mutable);
}

- (void)recordFailure:(int)a3 forConnectionType:(unint64_t)a4
{
  __CFString *Mutable;
  const char *v7;
  const char *v8;

  Mutable = CFStringCreateMutable(0, 31);
  CFStringAppendCString(Mutable, "com.apple.siri.", 0x600u);
  if (a4 - 1 > 8)
    v7 = "Unknown.";
  else
    v7 = off_1E3A34398[a4 - 1];
  CFStringAppendCString(Mutable, v7, 0x600u);
  if (a3)
    v8 = "Dropped";
  else
    v8 = "Failed";
  CFStringAppendCString(Mutable, v8, 0x600u);
  _AFAggregatorClientAddValueForScalarKey((uint64_t)Mutable, 1);
  CFRelease(Mutable);
}

- (void)recordSessionRetrySuccess
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("YES");
    if (!self->_retryPrefersWWAN)
      v4 = CFSTR("NO");
    v5 = 136315394;
    v6 = "-[AFAggregator recordSessionRetrySuccess]";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s WWAN fallback %@", (uint8_t *)&v5, 0x16u);
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.RetrySuccess"), 1);
  if (self->_retryPrefersWWAN)
    _AFAggregatorClientAddValueForScalarKey((uint64_t)CFSTR("com.apple.siri.WWAN.FallbackSuccess"), 1);
}

- (void)connectionDidFail
{
  if (self->_hasActiveRequest && !self->_sessionIsRetrying)
    -[AFAggregator recordFailure:forConnectionType:](self, "recordFailure:forConnectionType:", 0, self->_type);
}

- (void)connectionDidDrop
{
  if (self->_hasActiveRequest && !self->_sessionIsRetrying)
    -[AFAggregator recordFailure:forConnectionType:](self, "recordFailure:forConnectionType:", 1, self->_type);
}

- (void)beginSessionRetryPreferringWWAN:(BOOL)a3
{
  self->_sessionIsRetrying = 1;
  self->_retryPrefersWWAN = a3;
}

- (void)startWaitingForSpeechResponse
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_sessionIsRetrying = 0;
}

- (void)speechResponseReceived
{
  -[AFAggregator recordSuccessForConnectionType:isWarm:forTimeInterval:](self, "recordSuccessForConnectionType:isWarm:forTimeInterval:", self->_type, speechResponseReceived_sIsWarm, CFAbsoluteTimeGetCurrent() - self->_startTime);
  speechResponseReceived_sIsWarm = 1;
  if (self->_sessionIsRetrying)
  {
    -[AFAggregator recordSessionRetrySuccess](self, "recordSessionRetrySuccess");
    self->_sessionIsRetrying = 0;
  }
}

- (unint64_t)connectionType
{
  return self->_type;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)hasActiveRequest
{
  return self->_hasActiveRequest;
}

- (void)setHasActiveRequest:(BOOL)a3
{
  self->_hasActiveRequest = a3;
}

+ (void)logTimeToBeepWithDuration:(double)a3
{
  _AFAggregatorClientPushValueForDistributionKey((uint64_t)CFSTR("com.apple.siri.BeepBringUp.HomeButton"), a3);
}

+ (void)logHomeButtonPressToActivationDuration:(double)a3
{
  _AFAggregatorClientPushValueForDistributionKey((uint64_t)CFSTR("com.apple.siri.PressToActivationDuration.HomeButton"), a3);
}

+ (void)logStarkGatekeeperDismissedManuallyForType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stringForGatekeeperType:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    objc_msgSend(CFSTR("com.apple.siri.Car.GateKeeper.Dismissed.Manual"), "stringByAppendingFormat:", CFSTR(".%@"), v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("com.apple.siri.Car.GateKeeper.Dismissed.Manual");
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);
  v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "+[AFAggregator(AssistantUI) logStarkGatekeeperDismissedManuallyForType:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s logged for key: %@", buf, 0x16u);
  }

}

+ (void)logStarkGatekeeperAppearedForType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stringForGatekeeperType:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    objc_msgSend(CFSTR("com.apple.siri.Car.GateKeeper.Appeared"), "stringByAppendingFormat:", CFSTR(".%@"), v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("com.apple.siri.Car.GateKeeper.Appeared");
  }
  _AFAggregatorClientAddValueForScalarKey((uint64_t)v5, 1);
  v6 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "+[AFAggregator(AssistantUI) logStarkGatekeeperAppearedForType:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s logged for key: %@", buf, 0x16u);
  }

}

+ (id)_stringForGatekeeperType:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_1E3A343F8[a3];
}

@end
