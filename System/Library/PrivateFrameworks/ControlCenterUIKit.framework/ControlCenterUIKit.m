CGFloat CCUISliderExpandedContentModuleHeight()
{
  CGFloat result;

  if (CCUISliderExpandedContentModuleHeight_onceToken != -1)
    dispatch_once(&CCUISliderExpandedContentModuleHeight_onceToken, &__block_literal_global_8);
  result = CCUIMaximumExpandedContentModuleHeight();
  if (result >= *(double *)&CCUISliderExpandedContentModuleHeight_height)
    return *(double *)&CCUISliderExpandedContentModuleHeight_height;
  return result;
}

CGFloat CCUIMaximumExpandedContentModuleHeight()
{
  char ShouldBePortrait;
  double v1;
  double v2;
  double v3;
  CGRect v5;

  ShouldBePortrait = CCUILayoutShouldBePortrait(0);
  v1 = CCUILayoutEdgeInsetsForcePortrait(ShouldBePortrait);
  v3 = v2;
  v5.origin.x = CCUIScreenBounds();
  return CGRectGetHeight(v5) - v1 - v3;
}

double CCUIExpandedModuleEdgeInsets()
{
  char ShouldBePortrait;

  ShouldBePortrait = CCUILayoutShouldBePortrait(0);
  return CCUILayoutEdgeInsetsForcePortrait(ShouldBePortrait);
}

double CCUIEdgeInsetsRTLSwap(double a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceLayoutDirection");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceLayoutDirection");

  return a1;
}

double CCUICompactModuleContinuousCornerRadius()
{
  if (CCUICompactModuleContinuousCornerRadius_onceToken != -1)
    dispatch_once(&CCUICompactModuleContinuousCornerRadius_onceToken, &__block_literal_global_5);
  return *(double *)&CCUICompactModuleContinuousCornerRadius_radius;
}

double CCUIDefaultExpandedContentModuleWidth()
{
  double v0;
  double v1;

  CCUILayoutEdgeInsetsForcePortrait(1);
  return CCUIDefaultExpandedContentModuleFullWidth() - v0 - v1;
}

double CCUIDefaultExpandedContentModuleFullWidth()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 ShouldBePortrait;
  double v10;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    CCUILayoutEdgeInsetsForcePortrait(1);
    v3 = v2;
    v5 = v4;
    v6 = CCUIPortraitMainListGridGeometryInfo();
    CCUIPortraitMainListGridGeometryInfo();
    return v5 + v3 + v7 * 3.0 + v6 * 4.0;
  }
  else
  {
    ShouldBePortrait = CCUILayoutShouldBePortrait(0);
    v10 = CCUIScreenBounds();
    if (ShouldBePortrait)
      return CGRectGetWidth(*(CGRect *)&v10);
    else
      return CGRectGetHeight(*(CGRect *)&v10);
  }
}

BOOL CCUILayoutShouldBePortrait(void *a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double Height;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  if (CGRectIsEmpty(v15))
  {
    v3 = CCUIScreenBounds();
    v5 = v10;
    v7 = v11;
    v9 = v12;
  }
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  Height = CGRectGetHeight(v16);
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  return Height > CGRectGetWidth(v17);
}

double CCUIScreenBounds()
{
  uint64_t v0;
  double v1;
  CGAffineTransform v3;
  CGAffineTransform v4;
  CGRect v5;

  v0 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation");
  switch(v0)
  {
    case 1:
      v1 = 0.0;
      break;
    case 3:
      v1 = 1.57079633;
      break;
    case 4:
      v1 = -1.57079633;
      break;
    default:
      v1 = 3.14159265;
      if (v0 != 2)
        v1 = 0.0;
      break;
  }
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformMakeRotation(&v4, v1);
  v5.origin.x = CCUIReferenceScreenBounds();
  v3 = v4;
  CGRectApplyAffineTransform(v5, &v3);
  UIRectIntegralWithScale();
  return *MEMORY[0x1E0C9D538];
}

double CCUILayoutEdgeInsetsForcePortrait(char a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  BOOL v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  if ((a1 & 1) != 0 || CCUILayoutShouldBePortrait(0))
  {
    v15.origin.x = CCUIReferenceScreenBounds();
    Width = CGRectGetWidth(v15);
    if (Width < 1024.0
      || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v1, "userInterfaceIdiom") != 1)
      || (v6 = 27.0, SBFEffectiveHomeButtonType() == 2))
    {
      v16.origin.x = CCUIReferenceScreenBounds();
      v7 = CGRectGetWidth(v16);
      if (v7 < 1024.0
        || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v2, "userInterfaceIdiom") != 1)
        || SBFEffectiveHomeButtonType() != 2)
      {
        v17.origin.x = CCUIReferenceScreenBounds();
        v8 = CGRectGetWidth(v17);
        if (v8 < 834.0
          || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "userInterfaceIdiom") != 1)
          || (v6 = 20.0, SBFEffectiveHomeButtonType() != 2))
        {
          v18.origin.x = CCUIReferenceScreenBounds();
          v9 = CGRectGetWidth(v18);
          if (v9 < 834.0
            || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
                v4 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v4, "userInterfaceIdiom") != 1)
            || (v6 = 20.0, SBFEffectiveHomeButtonType() == 2))
          {
            objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = 20.0;
            if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
              goto LABEL_56;
            v19.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v19) >= 430.0)
            {
              v6 = 64.0;
              goto LABEL_56;
            }
            v20.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v20) >= 428.0)
            {
              v6 = 64.0;
              goto LABEL_56;
            }
            v21.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v21) >= 414.0 && SBFEffectiveHomeButtonType() == 2
              || (v22.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v22) >= 414.0))
            {
              v6 = 64.0;
              goto LABEL_56;
            }
            v23.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v23) >= 393.0
              || (v24.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v24) >= 390.0)
              || (v25.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v25) >= 375.0)
              && SBFEffectiveHomeButtonType() == 2)
            {
              v6 = 64.0;
              goto LABEL_56;
            }
            v37.origin.x = CCUIReferenceScreenBounds();
            v12 = CGRectGetWidth(v37) < 375.0;
            v13 = 64.0;
            v14 = 56.0;
            goto LABEL_68;
          }
          goto LABEL_57;
        }
        goto LABEL_59;
      }
LABEL_32:

      v6 = 27.0;
      if (Width < 1024.0)
        return v6;
    }
LABEL_63:

    return v6;
  }
  v26.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v26);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "userInterfaceIdiom") == 1)
    {
      v6 = 27.0;
      if (SBFEffectiveHomeButtonType() != 2)
        goto LABEL_63;
    }
  }
  v27.origin.x = CCUIReferenceScreenBounds();
  v7 = CGRectGetWidth(v27);
  if (v7 >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      goto LABEL_32;
  }
  v28.origin.x = CCUIReferenceScreenBounds();
  v8 = CGRectGetWidth(v28);
  if (v8 < 834.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "userInterfaceIdiom") != 1)
    || (v6 = 20.0, SBFEffectiveHomeButtonType() != 2))
  {
    v29.origin.x = CCUIReferenceScreenBounds();
    v9 = CGRectGetWidth(v29);
    if (v9 < 834.0
      || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "userInterfaceIdiom") != 1)
      || (v6 = 20.0, SBFEffectiveHomeButtonType() == 2))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 20.0;
      if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
        goto LABEL_56;
      v30.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v30) >= 430.0)
      {
        v6 = 37.0;
        goto LABEL_56;
      }
      v31.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v31) >= 428.0)
      {
        v6 = 36.0;
        goto LABEL_56;
      }
      v32.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v32) >= 414.0 && SBFEffectiveHomeButtonType() == 2
        || (v33.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v33) >= 414.0))
      {
        v6 = 34.0;
        goto LABEL_56;
      }
      v34.origin.x = CCUIReferenceScreenBounds();
      v6 = 30.0;
      if (CGRectGetWidth(v34) >= 393.0 || (v35.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v35) >= 390.0))
      {
LABEL_56:

        if (v9 < 834.0)
          goto LABEL_58;
        goto LABEL_57;
      }
      v36.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v36) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
      {
        v6 = 27.0;
        goto LABEL_56;
      }
      v38.origin.x = CCUIReferenceScreenBounds();
      v12 = CGRectGetWidth(v38) < 375.0;
      v13 = 27.0;
      v14 = 16.0;
LABEL_68:
      if (v12)
        v6 = v14;
      else
        v6 = v13;
      goto LABEL_56;
    }
LABEL_57:

LABEL_58:
    if (v8 < 834.0)
      goto LABEL_60;
  }
LABEL_59:

LABEL_60:
  if (v7 >= 1024.0)

  if (Width >= 1024.0)
    goto LABEL_63;
  return v6;
}

double CCUIReferenceScreenBounds()
{
  if (CCUIReferenceScreenBounds_onceToken != -1)
    dispatch_once(&CCUIReferenceScreenBounds_onceToken, &__block_literal_global);
  return *(double *)&CCUIReferenceScreenBounds___referenceScreenBounds_0;
}

double CCUISliderExpandedContentModuleWidth()
{
  if (CCUISliderExpandedContentModuleWidth_onceToken != -1)
    dispatch_once(&CCUISliderExpandedContentModuleWidth_onceToken, &__block_literal_global_7);
  return *(double *)&CCUISliderExpandedContentModuleWidth_width;
}

double CCUIExpandedModuleContinuousCornerRadius()
{
  if (CCUIExpandedModuleContinuousCornerRadius_onceToken != -1)
    dispatch_once(&CCUIExpandedModuleContinuousCornerRadius_onceToken, &__block_literal_global_6);
  return *(double *)&CCUIExpandedModuleContinuousCornerRadius_radius;
}

uint64_t CCUISignpostImpulse(NSObject *a1)
{
  uint8_t v3[16];

  if (os_signpost_enabled(a1))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D02ED000, a1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "signpost", " enableTelemetry=YES ", v3, 2u);
  }
  return kdebug_trace();
}

CGAffineTransform *CCUIAffineTransformBetweenInterfaceOrientations@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v3;
  double v4;

  v3 = 0.0;
  v4 = 0.0;
  if (a2 != 1)
  {
    if (a2 == 3)
    {
      v4 = 1.57079633;
    }
    else if (a2 == 4)
    {
      v4 = -1.57079633;
    }
    else
    {
      v4 = 3.14159265;
      if (a2 != 2)
        v4 = 0.0;
    }
  }
  if (a1 != 1)
  {
    if (a1 == 3)
    {
      v3 = 1.57079633;
    }
    else if (a1 == 4)
    {
      v3 = -1.57079633;
    }
    else
    {
      v3 = 3.14159265;
      if (a1 != 2)
        v3 = 0.0;
    }
  }
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  return CGAffineTransformMakeRotation((CGAffineTransform *)a3, v4 - v3);
}

double CCUIScreenSafeAreaInsets()
{
  if (CCUIScreenSafeAreaInsets_onceToken != -1)
    dispatch_once(&CCUIScreenSafeAreaInsets_onceToken, &__block_literal_global_1);
  return *(double *)&CCUIScreenSafeAreaInsets___screenSafeAreaInsets_0;
}

BOOL CCUIIsPortrait()
{
  return CCUILayoutShouldBePortrait(0);
}

double CCUIPortraitMainListGridGeometryInfo()
{
  if (CCUIPortraitMainListGridGeometryInfo_onceToken != -1)
    dispatch_once(&CCUIPortraitMainListGridGeometryInfo_onceToken, &__block_literal_global_3);
  return *(double *)&CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_0;
}

double CCUIPortraitGridLayoutSideMargin()
{
  if (CCUIPortraitGridLayoutSideMargin_onceToken != -1)
    dispatch_once(&CCUIPortraitGridLayoutSideMargin_onceToken, &__block_literal_global_13);
  return *(double *)&CCUIPortraitGridLayoutSideMargin_margin;
}

uint64_t CCUICompactModuleColumns()
{
  return 4;
}

double CCUICalculateGridGeometryInfo(unint64_t a1, double a2, double a3)
{
  double v3;

  v3 = round(a2 / ((double)a1 + ((double)a1 + -1.0) * a3));
  UIFloorToScale();
  return v3;
}

double CCUILayoutGutter()
{
  double v0;

  CCUIPortraitMainListGridGeometryInfo();
  return v0;
}

double CCUICompactModuleContinuousCornerRadiusForGridSizeClass(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  double v6;

  v3 = a1 - 1;
  if ((unint64_t)(a1 - 1) >= 0xA)
  {
    v6 = 0.5;
  }
  else
  {
    v4 = word_1D03216E6[v3];
    v5 = word_1D03216C0[v3];
    if (v5 >= v4)
      v5 = v4;
    if (v5 > 1)
    {
      a2 = a3 + a2 * 2.0;
      v6 = 0.2;
    }
    else
    {
      v6 = 0.35;
    }
  }
  return a2 * v6;
}

uint64_t CCUINumberOfColumnsForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 8)
    return 1;
  else
    return word_1D03216D4[a1 - 2];
}

uint64_t CCUINumberOfRowsForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 1;
  else
    return word_1D03216E6[a1 - 1];
}

double CCUISliderExpandedModuleContinuousCornerRadius()
{
  if (CCUISliderExpandedContentModuleWidth_onceToken != -1)
    dispatch_once(&CCUISliderExpandedContentModuleWidth_onceToken, &__block_literal_global_7);
  return *(double *)&CCUISliderExpandedContentModuleWidth_width * 0.35;
}

double CCUIAlertCompactPresentationTopMarginForOrientation(uint64_t a1)
{
  uint64_t *v1;

  if ((unint64_t)(a1 - 1) >= 2)
  {
    if (CCUIAlertCompactPresentationTopMarginForOrientation_onceToken != -1)
      dispatch_once(&CCUIAlertCompactPresentationTopMarginForOrientation_onceToken, &__block_literal_global_9);
    v1 = &CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait;
  }
  else
  {
    if (CCUIAlertCompactPresentationTopMarginForOrientation_onceToken_10 != -1)
      dispatch_once(&CCUIAlertCompactPresentationTopMarginForOrientation_onceToken_10, &__block_literal_global_11);
    v1 = &CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape;
  }
  return *(double *)v1;
}

double CCUIAlertCompactPresentationMargin()
{
  if (CCUIAlertCompactPresentationMargin_onceToken != -1)
    dispatch_once(&CCUIAlertCompactPresentationMargin_onceToken, &__block_literal_global_12);
  return *(double *)&CCUIAlertCompactPresentationMargin_defaultMargin;
}

uint64_t CCUICompactModuleRows()
{
  return 8;
}

double CCUISliderPreviewRenderingModeValue()
{
  return 0.5;
}

__CFString *NSStringFromCCUIContentRenderingMode(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("Live");
  if (a1 == 1)
  {
    v1 = CFSTR("Preview");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double _CCUIRoundButtonSize()
{
  if (_CCUIRoundButtonSize_onceToken[0] != -1)
    dispatch_once(_CCUIRoundButtonSize_onceToken, &__block_literal_global_0);
  return *(double *)&_CCUIRoundButtonSize_size;
}

void sub_1D02FCA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D02FCDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CCUIGridSizeClassMaskAll()
{
  return 2015;
}

const __CFString *NSStringFromCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return CFSTR("CCUIGridSizeClassSmall");
  else
    return off_1E8E209D0[a1 - 1];
}

void CCUIEnumerateGridSizeClassesWithBlock(_QWORD *a1)
{
  void (*v2)(void);
  _QWORD *v3;

  v2 = (void (*)(void))a1[2];
  v3 = a1;
  v2();
  ((void (*)(id, uint64_t))a1[2])(v3, 1);
  ((void (*)(id, uint64_t))a1[2])(v3, 2);
  ((void (*)(id, uint64_t))a1[2])(v3, 3);
  ((void (*)(id, uint64_t))a1[2])(v3, 4);
  ((void (*)(id, uint64_t))a1[2])(v3, 5);
  ((void (*)(id, uint64_t))a1[2])(v3, 6);
  ((void (*)(id, uint64_t))a1[2])(v3, 7);
  ((void (*)(id, uint64_t))a1[2])(v3, 8);
  ((void (*)(id, uint64_t))a1[2])(v3, 9);
  ((void (*)(id, uint64_t))a1[2])(v3, 10);

}

uint64_t CCUIGridSizeClassMaskForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 1;
  else
    return qword_1D0321748[a1 - 1];
}

uint64_t CCUIAdjustGridSizeClassForAccessibility(uint64_t result, int a2)
{
  if (a2)
  {
    if (result == 2)
    {
      return 3;
    }
    else if (result == 4)
    {
      return 5;
    }
  }
  else if (result == 3)
  {
    return 2;
  }
  else if (result == 5)
  {
    return 4;
  }
  return result;
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return 21;
}

void sub_1D030439C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D030484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0305160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0308B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D030926C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NSStringFromCCUIGridGeometryInfo(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unitDimension: %0.3f, unitSpacing: %0.3f)"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

BOOL CCUIGridGeometryInfoEqualToInfo(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL CCUIFeatureEnabled(uint64_t a1)
{
  return +[CCUIFeatures isFeatureEnabled:](CCUIFeatures, "isFeatureEnabled:", a1);
}

void CCUIRegisterControlCenterLogging()
{
  if (CCUIRegisterControlCenterLogging_onceToken != -1)
    dispatch_once(&CCUIRegisterControlCenterLogging_onceToken, &__block_literal_global_2);
}

__CFString *NSStringFromCCUIBaseSliderViewBehaviorIdentifier(unint64_t a1)
{
  if (a1 < 3)
    return off_1E8E20C00[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_1D030D3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

char *sub_1D030F51C(void *a1)
{
  void *v1;
  id v3;
  objc_class *v4;
  char *v5;
  id v6;
  id v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v3 = objc_msgSend(v1, sel_initWithFrame_);
  v4 = (objc_class *)_s22ButtonGlyphWrapperViewCMa();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView] = a1;
  v6 = v3;
  v7 = a1;
  v8 = (char *)v6;
  v9 = v7;
  objc_msgSend(v9, sel_bounds);
  v13.receiver = v5;
  v13.super_class = v4;
  v10 = objc_msgSendSuper2(&v13, sel_initWithFrame_);
  objc_msgSend(v10, sel_addSubview_, v9);

  objc_msgSend(v8, sel_setGlyphView_, v10);
  v11 = *(void **)&v8[OBJC_IVAR___CCUIControlTemplateView_customGlyphView];
  *(_QWORD *)&v8[OBJC_IVAR___CCUIControlTemplateView_customGlyphView] = v9;

  return v8;
}

void __swiftcall CCUIControlTemplateView.init(frame:)(CCUIControlTemplateView *__return_ptr retstr, CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

id CCUIControlTemplateView.init(frame:)(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_backgroundView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_customGlyphView] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView] = 0;
  v9 = &v4[OBJC_IVAR___CCUIControlTemplateView_title];
  *v9 = 0;
  v9[1] = 0;
  v10 = &v4[OBJC_IVAR___CCUIControlTemplateView_subtitle];
  *v10 = 0;
  v10[1] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isRedacted] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isResizing] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView__isExpanded] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius] = 0;
  v4[OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders] = 0;
  *(_QWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction] = 0;
  *(_OWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels] = xmmword_1D03217E0;
  *(_OWORD *)&v4[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels] = xmmword_1D03217E0;
  v4[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = 0;
  v17.receiver = v4;
  v17.super_class = (Class)CCUIControlTemplateView;
  v11 = objc_msgSendSuper2(&v17, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v11, sel_primaryActionTriggered, 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC115F8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1D03217F0;
  v13 = sub_1D031D514();
  v14 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v14;
  v15 = v11;
  MEMORY[0x1D17DFFB8](v12, sel_didUpdatePreferredContentSizeCategory);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17E0858]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void __swiftcall CCUIControlTemplateView.init(coder:)(CCUIControlTemplateView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void sub_1D030FA94(void *a1)
{
  char *v1;
  uint64_t v2;
  void *v3;
  BOOL v4;
  id v5;
  char *v6;
  char *v7;
  id v8;

  v2 = OBJC_IVAR___CCUIControlTemplateView_backgroundView;
  v3 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_backgroundView];
  if (!a1)
  {
    if (!v3)
      return;
LABEL_12:
    v8 = v3;
    objc_msgSend(v1, sel_bounds);
    objc_msgSend(v8, sel_setFrame_);
    objc_msgSend(v1, sel_continuousCornerRadius);
    objc_msgSend(v8, sel__setContinuousCornerRadius_);
    objc_msgSend(v1, sel_insertSubview_atIndex_, v8, 0);

    return;
  }
  if (v3)
    v4 = a1 == v3;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = a1;
    v6 = (char *)objc_msgSend(v5, sel_superview);
    if (v6)
    {
      v7 = v6;

      if (v7 == v1)
        objc_msgSend(v5, sel_removeFromSuperview);
    }

    v3 = *(void **)&v1[v2];
    if (v3)
      goto LABEL_12;
  }
}

void sub_1D030FBC4(char *a1, uint64_t a2, void *a3, _QWORD *a4, void (*a5)(void *))
{
  void *v7;
  char *v8;
  id v9;

  v7 = *(void **)&a1[*a4];
  *(_QWORD *)&a1[*a4] = a3;
  v9 = a3;
  v8 = a1;
  a5(v7);

}

id sub_1D030FC28(id result)
{
  char *v1;
  id v2;
  BOOL v3;
  id v4;
  objc_class *v5;
  char *v6;
  id v7;
  objc_super v8;

  v2 = *(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_customGlyphView];
  if (!result)
  {
    if (!v2)
      return result;
    goto LABEL_9;
  }
  if (v2)
    v3 = result == v2;
  else
    v3 = 0;
  if (!v3)
  {
    if (!v2)
    {
      v4 = 0;
LABEL_10:
      objc_msgSend(v1, sel_setGlyphView_, v4);

      return objc_msgSend(v1, sel_setNeedsLayout);
    }
LABEL_9:
    v5 = (objc_class *)_s22ButtonGlyphWrapperViewCMa();
    v6 = (char *)objc_allocWithZone(v5);
    *(_QWORD *)&v6[OBJC_IVAR____TtCE18ControlCenterUIKitCSo23CCUIControlTemplateViewP33_879E0E7CB08486FFF84F986CA934EC6922ButtonGlyphWrapperView_wrappedView] = v2;
    v7 = v2;
    objc_msgSend(v7, sel_bounds);
    v8.receiver = v6;
    v8.super_class = v5;
    v4 = objc_msgSendSuper2(&v8, sel_initWithFrame_);
    objc_msgSend(v4, sel_addSubview_, v7);

    goto LABEL_10;
  }
  return result;
}

void sub_1D030FD7C()
{
  char *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  if (!objc_msgSend(v0, sel_showsMenuAffordance))
  {
    v8 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
    v9 = v8;
    *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView] = 0;
    sub_1D030FE6C(v8);

    return;
  }
  v1 = sub_1D0315354();
  v2 = OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView;
  v3 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView] = v1;
  v4 = v1;
  sub_1D030FE6C(v3);

  v5 = objc_msgSend(v0, sel_gridSizeClass);
  v6 = *(void **)&v0[v2];
  if (v5 == (id)3)
  {
    if (!v6)
      return;
    v7 = 1.0;
  }
  else
  {
    if (!v6)
      return;
    v7 = 0.0;
  }
  objc_msgSend(v6, sel_setAlpha_, v7);
}

void sub_1D030FE6C(void *a1)
{
  char *v1;
  uint64_t v2;
  void *v3;
  BOOL v4;
  id v5;
  char *v6;
  char *v7;
  id v8;

  v2 = OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView;
  v3 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
  if (!a1)
  {
    if (!v3)
      return;
LABEL_12:
    v8 = v3;
    objc_msgSend(v1, sel_addSubview_, v8);
    objc_msgSend(v1, sel_setNeedsLayout);

    return;
  }
  if (v3)
    v4 = a1 == v3;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = a1;
    v6 = (char *)objc_msgSend(v5, sel_superview);
    if (v6)
    {
      v7 = v6;

      if (v7 == v1)
      {
        objc_msgSend(v5, sel_removeFromSuperview);
        objc_msgSend(v1, sel_setNeedsLayout);
      }
    }

    v3 = *(void **)&v1[v2];
    if (v3)
      goto LABEL_12;
  }
}

uint64_t sub_1D030FF74(uint64_t result, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v3 = *(_QWORD *)&v2[OBJC_IVAR___CCUIControlTemplateView_title + 8];
  if (a2)
  {
    if (v3)
    {
      if (*(_QWORD *)&v2[OBJC_IVAR___CCUIControlTemplateView_title] == result && v3 == a2)
        return result;
      result = sub_1D031D688();
      if ((result & 1) != 0)
        return result;
    }
  }
  else if (!v3)
  {
    return result;
  }
  sub_1D0310728((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D0314058, sub_1D0313FD4);
  v5 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v5 != (void *)1)
  {
    v6 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    v7 = v5;
    v8 = v6;
    v9 = v7;
    if (v5)
    {
      v10 = v9;
      v11 = objc_msgSend(v2, sel_title);
      if (v11)
      {
        sub_1D031D538();

        v11 = (id)sub_1D031D52C();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v10, sel_setText_, v11);

    }
    sub_1D0317C78(v5, v6);
  }
  v12 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v12 != (void *)1)
  {
    v13 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    v14 = v12;
    v15 = v13;
    v16 = v14;
    if (v12)
    {
      v17 = v16;
      v18 = objc_msgSend(v2, sel_title);
      if (v18)
      {
        sub_1D031D538();

        v18 = (id)sub_1D031D52C();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v17, sel_setText_, v18);

    }
    sub_1D0317C78(v12, v13);
  }
  if (objc_msgSend(v2, sel_isResizing))
    sub_1D031018C();
  sub_1D0310260(0);
  return (uint64_t)objc_msgSend(v2, sel_setNeedsLayout);
}

void sub_1D031018C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v1 != (void *)1)
  {
    v2 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    v3 = v1;
    v4 = v2;
    v5 = v3;
    if (v1)
    {
      v6 = v5;
      sub_1D0314C7C(1, v5, v0);

    }
    sub_1D0317C78(v1, v2);
  }
  v7 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v7 != (void *)1)
  {
    v8 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    v9 = v7;
    v10 = v8;
    v11 = v9;
    if (v7)
    {
      v12 = v11;
      sub_1D0314C7C(0, v11, v0);

    }
    sub_1D0317C78(v7, v8);
  }
}

id sub_1D0310260(id result)
{
  _BYTE *v1;
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = v1[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility];
  v1[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = (_BYTE)result;
  if (v2 != (result & 1))
  {
    v3 = sub_1D03145A0();
    v4 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    if (v4 != (void *)1)
    {
      v5 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
      sub_1D03168E0(*(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels], v5);
      v6 = v4;
      objc_msgSend(v6, sel_setNumberOfLines_, v3);

      sub_1D0317C78(v4, v5);
    }
    v7 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    if (v7 != (void *)1)
    {
      v8 = *(void **)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
      sub_1D03168E0(*(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels], v8);
      v9 = v7;
      objc_msgSend(v9, sel_setNumberOfLines_, v3);

      sub_1D0317C78(v7, v8);
    }
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

id sub_1D0310388(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*(_QWORD *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D031D52C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t sub_1D03103F4(char *a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  if (a3)
  {
    v8 = sub_1D031D538();
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = (uint64_t *)&a1[*a4];
  v11 = *v10;
  v12 = v10[1];
  *v10 = v8;
  v10[1] = v9;
  v13 = a1;
  a5(v11, v12);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1D0310464(uint64_t result, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;

  v3 = *(_QWORD *)&v2[OBJC_IVAR___CCUIControlTemplateView_subtitle + 8];
  if (a2)
  {
    if (v3)
    {
      if (*(_QWORD *)&v2[OBJC_IVAR___CCUIControlTemplateView_subtitle] == result && v3 == a2)
        return result;
      result = sub_1D031D688();
      if ((result & 1) != 0)
        return result;
    }
  }
  else if (!v3)
  {
    return result;
  }
  sub_1D0310728((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D03141E8, sub_1D0314174);
  v5 = &v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  v6 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v6 != (void *)1)
  {
    v7 = (void *)*((_QWORD *)v5 + 1);
    v8 = v7;
    v9 = v6;
    v10 = v8;
    if (v7)
    {
      v11 = v10;
      v12 = objc_msgSend(v2, sel_subtitle);
      if (v12)
      {
        sub_1D031D538();

        v12 = (id)sub_1D031D52C();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v11, sel_setText_, v12);

    }
    sub_1D0317C78(v6, v7);
  }
  v13 = &v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  v14 = *(void **)&v2[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v14 != (void *)1)
  {
    v15 = (void *)*((_QWORD *)v13 + 1);
    v16 = v15;
    v17 = v14;
    v18 = v16;
    if (v15)
    {
      v19 = v18;
      v20 = objc_msgSend(v2, sel_subtitle);
      if (v20)
      {
        sub_1D031D538();

        v20 = (id)sub_1D031D52C();
        swift_bridgeObjectRelease();
      }
      objc_msgSend(v19, sel_setText_, v20);

    }
    sub_1D0317C78(v14, v15);
  }
  if (objc_msgSend(v2, sel_isResizing))
    sub_1D03109F0();
  sub_1D0310260(0);
  v21 = sub_1D03145A0();
  v22 = *(id *)v5;
  if (*(_QWORD *)v5 != 1)
  {
    v23 = (void *)*((_QWORD *)v5 + 1);
    sub_1D03168E0(*(id *)v5, v23);
    v24 = v22;
    objc_msgSend(v24, sel_setNumberOfLines_, v21);

    sub_1D0317C78(v22, v23);
  }
  v25 = *(id *)v13;
  if (*(_QWORD *)v13 != 1)
  {
    v26 = (void *)*((_QWORD *)v13 + 1);
    sub_1D03168E0(*(id *)v13, v26);
    v27 = v25;
    objc_msgSend(v27, sel_setNumberOfLines_, v21);

    sub_1D0317C78(v25, v26);
  }
  objc_msgSend(v2, sel_setNeedsLayout);
  return (uint64_t)objc_msgSend(v2, sel_setNeedsLayout);
}

uint64_t sub_1D0310728(SEL *a1, void (*a2)(uint64_t *, uint64_t), void (*a3)(uint64_t *))
{
  void *v3;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v7 = v3;
  v8 = sub_1D031D4A8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(v3, *a1);
  if (!v12)
    goto LABEL_7;
  v13 = v12;
  v14 = sub_1D031D538();
  v16 = v15;

  v30[0] = v14;
  v30[1] = v16;
  sub_1D031D49C();
  sub_1D0317C34();
  v17 = sub_1D031D5D4();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (!v20)
  {
LABEL_7:
    a3(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
    return ((uint64_t (*)(uint64_t *))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  }
  if ((objc_msgSend(v7, sel_isResizing) & 1) != 0)
    goto LABEL_6;
  v22 = objc_msgSend(v7, sel_gridSizeClass);
  v23 = CCUINumberOfRowsForGridSizeClass((uint64_t)v22);
  v24 = CCUINumberOfColumnsForGridSizeClass((uint64_t)v22);
  v25 = v24;
  if (v23 >= 2)
  {
    if ((objc_msgSend(v7, sel_supportsAccessibilityContentSizeCategories) & 1) == 0)
      goto LABEL_15;
    v26 = objc_msgSend(v7, sel_traitCollection);
    v27 = objc_msgSend(v26, sel_preferredContentSizeCategory);

    LOBYTE(v26) = sub_1D031D58C();
    if ((v26 & 1) == 0 || v25 < 2)
      goto LABEL_15;
  }
  else if (v24 <= 1)
  {
LABEL_15:
    a3(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels);
    goto LABEL_16;
  }
LABEL_6:
  a2(&OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels, 1);
LABEL_16:
  if ((objc_msgSend(v7, sel_isResizing) & 1) == 0)
  {
    if (objc_msgSend(v7, sel_supportsAccessibilityContentSizeCategories))
    {
      v28 = objc_msgSend(v7, sel_traitCollection);
      v29 = objc_msgSend(v28, sel_preferredContentSizeCategory);

      LOBYTE(v28) = sub_1D031D58C();
      if ((v28 & 1) != 0)
        return ((uint64_t (*)(uint64_t *))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
    }
    if (CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(v7, sel_gridSizeClass)) < 2)
      return ((uint64_t (*)(_QWORD))a3)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels);
  }
  return ((uint64_t (*)(uint64_t *, _QWORD))a2)(&OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels, 0);
}

void sub_1D03109F0()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v1 != (void *)1)
  {
    v2 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    v3 = v2;
    v4 = v1;
    v5 = v3;
    if (v2)
    {
      v6 = v5;
      sub_1D0314C7C(1, v5, v0);

    }
    sub_1D0317C78(v1, v2);
  }
  v7 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v7 != (void *)1)
  {
    v8 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    v9 = v8;
    v10 = v7;
    v11 = v9;
    if (v8)
    {
      v12 = v11;
      sub_1D0314C7C(0, v11, v0);

    }
    sub_1D0317C78(v7, v8);
  }
}

id sub_1D0310BA0(id result)
{
  _BYTE *v1;
  int v2;

  v2 = v1[OBJC_IVAR___CCUIControlTemplateView__isResizing];
  v1[OBJC_IVAR___CCUIControlTemplateView__isResizing] = (_BYTE)result;
  if (v2 != (result & 1))
  {
    objc_msgSend(v1, sel_setClipsToBounds_, objc_msgSend(v1, sel_isResizing));
    sub_1D0310728((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D0314058, sub_1D0313FD4);
    sub_1D0310728((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D03141E8, sub_1D0314174);
    if ((objc_msgSend(v1, sel_isResizing) & 1) != 0)
      sub_1D0310C64();
    sub_1D0310260(0);
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void sub_1D0310C64()
{
  char *v0;
  char *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;

  v1 = &v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  v2 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v2 != (void *)1)
  {
    v3 = (void *)*((_QWORD *)v1 + 1);
    v4 = v2;
    v5 = v3;
    v6 = v4;
    if (v2)
    {
      v7 = v6;
      sub_1D0314C7C(1, v6, v0);

    }
    sub_1D0317C78(v2, v3);
  }
  v8 = &v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  v9 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v9 != (void *)1)
  {
    v10 = (void *)*((_QWORD *)v8 + 1);
    v11 = v9;
    v12 = v10;
    v13 = v11;
    if (v9)
    {
      v14 = v13;
      sub_1D0314C7C(0, v13, v0);

    }
    sub_1D0317C78(v9, v10);
  }
  v15 = *(void **)v1;
  if (*(_QWORD *)v1 != 1)
  {
    v16 = (void *)*((_QWORD *)v1 + 1);
    v17 = v16;
    v18 = v15;
    v19 = v17;
    if (v16)
    {
      v20 = v19;
      sub_1D0314C7C(1, v19, v0);

    }
    sub_1D0317C78(v15, v16);
  }
  v21 = *(void **)v8;
  if (*(_QWORD *)v8 != 1)
  {
    v22 = (void *)*((_QWORD *)v8 + 1);
    v23 = v22;
    v24 = v21;
    v25 = v23;
    if (v22)
    {
      v26 = v25;
      sub_1D0314C7C(0, v25, v0);

    }
    sub_1D0317C78(v21, v22);
  }
}

id sub_1D0310EA8(id result)
{
  char *v1;
  id v2;

  v2 = *(id *)&v1[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass];
  *(_QWORD *)&v1[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = result;
  if (v2 != result)
  {
    sub_1D0310728((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D0314058, sub_1D0313FD4);
    sub_1D0310728((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D03141E8, sub_1D0314174);
    if ((objc_msgSend(v1, sel_isResizing) & 1) != 0)
      sub_1D0310C64();
    sub_1D0310260(0);
    sub_1D030FD7C();
    return objc_msgSend(v1, sel_setNeedsLayout);
  }
  return result;
}

void sub_1D0310FAC()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v1, sel_setCornerRadius_);

  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v0, sel__setContinuousCornerRadius_);
  v2 = objc_msgSend(v0, sel_backgroundView);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v0, sel_continuousCornerRadius);
    objc_msgSend(v3, sel__setContinuousCornerRadius_);

  }
}

id sub_1D031110C()
{
  char *v0;
  char *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;

  v1 = &v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  v2 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v2 != (void *)1)
  {
    v3 = (void *)*((_QWORD *)v1 + 1);
    v4 = v2;
    v5 = v3;
    v6 = v4;
    if (v2)
    {
      v7 = v6;
      sub_1D03146C0(1, 1);
      v9 = v8;
      objc_msgSend(v7, sel_setFont_, v8);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v10 = objc_msgSend(v0, sel_traitCollection),
            v11 = objc_msgSend(v10, sel_preferredContentSizeCategory),
            v10,
            LOBYTE(v10) = sub_1D031D58C(),
            v11,
            (v10 & 1) != 0))
      {
        objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v7, sel_setMinimumScaleFactor_, 0.7);
      }

    }
    sub_1D0317C78(v2, v3);
  }
  v12 = &v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  v13 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v13 != (void *)1)
  {
    v14 = (void *)*((_QWORD *)v12 + 1);
    v15 = v13;
    v16 = v14;
    v17 = v15;
    if (v13)
    {
      v18 = v17;
      sub_1D03146C0(1, 0);
      v20 = v19;
      objc_msgSend(v18, sel_setFont_, v19);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v21 = objc_msgSend(v0, sel_traitCollection),
            v22 = objc_msgSend(v21, sel_preferredContentSizeCategory),
            v21,
            LOBYTE(v21) = sub_1D031D58C(),
            v22,
            (v21 & 1) != 0))
      {
        objc_msgSend(v18, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v18, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v18, sel_setMinimumScaleFactor_, 0.7);
      }

    }
    sub_1D0317C78(v13, v14);
  }
  v23 = *(void **)v1;
  if (*(_QWORD *)v1 != 1)
  {
    v24 = (void *)*((_QWORD *)v1 + 1);
    v25 = v24;
    v26 = v23;
    v27 = v25;
    if (v24)
    {
      v28 = v27;
      sub_1D03146C0(0, 1);
      v30 = v29;
      objc_msgSend(v28, sel_setFont_, v29);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v31 = objc_msgSend(v0, sel_traitCollection),
            v32 = objc_msgSend(v31, sel_preferredContentSizeCategory),
            v31,
            LOBYTE(v31) = sub_1D031D58C(),
            v32,
            (v31 & 1) != 0))
      {
        objc_msgSend(v28, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v28, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v28, sel_setMinimumScaleFactor_, 0.7);
      }

    }
    sub_1D0317C78(v23, v24);
  }
  v33 = *(void **)v12;
  if (*(_QWORD *)v12 != 1)
  {
    v34 = (void *)*((_QWORD *)v12 + 1);
    v35 = v34;
    v36 = v33;
    v37 = v35;
    if (v34)
    {
      v38 = v37;
      sub_1D03146C0(0, 0);
      v40 = v39;
      objc_msgSend(v38, sel_setFont_, v39);

      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v41 = objc_msgSend(v0, sel_traitCollection),
            v42 = objc_msgSend(v41, sel_preferredContentSizeCategory),
            v41,
            LOBYTE(v41) = sub_1D031D58C(),
            v42,
            (v41 & 1) != 0))
      {
        objc_msgSend(v38, sel_setAdjustsFontSizeToFitWidth_, 0);
      }
      else
      {
        objc_msgSend(v38, sel_setAdjustsFontSizeToFitWidth_, 1);
        objc_msgSend(v38, sel_setMinimumScaleFactor_, 0.7);
      }

    }
    sub_1D0317C78(v33, v34);
  }
  return objc_msgSend(v0, sel_setNeedsLayout);
}

void sub_1D03115E0()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD aBlock[6];

  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
  if (v1)
  {
    v8 = v1;
    v2 = objc_msgSend(v0, sel_contextMenuDelegate);
    if (v2
      && (v3 = objc_msgSend(v2, sel_contextMenu), swift_unknownObjectRelease(), v3))
    {
      v4 = swift_allocObject();
      *(_QWORD *)(v4 + 16) = v3;
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = sub_1D0317D78;
      *(_QWORD *)(v5 + 24) = v4;
      aBlock[4] = sub_1D0317D90;
      aBlock[5] = v5;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1D031178C;
      aBlock[3] = &block_descriptor_17;
      v6 = _Block_copy(aBlock);
      v7 = v3;
      swift_retain();
      swift_release();
      objc_msgSend(v8, sel_updateVisibleMenuWithBlock_, v6);

      _Block_release(v6);
      LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if ((v7 & 1) != 0)
        __break(1u);
    }
    else
    {

    }
  }
}

id sub_1D031178C(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  void *v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = (void *)v2();

  return v4;
}

id CCUIControlTemplateView.contentMetrics.getter()
{
  objc_super v1;

  v1.super_class = (Class)CCUIControlTemplateView;
  return objc_msgSendSuper2(&v1, sel_contentMetrics);
}

void CCUIControlTemplateView.contentMetrics.setter(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  void *v6;
  id v7;
  char v8;
  objc_super v9;
  objc_super v10;

  v2 = v1;
  v10.receiver = v1;
  v10.super_class = (Class)CCUIControlTemplateView;
  v4 = objc_msgSendSuper2(&v10, sel_contentMetrics);
  v9.receiver = v1;
  v9.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v9, sel_setContentMetrics_, a1);
  v5 = objc_msgSend(v1, sel_contentMetrics);
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      type metadata accessor for CCUIModuleContentMetrics();
      v7 = v4;
      v8 = sub_1D031D5B0();

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v5)
  {

LABEL_7:
    sub_1D031110C();
    objc_msgSend(v2, sel_setNeedsLayout);
    v7 = v4;
LABEL_8:

  }
}

CGRect __swiftcall CCUIControlTemplateView.glyphContentFrame()()
{
  char *v0;
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  unsigned int v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  CGFloat v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double Height;
  CGFloat v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double MaxX;
  id v36;
  uint64_t v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  id v60;
  void *v61;
  double v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  CGFloat v66;
  double v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect result;
  CGRect v75;

  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v0, sel__shouldReverseLayoutDirection);
  v10 = objc_msgSend(v0, sel_contentMetrics);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_metricsScaleFactor);
    v12 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v12, sel_displayScale);

    UIRoundToScale();
    v14 = v13;

  }
  else
  {
    v14 = 14.0;
  }
  v15 = objc_msgSend(v0, sel_contentMetrics);
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, sel_gridGeometryInfo);
    v18 = v17;

  }
  else
  {
    v18 = CCUIItemEdgeSize();
  }
  v68.origin.x = v2;
  v68.origin.y = v4;
  v68.size.width = v6;
  v68.size.height = v8;
  Height = CGRectGetHeight(v68);
  if (v18 >= Height)
    v18 = Height;
  v20 = 0.0;
  if (v9)
  {
    v69.origin.x = v2;
    v69.origin.y = v4;
    v69.size.width = v6;
    v69.size.height = v8;
    v20 = CGRectGetMaxX(v69) - v18;
  }
  v21 = 0;
  v22 = v18;
  v23 = v18;
  v70 = CGRectInset(*(CGRect *)&v20, v14, v14);
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  v70.origin.x = v2;
  v27 = v70.size.height;
  v70.origin.y = v4;
  v28 = v70.origin.x;
  v70.size.width = v6;
  v29 = v70.origin.y;
  v70.size.height = v8;
  v30 = v70.size.width;
  v66 = v70.size.height;
  v75 = CGRectInset(v70, v14, v14);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = v27;
  v72 = CGRectIntersection(v71, v75);
  v31 = v72.origin.x;
  v32 = v72.origin.y;
  v33 = v72.size.width;
  v34 = v72.size.height;
  if (v9)
  {
    MaxX = CGRectGetMaxX(v72);
    v73.origin.x = v31;
    v73.origin.y = v32;
    v73.size.width = v33;
    v73.size.height = v34;
    v31 = MaxX - CGRectGetWidth(v73);
  }
  v36 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v36, sel_displayScale);
  v65 = v37;

  v38 = v28;
  if (objc_msgSend(v0, sel_isExpanded))
  {
    v39 = v29;
    v63 = v65;
    v40 = v30;
    v41 = v66;
    if (CCUINumberOfColumnsForGridSizeClass((uint64_t)objc_msgSend(v0, sel_gridSizeClass)) > 1)
      UIRectCenteredYInRectScale();
    else
      UIRectCenteredIntegralRectScale();
    v31 = v42;
    v32 = v43;
    v33 = v44;
    v34 = v45;
  }
  else
  {
    v39 = v29;
    v40 = v30;
    v41 = v66;
  }
  if (!objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories, v63))
    goto LABEL_28;
  v46 = objc_msgSend(v0, sel_traitCollection);
  v47 = objc_msgSend(v46, sel_preferredContentSizeCategory);

  LOBYTE(v46) = sub_1D031D58C();
  if ((v46 & 1) == 0)
    goto LABEL_28;
  if (CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(v0, sel_gridSizeClass)) < 2)
    goto LABEL_28;
  if ((objc_msgSend(v0, sel_isResizing) & 1) != 0)
    goto LABEL_28;
  if ((objc_msgSend(v0, sel_isExpanded) & 1) != 0)
    goto LABEL_28;
  v48 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if ((unint64_t)v48 < 2)
    goto LABEL_28;
  v49 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
  v50 = v48;
  sub_1D03168E0(v48, v49);
  *(_QWORD *)&v64 = sub_1D0311EA0();
  *((_QWORD *)&v64 + 1) = v51;
  v54 = objc_msgSend(v50, sel_font, sub_1D0312088(v48, v49, 0, &v67, v38, v39, v40, v41, v31, v32, v33, v34, v64, v52, v53));
  if (!v54)
  {
    __break(1u);
    goto LABEL_30;
  }
  v59 = v54;
  objc_msgSend(v54, sel_ascender);

  v60 = objc_msgSend(v50, sel_font);
  if (!v60)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v61 = v60;
  objc_msgSend(v60, sel_capHeight);

  UIRoundToScale();
  v32 = v62;

LABEL_28:
  v55 = v31;
  v56 = v32;
  v57 = v33;
  v58 = v34;
LABEL_31:
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

double sub_1D0311EA0()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  unsigned int v5;
  double v6;
  double v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double Width;
  CGRect v16;
  CGRect v17;

  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
  if (!v1)
    return 0.0;
  v2 = v1;
  v3 = objc_msgSend(v2, sel_image);
  if (!v3)
  {

    return 0.0;
  }
  v4 = v3;
  v5 = objc_msgSend(v0, sel__shouldReverseLayoutDirection);
  objc_msgSend(v4, sel_size);
  v7 = v6;
  objc_msgSend(v4, sel_size);
  objc_msgSend(v0, sel_bounds);
  CGRectGetHeight(v16);
  v8 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);

  UIRoundToScale();
  v9 = objc_msgSend(v0, sel_contentMetrics);
  if (!v9)
  {
    v13 = 16.0;
    if (v5)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v0, sel_bounds);
    Width = CGRectGetWidth(v17);

    return Width - v13 - v7;
  }
  v10 = v9;
  objc_msgSend(v9, sel_metricsScaleFactor);
  v11 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v11, sel_displayScale);

  UIRoundToScale();
  v13 = v12;

  if (!v5)
    goto LABEL_9;
LABEL_5:

  return v13;
}

double sub_1D0312088@<D0>(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, double *a4@<X8>, CGFloat a5@<D0>, CGFloat a6@<D1>, CGFloat a7@<D2>, CGFloat a8@<D3>, CGFloat a9@<D4>, CGFloat a10@<D5>, CGFloat a11@<D6>, CGFloat a12@<D7>, __int128 a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  unsigned int v26;
  id v27;
  CGFloat v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double Height;
  double v49;
  id v50;
  double v51;
  double v52;
  double v53;
  id v54;
  id v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double MaxY;
  double v65;
  double v66;
  double MaxX;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat MinX;
  double v75;
  CGFloat v76;
  double result;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat rect;
  CGFloat Width;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v26 = objc_msgSend(v15, sel__shouldReverseLayoutDirection);
  v27 = objc_msgSend(v15, sel_traitCollection);
  objc_msgSend(v27, sel_displayScale);

  v28 = a7;
  v84 = a9;
  v85 = a10;
  rect = a11;
  v81 = a12;
  v35 = sub_1D0314898(v26, a3, v29, v30, v31, v32, v33, v34, a5, a6, v28, a8, a9, a10, a11, a12, a13, *((uint64_t *)&a13 + 1), a14);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = 0.0;
  Width = 0.0;
  v43 = 0.0;
  v82 = 0.0;
  if (a2)
  {
    v44 = a2;
    objc_msgSend(v44, sel_sizeThatFits_, v39, v41);
    v82 = v45;
    v47 = v46;
    v90.origin.x = v35;
    v90.origin.y = v37;
    v90.size.width = v39;
    v90.size.height = v41;
    Width = CGRectGetWidth(v90);
    v91.origin.x = v35;
    v91.origin.y = v37;
    v91.size.width = v39;
    v91.size.height = v41;
    Height = CGRectGetHeight(v91);

    if (Height >= v47)
      v43 = v47;
    else
      v43 = Height;
  }
  v49 = 0.0;
  v83 = v43;
  if (a1)
  {
    v50 = a1;
    v92.origin.x = v35;
    v92.origin.y = v37;
    v92.size.width = v39;
    v92.size.height = v41;
    v51 = CGRectGetWidth(v92);
    v93.origin.x = v35;
    v93.origin.y = v37;
    v93.size.width = v39;
    v93.size.height = v41;
    v52 = CGRectGetHeight(v93) - v43;
    objc_msgSend(v50, sel_sizeThatFits_, v51, v52);
    v49 = v53;
    if (v52 < v53)
    {
      if (objc_msgSend(v15, sel_supportsAccessibilityContentSizeCategories))
      {
        v54 = objc_msgSend(v15, sel_traitCollection);
        v55 = objc_msgSend(v54, sel_preferredContentSizeCategory);

        LOBYTE(v54) = sub_1D031D58C();
        v49 = v52;
        if ((v54 & 1) != 0)
        {
          v94.origin.x = v35;
          v94.origin.y = v37;
          v94.size.width = v39;
          v94.size.height = v41;
          v56 = CGRectGetWidth(v94) - v82;
          v95.origin.x = v35;
          v95.origin.y = v37;
          v95.size.width = v39;
          v95.size.height = v41;
          objc_msgSend(v50, sel_sizeThatFits_, v56, CGRectGetHeight(v95));
          v96.origin.x = v35;
          v96.origin.y = v37;
          v96.size.width = v39;
          v96.size.height = v41;
          CGRectGetHeight(v96);

          v97.origin.x = v35;
          v97.origin.y = v37;
          v97.size.width = v39;
          v97.size.height = v41;
          CGRectGetMinX(v97);
          v98.origin.x = v35;
          v98.origin.y = v37;
          v98.size.width = v39;
          v98.size.height = v41;
          CGRectGetMinY(v98);
          UIRectCenteredYInRectScale();
          v61 = v57;
          v62 = v58;
          v42 = v59;
          v49 = v60;
          if ((v26 & 1) != 0)
          {
            v99.origin.x = v35;
            v99.origin.y = v37;
            v99.size.width = v39;
            v99.size.height = v41;
            CGRectGetMinX(v99);
          }
          else
          {
            CGRectGetMaxX(*(CGRect *)&v57);
          }
          v110.origin.x = v35;
          v110.origin.y = v37;
          v110.size.width = v39;
          v110.size.height = v41;
          CGRectGetMinY(v110);
          UIRectCenteredYInRectScale();
          MinX = v78;
          v75 = v79;
          v83 = v80;
          goto LABEL_22;
        }
      }
      else
      {
        v49 = v52;
      }
    }
    v100.origin.x = v35;
    v100.origin.y = v37;
    v100.size.width = v39;
    v100.size.height = v41;
    v42 = CGRectGetWidth(v100);

  }
  v63 = v43 + v49;
  if ((a3 & 1) != 0)
  {
    v101.origin.x = v35;
    v101.origin.y = v37;
    v101.size.width = v39;
    v101.size.height = v41;
    MaxY = CGRectGetMaxY(v101);
    v102.origin.x = v35;
    v102.origin.y = v37;
    v102.size.width = v39;
    v102.size.height = v43 + v49;
    v62 = MaxY - CGRectGetHeight(v102);
    sub_1D0313CA0();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    v66 = v65;
    v103.origin.x = v84;
    v103.origin.y = v85;
    v103.size.width = rect;
    v103.size.height = v81;
    if (v62 <= CGRectGetMaxY(v103) + v66)
    {
      v104.origin.x = v84;
      v104.origin.y = v85;
      v104.size.width = rect;
      v104.size.height = v81;
      v62 = v66 + CGRectGetMaxY(v104);
      v63 = v49;
    }
    if (v26)
    {
      v105.origin.x = v84;
      v105.origin.y = v85;
      v105.size.width = rect;
      v105.size.height = v81;
      MaxX = CGRectGetMaxX(v105);
      v106.origin.x = v35;
      v106.origin.y = v62;
      v106.size.width = v39;
      v106.size.height = v63;
      v35 = MaxX - CGRectGetWidth(v106);
    }
  }
  else
  {
    UIRectCenteredYInRectScale();
    v62 = v70;
    if (v26)
    {
      v71 = v69;
      sub_1D0313B68();
      CCUIEdgeInsetsFromDirectionalEdgeInsets();
      v73 = v72;
      v107.origin.x = v84;
      v107.origin.y = v85;
      v107.size.width = rect;
      v107.size.height = v81;
      v35 = CGRectGetMinX(v107) - v73 - v71;
    }
    else
    {
      v35 = v68;
    }
  }
  v108.origin.x = v35;
  v108.origin.y = v62;
  v108.size.width = v42;
  v108.size.height = v49;
  MinX = CGRectGetMinX(v108);
  v109.origin.x = v35;
  v109.origin.y = v62;
  v109.size.width = v42;
  v109.size.height = v49;
  v75 = CGRectGetMaxY(v109);
  v61 = v35;
  v76 = Width;
LABEL_22:
  *a4 = v61;
  a4[1] = v62;
  a4[2] = v42;
  a4[3] = v49;
  a4[4] = MinX;
  a4[5] = v75;
  result = v83;
  a4[6] = v76;
  a4[7] = v83;
  return result;
}

Swift::Void __swiftcall CCUIControlTemplateView.selectionDidChange()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_visualStylingProviderForCategory_, 1);
  if (v1)
  {
    v2 = v1;
    v3 = v1;
    sub_1D03126A4((uint64_t)v3, 1, v2);

  }
}

uint64_t sub_1D03126A4(uint64_t result, uint64_t a2, void *a3)
{
  char *v3;
  unsigned int v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  char v11;
  double v12;
  double v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  unsigned int v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;

  if (a2 == 1)
  {
    v49 = (void *)result;
    v5 = objc_msgSend(v3, sel_isSelected);
    v6 = v5;
    if (v5)
      v7 = 0xD000000000000014;
    else
      v7 = 0;
    v48 = v7;
    if (v5)
      v8 = 0x80000001D0322D10;
    else
      v8 = 0;
    v9 = (void *)objc_opt_self();
    v10 = objc_msgSend(v9, sel__isInAnimationBlockWithAnimationsEnabled);
    v11 = v10;
    v12 = 0.0;
    if (v10)
    {
      objc_msgSend(v9, sel__currentAnimationDuration, v48);
      v12 = v13;
    }
    v14 = &v3[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    v15 = *(void **)&v3[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
    if (v15 != (void *)1)
    {
      v16 = a3;
      v17 = (void *)*((_QWORD *)v14 + 1);
      v18 = v15;
      v19 = v17;
      v20 = v18;
      if (v15)
      {
        v21 = v20;
        sub_1D0317200(v20, v11, v3, v48, v8, v6, v49, v16, v12);

      }
      sub_1D0317C78(v15, v17);
      a3 = v16;
    }
    v22 = &v3[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    v23 = *(void **)&v3[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
    if (v23 != (void *)1)
    {
      v24 = a3;
      v25 = (void *)*((_QWORD *)v22 + 1);
      v26 = v23;
      v27 = v25;
      v28 = v26;
      if (v23)
      {
        v29 = v28;
        sub_1D0317200(v28, v11, v3, v48, v8, v6, v49, v24, v12);

      }
      sub_1D0317C78(v23, v25);
      a3 = v24;
    }
    sub_1D0317CA8(v48, v8, v6);
    v30 = objc_msgSend(v3, sel_isSelected);
    v31 = v30;
    if (v30)
      v32 = 0xD000000000000016;
    else
      v32 = 1;
    if (v30)
      v33 = 0x80000001D0322CF0;
    else
      v33 = 0;
    v34 = *(void **)v14;
    if (*(_QWORD *)v14 != 1)
    {
      v35 = (void *)*((_QWORD *)v14 + 1);
      v36 = v35;
      v37 = v34;
      v38 = v36;
      if (v35)
      {
        v39 = v38;
        sub_1D03169EC(v35, v32, v33, v31, v49, a3);

      }
      sub_1D0317C78(v34, v35);
    }
    v40 = *(void **)v22;
    if (*(_QWORD *)v22 != 1)
    {
      v41 = (void *)*((_QWORD *)v22 + 1);
      v42 = v41;
      v43 = v40;
      v44 = v42;
      if (v41)
      {
        v45 = v44;
        sub_1D03169EC(v41, v32, v33, v31, v49, a3);

      }
      sub_1D0317C78(v40, v41);
    }
    v46 = *(void **)&v3[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
    v47 = v46;
    sub_1D03169EC(v46, v32, v33, v31, v49, a3);

    return sub_1D0317CA8(v32, v33, v31);
  }
  return result;
}

Swift::Void __swiftcall CCUIControlTemplateView.layoutSubviews()()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  void *v11;
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
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double Height;
  CGFloat v32;
  CGFloat v33;
  id v34;
  id v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  unsigned int v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  __int128 v59;
  __int128 v60;
  id v61;
  double v62;
  double v63;
  CGFloat rect;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  objc_super v80;
  CGRect v81;

  v80.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v80, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v9, sel_setFrame_, v2, v4, v6, v8);

  v10 = objc_msgSend(v0, sel_contentMetrics);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, sel_gridGeometryInfo);
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v13 = CCUIItemEdgeSize();
    v15 = CCUILayoutGutter();
  }
  objc_msgSend(v0, sel_glyphContentFrame);
  v68 = v17;
  v69 = v16;
  v66 = v19;
  v67 = v18;
  v20 = sub_1D0311EA0();
  v24 = v20;
  v70 = *(_QWORD *)&v22;
  v71 = v21;
  v25 = *(_QWORD *)&v23;
  v26 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
  if (v26)
    objc_msgSend(v26, sel_setFrame_, v20, v21, v22, v23);
  v27 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels];
  if (v27 != (void *)1)
  {
    rect = v8;
    v65 = v24;
    v62 = v15;
    v63 = v13;
    v28 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels + 8];
    v61 = v28;
    v29 = v27;
    if ((objc_msgSend(v0, sel_isResizing) & 1) != 0
      || (v30 = v6, Height = rect, v32 = v2, v33 = v4, objc_msgSend(v0, sel_isExpanded)))
    {
      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v34 = objc_msgSend(v0, sel_traitCollection),
            v35 = objc_msgSend(v34, sel_preferredContentSizeCategory),
            v34,
            LOBYTE(v34) = sub_1D031D58C(),
            v35,
            (v34 & 1) != 0))
      {
        v36 = 3;
      }
      else
      {
        v36 = 2;
      }
      v37 = CCUINumberOfRowsForGridSizeClass(v36);
      v38 = CCUINumberOfColumnsForGridSizeClass(v36);
      v30 = v63 * (double)v38 + v62 * ((double)v38 + -1.0);
      if ((objc_msgSend(v0, sel_isExpanded) & 1) != 0)
      {
        v81.origin.x = v2;
        v81.origin.y = v4;
        v81.size.width = v6;
        v81.size.height = rect;
        Height = CGRectGetHeight(v81);
      }
      else
      {
        Height = v63 * (double)v37 + v62 * ((double)v37 + -1.0);
      }
      v32 = 0.0;
      v33 = 0.0;
    }
    if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories))
    {
      v39 = objc_msgSend(v0, sel_traitCollection);
      v40 = objc_msgSend(v39, sel_preferredContentSizeCategory);

      LOBYTE(v39) = sub_1D031D58C();
      if ((v39 & 1) != 0
        && (v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] & 1) == 0)
      {
        sub_1D03174A4(v27, v28, v32, v33, v30, Height, v69, v68, v67, v66);
      }
    }
    *(double *)&v59 = v65;
    *((double *)&v59 + 1) = v71;
    sub_1D0312088(v27, v28, 0, &v72, v32, v33, v30, Height, v69, v68, v67, v66, v59, v70, v25);
    v41 = v76;
    v42 = v77;
    v43 = v78;
    v44 = v79;
    if (v27)
      objc_msgSend(v29, sel_setFrame_, v72, v73, v74, v75);
    if (v28)
    {
      v45 = v61;
      objc_msgSend(v45, sel_setFrame_, v41, v42, v43, v44);

    }
    v13 = v63;
    v8 = rect;
    v15 = v62;
    v24 = v65;
  }
  v46 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels];
  if (v46 != (void *)1)
  {
    v47 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels + 8];
    v48 = v47;
    v49 = v46;
    if ((objc_msgSend(v0, sel_isResizing) & 1) != 0 || objc_msgSend(v0, sel_isExpanded))
    {
      if (objc_msgSend(v0, sel_supportsAccessibilityContentSizeCategories)
        && (v50 = objc_msgSend(v0, sel_traitCollection),
            v51 = objc_msgSend(v50, sel_preferredContentSizeCategory),
            v50,
            LOBYTE(v50) = sub_1D031D58C(),
            v51,
            (v50 & 1) != 0))
      {
        v52 = 5;
      }
      else
      {
        v52 = 4;
      }
      v53 = CCUINumberOfColumnsForGridSizeClass(v52);
      v6 = v13 * (double)v53 + v15 * ((double)v53 + -1.0);
      v2 = 0.0;
      v4 = 0.0;
    }
    *(double *)&v60 = v24;
    *((double *)&v60 + 1) = v71;
    sub_1D0312088(v46, v47, 1, &v72, v2, v4, v6, v8, v69, v68, v67, v66, v60, v70, v25);
    v54 = v76;
    v55 = v77;
    v56 = v78;
    v57 = v79;
    if (v46)
      objc_msgSend(v49, sel_setFrame_, v72, v73, v74, v75);
    if (v47)
    {
      v58 = v48;
      objc_msgSend(v58, sel_setFrame_, v54, v55, v56, v57);

    }
  }
  if ((objc_msgSend(v0, sel_isResizing) & 1) == 0)
    sub_1D0310C64();

}

Swift::Void __swiftcall CCUIControlTemplateView.didMoveToWindow()()
{
  void *v0;
  id v1;
  void *v2;
  objc_super v3;
  objc_super v4;

  v4.super_class = (Class)CCUIControlTemplateView;
  objc_msgSendSuper2(&v4, sel_didMoveToWindow);
  if (objc_msgSend(v0, sel__isInAWindow))
  {
    v3.receiver = v0;
    v3.super_class = (Class)CCUIControlTemplateView;
    v1 = objc_msgSendSuper2(&v3, sel_visualStylingProviderForCategory_, 1);
    if (v1)
    {
      v2 = v1;
      objc_msgSend(v0, sel_setVisualStylingProvider_forCategory_, v1, 1);

    }
  }
}

id CCUIControlTemplateView.visualStylingProvider(for:)(uint64_t a1)
{
  void *v1;
  void *v2;
  unint64_t v4;
  unint64_t v5;
  char v6;
  id v7;
  objc_super v9;

  v2 = v1;
  v4 = sub_1D03132A0();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1D0315B00(a1), (v6 & 1) != 0))
  {
    v7 = *(id *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v9.receiver = v2;
    v9.super_class = (Class)CCUIControlTemplateView;
    return objc_msgSendSuper2(&v9, sel_visualStylingProviderForCategory_, a1);
  }
  return v7;
}

unint64_t sub_1D03132A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders;
  if (*(_QWORD *)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders);
  }
  else
  {
    v2 = sub_1D031CF50(MEMORY[0x1E0DEE9D8]);
    *(_QWORD *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1D0313420(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;

  if (a2 == 1)
  {
    v3 = v2;
    v5 = sub_1D03132A0();
    if (*(_QWORD *)(v5 + 16) && (v6 = sub_1D0315B00(1), (v7 & 1) != 0))
    {
      v8 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v6);
      v9 = v8;
    }
    else
    {
      v8 = 0;
    }
    swift_bridgeObjectRelease();
    if (a1)
    {
      if (v8)
      {
        sub_1D0317E94(0, &qword_1EFC116E8);
        v14 = v8;
        v10 = a1;
        v11 = sub_1D031D5B0();

        v12 = v14;
        if ((v11 & 1) != 0)
          goto LABEL_13;
      }
    }
    else if (!v8)
    {
      return;
    }
    v13 = a1;
    v15 = sub_1D03132A0();
    sub_1D031356C((uint64_t)a1, 1);
    *(_QWORD *)(v3 + OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders) = v15;
    swift_bridgeObjectRelease();
    if (a1)
    {
      sub_1D03126A4((uint64_t)v13, 1, v8);
      v12 = v8;
LABEL_13:

      return;
    }

    __break(1u);
  }
}

unint64_t sub_1D031356C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  unint64_t result;
  char v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  if (a1)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_1D03162F8(a1, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
  }
  else
  {
    result = sub_1D0315B00(a2);
    if ((v8 & 1) == 0)
      return result;
    v9 = result;
    v10 = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v2;
    v14 = *v3;
    *v3 = 0x8000000000000000;
    if (!v10)
    {
      sub_1D0316430();
      v11 = v14;
    }
    v12 = *(void **)(*(_QWORD *)(v11 + 56) + 8 * v9);
    sub_1D0316140(v9, v11);
    *v3 = v11;

  }
  return swift_bridgeObjectRelease();
}

void (*sub_1D03136A8(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2)
{
  void (*result)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  result = (void (*)(uint64_t, uint64_t))sub_1D0317CD0(a2, (uint64_t)&v6);
  if (v7)
  {
    sub_1D0317D18(&v6, &v8);
    sub_1D0317E94(0, (unint64_t *)&unk_1EFC116F0);
    swift_dynamicCast();
    objc_msgSend(v5, sel_alpha);
    v4 = v3;

    *(_QWORD *)(swift_allocObject() + 16) = v4;
    return sub_1D0317D38;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1D031376C(double a1, uint64_t a2, uint64_t a3)
{
  id v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;

  sub_1D0317CD0(a3, (uint64_t)&v5);
  if (v6)
  {
    sub_1D0317D18(&v5, &v7);
    sub_1D0317E94(0, (unint64_t *)&unk_1EFC116F0);
    swift_dynamicCast();
    objc_msgSend(v4, sel_setAlpha_, a1);

  }
  else
  {
    __break(1u);
  }
}

id sub_1D0313810(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v5)(void *, __int128 *);
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;

  v5 = *(uint64_t (**)(void *, __int128 *))(a1 + 32);
  if (a3)
  {
    *((_QWORD *)&v13 + 1) = swift_getObjectType();
    *(_QWORD *)&v12 = a3;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  swift_retain();
  v6 = a2;
  swift_unknownObjectRetain();
  v7 = (void *)v5(a2, &v12);
  v9 = v8;

  swift_release();
  sub_1D0317DB0((uint64_t)&v12, qword_1EFC11608);
  if (v7)
  {
    v11[4] = v7;
    v11[5] = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 1107296256;
    v11[2] = sub_1D0313900;
    v11[3] = &block_descriptor_8;
    v7 = _Block_copy(v11);
    swift_release();
  }
  return v7;
}

uint64_t sub_1D0313900(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void *, __int128 *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(void *, __int128 *))(a1 + 32);
  if (a3)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a3;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  v6 = a2;
  swift_unknownObjectRetain();
  v5(a2, &v8);

  swift_release();
  return sub_1D0317DB0((uint64_t)&v8, qword_1EFC11608);
}

void sub_1D031399C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  void (*(*v22)(uint64_t, uint64_t))(uint64_t, uint64_t);
  uint64_t v23;

  if (!a7)
  {
    v14 = a2;
    if ((a5 & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v15 = a2;
    v16 = a6;
    v12 = (id)sub_1D031D52C();
    v22 = sub_1D03136A8;
    v23 = 0;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 1107296256;
    v20 = sub_1D0313810;
    v21 = &block_descriptor_38;
    v17 = _Block_copy(&v18);
    swift_release();
    objc_msgSend(v16, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v15, v12, v17);

    _Block_release(v17);
    goto LABEL_6;
  }
  objc_msgSend(a7, sel_stopAutomaticallyUpdatingView_, a2);
  if ((a5 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v22 = sub_1D03136A8;
  v23 = 0;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 1107296256;
  v20 = sub_1D0313810;
  v21 = &block_descriptor_41;
  v11 = _Block_copy(&v18);
  v12 = a2;
  v13 = a6;
  swift_release();
  objc_msgSend(v13, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v12, a3, v11);

  _Block_release(v11);
LABEL_6:

}

uint64_t sub_1D0313B3C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

double sub_1D0313B68()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = objc_msgSend(v0, sel_contentMetrics);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_metricsScaleFactor);
    v3 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v3, sel_displayScale);

    UIRoundToScale();
  }
  v4 = objc_msgSend(v0, sel_contentMetrics);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_metricsScaleFactor);
    v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);

    UIRoundToScale();
  }
  return 2.0;
}

double sub_1D0313CA0()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v1 = objc_msgSend(v0, sel_contentMetrics);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_metricsScaleFactor);
    v3 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v3, sel_displayScale);

    UIRoundToScale();
  }
  v4 = objc_msgSend(v0, sel_contentMetrics);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_metricsScaleFactor);
    v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_displayScale);

    UIRoundToScale();
  }
  v7 = objc_msgSend(v0, sel_contentMetrics);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_metricsScaleFactor);
    v9 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v9, sel_displayScale);

    UIRoundToScale();
  }
  return 4.0;
}

id sub_1D0313EB8()
{
  char *v0;
  id v1;
  double MidX;
  double MidY;
  void *v4;
  double v5;
  id v6;
  id result;
  void *v8;
  CGRect v9;
  CGRect v10;

  v1 = objc_msgSend(v0, sel_contextMenuDelegate);
  if (v1)
  {
    if (objc_msgSend(v1, sel_showsMenuAsPrimaryAction))
    {
      objc_msgSend(v0, sel_bounds);
      MidX = CGRectGetMidX(v9);
      objc_msgSend(v0, sel_bounds);
      MidY = CGRectGetMidY(v10);
      v4 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
      if (v4)
      {
        v5 = MidY;
        v6 = v4;
        objc_msgSend(v6, sel__presentMenuAtLocation_, MidX, v5);

      }
      return (id)swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  result = objc_msgSend(v0, sel_menuModuleDelegate);
  if (!result)
    return result;
  v8 = result;
  if (objc_msgSend(result, sel_showsMenuModuleAsPrimaryAction))
    objc_msgSend(v8, sel_presentMenuModule);
  return (id)swift_unknownObjectRelease();
}

void sub_1D0313FD4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;

  v2 = v1 + *a1;
  if (*(_QWORD *)v2 >= 2uLL)
  {
    objc_msgSend(*(id *)v2, sel_removeFromSuperview);
    v3 = *(id *)v2;
    v4 = *(void **)(v2 + 8);
    if (*(_QWORD *)v2 == 1 || v4 == 0)
    {
      v8 = 0;
      v7 = 1;
    }
    else
    {
      v6 = v4;
      v7 = 0;
      v8 = v4;
    }
    *(_QWORD *)v2 = v7;
    *(_QWORD *)(v2 + 8) = v8;
    sub_1D0317C78(v3, v4);
  }
}

void sub_1D0314058(_QWORD *a1, char a2)
{
  char *v2;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v5 = objc_msgSend(v2, sel_title);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1D031D538();
    v9 = v8;

    v10 = &v2[*a1];
    if (*(_QWORD *)v10 >= 2uLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_1D0314310(v7, v9, 1, a2 & 1);
      swift_bridgeObjectRelease();
      v12 = *(void **)v10;
      v13 = (void *)*((_QWORD *)v10 + 1);
      if (*(_QWORD *)v10 == 1)
      {
        v14 = 0;
      }
      else
      {
        v15 = v13;
        v14 = v13;
      }
      *(_QWORD *)v10 = v11;
      *((_QWORD *)v10 + 1) = v14;
      v16 = v11;
      sub_1D0317C78(v12, v13);
      objc_msgSend(v2, sel_addSubview_, v16);

    }
  }
}

void sub_1D0314174(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v2 = v1 + *a1;
  if (*(_QWORD *)v2 != 1)
  {
    v3 = *(void **)(v2 + 8);
    if (v3)
    {
      objc_msgSend(v3, sel_removeFromSuperview);
      v4 = *(void **)v2;
      if (*(_QWORD *)v2 >= 2uLL)
      {
        v6 = v4;
        v5 = (uint64_t)v4;
      }
      else
      {
        v5 = 1;
      }
      v7 = *(void **)(v2 + 8);
      *(_QWORD *)v2 = v5;
      *(_QWORD *)(v2 + 8) = 0;
      sub_1D0317C78(v4, v7);
    }
  }
}

void sub_1D03141E8(_QWORD *a1, char a2)
{
  char *v2;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = objc_msgSend(v2, sel_subtitle);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1D031D538();
    v9 = v8;

    v10 = &v2[*a1];
    if (*(_QWORD *)v10 == 1 || !*((_QWORD *)v10 + 1))
    {
      v11 = sub_1D0314310(v7, v9, 0, a2 & 1);
      swift_bridgeObjectRelease();
      v12 = *(void **)v10;
      if (*(_QWORD *)v10 == 1)
      {
        v13 = 0;
      }
      else
      {
        v14 = v12;
        v13 = v12;
      }
      v15 = (void *)*((_QWORD *)v10 + 1);
      *(_QWORD *)v10 = v13;
      *((_QWORD *)v10 + 1) = v11;
      v16 = v11;
      sub_1D0317C78(v12, v15);
      objc_msgSend(v2, sel_addSubview_, v16);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

id sub_1D0314310(uint64_t a1, uint64_t a2, char a3, char a4)
{
  void *v4;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  id v24;
  void *v25;

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  if ((a3 & 1) != 0)
    v8 = sub_1D03145A0();
  else
    v8 = 1;
  objc_msgSend(v7, sel_setNumberOfLines_, v8);
  sub_1D03146C0(a3 & 1, a4 & 1);
  v10 = v9;
  objc_msgSend(v7, sel_setFont_, v9);

  if (objc_msgSend(v4, sel_supportsAccessibilityContentSizeCategories)
    && (v11 = objc_msgSend(v4, sel_traitCollection),
        v12 = objc_msgSend(v11, sel_preferredContentSizeCategory),
        v11,
        LOBYTE(v11) = sub_1D031D58C(),
        v12,
        (v11 & 1) != 0))
  {
    objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 0);
  }
  else
  {
    objc_msgSend(v7, sel_setAdjustsFontSizeToFitWidth_, 1);
    objc_msgSend(v7, sel_setMinimumScaleFactor_, 0.7);
  }
  LODWORD(v13) = 1036831949;
  objc_msgSend(v7, sel__setHyphenationFactor_, v13);
  objc_msgSend(v7, sel_setContentMode_, 4);
  v14 = objc_msgSend(v4, sel_isSelected);
  v15 = 0x80000001D0322D10;
  if (v14)
    v16 = 0xD000000000000014;
  else
    v16 = 0;
  if (v14)
  {
    v17 = 1;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  v18 = 0xD000000000000016;
  if (v14)
  {
    v19 = 0x80000001D0322CF0;
  }
  else
  {
    v18 = 1;
    v19 = 0;
  }
  if ((a3 & 1) != 0)
    v20 = v16;
  else
    v20 = v18;
  if ((a3 & 1) != 0)
    v21 = v15;
  else
    v21 = v19;
  if ((a3 & 1) != 0)
    v22 = v17;
  else
    v22 = v14 != 0;
  v23 = v7;
  v24 = objc_msgSend(v4, sel_visualStylingProviderForCategory_, 1);
  sub_1D03169EC(v7, v20, v21, v22, v24, 0);
  sub_1D0317CA8(v20, v21, v22);

  v25 = (void *)sub_1D031D52C();
  objc_msgSend(v23, sel_setText_, v25);

  return v23;
}

uint64_t sub_1D03145A0()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v1 = sub_1D031D4A8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] & 1) != 0)
    return 1;
  v6 = objc_msgSend(v0, sel_subtitle);
  if (!v6)
    return 3;
  v7 = v6;
  v8 = sub_1D031D538();
  v10 = v9;

  v15[0] = v8;
  v15[1] = v10;
  sub_1D031D49C();
  sub_1D0317C34();
  v11 = sub_1D031D5D4();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = HIBYTE(v13) & 0xF;
  if ((v13 & 0x2000000000000000) == 0)
    v14 = v11 & 0xFFFFFFFFFFFFLL;
  if (v14)
    return 2;
  else
    return 3;
}

void sub_1D03146C0(char a1, char a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  double *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  v3 = v2;
  v5 = sub_1D0315258(v2, a2);
  v6 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, v5);
  if ((a1 & 1) != 0)
    v7 = (double *)MEMORY[0x1E0DC1438];
  else
    v7 = (double *)MEMORY[0x1E0DC1440];
  v8 = objc_msgSend((id)objc_opt_self(), sel__preferredFontDescriptorWithTextStyle_addingSymbolicTraits_design_weight_compatibleWithTraitCollection_, *MEMORY[0x1E0DC4B10], 0x8000, *MEMORY[0x1E0DC1398], v6, *v7);
  if (!v8)
  {
    __break(1u);
    goto LABEL_14;
  }
  v9 = v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v8, 0.0);
  v11 = objc_msgSend(v10, sel__fontScaledByScaleFactor_, 0.933333333);

  if (!v11)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v12 = objc_msgSend(v3, sel_contentMetrics);
  if (!v12)
  {
    v16 = v5;
    goto LABEL_12;
  }
  v13 = v12;
  objc_msgSend(v12, sel_metricsScaleFactor);
  v15 = v14;

  if (v15 >= 1.0)
  {
    v16 = v9;
    v9 = v5;
    goto LABEL_12;
  }
  if (objc_msgSend(v11, sel__fontScaledByScaleFactor_, v15))
  {

    v16 = v6;
    v6 = v9;
    v9 = v11;
LABEL_12:

    return;
  }
LABEL_15:
  __break(1u);
}

double sub_1D0314898(char a1, char a2, int a3, int a4, int a5, int a6, int a7, int a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  CGFloat v20;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  CGFloat v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  id v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double MaxX;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGFloat MinX;
  double v68;
  CGFloat v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double result;
  double v75;
  double v76;
  double v78;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v20 = a16;
  if ((a2 & 1) != 0)
  {
    v28 = a9;
    sub_1D0313CA0();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    v30 = v29;
    v75 = v31;
    v32 = a10;
    if ((objc_msgSend(v19, sel_isResizing) & 1) == 0)
    {
      v81.origin.x = a13;
      v81.origin.y = a14;
      v81.size.height = a16;
      v81.size.width = a15;
      v32 = v30 + CGRectGetMaxY(v81);
    }
    v82.origin.x = v28;
    v82.origin.y = a10;
    v33 = a11;
    v82.size.width = a11;
    v82.size.height = a12;
    MaxY = CGRectGetMaxY(v82);
    v83.origin.x = v28;
    v83.origin.y = v32;
    v83.size.width = a11;
    v83.size.height = a12;
    v35 = MaxY - CGRectGetMinY(v83);
    v36 = UIEdgeInsetsInsetRect(v28, a10, a11, a12, v30, v75);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    a10 = v32;
    a12 = v35;
  }
  else
  {
    v43 = 0.0;
    if (*(double *)&a19 != 0.0)
    {
      v44 = objc_msgSend(v19, sel_contentMetrics);
      v78 = v20;
      if (v44)
      {
        v45 = v44;
        objc_msgSend(v44, sel_metricsScaleFactor);
        v46 = objc_msgSend(v19, sel_traitCollection);
        objc_msgSend(v46, sel_displayScale);

        UIRoundToScale();
        v48 = v47;

      }
      else
      {
        v48 = 16.0;
      }
      v43 = v48 + *(double *)&a19;
      v20 = v78;
    }
    sub_1D0313B68();
    CCUIEdgeInsetsFromDirectionalEdgeInsets();
    v50 = v49;
    v52 = v51;
    v76 = v53;
    if ((a1 & 1) != 0)
    {
      if ((objc_msgSend(v19, sel_isResizing) & 1) != 0)
      {
        v54 = objc_msgSend(v19, sel_contentMetrics);
        if (v54)
        {
          v55 = v54;
          v56 = v52;
          v57 = v50;
          objc_msgSend(v54, sel_metricsScaleFactor);
          v58 = objc_msgSend(v19, sel_traitCollection);
          objc_msgSend(v58, sel_displayScale);

          UIRoundToScale();
          v60 = v59;

          v61 = v60 + v60;
        }
        else
        {
          v56 = v52;
          v57 = v50;
          v61 = 28.0;
        }
        v62 = a9;
        v89.origin.x = a9;
        v89.origin.y = a10;
        v89.size.width = a11;
        v89.size.height = a12;
        v69 = CGRectGetMaxX(v89) - a15 - v61 - v56;
        v90.origin.x = a9;
        v90.origin.y = a10;
        v90.size.width = a11;
        v90.size.height = a12;
        v33 = v69 - CGRectGetMinX(v90);
        v28 = a9;
        v65 = v76;
      }
      else
      {
        v87.origin.x = a13;
        v87.origin.y = a14;
        v87.size.width = a15;
        v87.size.height = v20;
        v66 = CGRectGetMinX(v87) - v52;
        v88.origin.x = v43;
        v88.origin.y = a10;
        v88.size.width = a11;
        v88.size.height = a12;
        MinX = CGRectGetMinX(v88);
        v68 = v43;
        v33 = v66 - MinX;
        v57 = v50;
        v28 = v68;
        v62 = a9;
        v65 = v76;
      }
    }
    else
    {
      v84.origin.x = a13;
      v84.origin.y = a14;
      v84.size.width = a15;
      v84.size.height = v20;
      v57 = v50;
      v28 = v50 + CGRectGetMaxX(v84);
      v62 = a9;
      v85.origin.x = a9;
      v85.origin.y = a10;
      v85.size.width = a11;
      v85.size.height = a12;
      MaxX = CGRectGetMaxX(v85);
      v86.origin.x = v28;
      v86.origin.y = a10;
      v86.size.width = a11;
      v86.size.height = a12;
      v64 = CGRectGetMinX(v86);
      v65 = v76;
      v33 = MaxX - v64 - v43;
    }
    v36 = UIEdgeInsetsInsetRect(v62, a10, a11, a12, v65, v57);
    v38 = v70;
    v40 = v71;
    v42 = v72;
  }
  v91.origin.x = v28;
  v91.origin.y = a10;
  v91.size.width = v33;
  v91.size.height = a12;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(v91, *(CGRect *)&v36);
  return result;
}

void sub_1D0314C7C(char a1, void *a2, id a3)
{
  id v6;
  id v7;
  double v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  double v13;
  id v14;
  id v15;
  unsigned int v16;
  id v17;
  void *v18;
  id v19;

  if (objc_msgSend(a3, sel_isResizing))
  {
    sub_1D0316CB0(a2);
    if ((a1 & 1) == 0)
      goto LABEL_3;
LABEL_9:
    v9 = objc_msgSend(a3, sel_gridSizeClass);
    v10 = CCUINumberOfRowsForGridSizeClass((uint64_t)v9);
    v11 = CCUINumberOfColumnsForGridSizeClass((uint64_t)v9);
    v12 = v11;
    if (v10 >= 2)
    {
      v13 = 0.0;
      if ((objc_msgSend(a3, sel_supportsAccessibilityContentSizeCategories) & 1) == 0
        || (v14 = objc_msgSend(a3, sel_traitCollection),
            v15 = objc_msgSend(v14, sel_preferredContentSizeCategory),
            v14,
            LOBYTE(v14) = sub_1D031D58C(),
            v15,
            (v14 & 1) == 0)
        || v12 < 2)
      {
LABEL_25:
        objc_msgSend(a2, sel_setAlpha_, v13);
        if (!objc_msgSend(a3, sel_isResizing))
          return;
        goto LABEL_26;
      }
    }
    else if (v11 <= 1)
    {
      v13 = 0.0;
      goto LABEL_25;
    }
    if ((objc_msgSend(a3, sel_isExpanded) & 1) != 0)
    {
      v13 = 0.0;
    }
    else if (objc_msgSend(a3, sel_isRedacted))
    {
      v13 = 0.12;
    }
    else
    {
      v13 = 1.0;
    }
    goto LABEL_25;
  }
  sub_1D0316ED4(a2);
  if ((a1 & 1) != 0)
    goto LABEL_9;
LABEL_3:
  if (objc_msgSend(a3, sel_supportsAccessibilityContentSizeCategories)
    && (v6 = objc_msgSend(a3, sel_traitCollection),
        v7 = objc_msgSend(v6, sel_preferredContentSizeCategory),
        v6,
        LOBYTE(v6) = sub_1D031D58C(),
        v7,
        (v6 & 1) != 0)
    || CCUINumberOfRowsForGridSizeClass((uint64_t)objc_msgSend(a3, sel_gridSizeClass)) < 2)
  {
    v8 = 0.0;
  }
  else if ((objc_msgSend(a3, sel_isExpanded) & 1) != 0)
  {
    v8 = 0.0;
  }
  else
  {
    v16 = objc_msgSend(a3, sel_isRedacted);
    v8 = 0.12;
    if (!v16)
      v8 = 1.0;
  }
  objc_msgSend(a2, sel_setAlpha_, v8);
  if (objc_msgSend(a3, sel_isResizing))
  {
LABEL_26:
    v17 = objc_msgSend(a2, sel_layer);
    v18 = (void *)sub_1D031D4C0();
    if (qword_1EFC11F58 != -1)
      swift_once();
    v19 = (id)sub_1D031D52C();
    objc_msgSend(v17, sel_setValue_forKeyPath_, v18);

  }
}

uint64_t sub_1D0314FB0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v13;
  _BYTE v14[32];
  _BYTE v15[32];

  v1 = objc_msgSend(v0, sel_layer);
  v2 = objc_msgSend(v1, sel_filters);

  if (!v2)
    return 0;
  v3 = sub_1D031D574();

  v4 = *(_QWORD *)(v3 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v5 = v3 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1D0317DEC(v5, (uint64_t)v15);
    sub_1D0317DEC((uint64_t)v15, (uint64_t)v14);
    sub_1D0317E94(0, (unint64_t *)&unk_1EFC11700);
    if (!swift_dynamicCast())
      goto LABEL_5;
    v6 = objc_msgSend(v13, sel_name);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1D031D538();
      v10 = v9;

    }
    else
    {
      v8 = 0;
      v10 = 0;
    }
    if (qword_1EFC116C0 == -1)
    {
      if (!v10)
        goto LABEL_4;
    }
    else
    {
      swift_once();
      if (!v10)
      {
LABEL_4:

LABEL_5:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
        goto LABEL_6;
      }
    }
    if (v8 == qword_1EFC116A8 && v10 == *(_QWORD *)algn_1EFC116B0)
      break;
    v11 = sub_1D031D688();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    if ((v11 & 1) != 0)
      goto LABEL_23;
LABEL_6:
    v5 += 32;
    if (!--v4)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
LABEL_23:
  swift_bridgeObjectRelease_n();
  return 1;
}

id sub_1D0315258(void *a1, char a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id *v8;
  id v9;
  char v10;
  void *v11;

  v4 = objc_msgSend(a1, sel_traitCollection);
  v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  if (!objc_msgSend(a1, sel_supportsAccessibilityContentSizeCategories)
    || (v6 = objc_msgSend(a1, sel_traitCollection),
        v7 = objc_msgSend(v6, sel_preferredContentSizeCategory),
        v6,
        LOBYTE(v6) = sub_1D031D58C(),
        v7,
        (v6 & 1) == 0))
  {
    v8 = (id *)MEMORY[0x1E0DC48F8];
    if ((a2 & 1) == 0)
      v8 = (id *)MEMORY[0x1E0DC48F0];
    v9 = *v8;
    v10 = sub_1D031D598();
    if ((v10 & 1) != 0)
      v11 = v5;
    else
      v11 = v9;
    if ((v10 & 1) != 0)
      v5 = v9;

  }
  return v5;
}

id sub_1D0315354()
{
  char *v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  unsigned int v12;
  char v13;
  uint64_t v14;
  id v15;
  id v16;

  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
  if (v1)
  {
    v2 = *(id *)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView];
LABEL_8:
    v16 = v1;
    return v2;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_defaultFontForTextStyle_, *MEMORY[0x1E0DC4B08]);
  if (result)
  {
    v4 = result;
    objc_msgSend(result, sel_pointSize);
    v6 = v5;

    v7 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 4, 2, v6);
    v8 = 0xD000000000000016;
    v9 = (void *)sub_1D031D52C();
    v10 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v9, v7);

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v10);
    v12 = objc_msgSend(v0, sel_isSelected);
    v13 = v12;
    if (v12)
    {
      v14 = 0x80000001D0322CF0;
    }
    else
    {
      v8 = 1;
      v14 = 0;
    }
    v2 = v11;
    v15 = objc_msgSend(v0, sel_visualStylingProviderForCategory_, 1);
    sub_1D03169EC(v11, v8, v14, v13, v15, 0);

    sub_1D0317CA8(v8, v14, v13);
    v1 = 0;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

id sub_1D0315670()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1D031579C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1D031D538();
  qword_1EFC116A8 = result;
  *(_QWORD *)algn_1EFC116B0 = v1;
  return result;
}

uint64_t sub_1D03157C8()
{
  uint64_t result;

  if (qword_1EFC116C0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1D031D544();
  swift_bridgeObjectRelease();
  sub_1D031D544();
  sub_1D031D538();
  sub_1D031D544();
  result = swift_bridgeObjectRelease();
  qword_1EFC11F60 = 0x2E737265746C6966;
  unk_1EFC11F68 = 0xE800000000000000;
  return result;
}

uint64_t sub_1D03158A0()
{
  sub_1D031D6AC();
  sub_1D031D6B8();
  return sub_1D031D6C4();
}

uint64_t sub_1D03158E4()
{
  return sub_1D031D6B8();
}

uint64_t sub_1D031590C()
{
  sub_1D031D6AC();
  sub_1D031D6B8();
  return sub_1D031D6C4();
}

_QWORD *sub_1D031594C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1D031595C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_1D0315970(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id sub_1D031597C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_1D0317E94(0, &qword_1EFC120E8);
  v2 = sub_1D031D574();
  swift_retain();
  v3 = (void *)v1(v2);
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

_QWORD *sub_1D03159F4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC11720);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1D0316BBC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1D0315B00(uint64_t a1)
{
  uint64_t v2;

  sub_1D031D6AC();
  sub_1D031D6B8();
  v2 = sub_1D031D6C4();
  return sub_1D0315B88(a1, v2);
}

unint64_t sub_1D0315B58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1D031D5EC();
  return sub_1D0315C24(a1, v2);
}

unint64_t sub_1D0315B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1D0315C24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1D0317BC4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D17E000C](v9, a1);
      sub_1D0317C00((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1D0315CE8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1D0315D04(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1D0315D04(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC11720);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1D031D67C();
  __break(1u);
  return result;
}

uint64_t sub_1D0315E70(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC11710);
  result = sub_1D031D664();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(void **)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        v30 = v29;
      sub_1D031D6AC();
      sub_1D031D6B8();
      result = sub_1D031D6C4();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_1D0316140(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1D031D5E0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1D031D6AC();
        sub_1D031D6B8();
        result = sub_1D031D6C4();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_QWORD *)(v10 + 8 * v3);
          v12 = (_QWORD *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1D03162F8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1D0315B00(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1D0316430();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];

      *(_QWORD *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v20 = 8 * v10;
    *(_QWORD *)(v16[6] + v20) = a2;
    *(_QWORD *)(v16[7] + v20) = a1;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_1D0315E70(v13, a3 & 1);
  v18 = sub_1D0315B00(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for MTVisualStyleCategory(0);
  sub_1D031D6A0();
  __break(1u);
}

id sub_1D0316430()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC11710);
  v2 = *v0;
  v3 = sub_1D031D658();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1D03165D0(uint64_t a1, int64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  int64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v5 = *(_QWORD **)v3;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v3 = v5;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = sub_1D03159F4(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *(_QWORD *)v3 = v5;
  }
  v14 = (uint64_t)&v5[4 * a1 + 4];
  swift_arrayDestroy();
  if (!v9)
    goto LABEL_20;
  v15 = v5[2];
  v16 = __OFSUB__(v15, a2);
  v17 = v15 - a2;
  if (v16)
    goto LABEL_26;
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = (char *)(v14 + 32);
    v19 = (char *)&v5[4 * a2 + 4];
    if ((char *)(v14 + 32) != v19 || v18 >= &v19[32 * v17])
      memmove(v18, v19, 32 * v17);
    v20 = v5[2];
    v16 = __OFADD__(v20, v9);
    v21 = v20 + v9;
    if (!v16)
    {
      v5[2] = v21;
LABEL_20:
      sub_1D0317DEC(a3, (uint64_t)&v5[4 * a1 + 4]);
      return sub_1D0317DB0(a3, (uint64_t *)&unk_1EFC120D8);
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_1D031D67C();
  __break(1u);
  return result;
}

void _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _QWORD *v1;
  _QWORD *v2;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_backgroundView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_customGlyphView] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView] = 0;
  v1 = &v0[OBJC_IVAR___CCUIControlTemplateView_title];
  *v1 = 0;
  v1[1] = 0;
  v2 = &v0[OBJC_IVAR___CCUIControlTemplateView_subtitle];
  *v2 = 0;
  v2[1] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isRedacted] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isResizing] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView__isExpanded] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_gridSizeClass] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius] = 0;
  v0[OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView____lazy_storage___visualStyleCategoriesToProviders] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction] = 0;
  *(_OWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels] = xmmword_1D03217E0;
  *(_OWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels] = xmmword_1D03217E0;
  v0[OBJC_IVAR___CCUIControlTemplateView_isLimitingTitleToSingleLineForAccessibility] = 0;

  sub_1D031D64C();
  __break(1u);
}

id sub_1D03168E0(id result, void *a2)
{
  id v2;
  id v3;

  if (result != (id)1)
  {
    v3 = result;
    v2 = a2;
    return v3;
  }
  return result;
}

void sub_1D0316910()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = swift_unknownObjectWeakAssign();
  v2 = MEMORY[0x1D17E090C](v1);
  swift_unknownObjectRelease();
  v3 = OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction;
  v4 = *(_QWORD *)&v0[OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction];
  if (v2)
  {
    if (!v4)
    {
      v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36C0]), sel_initWithDelegate_, v0);
      v6 = *(void **)&v0[v3];
      *(_QWORD *)&v0[v3] = v5;
      v7 = v5;

      objc_msgSend(v0, sel_addInteraction_, v7);
    }
  }
  else if (v4)
  {
    objc_msgSend(v0, sel_removeInteraction_);
  }
}

void sub_1D03169EC(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t aBlock;
  uint64_t v19;
  id (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  void (*(*v22)(uint64_t, uint64_t))(uint64_t, uint64_t);
  uint64_t v23;

  if (a1)
  {
    if (a6)
    {
      objc_msgSend(a6, sel_stopAutomaticallyUpdatingView_, a1);
      if (a5)
        goto LABEL_4;
    }
    else
    {
      v12 = a1;
      if (a5)
      {
LABEL_4:
        if ((a4 & 1) != 0)
        {
          v13 = a1;
          v14 = a5;
          v15 = (void *)sub_1D031D52C();
          v22 = sub_1D03136A8;
          v23 = 0;
          aBlock = MEMORY[0x1E0C809B0];
          v19 = 1107296256;
          v20 = sub_1D0313810;
          v21 = &block_descriptor;
          v16 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v14, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v13, v15, v16);

          _Block_release(v16);
        }
        else
        {
          v22 = sub_1D03136A8;
          v23 = 0;
          aBlock = MEMORY[0x1E0C809B0];
          v19 = 1107296256;
          v20 = sub_1D0313810;
          v21 = &block_descriptor_5;
          v9 = _Block_copy(&aBlock);
          v10 = a1;
          v11 = a5;
          swift_release();
          objc_msgSend(v11, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v10, a2, v9);

          _Block_release(v9);
        }
        return;
      }
    }

  }
}

uint64_t sub_1D0316BBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1D031D67C();
  __break(1u);
  return result;
}

void sub_1D0316CB0(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  if ((sub_1D0314FB0() & 1) == 0)
  {
    sub_1D031D538();
    v2 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
    v3 = (void *)sub_1D031D52C();
    swift_bridgeObjectRelease();
    v4 = objc_msgSend(v2, sel_initWithType_, v3);

    if (qword_1EFC116C0 != -1)
      swift_once();
    v5 = (void *)sub_1D031D52C();
    objc_msgSend(v4, sel_setName_, v5);

    v6 = (void *)sub_1D031D4C0();
    objc_msgSend(v4, sel_setValue_forKey_, v6, *MEMORY[0x1E0CD2D90]);

    v7 = objc_msgSend(a1, sel_layer);
    v8 = objc_msgSend(v7, sel_filters);

    if (v8)
    {
      v9 = sub_1D031D574();

    }
    else
    {
      v9 = MEMORY[0x1E0DEE9D8];
    }
    v16 = v9;
    v15 = sub_1D0317E94(0, (unint64_t *)&unk_1EFC11700);
    *(_QWORD *)&v14 = v4;
    sub_1D0317D18(&v14, v13);
    v10 = v4;
    sub_1D03165D0(0, 0, (uint64_t)v13);
    v11 = objc_msgSend(a1, sel_layer);
    v12 = (void *)sub_1D031D568();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_setFilters_, v12);

  }
}

void sub_1D0316ED4(void *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _QWORD *v30;

  v1 = a1;
  v2 = objc_msgSend(a1, sel_layer);
  v3 = objc_msgSend(v2, sel_filters);

  if (v3)
  {
    v4 = MEMORY[0x1E0DEE9B8] + 8;
    v5 = sub_1D031D574();

    v3 = (id)MEMORY[0x1E0DEE9D8];
    v30 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v6 = *(_QWORD *)(v5 + 16);
    if (v6)
    {
      v25 = v1;
      v26 = *(_QWORD *)(v5 + 16);
      v7 = 0;
      v8 = v5 + 32;
      v9 = (unint64_t *)&unk_1EFC11700;
      v10 = 0x1E0CD2780uLL;
      while (1)
      {
        if (v7 >= *(_QWORD *)(v5 + 16))
        {
          __break(1u);
          return;
        }
        sub_1D0317DEC(v8, (uint64_t)v29);
        sub_1D0317DEC((uint64_t)v29, (uint64_t)v28);
        sub_1D0317E94(0, v9);
        if (!swift_dynamicCast())
          goto LABEL_20;
        v11 = v4;
        v12 = v10;
        v13 = v9;
        v14 = objc_msgSend(v27, sel_name);
        if (v14)
        {
          v15 = v14;
          v16 = sub_1D031D538();
          v18 = v17;

        }
        else
        {
          v16 = 0;
          v18 = 0;
        }
        if (qword_1EFC116C0 == -1)
        {
          if (!v18)
            goto LABEL_19;
        }
        else
        {
          swift_once();
          if (!v18)
          {
LABEL_19:

            v9 = v13;
            v10 = v12;
            v4 = v11;
            v6 = v26;
LABEL_20:
            sub_1D0317D18(v29, v28);
            v20 = v30;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1D0315CE8(0, v20[2] + 1, 1);
              v20 = v30;
            }
            v22 = v20[2];
            v21 = v20[3];
            if (v22 >= v21 >> 1)
            {
              sub_1D0315CE8(v21 > 1, v22 + 1, 1);
              v20 = v30;
            }
            v20[2] = v22 + 1;
            sub_1D0317D18(v28, &v20[4 * v22 + 4]);
            goto LABEL_6;
          }
        }
        if (v16 == qword_1EFC116A8 && v18 == *(_QWORD *)algn_1EFC116B0)
        {
          swift_bridgeObjectRelease();

          v9 = v13;
          v10 = v12;
          v4 = v11;
          v6 = v26;
        }
        else
        {
          v19 = sub_1D031D688();
          swift_bridgeObjectRelease();

          v9 = v13;
          v10 = v12;
          v4 = v11;
          v6 = v26;
          if ((v19 & 1) == 0)
            goto LABEL_20;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
LABEL_6:
        ++v7;
        v8 += 32;
        if (v6 == v7)
        {
          v3 = v30;
          v1 = v25;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  v23 = objc_msgSend(v1, sel_layer, v25);
  if (v3)
  {
    v24 = (void *)sub_1D031D568();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v23, sel_setFilters_, v24);

}

void sub_1D0317200(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5, char a6, void *a7, void *a8, double a9)
{
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  if ((a2 & 1) != 0)
  {
    v17 = (void *)objc_opt_self();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a3;
    *(_QWORD *)(v18 + 24) = a1;
    *(_QWORD *)(v18 + 32) = a4;
    *(_QWORD *)(v18 + 40) = a5;
    v19 = a6 & 1;
    *(_BYTE *)(v18 + 48) = v19;
    *(_QWORD *)(v18 + 56) = a7;
    *(_QWORD *)(v18 + 64) = a8;
    v37 = sub_1D0317F48;
    v38 = v18;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 1107296256;
    v35 = sub_1D0313B3C;
    v36 = &block_descriptor_35;
    v20 = _Block_copy(&v33);
    v21 = a3;
    v22 = a1;
    sub_1D0317F5C(a4, a5, v19);
    v23 = a8;
    v24 = a7;
    swift_release();
    objc_msgSend(v17, sel_transitionWithView_duration_options_animations_completion_, v22, 5242880, v20, 0, a9);
    _Block_release(v20);
    return;
  }
  if (a8)
  {
    objc_msgSend(a8, sel_stopAutomaticallyUpdatingView_, a1);
    if ((a6 & 1) != 0)
    {
LABEL_5:
      v25 = a1;
      v26 = a7;
      v27 = (void *)sub_1D031D52C();
      v37 = sub_1D03136A8;
      v38 = 0;
      v33 = MEMORY[0x1E0C809B0];
      v34 = 1107296256;
      v35 = sub_1D0313810;
      v36 = &block_descriptor_26;
      v28 = _Block_copy(&v33);
      swift_release();
      objc_msgSend(v26, sel__automaticallyUpdateView_withStyleNamed_andObserverBlock_, v25, v27, v28);

      _Block_release(v28);
      return;
    }
  }
  else
  {
    v29 = a1;
    if ((a6 & 1) != 0)
      goto LABEL_5;
  }
  v37 = sub_1D03136A8;
  v38 = 0;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 1107296256;
  v35 = sub_1D0313810;
  v36 = &block_descriptor_29;
  v30 = _Block_copy(&v33);
  v31 = a1;
  v32 = a7;
  swift_release();
  objc_msgSend(v32, sel_automaticallyUpdateView_withStyle_andObserverBlock_, v31, a4, v30);

  _Block_release(v30);
}

void sub_1D03174A4(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  void *v10;
  id v21;
  id v22;
  char v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  id v54;
  id v55;
  CGRect v56;

  if (a1)
  {
    v21 = a1;
    v22 = objc_msgSend(v21, sel_font);
    if (v22)
    {
      v55 = v22;
      v23 = objc_msgSend(v10, sel__shouldReverseLayoutDirection);
      *(double *)&v24 = sub_1D0311EA0();
      v33 = sub_1D0314898(v23, 0, v25, v26, v27, v28, v29, v30, a3, a4, a5, a6, a7, a8, a9, a10, v24, v31, v32);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      objc_msgSend(v55, sel_lineHeight);
      v41 = v40 + v40;
      objc_msgSend(v55, sel_leading);
      v43 = v41 + v42;
      if (a2)
      {
        v44 = a2;
        v45 = objc_msgSend(v44, sel_font);
        if (v45)
        {
          v46 = v45;
          objc_msgSend(v45, sel_lineHeight);
          v48 = v47;

          v43 = v43 + v48;
        }
        else
        {

        }
      }
      v56.origin.x = v33;
      v56.origin.y = v35;
      v56.size.width = v37;
      v56.size.height = v39;
      if (CGRectGetHeight(v56) < v43)
        sub_1D0310260((id)1);

      goto LABEL_16;
    }
    if (qword_1EFC11F78 != -1)
      swift_once();
    v49 = sub_1D031D4FC();
    __swift_project_value_buffer(v49, (uint64_t)qword_1EFC12858);
    v55 = v21;
    v50 = sub_1D031D4E4();
    v51 = sub_1D031D580();
    if (!os_log_type_enabled(v50, v51))
    {

LABEL_16:
      return;
    }
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v52 = 138412290;
    v54 = v55;
    sub_1D031D5C8();
    *v53 = a1;

    _os_log_impl(&dword_1D02ED000, v50, v51, "Unexpectedly missing font on title label: %@", v52, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC120F0);
    swift_arrayDestroy();
    MEMORY[0x1D17E08C4](v53, -1, -1);
    MEMORY[0x1D17E08C4](v52, -1, -1);

  }
}

id _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];

  v1 = objc_msgSend(v0, sel_contextMenuDelegate);
  if (!v1)
    return 0;
  v2 = objc_msgSend(v1, sel_contextMenu);
  if (v2)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    v4 = (void *)objc_opt_self();
    v8[4] = sub_1D0317E70;
    v8[5] = v3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 1107296256;
    v8[2] = sub_1D031597C;
    v8[3] = &block_descriptor_23;
    v5 = _Block_copy(v8);
    v6 = v2;
    swift_retain();
    swift_release();
    v2 = objc_msgSend(v4, sel_configurationWithIdentifier_previewProvider_actionProvider_, 0, 0, v5);
    swift_release();
    _Block_release(v5);
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
  }
  return v2;
}

id _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CGRect v21;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3B78]), sel_init);
  v2 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v2);

  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_continuousCornerRadius);
  objc_msgSend(v0, sel_continuousCornerRadius);
  v3 = (void *)CGPathCreateWithContinuousRoundedRect();
  if (!v3)
  {
    objc_msgSend(v0, sel_bounds);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v0, sel_continuousCornerRadius);
    v13 = v12;
    objc_msgSend(v0, sel_continuousCornerRadius);
    v15 = v14;
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    v3 = CGPathCreateWithRoundedRect(v21, v13, v15, 0);
  }
  v16 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithCGPath_, v3);
  objc_msgSend(v1, sel_setVisiblePath_, v16);
  v17 = objc_allocWithZone(MEMORY[0x1E0DC3D90]);
  v18 = v0;
  v19 = objc_msgSend(v17, sel_initWithView_parameters_, v18, v1);

  return v19;
}

uint64_t _s22ButtonGlyphWrapperViewCMa()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CCUIControlTemplateView(uint64_t a1)
{
  return sub_1D0317E94(a1, (unint64_t *)&unk_1EFC120A8);
}

void type metadata accessor for Feature(uint64_t a1)
{
  sub_1D0317FCC(a1, &qword_1EFC115B0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1D0317B68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D0317B88(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CCUIGridGeometryInfo(uint64_t a1)
{
  sub_1D0317FCC(a1, (unint64_t *)&unk_1EFC120B8);
}

uint64_t sub_1D0317BC4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1D0317C00(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

unint64_t sub_1D0317C34()
{
  unint64_t result;

  result = qword_1EFC115F0;
  if (!qword_1EFC115F0)
  {
    result = MEMORY[0x1D17E0864](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFC115F0);
  }
  return result;
}

void sub_1D0317C78(void *a1, void *a2)
{
  if (a1 != (void *)1)
  {

  }
}

uint64_t sub_1D0317CA8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1D0317CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFC11608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1D0317D18(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1D0317D28()
{
  return swift_deallocObject();
}

void sub_1D0317D38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1D031376C(*(double *)(v2 + 16), a1, a2);
}

void type metadata accessor for MTVisualStyleCategory(uint64_t a1)
{
  sub_1D0317FCC(a1, (unint64_t *)&unk_1EFC116D8);
}

uint64_t sub_1D0317D54()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1D0317D78()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t sub_1D0317D80()
{
  return swift_deallocObject();
}

uint64_t sub_1D0317D90()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1D0317DB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1D0317DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1D0317E4C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void *sub_1D0317E70()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

uint64_t sub_1D0317E94(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1D0317F00()
{
  uint64_t v0;

  sub_1D0317CA8(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  return swift_deallocObject();
}

void sub_1D0317F48()
{
  uint64_t v0;

  sub_1D031399C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64));
}

uint64_t sub_1D0317F5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_1D0317F70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC116D0;
  if (!qword_1EFC116D0)
  {
    type metadata accessor for MTVisualStyleCategory(255);
    result = MEMORY[0x1D17E0864](&unk_1D0321904, v1);
    atomic_store(result, (unint64_t *)&qword_1EFC116D0);
  }
  return result;
}

void type metadata accessor for MTVisualStyle(uint64_t a1)
{
  sub_1D0317FCC(a1, &qword_1EFC120F8);
}

void sub_1D0317FCC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1D0318064()
{
  uint64_t v0;
  uint64_t result;
  id v2;

  v0 = sub_1D031D4FC();
  __swift_allocate_value_buffer(v0, qword_1EFC115C0);
  result = __swift_project_value_buffer(v0, (uint64_t)qword_1EFC115C0);
  if (CCUILogUserInterface)
  {
    v2 = (id)CCUILogUserInterface;
    return sub_1D031D508();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.userInterface.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EFC115E0 != -1)
    swift_once();
  v2 = sub_1D031D4FC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EFC115C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

const char *sub_1D0318138()
{
  uint64_t v0;
  const char *result;

  v0 = sub_1D031D4FC();
  __swift_allocate_value_buffer(v0, qword_1EFC12858);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC12858);
  result = "com.apple.ControlCenter";
  if ("com.apple.ControlCenter")
  {
    sub_1D031D550();
    return (const char *)sub_1D031D4F0();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t CCUIGridGeometryInfo.description.getter(double a1, double a2)
{
  id v2;
  uint64_t v3;

  v2 = (id)NSStringFromCCUIGridGeometryInfo(a1, a2);
  v3 = sub_1D031D538();

  return v3;
}

uint64_t sub_1D0318244()
{
  double *v0;
  id v1;
  uint64_t v2;

  v1 = (id)NSStringFromCCUIGridGeometryInfo(*v0, v0[1]);
  v2 = sub_1D031D538();

  return v2;
}

BOOL static CCUIGridGeometryInfo.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return CCUIGridGeometryInfoEqualToInfo(a1, a2, a3, a4);
}

BOOL sub_1D03182A4(double *a1, double *a2)
{
  return CCUIGridGeometryInfoEqualToInfo(*a1, a1[1], *a2, a2[1]);
}

id sub_1D03183CC(double a1, double a2)
{
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;

  BSFloatRoundForScale();
  v5 = v4;
  v6 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 6, 2, v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, v5, *MEMORY[0x1E0DC1448]);
  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSymbolConfiguration_symbolFont_symbolScaleFactor_metricsScaleFactor_gridGeometryInfo_, v6, v7, v5 / 25.0, a1 / 68.0, a1, a2);

  return v8;
}

id CCUIModuleContentMetrics.description.getter()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D01748]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(v0, sel_symbolConfiguration);
    v4 = (void *)sub_1D031D52C();

    v5 = objc_msgSend(v0, sel_symbolFont);
    v6 = (void *)sub_1D031D52C();

    objc_msgSend(v0, sel_symbolScaleFactor);
    v8 = v7;
    v9 = (void *)sub_1D031D52C();

    objc_msgSend(v0, sel_metricsScaleFactor);
    v11 = v10;
    v12 = (void *)sub_1D031D52C();

    objc_msgSend(v0, sel_gridGeometryInfo);
    v19 = v13;
    v20 = v14;
    type metadata accessor for CCUIGridGeometryInfo(0);
    v15 = sub_1D031D694();
    v16 = (void *)sub_1D031D52C();

    swift_unknownObjectRelease();
    result = objc_msgSend(v2, sel_build);
    if (result)
    {
      v17 = result;
      v18 = sub_1D031D538();

      return (id)v18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void __swiftcall CCUIModuleContentMetrics.init()(CCUIModuleContentMetrics *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUIModuleContentMetrics.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for CCUIModuleContentMetrics()
{
  unint64_t result;

  result = qword_1EFC12188;
  if (!qword_1EFC12188)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC12188);
  }
  return result;
}

void __swiftcall CCUITouchPassThroughView.hitTest(_:with:)(UIView_optional *__return_ptr retstr, CGPoint _, UIEvent_optional with)
{
  id v3;
  Class isa;
  double y;
  double x;
  id v7;
  id v8;
  objc_super v9;
  objc_super v10;

  isa = with.value.super.isa;
  y = _.y;
  x = _.x;
  if ((objc_msgSend(v3, sel_isTouchPassThroughDisabled) & 1) != 0)
  {
    v9.receiver = v3;
    v9.super_class = (Class)CCUITouchPassThroughView;
    v7 = -[UIView_optional hitTest:withEvent:](&v9, sel_hitTest_withEvent_, isa, x, y);
  }
  else
  {
    v10.receiver = v3;
    v10.super_class = (Class)CCUITouchPassThroughView;
    v8 = -[UIView_optional hitTest:withEvent:](&v10, sel_hitTest_withEvent_, isa, x, y);
    if (v8)
    {
      if (v8 == v3)

    }
  }
}

void __swiftcall CCUITouchPassThroughView.init(frame:)(CCUITouchPassThroughView *__return_ptr retstr, CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

id CCUITouchPassThroughView.init(frame:)()
{
  uint64_t v0;
  objc_super v2;

  *(_BYTE *)(v0 + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v2.super_class = (Class)CCUITouchPassThroughView;
  return objc_msgSendSuper2(&v2, sel_initWithFrame_);
}

void __swiftcall CCUITouchPassThroughView.init(coder:)(CCUITouchPassThroughView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id CCUITouchPassThroughView.init(coder:)(void *a1)
{
  uint64_t v1;
  id v3;
  objc_super v5;

  *(_BYTE *)(v1 + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v5.super_class = (Class)CCUITouchPassThroughView;
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

unint64_t type metadata accessor for CCUITouchPassThroughView()
{
  unint64_t result;

  result = qword_1EFC12198;
  if (!qword_1EFC12198)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC12198);
  }
  return result;
}

uint64_t sub_1D0318CB8(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  id v7;
  id v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t result;
  id v17;
  id v18;
  objc_super v19;
  _QWORD aBlock[6];

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_contentModuleContext] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_contentMetrics] = 0;
  v3[OBJC_IVAR___CCUIControlHostViewController__isResizing] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_identity] = a1;
  *(_QWORD *)&v3[OBJC_IVAR___CCUIControlHostViewController_type] = a2;
  v7 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v8 = a1;
  v9 = v3;
  v10 = (void *)sub_1D031D52C();
  v11 = (void *)sub_1D031D52C();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a3, v10, v11);

  v13 = objc_msgSend((id)objc_opt_self(), sel_instanceOfType_instanceIdentity_, a2, v12);
  v14 = OBJC_IVAR___CCUIControlHostViewController_controlInstance;
  *(_QWORD *)&v9[OBJC_IVAR___CCUIControlHostViewController_controlInstance] = v13;
  aBlock[4] = sub_1D0318F20;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D0318F64;
  aBlock[3] = &block_descriptor_0;
  v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v13, sel_modifyConfiguration_, v15);
  _Block_release(v15);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v17 = *(id *)&v9[v14];
    objc_msgSend(v17, sel_activate);

    v19.receiver = v9;
    v19.super_class = (Class)CCUIControlHostViewController;
    v18 = objc_msgSendSuper2(&v19, sel_initWithNibName_bundle_, 0, 0);

    return (uint64_t)v18;
  }
  return result;
}

id sub_1D0318F20(void *a1)
{
  objc_msgSend(a1, sel_setCanAppearInSecureEnvironment_, 1);
  return objc_msgSend(a1, sel_setLaunchOrigin_, CFSTR("CCUIAppLaunchOriginControlCenter"));
}

void sub_1D0318F64(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

void __swiftcall CCUIControlHostViewController.init(coder:)(CCUIControlHostViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

Swift::Void __swiftcall CCUIControlHostViewController.loadView()()
{
  char *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = objc_msgSend(objc_allocWithZone((Class)CCUIControlHostView), sel_initWithFrame_instance_, *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_controlInstance], 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setDelegate_, v0);
  objc_msgSend(v1, sel_setGridSizeClass_, objc_msgSend(v0, sel_gridSizeClass));
  v2 = objc_msgSend(v0, sel_contentMetrics);
  objc_msgSend(v1, sel_setContentMetrics_, v2);

  objc_msgSend(v1, sel_setResizing_, objc_msgSend(v0, sel_isResizing));
  objc_msgSend(v0, sel_setView_, v1);
  if (!objc_msgSend(v0, sel_isViewLoaded))
  {
    v5 = v1;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v0, sel_viewIfLoaded);
  if (v6)
  {
    objc_opt_self();
    v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(v0, sel_compactContinuousCornerRadius);
      objc_msgSend(v4, sel_setContinuousCornerRadius_);

      v5 = v6;
LABEL_6:

      return;
    }

  }
  __break(1u);
}

Swift::Bool __swiftcall CCUIControlHostViewController._canShowWhileLocked()()
{
  return 1;
}

double CCUIControlHostViewController.preferredExpandedContentHeight.getter()
{
  return 0.0;
}

uint64_t CCUIControlHostViewController.gridSizeClass.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_gridSizeClass;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void CCUIControlHostViewController.gridSizeClass.setter(uint64_t a1)
{
  char *v1;
  char *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = &v1[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass];
  swift_beginAccess();
  *(_QWORD *)v3 = a1;
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    v4 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v4)
    {
      v5 = v4;
      objc_opt_self();
      v6 = (void *)swift_dynamicCastObjCClass();
      if (v6)
      {
        objc_msgSend(v6, sel_setGridSizeClass_, *(_QWORD *)v3);

        return;
      }

    }
    __break(1u);
  }
}

uint64_t CCUIControlHostViewController.userVisibilityStatus.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

id CCUIControlHostViewController.userVisibilityStatus.setter(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = a1 == 2;
  v4 = (_QWORD *)(v1 + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  *v4 = a1;
  if (a1 == 1)
    v5 = 1;
  else
    v5 = 2 * v3;
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___CCUIControlHostViewController_controlInstance), sel_setVisibility_, v5);
}

double CCUIControlHostViewController.compactContinuousCornerRadius.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

void CCUIControlHostViewController.compactContinuousCornerRadius.setter(double a1)
{
  char *v1;
  double *v3;
  double v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (double *)&v1[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius];
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  if (v4 != a1 && (objc_msgSend(v1, sel_isViewLoaded) & 1) != 0)
  {
    v5 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v5)
    {
      v6 = v5;
      objc_opt_self();
      v7 = swift_dynamicCastObjCClass();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v1, sel_compactContinuousCornerRadius);
        objc_msgSend(v8, sel_setContinuousCornerRadius_);

        return;
      }

    }
    __break(1u);
  }
}

void *CCUIControlHostViewController.contentMetrics.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___CCUIControlHostViewController_contentMetrics);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void CCUIControlHostViewController.contentMetrics.setter(void *a1)
{
  sub_1D0319F68(a1);

}

uint64_t CCUIControlHostViewController.isResizing.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CCUIControlHostViewController__isResizing);
}

void CCUIControlHostViewController.isResizing.setter(char a1)
{
  _BYTE *v1;
  void *v2;
  id v3;

  v1[OBJC_IVAR___CCUIControlHostViewController__isResizing] = a1;
  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    v3 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v3)
    {
      objc_opt_self();
      v2 = (void *)swift_dynamicCastObjCClass();
      if (v2)
      {
        objc_msgSend(v2, sel_setResizing_, objc_msgSend(v1, sel_isResizing));

        return;
      }

    }
    __break(1u);
  }
}

uint64_t CCUIControlHostViewController.providesOwnPlatter.getter()
{
  return 1;
}

BOOL CCUIControlHostViewController.shouldPerformClickInteraction.getter()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_msgSend(v0, sel_viewIfLoaded);
  if (v1)
  {
    v2 = v1;
    objc_opt_self();
    v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)

  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v3, sel_contextMenu);

  if (v4)
  return v4 == 0;
}

Swift::Bool __swiftcall CCUIControlHostViewController.shouldBeginTransitionToExpandedContentModule()()
{
  return 0;
}

Swift::Bool __swiftcall CCUIControlHostViewController.controlHostViewShouldPerformPrimaryAction(_:)(CCUIControlHostView *a1)
{
  void *v1;
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend(v1, sel_delegate);
  if (!v2)
    return 1;
  v3 = objc_msgSend(v2, sel_controlHostViewControllerShouldPerformPrimaryAction_, v1);
  swift_unknownObjectRelease();
  return v3;
}

Swift::Void __swiftcall CCUIControlHostViewController.controlHostView(_:enqueue:)(CCUIControlHostView *_, CCUIStatusUpdate enqueue)
{
  void *v2;
  Class isa;
  id v4;

  isa = enqueue.super.isa;
  v4 = objc_msgSend(v2, sel_contentModuleContext, enqueue._message, enqueue._type);
  objc_msgSend(v4, sel_enqueueStatusUpdate_, isa);

}

Swift::Bool __swiftcall CCUIControlHostViewController.isDevicePasscodeLocked(_:)(CCUIControlHostView *a1)
{
  void *v1;
  id v2;
  void *v3;
  unsigned __int8 v4;

  v2 = objc_msgSend(v1, sel_contentModuleContext);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, sel_isDevicePasscodeLocked);

  return v4;
}

void __swiftcall CCUIControlHostViewController.init(nibName:bundle:)(CCUIControlHostViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_1D031D52C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void CCUIControlHostViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void _sSo29CCUIControlHostViewControllerC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_contentModuleContext] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_gridSizeClass] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostViewController_contentMetrics] = 0;
  v0[OBJC_IVAR___CCUIControlHostViewController__isResizing] = 0;

  sub_1D031D64C();
  __break(1u);
}

void sub_1D0319F68(void *a1)
{
  char *v1;
  id *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (id *)&v1[OBJC_IVAR___CCUIControlHostViewController_contentMetrics];
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  if (objc_msgSend(v1, sel_isViewLoaded))
  {
    v6 = objc_msgSend(v1, sel_viewIfLoaded);
    if (v6)
    {
      v7 = v6;
      objc_opt_self();
      v8 = swift_dynamicCastObjCClass();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = *v3;
        objc_msgSend(v9, sel_setContentMetrics_, v10);

        return;
      }

    }
    __break(1u);
  }
}

char *keypath_get_selector_gridSizeClass()
{
  return sel_gridSizeClass;
}

id sub_1D031A054@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_gridSizeClass);
  *a2 = result;
  return result;
}

id sub_1D031A084(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGridSizeClass_, *a1);
}

char *keypath_get_selector_userVisibilityStatus()
{
  return sel_userVisibilityStatus;
}

id sub_1D031A0A4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_userVisibilityStatus);
  *a2 = result;
  return result;
}

id sub_1D031A0D4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUserVisibilityStatus_, *a1);
}

char *keypath_get_selector_compactContinuousCornerRadius()
{
  return sel_compactContinuousCornerRadius;
}

id sub_1D031A0F4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_compactContinuousCornerRadius);
  *a2 = v4;
  return result;
}

id sub_1D031A124(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCompactContinuousCornerRadius_, *a1);
}

char *keypath_get_selector_contentMetrics()
{
  return sel_contentMetrics;
}

id sub_1D031A144@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contentMetrics);
  *a2 = result;
  return result;
}

id sub_1D031A17C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContentMetrics_, *a1);
}

char *keypath_get_selector_isResizing()
{
  return sel_isResizing;
}

id sub_1D031A19C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isResizing);
  *a2 = (_BYTE)result;
  return result;
}

id sub_1D031A1CC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResizing_, *a1);
}

unint64_t type metadata accessor for CCUIControlHostViewController()
{
  unint64_t result;

  result = qword_1EFC12258;
  if (!qword_1EFC12258)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC12258);
  }
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t CHSControlSize.init(gridSizeClass:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_1D03219D8[a1 - 1];
}

uint64_t CCUIGridSizeClass.init(controlSize:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_1D03219F8[a1 - 1];
}

unint64_t static String.controlCenterHostIdentifier.getter()
{
  return 0xD000000000000017;
}

id sub_1D031A298()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EFC12870 = (uint64_t)result;
  return result;
}

uint64_t sub_1D031A2EC()
{
  return swift_deallocClassInstance();
}

uint64_t _s2__CMa()
{
  return objc_opt_self();
}

const char *CCUIFeature.domain.getter()
{
  return "ControlCenter";
}

const char *CCUIFeature.feature.getter(uint64_t a1)
{
  const char *result;

  if (!a1)
    return "InactiveMicModeSelection";
  result = (const char *)sub_1D031D64C();
  __break(1u);
  return result;
}

uint64_t CCUIFeature.isEnabled.getter(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];

  type metadata accessor for Feature(0);
  v4[3] = v2;
  v4[4] = sub_1D031A3E4();
  v4[0] = a1;
  LOBYTE(a1) = sub_1D031D4CC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return a1 & 1;
}

unint64_t sub_1D031A3E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC115A0;
  if (!qword_1EFC115A0)
  {
    type metadata accessor for Feature(255);
    result = MEMORY[0x1D17E0864](&protocol conformance descriptor for CCUIFeature, v1);
    atomic_store(result, (unint64_t *)&qword_1EFC115A0);
  }
  return result;
}

const char *sub_1D031A42C()
{
  return "ControlCenter";
}

const char *sub_1D031A440()
{
  _QWORD *v0;
  const char *result;

  if (!*v0)
    return "InactiveMicModeSelection";
  result = (const char *)sub_1D031D64C();
  __break(1u);
  return result;
}

uint64_t static Features.isFeatureEnabled(_:)(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];

  type metadata accessor for Feature(0);
  v4[3] = v2;
  v4[4] = sub_1D031A3E4();
  v4[0] = a1;
  LOBYTE(a1) = sub_1D031D4CC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return a1 & 1;
}

id Features.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id Features.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Features()
{
  return objc_opt_self();
}

id Features.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Features();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1D031A630(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC123D8);
  v2 = sub_1D031D670();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1D031D160(v6, (uint64_t)v15);
    result = sub_1D0315B58((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1D0317D18(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1D031A75C(void *a1, double a2, double a3, double a4, double a5)
{
  _BYTE *v5;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  void *v45;
  objc_super v47;

  swift_unknownObjectWeakInit();
  v11 = (uint64_t *)&v5[OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason];
  *v11 = sub_1D031D538();
  v11[1] = v12;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIControlHostView_applicationContext] = 0;
  v5[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___CCUIControlHostView_controlInstance] = a1;
  v13 = v5;
  v14 = a1;
  BSRectWithSize();
  v19 = objc_msgSend(objc_allocWithZone((Class)CCUIControlTemplateView), sel_initWithFrame_, v15, v16, v17, v18);
  *(_QWORD *)&v13[OBJC_IVAR___CCUIControlHostView_templateView] = v19;
  v20 = v19;
  objc_msgSend(v20, sel_setSupportsAccessibilityContentSizeCategories_, 1);

  v47.receiver = v13;
  v47.super_class = (Class)CCUIControlHostView;
  v21 = (char *)objc_msgSendSuper2(&v47, sel_initWithFrame_, a2, a3, a4, a5);
  v22 = OBJC_IVAR___CCUIControlHostView_templateView;
  v23 = *(void **)&v21[OBJC_IVAR___CCUIControlHostView_templateView];
  v24 = (void *)objc_opt_self();
  v25 = v21;
  v26 = v23;
  v27 = objc_msgSend(v24, sel_controlCenterModuleBackgroundMaterial);
  objc_msgSend(v26, sel_setBackgroundView_, v27);

  v28 = objc_msgSend(v14, sel_iconView);
  objc_msgSend(v28, sel_bs_setHitTestingDisabled_, 1);
  v29 = *(void **)&v21[v22];
  objc_msgSend(v29, sel_setGlyphView_, v28);
  objc_msgSend(v14, sel_registerObserver_, v25);
  objc_msgSend(v29, sel_setDelegate_, v25);
  objc_msgSend(v25, sel_addSubview_, v29);
  _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0();
  if (objc_msgSend(v14, sel_contentType) != (id)1)
  {
    v30 = sub_1D031ADF4();
    if (v31)
    {
      v32 = v30;
      v33 = v31;
      objc_opt_self();
      v34 = swift_dynamicCastObjCClass();
      sub_1D031ADF4();
      if (v35)
      {
        v36 = sub_1D031D55C();
        swift_bridgeObjectRelease();
        if (v34)
        {
          if ((v36 & 1) != 0 && (sub_1D031CAC4() & 1) == 0)
          {
            objc_msgSend(*(id *)&v21[v22], sel_setContextMenuDelegate_, v25);
            v37 = objc_allocWithZone((Class)CCUIControlContainerApplicationContext);
            swift_bridgeObjectRetain();
            v38 = (void *)sub_1D031D52C();
            swift_bridgeObjectRelease();
            v39 = objc_msgSend(v37, sel_initWithApplicationBundleIdentifier_, v38);

            v40 = *(void **)&v25[OBJC_IVAR___CCUIControlHostView_applicationContext];
            *(_QWORD *)&v25[OBJC_IVAR___CCUIControlHostView_applicationContext] = v39;

          }
        }
      }
      if ((sub_1D031AF18() & 1) != 0)
      {
        v41 = *(void **)&v21[v22];
        sub_1D0317E94(0, &qword_1EFC123C8);
        v42 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v43 = (_QWORD *)swift_allocObject();
        v43[2] = v42;
        v43[3] = v32;
        v43[4] = v33;
        v44 = v41;
        v45 = (void *)sub_1D031D5BC();
        objc_msgSend(v44, sel_addAction_forControlEvents_, v45, 1, 0, 0, 0, sub_1D031D154, v43);

      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }

  return v25;
}

uint64_t _sSo19CCUIControlHostViewC18ControlCenterUIKitE015controlInstanceC14ModelDidChangeyySo012CHUISControlH0CF_0()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void (*v10)();
  uint64_t result;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel;
  v3 = v0[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel];
  v4 = objc_msgSend(v0, sel_controlInstance);
  v5 = sub_1D031BE40();
  v6 = *(void **)&v1[OBJC_IVAR___CCUIControlHostView_templateView];
  v7 = objc_msgSend(v4, sel_contentType);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(v8 + 24) = v4;
  *(_QWORD *)(v8 + 32) = v5;
  *(_BYTE *)(v8 + 40) = v7 == (id)1;
  if (v3 == 1)
  {
    swift_unknownObjectRetain();
    v9 = v4;
    sub_1D031BEB8(v6, v9, v5, v7 == (id)1);

    v10 = 0;
    if (!v5)
    {
LABEL_4:
      v1[v2] = v5 != 0;
      swift_release();
      return sub_1D031D214((uint64_t)v10);
    }
LABEL_3:
    swift_unknownObjectRelease();
    goto LABEL_4;
  }
  v16 = (id)objc_opt_self();
  v12 = swift_allocObject();
  v10 = sub_1D031D1DC;
  *(_QWORD *)(v12 + 16) = sub_1D031D1DC;
  *(_QWORD *)(v12 + 24) = v8;
  aBlock[4] = sub_1D0317D90;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D031C510;
  aBlock[3] = &block_descriptor_1;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  v14 = v4;
  v15 = v6;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_performWithoutAnimation_, v13);

  _Block_release(v13);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v14 & 1) == 0)
  {
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1D031ADF4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_controlInstance);
  v2 = objc_msgSend(v1, sel_instanceIdentity);

  v3 = objc_msgSend(v2, sel_control);
  v4 = (char *)objc_msgSend(v3, sel_extensionIdentity);

  v5 = &v4[*MEMORY[0x1E0D0FE18]];
  swift_beginAccess();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC115B8);
  v7 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
    v7 = sub_1D031D4D8();
  swift_endAccess();

  return v7;
}

uint64_t sub_1D031AF18()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = objc_msgSend(v0, sel_controlInstance);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();

  if (!v2)
    return 0;
  v3 = sub_1D031ADF4();
  if (!v4)
    return 0;
  if (v3 == 0xD000000000000010 && v4 == 0x80000001D03239F0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_1D031D688();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v6 & 1) == 0)
      return result;
  }
  v7 = objc_msgSend(v0, sel_controlInstance);
  v8 = objc_msgSend(v7, sel_instanceIdentity);

  v9 = objc_msgSend(v8, sel_control);
  v10 = objc_msgSend(v9, sel_kind);

  v11 = sub_1D031D538();
  v13 = v12;

  if (v11 == 0xD000000000000020 && v13 == 0x80000001D0323A10)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v14 = sub_1D031D688();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

void sub_1D031B0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x1D17E090C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_1D031B144();

  }
}

void sub_1D031B144()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v1 = objc_msgSend(v0, sel_cameraCapturePrewarmReason);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1D031D538();
    v5 = v4;

    CCUISignpostImpulse(CCUILogUserInterface);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC123D0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1D0321A90;
    sub_1D031D538();
    v7 = MEMORY[0x1E0DEA968];
    sub_1D031D604();
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = v3;
    *(_QWORD *)(inited + 80) = v5;
    sub_1D031D538();
    sub_1D031D604();
    v8 = mach_absolute_time();
    v9 = MEMORY[0x1E0DEE190];
    *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEE190];
    *(_QWORD *)(inited + 144) = v8;
    sub_1D031D538();
    sub_1D031D604();
    v10 = mach_continuous_time();
    *(_QWORD *)(inited + 240) = v9;
    *(_QWORD *)(inited + 216) = v10;
    sub_1D031A630(inited);
    v11 = (void *)sub_1D031D52C();
    v12 = (void *)sub_1D031D520();
    swift_bridgeObjectRelease();
    AVCapturePrewarmWithOptions();

  }
}

void __swiftcall CCUIControlHostView.init(coder:)(CCUIControlHostView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

Swift::Void __swiftcall CCUIControlHostView.layoutSubviews()()
{
  char *v0;
  void *v1;
  objc_super v2;

  v2.super_class = (Class)CCUIControlHostView;
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR___CCUIControlHostView_templateView];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setFrame_);
}

Swift::Bool __swiftcall CCUIControlHostView.performPrimaryAction(for:)(CCUIControlTemplateView *a1)
{
  void *v1;
  id v2;
  unsigned int v3;

  v2 = objc_msgSend(v1, sel_delegate);
  if (!v2
    || (v3 = objc_msgSend(v2, sel_controlHostViewShouldPerformPrimaryAction_, v1),
        swift_unknownObjectRelease(),
        v3))
  {
    sub_1D031B6E0();
  }
  return 0;
}

void sub_1D031B6E0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  if ((sub_1D031AF18() & 1) != 0)
  {
    v1 = objc_msgSend(v0, sel_cameraCapturePrewarmReason);
    if (v1)
    {

      CCUISignpostImpulse(CCUILogUserInterface);
    }
  }
  v2 = objc_msgSend(v0, sel_controlInstance);
  v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v7[4] = sub_1D031D250;
  v7[5] = v5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1D031CA70;
  v7[3] = &block_descriptor_20;
  v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v2, sel_performControlActionWithCompletion_, v6);
  _Block_release(v6);

}

uint64_t CCUIControlHostView.showsMenuAsPrimaryAction.getter()
{
  return 0;
}

uint64_t CCUIControlHostView.menuDisplayName.getter()
{
  return 0;
}

Swift::OpaquePointer_optional __swiftcall CCUIControlHostView.contextMenuItems()()
{
  char *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  Swift::OpaquePointer_optional result;

  v1 = objc_msgSend(v0, sel_controlInstance);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();

  if (v2)
  {
    v4 = sub_1D031ADF4();
    if (v3)
    {
      if (v4 == 0xD000000000000014 && v3 == 0x80000001D0323760)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = sub_1D031D688();
        swift_bridgeObjectRelease();
        if ((v5 & 1) == 0)
          goto LABEL_13;
      }
      v6 = objc_msgSend(v0, sel_controlInstance);
      v7 = objc_msgSend(v6, sel_instanceIdentity);

      v8 = objc_msgSend(v7, sel_control);
      v9 = objc_msgSend(v8, sel_kind);

      v10 = sub_1D031D538();
      v12 = v11;

      if (v10 == 0xD00000000000002DLL && v12 == 0x80000001D0323780)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v13 = sub_1D031D688();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
          goto LABEL_13;
      }
      v14 = objc_msgSend(v0, sel_delegate);
      if (v14)
      {
        v15 = objc_msgSend(v14, sel_isDevicePasscodeLocked_, v0);
        swift_unknownObjectRelease();
        if ((v15 & 1) != 0)
          goto LABEL_16;
      }
    }
  }
LABEL_13:
  v16 = *(void **)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext];
  if (!v16 || (v17 = objc_msgSend(v16, sel_applicationShortcuts)) == 0)
  {
LABEL_16:
    v19 = 0;
    goto LABEL_17;
  }
  v18 = v17;
  sub_1D0317E94(0, &qword_1EFC12270);
  v19 = sub_1D031D574();

LABEL_17:
  v20 = (void *)v19;
  result.is_nil = v3;
  result.value._rawValue = v20;
  return result;
}

id CCUIControlHostView.contextMenu.getter()
{
  char *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  unsigned __int8 v15;
  id result;

  v1 = objc_msgSend(v0, sel_controlInstance);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();

  if (!v2)
    goto LABEL_14;
  v3 = sub_1D031ADF4();
  if (!v4)
    goto LABEL_14;
  if (v3 == 0xD000000000000014 && v4 == 0x80000001D0323760)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_1D031D688();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
      goto LABEL_14;
  }
  v6 = objc_msgSend(v0, sel_controlInstance);
  v7 = objc_msgSend(v6, sel_instanceIdentity);

  v8 = objc_msgSend(v7, sel_control);
  v9 = objc_msgSend(v8, sel_kind);

  v10 = sub_1D031D538();
  v12 = v11;

  if (v10 == 0xD00000000000002DLL && v12 == 0x80000001D0323780)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = sub_1D031D688();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
      goto LABEL_14;
  }
  v14 = objc_msgSend(v0, sel_delegate);
  if (v14)
  {
    v15 = objc_msgSend(v14, sel_isDevicePasscodeLocked_, v0);
    swift_unknownObjectRelease();
    if ((v15 & 1) != 0)
      return 0;
  }
LABEL_14:
  result = *(id *)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext];
  if (result)
    return objc_msgSend(result, sel_contextMenuForApplicationShortcuts);
  return result;
}

id sub_1D031BE40()
{
  id result;

  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  return result;
}

void sub_1D031BEB8(void *a1, void *a2, void *a3, char a4)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  id v15;
  id v16;

  sub_1D031C0D8();
  if (v8)
  {
    v9 = (void *)sub_1D031D52C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a1, sel_setTitle_, v9);

  if (a3)
  {
    sub_1D031C2E0();
    if (v10)
    {
      v11 = (void *)sub_1D031D52C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(a1, sel_setSubtitle_, v11);

    objc_msgSend(a1, sel_setRedacted_, objc_msgSend(a3, sel_isRedacted));
    objc_msgSend(a1, sel_setEnabled_, a4 & 1 | ((objc_msgSend(a3, sel_isDisabled) & 1) == 0));
    v12 = sub_1D031C4AC();
  }
  else
  {
    objc_msgSend(a1, sel_setSubtitle_, 0);
    objc_msgSend(a1, sel_setRedacted_, 0);
    objc_msgSend(a1, sel_setEnabled_, 1);
    v12 = 0;
  }
  objc_msgSend(a1, sel_setSelected_, v12 & 1);
  v13 = sub_1D031BE40();
  if (!v13
    || (v14 = objc_msgSend(v13, sel_accessibilityIdentifier),
        swift_unknownObjectRelease(),
        !v14))
  {
    v15 = objc_msgSend(a2, sel_control);
    v14 = objc_msgSend(v15, sel_kind);

  }
  sub_1D031D538();

  v16 = (id)sub_1D031D52C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setAccessibilityIdentifier_, v16);

}

uint64_t sub_1D031C0D8()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v1 = sub_1D031BE40();
  if (v1 && (v2 = objc_msgSend(v1, sel_title), swift_unknownObjectRelease(), v2)
    || (v3 = objc_msgSend(v0, sel_descriptor)) != 0
    && (v4 = v3, v2 = objc_msgSend(v3, sel_displayName), v4, v2))
  {
    v5 = sub_1D031D538();

  }
  else
  {
    v6 = objc_msgSend(v0, sel_control);
    v7 = (char *)objc_msgSend(v6, sel_extensionIdentity);

    v8 = &v7[*MEMORY[0x1E0D0FE18]];
    swift_beginAccess();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC115B8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
    {
      swift_endAccess();

      return 0;
    }
    else
    {
      v5 = sub_1D031D4D8();
      v11 = v10;
      swift_endAccess();

      sub_1D0317E94(0, (unint64_t *)&unk_1EFC12450);
      swift_bridgeObjectRetain();
      v12 = sub_1D031CE6C(v5, v11, 1);
      v13 = v12;
      if (v12)
      {
        v14 = objc_msgSend(v12, sel_localizedName);
        v5 = sub_1D031D538();
        swift_bridgeObjectRelease();

      }
    }
  }
  return v5;
}

uint64_t sub_1D031C2E0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  char **v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v1 = objc_msgSend(v0, sel_subtitle);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1D031D538();
  }
  else
  {
    objc_opt_self();
    v5 = swift_dynamicCastObjCClass();
    if (!v5)
      return 0;
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_state);
    v8 = &selRef_onOption;
    if (!v7)
      v8 = &selRef_offOption;
    v9 = objc_msgSend(v6, *v8);
    v10 = objc_msgSend(v9, sel_value);
    if (v10)
    {
      v2 = v10;
      v3 = sub_1D031D538();
      swift_unknownObjectRelease();

    }
    else
    {
      if (qword_1EFC11F80 != -1)
        swift_once();
      v11 = (void *)qword_1EFC12870;
      v12 = (void *)sub_1D031D52C();
      v2 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, 0);

      v3 = sub_1D031D538();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
  }

  return v3;
}

id sub_1D031C4AC()
{
  id result;
  char **v1;

  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
  {
    v1 = &selRef_isAnimating;
  }
  else
  {
    objc_opt_self();
    result = (id)swift_dynamicCastObjCClass();
    if (!result)
      return result;
    v1 = &selRef_state;
  }
  return objc_msgSend(result, *v1);
}

uint64_t sub_1D031C510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1D031C530(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  NSObject *oslog;
  uint64_t v24;

  v3 = a2 + 16;
  if (a1)
  {
    v5 = a1;
    if (qword_1EFC11F78 != -1)
      swift_once();
    v6 = sub_1D031D4FC();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EFC12858);
    v7 = a1;
    v8 = a1;
    swift_retain();
    oslog = sub_1D031D4E4();
    v9 = sub_1D031D580();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412546;
      swift_beginAccess();
      v12 = MEMORY[0x1D17E090C](v3);
      sub_1D031D5C8();
      *v11 = v12;
      swift_release();
      *(_WORD *)(v10 + 12) = 2112;
      v22 = a1;
      v24 = _swift_stdlib_bridgeErrorToNSError();
      sub_1D031D5C8();
      v11[1] = v24;

      _os_log_impl(&dword_1D02ED000, oslog, v9, "Failed to perform control %@ action with error: %@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC120F0);
      swift_arrayDestroy();
      MEMORY[0x1D17E08C4](v11, -1, -1);
      MEMORY[0x1D17E08C4](v10, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  else
  {
    v13 = a3 + 16;
    swift_beginAccess();
    v14 = (void *)MEMORY[0x1D17E090C](v13);
    if (!v14)
      return;
    v15 = v14;
    v16 = objc_msgSend(v14, sel_delegate);
    if (v16)
    {
      v17 = v16;
      swift_beginAccess();
      v18 = MEMORY[0x1D17E090C](v3);
      if (v18)
      {
        v19 = (void *)v18;
        v20 = sub_1D031BE40();

        if (v20)
        {
          v21 = sub_1D031C888();
          swift_unknownObjectRelease();
          if (v21)
          {
            objc_msgSend(v17, sel_controlHostView_enqueue_, v15, v21);

            swift_unknownObjectRelease();
            return;
          }
        }
      }
      swift_unknownObjectRelease();
    }

  }
}

id sub_1D031C888()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  char **v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClass();
  if (v0)
  {
    v1 = (void *)v0;
    swift_unknownObjectRetain();
    v2 = objc_msgSend(v1, sel_status);
    if (v2)
    {
      v3 = v2;
      sub_1D031D538();

      v4 = (void *)sub_1D031D52C();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend((id)objc_opt_self(), sel_statusUpdateWithMessage_type_, v4, 0);
      swift_unknownObjectRelease();

      return v5;
    }
    swift_unknownObjectRelease();
  }
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (!v6)
    return 0;
  v7 = (void *)v6;
  swift_unknownObjectRetain();
  v8 = objc_msgSend(v7, sel_state);
  v9 = &selRef_onOption;
  if (!v8)
    v9 = &selRef_offOption;
  v10 = objc_msgSend(v7, *v9);
  v11 = objc_msgSend(v10, sel_status);
  if (!v11)
  {
    swift_unknownObjectRelease();

    return 0;
  }
  v12 = v11;
  sub_1D031D538();

  if (v8)
    v13 = 1;
  else
    v13 = 2;
  v14 = (void *)sub_1D031D52C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_statusUpdateWithMessage_type_, v14, v13);
  swift_unknownObjectRelease();

  return v5;
}

void sub_1D031CA70(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_1D031CAC4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = objc_msgSend(v0, sel_controlInstance);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();

  if (!v2)
    return 0;
  v3 = sub_1D031ADF4();
  if (!v4)
    return 0;
  if (v3 == 0xD000000000000012 && v4 == 0x80000001D03239A0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_1D031D688();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v6 & 1) == 0)
      return result;
  }
  v7 = objc_msgSend(v0, sel_controlInstance);
  v8 = objc_msgSend(v7, sel_instanceIdentity);

  v9 = objc_msgSend(v8, sel_control);
  v10 = objc_msgSend(v9, sel_kind);

  v11 = sub_1D031D538();
  v13 = v12;

  if (v11 == 0xD000000000000029 && v13 == 0x80000001D03239C0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v14 = sub_1D031D688();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

void __swiftcall CCUIControlHostView.init(frame:)(CCUIControlHostView *__return_ptr retstr, CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void CCUIControlHostView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

Swift::Void __swiftcall CHUISControlIconView.applyGlyphContentMetrics(_:)(CCUIModuleContentMetrics_optional *a1)
{
  void *v1;
  id v2;
  id v3;

  if (a1)
    v2 = -[CCUIModuleContentMetrics_optional symbolFont](a1, sel_symbolFont);
  else
    v2 = 0;
  v3 = v2;
  objc_msgSend(v1, sel_setFont_);

}

void sub_1D031CDF8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a1;
  if (a3)
    v5 = objc_msgSend(a3, sel_symbolFont);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v4, sel_setFont_);

}

id sub_1D031CE6C(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (void *)sub_1D031D52C();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_1D031D4B4();

    swift_willThrow();
  }
  return v5;
}

unint64_t sub_1D031CF50(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  unint64_t result;
  char v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  char v16;
  id v17;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC11710);
  v3 = (_QWORD *)sub_1D031D670();
  v4 = a1[4];
  v5 = (void *)a1[5];
  result = sub_1D0315B00(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    v17 = v5;
    return (unint64_t)v3;
  }
  v8 = (void **)(a1 + 7);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v4;
    *(_QWORD *)(v3[7] + v9) = v5;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v4 = (uint64_t)*(v8 - 1);
    v14 = *v8;
    v15 = v5;
    result = sub_1D0315B00(v4);
    v8 = v13;
    v5 = v14;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void _sSo19CCUIControlHostViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  uint64_t *v1;
  uint64_t v2;

  swift_unknownObjectWeakInit();
  v1 = (uint64_t *)&v0[OBJC_IVAR___CCUIControlHostView_cameraCapturePrewarmReason];
  *v1 = sub_1D031D538();
  v1[1] = v2;
  *(_QWORD *)&v0[OBJC_IVAR___CCUIControlHostView_applicationContext] = 0;
  v0[OBJC_IVAR___CCUIControlHostView_isDisplayingLoadedViewModel] = 0;

  sub_1D031D64C();
  __break(1u);
}

uint64_t type metadata accessor for CCUIControlHostView(uint64_t a1)
{
  return sub_1D0317E94(a1, &qword_1EFC123C0);
}

uint64_t sub_1D031D104()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1D031D128()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1D031D154(uint64_t a1)
{
  uint64_t v1;

  sub_1D031B0D8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1D031D160(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFC123E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D031D1A8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1D031D1DC()
{
  uint64_t v0;

  sub_1D031BEB8(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_1D031D1EC()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1D031D214(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1D031D224()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1D031D250(void *a1)
{
  uint64_t v1;

  sub_1D031C530(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1D031D49C()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1D031D4A8()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1D031D4B4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D031D4C0()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1D031D4CC()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1D031D4D8()
{
  return MEMORY[0x1E0D0F940]();
}

uint64_t sub_1D031D4E4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D031D4F0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D031D4FC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D031D508()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1D031D514()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1D031D520()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D031D52C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D031D538()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D031D544()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D031D550()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1D031D55C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1D031D568()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D031D574()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D031D580()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D031D58C()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1D031D598()
{
  return MEMORY[0x1E0DC2D50]();
}

uint64_t sub_1D031D5A4()
{
  return MEMORY[0x1E0DC2FB0]();
}

uint64_t sub_1D031D5B0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1D031D5BC()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1D031D5C8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D031D5D4()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1D031D5E0()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D031D5EC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D031D5F8()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D031D604()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D031D610()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1D031D61C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1D031D628()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1D031D634()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1D031D640()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1D031D64C()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D031D658()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D031D664()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D031D670()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D031D67C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D031D688()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D031D694()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1D031D6A0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D031D6AC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D031D6B8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D031D6C4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AVCapturePrewarmWithOptions()
{
  return MEMORY[0x1E0C8A0D0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D01210]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D01248]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x1E0C9C6B8]();
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1E0C9D3B0]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1E0DAA080]();
}

uint64_t SBSRequestPasscodeUnlockAlertUI()
{
  return MEMORY[0x1E0DAB948]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0DC4A08]();
}

uint64_t UIPointIntegral()
{
  return MEMORY[0x1E0DC51F0]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1E0DC5200]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0DC5208]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectContainsPointInYAxis()
{
  return MEMORY[0x1E0DC5290]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0DC5398]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle()
{
  return MEMORY[0x1E0D474C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

