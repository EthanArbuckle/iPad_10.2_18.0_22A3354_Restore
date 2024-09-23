@implementation GradientView

+ (Class)layerClass
{
  sub_18BA53DC8();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12MobileSafari12GradientView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12MobileSafari12GradientView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GradientView();
  return -[GradientView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
