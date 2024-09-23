@implementation LUIGettingReadyViewController

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyleForLoggedInState](LUIStyle, "sharedStyleForLoggedInState"));
  v3 = objc_msgSend(v2, "statusBarStyle");

  return (int64_t)v3;
}

- (void)viewDidLoad
{
  LUIDashBoardView *v3;
  void *v4;
  LUIDashBoardView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LUIGettingReadyViewController;
  -[LUIGettingReadyViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = [LUIDashBoardView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = -[LUIDashBoardView initWithFrame:](v3, "initWithFrame:");

  -[LUIDashBoardView setGettingReadyViewEnabled:](v5, "setGettingReadyViewEnabled:", 1);
  -[LUIDashBoardView setUser:isTemporarySession:](v5, "setUser:isTemporarySession:", self->_user, -[LUIGettingReadyViewController isTemporarySession](self, "isTemporarySession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyleForLoggedInState](LUIStyle, "sharedStyleForLoggedInState"));
  -[LUIDashBoardView applyStyle:](v5, "applyStyle:", v6);

  -[LUIDashBoardView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  if (-[LUIGettingReadyViewController isTemporarySession](self, "isTemporarySession"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TEMPORARY_SESSION_WARNING"), &stru_100069EB8, 0));
    -[LUIDashBoardView setSubtitleString:](v5, "setSubtitleString:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", v5);

  -[LUIGettingReadyViewController setGettingReadyToSwitchView:](self, "setGettingReadyToSwitchView:", v5);
  -[LUIGettingReadyViewController _updateGettingReadyToSwitchViewTitle](self, "_updateGettingReadyToSwitchViewTitle");
  SBSSetAllApplicationsShowProgress(0, 100);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIGettingReadyViewController;
  -[LUIGettingReadyViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController displayAnimationCompletionBlock](self, "displayAnimationCompletionBlock"));

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000059AC;
    v5[3] = &unk_100068C58;
    v5[4] = self;
    BSRunLoopPerformAfterCACommit(v5);
  }
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)_updateGettingReadyToSwitchViewTitle
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController gettingReadyToSwitchView](self, "gettingReadyToSwitchView"));

  if (v3)
  {
    v4 = -[LUIGettingReadyViewController titleType](self, "titleType");
    if (v4 == 1)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController gettingReadyToSwitchView](self, "gettingReadyToSwitchView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOGGING_OUT"), &stru_100069EB8, 0));
      objc_msgSend(v8, "setGettingReadyString:", v6);
      goto LABEL_7;
    }
    if (!v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController gettingReadyToSwitchView](self, "gettingReadyToSwitchView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController user](self, "user"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "languages"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUIGettingReadyViewController localizedStringForKey:forLanguages:](self, "localizedStringForKey:forLanguages:", CFSTR("GETTING_READY_TITLE"), v6));
      objc_msgSend(v8, "setGettingReadyString:", v7);

LABEL_7:
    }
  }
}

- (id)localizedStringForKey:(id)a3 forLanguages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "length") || !objc_msgSend(v6, "count"))
    goto LABEL_8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v8, v6));
  if (objc_msgSend(v9, "count")
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0)),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), 0, v10)), v10, v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v5));

  }
  else
  {
    v13 = 0;
  }

  if (!v13)
  {
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));

  }
  return v13;
}

- (void)setTitleType:(unint64_t)a3
{
  if (self->_titleType != a3)
  {
    self->_titleType = a3;
    -[LUIGettingReadyViewController _updateGettingReadyToSwitchViewTitle](self, "_updateGettingReadyToSwitchViewTitle");
  }
}

- (BOOL)shouldSetIdleTimerAsIfLocked
{
  return 0;
}

- (BOOL)shouldAllowUIUpdate
{
  return 0;
}

- (BOOL)suppressesWiFiPicker
{
  return 1;
}

- (UMUser)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
  objc_storeStrong((id *)&self->_user, a3);
}

- (BOOL)isTemporarySession
{
  return self->_isTemporarySession;
}

- (void)setIsTemporarySession:(BOOL)a3
{
  self->_isTemporarySession = a3;
}

- (id)displayAnimationCompletionBlock
{
  return self->_displayAnimationCompletionBlock;
}

- (void)setDisplayAnimationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)titleType
{
  return self->_titleType;
}

- (LUIDashBoardView)gettingReadyToSwitchView
{
  return self->_gettingReadyToSwitchView;
}

- (void)setGettingReadyToSwitchView:(id)a3
{
  objc_storeStrong((id *)&self->_gettingReadyToSwitchView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gettingReadyToSwitchView, 0);
  objc_storeStrong(&self->_displayAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
