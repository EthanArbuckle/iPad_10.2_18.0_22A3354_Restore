@implementation AVTShadowView

+ (double)defaultHeightForSuperview:(id)a3
{
  return AVTRoundToViewScale(a3, 1.0);
}

- (AVTShadowView)initWithFrame:(CGRect)a3
{
  AVTShadowView *v3;
  void *v4;
  uint64_t v5;
  CALayer *separator;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTShadowView;
  v3 = -[AVTShadowView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTShadowView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = objc_claimAutoreleasedReturnValue();
    separator = v3->_separator;
    v3->_separator = (CALayer *)v5;

    +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v3->_separator, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    -[AVTShadowView bounds](v3, "bounds");
    -[CALayer setFrame:](v3->_separator, "setFrame:");
    -[AVTShadowView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSublayer:", v3->_separator);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVTShadowView;
  v4 = a3;
  -[AVTShadowView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  -[AVTShadowView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7)
  {
    +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_separator, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTShadowView;
  -[AVTShadowView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTShadowView bounds](self, "bounds");
  -[CALayer setFrame:](self->_separator, "setFrame:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CALayer)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
}

@end
