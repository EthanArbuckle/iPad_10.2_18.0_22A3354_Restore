@implementation iOSSetupBaseViewController

- (void)dismissWithType:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  int v17;

  v3 = *(_QWORD *)&a3;
  if (-[SVSCardContainerView swipeDismissible](self->super._containerView, "swipeDismissible"))
  {
    objc_msgSend(self->super._mainController, "dismiss:", v3);
  }
  else
  {
    v5 = sub_1001171A8(CFSTR("Localizable"), CFSTR("EXIT_SETUP_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = sub_1001171A8(CFSTR("Localizable"), CFSTR("EXIT_SETUP_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1));
    v10 = sub_1001171A8(CFSTR("Localizable"), CFSTR("CANCEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 1, &stru_10017D500));
    objc_msgSend(v9, "addAction:", v12);
    v13 = sub_1001171A8(CFSTR("Localizable"), CFSTR("EXIT_SETUP_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000E66FC;
    v16[3] = &unk_10017D528;
    v16[4] = self;
    v17 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v16));

    objc_msgSend(v9, "addAction:", v15);
    objc_msgSend(v9, "setPreferredAction:", v15);
    -[iOSSetupBaseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

@end
