@implementation DKPairingAlertView

- (_TtC18DKPairingUIService18DKPairingAlertView)initWithCoder:(id)a3
{
  sub_10000BE38(a3);
  return 0;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DKPairingAlertView(0);
  -[DKPairingAlertView viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKPairingAlertView(0);
  v4 = v5.receiver;
  -[DKPairingAlertView viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_10000C038();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DKPairingAlertView(0);
  -[DKPairingAlertView viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (_TtC18DKPairingUIService18DKPairingAlertView)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18DKPairingUIService18DKPairingAlertView *result;

  v4 = a4;
  result = (_TtC18DKPairingUIService18DKPairingAlertView *)_swift_stdlib_reportUnimplementedInitializer("DKPairingUIService.DKPairingAlertView", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_viewAlert));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC18DKPairingUIService18DKPairingAlertView_controller));
}

@end
