@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *)sub_100094E68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_badgeText);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_titleText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext;
  v10 = type metadata accessor for ChartOrCategoryBrickContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a3;

  result = (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ChartOrCategoryBrickCollectionViewCell.swift", 67, 2, 126, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_100095434();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_10009669C();

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_badgeText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_titleText]);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_1007F7CE8);
}

@end
