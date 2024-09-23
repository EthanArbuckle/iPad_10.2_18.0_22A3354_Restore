@implementation ChimeraLockViewController

- (ChimeraLockViewController)initWithComponent:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  ChimeraLockViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ChimeraLockViewController *v24;
  uint64_t v25;
  objc_super v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("iphone.slash")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CHIMERA_LOCK_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10));

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("LOST")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("ACTIVATION_LOST_DETAIL_TEXT");
LABEL_5:
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));

    v27.receiver = self;
    v27.super_class = (Class)ChimeraLockViewController;
    v19 = -[OBBoldSubtitleController initWithTitle:subtitle:detailText:icon:](&v27, "initWithTitle:subtitle:detailText:icon:", v13, 0, v18, v8);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_TITLE"), &stru_100014BA8, CFSTR("StartPreflightPlugin-Release")));
      objc_msgSend(v20, "setTitle:forState:", v22, 0);

      objc_msgSend(v20, "addTarget:action:forControlEvents:", v19, "_continueTapped", 64);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ChimeraLockViewController buttonTray](v19, "buttonTray"));
      objc_msgSend(v23, "addButton:", v20);

    }
    self = v19;
    v24 = self;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DENIED")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("CHIMERA_LOCK_DETAIL_TEXT");
    goto LABEL_5;
  }
  v25 = handleForCategory(0, v17);
  v18 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_10000CC50(v18);
  v24 = 0;
LABEL_11:

  return v24;
}

- (void)_continueTapped
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = handleForCategory(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ChimeraLockViewController _continueTapped]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChimeraLockViewController coordinator](self, "coordinator"));
  objc_msgSend(v5, "moveToNextViewController");

}

- (StartPreflightNavigationCoordinator)coordinator
{
  return (StartPreflightNavigationCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
