@implementation PreferencesListControllerNavigationCoordinator

- (BOOL)listControllerShouldDeselectAfterFormSheetDisappearance:(id)a3 givenRootController:(id)a4
{
  id v6;
  id v7;
  _TtC11SettingsApp46PreferencesListControllerNavigationCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1000AE2E8(v6, a4);

  return a4 & 1;
}

- (BOOL)listControllerShouldNotDeselectAfterAppearing:(id)a3
{
  id v4;
  _TtC11SettingsApp46PreferencesListControllerNavigationCoordinator *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_1000AEA84(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)listController:(id)a3 pushViewController:(id)a4 givenRootController:(id)a5 withModalStylePopupStateApplicator:(id)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC11SettingsApp46PreferencesListControllerNavigationCoordinator *v17;

  v7 = a7;
  v12 = _Block_copy(a6);
  v13 = swift_allocObject(&unk_10014BE08, 24, 7);
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  sub_1000AF224(v14, v15, (void **)a5, (uint64_t (*)())sub_1000B1180, v13, v7);

  swift_release(v13);
}

- (BOOL)listControllerIsOnTopOfNavigationStack:(id)a3 searchTopMostViewControllerChildren:(BOOL)a4
{
  id v6;
  _TtC11SettingsApp46PreferencesListControllerNavigationCoordinator *v7;
  char v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1000B09A4(v6, a4);

  return v8 & 1;
}

- (_TtC11SettingsApp46PreferencesListControllerNavigationCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[PreferencesListControllerNavigationCoordinator init](&v3, "init");
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC11SettingsApp46PreferencesListControllerNavigationCoordinator *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1000B0BEC(v4);
  v7 = v6;

  return v7;
}

@end
