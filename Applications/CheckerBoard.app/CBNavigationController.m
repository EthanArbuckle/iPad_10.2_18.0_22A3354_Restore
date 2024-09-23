@implementation CBNavigationController

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = CheckerBoardLogHandleForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Navigation Controller's view loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBNavigationController;
  -[CBNavigationController viewDidLoad](&v5, "viewDidLoad");
  -[CBNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
}

- (BOOL)_usesTransitionController
{
  return 0;
}

- (id)_pushedViewControllerBackgroundColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  _BOOL4 v15;

  v4 = a4;
  v6 = a3;
  v7 = CheckerBoardLogHandleForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v6;
    v14 = 1024;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pushed view controller: %@ with animation %d", buf, 0x12u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBNavigationController _pushedViewControllerBackgroundColor](self, "_pushedViewControllerBackgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11.receiver = self;
  v11.super_class = (Class)CBNavigationController;
  -[CBNavigationController pushViewController:animated:](&v11, "pushViewController:animated:", v6, v4);

}

@end
