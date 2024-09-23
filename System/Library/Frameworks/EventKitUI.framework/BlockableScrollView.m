@implementation BlockableScrollView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BlockableScrollView frame](self, "frame");
  if (vabdd_f64(v8, width) >= 2.22044605e-16
    || (-[BlockableScrollView frame](self, "frame"), vabdd_f64(v9, height) >= 2.22044605e-16))
  {
    -[BlockableScrollView setIsResizing:](self, "setIsResizing:", 1);
    v11.receiver = self;
    v11.super_class = (Class)BlockableScrollView;
    -[BlockableScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[BlockableScrollView setIsResizing:](self, "setIsResizing:", 0);
    -[BlockableScrollView blockableDelegate](self, "blockableDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blockableScrollViewDidChangeFrameSize");

  }
  else
  {
    -[BlockableScrollView setIsResizing:](self, "setIsResizing:", 1);
    v11.receiver = self;
    v11.super_class = (Class)BlockableScrollView;
    -[BlockableScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[BlockableScrollView setIsResizing:](self, "setIsResizing:", 0);
  }
}

- (void)setIsResizing:(BOOL)a3
{
  self->_isResizing = a3;
}

- (BlockableScrollViewDelegate)blockableDelegate
{
  return (BlockableScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_blockableDelegate);
}

- (void)setBlockableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_blockableDelegate, a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BlockableScrollView;
  if (-[BlockableScrollView respondsToSelector:](&v10, sel_respondsToSelector_, sel_gestureRecognizerShouldBegin_))
  {
    v9.receiver = self;
    v9.super_class = (Class)BlockableScrollView;
    v5 = -[BlockableScrollView gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4);
  }
  else
  {
    v5 = 1;
  }
  -[BlockableScrollView blockableDelegate](self, "blockableDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BlockableScrollView blockableDelegate](self, "blockableDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 &= objc_msgSend(v7, "blockableScrollViewShouldAllowScrolling");

  }
  return v5;
}

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_blockableDelegate);
}

@end
