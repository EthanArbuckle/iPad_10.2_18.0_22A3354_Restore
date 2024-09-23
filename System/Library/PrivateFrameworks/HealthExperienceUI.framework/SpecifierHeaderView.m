@implementation SpecifierHeaderView

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithSpecifier:(id)a3
{
  return (_TtC18HealthExperienceUI19SpecifierHeaderView *)sub_1A984C840(a3);
}

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC18HealthExperienceUI19SpecifierHeaderView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView_statusText);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___iconImageView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___descriptionLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___statusLabel) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI19SpecifierHeaderView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SpecifierHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v3, v4);
  return v5;
}

- (_TtC18HealthExperienceUI19SpecifierHeaderView)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI19SpecifierHeaderView *result;

  result = (_TtC18HealthExperienceUI19SpecifierHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView_image));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19SpecifierHeaderView____lazy_storage___statusLabel));
}

@end
