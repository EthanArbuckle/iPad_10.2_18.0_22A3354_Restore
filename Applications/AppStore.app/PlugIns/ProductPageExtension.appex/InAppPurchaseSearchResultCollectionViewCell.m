@implementation InAppPurchaseSearchResultCollectionViewCell

- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *)sub_1004A9BD8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *result;

  v4 = OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  v5 = qword_100805E90;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100805E90, sub_1004A959C);
  v8 = type metadata accessor for InAppPurchaseSearchResultLayout.Metrics(0, v7);
  v9 = sub_10000EFC4(v8, (uint64_t)qword_100868D50);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))((char *)self + v4, v9, v8);
  v10 = OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor;
  sub_100018B6C(0, (unint64_t *)&qword_100808850, UIColor_ptr);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = (Class)static UIColor.componentBackgroundStandout.getter();

  result = (_TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InAppPurchaseSearchResultCollectionViewCell.swift", 70, 2, 186, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *v2;

  v2 = self;
  sub_1004AA56C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell *v6;

  v5 = a3;
  v6 = self;
  sub_1004AA92C(a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_metrics;
  v4 = type metadata accessor for InAppPurchaseSearchResultLayout.Metrics(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_bodyBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppPurchaseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_body));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43InAppPurchaseSearchResultCollectionViewCell_inAppDescription));
}

@end
