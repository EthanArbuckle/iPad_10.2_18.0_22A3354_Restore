@implementation NDOSpecifierDataSource

- (NDOSpecifierDataSource)initWithDefaultDevice:(BOOL)a3
{
  _BOOL4 v3;
  NDOSpecifierDataSource *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *policyLookupQueue;
  dispatch_group_t v9;
  OS_dispatch_group *group;
  void *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)NDOSpecifierDataSource;
  v4 = -[PSSpecifierDataSource init](&v14, sel_init);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[NDOSpecifierDataSource setNdoManager:](v4, "setNdoManager:", v5);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.newdeviceoutreach.policyqueue", v6);
    policyLookupQueue = v4->_policyLookupQueue;
    v4->_policyLookupQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_group_create();
    group = v4->_group;
    v4->_group = (OS_dispatch_group *)v9;

    v11 = (void *)objc_opt_new();
    -[NDOSpecifierDataSource setNdoSpecifiers:](v4, "setNdoSpecifiers:", v11);

    _NDOLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[NDOSpecifierDataSource initWithDefaultDevice:]";
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_229EC7000, v12, OS_LOG_TYPE_DEFAULT, "%s: initWithDefaultDevice: %d", buf, 0x12u);
    }

  }
  return v4;
}

- (void)specifiersWithPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *group;
  NSObject *policyLookupQueue;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  id v19[2];
  id location;
  _QWORD v21[6];
  _QWORD v22[6];
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "aida_accountForPrimaryiCloudAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    v27 = 0;
    dispatch_group_enter((dispatch_group_t)self->_group);
    -[NDOSpecifierDataSource serialNumber](self, "serialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x24BDAC760];
    -[NDOSpecifierDataSource ndoManager](self, "ndoManager");
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOSpecifierDataSource serialNumber](self, "serialNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke;
      v22[3] = &unk_24F3350A8;
      v22[4] = self;
      v22[5] = &buf;
      objc_msgSend(v11, "getDeviceInfoForSerialNumber:usingPolicy:withReply:", v12, a3, v22);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v10;
      v21[1] = 3221225472;
      v21[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_2;
      v21[3] = &unk_24F3350A8;
      v21[4] = self;
      v21[5] = &buf;
      objc_msgSend(v11, "getDefaultDeviceInfoUsingPolicy:withReply:", a3, v21);
    }

    objc_initWeak(&location, self);
    group = self->_group;
    policyLookupQueue = self->_policyLookupQueue;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_3;
    v16[3] = &unk_24F3350D0;
    p_buf = &buf;
    v16[4] = self;
    v17 = v6;
    v19[1] = (id)a3;
    objc_copyWeak(v19, &location);
    dispatch_group_notify(group, policyLookupQueue, v16);
    objc_destroyWeak(v19);

    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    _NDOLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]";
      _os_log_impl(&dword_229EC7000, v13, OS_LOG_TYPE_DEFAULT, "%s: Skipping info fetch: not logged in.", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));

}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));

}

void __65__NDOSpecifierDataSource_specifiersWithPolicy_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *WeakRetained;
  NSObject *v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = 136315394;
    v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke_3";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_229EC7000, v2, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "warrantySpecifiersFromDeviceInfo:");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
      v12 = 2112;
      v13 = WeakRetained;
      _os_log_impl(&dword_229EC7000, v5, OS_LOG_TYPE_DEFAULT, "%s: specifiers: %@", (uint8_t *)&v10, 0x16u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%s: Failed to load coverage. Policy:%@", (uint8_t *)&v10, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 64) != 2)
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
      v6();
      goto LABEL_8;
    }
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:]_block_invoke";
      _os_log_impl(&dword_229EC7000, v9, OS_LOG_TYPE_DEFAULT, "%s: Trying cache fallback", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(WeakRetained, "specifiersWithPolicy:completionHandler:", 1, *(_QWORD *)(a1 + 40));
  }
LABEL_8:

}

- (id)acController
{
  void *v2;
  void *v3;

  -[PSSpecifierDataSource observersOfClass:](self, "observersOfClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deviceDescriptionSpecifierWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v5, "coverageLocalizedLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_warrantyDetailText_, objc_opt_class(), 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", NSClassFromString(CFSTR("PSMultilineTableCell")), *MEMORY[0x24BE75948]);
    objc_msgSend(v9, "setProperty:forKey:", CFSTR("WARRANTY_DESCRIPTION"), *MEMORY[0x24BE75AC0]);
    -[NDOSpecifierDataSource hostingController](self, "hostingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v10, CFSTR("NDOHostingController"));

    if (objc_msgSend(v6, "covered") && !objc_msgSend(v6, "isACServicesPartner"))
    {
      objc_msgSend(v6, "coverageEndDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setTimeStyle:", 0);
        objc_msgSend(v13, "setDateStyle:", 1);
        objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTimeZone:", v14);

        objc_msgSend(v6, "coverageEndDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "localizedCoveredDeviceDateLabelFormat");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v6, "localizedCoveredDeviceDateLabelFormat");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", v19, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setProperty:forKey:", v20, *MEMORY[0x24BE75DA0]);

        }
      }
    }
    else
    {
      objc_msgSend(v9, "setProperty:forKey:", &stru_24F3352F8, *MEMORY[0x24BE75DA0]);
    }
    objc_msgSend(v9, "setProperty:forKey:", v6, CFSTR("NDOWarranty"));
    objc_msgSend(v9, "setProperty:forKey:", v4, CFSTR("NDODeviceInfo"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)warrantySpecifiersFromDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;

  v4 = a3;
  objc_msgSend(v4, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("WARRANTY_GROUP"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDOSpecifierDataSource setWarrantyGroupSpecifier:](self, "setWarrantyGroupSpecifier:", v7);

    -[NDOSpecifierDataSource warrantyGroupSpecifier](self, "warrantyGroupSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

    -[NDOSpecifierDataSource deviceDescriptionSpecifierWithDeviceInfo:](self, "deviceDescriptionSpecifierWithDeviceInfo:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);
    objc_msgSend(v4, "warranty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acOfferDisplayDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "warranty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "acOfferEligible");
    if (v11)
    {
      if (!v13)
        goto LABEL_13;
      objc_msgSend(v4, "warranty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acOfferDisplayDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceNow");
      if (v16 > 0.0)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v4, "warranty");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "acOfferEligibleUntil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      v20 = v19;

    }
    else
    {
      if (!v13)
        goto LABEL_13;
      objc_msgSend(v4, "warranty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acOfferEligibleUntil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceNow");
      v20 = v21;
    }

    if (v20 <= 0.0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v22 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v4, "warranty");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "acLocalizedOfferCTA");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, self, 0, 0, 0, 13, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setProperty:forKey:", CFSTR("WARRANTY_OFFER"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v12, "setButtonAction:", sel_ndoAppleCareCoveragePressed_);
    objc_msgSend(v12, "setProperty:forKey:", v4, CFSTR("NDODeviceInfo"));
    objc_msgSend(v12, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v6, "addObject:", v12);
    objc_msgSend(v4, "warranty");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "acLocalizedOfferDesc");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
    {
      objc_msgSend(v4, "warranty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "acLocalizedOfferDesc");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDOSpecifierDataSource warrantyGroupSpecifier](self, "warrantyGroupSpecifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A68]);

      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  v6 = (void *)MEMORY[0x24BDBD1A8];
LABEL_15:

  return v6;
}

- (void)ndoAppleCareCoveragePressed:(id)a3
{
  NDOAppleCareViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  NDOAppleCareViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "propertyForKey:", CFSTR("NDODeviceInfo"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [NDOAppleCareViewController alloc];
  objc_msgSend(v19, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceFromDeviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("_ABOUT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NDOAppleCareViewController initWithDeviceInfo:presentationType:source:deeplinkParams:](v4, "initWithDeviceInfo:presentationType:source:deeplinkParams:", v19, 0, v7, 0);

  -[NDOAppleCareViewController setPresentor:](v8, "setPresentor:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
  {

    v10 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom") == 6;

    v10 = 2 * v12;
  }
  -[NDOAppleCareViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", v10);
  -[NDOAppleCareViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "userInterfaceIdiom") == 1)
  {

LABEL_7:
    objc_msgSend(v13, "setModalPresentationStyle:", 2);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 6)
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v13, "setModalInPresentation:", 1);
  -[NDOSpecifierDataSource hostingController](self, "hostingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "parentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentViewController:animated:completion:", v13, 1, 0);

}

- (id)warrantyDetailText:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (void)updateNDOSpecifiersWithPolicy:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v14 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_229EC7000, v7, OS_LOG_TYPE_DEFAULT, "%s: updateNDOSpecifiersWithPolicy: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke;
  v10[3] = &unk_24F335148;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = (id)a3;
  v9 = v6;
  v11 = v9;
  -[NDOSpecifierDataSource specifiersWithPolicy:completionHandler:](self, "specifiersWithPolicy:completionHandler:", a3, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);

}

void __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9[2];

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_2;
  v6[3] = &unk_24F335120;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v7 = v3;
  v9[1] = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(v9);
}

void __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(WeakRetained, "ndoSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(WeakRetained, "hostingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "hostingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "specifierIDToInsertAfter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "specifierForID:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_3;
      v28[3] = &unk_24F3350F8;
      v28[4] = WeakRetained;
      v29 = *(id *)(a1 + 32);
      v30 = v12;
      v32 = *(_QWORD *)(a1 + 56);
      v31 = *(id *)(a1 + 40);
      v13 = v12;
      objc_msgSend(v8, "performUpdatesAnimated:usingBlock:", v3 != v5, v28);

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "hostingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "specifierForID:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_10:
    v27 = *(_QWORD *)(a1 + 40);
    if (v27)
      (*(void (**)(void))(v27 + 16))();
    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x24BE755A0];
  objc_msgSend(WeakRetained, "hostingController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parentViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "specifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updatesWithSpecifiers:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateSpecifiers:specifierToInsertAfter:withUpdates:", *(_QWORD *)(a1 + 32), v16, v21);
  objc_msgSend(WeakRetained, "hostingController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "performSpecifierUpdates:", v21);

  _NDOLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]_block_invoke";
    v35 = 2112;
    v36 = v25;
    _os_log_impl(&dword_229EC7000, v24, OS_LOG_TYPE_DEFAULT, "%s: DONE updateNDOSpecifiersWithPolicy: %@ with no datasource", buf, 0x16u);

  }
  v26 = *(_QWORD *)(a1 + 40);
  if (v26)
    (*(void (**)(void))(v26 + 16))();

LABEL_12:
}

uint64_t __67__NDOSpecifierDataSource_updateNDOSpecifiersWithPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t result;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateSpecifiers:specifierToInsertAfter:withUpdates:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:]_block_invoke_3";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_229EC7000, v3, OS_LOG_TYPE_DEFAULT, "%s: DONE updateNDOSpecifiersWithPolicy: %@", (uint8_t *)&v6, 0x16u);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateSpecifiers:(id)a3 specifierToInsertAfter:(id)a4 withUpdates:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  v10 = (void *)objc_msgSend(v11, "mutableCopy");
  -[NDOSpecifierDataSource setNdoSpecifiers:](self, "setNdoSpecifiers:", v10);

  objc_msgSend(v8, "removeSpecifierWithID:", CFSTR("WARRANTY_GROUP"));
  objc_msgSend(v8, "removeSpecifierWithID:", CFSTR("WARRANTY_DESCRIPTION"));
  objc_msgSend(v8, "removeSpecifierWithID:", CFSTR("WARRANTY_OFFER"));
  objc_msgSend(v8, "insertContiguousSpecifiers:afterSpecifier:", v11, v9);

}

- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];

  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke;
  v13[3] = &unk_24F334D30;
  v13[4] = self;
  v13[5] = a4;
  v8 = (void (**)(_QWORD))MEMORY[0x22E2D8D84](v13);
  if (!a4)
    goto LABEL_10;
  v9 = (void *)objc_opt_new();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_80;
  v11[3] = &unk_24F334910;
  v12 = v6;
  objc_msgSend(v9, "dismissFollowUpForSerialNumber:completion:", v12, v11);
  if (a4 == 5 || a4 == 3)
  {
    v10 = 2;
  }
  else
  {
    if (a4 == 2)
    {
      -[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:](self, "updateNDOSpecifiersWithPolicy:completion:", 2, v8);

      goto LABEL_11;
    }
    v10 = 0;
  }
  -[NDOSpecifierDataSource updateNDOSpecifiersWithPolicy:completion:](self, "updateNDOSpecifiersWithPolicy:completion:", v10, &__block_literal_global_87);

  if (a4 != 3 && a4 != 5)
LABEL_10:
    v8[2](v8);
LABEL_11:

}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2;
  block[3] = &unk_24F334D08;
  objc_copyWeak(v3, &location);
  v3[1] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NDOWarrantyInfoController *v6;
  void *v7;
  void *v8;
  NDOWarrantyInfoController *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  NDOWarrantyInfoController *v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    objc_msgSend(WeakRetained, "ndoSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specifierForID:", CFSTR("WARRANTY_DESCRIPTION"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[NDOWarrantyInfoController initWithSpecifier:]([NDOWarrantyInfoController alloc], "initWithSpecifier:", v5);
    objc_msgSend(v3, "hostingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_3;
    v13[3] = &unk_24F334A88;
    v14 = v8;
    v15 = v6;
    v9 = v6;
    v10 = v8;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v13);

  }
  else
  {
    objc_msgSend(WeakRetained, "hostingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 0);

  _NDOLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke_3";
    _os_log_impl(&dword_229EC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: New Device info refreshed after purchase done", (uint8_t *)&v4, 0xCu);
  }

}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_80(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("Failed to dismiss");
    v8 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136446722;
    if (a2)
      v5 = CFSTR("Dismissed");
    v9 = 2114;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_229EC7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@ followup up for %@", (uint8_t *)&v7, 0x20u);
  }

}

void __83__NDOSpecifierDataSource_outreachFinishedForDeviceWithSerialNumber_withCompletion___block_invoke_86()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136446210;
    v2 = "-[NDOSpecifierDataSource outreachFinishedForDeviceWithSerialNumber:withCompletion:]_block_invoke";
    _os_log_impl(&dword_229EC7000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: Device info refreshed only.", (uint8_t *)&v1, 0xCu);
  }

}

- (NDOManager)ndoManager
{
  return self->_ndoManager;
}

- (void)setNdoManager:(id)a3
{
  objc_storeStrong((id *)&self->_ndoManager, a3);
}

- (NDOACController)hostingController
{
  return (NDOACController *)objc_loadWeakRetained((id *)&self->_hostingController);
}

- (void)setHostingController:(id)a3
{
  objc_storeWeak((id *)&self->_hostingController, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSMutableArray)ndoSpecifiers
{
  return self->_ndoSpecifiers;
}

- (void)setNdoSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_ndoSpecifiers, a3);
}

- (PSSpecifier)warrantyGroupSpecifier
{
  return self->_warrantyGroupSpecifier;
}

- (void)setWarrantyGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_warrantyGroupSpecifier, a3);
}

- (BOOL)isDefaultDevice
{
  return self->_isDefaultDevice;
}

- (void)setIsDefaultDevice:(BOOL)a3
{
  self->_isDefaultDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warrantyGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_ndoSpecifiers, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_destroyWeak((id *)&self->_hostingController);
  objc_storeStrong((id *)&self->_ndoManager, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_policyLookupQueue, 0);
}

@end
