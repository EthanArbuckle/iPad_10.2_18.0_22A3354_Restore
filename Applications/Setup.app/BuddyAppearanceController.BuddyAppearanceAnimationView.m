@implementation BuddyAppearanceController.BuddyAppearanceAnimationView

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BuddyAppearanceController.BuddyAppearanceAnimationView();
  v2 = v11.receiver;
  -[BuddyAppearanceController.BuddyAppearanceAnimationView layoutSubviews](&v11, "layoutSubviews");
  v3 = objc_msgSend(v2, "packageLayer", v11.receiver, v11.super_class);
  objc_msgSend(v2, "center");
  v5 = v4;
  objc_msgSend(v2, "frame");
  v7 = v5 - v6;
  objc_msgSend(v2, "center");
  v9 = v8;
  objc_msgSend(v2, "frame");
  objc_msgSend(v3, "setPosition:", v7, v9 - v10);

}

- (_TtCC5Setup25BuddyAppearanceControllerP33_6B82E87976C9B809FE5943B5C46331D528BuddyAppearanceAnimationView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for BuddyAppearanceController.BuddyAppearanceAnimationView();
  return -[BuddyAppearanceController.BuddyAppearanceAnimationView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Setup25BuddyAppearanceControllerP33_6B82E87976C9B809FE5943B5C46331D528BuddyAppearanceAnimationView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BuddyAppearanceController.BuddyAppearanceAnimationView();
  return -[BuddyAppearanceController.BuddyAppearanceAnimationView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
