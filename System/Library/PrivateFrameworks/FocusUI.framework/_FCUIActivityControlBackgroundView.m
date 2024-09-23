@implementation _FCUIActivityControlBackgroundView

- (_FCUIActivityControlBackgroundView)initWithControlStyle:(int64_t)a3
{
  _FCUIActivityControlBackgroundView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  result = -[_FCUIActivityControlBackgroundView init](&v5, sel_init);
  if (result)
    result->_controlStyle = a3;
  return result;
}

- (_FCUIActivityControlBackgroundView)initWithFrame:(CGRect)a3
{
  _FCUIActivityControlBackgroundView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FCUIActivityControlBackgroundView;
  v3 = -[_FCUIActivityControlBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FCUIActivityControlBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[_FCUIActivityControlBackgroundView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1);
    -[_FCUIActivityControlBackgroundView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  -[_FCUIActivityControlBackgroundView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", a3);
}

- (void)_setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_FCUIActivityControlBackgroundView;
  -[_FCUIActivityControlBackgroundView _setCornerRadius:](&v5, sel__setCornerRadius_);
  -[UIView _setCornerRadius:](self->_highlightView, "_setCornerRadius:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  UIView *highlightView;
  double v5;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if (a3)
    {
      -[_FCUIActivityControlBackgroundView _configureHighlightViewIfNecessary](self, "_configureHighlightViewIfNecessary");
      highlightView = self->_highlightView;
      v5 = 0.1;
      if (self->_controlStyle)
        v5 = 1.0;
    }
    else
    {
      highlightView = self->_highlightView;
      v5 = 0.0;
    }
    -[UIView setAlpha:](highlightView, "setAlpha:", v5);
  }
}

- (void)_configureHighlightViewIfNecessary
{
  _QWORD v2[5];

  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __72___FCUIActivityControlBackgroundView__configureHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_24D20A9C0;
    v2[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v2);
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
