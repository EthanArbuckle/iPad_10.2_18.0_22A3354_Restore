@implementation UISecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC7SwiftUI14UISecureWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithWindowScene:](&v5, sel_initWithWindowScene_, a3);
}

- (_TtC7SwiftUI14UISecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI14UISecureWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (_TtC7SwiftUI14UISecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end
