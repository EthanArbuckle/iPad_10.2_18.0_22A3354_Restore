@implementation PKSqueezePaletteClipIndicatorView

- (PKSqueezePaletteClipIndicatorView)initWithFrame:(CGRect)a3
{
  PKSqueezePaletteClipIndicatorView *v3;
  PKSqueezePaletteClipIndicatorView *v4;
  uint64_t v5;
  CALayer *indicator;
  void *v7;
  uint64_t v8;
  CALayer *topMask;
  id v10;
  CALayer *v11;
  void *v12;
  void *v13;
  void *v14;
  PKSqueezePaletteClipIndicatorView *v15;
  id v16;
  _QWORD v18[4];
  PKSqueezePaletteClipIndicatorView *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKSqueezePaletteClipIndicatorView;
  v3 = -[PKSqueezePaletteClipIndicatorView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKSqueezePaletteClipIndicatorView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = objc_claimAutoreleasedReturnValue();
    indicator = v4->_indicator;
    v4->_indicator = (CALayer *)v5;

    -[PKSqueezePaletteClipIndicatorView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4->_indicator);

    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    topMask = v4->_topMask;
    v4->_topMask = (CALayer *)v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v4->_topMask, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

    v11 = v4->_topMask;
    -[PKSqueezePaletteClipIndicatorView layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMask:", v11);

    -[PKSqueezePaletteClipIndicatorView layer](v4, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGeometryFlipped:", 1);

    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__PKSqueezePaletteClipIndicatorView_initWithFrame___block_invoke;
    v18[3] = &unk_1E777A858;
    v15 = v4;
    v19 = v15;
    v16 = (id)-[PKSqueezePaletteClipIndicatorView registerForTraitChanges:withHandler:](v15, "registerForTraitChanges:withHandler:", v14, v18);

    -[PKSqueezePaletteClipIndicatorView _updateUI]((uint64_t)v15);
  }
  return v4;
}

void __51__PKSqueezePaletteClipIndicatorView_initWithFrame___block_invoke(uint64_t a1)
{
  -[PKSqueezePaletteClipIndicatorView _updateUI](*(_QWORD *)(a1 + 32));
}

- (void)_updateUI
{
  id v2;

  if (a1)
  {
    PKSqueezePaletteToolClipIndicatorColor();
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*(id *)(a1 + 416), "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKSqueezePaletteClipIndicatorView;
  -[PKSqueezePaletteClipIndicatorView layoutSubviews](&v24, sel_layoutSubviews);
  -[PKSqueezePaletteClipIndicatorView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsEdgeAntialiasing:", 1);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKSqueezePaletteClipIndicatorView layer](self, "layer", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9++), "setAllowsEdgeAntialiasing:", 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  -[PKSqueezePaletteClipIndicatorView bounds](self, "bounds");
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;
  v14 = *(double *)&PKSqueezePaletteToolClipIndicatorWidth;
  -[PKSqueezePaletteClipIndicatorView bounds](self, "bounds");
  -[CALayer setFrame:](self->_indicator, "setFrame:", v11 - v14 * 0.5, v13 - v15 * 0.5, v14);
  v16 = *(double *)&PKSqueezePaletteToolClipIndicatorTopMaskHeight;
  -[PKSqueezePaletteClipIndicatorView bounds](self, "bounds");
  v18 = v17;
  -[PKSqueezePaletteClipIndicatorView bounds](self, "bounds");
  -[CALayer setFrame:](self->_topMask, "setFrame:", 0.0, v16, v18, v19 - *(double *)&PKSqueezePaletteToolClipIndicatorTopMaskHeight);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topMask, 0);
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
