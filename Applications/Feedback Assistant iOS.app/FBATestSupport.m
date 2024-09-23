@implementation FBATestSupport

- (void)processLaunchArgumentsWithArgs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v6 = v4;
  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arguments"));

  }
  if (FBKIsInternalInstall(v4, v5))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v9)
      goto LABEL_22;
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("FBA_TEST_SESSION")))
        {
          -[FBATestSupport setupTestingEvn](self, "setupTestingEvn");
          continue;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("FBA_TEST_LOG_OUT")))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "loginManager"));
          objc_msgSend(v15, "logOut");
          goto LABEL_13;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("FBA_TEST_RESET_DEFAULTS")))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bundleIdentifier"));
          objc_msgSend(v16, "removePersistentDomainForName:", v18);

        }
        else if (objc_msgSend(v13, "hasPrefix:", CFSTR("FBA_TEST_ULR_SCHEME_BUTTON")))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("|")));
          if (objc_msgSend(v14, "count") == (id)2)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
            -[FBATestSupport addVisibleClickableLinkWithIdentifier:andUrlString:](self, "addVisibleClickableLinkWithIdentifier:andUrlString:", v19, v15);
            -[FBATestSupport addVisibleClickableLinkWithIdentifier:andUrlString:](self, "addVisibleClickableLinkWithIdentifier:andUrlString:", v19, v15);

LABEL_13:
          }

          continue;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v10)
      {
LABEL_22:

        v6 = v20;
        break;
      }
    }
  }

}

- (void)addVisibleClickableLinkWithIdentifier:(id)a3 andUrlString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FBATestSupport *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100043520;
  v13[3] = &unk_1000E7A40;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v10 = v6;
  v11 = v7;
  v12 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", UIApplicationDidBecomeActiveNotification, 0, v9, v13);

}

- (void)openLink:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "titleLabel"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v4 = (void *)v7;
  if (v7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v6, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

    }
    v4 = (void *)v7;
  }

}

- (void)setupTestingEvn
{
  NSLog(CFSTR("In %s"), a2, "-[FBATestSupport setupTestingEvn]");
}

@end
