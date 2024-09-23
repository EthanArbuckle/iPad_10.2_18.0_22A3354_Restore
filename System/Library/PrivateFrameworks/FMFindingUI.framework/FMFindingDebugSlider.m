@implementation FMFindingDebugSlider

- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23AA14C6C();
}

- (void)handleValueChangedWithSender:(id)a3
{
  id v4;
  _TtC11FMFindingUI20FMFindingDebugSlider *v5;

  v4 = a3;
  v5 = self;
  sub_23AA148A0();

}

- (_TtC11FMFindingUI20FMFindingDebugSlider)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI20FMFindingDebugSlider *result;

  result = (_TtC11FMFindingUI20FMFindingDebugSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMFindingDebugSlider_stepper));
  swift_bridgeObjectRelease();
}

@end
