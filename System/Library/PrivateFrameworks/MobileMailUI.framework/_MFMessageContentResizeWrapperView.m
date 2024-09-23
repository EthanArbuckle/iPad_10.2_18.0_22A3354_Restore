@implementation _MFMessageContentResizeWrapperView

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_snapshotView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)_MFMessageContentResizeWrapperView;
  -[_MFMessageContentResizeWrapperView dealloc](&v3, sel_dealloc);
}

- (_MFMessageContentResizeWrapperView)initWithFrame:(CGRect)a3 snapshotView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _MFMessageContentResizeWrapperView *v11;
  double v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MFMessageContentResizeWrapperView;
  v11 = -[_MFMessageContentResizeWrapperView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(v10, "frame");
    v11->_snapshotViewYOrigin = v12;
    objc_storeStrong((id *)&v11->_snapshotView, a4);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_snapshotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAutoresizingMask:](v11->_snapshotView, "setAutoresizingMask:", 0);
    -[_MFMessageContentResizeWrapperView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    -[_MFMessageContentResizeWrapperView addSubview:](v11, "addSubview:", v11->_snapshotView);
  }

  return v11;
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MFMessageContentResizeWrapperView;
  -[_MFMessageContentResizeWrapperView layoutSubviews](&v10, sel_layoutSubviews);
  -[UIView frame](self->_snapshotView, "frame");
  v4 = v3;
  v6 = v5;
  -[_MFMessageContentResizeWrapperView layoutMargins](self, "layoutMargins");
  v8 = v7;
  -[_MFMessageContentResizeWrapperView snapshotViewYOrigin](self, "snapshotViewYOrigin");
  -[UIView setFrame:](self->_snapshotView, "setFrame:", v8, v9, v4, v6);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (double)snapshotViewYOrigin
{
  return self->_snapshotViewYOrigin;
}

- (void)setSnapshotViewYOrigin:(double)a3
{
  self->_snapshotViewYOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

@end
