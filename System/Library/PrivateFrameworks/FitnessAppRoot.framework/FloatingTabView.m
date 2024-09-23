@implementation FloatingTabView

- (_TtC14FitnessAppRoot15FloatingTabView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23BCCBD6C();
}

- (void)layoutSubviews
{
  _TtC14FitnessAppRoot15FloatingTabView *v2;

  v2 = self;
  sub_23BCCB07C();

}

- (void)valueChanged:(id)a3
{
  id v4;
  _TtC14FitnessAppRoot15FloatingTabView *v5;

  v4 = a3;
  v5 = self;
  sub_23BCCBB8C(v4);

}

- (_TtC14FitnessAppRoot15FloatingTabView)initWithFrame:(CGRect)a3
{
  _TtC14FitnessAppRoot15FloatingTabView *result;

  result = (_TtC14FitnessAppRoot15FloatingTabView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23BCB9988((uint64_t)self + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_backgroundVisualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_segmentedControl));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14FitnessAppRoot15FloatingTabView_heightConstraint));
}

@end
