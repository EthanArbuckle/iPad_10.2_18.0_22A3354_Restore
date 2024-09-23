@implementation AlertVerticalSeparator

- (_TtC18HealthExperienceUI22AlertVerticalSeparator)init
{
  _TtC18HealthExperienceUI22AlertVerticalSeparator *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22AlertVerticalSeparator____lazy_storage___vibrancyView) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AlertVerticalSeparator();
  v2 = -[AlertVerticalSeparator initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1A98BBC04();

  return v2;
}

- (_TtC18HealthExperienceUI22AlertVerticalSeparator)initWithCoder:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI22AlertVerticalSeparator *v5;
  _TtC18HealthExperienceUI22AlertVerticalSeparator *v6;
  _TtC18HealthExperienceUI22AlertVerticalSeparator *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22AlertVerticalSeparator____lazy_storage___vibrancyView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AlertVerticalSeparator();
  v4 = a3;
  v5 = -[AlertVerticalSeparator initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1A98BBC04();

  }
  return v6;
}

- (_TtC18HealthExperienceUI22AlertVerticalSeparator)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI22AlertVerticalSeparator *result;

  result = (_TtC18HealthExperienceUI22AlertVerticalSeparator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22AlertVerticalSeparator____lazy_storage___vibrancyView));
}

@end
