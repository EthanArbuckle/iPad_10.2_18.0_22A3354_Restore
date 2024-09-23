@implementation GameCenterActivityFeedCollectionViewCell

- (_TtC22SubscribePageExtension40GameCenterActivityFeedCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  uint64_t v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  v10 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SwiftUIViewHostingCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtension40GameCenterActivityFeedCollectionViewCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterActivityFeedCollectionViewCell_itemLayoutContext;
  v7 = type metadata accessor for ItemLayoutContext(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[SwiftUIViewHostingCell initWithCoder:](&v9, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension40GameCenterActivityFeedCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
}

@end
