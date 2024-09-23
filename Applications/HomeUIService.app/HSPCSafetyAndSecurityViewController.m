@implementation HSPCSafetyAndSecurityViewController

- (HSPCSafetyAndSecurityViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  HSPCSafetyAndSecurityViewController *v12;
  HSPCSafetyAndSecurityViewController *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc((Class)UIImageView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage hf_safetyAndSecurityImage](UIImage, "hf_safetyAndSecurityImage"));
  v11 = objc_msgSend(v9, "initWithImage:", v10);

  objc_msgSend(v11, "setContentMode:", 2);
  v27.receiver = self;
  v27.super_class = (Class)HSPCSafetyAndSecurityViewController;
  v12 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v27, "initWithCenterContentView:size:", v11, 75.0, 75.0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_config, a4);
    objc_storeStrong((id *)&v13->_coordinator, a3);
    v14 = HULocalizedString(CFSTR("HUSafetyAndSecuritySetup_Title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCSafetyAndSecurityViewController setTitle:](v13, "setTitle:", v15);

    v16 = HULocalizedString(CFSTR("HUSafetyAndSecuritySetup_EnableButton_Title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = -[HSPCSafetyAndSecurityViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v13, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v17, v13, "_enableSafetyAndSecuritySettings");

    v19 = HULocalizedString(CFSTR("HUNotNowTitle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = -[HSPCSafetyAndSecurityViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v13, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v20, v13, "commitConfiguration");

    v22 = HULocalizedString(CFSTR("HUSafetyAndSecuritySetup_Description"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[HSPCSafetyAndSecurityViewController setSubtitle:](v13, "setSubtitle:", v23);

    v24 = HULocalizedString(CFSTR("HUSafetyAndSecuritySetup_FinePrint"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[HSPCSafetyAndSecurityViewController setBottomTrayTitle:](v13, "setBottomTrayTitle:", v25);

  }
  return v13;
}

- (id)_enableSafetyAndSecuritySettings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000501A0;
  v29[3] = &unk_1000A16F0;
  v29[4] = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v29));
  objc_msgSend(v3, "na_safeAddObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSafetyAndSecurityViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hf_allUsersIncludingCurrentUser"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSafetyAndSecurityViewController config](self, "config"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeAccessControlForUser:", v12));

        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100050364;
        v23[3] = &unk_1000A16F0;
        v24 = v15;
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v23));
        objc_msgSend(v3, "na_safeAddObject:", v17);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSafetyAndSecurityViewController commitConfiguration](self, "commitConfiguration"));
  objc_msgSend(v3, "addObject:", v18);

  v19 = objc_msgSend(v3, "copy");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v19));

  return v20;
}

- (id)commitConfiguration
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  uint8_t buf[16];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will set local key for userHasDismissedAudioAnalysisOnboardingOnThisDevice...", buf, 2u);
  }

  v6 = objc_alloc((Class)HFUserItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSafetyAndSecurityViewController config](self, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSafetyAndSecurityViewController config](self, "config"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentUser"));
  v12 = objc_msgSend(v6, "initWithHome:user:nameStyle:", v8, v11, 0);

  v13 = objc_msgSend(v12, "setDismissedAudioAnalysisOnboardingOnThisDevice:", 1);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005067C;
  v19[3] = &unk_1000A16F0;
  v19[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v19));
  objc_msgSend(v3, "addObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B18));
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_msgSend(v3, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v16));

  return v17;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
