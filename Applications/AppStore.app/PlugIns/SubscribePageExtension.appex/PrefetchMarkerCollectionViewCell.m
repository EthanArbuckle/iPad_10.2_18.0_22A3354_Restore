@implementation PrefetchMarkerCollectionViewCell

- (_TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  _TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell *v11;
  id v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v11 = -[PrefetchMarkerCollectionViewCell initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = -[PrefetchMarkerCollectionViewCell contentView](v11, "contentView");
  objc_msgSend(v12, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v11;
}

- (_TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell_itemLayoutContext;
  v6 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/PrefetchMarkerCollectionViewCell.swift", 61, 2, 32, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32PrefetchMarkerCollectionViewCell_itemLayoutContext);
}

@end
