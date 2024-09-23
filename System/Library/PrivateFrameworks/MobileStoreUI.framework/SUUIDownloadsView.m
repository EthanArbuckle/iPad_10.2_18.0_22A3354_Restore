@implementation SUUIDownloadsView

- (void)setContentView:(id)a3
{
  UIView *v4;
  UIView *contentView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  contentView = self->_contentView;
  self->_contentView = v4;
  v6 = v4;

  -[SUUIDownloadsView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0);
  -[SUUIDownloadsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOverlayView:(id)a3
{
  UIView *v4;
  UIView *overlayView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v6 = v4;

  -[SUUIDownloadsView addSubview:](self, "addSubview:", self->_overlayView);
  -[SUUIDownloadsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIDownloadsView;
  -[SUUIDownloadsView layoutSubviews](&v11, sel_layoutSubviews);
  -[SUUIDownloadsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
