@implementation MUImageScrollView

- (void)_centerContentIfNecessaryAdjustingContentOffset:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  objc_super v11;

  v3 = a3;
  -[MUImageScrollView contentSize](self, "contentSize");
  v6 = v5;
  -[MUImageScrollView bounds](self, "bounds");
  v8 = v7;
  -[MUImageScrollView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "centersIgnoringContentInsets");
  v11.receiver = self;
  v11.super_class = (Class)MUImageScrollView;
  -[MUImageScrollView _centerContentIfNecessaryAdjustingContentOffset:](&v11, sel__centerContentIfNecessaryAdjustingContentOffset_, v3);
  if (v10 && v6 <= v8 && (-[MUImageScrollView isZooming](self, "isZooming") & 1) == 0)
    -[MUImageScrollView centerContentIgnoringInsets](self, "centerContentIgnoringInsets");

}

- (void)centerContentIgnoringInsets
{
  void *v3;
  id v4;

  -[MUImageScrollView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUImageScrollView bounds](self, "bounds");
  objc_msgSend(v4, "viewForZoomingInScrollView:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  UIRectCenteredYInRect();
  objc_msgSend(v3, "setFrame:");

}

@end
