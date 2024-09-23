@implementation AppPromotionOfferCollectionViewCell

- (_TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell *)sub_100094F24();
}

- (_TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AppPromotionOfferCollectionViewCell.swift", 62, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v9.receiver;
  -[AppPromotionOfferCollectionViewCell layoutSubviews](&v9, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell_appPromotionView];
  objc_msgSend(v2, "bounds", v9.receiver, v9.super_class);
  objc_msgSend(v3, "setBounds:", 0.0, 0.0);
  objc_msgSend(v2, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v11));

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell *v2;

  v2 = self;
  sub_100094780();

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35AppPromotionOfferCollectionViewCell_appPromotionView));
}

@end
