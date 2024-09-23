@implementation _UIFontPickerUIServiceSceneDelegate.SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self);
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self);
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
