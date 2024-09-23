@implementation UpsellBreakoutCollectionViewCell

- (_TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell *)sub_10046EC18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_shouldApplyBreakoutData) = 1;
  v7 = a3;

  result = (_TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/UpsellBreakoutCollectionViewCell.swift", 61, 2, 29, 0);
  __break(1u);
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_upsellBreakoutView), "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_upsellBreakoutView), "setLayoutMargins:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UpsellBreakoutCollectionViewCell(0);
  v2 = (char *)v13.receiver;
  -[UpsellBreakoutCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_upsellBreakoutView];
  v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  v5 = sub_10000EF74();
  v6 = LayoutMarginsAware<>.layoutFrame.getter(v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for UpsellBreakoutCollectionViewCell(0);
  -[UpsellBreakoutCollectionViewCell prepareForReuse](&v2, "prepareForReuse");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_10046F27C(v4);

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32UpsellBreakoutCollectionViewCell_upsellBreakoutView));
}

@end
