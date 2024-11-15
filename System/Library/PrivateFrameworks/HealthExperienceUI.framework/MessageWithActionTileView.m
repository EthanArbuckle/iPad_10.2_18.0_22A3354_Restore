@implementation MessageWithActionTileView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_titleLabel));
}

- (UILabel)bodyLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_bodyLabel));
}

- (UIButton)actionButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_actionButton));
}

- (_TtC18HealthExperienceUI25MessageWithActionTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI25MessageWithActionTileView *)sub_1A9A36DE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI25MessageWithActionTileView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9A38914();
}

- (void)updateConstraints
{
  _TtC18HealthExperienceUI25MessageWithActionTileView *v2;

  v2 = self;
  sub_1A9A371FC();

}

- (void)didTapAction:(id)a3
{
  _TtC18HealthExperienceUI25MessageWithActionTileView *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9A37ECC();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_separatorTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_actionButtonTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_bottomConstraint));
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI25MessageWithActionTileView_didTapActionButton));
}

@end
