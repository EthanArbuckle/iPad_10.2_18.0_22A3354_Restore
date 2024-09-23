@implementation RollingClockView

- (_TtC11ClockPoster16RollingClockView)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC11ClockPoster16RollingClockView *result;

  v4 = a3;
  sub_237EE1EB4();
  v5 = OBJC_IVAR____TtC11ClockPoster16RollingClockView_model;
  type metadata accessor for RollingClockViewModel();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_237E19ED0();

  result = (_TtC11ClockPoster16RollingClockView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for RollingClockView();
  -[RollingClockView layoutSubviews](&v2, sel_layoutSubviews);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC11ClockPoster16RollingClockView *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster16RollingClockView_viewController);
  v6 = self;
  v7 = objc_msgSend(v5, sel_view);
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, sel_sizeThatFits_, width, height);
    v12 = v11;
    v14 = v13;

    v8 = v12;
    v9 = v14;
  }
  else
  {
    __break(1u);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11ClockPoster16RollingClockView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster16RollingClockView *result;

  result = (_TtC11ClockPoster16RollingClockView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11ClockPoster16RollingClockView_timeZone;
  v4 = sub_237EE1EC0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster16RollingClockView_viewController));
  swift_release();
}

@end
