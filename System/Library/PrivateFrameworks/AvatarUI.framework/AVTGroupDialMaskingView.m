@implementation AVTGroupDialMaskingView

- (AVTGroupDialMaskingView)initWithFrame:(CGRect)a3
{
  AVTGroupDialMaskingView *v3;
  uint64_t v4;
  CAGradientLayer *maskLayer;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  CGRect v15;
  CGRect v16;

  v14[4] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)AVTGroupDialMaskingView;
  v3 = -[AVTGroupDialMaskingView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = (CAGradientLayer *)v4;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[0] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[1] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[2] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[3] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v3->_maskLayer, "setColors:", v10);

    -[CAGradientLayer setStartPoint:](v3->_maskLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_maskLayer, "setEndPoint:", 1.0, 0.5);
    -[CAGradientLayer setLocations:](v3->_maskLayer, "setLocations:", &unk_1EA571B68);
    -[AVTGroupDialMaskingView bounds](v3, "bounds");
    v16 = CGRectInset(v15, 15.0, 0.0);
    -[CAGradientLayer setFrame:](v3->_maskLayer, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    -[AVTGroupDialMaskingView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v3->_maskLayer);

    -[AVTGroupDialMaskingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)AVTGroupDialMaskingView;
  -[AVTGroupDialMaskingView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVTGroupDialMaskingView bounds](self, "bounds");
  v5 = CGRectInset(v4, 15.0, 0.0);
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (CAGradientLayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end
