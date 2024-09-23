@implementation MessageWithSeparatedActionTileView

- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView *)sub_1A97F0AB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI34MessageWithSeparatedActionTileView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A97F19D0();
}

- (void)didTapAction:(id)a3
{
  _TtC18HealthExperienceUI34MessageWithSeparatedActionTileView *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A97F1494();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_actionButton));
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithSeparatedActionTileView_didTapActionButton));
}

@end
