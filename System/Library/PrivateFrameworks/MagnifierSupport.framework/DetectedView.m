@implementation DetectedView

- (_TtC16MagnifierSupport12DetectedView)initWithCoder:(id)a3
{
  DetectedView.init(coder:)(a3);
  return 0;
}

- (void)updateTargetAnimation
{
  _TtC16MagnifierSupport12DetectedView *v2;

  v2 = self;
  sub_2274CA158();

}

- (BOOL)accessibilityActivate
{
  _TtC16MagnifierSupport12DetectedView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_22758E1B4();
  -[DetectedView setAccessibilityLabel:](v2, sel_setAccessibilityLabel_, v3);

  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D1A0();

  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  _TtC16MagnifierSupport12DetectedView *v2;

  v2 = self;
  sub_2274CA81C();

}

- (_TtC16MagnifierSupport12DetectedView)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport12DetectedView *result;

  result = (_TtC16MagnifierSupport12DetectedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__positionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__dottedLineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12DetectedView__targetAnimationDisplayLink));
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  return 299007;
}

@end
