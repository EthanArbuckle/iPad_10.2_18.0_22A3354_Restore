@implementation NTKRichComplicationRectangularBaseView

- (NTKRichComplicationRectangularBaseView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularBaseView;
  return -[CDRichComplicationView initWithFamily:](&v3, sel_initWithFamily_, 11);
}

- (NTKRichComplicationRectangularBaseView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationRectangularBaseView *v3;

  if (a3 == 11)
  {
    self = -[NTKRichComplicationRectangularBaseView init](self, "init");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  NTKRichComplicationRectangularBaseView *v3;

  if (a3)
    v3 = 0;
  else
    v3 = objc_alloc_init(NTKRichComplicationRectangularBaseView);
  return v3;
}

- (double)contentMargin
{
  void *v2;
  double v3;
  double v4;

  -[CDRichComplicationView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CDGraphicLargeRectangularComplicationInset();
  v4 = v3;

  return v4;
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  CGAffineTransform *v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _OWORD v20[6];
  _OWORD v21[3];
  CGAffineTransform v22;
  CGAffineTransform v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v9 = a5;
  v11 = a3;
  v12 = a4;
  memset(&v31, 0, sizeof(v31));
  if (a6 == 1)
  {
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    if (v9)
    {
LABEL_5:
      v13 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
      v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v30.c = v14;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v29 = v31;
      v28 = v31;
      v15 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a6)
      CGAffineTransformMakeScale(&v31, 0.9, 0.9);
    if (v9)
      goto LABEL_5;
  }
  v30 = v31;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v29.c = v17;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v28.a = *(_OWORD *)&v29.a;
  *(_OWORD *)&v28.c = v17;
  *(_OWORD *)&v28.tx = *(_OWORD *)&v29.tx;
  v13 = &v31;
  v15 = v11;
LABEL_8:
  v18 = *(_OWORD *)&v13->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&v13->a;
  *(_OWORD *)&v27.c = v18;
  *(_OWORD *)&v27.tx = *(_OWORD *)&v13->tx;
  v19 = v15;
  if (a6 == 1)
    CDTemplicateComplicationShouldPerformFullFade();
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");
  v23 = v30;
  v22 = v28;
  CLKInterpolateBetweenTransform();
  v21[0] = v24;
  v21[1] = v25;
  v21[2] = v26;
  objc_msgSend(v11, "setTransform:", v21);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
  v23 = v29;
  v22 = v27;
  CLKInterpolateBetweenTransform();
  v20[0] = v20[3];
  v20[1] = v20[4];
  v20[2] = v20[5];
  objc_msgSend(v12, "setTransform:", v20);

}

- (id)_createAndAddColoringLabelWithFontSize:(double)a3 weight:(double)a4 usesTextProviderTintColoring:(BOOL)a5
{
  _BOOL8 v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setUsesLegibility:", 0);
  objc_msgSend(v9, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v10);

  objc_msgSend(v9, "setUsesTextProviderTintColoring:", v5);
  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "CLKFontWithAlternativePunctuation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setFont:", v12);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke;
  v17[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v9, "setNowProvider:", v17);
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke_2;
  v15[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "setNeedsResizeHandler:", v15);
  objc_msgSend(v9, "setFilterProvider:", self);
  -[NTKRichComplicationRectangularBaseView addSubview:](self, "addSubview:", v9);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v9;
}

id __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = (id)MEMORY[0x1E0C944A0];
  objc_msgSend(WeakRetained, "complicationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  v6 = v7;
  -[NTKRichComplicationRectangularBaseView setTransform:](self, "setTransform:", &v6);
}

- (NTKRichComplicationRectangularBaseViewDelegate)delegate
{
  return (NTKRichComplicationRectangularBaseViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
