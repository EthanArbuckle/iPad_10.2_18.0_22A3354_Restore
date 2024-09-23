@implementation NTKRichComplicationCircularBaseView

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

+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "keylineImageWithFilled:wide:expanded:forDevice:", a3, 0, 0, a4);
}

+ (id)keylineImageWithFilled:(BOOL)a3 wide:(BOOL)a4 expanded:(BOOL)a5 forDevice:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD aBlock[4];
  id v26;
  id v27;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v9 = a6;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_2;
  aBlock[3] = &unk_1E6BD6890;
  v27 = &__block_literal_global_121;
  v11 = v9;
  v26 = v11;
  v12 = _Block_copy(aBlock);
  os_unfair_lock_lock((os_unfair_lock_t)&keylineImageWithFilled_wide_expanded_forDevice____lock);
  WeakRetained = objc_loadWeakRetained(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v14 = WeakRetained;
  v15 = objc_loadWeakRetained(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice);
  if (v15 != v11)
  {

LABEL_5:
    v18 = objc_storeWeak(&keylineImageWithFilled_wide_expanded_forDevice____cachedDevice, v11);
    keylineImageWithFilled_wide_expanded_forDevice____previousCLKDeviceVersion = objc_msgSend(v11, "version");

    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5;
    v24[3] = &unk_1E6BD68B8;
    v24[4] = v12;
    __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5((uint64_t)v24);
    goto LABEL_6;
  }
  v16 = objc_msgSend(v11, "version");
  v17 = keylineImageWithFilled_wide_expanded_forDevice____previousCLKDeviceVersion;

  if (v16 != v17)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&keylineImageWithFilled_wide_expanded_forDevice____lock);
  v19 = (void *)keylineImageWithFilled_wide_expanded_forDevice__images;
  __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke(v20, v8, v7, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@-%@"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[6];

  v19 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = NTKWhistlerSubdialComplicationDiameter(*(_QWORD *)(a1 + 32));
  v10 = v9 * 1.4;
  if (!a2)
    v10 = v9;
  if (a3)
    v11 = v9 * 1.15;
  else
    v11 = v9;
  if (a3)
    v12 = v10 * 1.15;
  else
    v12 = v10;
  v13 = (void *)MEMORY[0x1BCCA7FA8]();
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "screenScale");
  objc_msgSend(v14, "setScale:");
  objc_msgSend(v14, "setPreferredRange:", 0);
  objc_msgSend(v14, "setOpaque:", 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v14, v12, v11);
  v16 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_3;
  v21[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v21[4] = v12;
  *(double *)&v21[5] = v11;
  objc_msgSend(v15, "imageWithActions:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v7);
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_4;
  v20[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v20[4] = v12;
  *(double *)&v20[5] = v11;
  objc_msgSend(v15, "imageWithActions:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v8);

  objc_autoreleasePoolPop(v13);
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 40) * 0.5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFill");

  objc_msgSend(v2, "fill");
}

void __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_4(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;
  CGRect v5;
  CGRect v6;

  v2 = NTKKeylineWidth();
  v5.size.width = *(CGFloat *)(a1 + 32);
  v5.size.height = *(CGFloat *)(a1 + 40);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v6 = CGRectInset(v5, v2, v2);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, *(double *)(a1 + 40) * 0.5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStroke");

  objc_msgSend(v4, "setLineWidth:", v2);
  objc_msgSend(v4, "stroke");

}

uint64_t __86__NTKRichComplicationCircularBaseView_keylineImageWithFilled_wide_expanded_forDevice___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)keylineImageWithFilled_wide_expanded_forDevice__images;
  keylineImageWithFilled_wide_expanded_forDevice__images = v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)keylineViewForDevice:(id)a3
{
  return (id)objc_msgSend(a1, "keylineViewForDevice:wide:expanded:", a3, 0, 0);
}

+ (id)keylineViewForDevice:(id)a3 wide:(BOOL)a4 expanded:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "keylineImageWithFilled:wide:expanded:forDevice:", 0, a4, a5, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    NTKKeylineViewWithImage(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 forDevice:(id)a6
{
  return (id)objc_msgSend(a1, "layoutRuleForState:viewCenterInFaceBounds:position:editingAdjustment:wide:forDevice:", a3, a5, 0, 0, a6, a4.x, a4.y);
}

+ (id)layoutRuleForState:(int64_t)a3 viewCenterInFaceBounds:(CGPoint)a4 position:(int64_t)a5 editingAdjustment:(int64_t)a6 wide:(BOOL)a7 forDevice:(id)a8
{
  _BOOL8 v8;
  double y;
  double x;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v8 = a7;
  y = a4.y;
  x = a4.x;
  v15 = a8;
  v16 = _LayoutConstants_36(v15);
  v17 = NTKWhistlerSubdialComplicationDiameter(v15);
  if (v8)
    v18 = v17 * 1.4;
  else
    v18 = v17;
  v19 = x - v18 * 0.5;
  v20 = y - v17 * 0.5;
  if (a6 == 1)
    v21 = -1.9;
  else
    v21 = 1.0;
  v22 = -1.0;
  if (a6 != 1)
    v22 = 1.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    switch(a5)
    {
      case 0:
        v19 = v19 + v22 * v16;
        break;
      case 1:
        v19 = v19 - v22 * v16;
        break;
      case 2:
        v20 = v20 - v22 * v16;
        break;
      case 3:
        v20 = v20 + v21 * v16;
        break;
      default:
        break;
    }
  }
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v34 = *MEMORY[0x1E0C9BAA8];
  v35 = v23;
  v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v25 = *MEMORY[0x1E0DC49E8];
  v24 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v27 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v26 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (a6)
  {
    if (a6 == 1)
    {
      objc_msgSend(a1, "keylineImageWithFilled:wide:expanded:forDevice:", 0, v8, 1, v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "size");
      v26 = (v29 - v18) * 0.5;
      objc_msgSend(v28, "size");
      v27 = (v30 - v17) * 0.5;

      v24 = v26;
      v25 = v27;
    }
  }
  else
  {
    objc_msgSend(a1, "transformForState:", a3);
  }
  v33[0] = v34;
  v33[1] = v35;
  v33[2] = v36;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:", v15, 3, 3, 0, v33, v19, v20, v18, v17, v25, v24, v27, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (CGAffineTransform)transformForState:(SEL)a3
{
  uint64_t v4;
  __int128 v5;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return CGAffineTransformMakeScale(retstr, 0.9, 0.9);
  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  NTKRichComplicationCircularBaseView *v3;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = -[NTKRichComplicationCircularBaseView initWithFamily:]([NTKRichComplicationCircularBaseView alloc], "initWithFamily:", 10);
    -[NTKRichComplicationCircularBaseView setHidden:](v3, "setHidden:", 1);
  }
  return v3;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (NTKRichComplicationCircularBaseView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationCircularBaseView *v3;
  void *v4;
  uint64_t v5;
  UIColor *platterColor;
  UIView *v7;
  UIView *framingView;
  UIView *v9;
  UIView *contentView;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationCircularBaseView;
  v3 = -[CDRichComplicationView initWithFamily:](&v13, sel_initWithFamily_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationCircularBaseView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = objc_claimAutoreleasedReturnValue();
    platterColor = v3->_platterColor;
    v3->_platterColor = (UIColor *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    framingView = v3->_framingView;
    v3->_framingView = v7;

    -[UIView setBackgroundColor:](v3->_framingView, "setBackgroundColor:", v3->_platterColor);
    -[NTKRichComplicationCircularBaseView addSubview:](v3, "addSubview:", v3->_framingView);
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v3->_contentView;
    v3->_contentView = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_contentView, "setBackgroundColor:", v11);

    -[UIView addSubview:](v3->_framingView, "addSubview:", v3->_contentView);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  _OWORD v30[3];
  _OWORD v31[3];
  CGAffineTransform v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)NTKRichComplicationCircularBaseView;
  -[NTKRichComplicationCircularBaseView layoutSubviews](&v33, sel_layoutSubviews);
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v32.a = *MEMORY[0x1E0C9BAA8];
  v26 = *(_OWORD *)&v32.a;
  *(_OWORD *)&v32.c = v25;
  *(_OWORD *)&v32.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v24 = *(_OWORD *)&v32.tx;
  v31[0] = *(_OWORD *)&v32.a;
  v31[1] = v25;
  v31[2] = *(_OWORD *)&v32.tx;
  -[UIView setTransform:](self->_framingView, "setTransform:", v31);
  -[NTKRichComplicationCircularBaseView bounds](self, "bounds");
  -[NTKRichComplicationCircularBaseView bounds](self, "bounds");
  -[NTKRichComplicationCircularBaseView bounds](self, "bounds");
  -[CDRichComplicationView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();
  -[UIView setFrame:](self->_framingView, "setFrame:");

  -[NTKRichComplicationCircularBaseView bounds](self, "bounds");
  v5 = v4 * 0.5;
  -[UIView layer](self->_framingView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[UIView bounds](self->_framingView, "bounds");
  -[NTKRichComplicationCircularBaseView _contentDiameter](self, "_contentDiameter");
  v8 = v7;
  -[CDRichComplicationView device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CLKSizeCenteredInRectForDevice();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CDRichComplicationView device](self, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_36(v18);
  v20 = v19;

  v30[0] = v26;
  v30[1] = v25;
  v30[2] = v24;
  -[UIView setTransform:](self->_contentView, "setTransform:", v30);
  -[UIView setFrame:](self->_contentView, "setFrame:", v11, v13, v15, v17);
  -[UIView layer](self->_contentView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setCornerRadius:", v8 * 0.5);

  switch(-[NTKRichComplicationCircularBaseView position](self, "position"))
  {
    case 0:
      v22 = v20;
      goto LABEL_5;
    case 1:
      v22 = -v20;
LABEL_5:
      v20 = 0.0;
      break;
    case 2:
      v20 = -v20;
      goto LABEL_7;
    case 3:
LABEL_7:
      v22 = 0.0;
      break;
    default:
      v22 = *MEMORY[0x1E0C9D538];
      v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  *(_OWORD *)&v29.a = v26;
  *(_OWORD *)&v29.c = v25;
  *(_OWORD *)&v29.tx = v24;
  CGAffineTransformTranslate(&v32, &v29, v22, v20);
  CLKDegreesToRadians();
  v28 = v32;
  CGAffineTransformRotate(&v29, &v28, v23);
  v32 = v29;
  v28 = v29;
  CGAffineTransformTranslate(&v29, &v28, -v22, -v20);
  v32 = v29;
  v27 = v29;
  -[UIView setTransform:](self->_framingView, "setTransform:", &v27);
}

- (void)makeBackgroundTransparent
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_framingView, "setBackgroundColor:", v3);
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

}

- (void)setPlatterColor:(id)a3
{
  UIColor **p_platterColor;
  id v6;

  p_platterColor = &self->_platterColor;
  objc_storeStrong((id *)&self->_platterColor, a3);
  v6 = a3;
  -[UIView setBackgroundColor:](self->_framingView, "setBackgroundColor:", *p_platterColor);

}

- (void)setAccentedAlternateBackground:(BOOL)a3
{
  if (self->_accentedAlternateBackground != a3)
  {
    self->_accentedAlternateBackground = a3;
    -[NTKRichComplicationCircularBaseView _updatePlatterColor](self, "_updatePlatterColor");
  }
}

- (void)_setEditingTransitionFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5 type:(int64_t)a6
{
  if (!a6)
    -[NTKRichComplicationCircularBaseView _setWhistlerAnalogEditingTransitonFraction:direction:position:](self, "_setWhistlerAnalogEditingTransitonFraction:direction:position:", a4, a5, a3);
}

- (void)_setWhistlerAnalogEditingTransitonFraction:(double)a3 direction:(int64_t)a4 position:(int64_t)a5
{
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v7 = fmin(fmax(a3 + -0.5, 0.0), 0.5) * -2.0 + 1.0;
  v8 = fmax(a3, 0.0);
  if (v8 >= 0.5)
    v9 = 1.0;
  else
    v9 = v8 + v8;
  if (a5)
    v9 = 0.0;
  -[CDRichComplicationView device](self, "device", a4, v9, 0.0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_36(v10);

  CLKInterpolateBetweenFloatsClipped();
  if (a5 == 1)
    v11 = -v11;
  self->_editingRotationInDegree = v11;
  -[NTKRichComplicationCircularBaseView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_editingDidEnd
{
  self->_editingRotationInDegree = 0.0;
}

- (id)_createAndAddColoringLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setUsesLegibility:", 0);
  objc_msgSend(v3, "setUppercase:", 1);
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v4);

  objc_msgSend(v3, "setUsesTextProviderTintColoring:", 1);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke;
  v10[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setNowProvider:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke_2;
  v8[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setNeedsResizeHandler:", v8);
  objc_msgSend(v3, "setFilterProvider:", self);
  -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v3;
}

id __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke(uint64_t a1)
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

void __65__NTKRichComplicationCircularBaseView__createAndAddColoringLabel__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");
  objc_msgSend(WeakRetained, "displayObserver");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "complicationDisplayNeedsResize:", WeakRetained);

}

- (unint64_t)_adjustFontSizeForLabel:(id)a3 fontWeight:(double)a4 possibleMaxWidths:(id)a5 possibleFontSizes:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v11, "count");
  if (v13 != objc_msgSend(v12, "count"))
    -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:].cold.2();
  if (!objc_msgSend(v12, "count"))
    -[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:].cold.1();
  if (objc_msgSend(v11, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      -[CDRichComplicationView fontDescriptor](self, "fontDescriptor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0C944D0];
      if (v22)
      {
        -[CDRichComplicationView fontSizeFactor](self, "fontSizeFactor");
        objc_msgSend(v23, "fontWithDescriptor:size:", v22, v24 * v21);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v21, a4);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v18;
      objc_msgSend(v25, "CLKFontWithAlternativePunctuation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "widthForMaxWidth:withFont:", v27, v26);
      v29 = v28;

      if (v29 <= v26)
        break;
      ++v15;
      v14 = v27;
    }
    while (v15 < objc_msgSend(v11, "count"));
  }
  else
  {
    v15 = 0;
    v27 = 0;
    v26 = 0.0;
  }
  objc_msgSend(v10, "setMaxWidth:", v26);
  objc_msgSend(v10, "setFont:", v27);
  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(v10, "frame");
  if (v30 > v26)
    objc_msgSend(v10, "setFrame:");

  return v15;
}

- (double)_contentDiameter
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[CDRichComplicationView family](self, "family");
  -[CDRichComplicationView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 12)
    NTKGraphicExtraLargeComplicationContentDiameter();
  else
    v5 = NTKWhistlerSubdialComplicationContentDiameter();
  v6 = v5;

  return v6;
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CGFloat v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  v6 = v7;
  -[NTKRichComplicationCircularBaseView setTransform:](self, "setTransform:", &v6);
}

- (void)_updatePlatterColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CDRichComplicationTemplateView templateWantsPlatter](self, "templateWantsPlatter"))
  {
    -[CDRichComplicationView filterProvider](self, "filterProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorForView:accented:", self, self->_accentedAlternateBackground);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
      CLKUIDefaultComplicationBackgroundColorWithNonAccentColor();
    else
      CLKUIDefaultComplicationBackgroundColor();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
  else
  {
    -[NTKRichComplicationCircularBaseView contentView](self, "contentView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v4);
  }

}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (BOOL)accentedAlternateBackground
{
  return self->_accentedAlternateBackground;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)framingView
{
  return self->_framingView;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return 0;
}

- (NTKRichComplicationCircularBaseView)init
{
  void *v2;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2();
  return (NTKRichComplicationCircularBaseView *)objc_msgSend(v2, "initWithFamily:", 10);
}

- (void)_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:.cold.1()
{
  __assert_rtn("-[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:]", "NTKRichComplicationCircularBaseView.m", 496, "possibleFontSizes.count > 0");
}

- (void)_adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:.cold.2()
{
  __assert_rtn("-[NTKRichComplicationCircularBaseView _adjustFontSizeForLabel:fontWeight:possibleMaxWidths:possibleFontSizes:]", "NTKRichComplicationCircularBaseView.m", 495, "possibleMaxWidths.count == possibleFontSizes.count");
}

@end
