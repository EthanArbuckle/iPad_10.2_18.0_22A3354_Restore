@implementation HSPCSiriVoiceRecognitionViewController

- (HSPCSiriVoiceRecognitionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  HSPCSiriVoiceRecognitionViewController *v9;
  HSPCSiriVoiceRecognitionViewController *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)PRXCardContentView), "initWithCardStyle:", 0);
  v24.receiver = self;
  v24.super_class = (Class)HSPCSiriVoiceRecognitionViewController;
  v9 = -[HSPCSiriVoiceRecognitionViewController initWithContentView:](&v24, "initWithContentView:", v8);
  v10 = v9;
  if (v9)
  {
    -[HSPCSiriVoiceRecognitionViewController setConfig:](v9, "setConfig:", v7);
    -[HSPCSiriVoiceRecognitionViewController setCoordinator:](v10, "setCoordinator:", v6);
    v11 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_Title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[HSPCSiriVoiceRecognitionViewController setTitle:](v10, "setTitle:", v12);

    v13 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_RecognizeVoiceButtonTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[HSPCSiriVoiceRecognitionViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v10, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v14, v10, "_enableVoiceRecognitionAndCommitConfiguration");

    v16 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_NotNowButtonTitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = -[HSPCSiriVoiceRecognitionViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v10, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v17, v10, "_showVoiceRecognitionConfirmation");

    v19 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_Subtitle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[HSPCSiriVoiceRecognitionViewController setSubtitle:](v10, "setSubtitle:", v20);

    v21 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_FinePrint"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[HSPCSiriVoiceRecognitionViewController setBottomTrayTitle:](v10, "setBottomTrayTitle:", v22);

  }
  return v10;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A80F8);
}

- (void)_enableVoiceRecognition
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceRecognitionViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "home"));

  v5 = objc_alloc((Class)HFUserItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentUser"));
  v7 = objc_msgSend(v5, "initWithHome:user:nameStyle:", v4, v6, 0);

  v8 = objc_msgSend(v7, "setEnableIdentifyVoice:", 1);
  v10 = HFLogForCategory(60, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = 138412290;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Enabling voice recognition", (uint8_t *)&v14, 0xCu);

  }
}

- (id)_checkForiCloudSiriEnabledAndEnableVoiceRecognition
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:](HUHomeFeatureOnboardingUtilities, "checkSiriForiCloudEnabledPromptingUser:", self));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DFF0;
  v6[3] = &unk_1000A1A80;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flatMap:", v6));

  return v4;
}

- (id)_enableVoiceRecognitionAndCommitConfiguration
{
  void *v4;
  void *v5;
  _QWORD v7[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCSiriVoiceRecognitionViewController _checkForiCloudSiriEnabledAndEnableVoiceRecognition](self, "_checkForiCloudSiriEnabledAndEnableVoiceRecognition"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E0C8;
  v7[3] = &unk_1000A1210;
  v7[4] = self;
  v7[5] = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flatMap:", v7));

  return v5;
}

- (id)_showVoiceRecognitionConfirmation
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  __int128 buf;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = HFLogForCategory(60, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Showing voice recognition confirmation alert", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v25 = 0x3032000000;
  v26 = sub_10001E708;
  v27 = sub_10001E718;
  v28 = (id)objc_opt_new(NAFuture, v8);
  v9 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_AlertTitle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v10 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_AlertMessage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_AlertRecognizeVoiceButtonTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = HULocalizedString(CFSTR("HUSiriEndpointSetup_VoiceRecognition_AlertNotNowButtonTitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v11, 1));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001E720;
  v23[3] = &unk_1000A1AD0;
  v23[4] = self;
  v23[5] = &buf;
  v23[6] = a2;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v23));
  objc_msgSend(v16, "addAction:", v17);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001E874;
  v22[3] = &unk_1000A1AD0;
  v22[4] = self;
  v22[5] = &buf;
  v22[6] = a2;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v22));
  objc_msgSend(v16, "addAction:", v18);

  -[HSPCSiriVoiceRecognitionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  v19 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v19;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
