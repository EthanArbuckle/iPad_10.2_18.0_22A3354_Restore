@implementation HSPCPINCodeViewController

- (HSPCPINCodeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  HSPCPINCodeViewController *v10;
  HSPCPINCodeViewController *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  objc_super v27;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)HUIconView), "initWithFrame:contentMode:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v27.receiver = self;
  v27.super_class = (Class)HSPCPINCodeViewController;
  v10 = -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](&v27, "initWithCenterContentView:size:", v9, 120.0, 132.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_config, a4);
    objc_storeStrong((id *)&v11->_coordinator, a3);
    v12 = sub_1000593D8(CFSTR("HSProximityCardPINCodeTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCPINCodeViewController setTitle:](v11, "setTitle:", v13);

    v14 = sub_1000593D8(CFSTR("HSProximityCardPINCodeSubtitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[HSPCPINCodeViewController setSubtitle:](v11, "setSubtitle:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v17 = objc_msgSend(v16, "hf_currentUserIsRestrictedGuest");

    if (v17)
    {
      v18 = sub_1000593D8(CFSTR("HSProximityCardPINCodeSubtitle_RestrictedGuest"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      -[HSPCPINCodeViewController setSubtitle:](v11, "setSubtitle:", v19);

    }
    v20 = -[HSPCPINCodeViewController addProminentButtonWithTitleKey:target:futureSelector:](v11, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v11, "commitConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "home"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[HFWalletUtilities packageIconIdentifierForHome:shouldUseKeyholeAsset:](HFWalletUtilities, "packageIconIdentifierForHome:shouldUseKeyholeAsset:", v21, 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100017430;
    v25[3] = &unk_1000A1718;
    v26 = v9;
    v23 = objc_msgSend(v22, "flatMap:", v25);

  }
  return v11;
}

- (id)commitConfiguration
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[4];
  HSPCPINCodeViewController *v36;
  __int16 v37;
  void *v38;

  v4 = HFLogForCategory(68, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412546;
    v36 = self;
    v37 = 2112;
    v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%@) User tapped Continue button", buf, 0x16u);

  }
  v8 = objc_alloc_init((Class)NAFuture);
  if ((+[HFUtilities isUsingiCloud](HFUtilities, "isUsingiCloud") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPINCodeViewController config](self, "config"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pinCodeManagerForHome:", v11));

    objc_initWeak((id *)buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hasValidConstraints"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100017924;
    v26[3] = &unk_1000A1780;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v8;
    v14 = objc_msgSend(v13, "flatMap:", v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100017914;
    v29[3] = &unk_1000A10A8;
    v30 = v8;
    v15 = objc_retainBlock(v29);
    v16 = HFLocalizedString(CFSTR("HFErrorButtonTitleiCloudSettings"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = HFLocalizedString(CFSTR("HFErrorButtonTitleNotNow"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v33[0] = HFErrorHandlerOptionRetryButtonTextKey;
    v33[1] = HFErrorHandlerOptionCancelButtonTextKey;
    v34[0] = v17;
    v34[1] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    v31[0] = HFErrorUserInfoOptionsKey;
    v31[1] = HFErrorUserInfoOperationTypeKey;
    v32[0] = v20;
    v32[1] = HFOperationAddPINCode;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
    v22 = objc_alloc((Class)NSError);
    v23 = objc_msgSend(v22, "initWithDomain:code:userInfo:", HFErrorDomain, 79, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler"));
    objc_msgSend(v24, "handleError:retryBlock:cancelBlock:", v23, &stru_1000A1758, v15);

    v12 = v30;
  }

  return v8;
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
