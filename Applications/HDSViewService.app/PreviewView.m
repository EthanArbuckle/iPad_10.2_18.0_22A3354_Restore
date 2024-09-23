@implementation PreviewView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100035CA4(0, (unint64_t *)&unk_1000D7E60, AVCaptureVideoPreviewLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithFrame:(CGRect)a3
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

- (_TtC14HDSViewServiceP33_F66C8FD91EA205C147B349AE8926BCFD11PreviewView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewView();
  return -[PreviewView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
