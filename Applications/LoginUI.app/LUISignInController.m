@implementation LUISignInController

+ (id)sharedController
{
  if (qword_100088CB0 != -1)
    dispatch_once(&qword_100088CB0, &stru_100068BE0);
  return (id)qword_100088CA8;
}

- (LUISignInController)init
{
  LUISignInController *v2;
  void *v3;
  uint64_t v4;
  AppDelegate *appDelegate;
  uint64_t v6;
  UINavigationController *navigationController;
  uint64_t v8;
  LUIUIUpdateSupport *uiUpdateSupport;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LUISignInController;
  v2 = -[LUISignInController init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    appDelegate = v2->_appDelegate;
    v2->_appDelegate = (AppDelegate *)v4;

    v6 = objc_claimAutoreleasedReturnValue(-[AppDelegate navigationController](v2->_appDelegate, "navigationController"));
    navigationController = v2->_navigationController;
    v2->_navigationController = (UINavigationController *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
    uiUpdateSupport = v2->_uiUpdateSupport;
    v2->_uiUpdateSupport = (LUIUIUpdateSupport *)v8;

  }
  return v2;
}

- (void)loginWithUsername:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  LKUser *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  LUISignInController *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  LUISignInController *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v8 = a3;
  v26 = a4;
  v9 = a5;
  v24 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUISignInController uiUpdateSupport](self, "uiUpdateSupport"));
  objc_msgSend(v10, "beginDisablingViewUpdatesForReason:", off_100087BF8);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[LUISchoolManager sharedInstance](LUISchoolManager, "sharedInstance"));
  v11 = (LKUser *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "studentForUsername:", v8));
  if (!v11)
  {
    v11 = objc_opt_new(LKUser);
    -[LKUser setUsername:](v11, "setUsername:", v8);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allUsers"));

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "username"));
        v20 = objc_msgSend(v19, "isEqualToString:", v8);

        if (v20)
        {
          -[LKUser setDiffUMUserPropertiesFromUMUser:](v11, "setDiffUMUserPropertiesFromUMUser:", v18);
          goto LABEL_13;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_13:

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100002498;
  v27[3] = &unk_100068C80;
  v28 = v8;
  v29 = v24;
  v30 = v9;
  v22 = v9;
  v23 = v8;
  objc_msgSend(v21, "authenticateWithUser:password:completionHandler:", v11, v26, v27);

}

- (LUIUIUpdateSupport)uiUpdateSupport
{
  return self->_uiUpdateSupport;
}

- (void)setUiUpdateSupport:(id)a3
{
  objc_storeStrong((id *)&self->_uiUpdateSupport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiUpdateSupport, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_appDelegate, 0);
}

@end
