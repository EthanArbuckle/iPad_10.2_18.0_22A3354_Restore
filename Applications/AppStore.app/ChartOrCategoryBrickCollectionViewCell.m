@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *)sub_1002107C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_badgeText);
  *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_titleText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_brickContext;
  v10 = type metadata accessor for ChartOrCategoryBrickContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a3;

  result = (_TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ChartOrCategoryBrickCollectionViewCell.swift", 53, 2, 126, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_100210D90();

}

- (void)prepareForReuse
{
  _TtC8AppStore38ChartOrCategoryBrickCollectionViewCell *v2;

  v2 = self;
  sub_1002104EC();

}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_badgeText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->artworkView[OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_titleText]);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_100834E70);
}

@end
