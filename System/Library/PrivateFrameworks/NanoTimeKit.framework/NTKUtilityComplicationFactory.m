@implementation NTKUtilityComplicationFactory

- (id)initForDevice:(id)a3
{
  id v5;
  NTKUtilityComplicationFactory *v6;
  NTKUtilityComplicationFactory *v7;
  __int128 v8;
  double v9;
  double v10;
  _OWORD *v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  void *v16;
  uint64_t v17;
  CLKFont *topBezelLabelFont;
  double v19;
  double v20;
  char v22[216];
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NTKUtilityComplicationFactory;
  v6 = -[NTKUtilityComplicationFactory init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    *(_WORD *)&v7->_graphicCornerComplications = 0;
    memset(v37, 0, sizeof(v37));
    v35 = 0u;
    v36 = 0u;
    memset(v34, 0, sizeof(v34));
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    _LayoutConstants_2(v7->_device, &v24);
    v7->_accommodatesTwoTopComplications = 1;
    v8 = *(_OWORD *)&v34[1];
    v7->_normalCircularPadding = *(CGSize *)&v37[1];
    *(_OWORD *)&v7->_normalSidePadding = v8;
    *(_OWORD *)&v7->_deselectedKeylineSideInnerPadding = xmmword_1B755D600;
    *(_OWORD *)&v7->_deselectedKeylineCircularInnerPadding = xmmword_1B755D610;
    v7->_selectedKeylineVerticalInnerContentSpacer = 2.0;
    CLKValueForDeviceMetrics();
    v7->_selectedKeylineHeight = v9;
    v7->_foregroundAlpha = NTKUtilityComplicationNormalForegroundAlpha();
    v10 = NTKUtilityComplicationNormalForegroundAlpha();
    v11 = (_OWORD *)MEMORY[0x1E0DC49E8];
    v12 = *(double *)&v26;
    v13 = *(double *)&v25;
    v7->_foregroundImageAlpha = v10;
    v7->_maxNormalLongWidth = v12;
    v14 = v11[1];
    *(_OWORD *)&v7->_screenEdgeInsets.top = *v11;
    v7->_bottomCenterLayout = 1;
    *(_OWORD *)&v7->_screenEdgeInsets.bottom = v14;
    v7->_crownIndicatorGap = v13;
    v15 = *((double *)&v35 + 1);
    *(_QWORD *)&v7->_bezelLabelTopPadding = v34[3];
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:design:", *MEMORY[0x1E0C940A8], v15, *MEMORY[0x1E0DC1438]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CLKFontWithAlternativePunctuation");
    v17 = objc_claimAutoreleasedReturnValue();
    topBezelLabelFont = v7->_topBezelLabelFont;
    v7->_topBezelLabelFont = (CLKFont *)v17;

    *(_QWORD *)&v7->_bezelKeylineInnerCircleOffset = v36;
    objc_msgSend(v5, "screenBounds");
    v20 = v19;
    _LayoutConstants_2(v7->_device, v22);
    v7->_bezelKeylineDiameter = v20 - v23;
  }

  return v7;
}

+ (unint64_t)placementForSlot:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0xB)
    return 3;
  else
    return qword_1B755D6D8[a3 - 2];
}

+ (id)smileShapeForDevice:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  _BYTE v8[88];
  double v9;
  _BYTE v10[80];
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v3 = a3;
  _LayoutConstants_2(v3, v10);
  v4 = v11;
  _LayoutConstants_2(v3, v8);
  v5 = v9;
  +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", &v13, 0, &v12, 0, 0, 10, v3);
  objc_msgSend(off_1E6BCA180, "smileShapeWithDevice:outerRadius:innerRadius:angle:strokeWidth:filled:", v3, 0, v5 + v13, v13 - v4, v12 * 0.5, NTKKeylineWidth());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (CGSize)smileShapeSizeForDevice:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __double2 v10;
  double v11;
  double v12;
  _BYTE v13[88];
  double v14;
  _BYTE v15[80];
  double v16;
  double v17;
  double v18;
  CGSize result;

  v17 = 0.0;
  v18 = 0.0;
  v3 = a3;
  _LayoutConstants_2(v3, v15);
  v4 = v16;
  _LayoutConstants_2(v3, v13);
  v5 = v14;
  +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", &v18, 0, &v17, 0, 0, 10, v3);

  v6 = v5 + v18;
  v7 = v18 - v4;
  v8 = (v6 - (v18 - v4)) * 0.5;
  v9 = (v6 + v7) * 0.5;
  v10 = __sincos_stret(1.57079633 - v17 * 0.5);
  v11 = v8 + v9 * v10.__cosval + v8 + v9 * v10.__cosval;
  v12 = v6 - -(v8 - v9 * v10.__sinval);
  result.height = v12;
  result.width = v11;
  return result;
}

+ (CGPoint)smileShapeAlignmentPointForDevice:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BYTE v11[88];
  double v12;
  CGPoint result;

  v3 = a3;
  _LayoutConstants_2(v3, v11);
  v4 = v12;
  +[NTKUtilityComplicationFactory smileShapeSizeForDevice:](NTKUtilityComplicationFactory, "smileShapeSizeForDevice:", v3);
  v6 = v5;
  v8 = v7;

  v9 = v6 * 0.5;
  v10 = v8 - v4;
  result.y = v10;
  result.x = v9;
  return result;
}

- (int64_t)layoutOverrideForComplicationType:(unint64_t)a3 inSlot:(int64_t)a4
{
  void *v5;

  if ((unint64_t)(a4 - 1) > 3)
    return 0;
  NTKUtilityComplicationCircularTypes();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(v5, "containsIndex:", a3);

  if ((_DWORD)a3)
    return 2;
  else
    return 0;
}

- (id)newViewForComplication:(id)a3 family:(int64_t)a4 forSlot:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = v8;
  if (a5 != 12)
  {
    if ((unint64_t)(a5 - 7) <= 4)
    {
      +[NTKUtilityComplicationView largeComplicationViewForType:narrow:](NTKUtilityComplicationView, "largeComplicationViewForType:narrow:", objc_msgSend(v8, "complicationType"), a4 == 104);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    +[NTKUtilityComplicationView smallComplicationViewForType:](NTKUtilityComplicationView, "smallComplicationViewForType:", objc_msgSend(v9, "complicationType"));
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[NTKUtilityComplicationFactory _viewForDateComplication:](self, "_viewForDateComplication:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4 dialDiameter:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _BYTE v12[200];
  double v13;

  v11 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("bezel")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v11;
      -[NTKUtilityComplicationFactory device](self, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _LayoutConstants_2(v9, v12);
      objc_msgSend(v8, "setFontSize:", v13);

      objc_msgSend(v8, "setFontWeight:", *MEMORY[0x1E0DC1438]);
      objc_msgSend(v8, "setUseRoundedFontDesign:", 1);
      objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", 11));
      -[NTKUtilityComplicationFactory bezelComplicationMaxAngularWidth](self, "bezelComplicationMaxAngularWidth");
      objc_msgSend(v8, "setMaxAngularWidth:");
      -[NTKUtilityComplicationFactory bezelComplicationRadiusWithDialDiameter:](self, "bezelComplicationRadiusWithDialDiameter:", a5);
      objc_msgSend(v8, "setCircleRadius:");
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setForegroundColor:", v10);

      objc_msgSend(v8, "setForegroundAlpha:", 1.0);
      objc_msgSend(v8, "setShouldScaleAndFadeWhenHighlighting:", 1);

    }
  }

}

- (double)bezelComplicationRadiusWithDialDiameter:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[CLKFont capHeight](self->_topBezelLabelFont, "capHeight");
  -[NTKUtilityComplicationFactory device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();
  v6 = v5;

  return v6;
}

- (double)bezelComplicationMaxAngularWidth
{
  void *v2;
  double v3;

  -[NTKUtilityComplicationFactory device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NTKWhistlerBezelCircularViewDefaultMaxAngularWidth();

  return v3;
}

- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 withBounds:(CGRect)a5
{
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:bounds:dialDiameter:](self, "configureComplicationLayout:forSlot:bounds:dialDiameter:", a3, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 0.0);
}

- (void)configureComplicationLayout:(id)a3 forSlot:(int64_t)a4 bounds:(CGRect)a5 dialDiameter:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  uint64_t v14;
  id v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a3;
  -[NTKUtilityComplicationFactory delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "textLayoutStyleForSlot:", a4);

  switch(a4)
  {
    case 1:
      -[NTKUtilityComplicationFactory _configureTopLeftLayout:withBounds:variant:](self, "_configureTopLeftLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 2:
      -[NTKUtilityComplicationFactory _configureTopRightLayout:withBounds:variant:](self, "_configureTopRightLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 3:
      -[NTKUtilityComplicationFactory _configureBottomLeftLayout:withBounds:variant:](self, "_configureBottomLeftLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 4:
      -[NTKUtilityComplicationFactory _configureBottomRightLayout:withBounds:variant:](self, "_configureBottomRightLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 5:
      -[NTKUtilityComplicationFactory _configureTopRightAboveLayout:withBounds:](self, "_configureTopRightAboveLayout:withBounds:", v15, x, y, width, height);
      break;
    case 6:
      -[NTKUtilityComplicationFactory _configureBottomRightAboveLayout:withBounds:](self, "_configureBottomRightAboveLayout:withBounds:", v15, x, y, width, height);
      break;
    case 7:
      -[NTKUtilityComplicationFactory _configureTopRightBelowLayout:withBounds:](self, "_configureTopRightBelowLayout:withBounds:", v15, x, y, width, height);
      break;
    case 8:
      -[NTKUtilityComplicationFactory _configureBottomRightBelowLayout:withBounds:](self, "_configureBottomRightBelowLayout:withBounds:", v15, x, y, width, height);
      break;
    case 9:
      -[NTKUtilityComplicationFactory _configureBottomRightLongLayout:withBounds:](self, "_configureBottomRightLongLayout:withBounds:", v15, x, y, width, height);
      break;
    case 10:
      -[NTKUtilityComplicationFactory _configureBottomCenterLayout:withBounds:variant:](self, "_configureBottomCenterLayout:withBounds:variant:", v15, v14 == 1, x, y, width, height);
      break;
    case 11:
      -[NTKUtilityComplicationFactory _configureTopBezelLayout:withBounds:dialDiameter:](self, "_configureTopBezelLayout:withBounds:dialDiameter:", v15, x, y, width, height, a6);
      break;
    case 12:
      -[NTKUtilityComplicationFactory _configureDateLayout:withBounds:](self, "_configureDateLayout:withBounds:", v15, x, y, width, height);
      break;
    case 13:
      -[NTKUtilityComplicationFactory _configureUpNextTopRightLayout:withBounds:](self, "_configureUpNextTopRightLayout:withBounds:", v15, x, y, width, height);
      break;
    default:
      break;
  }

}

- (id)_curvedKeylineImageForSlot:(int64_t)a3
{
  return -[NTKUtilityComplicationFactory _curvedImageForSlot:filled:](self, "_curvedImageForSlot:filled:", a3, 0);
}

- (id)_curvedMaskImageForSlot:(int64_t)a3
{
  return -[NTKUtilityComplicationFactory _curvedImageForSlot:filled:](self, "_curvedImageForSlot:filled:", a3, 1);
}

- (id)_curvedImageForSlot:(int64_t)a3 filled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  __CFString *v20;
  double v21;
  double v22;
  uint64_t v23;
  _BYTE v25[88];
  double v26;
  _BYTE v27[80];
  double v28;
  double v29;
  double v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v4 = a4;
  v32[4] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (a3 == 10)
    {
      v29 = 0.0;
      v30 = 0.0;
      _LayoutConstants_2(self->_device, v27);
      v21 = v28;
      _LayoutConstants_2(self->_device, v25);
      v22 = v26;
      +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", &v30, 0, &v29, 0, 0, 10, self->_device);
      -[NTKUtilityComplicationFactory device](self, "device");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E6BCA180, "smileKeylineWithDevice:outerRadius:innerRadius:angle:strokeWidth:filled:", v20, v4, v22 + v30, v30 - v21, v29 * 0.5, NTKKeylineWidth());
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 11)
      {
        v19 = 0;
        return v19;
      }
      if (a4)
      {
        objc_msgSend(CFSTR("utility_bezel_keyline"), "stringByAppendingString:", CFSTR("_filled"));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = CFSTR("utility_bezel_keyline");
      }
      NTKImageNamed(v20);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v23;

    return v19;
  }
  v31[0] = &unk_1E6C9D9A8;
  v31[1] = &unk_1E6C9D9D8;
  v32[0] = &unk_1E6C9D9C0;
  v32[1] = &unk_1E6C9D9F0;
  v31[2] = &unk_1E6C9DA08;
  v31[3] = &unk_1E6C9DA38;
  v32[2] = &unk_1E6C9DA20;
  v32[3] = &unk_1E6C9DA50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityComplicationFactory device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");
  -[NTKUtilityComplicationFactory device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CDCornerComplicationKeylineSize();
  v14 = v13;
  v16 = v15;
  -[NTKUtilityComplicationFactory device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CDCornerComplicationKeylineInnerRadius();
  objc_msgSend(off_1E6BCA180, "cornerKeylineWithDevice:corner:size:innerCircleRadius:strokeWidth:filled:", v8, v11, v4, v14, v16, v18, NTKKeylineWidth());
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)keylineViewForSlot:(int64_t)a3
{
  return -[NTKUtilityComplicationFactory keylineViewForSlot:dialDiameter:](self, "keylineViewForSlot:dialDiameter:", a3, self->_bezelKeylineDiameter);
}

- (id)keylineViewForSlot:(int64_t)a3 dialDiameter:(double)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  long double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  _BYTE v20[224];
  double v21;
  _QWORD v22[4];
  __int128 v23;
  double v24;
  uint64_t v25;
  long double v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[72];
  double v31;
  char v32;
  __int128 v33;
  double v34;

  -[NTKUtilityComplicationFactory delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "textLayoutStyleForSlot:", a3);

  if (v8 != 1)
  {
    v10 = 0;
LABEL_5:
    if (a3 == 12)
    {
      _LayoutConstants_2(self->_device, v20);
      NTKKeylineViewWithContinuousCurveCornerRadius(v21);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 11)
        return v10;
      -[NTKUtilityComplicationFactory faceView](self, "faceView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_faceEditingScaleForEditMode:slot:", 1, 0);
      v16 = v15;

      NTKKeylineViewWithWheelShapedPath(a4, a4 - self->_bezelKeylineInnerCircleOffset, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;

    v10 = v18;
    return v10;
  }
  -[NTKUtilityComplicationFactory _curvedKeylineImageForSlot:](self, "_curvedKeylineImageForSlot:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKKeylineViewWithImage(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 != 10)
    goto LABEL_5;
  v34 = 0.0;
  v33 = 0uLL;
  v32 = 0;
  +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", &v34, 0, 0, &v33, &v32, 10, self->_device);
  _LayoutConstants_2(self->_device, v30);
  v11 = v34;
  v12 = asin(v31 / (v11 + v11));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__NTKUtilityComplicationFactory_keylineViewForSlot_dialDiameter___block_invoke;
  v22[3] = &__block_descriptor_105_e58_B40__0_CGPoint_dd_8__UIView_NTKKeylineView__24__UIEvent_32l;
  v23 = v33;
  v24 = v11;
  v29 = v32;
  v25 = 0x3FF921FB54442D18;
  v26 = v12;
  v27 = xmmword_1B755D6B8;
  v28 = unk_1B755D6C8;
  +[NTKKeylineTouchable touchableWithHandler:](NTKKeylineTouchable, "touchableWithHandler:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTouchable:", v13);

  return v10;
}

BOOL __65__NTKUtilityComplicationFactory_keylineViewForSlot_dialDiameter___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  double v7;
  double v8;

  objc_msgSend(a2, "convertPoint:fromView:", 0, *(double *)(a1 + 32), *(double *)(a1 + 40));
  return NTKUtilityComplicationCurvedPointInside(*(unsigned __int8 *)(a1 + 104), a3, a4, *(double *)(a1 + 48), v7, v8, *(double *)(a1 + 56) + *(double *)(a1 + 64), *(double *)(a1 + 56) - *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (CGRect)keylineFrameForCornerComplicationSlot:(id)a3 selected:(BOOL)a4 faceView:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v50;
  double v51;
  double v52;
  double v53;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v10 = 2;
  }
  else
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bottom-right")) & 1) == 0)
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_13;
    }
    v10 = 3;
  }
  if (v6)
    v11 = 3;
  else
    v11 = 2;
  objc_msgSend(v9, "bounds");
  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", v11, v10, self->_device, self->_usesNarrowTopSlots);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "referenceFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "keylinePadding");
  v24 = v14 - v23;
  v26 = v16 - v25;
  v27 = v18 - (-v22 - v23);
  v28 = v20 - (-v21 - v25);
  objc_msgSend(v9, "_complicationContainerViewForSlot:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v29, v24, v26, v27, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "screenBounds");
  v40 = v39;

  objc_msgSend(v9, "faceViewFrameForEditMode:option:slot:", 1, 0, v8);
  v42 = v41;
  v44 = v43;
  CGAffineTransformMakeScale(&v54, v45 / v40, v45 / v40);
  v55.origin.x = v31;
  v55.origin.y = v33;
  v55.size.width = v35;
  v55.size.height = v37;
  v56 = CGRectApplyAffineTransform(v55, &v54);
  v57 = CGRectOffset(v56, v42, v44);
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;

LABEL_13:
  v50 = x;
  v51 = y;
  v52 = width;
  v53 = height;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

+ (void)curvedCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(int64_t)a8 forDevice:(id)a9
{
  unint64_t v15;
  double v16;
  double v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  CGFloat v23;
  id v24;
  _BYTE v25[56];
  double v26;
  CGRect v27;
  CGRect v28;

  v24 = a9;
  v15 = +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", a8);
  +[NTKUtilityFlatComplicationView circleRadius:centerAngle:maxAngularWidth:interior:forPlacement:forDevice:](NTKUtilityFlatComplicationView, "circleRadius:centerAngle:maxAngularWidth:interior:forPlacement:forDevice:", a3, a4, a5, a7, v15, v24);
  if ((v15 & 1) != 0)
  {
    v17 = NTKUtilityComplicationCurvedUpperOffset(v24);
  }
  else
  {
    v16 = NTKUtilityComplicationCurvedLowerOffset(v24);
    _LayoutConstants_2(v24, v25);
    v17 = v16 + v26;
  }
  objc_msgSend(v24, "screenBounds");
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  MaxY = CGRectGetMaxY(v27);
  if (a6)
  {
    v23 = MaxY - (v17 + *a3);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    a6->x = CGRectGetMidX(v28);
    a6->y = v23;
  }

}

- (double)foregroundAlphaForEditing:(BOOL)a3
{
  if (a3)
    return NTKUtilityComplicationEditingForegroundAlpha();
  else
    return self->_foregroundAlpha;
}

- (double)foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double result;

  -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self, "foregroundAlphaForEditing:", a4 != 0, a3);
  -[NTKUtilityComplicationFactory foregroundAlphaForEditing:](self, "foregroundAlphaForEditing:", a5 != 0);
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (double)foregroundImageAlphaForEditing:(BOOL)a3
{
  if (a3)
    return NTKUtilityComplicationEditingForegroundAlpha();
  else
    return self->_foregroundImageAlpha;
}

- (double)foregroundImageAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  double result;

  -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self, "foregroundImageAlphaForEditing:", a4 != 0, a3);
  -[NTKUtilityComplicationFactory foregroundImageAlphaForEditing:](self, "foregroundImageAlphaForEditing:", a5 != 0);
  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (id)_viewForDateComplication:(id)a3
{
  id v4;
  NTKUtilityDateComplicationView *v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(NTKUtilityDateComplicationView);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(v4, "dateStyle");

  objc_msgSend(WeakRetained, "utilityDateComplicationFontForDateStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKUtilityDateComplicationView setFont:](v5, "setFont:", v8);

  return v5;
}

- (void)_configureTopLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  double top;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  CLKDevice *device;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[5];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD aBlock[9];
  BOOL v36;
  char v37[24];
  double v38;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  v14 = x + left;
  v15 = y + top;
  v16 = width - (left + self->_screenEdgeInsets.right);
  v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  v27 = width;
  v26 = y;
  if (v5)
  {
    v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    v21 = v20;
    v28 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v37);
    v19 = v38;
    v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    v28 = v22;
  }
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E6BCEF40;
  v36 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  v24 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke_2;
    v29[3] = &unk_1E6BCE4B8;
    v31 = x;
    v32 = v26;
    v33 = v27;
    v34 = height;
    v29[4] = self;
    v25 = v11;
    v30 = v25;
    NTKEnumerateComplicationStates(v29);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v25, v5, 1, v24, v19, v21, v28, v21);

  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v24, v19, v21, v28, v21);
  }

}

id __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BYTE v25[248];
  double v26;
  double v27;
  _BYTE v28[8];
  double v29;
  _BYTE v30[248];
  double v31;
  double v32;

  if (a2)
  {
    v11 = a6;
    v12 = a5;
    v13 = a6;
    v14 = a5;
    if (!*(_BYTE *)(a1 + 72))
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "_curvedKeylineImageForSlot:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;

    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v30);
    v11 = v32 + a6;
    v12 = v31 + a5;
    v13 = v19 - (a4 + a6 + v32);
    v14 = v17 - (a3 + a5 + v31);
    v20 = 0.0;
    if (!*(_BYTE *)(a1 + 72))
    {
LABEL_4:
      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v28);
      v20 = v29;
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v20 = 0.0;
  }
  v21 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + a5;
  v22 = v20 + CGRectGetMinY(*(CGRect *)(a1 + 40)) + a6;
  if (a2 && *(_BYTE *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v25);
    v21 = v21 + v26;
    v22 = v22 + v27;
  }
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, *(_BYTE *)(a1 + 72) == 0, 1, v21, v22, a3, a4, v11, v12, v13, v14);
}

void __76__NTKUtilityComplicationFactory__configureTopLeftLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setDefaultLayoutRule:forState:", v4, a2);

}

- (void)_configureTopRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  double top;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  CLKDevice *device;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double crownIndicatorGap;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD aBlock[10];
  BOOL v37;
  char v38[24];
  double v39;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  v14 = x + left;
  v15 = y + top;
  v16 = width - (left + self->_screenEdgeInsets.right);
  v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  v28 = width;
  v27 = y;
  if (v5)
  {
    v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    v21 = v20;
    v29 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v38);
    v19 = v39;
    v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    v29 = v22;
  }
  v23 = MEMORY[0x1E0C809B0];
  crownIndicatorGap = self->_crownIndicatorGap;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E6BCEF68;
  v37 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = crownIndicatorGap;
  *(double *)&aBlock[6] = v14;
  *(double *)&aBlock[7] = v15;
  *(double *)&aBlock[8] = v16;
  *(double *)&aBlock[9] = v17;
  v25 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke_2;
    v30[3] = &unk_1E6BCE4B8;
    v32 = x;
    v33 = v27;
    v34 = v28;
    v35 = height;
    v30[4] = self;
    v26 = v11;
    v31 = v26;
    NTKEnumerateComplicationStates(v30);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v26, v5, 1, v25, v19, v21, v29, v21);

  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v25, v19, v21, v29, v21);
  }

}

id __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  _BYTE v26[248];
  double v27;
  double v28;
  _BYTE v29[8];
  double v30;
  _BYTE v31[248];
  double v32;
  double v33;

  if (a2)
  {
    v24 = a6;
    v11 = a5;
    v12 = a6;
    v13 = a5;
    if (!*(_BYTE *)(a1 + 80))
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "_curvedKeylineImageForSlot:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    v16 = v15;
    v18 = v17;

    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v31);
    v24 = v33 + a6;
    v11 = v16 - (a3 + a5 + v32);
    v12 = v18 - (a4 + a6 + v33);
    v13 = v32 + a5;
    v19 = 0.0;
    v20 = 0.0;
    if (!*(_BYTE *)(a1 + 80))
    {
LABEL_13:
      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v29);
      v19 = v30;
      v20 = 0.0;
      if (!*(_BYTE *)(a1 + 80))
        v20 = *(double *)(a1 + 40);
    }
  }
  else
  {
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v24 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v19 = 0.0;
    v20 = 0.0;
  }
  v21 = CGRectGetMaxX(*(CGRect *)(a1 + 48)) - a5 - v20 - a3;
  v22 = v19 + CGRectGetMinY(*(CGRect *)(a1 + 48)) + a6;
  if (a2 && *(_BYTE *)(a1 + 80))
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v26);
    v21 = v21 - v27;
    v22 = v22 + v28;
  }
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, *(_BYTE *)(a1 + 80) == 0, 1, v21, v22, a3, a4, v24, v11, v12, v13);
}

void __77__NTKUtilityComplicationFactory__configureTopRightLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setDefaultLayoutRule:forState:", v4, a2);

}

- (void)_configureBottomLeftLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  double top;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  CLKDevice *device;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[5];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD aBlock[9];
  BOOL v36;
  char v37[24];
  double v38;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  v14 = x + left;
  v15 = y + top;
  v16 = width - (left + self->_screenEdgeInsets.right);
  v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  v27 = width;
  v26 = y;
  if (v5)
  {
    v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    v21 = v20;
    v28 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v37);
    v19 = v38;
    v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    v28 = v22;
  }
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E6BCEF40;
  v36 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  v24 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke_2;
    v29[3] = &unk_1E6BCE4B8;
    v31 = x;
    v32 = v26;
    v33 = v27;
    v34 = height;
    v29[4] = self;
    v25 = v11;
    v30 = v25;
    NTKEnumerateComplicationStates(v29);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v25, v5, 1, v24, v19, v21, v28, v21);

  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v24, v19, v21, v28, v21);
  }

}

id __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v25[33];
  _BYTE v26[248];
  double v27;
  double v28;

  if ((a2 & 1) != 0)
  {
    v12 = a5;
    v13 = a6;
    v14 = a5;
    v15 = a6;
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "_curvedKeylineImageForSlot:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v18 = v17;
      v20 = v19;

      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v26);
      v15 = v20 - (a4 + a6 + v28);
      v14 = v27 + a5;
      v13 = v28 + a6;
      v12 = v18 - (a3 + a5 + v27);
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v21 = CGRectGetMinX(*(CGRect *)(a1 + 40)) + a5;
  v22 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  if (a2 && *(_BYTE *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v25);
    v21 = v21 + v25[31];
    v22 = v22 - v25[32];
  }
  if (*(_BYTE *)(a1 + 72))
    v23 = 2;
  else
    v23 = 1;
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, v23, 1, v21, v22, a3, a4, v15, v14, v13, v12);
}

void __79__NTKUtilityComplicationFactory__configureBottomLeftLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setDefaultLayoutRule:forState:", v4, a2);

}

- (void)_configureBottomRightLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  double top;
  double left;
  double v14;
  double v15;
  double v16;
  double v17;
  CLKDevice *device;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[5];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD aBlock[9];
  BOOL v36;
  char v37[24];
  double v38;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  v14 = x + left;
  v15 = y + top;
  v16 = width - (left + self->_screenEdgeInsets.right);
  v17 = height - (top + self->_screenEdgeInsets.bottom);
  device = self->_device;
  v27 = width;
  v26 = y;
  if (v5)
  {
    v19 = NTKUtilityComplicationCurvedCornerSize(device);
    NTKUtilityComplicationCurvedCornerSize(self->_device);
    v21 = v20;
    v28 = v19;
  }
  else
  {
    _LayoutConstants_2(device, v37);
    v19 = v38;
    v21 = NTKUtilityComplicationHeight(self->_device);
    -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v14, v15, v16, v17);
    v28 = v22;
  }
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E6BCEF40;
  v36 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = v15;
  *(double *)&aBlock[7] = v16;
  *(double *)&aBlock[8] = v17;
  v24 = _Block_copy(aBlock);
  if (self->_graphicCornerComplications)
  {
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke_2;
    v29[3] = &unk_1E6BCE4B8;
    v31 = x;
    v32 = v26;
    v33 = v27;
    v34 = height;
    v29[4] = self;
    v25 = v11;
    v30 = v25;
    NTKEnumerateComplicationStates(v29);
    -[NTKUtilityComplicationFactory _configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureOverridesForLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v25, v5, 1, v24, v19, v21, v28, v21);

  }
  else
  {
    -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v11, v5, 1, v24, v19, v21, v28, v21);
  }

}

id __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v25[33];
  _BYTE v26[248];
  double v27;
  double v28;

  if ((a2 & 1) != 0)
  {
    v12 = a5;
    v13 = a6;
    v14 = a5;
    v15 = a6;
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "_curvedKeylineImageForSlot:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      v18 = v17;
      v20 = v19;

      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v26);
      v15 = v20 - (a4 + a6 + v28);
      v14 = v18 - (a3 + a5 + v27);
      v13 = v28 + a6;
      v12 = v27 + a5;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v21 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  v22 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  if (a2 && *(_BYTE *)(a1 + 72))
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v25);
    v21 = v21 - v25[31];
    v22 = v22 - v25[32];
  }
  if (*(_BYTE *)(a1 + 72))
    v23 = 2;
  else
    v23 = 1;
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, v23, 1, v21, v22, a3, a4, v15, v14, v13, v12);
}

void __80__NTKUtilityComplicationFactory__configureBottomRightLayout_withBounds_variant___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  +[NTKRichComplicationCornerUtilities layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "layoutRuleForState:position:faceBounds:forDevice:narrowTopSlots:", a2, 3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setDefaultLayoutRule:forState:", v4, a2);

}

- (void)_configureTopBezelLayout:(id)a3 withBounds:(CGRect)a4 dialDiameter:(double)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, int, char);
  void *v13;
  NTKUtilityComplicationFactory *v14;
  double v15;
  CGRect v16;

  height = a4.size.height;
  width = a4.size.width;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __82__NTKUtilityComplicationFactory__configureTopBezelLayout_withBounds_dialDiameter___block_invoke;
  v13 = &unk_1E6BCEF90;
  v15 = a5;
  v16 = a4;
  v14 = self;
  v8 = a3;
  v9 = _Block_copy(&v10);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v8, 1, 0, v9, width, height, width, height, v10, v11, v12, v13, v14, *(_QWORD *)&v15, *(_QWORD *)&v16.origin.x, *(_QWORD *)&v16.origin.y, *(_QWORD *)&v16.size.width,
    *(_QWORD *)&v16.size.height);

}

id __82__NTKUtilityComplicationFactory__configureTopBezelLayout_withBounds_dialDiameter___block_invoke(uint64_t a1, int a2, char a3)
{
  double v6;
  double v7;
  double Width;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BYTE v18[192];
  double v19;

  v6 = *(double *)(a1 + 40);
  v7 = CGRectGetHeight(*(CGRect *)(a1 + 48)) * 0.5 - v6 * 0.5;
  Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
  v9 = *(double *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(double *)(v10 + 144);
  if ((a3 & 1) != 0 || a2)
  {
    _LayoutConstants_2(*(void **)(v10 + 16), v18);
    v7 = v7 + v11 + v19;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = *(double *)(v10 + 160) - v6;
    v13 = v11 + v19 + v12 * 0.5;
    v14 = v12 * 0.5;
    v15 = -(v11 + v19 - v12 * 0.5);
    v16 = v12 * 0.5;
  }
  else
  {
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v13 = *MEMORY[0x1E0DC49E8];
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  }
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(v10 + 16), 1, 0, 1, Width * 0.5 - v9 * 0.5, v7, v6, v6, v13, v14, v15, v16);
}

- (void)_configureBottomCenterLayout:(id)a3 withBounds:(CGRect)a4 variant:(BOOL)a5
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double top;
  double left;
  double v14;
  double v15;
  CLKDevice *device;
  id v17;
  double maxNormalLongWidth;
  double v19;
  double v20;
  double v21;
  double v22;
  CLKDevice *v23;
  id v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  _QWORD aBlock[13];
  BOOL v30;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  v14 = x + left;
  v27 = a4.size.width - (left + self->_screenEdgeInsets.right);
  v28 = y + top;
  v15 = a4.size.height - (top + self->_screenEdgeInsets.bottom);
  if (a5)
  {
    device = self->_device;
    v17 = a3;
    maxNormalLongWidth = NTKUtilityComplicationCurvedCenterSize(device);
    NTKUtilityComplicationCurvedCenterSize(self->_device);
    v20 = v19;
    v21 = v14;
    v22 = maxNormalLongWidth;
  }
  else
  {
    maxNormalLongWidth = self->_maxNormalLongWidth;
    v23 = self->_device;
    v24 = a3;
    v20 = NTKUtilityComplicationHeight(v23);
    -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v14, v28, v27, v15);
    v21 = v14;
    v22 = v25;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__NTKUtilityComplicationFactory__configureBottomCenterLayout_withBounds_variant___block_invoke;
  aBlock[3] = &unk_1E6BCEFB8;
  v30 = v5;
  aBlock[4] = self;
  *(double *)&aBlock[5] = x;
  *(double *)&aBlock[6] = y;
  *(CGFloat *)&aBlock[7] = width;
  *(CGFloat *)&aBlock[8] = height;
  *(double *)&aBlock[9] = v21;
  *(double *)&aBlock[10] = v28;
  *(double *)&aBlock[11] = v27;
  *(double *)&aBlock[12] = v15;
  v26 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", a3, v5, 0, v26, maxNormalLongWidth, v20, v22, v20);

}

id __81__NTKUtilityComplicationFactory__configureBottomCenterLayout_withBounds_variant___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
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
  double v21;
  double v22;
  double MinX;
  double v24;
  double v25;
  double v26;
  int v27;
  uint64_t v28;
  _BYTE v31[96];
  double v32;
  _BYTE v33[56];
  double v34;
  uint64_t v35;
  double v36;
  _BYTE v37[88];
  double v38;
  double v39;

  if ((a2 & 1) != 0)
  {
    v10 = a5;
    v11 = a6;
    v12 = a5;
    v13 = a6;
    if (*(_BYTE *)(a1 + 104))
    {
      v39 = 0.0;
      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v37);
      v14 = v38;
      v36 = 0.0;
      v35 = 0;
      +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", &v39, 0, 0, &v35, 0, 10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v15 = v14 + v36 + v39;
      _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v33);
      v16 = v15 + v34;
      v17 = v16 + NTKUtilityComplicationCurvedBuffer(*(void **)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(*(id *)(a1 + 32), "_curvedKeylineImageForSlot:", 10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "size");
      v20 = v19;
      v22 = v21;

      v10 = (v20 - a3) * 0.5;
      v11 = v17 - CGRectGetMaxY(*(CGRect *)(a1 + 40));
      v13 = v22 - a4 - v11;
      v12 = v10;
    }
  }
  else
  {
    v13 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 72));
  CLKFloorForDevice();
  v25 = v24;
  v26 = CGRectGetMaxY(*(CGRect *)(a1 + 72)) - a6 - a4;
  v27 = *(unsigned __int8 *)(a1 + 104);
  if (!*(_BYTE *)(a1 + 104) && a2)
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v31);
    v26 = v26 - v32;
    v27 = *(unsigned __int8 *)(a1 + 104);
  }
  if (v27)
    v28 = 2;
  else
    v28 = 1;
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), v28, 1, MinX + v25, v26, a3, a4, v13, v12, v11, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_configureDateLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  double v11;
  double selectedKeylineHeight;
  void *v13;
  _QWORD aBlock[9];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[NTKUtilityComplicationFactory _maxDateWidthLeavingRoomForKeylines](self, "_maxDateWidthLeavingRoomForKeylines");
  v11 = v10;
  selectedKeylineHeight = self->_selectedKeylineHeight;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__NTKUtilityComplicationFactory__configureDateLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E6BCEFE0;
  *(CGFloat *)&aBlock[5] = x;
  *(CGFloat *)&aBlock[6] = y;
  *(CGFloat *)&aBlock[7] = width;
  *(CGFloat *)&aBlock[8] = height;
  aBlock[4] = self;
  v13 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v9, 0, 0, v13, v11, selectedKeylineHeight, v11, selectedKeylineHeight);

}

id __65__NTKUtilityComplicationFactory__configureDateLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a6;
  v7 = a5;
  v11 = a6;
  v12 = a5;
  if ((a2 & 1) == 0)
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  CGRectGetMidX(*(CGRect *)(a1 + 40));
  CLKFloorForDevice();
  v14 = v13;
  CGRectGetMidY(*(CGRect *)(a1 + 40));
  CLKFloorForDevice();
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 1, 1, 1, v14, v15, a3, a4, v6, v7, v11, v12);
}

- (void)_configureTopRightAboveLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double crownIndicatorGap;
  void *v21;
  _QWORD v22[10];
  _BYTE v23[24];
  double v24;
  _BYTE v25[104];
  CGFloat dx;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v25);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v28 = CGRectInset(v27, dx, 0.0);
  v11 = v28.origin.x;
  v12 = v28.origin.y;
  v13 = v28.size.width;
  v14 = v28.size.height;
  _LayoutConstants_2(self->_device, v23);
  v15 = v24;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  crownIndicatorGap = self->_crownIndicatorGap;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__NTKUtilityComplicationFactory__configureTopRightAboveLayout_withBounds___block_invoke;
  v22[3] = &unk_1E6BCEF90;
  v22[4] = self;
  *(double *)&v22[5] = v11;
  *(double *)&v22[6] = v12;
  *(double *)&v22[7] = v13;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = crownIndicatorGap;
  v21 = _Block_copy(v22);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v21, v15, v16, v18, v19);

}

id __74__NTKUtilityComplicationFactory__configureTopRightAboveLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v18;
  _BYTE v20[112];
  double v21;
  _BYTE v22[8];
  double v23;
  CGRect v24;

  if ((a2 & 1) != 0)
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v22);
    v10 = v23;
    v11 = *(double *)(a1 + 72);
    v18 = a6;
    v12 = a5;
    v13 = a6;
    v14 = a5;
  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = *MEMORY[0x1E0DC49E8];
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v10 = 0.0;
    v11 = 0.0;
  }
  v24.origin.x = *(CGFloat *)(a1 + 40);
  v24.origin.y = *(CGFloat *)(a1 + 48);
  v15 = v10 + v24.origin.y;
  v24.size.width = *(CGFloat *)(a1 + 56);
  v24.size.height = *(CGFloat *)(a1 + 64);
  v16 = CGRectGetMaxX(v24) - a5 - v11 - a3;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v20);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 1, 1, v16, v15 + v21 + a6, a3, a4, v18, v12, v13, v14);
}

- (void)_configureTopRightBelowLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
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
  _QWORD aBlock[9];
  _BYTE v22[144];
  double v23;
  _BYTE v24[104];
  CGFloat dx;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectInset(v26, dx, 0.0);
  v11 = v27.origin.x;
  v12 = v27.origin.y;
  v13 = v27.size.width;
  v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  v15 = v23;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NTKUtilityComplicationFactory__configureTopRightBelowLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E6BCEFE0;
  aBlock[4] = self;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);

}

id __74__NTKUtilityComplicationFactory__configureTopRightBelowLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  _BYTE v19[120];
  double v20;
  _BYTE v21[8];
  double v22;
  CGRect v23;

  if ((a2 & 1) != 0)
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v21);
    v10 = v22;
    v11 = a5;
    v12 = a6;
    v13 = a5;
    v14 = a6;
  }
  else
  {
    v14 = *MEMORY[0x1E0DC49E8];
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v10 = 0.0;
  }
  v23.origin.x = *(CGFloat *)(a1 + 40);
  v23.origin.y = *(CGFloat *)(a1 + 48);
  v15 = v10 + v23.origin.y;
  v23.size.width = *(CGFloat *)(a1 + 56);
  v23.size.height = *(CGFloat *)(a1 + 64);
  v16 = CGRectGetMaxX(v23) - a5 - a3;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v19);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 1, 1, v16, v15 + v20 + a6, a3, a4, v14, v13, v12, v11);
}

- (void)_configureBottomRightAboveLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
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
  _QWORD aBlock[9];
  _BYTE v22[24];
  double v23;
  _BYTE v24[104];
  CGFloat dx;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectInset(v26, dx, 0.0);
  v11 = v27.origin.x;
  v12 = v27.origin.y;
  v13 = v27.size.width;
  v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  v15 = v23;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCornerWidthLeavingRoomForKeylines:](self, "_maxBottomCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureBottomRightAboveLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E6BCEFE0;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v20, v15, v16, v18, v19);

}

id __77__NTKUtilityComplicationFactory__configureBottomRightAboveLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  _BYTE v17[128];
  double v18;

  v10 = a6;
  v11 = a5;
  v12 = a6;
  v13 = a5;
  if ((a2 & 1) == 0)
  {
    v10 = *MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v17);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 1, 1, v14, v15 + v18, a3, a4, v10, v11, v12, v13);
}

- (void)_configureBottomRightBelowLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
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
  _QWORD aBlock[9];
  _BYTE v22[144];
  double v23;
  _BYTE v24[104];
  CGFloat dx;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectInset(v26, dx, 0.0);
  v11 = v27.origin.x;
  v12 = v27.origin.y;
  v13 = v27.size.width;
  v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  v15 = v23;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKUtilityComplicationFactory__configureBottomRightBelowLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E6BCEFE0;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);

}

id __77__NTKUtilityComplicationFactory__configureBottomRightBelowLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  _BYTE v17[136];
  double v18;

  v10 = a6;
  v11 = a5;
  v12 = a6;
  v13 = a5;
  if ((a2 & 1) == 0)
  {
    v10 = *MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v17);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 1, 1, v14, v15 + v18, a3, a4, v10, v11, v12, v13);
}

- (void)_configureBottomRightLongLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
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
  _QWORD aBlock[9];
  _BYTE v22[144];
  double v23;
  _BYTE v24[104];
  CGFloat dx;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v24);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectInset(v26, dx, 0.0);
  v11 = v27.origin.x;
  v12 = v27.origin.y;
  v13 = v27.size.width;
  v14 = v27.size.height;
  _LayoutConstants_2(self->_device, v22);
  v15 = v23;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxBottomCenterWidthLeavingRoomForKeylines:](self, "_maxBottomCenterWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NTKUtilityComplicationFactory__configureBottomRightLongLayout_withBounds___block_invoke;
  aBlock[3] = &unk_1E6BCEFE0;
  *(double *)&aBlock[5] = v11;
  *(double *)&aBlock[6] = v12;
  *(double *)&aBlock[7] = v13;
  *(double *)&aBlock[8] = v14;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 0, v20, v15, v16, v18, v19);

}

id __76__NTKUtilityComplicationFactory__configureBottomRightLongLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  _BYTE v17[160];
  double v18;

  v10 = a6;
  v11 = a5;
  v12 = a6;
  v13 = a5;
  if ((a2 & 1) == 0)
  {
    v10 = *MEMORY[0x1E0DC49E8];
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  v14 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - a5 - a3;
  v15 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) - a6 - a4;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v17);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 2, 1, 1, v14, v15 + v18, a3, a4, v10, v11, v12, v13);
}

- (void)_configureUpNextTopRightLayout:(id)a3 withBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CLKDevice *device;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double crownIndicatorGap;
  void *v21;
  _QWORD v22[10];
  _BYTE v23[24];
  double v24;
  _BYTE v25[104];
  CGFloat dx;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  device = self->_device;
  v10 = a3;
  _LayoutConstants_2(device, v25);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v28 = CGRectInset(v27, dx, 0.0);
  v11 = v28.origin.x;
  v12 = v28.origin.y;
  v13 = v28.size.width;
  v14 = v28.size.height;
  _LayoutConstants_2(self->_device, v23);
  v15 = v24 + 1.0;
  v16 = NTKUtilityComplicationHeight(self->_device);
  -[NTKUtilityComplicationFactory _maxTopCornerWidthLeavingRoomForKeylines:](self, "_maxTopCornerWidthLeavingRoomForKeylines:", v11, v12, v13, v14);
  v18 = v17;
  v19 = NTKUtilityComplicationHeight(self->_device);
  crownIndicatorGap = self->_crownIndicatorGap;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__NTKUtilityComplicationFactory__configureUpNextTopRightLayout_withBounds___block_invoke;
  v22[3] = &unk_1E6BCEF90;
  v22[4] = self;
  *(double *)&v22[5] = v11;
  *(double *)&v22[6] = v12;
  *(double *)&v22[7] = v13;
  *(double *)&v22[8] = v14;
  *(double *)&v22[9] = crownIndicatorGap;
  v21 = _Block_copy(v22);
  -[NTKUtilityComplicationFactory _configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:](self, "_configureLayout:withNormalSize:editingSize:variant:addCircleOverrides:makeRuleBlock:", v10, 0, 1, v21, v15, v16, v18, v19);

}

id __75__NTKUtilityComplicationFactory__configureUpNextTopRightLayout_withBounds___block_invoke(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v18;
  _BYTE v20[152];
  double v21;
  _BYTE v22[8];
  double v23;
  CGRect v24;

  if ((a2 & 1) != 0)
  {
    _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v22);
    v10 = v23;
    v11 = *(double *)(a1 + 72);
    v18 = a6;
    v12 = a5;
    v13 = a6;
    v14 = a5;
  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = *MEMORY[0x1E0DC49E8];
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v10 = 0.0;
    v11 = 0.0;
  }
  v24.origin.x = *(CGFloat *)(a1 + 40);
  v24.origin.y = *(CGFloat *)(a1 + 48);
  v15 = v10 + v24.origin.y;
  v24.size.width = *(CGFloat *)(a1 + 56);
  v24.size.height = *(CGFloat *)(a1 + 64);
  v16 = CGRectGetMaxX(v24) - a5 - v11 - a3;
  _LayoutConstants_2(*(void **)(*(_QWORD *)(a1 + 32) + 16), v20);
  return +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 1, 1, v16, v15 + v21 + a6, a3, a4, v18, v12, v13, v14);
}

- (void)_configureLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  double v13;
  double v14;
  id v16;
  double normalSidePadding;
  double *p_normalVerticalPadding;
  void *v19;
  double v20;
  double *v21;
  void *v22;
  double v23;
  __n128 v24;
  void *v25;
  double v26;
  __n128 v27;
  unint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  __n128 v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _BYTE v40[48];
  unint64_t v41;
  _BYTE v42[40];
  double v43;
  _BYTE v44[48];
  unint64_t v45;
  _BYTE v46[40];
  double v47;
  _BYTE v48[48];
  uint64_t v49;
  _BYTE v50[40];
  double v51;
  _BYTE v52[48];
  uint64_t v53;
  _BYTE v54[40];
  double v55;

  v9 = a7;
  v10 = a6;
  height = a5.height;
  width = a5.width;
  v13 = a4.height;
  v14 = a4.width;
  v39 = a3;
  v16 = a8;
  if (v10)
  {
    _LayoutConstants_2(self->_device, v54);
    normalSidePadding = v55;
    _LayoutConstants_2(self->_device, v52);
    p_normalVerticalPadding = (double *)&v53;
  }
  else
  {
    normalSidePadding = self->_normalSidePadding;
    p_normalVerticalPadding = &self->_normalVerticalPadding;
  }
  (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v16 + 2))(v16, 0, 0, v14, v13, normalSidePadding, *p_normalVerticalPadding);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDefaultLayoutRule:forState:", v19, 0);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v50);
    v20 = v51;
    _LayoutConstants_2(self->_device, v48);
    v21 = (double *)&v49;
  }
  else
  {
    v20 = self->_normalSidePadding;
    v21 = &self->_normalVerticalPadding;
  }
  (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v16 + 2))(v16, 0, 0, width, height, v20, *v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDefaultLayoutRule:forState:", v22, 1);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v46);
    v23 = v47;
    _LayoutConstants_2(self->_device, v44);
    v24.n128_u64[0] = v45;
  }
  else
  {
    v23 = NTKKeylineWidth() + self->_deselectedKeylineSideInnerPadding;
    v24.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineVerticalInnerPadding;
  }
  (*((void (**)(id, uint64_t, _QWORD, double, double, double, __n128))v16 + 2))(v16, 1, 0, width, height, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDefaultLayoutRule:forState:", v25, 2);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v42);
    v26 = v43;
    _LayoutConstants_2(self->_device, v40);
    v27.n128_u64[0] = v41;
  }
  else
  {
    v26 = NTKKeylineWidth() + self->_selectedKeylineSideInnerPadding;
    NTKUtilityComplicationSelectedMaxHeight(self->_device);
    CLKFloorForDevice();
    v27.n128_u64[0] = v28;
  }
  (*((void (**)(id, uint64_t, uint64_t, double, double, double, __n128))v16 + 2))(v16, 1, 1, width, height + self->_selectedKeylineVerticalInnerContentSpacer * 2.0, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDefaultLayoutRule:forState:", v29, 3);

  if (v9)
  {
    v30 = NTKUtilityComplicationCircularDiameter(self->_device);
    v31 = NTKUtilityComplicationCircularDiameter(self->_device);
    (*((void (**)(id, _QWORD, _QWORD, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v32, 0, 2);

    (*((void (**)(id, _QWORD, _QWORD, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v33, 1, 2);

    if (v10)
    {
      v35 = self->_normalCircularPadding.width;
      v34.n128_u64[0] = *(_QWORD *)&self->_normalCircularPadding.height;
    }
    else
    {
      v35 = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
      v34.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
    }
    (*((void (**)(id, uint64_t, _QWORD, double, double, double, __n128))v16 + 2))(v16, 1, 0, v30, v31, v35, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v36, 2, 2);

    if (v10)
    {
      (*((void (**)(id, uint64_t, uint64_t, double, double, CGFloat, CGFloat))v16 + 2))(v16, 1, 1, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v39, "defaultLayoutRuleForState:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v38, "copy");

      objc_msgSend(v37, "setVerticalLayout:", 4);
    }
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v37, 3, 2);

  }
}

- (void)_configureOverridesForLayout:(id)a3 withNormalSize:(CGSize)a4 editingSize:(CGSize)a5 variant:(BOOL)a6 addCircleOverrides:(BOOL)a7 makeRuleBlock:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  double height;
  double width;
  double v13;
  double v14;
  id v16;
  double normalSidePadding;
  double *p_normalVerticalPadding;
  void *v19;
  double v20;
  double *v21;
  void *v22;
  double v23;
  __n128 v24;
  void *v25;
  double v26;
  __n128 v27;
  unint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  __n128 v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _BYTE v40[48];
  unint64_t v41;
  _BYTE v42[40];
  double v43;
  _BYTE v44[48];
  unint64_t v45;
  _BYTE v46[40];
  double v47;
  _BYTE v48[48];
  uint64_t v49;
  _BYTE v50[40];
  double v51;
  _BYTE v52[48];
  uint64_t v53;
  _BYTE v54[40];
  double v55;

  v9 = a7;
  v10 = a6;
  height = a5.height;
  width = a5.width;
  v13 = a4.height;
  v14 = a4.width;
  v39 = a3;
  v16 = a8;
  if (v10)
  {
    _LayoutConstants_2(self->_device, v54);
    normalSidePadding = v55;
    _LayoutConstants_2(self->_device, v52);
    p_normalVerticalPadding = (double *)&v53;
  }
  else
  {
    normalSidePadding = self->_normalSidePadding;
    p_normalVerticalPadding = &self->_normalVerticalPadding;
  }
  (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v16 + 2))(v16, 0, 0, v14, v13, normalSidePadding, *p_normalVerticalPadding);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v19, 0, 1);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v50);
    v20 = v51;
    _LayoutConstants_2(self->_device, v48);
    v21 = (double *)&v49;
  }
  else
  {
    v20 = self->_normalSidePadding;
    v21 = &self->_normalVerticalPadding;
  }
  (*((void (**)(id, _QWORD, _QWORD, double, double, double, double))v16 + 2))(v16, 0, 0, width, height, v20, *v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v22, 1, 1);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v46);
    v23 = v47;
    _LayoutConstants_2(self->_device, v44);
    v24.n128_u64[0] = v45;
  }
  else
  {
    v23 = NTKKeylineWidth() + self->_deselectedKeylineSideInnerPadding;
    v24.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineVerticalInnerPadding;
  }
  (*((void (**)(id, uint64_t, _QWORD, double, double, double, __n128))v16 + 2))(v16, 1, 0, width, height, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v25, 2, 1);

  if (v10)
  {
    _LayoutConstants_2(self->_device, v42);
    v26 = v43;
    _LayoutConstants_2(self->_device, v40);
    v27.n128_u64[0] = v41;
  }
  else
  {
    v26 = NTKKeylineWidth() + self->_selectedKeylineSideInnerPadding;
    NTKUtilityComplicationSelectedMaxHeight(self->_device);
    CLKFloorForDevice();
    v27.n128_u64[0] = v28;
  }
  (*((void (**)(id, uint64_t, uint64_t, double, double, double, __n128))v16 + 2))(v16, 1, 1, width, height + self->_selectedKeylineVerticalInnerContentSpacer * 2.0, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v29, 3, 1);

  if (v9)
  {
    v30 = NTKUtilityComplicationCircularDiameter(self->_device);
    v31 = NTKUtilityComplicationCircularDiameter(self->_device);
    (*((void (**)(id, _QWORD, _QWORD, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v32, 0, 2);

    (*((void (**)(id, _QWORD, _QWORD, double, double, CGFloat, CGFloat))v16 + 2))(v16, 0, 0, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v33, 1, 2);

    if (v10)
    {
      v35 = self->_normalCircularPadding.width;
      v34.n128_u64[0] = *(_QWORD *)&self->_normalCircularPadding.height;
    }
    else
    {
      v35 = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
      v34.n128_f64[0] = NTKKeylineWidth() + self->_deselectedKeylineCircularInnerPadding;
    }
    (*((void (**)(id, uint64_t, _QWORD, double, double, double, __n128))v16 + 2))(v16, 1, 0, v30, v31, v35, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v36, 2, 2);

    if (v10)
    {
      (*((void (**)(id, uint64_t, uint64_t, double, double, CGFloat, CGFloat))v16 + 2))(v16, 1, 1, v30, v31, self->_normalCircularPadding.width, self->_normalCircularPadding.height);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v39, "defaultLayoutRuleForState:", 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v38, "copy");

      objc_msgSend(v37, "setVerticalLayout:", 4);
    }
    objc_msgSend(v39, "setOverrideLayoutRule:forState:layoutOverride:", v37, 3, 2);

  }
}

- (double)_maxTopCornerWidthLeavingRoomForKeylines:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  _QWORD v8[33];

  _LayoutConstants_2(self->_device, v8);
  CLKFloorForDevice();
  v5 = v4;
  -[NTKUtilityComplicationFactory _maxWidthForKeylineAndPadding](self, "_maxWidthForKeylineAndPadding");
  return v5 - v6;
}

- (double)_maxBottomCornerWidthLeavingRoomForKeylines:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  _QWORD v8[33];

  _LayoutConstants_2(self->_device, v8);
  CLKFloorForDevice();
  v5 = v4;
  -[NTKUtilityComplicationFactory _maxWidthForKeylineAndPadding](self, "_maxWidthForKeylineAndPadding");
  return v5 - v6;
}

- (double)_maxBottomCenterWidthLeavingRoomForKeylines:(CGRect)a3
{
  double width;
  double v4;

  width = a3.size.width;
  -[NTKUtilityComplicationFactory _maxWidthForKeylineAndPadding](self, "_maxWidthForKeylineAndPadding", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return width - v4;
}

- (double)_maxDateWidthLeavingRoomForKeylines
{
  double dateKeylineMaxWidth;
  double v3;

  dateKeylineMaxWidth = self->_dateKeylineMaxWidth;
  -[NTKUtilityComplicationFactory _maxWidthForKeylineAndPadding](self, "_maxWidthForKeylineAndPadding");
  return dateKeylineMaxWidth - v3;
}

- (double)_maxWidthForKeylineAndPadding
{
  double selectedKeylineSideInnerPadding;
  double v3;

  if (self->_selectedKeylineSideInnerPadding >= self->_deselectedKeylineSideInnerPadding)
    selectedKeylineSideInnerPadding = self->_selectedKeylineSideInnerPadding;
  else
    selectedKeylineSideInnerPadding = self->_deselectedKeylineSideInnerPadding;
  v3 = NTKKeylineWidth();
  return selectedKeylineSideInnerPadding + v3 + selectedKeylineSideInnerPadding + v3;
}

- (int64_t)complicationPickerStyleForSlot:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bezel")))
    return 2;
  else
    return 1;
}

- (void)configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NTKUtilityComplicationFactory dialDiameter](self, "dialDiameter");
  -[NTKUtilityComplicationFactory configureComplicationView:forSlot:dialDiameter:](self, "configureComplicationView:forSlot:dialDiameter:", v13, v6);
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1F8E9F8C0))
  {
    v7 = v13;
    -[NTKUtilityComplicationFactory faceView](self, "faceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1F8EBD180);

    if (v9)
    {
      -[NTKUtilityComplicationFactory faceView](self, "faceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", v10);

    }
  }
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1F8E2C218))
  {
    v11 = v13;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
    {
      v12 = 2;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("bottom-right")))
      {
LABEL_15:

        goto LABEL_16;
      }
      v12 = 3;
    }
    objc_msgSend(v11, "setCornerComplicationPosition:", v12);
    goto LABEL_15;
  }
LABEL_16:

}

- (id)keylineViewForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  CLKDevice *device;
  _BOOL8 usesNarrowTopSlots;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (!self->_graphicCornerComplications)
    goto LABEL_11;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("top-left")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("top-right")))
    {
      device = self->_device;
      usesNarrowTopSlots = self->_usesNarrowTopSlots;
      v8 = 1;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("bottom-left")))
    {
      device = self->_device;
      usesNarrowTopSlots = self->_usesNarrowTopSlots;
      v8 = 2;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("bottom-right")))
    {
      device = self->_device;
      usesNarrowTopSlots = self->_usesNarrowTopSlots;
      v8 = 3;
      goto LABEL_10;
    }
LABEL_11:
    -[NTKUtilityComplicationFactory keylineViewForSlot:dialDiameter:](self, "keylineViewForSlot:dialDiameter:", -[NTKUtilityComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v5), self->_bezelKeylineDiameter);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  device = self->_device;
  usesNarrowTopSlots = self->_usesNarrowTopSlots;
  v8 = 0;
LABEL_10:
  +[NTKRichComplicationCornerUtilities keylineViewForPosition:forDevice:narrowTopSlots:](NTKRichComplicationCornerUtilities, "keylineViewForPosition:forDevice:narrowTopSlots:", v8, device, usesNarrowTopSlots);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v10 = (void *)v9;

  return v10;
}

- (int64_t)legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return -[NTKUtilityComplicationFactory layoutOverrideForComplicationType:inSlot:](self, "layoutOverrideForComplicationType:inSlot:", a3, -[NTKUtilityComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", a4));
}

- (unint64_t)layoutStyleForSlot:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("bezel"));
}

- (void)curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  __CFString *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat MidX;
  CGFloat MidY;
  __CFString *v28;
  CGRect v29;
  CGRect v30;

  v13 = (__CFString *)a8;
  if (CFSTR("bezel") == v13)
  {
    v28 = v13;
    if (a3)
    {
      -[NTKUtilityComplicationFactory dialDiameter](self, "dialDiameter");
      -[NTKUtilityComplicationFactory bezelComplicationRadiusWithDialDiameter:](self, "bezelComplicationRadiusWithDialDiameter:", v14 + v14);
      v13 = v28;
      *(_QWORD *)a3 = v15;
    }
    if (a5)
    {
      -[NTKUtilityComplicationFactory bezelComplicationMaxAngularWidth](self, "bezelComplicationMaxAngularWidth");
      v13 = v28;
      *(_QWORD *)a5 = v16;
    }
    if (a6)
    {
      -[NTKUtilityComplicationFactory faceView](self, "faceView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      v29.origin.x = v19;
      v29.origin.y = v21;
      v29.size.width = v23;
      v29.size.height = v25;
      MidX = CGRectGetMidX(v29);
      v30.origin.x = v19;
      v30.origin.y = v21;
      v30.size.width = v23;
      v30.size.height = v25;
      MidY = CGRectGetMidY(v30);
      v13 = v28;
      a6->x = MidX;
      a6->y = MidY;
    }
    if (a7)
      *a7 = 0;
  }

}

- (void)loadLayoutRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  id v9;

  -[NTKUtilityComplicationFactory faceView](self, "faceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationLayoutforSlot:", CFSTR("bezel"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NTKUtilityComplicationFactory faceView](self, "faceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:bounds:dialDiameter:](self, "configureComplicationLayout:forSlot:bounds:dialDiameter:", v9, 11);

  if (-[NTKUtilityComplicationFactory includesDateComplicationLayoutRules](self, "includesDateComplicationLayoutRules"))
  {
    -[NTKUtilityComplicationFactory faceView](self, "faceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complicationLayoutforSlot:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NTKUtilityComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", CFSTR("date"));
    -[NTKUtilityComplicationFactory faceView](self, "faceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self, "configureComplicationLayout:forSlot:withBounds:", v6, v7);

  }
}

- (id)newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = -[NTKUtilityComplicationFactory newViewForComplication:family:forSlot:](self, "newViewForComplication:family:forSlot:", v8, a4, -[NTKUtilityComplicationFactory _utilitySlotForSlot:](self, "_utilitySlotForSlot:", a5));

  return v9;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bezel")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-center")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-right")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("date")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0xB && ((0xA0Fu >> v3) & 1) != 0)
    v4 = *off_1E6BCF000[v3];
  else
    v4 = 0;
  return v4;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NTKUtilityComplicationFactoryDelegate)delegate
{
  return (NTKUtilityComplicationFactoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)graphicCornerComplications
{
  return self->_graphicCornerComplications;
}

- (void)setGraphicCornerComplications:(BOOL)a3
{
  self->_graphicCornerComplications = a3;
}

- (BOOL)usesNarrowTopSlots
{
  return self->_usesNarrowTopSlots;
}

- (void)setUsesNarrowTopSlots:(BOOL)a3
{
  self->_usesNarrowTopSlots = a3;
}

- (BOOL)accommodatesTwoTopComplications
{
  return self->_accommodatesTwoTopComplications;
}

- (void)setAccommodatesTwoTopComplications:(BOOL)a3
{
  self->_accommodatesTwoTopComplications = a3;
}

- (double)normalSidePadding
{
  return self->_normalSidePadding;
}

- (void)setNormalSidePadding:(double)a3
{
  self->_normalSidePadding = a3;
}

- (double)normalVerticalPadding
{
  return self->_normalVerticalPadding;
}

- (void)setNormalVerticalPadding:(double)a3
{
  self->_normalVerticalPadding = a3;
}

- (CGSize)normalCircularPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_normalCircularPadding.width;
  height = self->_normalCircularPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNormalCircularPadding:(CGSize)a3
{
  self->_normalCircularPadding = a3;
}

- (double)deselectedKeylineSideInnerPadding
{
  return self->_deselectedKeylineSideInnerPadding;
}

- (void)setDeselectedKeylineSideInnerPadding:(double)a3
{
  self->_deselectedKeylineSideInnerPadding = a3;
}

- (double)deselectedKeylineVerticalInnerPadding
{
  return self->_deselectedKeylineVerticalInnerPadding;
}

- (void)setDeselectedKeylineVerticalInnerPadding:(double)a3
{
  self->_deselectedKeylineVerticalInnerPadding = a3;
}

- (double)deselectedKeylineCircularInnerPadding
{
  return self->_deselectedKeylineCircularInnerPadding;
}

- (void)setDeselectedKeylineCircularInnerPadding:(double)a3
{
  self->_deselectedKeylineCircularInnerPadding = a3;
}

- (double)selectedKeylineSideInnerPadding
{
  return self->_selectedKeylineSideInnerPadding;
}

- (void)setSelectedKeylineSideInnerPadding:(double)a3
{
  self->_selectedKeylineSideInnerPadding = a3;
}

- (double)selectedKeylineVerticalInnerContentSpacer
{
  return self->_selectedKeylineVerticalInnerContentSpacer;
}

- (void)setSelectedKeylineVerticalInnerContentSpacer:(double)a3
{
  self->_selectedKeylineVerticalInnerContentSpacer = a3;
}

- (double)selectedKeylineHeight
{
  return self->_selectedKeylineHeight;
}

- (void)setSelectedKeylineHeight:(double)a3
{
  self->_selectedKeylineHeight = a3;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (double)foregroundImageAlpha
{
  return self->_foregroundImageAlpha;
}

- (void)setForegroundImageAlpha:(double)a3
{
  self->_foregroundImageAlpha = a3;
}

- (double)maxNormalLongWidth
{
  return self->_maxNormalLongWidth;
}

- (void)setMaxNormalLongWidth:(double)a3
{
  self->_maxNormalLongWidth = a3;
}

- (UIEdgeInsets)screenEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_screenEdgeInsets.top;
  left = self->_screenEdgeInsets.left;
  bottom = self->_screenEdgeInsets.bottom;
  right = self->_screenEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setScreenEdgeInsets:(UIEdgeInsets)a3
{
  self->_screenEdgeInsets = a3;
}

- (double)crownIndicatorGap
{
  return self->_crownIndicatorGap;
}

- (void)setCrownIndicatorGap:(double)a3
{
  self->_crownIndicatorGap = a3;
}

- (CLKFont)topBezelLabelFont
{
  return self->_topBezelLabelFont;
}

- (void)setTopBezelLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_topBezelLabelFont, a3);
}

- (double)bezelLabelMaxWidthInDegree
{
  return self->_bezelLabelMaxWidthInDegree;
}

- (void)setBezelLabelMaxWidthInDegree:(double)a3
{
  self->_bezelLabelMaxWidthInDegree = a3;
}

- (double)bezelLabelTopPadding
{
  return self->_bezelLabelTopPadding;
}

- (void)setBezelLabelTopPadding:(double)a3
{
  self->_bezelLabelTopPadding = a3;
}

- (double)bezelKeylineInnerCircleOffset
{
  return self->_bezelKeylineInnerCircleOffset;
}

- (void)setBezelKeylineInnerCircleOffset:(double)a3
{
  self->_bezelKeylineInnerCircleOffset = a3;
}

- (double)bezelKeylineDiameter
{
  return self->_bezelKeylineDiameter;
}

- (void)setBezelKeylineDiameter:(double)a3
{
  self->_bezelKeylineDiameter = a3;
}

- (double)dialDiameter
{
  return self->_dialDiameter;
}

- (void)setDialDiameter:(double)a3
{
  self->_dialDiameter = a3;
}

- (NTKFaceView)faceView
{
  return (NTKFaceView *)objc_loadWeakRetained((id *)&self->_faceView);
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);
}

- (double)dateKeylineMaxWidth
{
  return self->_dateKeylineMaxWidth;
}

- (void)setDateKeylineMaxWidth:(double)a3
{
  self->_dateKeylineMaxWidth = a3;
}

- (double)dateHorizontalCenterOffset
{
  return self->_dateHorizontalCenterOffset;
}

- (void)setDateHorizontalCenterOffset:(double)a3
{
  self->_dateHorizontalCenterOffset = a3;
}

- (double)dateVerticalCenterOffset
{
  return self->_dateVerticalCenterOffset;
}

- (void)setDateVerticalCenterOffset:(double)a3
{
  self->_dateVerticalCenterOffset = a3;
}

- (BOOL)includesDateComplicationLayoutRules
{
  return self->_includesDateComplicationLayoutRules;
}

- (void)setIncludesDateComplicationLayoutRules:(BOOL)a3
{
  self->_includesDateComplicationLayoutRules = a3;
}

- (int64_t)bottomCenterLayout
{
  return self->_bottomCenterLayout;
}

- (void)setBottomCenterLayout:(int64_t)a3
{
  self->_bottomCenterLayout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_topBezelLabelFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
