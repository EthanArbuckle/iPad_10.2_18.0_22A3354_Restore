@implementation AXUIActiveWindow

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[AXUIActiveWindow rootViewController](self, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v9, "hitTest:withEvent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXUIActiveWindow;
    v11 = -[AXUIActiveWindow pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }

  return v11;
}

- (BOOL)_accessibilityWindowVisible
{
  return 1;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

@end
