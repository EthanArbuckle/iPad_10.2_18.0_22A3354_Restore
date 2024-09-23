@implementation SUICAutoDismissalStrategy

+ (SUICAutoDismissalStrategy)strategyWithMode:(unint64_t)a3 supportedAttentionAwarenessEvents:(unint64_t)a4 deviceSupportsRaiseGestureDetection:(BOOL)a5 isWiredMicOrBTHeadsetOrWx:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  unsigned int v8;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD *v17;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  uint64_t Name;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  objc_msgSend(v10, "autoDismissalIdleTimeout");
  v12 = v11;

  if (v6)
    v12 = 2.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  objc_msgSend(v13, "autoDismissalExtendedIdleTimeout");
  v15 = v14;

  v17 = SUICHandsOffAutoDismissalStrategy_ptr;
  if (a3 - 1 < 2)
  {
    if (!_os_feature_enabled_impl("Siri", "continuous_conversation"))
      v17 = SUICHandsOnAutoDismissalStrategy_ptr;
  }
  else if (a3 && a3 != 3)
  {
    v18 = 0;
    goto LABEL_10;
  }
  objc_opt_class(*v17, v16);
  v18 = v19;
LABEL_10:
  v20 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    Name = MDModeGetName(a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v25 = 136316418;
    v26 = "+[SUICAutoDismissalStrategy(ClassCluster) strategyWithMode:supportedAttentionAwarenessEvents:deviceSupportsRai"
          "seGestureDetection:isWiredMicOrBTHeadsetOrWx:]";
    v27 = 2112;
    v28 = v23;
    v29 = 2048;
    v30 = v12;
    v31 = 2048;
    v32 = v15;
    v33 = 1024;
    v34 = v7;
    v35 = 1024;
    v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s #autodismiss created autodismissal strategy for mode: %@, idleTimeout:  %.0f,  extendedIdleTimeout: %.0f, deviceSupportsFaceDetection: %i, deviceSupportsRaiseGestureDetection: %i", (uint8_t *)&v25, 0x36u);

  }
  return (SUICAutoDismissalStrategy *)objc_msgSend([v18 alloc], "initWithIdleTimeout:extendedIdleTimeout:deviceSupportsFaceDetection:deviceSupportsRaiseGestureDetection:", !v6 & (v8 >> 7), v7, v12, v15);
}

@end
