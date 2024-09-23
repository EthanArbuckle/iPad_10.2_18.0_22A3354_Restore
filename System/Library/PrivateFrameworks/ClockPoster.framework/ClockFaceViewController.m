@implementation ClockFaceViewController

- (void)loadView
{
  -[ClockFaceViewController setView:](self, sel_setView_, *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView));
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v2 = v3.receiver;
  -[ClockFaceViewController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2, v3.receiver, v3.super_class);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v4 = v5.receiver;
  -[ClockFaceViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  v4[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 1;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v4 = v5.receiver;
  -[ClockFaceViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  v4[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 0;

}

- (_TtC11ClockPoster23ClockFaceViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster23ClockFaceViewController *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_isDisplayStyleRedMode) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode) = 0;
  v4 = a3;

  result = (_TtC11ClockPoster23ClockFaceViewController *)sub_237EE309C();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11ClockPoster23ClockFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11ClockPoster23ClockFaceViewController *result;

  v4 = a4;
  result = (_TtC11ClockPoster23ClockFaceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView));
}

@end
