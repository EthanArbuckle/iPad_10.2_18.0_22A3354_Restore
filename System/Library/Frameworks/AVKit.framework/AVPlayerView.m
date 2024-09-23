@implementation AVPlayerView

- (AVPlayerView)initWithFrame:(CGRect)a3 contentView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  AVPlayerView *v11;
  AVPlayerView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerView;
  v11 = -[AVPlayerView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentView, a4);
    -[AVPresentationContainerView setPresentationContainerContentView:](v12, "setPresentationContainerContentView:", v10);
    v12->_needsInitialLayout = 1;
  }

  return v12;
}

- (void)_beginManagingContentViewIfNeeded
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AVPlayerView contentView](self, "contentView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = (id)v3;
    -[AVPlayerView contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isDescendantOfView:", self))
    {

LABEL_9:
      return;
    }
    v5 = -[AVPlayerView needsInitialLayout](self, "needsInitialLayout");

    if (!v5)
    {
      -[AVPlayerView contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[AVPlayerView contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

      }
      -[AVPlayerView contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

      -[AVPlayerView contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAutoresizingMask:", 18);

      -[AVPlayerView contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPlayerView bounds](self, "bounds");
      objc_msgSend(v11, "setFrame:");

      -[AVPlayerView contentView](self, "contentView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[AVPlayerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v12, 0);
      goto LABEL_9;
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)layoutSubviews
{
  objc_super v3;

  kdebug_trace();
  if (-[AVPlayerView needsInitialLayout](self, "needsInitialLayout"))
  {
    -[AVPlayerView setNeedsInitialLayout:](self, "setNeedsInitialLayout:", 0);
    -[AVPlayerView _beginManagingContentViewIfNeeded](self, "_beginManagingContentViewIfNeeded");
  }
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerView;
  -[AVPresentationContainerView layoutSubviews](&v3, sel_layoutSubviews);
  kdebug_trace();
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (void)setNeedsInitialLayout:(BOOL)a3
{
  self->_needsInitialLayout = a3;
}

- (void)setContentView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  if (self->_contentView != v5)
  {
    -[AVPlayerView _stopManagingContentView](self, "_stopManagingContentView");
    objc_storeStrong((id *)&self->_contentView, a3);
  }
  -[AVPlayerView _beginManagingContentViewIfNeeded](self, "_beginManagingContentViewIfNeeded");

}

- (void)_stopManagingContentView
{
  UIView *contentView;

  contentView = self->_contentView;
  if (contentView)
  {
    if (-[UIView isDescendantOfView:](contentView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
