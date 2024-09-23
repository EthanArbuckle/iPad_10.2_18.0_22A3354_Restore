@implementation OverlayWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for OverlayWindow();
  return -[OverlayWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
