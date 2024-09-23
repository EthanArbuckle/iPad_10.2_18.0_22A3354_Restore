@implementation ProductRatingsCollectionViewCell

- (_TtC8AppStore32ProductRatingsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8AppStore32ProductRatingsCollectionViewCell *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_itemLayoutContext;
  v11 = type metadata accessor for ItemLayoutContext(0, v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productRatingView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productNoRatingsView) = 0;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v12 = -[ProductRatingsCollectionViewCell initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  v13 = -[ProductRatingsCollectionViewCell contentView](v12, "contentView");
  objc_msgSend(v13, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v12;
}

- (_TtC8AppStore32ProductRatingsCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore32ProductRatingsCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productRatingView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productNoRatingsView) = 0;
  v7 = a3;

  result = (_TtC8AppStore32ProductRatingsCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/ProductRatingCollectionViewCell.swift", 46, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore32ProductRatingsCollectionViewCell *v2;

  v2 = self;
  sub_100451AA0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore32ProductRatingsCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100451BB4(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ProductRatingsCollectionViewCell_productNoRatingsView));
}

@end
