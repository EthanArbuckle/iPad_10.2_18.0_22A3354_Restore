@implementation NTKRichComplicationHandView

- (NTKRichComplicationHandView)initWithDotSize:(double)a3 handWidth:(double)a4 beginAngle:(double)a5 endAngle:(double)a6
{
  NTKRichComplicationHandView *v10;
  NTKRichComplicationHandView *v11;
  void *v12;
  uint64_t v13;
  CALayer *dotLayer;
  uint64_t v15;
  CALayer *handLayer;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKRichComplicationHandView;
  v10 = -[NTKRichComplicationHandView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    -[NTKRichComplicationHandView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_new();
    dotLayer = v11->_dotLayer;
    v11->_dotLayer = (CALayer *)v13;

    -[CALayer setBounds:](v11->_dotLayer, "setBounds:", 0.0, 0.0, a3, a3);
    -[CALayer setCornerRadius:](v11->_dotLayer, "setCornerRadius:", a3 * 0.5);
    objc_msgSend(v12, "addSublayer:", v11->_dotLayer);
    v15 = objc_opt_new();
    handLayer = v11->_handLayer;
    v11->_handLayer = (CALayer *)v15;

    -[CALayer setAnchorPoint:](v11->_handLayer, "setAnchorPoint:", 0.5, 1.0);
    objc_msgSend(v12, "addSublayer:", v11->_handLayer);
    v11->_beginAngle = a5;
    v11->_endAngle = a6;
    v11->_handWidth = a4;

  }
  return v11;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CALayer *handLayer;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[8];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationHandView;
  -[NTKRichComplicationHandView layoutSubviews](&v14, sel_layoutSubviews);
  -[NTKRichComplicationHandView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6 * 0.5;
  -[CALayer setPosition:](self->_dotLayer, "setPosition:", v4 * 0.5, v6 * 0.5);
  handLayer = self->_handLayer;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v13[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v13[5] = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v13[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v13[7] = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v13[0] = *MEMORY[0x1E0CD2610];
  v13[1] = v11;
  v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v13[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v13[3] = v12;
  -[CALayer setTransform:](handLayer, "setTransform:", v13);
  -[CALayer setFrame:](self->_handLayer, "setFrame:", (v5 - self->_handWidth) * 0.5, 0.0, self->_handWidth, v7);
  -[NTKRichComplicationHandView _updateHandTransform](self, "_updateHandTransform");

}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (a3 < 0.0)
    a3 = 0.0;
  self->_value = fminf(a3, 1.0);
  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__NTKRichComplicationHandView_setValue_animated___block_invoke;
    v4[3] = &unk_1E6BCD5F0;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 65540, v4, 0, 0.2, 0.0, 0.75, 0.0);
  }
  else
  {
    -[NTKRichComplicationHandView _updateHandTransform](self, "_updateHandTransform");
  }
}

uint64_t __49__NTKRichComplicationHandView_setValue_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHandTransform");
}

- (void)_updateHandTransform
{
  float v2;
  CALayer *handLayer;
  CATransform3D v4;

  v2 = self->_beginAngle + self->_value * (self->_endAngle - self->_beginAngle);
  handLayer = self->_handLayer;
  CATransform3DMakeRotation(&v4, v2, 0.0, 0.0, 1.0);
  -[CALayer setTransform:](handLayer, "setTransform:", &v4);
}

- (CALayer)dotLayer
{
  return self->_dotLayer;
}

- (CALayer)handLayer
{
  return self->_handLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handLayer, 0);
  objc_storeStrong((id *)&self->_dotLayer, 0);
}

@end
