@implementation SSSWaitingForImageIdentifierUpdatesAlertController

+ (id)newWaitingForImageIdentifierUpdatesAlertController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  SSSWaitingForImageIdentifierUpdatesAlertContentViewController *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PREPARING_TO_SHARE_ALERT_TITLE"), CFSTR("Preparing..."), 0));
  objc_msgSend(v2, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PREPARING_TO_SHARE_ALERT_CANCEL_BUTTON"), CFSTR("Cancel"), 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B89C;
  v12[3] = &unk_100092380;
  v7 = v2;
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 1, v12));
  objc_msgSend(v7, "addAction:", v8);
  v9 = objc_alloc_init(SSSWaitingForImageIdentifierUpdatesAlertContentViewController);
  objc_msgSend(v7, "setContentViewController:", v9);
  v10 = v7;

  return v10;
}

- (id)_waitingContentViewController
{
  return -[SSSWaitingForImageIdentifierUpdatesAlertController contentViewController](self, "contentViewController");
}

- (void)setProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertController _waitingContentViewController](self, "_waitingContentViewController"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SSSWaitingForImageIdentifierUpdatesAlertControllerDelegate)delegate
{
  return (SSSWaitingForImageIdentifierUpdatesAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
