@implementation FMRemoteUIAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100010DF8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_10000A700;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000085C0(a3, v6);
  sub_100009F34((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController *v16;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100010DD0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_100009F68;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = qword_100015620;
  v10 = a3;
  v16 = self;
  if (v9 != -1)
    swift_once(&qword_100015620, sub_10000859C);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_100004CDC(v11, (uint64_t)qword_1000158B0);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "prepareForActivation(with context:, completion:) being called", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  if (v6)
  {
    v8();
    sub_100009F34((uint64_t)v8, v7);
  }

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = v3.receiver;
  -[FMRemoteUIAlertServiceViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100008A18();

}

- (void)viewDidLayoutSubviews
{
  _TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController *v2;

  v2 = self;
  sub_100008FDC();

}

- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  id v11;
  unsigned __int8 *v12;
  id v13;
  _TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
    v11 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v12 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
    v13 = a4;
  }
  v16.receiver = self;
  v16.super_class = ObjectType;
  v14 = -[FMRemoteUIAlertServiceViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", a3, a4);

  return v14;
}

- (_TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = &self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_contentViewController];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[FMRemoteUIAlertServiceViewController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC21FindMyRemoteUIService36FMRemoteUIAlertServiceViewController_context]);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
