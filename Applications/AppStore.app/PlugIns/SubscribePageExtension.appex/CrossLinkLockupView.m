@implementation CrossLinkLockupView

- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension19CrossLinkLockupView *)sub_1001B6CDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001B8F38();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC22SubscribePageExtension19CrossLinkLockupView *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1001B721C((uint64_t)v9);
  -[CrossLinkLockupView layoutMargins](v10, "layoutMargins");
  v11 = -[CrossLinkLockupView traitCollection](v10, "traitCollection");
  v12 = sub_1001934E0((uint64_t)v9, (uint64_t)v11, width, height);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension19CrossLinkLockupView *v2;

  v2 = self;
  sub_1001B7850();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkPresenter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView____lazy_storage___lockupViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView____lazy_storage___crossLinkViews));
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkTitleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
}

@end
