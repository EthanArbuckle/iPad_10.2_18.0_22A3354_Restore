@implementation SRCompactAutoDismissController

- (SRCompactAutoDismissController)initWithDelegate:(id)a3 andLockState:(unint64_t)a4
{
  char v4;
  id v6;
  SRCompactAutoDismissController *v7;
  SRCompactAutoDismissController *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCompactAutoDismissController;
  v7 = -[SRCompactAutoDismissController init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_autoDismissalReason = 0;
    objc_storeWeak((id *)&v7->_delegate, v6);
    qword_100151110 = 3;
    v8->_passcodeLocked = (v4 & 2) != 0;
    v8->_timerScheduledForTouchOutsideOfSiri = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "_handleVideoPlaybackDidStartNotification", SiriUIVideoPlaybackDidStartNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v8, "_handleVideoPlaybackDidFinishNotification", SiriUIVideoPlaybackDidFinishNotification, 0);

    -[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:](v8, "scheduleAutoDismissalForLongIdling:", 900.0);
  }

  return v8;
}

- (SRCompactAutoDismissController)initWithDelegate:(id)a3
{
  return -[SRCompactAutoDismissController initWithDelegate:andLockState:](self, "initWithDelegate:andLockState:", a3, 0);
}

- (void)siriResponseModeDidChange:(unint64_t)a3 isWiredMicOrBTHeadsetOrWx:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  NSObject *v8;
  uint64_t Name;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  SRCompactAutoDismissController *v18;
  id v19[2];
  BOOL v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v4 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    Name = MDModeGetName(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_passcodeLocked));
    *(_DWORD *)buf = 136315906;
    v22 = "-[SRCompactAutoDismissController siriResponseModeDidChange:isWiredMicOrBTHeadsetOrWx:]";
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Updating auto dismissal strategy with mode=%@, isWiredMicOrBTHeadsetOrWx: %@, passcodeLocked: %@", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v13 = &_dispatch_main_q;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100016D7C;
  v17 = &unk_100122AF0;
  v19[1] = (id)a3;
  v18 = self;
  v20 = v4;
  objc_copyWeak(v19, (id *)buf);
  sub_100016608(&_dispatch_main_q, &v14);

  -[SRCompactAutoDismissController _startUserAttentionControllerIfNeededForTypes:](self, "_startUserAttentionControllerIfNeededForTypes:", 2, v14, v15, v16, v17, v18);
  -[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:](self, "scheduleAutoDismissalForLongIdling:", 900.0);
  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);
}

- (void)startAutoDismissalAttentionController
{
  -[SRCompactAutoDismissController _startUserAttentionControllerIfNeeded](self, "_startUserAttentionControllerIfNeeded");
}

- (void)updateMinimumIdleTimeInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;

  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SRCompactAutoDismissController updateMinimumIdleTimeInterval:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Updating minimum idle interval to %.0f s", (uint8_t *)&v7, 0x16u);
  }
  -[SRCompactAutoDismissController setMinimumIdleTimeInterval:](self, "setMinimumIdleTimeInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactAutoDismissController _autoDismissalStrategy](self, "_autoDismissalStrategy"));
  objc_msgSend(v6, "setMinimumIdleTimeInterval:", a3);

}

- (void)setUseExtendedTimeout:(BOOL)a3
{
  SUICAutoDismissalStrategy *autoDismissalStrategy;

  self->_useExtendedTimeout = a3;
  autoDismissalStrategy = self->_autoDismissalStrategy;
  if (a3)
  {
    -[SUICAutoDismissalStrategy setViewRequiringExtendedTimeoutVisible:](autoDismissalStrategy, "setViewRequiringExtendedTimeoutVisible:", 1);
    -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
    -[SRCompactAutoDismissController _startUserAttentionControllerIfNeeded](self, "_startUserAttentionControllerIfNeeded");
  }
  else
  {
    -[SUICAutoDismissalStrategy setViewRequiringExtendedTimeoutVisible:](autoDismissalStrategy, "setViewRequiringExtendedTimeoutVisible:");
    -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
  }
}

- (void)invalidate
{
  -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
  -[SRCompactAutoDismissController _cancelScheduledAutoDismissalForLongIdlingIfNeeded](self, "_cancelScheduledAutoDismissalForLongIdlingIfNeeded");
  -[SRCompactAutoDismissController cancelAutoDismissalForTouchOutsideOfSiri](self, "cancelAutoDismissalForTouchOutsideOfSiri");
}

- (void)scheduleAutoDismissalForLongIdling:(double)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;

  -[SRCompactAutoDismissController _cancelScheduledAutoDismissalForLongIdlingIfNeeded](self, "_cancelScheduledAutoDismissalForLongIdlingIfNeeded");
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Scheduling auto dismissal after a max idle time of %.0f s", (uint8_t *)&v6, 0x16u);
  }
  -[SRCompactAutoDismissController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_dismissForLongIdling", 0, a3);
}

- (void)_cancelScheduledAutoDismissalForLongIdlingIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  double v5;
  id v6;
  int v7;
  const char *v8;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SRCompactAutoDismissController _cancelScheduledAutoDismissalForLongIdlingIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Canceling previously scheduled auto dismissal for long idling if needed", (uint8_t *)&v7, 0xCu);
  }
  *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
  objc_msgSend(v6, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_dismissForLongIdling", 0, v5);
}

- (void)_dismissForLongIdling
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRCompactAutoDismissController _dismissForLongIdling]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri has been long idling. Auto dismissing now...", (uint8_t *)&v5, 0xCu);
  }
  self->_autoDismissalReason = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoDismissControllerRequestsDismissal:", self);

}

- (void)scheduleAutoDismissalForTouchOutsideOfSiri:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  double v25;

  if ((AFDeviceSupportsSystemAssistantExperience(self, a2) & 1) != 0)
  {
    if (self->_timerScheduledForTouchOutsideOfSiri)
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        sub_10009D878(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else
    {
      -[SRCompactAutoDismissController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_dismissForTouchOutsideOfSiri", 0, a3);
      v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315394;
        v23 = "-[SRCompactAutoDismissController scheduleAutoDismissalForTouchOutsideOfSiri:]";
        v24 = 2048;
        v25 = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Scheduled auto-dismissal for touch outside of Siri in %.1f seconds", (uint8_t *)&v22, 0x16u);
      }
      self->_timerScheduledForTouchOutsideOfSiri = 1;
    }
  }
  else
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      sub_10009D8E8(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

- (void)cancelAutoDismissalForTouchOutsideOfSiri
{
  NSObject *v3;
  uint64_t v4;
  double v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;

  if ((AFDeviceSupportsSystemAssistantExperience(self, a2) & 1) != 0)
  {
    v3 = AFSiriLogContextConnection;
    if (self->_timerScheduledForTouchOutsideOfSiri)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315138;
        v23 = "-[SRCompactAutoDismissController cancelAutoDismissalForTouchOutsideOfSiri]";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Cancelling auto-dismissal for touch outside of Siri", (uint8_t *)&v22, 0xCu);
      }
      *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
      objc_msgSend(v6, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_dismissForTouchOutsideOfSiri", 0, v5);
      self->_timerScheduledForTouchOutsideOfSiri = 0;
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      sub_10009D958(v3, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      sub_10009D9C8(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

- (void)_dismissForTouchOutsideOfSiri
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRCompactAutoDismissController _dismissForTouchOutsideOfSiri]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto-dismissing now due to touch outside of Siri", (uint8_t *)&v5, 0xCu);
  }
  self->_autoDismissalReason = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoDismissControllerRequestsDismissal:", self);

}

- (void)_startUserAttentionControllerIfNeeded
{
  -[SRCompactAutoDismissController _startUserAttentionControllerIfNeededForTypes:](self, "_startUserAttentionControllerIfNeededForTypes:", 7);
}

- (void)_startUserAttentionControllerIfNeededForTypes:(unint64_t)a3
{
  SUICAutoDismissalStrategy *autoDismissalStrategy;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9[2];
  uint8_t buf[4];
  const char *v11;

  autoDismissalStrategy = self->_autoDismissalStrategy;
  if (autoDismissalStrategy
    && -[SUICAutoDismissalStrategy isVideoPlaying](autoDismissalStrategy, "isVideoPlaying"))
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SRCompactAutoDismissController _startUserAttentionControllerIfNeededForTypes:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #autodismiss User attention controller will not start because video is playing", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v7 = &_dispatch_main_q;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000176B4;
    v8[3] = &unk_100122B40;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = (id)a3;
    sub_100016608(&_dispatch_main_q, v8);

    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_stopUserAttentionControllerIfNeeded
{
  NSObject *v3;
  SRUserAttentionController *v4;
  uint64_t *p_userAttentionController;
  SRUserAttentionController *userAttentionController;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;

  -[SRCompactAutoDismissController _cancelDelayedUserAttentionControllerStop](self, "_cancelDelayedUserAttentionControllerStop");
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Stopping user attention controller if needed...", buf, 0xCu);
  }
  userAttentionController = self->_userAttentionController;
  p_userAttentionController = (uint64_t *)&self->_userAttentionController;
  v4 = userAttentionController;
  if (userAttentionController)
  {
    v11 = 0;
    v7 = -[SRUserAttentionController stopIfNeeded:](v4, "stopIfNeeded:", &v11);
    v8 = v11;
    if ((v7 & 1) == 0)
    {
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        sub_10009DB08(p_userAttentionController, (uint64_t)v8, v9);
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend((id)*p_userAttentionController, "setDelegate:", 0);
  v10 = (void *)*p_userAttentionController;
  *p_userAttentionController = 0;

}

- (void)_stopUserAttentionControllerIfNeededAfterDelay:(double)a3
{
  -[SRCompactAutoDismissController _cancelDelayedUserAttentionControllerStop](self, "_cancelDelayedUserAttentionControllerStop");
  -[SRCompactAutoDismissController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_stopUserAttentionControllerIfNeeded", 0, a3);
}

- (void)_cancelDelayedUserAttentionControllerStop
{
  double v3;
  id v4;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_stopUserAttentionControllerIfNeeded", 0, v3);
}

- (BOOL)_deviceSupportsFaceID
{
  if (qword_100150398 != -1)
    dispatch_once(&qword_100150398, &stru_100122B60);
  return byte_100150390;
}

- (BOOL)_ignoreUnintentionalTouches
{
  _BOOL8 v3;
  _BOOL8 v4;
  BOOL v5;
  _BOOL8 v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v3 = -[SRCompactAutoDismissController _deviceSupportsFaceID](self, "_deviceSupportsFaceID");
  v4 = v3;
  v5 = !self->_isWiredMicOrBTHeadsetOrWx || !v3;
  v6 = !v5 && !self->_faceDetected && !self->_useExtendedTimeout && self->_passcodeLocked;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isWiredMicOrBTHeadsetOrWx));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_faceDetected));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_useExtendedTimeout));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_passcodeLocked));
    v16 = 136316674;
    v17 = "-[SRCompactAutoDismissController _ignoreUnintentionalTouches]";
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s #autodismiss ignoreTouches: %@, isWiredMicOrBTHeadsetOrWx: %@, deviceSupportsFaceID: %@, faceDetected: %@, useExtendedTimeout: %@, passcodeLocked: %@", (uint8_t *)&v16, 0x48u);

  }
  return v6;
}

- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
  id v6;
  NSObject *v7;
  SUICAutoDismissalStrategy *autoDismissalStrategy;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  SUICAutoDismissalStrategy *v14;

  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    autoDismissalStrategy = self->_autoDismissalStrategy;
    v9 = 136315650;
    v10 = "-[SRCompactAutoDismissController userAttentionController:didLoseAttentionWithEvent:]";
    v11 = 2048;
    v12 = a4;
    v13 = 2112;
    v14 = autoDismissalStrategy;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Attention was lost with event=%zd, _autoDismissalStrategy=%@", (uint8_t *)&v9, 0x20u);
  }
  if (a4 == 2)
  {
    -[SUICAutoDismissalStrategy setLatestDeviceMotionEvent:](self->_autoDismissalStrategy, "setLatestDeviceMotionEvent:", 2);
  }
  else if (a4 == 1)
  {
    self->_faceDetected = 0;
    -[SUICAutoDismissalStrategy setLatestFaceAwarenessEvent:](self->_autoDismissalStrategy, "setLatestFaceAwarenessEvent:", 2);
  }

}

- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  id v6;
  NSObject *v7;
  SUICAutoDismissalStrategy *autoDismissalStrategy;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  SUICAutoDismissalStrategy *v15;

  v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    autoDismissalStrategy = self->_autoDismissalStrategy;
    v10 = 136315650;
    v11 = "-[SRCompactAutoDismissController userAttentionController:didGainAttentionWithEvent:]";
    v12 = 2048;
    v13 = a4;
    v14 = 2112;
    v15 = autoDismissalStrategy;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Attention was gained with event=%zd, _autoDismissalStrategy=%@", (uint8_t *)&v10, 0x20u);
  }
  switch(a4)
  {
    case 1:
      self->_faceDetected = 1;
      -[SUICAutoDismissalStrategy setLatestFaceAwarenessEvent:](self->_autoDismissalStrategy, "setLatestFaceAwarenessEvent:", 1);
      break;
    case 2:
      -[SUICAutoDismissalStrategy setLatestDeviceMotionEvent:](self->_autoDismissalStrategy, "setLatestDeviceMotionEvent:", 1);
      break;
    case 3:
      if (-[SRCompactAutoDismissController _ignoreUnintentionalTouches](self, "_ignoreUnintentionalTouches"))
      {
        v9 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315138;
          v11 = "-[SRCompactAutoDismissController userAttentionController:didGainAttentionWithEvent:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Ignoring touch interaction, reason: possibly an accidental touch during hearst request", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        -[SUICAutoDismissalStrategy setUserInteractedWithTouchScreen:](self->_autoDismissalStrategy, "setUserInteractedWithTouchScreen:", 1);
        -[SRCompactAutoDismissController _scheduleUserTouchInteractionTimeout](self, "_scheduleUserTouchInteractionTimeout");
      }
      break;
    case 4:
      -[SUICAutoDismissalStrategy setUserInteractedWithTouchIDSensor:](self->_autoDismissalStrategy, "setUserInteractedWithTouchIDSensor:", 1);
      break;
    default:
      break;
  }

}

- (void)_scheduleUserTouchInteractionTimeout
{
  -[SRCompactAutoDismissController _cancelUserTouchInteractionTimeout](self, "_cancelUserTouchInteractionTimeout");
  -[SRCompactAutoDismissController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_handleUserTouchInteractionTimeout", 0, 15.0);
}

- (void)_cancelUserTouchInteractionTimeout
{
  double v3;
  id v4;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_handleUserTouchInteractionTimeout", 0, v3);
}

- (void)_handleUserTouchInteractionTimeout
{
  NSObject *v3;

  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    sub_10009DB98(v3);
  -[SUICAutoDismissalStrategy setUserInteractedWithTouchScreen:](self->_autoDismissalStrategy, "setUserInteractedWithTouchScreen:", 0);
}

- (void)autoDismissalStrategyDidChangeAutoDismissalDecision:(id)a3 dismissalReason:(int64_t)a4 permanent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v5 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "shouldDismiss"))
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = SUICStringForAutoDismissalReason(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v15 = 136315650;
      v16 = "-[SRCompactAutoDismissController autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:]";
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto dismissal strategy (%@) specified that Siri should dismiss, reason: %@", (uint8_t *)&v15, 0x20u);

    }
    -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
    self->_autoDismissalReason = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoDismissControllerRequestsDismissal:", self);

  }
  else if (v5)
  {
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[SRCompactAutoDismissController autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:]";
      v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Auto dismissal strategy (%@) specified that Siri permanently stop auto dismissal", (uint8_t *)&v15, 0x16u);
    }
    -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
  }

}

- (void)_handleVideoPlaybackDidStartNotification
{
  -[SUICAutoDismissalStrategy setVideoPlaying:](self->_autoDismissalStrategy, "setVideoPlaying:", 1);
  -[SRCompactAutoDismissController _stopUserAttentionControllerIfNeeded](self, "_stopUserAttentionControllerIfNeeded");
}

- (void)_handleVideoPlaybackDidFinishNotification
{
  -[SUICAutoDismissalStrategy setVideoPlaying:](self->_autoDismissalStrategy, "setVideoPlaying:", 0);
  -[SRCompactAutoDismissController _startUserAttentionControllerIfNeeded](self, "_startUserAttentionControllerIfNeeded");
}

- (int64_t)autoDismissalReason
{
  return self->_autoDismissalReason;
}

- (void)setAutoDismissalReason:(int64_t)a3
{
  self->_autoDismissalReason = a3;
}

- (double)minimumIdleTimeInterval
{
  return self->_minimumIdleTimeInterval;
}

- (void)setMinimumIdleTimeInterval:(double)a3
{
  self->_minimumIdleTimeInterval = a3;
}

- (SRUserAttentionController)userAttentionController
{
  return (SRUserAttentionController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserAttentionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SUICAutoDismissalStrategy)_autoDismissalStrategy
{
  return self->_autoDismissalStrategy;
}

- (void)_setAutoDismissalStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_autoDismissalStrategy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissalStrategy, 0);
  objc_storeStrong((id *)&self->_userAttentionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
