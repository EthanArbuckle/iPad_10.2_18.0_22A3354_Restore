@implementation BoopToMeetFlowViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  BoopToMeetFlowViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017B598, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100091EBC(a3, v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  BoopToMeetFlowViewController *v4;

  v3 = a3;
  v4 = self;
  sub_100092268(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  BoopToMeetFlowViewController *v4;

  v4 = self;
  sub_100092A34(a3);

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  BoopToMeetFlowViewController *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = qword_1001A3090;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_1001A3090, sub_100091E2C);
  v7 = type metadata accessor for Logger(0, v5);
  v8 = sub_10000E8E8(v7, (uint64_t)qword_1001A6A40);
  v9 = Logger.logObject.getter(v8);
  v11 = static os_log_type_t.default.getter(v9, v10);
  if (os_log_type_enabled(v9, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v11, "BoopToMeetFlowViewController: viewDidLoad", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v13.receiver = v6;
  v13.super_class = ObjectType;
  -[BoopToMeetFlowViewController viewDidLoad](&v13, "viewDidLoad");

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BoopToMeetFlowViewController *v8;

  if (a3)
  {
    v5 = sub_100013194(0, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10009370C((unint64_t *)&qword_1001A5610, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100092D74(v7);

  swift_bridgeObjectRelease(v7);
}

- (BoopToMeetFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  BoopToMeetFlowViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[BoopToMeetFlowViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (BoopToMeetFlowViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[BoopToMeetFlowViewController initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
