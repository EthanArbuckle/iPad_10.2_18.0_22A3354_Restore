@implementation GameOverlayWindow

- (unint64_t)_supportedInterfaceOrientationsForRootViewController
{
  return 30;
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithWindowScene:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[GameOverlayWindow initWithWindowScene:](&v5, "initWithWindowScene:", a3);
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[GameOverlayWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[GameOverlayWindow initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithContentRect:(CGRect)a3
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
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[GameOverlayWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end
