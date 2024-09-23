@implementation NoDetectionLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC16MagnifierSupport16NoDetectionLabel *v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = self;
  -[NoDetectionLabel bounds](v9, sel_bounds);
  v11 = UIEdgeInsetsInsetRect(x, y, width, height, v10- *(double *)((char *)&v9->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport16NoDetectionLabel_kBottomInset), *(double *)((char *)&v9->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport16NoDetectionLabel_kSideInset));
  v12.receiver = v9;
  v12.super_class = ObjectType;
  -[NoDetectionLabel drawTextInRect:](&v12, sel_drawTextInRect_, v11);

}

- (_TtC16MagnifierSupport16NoDetectionLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport16NoDetectionLabel *)sub_22754DA94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport16NoDetectionLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport16NoDetectionLabel *)sub_22754DBC8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
