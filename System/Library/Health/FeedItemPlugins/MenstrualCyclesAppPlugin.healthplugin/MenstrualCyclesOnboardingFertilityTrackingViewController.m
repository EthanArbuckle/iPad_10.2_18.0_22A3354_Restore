@implementation MenstrualCyclesOnboardingFertilityTrackingViewController

- (void)dealloc
{
  void *v2;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v3;
  objc_super v4;

  v2 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController_userInfo)
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18OnboardingUserInfo_observers);
  v3 = self;
  objc_msgSend(v2, sel_unregisterObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingFertilityTrackingViewController();
  -[MenstrualCyclesOnboardingFertilityTrackingViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController_pinnedContentManager);
  sub_23190C114((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController____lazy_storage___heightAnchor));
}

- (void)viewDidLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v2;

  v2 = self;
  sub_231B38D44();

}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v2;

  v2 = self;
  sub_231B38EFC();

}

- (void)nextButtonTapped:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_231CA27D8();
  swift_unknownObjectRelease();
  sub_231B39074();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_231CA27D8();
  swift_unknownObjectRelease();
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v6 = sub_231911848((uint64_t)sub_231B3B70C, v5);
  swift_release_n();
  -[MenstrualCyclesOnboardingFertilityTrackingViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v6, 1, 0);

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v7);
}

- (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *result;

  v5 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v5;
  _QWORD *v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  swift_retain();
  v6 = sub_231AA3374(1);
  swift_release();
  v7 = v6[2];

  swift_bridgeObjectRelease();
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_231B39F50(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_231B3A5A8(v6, a4);
  v9 = v8;

  return v9;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _TtC24MenstrualCyclesAppPlugin56MenstrualCyclesOnboardingFertilityTrackingViewController *v8;

  v4 = a4;
  v7 = a3;
  v8 = self;
  sub_231B3AB04(a3, v4);

}

@end
