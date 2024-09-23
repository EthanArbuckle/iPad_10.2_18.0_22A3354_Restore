@implementation FMRemoteUIPRXFlowContentViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController *v4;

  v4 = self;
  sub_10000A820(a3);

}

- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  v11 = -[FMRemoteUIPRXFlowContentViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMRemoteUIPRXFlowContentViewController();
  return -[FMRemoteUIPRXFlowContentViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController_proxCardNavigationController));
}

- (void)proxCardFlowDidDismiss
{
  _TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController *v2;

  v2 = self;
  sub_10000AB60();

}

- (void)proxCardFlowWillPresent
{
  uint64_t v2;
  _TtC21FindMyRemoteUIService38FMRemoteUIPRXFlowContentViewController *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  v2 = qword_100015640;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_100015640, sub_10000A738);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_100004CDC(v4, (uint64_t)qword_1000159F0);
  oslog = Logger.logObject.getter(v5);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Prox card flow will present.", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

}

@end
