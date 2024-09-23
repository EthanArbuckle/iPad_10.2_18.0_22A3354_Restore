@implementation PreviewView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_10000D1C8(0, &qword_10002DAD8, AVCaptureVideoPreviewLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC13ClarityCamera11PreviewView)initWithFrame:(CGRect)a3
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
  return -[PreviewView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC13ClarityCamera11PreviewView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
