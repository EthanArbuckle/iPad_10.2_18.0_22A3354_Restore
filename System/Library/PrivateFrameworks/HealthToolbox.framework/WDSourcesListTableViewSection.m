@implementation WDSourcesListTableViewSection

- (void)dealloc
{
  objc_super v3;

  -[HKSourceListDataSource unregisterObserver:](self->_dataSource, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WDSourcesListTableViewSection;
  -[WDSourcesListTableViewSection dealloc](&v3, sel_dealloc);
}

- (void)setSourceListDataSource:(id)a3
{
  HKSourceListDataSource *v5;
  HKSourceListDataSource *dataSource;
  void *v7;
  HKSourceListDataSource *v8;

  v5 = (HKSourceListDataSource *)a3;
  dataSource = self->_dataSource;
  v8 = v5;
  if (dataSource != v5)
  {
    -[HKSourceListDataSource unregisterObserver:](dataSource, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[HKSourceListDataSource registerObserver:](v8, "registerObserver:", self);
    -[HKSourceListDataSource sources](v8, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[WDSourcesListTableViewSection dataSourceDidUpdate](self, "dataSourceDidUpdate");
  }

}

- (void)setRestorationSourceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_restorationSourceBundleIdentifier, a3);
}

- (double)estimatedHeightForRow:(unint64_t)a3
{
  return *MEMORY[0x24BE4A140];
}

- (double)heightForRow:(unint64_t)a3
{
  return *MEMORY[0x24BDF7DE0];
}

- (id)noneCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WDSourcesListTableViewSectionNoSources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDSourcesListTableViewSectionNoSources"));
  objc_msgSend(v4, "setAccessoryType:", 0);
  objc_msgSend(v4, "setSelectionStyle:", 0);
  -[WDSourcesListTableViewSection noneString](self, "noneString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  return v4;
}

- (id)noneString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NONE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailViewControllerForSourceModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WDTableViewSection delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "detailViewControllerForSourceModel:withProfile:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)detailViewControllerForSourceModel:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WDAuthorizationSettingsViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  WDSourceMessageViewController *v31;
  void *v33;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "_requiresAuthorization") & 1) != 0)
  {
    if ((objc_msgSend(v5, "installed") & 1) != 0
      || (objc_msgSend(v6, "healthStore"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "profileIdentifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "type"),
          v9,
          v8,
          v10 == 3))
    {
      objc_msgSend(v6, "healthStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "healthRecordsStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A320]), "initWithHealthStore:healthRecordsStore:source:typesRequestedForReading:", v11, v12, v7, 0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A880]), "initWithHealthStore:source:typesForSharing:typesForReading:", v11, v7, 0, 0);
      v15 = -[WDAuthorizationSettingsViewController initWithProfile:style:]([WDAuthorizationSettingsViewController alloc], "initWithProfile:style:", v6, 0);
      objc_msgSend(v5, "purposeStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x24BE4A0A8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAuthorizationSettingsViewController setShareDescription:](v15, "setShareDescription:", v17);

      objc_msgSend(v5, "purposeStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE4A0C8]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAuthorizationSettingsViewController setUpdateDescription:](v15, "setUpdateDescription:", v19);

      objc_msgSend(v5, "purposeStrings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE4A0A0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAuthorizationSettingsViewController setResearchStudyUsageDescription:](v15, "setResearchStudyUsageDescription:", v21);

      -[HKAuthorizationSettingsViewController setSource:](v15, "setSource:", v7);
      if (objc_msgSend(v13, "anyTypeRequested"))
      {
        v22 = objc_alloc(MEMORY[0x24BE4A310]);
        objc_msgSend(v5, "purposeStrings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE4A088]);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v12;
        v26 = v14;
        v27 = (void *)v24;
        v33 = v25;
        v28 = objc_msgSend(v22, "initWithHealthStore:healthRecordsStore:authorizationController:readUsageDescription:source:", v11);

        v14 = v26;
        v29 = (void *)v28;

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A318]), "initWithContext:style:", v28, 0);
        if (objc_msgSend(v14, "anyTypeRequested"))
        {
          v31 = (WDSourceMessageViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A888]), "initWithHealthStore:source:", v11, v7);
          -[WDSourceMessageViewController setClinicalAuthorizationController:](v31, "setClinicalAuthorizationController:", v13);
          -[WDSourceMessageViewController setClinicalAuthorizationSettingsViewController:](v31, "setClinicalAuthorizationSettingsViewController:", v30);
          -[WDSourceMessageViewController setHealthDataAuthorizationController:](v31, "setHealthDataAuthorizationController:", v14);
          -[WDSourceMessageViewController setHealthDataAuthorizationSettingsViewController:](v31, "setHealthDataAuthorizationSettingsViewController:", v15);
        }
        else
        {
          v31 = v30;
        }

        v12 = v33;
      }
      else
      {
        v31 = v15;
      }

    }
    else
    {
      v31 = -[WDSourceMessageViewController initWithStyle:source:]([WDSourceMessageViewController alloc], "initWithStyle:source:", 1, v7);
    }
  }
  else
  {
    v31 = objc_alloc_init(WDSourceStoredDataViewController);
    -[WDSourceMessageViewController setSource:](v31, "setSource:", v7);
    -[WDSourceMessageViewController setProfile:](v31, "setProfile:", v6);
  }

  return v31;
}

- (BOOL)shouldHideHeader
{
  return self->_shouldHideHeader;
}

- (void)setShouldHideHeader:(BOOL)a3
{
  self->_shouldHideHeader = a3;
}

- (HKSourceListDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSString)restorationSourceBundleIdentifier
{
  return self->_restorationSourceBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorationSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
