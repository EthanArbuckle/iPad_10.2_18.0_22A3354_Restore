@implementation FootnoteView

- (_TtC22SubscribePageExtension12FootnoteView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension12FootnoteView *)sub_10012357C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension12FootnoteView)initWithCoder:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension12FootnoteView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_chevronView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_hasChevron) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLightensOnHighlight) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_isHighlighted) = 0;
  v4 = a3;

  result = (_TtC22SubscribePageExtension12FootnoteView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/FootnoteView.swift", 41, 2, 66, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC22SubscribePageExtension12FootnoteView *v5;
  __n128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6.n128_f64[0] = width;
  v7 = sub_100123A58(v6, height);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension12FootnoteView *v2;

  v2 = self;
  sub_100123C8C();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12FootnoteView_chevronView));
}

@end
