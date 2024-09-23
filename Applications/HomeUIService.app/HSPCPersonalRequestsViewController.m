@implementation HSPCPersonalRequestsViewController

- (HSPCPersonalRequestsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  HSPCPersonalRequestsViewController *v10;
  HSPCPersonalRequestsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v69;
  void *v70;
  id v71;
  id v72;
  int v73;
  objc_super v74;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UITableView);
  objc_msgSend(v8, "setSeparatorStyle:", 0);
  v9 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v8);
  v74.receiver = self;
  v74.super_class = (Class)HSPCPersonalRequestsViewController;
  v10 = -[HSPCPersonalRequestsViewController initWithContentView:](&v74, "initWithContentView:", v9);
  v11 = v10;
  if (v10)
  {
    -[HSPCPersonalRequestsViewController setConfig:](v10, "setConfig:", v7);
    -[HSPCPersonalRequestsViewController setCoordinator:](v11, "setCoordinator:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](v11, "config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](v11, "config"));
    v15 = objc_msgSend(v13, "stateMachineConfigurationGetLaunchReason:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
    if (objc_msgSend(v16, "hf_atleastOneMediaAccessorySupportingJustSiri"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
      if (objc_msgSend(v17, "siriPhraseOptions") == (id)2)
      {
        v73 = _os_feature_enabled_impl("CoreSpeech", "support_js");
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
        if (objc_msgSend(v18, "siriPhraseOptions") == (id)3)
          v73 = _os_feature_enabled_impl("CoreSpeech", "support_js");
        else
          v73 = 0;

      }
    }
    else
    {
      v73 = 0;
    }

    v19 = HULocalizedString(CFSTR("HUSiriEndpointSetup_PersonalRequests_Title"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[HSPCPersonalRequestsViewController setTitle:](v11, "setTitle:", v20);

    v21 = HULocalizedString(CFSTR("HUSiriEndpointSetup_PersonalRequests_UsePersonalRequestsButtonTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[HSPCPersonalRequestsViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v11, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v22, v11, "_enablePersonalRequests");

    v24 = HULocalizedString(CFSTR("HUSiriEndpointSetup_PersonalRequests_DoNotUsePersonalRequestsButtonTitle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = -[HSPCPersonalRequestsViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v11, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v25, v11, "commitConfiguration");

    v72 = v6;
    if (v15 == (id)3
      && (v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](v11, "config")),
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "siriEnabledAccessories")),
          v29 = objc_msgSend(v28, "count"),
          v28,
          v27,
          (unint64_t)v29 >= 2))
    {
      v30 = HULocalizedString(CFSTR("HUSiriEndpointSetup_PersonalRequests_MultipleAccessories_Subtitle"));
      v31 = objc_claimAutoreleasedReturnValue(v30);
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "addedAccessory"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hf_userFriendlyLocalizedLowercaseDescription"));
      v33 = HULocalizedStringWithFormat(CFSTR("HUSiriEndpointSetup_PersonalRequests_Subtitle"), CFSTR("%@"));
      v31 = objc_claimAutoreleasedReturnValue(v33);

    }
    -[HSPCPersonalRequestsViewController setSubtitle:](v11, "setSubtitle:", v31, v69);
    v34 = HULocalizedString(CFSTR("HUSiriEndpointSetup_PersonalRequests_FinePrint"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[HSPCPersonalRequestsViewController setBottomTrayTitle:](v11, "setBottomTrayTitle:", v35);

    v36 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_CalendarBulletText"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController _bulletImageWithSystemName:color:](v11, "_bulletImageWithSystemName:color:", CFSTR("calendar"), v38));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", v37, &stru_1000A3BA0, v39, v40));
    v42 = -[HSPCPersonalRequestsViewController addFeature:](v11, "addFeature:", v41);

    v43 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_MessagesBulletText_HEY_SIRI"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v70 = (void *)v31;
    v71 = v9;
    if (v73)
    {
      v45 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_MessagesBulletText_JUST_SIRI"));
      v46 = objc_claimAutoreleasedReturnValue(v45);

      v44 = (void *)v46;
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController _bulletImageWithSystemName:color:](v11, "_bulletImageWithSystemName:color:", CFSTR("message.fill"), v47));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", v44, &stru_1000A3BA0, v48, v49));
    v51 = -[HSPCPersonalRequestsViewController addFeature:](v11, "addFeature:", v50);

    v52 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_RemindersBulletText"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController _bulletImageWithSystemName:color:](v11, "_bulletImageWithSystemName:color:", CFSTR("list.bullet"), v54));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", v53, &stru_1000A3BA0, v55, v56));
    v58 = -[HSPCPersonalRequestsViewController addFeature:](v11, "addFeature:", v57);

    v59 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_PersonalUpdateBulletText_HEY_SIRI"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
    if (v73)
    {
      v61 = HUSiriLocalizedString(CFSTR("HUPersonalRequestsSetup_PersonalUpdateBulletText_JUST_SIRI"));
      v62 = objc_claimAutoreleasedReturnValue(v61);

      v60 = (void *)v62;
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController _bulletImageWithSystemName:color:](v11, "_bulletImageWithSystemName:color:", CFSTR("heart.text.square.fill"), v63));
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[PRXFeature featureWithTitle:detailText:icon:tintColor:](PRXFeature, "featureWithTitle:detailText:icon:tintColor:", v60, &stru_1000A3BA0, v64, v65));
    v67 = -[HSPCPersonalRequestsViewController addFeature:](v11, "addFeature:", v66);

    v6 = v72;
    v9 = v71;
  }

  return v11;
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8380);
}

- (id)_bulletImageWithSystemName:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 22.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:](UIImage, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v6, v5, v7, v8, 40.0, 40.0, 10.0));

  return v9;
}

- (id)_enablePersonalRequests
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;

  v3 = HFLogForCategory(60, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Enabling personal requests", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assistantAccessControlForHome:", v6));
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessories"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config"));
  v15 = objc_msgSend(v13, "stateMachineConfigurationGetLaunchReason:", v14);

  if (v15 == (id)3
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "siriEnabledAccessories")),
        v17,
        v16,
        v17))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "siriEnabledAccessories"));
    objc_msgSend(v11, "na_safeAddObjectsFromArray:", v19);
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController config](self, "config"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addedAccessory"));
    objc_msgSend(v11, "na_safeAddObject:", v19);
  }

  objc_msgSend(v9, "setAccessories:", v11);
  v21 = HFLogForCategory(60, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Personal requests will be enabled for accessories: %@, ", buf, 0xCu);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100033008;
  v31[3] = &unk_1000A1F58;
  v32 = v7;
  v33 = v9;
  v34 = v6;
  v23 = v6;
  v24 = v9;
  v25 = v7;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v31));
  v35[0] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCPersonalRequestsViewController commitConfiguration](self, "commitConfiguration"));
  v35[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v28));

  return v29;
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
