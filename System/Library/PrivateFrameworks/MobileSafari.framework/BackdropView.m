@implementation BackdropView

+ (Class)layerClass
{
  sub_18BA92380();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  _TtC12MobileSafari12BackdropView *v3;
  _TtC12MobileSafari12BackdropView *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v8;

  if (a3)
  {
    v3 = self;
    sub_18BAC0DFC();
    v4 = v3;
    if ((sub_18BAC0E68() & 1) != 0)
    {

      swift_bridgeObjectRelease();
      v5 = 1;
    }
    else
    {
      v6 = (void *)sub_18BAC0DCC();
      v8.receiver = v4;
      v8.super_class = (Class)type metadata accessor for BackdropView();
      v5 = -[BackdropView _shouldAnimatePropertyWithKey:](&v8, sel__shouldAnimatePropertyWithKey_, v6);

      swift_bridgeObjectRelease();
    }
    LOBYTE(self) = v5;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (_TtC12MobileSafari12BackdropView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for BackdropView();
  return -[BackdropView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12MobileSafari12BackdropView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropView();
  return -[BackdropView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
