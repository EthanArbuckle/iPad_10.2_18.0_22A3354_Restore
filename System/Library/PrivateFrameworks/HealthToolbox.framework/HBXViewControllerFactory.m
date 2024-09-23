@implementation HBXViewControllerFactory

- (id)localizedDisplayNameForUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HBXViewControllerFactory unitSupport](self, "unitSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDisplayNameForUnit:nameContext:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedInstance
{
  void *v3;
  void *v4;
  HBXViewControllerFactory *v5;
  id v6;
  void *v7;
  void *v8;

  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(a1, "factories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3C48], "primaryStoreIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (HBXViewControllerFactory *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD3C40]);
    v5 = -[HBXViewControllerFactory initWithHealthStore:]([HBXViewControllerFactory alloc], "initWithHealthStore:", v6);
    objc_msgSend(a1, "factories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3C48], "primaryStoreIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);

  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

+ (id)sharedInstanceForHealthStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HBXViewControllerFactory *v7;
  void *v8;
  void *v9;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(a1, "factories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (HBXViewControllerFactory *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[HBXViewControllerFactory initWithHealthStore:]([HBXViewControllerFactory alloc], "initWithHealthStore:", v4);
    objc_msgSend(a1, "factories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  os_unfair_recursive_lock_unlock();

  return v7;
}

+ (NSMutableDictionary)factories
{
  void *v2;
  id v3;
  void *v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_factoriesLock);
  v2 = (void *)_factories;
  if (!_factories)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)_factories;
    _factories = (uint64_t)v3;

    v2 = (void *)_factories;
  }
  return (NSMutableDictionary *)v2;
}

- (id)createHKUnitPreferenceController
{
  void *v2;
  void *v3;

  -[HBXViewControllerFactory profile](self, "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unitController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HBXViewControllerFactory)initWithHealthStore:(id)a3
{
  id v4;
  HBXViewControllerFactory *v5;
  HBXShimWDProfile *v6;
  HBXUnitSupport *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HBXUnitSupport *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HBXViewControllerFactory;
  v5 = -[HBXViewControllerFactory init](&v18, sel_init);
  if (v5)
  {
    v6 = -[HBXShimWDProfile initWithHealthStore:]([HBXShimWDProfile alloc], "initWithHealthStore:", v4);
    -[HBXViewControllerFactory setProfile:](v5, "setProfile:", v6);

    v7 = [HBXUnitSupport alloc];
    -[HBXViewControllerFactory profile](v5, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HBXViewControllerFactory profile](v5, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayTypeController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HBXUnitSupport initWithUnitPreferenceController:displayTypeController:](v7, "initWithUnitPreferenceController:displayTypeController:", v9, v11);
    -[HBXViewControllerFactory setUnitSupport:](v5, "setUnitSupport:", v12);

    v13 = objc_alloc(MEMORY[0x24BE4A658]);
    -[HBXViewControllerFactory profile](v5, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "healthStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithHealthStore:", v15);
    -[HBXViewControllerFactory setChartFactory:](v5, "setChartFactory:", v16);

  }
  return v5;
}

- (WDProfile)profile
{
  return self->_profile;
}

- (id)preferredUnitForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HBXViewControllerFactory unitSupport](self, "unitSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredUnitForType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HBXUnitSupport)unitSupport
{
  return self->_unitSupport;
}

- (void)setUnitSupport:(id)a3
{
  objc_storeStrong((id *)&self->_unitSupport, a3);
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void)setChartFactory:(id)a3
{
  objc_storeStrong((id *)&self->_chartFactory, a3);
}

+ (os_unfair_recursive_lock_s)factoriesLock
{
  return (os_unfair_recursive_lock_s)_factoriesLock;
}

+ (void)resetSharedInstances
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(a1, "factories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  os_unfair_recursive_lock_unlock();
}

- (HBXViewControllerFactory)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)notificationManager
{
  return -[WDProfile notificationManager](self->_profile, "notificationManager");
}

- (id)createBuddyViewControllerWithHealthDetailsLast:(BOOL)a3
{
  return -[WDBuddyFlowUserInfoViewController initWithProfile:isLastScreen:]([WDBuddyFlowUserInfoViewController alloc], "initWithProfile:isLastScreen:", self->_profile, a3);
}

- (id)createSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  return -[WDSourcesViewController initWithProfile:usingInsetStyling:]([WDSourcesViewController alloc], "initWithProfile:usingInsetStyling:", self->_profile, a3);
}

- (id)createAppSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  return -[WDAppSourcesViewController initWithProfile:usingInsetStyling:]([WDAppSourcesViewController alloc], "initWithProfile:usingInsetStyling:", self->_profile, a3);
}

- (id)createSingleAppAuthorizationViewControllerUsingInsetStyling:(BOOL)a3 restorationApplicationBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  WDAppSourcesViewController *v7;

  v4 = a3;
  v6 = a4;
  v7 = -[WDAppSourcesViewController initWithProfile:usingInsetStyling:]([WDAppSourcesViewController alloc], "initWithProfile:usingInsetStyling:", self->_profile, v4);
  -[WDSourcesViewController setRestorationSourceBundleIdentifier:](v7, "setRestorationSourceBundleIdentifier:", v6);

  return v7;
}

- (id)createDeviceSourcesViewControllerUsingInsetStyling:(BOOL)a3
{
  return -[WDDeviceSourcesViewController initWithProfile:usingInsetStyling:]([WDDeviceSourcesViewController alloc], "initWithProfile:usingInsetStyling:", self->_profile, a3);
}

- (id)detailViewControllerForSourceModel:(id)a3 withHealthStore:(id)a4
{
  id v5;
  id v6;
  HBXShimWDProfile *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[HBXShimWDProfile initWithHealthStore:]([HBXShimWDProfile alloc], "initWithHealthStore:", v5);

  objc_msgSend((id)objc_opt_class(), "detailViewControllerForSourceModel:withProfile:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createWatchStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  WDWatchStoredDataViewController *v9;
  HBXShimWDProfile *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[HKTableViewController initWithUsingInsetStyling:]([WDWatchStoredDataViewController alloc], "initWithUsingInsetStyling:", v5);
  -[WDSourceStoredDataViewController setSource:](v9, "setSource:", v8);

  v10 = -[HBXShimWDProfile initWithHealthStore:]([HBXShimWDProfile alloc], "initWithHealthStore:", v7);
  -[WDStoredDataByCategoryViewController setProfile:](v9, "setProfile:", v10);

  return v9;
}

- (id)createLocalDeviceStoredDataViewControllerForSource:(id)a3 withHealthStore:(id)a4 usingInsetStyling:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  WDLocalDeviceStoredDataViewController *v9;
  HBXShimWDProfile *v10;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[HKTableViewController initWithUsingInsetStyling:]([WDLocalDeviceStoredDataViewController alloc], "initWithUsingInsetStyling:", v5);
  -[WDSourceStoredDataViewController setSource:](v9, "setSource:", v8);

  v10 = -[HBXShimWDProfile initWithHealthStore:]([HBXShimWDProfile alloc], "initWithHealthStore:", v7);
  -[WDStoredDataByCategoryViewController setProfile:](v9, "setProfile:", v10);

  return v9;
}

- (id)createDeviceStoredDataViewControllerForDevice:(id)a3 displayName:(id)a4 isBluetoothDevice:(BOOL)a5 deviceIdentifier:(id)a6 healthStore:(id)a7 usingInsetStyling:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  WDDeviceStoredDataViewController *v17;
  HBXShimWDProfile *v18;

  v8 = a8;
  v10 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = -[HKTableViewController initWithUsingInsetStyling:]([WDDeviceStoredDataViewController alloc], "initWithUsingInsetStyling:", v8);
  -[WDDeviceStoredDataViewController setDevice:](v17, "setDevice:", v16);

  -[WDDeviceStoredDataViewController setDisplayName:](v17, "setDisplayName:", v15);
  v18 = -[HBXShimWDProfile initWithHealthStore:]([HBXShimWDProfile alloc], "initWithHealthStore:", v13);

  -[WDStoredDataByCategoryViewController setProfile:](v17, "setProfile:", v18);
  -[WDStoredDataByCategoryViewController setIsBluetoothDevice:](v17, "setIsBluetoothDevice:", v10);
  -[WDStoredDataByCategoryViewController setDeviceIdentifier:](v17, "setDeviceIdentifier:", v14);

  return v17;
}

- (id)createContactConsolidationControllerInViewController:(id)a3
{
  id v4;
  WDContactConsolidationController *v5;

  v4 = a3;
  v5 = -[WDContactConsolidationController initWithProfile:presentingViewController:]([WDContactConsolidationController alloc], "initWithProfile:presentingViewController:", self->_profile, v4);

  return v5;
}

- (id)createResearchStudySourcesViewControllerUsingInsetStyling:(BOOL)a3 restorationStudyBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  WDResearchStudySourcesViewController *v7;

  v4 = a3;
  v6 = a4;
  v7 = -[WDResearchStudySourcesViewController initWithProfile:usingInsetStyling:]([WDResearchStudySourcesViewController alloc], "initWithProfile:usingInsetStyling:", self->_profile, v4);
  -[WDSourcesViewController setRestorationSourceBundleIdentifier:](v7, "setRestorationSourceBundleIdentifier:", v6);

  return v7;
}

- (id)createDeletedSourceMessageViewControllerForSource:(id)a3
{
  id v3;
  WDSourceMessageViewController *v4;

  v3 = a3;
  v4 = -[WDSourceMessageViewController initWithStyle:source:]([WDSourceMessageViewController alloc], "initWithStyle:source:", 1, v3);

  return v4;
}

- (id)createChartForTypeIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 minimumSize:(CGSize)a6 disableXAxis:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v13;
  void *v14;
  HKHealthChartFactory *chartFactory;
  void *v16;
  void *v17;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  v13 = a3;
  v14 = 0;
  if (a4 && a5)
  {
    objc_msgSend(MEMORY[0x24BE4A920], "valueRangeWithMinValue:maxValue:", a4, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  chartFactory = self->_chartFactory;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:](chartFactory, "chartForTypeIdentifier:dateRange:minimumSize:disableXAxis:currentCalendar:", v13, v14, v7, v16, width, height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDate:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x24BDD1508];
  v9 = a3;
  objc_msgSend(v8, "hk_instantaneousDateIntervalWithDate:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HBXViewControllerFactory createInteractiveChartForType:preferredOverlay:displayDateInterval:](self, "createInteractiveChartForType:preferredOverlay:displayDateInterval:", v9, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)createInteractiveChartForType:(id)a3 preferredOverlay:(int64_t)a4 displayDateInterval:(id)a5
{
  HKHealthChartFactory *chartFactory;
  id v8;
  void *v9;
  void *v10;

  chartFactory = self->_chartFactory;
  v8 = a5;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthChartFactory interactiveChartForTypeIdentifier:preferredOverlay:displayDateInterval:restorationUserActivity:chartSummaryTrendModel:](chartFactory, "interactiveChartForTypeIdentifier:preferredOverlay:displayDateInterval:restorationUserActivity:chartSummaryTrendModel:", v9, a4, v8, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createActivityChartForActivityMoveMode:(int64_t)a3 displayDate:(id)a4 activityOptions:(unint64_t)a5 chartSharableModel:(id)a6
{
  return (id)-[HKHealthChartFactory activityChartForActivityMoveMode:displayDate:activityOptions:chartSharableModel:](self->_chartFactory, "activityChartForActivityMoveMode:displayDate:activityOptions:chartSharableModel:", a3, a4, a5, a6);
}

- (id)createClinicalDocumentOverviewViewControllerWithSidebarIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WDDocumentOverviewViewController *v11;
  void *v12;
  WDDocumentOverviewViewController *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE4A5C0];
  v5 = a3;
  objc_msgSend(v4, "categoryWithID:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfile displayTypeController](self->_profile, "displayTypeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayTypeWithIdentifier:", &unk_24D3A5B58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKHealthKitFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENTS"), &stru_24D38E7C8, *MEMORY[0x24BDD2F10]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [WDDocumentOverviewViewController alloc];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WDDocumentOverviewViewController initWithDisplayTypes:profile:title:category:sidebarIdentifier:](v11, "initWithDisplayTypes:profile:title:category:sidebarIdentifier:", v12, self->_profile, v10, v6, v5);

  return v13;
}

- (id)createUnitPreferencesController:(id)a3
{
  WDProfile *profile;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WDUnitPreferenceViewController *v9;
  void *v10;
  WDUnitPreferenceViewController *v11;

  profile = self->_profile;
  v5 = a3;
  -[WDProfile displayTypeController](profile, "displayTypeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeForObjectType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKUnitPreferenceControllerAvailableUnitsForDisplayType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [WDUnitPreferenceViewController alloc];
  -[WDProfile unitController](self->_profile, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WDUnitPreferenceViewController initWithUnits:displayType:unitController:](v9, "initWithUnits:displayType:unitController:", v8, v7, v10);

  return v11;
}

- (id)createElectrocardiogramListDataProvider
{
  void *v3;
  void *v4;
  void *v5;
  WDElectrocardiogramListDataProvider *v6;

  -[WDProfile displayTypeController](self->_profile, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeForObjectType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WDElectrocardiogramListDataProvider initWithDisplayType:profile:]([WDElectrocardiogramListDataProvider alloc], "initWithDisplayType:profile:", v5, self->_profile);
  return v6;
}

- (id)createElectrocardiogramDataMetadataViewControllerWithElectrocardiogram:(id)a3 dataProvider:(id)a4
{
  id v5;
  id v6;
  WDElectrocardiogramDataMetadataViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[WDElectrocardiogramDataMetadataViewController initWithSample:delegate:mode:activeAlgorithmVersion:]([WDElectrocardiogramDataMetadataViewController alloc], "initWithSample:delegate:mode:activeAlgorithmVersion:", v6, v5, 0, 0);

  return v7;
}

- (id)createListViewController:(id)a3
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
  WDProfile *profile;
  void *v14;
  WDDataListViewController *v15;
  __objc2_class *v16;
  id v17;
  void *v18;
  WDDataListViewController *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F28], "workoutRouteType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    objc_msgSend(MEMORY[0x24BE4A5C8], "displayTypeWithIdentifier:", 102);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = WDWorkoutRouteListDataProvider;
LABEL_6:
    v17 = [v16 alloc];
    -[HBXViewControllerFactory profile](self, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v17, "initWithDisplayType:profile:", v12, v18);

    v19 = [WDDataListViewController alloc];
    -[HBXViewControllerFactory profile](self, "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WDDataListViewController initWithDisplayType:profile:dataProvider:usingInsetStyling:](v19, "initWithDisplayType:profile:dataProvider:usingInsetStyling:", v12, v20, v14, 1);

    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F28], "heartbeatSeriesType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
  {
    objc_msgSend(MEMORY[0x24BE4A5C8], "displayTypeWithIdentifier:", 119);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = WDHeartbeatSequenceListDataProvider;
    goto LABEL_6;
  }
  -[WDProfile displayTypeController](self->_profile, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeForObjectType:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  profile = self->_profile;
  -[WDProfile unitController](profile, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wd_dataListViewControllerWithProfile:unitController:", profile, v14);
  v15 = (WDDataListViewController *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v15;
}

- (id)createDataSourcesTableViewController:(id)a3
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
  WDDisplayTypeDataSourcesTableViewController *v13;
  void *v14;
  void *v15;
  WDDisplayTypeDataSourcesTableViewController *v16;
  void *v17;
  uint64_t v18;
  WDDisplayTypeDataSourcesTableViewController *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F28], "workoutRouteType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    v17 = (void *)MEMORY[0x24BE4A5C8];
    v18 = 102;
LABEL_6:
    objc_msgSend(v17, "displayTypeWithIdentifier:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4A5C0], "categoryWithID:", objc_msgSend(v12, "categoryIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [WDDisplayTypeDataSourcesTableViewController alloc];
    -[HBXViewControllerFactory profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sourceOrderController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HBXViewControllerFactory profile](self, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WDDisplayTypeDataSourcesTableViewController initWithDisplayType:displayCategory:sourceOrderController:profile:](v19, "initWithDisplayType:displayCategory:sourceOrderController:profile:", v12, v14, v20, v21);

    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F28], "heartbeatSeriesType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
  {
    v17 = (void *)MEMORY[0x24BE4A5C8];
    v18 = 119;
    goto LABEL_6;
  }
  -[WDProfile displayTypeController](self->_profile, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeForObjectType:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [WDDisplayTypeDataSourcesTableViewController alloc];
  objc_msgSend(v12, "displayCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfile sourceOrderController](self->_profile, "sourceOrderController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WDDisplayTypeDataSourcesTableViewController initWithDisplayType:displayCategory:sourceOrderController:profile:](v13, "initWithDisplayType:displayCategory:sourceOrderController:profile:", v12, v14, v15, self->_profile);
LABEL_7:

  return v16;
}

- (void)createAndStartExportForViewController:(id)a3 shareSheetSourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WDExportController *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[WDExportController initWithProfile:]([WDExportController alloc], "initWithProfile:", self->_profile);
  -[HBXViewControllerFactory applicationProvider](self, "applicationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDExportController setApplicationProvider:](v9, "setApplicationProvider:", v8);

  -[WDExportController verifyExportWithPresentingViewController:shareSheetSourceView:](v9, "verifyExportWithPresentingViewController:shareSheetSourceView:", v7, v6);
}

- (id)localizedPreferredUnitDisplayNameForType:(id)a3
{
  return -[HBXViewControllerFactory localizedPreferredUnitDisplayNameForType:nameContext:](self, "localizedPreferredUnitDisplayNameForType:nameContext:", a3, 1);
}

- (id)localizedPreferredUnitDisplayNameForType:(id)a3 nameContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HBXViewControllerFactory unitSupport](self, "unitSupport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedPreferredUnitDisplayNameForType:nameContext:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updatePreferredUnit:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HBXViewControllerFactory unitSupport](self, "unitSupport");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatePreferredUnit:forType:", v7, v6);

}

- (id)localizedUnitDisplayNameForDisplayType:(id)a3 nameContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HBXViewControllerFactory profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayNameForDisplayType:value:nameContext:", v6, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)fetchUserDefaultForKey:(id)a3 withCallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HBXViewControllerFactory profile](self, "profile");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:callback:", v7, v6);

}

- (id)unitStringForType:(id)a3
{
  return -[HBXViewControllerFactory localizedPreferredUnitDisplayNameForType:nameContext:](self, "localizedPreferredUnitDisplayNameForType:nameContext:", a3, 1);
}

- (HKApplicationProviding)applicationProvider
{
  return (HKApplicationProviding *)objc_loadWeakRetained((id *)&self->_applicationProvider);
}

- (void)setApplicationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_applicationProvider, a3);
}

- (HKHealthChartFactory)chartFactory
{
  return self->_chartFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitSupport, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_chartFactory, 0);
  objc_destroyWeak((id *)&self->_applicationProvider);
}

@end
