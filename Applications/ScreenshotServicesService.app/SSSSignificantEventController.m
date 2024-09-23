@implementation SSSSignificantEventController

+ (id)sharedSignificantEventController
{
  if (qword_1000AD768 != -1)
    dispatch_once(&qword_1000AD768, &stru_1000921D0);
  return (id)qword_1000AD760;
}

- (id)_runPPTServiceRequestForScreenshot:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appleInternalOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "runPPTServiceRequest"));

  return v5;
}

- (id)_runPPTServiceRequestForScreenshots:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSSSignificantEventController _runPPTServiceRequestForScreenshot:](self, "_runPPTServiceRequestForScreenshot:", v4));

  return v5;
}

- (void)_startRunPPTServiceRequest:(id)a3
{
  self->_isRunningScreenshotPPT = 1;
}

- (void)_finishRunPPTServiceRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "testName"));

  objc_msgSend(v5, "finishedIPTest:", v6);
  self->_isRunningScreenshotPPT = 0;
}

- (void)screenshotAppearAnimationBeganForScreenshot:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = _SSSignpostLog(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotAnimation", (const char *)&unk_10008BF43, buf, 2u);
  }

  v5 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "BEGIN \"ScreenshotAnimation\", v14, 2u);
  }

  v9 = _SSSignpostLog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotGestureToAnimationStart", (const char *)&unk_10008BF43, v13, 2u);
  }

  v11 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "END \"ScreenshotGestureToAnimationStart\", v12, 2u);
  }

}

- (void)screenshotAppearAnimationEndedForScreenshot:(id)a3 userInterface:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v10 = _SSSignpostLog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotAnimation", (const char *)&unk_10008BF43, buf, 2u);
  }

  v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "END \"ScreenshotAnimation\", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SSSSignificantEventController _runPPTServiceRequestForScreenshot:](self, "_runPPTServiceRequestForScreenshot:", v7));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testName"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("TakeScreenshot"));

    if (v15)
    {
      -[SSSSignificantEventController _finishRunPPTServiceRequest:](self, "_finishRunPPTServiceRequest:", v13);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testName"));
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ExpandToFullscreen"));

      if (v17)
      {
        -[SSSSignificantEventController _startRunPPTServiceRequest:](self, "_startRunPPTServiceRequest:", v13);
        objc_msgSend(v6, "significantEventControllerRequestsTransitionToStateForTest:", 1);
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "testName"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("GlitchFreeHero"));

        if (v19)
        {
          if (!self->_isRunningScreenshotPPT)
          {
            v20 = objc_msgSend(v6, "numberOfScreenshots");
            if (v20 >= objc_msgSend(v13, "numberOfRequiredScreenshots"))
            {
              -[SSSSignificantEventController _startRunPPTServiceRequest:](self, "_startRunPPTServiceRequest:", v13);
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_100025A88;
              v21[3] = &unk_100091B98;
              v21[4] = self;
              v22 = v13;
              sub_10000C088(v21);

            }
          }
        }
      }
    }
  }

}

- (void)screenshotUIWithScreenshots:(id)a3 beganStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  __int16 v22;
  uint8_t v23[16];
  __int16 v24;
  uint8_t buf[16];

  v7 = a3;
  v10 = v7;
  if (a4 != a5)
  {
    if (a4 == 1)
    {
      v20 = _SSSignpostLog(v7, v8, v9);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)v23 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPMiniaturize", (const char *)&unk_10008BF43, v23, 2u);
      }

      v17 = os_log_create("com.apple.screenshotservices", "Performance");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v22 = 0;
      v18 = "BEGIN \"ScreenshotPIPMiniaturize\";
      v19 = (uint8_t *)&v22;
      goto LABEL_12;
    }
    if (!a4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSSStatisticsManager sharedStatisticsManager](SSSStatisticsManager, "sharedStatisticsManager"));
      objc_msgSend(v11, "pipExpanded");

      v15 = _SSSignpostLog(v12, v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPExpand", (const char *)&unk_10008BF43, buf, 2u);
      }

      v17 = os_log_create("com.apple.screenshotservices", "Performance");
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v24 = 0;
      v18 = "BEGIN \"ScreenshotPIPExpand\";
      v19 = (uint8_t *)&v24;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, v19, 2u);
LABEL_13:

    }
  }

}

- (void)screenshotUIWithScreenshots:(id)a3 endedStateChangeFromState:(unint64_t)a4 toState:(unint64_t)a5 userInterface:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a6;
  v14 = v11;
  if (a4 != a5)
  {
    if (a4 == 1)
    {
      v21 = _SSSignpostLog(v11, v12, v13);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)v24 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPMiniaturize", (const char *)&unk_10008BF43, v24, 2u);
      }

      v18 = os_log_create("com.apple.screenshotservices", "Performance");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "END \"ScreenshotPIPMiniaturize\", v23, 2u);
      }
      goto LABEL_14;
    }
    if (!a4)
    {
      v15 = _SSSignpostLog(v11, v12, v13);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScreenshotPIPExpand", (const char *)&unk_10008BF43, buf, 2u);
      }

      v17 = os_log_create("com.apple.screenshotservices", "Performance");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "END \"ScreenshotPIPExpand\", v25, 2u);
      }

      v18 = objc_claimAutoreleasedReturnValue(-[SSSSignificantEventController _runPPTServiceRequestForScreenshots:](self, "_runPPTServiceRequestForScreenshots:", v10));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject testName](v18, "testName"));
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ExpandToFullscreen"));

      if (v20)
        -[SSSSignificantEventController _finishRunPPTServiceRequest:](self, "_finishRunPPTServiceRequest:", v18);
LABEL_14:

    }
  }

}

@end
