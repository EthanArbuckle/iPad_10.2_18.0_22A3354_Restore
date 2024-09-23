@implementation MultilineButton

- (_TtC18HealthExperienceUI15MultilineButton)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI15MultilineButton *)MultilineButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI15MultilineButton)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI15MultilineButton *)MultilineButton.init(coder:)(a3);
}

- (void)updateConstraints
{
  _TtC18HealthExperienceUI15MultilineButton *v2;

  v2 = self;
  sub_1A9904334();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelBottomConstraint));
}

@end
