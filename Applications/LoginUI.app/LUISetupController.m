@implementation LUISetupController

+ (id)sharedController
{
  if (qword_100088DE8 != -1)
    dispatch_once(&qword_100088DE8, &stru_100069AE0);
  return (id)qword_100088DE0;
}

- (LUISetupController)init
{
  LUISetupController *v2;
  LUISetupController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUISetupController;
  v2 = -[LUISetupController init](&v5, "init");
  v3 = v2;
  if (v2)
    -[LUISetupController _setup](v2, "_setup");
  return v3;
}

- (void)_setup
{
  NSMutableArray *v3;
  NSMutableArray *notUpdatedRecentUsersViewControllers;
  NSMutableArray *v5;
  NSMutableArray *recentUsersViewControllers;

  v3 = objc_opt_new(NSMutableArray);
  notUpdatedRecentUsersViewControllers = self->_notUpdatedRecentUsersViewControllers;
  self->_notUpdatedRecentUsersViewControllers = v3;

  v5 = objc_opt_new(NSMutableArray);
  recentUsersViewControllers = self->_recentUsersViewControllers;
  self->_recentUsersViewControllers = v5;

}

- (void)updateRecentUsersViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController notUpdatedRecentUsersViewControllers](self, "notUpdatedRecentUsersViewControllers"));
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v5, "update");
    objc_msgSend(v4, "removeObject:", v5);
  }

}

- (void)_addNotUpdatedRecentUsersViewController:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController notUpdatedRecentUsersViewControllers](self, "notUpdatedRecentUsersViewControllers"));
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController notUpdatedRecentUsersViewControllers](self, "notUpdatedRecentUsersViewControllers"));
    objc_msgSend(v6, "addObject:", v7);

  }
}

- (void)addRecentUsersViewController:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsersViewControllers](self, "recentUsersViewControllers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsersViewControllers](self, "recentUsersViewControllers"));
    objc_msgSend(v7, "addObject:", v4);

    v8 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
      sub_10003C464(v8, (uint64_t)v4, self);
  }

}

- (void)removeRecentUsersViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsersViewControllers](self, "recentUsersViewControllers"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
    sub_10003C504(v6, (uint64_t)v4, self);

}

- (void)updateRecentUsersViewControllersIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BYTE *v24;
  uint8_t v25;
  _BYTE v26[7];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];

  v3 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
    sub_10003C700(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  if ((objc_msgSend(v8, "hasStudents") & 1) != 0)
  {

LABEL_6:
    v10 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
      sub_10003C65C(v10, self);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsersViewControllers](self, "recentUsersViewControllers"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      v24 = v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v17 = (void *)qword_100088F38;
          if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
            sub_10003C5D8(buf, v17, v16, &v32);
          -[LUISetupController _addNotUpdatedRecentUsersViewController:](self, "_addNotUpdatedRecentUsersViewController:", v16, v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topViewController"));

          if (v19 == (void *)v16)
          {
            v20 = qword_100088F38;
            if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
              sub_10003C5A4(&v25, v24, v20);
            -[LUISetupController updateRecentUsersViewController:](self, "updateRecentUsersViewController:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v13);
    }
    goto LABEL_25;
  }
  v9 = -[LUISetupController haveRecentUsers](self, "haveRecentUsers");

  if ((v9 & 1) != 0)
    goto LABEL_6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsersViewControllers](self, "recentUsersViewControllers"));
  objc_msgSend(v21, "removeAllObjects");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController notUpdatedRecentUsersViewControllers](self, "notUpdatedRecentUsersViewControllers"));
  objc_msgSend(v22, "removeAllObjects");

  v23 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Setting the view controller stack.", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v11, "setViewControllerStackAnimated:deferrable:", 1, 1);
LABEL_25:

}

- (NSMutableArray)viewControllerStack
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  LUIUserLoginPasswordViewController *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController rootViewController](self, "rootViewController"));
  -[NSMutableArray addObject:](v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v6 = objc_msgSend(v5, "isTemporarySessionOnly");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController viewControllerOnTopOfRootViewController](self, "viewControllerOnTopOfRootViewController"));
    if (v7)
      -[NSMutableArray addObject:](v3, "addObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsers](self, "recentUsers"));
    v9 = v8;
    if (v8)
    {
      v26 = v7;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "errorCausingLogout"));
            if (v16)
            {
              v17 = (void *)v16;
              v18 = objc_msgSend(v15, "hasManagedCredentials");

              if (v18)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "errorCausingLogout"));
                objc_msgSend(v15, "setHasManagedCredentials:", 0);
                objc_msgSend(v15, "setErrorCausingLogout:", 0);
                objc_msgSend(v15, "commitChanges");
                v20 = objc_opt_new(LUIUserLoginPasswordViewController);
                -[LUIUserLoginPasswordViewController setUserInfo:](v20, "setUserInfo:", v15);
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
                if ((+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild") & 1) == 0)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("LOGIN_FAILED"), &stru_100069EB8, 0));

                  v21 = (void *)v23;
                }
                -[LUIUserLoginPasswordViewController setPasscodeHintText:](v20, "setPasscodeHintText:", v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
                objc_msgSend(v24, "setupPasscodeViewControllerEventAction:forUser:", v20, v15);

                -[NSMutableArray addObject:](v3, "addObject:", v20);
                goto LABEL_18;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_18:

      v7 = v26;
    }

  }
  return v3;
}

- (UIAlertController)alertForPossibleLogoutError
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsers](self, "recentUsers"));
  v3 = v2;
  if (v2)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "errorCausingLogout"));
          if (v10)
          {
            v11 = (void *)v10;
            v12 = objc_msgSend(v9, "hasManagedCredentials");

            if ((v12 & 1) == 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "errorCausingLogout"));
              objc_msgSend(v9, "setErrorCausingLogout:", 0);
              objc_msgSend(v9, "commitChanges");
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

              if (!objc_msgSend(v16, "length"))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ERROR"), &stru_100069EB8, 0));

                v16 = (void *)v18;
              }
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v16, 1));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
              v24[0] = _NSConcreteStackBlock;
              v24[1] = 3221225472;
              v24[2] = sub_100025544;
              v24[3] = &unk_100068C08;
              v13 = v19;
              v25 = v13;
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, v24));

              objc_msgSend(v13, "addAction:", v22);
              goto LABEL_16;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v6)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_16:

  }
  else
  {
    v13 = 0;
  }

  return (UIAlertController *)v13;
}

- (UIAlertController)alertForUserLimitReached
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIAlertController *v11;
  _QWORD v13[4];
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SYNCING_RECENT_USERS"), &stru_100069EB8, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("USER_LIMIT_REACHED_GENERIC"), &stru_100069EB8, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_100069EB8, 0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000256E0;
  v13[3] = &unk_100068C08;
  v9 = v6;
  v14 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 0, v13));

  objc_msgSend(v9, "addAction:", v10);
  v11 = (UIAlertController *)v9;

  return v11;
}

- (id)rootViewControllerStack
{
  NSMutableArray *v3;
  void *v4;
  void *v5;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController rootViewController](self, "rootViewController"));
  -[NSMutableArray addObject:](v3, "addObject:", v4);
  if ((char *)-[LUISetupController classConfigState](self, "classConfigState") - 1 <= (char *)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController classRosterViewController](self, "classRosterViewController"));
    -[NSMutableArray addObject:](v3, "addObject:", v5);

  }
  return v3;
}

- (id)rootViewController
{
  void *v2;
  unsigned int v3;
  LUIAnonymousViewController *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUITemporarySessionSupport sharedInstance](LUITemporarySessionSupport, "sharedInstance"));
  v3 = objc_msgSend(v2, "isTemporarySessionOnly");

  if (v3)
  {
    v4 = objc_alloc_init(LUIAnonymousViewController);
  }
  else
  {
    v4 = objc_alloc_init(LUIAppleIDSignInViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUISignInController sharedController](LUISignInController, "sharedController"));
    -[LUIAnonymousViewController setDelegate:](v4, "setDelegate:", v5);

  }
  return v4;
}

- (id)classRosterViewController
{
  void *v2;
  LUIClassTableViewController *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v3 = -[LUIClassTableViewController initWithNibName:bundle:]([LUIClassTableViewController alloc], "initWithNibName:bundle:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "classGroupsDictionary"));
  -[LUIClassTableViewController setClassProviderWithGroupDictionary:](v3, "setClassProviderWithGroupDictionary:", v4);

  return v3;
}

- (id)viewControllerForPossibleOneClassOrAllStudents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classes"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "className"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:](self, "_viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:", v9, v10, 0));
  }
  else
  {
    if ((objc_msgSend(v3, "hasClasses") & 1) != 0
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classConfiguration")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "students")),
          v14 = objc_msgSend(v13, "count"),
          v13,
          v12,
          !v14))
    {
      v11 = 0;
      goto LABEL_8;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "classConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ALL_STUDENTS_TITLE"), &stru_100069EB8, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:](self, "_viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:", v10, v16, 0));

  }
LABEL_8:

  return v11;
}

- (id)_viewControllerForStudentProvider:(id)a3 withRosterHeader:(id)a4 containsRecentUsers:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  LUIRecentUserGridViewController *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (v5)
    {
      v9 = -[LUIUserGridViewController initWithNibName:bundle:]([LUIRecentUserGridViewController alloc], "initWithNibName:bundle:", 0, 0);
    }
    else
    {
      v9 = -[LUIClassUserGridViewController initWithNibName:bundle:]([LUIClassUserGridViewController alloc], "initWithNibName:bundle:", 0, 0);
      v10 = objc_opt_class(LKClass);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classID"));
        -[LUIRecentUserGridViewController setClassID:](v9, "setClassID:", v11);

        -[LUIRecentUserGridViewController setEnableEnglishLocaleNaming:](v9, "setEnableEnglishLocaleNaming:", 1);
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "students"));
    -[LUIUserGridViewController setUsers:](v9, "setUsers:", v12);

    -[LUIUserGridViewController setHeaderTitle:](v9, "setHeaderTitle:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)haveStudentsWithNoClasses
{
  return (id)-[LUISetupController viewControllerStackFlow](self, "viewControllerStackFlow") == (id)6
      || (id)-[LUISetupController viewControllerStackFlow](self, "viewControllerStackFlow") == (id)7;
}

- (NSArray)recentUsers
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LKLoginController sharedController](LKLoginController, "sharedController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recentUsers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _filteredUsers:](self, "_filteredUsers:", v4));

  return (NSArray *)v5;
}

- (BOOL)haveRecentUsers
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LKLoginController sharedController](LKLoginController, "sharedController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recentUsers"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)mostRecentLoggedInUsersWithCount:(unint64_t)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsers](self, "recentUsers"));
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if ((unint64_t)v5 > a3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[LUISortingSupport sharedInstance](LUISortingSupport, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortDescriptorWithKey:comparatorType:", CFSTR("lastLoginDate"), 3));
      v13 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8));

      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subarrayWithRange:", 0, a3));
      v4 = (id)v10;
    }
    v4 = v4;
    v11 = v4;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_filteredUsers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "classConfiguration"));
  v6 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "isAuditor", (_QWORD)v16) & 1) == 0
          && (objc_msgSend(v12, "isTransientUser") & 1) == 0)
        {
          if (v5
            && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username")),
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "studentForUsername:", v13)),
                v13,
                v14))
          {
            objc_msgSend(v14, "setDiffUMUserPropertiesFromUMUser:", v12);
            -[NSMutableArray addObject:](v6, "addObject:", v14);

          }
          else
          {
            -[NSMutableArray addObject:](v6, "addObject:", v12);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)viewControllerStackForAssignedUser:(id)a3 inClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LUIAssignedStudentViewController *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController rootViewControllerStack](self, "rootViewControllerStack"));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "className"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:](self, "_viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:", v7, v9, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController classFooterButtonTitle](self, "classFooterButtonTitle"));
    objc_msgSend(v10, "setFooterButtonTitle:", v11);

    objc_msgSend(v8, "addObject:", v10);
  }
  if (v6)
  {
    v12 = -[LUIAssignedStudentViewController initWithNibName:bundle:]([LUIAssignedStudentViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[LUIDashBoardViewController setUserInfo:](v12, "setUserInfo:", v6);
    objc_msgSend(v8, "addObject:", v12);

  }
  return v8;
}

- (UIViewController)viewControllerOnTopOfRootViewController
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[LUISetupController viewControllerStackFlow](self, "viewControllerStackFlow");
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController recentUsers](self, "recentUsers"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _filteredUsers:](self, "_filteredUsers:", v4));

      v6 = objc_msgSend(objc_alloc((Class)LKUsers), "initWithUsers:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECENT_USERS_TITLE"), &stru_100069EB8, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController _viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:](self, "_viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:", v6, v8, 1));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OTHER_USER_BUTTON_TITLE"), &stru_100069EB8, 0));
      objc_msgSend(v9, "setFooterButtonTitle:", v11);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUISetupController classRosterViewController](self, "classRosterViewController"));
    }
  }
  else
  {
    v9 = 0;
  }
  return (UIViewController *)v9;
}

- (NSString)classFooterButtonTitle
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[LUISetupController haveRecentUsers](self, "haveRecentUsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("RECENTS_BUTTON_TITLE");
  else
    v5 = CFSTR("CLASS_ROSTER_BUTTON_TITLE");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_100069EB8, 0));

  return (NSString *)v6;
}

- (int64_t)viewControllerStackFlow
{
  int64_t v3;
  int64_t result;
  BOOL v5;
  int64_t v6;

  v3 = -[LUISetupController classConfigState](self, "classConfigState");
  result = -[LUISetupController recentUserState](self, "recentUserState");
  switch(v3)
  {
    case 0:
      result = result == 1;
      break;
    case 1:
      v5 = result == 1;
      v6 = 2;
      goto LABEL_5;
    case 2:
      v5 = result == 1;
      v6 = 4;
LABEL_5:
      if (v5)
        result = v6 + 1;
      else
        result = v6;
      break;
    case 3:
      if (result)
        result = 7;
      else
        result = 6;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)classConfigState
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "classConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classes"));
  v5 = objc_msgSend(v4, "count");

  if ((unint64_t)v5 <= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classes"));
    v8 = objc_msgSend(v7, "count");

    if (v8 == (id)1)
    {
      v6 = 2;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classes"));
      if (objc_msgSend(v9, "count"))
      {

        v6 = 0;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "students"));
        v11 = objc_msgSend(v10, "count");

        if (v11)
          v6 = 3;
        else
          v6 = 0;
      }
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int64_t)recentUserState
{
  return -[LUISetupController haveRecentUsers](self, "haveRecentUsers");
}

- (NSMutableArray)notUpdatedRecentUsersViewControllers
{
  return self->_notUpdatedRecentUsersViewControllers;
}

- (void)setNotUpdatedRecentUsersViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_notUpdatedRecentUsersViewControllers, a3);
}

- (NSMutableArray)recentUsersViewControllers
{
  return self->_recentUsersViewControllers;
}

- (void)setRecentUsersViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_recentUsersViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentUsersViewControllers, 0);
  objc_storeStrong((id *)&self->_notUpdatedRecentUsersViewControllers, 0);
}

+ (void)reset
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  objc_msgSend(v2, "_setup");

}

@end
