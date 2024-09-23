@implementation TodayCardActionOverlayView

- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26TodayCardActionOverlayView *)sub_10007EB10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension26TodayCardActionOverlayView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessoryView) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_isExpanded) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_sizeCategory) = 7;
  v4 = a3;

  result = (_TtC22SubscribePageExtension26TodayCardActionOverlayView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/TodayCardActionOverlayView.swift", 55, 2, 83, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC22SubscribePageExtension26TodayCardActionOverlayView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_10007EED8(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension26TodayCardActionOverlayView *v2;

  v2 = self;
  sub_10007F164();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension26TodayCardActionOverlayView *v6;

  v5 = a3;
  v6 = self;
  sub_10007F498(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_label));
  sub_10007F9D4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessoryView));
}

@end
