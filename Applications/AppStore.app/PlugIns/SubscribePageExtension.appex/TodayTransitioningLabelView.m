@implementation TodayTransitioningLabelView

- (_TtC22SubscribePageExtension27TodayTransitioningLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CB84C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_fadeInLabel))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_fadeInLabel), "sizeThatFits:", a3.width, a3.height);
  else
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_label), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension27TodayTransitioningLabelView *v2;

  v2 = self;
  sub_1001C9C68();

}

- (void)layoutDirectionDidChange
{
  _TtC22SubscribePageExtension27TodayTransitioningLabelView *v2;

  v2 = self;
  sub_1001CB248();

}

- (_TtC22SubscribePageExtension27TodayTransitioningLabelView)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension27TodayTransitioningLabelView *result;

  result = (_TtC22SubscribePageExtension27TodayTransitioningLabelView *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.TodayTransitioningLabelView", 50, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_fadeInLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_fontForSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_defaultFont));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_applyPendingFontChange), *(_QWORD *)&self->isTransitioning[OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_applyPendingFontChange]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isTransitioning[OBJC_IVAR____TtC22SubscribePageExtension27TodayTransitioningLabelView_textAfterFontTransition]);
}

@end
