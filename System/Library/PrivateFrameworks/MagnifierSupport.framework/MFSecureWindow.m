@implementation MFSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithWindowScene:(id)a3
{
  return (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow *)sub_22751BDB0(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MFSecureWindow, (SEL *)&selRef_initWithWindowScene_);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for MFSecureWindow();
  return -[MFSecureWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow *)sub_22751BE80(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MFSecureWindow);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for MFSecureWindow();
  return -[MFSecureWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end
