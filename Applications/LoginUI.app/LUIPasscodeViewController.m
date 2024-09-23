@implementation LUIPasscodeViewController

- (LUIPasscodeViewController)initWithPasscodeView:(id)a3
{
  id v5;
  LUIPasscodeViewController *v6;
  LUIPasscodeViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LUIPasscodeViewController;
  v6 = -[LUIPasscodeViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPasscodeViewController view](v6, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_storeStrong((id *)&v7->_passcodeView, a3);
    -[LUIPasscodeView setPasscodeDelegate:](v7->_passcodeView, "setPasscodeDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[LUIPasscodeViewController invalidateAndNilTimer](self, "invalidateAndNilTimer");
  v3.receiver = self;
  v3.super_class = (Class)LUIPasscodeViewController;
  -[LUIPasscodeViewController dealloc](&v3, "dealloc");
}

- (void)invalidateAndNilTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)checkForUserBackOff
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  double v13;
  _QWORD block[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allUsers"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPasscodeViewController userInfo](self, "userInfo"));
        v11 = objc_msgSend(v9, "isEqualToUser:", v10);

        if ((v11 & 1) != 0)
        {
          v12 = v9;

          if (v12)
          {
            objc_msgSend(v12, "passcodeBackOffInterval");
            if (v13 > 0.0)
            {
              -[LUIPasscodeViewController beginBackOffForSeconds:](self, "beginBackOffForSeconds:");
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100017BD4;
              block[3] = &unk_100068C58;
              block[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
          }
          goto LABEL_13;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = 0;
LABEL_13:

}

- (id)backOffMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PASSCODE_BACKOFF_WARNING"), &stru_100069EB8, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter minuteStringForMinutes:](NSDateComponentsFormatter, "minuteStringForMinutes:", self->_backOffMinutes));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  return v6;
}

- (void)beginBackOffForSeconds:(double)a3
{
  double v5;
  NSTimer *v6;
  NSTimer *timer;

  -[LUIPasscodeViewController invalidateAndNilTimer](self, "invalidateAndNilTimer");
  v5 = fmod(a3, 60.0);
  if (v5 == 0.0)
    v5 = 60.0;
  self->_backOffMinutes = ceil(a3 / 60.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "decrementBackOffMinutes:", 0, 0, v5));
  timer = self->_timer;
  self->_timer = v6;

  -[NSTimer fire](self->_timer, "fire");
}

- (void)decrementBackOffMinutes:(id)a3
{
  double v4;
  void *v5;
  NSTimer *v6;
  NSTimer *timer;
  id v8;
  _QWORD v9[5];
  id v10;

  -[LUIPasscodeViewController invalidateAndNilTimer](self, "invalidateAndNilTimer", a3);
  v4 = self->_backOffMinutes + -1.0;
  self->_backOffMinutes = v4;
  if (v4 >= 1.0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPasscodeViewController backOffMessage](self, "backOffMessage"));
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "decrementBackOffMinutes:", 0, 0, 60.0));
    timer = self->_timer;
    self->_timer = v6;

  }
  else
  {
    v5 = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100017E60;
  v9[3] = &unk_100068C30;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  LUIPasscodeViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "passcodeLockViewCancelButtonPressed:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "passcodeLockViewCancelButtonPressed:", v10);

    }
  }

}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id v4;
  LUIPasscodeViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  _QWORD block[5];

  v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017FE4;
  block[3] = &unk_100068C58;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector(v8, "passcodeLockViewCancelButtonPressed:");

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "passcodeLockViewPasscodeEntered:", v4);

    }
  }

}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  LUIPasscodeViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "passcodeLockViewPasscodeDidChange:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "passcodeLockViewPasscodeDidChange:", v10);

    }
  }

}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  LUIPasscodeViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector(v7, "passcodeLockViewEmergencyCallButtonPressed:");

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "passcodeLockViewEmergencyCallButtonPressed:", v10);

    }
  }

}

- (void)presentAlertForErrorTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018290;
  v13[3] = &unk_100068C08;
  v8 = v5;
  v14 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v7, 0, v13));

  objc_msgSend(v8, "addAction:", v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182A0;
  block[3] = &unk_100068C30;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)passcodeVerificationFailedWithErrorMessage:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001839C;
  v4[3] = &unk_100068C30;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (UMUser)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (LUIPasscodeViewControllerDelegate)delegate
{
  return (LUIPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
}

@end
