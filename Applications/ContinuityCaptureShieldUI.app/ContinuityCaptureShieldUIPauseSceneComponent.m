@implementation ContinuityCaptureShieldUIPauseSceneComponent

- (ContinuityCaptureShieldUIPauseSceneComponent)initWithScene:(id)a3
{
  id v4;
  ContinuityCaptureShieldUIPauseSceneComponent *v5;
  ContinuityCaptureShieldUIPauseSceneComponent *v6;
  void *v7;
  dispatch_source_t v8;
  OS_dispatch_source *debounceSource;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuityCaptureShieldUIPauseSceneComponent;
  v5 = -[ContinuityCaptureShieldUIPauseSceneComponent init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v6->_previousState = (int64_t)objc_msgSend(v4, "activationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUIPowerButtonStatus sharedInstance](ContinuityCaptureRemoteUIPowerButtonStatus, "sharedInstance"));
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v6, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 3, 0);

    v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    debounceSource = v6->_debounceSource;
    v6->_debounceSource = (OS_dispatch_source *)v8;

    objc_initWeak(&location, v6);
    v10 = v6->_debounceSource;
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1000069E8;
    v17 = &unk_100018678;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v10, &v14);
    dispatch_activate((dispatch_object_t)v6->_debounceSource);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v14, v15, v16, v17));
    WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, "sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, WeakRetained);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  ContinuityCaptureShieldUIPauseSceneComponent *v21;

  v10 = a3;
  v11 = a4;
  v12 = CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey;
  v13 = a5;
  if (objc_msgSend(v10, "isEqualToString:", v12))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

    if (objc_msgSend(v14, "BOOLValue"))
    {
      v15 = sub_100007074();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[ContinuityCaptureShieldUIPauseSceneComponent observeValueForKeyPath:ofObject:change:context:]";
        v20 = 2048;
        v21 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s: <%p> power button pressed, cancelling background timer", buf, 0x16u);
      }

      -[ContinuityCaptureShieldUIPauseSceneComponent _cancelCurrentDebounceTimer](self, "_cancelCurrentDebounceTimer");
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ContinuityCaptureShieldUIPauseSceneComponent;
    -[ContinuityCaptureShieldUIPauseSceneComponent observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v13, a6);
    v14 = v13;
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  ContinuityCaptureShieldUIPauseSceneComponent *v9;

  v4 = sub_100007074();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[ContinuityCaptureShieldUIPauseSceneComponent sceneDidEnterBackground:]";
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> scene entered background, recalculate pause state", (uint8_t *)&v6, 0x16u);
  }

  -[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState](self, "_recalculateState");
  -[ContinuityCaptureShieldUIPauseSceneComponent _cancelCurrentDebounceTimer](self, "_cancelCurrentDebounceTimer");
}

- (void)_sceneWillInvalidate:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUIPowerButtonStatus sharedInstance](ContinuityCaptureRemoteUIPowerButtonStatus, "sharedInstance", a3));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  int64_t v10;
  dispatch_time_t v11;

  v8 = sub_100007074();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10000BF10((uint64_t)self, a4, v9);

  self->_reasonsMask = a5;
  if (a4)
    v10 = 500000000;
  else
    v10 = 100000000;
  v11 = dispatch_time(0, v10);
  dispatch_source_set_timer((dispatch_source_t)self->_debounceSource, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_cancelCurrentDebounceTimer
{
  dispatch_source_set_timer((dispatch_source_t)self->_debounceSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_recalculateState
{
  int64_t previousState;
  id WeakRetained;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  ContinuityCaptureShieldUIPauseSceneComponent *v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  previousState = self->_previousState;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v5 = objc_msgSend(WeakRetained, "activationState");

  self->_previousState = (int64_t)v5;
  v6 = sub_100007074();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents(self->_reasonsMask);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v17 = 136316162;
    v18 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
    v19 = 2048;
    v20 = self;
    v21 = 2048;
    v22 = previousState;
    v23 = 2048;
    v24 = v5;
    v25 = 2112;
    v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: <%p> previousState:%zu currentState:%zu deactivationReasons:%@", (uint8_t *)&v17, 0x34u);

  }
  if (v5 != (id)previousState)
  {
    switch((unint64_t)v5)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
      case 2uLL:
        v10 = sub_100007074();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        v17 = 136315394;
        v18 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
        v19 = 2048;
        v20 = self;
        v12 = "%s: <%p> send pause event - backgrounded";
        goto LABEL_7;
      case 0uLL:
        v14 = sub_100007074();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315394;
          v18 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
          v19 = 2048;
          v20 = self;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: <%p> send resume event", (uint8_t *)&v17, 0x16u);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance](ContinuityCaptureShieldUIBackgroundPauseManager, "sharedInstance"));
        objc_msgSend(v13, "requestDefaultScreenResumeEvent:", 1);
        goto LABEL_12;
      case 1uLL:
        if (!-[ContinuityCaptureShieldUIPauseSceneComponent _shouldPauseForDeactivationReasonMask:](self, "_shouldPauseForDeactivationReasonMask:", self->_reasonsMask))return;
        v16 = sub_100007074();
        v11 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315394;
          v18 = "-[ContinuityCaptureShieldUIPauseSceneComponent _recalculateState]";
          v19 = 2048;
          v20 = self;
          v12 = "%s: <%p> send pause event - foregroundInactive";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0x16u);
        }
LABEL_8:

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureShieldUIBackgroundPauseManager sharedInstance](ContinuityCaptureShieldUIBackgroundPauseManager, "sharedInstance"));
        objc_msgSend(v13, "requestDefaultScreenPauseEvent:", 1);
LABEL_12:

        break;
      default:
        return;
    }
  }
}

- (BOOL)_shouldPauseForDeactivationReasonMask:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFCFCFLL) != 0;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_debounceSource, 0);
}

@end
