@implementation FeatureInactiveWithNoDataTileView

- (_TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView)init
{
  return -[FeatureInactiveWithNoDataTileView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView *)sub_1A9990A00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView____lazy_storage___tileView) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView_context, (uint64_t (*)(_QWORD))sub_1A96A1690);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33FeatureInactiveWithNoDataTileView____lazy_storage___tileView));
}

@end
