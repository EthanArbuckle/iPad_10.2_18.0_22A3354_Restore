@implementation NTKRichComplicationCornerUtilities

+ (CGSize)viewSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  CDCornerComplicationSize();
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)layoutRuleForState:(int64_t)a3 position:(int64_t)a4 faceBounds:(CGRect)a5 forDevice:(id)a6 narrowTopSlots:(BOOL)a7
{
  _BOOL8 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v28;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a6;
  CDCornerComplicationSize();
  v17 = v16;
  v19 = v18;
  objc_msgSend(a1, "_keylinePaddingForPosition:conentSize:forDevice:narrowTopSlots:", a4, v15, v7);
  v32 = v21;
  v34 = v20;
  v28 = v23;
  v30 = v22;
  if (a4 == 3)
  {
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v24 = CGRectGetMaxX(v41) - v17;
    goto LABEL_6;
  }
  v24 = 0.0;
  if (a4 == 2)
  {
LABEL_6:
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v25 = CGRectGetMaxY(v42) - v19;
    goto LABEL_7;
  }
  v25 = 0.0;
  if (a4 == 1)
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v24 = CGRectGetMaxX(v40) - v17;
  }
LABEL_7:
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "transformForState:position:device:", a3, a4, v15, v28, v30, v32, v34);
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:editingTransform:", v15, 3, 3, 0, v36, v24, v25, v17, v19, v35, v33, v31, v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (CGAffineTransform)transformForState:(SEL)a3 position:(int64_t)a4 device:(int64_t)a5
{
  id v9;
  void *v10;
  id v11;
  id WeakRetained;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform *result;
  CGAffineTransform v27;
  CGAffineTransform v28;

  v9 = a6;
  v10 = v9;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v15 = MEMORY[0x1E0C9BAA8];
    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v16;
    v17 = *(_OWORD *)(v15 + 32);
    goto LABEL_14;
  }
  v11 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_33);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_33);
  if (!WeakRetained)
    goto LABEL_7;
  v13 = WeakRetained;
  v14 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_33);
  if (v14 != v11)
  {

LABEL_7:
    v20 = objc_storeWeak(&_LayoutConstants___cachedDevice_33, v11);
    _LayoutConstants___previousCLKDeviceVersion_33 = objc_msgSend(v11, "version");

    ___LayoutConstants_block_invoke_30(v21, v11);
    goto LABEL_8;
  }
  v18 = objc_msgSend(v11, "version");
  v19 = _LayoutConstants___previousCLKDeviceVersion_33;

  if (v18 != v19)
    goto LABEL_7;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_33);
  v22 = *(double *)&_LayoutConstants___constants_1_4;
  v23 = *(double *)&_LayoutConstants___constants_2_4;

  switch(a5)
  {
    case 0:
      v22 = -v22;
      goto LABEL_10;
    case 1:
LABEL_10:
      v23 = -v23;
      break;
    case 2:
      v22 = -v22;
      break;
    case 3:
      break;
    default:
      v22 = *MEMORY[0x1E0C9D538];
      v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, 0.8, 0.8);
  v24 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v27.c = v24;
  *(_OWORD *)&v27.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v28, &v27, v22, v23);
  v25 = *(_OWORD *)&v28.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v28.a;
  *(_OWORD *)&retstr->c = v25;
  v17 = *(_OWORD *)&v28.tx;
LABEL_14:
  *(_OWORD *)&retstr->tx = v17;

  return result;
}

+ (id)keylineImageForPosition:(int64_t)a3 filled:(BOOL)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v6 = a4;
  if ((unint64_t)(a3 - 1) > 2)
    v7 = 1;
  else
    v7 = qword_1B755E6B0[a3 - 1];
  v8 = a5;
  CDCornerComplicationSize();
  v10 = v9;
  v12 = v11;
  v13 = NTKCornerComplicationKeylineInnerRadius(v8);
  objc_msgSend(off_1E6BCA180, "cornerKeylineWithDevice:corner:size:innerCircleRadius:strokeWidth:filled:", v8, v7, v6, v10, v12, v13, NTKKeylineWidth());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)keylineViewForPosition:(int64_t)a3 forDevice:(id)a4 narrowTopSlots:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v5 = a5;
  v8 = a4;
  objc_msgSend(a1, "keylineImageForPosition:filled:forDevice:narrowTopSlots:", a3, 0, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    NTKKeylineViewWithImage(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__NTKRichComplicationCornerUtilities_keylineViewForPosition_forDevice_narrowTopSlots___block_invoke;
    v14[3] = &unk_1E6BD3E40;
    v16 = a1;
    v17 = a3;
    v15 = v8;
    +[NTKKeylineTouchable touchableWithHandler:](NTKKeylineTouchable, "touchableWithHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTouchable:", v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __86__NTKRichComplicationCornerUtilities_keylineViewForPosition_forDevice_narrowTopSlots___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  uint64_t v18;
  CGPoint v20;
  CGRect v21;

  v7 = a2;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "hitTestPathWithViewBounds:position:forDevice:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v21.origin.x = v11;
  v21.origin.y = v13;
  v21.size.width = v15;
  v21.size.height = v17;
  v20.x = a3;
  v20.y = a4;
  if (CGRectContainsPoint(v21, v20))
    v18 = objc_msgSend(v9, "containsPoint:", a3, a4);
  else
    v18 = 0;

  return v18;
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

+ (UIEdgeInsets)_keylinePaddingForPosition:(int64_t)a3 conentSize:(CGSize)a4 forDevice:(id)a5 narrowTopSlots:(BOOL)a6
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "keylineImageForPosition:filled:forDevice:narrowTopSlots:", a3, 0, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  switch(a3)
  {
    case 0:
      v16 = v13 - height;
      v17 = v11 - width;
      v14 = 0.0;
      v15 = 0.0;
      break;
    case 1:
      v15 = v11 - width;
      v16 = v13 - height;
      v14 = 0.0;
      goto LABEL_6;
    case 2:
      v14 = v13 - height;
      v17 = v11 - width;
      v15 = 0.0;
      v16 = 0.0;
      break;
    case 3:
      v14 = v13 - height;
      v15 = v11 - width;
      v16 = 0.0;
LABEL_6:
      v17 = 0.0;
      break;
    default:
      break;
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc((Class)off_1E6BCA1A0), "initWithFontFallback:", 0, v3, v4);
  return v5;
}

@end
