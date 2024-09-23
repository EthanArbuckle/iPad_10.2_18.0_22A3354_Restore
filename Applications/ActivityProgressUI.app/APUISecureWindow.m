@implementation APUISecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
