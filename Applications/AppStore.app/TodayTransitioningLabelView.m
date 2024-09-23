@implementation TodayTransitioningLabelView

- (void)layoutSubviews
{
  _TtC8AppStore27TodayTransitioningLabelView *v2;

  v2 = self;
  sub_10005F4B8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel), "sizeThatFits:", a3.width, a3.height);
  else
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_label), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8AppStore27TodayTransitioningLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000CA93C();
}

- (void)layoutDirectionDidChange
{
  _TtC8AppStore27TodayTransitioningLabelView *v2;

  v2 = self;
  sub_1000CA370();

}

- (_TtC8AppStore27TodayTransitioningLabelView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore27TodayTransitioningLabelView *result;

  result = (_TtC8AppStore27TodayTransitioningLabelView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.TodayTransitioningLabelView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fontForSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_defaultFont));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_applyPendingFontChange), *(_QWORD *)&self->isTransitioning[OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_applyPendingFontChange]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isTransitioning[OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_textAfterFontTransition]);
}

@end
