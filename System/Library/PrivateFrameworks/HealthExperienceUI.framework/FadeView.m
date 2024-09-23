@implementation FadeView

+ (Class)layerClass
{
  sub_1A9627620(0, &qword_1ED279750);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for FadeView();
  return -[FadeView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUIP33_6AFCBB489F4B745EBBFAE39AEAF00FBF8FadeView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FadeView();
  return -[FadeView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
