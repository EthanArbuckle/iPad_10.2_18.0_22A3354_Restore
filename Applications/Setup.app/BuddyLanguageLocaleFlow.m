@implementation BuddyLanguageLocaleFlow

- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyLanguageLocaleFlow *v10;
  id v12;
  id v13;
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
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v12 = objc_alloc_init(BuddyLanguageLocaleDataSource);
  v9 = v17;
  v17 = 0;
  v17 = objc_msgSend(v9, "initWithNavigationController:dataSource:flowDelegate:flowStarter:dependencyInjector:", location[0], v12, v15, v14, v13);
  v10 = (BuddyLanguageLocaleFlow *)v17;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (BuddyLanguageLocaleFlow)initWithNavigationController:(id)a3 dataSource:(id)a4 flowDelegate:(id)a5 flowStarter:(id)a6 dependencyInjector:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  BuddyLanguageChangeObserver *v15;
  id v16;
  id v17;
  id v18;
  BuddyLanguageLocaleFlow *v19;
  objc_super v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  id v27;
  _QWORD v28[2];

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = 0;
  objc_storeStrong(&v22, a7);
  v11 = v27;
  v27 = 0;
  v21.receiver = v11;
  v21.super_class = (Class)BuddyLanguageLocaleFlow;
  v27 = -[BuddyLanguageLocaleFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v21, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v24, v23, v22);
  objc_storeStrong(&v27, v27);
  if (v27)
  {
    objc_msgSend(v27, "setDataSource:", v25);
    v12 = v27;
    v13 = objc_msgSend(v27, "dataSource");
    objc_msgSend(v13, "setDelegate:", v12);

    v28[0] = objc_opt_class(BuddyLanguageController);
    v28[1] = objc_opt_class(BuddyLocaleController);
    v14 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2);
    objc_msgSend(v27, "setClassList:", v14);

    v15 = objc_alloc_init(BuddyLanguageChangeObserver);
    objc_msgSend(v27, "setLanguageChangeObserver:", v15);

    v16 = v27;
    v17 = objc_msgSend(v27, "languageChangeObserver");
    objc_msgSend(v17, "setDelegate:", v16);

    v18 = objc_msgSend(v27, "languageChangeObserver");
    objc_msgSend(v18, "startObservingLanguageChanges");

  }
  v19 = (BuddyLanguageLocaleFlow *)v27;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v27, 0);
  return v19;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  id v3;
  BuddyLanguageLocaleDataSource *v4;
  id location[2];
  BuddyLanguageLocaleFlow *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_buddyPreferencesExcludedFromBackup, location[0]);
  v3 = location[0];
  v4 = -[BuddyLanguageLocaleFlow dataSource](v6, "dataSource");
  -[BuddyLanguageLocaleDataSource setBuddyPreferencesExcludedFromBackup:](v4, "setBuddyPreferencesExcludedFromBackup:", v3);

  objc_storeStrong(location, 0);
}

- (id)firstItem
{
  id v2;
  BuddyLanguageLocaleDataSource *v3;
  BuddyLanguageComposite *v4;
  id v5;
  objc_super v7;
  id location[2];
  BuddyLanguageLocaleFlow *v9;

  v9 = self;
  location[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyLanguageLocaleFlow;
  location[0] = -[BuddyLanguageLocaleFlow firstItem](&v7, "firstItem");
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLanguageDependencyReceiver) & 1) != 0)
  {
    v2 = location[0];
    v3 = -[BuddyLanguageLocaleFlow dataSource](v9, "dataSource");
    v4 = -[BuddyLanguageLocaleDataSource languageComposite](v3, "languageComposite");
    objc_msgSend(v2, "setLanguageComposite:", v4);

  }
  v5 = location[0];
  objc_storeStrong(location, 0);
  return v5;
}

- (id)precedingItemsClasses
{
  NSArray *v3;
  uint64_t v4;

  if (-[BuddyLanguageLocaleFlow isResumingFromLanguageReboot](self, "isResumingFromLanguageReboot"))
  {
    v4 = objc_opt_class(BuddyLanguageController);
    v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)configureFlowItem:(id)a3
{
  objc_super v3;
  id location[2];
  BuddyLanguageLocaleFlow *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyLanguageLocaleFlow;
  -[BuddyLanguageLocaleFlow configureFlowItem:](&v3, "configureFlowItem:", location[0]);
  -[BuddyLanguageLocaleFlow _injectDependencies:](v5, "_injectDependencies:", location[0]);
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  _QWORD v3[2];

  v3[0] = objc_opt_class(BuddyLanguageController);
  v3[1] = objc_opt_class(BuddyLocaleController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2);
}

- (void)_injectDependencies:(id)a3
{
  uint64_t (**v3)(id, id);
  id v4;
  BuddyLanguageLocaleDataSource *v5;
  BuddyLanguageComposite *v6;
  BuddyLanguageLocaleDataSource *v7;
  BuddyLocaleComposite *v8;
  id v9;
  id v10;
  id location[2];
  BuddyLanguageLocaleFlow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (uint64_t (**)(id, id))-[BuddyLanguageLocaleFlow injector](v12, "injector");
  v4 = (id)v3[2](v3, location[0]);

  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLanguageDependencyReceiver) & 1) != 0)
  {
    v10 = location[0];
    v5 = -[BuddyLanguageLocaleFlow dataSource](v12, "dataSource");
    v6 = -[BuddyLanguageLocaleDataSource languageComposite](v5, "languageComposite");
    objc_msgSend(v10, "setLanguageComposite:", v6);

    objc_msgSend(v10, "setSelectionReceiver:", v12);
    objc_storeStrong(&v10, 0);
  }
  else if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLocaleDependencyReceiver) & 1) != 0)
  {
    v9 = location[0];
    v7 = -[BuddyLanguageLocaleFlow dataSource](v12, "dataSource");
    v8 = -[BuddyLanguageLocaleDataSource localeComposite](v7, "localeComposite");
    objc_msgSend(v9, "setLocaleComposite:", v8);

    objc_msgSend(v9, "setSelectionReceiver:", v12);
    objc_msgSend(v9, "setResumingFromLanguageReboot:", -[BuddyLanguageLocaleFlow isResumingFromLanguageReboot](v12, "isResumingFromLanguageReboot"));
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  objc_super v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id location[2];
  BuddyLanguageLocaleFlow *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  -[BuddyLanguageLocaleFlow setResumingFromLanguageReboot:](v11, "setResumingFromLanguageReboot:", 0);
  -[BuddyLanguageLocaleFlow _injectDependencies:](v11, "_injectDependencies:", v9);
  v8 = 0;
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLanguageDependencyReceiver) & 1) != 0)
  {
    v7 = location[0];
    v8 = objc_msgSend(v7, "showLocalizedNames") & 1;
    objc_storeStrong(&v7, 0);
  }
  if ((objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLocaleDependencyReceiver) & 1) != 0)
  {
    v6 = v9;
    objc_msgSend(v6, "setShowLocalizedNames:", v8 & 1);
    objc_storeStrong(&v6, 0);
  }
  v5.receiver = v11;
  v5.super_class = (Class)BuddyLanguageLocaleFlow;
  -[BuddyLanguageLocaleFlow flowItemDone:nextItem:](&v5, "flowItemDone:nextItem:", location[0], v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5
{
  id v5;
  id v6;
  id v7;
  char v8;
  id location[2];
  BuddyLanguageLocaleFlow *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[BuddyLanguageLocaleFlow classList](v10, "classList");
  v6 = -[BuddyLanguageLocaleFlow navigationController](v10, "navigationController");
  v7 = objc_msgSend(v6, "topViewController");
  v8 = objc_msgSend(v5, "containsObject:", objc_opt_class(v7)) ^ 1;

  if ((v8 & 1) == 0)
    -[BuddyLanguageLocaleFlow flowItemDone:nextItem:](v10, "flowItemDone:nextItem:", v10, 0);
  objc_storeStrong(location, 0);
}

- (void)userSelectedLanguage:(id)a3
{
  BuddyLanguageLocaleDataSource *v3;
  BuddyLanguageLocaleSelectionReceiver *v4;
  id location[2];
  BuddyLanguageLocaleFlow *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyLanguageLocaleFlow dataSource](v6, "dataSource");
  -[BuddyLanguageLocaleDataSource userSelectedLanguage:](v3, "userSelectedLanguage:", location[0]);

  v4 = -[BuddyLanguageLocaleFlow receiver](v6, "receiver");
  -[BuddyLanguageLocaleSelectionReceiver userSelectedLanguage:](v4, "userSelectedLanguage:", location[0]);

  objc_storeStrong(location, 0);
}

- (BOOL)userSelectedLanguageWithLocale:(id)a3 countryCode:(id)a4 localePaneScrollOffset:(double)a5
{
  BuddyLanguageLocaleSelectionReceiver *v7;
  unsigned __int8 v8;
  id v10;
  id location[2];
  BuddyLanguageLocaleFlow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = -[BuddyLanguageLocaleFlow receiver](v12, "receiver");
  v8 = -[BuddyLanguageLocaleSelectionReceiver userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:](v7, "userSelectedLanguageWithLocale:countryCode:localePaneScrollOffset:", location[0], v10, a5);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (void)languageCompositeUpdated
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t i;
  BuddyLanguageLocaleDataSource *v14;
  BuddyLanguageComposite *v15;
  id v16;
  _QWORD __b[8];
  id v18;
  id location[2];
  BuddyLanguageLocaleFlow *v20;
  _BYTE v21[128];

  v20 = self;
  location[1] = (id)a2;
  location[0] = +[NSMutableArray array](NSMutableArray, "array");
  v2 = -[BuddyLanguageLocaleFlow controllers](v20, "controllers");
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = -[BuddyLanguageLocaleFlow controllers](v20, "controllers");
    objc_msgSend(location[0], "addObjectsFromArray:", v4);

  }
  v5 = -[BuddyLanguageLocaleFlow navigationController](v20, "navigationController");
  v6 = objc_msgSend(v5, "viewControllers");
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = -[BuddyLanguageLocaleFlow navigationController](v20, "navigationController");
    v9 = objc_msgSend(v8, "viewControllers");
    objc_msgSend(location[0], "addObjectsFromArray:", v9);

  }
  memset(__b, 0, sizeof(__b));
  v10 = location[0];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v11; ++i)
      {
        if (*(_QWORD *)__b[2] != v12)
          objc_enumerationMutation(v10);
        v18 = *(id *)(__b[1] + 8 * i);
        if ((objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___BuddyLanguageDependencyReceiver) & 1) != 0)
        {
          v16 = v18;
          v14 = -[BuddyLanguageLocaleFlow dataSource](v20, "dataSource");
          v15 = -[BuddyLanguageLocaleDataSource languageComposite](v14, "languageComposite");
          objc_msgSend(v16, "setLanguageComposite:", v15);

          objc_storeStrong(&v16, 0);
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
    }
    while (v11);
  }

  objc_storeStrong(location, 0);
}

- (BuddyLanguageLocaleSelectionReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  self->_receiver = (BuddyLanguageLocaleSelectionReceiver *)a3;
}

- (BOOL)languageSet
{
  return self->_languageSet;
}

- (void)setLanguageSet:(BOOL)a3
{
  self->_languageSet = a3;
}

- (BOOL)isResumingFromLanguageReboot
{
  return self->_resumingFromLanguageReboot;
}

- (void)setResumingFromLanguageReboot:(BOOL)a3
{
  self->_resumingFromLanguageReboot = a3;
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (BuddyLanguageLocaleDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BuddyLanguageChangeObserver)languageChangeObserver
{
  return self->_languageChangeObserver;
}

- (void)setLanguageChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_languageChangeObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageChangeObserver, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
}

@end
