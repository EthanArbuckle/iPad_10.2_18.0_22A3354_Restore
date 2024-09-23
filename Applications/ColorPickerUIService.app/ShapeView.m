@implementation ShapeView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_1000075F4(0, &qword_100066FC8, CAShapeLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC20ColorPickerUIService9ShapeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ColorPickerUIService9ShapeView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

}

@end
