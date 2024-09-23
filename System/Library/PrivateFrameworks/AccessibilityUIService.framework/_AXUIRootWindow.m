@implementation _AXUIRootWindow

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (id)_accessibilityElementCommunityIdentifier
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[_AXUIRootWindow windowLevel](self, "windowLevel");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("AXUIServer-%f"), v3);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_AXUIRootWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") <= 1 && objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_AXUIRootWindow;
  -[_AXUIRootWindow description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AXUIRootWindow accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" AXID: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isHandlingFullScreenPresentation
{
  return self->_isHandlingFullScreenPresentation;
}

- (void)setIsHandlingFullScreenPresentation:(BOOL)a3
{
  self->_isHandlingFullScreenPresentation = a3;
}

- (BOOL)shouldRespondToDarkModeChanges
{
  return self->_shouldRespondToDarkModeChanges;
}

- (void)setShouldRespondToDarkModeChanges:(BOOL)a3
{
  self->_shouldRespondToDarkModeChanges = a3;
}

@end
