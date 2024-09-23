@implementation ActivitySecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
