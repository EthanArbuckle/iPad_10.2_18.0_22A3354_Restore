@implementation BuddySourceMigrationFlow

- (BuddySourceMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddySourceMigrationFlow *v10;
  NSArray *v11;
  BuddySourceMigrationFlow *v12;
  objc_super v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  id v19;
  uint64_t v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = 0;
  objc_storeStrong(&v15, a6);
  v9 = v19;
  v19 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)BuddySourceMigrationFlow;
  v10 = -[BuddySourceMigrationFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v14, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v17, v16, v15);
  v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20 = objc_opt_class(BuddyMigrationSourceProgressController);
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1);
    objc_msgSend(v19, "setClassList:", v11);

  }
  v12 = (BuddySourceMigrationFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (void)startFlowAnimated:(BOOL)a3
{
  BYPreferencesController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddySourceMigrationFlow *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddySourceMigrationFlow;
  -[BuddySourceMigrationFlow startFlowAnimated:](&v4, "startFlowAnimated:", a3);
  v3 = -[BuddySourceMigrationFlow buddyPreferencesExcludedFromBackup](v7, "buddyPreferencesExcludedFromBackup");
  +[BuddyMigrationState removeFromPreferences:](BuddyMigrationState, "removeFromPreferences:", v3);

}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  uint64_t v11;
  BuddyMigrationSourceEraseController *v12;
  id v13;
  objc_super v14;
  id v15;
  id obj;
  BOOL v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  BuddySourceMigrationFlow *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = location[0];
  v6 = objc_opt_class(BuddyMigrationSourceProgressController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v19 = location[0];
    v18 = objc_msgSend(v19, "error");
    v17 = 0;
    v7 = objc_msgSend(v18, "domain");
    v8 = 0;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MBErrorDomain")) & 1) != 0)
      v8 = objc_msgSend(v18, "code") == (id)202;

    v17 = v8;
    if (!v8)
    {
      if (v18)
      {
        obj = -[BuddyMigrationSourceErrorController initWithError:]([BuddyMigrationSourceErrorController alloc], "initWithError:", v18);
        objc_storeStrong(&v20, obj);
        objc_storeStrong(&obj, 0);
      }
      else
      {
        v15 = objc_alloc_init(BuddyMigrationSourceFinished);
        v9 = objc_msgSend(v19, "internalStatistics");
        objc_msgSend(v15, "setInternalStatistics:", v9);

        objc_storeStrong(&v20, v15);
        objc_storeStrong(&v15, 0);
      }
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v10 = location[0];
    v11 = objc_opt_class(BuddyMigrationSourceFinished);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      v12 = objc_alloc_init(BuddyMigrationSourceEraseController);
      v13 = v20;
      v20 = v12;

    }
  }
  objc_msgSend(v20, "setDelegate:", v22);
  v14.receiver = v22;
  v14.super_class = (Class)BuddySourceMigrationFlow;
  -[BuddySourceMigrationFlow flowItemDone:nextItem:](&v14, "flowItemDone:nextItem:", location[0], v20);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  _QWORD v3[4];

  v3[0] = objc_opt_class(BuddyMigrationSourceEraseController);
  v3[1] = objc_opt_class(BuddyMigrationSourceErrorController);
  v3[2] = objc_opt_class(BuddyMigrationSourceFinished);
  v3[3] = objc_opt_class(BuddyMigrationSourceProgressController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4);
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (void)presentWiFiPaneForFlowItem:(id)a3
{
  id v3;
  char v4;
  id v5;
  id location[2];
  BuddySourceMigrationFlow *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddySourceMigrationFlow delegate](v7, "delegate");
  v4 = objc_opt_respondsToSelector(v3, "presentWiFiPaneForFlow:");

  if ((v4 & 1) != 0)
  {
    v5 = -[BuddySourceMigrationFlow delegate](v7, "delegate");
    objc_msgSend(v5, "presentWiFiPaneForFlow:", v7);

  }
  objc_storeStrong(location, 0);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
}

@end
