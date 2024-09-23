@implementation BadgeParagraphView

- (_TtC22SubscribePageExtension18BadgeParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18BadgeParagraphView *)sub_1004628E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18BadgeParagraphView)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension18BadgeParagraphView *result;

  result = (_TtC22SubscribePageExtension18BadgeParagraphView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/BadgeParagraphView.swift", 47, 2, 62, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC22SubscribePageExtension18BadgeParagraphView *v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension18BadgeParagraphView_paragraphLabel);
  v6 = self;
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v8 = v7;
  v9 = -[BadgeParagraphView traitCollection](v6, "traitCollection");
  v10 = sub_100463980(v9, v8, width);
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension18BadgeParagraphView *v2;

  v2 = self;
  sub_100462E90();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension18BadgeParagraphView *v6;

  v5 = a3;
  v6 = self;
  sub_100463124((uint64_t)a3);

}

- (void)preferredContentSizeCategoryDidChange
{
  _TtC22SubscribePageExtension18BadgeParagraphView *v2;

  v2 = self;
  sub_10046325C();

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityParagraphLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension18BadgeParagraphView_paragraphLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18BadgeParagraphView_paragraphLabel));
  sub_100463B48((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18BadgeParagraphView_metrics);
}

@end
