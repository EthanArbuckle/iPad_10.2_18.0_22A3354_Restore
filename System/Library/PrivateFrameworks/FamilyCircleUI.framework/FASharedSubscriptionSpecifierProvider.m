@implementation FASharedSubscriptionSpecifierProvider

- (FASharedSubscriptionSpecifierProvider)initWithAppleAccount:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  FASharedSubscriptionSpecifierProvider *v9;
  FASharedSubscriptionSpecifierProvider *v10;
  NSOperationQueue *v11;
  NSOperationQueue *networkActivityQueue;
  uint64_t v13;
  NSHashTable *subscribers;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FASharedSubscriptionSpecifierProvider;
  v9 = -[FASharedSubscriptionSpecifierProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a4);
    v10->_updateSubsriptionSpecifiers = 1;
    objc_storeStrong((id *)&v10->_appleAccount, a3);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkActivityQueue = v10->_networkActivityQueue;
    v10->_networkActivityQueue = v11;

    -[NSOperationQueue setQualityOfService:](v10->_networkActivityQueue, "setQualityOfService:", 33);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    subscribers = v10->_subscribers;
    v10->_subscribers = (NSHashTable *)v13;

    v10->_numberOfGroups = 0;
  }

  return v10;
}

- (id)_sharedSubscriptionSpecifierCell:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Shared Subscriptions"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i Subscriptions"), v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.clockwise"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SharedSubscriptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);
  objc_msgSend(v11, "setProperty:forKey:", v7, *MEMORY[0x24BE75D50]);
  objc_msgSend(v11, "setProperty:forKey:", v8, *MEMORY[0x24BE75D28]);
  objc_msgSend(v11, "setProperty:forKey:", v9, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE759F8]);
  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v11, "setButtonAction:", sel__addSharedSubscriptionsButtonWasTapped_);
  objc_msgSend(v5, "addObject:", v11);

  return v5;
}

- (void)addSubscriber:(id)a3
{
  -[NSHashTable addObject:](self->_subscribers, "addObject:", a3);
}

- (void)removeSubscriber:(id)a3
{
  -[NSHashTable removeObject:](self->_subscribers, "removeObject:", a3);
}

- (id)_sharedSubscriptionGroupSpecifier
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("FASharedServices"));
}

- (NSArray)specifiers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSArray **v7;
  NSObject *p_super;
  NSArray *v9;
  NSArray **p_specifiers;
  NSArray *v11;
  void *v13;
  uint64_t v14;
  NSArray *specifiers;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id obj;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (*(_WORD *)&self->_updateSubsriptionSpecifiers)
  {
    -[FASharedSubscriptionSpecifierProvider _sharedSubscriptionGroupSpecifier](self, "_sharedSubscriptionGroupSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    self->_updateSubsriptionSpecifiers = 0;
    self->_specifierState = 1;
    -[FASharedSubscriptionSpecifierProvider _loadSubscriptionServices](self, "_loadSubscriptionServices");
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    objc_msgSend(v3, "addObject:", v5);
    goto LABEL_4;
  }
  -[FASharedServicesResponse services](self->_sharedSubscriptionResponse, "services");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    -[FASharedSubscriptionSpecifierProvider _sharedSubscriptionGroupSpecifier](self, "_sharedSubscriptionGroupSpecifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

    self->_specifierState = 2;
    v30 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("FAILED_TO_LOAD_SERVICES"), &stru_24C8A3000, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, 0, 0, 0, 0, -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    goto LABEL_3;
  }
  p_specifiers = &self->_specifiers;
  specifiers = self->_specifiers;
  if (!specifiers || !-[NSArray count](specifiers, "count") || self->_specifierState != 3)
  {
    self->_specifierState = 3;
    -[FASharedServicesResponse serviceGroups](self->_sharedSubscriptionResponse, "serviceGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[FASharedServicesResponse serviceGroups](self->_sharedSubscriptionResponse, "serviceGroups");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v39 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(v22, "headerText");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "footerText");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "groupSpecifierWithHeader:footer:", v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v26);

            ++self->_numberOfGroups;
            objc_msgSend(v22, "services");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[FASharedSubscriptionSpecifierProvider _serviceSpecifiersFromArray:](self, "_serviceSpecifiersFromArray:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObjectsFromArray:", v28);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v19);
      }

      goto LABEL_5;
    }
    _FALogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v33, OS_LOG_TYPE_DEFAULT, "No groups, kickin it old school.", buf, 2u);
    }

    -[FASharedSubscriptionSpecifierProvider _sharedSubscriptionGroupSpecifier](self, "_sharedSubscriptionGroupSpecifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v34);

    -[FASharedServicesResponse services](self->_sharedSubscriptionResponse, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FASharedSubscriptionSpecifierProvider _serviceSpecifiersFromArray:](self, "_serviceSpecifiersFromArray:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v35);

LABEL_4:
LABEL_5:
    v6 = objc_msgSend(v3, "copy");
    v9 = self->_specifiers;
    v7 = &self->_specifiers;
    p_super = &v9->super;
    *v7 = (NSArray *)v6;
    p_specifiers = v7;
    goto LABEL_6;
  }
  _FALogSystem();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, p_super, OS_LOG_TYPE_DEFAULT, "Returning existing specifiers.", buf, 2u);
  }
LABEL_6:

  v11 = *p_specifiers;
  return v11;
}

- (id)_serviceSpecifiersFromArray:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__FASharedSubscriptionSpecifierProvider__serviceSpecifiersFromArray___block_invoke;
  v4[3] = &unk_24C88C8B8;
  v4[4] = self;
  objc_msgSend(a3, "fa_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __69__FASharedSubscriptionSpecifierProvider__serviceSpecifiersFromArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = a2;
  objc_msgSend(v4, "displayLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, *(_QWORD *)(a1 + 32), 0, sel__valueForServiceSpecifier_, 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75D28]);

  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  v8 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(*(id *)(a1 + 32), "_iconURLStringForService:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75B98]);
  objc_msgSend(v6, "setControllerLoadAction:", sel__serviceSpecifierWasTapped_);
  objc_msgSend(v6, "setUserInfo:", v4);
  objc_msgSend(v4, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v11);

  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "actionURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v14, CFSTR("FASharedServicesSpecifierActionURLKey"));

  return v6;
}

- (id)_iconURLStringForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSListController view](self->_presenter, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = (int)v8;

  switch(v9)
  {
    case 3:
      objc_msgSend(v4, "iconURLStringx3");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v4, "iconURLStringx2");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v4, "iconURLString");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v10;
      goto LABEL_11;
  }
  objc_msgSend(v4, "iconURLStringx3");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[FASharedSubscriptionSpecifierProvider _iconURLStringForService:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

LABEL_11:
  _FALogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v22[0] = 67109120;
    v22[1] = v9;
    _os_log_impl(&dword_20DE41000, v20, OS_LOG_TYPE_DEFAULT, "Returning service image at scale - %d", (uint8_t *)v22, 8u);
  }

  return v11;
}

- (void)_serviceSpecifierWasTapped:(id)a3
{
  FASharedSubscriptionSpecifierProviderSelectionHandler **p_selectionHandler;
  id v4;
  id WeakRetained;

  p_selectionHandler = &self->_selectionHandler;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_selectionHandler);
  objc_msgSend(WeakRetained, "didSelectSpecifier:", v4);

}

- (id)_valueForServiceSpecifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FASharedSubscriptionSpecifierProvider _valueForServiceSpecifier:].cold.1();

  objc_msgSend(v4, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_loadSubscriptionServices
{
  NSOperationQueue *networkActivityQueue;
  _QWORD v3[5];

  if (!self->_isLoadingSpecifiers)
  {
    self->_isLoadingSpecifiers = 1;
    self->_specifierState = 1;
    networkActivityQueue = self->_networkActivityQueue;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke;
    v3[3] = &unk_24C88B7F0;
    v3[4] = self;
    -[NSOperationQueue addOperationWithBlock:](networkActivityQueue, "addOperationWithBlock:", v3);
  }
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[7];
  uint8_t buf[16];

  _FASignpostLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = _FASignpostCreate(v2);
  v5 = v4;

  _FASignpostLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20DE41000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchFamilySubscriptions", " enableTelemetry=YES ", buf, 2u);
  }

  _FASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_cold_1();

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_72;
  aBlock[3] = &unk_24C88C8E0;
  aBlock[5] = v3;
  aBlock[6] = v5;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_opt_new();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2;
  v13[3] = &unk_24C88C440;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "fetchAAURLConfigurationWithCompletion:", v13);

}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_72(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t Nanoseconds;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  id v9;
  double v10;
  uint64_t v11;
  int v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Nanoseconds = _FASignpostGetNanoseconds(a1[5], a1[6]);
  _FASignpostLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v16) = objc_msgSend(v3, "statusCode");
    _os_signpost_emit_with_name_impl(&dword_20DE41000, v6, OS_SIGNPOST_INTERVAL_END, v7, "FetchFamilySubscriptions", " StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d ", buf, 8u);
  }

  _FASignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = (double)Nanoseconds / 1000000000.0;
    v11 = a1[5];
    v12 = objc_msgSend(v3, "statusCode");
    *(_DWORD *)buf = 134218496;
    v16 = v11;
    v17 = 2048;
    v18 = v10;
    v19 = 1026;
    v20 = v12;
    _os_log_debug_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:FetchFamilySubscriptions  StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d ", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_73;
  v13[3] = &unk_24C88B958;
  v13[4] = a1[4];
  v14 = v3;
  v9 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_73(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSubscriptionListResponse:", *(_QWORD *)(a1 + 40));
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  FASharedServicesRequest *v13;
  uint64_t v14;
  void *v15;
  FASharedServicesRequest *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];

  objc_msgSend(a2, "urlForEndpoint:", CFSTR("getFamilySubscriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_1();

  v13 = [FASharedServicesRequest alloc];
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FASharedServicesRequest initWithAppleAccount:urlString:](v13, "initWithAppleAccount:urlString:", v14, v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04A18]), "initWithRequest:handler:", v16, *(_QWORD *)(a1 + 40));
  _FALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_20DE41000, v18, OS_LOG_TYPE_DEFAULT, "Fetching family subscriptions.", v19, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addOperation:", v17);
}

- (NSArray)subscriptionSpecifiers
{
  NSArray **p_subscriptionSpecifiers;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  id *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_subscriptionSpecifiers = &self->_subscriptionSpecifiers;
  if (!-[NSArray count](self->_subscriptionSpecifiers, "count"))
  {
    -[FASharedSubscriptionSpecifierProvider specifiers](self, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = v5;
    if (!self->_isLoadingSpecifiers)
    {
      v18 = (id *)p_subscriptionSpecifiers;
      v19 = v5;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v17 = v4;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v12, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqual:", CFSTR("ICLOUD_STORAGE")))
            {

            }
            else
            {
              objc_msgSend(v12, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqual:", CFSTR("SHARE_MY_LOCATION"));

              if ((v15 & 1) == 0)
                objc_msgSend(v19, "addObject:", v12);
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      p_subscriptionSpecifiers = (NSArray **)v18;
      v6 = v19;
      objc_storeStrong(v18, v19);
      v4 = v17;
    }

  }
  return *p_subscriptionSpecifiers;
}

- (NSArray)subscriptionsFamilyViewSpecifier
{
  FASharedSubscriptionSpecifierProvider *v2;
  NSArray *subscriptionsFamilyViewSpecifier;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  NSArray *v18;
  NSArray *v20;
  void *v21;
  FASharedSubscriptionSpecifierProvider *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x24BDAC8D0];
  subscriptionsFamilyViewSpecifier = self->_subscriptionsFamilyViewSpecifier;
  if (!subscriptionsFamilyViewSpecifier || !-[NSArray count](subscriptionsFamilyViewSpecifier, "count"))
  {
    -[FASharedSubscriptionSpecifierProvider specifiers](v2, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v2->_isLoadingSpecifiers)
    {
      v22 = v2;
      v6 = objc_msgSend(v4, "count") - v2->_numberOfGroups;
      v20 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = v5;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v21 = v5;
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v12, "identifier", v20);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqual:", CFSTR("ICLOUD_STORAGE"));

            if (v14)
            {
              v6 = (v6 - 1);
              objc_msgSend(v7, "addObject:", v12);
            }
            objc_msgSend(v12, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", CFSTR("SHARE_MY_LOCATION"));

            if (v16)
            {
              v6 = (v6 - 1);
              objc_msgSend(v7, "addObject:", v12);
            }
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v9);
      }

      v2 = v22;
      -[FASharedSubscriptionSpecifierProvider _sharedSubscriptionSpecifierCell:](v22, "_sharedSubscriptionSpecifierCell:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v17);

      -[NSArray addObjectsFromArray:](v20, "addObjectsFromArray:", v7);
      v18 = v22->_subscriptionsFamilyViewSpecifier;
      v22->_subscriptionsFamilyViewSpecifier = v20;

      v5 = v21;
    }

  }
  return v2->_subscriptionsFamilyViewSpecifier;
}

- (void)_handleSubscriptionListResponse:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSHashTable *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  self->_isLoadingSpecifiers = 0;
  if (objc_msgSend(v5, "statusCode") != 200)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get subscription services %@", buf, 0xCu);

    }
  }
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "responseDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Received shared services response %@ - resourceDictionary: %@", buf, 0x16u);

  }
  objc_msgSend(v5, "services");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_11;
  v11 = (void *)v10;
  -[FASharedServicesResponse services](self->_sharedSubscriptionResponse, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    _FALogSystem();
    v15 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, &v15->super, OS_LOG_TYPE_DEFAULT, "Response matches current subscription services; not reloading specifiers",
        buf,
        2u);
    }
  }
  else
  {
LABEL_11:
    _FALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v16, OS_LOG_TYPE_DEFAULT, "Response indicates changes to subscription services; reloading specifiers",
        buf,
        2u);
    }

    objc_storeStrong((id *)&self->_sharedSubscriptionResponse, a3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = self->_subscribers;
    v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, self->_subscriptionSpecifiers, 1, (_QWORD)v22);
          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }
  }

  -[FASharedSubscriptionSpecifierProvider _delayedLoadIfNeeded](self, "_delayedLoadIfNeeded");
}

- (BOOL)handleURL:(id)a3
{
  id v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = -[FASharedSubscriptionSpecifierProvider _launchWithResourceDictionary:](self, "_launchWithResourceDictionary:", v5);
  if (!v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "FASharedSubscriptionSpecifierProvider doesn't have the specifier, will try again upon response.", v9, 2u);
    }

    objc_storeStrong((id *)&self->_cachedResourceDictionary, a3);
  }

  return v6;
}

- (BOOL)_launchWithResourceDictionary:(id)a3
{
  void *v4;
  void *v5;
  NSDictionary *cachedResourceDictionary;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  NSArray *specifiers;
  int v14;
  void *v15;
  __int16 v16;
  NSArray *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE30978]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FASharedSubscriptionSpecifierProvider _specifierNamed:](self, "_specifierNamed:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    cachedResourceDictionary = self->_cachedResourceDictionary;
    if (cachedResourceDictionary)
    {
      v18 = CFSTR("HookContinuationParameters");
      v19[0] = cachedResourceDictionary;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", v7, CFSTR("FASharedServicesAdditionalParameters"));
      _FALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[FASharedSubscriptionSpecifierProvider _launchWithResourceDictionary:].cold.1();

    }
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "We have the service specifier, tapping!", (uint8_t *)&v14, 2u);
      }

      -[FASharedSubscriptionSpecifierProvider _serviceSpecifierWasTapped:](self, "_serviceSpecifierWasTapped:", v5);
      v11 = 1;
    }
    else
    {
      if (v10)
      {
        specifiers = self->_specifiers;
        v14 = 138412546;
        v15 = v4;
        v16 = 2112;
        v17 = specifiers;
        _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "A specifier for \"%@\" was not found in: %@", (uint8_t *)&v14, 0x16u);
      }
      v11 = 0;
      v5 = v9;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_delayedLoadIfNeeded
{
  NSObject *v3;
  NSDictionary *cachedResourceDictionary;
  uint8_t v5[16];

  if (self->_cachedResourceDictionary)
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "We have a cached resource dictionary, let's try launching.", v5, 2u);
    }

    -[FASharedSubscriptionSpecifierProvider _launchWithResourceDictionary:](self, "_launchWithResourceDictionary:", self->_cachedResourceDictionary);
    cachedResourceDictionary = self->_cachedResourceDictionary;
    self->_cachedResourceDictionary = 0;

  }
}

- (id)_specifierNamed:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_specifiers;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reloadSpecifiers
{
  NSObject *v3;
  FASharedServicesResponse *sharedSubscriptionResponse;
  NSArray *subscriptionsFamilyViewSpecifier;
  NSArray *subscriptionSpecifiers;
  uint8_t v7[16];

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "Requesting shared subscription services", v7, 2u);
  }

  sharedSubscriptionResponse = self->_sharedSubscriptionResponse;
  self->_sharedSubscriptionResponse = 0;

  subscriptionsFamilyViewSpecifier = self->_subscriptionsFamilyViewSpecifier;
  self->_subscriptionsFamilyViewSpecifier = 0;

  subscriptionSpecifiers = self->_subscriptionSpecifiers;
  self->_subscriptionSpecifiers = 0;

  self->_numberOfGroups = 0;
  -[FASharedSubscriptionSpecifierProvider _loadSubscriptionServices](self, "_loadSubscriptionServices");
}

- (void)_addSharedSubscriptionsButtonWasTapped:(id)a3
{
  void *v4;
  FASharedSubscriptionsViewController *v5;

  v5 = -[FASharedSubscriptionsViewController initWithAppleAccount:sharedSubscriptionSpecifierProvider:]([FASharedSubscriptionsViewController alloc], "initWithAppleAccount:sharedSubscriptionSpecifierProvider:", self->_appleAccount, self);
  -[PSListController navigationController](self->_presenter, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (FASharedSubscriptionSpecifierProviderSelectionHandler)selectionHandler
{
  return (FASharedSubscriptionSpecifierProviderSelectionHandler *)objc_loadWeakRetained((id *)&self->_selectionHandler);
}

- (void)setSelectionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_selectionHandler, a3);
}

- (void)setSubscriptionSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSubscriptionsFamilyViewSpecifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsFamilyViewSpecifier, 0);
  objc_storeStrong((id *)&self->_subscriptionSpecifiers, 0);
  objc_destroyWeak((id *)&self->_selectionHandler);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_sharedSubscriptionResponse, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_spinnerCell, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

- (void)_iconURLStringForService:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "We did not recieve a valid screen scale - defaulting to 3x image url", a5, a6, a7, a8, 0);
}

- (void)_valueForServiceSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, v0, v1, "Value for service specifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, v0, v1, "BEGIN [%lld]: FetchFamilySubscriptions  enableTelemetry=YES ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, v0, v1, "Grabbed shared subscription URL string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_20DE41000, a1, a3, "No URL string found for family subscriptions.", a5, a6, a7, a8, 0);
}

- (void)_launchWithResourceDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, v0, v1, "Adding hook continuation params %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
