@implementation SiriEyesFreePresentation

- (SiriEyesFreePresentation)initWithCoder:(id)a3
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:](self, "initWithNibName:bundle:delegate:dataSource:", 0, 0, 0, 0);
}

- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:](self, "initWithNibName:bundle:delegate:dataSource:", a3, a4, 0, 0);
}

- (SiriEyesFreePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  return -[SiriEyesFreePresentation initWithNibName:bundle:delegate:dataSource:](self, "initWithNibName:bundle:delegate:dataSource:", 0, 0, a3, a4);
}

- (SiriEyesFreePresentation)initWithNibName:(id)a3 bundle:(id)a4 delegate:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  SiriEyesFreePresentation *v12;
  SiriEyesFreePresentation *v13;
  SRSuggestionsViewController *v14;
  SRSuggestionsViewController *siriUnavailableViewController;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SiriEyesFreePresentation;
  v12 = -[SiriEyesFreePresentation initWithNibName:bundle:](&v17, "initWithNibName:bundle:", a3, a4);
  v13 = v12;
  if (v12)
  {
    -[SiriEyesFreePresentation setDelegate:](v12, "setDelegate:", v10);
    -[SiriEyesFreePresentation setDataSource:](v13, "setDataSource:", v11);
    v13->_numberOfSpeechRequestsWaitingToFinishSynthesis = 0;
    v14 = objc_alloc_init(SRSuggestionsViewController);
    siriUnavailableViewController = v13->_siriUnavailableViewController;
    v13->_siriUnavailableViewController = v14;

    -[SRSuggestionsViewController setDelegate:](v13->_siriUnavailableViewController, "setDelegate:", v13);
  }

  return v13;
}

- (void)configureForRequestOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  id v17;

  v4 = +[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState", a3);
  if (v4)
  {
    v6 = v4;
    *(_QWORD *)&v7 = objc_opt_class(self, v5).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v8, v7));
    if (v6 != (id)2)
    {
      v17 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
      objc_msgSend(v10, "showEmptyView");

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "siriUILocalizedStringForKey:", CFSTR("ASSISTANT_NOT_AVAILABLE_TITLE")));
      -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v11);

      if (v6 == (id)3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v15 = objc_msgSend(v14, "sf_isChinaRegionCellularDevice");

        if (v15)
          v16 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION_CHINA");
        else
          v16 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "siriUILocalizedStringForKey:", v16));
        goto LABEL_11;
      }
      v9 = v17;
      if (v6 == (id)1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities deviceSpecificKeyForDefaultKey:](SiriUIUtilities, "deviceSpecificKeyForDefaultKey:", CFSTR("ASSISTANT_NO_NETWORK_SUBTITLE_NOTIFICATION")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "siriUILocalizedStringForKey:", v12));

LABEL_11:
        -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v13);

        v9 = v17;
      }
    }

  }
}

- (int64_t)options
{
  return 1;
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SiriEyesFreePresentation siriWillShowPasscodeUnlockAndCancelRequest:]";
    v7 = 2048;
    v8 = 0x4020000000000000;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #eyesfree Passcode screen is showing, will timeout in %f", (uint8_t *)&v5, 0x16u);
  }
  -[SiriEyesFreePresentation _dismissFromTimeoutAfterDelay:](self, "_dismissFromTimeoutAfterDelay:", 8.0);
}

- (void)_synthesizeSpeechWithText:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  ++self->_numberOfSpeechRequestsWaitingToFinishSynthesis;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006DBE8;
  v6[3] = &unk_100122638;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "siriPresentation:synthesizeSpeechWithText:completion:", self, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)conversation:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  -[SiriEyesFreePresentation _didPresentItemsAtIndexPaths:](self, "_didPresentItemsAtIndexPaths:", a4);
}

- (void)conversation:(id)a3 didUpdateItemsAtIndexPaths:(id)a4
{
  -[SiriEyesFreePresentation _didPresentItemsAtIndexPaths:](self, "_didPresentItemsAtIndexPaths:", a4);
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationIdentifiersForSiriPresentation:", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation dataSource](self, "dataSource"));
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

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  objc_msgSend(v18, "siriPresentation:didPresentConversationItemsWithIdentifiers:", self, v10);

}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)supportsTextInput
{
  return 0;
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  return 0;
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  +[SRTipKitSignalEmitter checkAndEmitSignalsForRequestOptions:](SRTipKitSignalEmitter, "checkAndEmitSignalsForRequestOptions:", a3);
}

- (void)didReceiveReportBugAction
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_msgSend(objc_alloc((Class)SKIDirectInvocationPayload), "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.RunVoiceShortcut.serverTriggeredAppShortcut"));
  objc_msgSend(v7, "setUserData:", &off_100128E20);
  v3 = objc_alloc_init((Class)SKIDirectInvocationContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v3, v7));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  objc_msgSend(v6, "siriPresentation:handleStartLocalRequest:turnIdentifier:", self, v5, 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SiriEyesFreePresentation;
  -[SiriEyesFreePresentation viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  -[SiriEyesFreePresentation addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "didMoveToParentViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation _siriUnavailableViewController](self, "_siriUnavailableViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation view](self, "view"));
  objc_msgSend(v9, "frame");
  objc_msgSend(v8, "setFrame:");

  if (+[AFUISiriSession availabilityState](AFUISiriSession, "availabilityState") == (id)2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle afui_assistantUIFrameworkBundle](NSBundle, "afui_assistantUIFrameworkBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "siriUILocalizedStringForKey:", CFSTR("ASSISTANT_FIRST_UNLOCK_TITLE")));

    -[SiriEyesFreePresentation _synthesizeSpeechWithText:](self, "_synthesizeSpeechWithText:", v11);
  }

}

- (CGRect)statusBarFrameForSuggestionsViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "statusBarFrameForSiriPresentation:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)statusViewHeightForSuggestionsViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "statusViewHeightForSiriPresentation:", self);
  v6 = v5;

  return v6;
}

- (double)contentWidthForSuggestionsViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate", a3));
  objc_msgSend(v4, "contentWidthForForSiriPresentation:", self);
  v6 = v5;

  return v6;
}

- ($5902F3589ABA92D8028CA1BE72F4BD0A)keyboardInfoForSuggestionsController:(SEL)a3
{
  CGSize size;

  *(_QWORD *)&retstr->var0 = 0;
  retstr->var1 = 1;
  size = CGRectZero.size;
  retstr->var3.origin = CGRectZero.origin;
  retstr->var3.size = size;
  retstr->var4 = 0.0;
  return self;
}

- (id)siriEnabledAppListForSuggestionsController:(id)a3
{
  return 0;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  uint64_t v7;
  unint64_t numberOfSpeechRequestsWaitingToFinishSynthesis;
  double v9;
  id v10;
  NSNumber *v11;
  NSNumber *delayDismissalMs;
  void *v13;
  NSNumber *v14;
  NSObject *v15;
  double v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  _QWORD v21[3];

  v4 = a3;
  if (a3 && !self->_numberOfSpeechRequestsWaitingToFinishSynthesis)
  {
    delayDismissalMs = self->_delayDismissalMs;
    if (delayDismissalMs && -[NSNumber longValue](delayDismissalMs, "longValue") >= 1)
    {
      v13 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_delayDismissalMs;
        v15 = v13;
        v18 = 136315394;
        v19 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        v20 = 2048;
        v21[0] = -[NSNumber longValue](v14, "longValue");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri is idle and quiet, but delaying dismissal for AutoSend for %ld milliseconds", (uint8_t *)&v18, 0x16u);

      }
      v16 = (double)-[NSNumber longValue](self->_delayDismissalMs, "longValue") / 1000.0;
    }
    else
    {
      v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri is idle and quiet. Dismissing immediately.", (uint8_t *)&v18, 0xCu);
      }
      v16 = 0.0;
    }
    -[SiriEyesFreePresentation _dismissFromTimeoutAfterDelay:](self, "_dismissFromTimeoutAfterDelay:", v16);
  }
  else
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      numberOfSpeechRequestsWaitingToFinishSynthesis = self->_numberOfSpeechRequestsWaitingToFinishSynthesis;
      v18 = 136315650;
      v19 = "-[SiriEyesFreePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
      v20 = 1024;
      LODWORD(v21[0]) = v4;
      WORD2(v21[0]) = 2048;
      *(_QWORD *)((char *)v21 + 6) = numberOfSpeechRequestsWaitingToFinishSynthesis;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Not dismissing and cancelling any previous ones, because we have either siriIsIdleAndQuiet %d, or %ld presentation generated speech requests in progress.", (uint8_t *)&v18, 0x1Cu);
    }
    *(_QWORD *)&v9 = objc_opt_class(self, v7).n128_u64[0];
    objc_msgSend(v10, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_dismissSiriPresentationFromTimeout", 0, v9);
  }
  v11 = self->_delayDismissalMs;
  self->_delayDismissalMs = 0;

}

- (void)delayDismissalAfterIdleFires:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = 136315394;
      v9 = "-[SiriEyesFreePresentation delayDismissalAfterIdleFires:]";
      v10 = 2048;
      v11 = objc_msgSend(v5, "longValue");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for auto send by %ld milliseconds.", (uint8_t *)&v8, 0x16u);

    }
    objc_storeStrong((id *)&self->_delayDismissalMs, a3);
  }

}

- (void)_dismissFromTimeoutAfterDelay:(double)a3
{
  double v5;
  id v6;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  objc_msgSend(v6, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_dismissSiriPresentationFromTimeout", 0, v5);
  -[SiriEyesFreePresentation performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_dismissSiriPresentationFromTimeout", 0, a3);
}

- (void)_dismissSiriPresentationFromTimeout
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SiriEyesFreePresentation delegate](self, "delegate"));
  objc_msgSend(v3, "dismissSiriPresentation:withReason:", self, 4);

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

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SRSuggestionsViewController)_siriUnavailableViewController
{
  return self->_siriUnavailableViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriUnavailableViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_delayDismissalMs, 0);
}

@end
