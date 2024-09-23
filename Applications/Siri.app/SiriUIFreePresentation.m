@implementation SiriUIFreePresentation

- (SiriUIFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return -[SiriUIFreePresentation initWithNibName:bundle:delegate:dataSource:](self, "initWithNibName:bundle:delegate:dataSource:", 0, 0, a3, a4);
}

- (SiriUIFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v8;
  id v9;
  SiriUIFreePresentation *v10;
  SiriUIFreePresentation *v11;
  objc_super v13;

  v8 = a5;
  v9 = a6;
  v13.receiver = self;
  v13.super_class = (Class)SiriUIFreePresentation;
  v10 = -[SiriUIFreePresentation init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[SiriUIFreePresentation setDelegate:](v10, "setDelegate:", v8);
    -[SiriUIFreePresentation setDataSource:](v11, "setDataSource:", v9);
    v11->_idleTimeoutInSec = 6.0;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (!self->_hasReportedPresentation)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      objc_msgSend(v6, "siriPresentationDidPresentUserInterface:", self);

      v5 = obj;
      self->_hasReportedPresentation = 1;
    }
  }

}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  _BOOL4 shouldSuppressErrorTTS;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  _BOOL4 v29;

  v6 = +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState");
  if (v6 && !self->_shouldSuppressErrorTTS)
  {
    *(_QWORD *)&v9 = objc_opt_class(self, v5).n128_u64[0];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v10, v9));
    v12 = v11;
    if (v6 == (id)2)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle afui_assistantUIFrameworkBundle](NSBundle, "afui_assistantUIFrameworkBundle"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "siriUILocalizedStringForKey:value:table:", CFSTR("ASSISTANT_FIRST_UNLOCK_TITLE"), CFSTR("Enter Passcode to Use Siri"), 0));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "siriUILocalizedStringForKey:", CFSTR("ASSISTANT_NOT_AVAILABLE_TITLE")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      objc_msgSend(v15, "siriPresentation:synthesizeSpeechWithText:completion:", self, v13, 0);

      if (v6 == (id)3)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v18 = objc_msgSend(v17, "sf_isChinaRegionCellularDevice");

        if (v18)
          v16 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION_CHINA");
        else
          v16 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION");
      }
      else
      {
        if (v6 != (id)1)
        {
LABEL_15:
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
          objc_msgSend(v20, "siriPresentation:synthesizeSpeechWithText:completion:", self, v13, 0);

          goto LABEL_16;
        }
        v16 = CFSTR("ASSISTANT_NO_NETWORK_SUBTITLE");
      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "siriUILocalizedStringForKey:", v16));
    }
    v19 = (void *)v14;

    v13 = v19;
    goto LABEL_15;
  }
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    shouldSuppressErrorTTS = self->_shouldSuppressErrorTTS;
    v22 = 136315906;
    v23 = "-[SiriUIFreePresentation siriDidActivateFromSource:]";
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = v6;
    v28 = 1024;
    v29 = shouldSuppressErrorTTS;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Suppressing error TTS. source : %ld, availability : %lu, _shouldSuppressErrorTTS : %d", (uint8_t *)&v22, 0x26u);
  }
LABEL_16:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  objc_msgSend(v21, "enableIdleTimerForSiriPresentation:", self);

}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  self->_shouldResumeMediaOnIdle = 0;
  v4 = objc_msgSend(a3, "requestSource");
  if (v4 == (id)42 || v4 == (id)26)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[SiriUIFreePresentation siriRequestWillStartWithRequestOptions:]";
      v8 = 2048;
      v9 = 0x4000000000000000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #uifree Adjusting ui free idle timer to %f seconds for user interaction request source", (uint8_t *)&v6, 0x16u);
    }
    self->_idleTimeoutInSec = 2.0;
  }
  self->_shouldPauseAutoDismissal = 0;
}

- (void)siriDidDeactivate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  objc_msgSend(v3, "disableIdleTimerForSiriPresentation:", self);

}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v5 = a4;
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SiriUIFreePresentation conversation:didInsertItemsAtIndexPaths:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[SiriUIFreePresentation _didPresentItemsAtIndexPaths:](self, "_didPresentItemsAtIndexPaths:", v5);

}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
  -[SiriUIFreePresentation _didPresentItemsAtIndexPaths:](self, "_didPresentItemsAtIndexPaths:", a4);
}

- (void)_didPresentItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationIdentifiersForSiriPresentation:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "siriPresentation:conversationWithIdentifier:", self, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15), (_QWORD)v19));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        objc_msgSend(v10, "addObject:", v17);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  objc_msgSend(v18, "siriPresentation:didPresentConversationItemsWithIdentifiers:", self, v10);

}

- (double)idleTimerInterval
{
  return self->_idleTimeoutInSec;
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    if (objc_msgSend(v6, "premptivelyResumeMedia"))
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Presentation will resume media on idle", (uint8_t *)&v15, 0xCu);
      }
      self->_shouldResumeMediaOnIdle = 1;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minimumAutoDismissalTimeInMs"));

    if (v9)
    {
      v10 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minimumAutoDismissalTimeInMs"));
        v13 = objc_msgSend(v12, "longValue");
        v15 = 136315394;
        v16 = "-[SiriUIFreePresentation handleRequestEndBehavior:isAttending:]";
        v17 = 2048;
        v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for ui free presentation by %ld milliseconds.", (uint8_t *)&v15, 0x16u);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "minimumAutoDismissalTimeInMs"));
      self->_idleTimeoutInSec = (double)(uint64_t)objc_msgSend(v14, "longValue") / 1000.0;

    }
  }

}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  return self->_shouldResumeMediaOnIdle;
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;

  switch(a4)
  {
    case 13:
      v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech was mitigated as side speech, dismissing", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
      objc_msgSend(v7, "dismissSiriPresentation:withReason:", self, 46);

      break;
    case 12:
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech directed siri speech detected, unpausing auto dismissal", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 0;
      break;
    case 11:
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[SiriUIFreePresentation siriDidTransitionFromState:event:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #uifree Speech start detected, pausing auto dismissal", (uint8_t *)&v9, 0xCu);
      }
      self->_shouldPauseAutoDismissal = 1;
      break;
  }
}

- (BOOL)shouldDismissForIdling
{
  return !self->_shouldPauseAutoDismissal;
}

- (void)setShouldSuppressErrorTTS:(BOOL)a3
{
  self->_shouldSuppressErrorTTS = a3;
}

- (int64_t)options
{
  return 4;
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  return 0;
}

- (SiriUIPresentationDataSource)dataSource
{
  return (SiriUIPresentationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (SiriUIPresentationDelegate)delegate
{
  return (SiriUIPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
