@implementation InAppPurchaseShowcaseCollectionViewCell

- (_TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell *)sub_1002D46F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = OBJC_IVAR____TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell_lockupView;
  v8 = objc_allocWithZone((Class)type metadata accessor for InAppPurchaseShowcaseLockupView());
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/InAppPurchaseShowcaseCollectionViewCell.swift", 54, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinX;
  objc_super v13;
  CGRect v14;

  v3 = (objc_class *)type metadata accessor for InAppPurchaseShowcaseCollectionViewCell(0);
  v13.receiver = self;
  v13.super_class = v3;
  v4 = self;
  -[InAppPurchaseShowcaseCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell_lockupView);
  LayoutMarginsAware<>.layoutFrame.getter(v3);
  objc_msgSend(v5, "sizeThatFits:", v6, v7, v13.receiver, v13.super_class);
  v9 = v8;
  v11 = v10;
  *(_QWORD *)&v14.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  MinX = CGRectGetMinX(v14);
  if (qword_1008278B8 != -1)
    swift_once(&qword_1008278B8, sub_1002D4594);
  objc_msgSend(v5, "setFrame:", MinX, *(double *)&qword_10083B5C0, v9, v11);

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39InAppPurchaseShowcaseCollectionViewCell_lockupView));
}

@end
