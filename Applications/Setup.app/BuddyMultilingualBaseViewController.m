@implementation BuddyMultilingualBaseViewController

- (BuddyMultilingualBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 actionString:(id)a6
{
  id v9;
  BuddyMultilingualBaseViewController *v10;
  objc_super v12;
  id obj;
  id v14;
  id v15;
  id location[2];
  id v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  obj = 0;
  objc_storeStrong(&obj, a6);
  v9 = v17;
  v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyMultilingualBaseViewController;
  v17 = -[BuddyMultilingualBaseViewController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v12, "initWithTitle:detailText:symbolName:adoptTableViewScrollView:", location[0], v15, v14, 1);
  objc_storeStrong(&v17, v17);
  if (v17)
    objc_storeStrong((id *)v17 + 10, obj);
  v10 = (BuddyMultilingualBaseViewController *)v17;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (void)viewDidLoad
{
  NSArray *v2;
  BOOL v3;
  NSArray *v4;
  BOOL v5;
  BuddyMultilingualDataSource *v6;
  NSArray *v7;
  NSArray *v8;
  NSString *v9;
  BuddyMultilingualDataSource *v10;
  BuddyMultilingualDataSource *v11;
  NSArray *v12;
  NSArray *v13;
  BuddyMultilingualDataSource *v14;
  id v15;
  BuddyMultilingualBaseViewController *v16;
  id v17;
  BuddyMultilingualBaseViewController *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BuddyMultilingualDataSource *v24;
  id v25;
  id v26;
  id v27;
  NSBundle *v28;
  NSString *v29;
  id v30;
  id v31;
  objc_super v32;
  SEL v33;
  BuddyMultilingualBaseViewController *v34;
  NSArray *v35;
  NSArray *v36;

  v34 = self;
  v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)BuddyMultilingualBaseViewController;
  -[BuddyMultilingualBaseViewController viewDidLoad](&v32, "viewDidLoad");
  v2 = -[BuddyMultilingualBaseViewController defaultData](v34, "defaultData");
  v3 = v2 == 0;

  if (v3)
    -[BuddyMultilingualBaseViewController setDefaultData:](v34, "setDefaultData:", &__NSArray0__struct);
  v4 = -[BuddyMultilingualBaseViewController availableData](v34, "availableData");
  v5 = v4 == 0;

  if (v5)
    -[BuddyMultilingualBaseViewController setAvailableData:](v34, "setAvailableData:", &__NSArray0__struct);
  v6 = [BuddyMultilingualDataSource alloc];
  v7 = -[BuddyMultilingualBaseViewController defaultData](v34, "defaultData");
  v36 = v7;
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1);
  v9 = -[BuddyMultilingualBaseViewController additionLabel](v34, "additionLabel");
  v10 = -[BuddyMultilingualDataSource initWithBackingStore:actionText:](v6, "initWithBackingStore:actionText:", v8, v9);
  -[BuddyMultilingualBaseViewController setDataSource:](v34, "setDataSource:", v10);

  v11 = [BuddyMultilingualDataSource alloc];
  v12 = -[BuddyMultilingualBaseViewController availableData](v34, "availableData");
  v35 = v12;
  v13 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1);
  v14 = -[BuddyMultilingualDataSource initWithBackingStore:actionText:](v11, "initWithBackingStore:actionText:", v13, &stru_100284738);
  -[BuddyMultilingualBaseViewController setPresentingDataSource:](v34, "setPresentingDataSource:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddyMultilingualBaseViewController setTableView:](v34, "setTableView:", v15);

  v16 = v34;
  v17 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v17, "setDelegate:", v16);

  v18 = v34;
  v19 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v19, "setDataSource:", v18);

  v20 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v20, "setRowHeight:", UITableViewAutomaticDimension);

  v21 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v21, "setEstimatedRowHeight:", 0.0);

  v22 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v22, "setAllowsSelectionDuringEditing:", 1);

  v23 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  objc_msgSend(v23, "setEditing:animated:", 1, 1);

  v24 = -[BuddyMultilingualBaseViewController dataSource](v34, "dataSource");
  v25 = -[BuddyMultilingualBaseViewController tableView](v34, "tableView");
  v26 = -[BuddyMultilingualBaseViewController _presentableAdditionalDataSource](v34, "_presentableAdditionalDataSource");
  -[BuddyMultilingualDataSource tableView:allowAdditionalDataSelection:](v24, "tableView:allowAdditionalDataSelection:", v25, objc_msgSend(v26, "count") != 0);

  v27 = -[BuddyMultilingualBaseViewController backingStore](v34, "backingStore");
  -[BuddyMultilingualBaseViewController setStartingDataSet:](v34, "setStartingDataSet:", v27);

  v31 = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  v28 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v29 = -[NSBundle localizedStringForKey:value:table:](v28, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v31, "setTitle:forState:", v29, 0);

  objc_msgSend(v31, "addTarget:action:forControlEvents:", v34, "continuePressed", 64);
  v30 = -[BuddyMultilingualBaseViewController buttonTray](v34, "buttonTray");
  objc_msgSend(v30, "addButton:", v31);

  objc_storeStrong(&v31, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyMultilingualBaseViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMultilingualBaseViewController;
  -[BuddyMultilingualBaseViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyMultilingualBaseViewController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyMultilingualBaseViewController;
  -[BuddyMultilingualBaseViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v3 = -[BuddyMultilingualBaseViewController tableView](v10, "tableView");
  v4 = -[BuddyMultilingualBaseViewController tableView](v10, "tableView");
  v5 = objc_msgSend(v4, "subviews");
  v6 = objc_msgSend(v5, "firstObject");
  objc_msgSend(v3, "bringSubviewToFront:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  BuddyMultilingualDataSource *v3;
  objc_super v4;
  id location[2];
  BuddyMultilingualBaseViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyMultilingualBaseViewController;
  -[BuddyMultilingualBaseViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", location[0]);
  v3 = -[BuddyMultilingualBaseViewController dataSource](v6, "dataSource");
  -[BuddyMultilingualDataSource recalculateUnifiedRowHeight](v3, "recalculateUnifiedRowHeight");

  objc_storeStrong(location, 0);
}

- (void)continuePressed
{
  unint64_t v2;
  NSArray *v3;
  id v4;
  BYAnalyticsManager *v5;

  v2 = -[BuddyMultilingualBaseViewController paneForAnalytics](self, "paneForAnalytics", a2);
  v3 = -[BuddyMultilingualBaseViewController startingDataSet](self, "startingDataSet");
  v4 = -[BuddyMultilingualBaseViewController backingStore](self, "backingStore");
  v5 = -[BuddyMultilingualBaseViewController analyticsManager](self, "analyticsManager");
  +[BYMultilingualAnalyticsEvent recordMultilingualPane:startingData:modifiedData:analyticsManager:](BYMultilingualAnalyticsEvent, "recordMultilingualPane:startingData:modifiedData:analyticsManager:", v2, v3, v4, v5);

}

- (unint64_t)paneForAnalytics
{
  return -1;
}

- (void)presentAdditionViewController
{
  -[BuddyMultilingualBaseViewController _presentAdditionDataSource](self, "_presentAdditionDataSource", a2, self);
}

- (void)additionViewControllerCompleted
{
  BuddyMultilingualProvider *v2;
  id v3;
  BuddyMultilingualDataSource *v4;
  id v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v9;

  v2 = -[BuddyMultilingualBaseViewController provider](self, "provider", a2);
  v3 = -[BuddyMultilingualProvider createDataSourceForSelectedItems](v2, "createDataSourceForSelectedItems");
  -[BuddyMultilingualBaseViewController setDefaultData:](self, "setDefaultData:", v3);

  v4 = -[BuddyMultilingualBaseViewController dataSource](self, "dataSource");
  v5 = -[BuddyMultilingualBaseViewController tableView](self, "tableView");
  v6 = -[BuddyMultilingualBaseViewController defaultData](self, "defaultData");
  v9 = v6;
  v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1);
  -[BuddyMultilingualDataSource tableView:setBackingStore:](v4, "tableView:setBackingStore:", v5, v7);

}

- (void)setProvider:(id)a3
{
  BuddyMultilingualProvider *v3;
  id v4;
  BuddyMultilingualProvider *v5;
  id v6;
  id location[2];
  BuddyMultilingualBaseViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_provider, location[0]);
  v3 = -[BuddyMultilingualBaseViewController provider](v8, "provider");
  v4 = -[BuddyMultilingualProvider createDataSourceForPreselectedItems](v3, "createDataSourceForPreselectedItems");
  -[BuddyMultilingualBaseViewController setDefaultData:](v8, "setDefaultData:", v4);

  v5 = -[BuddyMultilingualBaseViewController provider](v8, "provider");
  v6 = -[BuddyMultilingualProvider createDataSourceItemsAvailableForAdding](v5, "createDataSourceItemsAvailableForAdding");
  -[BuddyMultilingualBaseViewController setAvailableData:](v8, "setAvailableData:", v6);

  objc_storeStrong(location, 0);
}

- (id)backingStore
{
  BuddyMultilingualDataSource *v2;
  id v3;

  v2 = -[BuddyMultilingualBaseViewController dataSource](self, "dataSource", a2, self);
  v3 = -[BuddyMultilingualDataSource combinedStore](v2, "combinedStore");

  return v3;
}

+ (BOOL)needsFullscreenPane
{
  return 1;
}

+ (BOOL)hasItemsToModifyWithDefault:(id)a3 andAvailableData:(id)a4
{
  id v5;
  void **v7;
  int v8;
  int v9;
  uint64_t (*v10)(id *, void *);
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id location[3];
  BOOL v17;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  if ((unint64_t)objc_msgSend(location[0], "count") <= 1)
  {
    v13 = 0;
    v5 = v15;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_1000B5998;
    v11 = &unk_100282190;
    v12 = location[0];
    v13 = objc_msgSend(v5, "indexOfObjectPassingTest:", &v7);
    v17 = v13 != (id)0x7FFFFFFFFFFFFFFFLL;
    v14 = 1;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v17 = 1;
    v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)_presentAdditionDataSource
{
  BuddyMultilingualContentAdditionController *v2;
  BOOL v3;
  BuddyMultilingualContentAdditionController *v4;
  id v5;
  BuddyMultilingualContentAdditionController *v6;
  id v7;
  BuddyMultilingualContentAdditionController *v8;
  id v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  BuddyMultilingualContentAdditionController *v13;
  id v14;
  id v15;
  BuddyMultilingualContentAdditionController *v16;
  id v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(id *, void *);
  void *v22;
  id v23;
  id location[2];
  BuddyMultilingualBaseViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMultilingualBaseViewController dataSelectorController](self, "dataSelectorController");
  v3 = v2 == 0;

  if (v3)
  {
    objc_initWeak(location, v25);
    v4 = [BuddyMultilingualContentAdditionController alloc];
    v5 = -[BuddyMultilingualBaseViewController _presentableAdditionalDataSource](v25, "_presentableAdditionalDataSource");
    v18 = _NSConcreteStackBlock;
    v19 = -1073741824;
    v20 = 0;
    v21 = sub_1000B5CE0;
    v22 = &unk_1002821B8;
    objc_copyWeak(&v23, location);
    v6 = -[BuddyMultilingualContentAdditionController initWithChoseableDataStore:selectionCallback:](v4, "initWithChoseableDataStore:selectionCallback:", v5, &v18);
    -[BuddyMultilingualBaseViewController setDataSelectorController:](v25, "setDataSelectorController:", v6);

    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
  else
  {
    v7 = -[BuddyMultilingualBaseViewController _presentableAdditionalDataSource](v25, "_presentableAdditionalDataSource");
    v8 = -[BuddyMultilingualBaseViewController dataSelectorController](v25, "dataSelectorController");
    -[BuddyMultilingualContentAdditionController setDataStore:](v8, "setDataStore:", v7);

  }
  v9 = objc_alloc((Class)UIBarButtonItem);
  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("MULTILINGUAL_CANCEL"), &stru_100284738, CFSTR("Localizable"));
  v12 = objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 2, v25, "_presentingControllerDidCancel");
  v13 = -[BuddyMultilingualBaseViewController dataSelectorController](v25, "dataSelectorController");
  v14 = -[BuddyMultilingualContentAdditionController navigationItem](v13, "navigationItem");
  objc_msgSend(v14, "setRightBarButtonItem:", v12);

  v15 = objc_alloc((Class)UINavigationController);
  v16 = -[BuddyMultilingualBaseViewController dataSelectorController](v25, "dataSelectorController");
  v17 = objc_msgSend(v15, "initWithRootViewController:", v16);

  -[BuddyMultilingualBaseViewController presentViewController:animated:completion:](v25, "presentViewController:animated:completion:", v17, 1, 0);
  objc_storeStrong(&v17, 0);
}

- (void)_presentingControllerDidCancel
{
  -[BuddyMultilingualBaseViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a2, self);
}

- (id)_presentableAdditionalDataSource
{
  BuddyMultilingualDataSource *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  BuddyMultilingualDataSource *v7;
  id v8;
  char v9;
  id v10;
  _QWORD __b[8];
  id v13;
  id location[2];
  BuddyMultilingualBaseViewController *v15;
  _BYTE v16[128];

  v15 = self;
  location[1] = (id)a2;
  location[0] = +[NSMutableArray array](NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  v2 = -[BuddyMultilingualBaseViewController presentingDataSource](v15, "presentingDataSource");
  v3 = -[BuddyMultilingualDataSource combinedStore](v2, "combinedStore");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(_QWORD *)__b[2] != v5)
          objc_enumerationMutation(v3);
        v13 = *(id *)(__b[1] + 8 * i);
        v7 = -[BuddyMultilingualBaseViewController dataSource](v15, "dataSource");
        v8 = objc_msgSend(v13, "identifier");
        v9 = !-[BuddyMultilingualDataSource containsKey:](v7, "containsKey:", v8);

        if ((v9 & 1) != 0)
          objc_msgSend(location[0], "addObject:", v13);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    }
    while (v4);
  }

  v10 = location[0];
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  NSArray *v5;
  id v6;
  id location[2];
  BuddyMultilingualBaseViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = -[BuddyMultilingualBaseViewController defaultData](v8, "defaultData");
    v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v3);

    v4 = objc_opt_class(v8);
    v5 = -[BuddyMultilingualBaseViewController availableData](v8, "availableData");
    LOBYTE(v4) = objc_msgSend((id)v4, "hasItemsToModifyWithDefault:andAvailableData:", v6, v5);

    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], v4 & 1);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  id v6;
  id v8;
  id location[2];
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v10, "dataSource");
  v6 = -[BuddyMultilingualDataSource tableView:cellForRowAtIndexPath:](v5, "tableView:cellForRowAtIndexPath:", location[0], v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BuddyMultilingualDataSource *v5;
  int64_t v6;
  int64_t v8;
  id location[2];
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v5 = -[BuddyMultilingualBaseViewController dataSource](v10, "dataSource");
  v6 = -[BuddyMultilingualDataSource tableView:numberOfRowsInSection:](v5, "tableView:numberOfRowsInSection:", location[0], v8);

  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BuddyMultilingualDataSource *v3;
  int64_t v4;
  id location[2];
  BuddyMultilingualBaseViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMultilingualBaseViewController dataSource](v7, "dataSource");
  v4 = -[BuddyMultilingualDataSource numberOfSectionsInTableView:](v3, "numberOfSectionsInTableView:", location[0]);

  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  unsigned __int8 v6;
  id v8;
  id location[2];
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v10, "dataSource");
  v6 = -[BuddyMultilingualDataSource tableView:canMoveRowAtIndexPath:](v5, "tableView:canMoveRowAtIndexPath:", location[0], v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  BuddyMultilingualDataSource *v7;
  id v8;
  id v9;
  id location[2];
  BuddyMultilingualBaseViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = -[BuddyMultilingualBaseViewController dataSource](v11, "dataSource");
  -[BuddyMultilingualDataSource tableView:moveRowAtIndexPath:toIndexPath:](v7, "tableView:moveRowAtIndexPath:toIndexPath:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  unsigned __int8 v6;
  id v8;
  id location[2];
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v10, "dataSource");
  v6 = -[BuddyMultilingualDataSource tableView:canEditRowAtIndexPath:](v5, "tableView:canEditRowAtIndexPath:", location[0], v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  BuddyMultilingualDataSource *v7;
  id v8;
  int64_t v9;
  id location[2];
  BuddyMultilingualBaseViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  objc_storeStrong(&v8, a5);
  if (v9 == 2)
  {
    -[BuddyMultilingualBaseViewController tableView:didSelectRowAtIndexPath:](v11, "tableView:didSelectRowAtIndexPath:", location[0], v8);
  }
  else
  {
    v7 = -[BuddyMultilingualBaseViewController dataSource](v11, "dataSource");
    -[BuddyMultilingualDataSource tableView:commitEditingStyle:forRowAtIndexPath:](v7, "tableView:commitEditingStyle:forRowAtIndexPath:", location[0], v9, v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 appendItem:(id)a4 inSection:(unint64_t)a5
{
  BuddyMultilingualDataSource *v7;
  unint64_t v8;
  id v9;
  id location[2];
  BuddyMultilingualBaseViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = a5;
  v7 = -[BuddyMultilingualBaseViewController dataSource](v11, "dataSource");
  -[BuddyMultilingualDataSource tableView:appendItem:inSection:](v7, "tableView:appendItem:inSection:", location[0], v9, v8);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 allowAdditionalDataSelection:(BOOL)a4
{
  BuddyMultilingualDataSource *v5;
  BOOL v6;
  id location[2];
  BuddyMultilingualBaseViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5 = -[BuddyMultilingualBaseViewController dataSource](v8, "dataSource");
  -[BuddyMultilingualDataSource tableView:allowAdditionalDataSelection:](v5, "tableView:allowAdditionalDataSelection:", location[0], v6);

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  unsigned __int8 v6;
  id v7;
  id location[2];
  BuddyMultilingualBaseViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v7, 1);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v9, "dataSource");
  v6 = -[BuddyMultilingualDataSource rowActionableAtIndexPath:](v5, "rowActionableAtIndexPath:", v7);

  if ((v6 & 1) != 0)
    -[BuddyMultilingualBaseViewController presentAdditionViewController](v9, "presentAdditionViewController");
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  double v6;
  double v7;
  id v9;
  id location[2];
  BuddyMultilingualBaseViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v11, "dataSource");
  -[BuddyMultilingualDataSource unifiedRowHeight](v5, "unifiedRowHeight");
  v7 = v6;

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BuddyMultilingualDataSource *v5;
  int64_t v6;
  id v8;
  id location[2];
  BuddyMultilingualBaseViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v5 = -[BuddyMultilingualBaseViewController dataSource](v10, "dataSource");
  v6 = -[BuddyMultilingualDataSource editingStyleForRowAtIndexPath:](v5, "editingStyleForRowAtIndexPath:", v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  BuddyMultilingualDataSource *v7;
  BuddyMultilingualDataSource *v8;
  unsigned __int8 v9;
  char v11;
  id v12;
  id v13;
  id location[2];
  BuddyMultilingualBaseViewController *v15;
  id v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v7 = -[BuddyMultilingualBaseViewController dataSource](v15, "dataSource");
  LOBYTE(a4) = -[BuddyMultilingualDataSource itemReorderableAtIndexPath:](v7, "itemReorderableAtIndexPath:", v13);

  v11 = a4 & 1;
  v8 = -[BuddyMultilingualBaseViewController dataSource](v15, "dataSource");
  v9 = -[BuddyMultilingualDataSource itemReorderableAtIndexPath:](v8, "itemReorderableAtIndexPath:", v12);

  if ((v11 & 1) != 0 && (v9 & 1) != 0)
    v16 = v12;
  else
    v16 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)defaultData
{
  return self->_defaultData;
}

- (void)setDefaultData:(id)a3
{
  objc_storeStrong((id *)&self->_defaultData, a3);
}

- (NSArray)availableData
{
  return self->_availableData;
}

- (void)setAvailableData:(id)a3
{
  objc_storeStrong((id *)&self->_availableData, a3);
}

- (BuddyMultilingualProvider)provider
{
  return self->_provider;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BuddyMultilingualDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BuddyMultilingualDataSource)presentingDataSource
{
  return self->_presentingDataSource;
}

- (void)setPresentingDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentingDataSource, a3);
}

- (BuddyMultilingualContentAdditionController)dataSelectorController
{
  return self->_dataSelectorController;
}

- (void)setDataSelectorController:(id)a3
{
  objc_storeStrong((id *)&self->_dataSelectorController, a3);
}

- (NSString)additionLabel
{
  return self->_additionLabel;
}

- (void)setAdditionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_additionLabel, a3);
}

- (NSArray)startingDataSet
{
  return self->_startingDataSet;
}

- (void)setStartingDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_startingDataSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingDataSet, 0);
  objc_storeStrong((id *)&self->_additionLabel, 0);
  objc_storeStrong((id *)&self->_dataSelectorController, 0);
  objc_storeStrong((id *)&self->_presentingDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_availableData, 0);
  objc_storeStrong((id *)&self->_defaultData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
