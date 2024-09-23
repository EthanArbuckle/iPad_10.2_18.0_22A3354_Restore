@implementation RGBCaptureViewController

- (_TtC9CoreIDVUI24RGBCaptureViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_213F5EB40();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RGBCaptureViewController();
  v4 = v10.receiver;
  -[RGBCaptureViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
  v5 = sub_213FF8618();
  v7 = v6;
  v8 = sub_213FF8498();
  sub_213F59F60(v5, v7, v8, v9, 0, 0, 0, 0, 0, 0, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9CoreIDVUI24RGBCaptureViewController *v4;

  v4 = self;
  sub_213F5AD4C(a3);

}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI24RGBCaptureViewController *v2;

  v2 = self;
  sub_213F5AEC0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_captureConfig;
  v4 = sub_213FF88D0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_uiConfig));
  swift_release();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC9CoreIDVUI24RGBCaptureViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_213F5ED90(v8);

}

- (void)cancelBarButtonClicked
{
  _TtC9CoreIDVUI24RGBCaptureViewController *v2;

  v2 = self;
  sub_213F5E510();

}

@end
