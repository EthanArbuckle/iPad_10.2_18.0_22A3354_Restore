@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *)sub_100133FA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_badgeText);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_titleText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext;
  v10 = type metadata accessor for ChartOrCategoryBrickContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a3;

  result = (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/ChartOrCategoryBrickCollectionViewCell.swift", 65, 2, 126, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_10013456C();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_100133CC8();

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_badgeText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_titleText]);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_100810B40);
}

@end
