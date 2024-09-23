@implementation BackdropLayerHostView

- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[BackdropLayerHostView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

+ (Class)layerClass
{
  sub_2412C9900();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[BackdropLayerHostView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
