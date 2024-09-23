@implementation ChartSonificationContainerView

- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithCoder:(id)a3
{
  id v4;
  _TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_displayLink) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_state) = 0;
  v4 = a3;

  result = (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *)sub_21C829C88();
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityDidChangeSonificationPlaybackPosition:(double)a3
{
  _TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *v4;

  v4 = self;
  sub_21C791BE8(a3);

}

- (void)_accessibilitySonificationPlaybackStatusChanged:(unint64_t)a3
{
  _TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *v4;

  v4 = self;
  sub_21C7919E8((id)a3);

}

- (void)updatePlayhead:(double)a3
{
  _TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *v4;

  v4 = self;
  sub_21C791BE8(a3);

}

- (NSAttributedString)accessibilityAttributedLabel
{
  return (NSAttributedString *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor), sel_attributedTitle);
}

- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithFrame:(CGRect)a3
{
  _TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *result;

  result = (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_numberFormatter));
  swift_release();
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  return (AXChartDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor));
}

@end
