@implementation RemoteAlertServiceViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000106E0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100006468;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100004760(a3, v6);
  sub_100006434((uint64_t)v6, v7);

}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  v2 = v9.receiver;
  -[RemoteAlertServiceViewController viewDidLoad](&v9, "viewDidLoad");
  if (qword_100015C10 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100005EB4(v3, (uint64_t)qword_100015D58);
  v5 = Logger.logObject.getter(v4);
  v7 = static os_log_type_t.info.getter(v5, v6);
  if (os_log_type_enabled(v5, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v7, "Starting HomeCaptiveViewService", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *v4;

  v4 = self;
  sub_100004D88(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *v4;

  v4 = self;
  sub_100004F1C(a3);

}

- (void)didInvalidateForRemoteAlert
{
  uint64_t v2;
  _TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *oslog;

  v2 = qword_100015C10;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_100015C10, sub_100004540);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100005EB4(v4, (uint64_t)qword_100015D58);
  oslog = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter(oslog, v6);
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Invalidated HomeCaptiveViewService", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

}

- (void)extensionDeviceLostWithNotification:(id)a3
{
  id v4;
  _TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000051B0(v4);

}

- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController *)sub_100005B8C(v5, v7, a4);
}

- (_TtC22HomeCaptiveViewService32RemoteAlertServiceViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController] = 1;
  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController_coordinator] = 0;
  *(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___notificationCenter] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoteAlertServiceViewController();
  return -[RemoteAlertServiceViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100006414(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService32RemoteAlertServiceViewController____lazy_storage___remoteViewController]);

}

@end
