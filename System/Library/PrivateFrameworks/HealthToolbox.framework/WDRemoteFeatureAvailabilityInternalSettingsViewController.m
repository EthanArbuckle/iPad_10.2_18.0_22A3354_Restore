@implementation WDRemoteFeatureAvailabilityInternalSettingsViewController

- (WDRemoteFeatureAvailabilityInternalSettingsViewController)initWithConditions:(id)a3
{
  id v5;
  WDRemoteFeatureAvailabilityInternalSettingsViewController *v6;
  WDRemoteFeatureAvailabilityInternalSettingsViewController *v7;
  uint64_t v8;
  NSUserDefaults *userDefaults;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  v6 = -[WDRemoteFeatureAvailabilityInternalSettingsViewController initWithStyle:](&v11, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conditions, a3);
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_remoteFeatureAvailabilityUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (NSUserDefaults *)v8;

    -[WDRemoteFeatureAvailabilityInternalSettingsViewController setTitle:](v7, "setTitle:", CFSTR("Remote Conditions"));
    -[WDRemoteFeatureAvailabilityInternalSettingsViewController _registerForNotifications](v7, "_registerForNotifications");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController _unregisterForNotifications](self, "_unregisterForNotifications");
  v3.receiver = self;
  v3.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDRemoteFeatureAvailabilityInternalSettingsViewController;
  -[HKTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController reloadUserDefaultsContent](self, "reloadUserDefaultsContent");
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_registerForNotifications
{
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x24BDD36E8];
  v4 = MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__WDRemoteFeatureAvailabilityInternalSettingsViewController__registerForNotifications__block_invoke;
  v6[3] = &unk_24D38E490;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v3, &self->_featureAvailabilityConditionsDidUpdateNotificationToken, v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __86__WDRemoteFeatureAvailabilityInternalSettingsViewController__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_featureAvailabilityConditionsDidUpdate");

}

- (void)_unregisterForNotifications
{
  if (notify_is_valid_token(self->_featureAvailabilityConditionsDidUpdateNotificationToken))
    notify_cancel(self->_featureAvailabilityConditionsDidUpdateNotificationToken);
}

- (void)_featureAvailabilityConditionsDidUpdate
{
  id v3;

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController reloadUserDefaultsContent](self, "reloadUserDefaultsContent");
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)reloadUserDefaultsContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController setUserDefaultsContent:](self, "setUserDefaultsContent:", v4);

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContent](self, "userDefaultsContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__WDRemoteFeatureAvailabilityInternalSettingsViewController_reloadUserDefaultsContent__block_invoke;
  v9[3] = &unk_24D38E4B8;
  v9[4] = self;
  objc_msgSend(v6, "hk_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController setUserDefaultsContentKeys:](self, "setUserDefaultsContentKeys:", v8);

}

uint64_t __86__WDRemoteFeatureAvailabilityInternalSettingsViewController_reloadUserDefaultsContent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)jsonStringFromDictionary:(id)a3
{
  void *v3;
  __CFString *v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 1, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  else
    v4 = CFSTR("⚠️ Parsing data error");

  return v4;
}

- (id)evaluateRulesForCondition:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = NSClassFromString(CFSTR("HKActiveWatchRemoteFeatureAvailabilityDataSource"));
  if (v5)
  {
    v6 = objc_alloc_init(v5);
    -[WDRemoteFeatureAvailabilityInternalSettingsViewController currentlocaleCountryCode](self, "currentlocaleCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("onboardingCountryCode"));

    v8 = objc_alloc(MEMORY[0x24BDD3EC8]);
    -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContent](self, "userDefaultsContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithRawValue:dataSource:supportedConditions:", v9, v6, v12);

    objc_msgSend(v13, "evaluateAll");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)currentlocaleCountryCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  unint64_t v4;

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContentKeys](self, "userDefaultsContentKeys", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContentKeys](self, "userDefaultsContentKeys", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 2;
  else
    return 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContentKeys](self, "userDefaultsContentKeys", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;

  if (v7 == a4)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[WDRemoteFeatureAvailabilityInternalSettingsViewController currentlocaleCountryCode](self, "currentlocaleCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("The current device region from the locale has been used to evaluate the conditions here (%@)."), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("default_cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("default_cell"));
  -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContentKeys](self, "userDefaultsContentKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContentKeys](self, "userDefaultsContentKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "row"))
    {
      -[WDRemoteFeatureAvailabilityInternalSettingsViewController userDefaultsContent](self, "userDefaultsContent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDRemoteFeatureAvailabilityInternalSettingsViewController jsonStringFromDictionary:](self, "jsonStringFromDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", v14);

      objc_msgSend(v7, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 0);

    }
    else
    {
      objc_msgSend(v7, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v11);

      objc_msgSend(v7, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNumberOfLines:", 1);

      -[WDRemoteFeatureAvailabilityInternalSettingsViewController evaluateRulesForCondition:](self, "evaluateRulesForCondition:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v24;
      if (v24)
      {
        if (objc_msgSend(v24, "BOOLValue"))
          v25 = CFSTR("🟢");
        else
          v25 = CFSTR("🔴");
        objc_msgSend(v7, "detailTextLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = v25;
        goto LABEL_13;
      }
    }
    objc_msgSend(v7, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = 0;
LABEL_13:
    objc_msgSend(v17, "setText:", v19);

    goto LABEL_14;
  }
  objc_msgSend(v7, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", CFSTR("N/A"));

  objc_msgSend(v7, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNumberOfLines:", 1);

  objc_msgSend(v7, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", 0);
LABEL_14:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (int)featureAvailabilityConditionsDidUpdateNotificationToken
{
  return self->_featureAvailabilityConditionsDidUpdateNotificationToken;
}

- (void)setFeatureAvailabilityConditionsDidUpdateNotificationToken:(int)a3
{
  self->_featureAvailabilityConditionsDidUpdateNotificationToken = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSDictionary)userDefaultsContent
{
  return self->_userDefaultsContent;
}

- (void)setUserDefaultsContent:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsContent, a3);
}

- (NSArray)userDefaultsContentKeys
{
  return self->_userDefaultsContentKeys;
}

- (void)setUserDefaultsContentKeys:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsContentKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsContentKeys, 0);
  objc_storeStrong((id *)&self->_userDefaultsContent, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
