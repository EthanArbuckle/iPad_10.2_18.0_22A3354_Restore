@implementation LACUINavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LACUINavigationController;
  -[LACUINavigationController _preferredContentSizeDidChangeForChildViewController:](&v5, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  if (-[LACUINavigationController shouldTrackPreferredContentSize](self, "shouldTrackPreferredContentSize"))
  {
    objc_msgSend(v4, "preferredContentSize");
    -[LACUINavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (BOOL)shouldTrackPreferredContentSize
{
  return self->_shouldTrackPreferredContentSize;
}

- (void)setShouldTrackPreferredContentSize:(BOOL)a3
{
  self->_shouldTrackPreferredContentSize = a3;
}

@end
