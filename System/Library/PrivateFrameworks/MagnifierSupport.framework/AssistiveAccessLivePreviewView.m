@implementation AssistiveAccessLivePreviewView

+ (Class)layerClass
{
  sub_22730BA80(0, &qword_2558D7A00);
  return (Class)swift_getObjCClassFromMetadata();
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  void *v3;

  sub_227381830();
  if (v2)
  {
    v3 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithFrame:(CGRect)a3
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
  return -[AssistiveAccessLivePreviewView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupport30AssistiveAccessLivePreviewView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[AssistiveAccessLivePreviewView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
