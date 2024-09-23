@implementation NTKRichComplicationBezelView

+ (id)keylineImageWithFilled:(BOOL)a3 forDevice:(id)a4
{
  _BOOL8 v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  v4 = a3;
  v5 = a4;
  v6 = ((double (*)(void))NTKWhistlerSubdialComplicationDistanceFromCenter)();
  v7 = NTKWhistlerSubdialComplicationEditingInset(v5);
  v8 = NTKWhistlerSubdialComplicationDistanceFromCenter(v5);
  +[NTKAnalogUtilities largeDialDiameterForDevice:](NTKAnalogUtilities, "largeDialDiameterForDevice:", v5);
  v10 = v9;
  v11 = NTKKeylineWidth();
  v12 = NTKWhistlerSubdialComplicationDiameter(v5);
  v13 = v5;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_4);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
  if (!WeakRetained)
    goto LABEL_5;
  v15 = WeakRetained;
  v16 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_4);
  if (v16 != v13)
  {

LABEL_5:
    v19 = objc_storeWeak(&_LayoutConstants___cachedDevice_4, v13);
    _LayoutConstants___previousCLKDeviceVersion_4 = objc_msgSend(v13, "version");

    ___LayoutConstants_block_invoke_4(v20, (uint64_t)v13);
    goto LABEL_6;
  }
  v17 = objc_msgSend(v13, "version");
  v18 = _LayoutConstants___previousCLKDeviceVersion_4;

  if (v17 != v18)
    goto LABEL_5;
LABEL_6:
  v21 = v6 - v7;
  v22 = v10 * 0.5 - v11;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_4);
  v23 = *(double *)&_LayoutConstants___constants_0_0;

  objc_msgSend(off_1E6BCA180, "heartKeylineWithDevice:outerRadius:innerRadius:sideComplicationDistance:topComplicationDistance:strokeWidth:filled:", v13, v4, v22, v21 + v12 * 0.5 + v23, v21, v8 * 0.95, NTKKeylineWidth());
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)keylineViewForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "keylineImageWithFilled:forDevice:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    NTKKeylineViewWithImage(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__NTKRichComplicationBezelView_keylineViewForDevice___block_invoke;
    v10[3] = &unk_1E6BCED70;
    v11 = v4;
    +[NTKKeylineTouchable touchableWithHandler:](NTKKeylineTouchable, "touchableWithHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTouchable:", v8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __53__NTKRichComplicationBezelView_keylineViewForDevice___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7;
  double v8;
  double v9;
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
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  uint64_t v29;
  CGPoint v31;
  CGRect v32;

  v7 = a2;
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "bounds");
  +[NTKRichComplicationBezelUtilities hitTestPathWithViewBounds:shape:shapeFrame:forDevice:](NTKRichComplicationBezelUtilities, "hitTestPathWithViewBounds:shape:shapeFrame:forDevice:", 3, *(_QWORD *)(a1 + 32), v9, v11, v13, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v32.origin.x = v22;
  v32.origin.y = v24;
  v32.size.width = v26;
  v32.size.height = v28;
  v31.x = a3;
  v31.y = a4;
  if (CGRectContainsPoint(v32, v31))
    v29 = objc_msgSend(v20, "containsPoint:", a3, a4);
  else
    v29 = 0;

  return v29;
}

+ (id)layoutRuleForState:(int64_t)a3 faceBounds:(CGRect)a4 dialDiameter:(double)a5 forDevice:(id)a6
{
  id v8;
  void *v9;
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
  double v20;
  double v21;
  void *v22;
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v8 = a6;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(a1, "keylineImageWithFilled:forDevice:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");

  }
  CLKSizeCenteredInRectForDevice();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "transformForState:", a3);
  v18 = *MEMORY[0x1E0DC49E8];
  v19 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v21 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:", v8, 3, 3, 1, v24, v11, v13, v15, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (CGAffineTransform)transformForState:(SEL)a3
{
  uint64_t v4;
  __int128 v5;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return CGAffineTransformMakeScale(retstr, 0.95, 0.95);
  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  NTKRichComplicationBezelEmptyView *v3;

  if (a3)
    v3 = 0;
  else
    v3 = objc_alloc_init(NTKRichComplicationBezelEmptyView);
  return v3;
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8 bezelTextUpdateHandler:(id)a9
{
  _BOOL8 v13;
  id v15;
  id v16;
  double v17;
  id v18;

  v13 = a5;
  v18 = a3;
  v15 = a4;
  v16 = a9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(float *)&v17 = a8;
      +[NTKRichComplicationBezelBaseCircularView updateCustomDataAnimationFromEarlierView:laterView:isForward:animationType:animationDuration:animationFraction:bezelTextUpdateHandler:](NTKRichComplicationBezelBaseCircularView, "updateCustomDataAnimationFromEarlierView:laterView:isForward:animationType:animationDuration:animationFraction:bezelTextUpdateHandler:", v18, v15, v13, a6, v16, a7, v17);
    }
  }

}

- (NTKRichComplicationBezelView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBezelView;
  return -[CDRichComplicationView initWithFamily:](&v3, sel_initWithFamily_, 9);
}

- (NTKRichComplicationBezelView)initWithFamily:(int64_t)a3
{
  NTKRichComplicationBezelView *v3;

  if (a3 == 9)
  {
    self = -[NTKRichComplicationBezelView init](self, "init");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL4 v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[NTKRichComplicationBezelView _createHitTestPathIfNecessary](self, "_createHitTestPathIfNecessary", a4);
  -[NTKRichComplicationBezelView bounds](self, "bounds");
  v9.x = x;
  v9.y = y;
  v7 = CGRectContainsPoint(v10, v9);
  if (v7)
    LOBYTE(v7) = -[UIBezierPath containsPoint:](self->_hitTestPath, "containsPoint:", x, y);
  return v7;
}

- (void)_createHitTestPathIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t hitTestShape;
  void *v12;
  UIBezierPath *v13;
  UIBezierPath *hitTestPath;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;

  if (!self->_hitTestPath
    || (-[NTKRichComplicationBezelView bounds](self, "bounds"), !CGRectEqualToRect(v19, self->_hitTestBounds)))
  {
    -[NTKRichComplicationBezelView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    hitTestShape = self->_hitTestShape;
    -[CDRichComplicationView device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKRichComplicationBezelUtilities hitTestPathWithViewBounds:shape:shapeFrame:forDevice:](NTKRichComplicationBezelUtilities, "hitTestPathWithViewBounds:shape:shapeFrame:forDevice:", hitTestShape, v12, v4, v6, v8, v10, self->_hitTestShapeFrame.origin.x, self->_hitTestShapeFrame.origin.y, self->_hitTestShapeFrame.size.width, self->_hitTestShapeFrame.size.height);
    v13 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = v13;

    -[NTKRichComplicationBezelView bounds](self, "bounds");
    self->_hitTestBounds.origin.x = v15;
    self->_hitTestBounds.origin.y = v16;
    self->_hitTestBounds.size.width = v17;
    self->_hitTestBounds.size.height = v18;
  }
}

- (void)_updateHitTestShape:(int64_t)a3 frame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIBezierPath *hitTestPath;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (self->_hitTestShape != a3 || !CGRectEqualToRect(a4, self->_hitTestShapeFrame))
  {
    hitTestPath = self->_hitTestPath;
    self->_hitTestPath = 0;

    self->_hitTestShape = a3;
    self->_hitTestShapeFrame.origin.x = x;
    self->_hitTestShapeFrame.origin.y = y;
    self->_hitTestShapeFrame.size.width = width;
    self->_hitTestShapeFrame.size.height = height;
  }
}

- (void)_setLayoutTransformToView:(id)a3 origin:(CGPoint)a4 rotationInDegree:(double)a5 centerScale:(double)a6
{
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  -[NTKRichComplicationBezelView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v15;
  *(_OWORD *)&v23.tx = *(_OWORD *)&v24.tx;
  CGAffineTransformTranslate(&v24, &v23, x, y);
  objc_msgSend(v10, "center");
  v17 = v12 * 0.5 - x - v16;
  objc_msgSend(v10, "center");
  v19 = v14 * 0.5 - y - v18;
  v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, v17, v19);
  v24 = v23;
  v22 = v23;
  CGAffineTransformScale(&v23, &v22, a6, a6);
  v24 = v23;
  CLKDegreesToRadians();
  v22 = v24;
  CGAffineTransformRotate(&v23, &v22, v20);
  v24 = v23;
  v22 = v23;
  CGAffineTransformTranslate(&v23, &v22, -v17, -v19);
  v24 = v23;
  v21 = v23;
  objc_msgSend(v10, "setTransform:", &v21);

}

- (double)bezelTextRadius
{
  return self->bezelTextRadius;
}

- (void)setBezelTextRadius:(double)a3
{
  self->bezelTextRadius = a3;
}

- (UIColor)bezelTextColor
{
  return self->_bezelTextColor;
}

- (void)setBezelTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_bezelTextColor, a3);
}

- (double)bezelTextWidthInRadius
{
  return self->_bezelTextWidthInRadius;
}

- (void)setBezelTextWidthInRadius:(double)a3
{
  self->_bezelTextWidthInRadius = a3;
}

- (double)bezelTextAlpha
{
  return self->_bezelTextAlpha;
}

- (void)setBezelTextAlpha:(double)a3
{
  self->_bezelTextAlpha = a3;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (NTKRichComplicationBezelViewDelegate)delegate
{
  return (NTKRichComplicationBezelViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bezelTextColor, 0);
  objc_storeStrong((id *)&self->_hitTestPath, 0);
}

@end
