@implementation ShapeContainer

+ (Class)layerClass
{
  sub_2418A556C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ShapeContainer layoutSubviews](&v3, sel_layoutSubviews);
  sub_2418A42E8();

}

- (_TtC14MentalHealthUI14ShapeContainer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _OWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_renderer) = 0;
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_lastBounds);
  *v9 = 0u;
  v9[1] = 0u;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[ShapeContainer initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC14MentalHealthUI14ShapeContainer)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _OWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_renderer) = 0;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14MentalHealthUI14ShapeContainer_lastBounds);
  *v6 = 0u;
  v6[1] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[ShapeContainer initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
