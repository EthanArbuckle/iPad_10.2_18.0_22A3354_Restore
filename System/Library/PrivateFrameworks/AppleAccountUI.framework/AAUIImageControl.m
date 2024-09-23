@implementation AAUIImageControl

- (AAUIImageControl)initWithFrame:(CGRect)a3
{
  AAUIImageControl *v3;
  AAUIImageControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIImageControl;
  v3 = -[AAUIImageControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    _AAUIImageControlInit(v3);
  return v4;
}

- (AAUIImageControl)initWithCoder:(id)a3
{
  AAUIImageControl *v3;
  AAUIImageControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIImageControl;
  v3 = -[AAUIImageControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    _AAUIImageControlInit(v3);
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIImageControl;
  -[AAUIImageControl setEnabled:](&v4, sel_setEnabled_, a3);
  -[AAUIImageControl _updateLabelVisibility](self, "_updateLabelVisibility");
}

- (void)_updateLabelVisibility
{
  -[AAUILabel setHidden:](self->_label, "setHidden:", -[AAUIImageControl isEnabled](self, "isEnabled") ^ 1);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AAUIImageControl;
  -[AAUIImageControl setHighlighted:](&v5, sel_setHighlighted_);
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:", v3);
  -[AAUILabel setHighlighted:](self->_label, "setHighlighted:", v3);
  -[AAUIImageControl _updateOverlayViewVisibility](self, "_updateOverlayViewVisibility");
}

- (void)_updateOverlayViewVisibility
{
  _BOOL8 v3;

  v3 = !-[AAUIImageControl isEnabled](self, "isEnabled")
    || (-[AAUIImageControl isHighlighted](self, "isHighlighted") & 1) == 0;
  -[UIView setHidden:](self->_overlayView, "setHidden:", v3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AAUILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
