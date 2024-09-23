@implementation HSPCSiriVoiceTrainingViewController

- (HSPCSiriVoiceTrainingViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCSiriVoiceTrainingViewController *v9;
  HSPCSiriVoiceTrainingViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HSPCSiriVoiceTrainingViewController;
  v9 = -[HSPCSiriVoiceTrainingViewController initWithEnrollmentMode:](&v12, "initWithEnrollmentMode:", 5);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a4);
    objc_storeStrong((id *)&v10->_coordinator, a3);
    -[HSPCSiriVoiceTrainingViewController setDelegate:](v10, "setDelegate:", v10);
  }

  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A7F00);
}

- (void)skipSetup
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Skipping Siri voice training setup", v5, 2u);
  }

  -[HSPCSiriVoiceTrainingViewController _disableVoiceRecognition](self, "_disableVoiceRecognition");
  -[HSPCSiriVoiceTrainingViewController _continueSetup](self, "_continueSetup");
}

- (void)continueSetup
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training setup complete", v5, 2u);
  }

  if (!-[HSPCSiriVoiceTrainingViewController hasCompletedSiriSetup](self, "hasCompletedSiriSetup"))
  {
    -[HSPCSiriVoiceTrainingViewController setHasCompletedSiriSetup:](self, "setHasCompletedSiriSetup:", 1);
    -[HSPCSiriVoiceTrainingViewController _continueSetup](self, "_continueSetup");
  }
}

- (void)showLearnMore
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = HFLogForCategory(60, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training show learn more", v4, 2u);
  }

}

- (void)dismissSetup
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "VTUIEnrollTrainingViewControllerDelegate: Siri voice training setup has been dismissed", v5, 2u);
  }

  -[HSPCSiriVoiceTrainingViewController _dismissSetup](self, "_dismissSetup");
}

- (void)_continueSetup
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  HSPCSiriVoiceTrainingViewController *v21;
  __int16 v22;
  void *v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceTrainingViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceTrainingViewController config](self, "config"));
  v7 = objc_msgSend(v5, "stateMachineConfigurationGetLaunchReason:", v6);

  v9 = HFLogForCategory(60, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)3)
  {
    if (v11)
    {
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ We are launched for Siri Endpoint setup only so must actually dismiss now", buf, 0x16u);

    }
    -[HSPCSiriVoiceTrainingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    if (v11)
    {
      v14 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Continuing setup", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceTrainingViewController coordinator](self, "coordinator"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nextViewController"));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000064F8;
    v19[3] = &unk_1000A0EC8;
    v19[4] = self;
    v18 = objc_msgSend(v17, "addSuccessBlock:", v19);

  }
}

- (void)_dismissSetup
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  int v8;
  HSPCSiriVoiceTrainingViewController *v9;
  __int16 v10;
  void *v11;

  v4 = HFLogForCategory(60, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Dismissing setup", (uint8_t *)&v8, 0x16u);

  }
  -[HSPCSiriVoiceTrainingViewController _disableVoiceRecognition](self, "_disableVoiceRecognition");
  -[HSPCSiriVoiceTrainingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_disableVoiceRecognition
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  void *v20;
  int v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceTrainingViewController config](self, "config"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  v6 = objc_alloc((Class)HFUserItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentUser"));
  v8 = objc_msgSend(v6, "initWithHome:user:nameStyle:", v5, v7, 0);

  v9 = objc_msgSend(v8, "setEnableIdentifyVoice:", 0);
  v11 = HFLogForCategory(60, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v21 = 138412290;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Disabling voice recognition", (uint8_t *)&v21, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceTrainingViewController config](self, "config"));
  objc_msgSend(v15, "setShouldSkipVoiceProfileSetup:", 1);

  v17 = HFLogForCategory(60, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = 138412290;
    v22 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ User has opted to skip voice training. Setting flag to skip remainder of voice profile related setup flow.", (uint8_t *)&v21, 0xCu);

  }
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)hasCompletedSiriSetup
{
  return self->_hasCompletedSiriSetup;
}

- (void)setHasCompletedSiriSetup:(BOOL)a3
{
  self->_hasCompletedSiriSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
