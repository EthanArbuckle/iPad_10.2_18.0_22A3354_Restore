@implementation AAUIViewServiceURLHandler

- (id)_buildURLInfoFromActivity:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;

  v3 = a3;
  v4 = _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
    v13 = 136380931;
    v14 = "-[AAUIViewServiceURLHandler _buildURLInfoFromActivity:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{private}s handling user activity type: %@", (uint8_t *)&v13, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));
  v8 = objc_msgSend(v7, "isEqual:", NSUserActivityTypeBrowsingWeb);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "webpageURL"));
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v9, 1);
      if (v10)
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[AAUniversalLinkHelper infoForComponents:](AAUniversalLinkHelper, "infoForComponents:", v10));
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)handleUniversalLinkInUserActivity:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000039F0;
  v24[3] = &unk_10000C348;
  v24[4] = self;
  v5 = objc_retainBlock(v24);
  v6 = _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
    *(_DWORD *)buf = 136380931;
    v26 = "-[AAUIViewServiceURLHandler handleUniversalLinkInUserActivity:]";
    v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{private}s handling user activity type: %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AAUIViewServiceURLHandler _buildURLInfoFromActivity:](self, "_buildURLInfoFromActivity:", v4));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", AAURLKeyFlowType));
    v12 = v11;
    if (!v11)
    {
      v16 = _AAUILogSystem();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100006FE4();

      ((void (*)(_QWORD *))v5[2])(v5);
      v15 = 0;
      goto LABEL_25;
    }
    if (objc_msgSend(v11, "isEqualToString:", AAURLKeyFlowTypePrivateEmailManage))
    {
      -[AAUIViewServiceURLHandler _openPrivateEmailManageURL](self, "_openPrivateEmailManageURL");
LABEL_24:
      ((void (*)(_QWORD *))v5[2])(v5);
      v15 = 1;
LABEL_25:

      goto LABEL_26;
    }
    if (objc_msgSend(v12, "isEqualToString:", AAURLKeyFlowTypeCustomDomain))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AAURLKeyID));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AAURLKeyCustomDomainState));
      if (v18)
        -[AAUIViewServiceURLHandler _openCustomDomainURL:domainState:](self, "_openCustomDomainURL:domainState:", v18, v19);
      else
        -[AAUIViewServiceURLHandler _openCustomDomainManageURL](self, "_openCustomDomainManageURL");

      goto LABEL_23;
    }
    if (objc_msgSend(v12, "isEqualToString:", AAURLKeyFlowTypeMailImport))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AAURLKeyState));
      -[AAUIViewServiceURLHandler _handleMailImportURL:](self, "_handleMailImportURL:", v18);
LABEL_23:

      goto LABEL_24;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AAURLKeyID));
    if (!v20)
    {
      ((void (*)(_QWORD *))v5[2])(v5);
      v15 = 0;
LABEL_33:

      goto LABEL_25;
    }
    v21 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v20);
    if (objc_msgSend(v12, "isEqualToString:", AAURLKeyFlowTypeCustodian))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
      -[AAUIViewServiceURLHandler _presentCustodianInvitationWithUUID:fallBackURL:](self, "_presentCustodianInvitationWithUUID:fallBackURL:", v21, v22);
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", AAURLKeyFlowTypeBeneficiary))
      {
        v15 = 0;
        goto LABEL_32;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webpageURL"));
      -[AAUIViewServiceURLHandler _presentInheritanceInvitationWithBeneficiaryID:fallBackURL:](self, "_presentInheritanceInvitationWithBeneficiaryID:fallBackURL:", v21, v22);
    }

    v15 = 1;
LABEL_32:

    goto LABEL_33;
  }
  v13 = _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_100006FB8();

  ((void (*)(_QWORD *))v5[2])(v5);
  v15 = 0;
LABEL_26:

  return v15;
}

- (void)_openPrivateEmailManageURL
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)_openCustomDomainManageURL
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/BYOD_SETTING_SPECIFIER_ID")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)_openCustomDomainURL:(id)a3 domainState:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/BYOD_SETTING_SPECIFIER_ID"));
  if (v7)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("domain"), v5);
    -[NSObject addObject:](v8, "addObject:", v9);

    if (v6)
    {
      v10 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("domainState"), v6);
      -[NSObject addObject:](v8, "addObject:", v10);

    }
    objc_msgSend(v7, "setQueryItems:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), CFSTR("&")));

    v13 = _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "url string for custom email domain %@", buf, 0xCu);
    }

    v15 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v19 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
    v20 = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    objc_msgSend(v16, "openSensitiveURL:withOptions:", v15, v17);

  }
  else
  {
    v18 = _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "malformed custom domain URL provided to NSURLComponents. byodUrlComponent is nil", buf, 2u);
    }
  }

}

- (void)_presentCustodianInvitationWithUUID:(id)a3 fallBackURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  AAUIViewServiceURLHandler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)AACustodianController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003E00;
  v11[3] = &unk_10000C370;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "displayInvitationUIWithUUID:completion:", v9, v11);

}

- (void)_presentInheritanceInvitationWithBeneficiaryID:(id)a3 fallBackURL:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  AAUIViewServiceURLHandler *v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to present Inheritance Invitation UI...", buf, 2u);
  }

  v10 = objc_alloc_init((Class)AAInheritanceController);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004054;
  v13[3] = &unk_10000C370;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "presentInheritanceInvitationUIWithBeneficiaryID:completion:", v11, v13);

}

- (void)_handleMailImportURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/MAIL_IMPORT"));
  v5 = v4;
  if (v3 && v4)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", CFSTR("state"), v3);
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v5, "setQueryItems:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("?"), CFSTR("&")));

    v10 = _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "url string for Unified Settings - mail import %@", (uint8_t *)&v14, 0xCu);
    }

    v12 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v13, "openSensitiveURL:withOptions:", v12, 0);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Mail/MAIL_IMPORT")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v6, 0);
  }

}

- (id)destroySessionBlock
{
  return self->_destroySessionBlock;
}

- (void)setDestroySessionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_destroySessionBlock, 0);
}

@end
