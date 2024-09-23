@implementation SSSScrollView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[SSSScrollView frame](self, "frame");
  if ((SSRectEqualToRect(v8, v9, v10, v11, v12, x, y, width, height) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SSSScrollView;
    -[SSSScrollView setFrame:](&v13, "setFrame:", x, y, width, height);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = -[SSSScrollView contentInset](self, "contentInset");
  if ((SSEdgeInsetsEqualToEdgeInsets(v8, top, left, bottom, right, v9, v10, v11, v12) & 1) == 0)
  {
    self->_isInProgrammaticCall = 1;
    v13.receiver = self;
    v13.super_class = (Class)SSSScrollView;
    -[SSSScrollView setContentInset:](&v13, "setContentInset:", top, left, bottom, right);
    self->_isInProgrammaticCall = 0;
  }
}

- (void)setZoomScale:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  objc_super v8;

  v4 = a4;
  -[SSSScrollView zoomScale](self, "zoomScale");
  if (v7 != a3)
  {
    self->_isInProgrammaticCall = 1;
    v8.receiver = self;
    v8.super_class = (Class)SSSScrollView;
    -[SSSScrollView setZoomScale:animated:](&v8, "setZoomScale:animated:", v4, a3);
    self->_isInProgrammaticCall = 0;
  }
}

- (void)zoomToRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  objc_super v10;
  CGRect v11;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (SSRectIsValid(self, a2))
  {
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (!CGRectIsEmpty(v11))
    {
      self->_inSuperZoomToRect = 1;
      self->_animateSuperZoomToRect = v4;
      v10.receiver = self;
      v10.super_class = (Class)SSSScrollView;
      -[SSSScrollView zoomToRect:animated:](&v10, "zoomToRect:animated:", v4, x, y, width, height);
      self->_inSuperZoomToRect = 0;
    }
  }
}

- (BOOL)isInProgrammaticCall
{
  return self->_isInProgrammaticCall;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  objc_super v4;

  if (self->_inSuperZoomToRect)
    *(_QWORD *)&a4 = self->_animateSuperZoomToRect;
  v4.receiver = self;
  v4.super_class = (Class)SSSScrollView;
  -[SSSScrollView setContentOffset:animated:](&v4, "setContentOffset:animated:", a4, a3.x, a3.y);
}

- (CGSize)_unscaledContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SSSScrollView contentSize](self, "contentSize");
  v4 = v3;
  v6 = v5;
  -[SSSScrollView zoomScale](self, "zoomScale");
  v8 = v4 / v7;
  -[SSSScrollView zoomScale](self, "zoomScale");
  v10 = v6 / v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGRect)visibleRect
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForZoomingInScrollView:", self));

  -[SSSScrollView bounds](self, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)isMoving
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v3 = -[SSSScrollView isDragging](self, "isDragging");
  v4 = -[SSSScrollView isDecelerating](self, "isDecelerating");
  v5 = -[SSSScrollView isZooming](self, "isZooming");
  return v3 | v4 | v5 | -[SSSScrollView isZoomBouncing](self, "isZoomBouncing");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  objc_super v25;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SSSScrollView;
  v8 = -[SSSScrollView hitTest:withEvent:](&v25, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_100028984;
  v23 = sub_100028994;
  v24 = 0;
  if (-[SSSScrollView hitTestsUsingSubviews](self, "hitTestsUsingSubviews"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SSSScrollView subviews](self, "subviews"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002899C;
    v14[3] = &unk_100092308;
    v17 = x;
    v18 = y;
    v14[4] = self;
    v15 = v7;
    v16 = &v19;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  }
  v11 = (void *)v20[5];
  if (!v11)
    v11 = v9;
  v12 = v11;
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (BOOL)hitTestsUsingSubviews
{
  return self->_hitTestsUsingSubviews;
}

- (void)setHitTestsUsingSubviews:(BOOL)a3
{
  self->_hitTestsUsingSubviews = a3;
}

@end
