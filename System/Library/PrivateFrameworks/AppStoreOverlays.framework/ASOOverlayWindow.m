@implementation ASOOverlayWindow

- (ASOOverlayWindow)initWithWindowScene:(id)a3
{
  ASOOverlayWindow *v3;
  ASOOverlayWindow *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASOOverlayWindow;
  v3 = -[UIApplicationRotationFollowingWindow initWithWindowScene:](&v6, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
    -[ASOOverlayWindow setLevel:](v3, "setLevel:", *MEMORY[0x24BDF7F48]);
  return v4;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end
