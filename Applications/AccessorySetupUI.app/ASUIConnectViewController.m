@implementation ASUIConnectViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[ASUIConnectViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6;
  _TtC16AccessorySetupUI25ASUIConnectViewController *v7;

  v6 = a4;
  v7 = self;
  sub_1000318EC(a3);

}

- (void)dealloc
{
  _TtC16AccessorySetupUI25ASUIConnectViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_10002F294((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_10000A0F8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_router], (uint64_t)a2);
  sub_10000A0A4(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext], *(_QWORD *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 7], *(_QWORD *)&self->router[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 7], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 15], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 23], *(_QWORD *)&self->routingContext[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_routingContext + 31]);

  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellable]);
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_cancellablePageControl]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_devices]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->type[OBJC_IVAR____TtC16AccessorySetupUI25ASUIConnectViewController_appName]);

}

- (_TtC16AccessorySetupUI25ASUIConnectViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC16AccessorySetupUI25ASUIConnectViewController *v6;

  v4 = a3;
  v6 = (_TtC16AccessorySetupUI25ASUIConnectViewController *)sub_100031A3C((uint64_t)a3, v5);

  return v6;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC16AccessorySetupUI25ASUIConnectViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100031B4C();

}

@end
