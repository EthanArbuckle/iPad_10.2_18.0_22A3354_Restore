@implementation CKNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  CKNavigationBar *v6;
  CKNavigationBar *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v12.receiver = self;
  v12.super_class = (Class)CKNavigationBar;
  -[CKNavigationBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
  v7 = (CKNavigationBar *)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKNavigationBar backButtonViewAtPoint:](v6, "backButtonViewAtPoint:", x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKNavigationBar topItem](v6, "topItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_8:

        v7 = v6;
        return v7;
      }
    }
    else
    {
      -[CKNavigationBar topItem](v6, "topItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "contentScrollView");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (CKNavigationBar *)v10;
    }
    goto LABEL_8;
  }
  return v7;
}

@end
