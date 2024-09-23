@implementation MetalView

+ (Class)layerClass
{
  unint64_t v2;

  v2 = sub_100106E54();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)layoutSubviews
{
  _TtC8SOSBuddy9MetalView *v2;

  v2 = self;
  sub_100106B14();

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC8SOSBuddy9MetalView *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = self;
  v5 = -[MetalView layer](v4, "layer");
  v6 = objc_opt_self(CAMetalLayer);
  v7 = swift_dynamicCastObjCClass(v5, v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[MetalView traitCollection](v4, "traitCollection");
    objc_msgSend(v9, "displayScale");
    v11 = v10;

    objc_msgSend(v8, "setContentsScale:", v11);
  }

}

- (_TtC8SOSBuddy9MetalView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for MetalView();
  return -[MetalView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8SOSBuddy9MetalView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MetalView();
  return -[MetalView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
