@implementation UberCollectionViewCell

- (_TtC8AppStore22UberCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8AppStore22UberCollectionViewCell *v12;
  double left;
  double bottom;
  double right;
  _TtC8AppStore22UberCollectionViewCell *v16;
  id v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext;
  v11 = type metadata accessor for ItemLayoutContext(0, v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView) = 0;
  v19.receiver = self;
  v19.super_class = ObjectType;
  v12 = -[UberCollectionViewCell initWithFrame:](&v19, "initWithFrame:", x, y, width, height);
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v16 = v12;
  -[UberCollectionViewCell setLayoutMargins:](v16, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  v17 = -[UberCollectionViewCell contentView](v16, "contentView");
  objc_msgSend(v17, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

  return v16;
}

- (_TtC8AppStore22UberCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore22UberCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView) = 0;
  v7 = a3;

  result = (_TtC8AppStore22UberCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/UberCollectionViewCell.swift", 37, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore22UberCollectionViewCell *v3;

  v3 = self;
  sub_1004FFBBC((uint64_t)v3, v2);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC8AppStore22UberCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1004FFCCC((uint64_t)v4);

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22UberCollectionViewCell_uberView));
}

@end
