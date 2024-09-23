@implementation DKUncertifiedAlertView

- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithCoder:(id)a3
{
  char *v3;
  _TtC18DKPairingUIService22DKUncertifiedAlertView *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger;
  v4 = self;
  Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010000FCF0, 0xD000000000000010, 0x800000010000FD10);
  v5 = OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert;
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert) = 0;
  v6 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v3, v6);
  v7 = *(Class *)((char *)&v4->super.super.super.isa + v5);

  v8 = type metadata accessor for DKUncertifiedAlertView(0);
  swift_deallocPartialClassInstance(v4, v8, *(unsigned int *)((swift_isaMask & (uint64_t)v4->super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)v4->super.super.super.isa) + 0x34));
  return 0;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DKUncertifiedAlertView(0);
  -[DKUncertifiedAlertView viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKUncertifiedAlertView(0);
  v4 = v5.receiver;
  -[DKUncertifiedAlertView viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_100002AC0();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DKUncertifiedAlertView(0);
  -[DKUncertifiedAlertView viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (_TtC18DKPairingUIService22DKUncertifiedAlertView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18DKPairingUIService22DKUncertifiedAlertView *result;

  v4 = a4;
  result = (_TtC18DKPairingUIService22DKUncertifiedAlertView *)_swift_stdlib_reportUnimplementedInitializer("DKPairingUIService.DKUncertifiedAlertView", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_viewAlert));
  sub_100003890((uint64_t)self + OBJC_IVAR____TtC18DKPairingUIService22DKUncertifiedAlertView_delegate);
}

@end
