@implementation ARRenderView

+ (Class)layerClass
{
  type metadata accessor for ARReferenceObject(0, (unint64_t *)&lazy cache variable for type metadata for CAMetalLayer);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10RealityKit12ARRenderView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ARRenderView();
  return -[ARRenderView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10RealityKit12ARRenderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ARRenderView();
  return -[ARRenderView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
