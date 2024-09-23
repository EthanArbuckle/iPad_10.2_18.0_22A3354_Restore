@implementation PrefetchMarkerCollectionViewCell

- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC8AppStore32PrefetchMarkerCollectionViewCell *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  v11 = type metadata accessor for ItemLayoutContext(0, v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v12 = -[PrefetchMarkerCollectionViewCell initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  v13 = -[PrefetchMarkerCollectionViewCell contentView](v12, "contentView");
  objc_msgSend(v13, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v12;
}

- (_TtC8AppStore32PrefetchMarkerCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore32PrefetchMarkerCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC8AppStore32PrefetchMarkerCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/PrefetchMarkerCollectionViewCell.swift", 47, 2, 32, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore32PrefetchMarkerCollectionViewCell_itemLayoutContext);
}

@end
