@implementation ListStyleAccessoryView

- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22ListStyleAccessoryView *)ListStyleAccessoryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18HealthExperienceUI22ListStyleAccessoryView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView_baseIdentifier);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___containerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___separator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___label) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI22ListStyleAccessoryView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___label));
}

@end
