@implementation GameCenterActivityFeedCollectionViewCell

- (_TtC8AppStore40GameCenterActivityFeedCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  v11 = type metadata accessor for ItemLayoutContext(0, v10);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[SwiftUIViewHostingCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore40GameCenterActivityFeedCollectionViewCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  v8 = type metadata accessor for ItemLayoutContext(0, v7);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[SwiftUIViewHostingCell initWithCoder:](&v10, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore40GameCenterActivityFeedCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
}

@end
