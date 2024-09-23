@implementation CCUIIconScrollView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CCUIIconScrollView frame](self, "frame");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)CCUIIconScrollView;
    -[CCUIIconScrollView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[CCUIIconScrollView hostingDelegate](self, "hostingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "scrollView:gestureRecognizerShouldBegin:", self, v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CCUIIconScrollView;
    v6 = -[CCUIIconScrollView gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4);
  }
  v7 = v6;

  return v7;
}

- (CCUIIconScrollViewHostingDelegate)hostingDelegate
{
  return (CCUIIconScrollViewHostingDelegate *)objc_loadWeakRetained((id *)&self->_hostingDelegate);
}

- (void)setHostingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingDelegate);
}

@end
