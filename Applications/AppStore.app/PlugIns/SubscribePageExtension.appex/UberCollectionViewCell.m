@implementation UberCollectionViewCell

- (_TtC22SubscribePageExtension22UberCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  _TtC22SubscribePageExtension22UberCollectionViewCell *v11;
  double left;
  double bottom;
  double right;
  _TtC22SubscribePageExtension22UberCollectionViewCell *v15;
  id v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_uberView) = 0;
  v18.receiver = self;
  v18.super_class = ObjectType;
  v11 = -[UberCollectionViewCell initWithFrame:](&v18, "initWithFrame:", x, y, width, height);
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v15 = v11;
  -[UberCollectionViewCell setLayoutMargins:](v15, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  v16 = -[UberCollectionViewCell contentView](v15, "contentView");
  objc_msgSend(v16, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

  return v15;
}

- (_TtC22SubscribePageExtension22UberCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension22UberCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_uberView) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension22UberCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/UberCollectionViewCell.swift", 51, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC22SubscribePageExtension22UberCollectionViewCell *v3;

  v3 = self;
  sub_100231E10((uint64_t)v3, v2);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension22UberCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_100231F20((uint64_t)v4);

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension22UberCollectionViewCell_uberView));
}

@end
