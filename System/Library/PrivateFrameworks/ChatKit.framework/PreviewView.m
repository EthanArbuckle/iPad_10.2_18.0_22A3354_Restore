@implementation PreviewView

+ (Class)layerClass
{
  sub_18E00F31C(0, &qword_1EE10FCF0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D211PreviewView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
