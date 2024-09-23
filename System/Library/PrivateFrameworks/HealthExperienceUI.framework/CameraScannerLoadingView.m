@implementation CameraScannerLoadingView

- (_TtC18HealthExperienceUI24CameraScannerLoadingView)init
{
  _TtC18HealthExperienceUI24CameraScannerLoadingView *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___blurView) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CameraScannerLoadingView();
  v2 = -[CameraScannerLoadingView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1A9727748();

  return v2;
}

- (_TtC18HealthExperienceUI24CameraScannerLoadingView)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI24CameraScannerLoadingView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___blurView) = 0;
  v4 = a3;

  result = (_TtC18HealthExperienceUI24CameraScannerLoadingView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI24CameraScannerLoadingView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI24CameraScannerLoadingView *result;

  result = (_TtC18HealthExperienceUI24CameraScannerLoadingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24CameraScannerLoadingView____lazy_storage___blurView));
}

@end
