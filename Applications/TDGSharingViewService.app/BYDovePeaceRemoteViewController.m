@implementation BYDovePeaceRemoteViewController

- (void)dealloc
{
  uint64_t v2;
  BYDovePeaceRemoteViewController *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v9;

  v2 = qword_100041E50;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_100041E50, sub_10001A2E8);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100006C44(v4, (uint64_t)qword_100044E40);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BYDovePeaceRemoteViewController deinit", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  -[BYDovePeaceRemoteViewController dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BYDovePeaceRemoteViewController_appleIDManager]);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BYDovePeaceRemoteViewController_assetLoader]);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  BYDovePeaceRemoteViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10003A070, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10001D17C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10001AECC((char *)a3, v6, v7);
  sub_10000B5A0((uint64_t)v6, v7);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  BYDovePeaceRemoteViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10003A048, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10001D074;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10001B780(a3, v6, v7);
  sub_10000B5A0((uint64_t)v6, v7);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  BYDovePeaceRemoteViewController *v2;

  v2 = self;
  sub_10001BB1C();

}

- (void)_willAppearInRemoteViewController
{
  BYDovePeaceRemoteViewController *v2;

  v2 = self;
  sub_10001BD2C();

}

- (void)viewDidAppear:(BOOL)a3
{
  BYDovePeaceRemoteViewController *v4;

  v4 = self;
  sub_10001BE58(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  BYDovePeaceRemoteViewController *v4;

  v4 = self;
  sub_10001C214(a3);

}

- (void)handleButtonActions:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BYDovePeaceRemoteViewController *v8;

  if (a3)
  {
    v5 = sub_10001CFC4();
    v6 = sub_10001D000();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_10001C5B0(v7);

  swift_bridgeObjectRelease(v7);
}

- (void)handleHomeButtonPressed
{
  BYDovePeaceRemoteViewController *v2;

  v2 = self;
  sub_10001C9D0();

}

- (BYDovePeaceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (BYDovePeaceRemoteViewController *)sub_10001CC08(v5, v7, a4);
}

- (BYDovePeaceRemoteViewController)initWithCoder:(id)a3
{
  return (BYDovePeaceRemoteViewController *)sub_10001CE10(a3);
}

@end
