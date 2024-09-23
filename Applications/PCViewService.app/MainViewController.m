@implementation MainViewController

- (void)dealloc
{
  MainViewController *v2;
  id v3;
  NSString v4;
  objc_super v5;

  v2 = self;
  v3 = sub_1000534E0();
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "ulog:message:", 40, v4);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for MainViewController();
  -[MainViewController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___MainViewController_environment], a2);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___MainViewController_backlightLuminanceBecameReducedSubject]);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___MainViewController_homeGestureEventSubject]);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void *);
  uint64_t v7;
  id v8;
  MainViewController *v9;

  v6 = (void (*)(void *))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000B3340, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void *))sub_10000AB6C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100007D40(a3, v6);
  sub_100007A90((uint64_t)v6, v7);

}

- (void)didInvalidateForRemoteAlert
{
  MainViewController *v2;

  v2 = self;
  sub_100008274();

}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  MainViewController *v8;

  v5 = sub_10000AA28(0, &qword_1000C6698, SBUIRemoteAlertButtonAction_ptr);
  v6 = sub_10000AA60();
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = self;
  sub_1000083E4(v7);

  swift_bridgeObjectRelease(v7);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  MainViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100009594((uint64_t)a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  MainViewController *v4;

  v4 = self;
  sub_100009790(a3);

}

- (void)viewDidLoad
{
  MainViewController *v2;

  v2 = self;
  sub_1000098CC();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  MainViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1000099F4(a3, a4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (MainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (MainViewController *)sub_10000A064(v5, v7, a4);
}

- (MainViewController)initWithCoder:(id)a3
{
  return (MainViewController *)sub_10000A1CC(a3);
}

@end
