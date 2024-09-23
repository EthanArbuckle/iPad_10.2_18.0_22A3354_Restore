@implementation SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC20MediaRemoteUIService12SecureWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC20MediaRemoteUIService12SecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20MediaRemoteUIService12SecureWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC20MediaRemoteUIService12SecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
