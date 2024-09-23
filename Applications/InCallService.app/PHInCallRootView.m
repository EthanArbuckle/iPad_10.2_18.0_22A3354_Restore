@implementation PHInCallRootView

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHInCallRootView;
  -[PHInCallRootView safeAreaInsetsDidChange](&v3, "safeAreaInsetsDidChange");
  -[PHInCallRootView setNeedsLayout](self, "setNeedsLayout");
  -[PHInCallRootView layoutIfNeeded](self, "layoutIfNeeded");
}

@end
