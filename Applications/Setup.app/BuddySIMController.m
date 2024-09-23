@implementation BuddySIMController

- (BuddySIMController)init
{
  BuddySIMController *v2;
  id v3;
  id v4;
  id v5;
  BuddySIMController *v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddySIMController;
  v2 = -[BuddySIMController init](&v8, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = objc_alloc_init((Class)sub_100139200());
    objc_msgSend(location, "setSetupFlow:", v3);

    v4 = location;
    v5 = objc_msgSend(location, "setupFlow");
    objc_msgSend(v5, "setDelegate:", v4);

  }
  v6 = (BuddySIMController *)location;
  objc_storeStrong(&location, 0);
  return v6;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSIMSetup;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun(a1, a2) & 1) == 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, char);
  void *v8;
  BuddySIMController *v9;
  id v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, char);
  void *v15;
  id v16;
  id v17;
  id location[2];
  BuddySIMController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = _NSConcreteStackBlock;
  v12 = -1073741824;
  v13 = 0;
  v14 = sub_1001394BC;
  v15 = &unk_100281A80;
  v16 = location[0];
  v17 = objc_retainBlock(&v11);
  v3 = sub_100139200();
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100139534;
  v8 = &unk_1002834D0;
  v10 = v17;
  v9 = v19;
  objc_msgSend(v3, "needsToRun:", &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  TSSetupAssistantSIMSetupFlow *v2;
  id v3;

  v2 = -[BuddySIMController setupFlow](self, "setupFlow", a2, self);
  v3 = -[TSSetupAssistantSIMSetupFlow rootViewController](v2, "rootViewController");

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  BFFFlowItemDelegate *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BYSetupAssistantDidCompleteSIMSetupNotification, 0, 0, 1u);
  v4 = -[BuddySIMController delegate](self, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v4, "flowItemDone:", self);

}

- (void)updateSourceProxCardState:(BOOL)a3
{
  ProximitySetupController *v3;

  v3 = -[BuddySIMController proximitySetupController](self, "proximitySetupController");
  -[ProximitySetupController setSourceProxCardVisibliityForSIMSetupExternalAuthentication:](v3, "setSourceProxCardVisibliityForSIMSetupExternalAuthentication:", a3);

}

- (BFFFlowItemDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (TSSetupAssistantSIMSetupFlow)setupFlow
{
  return (TSSetupAssistantSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSetupFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupFlow, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
