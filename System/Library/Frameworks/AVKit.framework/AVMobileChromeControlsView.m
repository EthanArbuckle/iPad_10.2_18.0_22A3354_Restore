@implementation AVMobileChromeControlsView

- (void)setFrame:(CGRect)a3
{
  UIView *activePlaybackControlsView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromeControlsView;
  -[AVMobileChromeControlsView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self)
  {
    activePlaybackControlsView = self->_activePlaybackControlsView;
    -[AVMobileChromeControlsView bounds](self, "bounds");
    -[UIView setFrame:](activePlaybackControlsView, "setFrame:");
  }
}

- (void)setActivePlaybackControlsView:(id)a3
{
  UIView *v5;
  UIView *activePlaybackControlsView;
  UIView *v7;

  v5 = (UIView *)a3;
  activePlaybackControlsView = self->_activePlaybackControlsView;
  v7 = v5;
  if (activePlaybackControlsView != v5)
  {
    if (activePlaybackControlsView)
      -[UIView removeFromSuperview](activePlaybackControlsView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_activePlaybackControlsView, a3);
    if (self->_activePlaybackControlsView)
      -[AVMobileChromeControlsView addSubview:](self, "addSubview:");
  }

}

- (void)layoutSubviews
{
  UIView *activePlaybackControlsView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromeControlsView;
  -[AVMobileChromeControlsView layoutSubviews](&v4, sel_layoutSubviews);
  if (self)
  {
    activePlaybackControlsView = self->_activePlaybackControlsView;
    -[AVMobileChromeControlsView bounds](self, "bounds");
    -[UIView setFrame:](activePlaybackControlsView, "setFrame:");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AVMobileChromeControlsView *v5;
  AVMobileChromeControlsView *v6;
  AVMobileChromeControlsView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromeControlsView;
  -[AVMobileChromeControlsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVMobileChromeControlsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (UIView)activePlaybackControlsView
{
  return self->_activePlaybackControlsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePlaybackControlsView, 0);
}

@end
