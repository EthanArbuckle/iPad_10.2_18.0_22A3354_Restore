@implementation SUUIProxyScrollView

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v23;
  objc_super v24;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[SUUIProxyScrollView contentInset](self, "contentInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v24.receiver = self;
  v24.super_class = (Class)SUUIProxyScrollView;
  -[SUUIProxyScrollView setContentInset:](&v24, sel_setContentInset_, top, left, bottom, right);
  -[SUUIProxyScrollView contentInset](self, "contentInset");
  if (v19 != v11 || v16 != v9 || v18 != v15 || v17 != v13)
  {
    -[SUUIProxyScrollView delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v23, "scrollViewDidChangeContentInset:", self);

  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProxyScrollView;
  -[SUUIProxyScrollView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[SUUIProxyScrollView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "scrollViewDidMoveToWindow:", self);

}

@end
