@implementation BuddyEDUAccountConfigurationSyncController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

+ (BOOL)controllerNeedsToRun
{
  id v2;
  id v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  BOOL v6;
  unsigned __int8 v7;
  unsigned __int8 v8;

  v2 = +[BYPreferencesController buddyPreferences](BYPreferencesController, "buddyPreferences");
  v3 = objc_msgSend(v2, "objectForKey:", BYBuddyDoneKey);
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = +[BYManagedAppleIDBootstrap isMultiUser](BYManagedAppleIDBootstrap, "isMultiUser");
  v6 = 0;
  if ((v5 & 1) != 0)
  {
    v7 = +[BYManagedAppleIDBootstrap isManagedAppleIDSignedIn](BYManagedAppleIDBootstrap, "isManagedAppleIDSignedIn");
    v6 = 0;
    if ((v7 & 1) != 0)
    {
      v8 = +[BuddyAppleIDPasswordChangeController controllerNeedsToRun](BuddyAppleIDPasswordChangeController, "controllerNeedsToRun");
      v6 = 1;
      if ((v8 & 1) == 0)
        return !(v4 & 1);
    }
  }
  return v6;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BYManagedAppleIDBootstrap sharedManager](BYManagedAppleIDBootstrap, "sharedManager");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10003641C;
  v8 = &unk_100280780;
  v9 = location[0];
  objc_msgSend(v3, "writeAccountConfigurationIfNeededWithCompletion:", &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
  BFFFlowItemDelegate *v3;

  v3 = -[BuddyEDUAccountConfigurationSyncController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v3, "flowItemDone:nextItemClass:", self, objc_opt_class(BuddyAwaitUserConfigurationController));

}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
