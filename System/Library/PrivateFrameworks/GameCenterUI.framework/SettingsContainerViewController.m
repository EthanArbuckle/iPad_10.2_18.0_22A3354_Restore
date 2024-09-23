@implementation SettingsContainerViewController

- (void)dealloc
{
  _TtC12GameCenterUI31SettingsContainerViewController *v2;

  v2 = self;
  SettingsContainerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_childViewController);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_overlayView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_scrollView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_onboardingNavigationController);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController_viewDidLayoutSubviewsCallback));
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_85_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController__rootController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31SettingsContainerViewController__specifier));
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI31SettingsContainerViewController *v2;

  v2 = self;
  sub_1AB520B8C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12GameCenterUI31SettingsContainerViewController *v3;

  v3 = self;
  sub_1AB521884();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12GameCenterUI31SettingsContainerViewController *v3;

  v3 = self;
  sub_1AB521AC0();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12GameCenterUI31SettingsContainerViewController *v3;

  v3 = self;
  sub_1AB521B4C();

}

- (void)viewDidLayoutSubviews
{
  _TtC12GameCenterUI31SettingsContainerViewController *v2;

  v2 = self;
  sub_1AB521C1C();

}

- (PSRootController)_rootController
{
  id v2;

  sub_1AB521DA0();
  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5;
  _TtC12GameCenterUI31SettingsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB521E0C((uint64_t)a3);

}

- (PSSpecifier)_specifier
{
  id v2;

  sub_1AB521E38();
  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5;
  _TtC12GameCenterUI31SettingsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB521EA4((uint64_t)a3);

}

- (_TtC12GameCenterUI31SettingsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC12GameCenterUI31SettingsContainerViewController *)sub_1AB5247A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))SettingsContainerViewController.init(nibName:bundle:));
}

- (_TtC12GameCenterUI31SettingsContainerViewController)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI31SettingsContainerViewController *)SettingsContainerViewController.init(coder:)((uint64_t)a3);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)parentController
{
  return SettingsContainerViewController.parentController()();
}

- (void)setRootController:(id)a3
{
  id v5;
  _TtC12GameCenterUI31SettingsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  SettingsContainerViewController.setRoot(_:)(a3);

}

- (id)rootController
{
  id v2;

  SettingsContainerViewController.rootController()();
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v5;
  _TtC12GameCenterUI31SettingsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  SettingsContainerViewController.setSpecifier(_:)(a3);

}

- (id)specifier
{
  id v2;

  SettingsContainerViewController.specifier()();
  return v2;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6;
  _TtC12GameCenterUI31SettingsContainerViewController *v7;
  id v8;
  _TtC12GameCenterUI31SettingsContainerViewController *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }

  sub_1AB48E78C((uint64_t)v10, (uint64_t *)&unk_1EEBFBCA0);
}

- (id)readPreferenceValue:(id)a3
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;

  SettingsContainerViewController.readPreferenceValue(_:)((uint64_t)v11);
  v3 = v12;
  if (!v12)
    return 0;
  v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
  v9 = (void *)sub_1AB7DBA94();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t (*v7)();
  _TtC12GameCenterUI31SettingsContainerViewController *v8;

  v6 = _Block_copy(a4);
  if (a3)
    a3 = (id)sub_1AB7DAEB8();
  if (v6)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v6;
    v7 = sub_1AB48638C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  SettingsContainerViewController.handleURL(_:withCompletion:)((uint64_t)a3, (void (*)(uint64_t))v7);
  sub_1AB46A9C4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7;
  _TtC12GameCenterUI31SettingsContainerViewController *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a5;
  SettingsContainerViewController.signInController(_:didCompleteWithSuccess:error:)((uint64_t)v7, 0, a5);

}

- (void)signInControllerDidCancel:(id)a3
{
  AAUISignInController *v4;
  _TtC12GameCenterUI31SettingsContainerViewController *v5;

  v4 = (AAUISignInController *)a3;
  v5 = self;
  SettingsContainerViewController.signInControllerDidCancel(_:)(v4);

}

- (void)openAvatarEditor
{
  _TtC12GameCenterUI31SettingsContainerViewController *v2;

  v2 = self;
  SettingsContainerViewController.openAvatarEditor()();

}

- (void)photoPickerDidCancel:(id)a3
{
  id v4;
  _TtC12GameCenterUI31SettingsContainerViewController *v5;

  v4 = a3;
  v5 = self;
  SettingsContainerViewController.photoPickerDidCancel(_:)(v4);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12GameCenterUI31SettingsContainerViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  SettingsContainerViewController.photoPicker(_:didUpdatePhotoFor:with:)(v8, (uint64_t)v9, (uint64_t)v10);

}

- (void)openPlayerProfileViewWithPlayerID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC12GameCenterUI31SettingsContainerViewController *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  SettingsContainerViewController.openPlayerProfileView(playerID:)(v8);

  swift_bridgeObjectRelease();
}

- (void)onboardingFlowFinishedWithAction:(unint64_t)a3
{
  _TtC12GameCenterUI31SettingsContainerViewController *v3;

  v3 = self;
  SettingsContainerViewController.onboardingFlowFinished(with:)();

}

@end
